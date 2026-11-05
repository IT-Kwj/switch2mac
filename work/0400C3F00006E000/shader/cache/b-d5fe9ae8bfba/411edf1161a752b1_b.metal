#pragma clang diagnostic ignored "-Wmissing-prototypes"

#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

struct dm_border_t { uint mask; float4 k[32]; };
static inline __attribute__((always_inline)) float4 dm_bmix(float4 r, float4 w, float4 k) { return r + (w - r) * k; }
static inline __attribute__((always_inline)) float dm_bmix(float r, float w, float4 k) { return r + (w - r) * k.x; }
template<typename V, typename T, typename... A> static inline __attribute__((always_inline)) V dm_bs(V r, constant dm_border_t* b, uint i, T t, sampler w, A... a)
{
    if (b->mask >> i & 1u) r = dm_bmix(r, t.sample(w, a...), b->k[i]);
    return r;
}

template <typename T>
static inline depth2d<T> spvDepthCast(texture2d<T> t)
{
    return reinterpret_cast<thread const depth2d<T> &>(t);
}

template <typename T>
static inline depth2d_array<T> spvDepthCast(texture2d_array<T> t)
{
    return reinterpret_cast<thread const depth2d_array<T> &>(t);
}

template <typename T>
static inline depthcube<T> spvDepthCast(texturecube<T> t)
{
    return reinterpret_cast<thread const depthcube<T> &>(t);
}

template <typename T>
static inline depthcube_array<T> spvDepthCast(texturecube_array<T> t)
{
    return reinterpret_cast<thread const depthcube_array<T> &>(t);
}

struct _10
{
    uint _m0;
    uint _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _16* fp_c3 [[id(0)]];
    texture2d<float> fp_t_tcb_8 [[id(1)]];
    sampler fp_t_tcb_8Smplr [[id(2)]];
    texture2d<float> fp_t_tcb_C [[id(3)]];
    sampler fp_t_tcb_CSmplr [[id(4)]];
    texture2d_array<float> fp_t_tcb_A [[id(5)]];
    sampler fp_t_tcb_ASmplr [[id(6)]];
    sampler fp_t_tcb_8Smplr_w [[id(7)]];
    sampler fp_t_tcb_CSmplr_w [[id(8)]];
    constant dm_border_t* dm_border [[id(9)]];
};

struct main0_out
{
    float4 m_43 [[color(0)]];
};

struct main0_in
{
    float4 m_36 [[user(locn0), center_no_perspective]];
    float4 m_40 [[user(locn1), center_no_perspective]];
    float4 m_38 [[user(locn2), center_no_perspective]];
    float4 m_34 [[user(locn3), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _50 = in.m_34.x;
    float _52 = in.m_34.y;
    float2 _373 = float2(_50, _52);
    float3 _56 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_373, float2(0.0), isnan(_373)), int2(0), component::x).xyw;
    float _58 = _56.x;
    float _60 = _56.y;
    float _62 = _56.z;
    float2 _390 = float2(_50, _52);
    float _64 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_390, float2(0.0), isnan(_390))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_390, float2(0.0), isnan(_390))).x;
    float _66 = in.m_36.y;
    float _68 = in.m_36.x;
    float _70 = in.m_38.y;
    float _72 = in.m_40.y;
    float _74 = in.m_38.x;
    float _76 = in.m_40.x;
    float _78 = -_58;
    float _80 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _82 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[46].z, _80);
    float _84 = -_60;
    float _86 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _88 = fma(_84, (*spvDescriptorSet0.fp_c3)._m0[46].z, _86);
    float _90 = -_62;
    float _92 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _94 = fma(_90, (*spvDescriptorSet0.fp_c3)._m0[46].z, _92);
    float _96 = _66 * _82;
    float _98 = _68 * _82;
    float _100 = -_64;
    float _102 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _104 = fma(_100, (*spvDescriptorSet0.fp_c3)._m0[46].z, _102);
    float _106 = -_96;
    float _108 = fma(_88, _70, _106);
    float _110 = -_96;
    float _112 = fma(_94, _72, _110);
    float _114 = -_98;
    float _116 = fma(_88, _74, _114);
    float _118 = -_98;
    float _120 = fma(_94, _76, _118);
    float _122 = _108 * _108;
    float _124 = _112 * _112;
    float _126 = -_82;
    float _128 = _126 + _88;
    float _130 = -_82;
    float _132 = _130 + _94;
    float _134 = fma(_116, _116, _122);
    float _136 = fma(_120, _120, _124);
    float _138 = _104 * _66;
    float _140 = _104 * _68;
    float _142 = fma(_128, _128, _134);
    float _144 = fma(_132, _132, _136);
    float _146 = rsqrt(_142);
    float _148 = rsqrt(_144);
    float _150 = _116 * _146;
    float _152 = _128 * _146;
    float _154 = _108 * _146;
    float _156 = _132 * _148;
    float _158 = _112 * _148;
    float _160 = _120 * _148;
    float _162 = _150 * _156;
    float _164 = _152 * _158;
    float _166 = -_162;
    float _168 = fma(_152, _160, _166);
    float _170 = -_164;
    float _172 = fma(_154, _156, _170);
    float _174 = _154 * _160;
    float _176 = _168 * _168;
    float _178 = -_174;
    float _180 = fma(_150, _158, _178);
    float _182 = _138 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _184 = fma(_172, _172, _176);
    float _186 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[13].x, _182);
    float _188 = fma(_180, _180, _184);
    float _190 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[13].z, _186);
    float _192 = rsqrt(_188);
    float _194 = _190 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _196 = _138 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _198 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[15].x, _196);
    float _200 = _168 * _192;
    float _202 = _172 * _192;
    float _204 = _180 * _192;
    float _206 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[15].z, _198);
    float _208 = _200 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _210 = _206 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _212 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[35].x, _208);
    float _214 = fma(_204, (*spvDescriptorSet0.fp_c3)._m0[35].z, _212);
    float _216 = 1.0 / _210;
    float _218 = abs(_214);
    float _220 = -_218;
    float _222 = _220 + 1.0;
    float _224 = precise::clamp(_222, 0.0, 1.0);
    float _226 = abs(_224);
    float _228 = log2(_226);
    float _230 = _228 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _232 = _138 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _234 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[12].x, _232);
    float _236 = exp2(_230);
    float _238 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[12].z, _234);
    float _240 = _238 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _242 = _240 * _216;
    float _244 = _194 * _216;
    float _246 = _236 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _248 = fma(_200, _246, _138);
    float _250 = fma(_202, _246, _140);
    float _252 = fma(_204, _246, _104);
    float _254 = _248 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _256 = _248 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _258 = fma(_250, (*spvDescriptorSet0.fp_c3)._m0[3].x, _254);
    float _260 = _248 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _262 = _248 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _264 = fma(_250, (*spvDescriptorSet0.fp_c3)._m0[1].x, _256);
    float _266 = fma(_252, (*spvDescriptorSet0.fp_c3)._m0[3].z, _258);
    float _268 = fma(_252, (*spvDescriptorSet0.fp_c3)._m0[1].z, _264);
    float _270 = _266 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _272 = fma(_250, (*spvDescriptorSet0.fp_c3)._m0[0].x, _260);
    float _274 = fma(_250, (*spvDescriptorSet0.fp_c3)._m0[2].x, _262);
    float _276 = _268 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _278 = fma(_252, (*spvDescriptorSet0.fp_c3)._m0[0].z, _272);
    float _280 = 1.0 / _270;
    float _282 = fma(_252, (*spvDescriptorSet0.fp_c3)._m0[2].z, _274);
    float _284 = _278 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _286 = _282 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _288 = _284 * _280;
    float _290 = _276 * _280;
    float2 _790 = float2(_242, _244);
    float2 _294 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_790, float2(0.0), isnan(_790))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_790, float2(0.0), isnan(_790))).xy;
    float _296 = _294.x;
    float _298 = _294.y;
    float _300 = _286 * _280;
    float _302 = precise::clamp(_300, 0.0, 1.0);
    float3 _808 = float3(_288, _290, float(0));
    float3 _812 = select(_808, float3(0.0), isnan(_808));
    float _304 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _812.xy, uint(rint(_812.z)), _302);
    float _306 = _138 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _308 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[14].x, _306);
    float _310 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[14].z, _308);
    float _312 = _310 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _314 = precise::min(_312, 1.0);
    float _316 = -_296;
    float _318 = fma(_316, _296, _298);
    float _320 = -_296;
    float _322 = _314 + _320;
    float _324 = -_104;
    float _326 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _328 = _324 + _326;
    float _330 = fma(_322, _322, _318);
    bool _334 = _322 <= 0.001000000047497451305389404296875;
    float _336 = float(_334);
    float _338 = _328 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _340 = precise::clamp(_338, 0.0, 1.0);
    float _342 = 1.0 / _330;
    float _344 = _340 + _304;
    float _346 = _318 * _342;
    float _348 = precise::max(_346, _336);
    float _350 = -_104;
    float _352 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _354 = _350 + _352;
    float _356 = precise::min(_348, 1.0);
    float _358 = _354 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _360 = precise::clamp(_358, 0.0, 1.0);
    float _362 = _360 + _356;
    out.m_43.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_43.y = _344;
    out.m_43.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_43.w = _362;
    return out;
}


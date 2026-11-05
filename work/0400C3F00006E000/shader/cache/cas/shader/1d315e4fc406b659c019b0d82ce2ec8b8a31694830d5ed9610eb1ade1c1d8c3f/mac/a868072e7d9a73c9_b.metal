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
    texture2d<float> fp_t_tcb_10 [[id(5)]];
    sampler fp_t_tcb_10Smplr [[id(6)]];
    texture2d_array<float> fp_t_tcb_E [[id(7)]];
    sampler fp_t_tcb_ESmplr [[id(8)]];
    texture2d<float> fp_t_tcb_A [[id(9)]];
    sampler fp_t_tcb_ASmplr [[id(10)]];
    sampler fp_t_tcb_8Smplr_w [[id(11)]];
    sampler fp_t_tcb_CSmplr_w [[id(12)]];
    sampler fp_t_tcb_10Smplr_w [[id(13)]];
    sampler fp_t_tcb_ASmplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_47 [[color(0)]];
};

struct main0_in
{
    float4 m_40 [[user(locn0), center_no_perspective]];
    float4 m_44 [[user(locn1), center_no_perspective]];
    float4 m_42 [[user(locn2), center_no_perspective]];
    float4 m_38 [[user(locn3), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _54 = in.m_38.x;
    float _56 = in.m_38.y;
    float2 _406 = float2(_54, _56);
    float3 _60 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_406, float2(0.0), isnan(_406)), int2(0), component::x).xyw;
    float _62 = _60.x;
    float _64 = _60.y;
    float _66 = _60.z;
    float2 _423 = float2(_54, _56);
    float _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_423, float2(0.0), isnan(_423))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_423, float2(0.0), isnan(_423))).x;
    float2 _431 = float2(_54, _56);
    float2 _72 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_431, float2(0.0), isnan(_431))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_431, float2(0.0), isnan(_431))).xy;
    float _74 = _72.x;
    float _76 = _72.y;
    float _78 = in.m_40.y;
    float _80 = in.m_42.y;
    float _82 = in.m_40.x;
    float _84 = in.m_44.y;
    float _86 = in.m_42.x;
    float _88 = in.m_44.x;
    float _90 = -_62;
    float _92 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _94 = fma(_90, (*spvDescriptorSet0.fp_c3)._m0[46].z, _92);
    float _96 = -_64;
    float _98 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _100 = fma(_96, (*spvDescriptorSet0.fp_c3)._m0[46].z, _98);
    float _102 = _78 * _94;
    float _104 = _82 * _94;
    float _106 = -_102;
    float _108 = fma(_100, _80, _106);
    float _110 = -_66;
    float _112 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _114 = fma(_110, (*spvDescriptorSet0.fp_c3)._m0[46].z, _112);
    float _116 = -_104;
    float _118 = fma(_100, _86, _116);
    float _120 = -_94;
    float _122 = _120 + _100;
    float _124 = _108 * _108;
    float _126 = -_102;
    float _128 = fma(_114, _84, _126);
    float _130 = -_104;
    float _132 = fma(_114, _88, _130);
    float _134 = -_94;
    float _136 = _134 + _114;
    float _138 = fma(_118, _118, _124);
    float _140 = _128 * _128;
    float _142 = fma(_122, _122, _138);
    float _144 = fma(_132, _132, _140);
    float _146 = fma(_136, _136, _144);
    float _148 = rsqrt(_142);
    float _150 = rsqrt(_146);
    float _152 = _118 * _148;
    float _154 = _122 * _148;
    float _156 = _108 * _148;
    float _158 = _136 * _150;
    float _160 = _132 * _150;
    float _162 = _128 * _150;
    float _164 = _152 * _158;
    float _166 = _154 * _162;
    float _168 = -_164;
    float _170 = fma(_154, _160, _168);
    float _172 = _156 * _160;
    float _174 = -_166;
    float _176 = fma(_156, _158, _174);
    float _178 = _170 * _170;
    float _180 = -_172;
    float _182 = fma(_152, _162, _180);
    float _184 = fma(_176, _176, _178);
    float _186 = fma(_182, _182, _184);
    float _188 = rsqrt(_186);
    float _190 = _170 * _188;
    float _192 = _176 * _188;
    float _194 = _182 * _188;
    float _196 = _190 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _198 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[35].x, _196);
    float _200 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[35].z, _198);
    float _202 = abs(_200);
    float _204 = -_202;
    float _206 = _204 + 1.0;
    float _208 = precise::clamp(_206, 0.0, 1.0);
    float _210 = abs(_208);
    float _212 = log2(_210);
    float _214 = -_68;
    float _216 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _218 = fma(_214, (*spvDescriptorSet0.fp_c3)._m0[46].z, _216);
    float _220 = _218 * _78;
    float _222 = _218 * _82;
    float _224 = _220 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _226 = _220 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _228 = fma(_222, (*spvDescriptorSet0.fp_c3)._m0[15].x, _224);
    float _230 = _220 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _232 = _212 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _234 = fma(_218, (*spvDescriptorSet0.fp_c3)._m0[15].z, _228);
    float _236 = _234 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _238 = exp2(_232);
    float _240 = 1.0 / _236;
    float _242 = _238 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _244 = fma(_222, (*spvDescriptorSet0.fp_c3)._m0[12].x, _230);
    float _246 = fma(_190, _242, _220);
    float _248 = fma(_192, _242, _222);
    float _250 = fma(_194, _242, _218);
    float _252 = fma(_218, (*spvDescriptorSet0.fp_c3)._m0[12].z, _244);
    float _254 = _246 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _256 = fma(_222, (*spvDescriptorSet0.fp_c3)._m0[13].x, _226);
    float _258 = _246 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _260 = _252 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _262 = fma(_248, (*spvDescriptorSet0.fp_c3)._m0[3].x, _254);
    float _264 = fma(_218, (*spvDescriptorSet0.fp_c3)._m0[13].z, _256);
    float _266 = _246 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _268 = fma(_250, (*spvDescriptorSet0.fp_c3)._m0[3].z, _262);
    float _270 = fma(_76, 2.0, -1.0);
    float _272 = _264 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _274 = fma(_248, (*spvDescriptorSet0.fp_c3)._m0[0].x, _266);
    float _276 = _268 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _278 = _260 * _240;
    float _280 = _246 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _282 = fma(_248, (*spvDescriptorSet0.fp_c3)._m0[2].x, _258);
    float _284 = _270 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _286 = _272 * _240;
    float _288 = fma(_248, (*spvDescriptorSet0.fp_c3)._m0[1].x, _280);
    float _290 = fma(_250, (*spvDescriptorSet0.fp_c3)._m0[2].z, _282);
    float _292 = fma(_250, (*spvDescriptorSet0.fp_c3)._m0[0].z, _274);
    float _294 = fma(_284, 2.0, _56);
    float _296 = fma(_250, (*spvDescriptorSet0.fp_c3)._m0[1].z, _288);
    float _298 = _290 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _300 = 1.0 / _276;
    float2 _833 = float2(_278, _286);
    float2 _302 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_833, float2(0.0), isnan(_833))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_833, float2(0.0), isnan(_833))).xy;
    float _304 = _302.x;
    float _306 = _302.y;
    float _308 = fma(_74, 2.0, -1.0);
    float _310 = _292 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _312 = _308 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _314 = _296 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _316 = fma(_312, 2.0, _54);
    float _318 = _298 * _300;
    float _320 = precise::clamp(_318, 0.0, 1.0);
    float _322 = _314 * _300;
    float _324 = _310 * _300;
    float _326 = rint(_320);
    float _328 = precise::max(_326, 0.0);
    uint _331 = uint(_328);
    uint _333 = clamp(_331, 0u, 65535u);
    float3 _886 = float3(_324, _322, float(int(_333)));
    float3 _890 = select(_886, float3(0.0), isnan(_886));
    float _335 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _890.xy, uint(rint(_890.z)), 1.0);
    float2 _895 = float2(_316, _294);
    float _337 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_895, float2(0.0), isnan(_895))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_895, float2(0.0), isnan(_895))).x;
    float _339 = _220 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _341 = fma(_222, (*spvDescriptorSet0.fp_c3)._m0[14].x, _339);
    float _343 = fma(_218, (*spvDescriptorSet0.fp_c3)._m0[14].z, _341);
    float _345 = _343 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _347 = precise::min(_345, 1.0);
    float _349 = -_218;
    float _351 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _353 = _349 + _351;
    float _355 = -_218;
    float _357 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _359 = _355 + _357;
    float _361 = _353 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _363 = precise::clamp(_361, 0.0, 1.0);
    float _365 = _359 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _367 = precise::clamp(_365, 0.0, 1.0);
    float _369 = -_304;
    float _371 = fma(_369, _304, _306);
    float _373 = -_304;
    float _375 = _347 + _373;
    float _377 = fma(_375, _375, _371);
    bool _381 = _375 <= 0.001000000047497451305389404296875;
    float _383 = float(_381);
    float _385 = 1.0 / _377;
    float _387 = _371 * _385;
    float _389 = precise::max(_387, _383);
    float _391 = precise::min(_389, 1.0);
    float _393 = _363 + _335;
    float _395 = _367 + _391;
    out.m_47.x = _337;
    out.m_47.y = _393;
    out.m_47.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_47.w = _395;
    return out;
}


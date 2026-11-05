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
    float2 _397 = float2(_54, _56);
    float3 _60 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_397, float2(0.0), isnan(_397)), int2(0), component::x).xyw;
    float _62 = _60.x;
    float _64 = _60.y;
    float _66 = _60.z;
    float2 _414 = float2(_54, _56);
    float _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_414, float2(0.0), isnan(_414))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_414, float2(0.0), isnan(_414))).x;
    float2 _422 = float2(_54, _56);
    float2 _72 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_422, float2(0.0), isnan(_422))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_422, float2(0.0), isnan(_422))).xy;
    float _74 = _72.x;
    float _76 = _72.y;
    float _78 = in.m_40.y;
    float _80 = in.m_40.x;
    float _82 = in.m_42.y;
    float _84 = in.m_44.y;
    float _86 = in.m_42.x;
    float _88 = in.m_44.x;
    float _90 = -_62;
    float _92 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _94 = fma(_90, (*spvDescriptorSet0.fp_c3)._m0[46].z, _92);
    float _96 = -_64;
    float _98 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _100 = fma(_96, (*spvDescriptorSet0.fp_c3)._m0[46].z, _98);
    float _102 = -_66;
    float _104 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _106 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[46].z, _104);
    float _108 = _78 * _94;
    float _110 = _80 * _94;
    float _112 = -_108;
    float _114 = fma(_100, _82, _112);
    float _116 = -_108;
    float _118 = fma(_106, _84, _116);
    float _120 = -_110;
    float _122 = fma(_100, _86, _120);
    float _124 = -_110;
    float _126 = fma(_106, _88, _124);
    float _128 = _114 * _114;
    float _130 = _118 * _118;
    float _132 = -_94;
    float _134 = _132 + _100;
    float _136 = -_94;
    float _138 = _136 + _106;
    float _140 = fma(_122, _122, _128);
    float _142 = fma(_126, _126, _130);
    float _144 = fma(_134, _134, _140);
    float _146 = fma(_138, _138, _142);
    float _148 = rsqrt(_144);
    float _150 = rsqrt(_146);
    float _152 = _122 * _148;
    float _154 = _134 * _148;
    float _156 = _114 * _148;
    float _158 = _138 * _150;
    float _160 = _118 * _150;
    float _162 = _126 * _150;
    float _164 = _152 * _158;
    float _166 = _154 * _160;
    float _168 = -_164;
    float _170 = fma(_154, _162, _168);
    float _172 = -_166;
    float _174 = fma(_156, _158, _172);
    float _176 = _156 * _162;
    float _178 = _170 * _170;
    float _180 = -_176;
    float _182 = fma(_152, _160, _180);
    float _184 = fma(_174, _174, _178);
    float _186 = fma(_182, _182, _184);
    float _188 = rsqrt(_186);
    float _190 = _170 * _188;
    float _192 = _174 * _188;
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
    float _222 = _218 * _80;
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
    float _252 = fma(_222, (*spvDescriptorSet0.fp_c3)._m0[13].x, _226);
    float _254 = _246 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _256 = fma(_218, (*spvDescriptorSet0.fp_c3)._m0[12].z, _244);
    float _258 = fma(_74, 2.0, -1.0);
    float _260 = fma(_218, (*spvDescriptorSet0.fp_c3)._m0[13].z, _252);
    float _262 = fma(_248, (*spvDescriptorSet0.fp_c3)._m0[3].x, _254);
    float _264 = _256 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _266 = _246 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _268 = _260 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _270 = fma(_250, (*spvDescriptorSet0.fp_c3)._m0[3].z, _262);
    float _272 = _246 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _274 = _268 * _240;
    float _276 = _270 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _278 = _264 * _240;
    float _280 = _246 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _282 = fma(_248, (*spvDescriptorSet0.fp_c3)._m0[1].x, _272);
    float _284 = 1.0 / _276;
    float _286 = fma(_248, (*spvDescriptorSet0.fp_c3)._m0[0].x, _280);
    float _288 = fma(_248, (*spvDescriptorSet0.fp_c3)._m0[2].x, _266);
    float _290 = fma(_250, (*spvDescriptorSet0.fp_c3)._m0[1].z, _282);
    float _292 = fma(_250, (*spvDescriptorSet0.fp_c3)._m0[0].z, _286);
    float _294 = fma(_250, (*spvDescriptorSet0.fp_c3)._m0[2].z, _288);
    float _296 = fma(_76, 2.0, -1.0);
    float _298 = _258 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _300 = _290 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _302 = _292 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _304 = _296 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _306 = fma(_298, 2.0, _54);
    float _308 = _294 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float2 _838 = float2(_278, _274);
    float2 _310 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_838, float2(0.0), isnan(_838))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_838, float2(0.0), isnan(_838))).xy;
    float _312 = _310.x;
    float _314 = _310.y;
    float _316 = _300 * _284;
    float _318 = fma(_304, 2.0, _56);
    float _320 = _302 * _284;
    float _322 = _308 * _284;
    float _324 = precise::clamp(_322, 0.0, 1.0);
    float3 _865 = float3(_320, _316, float(0));
    float3 _869 = select(_865, float3(0.0), isnan(_865));
    float _326 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _869.xy, uint(rint(_869.z)), _324);
    float2 _875 = float2(_306, _318);
    float _328 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_875, float2(0.0), isnan(_875))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_875, float2(0.0), isnan(_875))).x;
    float _330 = _220 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _332 = fma(_222, (*spvDescriptorSet0.fp_c3)._m0[14].x, _330);
    float _334 = fma(_218, (*spvDescriptorSet0.fp_c3)._m0[14].z, _332);
    float _336 = _334 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _338 = precise::min(_336, 1.0);
    float _340 = -_218;
    float _342 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _344 = _340 + _342;
    float _346 = -_218;
    float _348 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _350 = _346 + _348;
    float _352 = _344 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _354 = precise::clamp(_352, 0.0, 1.0);
    float _356 = _350 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _358 = precise::clamp(_356, 0.0, 1.0);
    float _360 = -_312;
    float _362 = fma(_360, _312, _314);
    float _364 = -_312;
    float _366 = _338 + _364;
    float _368 = fma(_366, _366, _362);
    bool _372 = _366 <= 0.001000000047497451305389404296875;
    float _374 = float(_372);
    float _376 = _354 + _326;
    float _378 = 1.0 / _368;
    float _380 = _362 * _378;
    float _382 = precise::max(_380, _374);
    float _384 = precise::min(_382, 1.0);
    float _386 = _358 + _384;
    out.m_47.x = _328;
    out.m_47.y = _376;
    out.m_47.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_47.w = _386;
    return out;
}


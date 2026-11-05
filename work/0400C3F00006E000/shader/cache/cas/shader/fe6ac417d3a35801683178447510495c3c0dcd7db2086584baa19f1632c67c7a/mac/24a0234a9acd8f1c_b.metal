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
    float2 _439 = float2(_54, _56);
    float3 _60 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_439, float2(0.0), isnan(_439)), int2(0), component::x).xyw;
    float _62 = _60.x;
    float _64 = _60.y;
    float _66 = _60.z;
    float2 _456 = float2(_54, _56);
    float _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_456, float2(0.0), isnan(_456))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_456, float2(0.0), isnan(_456))).x;
    float2 _464 = float2(_54, _56);
    float2 _72 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_464, float2(0.0), isnan(_464))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_464, float2(0.0), isnan(_464))).xy;
    float _74 = _72.x;
    float _76 = _72.y;
    float _78 = in.m_40.y;
    float _80 = in.m_40.x;
    float _82 = in.m_42.y;
    float _84 = in.m_44.y;
    float _86 = in.m_42.x;
    float _88 = in.m_44.x;
    float _90 = -_62;
    float _92 = fma(_90, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _94 = -_64;
    float _96 = fma(_94, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _98 = -_66;
    float _100 = fma(_98, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _102 = 1.0 / _92;
    float _104 = 1.0 / _96;
    float _106 = 1.0 / _100;
    float _108 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _110 = _102 * _108;
    float _112 = _78 * _110;
    float _114 = _80 * _110;
    float _116 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _118 = _104 * _116;
    float _120 = -_112;
    float _122 = fma(_118, _82, _120);
    float _124 = -_114;
    float _126 = fma(_118, _86, _124);
    float _128 = -_110;
    float _130 = _128 + _118;
    float _132 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _134 = _106 * _132;
    float _136 = _122 * _122;
    float _138 = -_112;
    float _140 = fma(_134, _84, _138);
    float _142 = -_114;
    float _144 = fma(_134, _88, _142);
    float _146 = -_110;
    float _148 = _146 + _134;
    float _150 = fma(_126, _126, _136);
    float _152 = _140 * _140;
    float _154 = fma(_130, _130, _150);
    float _156 = fma(_144, _144, _152);
    float _158 = fma(_148, _148, _156);
    float _160 = rsqrt(_154);
    float _162 = rsqrt(_158);
    float _164 = _126 * _160;
    float _166 = _130 * _160;
    float _168 = _122 * _160;
    float _170 = _148 * _162;
    float _172 = _144 * _162;
    float _174 = _140 * _162;
    float _176 = _164 * _170;
    float _178 = _166 * _174;
    float _180 = -_176;
    float _182 = fma(_166, _172, _180);
    float _184 = _168 * _172;
    float _186 = -_178;
    float _188 = fma(_168, _170, _186);
    float _190 = _182 * _182;
    float _192 = -_184;
    float _194 = fma(_164, _174, _192);
    float _196 = -_68;
    float _198 = fma(_196, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _200 = fma(_188, _188, _190);
    float _202 = fma(_194, _194, _200);
    float _204 = 1.0 / _198;
    float _206 = rsqrt(_202);
    float _208 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _210 = _204 * _208;
    float _212 = _210 * _78;
    float _214 = _210 * _80;
    float _216 = _182 * _206;
    float _218 = _188 * _206;
    float _220 = _194 * _206;
    float _222 = _212 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _224 = _216 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _226 = _212 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _228 = fma(_214, (*spvDescriptorSet0.fp_c3)._m0[15].x, _222);
    float _230 = fma(_218, (*spvDescriptorSet0.fp_c3)._m0[35].x, _224);
    float _232 = fma(_214, (*spvDescriptorSet0.fp_c3)._m0[13].x, _226);
    float _234 = fma(_210, (*spvDescriptorSet0.fp_c3)._m0[15].z, _228);
    float _236 = fma(_220, (*spvDescriptorSet0.fp_c3)._m0[35].z, _230);
    float _238 = fma(_210, (*spvDescriptorSet0.fp_c3)._m0[13].z, _232);
    float _240 = abs(_236);
    float _242 = -_240;
    float _244 = _242 + 1.0;
    float _246 = precise::clamp(_244, 0.0, 1.0);
    float _248 = _238 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _250 = abs(_246);
    float _252 = log2(_250);
    float _254 = _252 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _256 = exp2(_254);
    float _258 = _256 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _260 = fma(_216, _258, _212);
    float _262 = _234 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _264 = fma(_218, _258, _214);
    float _266 = fma(_220, _258, _210);
    float _268 = _260 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _270 = _212 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _272 = _260 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _274 = 1.0 / _262;
    float _276 = fma(_264, (*spvDescriptorSet0.fp_c3)._m0[3].x, _268);
    float _278 = fma(_214, (*spvDescriptorSet0.fp_c3)._m0[12].x, _270);
    float _280 = _260 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _282 = fma(_264, (*spvDescriptorSet0.fp_c3)._m0[1].x, _272);
    float _284 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[3].z, _276);
    float _286 = fma(_210, (*spvDescriptorSet0.fp_c3)._m0[12].z, _278);
    float _288 = fma(_264, (*spvDescriptorSet0.fp_c3)._m0[2].x, _280);
    float _290 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[1].z, _282);
    float _292 = _284 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _294 = _260 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _296 = _286 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _298 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[2].z, _288);
    float _300 = 1.0 / _292;
    float _302 = fma(_264, (*spvDescriptorSet0.fp_c3)._m0[0].x, _294);
    float _304 = _290 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _306 = _296 * _274;
    float _308 = _248 * _274;
    float _310 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[0].z, _302);
    float2 _870 = float2(_306, _308);
    float2 _312 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_870, float2(0.0), isnan(_870))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_870, float2(0.0), isnan(_870))).xy;
    float _314 = _312.x;
    float _316 = _312.y;
    float _318 = _298 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _320 = _310 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _322 = _318 * _300;
    float _324 = precise::clamp(_322, 0.0, 1.0);
    float _326 = fma(_74, 2.0, -1.0);
    float _328 = fma(_76, 2.0, -1.0);
    float _330 = _320 * _300;
    float _332 = _324 * (*spvDescriptorSet0.fp_c3)._m0[47].x;
    float _334 = _326 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _336 = _328 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _338 = _304 * _300;
    float _340 = _332 * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _342 = _332 * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _344 = fma(_336, 2.0, _56);
    float _346 = fma(_340, 0.5, _330);
    float _348 = fma(_340, -0.5, _330);
    float _350 = fma(_342, 0.5, _338);
    float _352 = fma(_342, -0.5, _338);
    float _354 = fma(_334, 2.0, _54);
    float3 _951 = float3(_346, _350, float(0));
    float3 _955 = select(_951, float3(0.0), isnan(_951));
    float _356 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _955.xy, uint(rint(_955.z)), _324);
    float3 _962 = float3(_348, _350, float(0));
    float3 _964 = select(_962, float3(0.0), isnan(_962));
    float _358 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _964.xy, uint(rint(_964.z)), _324);
    float3 _971 = float3(_346, _352, float(0));
    float3 _973 = select(_971, float3(0.0), isnan(_971));
    float _360 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _973.xy, uint(rint(_973.z)), _324);
    float3 _980 = float3(_348, _352, float(0));
    float3 _982 = select(_980, float3(0.0), isnan(_980));
    float _362 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _982.xy, uint(rint(_982.z)), _324);
    float2 _988 = float2(_354, _344);
    float _364 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_988, float2(0.0), isnan(_988))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_988, float2(0.0), isnan(_988))).x;
    float _366 = _212 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _368 = fma(_214, (*spvDescriptorSet0.fp_c3)._m0[14].x, _366);
    float _370 = fma(_210, (*spvDescriptorSet0.fp_c3)._m0[14].z, _368);
    float _372 = _370 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _374 = precise::min(_372, 1.0);
    float _376 = -_210;
    float _378 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _380 = _376 + _378;
    float _382 = -_210;
    float _384 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _386 = _382 + _384;
    float _388 = _380 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _390 = precise::clamp(_388, 0.0, 1.0);
    float _392 = _386 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _394 = precise::clamp(_392, 0.0, 1.0);
    float _396 = -_314;
    float _398 = fma(_396, _314, _316);
    float _400 = -_314;
    float _402 = _374 + _400;
    float _404 = fma(_402, _402, _398);
    bool _408 = _402 <= 0.001000000047497451305389404296875;
    float _410 = float(_408);
    float _412 = 1.0 / _404;
    float _414 = _398 * _412;
    float _416 = _356 + _358;
    float _418 = _416 + _360;
    float _420 = precise::max(_414, _410);
    float _422 = _418 + _362;
    float _424 = precise::min(_420, 1.0);
    float _426 = fma(_422, 0.25, _390);
    float _428 = _394 + _424;
    out.m_47.x = _364;
    out.m_47.y = _426;
    out.m_47.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_47.w = _428;
    return out;
}


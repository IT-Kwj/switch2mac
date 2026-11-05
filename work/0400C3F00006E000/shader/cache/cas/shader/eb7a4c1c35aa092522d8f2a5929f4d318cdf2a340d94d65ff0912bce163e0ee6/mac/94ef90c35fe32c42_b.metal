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
    texture2d_array<float> fp_t_tcb_E [[id(5)]];
    sampler fp_t_tcb_ESmplr [[id(6)]];
    texture2d<float> fp_t_tcb_10 [[id(7)]];
    sampler fp_t_tcb_10Smplr [[id(8)]];
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
    float2 _461 = float2(_54, _56);
    float3 _60 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_461, float2(0.0), isnan(_461)), int2(0), component::x).xyw;
    float _62 = _60.x;
    float _64 = _60.y;
    float _66 = _60.z;
    float2 _478 = float2(_54, _56);
    float _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_478, float2(0.0), isnan(_478))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_478, float2(0.0), isnan(_478))).x;
    float2 _486 = float2(_54, _56);
    float2 _72 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_486, float2(0.0), isnan(_486))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_486, float2(0.0), isnan(_486))).xy;
    float _74 = _72.x;
    float _76 = _72.y;
    float _78 = in.m_40.y;
    float _80 = in.m_42.y;
    float _82 = in.m_40.x;
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
    float _114 = _82 * _110;
    float _116 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _118 = _104 * _116;
    float _120 = -_112;
    float _122 = fma(_118, _80, _120);
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
    float _146 = fma(_126, _126, _136);
    float _148 = -_110;
    float _150 = _148 + _134;
    float _152 = _140 * _140;
    float _154 = fma(_130, _130, _146);
    float _156 = fma(_144, _144, _152);
    float _158 = fma(_150, _150, _156);
    float _160 = rsqrt(_154);
    float _162 = rsqrt(_158);
    float _164 = _126 * _160;
    float _166 = _130 * _160;
    float _168 = _122 * _160;
    float _170 = _150 * _162;
    float _172 = _140 * _162;
    float _174 = _144 * _162;
    float _176 = _164 * _170;
    float _178 = _166 * _172;
    float _180 = -_176;
    float _182 = fma(_166, _174, _180);
    float _184 = _168 * _174;
    float _186 = -_178;
    float _188 = fma(_168, _170, _186);
    float _190 = _182 * _182;
    float _192 = -_184;
    float _194 = fma(_164, _172, _192);
    float _196 = fma(_188, _188, _190);
    float _198 = fma(_194, _194, _196);
    float _200 = rsqrt(_198);
    float _202 = _182 * _200;
    float _204 = _188 * _200;
    float _206 = _194 * _200;
    float _208 = _202 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _210 = fma(_204, (*spvDescriptorSet0.fp_c3)._m0[35].x, _208);
    float _212 = fma(_206, (*spvDescriptorSet0.fp_c3)._m0[35].z, _210);
    float _214 = abs(_212);
    float _216 = -_214;
    float _218 = _216 + 1.0;
    float _220 = precise::clamp(_218, 0.0, 1.0);
    float _222 = abs(_220);
    float _224 = log2(_222);
    float _226 = -_68;
    float _228 = fma(_226, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _230 = 1.0 / _228;
    float _232 = _224 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _234 = exp2(_232);
    float _236 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _238 = _230 * _236;
    float _240 = _238 * _78;
    float _242 = _238 * _82;
    float _244 = _240 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _246 = _240 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _248 = fma(_242, (*spvDescriptorSet0.fp_c3)._m0[15].x, _244);
    float _250 = _240 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _252 = _234 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _254 = fma(_238, (*spvDescriptorSet0.fp_c3)._m0[15].z, _248);
    float _256 = fma(_242, (*spvDescriptorSet0.fp_c3)._m0[13].x, _250);
    float _258 = fma(_202, _252, _240);
    float _260 = fma(_204, _252, _242);
    float _262 = fma(_206, _252, _238);
    float _264 = _254 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _266 = _258 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _268 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[3].x, _266);
    float _270 = fma(_242, (*spvDescriptorSet0.fp_c3)._m0[12].x, _246);
    float _272 = fma(_238, (*spvDescriptorSet0.fp_c3)._m0[13].z, _256);
    float _274 = 1.0 / _264;
    float _276 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[3].z, _268);
    float _278 = fma(_238, (*spvDescriptorSet0.fp_c3)._m0[12].z, _270);
    float _280 = _258 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _282 = _272 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _284 = _276 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _286 = _278 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _288 = _258 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _290 = _258 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _292 = 1.0 / _284;
    float _294 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[1].x, _280);
    float _296 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[0].x, _288);
    float _298 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[2].x, _290);
    float _300 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[1].z, _294);
    float _302 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[0].z, _296);
    float _304 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[2].z, _298);
    float _306 = _300 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _308 = _302 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _310 = _304 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _312 = _286 * _274;
    float _314 = _282 * _274;
    float _316 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _318 = _308 * _292;
    float _320 = _306 * _292;
    float _322 = _310 * _292;
    float _324 = precise::clamp(_322, 0.0, 1.0);
    float _326 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _328 = fma(_76, 2.0, -1.0);
    float _330 = fma(_74, 2.0, -1.0);
    float _332 = fma(_324, _316, _318);
    float _334 = fma(_324, _326, _320);
    float _336 = _328 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _338 = _330 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float3 _947 = float3(_332, _334, float(0));
    float3 _951 = select(_947, float3(0.0), isnan(_947));
    float _340 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _951.xy, uint(rint(_951.z)), _324);
    float _342 = -_326;
    float _344 = fma(_324, _342, _320);
    float _346 = fma(_336, 2.0, _56);
    float _348 = fma(_338, 2.0, _54);
    float _350 = -_316;
    float _352 = fma(_324, _350, _318);
    float3 _976 = float3(_318, _334, float(0));
    float3 _978 = select(_976, float3(0.0), isnan(_976));
    float _354 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _978.xy, uint(rint(_978.z)), _324);
    float3 _985 = float3(_352, _334, float(0));
    float3 _987 = select(_985, float3(0.0), isnan(_985));
    float _356 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _987.xy, uint(rint(_987.z)), _324);
    float3 _994 = float3(_332, _320, float(0));
    float3 _996 = select(_994, float3(0.0), isnan(_994));
    float _358 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _996.xy, uint(rint(_996.z)), _324);
    float3 _1003 = float3(_318, _320, float(0));
    float3 _1005 = select(_1003, float3(0.0), isnan(_1003));
    float _360 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1005.xy, uint(rint(_1005.z)), _324);
    float2 _1011 = float2(_312, _314);
    float2 _362 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_1011, float2(0.0), isnan(_1011))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_1011, float2(0.0), isnan(_1011))).xy;
    float _364 = _362.x;
    float _366 = _362.y;
    float3 _1024 = float3(_352, _320, float(0));
    float3 _1026 = select(_1024, float3(0.0), isnan(_1024));
    float _368 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1026.xy, uint(rint(_1026.z)), _324);
    float3 _1033 = float3(_332, _344, float(0));
    float3 _1035 = select(_1033, float3(0.0), isnan(_1033));
    float _370 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1035.xy, uint(rint(_1035.z)), _324);
    float3 _1042 = float3(_318, _344, float(0));
    float3 _1044 = select(_1042, float3(0.0), isnan(_1042));
    float _372 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1044.xy, uint(rint(_1044.z)), _324);
    float3 _1051 = float3(_352, _344, float(0));
    float3 _1053 = select(_1051, float3(0.0), isnan(_1051));
    float _374 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1053.xy, uint(rint(_1053.z)), _324);
    float2 _1059 = float2(_348, _346);
    float _376 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1059, float2(0.0), isnan(_1059))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1059, float2(0.0), isnan(_1059))).x;
    float _378 = _240 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _380 = -_238;
    float _382 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _384 = _380 + _382;
    float _386 = -_238;
    float _388 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _390 = _386 + _388;
    float _392 = fma(_242, (*spvDescriptorSet0.fp_c3)._m0[14].x, _378);
    float _394 = _384 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _396 = precise::clamp(_394, 0.0, 1.0);
    float _398 = _390 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _400 = precise::clamp(_398, 0.0, 1.0);
    float _402 = fma(_238, (*spvDescriptorSet0.fp_c3)._m0[14].z, _392);
    float _404 = _402 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _406 = precise::min(_404, 1.0);
    float _408 = _340 + _354;
    float _410 = -_364;
    float _412 = fma(_410, _364, _366);
    float _414 = -_364;
    float _416 = _406 + _414;
    float _418 = _408 + _356;
    float _420 = fma(_416, _416, _412);
    float _422 = _418 + _358;
    bool _426 = _416 <= 0.001000000047497451305389404296875;
    float _428 = float(_426);
    float _430 = 1.0 / _420;
    float _432 = _422 + _360;
    float _434 = _432 + _368;
    float _436 = _434 + _370;
    float _438 = _412 * _430;
    float _440 = _436 + _372;
    float _442 = precise::max(_438, _428);
    float _444 = _440 + _374;
    float _446 = precise::min(_442, 1.0);
    float _448 = fma(_444, 0.111111111938953399658203125, _396);
    float _450 = _400 + _446;
    out.m_47.x = _376;
    out.m_47.y = _448;
    out.m_47.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_47.w = _450;
    return out;
}


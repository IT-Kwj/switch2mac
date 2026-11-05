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
    texture2d_array<float> fp_t_tcb_E [[id(3)]];
    sampler fp_t_tcb_ESmplr [[id(4)]];
    texture2d<float> fp_t_tcb_C [[id(5)]];
    sampler fp_t_tcb_CSmplr [[id(6)]];
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
    float2 _497 = float2(_54, _56);
    float3 _60 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_497, float2(0.0), isnan(_497)), int2(0), component::x).xyw;
    float _62 = _60.x;
    float _64 = _60.y;
    float _66 = _60.z;
    float2 _514 = float2(_54, _56);
    float _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_514, float2(0.0), isnan(_514))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_514, float2(0.0), isnan(_514))).x;
    float _70 = in.m_40.y;
    float _72 = in.m_40.x;
    float _74 = in.m_42.y;
    float _76 = in.m_44.y;
    float _78 = in.m_42.x;
    float _80 = in.m_44.x;
    float _82 = -_62;
    float _84 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _86 = -_64;
    float _88 = fma(_86, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _90 = -_66;
    float _92 = fma(_90, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _94 = 1.0 / _84;
    float _96 = 1.0 / _88;
    float _98 = 1.0 / _92;
    float _100 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _102 = _94 * _100;
    float _104 = _70 * _102;
    float _106 = _72 * _102;
    float _108 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _110 = _96 * _108;
    float _112 = -_104;
    float _114 = fma(_110, _74, _112);
    float _116 = -_106;
    float _118 = fma(_110, _78, _116);
    float _120 = -_102;
    float _122 = _120 + _110;
    float _124 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _126 = _98 * _124;
    float _128 = _114 * _114;
    float _130 = -_104;
    float _132 = fma(_126, _76, _130);
    float _134 = -_106;
    float _136 = fma(_126, _80, _134);
    float _138 = fma(_118, _118, _128);
    float _140 = -_102;
    float _142 = _140 + _126;
    float _144 = _132 * _132;
    float _146 = fma(_122, _122, _138);
    float _148 = fma(_136, _136, _144);
    float _150 = fma(_142, _142, _148);
    float _152 = rsqrt(_146);
    float _154 = rsqrt(_150);
    float _156 = _118 * _152;
    float _158 = _122 * _152;
    float _160 = _114 * _152;
    float _162 = _142 * _154;
    float _164 = _136 * _154;
    float _166 = _132 * _154;
    float _168 = -_68;
    float _170 = fma(_168, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _172 = _156 * _162;
    float _174 = _158 * _166;
    float _176 = -_172;
    float _178 = fma(_158, _164, _176);
    float _180 = _160 * _164;
    float _182 = -_174;
    float _184 = fma(_160, _162, _182);
    float _186 = 1.0 / _170;
    float _188 = _178 * _178;
    float _190 = -_180;
    float _192 = fma(_156, _166, _190);
    float _194 = fma(_184, _184, _188);
    float _196 = fma(_192, _192, _194);
    float _198 = rsqrt(_196);
    float _200 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _202 = _186 * _200;
    float _204 = _202 * _70;
    float _206 = _202 * _72;
    float _208 = _178 * _198;
    float _210 = _184 * _198;
    float _212 = _192 * _198;
    float _214 = _208 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _216 = fma(_210, (*spvDescriptorSet0.fp_c3)._m0[35].x, _214);
    float _218 = fma(_212, (*spvDescriptorSet0.fp_c3)._m0[35].z, _216);
    float _220 = abs(_218);
    float _222 = -_220;
    float _224 = _222 + 1.0;
    float _226 = precise::clamp(_224, 0.0, 1.0);
    float _228 = abs(_226);
    float _230 = log2(_228);
    float _232 = _230 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _234 = exp2(_232);
    float _236 = _234 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _238 = fma(_208, _236, _204);
    float _240 = fma(_210, _236, _206);
    float _242 = fma(_212, _236, _202);
    float _244 = _238 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _246 = _238 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _248 = _238 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _250 = fma(_240, (*spvDescriptorSet0.fp_c3)._m0[3].x, _244);
    float _252 = _238 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _254 = fma(_240, (*spvDescriptorSet0.fp_c3)._m0[0].x, _248);
    float _256 = fma(_242, (*spvDescriptorSet0.fp_c3)._m0[3].z, _250);
    float _258 = fma(_242, (*spvDescriptorSet0.fp_c3)._m0[0].z, _254);
    float _260 = _256 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _262 = fma(_240, (*spvDescriptorSet0.fp_c3)._m0[2].x, _246);
    float _264 = fma(_240, (*spvDescriptorSet0.fp_c3)._m0[1].x, _252);
    float _266 = 1.0 / _260;
    float _268 = fma(_242, (*spvDescriptorSet0.fp_c3)._m0[2].z, _262);
    float _270 = fma(_242, (*spvDescriptorSet0.fp_c3)._m0[1].z, _264);
    float _272 = _258 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _274 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _276 = _268 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _278 = _270 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _280 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _282 = _276 * _266;
    float _284 = precise::clamp(_282, 0.0, 1.0);
    float _286 = _272 * _266;
    float _288 = _278 * _266;
    float _290 = _284 * _274;
    float _292 = fma(_290, 1.5, _286);
    float _294 = fma(_290, 0.5, _286);
    float _296 = fma(_290, -0.5, _286);
    float _298 = fma(_290, -1.5, _286);
    float _300 = _284 * _280;
    float _302 = fma(_300, 1.5, _288);
    float _304 = fma(_300, 0.5, _288);
    float3 _911 = float3(_292, _302, float(0));
    float3 _915 = select(_911, float3(0.0), isnan(_911));
    float _306 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _915.xy, uint(rint(_915.z)), _284);
    float3 _922 = float3(_294, _302, float(0));
    float3 _924 = select(_922, float3(0.0), isnan(_922));
    float _308 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _924.xy, uint(rint(_924.z)), _284);
    float3 _931 = float3(_296, _302, float(0));
    float3 _933 = select(_931, float3(0.0), isnan(_931));
    float _310 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _933.xy, uint(rint(_933.z)), _284);
    float3 _940 = float3(_298, _302, float(0));
    float3 _942 = select(_940, float3(0.0), isnan(_940));
    float _312 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _942.xy, uint(rint(_942.z)), _284);
    float3 _949 = float3(_292, _304, float(0));
    float3 _951 = select(_949, float3(0.0), isnan(_949));
    float _314 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _951.xy, uint(rint(_951.z)), _284);
    float3 _958 = float3(_294, _304, float(0));
    float3 _960 = select(_958, float3(0.0), isnan(_958));
    float _316 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _960.xy, uint(rint(_960.z)), _284);
    float3 _967 = float3(_296, _304, float(0));
    float3 _969 = select(_967, float3(0.0), isnan(_967));
    float _318 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _969.xy, uint(rint(_969.z)), _284);
    float _320 = _204 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _322 = _204 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _324 = fma(_206, (*spvDescriptorSet0.fp_c3)._m0[15].x, _320);
    float _326 = fma(_206, (*spvDescriptorSet0.fp_c3)._m0[13].x, _322);
    float _328 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[15].z, _324);
    float _330 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[13].z, _326);
    float _332 = _328 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _334 = fma(_300, -0.5, _288);
    float _336 = fma(_300, -1.5, _288);
    float3 _1016 = float3(_298, _304, float(0));
    float3 _1018 = select(_1016, float3(0.0), isnan(_1016));
    float _338 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1018.xy, uint(rint(_1018.z)), _284);
    float _340 = _204 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _342 = 1.0 / _332;
    float _344 = _306 + _308;
    float _346 = fma(_206, (*spvDescriptorSet0.fp_c3)._m0[12].x, _340);
    float _348 = _330 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _350 = _344 + _310;
    float _352 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[12].z, _346);
    float _354 = _348 * _342;
    float _356 = _350 + _312;
    float _358 = _352 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _360 = _356 + _314;
    float _362 = _358 * _342;
    float2 _1067 = float2(_54, _56);
    float2 _366 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1067, float2(0.0), isnan(_1067))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1067, float2(0.0), isnan(_1067))).xy;
    float _368 = _366.x;
    float _370 = _366.y;
    float _372 = _360 + _316;
    float _374 = _372 + _318;
    float3 _1086 = float3(_292, _334, float(0));
    float3 _1088 = select(_1086, float3(0.0), isnan(_1086));
    float _376 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1088.xy, uint(rint(_1088.z)), _284);
    float3 _1095 = float3(_294, _334, float(0));
    float3 _1097 = select(_1095, float3(0.0), isnan(_1095));
    float _378 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1097.xy, uint(rint(_1097.z)), _284);
    float3 _1104 = float3(_296, _334, float(0));
    float3 _1106 = select(_1104, float3(0.0), isnan(_1104));
    float _380 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1106.xy, uint(rint(_1106.z)), _284);
    float3 _1113 = float3(_298, _334, float(0));
    float3 _1115 = select(_1113, float3(0.0), isnan(_1113));
    float _382 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1115.xy, uint(rint(_1115.z)), _284);
    float _384 = _374 + _338;
    float2 _1124 = float2(_362, _354);
    float2 _386 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_1124, float2(0.0), isnan(_1124))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_1124, float2(0.0), isnan(_1124))).xy;
    float _388 = _386.x;
    float _390 = _386.y;
    float _392 = fma(_368, 2.0, -1.0);
    float _394 = fma(_370, 2.0, -1.0);
    float _396 = _392 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _398 = _394 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _400 = fma(_396, 2.0, _54);
    float _402 = fma(_398, 2.0, _56);
    float3 _1158 = float3(_292, _336, float(0));
    float3 _1160 = select(_1158, float3(0.0), isnan(_1158));
    float _404 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1160.xy, uint(rint(_1160.z)), _284);
    float3 _1167 = float3(_294, _336, float(0));
    float3 _1169 = select(_1167, float3(0.0), isnan(_1167));
    float _406 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1169.xy, uint(rint(_1169.z)), _284);
    float3 _1176 = float3(_296, _336, float(0));
    float3 _1178 = select(_1176, float3(0.0), isnan(_1176));
    float _408 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1178.xy, uint(rint(_1178.z)), _284);
    float3 _1185 = float3(_298, _336, float(0));
    float3 _1187 = select(_1185, float3(0.0), isnan(_1185));
    float _410 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1187.xy, uint(rint(_1187.z)), _284);
    float2 _1193 = float2(_400, _402);
    float _412 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1193, float2(0.0), isnan(_1193))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1193, float2(0.0), isnan(_1193))).x;
    float _414 = _204 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _416 = _384 + _376;
    float _418 = fma(_206, (*spvDescriptorSet0.fp_c3)._m0[14].x, _414);
    float _420 = -_388;
    float _422 = fma(_420, _388, _390);
    float _424 = _416 + _378;
    float _426 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[14].z, _418);
    float _428 = _424 + _380;
    float _430 = _426 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _432 = _428 + _382;
    float _434 = precise::min(_430, 1.0);
    float _436 = -_388;
    float _438 = _434 + _436;
    float _440 = -_202;
    float _442 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _444 = _440 + _442;
    float _446 = fma(_438, _438, _422);
    bool _450 = _438 <= 0.001000000047497451305389404296875;
    float _452 = float(_450);
    float _454 = _444 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _456 = precise::clamp(_454, 0.0, 1.0);
    float _458 = 1.0 / _446;
    float _460 = _422 * _458;
    float _462 = precise::max(_460, _452);
    float _464 = precise::min(_462, 1.0);
    float _466 = _432 + _404;
    float _468 = _466 + _406;
    float _470 = _468 + _408;
    float _472 = -_202;
    float _474 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _476 = _472 + _474;
    float _478 = _470 + _410;
    float _480 = _476 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _482 = precise::clamp(_480, 0.0, 1.0);
    float _484 = fma(_478, 0.0625, _456);
    float _486 = _482 + _464;
    out.m_47.x = _412;
    out.m_47.y = _484;
    out.m_47.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_47.w = _486;
    return out;
}


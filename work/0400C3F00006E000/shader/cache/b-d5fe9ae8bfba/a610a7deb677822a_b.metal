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
    texture2d_array<float> fp_t_tcb_C [[id(3)]];
    sampler fp_t_tcb_CSmplr [[id(4)]];
    texture2d<float> fp_t_tcb_E [[id(5)]];
    sampler fp_t_tcb_ESmplr [[id(6)]];
    texture2d<float> fp_t_tcb_A [[id(7)]];
    sampler fp_t_tcb_ASmplr [[id(8)]];
    sampler fp_t_tcb_8Smplr_w [[id(9)]];
    sampler fp_t_tcb_ESmplr_w [[id(10)]];
    sampler fp_t_tcb_ASmplr_w [[id(11)]];
    constant dm_border_t* dm_border [[id(12)]];
};

struct main0_out
{
    float4 m_45 [[color(0)]];
};

struct main0_in
{
    float4 m_38 [[user(locn0), center_no_perspective]];
    float4 m_42 [[user(locn1), center_no_perspective]];
    float4 m_40 [[user(locn2), center_no_perspective]];
    float4 m_36 [[user(locn3), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _52 = in.m_36.x;
    float _54 = in.m_36.y;
    float2 _477 = float2(_52, _54);
    float3 _58 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_477, float2(0.0), isnan(_477)), int2(0), component::x).xyw;
    float _60 = _58.x;
    float _62 = _58.y;
    float _64 = _58.z;
    float2 _494 = float2(_52, _54);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_494, float2(0.0), isnan(_494))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_494, float2(0.0), isnan(_494))).x;
    float _68 = in.m_38.y;
    float _70 = in.m_38.x;
    float _72 = in.m_40.y;
    float _74 = in.m_42.y;
    float _76 = in.m_40.x;
    float _78 = in.m_42.x;
    float _80 = -_60;
    float _82 = fma(_80, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _84 = -_62;
    float _86 = fma(_84, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _88 = -_64;
    float _90 = fma(_88, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _92 = 1.0 / _82;
    float _94 = 1.0 / _86;
    float _96 = 1.0 / _90;
    float _98 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _100 = _92 * _98;
    float _102 = _68 * _100;
    float _104 = _70 * _100;
    float _106 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _108 = _94 * _106;
    float _110 = -_102;
    float _112 = fma(_108, _72, _110);
    float _114 = -_104;
    float _116 = fma(_108, _76, _114);
    float _118 = -_100;
    float _120 = _118 + _108;
    float _122 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _124 = _96 * _122;
    float _126 = _112 * _112;
    float _128 = -_102;
    float _130 = fma(_124, _74, _128);
    float _132 = -_104;
    float _134 = fma(_124, _78, _132);
    float _136 = fma(_116, _116, _126);
    float _138 = -_100;
    float _140 = _138 + _124;
    float _142 = _130 * _130;
    float _144 = fma(_120, _120, _136);
    float _146 = fma(_134, _134, _142);
    float _148 = fma(_140, _140, _146);
    float _150 = rsqrt(_144);
    float _152 = rsqrt(_148);
    float _154 = _116 * _150;
    float _156 = _120 * _150;
    float _158 = _112 * _150;
    float _160 = _140 * _152;
    float _162 = _130 * _152;
    float _164 = _134 * _152;
    float _166 = _154 * _160;
    float _168 = _156 * _162;
    float _170 = -_166;
    float _172 = fma(_156, _164, _170);
    float _174 = -_168;
    float _176 = fma(_158, _160, _174);
    float _178 = _158 * _164;
    float _180 = -_66;
    float _182 = fma(_180, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _184 = _172 * _172;
    float _186 = -_178;
    float _188 = fma(_154, _162, _186);
    float _190 = fma(_176, _176, _184);
    float _192 = fma(_188, _188, _190);
    float _194 = rsqrt(_192);
    float _196 = _172 * _194;
    float _198 = _176 * _194;
    float _200 = _188 * _194;
    float _202 = _196 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _204 = fma(_198, (*spvDescriptorSet0.fp_c3)._m0[35].x, _202);
    float _206 = fma(_200, (*spvDescriptorSet0.fp_c3)._m0[35].z, _204);
    float _208 = abs(_206);
    float _210 = -_208;
    float _212 = _210 + 1.0;
    float _214 = precise::clamp(_212, 0.0, 1.0);
    float _216 = 1.0 / _182;
    float _218 = abs(_214);
    float _220 = log2(_218);
    float _222 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _224 = _216 * _222;
    float _226 = _224 * _68;
    float _228 = _224 * _70;
    float _230 = _220 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _232 = exp2(_230);
    float _234 = _232 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _236 = fma(_196, _234, _226);
    float _238 = fma(_198, _234, _228);
    float _240 = fma(_200, _234, _224);
    float _242 = _236 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _244 = _236 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _246 = fma(_238, (*spvDescriptorSet0.fp_c3)._m0[3].x, _242);
    float _248 = _236 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _250 = _236 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _252 = fma(_240, (*spvDescriptorSet0.fp_c3)._m0[3].z, _246);
    float _254 = fma(_238, (*spvDescriptorSet0.fp_c3)._m0[0].x, _248);
    float _256 = _252 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _258 = fma(_238, (*spvDescriptorSet0.fp_c3)._m0[2].x, _244);
    float _260 = fma(_238, (*spvDescriptorSet0.fp_c3)._m0[1].x, _250);
    float _262 = fma(_240, (*spvDescriptorSet0.fp_c3)._m0[0].z, _254);
    float _264 = fma(_240, (*spvDescriptorSet0.fp_c3)._m0[2].z, _258);
    float _266 = 1.0 / _256;
    float _268 = fma(_240, (*spvDescriptorSet0.fp_c3)._m0[1].z, _260);
    float _270 = _262 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _272 = _264 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _274 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _276 = _268 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _278 = _272 * _266;
    float _280 = precise::clamp(_278, 0.0, 1.0);
    float _282 = _270 * _266;
    float _284 = _276 * _266;
    float _286 = _280 * _274;
    float _288 = fma(_286, 1.5, _282);
    float _290 = fma(_286, 0.5, _282);
    float _292 = fma(_286, -0.5, _282);
    float _294 = fma(_286, -1.5, _282);
    float _296 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _298 = _280 * _296;
    float _300 = fma(_298, 0.5, _284);
    float _302 = fma(_298, 1.5, _284);
    float3 _891 = float3(_288, _302, float(0));
    float3 _895 = select(_891, float3(0.0), isnan(_891));
    float _304 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _895.xy, uint(rint(_895.z)), _280);
    float3 _902 = float3(_290, _302, float(0));
    float3 _904 = select(_902, float3(0.0), isnan(_902));
    float _306 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _904.xy, uint(rint(_904.z)), _280);
    float3 _911 = float3(_292, _302, float(0));
    float3 _913 = select(_911, float3(0.0), isnan(_911));
    float _308 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _913.xy, uint(rint(_913.z)), _280);
    float3 _920 = float3(_294, _302, float(0));
    float3 _922 = select(_920, float3(0.0), isnan(_920));
    float _310 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _922.xy, uint(rint(_922.z)), _280);
    float3 _929 = float3(_288, _300, float(0));
    float3 _931 = select(_929, float3(0.0), isnan(_929));
    float _312 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _931.xy, uint(rint(_931.z)), _280);
    float3 _938 = float3(_290, _300, float(0));
    float3 _940 = select(_938, float3(0.0), isnan(_938));
    float _314 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _940.xy, uint(rint(_940.z)), _280);
    float3 _947 = float3(_292, _300, float(0));
    float3 _949 = select(_947, float3(0.0), isnan(_947));
    float _316 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _949.xy, uint(rint(_949.z)), _280);
    float3 _956 = float3(_294, _300, float(0));
    float3 _958 = select(_956, float3(0.0), isnan(_956));
    float _318 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _958.xy, uint(rint(_958.z)), _280);
    float _320 = _226 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _322 = fma(_298, -1.5, _284);
    float _324 = fma(_298, -0.5, _284);
    float _326 = _226 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _328 = _226 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _330 = fma(_228, (*spvDescriptorSet0.fp_c3)._m0[13].x, _320);
    float _332 = fma(_228, (*spvDescriptorSet0.fp_c3)._m0[15].x, _326);
    float _334 = fma(_228, (*spvDescriptorSet0.fp_c3)._m0[12].x, _328);
    float _336 = fma(_224, (*spvDescriptorSet0.fp_c3)._m0[13].z, _330);
    float _338 = fma(_224, (*spvDescriptorSet0.fp_c3)._m0[15].z, _332);
    float _340 = fma(_224, (*spvDescriptorSet0.fp_c3)._m0[12].z, _334);
    float _342 = _336 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _344 = _338 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _346 = _340 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _348 = 1.0 / _344;
    float3 _1030 = float3(_288, _324, float(0));
    float3 _1032 = select(_1030, float3(0.0), isnan(_1030));
    float _350 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1032.xy, uint(rint(_1032.z)), _280);
    float3 _1039 = float3(_290, _324, float(0));
    float3 _1041 = select(_1039, float3(0.0), isnan(_1039));
    float _352 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1041.xy, uint(rint(_1041.z)), _280);
    float3 _1048 = float3(_292, _324, float(0));
    float3 _1050 = select(_1048, float3(0.0), isnan(_1048));
    float _354 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1050.xy, uint(rint(_1050.z)), _280);
    float3 _1057 = float3(_294, _324, float(0));
    float3 _1059 = select(_1057, float3(0.0), isnan(_1057));
    float _356 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1059.xy, uint(rint(_1059.z)), _280);
    float _358 = _346 * _348;
    float _360 = _342 * _348;
    float2 _1071 = float2(_358, _360);
    float2 _364 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_1071, float2(0.0), isnan(_1071))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_1071, float2(0.0), isnan(_1071))).xy;
    float _366 = _364.x;
    float _368 = _364.y;
    float3 _1084 = float3(_288, _322, float(0));
    float3 _1086 = select(_1084, float3(0.0), isnan(_1084));
    float _370 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1086.xy, uint(rint(_1086.z)), _280);
    float3 _1093 = float3(_290, _322, float(0));
    float3 _1095 = select(_1093, float3(0.0), isnan(_1093));
    float _372 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1095.xy, uint(rint(_1095.z)), _280);
    float3 _1102 = float3(_292, _322, float(0));
    float3 _1104 = select(_1102, float3(0.0), isnan(_1102));
    float _374 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1104.xy, uint(rint(_1104.z)), _280);
    float3 _1111 = float3(_294, _322, float(0));
    float3 _1113 = select(_1111, float3(0.0), isnan(_1111));
    float _376 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1113.xy, uint(rint(_1113.z)), _280);
    float2 _1119 = float2(_52, _54);
    float _378 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1119, float2(0.0), isnan(_1119))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1119, float2(0.0), isnan(_1119))).x;
    float _380 = _226 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _382 = fma(_228, (*spvDescriptorSet0.fp_c3)._m0[14].x, _380);
    float _384 = fma(_224, (*spvDescriptorSet0.fp_c3)._m0[14].z, _382);
    float _386 = _384 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _388 = precise::min(_386, 1.0);
    float _390 = -_224;
    float _392 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _394 = _390 + _392;
    float _396 = _394 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _398 = precise::clamp(_396, 0.0, 1.0);
    float _400 = _304 + _306;
    float _402 = _400 + _308;
    float _404 = _402 + _310;
    float _406 = _404 + _312;
    float _408 = _406 + _314;
    float _410 = _408 + _316;
    float _412 = _410 + _318;
    float _414 = _412 + _350;
    float _416 = _414 + _352;
    float _418 = _416 + _354;
    float _420 = _418 + _356;
    float _422 = -_366;
    float _424 = fma(_422, _366, _368);
    float _426 = -_366;
    float _428 = _388 + _426;
    float _430 = _420 + _370;
    float _432 = fma(_428, _428, _424);
    float _434 = _430 + _372;
    bool _438 = _428 <= 0.001000000047497451305389404296875;
    float _440 = float(_438);
    float _442 = _434 + _374;
    float _444 = 1.0 / _432;
    float _446 = -_224;
    float _448 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _450 = _446 + _448;
    float _452 = _442 + _376;
    float _454 = _450 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _456 = precise::clamp(_454, 0.0, 1.0);
    float _458 = fma(_452, 0.0625, _398);
    float _460 = _424 * _444;
    float _462 = precise::max(_460, _440);
    float _464 = precise::min(_462, 1.0);
    float _466 = _456 + _464;
    out.m_45.x = _378;
    out.m_45.y = _458;
    out.m_45.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_45.w = _466;
    return out;
}


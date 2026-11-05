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
    texture2d<float> fp_t_tcb_A [[id(7)]];
    sampler fp_t_tcb_ASmplr [[id(8)]];
    sampler fp_t_tcb_8Smplr_w [[id(9)]];
    sampler fp_t_tcb_CSmplr_w [[id(10)]];
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
    float2 _425 = float2(_52, _54);
    float3 _58 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_425, float2(0.0), isnan(_425)), int2(0), component::x).xyw;
    float _60 = _58.x;
    float _62 = _58.y;
    float _64 = _58.z;
    float2 _443 = float2(_52, _54);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_443, float2(0.0), isnan(_443))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_443, float2(0.0), isnan(_443))).x;
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
    float _160 = -_66;
    float _162 = fma(_160, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _164 = _140 * _152;
    float _166 = _130 * _152;
    float _168 = _134 * _152;
    float _170 = 1.0 / _162;
    float _172 = _154 * _164;
    float _174 = _156 * _166;
    float _176 = -_172;
    float _178 = fma(_156, _168, _176);
    float _180 = -_174;
    float _182 = fma(_158, _164, _180);
    float _184 = _158 * _168;
    float _186 = _178 * _178;
    float _188 = -_184;
    float _190 = fma(_154, _166, _188);
    float _192 = fma(_182, _182, _186);
    float _194 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _196 = _170 * _194;
    float _198 = fma(_190, _190, _192);
    float _200 = rsqrt(_198);
    float _202 = _178 * _200;
    float _204 = _182 * _200;
    float _206 = _190 * _200;
    float _208 = _202 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _210 = fma(_204, (*spvDescriptorSet0.fp_c3)._m0[35].x, _208);
    float _212 = fma(_206, (*spvDescriptorSet0.fp_c3)._m0[35].z, _210);
    float _214 = abs(_212);
    float _216 = -_214;
    float _218 = _216 + 1.0;
    float _220 = precise::clamp(_218, 0.0, 1.0);
    float _222 = abs(_220);
    float _224 = log2(_222);
    float _226 = _224 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _228 = exp2(_226);
    float _230 = _228 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _232 = _202 * _230;
    float _234 = _204 * _230;
    float _236 = fma(_206, _230, _196);
    float _238 = fma(_196, _68, _232);
    float _240 = fma(_196, _70, _234);
    float _242 = _238 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _244 = _238 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _246 = fma(_240, (*spvDescriptorSet0.fp_c3)._m0[3].x, _242);
    float _248 = _238 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _250 = fma(_240, (*spvDescriptorSet0.fp_c3)._m0[2].x, _244);
    float _252 = _238 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _254 = fma(_236, (*spvDescriptorSet0.fp_c3)._m0[3].z, _246);
    float _256 = fma(_236, (*spvDescriptorSet0.fp_c3)._m0[2].z, _250);
    float _258 = _254 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _260 = fma(_240, (*spvDescriptorSet0.fp_c3)._m0[0].x, _248);
    float _262 = _256 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _264 = 1.0 / _258;
    float _266 = fma(_236, (*spvDescriptorSet0.fp_c3)._m0[0].z, _260);
    float _268 = fma(_240, (*spvDescriptorSet0.fp_c3)._m0[1].x, _252);
    float _270 = _266 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _272 = fma(_236, (*spvDescriptorSet0.fp_c3)._m0[1].z, _268);
    float _274 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _276 = _272 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _278 = _262 * _264;
    float _280 = precise::clamp(_278, 0.0, 1.0);
    float _282 = _270 * _264;
    float _284 = _276 * _264;
    float _286 = _280 * _274;
    float _288 = fma(_286, 1.5, _282);
    float _290 = fma(_286, 0.5, _282);
    float _292 = fma(_286, -0.5, _282);
    float _294 = fma(_286, -1.5, _282);
    float _296 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _298 = _280 * _296;
    float _300 = fma(_298, 1.5, _284);
    float _302 = fma(_298, 0.5, _284);
    float3 _840 = float3(_288, _300, float(0));
    float3 _844 = select(_840, float3(0.0), isnan(_840));
    float _304 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _844.xy, uint(rint(_844.z)), _280);
    float3 _851 = float3(_290, _300, float(0));
    float3 _853 = select(_851, float3(0.0), isnan(_851));
    float _306 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _853.xy, uint(rint(_853.z)), _280);
    float3 _860 = float3(_292, _300, float(0));
    float3 _862 = select(_860, float3(0.0), isnan(_860));
    float _308 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _862.xy, uint(rint(_862.z)), _280);
    float3 _869 = float3(_294, _300, float(0));
    float3 _871 = select(_869, float3(0.0), isnan(_869));
    float _310 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _871.xy, uint(rint(_871.z)), _280);
    float3 _878 = float3(_288, _302, float(0));
    float3 _880 = select(_878, float3(0.0), isnan(_878));
    float _312 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _880.xy, uint(rint(_880.z)), _280);
    float3 _887 = float3(_290, _302, float(0));
    float3 _889 = select(_887, float3(0.0), isnan(_887));
    float _314 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _889.xy, uint(rint(_889.z)), _280);
    float _316 = fma(_298, -0.5, _284);
    float _318 = fma(_298, -1.5, _284);
    float3 _902 = float3(_292, _302, float(0));
    float3 _904 = select(_902, float3(0.0), isnan(_902));
    float _320 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _904.xy, uint(rint(_904.z)), _280);
    float2 _910 = float2(_52, _54);
    float2 _324 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_910, float2(0.0), isnan(_910))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_910, float2(0.0), isnan(_910))).xy;
    float _326 = _324.x;
    float _328 = _324.y;
    float _330 = _304 + _306;
    float _332 = _330 + _308;
    float _334 = _332 + _310;
    float _336 = _334 + _312;
    float3 _935 = float3(_294, _302, float(0));
    float3 _937 = select(_935, float3(0.0), isnan(_935));
    float _338 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _937.xy, uint(rint(_937.z)), _280);
    float3 _944 = float3(_288, _316, float(0));
    float3 _946 = select(_944, float3(0.0), isnan(_944));
    float _340 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _946.xy, uint(rint(_946.z)), _280);
    float3 _953 = float3(_290, _316, float(0));
    float3 _955 = select(_953, float3(0.0), isnan(_953));
    float _342 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _955.xy, uint(rint(_955.z)), _280);
    float3 _962 = float3(_292, _316, float(0));
    float3 _964 = select(_962, float3(0.0), isnan(_962));
    float _344 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _964.xy, uint(rint(_964.z)), _280);
    float _346 = _336 + _314;
    float _348 = fma(_326, 2.0, -1.0);
    float _350 = fma(_328, 2.0, -1.0);
    float _352 = _346 + _320;
    float _354 = _348 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _356 = _350 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _358 = fma(_356, 2.0, _54);
    float3 _995 = float3(_294, _316, float(0));
    float3 _997 = select(_995, float3(0.0), isnan(_995));
    float _360 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _997.xy, uint(rint(_997.z)), _280);
    float _362 = fma(_354, 2.0, _52);
    float3 _1007 = float3(_288, _318, float(0));
    float3 _1009 = select(_1007, float3(0.0), isnan(_1007));
    float _364 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1009.xy, uint(rint(_1009.z)), _280);
    float3 _1016 = float3(_290, _318, float(0));
    float3 _1018 = select(_1016, float3(0.0), isnan(_1016));
    float _366 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1018.xy, uint(rint(_1018.z)), _280);
    float3 _1025 = float3(_292, _318, float(0));
    float3 _1027 = select(_1025, float3(0.0), isnan(_1025));
    float _368 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1027.xy, uint(rint(_1027.z)), _280);
    float _370 = _352 + _338;
    float3 _1037 = float3(_294, _318, float(0));
    float3 _1039 = select(_1037, float3(0.0), isnan(_1037));
    float _372 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1039.xy, uint(rint(_1039.z)), _280);
    float2 _1045 = float2(_362, _358);
    float _374 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1045, float2(0.0), isnan(_1045))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1045, float2(0.0), isnan(_1045))).x;
    float _376 = _370 + _340;
    float _378 = _376 + _342;
    float _380 = _378 + _344;
    float _382 = _380 + _360;
    float _384 = -_196;
    float _386 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _388 = _384 + _386;
    float _390 = _382 + _364;
    float _392 = -_196;
    float _394 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _396 = _392 + _394;
    float _398 = _388 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _400 = precise::clamp(_398, 0.0, 1.0);
    float _402 = _390 + _366;
    float _404 = _396 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _406 = precise::clamp(_404, 0.0, 1.0);
    float _408 = fma(_228, (*spvDescriptorSet0.fp_c3)._m0[48].w, _400);
    float _410 = _402 + _368;
    float _412 = _410 + _372;
    float _414 = fma(_412, 0.0625, _406);
    out.m_45.x = _374;
    out.m_45.y = _414;
    out.m_45.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_45.w = _408;
    return out;
}


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
    texture2d_array<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    sampler fp_t_tcb_8Smplr_w [[id(5)]];
    constant dm_border_t* dm_border [[id(6)]];
};

struct main0_out
{
    float4 m_41 [[color(0)]];
};

struct main0_in
{
    float4 m_34 [[user(locn0), center_no_perspective]];
    float4 m_38 [[user(locn1), center_no_perspective]];
    float4 m_36 [[user(locn2), center_no_perspective]];
    float4 m_32 [[user(locn3), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _48 = in.m_32.x;
    float _50 = in.m_32.y;
    float2 _400 = float2(_48, _50);
    float3 _54 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_400, float2(0.0), isnan(_400)), int2(0), component::x).xyw;
    float _56 = _54.x;
    float _58 = _54.y;
    float _60 = _54.z;
    float2 _418 = float2(_48, _50);
    float _62 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_418, float2(0.0), isnan(_418))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_418, float2(0.0), isnan(_418))).x;
    float _64 = in.m_34.y;
    float _66 = in.m_34.x;
    float _68 = in.m_36.y;
    float _70 = in.m_38.y;
    float _72 = in.m_36.x;
    float _74 = in.m_38.x;
    float _76 = -_56;
    float _78 = fma(_76, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _80 = -_60;
    float _82 = fma(_80, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _84 = -_58;
    float _86 = fma(_84, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _88 = 1.0 / _78;
    float _90 = 1.0 / _86;
    float _92 = -_62;
    float _94 = fma(_92, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _96 = 1.0 / _82;
    float _98 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _100 = _88 * _98;
    float _102 = _64 * _100;
    float _104 = _66 * _100;
    float _106 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _108 = _90 * _106;
    float _110 = 1.0 / _94;
    float _112 = -_102;
    float _114 = fma(_108, _68, _112);
    float _116 = -_104;
    float _118 = fma(_108, _72, _116);
    float _120 = -_100;
    float _122 = _120 + _108;
    float _124 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _126 = _96 * _124;
    float _128 = _114 * _114;
    float _130 = -_102;
    float _132 = fma(_126, _70, _130);
    float _134 = -_104;
    float _136 = fma(_126, _74, _134);
    float _138 = fma(_118, _118, _128);
    float _140 = -_100;
    float _142 = _140 + _126;
    float _144 = _132 * _132;
    float _146 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _148 = _110 * _146;
    float _150 = fma(_122, _122, _138);
    float _152 = fma(_136, _136, _144);
    float _154 = fma(_142, _142, _152);
    float _156 = rsqrt(_150);
    float _158 = rsqrt(_154);
    float _160 = _118 * _156;
    float _162 = _122 * _156;
    float _164 = _114 * _156;
    float _166 = _142 * _158;
    float _168 = _132 * _158;
    float _170 = _136 * _158;
    float _172 = _160 * _166;
    float _174 = _162 * _168;
    float _176 = -_172;
    float _178 = fma(_162, _170, _176);
    float _180 = -_174;
    float _182 = fma(_164, _166, _180);
    float _184 = _164 * _170;
    float _186 = _178 * _178;
    float _188 = -_184;
    float _190 = fma(_160, _168, _188);
    float _192 = fma(_182, _182, _186);
    float _194 = fma(_190, _190, _192);
    float _196 = rsqrt(_194);
    float _198 = _178 * _196;
    float _200 = _182 * _196;
    float _202 = _190 * _196;
    float _204 = _198 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _206 = fma(_200, (*spvDescriptorSet0.fp_c3)._m0[35].x, _204);
    float _208 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[35].z, _206);
    float _210 = abs(_208);
    float _212 = -_210;
    float _214 = _212 + 1.0;
    float _216 = precise::clamp(_214, 0.0, 1.0);
    float _218 = abs(_216);
    float _220 = log2(_218);
    float _222 = _220 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _224 = exp2(_222);
    float _226 = _224 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _228 = _198 * _226;
    float _230 = _200 * _226;
    float _232 = fma(_202, _226, _148);
    float _234 = fma(_148, _64, _228);
    float _236 = fma(_148, _66, _230);
    float _238 = _234 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _240 = _234 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _242 = fma(_236, (*spvDescriptorSet0.fp_c3)._m0[3].x, _238);
    float _244 = _234 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _246 = _234 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _248 = fma(_236, (*spvDescriptorSet0.fp_c3)._m0[1].x, _240);
    float _250 = fma(_232, (*spvDescriptorSet0.fp_c3)._m0[3].z, _242);
    float _252 = fma(_232, (*spvDescriptorSet0.fp_c3)._m0[1].z, _248);
    float _254 = _250 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _256 = fma(_236, (*spvDescriptorSet0.fp_c3)._m0[0].x, _244);
    float _258 = fma(_236, (*spvDescriptorSet0.fp_c3)._m0[2].x, _246);
    float _260 = _252 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _262 = fma(_232, (*spvDescriptorSet0.fp_c3)._m0[0].z, _256);
    float _264 = 1.0 / _254;
    float _266 = fma(_232, (*spvDescriptorSet0.fp_c3)._m0[2].z, _258);
    float _268 = _262 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _270 = _266 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _272 = _270 * _264;
    float _274 = precise::clamp(_272, 0.0, 1.0);
    float _276 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _278 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _280 = _260 * _264;
    float _282 = _268 * _264;
    float _284 = _274 * _276;
    float _286 = _274 * _278;
    float _288 = fma(_284, 1.5, _282);
    float _290 = fma(_284, 0.5, _282);
    float _292 = fma(_286, 0.5, _280);
    float _294 = fma(_286, 1.5, _280);
    float3 _807 = float3(_288, _294, float(0));
    float3 _811 = select(_807, float3(0.0), isnan(_807));
    float _296 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _811.xy, uint(rint(_811.z)), _274);
    float3 _818 = float3(_290, _294, float(0));
    float3 _820 = select(_818, float3(0.0), isnan(_818));
    float _298 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _820.xy, uint(rint(_820.z)), _274);
    float3 _827 = float3(_288, _292, float(0));
    float3 _829 = select(_827, float3(0.0), isnan(_827));
    float _300 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _829.xy, uint(rint(_829.z)), _274);
    float3 _836 = float3(_290, _292, float(0));
    float3 _838 = select(_836, float3(0.0), isnan(_836));
    float _302 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _838.xy, uint(rint(_838.z)), _274);
    float _304 = fma(_284, -0.5, _282);
    float _306 = fma(_284, -1.5, _282);
    float3 _853 = float3(_304, _294, float(0));
    float3 _855 = select(_853, float3(0.0), isnan(_853));
    float _308 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _855.xy, uint(rint(_855.z)), _274);
    float3 _862 = float3(_306, _294, float(0));
    float3 _864 = select(_862, float3(0.0), isnan(_862));
    float _310 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _864.xy, uint(rint(_864.z)), _274);
    float3 _871 = float3(_304, _292, float(0));
    float3 _873 = select(_871, float3(0.0), isnan(_871));
    float _312 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _873.xy, uint(rint(_873.z)), _274);
    float _314 = fma(_286, -0.5, _280);
    float3 _883 = float3(_306, _292, float(0));
    float3 _885 = select(_883, float3(0.0), isnan(_883));
    float _316 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _885.xy, uint(rint(_885.z)), _274);
    float3 _892 = float3(_288, _314, float(0));
    float3 _894 = select(_892, float3(0.0), isnan(_892));
    float _318 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _894.xy, uint(rint(_894.z)), _274);
    float3 _901 = float3(_290, _314, float(0));
    float3 _903 = select(_901, float3(0.0), isnan(_901));
    float _320 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _903.xy, uint(rint(_903.z)), _274);
    float _322 = fma(_286, -1.5, _280);
    float3 _913 = float3(_304, _314, float(0));
    float3 _915 = select(_913, float3(0.0), isnan(_913));
    float _324 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _915.xy, uint(rint(_915.z)), _274);
    float3 _922 = float3(_306, _314, float(0));
    float3 _924 = select(_922, float3(0.0), isnan(_922));
    float _326 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _924.xy, uint(rint(_924.z)), _274);
    float3 _931 = float3(_288, _322, float(0));
    float3 _933 = select(_931, float3(0.0), isnan(_931));
    float _328 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _933.xy, uint(rint(_933.z)), _274);
    float3 _940 = float3(_290, _322, float(0));
    float3 _942 = select(_940, float3(0.0), isnan(_940));
    float _330 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _942.xy, uint(rint(_942.z)), _274);
    float3 _949 = float3(_304, _322, float(0));
    float3 _951 = select(_949, float3(0.0), isnan(_949));
    float _332 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _951.xy, uint(rint(_951.z)), _274);
    float3 _958 = float3(_306, _322, float(0));
    float3 _960 = select(_958, float3(0.0), isnan(_958));
    float _334 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _960.xy, uint(rint(_960.z)), _274);
    float _336 = _296 + _298;
    float _338 = -_148;
    float _340 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _342 = _338 + _340;
    float _344 = _336 + _308;
    float _346 = _344 + _310;
    float _348 = -_148;
    float _350 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _352 = _348 + _350;
    float _354 = _342 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _356 = precise::clamp(_354, 0.0, 1.0);
    float _358 = _346 + _300;
    float _360 = _352 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _362 = precise::clamp(_360, 0.0, 1.0);
    float _364 = fma(_224, (*spvDescriptorSet0.fp_c3)._m0[48].w, _356);
    float _366 = _358 + _302;
    float _368 = _366 + _312;
    float _370 = _368 + _316;
    float _372 = _370 + _318;
    float _374 = _372 + _320;
    float _376 = _374 + _324;
    float _378 = _376 + _326;
    float _380 = _378 + _328;
    float _382 = _380 + _330;
    float _384 = _382 + _332;
    float _386 = _384 + _334;
    float _388 = fma(_386, 0.0625, _362);
    out.m_41.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_41.y = _388;
    out.m_41.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_41.w = _364;
    return out;
}


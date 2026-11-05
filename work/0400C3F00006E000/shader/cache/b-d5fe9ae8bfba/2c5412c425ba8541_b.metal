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
    texture2d<float> fp_t_tcb_C [[id(5)]];
    sampler fp_t_tcb_CSmplr [[id(6)]];
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
    float2 _457 = float2(_50, _52);
    float3 _56 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_457, float2(0.0), isnan(_457)), int2(0), component::x).xyw;
    float _58 = _56.x;
    float _60 = _56.y;
    float _62 = _56.z;
    float2 _474 = float2(_50, _52);
    float _64 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_474, float2(0.0), isnan(_474))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_474, float2(0.0), isnan(_474))).x;
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
    float _138 = _104 * _68;
    float _140 = fma(_128, _128, _134);
    float _142 = fma(_132, _132, _136);
    float _144 = rsqrt(_140);
    float _146 = rsqrt(_142);
    float _148 = _116 * _144;
    float _150 = _128 * _144;
    float _152 = _108 * _144;
    float _154 = _132 * _146;
    float _156 = _112 * _146;
    float _158 = _120 * _146;
    float _160 = _148 * _154;
    float _162 = _150 * _156;
    float _164 = -_160;
    float _166 = fma(_150, _158, _164);
    float _168 = _152 * _158;
    float _170 = -_162;
    float _172 = fma(_152, _154, _170);
    float _174 = _166 * _166;
    float _176 = -_168;
    float _178 = fma(_148, _156, _176);
    float _180 = fma(_172, _172, _174);
    float _182 = fma(_178, _178, _180);
    float _184 = rsqrt(_182);
    float _186 = _166 * _184;
    float _188 = _172 * _184;
    float _190 = _178 * _184;
    float _192 = _186 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _194 = fma(_188, (*spvDescriptorSet0.fp_c3)._m0[35].x, _192);
    float _196 = fma(_190, (*spvDescriptorSet0.fp_c3)._m0[35].z, _194);
    float _198 = abs(_196);
    float _200 = -_198;
    float _202 = _200 + 1.0;
    float _204 = precise::clamp(_202, 0.0, 1.0);
    float _206 = _104 * _66;
    float _208 = abs(_204);
    float _210 = log2(_208);
    float _212 = _210 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _214 = exp2(_212);
    float _216 = _214 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _218 = fma(_186, _216, _206);
    float _220 = fma(_188, _216, _138);
    float _222 = fma(_190, _216, _104);
    float _224 = _218 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _226 = _218 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _228 = fma(_220, (*spvDescriptorSet0.fp_c3)._m0[3].x, _224);
    float _230 = _218 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _232 = fma(_220, (*spvDescriptorSet0.fp_c3)._m0[2].x, _226);
    float _234 = _218 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _236 = fma(_222, (*spvDescriptorSet0.fp_c3)._m0[3].z, _228);
    float _238 = fma(_222, (*spvDescriptorSet0.fp_c3)._m0[2].z, _232);
    float _240 = _236 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _242 = fma(_220, (*spvDescriptorSet0.fp_c3)._m0[0].x, _230);
    float _244 = _238 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _246 = fma(_220, (*spvDescriptorSet0.fp_c3)._m0[1].x, _234);
    float _248 = fma(_222, (*spvDescriptorSet0.fp_c3)._m0[0].z, _242);
    float _250 = 1.0 / _240;
    float _252 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _254 = fma(_222, (*spvDescriptorSet0.fp_c3)._m0[1].z, _246);
    float _256 = _248 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _258 = _254 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _260 = _244 * _250;
    float _262 = precise::clamp(_260, 0.0, 1.0);
    float _264 = _256 * _250;
    float _266 = _258 * _250;
    float _268 = _262 * _252;
    float _270 = fma(_268, 1.5, _264);
    float _272 = fma(_268, 0.5, _264);
    float _274 = fma(_268, -0.5, _264);
    float _276 = fma(_268, -1.5, _264);
    float _278 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _280 = _262 * _278;
    float _282 = fma(_280, 0.5, _266);
    float _284 = fma(_280, 1.5, _266);
    float3 _855 = float3(_270, _284, float(0));
    float3 _859 = select(_855, float3(0.0), isnan(_855));
    float _286 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _859.xy, uint(rint(_859.z)), _262);
    float3 _866 = float3(_272, _284, float(0));
    float3 _868 = select(_866, float3(0.0), isnan(_866));
    float _288 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _868.xy, uint(rint(_868.z)), _262);
    float3 _875 = float3(_274, _284, float(0));
    float3 _877 = select(_875, float3(0.0), isnan(_875));
    float _290 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _877.xy, uint(rint(_877.z)), _262);
    float3 _884 = float3(_276, _284, float(0));
    float3 _886 = select(_884, float3(0.0), isnan(_884));
    float _292 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _886.xy, uint(rint(_886.z)), _262);
    float3 _893 = float3(_270, _282, float(0));
    float3 _895 = select(_893, float3(0.0), isnan(_893));
    float _294 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _895.xy, uint(rint(_895.z)), _262);
    float3 _902 = float3(_272, _282, float(0));
    float3 _904 = select(_902, float3(0.0), isnan(_902));
    float _296 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _904.xy, uint(rint(_904.z)), _262);
    float _298 = _206 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _300 = _206 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _302 = _206 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _304 = fma(_280, -0.5, _266);
    float _306 = fma(_138, (*spvDescriptorSet0.fp_c3)._m0[15].x, _298);
    float _308 = fma(_280, -1.5, _266);
    float _310 = fma(_138, (*spvDescriptorSet0.fp_c3)._m0[13].x, _302);
    float _312 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[15].z, _306);
    float _314 = fma(_138, (*spvDescriptorSet0.fp_c3)._m0[12].x, _300);
    float _316 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[13].z, _310);
    float _318 = _312 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _320 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[12].z, _314);
    float _322 = _316 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _324 = _320 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _326 = 1.0 / _318;
    float3 _976 = float3(_274, _282, float(0));
    float3 _978 = select(_976, float3(0.0), isnan(_976));
    float _328 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _978.xy, uint(rint(_978.z)), _262);
    float3 _985 = float3(_276, _282, float(0));
    float3 _987 = select(_985, float3(0.0), isnan(_985));
    float _330 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _987.xy, uint(rint(_987.z)), _262);
    float3 _994 = float3(_270, _304, float(0));
    float3 _996 = select(_994, float3(0.0), isnan(_994));
    float _332 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _996.xy, uint(rint(_996.z)), _262);
    float3 _1003 = float3(_272, _304, float(0));
    float3 _1005 = select(_1003, float3(0.0), isnan(_1003));
    float _334 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1005.xy, uint(rint(_1005.z)), _262);
    float3 _1012 = float3(_274, _304, float(0));
    float3 _1014 = select(_1012, float3(0.0), isnan(_1012));
    float _336 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1014.xy, uint(rint(_1014.z)), _262);
    float _338 = _324 * _326;
    float _340 = _322 * _326;
    float2 _1026 = float2(_338, _340);
    float2 _344 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1026, float2(0.0), isnan(_1026))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1026, float2(0.0), isnan(_1026))).xy;
    float _346 = _344.x;
    float _348 = _344.y;
    float3 _1039 = float3(_276, _304, float(0));
    float3 _1041 = select(_1039, float3(0.0), isnan(_1039));
    float _350 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1041.xy, uint(rint(_1041.z)), _262);
    float3 _1048 = float3(_270, _308, float(0));
    float3 _1050 = select(_1048, float3(0.0), isnan(_1048));
    float _352 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1050.xy, uint(rint(_1050.z)), _262);
    float3 _1057 = float3(_272, _308, float(0));
    float3 _1059 = select(_1057, float3(0.0), isnan(_1057));
    float _354 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1059.xy, uint(rint(_1059.z)), _262);
    float3 _1066 = float3(_274, _308, float(0));
    float3 _1068 = select(_1066, float3(0.0), isnan(_1066));
    float _356 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1068.xy, uint(rint(_1068.z)), _262);
    float3 _1075 = float3(_276, _308, float(0));
    float3 _1077 = select(_1075, float3(0.0), isnan(_1075));
    float _358 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1077.xy, uint(rint(_1077.z)), _262);
    float _360 = _206 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _362 = fma(_138, (*spvDescriptorSet0.fp_c3)._m0[14].x, _360);
    float _364 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[14].z, _362);
    float _366 = _364 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _368 = precise::min(_366, 1.0);
    float _370 = _286 + _288;
    float _372 = -_104;
    float _374 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _376 = _372 + _374;
    float _378 = _370 + _290;
    float _380 = _376 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _382 = precise::clamp(_380, 0.0, 1.0);
    float _384 = _378 + _292;
    float _386 = _384 + _294;
    float _388 = _386 + _296;
    float _390 = _388 + _328;
    float _392 = _390 + _330;
    float _394 = _392 + _332;
    float _396 = _394 + _334;
    float _398 = _396 + _336;
    float _400 = -_346;
    float _402 = fma(_400, _346, _348);
    float _404 = -_346;
    float _406 = _368 + _404;
    float _408 = -_104;
    float _410 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _412 = _408 + _410;
    float _414 = fma(_406, _406, _402);
    float _416 = _398 + _350;
    bool _420 = _406 <= 0.001000000047497451305389404296875;
    float _422 = float(_420);
    float _424 = _412 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _426 = precise::clamp(_424, 0.0, 1.0);
    float _428 = 1.0 / _414;
    float _430 = _416 + _352;
    float _432 = _430 + _354;
    float _434 = _432 + _356;
    float _436 = _402 * _428;
    float _438 = precise::max(_436, _422);
    float _440 = _434 + _358;
    float _442 = precise::min(_438, 1.0);
    float _444 = fma(_440, 0.0625, _426);
    float _446 = _382 + _442;
    out.m_43.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_43.y = _444;
    out.m_43.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_43.w = _446;
    return out;
}


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
    float2 _473 = float2(_50, _52);
    float3 _56 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_473, float2(0.0), isnan(_473)), int2(0), component::x).xyw;
    float _58 = _56.x;
    float _60 = _56.y;
    float _62 = _56.z;
    float2 _490 = float2(_50, _52);
    float _64 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_490, float2(0.0), isnan(_490))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_490, float2(0.0), isnan(_490))).x;
    float _66 = in.m_36.y;
    float _68 = in.m_36.x;
    float _70 = in.m_38.y;
    float _72 = in.m_40.y;
    float _74 = in.m_38.x;
    float _76 = in.m_40.x;
    float _78 = -_58;
    float _80 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _82 = -_62;
    float _84 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _86 = -_60;
    float _88 = fma(_86, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _90 = 1.0 / _80;
    float _92 = 1.0 / _88;
    float _94 = -_64;
    float _96 = fma(_94, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _98 = 1.0 / _84;
    float _100 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _102 = _90 * _100;
    float _104 = _66 * _102;
    float _106 = _68 * _102;
    float _108 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _110 = _92 * _108;
    float _112 = 1.0 / _96;
    float _114 = -_104;
    float _116 = fma(_110, _70, _114);
    float _118 = -_106;
    float _120 = fma(_110, _74, _118);
    float _122 = -_102;
    float _124 = _122 + _110;
    float _126 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _128 = _98 * _126;
    float _130 = _116 * _116;
    float _132 = -_104;
    float _134 = fma(_128, _72, _132);
    float _136 = -_106;
    float _138 = fma(_128, _76, _136);
    float _140 = fma(_120, _120, _130);
    float _142 = -_102;
    float _144 = _142 + _128;
    float _146 = _134 * _134;
    float _148 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _150 = _112 * _148;
    float _152 = fma(_124, _124, _140);
    float _154 = fma(_138, _138, _146);
    float _156 = _150 * _68;
    float _158 = fma(_144, _144, _154);
    float _160 = rsqrt(_152);
    float _162 = rsqrt(_158);
    float _164 = _120 * _160;
    float _166 = _124 * _160;
    float _168 = _116 * _160;
    float _170 = _144 * _162;
    float _172 = _134 * _162;
    float _174 = _138 * _162;
    float _176 = _164 * _170;
    float _178 = _166 * _172;
    float _180 = -_176;
    float _182 = fma(_166, _174, _180);
    float _184 = -_178;
    float _186 = fma(_168, _170, _184);
    float _188 = _168 * _174;
    float _190 = _182 * _182;
    float _192 = -_188;
    float _194 = fma(_164, _172, _192);
    float _196 = fma(_186, _186, _190);
    float _198 = fma(_194, _194, _196);
    float _200 = rsqrt(_198);
    float _202 = _182 * _200;
    float _204 = _186 * _200;
    float _206 = _194 * _200;
    float _208 = _202 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _210 = fma(_204, (*spvDescriptorSet0.fp_c3)._m0[35].x, _208);
    float _212 = fma(_206, (*spvDescriptorSet0.fp_c3)._m0[35].z, _210);
    float _214 = abs(_212);
    float _216 = -_214;
    float _218 = _216 + 1.0;
    float _220 = precise::clamp(_218, 0.0, 1.0);
    float _222 = _150 * _66;
    float _224 = abs(_220);
    float _226 = log2(_224);
    float _228 = _226 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _230 = exp2(_228);
    float _232 = _230 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _234 = fma(_202, _232, _222);
    float _236 = fma(_204, _232, _156);
    float _238 = fma(_206, _232, _150);
    float _240 = _234 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _242 = _234 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _244 = fma(_236, (*spvDescriptorSet0.fp_c3)._m0[3].x, _240);
    float _246 = _234 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _248 = fma(_236, (*spvDescriptorSet0.fp_c3)._m0[2].x, _242);
    float _250 = _234 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _252 = fma(_238, (*spvDescriptorSet0.fp_c3)._m0[3].z, _244);
    float _254 = fma(_238, (*spvDescriptorSet0.fp_c3)._m0[2].z, _248);
    float _256 = _252 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _258 = fma(_236, (*spvDescriptorSet0.fp_c3)._m0[0].x, _246);
    float _260 = _254 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _262 = 1.0 / _256;
    float _264 = fma(_238, (*spvDescriptorSet0.fp_c3)._m0[0].z, _258);
    float _266 = fma(_236, (*spvDescriptorSet0.fp_c3)._m0[1].x, _250);
    float _268 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _270 = _264 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _272 = fma(_238, (*spvDescriptorSet0.fp_c3)._m0[1].z, _266);
    float _274 = _272 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _276 = _260 * _262;
    float _278 = precise::clamp(_276, 0.0, 1.0);
    float _280 = _270 * _262;
    float _282 = _274 * _262;
    float _284 = _278 * _268;
    float _286 = fma(_284, 1.5, _280);
    float _288 = fma(_284, 0.5, _280);
    float _290 = fma(_284, -0.5, _280);
    float _292 = fma(_284, -1.5, _280);
    float _294 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _296 = _278 * _294;
    float _298 = fma(_296, 0.5, _282);
    float _300 = fma(_296, 1.5, _282);
    float3 _887 = float3(_286, _300, float(0));
    float3 _891 = select(_887, float3(0.0), isnan(_887));
    float _302 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _891.xy, uint(rint(_891.z)), _278);
    float3 _898 = float3(_288, _300, float(0));
    float3 _900 = select(_898, float3(0.0), isnan(_898));
    float _304 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _900.xy, uint(rint(_900.z)), _278);
    float3 _907 = float3(_290, _300, float(0));
    float3 _909 = select(_907, float3(0.0), isnan(_907));
    float _306 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _909.xy, uint(rint(_909.z)), _278);
    float3 _916 = float3(_292, _300, float(0));
    float3 _918 = select(_916, float3(0.0), isnan(_916));
    float _308 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _918.xy, uint(rint(_918.z)), _278);
    float3 _925 = float3(_286, _298, float(0));
    float3 _927 = select(_925, float3(0.0), isnan(_925));
    float _310 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _927.xy, uint(rint(_927.z)), _278);
    float3 _934 = float3(_288, _298, float(0));
    float3 _936 = select(_934, float3(0.0), isnan(_934));
    float _312 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _936.xy, uint(rint(_936.z)), _278);
    float _314 = _222 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _316 = _222 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _318 = _222 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _320 = fma(_296, -0.5, _282);
    float _322 = fma(_156, (*spvDescriptorSet0.fp_c3)._m0[15].x, _314);
    float _324 = fma(_296, -1.5, _282);
    float _326 = fma(_156, (*spvDescriptorSet0.fp_c3)._m0[13].x, _318);
    float _328 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[15].z, _322);
    float _330 = fma(_156, (*spvDescriptorSet0.fp_c3)._m0[12].x, _316);
    float _332 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[13].z, _326);
    float _334 = _328 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _336 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[12].z, _330);
    float _338 = _332 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _340 = _336 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _342 = 1.0 / _334;
    float3 _1008 = float3(_290, _298, float(0));
    float3 _1010 = select(_1008, float3(0.0), isnan(_1008));
    float _344 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1010.xy, uint(rint(_1010.z)), _278);
    float3 _1017 = float3(_292, _298, float(0));
    float3 _1019 = select(_1017, float3(0.0), isnan(_1017));
    float _346 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1019.xy, uint(rint(_1019.z)), _278);
    float3 _1026 = float3(_286, _320, float(0));
    float3 _1028 = select(_1026, float3(0.0), isnan(_1026));
    float _348 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1028.xy, uint(rint(_1028.z)), _278);
    float3 _1035 = float3(_288, _320, float(0));
    float3 _1037 = select(_1035, float3(0.0), isnan(_1035));
    float _350 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1037.xy, uint(rint(_1037.z)), _278);
    float3 _1044 = float3(_290, _320, float(0));
    float3 _1046 = select(_1044, float3(0.0), isnan(_1044));
    float _352 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1046.xy, uint(rint(_1046.z)), _278);
    float _354 = _340 * _342;
    float _356 = _338 * _342;
    float2 _1058 = float2(_354, _356);
    float2 _360 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1058, float2(0.0), isnan(_1058))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1058, float2(0.0), isnan(_1058))).xy;
    float _362 = _360.x;
    float _364 = _360.y;
    float3 _1071 = float3(_292, _320, float(0));
    float3 _1073 = select(_1071, float3(0.0), isnan(_1071));
    float _366 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1073.xy, uint(rint(_1073.z)), _278);
    float3 _1080 = float3(_286, _324, float(0));
    float3 _1082 = select(_1080, float3(0.0), isnan(_1080));
    float _368 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1082.xy, uint(rint(_1082.z)), _278);
    float3 _1089 = float3(_288, _324, float(0));
    float3 _1091 = select(_1089, float3(0.0), isnan(_1089));
    float _370 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1091.xy, uint(rint(_1091.z)), _278);
    float3 _1098 = float3(_290, _324, float(0));
    float3 _1100 = select(_1098, float3(0.0), isnan(_1098));
    float _372 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1100.xy, uint(rint(_1100.z)), _278);
    float3 _1107 = float3(_292, _324, float(0));
    float3 _1109 = select(_1107, float3(0.0), isnan(_1107));
    float _374 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1109.xy, uint(rint(_1109.z)), _278);
    float _376 = _222 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _378 = fma(_156, (*spvDescriptorSet0.fp_c3)._m0[14].x, _376);
    float _380 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[14].z, _378);
    float _382 = _380 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _384 = precise::min(_382, 1.0);
    float _386 = _302 + _304;
    float _388 = -_150;
    float _390 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _392 = _388 + _390;
    float _394 = _386 + _306;
    float _396 = _392 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _398 = precise::clamp(_396, 0.0, 1.0);
    float _400 = _394 + _308;
    float _402 = _400 + _310;
    float _404 = _402 + _312;
    float _406 = _404 + _344;
    float _408 = _406 + _346;
    float _410 = _408 + _348;
    float _412 = _410 + _350;
    float _414 = _412 + _352;
    float _416 = -_362;
    float _418 = fma(_416, _362, _364);
    float _420 = -_362;
    float _422 = _384 + _420;
    float _424 = -_150;
    float _426 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _428 = _424 + _426;
    float _430 = fma(_422, _422, _418);
    float _432 = _414 + _366;
    bool _436 = _422 <= 0.001000000047497451305389404296875;
    float _438 = float(_436);
    float _440 = _428 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _442 = precise::clamp(_440, 0.0, 1.0);
    float _444 = 1.0 / _430;
    float _446 = _432 + _368;
    float _448 = _446 + _370;
    float _450 = _448 + _372;
    float _452 = _418 * _444;
    float _454 = precise::max(_452, _438);
    float _456 = _450 + _374;
    float _458 = precise::min(_454, 1.0);
    float _460 = fma(_456, 0.0625, _442);
    float _462 = _398 + _458;
    out.m_43.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_43.y = _460;
    out.m_43.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_43.w = _462;
    return out;
}


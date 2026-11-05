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

struct spvDescriptorSetBuffer0
{
    texture2d<float> fp_t_tcb_8 [[id(0)]];
    sampler fp_t_tcb_8Smplr [[id(1)]];
    sampler fp_t_tcb_8Smplr_w [[id(2)]];
    constant dm_border_t* dm_border [[id(3)]];
};

struct main0_out
{
    float4 m_30 [[color(0)]];
};

struct main0_in
{
    float4 m_25 [[user(locn0)]];
    float4 m_23 [[user(locn1)]];
    float4 m_27 [[user(locn2)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _37 = gl_FragCoord.w;
    float _39 = in.m_23.x;
    float _41 = gl_FragCoord.w;
    float _43 = _39 * _41;
    float _45 = in.m_25.x;
    float _47 = gl_FragCoord.w;
    float _49 = _45 * _47;
    float _51 = in.m_23.y;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = in.m_25.y;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = in.m_27.x;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = 1.0 / _37;
    float _71 = _69 * _43;
    float _73 = _69 * _49;
    float _75 = _69 * _55;
    float _77 = _69 * _61;
    float _79 = _69 * _67;
    float _81 = _71 + _73;
    float _83 = -_71;
    float _85 = _83 + _73;
    float _87 = _75 + _77;
    float _89 = -_75;
    float _91 = _89 + _77;
    float _93 = _73 + _79;
    float _95 = -_79;
    float _97 = _73 + _95;
    float2 _488 = float2(_81, _87);
    float4 _100 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_488, float2(0.0), isnan(_488))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_488, float2(0.0), isnan(_488))).xyzw;
    float _102 = _100.x;
    float _104 = _100.y;
    float _106 = _100.z;
    float _108 = _100.w;
    float2 _508 = float2(_81, _91);
    float4 _110 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_508, float2(0.0), isnan(_508))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_508, float2(0.0), isnan(_508))).xyzw;
    float _112 = _110.x;
    float _114 = _110.y;
    float _116 = _110.z;
    float _118 = _110.w;
    float2 _524 = float2(_85, _87);
    float4 _120 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_524, float2(0.0), isnan(_524))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_524, float2(0.0), isnan(_524))).xyzw;
    float _122 = _120.x;
    float _124 = _120.y;
    float _126 = _120.z;
    float _128 = _120.w;
    float2 _540 = float2(_85, _91);
    float4 _130 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_540, float2(0.0), isnan(_540))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_540, float2(0.0), isnan(_540))).xyzw;
    float _132 = _130.x;
    float _134 = _130.y;
    float _136 = _130.z;
    float _138 = _130.w;
    float2 _556 = float2(_93, _87);
    float4 _140 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_556, float2(0.0), isnan(_556))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_556, float2(0.0), isnan(_556))).xyzw;
    float _142 = _140.x;
    float _144 = _140.y;
    float _146 = _140.z;
    float _148 = _140.w;
    float2 _572 = float2(_93, _91);
    float4 _150 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_572, float2(0.0), isnan(_572))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_572, float2(0.0), isnan(_572))).xyzw;
    float _152 = _150.x;
    float _154 = _150.y;
    float _156 = _150.z;
    float _158 = _150.w;
    float2 _588 = float2(_97, _87);
    float4 _160 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_588, float2(0.0), isnan(_588))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_588, float2(0.0), isnan(_588))).xyzw;
    float _162 = _160.x;
    float _164 = _160.y;
    float _166 = _160.z;
    float _168 = _160.w;
    float _170 = in.m_27.y;
    float _172 = gl_FragCoord.w;
    float _174 = _170 * _172;
    float _176 = _69 * _174;
    float _178 = _77 + _176;
    float _180 = -_176;
    float _182 = _77 + _180;
    float _184 = _102 + _112;
    float _186 = _104 + _114;
    float _188 = _106 + _116;
    float _190 = _108 + _118;
    float _192 = _184 + _122;
    float _194 = _186 + _124;
    float _196 = _188 + _126;
    float _198 = _190 + _128;
    float _200 = _192 + _132;
    float _202 = _194 + _134;
    float _204 = _196 + _136;
    float _206 = _198 + _138;
    float _208 = _200 + _142;
    float _210 = _202 + _144;
    float _212 = _204 + _146;
    float _214 = _206 + _148;
    float2 _670 = float2(_97, _91);
    float4 _216 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_670, float2(0.0), isnan(_670))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_670, float2(0.0), isnan(_670))).xyzw;
    float _218 = _216.x;
    float _220 = _216.y;
    float _222 = _216.z;
    float _224 = _216.w;
    float2 _686 = float2(_81, _178);
    float4 _226 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_686, float2(0.0), isnan(_686))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_686, float2(0.0), isnan(_686))).xyzw;
    float _228 = _226.x;
    float _230 = _226.y;
    float _232 = _226.z;
    float _234 = _226.w;
    float2 _702 = float2(_81, _182);
    float4 _236 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_702, float2(0.0), isnan(_702))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_702, float2(0.0), isnan(_702))).xyzw;
    float _238 = _236.x;
    float _240 = _236.y;
    float _242 = _236.z;
    float _244 = _236.w;
    float _246 = _214 + _158;
    float _248 = _208 + _152;
    float2 _724 = float2(_85, _178);
    float4 _250 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_724, float2(0.0), isnan(_724))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_724, float2(0.0), isnan(_724))).xyzw;
    float _252 = _250.x;
    float _254 = _250.y;
    float _256 = _250.z;
    float _258 = _250.w;
    float2 _740 = float2(_85, _182);
    float4 _260 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_740, float2(0.0), isnan(_740))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_740, float2(0.0), isnan(_740))).xyzw;
    float _262 = _260.x;
    float _264 = _260.y;
    float _266 = _260.z;
    float _268 = _260.w;
    float _270 = _210 + _154;
    float _272 = _212 + _156;
    float _274 = _248 + _162;
    float2 _765 = float2(_93, _178);
    float4 _276 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_765, float2(0.0), isnan(_765))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_765, float2(0.0), isnan(_765))).xyzw;
    float _278 = _276.x;
    float _280 = _276.y;
    float _282 = _276.z;
    float _284 = _276.w;
    float2 _781 = float2(_93, _182);
    float4 _286 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_781, float2(0.0), isnan(_781))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_781, float2(0.0), isnan(_781))).xyzw;
    float _288 = _286.x;
    float _290 = _286.y;
    float _292 = _286.z;
    float _294 = _286.w;
    float2 _797 = float2(_97, _178);
    float4 _296 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_797, float2(0.0), isnan(_797))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_797, float2(0.0), isnan(_797))).xyzw;
    float _298 = _296.x;
    float _300 = _296.y;
    float _302 = _296.z;
    float _304 = _296.w;
    float2 _813 = float2(_97, _182);
    float4 _306 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_813, float2(0.0), isnan(_813))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_813, float2(0.0), isnan(_813))).xyzw;
    float _308 = _306.x;
    float _310 = _306.y;
    float _312 = _306.z;
    float _314 = _306.w;
    float _316 = _270 + _164;
    float _318 = _272 + _166;
    float _320 = _246 + _168;
    float _322 = _274 + _218;
    float _324 = _316 + _220;
    float _326 = _318 + _222;
    float _328 = _320 + _224;
    float _330 = _322 + _228;
    float _332 = _324 + _230;
    float _334 = _326 + _232;
    float _336 = _328 + _234;
    float _338 = _330 + _238;
    float _340 = _332 + _240;
    float _342 = _334 + _242;
    float _344 = _336 + _244;
    float _346 = _338 + _252;
    float _348 = _340 + _254;
    float _350 = _342 + _256;
    float _352 = _344 + _258;
    float _354 = _346 + _262;
    float _356 = _348 + _264;
    float _358 = _350 + _266;
    float _360 = _352 + _268;
    float _362 = _354 + _278;
    float _364 = _356 + _280;
    float _366 = _358 + _282;
    float _368 = _360 + _284;
    float _370 = _362 + _288;
    float _372 = _364 + _290;
    float _374 = _366 + _292;
    float _376 = _368 + _294;
    float _378 = _370 + _298;
    float _380 = _372 + _300;
    float _382 = _374 + _302;
    float _384 = _376 + _304;
    float _386 = _378 + _308;
    float _388 = _380 + _310;
    float _390 = _382 + _312;
    float _392 = _384 + _314;
    float _394 = _386 * 0.0625;
    float _396 = _388 * 0.0625;
    float _398 = _390 * 0.0625;
    float _400 = _392 * 0.0625;
    out.m_30.x = _394;
    out.m_30.y = _396;
    out.m_30.z = _398;
    out.m_30.w = _400;
    return out;
}


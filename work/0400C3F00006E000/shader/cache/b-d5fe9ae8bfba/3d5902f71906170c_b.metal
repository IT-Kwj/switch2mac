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

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _16* fp_c3 [[id(0)]];
    texture2d<float> fp_t_tcb_8 [[id(1)]];
    sampler fp_t_tcb_8Smplr [[id(2)]];
    sampler fp_t_tcb_8Smplr_w [[id(3)]];
    constant dm_border_t* dm_border [[id(4)]];
};

struct main0_out
{
    float4 m_32 [[color(0)]];
};

struct main0_in
{
    float4 m_29 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _39 = gl_FragCoord.w;
    float _41 = in.m_29.x;
    float _43 = gl_FragCoord.w;
    float _45 = _41 * _43;
    float _47 = in.m_29.y;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = 1.0 / _39;
    float _55 = _53 * _45;
    float _57 = _53 * _51;
    float _59 = _55 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _61 = _57 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _63 = floor(_59);
    float _65 = ceil(_61);
    float _67 = -_63;
    float _69 = _59 + _67;
    float _71 = ceil(_59);
    float _73 = _69 * _69;
    float _75 = _69 + (-2.0);
    float _77 = -_73;
    float _79 = _69 + _77;
    float _81 = fma(_73, _75, 1.0);
    float _83 = _65 + (-0.5);
    float _85 = fma(_69, _79, _69);
    float _87 = _83 * (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _89 = _85 + _81;
    float _91 = _71 + (-1.5);
    float _93 = _71 + 1.5;
    float _95 = 1.0 / _89;
    float _97 = _91 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _99 = _93 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _101 = fma(_85, _95, -0.5);
    float _103 = _65 + (-1.5);
    float _105 = _71 + _101;
    float _107 = _103 * (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _109 = _105 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float2 _518 = float2(_109, _107);
    float4 _112 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_518, float2(0.0), isnan(_518))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_518, float2(0.0), isnan(_518))).xyzw;
    float _114 = _112.x;
    float _116 = _112.y;
    float _118 = _112.z;
    float _120 = _112.w;
    float2 _538 = float2(_97, _107);
    float4 _122 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_538, float2(0.0), isnan(_538))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_538, float2(0.0), isnan(_538))).xyzw;
    float _124 = _122.x;
    float _126 = _122.y;
    float _128 = _122.z;
    float _130 = _122.w;
    float2 _554 = float2(_99, _107);
    float4 _132 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_554, float2(0.0), isnan(_554))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_554, float2(0.0), isnan(_554))).xyzw;
    float _134 = _132.x;
    float _136 = _132.y;
    float _138 = _132.z;
    float _140 = _132.w;
    float2 _570 = float2(_109, _87);
    float4 _142 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_570, float2(0.0), isnan(_570))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_570, float2(0.0), isnan(_570))).xyzw;
    float _144 = _142.x;
    float _146 = _142.y;
    float _148 = _142.z;
    float _150 = _142.w;
    float _152 = floor(_61);
    float _154 = -_69;
    float _156 = _154 + 2.0;
    float _158 = -_69;
    float _160 = _158 + _73;
    float _162 = -_69;
    float _164 = fma(_73, _156, _162);
    float _166 = _69 * _160;
    float _168 = -_152;
    float _170 = _61 + _168;
    float _172 = _170 * _170;
    float _174 = _170 + (-2.0);
    float _176 = -_170;
    float _178 = _176 + 2.0;
    float _180 = -_172;
    float _182 = _170 + _180;
    float _184 = -_170;
    float _186 = _184 + _172;
    float _188 = -_170;
    float _190 = fma(_172, _178, _188);
    float _192 = fma(_170, _182, _170);
    float _194 = _170 * _186;
    float _196 = _89 * _114;
    float _198 = fma(_172, _174, 1.0);
    float _200 = _89 * _118;
    float _202 = _89 * _116;
    float _204 = fma(_164, _124, _196);
    float _206 = _192 + _198;
    float _208 = _89 * _120;
    float _210 = fma(_164, _126, _202);
    float _212 = _89 * _146;
    float _214 = 1.0 / _206;
    float _216 = _89 * _144;
    float _218 = _89 * _148;
    float _220 = _89 * _150;
    float _222 = _198 * _212;
    float _224 = _198 * _216;
    float _226 = _198 * _218;
    float _228 = _198 * _220;
    float _230 = _65 + 0.5;
    float _232 = fma(_164, _128, _200);
    float _234 = fma(_164, _130, _208);
    float _236 = fma(_166, _134, _204);
    float _238 = _230 * (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _240 = fma(_166, _136, _210);
    float _242 = fma(_166, _138, _232);
    float _244 = fma(_166, _140, _234);
    float _246 = fma(_192, _214, -0.5);
    float _248 = fma(_190, _236, _224);
    float _250 = fma(_190, _240, _222);
    float _252 = fma(_190, _242, _226);
    float _254 = _65 + _246;
    float _256 = _65 + 1.5;
    float _258 = fma(_190, _244, _228);
    float _260 = _254 * (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _262 = _256 * (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float2 _759 = float2(_109, _238);
    float4 _264 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_759, float2(0.0), isnan(_759))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_759, float2(0.0), isnan(_759))).xyzw;
    float _266 = _264.x;
    float _268 = _264.y;
    float _270 = _264.z;
    float _272 = _264.w;
    float2 _775 = float2(_109, _262);
    float4 _274 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_775, float2(0.0), isnan(_775))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_775, float2(0.0), isnan(_775))).xyzw;
    float _276 = _274.x;
    float _278 = _274.y;
    float _280 = _274.z;
    float _282 = _274.w;
    float2 _791 = float2(_97, _260);
    float4 _284 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_791, float2(0.0), isnan(_791))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_791, float2(0.0), isnan(_791))).xyzw;
    float _286 = _284.x;
    float _288 = _284.y;
    float _290 = _284.z;
    float _292 = _284.w;
    float2 _807 = float2(_97, _262);
    float4 _294 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_807, float2(0.0), isnan(_807))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_807, float2(0.0), isnan(_807))).xyzw;
    float _296 = _294.x;
    float _298 = _294.y;
    float _300 = _294.z;
    float _302 = _294.w;
    float2 _823 = float2(_99, _260);
    float4 _304 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_823, float2(0.0), isnan(_823))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_823, float2(0.0), isnan(_823))).xyzw;
    float _306 = _304.x;
    float _308 = _304.y;
    float _310 = _304.z;
    float _312 = _304.w;
    float2 _839 = float2(_99, _262);
    float4 _314 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_839, float2(0.0), isnan(_839))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_839, float2(0.0), isnan(_839))).xyzw;
    float _316 = _314.x;
    float _318 = _314.y;
    float _320 = _314.z;
    float _322 = _314.w;
    float _324 = _89 * _270;
    float _326 = _89 * _266;
    float _328 = _89 * _268;
    float _330 = _89 * _272;
    float _332 = fma(_192, _324, _252);
    float _334 = fma(_192, _326, _248);
    float _336 = _89 * _278;
    float _338 = fma(_192, _328, _250);
    float _340 = fma(_192, _330, _258);
    float _342 = _164 * _290;
    float _344 = _89 * _276;
    float _346 = _89 * _280;
    float _348 = _164 * _286;
    float _350 = _164 * _288;
    float _352 = _164 * _292;
    float _354 = _89 * _282;
    float _356 = fma(_206, _342, _332);
    float _358 = fma(_164, _296, _344);
    float _360 = fma(_164, _300, _346);
    float _362 = fma(_206, _348, _334);
    float _364 = fma(_206, _350, _338);
    float _366 = _166 * _306;
    float _368 = _166 * _308;
    float _370 = _166 * _310;
    float _372 = fma(_206, _352, _340);
    float _374 = fma(_164, _298, _336);
    float _376 = _166 * _312;
    float _378 = fma(_164, _302, _354);
    float _380 = fma(_206, _366, _362);
    float _382 = fma(_206, _368, _364);
    float _384 = fma(_206, _370, _356);
    float _386 = fma(_206, _376, _372);
    float _388 = fma(_166, _318, _374);
    float _390 = fma(_166, _316, _358);
    float _392 = fma(_166, _320, _360);
    float _394 = fma(_166, _322, _378);
    float _396 = fma(_194, _388, _382);
    float _398 = fma(_194, _390, _380);
    float _400 = fma(_194, _392, _384);
    float _402 = fma(_194, _394, _386);
    out.m_32.x = _398;
    out.m_32.y = _396;
    out.m_32.z = _400;
    out.m_32.w = _402;
    return out;
}


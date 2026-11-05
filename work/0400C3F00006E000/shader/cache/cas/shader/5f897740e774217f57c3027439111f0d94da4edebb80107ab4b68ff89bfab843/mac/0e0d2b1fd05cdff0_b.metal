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
    texture2d<float> fp_t_tcb_A [[id(1)]];
    sampler fp_t_tcb_ASmplr [[id(2)]];
    texture2d<float> fp_t_tcb_C [[id(3)]];
    sampler fp_t_tcb_CSmplr [[id(4)]];
    texture2d<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    sampler fp_t_tcb_ASmplr_w [[id(7)]];
    sampler fp_t_tcb_CSmplr_w [[id(8)]];
    sampler fp_t_tcb_8Smplr_w [[id(9)]];
    constant dm_border_t* dm_border [[id(10)]];
};

struct main0_out
{
    float4 m_36 [[color(0)]];
};

struct main0_in
{
    float4 m_33 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _43 = gl_FragCoord.w;
    float _45 = in.m_33.x;
    float _47 = gl_FragCoord.w;
    float _49 = _45 * _47;
    float _51 = in.m_33.y;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _59 = 1.0 / _43;
    float _61 = _59 * _49;
    float _63 = _59 * _55;
    float _65 = fma(_61, (*spvDescriptorSet0.fp_c3)._m0[2].x, -0.5);
    float _67 = fma(_63, (*spvDescriptorSet0.fp_c3)._m0[2].y, -0.5);
    float _69 = floor(_65);
    float _71 = floor(_67);
    float _73 = -_69;
    float _75 = _65 + _73;
    float _77 = -_75;
    float _79 = _77 + 1.0;
    float _81 = -_75;
    float _83 = _81 + 2.0;
    float _85 = -_71;
    float _87 = _67 + _85;
    float _89 = _79 * _79;
    float _91 = _83 * _83;
    float _93 = -_87;
    float _95 = _93 + 1.0;
    float _97 = -_87;
    float _99 = _97 + 2.0;
    float _101 = _79 * _89;
    float _103 = _83 * _91;
    float _105 = _95 * _95;
    float _107 = _99 * _99;
    float _109 = -_101;
    float _111 = _109 + 6.0;
    float _113 = -_87;
    float _115 = _113 + 3.0;
    float _117 = _95 * _105;
    float _119 = fma(_101, -4.0, _103);
    float _121 = _99 * _107;
    float _123 = -_75;
    float _125 = _123 + 3.0;
    float _127 = _103 * 4.0;
    float _129 = -_119;
    float _131 = _129 + _111;
    float _133 = fma(_117, -4.0, _121);
    float _135 = -_117;
    float _137 = _135 + 6.0;
    float _139 = _101 + _119;
    float _141 = _131 * 0.16666667163372039794921875;
    float _143 = _117 + _133;
    float _145 = -_133;
    float _147 = _145 + _137;
    float _149 = _139 * 0.16666667163372039794921875;
    float _151 = _125 * _125;
    float _153 = _143 * 0.16666667163372039794921875;
    float _155 = _147 * 0.16666667163372039794921875;
    float _157 = _115 * _115;
    float _159 = _121 * 4.0;
    float _161 = 1.0 / _149;
    float _163 = -_127;
    float _165 = fma(_125, _151, _163);
    float _167 = _69 + (-0.5);
    float _169 = -_159;
    float _171 = fma(_115, _157, _169);
    float _173 = _71 + (-0.5);
    float _175 = fma(_101, 6.0, _165);
    float _177 = _69 + 1.5;
    float _179 = fma(_117, 6.0, _171);
    float _181 = 1.0 / _153;
    float _183 = -_175;
    float _185 = _183 + _131;
    float _187 = _119 * 0.16666667163372039794921875;
    float _189 = -_179;
    float _191 = _189 + _147;
    float _193 = _133 * 0.16666667163372039794921875;
    float _195 = _185 * 0.16666667163372039794921875;
    float _197 = _71 + 1.5;
    float _199 = _191 * 0.16666667163372039794921875;
    float _201 = 1.0 / _141;
    float _203 = fma(_187, _161, _167);
    float _205 = 1.0 / _155;
    float _207 = fma(_193, _181, _173);
    float2 _636 = float2(_61, _63);
    float _209 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_636, float2(0.0), isnan(_636))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_636, float2(0.0), isnan(_636))).x;
    float _211 = _207 * _57;
    float _213 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[2].x;
    float _215 = fma(_195, _201, _177);
    float _217 = fma(_199, _205, _197);
    float _219 = _217 * _57;
    float _221 = _203 * _213;
    float _223 = _215 * _213;
    float2 _670 = float2(_221, _211);
    float4 _226 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_670, float2(0.0), isnan(_670))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_670, float2(0.0), isnan(_670))).xyzw;
    float _228 = _226.x;
    float _230 = _226.y;
    float _232 = _226.z;
    float _234 = _226.w;
    float2 _686 = float2(_223, _211);
    float4 _236 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_686, float2(0.0), isnan(_686))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_686, float2(0.0), isnan(_686))).xyzw;
    float _238 = _236.x;
    float _240 = _236.y;
    float _242 = _236.z;
    float _244 = _236.w;
    float2 _702 = float2(_221, _219);
    float4 _246 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_702, float2(0.0), isnan(_702))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_702, float2(0.0), isnan(_702))).xyzw;
    float _248 = _246.x;
    float _250 = _246.y;
    float _252 = _246.z;
    float _254 = _246.w;
    float2 _718 = float2(_223, _219);
    float4 _256 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_718, float2(0.0), isnan(_718))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_718, float2(0.0), isnan(_718))).xyzw;
    float _258 = _256.x;
    float _260 = _256.y;
    float _262 = _256.z;
    float _264 = _256.w;
    float2 _734 = float2(_61, _63);
    float4 _266 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_734, float2(0.0), isnan(_734))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_734, float2(0.0), isnan(_734))).xyzw;
    float _268 = _266.x;
    float _270 = _266.y;
    float _272 = _266.z;
    float _274 = _266.w;
    float _276 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[2].z;
    float _278 = -_209;
    float _280 = fma(_278, (*spvDescriptorSet0.fp_c3)._m0[2].w, 1.0);
    float _282 = _280 * _276;
    float _284 = fma(_282, (*spvDescriptorSet0.fp_c3)._m0[0].y, -1.0);
    float _286 = -_282;
    float _288 = -_284;
    float _290 = fma(_286, (*spvDescriptorSet0.fp_c3)._m0[0].z, _288);
    float _292 = precise::max(0.0, _290);
    float _294 = _292 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _296 = _294 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _298 = -_244;
    float _300 = _234 + _298;
    float _302 = -_240;
    float _304 = _230 + _302;
    float _306 = -_264;
    float _308 = _254 + _306;
    float _310 = fma(_149, _300, _244);
    float _312 = -_238;
    float _314 = _228 + _312;
    float _316 = fma(_149, _308, _264);
    float _318 = -_260;
    float _320 = _250 + _318;
    float _322 = precise::max(_296, -0.00999999977648258209228515625);
    float _324 = fma(_149, _314, _238);
    float _326 = -_316;
    float _328 = _326 + _310;
    float _330 = -_242;
    float _332 = _232 + _330;
    float _334 = -_262;
    float _336 = _252 + _334;
    float _338 = fma(_149, _304, _240);
    float _340 = fma(_153, _328, _316);
    float _342 = fma(_149, _332, _242);
    float _344 = -_258;
    float _346 = _248 + _344;
    float _348 = fma(_149, _320, _260);
    float _350 = precise::min(_322, (*spvDescriptorSet0.fp_c3)._m0[0].w);
    bool _354 = _340 > 0.0;
    float _356 = fma(_149, _346, _258);
    float _358 = fma(_149, _336, _262);
    float _360 = -_348;
    float _362 = _360 + _338;
    float _364 = _354 ? _340 : 1.0;
    float _366 = -_356;
    float _368 = _366 + _324;
    float _370 = _354 ? _350 : 0.0;
    float _372 = -_358;
    float _374 = _372 + _342;
    float _376 = fma(_153, _362, _348);
    float _378 = fma(_153, _368, _356);
    float _380 = 1.0 / _364;
    float _382 = fma(_153, _374, _358);
    float _384 = 0.0 + _370;
    float _386 = precise::clamp(_384, 0.0, 1.0);
    float _388 = -_270;
    float _390 = fma(_376, _380, _388);
    float _392 = -_268;
    float _394 = fma(_378, _380, _392);
    float _396 = -_272;
    float _398 = fma(_382, _380, _396);
    float _400 = -_274;
    float _402 = _400 + _386;
    float _404 = fma(_386, _390, _270);
    float _406 = fma(_386, _394, _268);
    float _408 = fma(_386, _398, _272);
    float _410 = fma(_386, _402, _274);
    out.m_36.x = _406;
    out.m_36.y = _404;
    out.m_36.z = _408;
    out.m_36.w = _410;
    return out;
}


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
    constant _16* fp_c8 [[id(0)]];
    constant _16* fp_c10 [[id(1)]];
    constant _16* fp_c9 [[id(2)]];
    constant _16* fp_c15 [[id(3)]];
    texture2d<float> fp_t_tcb_8 [[id(4)]];
    sampler fp_t_tcb_8Smplr [[id(5)]];
    texture2d<float> fp_t_tcb_34 [[id(6)]];
    sampler fp_t_tcb_34Smplr [[id(7)]];
    texture2d<float> fp_t_tcb_A [[id(8)]];
    sampler fp_t_tcb_ASmplr [[id(9)]];
    texture2d<float> fp_t_tcb_C [[id(10)]];
    sampler fp_t_tcb_CSmplr [[id(11)]];
    sampler fp_t_tcb_8Smplr_w [[id(12)]];
    sampler fp_t_tcb_34Smplr_w [[id(13)]];
    sampler fp_t_tcb_ASmplr_w [[id(14)]];
    sampler fp_t_tcb_CSmplr_w [[id(15)]];
    constant dm_border_t* dm_border [[id(16)]];
};

struct main0_out
{
    float4 m_56 [[color(0)]];
};

struct main0_in
{
    float4 m_47 [[user(locn0)]];
    float4 m_49 [[user(locn1)]];
    float4 m_45 [[user(locn2)]];
    float4 m_51 [[user(locn3)]];
    float4 m_41 [[user(locn4)]];
    float4 m_53 [[user(locn5)]];
    float4 m_43 [[user(locn6)]];
    float4 m_58 [[user(locn8)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _65 = gl_FragCoord.w;
    float _67 = in.m_41.x;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = in.m_41.y;
    float _75 = gl_FragCoord.w;
    float _77 = _73 * _75;
    float _79 = in.m_43.x;
    float _81 = gl_FragCoord.w;
    float _83 = _79 * _81;
    float _85 = in.m_43.y;
    float _87 = gl_FragCoord.w;
    float _89 = _85 * _87;
    float _91 = 1.0 / _65;
    float _93 = _91 * _71;
    float _95 = _91 * _77;
    float _97 = _91 * _83;
    float _99 = _91 * _89;
    float2 _556 = float2(_93, _95);
    float _101 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_556, float2(0.0), isnan(_556))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_556, float2(0.0), isnan(_556))).x;
    float2 _567 = float2(_97, _99);
    float _103 = dm_bs(spvDescriptorSet0.fp_t_tcb_34.sample(spvDescriptorSet0.fp_t_tcb_34Smplr, select(_567, float2(0.0), isnan(_567))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_34, spvDescriptorSet0.fp_t_tcb_34Smplr_w, select(_567, float2(0.0), isnan(_567))).x;
    float _105 = in.m_45.w;
    float _107 = gl_FragCoord.w;
    float _109 = _105 * _107;
    float _111 = in.m_45.z;
    float _113 = gl_FragCoord.w;
    float _115 = _111 * _113;
    float _117 = 1.0 / (*spvDescriptorSet0.fp_c8)._m0[31].x;
    float _119 = in.m_41.w;
    float _121 = gl_FragCoord.w;
    float _123 = _119 * _121;
    float _125 = (*spvDescriptorSet0.fp_c10)._m0[2].x * 0.033333338797092437744140625;
    float _127 = (*spvDescriptorSet0.fp_c10)._m0[2].x * 0.06666667759418487548828125;
    float _129 = (*spvDescriptorSet0.fp_c10)._m0[2].x * 0.33333337306976318359375;
    float _131 = (*spvDescriptorSet0.fp_c10)._m0[2].x * 0.0500000081956386566162109375;
    float _133 = ceil(_125);
    float _135 = ceil(_127);
    float _137 = ceil(_129);
    float _139 = _133 * 0.3333333432674407958984375;
    float _141 = _91 * _109;
    float _143 = _91 * _115;
    float _145 = in.m_41.z;
    float _147 = gl_FragCoord.w;
    float _149 = _145 * _147;
    float _151 = ceil(_131);
    float _153 = _135 * 0.3333333432674407958984375;
    float _155 = 1.0 / _141;
    float _157 = _137 * 0.3333333432674407958984375;
    float _159 = floor(_139);
    float _161 = _143 * _155;
    float _163 = floor(_153);
    float _165 = _117 * (*spvDescriptorSet0.fp_c8)._m0[31].y;
    float _167 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _169 = fma(_161, (*spvDescriptorSet0.fp_c8)._m0[30].w, _167);
    float _171 = _151 * 0.5;
    float _173 = fma(_159, -3.0, _133);
    float _175 = precise::clamp(_173, 0.0, 1.0);
    float _177 = floor(_157);
    float _179 = 1.0 / _169;
    float _181 = fma(_163, -3.0, _135);
    float _183 = precise::clamp(_181, 0.0, 1.0);
    float _185 = _175 + _183;
    float _187 = floor(_171);
    float _189 = fma(_177, -3.0, _137);
    float _191 = precise::clamp(_189, 0.0, 1.0);
    float _193 = -_185;
    float _195 = _193 + 2.0;
    float _197 = _195 * _191;
    float _199 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _201 = _179 * _199;
    float _203 = _91 * _123;
    float _205 = _201 * _165;
    float _207 = fma(_187, -2.0, _151);
    float _209 = precise::clamp(_207, 0.0, 1.0);
    float _211 = precise::max(_205, 500.0);
    float _213 = _197 * _209;
    float _215 = precise::min(_211, 800.0);
    float _217 = fma(_215, -0.0033333334140479564666748046875, 2.6666667461395263671875);
    float _219 = fma(_101, 2.0, -1.0);
    float _221 = _103 * _213;
    float _223 = _91 * _149;
    float _225 = _219 * (*spvDescriptorSet0.fp_c9)._m0[194].w;
    float _227 = fma(_221, 2.0, -1.0);
    float _229 = fma(_225, _217, _203);
    float _231 = fma(_227, (*spvDescriptorSet0.fp_c9)._m0[194].z, _223);
    float _233 = fma(_227, (*spvDescriptorSet0.fp_c9)._m0[194].z, _229);
    float2 _767;
    _767.x = spvDescriptorSet0.fp_t_tcb_A.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_ASmplr, float2(_231, _233));
    _767.y = spvDescriptorSet0.fp_t_tcb_A.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_ASmplr, float2(_231, _233));
    float _235 = _767.x;
    float _237 = _235 * 256.0;
    int _240 = int(_237);
    float _242 = float(uint(_240));
    float _244 = _242 * 0.00390625;
    float _246 = precise::min(_244, 2.0);
    float2 _785 = float2(_231, _233);
    float _248 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_785, float2(0.0), isnan(_785)), level(_246)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_785, float2(0.0), isnan(_785)), level(_246)).w;
    float _250 = in.m_47.w;
    float _252 = gl_FragCoord.w;
    float _254 = _250 * _252;
    float _256 = in.m_49.w;
    float _258 = gl_FragCoord.w;
    float _260 = _256 * _258;
    float _262 = in.m_51.x;
    float _264 = gl_FragCoord.w;
    float _266 = _262 * _264;
    float _268 = fma(_215, 0.0033333334140479564666748046875, -1.6666667461395263671875);
    float _270 = 0.0 + _221;
    float _272 = precise::clamp(_270, 0.0, 1.0);
    float _274 = -_101;
    float _276 = _274 + 0.25;
    float _278 = fma(_272, -0.5, 0.5);
    float _280 = fma(_268, _276, _101);
    float _282 = _272 + _278;
    float _284 = precise::clamp(_282, 0.0, 1.0);
    float _286 = _91 * _254;
    float _288 = _91 * _260;
    float _290 = _248 * _280;
    float _292 = _290 * _284;
    float _294 = precise::clamp(_292, 0.0, 1.0);
    float _296 = _286 * _294;
    float _298 = _91 * _266;
    float _300 = _288 * _296;
    float _302 = 0.0 + _300;
    float _304 = precise::clamp(_302, 0.0, 1.0);
    float _306 = _304 * _298;
    bool _310 = _306 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _312 = isnan(_306);
    bool _314 = _310 || _312;
    bool _316 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _318 = _314 || _316;
    float _320 = in.m_53.x;
    float _322 = gl_FragCoord.w;
    float _324 = _320 * _322;
    float _326 = in.m_53.y;
    float _328 = gl_FragCoord.w;
    float _330 = _326 * _328;
    float _332 = _201;
    float _334 = _306;
    if (!_318)
    {
        discard_fragment();
    }
    float _336 = _91 * _324;
    float _338 = _91 * _330;
    float2 _912 = float2(_336, _338);
    float3 _342 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_912, float2(0.0), isnan(_912))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_912, float2(0.0), isnan(_912))).xyz;
    float _344 = _342.x;
    float _346 = _342.y;
    float _348 = _342.z;
    float _350 = in.m_49.y;
    float _352 = gl_FragCoord.w;
    float _354 = _350 * _352;
    float _356 = in.m_49.z;
    float _358 = gl_FragCoord.w;
    float _360 = _356 * _358;
    float _362 = in.m_49.x;
    float _364 = gl_FragCoord.w;
    float _366 = _362 * _364;
    float _368 = in.m_47.x;
    float _370 = gl_FragCoord.w;
    float _372 = _368 * _370;
    float _374 = in.m_47.y;
    float _376 = gl_FragCoord.w;
    float _378 = _374 * _376;
    float _380 = in.m_47.z;
    float _382 = gl_FragCoord.w;
    float _384 = _380 * _382;
    float _386 = _91 * _354;
    float _388 = _91 * _360;
    float _390 = _91 * _366;
    float _392 = -_344;
    float _394 = _392 + 1.0;
    float _396 = -_346;
    float _398 = _396 + 1.0;
    float _400 = -_348;
    float _402 = _400 + 1.0;
    float _404 = _390 * _394;
    float _406 = _386 * _398;
    float _408 = _388 * _402;
    float _410 = _91 * _372;
    float _412 = _91 * _378;
    float _414 = _91 * _384;
    float _416 = fma(_344, _410, _404);
    float _418 = fma(_346, _412, _406);
    float _420 = fma(_348, _414, _408);
    if (!_318)
    {
        out.m_56.x = _416;
        out.m_56.y = _418;
        out.m_56.z = _420;
        out.m_56.w = _300;
        return out;
    }
    float _422 = _418 * 0.715200006961822509765625;
    float _424 = in.m_58.w;
    float _426 = gl_FragCoord.w;
    float _428 = _424 * _426;
    float _430 = in.m_58.x;
    float _432 = gl_FragCoord.w;
    float _434 = _430 * _432;
    float _436 = in.m_58.y;
    float _438 = gl_FragCoord.w;
    float _440 = _436 * _438;
    float _442 = fma(_416, 0.2125999927520751953125, _422);
    float _444 = in.m_58.z;
    float _446 = gl_FragCoord.w;
    float _448 = _444 * _446;
    bool _450 = 0.5 <= (*spvDescriptorSet0.fp_c15)._m0[653].w;
    float _452 = fma(_420, 0.072200000286102294921875, _442);
    float _454 = 1.0 / _452;
    if (_450)
    {
        float _456 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _458 = _201 + _456;
        _332 = _458;
    }
    float _460 = _332;
    float _462 = _454 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _464 = precise::clamp(_462, 0.0, 1.0);
    float _466 = fma(_464, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _468 = _91 * _428;
    float _470 = _91 * _434;
    float _472 = _466 * _468;
    float _474 = 0.0 + _306;
    float _476 = precise::clamp(_474, 0.0, 1.0);
    float _478 = _476;
    if (_450)
    {
        float _480 = _460 * 8.0;
        float _482 = precise::clamp(_480, 0.0, 1.0);
        _334 = _482;
    }
    float _484 = _334;
    float _486 = _91 * _440;
    float _488 = _91 * _448;
    float _490 = fma(_416, _472, _470);
    if (_450)
    {
        float _492 = _476 * _484;
        _478 = _492;
    }
    float _494 = _478;
    float _496 = fma(_418, _472, _486);
    float _498 = fma(_420, _472, _488);
    float _500 = 0.0 + _494;
    float _502 = precise::clamp(_500, 0.0, 1.0);
    out.m_56.x = _490;
    out.m_56.y = _496;
    out.m_56.z = _498;
    out.m_56.w = _502;
    return out;
}


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
    constant _16* fp_c9 [[id(0)]];
    constant _16* fp_c10 [[id(1)]];
    constant _16* fp_c15 [[id(2)]];
    constant _16* fp_c8 [[id(3)]];
    texture2d<float> fp_t_tcb_C [[id(4)]];
    sampler fp_t_tcb_CSmplr [[id(5)]];
    texture2d<float> fp_t_tcb_A [[id(6)]];
    sampler fp_t_tcb_ASmplr [[id(7)]];
    texture2d<float> fp_t_tcb_8 [[id(8)]];
    sampler fp_t_tcb_8Smplr [[id(9)]];
    sampler fp_t_tcb_CSmplr_w [[id(10)]];
    sampler fp_t_tcb_ASmplr_w [[id(11)]];
    sampler fp_t_tcb_8Smplr_w [[id(12)]];
    constant dm_border_t* dm_border [[id(13)]];
};

struct main0_out
{
    float4 m_58 [[color(0)]];
};

struct main0_in
{
    float4 m_43 [[user(locn0)]];
    float4 m_55 [[user(locn1)]];
    float4 m_41 [[user(locn2)]];
    float4 m_53 [[user(locn3), flat]];
    float4 m_51 [[user(locn4), flat]];
    float4 m_62 [[user(locn5)]];
    float4 m_45 [[user(locn6)]];
    float4 m_47 [[user(locn7), flat]];
    float4 m_39 [[user(locn8)]];
    float4 m_49 [[user(locn10)]];
    float4 m_60 [[user(locn11)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _69 = gl_FragCoord.w;
    float _71 = in.m_39.y;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = in.m_41.z;
    float _79 = gl_FragCoord.w;
    float _81 = _77 * _79;
    float _83 = in.m_41.w;
    float _85 = gl_FragCoord.w;
    float _87 = _83 * _85;
    float _89 = in.m_39.x;
    float _91 = gl_FragCoord.w;
    float _93 = _89 * _91;
    float _95 = in.m_41.y;
    float _97 = gl_FragCoord.w;
    float _99 = _95 * _97;
    float _101 = in.m_41.x;
    float _103 = gl_FragCoord.w;
    float _105 = _101 * _103;
    float _107 = 1.0 / _69;
    float _109 = _107 * _75;
    float _111 = _107 * _81;
    float _113 = _107 * _87;
    float _115 = _107 * _93;
    float _117 = _107 * _99;
    float _119 = _107 * _105;
    float2 _549 = float2(_115, _109);
    float _121 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_549, float2(0.0), isnan(_549))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_549, float2(0.0), isnan(_549))).w;
    float2 _560 = float2(_111, _113);
    float4 _124 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_560, float2(0.0), isnan(_560))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_560, float2(0.0), isnan(_560))).xyzw;
    float _126 = _124.x;
    float _128 = _124.y;
    float _130 = _124.z;
    float _132 = _124.w;
    float2 _576 = float2(_119, _117);
    float _134 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_576, float2(0.0), isnan(_576))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_576, float2(0.0), isnan(_576))).w;
    float _136 = in.m_43.w;
    float _138 = gl_FragCoord.w;
    float _140 = _136 * _138;
    float _142 = in.m_45.x;
    float _144 = gl_FragCoord.w;
    float _146 = _142 * _144;
    float _148 = _107 * _140;
    float _150 = fma(_148, 2.0, -1.0);
    float _152 = in.m_47.x;
    float _154 = fma(_152, -0.20000000298023223876953125, 1.0);
    float _156 = _154 * (*spvDescriptorSet0.fp_c9)._m0[191].x;
    float _158 = in.m_49.x;
    float _160 = gl_FragCoord.w;
    float _162 = _158 * _160;
    float _164 = fma(_132, 0.5, _121);
    float _166 = _164 + _150;
    float _168 = precise::max(_166, 0.800000011920928955078125);
    float _170 = precise::min(_168, 1.0);
    float _172 = fma(_170, 5.000000476837158203125, -4.000000476837158203125);
    float _174 = _134 * _172;
    float _176 = _107 * _146;
    float _178 = 0.0 + _174;
    float _180 = precise::clamp(_178, 0.0, 1.0);
    float _182 = _180 * _176;
    bool _186 = _182 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _188 = isnan(_182);
    bool _190 = _186 || _188;
    bool _192 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _194 = _190 || _192;
    float _196 = in.m_51.x;
    if (!_194)
    {
        discard_fragment();
    }
    float _198 = in.m_43.y;
    float _200 = gl_FragCoord.w;
    float _202 = _198 * _200;
    float _204 = in.m_43.z;
    float _206 = gl_FragCoord.w;
    float _208 = _204 * _206;
    float _210 = _196 + 0.20000000298023223876953125;
    float _212 = precise::clamp(_210, 0.0, 1.0);
    float _214 = -_212;
    float _216 = _214 + 1.0;
    float _218 = _212 * _212;
    float _220 = -_216;
    float _222 = fma(_220, _216, 1.0);
    float _224 = _222 * _156;
    float _226 = in.m_53.y;
    float _228 = _107 * _202;
    float _230 = fma(_218, (*spvDescriptorSet0.fp_c9)._m0[191].y, _226);
    float _232 = -(*spvDescriptorSet0.fp_c10)._m0[9].w;
    float _234 = _226 + _232;
    float _236 = fma(_234, _224, _230);
    float _238 = in.m_53.x;
    float _240 = -(*spvDescriptorSet0.fp_c10)._m0[8].w;
    float _242 = _238 + _240;
    float _244 = fma(_242, _224, _238);
    float _246 = _107 * _162;
    float _248 = in.m_49.y;
    float _250 = gl_FragCoord.w;
    float _252 = _248 * _250;
    float _254 = -_244;
    float _256 = _246 + _254;
    float _258 = _107 * _252;
    float _260 = in.m_55.z;
    float _262 = gl_FragCoord.w;
    float _264 = _260 * _262;
    float _266 = -_236;
    float _268 = _258 + _266;
    float _270 = _268 * _268;
    float _272 = fma(_256, _256, _270);
    float _274 = in.m_53.z;
    float _276 = _107 * _264;
    float _278 = _126 * _126;
    float _280 = _128 * _128;
    float _282 = _130 * _130;
    float _284 = -(*spvDescriptorSet0.fp_c10)._m0[10].w;
    float _286 = _274 + _284;
    float _288 = fma(_286, _224, _274);
    float _290 = in.m_49.z;
    float _292 = gl_FragCoord.w;
    float _294 = _290 * _292;
    float _296 = _107 * _294;
    float _298 = in.m_43.x;
    float _300 = gl_FragCoord.w;
    float _302 = _298 * _300;
    float _304 = -_288;
    float _306 = _296 + _304;
    float _308 = in.m_55.x;
    float _310 = gl_FragCoord.w;
    float _312 = _308 * _310;
    float _314 = fma(_306, _306, _272);
    float _316 = in.m_55.y;
    float _318 = gl_FragCoord.w;
    float _320 = _316 * _318;
    float _322 = sqrt(_314);
    float _324 = precise::max(_322, 0.0500000007450580596923828125);
    float _326 = precise::min(_324, 0.25);
    float _328 = _107 * _302;
    float _330 = fma(_326, -5.0, 1.25);
    float _332 = _107 * _312;
    float _334 = _107 * _320;
    float _336 = _107 * _208;
    float _338 = -_332;
    float _340 = _338 + _328;
    float _342 = _330 * 10.0;
    float _344 = -_334;
    float _346 = _344 + _228;
    float _348 = -_276;
    float _350 = _348 + _336;
    float _352 = fma(_278, _340, _332);
    float _354 = fma(_280, _346, _334);
    float _356 = fma(_282, _350, _276);
    float _358 = fma(_328, _342, _352);
    float _360 = fma(_228, _342, _354);
    float _362 = fma(_336, _342, _356);
    if (!_194)
    {
        out.m_58.x = _358;
        out.m_58.y = _360;
        out.m_58.z = _362;
        out.m_58.w = _174;
        return out;
    }
    float _364 = _360 * 0.715200006961822509765625;
    float _366 = in.m_60.w;
    float _368 = gl_FragCoord.w;
    float _370 = _366 * _368;
    float _372 = in.m_60.z;
    float _374 = gl_FragCoord.w;
    float _376 = _372 * _374;
    float _378 = in.m_60.x;
    float _380 = gl_FragCoord.w;
    float _382 = _378 * _380;
    float _384 = fma(_358, 0.2125999927520751953125, _364);
    float _386 = in.m_60.y;
    float _388 = gl_FragCoord.w;
    float _390 = _386 * _388;
    float _392 = 0.0 + _182;
    float _394 = precise::clamp(_392, 0.0, 1.0);
    float _396 = fma(_362, 0.072200000286102294921875, _384);
    bool _398 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _400 = 1.0 / _396;
    float _402 = _400 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _404 = precise::clamp(_402, 0.0, 1.0);
    float _406 = _107 * _370;
    float _408 = fma(_404, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _410 = _107 * _376;
    float _412 = _408 * _406;
    float _414 = _107 * _382;
    float _416 = _107 * _390;
    float _418 = fma(_362, _412, _410);
    float _420 = fma(_358, _412, _414);
    float _422 = fma(_360, _412, _416);
    float _424 = _410;
    if (!_398)
    {
        _424 = _394;
    }
    float _426 = _424;
    bool _428 = !_398;
    float _430 = _426;
    if (!_428)
    {
        float _432 = in.m_62.w;
        float _434 = gl_FragCoord.w;
        float _436 = _432 * _434;
        float _438 = in.m_62.z;
        float _440 = gl_FragCoord.w;
        float _442 = _438 * _440;
        float _444 = _107 * _436;
        float _446 = _107 * _442;
        float _448 = 1.0 / _444;
        float _450 = _446 * _448;
        float _452 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _454 = fma(_450, (*spvDescriptorSet0.fp_c8)._m0[30].w, _452);
        float _456 = 1.0 / _454;
        float _458 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _460 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _462 = fma(_456, _458, _460);
        float _464 = _462 * 8.0;
        float _466 = precise::clamp(_464, 0.0, 1.0);
        float _468 = _394 * _466;
        _430 = _468;
    }
    float _470 = _430;
    float _472 = 0.0 + _470;
    float _474 = precise::clamp(_472, 0.0, 1.0);
    out.m_58.x = _420;
    out.m_58.y = _422;
    out.m_58.z = _418;
    out.m_58.w = _474;
    return out;
}


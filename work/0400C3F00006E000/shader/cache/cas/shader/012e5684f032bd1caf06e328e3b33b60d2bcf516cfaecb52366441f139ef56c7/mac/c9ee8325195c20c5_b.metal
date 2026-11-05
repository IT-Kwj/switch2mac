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
    constant _16* fp_c8 [[id(1)]];
    constant _16* fp_c15 [[id(2)]];
    texture2d<float> fp_t_tcb_10 [[id(3)]];
    sampler fp_t_tcb_10Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    texture2d<float> fp_t_tcb_A [[id(7)]];
    sampler fp_t_tcb_ASmplr [[id(8)]];
    sampler fp_t_tcb_10Smplr_w [[id(9)]];
    sampler fp_t_tcb_8Smplr_w [[id(10)]];
    sampler fp_t_tcb_ASmplr_w [[id(11)]];
    constant dm_border_t* dm_border [[id(12)]];
};

struct main0_out
{
    float4 m_60 [[color(0)]];
};

struct main0_in
{
    float4 m_43 [[user(locn0)]];
    float4 m_57 [[user(locn1)]];
    float4 m_39 [[user(locn2)]];
    float4 m_37 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 m_41 [[user(locn5)]];
    float4 m_55 [[user(locn6)]];
    float4 m_47 [[user(locn7)]];
    float4 m_53 [[user(locn8)]];
    float4 m_62 [[user(locn9)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]], bool gl_FrontFacing [[front_facing]])
{
    main0_out out = {};
    float _69 = gl_FragCoord.w;
    float _71 = in.m_37.w;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = in.m_37.x;
    float _79 = gl_FragCoord.w;
    float _81 = _77 * _79;
    float _83 = in.m_37.y;
    float _85 = gl_FragCoord.w;
    float _87 = _83 * _85;
    float _89 = in.m_39.x;
    float _91 = gl_FragCoord.w;
    float _93 = _89 * _91;
    float _95 = in.m_39.y;
    float _97 = gl_FragCoord.w;
    float _99 = _95 * _97;
    float _101 = 1.0 / _69;
    float _103 = _101 * _75;
    float _105 = _101 * _81;
    float _107 = _101 * _87;
    float _109 = 1.0 / _103;
    float _111 = _105 * _109;
    float _113 = _107 * _109;
    float _115 = _101 * _93;
    float _117 = _101 * _99;
    float2 _637 = float2(_111, _113);
    float _119 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_637, float2(0.0), isnan(_637))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_637, float2(0.0), isnan(_637))).x;
    float2 _648 = float2(_115, _117);
    float _121 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_648, float2(0.0), isnan(_648))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_648, float2(0.0), isnan(_648))).w;
    float _123 = in.m_37.z;
    float _125 = gl_FragCoord.w;
    float _127 = _123 * _125;
    float _129 = in.m_41.w;
    float _131 = gl_FragCoord.w;
    float _133 = _129 * _131;
    float _135 = in.m_43.w;
    float _137 = gl_FragCoord.w;
    float _139 = _135 * _137;
    float _141 = in.m_45.x;
    float _143 = gl_FragCoord.w;
    float _145 = _141 * _143;
    float _147 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _149 = _101 * _127;
    float _151 = _149 * _109;
    float _153 = _101 * _133;
    float _155 = _101 * _139;
    float _157 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _159 = fma(_151, (*spvDescriptorSet0.fp_c8)._m0[30].w, _157);
    float _161 = 1.0 / _159;
    float _163 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _165 = _161 * _163;
    float _167 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _169 = fma(_119, (*spvDescriptorSet0.fp_c8)._m0[30].w, _167);
    float _171 = _121 * _153;
    float _173 = _155 + 0.20000000298023223876953125;
    float _175 = 1.0 / _169;
    float _177 = precise::max(_155, _171);
    float _179 = precise::min(_173, _177);
    float _181 = -_155;
    float _183 = _181 + _179;
    float _185 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _187 = -_165;
    float _189 = fma(_175, _185, _187);
    float _191 = _183 * 5.0;
    float _193 = _101 * _145;
    float _195 = _189 * _147;
    float _197 = precise::clamp(_195, 0.0, 1.0);
    float _199 = 0.0 + _191;
    float _201 = precise::clamp(_199, 0.0, 1.0);
    float _203 = _201 * _197;
    float _205 = _203 * _193;
    bool _208 = _205 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _210 = isnan(_205);
    bool _212 = _208 || _210;
    bool _214 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _216 = _212 || _214;
    float _218 = in.m_39.z;
    float _220 = gl_FragCoord.w;
    float _222 = _218 * _220;
    float _224 = in.m_39.w;
    float _226 = gl_FragCoord.w;
    float _228 = _224 * _226;
    float _230 = _165;
    if (!_216)
    {
        discard_fragment();
    }
    float _232 = _101 * _222;
    float _234 = _101 * _228;
    float2 _818 = float2(_232, _234);
    float2 _238 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_818, float2(0.0), isnan(_818))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_818, float2(0.0), isnan(_818))).xy;
    float _240 = _238.x;
    float _242 = _238.y;
    float _244 = in.m_47.y;
    float _246 = gl_FragCoord.w;
    float _248 = _244 * _246;
    float _250 = as_type<float>(gl_FrontFacing ? (-1) : 0);
    float _252 = in.m_47.x;
    float _254 = gl_FragCoord.w;
    float _256 = _252 * _254;
    float _258 = in.m_47.z;
    float _260 = gl_FragCoord.w;
    float _262 = _258 * _260;
    float _264 = in.m_53.y;
    float _266 = gl_FragCoord.w;
    float _268 = _264 * _266;
    float _270 = in.m_53.x;
    float _272 = gl_FragCoord.w;
    float _274 = _270 * _272;
    float _276 = in.m_55.y;
    float _278 = gl_FragCoord.w;
    float _280 = _276 * _278;
    float _282 = in.m_53.z;
    float _284 = gl_FragCoord.w;
    float _286 = _282 * _284;
    float _288 = in.m_55.x;
    float _290 = gl_FragCoord.w;
    float _292 = _288 * _290;
    float _294 = in.m_55.z;
    float _296 = gl_FragCoord.w;
    float _298 = _294 * _296;
    float _300 = _101 * _248;
    bool _302 = as_type<int>(_250) != 0;
    float _304 = _101 * _256;
    float _306 = _101 * _268;
    bool _308 = !_302;
    float _310 = -_300;
    float _312 = _308 ? _310 : _300;
    float _314 = _101 * _262;
    bool _316 = !_302;
    float _318 = -_304;
    float _320 = _316 ? _318 : _304;
    float _322 = _101 * _274;
    float _324 = _306 * _306;
    float _326 = _312 * _312;
    bool _328 = !_302;
    float _330 = -_314;
    float _332 = _328 ? _330 : _314;
    float _334 = _101 * _286;
    float _336 = fma(_322, _322, _324);
    float _338 = fma(_320, _320, _326);
    float _340 = _101 * _292;
    float _342 = in.m_43.z;
    float _344 = gl_FragCoord.w;
    float _346 = _342 * _344;
    float _348 = fma(_334, _334, _336);
    float _350 = fma(_332, _332, _338);
    float _352 = _101 * _280;
    float _354 = _101 * _298;
    float _356 = in.m_57.x;
    float _358 = gl_FragCoord.w;
    float _360 = _356 * _358;
    float _362 = in.m_57.y;
    float _364 = gl_FragCoord.w;
    float _366 = _362 * _364;
    float _368 = _352 * _352;
    float _370 = rsqrt(_350);
    float _372 = in.m_57.z;
    float _374 = gl_FragCoord.w;
    float _376 = _372 * _374;
    float _378 = fma(_340, _340, _368);
    float _380 = fma(_354, _354, _378);
    float _382 = rsqrt(_348);
    float _384 = _312 * _370;
    float _386 = _320 * _370;
    float _388 = _332 * _370;
    float _390 = _384 * _384;
    float _392 = rsqrt(_380);
    float _394 = fma(_386, _386, _390);
    float _396 = _306 * _382;
    float _398 = _334 * _382;
    float _400 = in.m_43.x;
    float _402 = gl_FragCoord.w;
    float _404 = _400 * _402;
    float _406 = fma(_388, _388, _394);
    float _408 = in.m_43.y;
    float _410 = gl_FragCoord.w;
    float _412 = _408 * _410;
    float _414 = rsqrt(_406);
    float _416 = _242 * _242;
    float _418 = _240 * _240;
    float _420 = _416 * _416;
    float _422 = _416 * _392;
    float _424 = fma(_418, _418, _420);
    float _426 = precise::clamp(_424, 0.0, 1.0);
    float _428 = _354 * _422;
    float _430 = _352 * _422;
    float _432 = -_426;
    float _434 = _432 + 1.0;
    float _436 = fma(_418, _398, _428);
    float _438 = fma(_418, _396, _430);
    float _440 = _101 * _404;
    float _442 = _101 * _412;
    float _444 = _101 * _346;
    float _446 = sqrt(_434);
    float _448 = _414 * _446;
    float _450 = fma(_388, _448, _436);
    float _452 = fma(_384, _448, _438);
    float _454 = _101 * _366;
    float _456 = _101 * _376;
    float _458 = _450 * (-0.577381789684295654296875);
    float _460 = -_442;
    float _462 = _460 + _454;
    float _464 = -_444;
    float _466 = _464 + _456;
    float _468 = fma(_452, -0.816474258899688720703125, _458);
    float _470 = _101 * _360;
    float _472 = -_440;
    float _474 = _472 + _470;
    float _476 = fma(_468, 0.5, 0.5);
    float _478 = fma(_476, _474, _440);
    float _480 = fma(_476, _462, _442);
    float _482 = fma(_476, _466, _444);
    if (!_216)
    {
        out.m_60.x = _478;
        out.m_60.y = _480;
        out.m_60.z = _482;
        out.m_60.w = _191;
        return out;
    }
    float _484 = _480 * 0.715200006961822509765625;
    float _486 = in.m_62.w;
    float _488 = gl_FragCoord.w;
    float _490 = _486 * _488;
    float _492 = in.m_62.x;
    float _494 = gl_FragCoord.w;
    float _496 = _492 * _494;
    float _498 = in.m_62.y;
    float _500 = gl_FragCoord.w;
    float _502 = _498 * _500;
    float _504 = fma(_478, 0.2125999927520751953125, _484);
    float _506 = in.m_62.z;
    float _508 = gl_FragCoord.w;
    float _510 = _506 * _508;
    bool _512 = 0.5 <= (*spvDescriptorSet0.fp_c15)._m0[653].w;
    float _514 = fma(_482, 0.072200000286102294921875, _504);
    float _516 = 1.0 / _514;
    float _518 = (*spvDescriptorSet0.fp_c15)._m0[2].y;
    if (_512)
    {
        float _520 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _522 = _165 + _520;
        _230 = _522;
    }
    float _524 = _230;
    float _526 = _516 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _528 = precise::clamp(_526, 0.0, 1.0);
    float _530 = fma(_528, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _532 = _101 * _490;
    if (_512)
    {
        float _534 = _524 * 8.0;
        float _536 = precise::clamp(_534, 0.0, 1.0);
        _518 = _536;
    }
    float _538 = _518;
    float _540 = _101 * _502;
    float _542 = _530 * _532;
    float _544 = 0.0 + _205;
    float _546 = precise::clamp(_544, 0.0, 1.0);
    float _548 = _101 * _496;
    float _550 = _101 * _510;
    float _552 = fma(_480, _542, _540);
    float _554 = _546;
    if (_512)
    {
        float _556 = _546 * _538;
        _554 = _556;
    }
    float _558 = _554;
    float _560 = fma(_478, _542, _548);
    float _562 = fma(_482, _542, _550);
    float _564 = 0.0 + _558;
    float _566 = precise::clamp(_564, 0.0, 1.0);
    out.m_60.x = _560;
    out.m_60.y = _552;
    out.m_60.z = _562;
    out.m_60.w = _566;
    return out;
}


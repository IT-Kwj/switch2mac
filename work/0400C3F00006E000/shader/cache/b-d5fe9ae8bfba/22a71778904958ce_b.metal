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
    constant _16* vp_c9 [[id(0)]];
    constant _16* vp_c8 [[id(1)]];
    constant _16* vp_c10 [[id(2)]];
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c16 [[id(4)]];
    constant _16* vp_c13 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    texture2d<float> vp_t_tcb_24 [[id(7)]];
    sampler vp_t_tcb_24Smplr [[id(8)]];
    texture3d<float> vp_t_tcb_32 [[id(9)]];
    sampler vp_t_tcb_32Smplr [[id(10)]];
    texture3d<float> vp_t_tcb_30 [[id(11)]];
    sampler vp_t_tcb_30Smplr [[id(12)]];
    texture2d<float> vp_t_tcb_1C [[id(13)]];
    sampler vp_t_tcb_1CSmplr [[id(14)]];
    sampler vp_t_tcb_24Smplr_w [[id(15)]];
    sampler vp_t_tcb_32Smplr_w [[id(16)]];
    sampler vp_t_tcb_30Smplr_w [[id(17)]];
    sampler vp_t_tcb_1CSmplr_w [[id(18)]];
    constant dm_border_t* dm_border [[id(19)]];
};

struct main0_out
{
    float4 m_59 [[user(locn0)]];
    float4 m_61 [[user(locn1)]];
    float4 m_69 [[user(locn2)]];
    float4 m_89 [[user(locn3)]];
    float4 m_97 [[user(locn4)]];
    float4 m_51 [[user(locn5)]];
    float4 m_65 [[user(locn6)]];
    float4 m_71 [[user(locn7)]];
    float4 m_81 [[user(locn8)]];
    float4 m_83 [[user(locn9)]];
    float4 m_85 [[user(locn10)]];
    float4 m_79 [[user(locn11)]];
    float4 m_95 [[user(locn12)]];
    float4 m_91 [[user(locn13)]];
    float4 m_93 [[user(locn14)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_87 [[attribute(0)]];
    float4 m_67 [[attribute(1)]];
    float4 m_48 [[attribute(2)]];
    float4 m_53 [[attribute(3)]];
    float4 m_75 [[attribute(4)]];
    float4 m_73 [[attribute(5)]];
    float4 m_55 [[attribute(6)]];
    float4 m_57 [[attribute(7)]];
    float4 m_77 [[attribute(8)]];
    float4 m_63 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4976 = false;
    bool _4287 = false;
    bool _638 = false;
    bool _534 = false;
    bool _416 = false;
    bool _194 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _111 = in.m_48.w;
    float _113 = trunc(_111);
    int _116 = int(_113);
    bool _120 = _116 >= 1;
    float _122 = 0.0;
    if (!_120)
    {
        _122 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _124 = _122;
    float _126 = _124;
    if (!_120)
    {
        out.m_51.x = 0.0;
    }
    int _128 = 0;
    if (!_120)
    {
        float _130 = _124 * 5.0;
        _128 = as_type<int>(_130);
    }
    int _132 = _128;
    int _134 = _132;
    if (!_120)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5209 = as_type<float>(_132);
        out.gl_Position.z = _5209;
    }
    if (!_120)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _136 = in.m_53.w;
    bool _138 = _136 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _140 = isnan(_136);
    bool _142 = _138 || _140;
    bool _144 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _146 = _142 || _144;
    float _148 = -_136;
    float _150 = _148 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _152 = _150;
    if (_146)
    {
        float _154 = float(_116);
        _126 = _154;
    }
    float _156 = _126;
    bool _158 = _150 >= _156;
    bool _160 = !_146;
    bool _162 = _158 || _160;
    float _164 = _156;
    if (_162)
    {
        _164 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _166 = _164;
    if (_162)
    {
        out.m_51.x = 0.0;
    }
    if (_162)
    {
        float _168 = _166 * 5.0;
        _134 = as_type<int>(_168);
    }
    int _170 = _134;
    if (_162)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5279 = as_type<float>(_170);
        out.gl_Position.z = _5279;
    }
    if (_162)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _172 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _174 = !_172;
    float _192;
    if (!_174)
    {
        float _176 = in.m_55.x;
        float _178 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _180 = _176 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _182 = fma(_180, (*spvDescriptorSet0.vp_c9)._m0[12].x, _150);
        float _184 = _182 * _178;
        float _186 = floor(_184);
        float _188 = -_186;
        float _190 = _184 + _188;
        _192 = _190;
        _194 = true;
    }
    else
    {
        float _196 = float(_116);
        float _198 = 1.0 / _196;
        float _200 = _150 * _198;
        _192 = _200;
    }
    _194 = false;
    float _202 = _192;
    float _204 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _206 = _202 + _204;
    float _208 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _210 = _202 + _208;
    float _212 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _214 = _202 + _212;
    float _216 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _218 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _216;
    float _220 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _222 = _220 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _224 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _226 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _224;
    float _228 = 1.0 / _218;
    bool _230 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _232 = 1.0 / _226;
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _236 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _234;
    float _238 = 1.0 / _222;
    float _240 = _206 * _228;
    bool _242 = _202 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _244 = isnan(_202);
    bool _246 = _242 || _244;
    bool _248 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _250 = _246 || _248;
    float _252 = float(_250);
    float _254 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _256 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _254;
    float _258 = fma(_236, _240, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _260 = fma(_256, _240, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _262 = _210 * _232;
    bool _264 = _202 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _266 = isnan(_202);
    bool _268 = _264 || _266;
    bool _270 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _272 = _268 || _270;
    float _274 = float(_272);
    float _276 = -_252;
    float _278 = _276 + 1.0;
    float _280 = _274 * _278;
    bool _282 = _202 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _284 = isnan(_202);
    bool _286 = _282 || _284;
    bool _288 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _290 = _286 || _288;
    float _292 = float(_290);
    float _294 = _214 * _238;
    bool _296 = _202 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _298 = isnan(_202);
    bool _300 = _296 || _298;
    bool _302 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _304 = _300 || _302;
    float _306 = float(_304);
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _310 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _308;
    float _312 = -_274;
    float _314 = _312 + 1.0;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _318 = _316 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _320 = fma(_310, _240, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _322 = -_306;
    float _324 = _322 + 1.0;
    float _326 = _306 * _314;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _330 = _328 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _334 = _332 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _336 = _292 * _324;
    float _338 = -_292;
    float _340 = _338 + 1.0;
    float _342 = fma(_318, _294, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _344 = fma(_334, _294, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _346 = _258 * _336;
    float _348 = _260 * _336;
    float _350 = _320 * _336;
    float _352 = fma(_340, (*spvDescriptorSet0.vp_c9)._m0[143].x, _346);
    float _354 = fma(_340, (*spvDescriptorSet0.vp_c9)._m0[143].y, _348);
    float _356 = fma(_340, (*spvDescriptorSet0.vp_c9)._m0[143].z, _350);
    float _358 = fma(_330, _294, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _362 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _360;
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _366 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _364;
    float _368 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _370 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _368;
    float _372 = fma(_342, _326, _352);
    float _374 = fma(_362, _262, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _376 = fma(_366, _262, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _378 = fma(_370, _262, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _380 = fma(_344, _326, _354);
    float _382 = fma(_358, _326, _356);
    float _384 = fma(_374, _280, _372);
    float _386 = fma(_376, _280, _380);
    float _388 = fma(_378, _280, _382);
    float _390 = fma(_252, (*spvDescriptorSet0.vp_c9)._m0[146].x, _384);
    float _392 = fma(_252, (*spvDescriptorSet0.vp_c9)._m0[146].y, _386);
    float _394 = fma(_252, (*spvDescriptorSet0.vp_c9)._m0[146].z, _388);
    bool _396 = !_230;
    float _414;
    if (!_396)
    {
        float _398 = in.m_55.x;
        float _400 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _402 = _398 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _404 = fma(_402, (*spvDescriptorSet0.vp_c9)._m0[11].y, _150);
        float _406 = _404 * _400;
        float _408 = floor(_406);
        float _410 = -_408;
        float _412 = _406 + _410;
        _414 = _412;
        _416 = true;
    }
    else
    {
        float _418 = float(_116);
        float _420 = 1.0 / _418;
        float _422 = _150 * _420;
        _414 = _422;
    }
    _416 = false;
    float _424 = _414;
    float _426 = in.m_57.x;
    float _428 = in.m_57.y;
    float _430 = in.m_57.z;
    bool _432 = _424 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _434 = isnan(_424);
    bool _436 = _432 || _434;
    bool _438 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _440 = _436 || _438;
    float _442 = float(_440);
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _446 = _444 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _448 = _424 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _450 = isnan(_424);
    bool _452 = _448 || _450;
    bool _454 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _456 = _452 || _454;
    float _458 = float(_456);
    float _460 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _462 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _460;
    bool _464 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _466 = 1.0 / _446;
    float _468 = -_442;
    float _470 = _468 + 1.0;
    float _472 = _458 * _470;
    float _474 = -_458;
    float _476 = _474 + 1.0;
    float _478 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _480 = _462 * _466;
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _484 = _424 + _482;
    float _486 = _478 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _488 = _392 * _428;
    float _490 = fma(_480, _484, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _492 = _390 * _426;
    float _494 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _496 = _490 * _472;
    float _498 = _494 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _500 = fma(_476, (*spvDescriptorSet0.vp_c9)._m0[115].x, _496);
    float _502 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _504 = fma(_442, (*spvDescriptorSet0.vp_c9)._m0[116].x, _500);
    float _506 = _394 * _430;
    float _508 = _502 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _510 = _504 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_59.x = _498;
    out.m_59.y = _508;
    out.m_59.z = _486;
    out.m_59.w = _510;
    bool _512 = !_464;
    float _514 = _428;
    float _532;
    if (!_512)
    {
        float _516 = in.m_55.x;
        float _518 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _520 = _516 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _522 = fma(_520, (*spvDescriptorSet0.vp_c9)._m0[11].w, _150);
        float _524 = _522 * _518;
        float _526 = floor(_524);
        float _528 = -_526;
        float _530 = _524 + _528;
        _532 = _530;
        _534 = true;
    }
    else
    {
        float _536 = float(_116);
        float _538 = 1.0 / _536;
        float _540 = _150 * _538;
        _532 = _540;
    }
    _534 = false;
    float _542 = _532;
    bool _544 = _542 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _546 = isnan(_542);
    bool _548 = _544 || _546;
    bool _550 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _552 = _548 || _550;
    float _554 = float(_552);
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _558 = _556 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _560 = _542 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _562 = isnan(_542);
    bool _564 = _560 || _562;
    bool _566 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _568 = _564 || _566;
    float _570 = float(_568);
    float _572 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _574 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _572;
    bool _576 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _578 = 1.0 / _558;
    float _580 = -_554;
    float _582 = _580 + 1.0;
    float _584 = _570 * _582;
    float _586 = -_570;
    float _588 = _586 + 1.0;
    float _590 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _592 = _574 * _578;
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _596 = _542 + _594;
    float _598 = _590 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _600 = fma(_592, _596, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _602 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _604 = _600 * _584;
    float _606 = _602 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _608 = fma(_588, (*spvDescriptorSet0.vp_c9)._m0[131].x, _604);
    float _610 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _612 = fma(_554, (*spvDescriptorSet0.vp_c9)._m0[132].x, _608);
    float _614 = _610 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _616 = _612 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_61.x = _606;
    out.m_61.y = _614;
    out.m_61.z = _598;
    out.m_61.w = _616;
    bool _618 = !_576;
    float _636;
    if (!_618)
    {
        float _620 = in.m_55.x;
        float _622 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _624 = _620 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _626 = fma(_624, (*spvDescriptorSet0.vp_c9)._m0[14].x, _150);
        float _628 = _626 * _622;
        float _630 = floor(_628);
        float _632 = -_630;
        float _634 = _628 + _632;
        _636 = _634;
        _638 = true;
    }
    else
    {
        float _640 = float(_116);
        float _642 = 1.0 / _640;
        float _644 = _150 * _642;
        _636 = _644;
    }
    _638 = false;
    float _646 = _636;
    float _648 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _650 = int(_648);
    float _652 = in.m_55.x;
    float _654 = _492 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _656 = in.m_55.y;
    int _658 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _660 = _658 != 0;
    float _662 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _664 = int(_662);
    float _666 = in.m_55.z;
    int _668 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _670 = _668 != 0;
    int _672 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _674 = _672 != 0;
    float _676 = in.m_63.x;
    float _678 = float(_650);
    float _680 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _682 = int(_680);
    float _684 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _686 = _684 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _688 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _690 = _688 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _692 = float(_664);
    float _694 = 1.0 / _678;
    bool _696 = false;
    if (_670)
    {
        bool _698 = _652 > 0.5;
        _696 = _698;
    }
    bool _700 = _696;
    float _702 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _704 = _702 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _706 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _708 = _706 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _710 = _652 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _712 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _714 = int(_712);
    float _716 = float(uint(_682));
    float _718 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _720 = _718 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    int _722 = ~_682;
    int _724 = _722 + 1;
    int _726 = 0;
    float _728 = _676;
    if (_674)
    {
        float _730 = -_676;
        float _732 = _730 + 1.0;
        _726 = as_type<int>(_732);
    }
    int _734 = _726;
    float _736 = 0.0;
    if (!_670)
    {
        _736 = _676;
    }
    float _738 = _736;
    float _740 = _656 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _742 = _666 > 0.5;
    float _744 = _694 * _150;
    float _746 = 1.0 / _692;
    float _748 = _738;
    if (!_674)
    {
        _514 = _676;
    }
    float _750 = _514;
    float _752 = _750;
    if (_674)
    {
        float _754 = _742 ? as_type<float>(_734) : _676;
        _752 = _754;
    }
    float _756 = _752;
    float _758 = float(_116);
    float _760 = float(uint(_714));
    float _762 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _764 = int(_762);
    int _766 = ~_714;
    int _768 = _766 + 1;
    float _770 = 1.0 / _716;
    float _772 = _746 * _150;
    float _774 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _776 = _774 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _778 = trunc(_744);
    int _780 = int(_778);
    float _782 = float(_764);
    float _784 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _786 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _784;
    float _788 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _790 = 1.0 / _760;
    float _792 = float(uint(_780));
    float _794 = trunc(_772);
    int _796 = int(_794);
    int _798 = as_type<int>(_770) + (-2);
    float _800 = as_type<float>(_798) * _792;
    int _802 = as_type<int>(_790) + (-2);
    float _804 = 1.0 / _782;
    float _806 = _792;
    float _808 = _782;
    if (_660)
    {
        _806 = 1.0;
    }
    float _810 = _806;
    float _812 = _810;
    if (!_660)
    {
        _812 = 7.345489978790283203125;
    }
    float _814 = _812;
    float _816 = trunc(_800);
    float _818 = precise::max(_816, 0.0);
    uint _821 = uint(_818);
    float _823 = float(uint(_796));
    float _825 = _814 * _652;
    float _827 = _823;
    if (_660)
    {
        _808 = 1.0;
    }
    float _829 = _808;
    float _831 = _829;
    if (!_660)
    {
        _831 = 1.2345600128173828125;
    }
    float _833 = _831;
    float _835 = as_type<float>(_802) * _823;
    float _837 = _833;
    if (_660)
    {
        _827 = _652;
    }
    float _839 = _827;
    float _841 = floor(_825);
    float _843 = _839;
    if (!_660)
    {
        _843 = _656;
    }
    float _845 = _843;
    float _847 = _804 * _150;
    float _849 = _845 * _833;
    float _851 = _845;
    if (_660)
    {
        _851 = _652;
    }
    float _853 = _851;
    int _855 = _724 * int(_821);
    int _857 = _855 + _780;
    float _859 = trunc(_835);
    float _861 = precise::max(_859, 0.0);
    uint _863 = uint(_861);
    float _865 = _853;
    if (_660)
    {
        _837 = 1.0;
    }
    float _867 = _837;
    float _869 = _867;
    if (!_660)
    {
        _865 = _666;
    }
    float _871 = _865;
    float _873 = float(uint(_857));
    if (!_660)
    {
        _869 = 5.839270114898681640625;
    }
    float _875 = _869;
    float _877 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _879 = int(_877);
    float _881 = in.m_55.w;
    float _883 = as_type<float>(_798) * _873;
    float _885 = -_841;
    float _887 = _825 + _885;
    float _889 = _871 * _875;
    float _891 = trunc(_883);
    float _893 = precise::max(_891, 0.0);
    uint _895 = uint(_893);
    int _897 = _768 * int(_863);
    int _899 = _897 + _796;
    float _901 = float(uint(_899));
    float _903 = floor(_849);
    float _905 = float(uint(_879));
    float _907 = as_type<float>(_802) * _901;
    int _909 = as_type<int>(_901);
    if (_670)
    {
        float _911 = -_676;
        float _913 = _911 + 1.0;
        _909 = as_type<int>(_913);
    }
    int _915 = _909;
    int _917 = ~_879;
    int _919 = _917 + 1;
    float _921 = floor(_889);
    bool _923 = _881 > 0.5;
    float _925 = float(_682);
    int _927 = int(_821) + int(_895);
    if (_670)
    {
        float _929 = _700 ? as_type<float>(_915) : _676;
        _748 = _929;
    }
    float _931 = _748;
    float _933 = trunc(_907);
    float _935 = precise::max(_933, 0.0);
    uint _937 = uint(_935);
    float _939 = _887 * _925;
    float _941 = float(_780);
    float _943 = -_903;
    float _945 = _849 + _943;
    int _947 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _949 = _947 != 0;
    bool _951 = _941 >= _925;
    bool _953 = isnan(_941);
    bool _955 = _951 || _953;
    bool _957 = isnan(_925);
    bool _959 = _955 || _957;
    float _961 = float(_959);
    float _963 = 1.0 / _905;
    int _965 = ~_682;
    int _967 = _965 + 1;
    float _969 = -_921;
    float _971 = _889 + _969;
    bool _973 = !_949;
    int _975 = _973 ? 0 : 1;
    int _977 = _967 * _927;
    int _979 = _977 + _780;
    float _981 = trunc(_847);
    int _983 = int(_981);
    int _985 = int(_863) + int(_937);
    bool _987 = uint(_979) >= uint(_682);
    int _989 = abs(_975);
    bool _991 = !_987;
    int _993 = _991 ? 0 : (-1);
    float _995 = trunc(_939);
    int _997 = int(_995);
    int _999 = as_type<int>(_963) + (-2);
    int _1001 = ~_927;
    int _1003 = _1001 + _993;
    int _1005 = _1003 + 1;
    int _1007 = ~_714;
    int _1009 = _1007 + 1;
    float _1011 = trunc(_961);
    int _1013 = int(_1011);
    float _1015 = float(uint(_983));
    int _1017 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1019 = _1017 != 0;
    int _1021 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1023 = _1021 != 0;
    int _1025 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1027 = _1025 != 0;
    int _1029 = _1009 * _985;
    int _1031 = _1029 + _796;
    bool _1033 = _682 == 0;
    float _1035 = as_type<float>(_999) * _1015;
    float _1037 = in.m_63.y;
    int _1039 = _997 * _989;
    int _1041 = _1039 + _780;
    bool _1043 = uint(_1031) >= uint(_714);
    float _1045 = trunc(_1035);
    float _1047 = precise::max(_1045, 0.0);
    uint _1049 = uint(_1047);
    int _1051 = _682 * _1005;
    int _1053 = _1051 + _780;
    int _1055 = _682 + (-1);
    bool _1057 = !_1043;
    int _1059 = _1057 ? 0 : (-1);
    int _1061 = ~_1013;
    int _1063 = _1061 + 1;
    int _1065 = _1063 + 1;
    bool _1067 = !_1033;
    int _1069 = _1067 ? _1053 : (-1);
    float _1071 = 1.0 / _758;
    float _1073 = float(_714);
    float _1075 = float(_796);
    int _1077 = _1069 * _1065;
    int _1079 = ~_985;
    int _1081 = _1079 + _1059;
    int _1083 = _1081 + 1;
    int _1085 = _1013 * _1055;
    int _1087 = _1085 + _1077;
    bool _1089 = _1075 >= _1073;
    bool _1091 = isnan(_1075);
    bool _1093 = _1089 || _1091;
    bool _1095 = isnan(_1073);
    bool _1097 = _1093 || _1095;
    float _1099 = float(_1097);
    int _1101 = _919 * int(_1049);
    int _1103 = _1101 + _983;
    int _1105 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1107 = _1105 != 0;
    float _1109 = _1073 * _945;
    float _1111 = trunc(_1099);
    int _1113 = int(_1111);
    bool _1115 = !_1027;
    int _1117 = _1115 ? 0 : 1;
    int _1119 = _714 * _1083;
    int _1121 = _1119 + _796;
    float _1123 = float(uint(_1103));
    float _1125 = -_1037;
    float _1127 = _1125 + 1.0;
    bool _1129 = _656 > 0.5;
    bool _1131 = !_1023;
    int _1133 = _1131 ? 0 : 1;
    float _1135 = as_type<float>(_999) * _1123;
    float _1137 = _925 * _150;
    bool _1139 = !_1107;
    int _1141 = _1139 ? 0 : 1;
    float _1143 = trunc(_1109);
    int _1145 = int(_1143);
    int _1147 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1149 = _1147 != 0;
    float _1151 = _1137 * _1071;
    bool _1153 = _714 == 0;
    float _1155 = _1071 * _150;
    int _1157 = _1129 ? as_type<int>(_1127) : as_type<int>(_1037);
    int _1159 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1161 = _1159 != 0;
    float _1163 = trunc(_1135);
    float _1165 = precise::max(_1163, 0.0);
    uint _1167 = uint(_1165);
    int _1169 = abs(_1133);
    float _1171 = _1073 * _1155;
    int _1173 = _923 ? as_type<int>(_1127) : as_type<int>(_1037);
    float _1175 = _1149 ? as_type<float>(_1157) : _1037;
    int _1177 = _1087 * _1169;
    int _1179 = ~_1113;
    int _1181 = _1179 + 1;
    int _1183 = _1181 + 1;
    float _1185 = trunc(_1151);
    int _1187 = int(_1185);
    bool _1189 = !_1153;
    int _1191 = _1189 ? _1121 : (-1);
    int _1193 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1195 = _1193 != 0;
    int _1197 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1199 = _1197 != 0;
    bool _1201 = !_1019;
    int _1203 = _1201 ? 0 : 1;
    int _1205 = _1183 * _1191;
    bool _1207 = !_1161;
    int _1209 = _1207 ? 0 : 1;
    float _1211 = 1.0 / _686;
    bool _1213 = !_1199;
    int _1215 = _1213 ? 0 : 1;
    int _1217 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1219 = _1217 != 0;
    int _1221 = abs(_1209);
    int _1223 = abs(_1203);
    float _1225 = 1.0 / _690;
    float _1227 = _1219 ? as_type<float>(_1173) : _1037;
    int _1229 = _1145 * _1221;
    int _1231 = _1229 + _796;
    int _1233 = ~_879;
    int _1235 = _1233 + 1;
    int _1237 = _1187 * _1223;
    int _1239 = _1237 + _1177;
    int _1241 = int(_1049) + int(_1167);
    float _1243 = 1.0 / _704;
    int _1245 = abs(_1117);
    int _1247 = _714 + (-1);
    int _1249 = _1235 * _1241;
    int _1251 = _1249 + _983;
    bool _1253 = !_1195;
    int _1255 = _1253 ? 0 : 1;
    int _1257 = _1041 * _1245;
    int _1259 = _1257 + _1239;
    int _1261 = abs(_1141);
    float _1263 = trunc(_1171);
    int _1265 = int(_1263);
    int _1267 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1269 = _1267 != 0;
    int _1271 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1273 = _1271 != 0;
    int _1275 = _1113 * _1247;
    int _1277 = _1275 + _1205;
    int _1279 = abs(_1215);
    int _1281 = _997 * _1261;
    int _1283 = _1281 + _1259;
    int _1285 = abs(_1255);
    bool _1287 = !_1269;
    int _1289 = _1287 ? 0 : 1;
    int _1291 = _1277 * _1279;
    float _1293 = 1.0 / _708;
    bool _1295 = uint(_1251) >= uint(_879);
    bool _1297 = !_1273;
    int _1299 = _1297 ? 0 : 1;
    float _1301 = float(_879);
    int _1303 = _1265 * _1285;
    int _1305 = _1303 + _1291;
    float _1307 = float(_983);
    float _1309 = 1.0 / _720;
    int _1311 = abs(_1289);
    float _1313 = _1301 * _1155;
    int _1315 = abs(_1299);
    bool _1317 = _1307 >= _1301;
    bool _1319 = isnan(_1307);
    bool _1321 = _1317 || _1319;
    bool _1323 = isnan(_1301);
    bool _1325 = _1321 || _1323;
    float _1327 = float(_1325);
    int _1329 = _1231 * _1311;
    int _1331 = _1329 + _1305;
    float _1333 = float(uint(_1283));
    float _1335 = 1.0 / _776;
    bool _1337 = !_1295;
    int _1339 = _1337 ? 0 : (-1);
    float _1341 = as_type<float>(_798) * _1333;
    int _1343 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1345 = _1343 != 0;
    int _1347 = _1145 * _1315;
    int _1349 = _1347 + _1331;
    float _1351 = _1301 * _971;
    float _1353 = trunc(_1327);
    int _1355 = int(_1353);
    int _1357 = ~_1241;
    int _1359 = _1357 + _1339;
    int _1361 = _1359 + 1;
    float _1363 = _666 * 2.0;
    float _1365 = float(uint(_1349));
    bool _1367 = !_1345;
    int _1369 = _1367 ? 0 : 1;
    int _1371 = _879 * _1361;
    int _1373 = _1371 + _983;
    int _1375 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1377 = _1375 != 0;
    int _1379 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1381 = _1379 != 0;
    float _1383 = trunc(_1341);
    float _1385 = precise::max(_1383, 0.0);
    uint _1387 = uint(_1385);
    bool _1389 = _879 == 0;
    float _1391 = as_type<float>(_802) * _1365;
    int _1393 = abs(_1369);
    float _1395 = _786 * _1335;
    int _1397 = ~_682;
    int _1399 = _1397 + 1;
    bool _1401 = !_1389;
    int _1403 = _1401 ? _1373 : (-1);
    float _1405 = trunc(_1351);
    int _1407 = int(_1405);
    bool _1409 = !_1381;
    int _1411 = _1409 ? 0 : 1;
    int _1413 = ~_1355;
    int _1415 = _1413 + 1;
    int _1417 = _1415 + 1;
    int _1419 = _879 + (-1);
    float _1421 = trunc(_1391);
    float _1423 = precise::max(_1421, 0.0);
    uint _1425 = uint(_1423);
    int _1427 = _1399 * int(_1387);
    int _1429 = _1427 + _1283;
    int _1431 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1433 = _1431 != 0;
    int _1435 = _1417 * _1403;
    int _1437 = ~_714;
    int _1439 = _1437 + 1;
    bool _1441 = _666 > 0.5;
    int _1443 = _1355 * _1419;
    int _1445 = _1443 + _1435;
    float _1447 = trunc(_1313);
    int _1449 = int(_1447);
    int _1451 = _1407 * _1393;
    int _1453 = _1451 + _983;
    int _1455 = abs(_1411);
    float _1457 = float(uint(_1429));
    bool _1459 = !_1377;
    int _1461 = _1459 ? 0 : 1;
    bool _1463 = !_1433;
    int _1465 = _1463 ? 0 : 1;
    float _1467 = as_type<float>(_798) * _1457;
    int _1469 = _1445 * _1455;
    int _1471 = abs(_1461);
    int _1473 = _1439 * int(_1425);
    int _1475 = _1473 + _1349;
    float _1477 = trunc(_1467);
    float _1479 = precise::max(_1477, 0.0);
    uint _1481 = uint(_1479);
    int _1483 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1485 = _1483 != 0;
    int _1487 = abs(_1465);
    bool _1489 = !_1485;
    int _1491 = _1489 ? 0 : 1;
    float _1493 = floor(_1363);
    float _1495 = float(uint(_1475));
    int _1497 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1499 = _1497 != 0;
    int _1501 = _1449 * _1471;
    int _1503 = _1501 + _1469;
    int _1505 = abs(_1491);
    float _1507 = as_type<float>(_802) * _1495;
    int _1509 = ~_682;
    int _1511 = _1509 + 1;
    int _1513 = _1453 * _1487;
    int _1515 = _1513 + _1503;
    int _1517 = int(_1387) + int(_1481);
    float _1519 = trunc(_1507);
    float _1521 = precise::max(_1519, 0.0);
    uint _1523 = uint(_1521);
    int _1525 = _1407 * _1505;
    int _1527 = _1525 + _1515;
    float _1529 = _1037;
    float _1531 = as_type<float>(_1169);
    if (_1499)
    {
        float _1533 = _1441 ? _1127 : _1037;
        _1529 = _1533;
    }
    float _1535 = _1529;
    int _1537 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1539 = _1537 != 0;
    int _1541 = _1511 * _1517;
    int _1543 = _1541 + _1283;
    float _1545 = float(uint(_1527));
    float _1547 = float(uint(_1041));
    bool _1549 = uint(_1543) >= uint(_682);
    float _1551 = as_type<float>(_999) * _1545;
    int _1553 = ~_714;
    int _1555 = _1553 + 1;
    float _1557 = as_type<float>(_798) * _1547;
    bool _1559 = !_1549;
    int _1561 = _1559 ? 0 : (-1);
    float _1563 = trunc(_1551);
    float _1565 = precise::max(_1563, 0.0);
    uint _1567 = uint(_1565);
    int _1569 = int(_1425) + int(_1523);
    int _1571 = int(_1523);
    if (_1539)
    {
        float _1573 = -_676;
        float _1575 = _1573 + 1.0;
        _1571 = as_type<int>(_1575);
    }
    int _1577 = _1571;
    int _1579 = ~_1517;
    int _1581 = _1579 + _1561;
    int _1583 = _1581 + 1;
    int _1585 = ~_879;
    int _1587 = _1585 + 1;
    if (_1539)
    {
        float _1589 = _1129 ? as_type<float>(_1577) : _676;
        _728 = _1589;
    }
    float _1591 = _728;
    float _1593 = trunc(_1557);
    float _1595 = precise::max(_1593, 0.0);
    uint _1597 = uint(_1595);
    int _1599 = _682 * _1583;
    int _1601 = _1599 + _1283;
    bool _1603 = _682 == 0;
    int _1605 = _1555 * _1569;
    int _1607 = _1605 + _1349;
    bool _1609 = !_1603;
    int _1611 = _1609 ? _1601 : (-1);
    int _1613 = ~_682;
    int _1615 = _1613 + 1;
    int _1617 = _1587 * int(_1567);
    int _1619 = _1617 + _1527;
    int _1621 = _1611 & 3;
    bool _1623 = _1621 != 0;
    int _1625 = _1611 & 3;
    bool _1627 = _1625 != 0;
    bool _1629 = uint(_1607) >= uint(_714);
    int _1631 = _1615 * int(_1597);
    int _1633 = _1631 + _1041;
    int _1635 = _1623 ? 0 : 1;
    bool _1637 = uint(_1625) >= 2u;
    bool _1639 = !_1629;
    int _1641 = _1639 ? 0 : (-1);
    float _1643 = float(uint(_1619));
    int _1645 = _1637 ? 0 : 1;
    bool _1647 = uint(_1625) > 1u;
    float _1649 = as_type<float>(_999) * _1643;
    bool _1651 = _1625 != 3;
    int _1653 = ~_1569;
    int _1655 = _1653 + _1641;
    int _1657 = _1655 + 1;
    float _1659 = float(uint(_1633));
    float _1661 = trunc(_1649);
    float _1663 = precise::max(_1661, 0.0);
    uint _1665 = uint(_1663);
    bool _1667 = _714 == 0;
    int _1669 = _714 * _1657;
    int _1671 = _1669 + _1349;
    int _1673 = ~_1635;
    int _1675 = _1673 + 1;
    int _1677 = _1675 + 1;
    float _1679 = as_type<float>(_798) * _1659;
    int _1681 = ~_1645;
    int _1683 = _1681 + 1;
    int _1685 = _1683 + 1;
    bool _1687 = !_1667;
    int _1689 = _1687 ? _1671 : (-1);
    int _1691 = _1677;
    int _1693 = _1685;
    if (!_1647)
    {
        int _1695 = ~_1635;
        int _1697 = _1695 + 1;
        _1691 = _1697;
    }
    int _1699 = _1691;
    float _1701 = trunc(_1679);
    float _1703 = precise::max(_1701, 0.0);
    uint _1705 = uint(_1703);
    if (_1651)
    {
        int _1707 = ~_1645;
        int _1709 = _1707 + 1;
        _1693 = _1709;
    }
    int _1711 = _1693;
    int _1713 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1715 = _1713 != 0;
    int _1717 = _1689 & 3;
    bool _1719 = _1717 != 0;
    bool _1721 = !_1715;
    int _1723 = _1721 ? 0 : 1;
    bool _1725 = uint(_1717) >= 2u;
    int _1727 = ~_879;
    int _1729 = _1727 + 1;
    int _1731 = _1725 ? 0 : 1;
    bool _1733 = _1717 != 3;
    int _1735 = int(_1567) + int(_1665);
    int _1737 = ~_682;
    int _1739 = _1737 + 1;
    int _1741 = int(_1597) + int(_1705);
    int _1743 = _1729 * _1735;
    int _1745 = _1743 + _1527;
    int _1747 = ~_1731;
    int _1749 = _1747 + 1;
    int _1751 = _1749 + 1;
    int _1753 = _1719 ? 0 : 1;
    bool _1755 = uint(_1745) >= uint(_879);
    int _1757 = _1751;
    int _1759 = _1739;
    if (_1733)
    {
        int _1761 = ~_1731;
        int _1763 = _1761 + 1;
        _1757 = _1763;
    }
    int _1765 = _1757;
    int _1767 = _1739 * _1741;
    int _1769 = _1767 + _1041;
    float _1771 = float(uint(_1231));
    bool _1773 = !_1755;
    int _1775 = _1773 ? 0 : (-1);
    bool _1777 = uint(_1769) >= uint(_682);
    float _1779 = as_type<float>(_802) * _1771;
    float _1781 = float(uint(_1453));
    int _1783 = ~_1735;
    int _1785 = _1783 + _1775;
    int _1787 = _1785 + 1;
    float _1789 = trunc(_1779);
    float _1791 = precise::max(_1789, 0.0);
    uint _1793 = uint(_1791);
    bool _1795 = uint(_1717) > 1u;
    float _1797 = as_type<float>(_999) * _1781;
    int _1799 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1801 = _1799 != 0;
    int _1803 = _879 * _1787;
    int _1805 = _1803 + _1527;
    int _1807 = ~_714;
    int _1809 = _1807 + 1;
    float _1811 = _652 * 2.0;
    int _1813 = ~_879;
    int _1815 = _1813 + 1;
    float _1817 = trunc(_1797);
    float _1819 = precise::max(_1817, 0.0);
    uint _1821 = uint(_1819);
    bool _1823 = !_1389;
    int _1825 = _1823 ? _1805 : (-1);
    int _1827 = ~_1753;
    int _1829 = _1827 + 1;
    int _1831 = _1829 + 1;
    bool _1833 = _646 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1835 = isnan(_646);
    bool _1837 = _1833 || _1835;
    bool _1839 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1841 = _1837 || _1839;
    float _1843 = float(_1841);
    int _1845 = _1831;
    int _1847 = as_type<int>(_1781);
    float _1849 = _1811;
    if (!_1795)
    {
        int _1851 = ~_1753;
        int _1853 = _1851 + 1;
        _1845 = _1853;
    }
    int _1855 = _1845;
    int _1857 = _1809 * int(_1793);
    int _1859 = _1857 + _1231;
    if (_1801)
    {
        _1759 = 0;
    }
    int _1861 = _1759;
    float _1863 = floor(_1811);
    int _1865 = _1825 & 3;
    bool _1867 = _1865 != 0;
    float _1869 = -_1843;
    float _1871 = _1869 + 1.0;
    float _1873 = float(uint(_1859));
    int _1875 = _1861;
    if (!_1801)
    {
        _1875 = 1;
    }
    int _1877 = _1875;
    int _1879 = _1815 * int(_1821);
    int _1881 = _1879 + _1453;
    float _1883 = _1867 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _1885 = as_type<float>(_802) * _1873;
    bool _1887 = _1877 != 1;
    float _1889 = _656 * 2.0;
    float _1891 = float(uint(_1881));
    float _1893 = trunc(_1885);
    float _1895 = precise::max(_1893, 0.0);
    uint _1897 = uint(_1895);
    float _1899 = _1883;
    if (_1801)
    {
        _1847 = 0;
    }
    int _1901 = _1847;
    int _1903 = _1901;
    if (!_1801)
    {
        _1903 = 2;
    }
    int _1905 = _1903;
    float _1907 = as_type<float>(_999) * _1891;
    bool _1909 = !_1777;
    int _1911 = _1909 ? 0 : (-1);
    bool _1913 = _1865 != 3;
    bool _1915 = uint(_1865) > 1u;
    float _1917 = trunc(_1907);
    float _1919 = precise::max(_1917, 0.0);
    uint _1921 = uint(_1919);
    bool _1923 = uint(_1865) >= 2u;
    float _1925 = as_type<float>(_1905);
    if (!_1887)
    {
        _1849 = _656;
    }
    float _1927 = _1849;
    float _1929 = _1923 ? 0.0 : 1.4012984643248170709237295832899e-45;
    int _1931 = ~as_type<int>(_1883);
    int _1933 = _1931 + 1;
    int _1935 = _1933 + 1;
    int _1937 = ~as_type<int>(_1929);
    int _1939 = _1937 + 1;
    int _1941 = _1939 + 1;
    bool _1943 = _1905 != 2;
    int _1945 = _1941;
    int _1947 = _1935;
    float _1949 = _1929;
    float _1951 = _1927;
    if (_1913)
    {
        int _1953 = ~as_type<int>(_1929);
        int _1955 = _1953 + 1;
        _1945 = _1955;
    }
    int _1957 = _1945;
    if (!_1915)
    {
        int _1959 = ~as_type<int>(_1883);
        int _1961 = _1959 + 1;
        _1947 = _1961;
    }
    int _1963 = _1947;
    int _1965 = ~_714;
    int _1967 = _1965 + 1;
    float _1969 = as_type<float>(_1967);
    if (!_1887)
    {
        _1925 = _1927;
    }
    float _1971 = _1925;
    float _1973 = _1971;
    if (!_1887)
    {
        _1949 = _666;
    }
    float _1975 = _1949;
    float _1977 = _1975;
    if (!_1887)
    {
        _1899 = _666;
    }
    float _1979 = _1899;
    float _1981 = _1979;
    if (_1887)
    {
        _1973 = _652;
    }
    float _1983 = _1973;
    if (_1887)
    {
        _1951 = _652;
    }
    float _1985 = _1951;
    if (_1887)
    {
        _1977 = _656;
    }
    float _1987 = _1977;
    float _1989 = _1983 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_1887)
    {
        _1981 = _656;
    }
    float _1991 = _1981;
    int _1993 = int(_1793) + int(_1897);
    bool _1995 = _1863 > 0.0;
    float _1997 = floor(_1889);
    bool _1999 = _1863 >= 0.0;
    bool _2001 = isnan(_1863);
    bool _2003 = _1999 || _2001;
    bool _2005 = isnan(0.0);
    bool _2007 = _2003 || _2005;
    int _2009 = int(_1821) + int(_1921);
    if (_1943)
    {
        _1531 = _652;
    }
    float _2011 = _1531;
    int _2013 = _1967 * _1993;
    int _2015 = _2013 + _1231;
    float _2017 = _2011;
    if (_1943)
    {
        _1969 = _656;
    }
    float _2019 = _1969;
    int _2021 = ~_879;
    int _2023 = _2021 + 1;
    float _2025 = _2019;
    if (!_1943)
    {
        _2017 = _666;
    }
    float _2027 = _2017;
    if (!_1943)
    {
        _2025 = _652;
    }
    float _2029 = _2025;
    bool _2031 = uint(_2015) >= uint(_714);
    float _2033 = _2027 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    int _2035 = _2007 ? 0 : 1;
    float _2037 = _2029 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _2039 = ~_1741;
    int _2041 = _2039 + _1911;
    int _2043 = _2041 + 1;
    float _2045 = fma(_2037, -2.0, _788);
    bool _2047 = !_2031;
    int _2049 = _2047 ? 0 : (-1);
    bool _2051 = _1997 > 0.0;
    int _2053 = _2023 * _2009;
    int _2055 = _2053 + _1453;
    bool _2057 = _1997 >= 0.0;
    bool _2059 = isnan(_1997);
    bool _2061 = _2057 || _2059;
    bool _2063 = isnan(0.0);
    bool _2065 = _2061 || _2063;
    int _2067 = _682 * _2043;
    int _2069 = _2067 + _1041;
    int _2071 = ~_2035;
    int _2073 = _2071 + 1;
    int _2075 = _2073 + 1;
    float _2077 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2045);
    int _2079 = _2075;
    int _2081 = as_type<int>(_2029);
    if (!_1995)
    {
        int _2083 = ~_2035;
        int _2085 = _2083 + 1;
        _2079 = _2085;
    }
    int _2087 = _2079;
    float _2089 = in.m_48.x;
    float _2091 = in.m_48.y;
    float _2093 = in.m_48.z;
    int _2095 = _2065 ? 0 : 1;
    bool _2097 = uint(_2055) >= uint(_879);
    float _2099 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2101 = _2099 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    int _2103 = ~_2095;
    int _2105 = _2103 + 1;
    int _2107 = _2105 + 1;
    int _2109 = _2107;
    if (!_2051)
    {
        int _2111 = ~_2095;
        int _2113 = _2111 + 1;
        _2109 = _2113;
    }
    int _2115 = _2109;
    float _2117 = 1.0 / _2101;
    bool _2119 = !_1603;
    int _2121 = _2119 ? _2069 : (-1);
    bool _2123 = !_2097;
    int _2125 = _2123 ? 0 : (-1);
    int _2127 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2129 = _2127 != 0;
    int _2131 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2133 = _2131 != 0;
    int _2135 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2137 = _2135 != 0;
    int _2139 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2141 = _2139 != 0;
    int _2143 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2145 = _2143 != 0;
    float _2147 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2149 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2151 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2153 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2151;
    float _2155 = _2091 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _2157 = -_2147;
    float _2159 = fma(_710, 2.0, _2157);
    float _2161 = fma(_740, -2.0, _2149);
    float _2163 = _2091 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _2165 = _2091 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _2167 = _2153 * _1211;
    float _2169 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2171 = _2169 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2173 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2175 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2173;
    float _2177 = fma(_2089, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2163);
    float _2179 = _2171 * _1225;
    float _2181 = fma(_2089, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2165);
    float _2183 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2185 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2183;
    float _2187 = fma(_2089, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2155);
    float _2189 = _2175 * _2117;
    float _2191 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2193 = _2191 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2195 = _2185 * _1243;
    float _2197 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2199 = _2197 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2201 = _652 + _656;
    bool _2203 = _646 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2205 = isnan(_646);
    bool _2207 = _2203 || _2205;
    bool _2209 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2211 = _2207 || _2209;
    float _2213 = float(_2211);
    float _2215 = _656 + _666;
    float _2217 = _2193 * _1293;
    float _2219 = _2199 * _1309;
    float _2221 = _2201 + (-1.0);
    float _2223 = _2215 + (-1.0);
    bool _2225 = _646 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2227 = isnan(_646);
    bool _2229 = _2225 || _2227;
    bool _2231 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2233 = _2229 || _2231;
    float _2235 = float(_2233);
    float _2237 = -_2213;
    float _2239 = _2237 + 1.0;
    float _2241 = fma(_2093, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2181);
    float _2243 = fma(_2221, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _2245 = fma(_2093, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2187);
    float _2247 = _2235 * _2239;
    float _2249 = -_2235;
    float _2251 = _2249 + 1.0;
    bool _2253 = _646 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2255 = isnan(_646);
    bool _2257 = _2253 || _2255;
    bool _2259 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2261 = _2257 || _2259;
    float _2263 = float(_2261);
    float _2265 = fma(_2223, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _2267 = !_2129;
    int _2269 = _2267 ? 0 : 1;
    float _2271 = _1843 * _2251;
    bool _2273 = _646 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2275 = isnan(_646);
    bool _2277 = _2273 || _2275;
    bool _2279 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2281 = _2277 || _2279;
    float _2283 = float(_2281);
    float _2285 = _2263 * _1871;
    float _2287 = -_2263;
    float _2289 = _2287 + 1.0;
    float _2291 = fma(_2093, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2177);
    bool _2293 = _646 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2295 = isnan(_646);
    bool _2297 = _2293 || _2295;
    bool _2299 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2301 = _2297 || _2299;
    float _2303 = float(_2301);
    float _2305 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2307 = _646 + _2305;
    bool _2309 = _1493 >= 0.0;
    bool _2311 = isnan(_1493);
    bool _2313 = _2309 || _2311;
    bool _2315 = isnan(0.0);
    bool _2317 = _2313 || _2315;
    float _2319 = _2283 * _2289;
    bool _2321 = _646 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2323 = isnan(_646);
    bool _2325 = _2321 || _2323;
    bool _2327 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2329 = _2325 || _2327;
    float _2331 = float(_2329);
    float _2333 = -_2303;
    float _2335 = _2333 + 1.0;
    int _2337 = _2317 ? 0 : 1;
    float _2339 = fma(_2167, _2307, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _2341 = _1493 > 0.0;
    float _2343 = _2331 * _2335;
    bool _2345 = _646 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2347 = isnan(_646);
    bool _2349 = _2345 || _2347;
    bool _2351 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2353 = _2349 || _2351;
    float _2355 = float(_2353);
    float _2357 = -_2283;
    float _2359 = _2357 + 1.0;
    float _2361 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2363 = _646 + _2361;
    float _2365 = _2339 * _2343;
    float _2367 = -_2331;
    float _2369 = _2367 + 1.0;
    float _2371 = -_2355;
    float _2373 = _2371 + 1.0;
    float _2375 = _2355 * _2359;
    float _2377 = fma(_2179, _2363, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2379 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2381 = _646 + _2379;
    float _2383 = _2303 * _2373;
    float _2385 = fma(_2369, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2365);
    float _2387 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2389 = _646 + _2387;
    float _2391 = fma(_2189, _2381, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2393 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2395 = _646 + _2393;
    float _2397 = fma(_2377, _2383, _2385);
    float _2399 = fma(_2217, _2389, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    bool _2401 = !_1627;
    int _2403 = _2401 ? 0 : 1;
    float _2405 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2407 = _646 + _2405;
    float _2409 = fma(_2391, _2375, _2397);
    int _2411 = _1689 & 3;
    bool _2413 = _2411 != 0;
    float _2415 = fma(_2195, _2395, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2417 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2419 = _646 + _2417;
    float _2421 = fma(_2399, _2319, _2409);
    float _2423 = _2291 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _2425 = !_2413;
    int _2427 = _2425 ? 0 : 1;
    float _2429 = fma(_1395, _2419, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    int _2431 = _1825 & 3;
    bool _2433 = _2431 != 0;
    float _2435 = _2241 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _2437 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    bool _2439 = !_2433;
    int _2441 = _2439 ? 0 : 1;
    float _2443 = fma(_2415, _2285, _2421);
    float _2445 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _2447 = _1625 != 3;
    float _2449 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2451 = _2435 + _2449;
    int _2453 = ~_2337;
    int _2455 = _2453 + 1;
    int _2457 = _2455 + 1;
    float _2459 = -_2437;
    float _2461 = fma(_2033, 2.0, _2459);
    int _2463 = _2457;
    if (!_2341)
    {
        int _2465 = ~_2337;
        int _2467 = _2465 + 1;
        _2463 = _2467;
    }
    int _2469 = _2463;
    float _2471 = _2245 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2473 = fma(_1985, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2445);
    float _2475 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2477 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2479 = _2423 + _2477;
    float _2481 = _2451 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _2483 = !_2447;
    int _2485 = _2483 ? 0 : (-1);
    float _2487 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2489 = _2471 + _2487;
    bool _2491 = _1717 != 3;
    float _2493 = fma(_2479, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2481);
    float _2495 = fma(_1991, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2475);
    int _2497 = _1611 >> 31;
    float _2499 = fma(_2219, _2407, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    bool _2501 = !_2491;
    int _2503 = _2501 ? 0 : (-1);
    float _2505 = -_150;
    float _2507 = fma(_2505, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2461);
    bool _2509 = _1865 != 3;
    float _2511 = fma(_2489, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2493);
    int _2513 = _2497 & 3;
    float _2515 = fma(_2499, _2271, _2443);
    int _2517 = _1689 >> 31;
    float _2519 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2473);
    bool _2521 = !_2509;
    int _2523 = _2521 ? 0 : (-1);
    float _2525 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2495);
    bool _2527 = _2511 >= 0.0;
    float _2529 = fma(_2429, _2247, _2515);
    int _2531 = _1611 + _2513;
    int _2533 = _2517 & 3;
    float _2535 = fma(_2213, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2529);
    int _2537 = _2531 >> 2;
    int _2539 = _1689 + _2533;
    float _2541 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _2543 = _2537 << 4;
    int _2545 = _2543 + 368;
    out.m_65.x = _2535;
    int _2547 = _2539 >> 2;
    float _2549 = -_2541;
    float _2551 = fma(_1989, 2.0, _2549);
    int _2553 = _1825 >> 31;
    uint _2555 = uint(int(uint(_2545) >> uint(2)));
    uint _2557 = uint(int(uint(int(_2555)) >> uint(2)));
    int _2559 = int(_2555) & 3;
    float _2561 = (*spvDescriptorSet0.vp_c9)._m0[int(_2557)][_2559];
    int _2563 = int(_2555) + 1;
    uint _2565 = uint(int(uint(_2563) >> uint(2)));
    int _2567 = _2563 & 3;
    float _2569 = (*spvDescriptorSet0.vp_c9)._m0[int(_2565)][_2567];
    int _2571 = _2547 << 4;
    int _2573 = _2571 + 512;
    float _2575 = -_150;
    float _2577 = fma(_2575, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2551);
    float _2579 = _2519;
    if (_2527)
    {
        out.m_51.x = 0.0;
    }
    int _2581 = abs(_2269);
    float _2583 = _1987 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _2585 = _2553 & 3;
    uint _2587 = uint(int(uint(_2573) >> uint(2)));
    uint _2589 = uint(int(uint(int(_2587)) >> uint(2)));
    int _2591 = int(_2587) & 3;
    float _2593 = (*spvDescriptorSet0.vp_c9)._m0[int(_2589)][_2591];
    int _2595 = int(_2587) + 1;
    uint _2597 = uint(int(uint(_2595) >> uint(2)));
    int _2599 = _2595 & 3;
    float _2601 = (*spvDescriptorSet0.vp_c9)._m0[int(_2597)][_2599];
    float _2603 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2605 = float(_2469);
    int _2607 = _1825 + _2585;
    float _2609 = fma(_2583, -2.0, _2603);
    float _2611 = float(_2581);
    float _2613 = in.m_67.x;
    float _2615 = in.m_67.y;
    float _2617 = in.m_67.z;
    int _2619 = _2607 >> 2;
    int _2621 = _2545 + 8;
    uint _2623 = uint(int(uint(_2621) >> uint(2)));
    uint _2625 = uint(int(uint(int(_2623)) >> uint(2)));
    int _2627 = int(_2623) & 3;
    float _2629 = (*spvDescriptorSet0.vp_c9)._m0[int(_2625)][_2627];
    int _2631 = int(_2623) + 1;
    uint _2633 = uint(int(uint(_2631) >> uint(2)));
    int _2635 = _2631 & 3;
    float _2637 = (*spvDescriptorSet0.vp_c9)._m0[int(_2633)][_2635];
    bool _2639 = !_2133;
    int _2641 = _2639 ? 0 : 1;
    float _2643 = _2611 * _2605;
    int _2645 = _2619 << 4;
    int _2647 = _2645 + 656;
    float _2649 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2609);
    int _2651 = abs(_2641);
    float _2653 = _2643 * (-2.0);
    float _2655 = float(_2087);
    uint _2657 = uint(int(uint(_2647) >> uint(2)));
    uint _2659 = uint(int(uint(int(_2657)) >> uint(2)));
    int _2661 = int(_2657) & 3;
    float _2663 = (*spvDescriptorSet0.vp_c9)._m0[int(_2659)][_2661];
    int _2665 = int(_2657) + 1;
    uint _2667 = uint(int(uint(_2665) >> uint(2)));
    int _2669 = _2665 & 3;
    float _2671 = (*spvDescriptorSet0.vp_c9)._m0[int(_2667)][_2669];
    float _2673 = float(_2651);
    float _2675 = 0.0;
    if (_2527)
    {
        _2675 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2677 = _2675;
    float _2679 = fma(_2243, _2653, _2243);
    int _2681 = ~_1993;
    int _2683 = _2681 + _2049;
    int _2685 = _2683 + 1;
    float _2687 = _2673 * _2655;
    int _2689 = ~_2009;
    int _2691 = _2689 + _2125;
    int _2693 = _2691 + 1;
    if (_2527)
    {
        float _2695 = _2677 * 5.0;
        _2081 = as_type<int>(_2695);
    }
    int _2697 = _2081;
    int _2699 = abs(_2427);
    float _2701 = _2687 * (-2.0);
    int _2703 = abs(_1723);
    int _2705 = _879 * _2693;
    int _2707 = _2705 + _1453;
    if (_2527)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _8991 = as_type<float>(_2697);
        out.gl_Position.z = _8991;
    }
    float _2709 = fma(_2653, _2613, _2613);
    int _2711 = abs(_1699);
    int _2713 = _714 * _2685;
    int _2715 = _2713 + _1231;
    int _2717 = abs(_1855);
    int _2719 = _2573 + 8;
    uint _2721 = uint(int(uint(_2719) >> uint(2)));
    uint _2723 = uint(int(uint(int(_2721)) >> uint(2)));
    int _2725 = int(_2721) & 3;
    float _2727 = (*spvDescriptorSet0.vp_c9)._m0[int(_2723)][_2725];
    int _2729 = int(_2721) + 1;
    uint _2731 = uint(int(uint(_2729) >> uint(2)));
    int _2733 = _2729 & 3;
    float _2735 = (*spvDescriptorSet0.vp_c9)._m0[int(_2731)][_2733];
    int _2737 = ~_2711;
    int _2739 = _2737 + 1;
    int _2741 = _2739 + 1;
    int _2743 = abs(_1963);
    int _2745 = abs(_1711);
    float _2747 = fma(_2701, _2615, _2615);
    int _2749 = ~_2717;
    int _2751 = _2749 + 1;
    int _2753 = _2751 + 1;
    int _2755 = _2741 * as_type<int>(_2569);
    int _2757 = abs(_2403);
    int _2759 = _2647 + 8;
    uint _2761 = uint(int(uint(_2759) >> uint(2)));
    uint _2763 = uint(int(uint(int(_2761)) >> uint(2)));
    int _2765 = int(_2761) & 3;
    float _2767 = (*spvDescriptorSet0.vp_c9)._m0[int(_2763)][_2765];
    int _2769 = int(_2761) + 1;
    uint _2771 = uint(int(uint(_2769) >> uint(2)));
    int _2773 = _2769 & 3;
    float _2775 = (*spvDescriptorSet0.vp_c9)._m0[int(_2771)][_2773];
    int _2777 = ~_2699;
    int _2779 = _2777 + 1;
    int _2781 = _2779 + 1;
    int _2783 = _2753 * as_type<int>(_2601);
    int _2785 = ~_2757;
    int _2787 = _2785 + 1;
    int _2789 = _2787 + 1;
    float _2791 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2793 = int(_2791);
    int _2795 = ~_2745;
    int _2797 = _2795 + 1;
    int _2799 = _2797 + 1;
    int _2801 = _2781 * as_type<int>(_2593);
    int _2803 = _2801 + _2783;
    int _2805 = ~_2743;
    int _2807 = _2805 + 1;
    int _2809 = _2807 + 1;
    int _2811 = _2789 * as_type<int>(_2561);
    int _2813 = _2811 + _2755;
    int _2815 = abs(_2441);
    float _2817 = fma(_2265, _2701, _2265);
    bool _2819 = _714 == 0;
    int _2821 = _2799 * as_type<int>(_2629);
    int _2823 = _2821 + _2813;
    int _2825 = abs(_2485);
    float _2827 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2829 = int(_2827);
    int _2831 = ~_2815;
    int _2833 = _2831 + 1;
    int _2835 = _2833 + 1;
    int _2837 = ~_2825;
    int _2839 = _2837 + 1;
    int _2841 = _2839 + 1;
    int _2843 = _2809 * as_type<int>(_2671);
    float _2845 = float(uint(_2793));
    int _2847 = _2841 * as_type<int>(_2637);
    int _2849 = _2847 + _2823;
    int _2851 = abs(_1765);
    float _2853 = 1.0 / _2845;
    int _2855 = _2835 * as_type<int>(_2663);
    int _2857 = _2855 + _2843;
    int _2859 = ~_2703;
    int _2861 = _2859 + 1;
    int _2863 = _2861 + 1;
    float _2865 = -_150;
    float _2867 = fma(_2865, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2159);
    int _2869 = ~_2851;
    int _2871 = _2869 + 1;
    int _2873 = _2871 + 1;
    int _2875 = abs(_2503);
    int _2877 = _2849 * _2863;
    int _2879 = abs(_1957);
    float _2881 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _2883 = int(_2881);
    int _2885 = ~_2875;
    int _2887 = _2885 + 1;
    int _2889 = _2887 + 1;
    int _2891 = _2121 * _2703;
    int _2893 = _2891 + _2877;
    int _2895 = ~_2879;
    int _2897 = _2895 + 1;
    int _2899 = _2897 + 1;
    int _2901 = _2873 * as_type<int>(_2727);
    int _2903 = _2901 + _2803;
    int _2905 = abs(_2523);
    int _2907 = as_type<int>(_2853) + (-2);
    int _2909 = _2889 * as_type<int>(_2735);
    int _2911 = _2909 + _2903;
    float _2913 = float(uint(_2893));
    float _2915 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2917 = log2(_2915);
    float _2919 = float(uint(_2829));
    bool _2921 = !_2145;
    int _2923 = _2921 ? 0 : 1;
    float _2925 = as_type<float>(_2907) * _2913;
    int _2927 = _2899 * as_type<int>(_2767);
    int _2929 = _2927 + _2857;
    bool _2931 = !_2141;
    int _2933 = _2931 ? 0 : 1;
    int _2935 = ~_2905;
    int _2937 = _2935 + 1;
    int _2939 = _2937 + 1;
    float _2941 = 1.0 / _2919;
    int _2943 = abs(_2933);
    int _2945 = abs(_2923);
    int _2947 = _2939 * as_type<int>(_2775);
    int _2949 = _2947 + _2929;
    int _2951 = ~_2943;
    int _2953 = _2951 + 1;
    int _2955 = _2953 + 1;
    bool _2957 = !_2819;
    int _2959 = _2957 ? _2715 : (-1);
    float _2961 = trunc(_2925);
    float _2963 = precise::max(_2961, 0.0);
    uint _2965 = uint(_2963);
    int _2967 = abs(_2793);
    int _2969 = _2955 * _2911;
    float _2971 = float(uint(_2883));
    float _2973 = _2917 * _150;
    int _2975 = ~_2793;
    int _2977 = _2975 + 1;
    int _2979 = _2959 * _2943;
    int _2981 = _2979 + _2969;
    int _2983 = ~_2945;
    int _2985 = _2983 + 1;
    int _2987 = _2985 + 1;
    float _2989 = exp2(_2973);
    float _2991 = float(uint(_2967));
    int _2993 = abs(_2829);
    int _2995 = _2987 * _2949;
    bool _2997 = !_1389;
    int _2999 = _2997 ? _2707 : (-1);
    float _3001 = float(uint(_2993));
    int _3003 = _2977 * int(_2965);
    int _3005 = _3003 + _2893;
    float _3007 = 1.0 / _2971;
    int _3009 = abs(_2883);
    int _3011 = as_type<int>(_2941) + (-2);
    float _3013 = float(uint(_3005));
    int _3015 = _2999 * _2945;
    int _3017 = _3015 + _2995;
    float _3019 = float(uint(_2981));
    float _3021 = 1.0 / _2991;
    float _3023 = float(uint(_3009));
    float _3025 = as_type<float>(_2907) * _3013;
    float _3027 = as_type<float>(_3011) * _3019;
    float _3029 = -_2989;
    float _3031 = _3029 + 1.0;
    int _3033 = abs(_2893);
    float _3035 = 1.0 / _3001;
    float _3037 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _3039 = 1.0 + _3037;
    float _3041 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _3043 = as_type<int>(_3007) + (-2);
    float _3045 = float(uint(_3017));
    float _3047 = fma(_652, (*spvDescriptorSet0.vp_c9)._m0[78].z, _3041);
    float _3049 = 1.0 / _3023;
    int _3051 = as_type<int>(_3021) + (-2);
    float _3053 = float(uint(_3033));
    float _3055 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _3057 = abs(_2981);
    int _3059 = abs(_3017);
    float _3061 = trunc(_3027);
    float _3063 = precise::max(_3061, 0.0);
    uint _3065 = uint(_3063);
    float _3067 = fma(_656, (*spvDescriptorSet0.vp_c9)._m0[78].w, _3055);
    bool _3069 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3071 = isnan(1.0);
    bool _3073 = _3069 || _3071;
    bool _3075 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3077 = _3073 || _3075;
    float _3079 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    int _3081 = as_type<int>(_3035) + (-2);
    float _3083 = 1.0 / _3039;
    float _3085 = float(uint(_3057));
    float _3087 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    bool _3089 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3091 = isnan(0.0);
    bool _3093 = _3089 || _3091;
    bool _3095 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3097 = _3093 || _3095;
    float _3099 = fma(_652, (*spvDescriptorSet0.vp_c9)._m0[88].z, _3079);
    int _3101 = ~_2829;
    int _3103 = _3101 + 1;
    float _3105 = as_type<float>(_3081) * _3085;
    int _3107 = as_type<int>(_3049) + (-2);
    float _3109 = fma(_656, (*spvDescriptorSet0.vp_c9)._m0[88].w, _3087);
    float _3111 = as_type<float>(_3043) * _3045;
    float _3113 = as_type<float>(_3051) * _3053;
    float _3115 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[77].z, _3047);
    float _3117 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2161);
    float _3119 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[77].w, _3067);
    float _3121 = trunc(_3111);
    float _3123 = precise::max(_3121, 0.0);
    uint _3125 = uint(_3123);
    float _3127 = float(uint(_3059));
    int _3129 = _3103 * int(_3065);
    int _3131 = _3129 + _2981;
    float _3133 = _3097 ? _3031 : 0.0;
    float _3135 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[87].z, _3099);
    int _3137 = ~_2883;
    int _3139 = _3137 + 1;
    float _3141 = as_type<float>(_3107) * _3127;
    float _3143 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[87].w, _3109);
    float _3145 = trunc(_3113);
    float _3147 = precise::max(_3145, 0.0);
    uint _3149 = uint(_3147);
    if (_3077)
    {
        float _3151 = _3133 * _3083;
        _152 = _3151;
    }
    float _3153 = _152;
    float _3155 = float(uint(_3131));
    float _3157 = _2451 * _2451;
    int _3159 = ~_2829;
    int _3161 = _3159 + 1;
    float _3163 = fma(_2479, _2479, _3157);
    float _3165 = trunc(_3105);
    float _3167 = precise::max(_3165, 0.0);
    uint _3169 = uint(_3167);
    int _3171 = _3139 * int(_3125);
    int _3173 = _3171 + _3017;
    float _3175 = as_type<float>(_3011) * _3155;
    int _3177 = ~_2993;
    int _3179 = _3177 + 1;
    float _3181 = fma(_2489, _2489, _3163);
    float _3183 = float(uint(_3173));
    float _3185 = trunc(_3141);
    float _3187 = precise::max(_3185, 0.0);
    uint _3189 = uint(_3187);
    float _3191 = as_type<float>(_3043) * _3183;
    float _3193 = trunc(_3025);
    float _3195 = precise::max(_3193, 0.0);
    uint _3197 = uint(_3195);
    int _3199 = ~_3009;
    int _3201 = _3199 + 1;
    int _3203 = _3179 * int(_3169);
    int _3205 = _3203 + _3057;
    float _3207 = rsqrt(_3181);
    int _3209 = ~_2967;
    int _3211 = _3209 + 1;
    int _3213 = _3201 * int(_3189);
    int _3215 = _3213 + _3059;
    int _3217 = _3211 * int(_3149);
    int _3219 = _3217 + _3033;
    float _3221 = float(uint(_3215));
    float _3223 = trunc(_3175);
    float _3225 = precise::max(_3223, 0.0);
    uint _3227 = uint(_3225);
    float _3229 = float(uint(_3219));
    float _3231 = as_type<float>(_3107) * _3221;
    int _3233 = int(_2965) + int(_3197);
    float _3235 = float(uint(_3205));
    float _3237 = as_type<float>(_3051) * _3229;
    float _3239 = _654 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _3241 = trunc(_3191);
    float _3243 = precise::max(_3241, 0.0);
    uint _3245 = uint(_3243);
    int _3247 = ~_2793;
    int _3249 = _3247 + 1;
    float _3251 = as_type<float>(_3081) * _3235;
    float _3253 = _3239 * _3207;
    float _3255 = _652 + (-0.5);
    int _3257 = int(_3065) + int(_3227);
    float _3259 = _2451 * _3253;
    float _3261 = trunc(_3237);
    float _3263 = precise::max(_3261, 0.0);
    uint _3265 = uint(_3263);
    float _3267 = _2479 * _3253;
    float _3269 = fma(_3255, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2709);
    float _3271 = -_3259;
    float _3273 = _2451 + _3271;
    int _3275 = _3249 * _3233;
    int _3277 = _3275 + _2893;
    float _3279 = -_3267;
    float _3281 = _2479 + _3279;
    int _3283 = _3161 * _3257;
    int _3285 = _3283 + _2981;
    float _3287 = _3273 * _3273;
    float _3289 = trunc(_3251);
    float _3291 = precise::max(_3289, 0.0);
    uint _3293 = uint(_3291);
    int _3295 = int(_3125) + int(_3245);
    float _3297 = fma(_2679, _3153, _3269);
    int _3299 = ~_2883;
    int _3301 = _3299 + 1;
    float _3303 = fma(_3281, _3281, _3287);
    bool _3305 = uint(_3277) >= uint(_2793);
    bool _3307 = uint(_3285) >= uint(_2829);
    float _3309 = trunc(_3231);
    float _3311 = precise::max(_3309, 0.0);
    uint _3313 = uint(_3311);
    int _3315 = int(_3149) + int(_3265);
    int _3317 = _3301 * _3295;
    int _3319 = _3317 + _3017;
    int _3321 = ~_2967;
    int _3323 = _3321 + 1;
    int _3325 = ~_3009;
    int _3327 = _3325 + 1;
    bool _3329 = uint(_3319) >= uint(_2883);
    int _3331 = _3323 * _3315;
    int _3333 = _3331 + _3033;
    int _3335 = int(_3169) + int(_3293);
    float _3337 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _3339 = ~_2993;
    int _3341 = _3339 + 1;
    bool _3343 = uint(_3333) >= uint(_2967);
    bool _3345 = !_3305;
    int _3347 = _3345 ? 0 : (-1);
    int _3349 = _3341 * _3335;
    int _3351 = _3349 + _3057;
    int _3353 = int(_3189) + int(_3313);
    float _3355 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _3357 = ~_3233;
    int _3359 = _3357 + _3347;
    int _3361 = _3359 + 1;
    bool _3363 = uint(_3351) >= uint(_2993);
    int _3365 = _3327 * _3353;
    int _3367 = _3365 + _3059;
    bool _3369 = !_3307;
    int _3371 = _3369 ? 0 : (-1);
    int _3373 = _2793 * _3361;
    int _3375 = _3373 + _2893;
    bool _3377 = !_3329;
    int _3379 = _3377 ? 0 : (-1);
    float _3381 = _3337 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _3383 = ~_3257;
    int _3385 = _3383 + _3371;
    int _3387 = _3385 + 1;
    float _3389 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _3391 = uint(_3367) >= uint(_3009);
    float _3393 = fma(_3381, _931, -0.5);
    bool _3395 = _2793 == 0;
    int _3397 = _2893 ^ _2793;
    bool _3399 = !_3363;
    int _3401 = _3399 ? 0 : (-1);
    float _3403 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _3405 = !_3391;
    int _3407 = _3405 ? 0 : (-1);
    int _3409 = _2981 ^ _2829;
    int _3411 = _2829 * _3387;
    int _3413 = _3411 + _2981;
    bool _3415 = _2829 == 0;
    bool _3417 = _2829 == 0;
    float _3419 = _3389 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _3421 = ~_3295;
    int _3423 = _3421 + _3379;
    int _3425 = _3423 + 1;
    bool _3427 = !_3395;
    int _3429 = _3427 ? _3375 : (-1);
    bool _3431 = !_3415;
    int _3433 = _3431 ? _3413 : (-1);
    int _3435 = _2883 * _3425;
    int _3437 = _3435 + _3017;
    float _3439 = float(_3429);
    int _3441 = _3017 ^ _2883;
    bool _3443 = !_3343;
    int _3445 = _3443 ? 0 : (-1);
    float _3447 = fma(_3381, _3439, _2867);
    bool _3449 = _2883 == 0;
    float _3451 = _3355 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _3453 = _2793 == 0;
    float _3455 = fma(_3115, _3393, _3447);
    bool _3457 = _2883 == 0;
    float _3459 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _3461 = _3403 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _3463 = float(_3433);
    float _3465 = fma(_3451, _1591, -0.5);
    uint _3467 = uint(int(uint(_3397) >> uint(31)));
    float _3469 = fma(_3461, _756, -0.5);
    uint _3471 = uint(int(uint(_3409) >> uint(31)));
    float _3473 = fma(_3461, _3463, _2577);
    uint _3475 = uint(int(uint(_3441) >> uint(31)));
    float _3477 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _3479 = !_3449;
    int _3481 = _3479 ? _3437 : (-1);
    float _3483 = fma(_2519, _3469, _3473);
    int _3485 = ~_3445;
    int _3487 = _3315 + _3485;
    int _3489 = _3487 + 1;
    int _3491 = ~int(_3467);
    int _3493 = _3491 + 1;
    int _3495 = ~_3401;
    int _3497 = _3335 + _3495;
    int _3499 = _3497 + 1;
    int _3501 = ~_3407;
    int _3503 = _3353 + _3501;
    int _3505 = _3503 + 1;
    int _3507 = ~int(_3471);
    int _3509 = _3507 + 1;
    int _3511 = ~int(_3475);
    int _3513 = _3511 + 1;
    float _3515 = float(_3481);
    float _3517 = _3477 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _3519 = _3489 ^ _3493;
    int _3521 = _3499 ^ _3509;
    float _3523 = fma(_3451, _3515, _2507);
    int _3525 = _3505 ^ _3513;
    float _3527 = _3459 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _3529 = ~_3493;
    int _3531 = _3529 + _3519;
    int _3533 = _3531 + 1;
    float _3535 = fma(_1175, _3419, -0.5);
    int _3537 = ~_3509;
    int _3539 = _3537 + _3521;
    int _3541 = _3539 + 1;
    float _3543 = fma(_1227, _3527, -0.5);
    int _3545 = ~_3513;
    int _3547 = _3545 + _3525;
    int _3549 = _3547 + 1;
    float _3551 = fma(_3517, _1535, -0.5);
    bool _3553 = !_3453;
    int _3555 = _3553 ? _3533 : (-1);
    float _3557 = fma(_3135, _3465, _3523);
    bool _3559 = !_3417;
    int _3561 = _3559 ? _3541 : (-1);
    bool _3563 = !_3457;
    int _3565 = _3563 ? _3549 : (-1);
    float _3567 = _3557 + 0.5;
    float _3569 = float(_3555);
    float _3571 = float(_3561);
    float _3573 = float(_3565);
    float _3575 = -_3117;
    float _3577 = fma(_3419, _3569, _3575);
    float _3579 = _2489 * _3253;
    float _3581 = -_2649;
    float _3583 = fma(_3527, _3571, _3581);
    float _3585 = _3483 + 0.5;
    float _3587 = -_2077;
    float _3589 = fma(_3517, _3573, _3587);
    float _3591 = fma(_3119, _3535, _3577);
    float _3593 = fma(_2525, _3543, _3583);
    float _3595 = _3455 + 0.5;
    float _3597 = fma(_3143, _3551, _3589);
    float _3599 = _3591 + 0.5;
    float _3601 = _3593 + 0.5;
    float _3603 = -_3579;
    float _3605 = _2489 + _3603;
    float _3607 = _3597 + 0.5;
    float _3609 = _656 + (-0.5);
    bool _3611 = !_2137;
    int _3613 = _3611 ? 0 : 1;
    out.m_69.x = _3595;
    out.m_69.y = _3599;
    out.m_69.z = _3585;
    out.m_69.w = _3601;
    float _3615 = fma(_3605, _3605, _3303);
    out.m_71.x = _3567;
    out.m_71.y = _3607;
    float _3617 = as_type<float>(_3541);
    if (_2527)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3619 = -_3259;
    float _3621 = _2435 + _3619;
    int _3623 = abs(_3613);
    float _3625 = -_3267;
    float _3627 = _2423 + _3625;
    float _3629 = float(_2115);
    float _3631 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3633 = _3621 + _3631;
    float _3635 = -_3579;
    float _3637 = _2471 + _3635;
    float _3639 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3641 = _3627 + _3639;
    float _3643 = fma(_3609, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2747);
    float _3645 = _3633 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3647 = _652 + _666;
    float _3649 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3651 = _3637 + _3649;
    float _3653 = fma(_2817, _3153, _3643);
    float _3655 = fma(_3641, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3645);
    float _3657 = float(_3623);
    float _3659 = _3647 + (-1.0);
    float _3661 = fma(_3651, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3655);
    float _3663 = _666 + (-0.5);
    float _3665 = _3657 * _3629;
    float _3667 = _3297 * 0.15915493667125701904296875;
    float _3669 = fma(_3659, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _3671 = _3661 >= 0.0;
    float _3673 = _3665 * (-2.0);
    float _3675 = _3653 * 0.15915493667125701904296875;
    float _3677 = sqrt(_3615);
    float _3679 = fma(_3673, _2617, _2617);
    float _3681 = fma(_3669, _3673, _3669);
    float _3683 = fma(_3663, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3679);
    float _3685 = _3667 * 6.283185482025146484375;
    float _3687 = sin(_3685);
    float _3689 = fma(_3681, _3153, _3683);
    float _3691 = (*spvDescriptorSet0.vp_c9)._m0[198].z;
    float _3693 = _3651;
    if (_3671)
    {
        _3691 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3695 = _3691;
    int _3697 = as_type<int>(_3695);
    if (_3671)
    {
        out.m_51.x = 0.0;
    }
    float _3699 = _3689 * 0.15915493667125701904296875;
    float _3701 = _3667 * 6.283185482025146484375;
    float _3703 = cos(_3701);
    if (_3671)
    {
        float _3705 = _3695 * 5.0;
        _3697 = as_type<int>(_3705);
    }
    int _3707 = _3697;
    if (_3671)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _10426 = as_type<float>(_3707);
        out.gl_Position.z = _10426;
    }
    float _3709 = _3675 * 6.283185482025146484375;
    float _3711 = sin(_3709);
    float _3713 = _3675 * 6.283185482025146484375;
    float _3715 = cos(_3713);
    float _3717 = _3699 * 6.283185482025146484375;
    float _3719 = sin(_3717);
    if (_3671)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3721 = -_2435;
    float _3723 = _3721 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3725 = -_2423;
    float _3727 = _3725 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3729 = in.m_73.x;
    float _3731 = in.m_73.y;
    float _3733 = in.m_73.z;
    float _3735 = -_2471;
    float _3737 = _3735 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3739 = _3723 * _3723;
    float _3741 = _3699 * 6.283185482025146484375;
    float _3743 = cos(_3741);
    float _3745 = _3687 * _3711;
    float _3747 = _3703 * _3715;
    float _3749 = fma(_3727, _3727, _3739);
    float _3751 = _3207 * _3677;
    float _3753 = _488 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3755 = fma(_3719, _3747, _3745);
    float _3757 = fma(_3737, _3737, _3749);
    float _3759 = fma(_3719, _3745, _3747);
    float _3761 = _3687 * _3715;
    float _3763 = rsqrt(_3757);
    float _3765 = _3703 * _3711;
    float _3767 = _506 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _3769 = _3715 * _3743;
    float _3771 = _3751 * _3753;
    float _3773 = _3687 * _3743;
    float _3775 = _654 * _3751;
    float _3777 = -_3765;
    float _3779 = fma(_3719, _3761, _3777);
    float _3781 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _3731);
    float _3783 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _3729);
    float _3785 = -_3761;
    float _3787 = fma(_3719, _3765, _3785);
    float _3789 = _3703 * _3743;
    float _3791 = _3781 * _3771;
    float _3793 = _3711 * _3743;
    float _3795 = _3727 * _3763;
    float _3797 = in.m_75.x;
    float _3799 = in.m_75.y;
    float _3801 = in.m_75.z;
    float _3803 = _3737 * _3763;
    float _3805 = _3783 * _3775;
    float _3807 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _3809 = _3795 * _3807;
    float _3811 = _3751 * _3767;
    float _3813 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _3733);
    bool _3815 = _3731 != 0.0;
    bool _3817 = isnan(_3731);
    bool _3819 = _3815 || _3817;
    bool _3821 = isnan(0.0);
    bool _3823 = _3819 || _3821;
    float _3825 = _3723 * _3763;
    float _3827 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3829 = _3803 * _3827;
    float _3831 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _3833 = -_3809;
    float _3835 = fma(_3803, _3831, _3833);
    float _3837 = _3813 * _3811;
    bool _3839 = _3729 == 0.0;
    bool _3841 = !_3823;
    bool _3843 = _3839 && _3841;
    float _3845 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _3847 = _3825 * _3845;
    float _3849 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _3851 = -_3829;
    float _3853 = fma(_3825, _3849, _3851);
    float _3855 = _3835 * _3835;
    bool _3857 = _3733 == 0.0;
    bool _3859 = _3857 && _3843;
    float _3861 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3863 = -_3847;
    float _3865 = fma(_3795, _3861, _3863);
    float _3867 = in.m_77.x;
    float _3869 = in.m_77.y;
    float _3871 = in.m_77.z;
    float _3873 = in.m_77.w;
    float _3875 = fma(_3853, _3853, _3855);
    float _3877 = -_3791;
    float _3879 = _3719 * _3877;
    float _3881 = _3789 * _3791;
    float _3883 = _3773 * _3791;
    float _3885 = fma(_3865, _3865, _3875);
    float _3887 = fma(_3769, _3805, _3879);
    float _3889 = fma(_3755, _3805, _3881);
    float _3891 = fma(_3779, _3805, _3883);
    float _3893 = rsqrt(_3885);
    float _3895 = _3805;
    float _3897 = _3881;
    float _3899 = _3797;
    float _3901 = _3875;
    if (_3859)
    {
        _3895 = _3797;
    }
    float _3903 = _3895;
    float _3905 = fma(_3787, _3837, _3889);
    float _3907 = _3903;
    if (_3859)
    {
        _2579 = _3799;
    }
    float _3909 = _2579;
    float _3911 = _3909;
    if (_3859)
    {
        _3897 = _3903;
    }
    float _3913 = _3897;
    float _3915 = _3913;
    if (!_3859)
    {
        _3907 = _3797;
    }
    float _3917 = _3907;
    if (_3859)
    {
        _3899 = _3909;
    }
    float _3919 = _3899;
    float _3921 = _3919;
    if (_3859)
    {
        _3617 = _3801;
    }
    float _3923 = _3617;
    float _3925 = _3923;
    if (!_3859)
    {
        float _3927 = fma(_3729, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3917);
        _3915 = _3927;
    }
    float _3929 = _3915;
    if (!_3859)
    {
        _3911 = _3799;
    }
    float _3931 = _3911;
    float _3933 = fma(_3793, _3837, _3887);
    if (_3859)
    {
        _3901 = _3923;
    }
    float _3935 = _3901;
    float _3937 = _3835 * _3893;
    float _3939 = _3935;
    if (!_3859)
    {
        _3925 = _3801;
    }
    float _3941 = _3925;
    if (!_3859)
    {
        float _3943 = fma(_3731, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3931);
        _3921 = _3943;
    }
    float _3945 = _3921;
    float _3947 = _3871 * _3917;
    float _3949 = _3853 * _3893;
    float _3951 = fma(_3759, _3837, _3891);
    float _3953 = _3865 * _3893;
    float _3955 = -_3947;
    float _3957 = fma(_3867, _3941, _3955);
    float _3959 = _3869 * _3941;
    float _3961 = _3803 * _3937;
    float _3963 = _3825 * _3949;
    if (!_3859)
    {
        float _3965 = fma(_3733, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3941);
        _3939 = _3965;
    }
    float _3967 = _3939;
    float _3969 = _3867 * _3931;
    float _3971 = -_3959;
    float _3973 = fma(_3871, _3931, _3971);
    float _3975 = -_3961;
    float _3977 = fma(_3825, _3953, _3975);
    float _3979 = -_3963;
    float _3981 = fma(_3795, _3937, _3979);
    float _3983 = -_3969;
    float _3985 = fma(_3869, _3917, _3983);
    float _3987 = _3957 * _3873;
    float _3989 = _3977 * _3905;
    float _3991 = _3981 * _3905;
    float _3993 = _3973 * _3873;
    float _3995 = _3985 * _3873;
    float _3997 = _3795 * _3953;
    float _3999 = fma(_3949, _3933, _3989);
    float _4001 = fma(_3953, _3933, _3991);
    float _4003 = _3755 * _3977;
    float _4005 = -_3997;
    float _4007 = fma(_3803, _3949, _4005);
    float _4009 = fma(_3795, _3951, _3999);
    float _4011 = fma(_3803, _3951, _4001);
    float _4013 = _3755 * _3981;
    float _4015 = _3755 * _4007;
    float _4017 = _2423 + _4009;
    float _4019 = _2471 + _4011;
    float _4021 = _3789 * _3977;
    float _4023 = _3789 * _4007;
    float _4025 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _4027 = _4017 + _4025;
    float _4029 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _4031 = _4019 + _4029;
    float _4033 = _3789 * _3981;
    float _4035 = _3787 * _3977;
    float _4037 = _4027 * _4027;
    float _4039 = _4031 * _4031;
    float _4041 = _3787 * _3981;
    float _4043 = _3787 * _4007;
    float _4045 = _4007 * _3905;
    float _4047 = _4037 + _4039;
    float _4049 = fma(_3769, _3949, _4003);
    float _4051 = fma(_3769, _3937, _4015);
    float _4053 = fma(_3769, _3953, _4013);
    float _4055 = -_3719;
    float _4057 = fma(_4055, _3949, _4021);
    float _4059 = sqrt(_4047);
    float _4061 = fma(_3793, _3949, _4035);
    float _4063 = -_3719;
    float _4065 = fma(_4063, _3937, _4023);
    float _4067 = fma(_3793, _3937, _4043);
    float _4069 = fma(_3937, _3933, _4045);
    float _4071 = -_3719;
    float _4073 = fma(_4071, _3953, _4033);
    float _4075 = fma(_3793, _3953, _4041);
    float _4077 = fma(_3779, _3803, _4053);
    float _4079 = fma(_3773, _3795, _4057);
    float _4081 = fma(_3773, _3825, _4065);
    float _4083 = fma(_3825, _3951, _4069);
    float _4085 = fma(_3779, _3795, _4049);
    float _4087 = fma(_3779, _3825, _4051);
    float _4089 = fma(_3773, _3803, _4073);
    float _4091 = fma(_3759, _3795, _4061);
    float _4093 = fma(_3759, _3803, _4075);
    bool _4095 = _4059 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4097 = fma(_3759, _3825, _4067);
    float _4099 = _2435 + _4083;
    float _4101 = _4079 * _3869;
    float _4103 = _4081 * _3869;
    float _4105 = _4079 * _3945;
    float _4107 = _4081 * _3945;
    float _4109 = _3987 * _4079;
    float _4111 = _3987 * _4081;
    float _4113 = _4089 * _3869;
    float _4115 = _4089 * _3945;
    float _4117 = _3987 * _4089;
    float _4119 = _4089;
    float _4121 = _4037;
    float _4123 = _4039;
    float _4125 = _4017;
    float _4127 = _4019;
    float _4129 = _4097;
    if (!_4095)
    {
        _4119 = _4099;
    }
    float _4131 = _4119;
    bool _4133 = !_4095;
    float _4135 = _4131;
    if (!_4133)
    {
        float _4137 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4139 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _4141 = _4059 + _4139;
        float _4143 = rsqrt(_4047);
        float _4145 = _4141 * _4137;
        float _4147 = _4099 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4149 = _4145 * 0.15915493667125701904296875;
        float _4151 = _4149 * 6.283185482025146484375;
        float _4153 = sin(_4151);
        float _4155 = _4149 * 6.283185482025146484375;
        float _4157 = cos(_4155);
        float _4159 = fma(_4153, _4147, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _4161 = _4143 * _4159;
        float _4163 = fma(_4027, _4161, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _4165 = _4157 + (-1.0);
        float _4167 = fma(_4031, _4161, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _4169 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _4171 = _4163 + _4169;
        float _4173 = _4165 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4175 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _4177 = _4167 + _4175;
        float _4179 = _4171 * _4171;
        float _4181 = fma(_4099, _4157, _4173);
        float _4183 = _4177 * _4177;
        _4135 = _4181;
        _4121 = _4179;
        _4123 = _4183;
        _4125 = _4163;
        _4127 = _4167;
    }
    float _4185 = _4135;
    float _4187 = _4121;
    float _4189 = _4123;
    float _4191 = _4125;
    float _4193 = _4127;
    float _4195 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _4197 = _4185 + _4195;
    float _4199 = fma(_4085, _3867, _4101);
    float _4201 = fma(_4085, _3929, _4105);
    float _4203 = fma(_3993, _4085, _4109);
    float _4205 = fma(_4197, _4197, _4187);
    float _4207 = fma(_4087, _3867, _4103);
    float _4209 = fma(_4077, _3867, _4113);
    float _4211 = fma(_4087, _3929, _4107);
    float _4213 = _4205 + _4189;
    float _4215 = fma(_4077, _3929, _4115);
    float _4217 = fma(_3993, _4087, _4111);
    float _4219 = fma(_3993, _4077, _4117);
    float _4221 = fma(_4091, _3871, _4199);
    float _4223 = fma(_4097, _3871, _4207);
    float _4225 = sqrt(_4213);
    float _4227 = fma(_4091, _3967, _4201);
    float _4229 = fma(_3995, _4091, _4203);
    float _4231 = fma(_4093, _3871, _4209);
    float _4233 = fma(_4097, _3967, _4211);
    float _4235 = fma(_3995, _4097, _4217);
    float _4237 = fma(_3995, _4093, _4219);
    float _4239 = fma(_4093, _3967, _4215);
    out.m_79.x = _4221;
    out.m_79.y = _4223;
    out.m_79.z = _4231;
    out.m_81.x = _4229;
    out.m_81.y = _4235;
    out.m_81.z = _4237;
    out.m_83.x = _4227;
    out.m_83.y = _4233;
    out.m_83.z = _4239;
    bool _4241 = _4225 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _4243 = isnan(_4225);
    bool _4245 = _4241 || _4243;
    bool _4247 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _4249 = _4245 || _4247;
    float _4251 = _4223;
    if (!_4249)
    {
        _4129 = 1.0;
    }
    float _4253 = _4129;
    bool _4255 = !_4249;
    float _4257 = _4253;
    if (!_4255)
    {
        bool _4259 = _4225 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _4261 = isnan(_4225);
        bool _4263 = _4259 || _4261;
        bool _4265 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _4267 = _4263 || _4265;
        if (!_4267)
        {
            float _4269 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4271 = _4225 + _4269;
            float _4273 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4275 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _4273;
            float _4277 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _4279 = _4277 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _4281 = 1.0 / _4275;
            float _4283 = _4271 * _4281;
            float _4285 = fma(_4283, _4279, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _4257 = _4285;
            _4287 = true;
        }
        else
        {
            bool _4289 = _4225 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _4291 = isnan(_4225);
            bool _4293 = _4289 || _4291;
            bool _4295 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _4297 = _4293 || _4295;
            if (!_4297)
            {
                float _4299 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4301 = _4225 + _4299;
                float _4303 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4305 = _4303 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _4307 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _4309 = _4307 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _4311 = 1.0 / _4305;
                float _4313 = _4301 * _4311;
                float _4315 = fma(_4313, _4309, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _4257 = _4315;
                _4287 = true;
            }
            else
            {
                _4257 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _4287 = false;
    float _4317 = _4257;
    float _4319 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _4321 = _4191 + _4319;
    float _4323 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _4325 = _4185 + _4323;
    float _4327 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _4329 = _4193 + _4327;
    bool _4331 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _4333 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _4335 = _4331 || _4333;
    bool _4337 = isnan(0.5);
    bool _4339 = _4335 || _4337;
    float _4341 = fma(_4321, _4317, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _4343 = fma(_4325, _4317, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _4345 = fma(_4329, _4317, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _4347 = -_3267;
    float _4349 = _4347 + _4341;
    float _4351 = -_3259;
    float _4353 = _4351 + _4343;
    float _4355 = -_3579;
    float _4357 = _4355 + _4345;
    float _4359 = _4353;
    float _4361 = _4349;
    float _4363 = _4357;
    if (!_4339)
    {
        float _4365 = _3633 * _3633;
        float _4367 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _4369 = -_2471;
        float _4371 = _4369 + _4345;
        float _4373 = fma(_3641, _3641, _4365);
        float _4375 = fma(_3651, _3651, _4373);
        float _4377 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _4379 = sqrt(_4375);
        float _4381 = 1.0 / _3751;
        float _4383 = _4377 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _4385 = precise::min(_4379, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _4387 = _4385 * _4367;
        float _4389 = -_2423;
        float _4391 = _4389 + _4341;
        float _4393 = _4387 * _4381;
        float _4395 = -_2435;
        float _4397 = _4395 + _4343;
        float _4399 = _4383 * _4393;
        float _4401 = _4371 * _4393;
        float _4403 = fma(_4391, _4399, _3627);
        float _4405 = fma(_4397, _4399, _3621);
        float _4407 = fma(_4383, _4401, _3637);
        _4359 = _4405;
        _4361 = _4403;
        _4363 = _4407;
    }
    float _4409 = _4359;
    float _4411 = _4361;
    float _4413 = _4363;
    float _4415 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4417 = _4409 + _4415;
    float _4419 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4421 = _4411 + _4419;
    float _4423 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4425 = _4413 + _4423;
    float _4427 = _4417 * _4417;
    float _4429 = fma(_4421, _4421, _4427);
    float _4431 = fma(_4425, _4425, _4429);
    float _4433 = rsqrt(_4431);
    float _4435 = _4433 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4437 = _4421 * _4435;
    float _4439 = _4425 * _4435;
    float _4441 = _4437 * _4437;
    float _4443 = _4439 * _4439;
    float _4445 = _4441 + _4443;
    float _4447 = sqrt(_4445);
    bool _4449 = _4447 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4451 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4453 = _4447 + _4451;
    float _4455 = _4433;
    float _4457 = _4453;
    float _4459 = _4417;
    float _4461 = _4437;
    if (_4449)
    {
        float _4463 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4455 = _4463;
    }
    float _4465 = _4455;
    float _4467 = _4465;
    if (_4449)
    {
        float _4469 = _4453 * _4465;
        _4457 = _4469;
    }
    float _4471 = _4457;
    if (_4449)
    {
        float _4473 = rsqrt(_4445);
        _4467 = _4473;
    }
    float _4475 = _4467;
    float _4477 = _4475;
    if (_4449)
    {
        float _4479 = _4471 * 0.15915493667125701904296875;
        _4251 = _4479;
    }
    float _4481 = _4251;
    float _4483 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4485 = _4425;
    if (_4449)
    {
        float _4487 = _4481 * 6.283185482025146484375;
        float _4489 = sin(_4487);
        _4485 = _4489;
    }
    float _4491 = _4485;
    float _4493 = _4409 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4495 = precise::max(0.0, _4483);
    float _4497 = fma(_4411, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4493);
    float _4499 = _3579;
    float _4501 = _4495;
    if (_4449)
    {
        float _4503 = _4481 * 6.283185482025146484375;
        float _4505 = cos(_4503);
        _4499 = _4505;
    }
    float _4507 = _4499;
    float _4509 = -_4435;
    float _4511 = -_4495;
    float _4513 = fma(_4417, _4509, _4511);
    if (_4449)
    {
        float _4515 = _4513 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4459 = _4515;
    }
    float _4517 = _4459;
    float _4519 = _4491;
    float _4521 = _4517;
    if (_4449)
    {
        float _4523 = fma(_4491, _4517, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4519 = _4523;
    }
    float _4525 = _4519;
    float _4527 = _4525;
    if (!_4449)
    {
        _4521 = _4439;
    }
    float _4529 = _4521;
    float _4531 = _4409 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4533 = _4529;
    if (_4449)
    {
        float _4535 = _4475 * _4525;
        _3693 = _4535;
    }
    float _4537 = _3693;
    if (!_4449)
    {
        _4477 = _4513;
    }
    float _4539 = _4477;
    float _4541 = fma(_4411, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4531);
    float _4543 = _4539;
    float _4545 = _4507;
    if (_4449)
    {
        float _4547 = _4507 + (-1.0);
        _4501 = _4547;
    }
    float _4549 = _4501;
    float _4551 = _4549;
    if (_4449)
    {
        float _4553 = _4437 * _4537;
        _4461 = _4553;
    }
    float _4555 = _4461;
    if (!_4449)
    {
        _4527 = _4441;
    }
    float _4557 = _4527;
    float _4559 = _4557;
    if (_4449)
    {
        float _4561 = _4439 * _4537;
        _4533 = _4561;
    }
    float _4563 = _4533;
    if (_4449)
    {
        float _4565 = _4549 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4551 = _4565;
    }
    float _4567 = _4551;
    if (_4449)
    {
        float _4569 = _4555 * _4555;
        _4559 = _4569;
    }
    float _4571 = _4559;
    float _4573 = _4409 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4575 = fma(_4413, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4541);
    if (_4449)
    {
        float _4577 = fma(_4513, _4507, _4567);
        _4543 = _4577;
    }
    float _4579 = _4543;
    if (!_4449)
    {
        _4545 = _4443;
    }
    float _4581 = _4545;
    float _4583 = _4581;
    if (_4449)
    {
        float _4585 = _4563 * _4563;
        _4583 = _4585;
    }
    float _4587 = _4583;
    float _4589 = sqrt(_4431);
    float _4591 = fma(_4579, _4579, _4571);
    float _4593 = fma(_4411, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4573);
    float _4595 = _4575 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4597 = _4591 + _4587;
    float _4599 = _4409 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4601 = fma(_3627, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _4603 = rsqrt(_4597);
    float _4605 = _4595 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4607 = fma(_4411, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4599);
    float _4609 = fma(_4413, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4607);
    float _4611 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4613 = fma(_4589, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4611);
    float _4615 = precise::clamp(_4613, 0.0, 1.0);
    float _4617 = floor(_4601);
    float _4619 = fma(_4413, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4497);
    float _4621 = _4609 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4623 = -_4615;
    float _4625 = _4623 + 1.0;
    float _4627 = fma(_4413, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4593);
    float _4629 = fma(_3637, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4631 = fma(_4621, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4605);
    float _4633 = _4619 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4635 = _4603 * _4555;
    float _4637 = _4603 * _4579;
    float _4639 = abs(_4625);
    float _4641 = log2(_4639);
    float _4643 = _4603 * _4563;
    float _4645 = _4635 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4647 = _4627 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4649 = -_4645;
    float _4651 = fma(_4637, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4649);
    float _4653 = fma(_4647, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4631);
    float _4655 = floor(_4629);
    float _4657 = -_4617;
    float _4659 = _4601 + _4657;
    float _4661 = -_4643;
    float _4663 = fma(_4661, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4651);
    float _4665 = _4647 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4667 = fma(_4633, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4653);
    float _4669 = fma(_4663, -0.5, 0.5);
    float _4671 = fma(_4663, 0.5, 0.5);
    float _4673 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4675 = _4641 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4677 = 1.0 / _4667;
    float _4679 = fma(_4671, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4681 = -_4665;
    float _4683 = fma(_4681, _4673, 1.0);
    float _4685 = _4595 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4687 = fma(_4671, _4679, -0.212114393711090087890625);
    float _4689 = fma(_4621, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4685);
    float _4691 = exp2(_4675);
    float _4693 = fma(_4671, _4687, 1.570728778839111328125);
    float _4695 = fma(_4647, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4689);
    float _4697 = log2(_4683);
    float _4699 = _4595 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4701 = fma(_4621, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4699);
    float _4703 = sqrt(_4669);
    float _4705 = fma(_4647, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4701);
    float _4707 = fma(_4633, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4705);
    float _4709 = _4697 * 0.693147182464599609375;
    float _4711 = -_4655;
    float _4713 = _4629 + _4711;
    float _4715 = _4637 + 1.0;
    float _4717 = fma(_4633, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4695);
    float2 _12074 = float2(_4659, _4713);
    float _4719 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_12074, float2(0.0), isnan(_12074)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_12074, float2(0.0), isnan(_12074)), level(0.0)).x;
    float _4721 = -_4637;
    float _4723 = fma(_4691, _4715, _4721);
    float _4725 = _4717 * _4677;
    float _4727 = _4707 * _4677;
    float _4729 = _4703 * 0.636619746685028076171875;
    float _4731 = _4709 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4733 = fma(_4725, 0.5, 0.5);
    float _4735 = fma(_4727, -0.5, 0.5);
    float _4737 = -_4693;
    float _4739 = fma(_4729, _4737, 1.0);
    float _4741 = fma(_4723, 0.5, 0.5);
    float3 _12115 = float3(_4733, _4735, _4731);
    float _4743 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_12115, float3(0.0), isnan(_12115)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_12115, float3(0.0), isnan(_12115)), level(0.0)).x;
    float3 _12126 = float3(_4733, _4735, _4731);
    float4 _4746 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_12126, float3(0.0), isnan(_12126)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_12126, float3(0.0), isnan(_12126)), level(0.0)).xyzw;
    float _4748 = _4746.x;
    float _4750 = _4746.y;
    float _4752 = _4746.z;
    float _4754 = _4746.w;
    float2 _12142 = float2(_4739, _4741);
    float3 _4758 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_12142, float2(0.0), isnan(_12142)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_12142, float2(0.0), isnan(_12142)), level(0.0)).xyz;
    float _4760 = _4758.x;
    float _4762 = _4758.y;
    float _4764 = _4758.z;
    float _4766 = _3621 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    out.m_85.x = _4411;
    out.m_85.y = _4409;
    out.m_85.z = _4413;
    bool _4768 = _4589 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4770 = isnan(_4589);
    bool _4772 = _4768 || _4770;
    bool _4774 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4776 = _4772 || _4774;
    float _4778 = fma(_3627, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4766);
    float _4780 = fma(_3637, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4778);
    float _4782 = _3621 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _4784 = _4780 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4786 = fma(_3627, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4782);
    float _4788 = 1.0 / _4784;
    float _4790 = fma(_3637, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4786);
    float _4792 = _4790 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4794 = _4792 + _4784;
    float _4796 = _4794 * _4788;
    float _4798 = _4796 * 0.5;
    float _4800 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _4802 = fma(_4798, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4800);
    float _4804 = 1.0 / _4802;
    float _4806 = _4641 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4808 = exp2(_4806);
    float _4810 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4812 = _4804 * _4810;
    float _4814 = abs(_4812);
    float _4816 = log2(_4814);
    float _4818 = -_4808;
    float _4820 = _4818 + 1.0;
    float _4822 = _4820 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _4824 = _4816 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _4826 = _4595 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4828 = fma(_4621, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4826);
    float _4830 = exp2(_4824);
    float _4832 = fma(_4647, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4828);
    float _4834 = fma(_4633, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4832);
    bool _4836 = _4812 <= 8000.0;
    bool _4838 = isnan(_4812);
    bool _4840 = _4836 || _4838;
    bool _4842 = isnan(8000.0);
    bool _4844 = _4840 || _4842;
    float _4846 = float(_4844);
    out.gl_Position.x = _4717;
    out.gl_Position.y = _4707;
    out.gl_Position.z = _4834;
    out.gl_Position.w = _4667;
    float _4848 = fma(_4830, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4850 = precise::clamp(_4848, 0.0, 1.0);
    float _4852 = in.m_87.x;
    float _4854 = fma(_4850, -2.0, 3.0);
    float _4856 = _4850 * _4850;
    float _4858 = _4856 * _4854;
    float _4860 = -_4858;
    float _4862 = _4860 + 1.0;
    float _4864 = fma(_4862, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4858);
    float _4866 = _4834 + _4667;
    float _4868 = _4846 * _4864;
    float _4870 = _4866 * 0.5;
    float _4872 = _4868 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_89.z = _4870;
    out.m_89.w = _4667;
    float _4874 = -_4719;
    float _4876 = _4874 + 1.0;
    float _4878 = _4876 * _4872;
    float _4880 = precise::clamp(_4878, 0.0, 1.0);
    float _4882 = -_4880;
    float _4884 = fma(_4882, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4886 = _4822 * _4743;
    float _4888 = _4884 * _4852;
    float _4890 = -_4822;
    float _4892 = _4890 + 1.0;
    float _4894 = _4754 * _4886;
    float _4896 = _4764 * _4886;
    float _4898 = _4754 * _4892;
    float _4900 = _4888 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _4902 = fma(_4760, _4894, _4748);
    float _4904 = fma(_4762, _4894, _4750);
    float _4906 = fma(_4754, _4896, _4752);
    float _4908 = _4894;
    float _4910 = _4754;
    float _4912 = _4752;
    if (!_4776)
    {
        _4908 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4914 = _4908;
    out.m_91.x = _4900;
    float _4916 = _4914;
    float _4918 = _4914;
    if (!_4776)
    {
        _4910 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4920 = _4910;
    float _4922 = _4920;
    float _4924 = _4920;
    if (!_4776)
    {
        _4912 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4926 = _4912;
    out.m_93.x = _4902;
    out.m_93.y = _4904;
    out.m_93.z = _4906;
    out.m_93.w = _4898;
    bool _4928 = !_4776;
    float _4930 = _4926;
    float _4932 = _4926;
    if (!_4928)
    {
        bool _4934 = _4589 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4936 = isnan(_4589);
        bool _4938 = _4934 || _4936;
        bool _4940 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4942 = _4938 || _4940;
        if (!_4942)
        {
            float _4944 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4946 = _4589 + _4944;
            float _4948 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4950 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4948;
            float _4952 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4954 = _4952 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4956 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4958 = _4956 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4960 = 1.0 / _4950;
            float _4962 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4964 = _4962 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4966 = _4946 * _4960;
            float _4968 = precise::clamp(_4966, 0.0, 1.0);
            float _4970 = fma(_4968, _4954, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4972 = fma(_4968, _4958, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4974 = fma(_4968, _4964, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            _4924 = _4972;
            _4918 = _4970;
            _4932 = _4974;
            _4976 = true;
        }
        else
        {
            bool _4978 = _4589 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4980 = isnan(_4589);
            bool _4982 = _4978 || _4980;
            bool _4984 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4986 = _4982 || _4984;
            if (!_4986)
            {
                _4916 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4988 = _4916;
            _4918 = _4988;
            if (!_4986)
            {
                _4922 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4990 = _4922;
            _4924 = _4990;
            if (!_4986)
            {
                _4930 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4992 = _4930;
            bool _4994 = !_4986;
            _4932 = _4992;
            if (!_4994)
            {
                bool _4996 = _4589 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4998 = isnan(_4589);
                bool _5000 = _4996 || _4998;
                bool _5002 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _5004 = _5000 || _5002;
                if (!_5004)
                {
                    float _5006 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5008 = _4589 + _5006;
                    float _5010 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5012 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _5010;
                    float _5014 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _5016 = _5014 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _5018 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _5020 = _5018 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _5022 = 1.0 / _5012;
                    float _5024 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _5026 = _5024 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _5028 = _5008 * _5022;
                    float _5030 = precise::clamp(_5028, 0.0, 1.0);
                    float _5032 = fma(_5030, _5016, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _5034 = fma(_5030, _5020, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _5036 = fma(_5030, _5026, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    _4924 = _5034;
                    _4918 = _5032;
                    _4932 = _5036;
                    _4976 = true;
                }
                else
                {
                    _4924 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4918 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4932 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _4976 = false;
    float _5038 = _4924;
    float _5040 = _4918;
    float _5042 = _4932;
    float _5044 = _5038 * 0.586610972881317138671875;
    bool _5046 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_51.x = 1.0;
    float _5048 = fma(_5040, 0.298911988735198974609375, _5044);
    out.m_95.x = 0.0;
    float _5050 = fma(_5042, 0.114477999508380889892578125, _5048);
    float _5052 = -_5050;
    float _5054 = _5052 + _5040;
    float _5056 = -_5050;
    float _5058 = _5056 + _5038;
    float _5060 = -_5050;
    float _5062 = _5060 + _5042;
    float _5064 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _5066 = fma(_5054, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5050);
    float _5068 = fma(_5058, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5050);
    float _5070 = fma(_5062, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5050);
    out.m_91.w = _5064;
    out.m_97.x = _5066;
    out.m_97.y = _5068;
    out.m_97.z = _5070;
    if (!_5046)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _5072 = -_4409;
    float _5074 = _5072 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _5076 = -_4411;
    float _5078 = _5076 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _5080 = -_4413;
    float _5082 = _5080 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _5084 = _5074 * _5074;
    float _5086 = fma(_5078, _5078, _5084);
    float _5088 = fma(_5082, _5082, _5086);
    float _5090 = sqrt(_5088);
    float _5092 = rsqrt(_5088);
    float _5094 = -_5090;
    float _5096 = _5094 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _5098 = _5096 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _5100 = precise::clamp(_5098, 0.0, 1.0);
    float _5102 = _5078 * _5092;
    float _5104 = _5074 * _5092;
    float _5106 = abs(_5100);
    float _5108 = log2(_5106);
    float _5110 = _5082 * _5092;
    float _5112 = _5102 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _5114 = _4233 * _5104;
    float _5116 = -_5104;
    float _5118 = -_5112;
    float _5120 = fma(_5116, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5118);
    float _5122 = fma(_4227, _5102, _5114);
    float _5124 = -_5110;
    float _5126 = fma(_5124, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5120);
    float _5128 = fma(_4239, _5110, _5122);
    float _5130 = precise::clamp(_5128, 0.0, 1.0);
    float _5132 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _5134 = _5126 + _5132;
    float _5136 = _5108 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _5138 = _5134 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _5140 = precise::clamp(_5138, 0.0, 1.0);
    float _5142 = exp2(_5136);
    float _5144 = _5142 * _5140;
    float _5146 = _5130 * _5144;
    float _5148 = _5146 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _5150 = _5146 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _5152 = _5146 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_95.x = _5148;
    out.m_95.y = _5150;
    out.m_95.z = _5152;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4976 = false;
    bool _4287 = false;
    bool _638 = false;
    bool _534 = false;
    bool _416 = false;
    bool _194 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _111 = in.m_48.w;
    float _113 = trunc(_111);
    int _116 = int(_113);
    bool _120 = _116 >= 1;
    float _122 = 0.0;
    if (!_120)
    {
        _122 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _124 = _122;
    float _126 = _124;
    if (!_120)
    {
        out.m_51.x = 0.0;
    }
    int _128 = 0;
    if (!_120)
    {
        float _130 = _124 * 5.0;
        _128 = as_type<int>(_130);
    }
    int _132 = _128;
    int _134 = _132;
    if (!_120)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5209 = as_type<float>(_132);
        out.gl_Position.z = _5209;
    }
    if (!_120)
    {
        return out;
    }
    float _136 = in.m_53.w;
    bool _138 = _136 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _140 = isnan(_136);
    bool _142 = _138 || _140;
    bool _144 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _146 = _142 || _144;
    float _148 = -_136;
    float _150 = _148 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _152 = _150;
    if (_146)
    {
        float _154 = float(_116);
        _126 = _154;
    }
    float _156 = _126;
    bool _158 = _150 >= _156;
    bool _160 = !_146;
    bool _162 = _158 || _160;
    float _164 = _156;
    if (_162)
    {
        _164 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _166 = _164;
    if (_162)
    {
        out.m_51.x = 0.0;
    }
    if (_162)
    {
        float _168 = _166 * 5.0;
        _134 = as_type<int>(_168);
    }
    int _170 = _134;
    if (_162)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5279 = as_type<float>(_170);
        out.gl_Position.z = _5279;
    }
    if (_162)
    {
        return out;
    }
    bool _172 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _174 = !_172;
    float _192;
    if (!_174)
    {
        float _176 = in.m_55.x;
        float _178 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _180 = _176 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _182 = fma(_180, (*spvDescriptorSet0.vp_c9)._m0[12].x, _150);
        float _184 = _182 * _178;
        float _186 = floor(_184);
        float _188 = -_186;
        float _190 = _184 + _188;
        _192 = _190;
        _194 = true;
    }
    else
    {
        float _196 = float(_116);
        float _198 = 1.0 / _196;
        float _200 = _150 * _198;
        _192 = _200;
    }
    _194 = false;
    float _202 = _192;
    float _204 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _206 = _202 + _204;
    float _208 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _210 = _202 + _208;
    float _212 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _214 = _202 + _212;
    float _216 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _218 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _216;
    float _220 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _222 = _220 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _224 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _226 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _224;
    float _228 = 1.0 / _218;
    bool _230 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _232 = 1.0 / _226;
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _236 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _234;
    float _238 = 1.0 / _222;
    float _240 = _206 * _228;
    bool _242 = _202 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _244 = isnan(_202);
    bool _246 = _242 || _244;
    bool _248 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _250 = _246 || _248;
    float _252 = float(_250);
    float _254 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _256 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _254;
    float _258 = fma(_236, _240, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _260 = fma(_256, _240, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _262 = _210 * _232;
    bool _264 = _202 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _266 = isnan(_202);
    bool _268 = _264 || _266;
    bool _270 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _272 = _268 || _270;
    float _274 = float(_272);
    float _276 = -_252;
    float _278 = _276 + 1.0;
    float _280 = _274 * _278;
    bool _282 = _202 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _284 = isnan(_202);
    bool _286 = _282 || _284;
    bool _288 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _290 = _286 || _288;
    float _292 = float(_290);
    float _294 = _214 * _238;
    bool _296 = _202 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _298 = isnan(_202);
    bool _300 = _296 || _298;
    bool _302 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _304 = _300 || _302;
    float _306 = float(_304);
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _310 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _308;
    float _312 = -_274;
    float _314 = _312 + 1.0;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _318 = _316 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _320 = fma(_310, _240, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _322 = -_306;
    float _324 = _322 + 1.0;
    float _326 = _306 * _314;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _330 = _328 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _334 = _332 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _336 = _292 * _324;
    float _338 = -_292;
    float _340 = _338 + 1.0;
    float _342 = fma(_318, _294, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _344 = fma(_334, _294, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _346 = _258 * _336;
    float _348 = _260 * _336;
    float _350 = _320 * _336;
    float _352 = fma(_340, (*spvDescriptorSet0.vp_c9)._m0[143].x, _346);
    float _354 = fma(_340, (*spvDescriptorSet0.vp_c9)._m0[143].y, _348);
    float _356 = fma(_340, (*spvDescriptorSet0.vp_c9)._m0[143].z, _350);
    float _358 = fma(_330, _294, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _362 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _360;
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _366 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _364;
    float _368 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _370 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _368;
    float _372 = fma(_342, _326, _352);
    float _374 = fma(_362, _262, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _376 = fma(_366, _262, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _378 = fma(_370, _262, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _380 = fma(_344, _326, _354);
    float _382 = fma(_358, _326, _356);
    float _384 = fma(_374, _280, _372);
    float _386 = fma(_376, _280, _380);
    float _388 = fma(_378, _280, _382);
    float _390 = fma(_252, (*spvDescriptorSet0.vp_c9)._m0[146].x, _384);
    float _392 = fma(_252, (*spvDescriptorSet0.vp_c9)._m0[146].y, _386);
    float _394 = fma(_252, (*spvDescriptorSet0.vp_c9)._m0[146].z, _388);
    bool _396 = !_230;
    float _414;
    if (!_396)
    {
        float _398 = in.m_55.x;
        float _400 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _402 = _398 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _404 = fma(_402, (*spvDescriptorSet0.vp_c9)._m0[11].y, _150);
        float _406 = _404 * _400;
        float _408 = floor(_406);
        float _410 = -_408;
        float _412 = _406 + _410;
        _414 = _412;
        _416 = true;
    }
    else
    {
        float _418 = float(_116);
        float _420 = 1.0 / _418;
        float _422 = _150 * _420;
        _414 = _422;
    }
    _416 = false;
    float _424 = _414;
    float _426 = in.m_57.x;
    float _428 = in.m_57.y;
    float _430 = in.m_57.z;
    bool _432 = _424 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _434 = isnan(_424);
    bool _436 = _432 || _434;
    bool _438 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _440 = _436 || _438;
    float _442 = float(_440);
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _446 = _444 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _448 = _424 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _450 = isnan(_424);
    bool _452 = _448 || _450;
    bool _454 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _456 = _452 || _454;
    float _458 = float(_456);
    float _460 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _462 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _460;
    bool _464 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _466 = 1.0 / _446;
    float _468 = -_442;
    float _470 = _468 + 1.0;
    float _472 = _458 * _470;
    float _474 = -_458;
    float _476 = _474 + 1.0;
    float _478 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _480 = _462 * _466;
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _484 = _424 + _482;
    float _486 = _478 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _488 = _392 * _428;
    float _490 = fma(_480, _484, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _492 = _390 * _426;
    float _494 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _496 = _490 * _472;
    float _498 = _494 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _500 = fma(_476, (*spvDescriptorSet0.vp_c9)._m0[115].x, _496);
    float _502 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _504 = fma(_442, (*spvDescriptorSet0.vp_c9)._m0[116].x, _500);
    float _506 = _394 * _430;
    float _508 = _502 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _510 = _504 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_59.x = _498;
    out.m_59.y = _508;
    out.m_59.z = _486;
    out.m_59.w = _510;
    bool _512 = !_464;
    float _514 = _428;
    float _532;
    if (!_512)
    {
        float _516 = in.m_55.x;
        float _518 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _520 = _516 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _522 = fma(_520, (*spvDescriptorSet0.vp_c9)._m0[11].w, _150);
        float _524 = _522 * _518;
        float _526 = floor(_524);
        float _528 = -_526;
        float _530 = _524 + _528;
        _532 = _530;
        _534 = true;
    }
    else
    {
        float _536 = float(_116);
        float _538 = 1.0 / _536;
        float _540 = _150 * _538;
        _532 = _540;
    }
    _534 = false;
    float _542 = _532;
    bool _544 = _542 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _546 = isnan(_542);
    bool _548 = _544 || _546;
    bool _550 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _552 = _548 || _550;
    float _554 = float(_552);
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _558 = _556 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _560 = _542 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _562 = isnan(_542);
    bool _564 = _560 || _562;
    bool _566 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _568 = _564 || _566;
    float _570 = float(_568);
    float _572 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _574 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _572;
    bool _576 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _578 = 1.0 / _558;
    float _580 = -_554;
    float _582 = _580 + 1.0;
    float _584 = _570 * _582;
    float _586 = -_570;
    float _588 = _586 + 1.0;
    float _590 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _592 = _574 * _578;
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _596 = _542 + _594;
    float _598 = _590 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _600 = fma(_592, _596, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _602 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _604 = _600 * _584;
    float _606 = _602 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _608 = fma(_588, (*spvDescriptorSet0.vp_c9)._m0[131].x, _604);
    float _610 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _612 = fma(_554, (*spvDescriptorSet0.vp_c9)._m0[132].x, _608);
    float _614 = _610 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _616 = _612 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_61.x = _606;
    out.m_61.y = _614;
    out.m_61.z = _598;
    out.m_61.w = _616;
    bool _618 = !_576;
    float _636;
    if (!_618)
    {
        float _620 = in.m_55.x;
        float _622 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _624 = _620 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _626 = fma(_624, (*spvDescriptorSet0.vp_c9)._m0[14].x, _150);
        float _628 = _626 * _622;
        float _630 = floor(_628);
        float _632 = -_630;
        float _634 = _628 + _632;
        _636 = _634;
        _638 = true;
    }
    else
    {
        float _640 = float(_116);
        float _642 = 1.0 / _640;
        float _644 = _150 * _642;
        _636 = _644;
    }
    _638 = false;
    float _646 = _636;
    float _648 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _650 = int(_648);
    float _652 = in.m_55.x;
    float _654 = _492 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _656 = in.m_55.y;
    int _658 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _660 = _658 != 0;
    float _662 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _664 = int(_662);
    float _666 = in.m_55.z;
    int _668 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _670 = _668 != 0;
    int _672 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _674 = _672 != 0;
    float _676 = in.m_63.x;
    float _678 = float(_650);
    float _680 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _682 = int(_680);
    float _684 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _686 = _684 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _688 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _690 = _688 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _692 = float(_664);
    float _694 = 1.0 / _678;
    bool _696 = false;
    if (_670)
    {
        bool _698 = _652 > 0.5;
        _696 = _698;
    }
    bool _700 = _696;
    float _702 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _704 = _702 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _706 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _708 = _706 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _710 = _652 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _712 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _714 = int(_712);
    float _716 = float(uint(_682));
    float _718 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _720 = _718 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    int _722 = ~_682;
    int _724 = _722 + 1;
    int _726 = 0;
    float _728 = _676;
    if (_674)
    {
        float _730 = -_676;
        float _732 = _730 + 1.0;
        _726 = as_type<int>(_732);
    }
    int _734 = _726;
    float _736 = 0.0;
    if (!_670)
    {
        _736 = _676;
    }
    float _738 = _736;
    float _740 = _656 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _742 = _666 > 0.5;
    float _744 = _694 * _150;
    float _746 = 1.0 / _692;
    float _748 = _738;
    if (!_674)
    {
        _514 = _676;
    }
    float _750 = _514;
    float _752 = _750;
    if (_674)
    {
        float _754 = _742 ? as_type<float>(_734) : _676;
        _752 = _754;
    }
    float _756 = _752;
    float _758 = float(_116);
    float _760 = float(uint(_714));
    float _762 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _764 = int(_762);
    int _766 = ~_714;
    int _768 = _766 + 1;
    float _770 = 1.0 / _716;
    float _772 = _746 * _150;
    float _774 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _776 = _774 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _778 = trunc(_744);
    int _780 = int(_778);
    float _782 = float(_764);
    float _784 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _786 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _784;
    float _788 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _790 = 1.0 / _760;
    float _792 = float(uint(_780));
    float _794 = trunc(_772);
    int _796 = int(_794);
    int _798 = as_type<int>(_770) + (-2);
    float _800 = as_type<float>(_798) * _792;
    int _802 = as_type<int>(_790) + (-2);
    float _804 = 1.0 / _782;
    float _806 = _792;
    float _808 = _782;
    if (_660)
    {
        _806 = 1.0;
    }
    float _810 = _806;
    float _812 = _810;
    if (!_660)
    {
        _812 = 7.345489978790283203125;
    }
    float _814 = _812;
    float _816 = trunc(_800);
    float _818 = precise::max(_816, 0.0);
    uint _821 = uint(_818);
    float _823 = float(uint(_796));
    float _825 = _814 * _652;
    float _827 = _823;
    if (_660)
    {
        _808 = 1.0;
    }
    float _829 = _808;
    float _831 = _829;
    if (!_660)
    {
        _831 = 1.2345600128173828125;
    }
    float _833 = _831;
    float _835 = as_type<float>(_802) * _823;
    float _837 = _833;
    if (_660)
    {
        _827 = _652;
    }
    float _839 = _827;
    float _841 = floor(_825);
    float _843 = _839;
    if (!_660)
    {
        _843 = _656;
    }
    float _845 = _843;
    float _847 = _804 * _150;
    float _849 = _845 * _833;
    float _851 = _845;
    if (_660)
    {
        _851 = _652;
    }
    float _853 = _851;
    int _855 = _724 * int(_821);
    int _857 = _855 + _780;
    float _859 = trunc(_835);
    float _861 = precise::max(_859, 0.0);
    uint _863 = uint(_861);
    float _865 = _853;
    if (_660)
    {
        _837 = 1.0;
    }
    float _867 = _837;
    float _869 = _867;
    if (!_660)
    {
        _865 = _666;
    }
    float _871 = _865;
    float _873 = float(uint(_857));
    if (!_660)
    {
        _869 = 5.839270114898681640625;
    }
    float _875 = _869;
    float _877 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _879 = int(_877);
    float _881 = in.m_55.w;
    float _883 = as_type<float>(_798) * _873;
    float _885 = -_841;
    float _887 = _825 + _885;
    float _889 = _871 * _875;
    float _891 = trunc(_883);
    float _893 = precise::max(_891, 0.0);
    uint _895 = uint(_893);
    int _897 = _768 * int(_863);
    int _899 = _897 + _796;
    float _901 = float(uint(_899));
    float _903 = floor(_849);
    float _905 = float(uint(_879));
    float _907 = as_type<float>(_802) * _901;
    int _909 = as_type<int>(_901);
    if (_670)
    {
        float _911 = -_676;
        float _913 = _911 + 1.0;
        _909 = as_type<int>(_913);
    }
    int _915 = _909;
    int _917 = ~_879;
    int _919 = _917 + 1;
    float _921 = floor(_889);
    bool _923 = _881 > 0.5;
    float _925 = float(_682);
    int _927 = int(_821) + int(_895);
    if (_670)
    {
        float _929 = _700 ? as_type<float>(_915) : _676;
        _748 = _929;
    }
    float _931 = _748;
    float _933 = trunc(_907);
    float _935 = precise::max(_933, 0.0);
    uint _937 = uint(_935);
    float _939 = _887 * _925;
    float _941 = float(_780);
    float _943 = -_903;
    float _945 = _849 + _943;
    int _947 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _949 = _947 != 0;
    bool _951 = _941 >= _925;
    bool _953 = isnan(_941);
    bool _955 = _951 || _953;
    bool _957 = isnan(_925);
    bool _959 = _955 || _957;
    float _961 = float(_959);
    float _963 = 1.0 / _905;
    int _965 = ~_682;
    int _967 = _965 + 1;
    float _969 = -_921;
    float _971 = _889 + _969;
    bool _973 = !_949;
    int _975 = _973 ? 0 : 1;
    int _977 = _967 * _927;
    int _979 = _977 + _780;
    float _981 = trunc(_847);
    int _983 = int(_981);
    int _985 = int(_863) + int(_937);
    bool _987 = uint(_979) >= uint(_682);
    int _989 = abs(_975);
    bool _991 = !_987;
    int _993 = _991 ? 0 : (-1);
    float _995 = trunc(_939);
    int _997 = int(_995);
    int _999 = as_type<int>(_963) + (-2);
    int _1001 = ~_927;
    int _1003 = _1001 + _993;
    int _1005 = _1003 + 1;
    int _1007 = ~_714;
    int _1009 = _1007 + 1;
    float _1011 = trunc(_961);
    int _1013 = int(_1011);
    float _1015 = float(uint(_983));
    int _1017 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1019 = _1017 != 0;
    int _1021 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1023 = _1021 != 0;
    int _1025 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1027 = _1025 != 0;
    int _1029 = _1009 * _985;
    int _1031 = _1029 + _796;
    bool _1033 = _682 == 0;
    float _1035 = as_type<float>(_999) * _1015;
    float _1037 = in.m_63.y;
    int _1039 = _997 * _989;
    int _1041 = _1039 + _780;
    bool _1043 = uint(_1031) >= uint(_714);
    float _1045 = trunc(_1035);
    float _1047 = precise::max(_1045, 0.0);
    uint _1049 = uint(_1047);
    int _1051 = _682 * _1005;
    int _1053 = _1051 + _780;
    int _1055 = _682 + (-1);
    bool _1057 = !_1043;
    int _1059 = _1057 ? 0 : (-1);
    int _1061 = ~_1013;
    int _1063 = _1061 + 1;
    int _1065 = _1063 + 1;
    bool _1067 = !_1033;
    int _1069 = _1067 ? _1053 : (-1);
    float _1071 = 1.0 / _758;
    float _1073 = float(_714);
    float _1075 = float(_796);
    int _1077 = _1069 * _1065;
    int _1079 = ~_985;
    int _1081 = _1079 + _1059;
    int _1083 = _1081 + 1;
    int _1085 = _1013 * _1055;
    int _1087 = _1085 + _1077;
    bool _1089 = _1075 >= _1073;
    bool _1091 = isnan(_1075);
    bool _1093 = _1089 || _1091;
    bool _1095 = isnan(_1073);
    bool _1097 = _1093 || _1095;
    float _1099 = float(_1097);
    int _1101 = _919 * int(_1049);
    int _1103 = _1101 + _983;
    int _1105 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1107 = _1105 != 0;
    float _1109 = _1073 * _945;
    float _1111 = trunc(_1099);
    int _1113 = int(_1111);
    bool _1115 = !_1027;
    int _1117 = _1115 ? 0 : 1;
    int _1119 = _714 * _1083;
    int _1121 = _1119 + _796;
    float _1123 = float(uint(_1103));
    float _1125 = -_1037;
    float _1127 = _1125 + 1.0;
    bool _1129 = _656 > 0.5;
    bool _1131 = !_1023;
    int _1133 = _1131 ? 0 : 1;
    float _1135 = as_type<float>(_999) * _1123;
    float _1137 = _925 * _150;
    bool _1139 = !_1107;
    int _1141 = _1139 ? 0 : 1;
    float _1143 = trunc(_1109);
    int _1145 = int(_1143);
    int _1147 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1149 = _1147 != 0;
    float _1151 = _1137 * _1071;
    bool _1153 = _714 == 0;
    float _1155 = _1071 * _150;
    int _1157 = _1129 ? as_type<int>(_1127) : as_type<int>(_1037);
    int _1159 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1161 = _1159 != 0;
    float _1163 = trunc(_1135);
    float _1165 = precise::max(_1163, 0.0);
    uint _1167 = uint(_1165);
    int _1169 = abs(_1133);
    float _1171 = _1073 * _1155;
    int _1173 = _923 ? as_type<int>(_1127) : as_type<int>(_1037);
    float _1175 = _1149 ? as_type<float>(_1157) : _1037;
    int _1177 = _1087 * _1169;
    int _1179 = ~_1113;
    int _1181 = _1179 + 1;
    int _1183 = _1181 + 1;
    float _1185 = trunc(_1151);
    int _1187 = int(_1185);
    bool _1189 = !_1153;
    int _1191 = _1189 ? _1121 : (-1);
    int _1193 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1195 = _1193 != 0;
    int _1197 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1199 = _1197 != 0;
    bool _1201 = !_1019;
    int _1203 = _1201 ? 0 : 1;
    int _1205 = _1183 * _1191;
    bool _1207 = !_1161;
    int _1209 = _1207 ? 0 : 1;
    float _1211 = 1.0 / _686;
    bool _1213 = !_1199;
    int _1215 = _1213 ? 0 : 1;
    int _1217 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1219 = _1217 != 0;
    int _1221 = abs(_1209);
    int _1223 = abs(_1203);
    float _1225 = 1.0 / _690;
    float _1227 = _1219 ? as_type<float>(_1173) : _1037;
    int _1229 = _1145 * _1221;
    int _1231 = _1229 + _796;
    int _1233 = ~_879;
    int _1235 = _1233 + 1;
    int _1237 = _1187 * _1223;
    int _1239 = _1237 + _1177;
    int _1241 = int(_1049) + int(_1167);
    float _1243 = 1.0 / _704;
    int _1245 = abs(_1117);
    int _1247 = _714 + (-1);
    int _1249 = _1235 * _1241;
    int _1251 = _1249 + _983;
    bool _1253 = !_1195;
    int _1255 = _1253 ? 0 : 1;
    int _1257 = _1041 * _1245;
    int _1259 = _1257 + _1239;
    int _1261 = abs(_1141);
    float _1263 = trunc(_1171);
    int _1265 = int(_1263);
    int _1267 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1269 = _1267 != 0;
    int _1271 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1273 = _1271 != 0;
    int _1275 = _1113 * _1247;
    int _1277 = _1275 + _1205;
    int _1279 = abs(_1215);
    int _1281 = _997 * _1261;
    int _1283 = _1281 + _1259;
    int _1285 = abs(_1255);
    bool _1287 = !_1269;
    int _1289 = _1287 ? 0 : 1;
    int _1291 = _1277 * _1279;
    float _1293 = 1.0 / _708;
    bool _1295 = uint(_1251) >= uint(_879);
    bool _1297 = !_1273;
    int _1299 = _1297 ? 0 : 1;
    float _1301 = float(_879);
    int _1303 = _1265 * _1285;
    int _1305 = _1303 + _1291;
    float _1307 = float(_983);
    float _1309 = 1.0 / _720;
    int _1311 = abs(_1289);
    float _1313 = _1301 * _1155;
    int _1315 = abs(_1299);
    bool _1317 = _1307 >= _1301;
    bool _1319 = isnan(_1307);
    bool _1321 = _1317 || _1319;
    bool _1323 = isnan(_1301);
    bool _1325 = _1321 || _1323;
    float _1327 = float(_1325);
    int _1329 = _1231 * _1311;
    int _1331 = _1329 + _1305;
    float _1333 = float(uint(_1283));
    float _1335 = 1.0 / _776;
    bool _1337 = !_1295;
    int _1339 = _1337 ? 0 : (-1);
    float _1341 = as_type<float>(_798) * _1333;
    int _1343 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1345 = _1343 != 0;
    int _1347 = _1145 * _1315;
    int _1349 = _1347 + _1331;
    float _1351 = _1301 * _971;
    float _1353 = trunc(_1327);
    int _1355 = int(_1353);
    int _1357 = ~_1241;
    int _1359 = _1357 + _1339;
    int _1361 = _1359 + 1;
    float _1363 = _666 * 2.0;
    float _1365 = float(uint(_1349));
    bool _1367 = !_1345;
    int _1369 = _1367 ? 0 : 1;
    int _1371 = _879 * _1361;
    int _1373 = _1371 + _983;
    int _1375 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1377 = _1375 != 0;
    int _1379 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1381 = _1379 != 0;
    float _1383 = trunc(_1341);
    float _1385 = precise::max(_1383, 0.0);
    uint _1387 = uint(_1385);
    bool _1389 = _879 == 0;
    float _1391 = as_type<float>(_802) * _1365;
    int _1393 = abs(_1369);
    float _1395 = _786 * _1335;
    int _1397 = ~_682;
    int _1399 = _1397 + 1;
    bool _1401 = !_1389;
    int _1403 = _1401 ? _1373 : (-1);
    float _1405 = trunc(_1351);
    int _1407 = int(_1405);
    bool _1409 = !_1381;
    int _1411 = _1409 ? 0 : 1;
    int _1413 = ~_1355;
    int _1415 = _1413 + 1;
    int _1417 = _1415 + 1;
    int _1419 = _879 + (-1);
    float _1421 = trunc(_1391);
    float _1423 = precise::max(_1421, 0.0);
    uint _1425 = uint(_1423);
    int _1427 = _1399 * int(_1387);
    int _1429 = _1427 + _1283;
    int _1431 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1433 = _1431 != 0;
    int _1435 = _1417 * _1403;
    int _1437 = ~_714;
    int _1439 = _1437 + 1;
    bool _1441 = _666 > 0.5;
    int _1443 = _1355 * _1419;
    int _1445 = _1443 + _1435;
    float _1447 = trunc(_1313);
    int _1449 = int(_1447);
    int _1451 = _1407 * _1393;
    int _1453 = _1451 + _983;
    int _1455 = abs(_1411);
    float _1457 = float(uint(_1429));
    bool _1459 = !_1377;
    int _1461 = _1459 ? 0 : 1;
    bool _1463 = !_1433;
    int _1465 = _1463 ? 0 : 1;
    float _1467 = as_type<float>(_798) * _1457;
    int _1469 = _1445 * _1455;
    int _1471 = abs(_1461);
    int _1473 = _1439 * int(_1425);
    int _1475 = _1473 + _1349;
    float _1477 = trunc(_1467);
    float _1479 = precise::max(_1477, 0.0);
    uint _1481 = uint(_1479);
    int _1483 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1485 = _1483 != 0;
    int _1487 = abs(_1465);
    bool _1489 = !_1485;
    int _1491 = _1489 ? 0 : 1;
    float _1493 = floor(_1363);
    float _1495 = float(uint(_1475));
    int _1497 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1499 = _1497 != 0;
    int _1501 = _1449 * _1471;
    int _1503 = _1501 + _1469;
    int _1505 = abs(_1491);
    float _1507 = as_type<float>(_802) * _1495;
    int _1509 = ~_682;
    int _1511 = _1509 + 1;
    int _1513 = _1453 * _1487;
    int _1515 = _1513 + _1503;
    int _1517 = int(_1387) + int(_1481);
    float _1519 = trunc(_1507);
    float _1521 = precise::max(_1519, 0.0);
    uint _1523 = uint(_1521);
    int _1525 = _1407 * _1505;
    int _1527 = _1525 + _1515;
    float _1529 = _1037;
    float _1531 = as_type<float>(_1169);
    if (_1499)
    {
        float _1533 = _1441 ? _1127 : _1037;
        _1529 = _1533;
    }
    float _1535 = _1529;
    int _1537 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1539 = _1537 != 0;
    int _1541 = _1511 * _1517;
    int _1543 = _1541 + _1283;
    float _1545 = float(uint(_1527));
    float _1547 = float(uint(_1041));
    bool _1549 = uint(_1543) >= uint(_682);
    float _1551 = as_type<float>(_999) * _1545;
    int _1553 = ~_714;
    int _1555 = _1553 + 1;
    float _1557 = as_type<float>(_798) * _1547;
    bool _1559 = !_1549;
    int _1561 = _1559 ? 0 : (-1);
    float _1563 = trunc(_1551);
    float _1565 = precise::max(_1563, 0.0);
    uint _1567 = uint(_1565);
    int _1569 = int(_1425) + int(_1523);
    int _1571 = int(_1523);
    if (_1539)
    {
        float _1573 = -_676;
        float _1575 = _1573 + 1.0;
        _1571 = as_type<int>(_1575);
    }
    int _1577 = _1571;
    int _1579 = ~_1517;
    int _1581 = _1579 + _1561;
    int _1583 = _1581 + 1;
    int _1585 = ~_879;
    int _1587 = _1585 + 1;
    if (_1539)
    {
        float _1589 = _1129 ? as_type<float>(_1577) : _676;
        _728 = _1589;
    }
    float _1591 = _728;
    float _1593 = trunc(_1557);
    float _1595 = precise::max(_1593, 0.0);
    uint _1597 = uint(_1595);
    int _1599 = _682 * _1583;
    int _1601 = _1599 + _1283;
    bool _1603 = _682 == 0;
    int _1605 = _1555 * _1569;
    int _1607 = _1605 + _1349;
    bool _1609 = !_1603;
    int _1611 = _1609 ? _1601 : (-1);
    int _1613 = ~_682;
    int _1615 = _1613 + 1;
    int _1617 = _1587 * int(_1567);
    int _1619 = _1617 + _1527;
    int _1621 = _1611 & 3;
    bool _1623 = _1621 != 0;
    int _1625 = _1611 & 3;
    bool _1627 = _1625 != 0;
    bool _1629 = uint(_1607) >= uint(_714);
    int _1631 = _1615 * int(_1597);
    int _1633 = _1631 + _1041;
    int _1635 = _1623 ? 0 : 1;
    bool _1637 = uint(_1625) >= 2u;
    bool _1639 = !_1629;
    int _1641 = _1639 ? 0 : (-1);
    float _1643 = float(uint(_1619));
    int _1645 = _1637 ? 0 : 1;
    bool _1647 = uint(_1625) > 1u;
    float _1649 = as_type<float>(_999) * _1643;
    bool _1651 = _1625 != 3;
    int _1653 = ~_1569;
    int _1655 = _1653 + _1641;
    int _1657 = _1655 + 1;
    float _1659 = float(uint(_1633));
    float _1661 = trunc(_1649);
    float _1663 = precise::max(_1661, 0.0);
    uint _1665 = uint(_1663);
    bool _1667 = _714 == 0;
    int _1669 = _714 * _1657;
    int _1671 = _1669 + _1349;
    int _1673 = ~_1635;
    int _1675 = _1673 + 1;
    int _1677 = _1675 + 1;
    float _1679 = as_type<float>(_798) * _1659;
    int _1681 = ~_1645;
    int _1683 = _1681 + 1;
    int _1685 = _1683 + 1;
    bool _1687 = !_1667;
    int _1689 = _1687 ? _1671 : (-1);
    int _1691 = _1677;
    int _1693 = _1685;
    if (!_1647)
    {
        int _1695 = ~_1635;
        int _1697 = _1695 + 1;
        _1691 = _1697;
    }
    int _1699 = _1691;
    float _1701 = trunc(_1679);
    float _1703 = precise::max(_1701, 0.0);
    uint _1705 = uint(_1703);
    if (_1651)
    {
        int _1707 = ~_1645;
        int _1709 = _1707 + 1;
        _1693 = _1709;
    }
    int _1711 = _1693;
    int _1713 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1715 = _1713 != 0;
    int _1717 = _1689 & 3;
    bool _1719 = _1717 != 0;
    bool _1721 = !_1715;
    int _1723 = _1721 ? 0 : 1;
    bool _1725 = uint(_1717) >= 2u;
    int _1727 = ~_879;
    int _1729 = _1727 + 1;
    int _1731 = _1725 ? 0 : 1;
    bool _1733 = _1717 != 3;
    int _1735 = int(_1567) + int(_1665);
    int _1737 = ~_682;
    int _1739 = _1737 + 1;
    int _1741 = int(_1597) + int(_1705);
    int _1743 = _1729 * _1735;
    int _1745 = _1743 + _1527;
    int _1747 = ~_1731;
    int _1749 = _1747 + 1;
    int _1751 = _1749 + 1;
    int _1753 = _1719 ? 0 : 1;
    bool _1755 = uint(_1745) >= uint(_879);
    int _1757 = _1751;
    int _1759 = _1739;
    if (_1733)
    {
        int _1761 = ~_1731;
        int _1763 = _1761 + 1;
        _1757 = _1763;
    }
    int _1765 = _1757;
    int _1767 = _1739 * _1741;
    int _1769 = _1767 + _1041;
    float _1771 = float(uint(_1231));
    bool _1773 = !_1755;
    int _1775 = _1773 ? 0 : (-1);
    bool _1777 = uint(_1769) >= uint(_682);
    float _1779 = as_type<float>(_802) * _1771;
    float _1781 = float(uint(_1453));
    int _1783 = ~_1735;
    int _1785 = _1783 + _1775;
    int _1787 = _1785 + 1;
    float _1789 = trunc(_1779);
    float _1791 = precise::max(_1789, 0.0);
    uint _1793 = uint(_1791);
    bool _1795 = uint(_1717) > 1u;
    float _1797 = as_type<float>(_999) * _1781;
    int _1799 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1801 = _1799 != 0;
    int _1803 = _879 * _1787;
    int _1805 = _1803 + _1527;
    int _1807 = ~_714;
    int _1809 = _1807 + 1;
    float _1811 = _652 * 2.0;
    int _1813 = ~_879;
    int _1815 = _1813 + 1;
    float _1817 = trunc(_1797);
    float _1819 = precise::max(_1817, 0.0);
    uint _1821 = uint(_1819);
    bool _1823 = !_1389;
    int _1825 = _1823 ? _1805 : (-1);
    int _1827 = ~_1753;
    int _1829 = _1827 + 1;
    int _1831 = _1829 + 1;
    bool _1833 = _646 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1835 = isnan(_646);
    bool _1837 = _1833 || _1835;
    bool _1839 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1841 = _1837 || _1839;
    float _1843 = float(_1841);
    int _1845 = _1831;
    int _1847 = as_type<int>(_1781);
    float _1849 = _1811;
    if (!_1795)
    {
        int _1851 = ~_1753;
        int _1853 = _1851 + 1;
        _1845 = _1853;
    }
    int _1855 = _1845;
    int _1857 = _1809 * int(_1793);
    int _1859 = _1857 + _1231;
    if (_1801)
    {
        _1759 = 0;
    }
    int _1861 = _1759;
    float _1863 = floor(_1811);
    int _1865 = _1825 & 3;
    bool _1867 = _1865 != 0;
    float _1869 = -_1843;
    float _1871 = _1869 + 1.0;
    float _1873 = float(uint(_1859));
    int _1875 = _1861;
    if (!_1801)
    {
        _1875 = 1;
    }
    int _1877 = _1875;
    int _1879 = _1815 * int(_1821);
    int _1881 = _1879 + _1453;
    float _1883 = _1867 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _1885 = as_type<float>(_802) * _1873;
    bool _1887 = _1877 != 1;
    float _1889 = _656 * 2.0;
    float _1891 = float(uint(_1881));
    float _1893 = trunc(_1885);
    float _1895 = precise::max(_1893, 0.0);
    uint _1897 = uint(_1895);
    float _1899 = _1883;
    if (_1801)
    {
        _1847 = 0;
    }
    int _1901 = _1847;
    int _1903 = _1901;
    if (!_1801)
    {
        _1903 = 2;
    }
    int _1905 = _1903;
    float _1907 = as_type<float>(_999) * _1891;
    bool _1909 = !_1777;
    int _1911 = _1909 ? 0 : (-1);
    bool _1913 = _1865 != 3;
    bool _1915 = uint(_1865) > 1u;
    float _1917 = trunc(_1907);
    float _1919 = precise::max(_1917, 0.0);
    uint _1921 = uint(_1919);
    bool _1923 = uint(_1865) >= 2u;
    float _1925 = as_type<float>(_1905);
    if (!_1887)
    {
        _1849 = _656;
    }
    float _1927 = _1849;
    float _1929 = _1923 ? 0.0 : 1.4012984643248170709237295832899e-45;
    int _1931 = ~as_type<int>(_1883);
    int _1933 = _1931 + 1;
    int _1935 = _1933 + 1;
    int _1937 = ~as_type<int>(_1929);
    int _1939 = _1937 + 1;
    int _1941 = _1939 + 1;
    bool _1943 = _1905 != 2;
    int _1945 = _1941;
    int _1947 = _1935;
    float _1949 = _1929;
    float _1951 = _1927;
    if (_1913)
    {
        int _1953 = ~as_type<int>(_1929);
        int _1955 = _1953 + 1;
        _1945 = _1955;
    }
    int _1957 = _1945;
    if (!_1915)
    {
        int _1959 = ~as_type<int>(_1883);
        int _1961 = _1959 + 1;
        _1947 = _1961;
    }
    int _1963 = _1947;
    int _1965 = ~_714;
    int _1967 = _1965 + 1;
    float _1969 = as_type<float>(_1967);
    if (!_1887)
    {
        _1925 = _1927;
    }
    float _1971 = _1925;
    float _1973 = _1971;
    if (!_1887)
    {
        _1949 = _666;
    }
    float _1975 = _1949;
    float _1977 = _1975;
    if (!_1887)
    {
        _1899 = _666;
    }
    float _1979 = _1899;
    float _1981 = _1979;
    if (_1887)
    {
        _1973 = _652;
    }
    float _1983 = _1973;
    if (_1887)
    {
        _1951 = _652;
    }
    float _1985 = _1951;
    if (_1887)
    {
        _1977 = _656;
    }
    float _1987 = _1977;
    float _1989 = _1983 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_1887)
    {
        _1981 = _656;
    }
    float _1991 = _1981;
    int _1993 = int(_1793) + int(_1897);
    bool _1995 = _1863 > 0.0;
    float _1997 = floor(_1889);
    bool _1999 = _1863 >= 0.0;
    bool _2001 = isnan(_1863);
    bool _2003 = _1999 || _2001;
    bool _2005 = isnan(0.0);
    bool _2007 = _2003 || _2005;
    int _2009 = int(_1821) + int(_1921);
    if (_1943)
    {
        _1531 = _652;
    }
    float _2011 = _1531;
    int _2013 = _1967 * _1993;
    int _2015 = _2013 + _1231;
    float _2017 = _2011;
    if (_1943)
    {
        _1969 = _656;
    }
    float _2019 = _1969;
    int _2021 = ~_879;
    int _2023 = _2021 + 1;
    float _2025 = _2019;
    if (!_1943)
    {
        _2017 = _666;
    }
    float _2027 = _2017;
    if (!_1943)
    {
        _2025 = _652;
    }
    float _2029 = _2025;
    bool _2031 = uint(_2015) >= uint(_714);
    float _2033 = _2027 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    int _2035 = _2007 ? 0 : 1;
    float _2037 = _2029 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _2039 = ~_1741;
    int _2041 = _2039 + _1911;
    int _2043 = _2041 + 1;
    float _2045 = fma(_2037, -2.0, _788);
    bool _2047 = !_2031;
    int _2049 = _2047 ? 0 : (-1);
    bool _2051 = _1997 > 0.0;
    int _2053 = _2023 * _2009;
    int _2055 = _2053 + _1453;
    bool _2057 = _1997 >= 0.0;
    bool _2059 = isnan(_1997);
    bool _2061 = _2057 || _2059;
    bool _2063 = isnan(0.0);
    bool _2065 = _2061 || _2063;
    int _2067 = _682 * _2043;
    int _2069 = _2067 + _1041;
    int _2071 = ~_2035;
    int _2073 = _2071 + 1;
    int _2075 = _2073 + 1;
    float _2077 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2045);
    int _2079 = _2075;
    int _2081 = as_type<int>(_2029);
    if (!_1995)
    {
        int _2083 = ~_2035;
        int _2085 = _2083 + 1;
        _2079 = _2085;
    }
    int _2087 = _2079;
    float _2089 = in.m_48.x;
    float _2091 = in.m_48.y;
    float _2093 = in.m_48.z;
    int _2095 = _2065 ? 0 : 1;
    bool _2097 = uint(_2055) >= uint(_879);
    float _2099 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2101 = _2099 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    int _2103 = ~_2095;
    int _2105 = _2103 + 1;
    int _2107 = _2105 + 1;
    int _2109 = _2107;
    if (!_2051)
    {
        int _2111 = ~_2095;
        int _2113 = _2111 + 1;
        _2109 = _2113;
    }
    int _2115 = _2109;
    float _2117 = 1.0 / _2101;
    bool _2119 = !_1603;
    int _2121 = _2119 ? _2069 : (-1);
    bool _2123 = !_2097;
    int _2125 = _2123 ? 0 : (-1);
    int _2127 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2129 = _2127 != 0;
    int _2131 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2133 = _2131 != 0;
    int _2135 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2137 = _2135 != 0;
    int _2139 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2141 = _2139 != 0;
    int _2143 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2145 = _2143 != 0;
    float _2147 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2149 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2151 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2153 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2151;
    float _2155 = _2091 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _2157 = -_2147;
    float _2159 = fma(_710, 2.0, _2157);
    float _2161 = fma(_740, -2.0, _2149);
    float _2163 = _2091 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _2165 = _2091 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _2167 = _2153 * _1211;
    float _2169 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2171 = _2169 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2173 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2175 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2173;
    float _2177 = fma(_2089, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2163);
    float _2179 = _2171 * _1225;
    float _2181 = fma(_2089, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2165);
    float _2183 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2185 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2183;
    float _2187 = fma(_2089, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2155);
    float _2189 = _2175 * _2117;
    float _2191 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2193 = _2191 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2195 = _2185 * _1243;
    float _2197 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2199 = _2197 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2201 = _652 + _656;
    bool _2203 = _646 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2205 = isnan(_646);
    bool _2207 = _2203 || _2205;
    bool _2209 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2211 = _2207 || _2209;
    float _2213 = float(_2211);
    float _2215 = _656 + _666;
    float _2217 = _2193 * _1293;
    float _2219 = _2199 * _1309;
    float _2221 = _2201 + (-1.0);
    float _2223 = _2215 + (-1.0);
    bool _2225 = _646 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2227 = isnan(_646);
    bool _2229 = _2225 || _2227;
    bool _2231 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2233 = _2229 || _2231;
    float _2235 = float(_2233);
    float _2237 = -_2213;
    float _2239 = _2237 + 1.0;
    float _2241 = fma(_2093, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2181);
    float _2243 = fma(_2221, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _2245 = fma(_2093, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2187);
    float _2247 = _2235 * _2239;
    float _2249 = -_2235;
    float _2251 = _2249 + 1.0;
    bool _2253 = _646 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2255 = isnan(_646);
    bool _2257 = _2253 || _2255;
    bool _2259 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2261 = _2257 || _2259;
    float _2263 = float(_2261);
    float _2265 = fma(_2223, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _2267 = !_2129;
    int _2269 = _2267 ? 0 : 1;
    float _2271 = _1843 * _2251;
    bool _2273 = _646 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2275 = isnan(_646);
    bool _2277 = _2273 || _2275;
    bool _2279 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2281 = _2277 || _2279;
    float _2283 = float(_2281);
    float _2285 = _2263 * _1871;
    float _2287 = -_2263;
    float _2289 = _2287 + 1.0;
    float _2291 = fma(_2093, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2177);
    bool _2293 = _646 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2295 = isnan(_646);
    bool _2297 = _2293 || _2295;
    bool _2299 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2301 = _2297 || _2299;
    float _2303 = float(_2301);
    float _2305 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2307 = _646 + _2305;
    bool _2309 = _1493 >= 0.0;
    bool _2311 = isnan(_1493);
    bool _2313 = _2309 || _2311;
    bool _2315 = isnan(0.0);
    bool _2317 = _2313 || _2315;
    float _2319 = _2283 * _2289;
    bool _2321 = _646 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2323 = isnan(_646);
    bool _2325 = _2321 || _2323;
    bool _2327 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2329 = _2325 || _2327;
    float _2331 = float(_2329);
    float _2333 = -_2303;
    float _2335 = _2333 + 1.0;
    int _2337 = _2317 ? 0 : 1;
    float _2339 = fma(_2167, _2307, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _2341 = _1493 > 0.0;
    float _2343 = _2331 * _2335;
    bool _2345 = _646 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2347 = isnan(_646);
    bool _2349 = _2345 || _2347;
    bool _2351 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2353 = _2349 || _2351;
    float _2355 = float(_2353);
    float _2357 = -_2283;
    float _2359 = _2357 + 1.0;
    float _2361 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2363 = _646 + _2361;
    float _2365 = _2339 * _2343;
    float _2367 = -_2331;
    float _2369 = _2367 + 1.0;
    float _2371 = -_2355;
    float _2373 = _2371 + 1.0;
    float _2375 = _2355 * _2359;
    float _2377 = fma(_2179, _2363, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2379 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2381 = _646 + _2379;
    float _2383 = _2303 * _2373;
    float _2385 = fma(_2369, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2365);
    float _2387 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2389 = _646 + _2387;
    float _2391 = fma(_2189, _2381, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2393 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2395 = _646 + _2393;
    float _2397 = fma(_2377, _2383, _2385);
    float _2399 = fma(_2217, _2389, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    bool _2401 = !_1627;
    int _2403 = _2401 ? 0 : 1;
    float _2405 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2407 = _646 + _2405;
    float _2409 = fma(_2391, _2375, _2397);
    int _2411 = _1689 & 3;
    bool _2413 = _2411 != 0;
    float _2415 = fma(_2195, _2395, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2417 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2419 = _646 + _2417;
    float _2421 = fma(_2399, _2319, _2409);
    float _2423 = _2291 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _2425 = !_2413;
    int _2427 = _2425 ? 0 : 1;
    float _2429 = fma(_1395, _2419, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    int _2431 = _1825 & 3;
    bool _2433 = _2431 != 0;
    float _2435 = _2241 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _2437 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    bool _2439 = !_2433;
    int _2441 = _2439 ? 0 : 1;
    float _2443 = fma(_2415, _2285, _2421);
    float _2445 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _2447 = _1625 != 3;
    float _2449 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2451 = _2435 + _2449;
    int _2453 = ~_2337;
    int _2455 = _2453 + 1;
    int _2457 = _2455 + 1;
    float _2459 = -_2437;
    float _2461 = fma(_2033, 2.0, _2459);
    int _2463 = _2457;
    if (!_2341)
    {
        int _2465 = ~_2337;
        int _2467 = _2465 + 1;
        _2463 = _2467;
    }
    int _2469 = _2463;
    float _2471 = _2245 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2473 = fma(_1985, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2445);
    float _2475 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2477 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2479 = _2423 + _2477;
    float _2481 = _2451 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _2483 = !_2447;
    int _2485 = _2483 ? 0 : (-1);
    float _2487 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2489 = _2471 + _2487;
    bool _2491 = _1717 != 3;
    float _2493 = fma(_2479, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2481);
    float _2495 = fma(_1991, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2475);
    int _2497 = _1611 >> 31;
    float _2499 = fma(_2219, _2407, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    bool _2501 = !_2491;
    int _2503 = _2501 ? 0 : (-1);
    float _2505 = -_150;
    float _2507 = fma(_2505, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2461);
    bool _2509 = _1865 != 3;
    float _2511 = fma(_2489, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2493);
    int _2513 = _2497 & 3;
    float _2515 = fma(_2499, _2271, _2443);
    int _2517 = _1689 >> 31;
    float _2519 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2473);
    bool _2521 = !_2509;
    int _2523 = _2521 ? 0 : (-1);
    float _2525 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2495);
    bool _2527 = _2511 >= 0.0;
    float _2529 = fma(_2429, _2247, _2515);
    int _2531 = _1611 + _2513;
    int _2533 = _2517 & 3;
    float _2535 = fma(_2213, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2529);
    int _2537 = _2531 >> 2;
    int _2539 = _1689 + _2533;
    float _2541 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _2543 = _2537 << 4;
    int _2545 = _2543 + 368;
    out.m_65.x = _2535;
    int _2547 = _2539 >> 2;
    float _2549 = -_2541;
    float _2551 = fma(_1989, 2.0, _2549);
    int _2553 = _1825 >> 31;
    uint _2555 = uint(int(uint(_2545) >> uint(2)));
    uint _2557 = uint(int(uint(int(_2555)) >> uint(2)));
    int _2559 = int(_2555) & 3;
    float _2561 = (*spvDescriptorSet0.vp_c9)._m0[int(_2557)][_2559];
    int _2563 = int(_2555) + 1;
    uint _2565 = uint(int(uint(_2563) >> uint(2)));
    int _2567 = _2563 & 3;
    float _2569 = (*spvDescriptorSet0.vp_c9)._m0[int(_2565)][_2567];
    int _2571 = _2547 << 4;
    int _2573 = _2571 + 512;
    float _2575 = -_150;
    float _2577 = fma(_2575, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2551);
    float _2579 = _2519;
    if (_2527)
    {
        out.m_51.x = 0.0;
    }
    int _2581 = abs(_2269);
    float _2583 = _1987 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _2585 = _2553 & 3;
    uint _2587 = uint(int(uint(_2573) >> uint(2)));
    uint _2589 = uint(int(uint(int(_2587)) >> uint(2)));
    int _2591 = int(_2587) & 3;
    float _2593 = (*spvDescriptorSet0.vp_c9)._m0[int(_2589)][_2591];
    int _2595 = int(_2587) + 1;
    uint _2597 = uint(int(uint(_2595) >> uint(2)));
    int _2599 = _2595 & 3;
    float _2601 = (*spvDescriptorSet0.vp_c9)._m0[int(_2597)][_2599];
    float _2603 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2605 = float(_2469);
    int _2607 = _1825 + _2585;
    float _2609 = fma(_2583, -2.0, _2603);
    float _2611 = float(_2581);
    float _2613 = in.m_67.x;
    float _2615 = in.m_67.y;
    float _2617 = in.m_67.z;
    int _2619 = _2607 >> 2;
    int _2621 = _2545 + 8;
    uint _2623 = uint(int(uint(_2621) >> uint(2)));
    uint _2625 = uint(int(uint(int(_2623)) >> uint(2)));
    int _2627 = int(_2623) & 3;
    float _2629 = (*spvDescriptorSet0.vp_c9)._m0[int(_2625)][_2627];
    int _2631 = int(_2623) + 1;
    uint _2633 = uint(int(uint(_2631) >> uint(2)));
    int _2635 = _2631 & 3;
    float _2637 = (*spvDescriptorSet0.vp_c9)._m0[int(_2633)][_2635];
    bool _2639 = !_2133;
    int _2641 = _2639 ? 0 : 1;
    float _2643 = _2611 * _2605;
    int _2645 = _2619 << 4;
    int _2647 = _2645 + 656;
    float _2649 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2609);
    int _2651 = abs(_2641);
    float _2653 = _2643 * (-2.0);
    float _2655 = float(_2087);
    uint _2657 = uint(int(uint(_2647) >> uint(2)));
    uint _2659 = uint(int(uint(int(_2657)) >> uint(2)));
    int _2661 = int(_2657) & 3;
    float _2663 = (*spvDescriptorSet0.vp_c9)._m0[int(_2659)][_2661];
    int _2665 = int(_2657) + 1;
    uint _2667 = uint(int(uint(_2665) >> uint(2)));
    int _2669 = _2665 & 3;
    float _2671 = (*spvDescriptorSet0.vp_c9)._m0[int(_2667)][_2669];
    float _2673 = float(_2651);
    float _2675 = 0.0;
    if (_2527)
    {
        _2675 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2677 = _2675;
    float _2679 = fma(_2243, _2653, _2243);
    int _2681 = ~_1993;
    int _2683 = _2681 + _2049;
    int _2685 = _2683 + 1;
    float _2687 = _2673 * _2655;
    int _2689 = ~_2009;
    int _2691 = _2689 + _2125;
    int _2693 = _2691 + 1;
    if (_2527)
    {
        float _2695 = _2677 * 5.0;
        _2081 = as_type<int>(_2695);
    }
    int _2697 = _2081;
    int _2699 = abs(_2427);
    float _2701 = _2687 * (-2.0);
    int _2703 = abs(_1723);
    int _2705 = _879 * _2693;
    int _2707 = _2705 + _1453;
    if (_2527)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _8991 = as_type<float>(_2697);
        out.gl_Position.z = _8991;
    }
    float _2709 = fma(_2653, _2613, _2613);
    int _2711 = abs(_1699);
    int _2713 = _714 * _2685;
    int _2715 = _2713 + _1231;
    int _2717 = abs(_1855);
    int _2719 = _2573 + 8;
    uint _2721 = uint(int(uint(_2719) >> uint(2)));
    uint _2723 = uint(int(uint(int(_2721)) >> uint(2)));
    int _2725 = int(_2721) & 3;
    float _2727 = (*spvDescriptorSet0.vp_c9)._m0[int(_2723)][_2725];
    int _2729 = int(_2721) + 1;
    uint _2731 = uint(int(uint(_2729) >> uint(2)));
    int _2733 = _2729 & 3;
    float _2735 = (*spvDescriptorSet0.vp_c9)._m0[int(_2731)][_2733];
    int _2737 = ~_2711;
    int _2739 = _2737 + 1;
    int _2741 = _2739 + 1;
    int _2743 = abs(_1963);
    int _2745 = abs(_1711);
    float _2747 = fma(_2701, _2615, _2615);
    int _2749 = ~_2717;
    int _2751 = _2749 + 1;
    int _2753 = _2751 + 1;
    int _2755 = _2741 * as_type<int>(_2569);
    int _2757 = abs(_2403);
    int _2759 = _2647 + 8;
    uint _2761 = uint(int(uint(_2759) >> uint(2)));
    uint _2763 = uint(int(uint(int(_2761)) >> uint(2)));
    int _2765 = int(_2761) & 3;
    float _2767 = (*spvDescriptorSet0.vp_c9)._m0[int(_2763)][_2765];
    int _2769 = int(_2761) + 1;
    uint _2771 = uint(int(uint(_2769) >> uint(2)));
    int _2773 = _2769 & 3;
    float _2775 = (*spvDescriptorSet0.vp_c9)._m0[int(_2771)][_2773];
    int _2777 = ~_2699;
    int _2779 = _2777 + 1;
    int _2781 = _2779 + 1;
    int _2783 = _2753 * as_type<int>(_2601);
    int _2785 = ~_2757;
    int _2787 = _2785 + 1;
    int _2789 = _2787 + 1;
    float _2791 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2793 = int(_2791);
    int _2795 = ~_2745;
    int _2797 = _2795 + 1;
    int _2799 = _2797 + 1;
    int _2801 = _2781 * as_type<int>(_2593);
    int _2803 = _2801 + _2783;
    int _2805 = ~_2743;
    int _2807 = _2805 + 1;
    int _2809 = _2807 + 1;
    int _2811 = _2789 * as_type<int>(_2561);
    int _2813 = _2811 + _2755;
    int _2815 = abs(_2441);
    float _2817 = fma(_2265, _2701, _2265);
    bool _2819 = _714 == 0;
    int _2821 = _2799 * as_type<int>(_2629);
    int _2823 = _2821 + _2813;
    int _2825 = abs(_2485);
    float _2827 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2829 = int(_2827);
    int _2831 = ~_2815;
    int _2833 = _2831 + 1;
    int _2835 = _2833 + 1;
    int _2837 = ~_2825;
    int _2839 = _2837 + 1;
    int _2841 = _2839 + 1;
    int _2843 = _2809 * as_type<int>(_2671);
    float _2845 = float(uint(_2793));
    int _2847 = _2841 * as_type<int>(_2637);
    int _2849 = _2847 + _2823;
    int _2851 = abs(_1765);
    float _2853 = 1.0 / _2845;
    int _2855 = _2835 * as_type<int>(_2663);
    int _2857 = _2855 + _2843;
    int _2859 = ~_2703;
    int _2861 = _2859 + 1;
    int _2863 = _2861 + 1;
    float _2865 = -_150;
    float _2867 = fma(_2865, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2159);
    int _2869 = ~_2851;
    int _2871 = _2869 + 1;
    int _2873 = _2871 + 1;
    int _2875 = abs(_2503);
    int _2877 = _2849 * _2863;
    int _2879 = abs(_1957);
    float _2881 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _2883 = int(_2881);
    int _2885 = ~_2875;
    int _2887 = _2885 + 1;
    int _2889 = _2887 + 1;
    int _2891 = _2121 * _2703;
    int _2893 = _2891 + _2877;
    int _2895 = ~_2879;
    int _2897 = _2895 + 1;
    int _2899 = _2897 + 1;
    int _2901 = _2873 * as_type<int>(_2727);
    int _2903 = _2901 + _2803;
    int _2905 = abs(_2523);
    int _2907 = as_type<int>(_2853) + (-2);
    int _2909 = _2889 * as_type<int>(_2735);
    int _2911 = _2909 + _2903;
    float _2913 = float(uint(_2893));
    float _2915 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2917 = log2(_2915);
    float _2919 = float(uint(_2829));
    bool _2921 = !_2145;
    int _2923 = _2921 ? 0 : 1;
    float _2925 = as_type<float>(_2907) * _2913;
    int _2927 = _2899 * as_type<int>(_2767);
    int _2929 = _2927 + _2857;
    bool _2931 = !_2141;
    int _2933 = _2931 ? 0 : 1;
    int _2935 = ~_2905;
    int _2937 = _2935 + 1;
    int _2939 = _2937 + 1;
    float _2941 = 1.0 / _2919;
    int _2943 = abs(_2933);
    int _2945 = abs(_2923);
    int _2947 = _2939 * as_type<int>(_2775);
    int _2949 = _2947 + _2929;
    int _2951 = ~_2943;
    int _2953 = _2951 + 1;
    int _2955 = _2953 + 1;
    bool _2957 = !_2819;
    int _2959 = _2957 ? _2715 : (-1);
    float _2961 = trunc(_2925);
    float _2963 = precise::max(_2961, 0.0);
    uint _2965 = uint(_2963);
    int _2967 = abs(_2793);
    int _2969 = _2955 * _2911;
    float _2971 = float(uint(_2883));
    float _2973 = _2917 * _150;
    int _2975 = ~_2793;
    int _2977 = _2975 + 1;
    int _2979 = _2959 * _2943;
    int _2981 = _2979 + _2969;
    int _2983 = ~_2945;
    int _2985 = _2983 + 1;
    int _2987 = _2985 + 1;
    float _2989 = exp2(_2973);
    float _2991 = float(uint(_2967));
    int _2993 = abs(_2829);
    int _2995 = _2987 * _2949;
    bool _2997 = !_1389;
    int _2999 = _2997 ? _2707 : (-1);
    float _3001 = float(uint(_2993));
    int _3003 = _2977 * int(_2965);
    int _3005 = _3003 + _2893;
    float _3007 = 1.0 / _2971;
    int _3009 = abs(_2883);
    int _3011 = as_type<int>(_2941) + (-2);
    float _3013 = float(uint(_3005));
    int _3015 = _2999 * _2945;
    int _3017 = _3015 + _2995;
    float _3019 = float(uint(_2981));
    float _3021 = 1.0 / _2991;
    float _3023 = float(uint(_3009));
    float _3025 = as_type<float>(_2907) * _3013;
    float _3027 = as_type<float>(_3011) * _3019;
    float _3029 = -_2989;
    float _3031 = _3029 + 1.0;
    int _3033 = abs(_2893);
    float _3035 = 1.0 / _3001;
    float _3037 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _3039 = 1.0 + _3037;
    float _3041 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _3043 = as_type<int>(_3007) + (-2);
    float _3045 = float(uint(_3017));
    float _3047 = fma(_652, (*spvDescriptorSet0.vp_c9)._m0[78].z, _3041);
    float _3049 = 1.0 / _3023;
    int _3051 = as_type<int>(_3021) + (-2);
    float _3053 = float(uint(_3033));
    float _3055 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _3057 = abs(_2981);
    int _3059 = abs(_3017);
    float _3061 = trunc(_3027);
    float _3063 = precise::max(_3061, 0.0);
    uint _3065 = uint(_3063);
    float _3067 = fma(_656, (*spvDescriptorSet0.vp_c9)._m0[78].w, _3055);
    bool _3069 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3071 = isnan(1.0);
    bool _3073 = _3069 || _3071;
    bool _3075 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3077 = _3073 || _3075;
    float _3079 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    int _3081 = as_type<int>(_3035) + (-2);
    float _3083 = 1.0 / _3039;
    float _3085 = float(uint(_3057));
    float _3087 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    bool _3089 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3091 = isnan(0.0);
    bool _3093 = _3089 || _3091;
    bool _3095 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3097 = _3093 || _3095;
    float _3099 = fma(_652, (*spvDescriptorSet0.vp_c9)._m0[88].z, _3079);
    int _3101 = ~_2829;
    int _3103 = _3101 + 1;
    float _3105 = as_type<float>(_3081) * _3085;
    int _3107 = as_type<int>(_3049) + (-2);
    float _3109 = fma(_656, (*spvDescriptorSet0.vp_c9)._m0[88].w, _3087);
    float _3111 = as_type<float>(_3043) * _3045;
    float _3113 = as_type<float>(_3051) * _3053;
    float _3115 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[77].z, _3047);
    float _3117 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2161);
    float _3119 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[77].w, _3067);
    float _3121 = trunc(_3111);
    float _3123 = precise::max(_3121, 0.0);
    uint _3125 = uint(_3123);
    float _3127 = float(uint(_3059));
    int _3129 = _3103 * int(_3065);
    int _3131 = _3129 + _2981;
    float _3133 = _3097 ? _3031 : 0.0;
    float _3135 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[87].z, _3099);
    int _3137 = ~_2883;
    int _3139 = _3137 + 1;
    float _3141 = as_type<float>(_3107) * _3127;
    float _3143 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[87].w, _3109);
    float _3145 = trunc(_3113);
    float _3147 = precise::max(_3145, 0.0);
    uint _3149 = uint(_3147);
    if (_3077)
    {
        float _3151 = _3133 * _3083;
        _152 = _3151;
    }
    float _3153 = _152;
    float _3155 = float(uint(_3131));
    float _3157 = _2451 * _2451;
    int _3159 = ~_2829;
    int _3161 = _3159 + 1;
    float _3163 = fma(_2479, _2479, _3157);
    float _3165 = trunc(_3105);
    float _3167 = precise::max(_3165, 0.0);
    uint _3169 = uint(_3167);
    int _3171 = _3139 * int(_3125);
    int _3173 = _3171 + _3017;
    float _3175 = as_type<float>(_3011) * _3155;
    int _3177 = ~_2993;
    int _3179 = _3177 + 1;
    float _3181 = fma(_2489, _2489, _3163);
    float _3183 = float(uint(_3173));
    float _3185 = trunc(_3141);
    float _3187 = precise::max(_3185, 0.0);
    uint _3189 = uint(_3187);
    float _3191 = as_type<float>(_3043) * _3183;
    float _3193 = trunc(_3025);
    float _3195 = precise::max(_3193, 0.0);
    uint _3197 = uint(_3195);
    int _3199 = ~_3009;
    int _3201 = _3199 + 1;
    int _3203 = _3179 * int(_3169);
    int _3205 = _3203 + _3057;
    float _3207 = rsqrt(_3181);
    int _3209 = ~_2967;
    int _3211 = _3209 + 1;
    int _3213 = _3201 * int(_3189);
    int _3215 = _3213 + _3059;
    int _3217 = _3211 * int(_3149);
    int _3219 = _3217 + _3033;
    float _3221 = float(uint(_3215));
    float _3223 = trunc(_3175);
    float _3225 = precise::max(_3223, 0.0);
    uint _3227 = uint(_3225);
    float _3229 = float(uint(_3219));
    float _3231 = as_type<float>(_3107) * _3221;
    int _3233 = int(_2965) + int(_3197);
    float _3235 = float(uint(_3205));
    float _3237 = as_type<float>(_3051) * _3229;
    float _3239 = _654 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _3241 = trunc(_3191);
    float _3243 = precise::max(_3241, 0.0);
    uint _3245 = uint(_3243);
    int _3247 = ~_2793;
    int _3249 = _3247 + 1;
    float _3251 = as_type<float>(_3081) * _3235;
    float _3253 = _3239 * _3207;
    float _3255 = _652 + (-0.5);
    int _3257 = int(_3065) + int(_3227);
    float _3259 = _2451 * _3253;
    float _3261 = trunc(_3237);
    float _3263 = precise::max(_3261, 0.0);
    uint _3265 = uint(_3263);
    float _3267 = _2479 * _3253;
    float _3269 = fma(_3255, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2709);
    float _3271 = -_3259;
    float _3273 = _2451 + _3271;
    int _3275 = _3249 * _3233;
    int _3277 = _3275 + _2893;
    float _3279 = -_3267;
    float _3281 = _2479 + _3279;
    int _3283 = _3161 * _3257;
    int _3285 = _3283 + _2981;
    float _3287 = _3273 * _3273;
    float _3289 = trunc(_3251);
    float _3291 = precise::max(_3289, 0.0);
    uint _3293 = uint(_3291);
    int _3295 = int(_3125) + int(_3245);
    float _3297 = fma(_2679, _3153, _3269);
    int _3299 = ~_2883;
    int _3301 = _3299 + 1;
    float _3303 = fma(_3281, _3281, _3287);
    bool _3305 = uint(_3277) >= uint(_2793);
    bool _3307 = uint(_3285) >= uint(_2829);
    float _3309 = trunc(_3231);
    float _3311 = precise::max(_3309, 0.0);
    uint _3313 = uint(_3311);
    int _3315 = int(_3149) + int(_3265);
    int _3317 = _3301 * _3295;
    int _3319 = _3317 + _3017;
    int _3321 = ~_2967;
    int _3323 = _3321 + 1;
    int _3325 = ~_3009;
    int _3327 = _3325 + 1;
    bool _3329 = uint(_3319) >= uint(_2883);
    int _3331 = _3323 * _3315;
    int _3333 = _3331 + _3033;
    int _3335 = int(_3169) + int(_3293);
    float _3337 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _3339 = ~_2993;
    int _3341 = _3339 + 1;
    bool _3343 = uint(_3333) >= uint(_2967);
    bool _3345 = !_3305;
    int _3347 = _3345 ? 0 : (-1);
    int _3349 = _3341 * _3335;
    int _3351 = _3349 + _3057;
    int _3353 = int(_3189) + int(_3313);
    float _3355 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _3357 = ~_3233;
    int _3359 = _3357 + _3347;
    int _3361 = _3359 + 1;
    bool _3363 = uint(_3351) >= uint(_2993);
    int _3365 = _3327 * _3353;
    int _3367 = _3365 + _3059;
    bool _3369 = !_3307;
    int _3371 = _3369 ? 0 : (-1);
    int _3373 = _2793 * _3361;
    int _3375 = _3373 + _2893;
    bool _3377 = !_3329;
    int _3379 = _3377 ? 0 : (-1);
    float _3381 = _3337 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _3383 = ~_3257;
    int _3385 = _3383 + _3371;
    int _3387 = _3385 + 1;
    float _3389 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _3391 = uint(_3367) >= uint(_3009);
    float _3393 = fma(_3381, _931, -0.5);
    bool _3395 = _2793 == 0;
    int _3397 = _2893 ^ _2793;
    bool _3399 = !_3363;
    int _3401 = _3399 ? 0 : (-1);
    float _3403 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _3405 = !_3391;
    int _3407 = _3405 ? 0 : (-1);
    int _3409 = _2981 ^ _2829;
    int _3411 = _2829 * _3387;
    int _3413 = _3411 + _2981;
    bool _3415 = _2829 == 0;
    bool _3417 = _2829 == 0;
    float _3419 = _3389 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _3421 = ~_3295;
    int _3423 = _3421 + _3379;
    int _3425 = _3423 + 1;
    bool _3427 = !_3395;
    int _3429 = _3427 ? _3375 : (-1);
    bool _3431 = !_3415;
    int _3433 = _3431 ? _3413 : (-1);
    int _3435 = _2883 * _3425;
    int _3437 = _3435 + _3017;
    float _3439 = float(_3429);
    int _3441 = _3017 ^ _2883;
    bool _3443 = !_3343;
    int _3445 = _3443 ? 0 : (-1);
    float _3447 = fma(_3381, _3439, _2867);
    bool _3449 = _2883 == 0;
    float _3451 = _3355 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _3453 = _2793 == 0;
    float _3455 = fma(_3115, _3393, _3447);
    bool _3457 = _2883 == 0;
    float _3459 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _3461 = _3403 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _3463 = float(_3433);
    float _3465 = fma(_3451, _1591, -0.5);
    uint _3467 = uint(int(uint(_3397) >> uint(31)));
    float _3469 = fma(_3461, _756, -0.5);
    uint _3471 = uint(int(uint(_3409) >> uint(31)));
    float _3473 = fma(_3461, _3463, _2577);
    uint _3475 = uint(int(uint(_3441) >> uint(31)));
    float _3477 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _3479 = !_3449;
    int _3481 = _3479 ? _3437 : (-1);
    float _3483 = fma(_2519, _3469, _3473);
    int _3485 = ~_3445;
    int _3487 = _3315 + _3485;
    int _3489 = _3487 + 1;
    int _3491 = ~int(_3467);
    int _3493 = _3491 + 1;
    int _3495 = ~_3401;
    int _3497 = _3335 + _3495;
    int _3499 = _3497 + 1;
    int _3501 = ~_3407;
    int _3503 = _3353 + _3501;
    int _3505 = _3503 + 1;
    int _3507 = ~int(_3471);
    int _3509 = _3507 + 1;
    int _3511 = ~int(_3475);
    int _3513 = _3511 + 1;
    float _3515 = float(_3481);
    float _3517 = _3477 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _3519 = _3489 ^ _3493;
    int _3521 = _3499 ^ _3509;
    float _3523 = fma(_3451, _3515, _2507);
    int _3525 = _3505 ^ _3513;
    float _3527 = _3459 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _3529 = ~_3493;
    int _3531 = _3529 + _3519;
    int _3533 = _3531 + 1;
    float _3535 = fma(_1175, _3419, -0.5);
    int _3537 = ~_3509;
    int _3539 = _3537 + _3521;
    int _3541 = _3539 + 1;
    float _3543 = fma(_1227, _3527, -0.5);
    int _3545 = ~_3513;
    int _3547 = _3545 + _3525;
    int _3549 = _3547 + 1;
    float _3551 = fma(_3517, _1535, -0.5);
    bool _3553 = !_3453;
    int _3555 = _3553 ? _3533 : (-1);
    float _3557 = fma(_3135, _3465, _3523);
    bool _3559 = !_3417;
    int _3561 = _3559 ? _3541 : (-1);
    bool _3563 = !_3457;
    int _3565 = _3563 ? _3549 : (-1);
    float _3567 = _3557 + 0.5;
    float _3569 = float(_3555);
    float _3571 = float(_3561);
    float _3573 = float(_3565);
    float _3575 = -_3117;
    float _3577 = fma(_3419, _3569, _3575);
    float _3579 = _2489 * _3253;
    float _3581 = -_2649;
    float _3583 = fma(_3527, _3571, _3581);
    float _3585 = _3483 + 0.5;
    float _3587 = -_2077;
    float _3589 = fma(_3517, _3573, _3587);
    float _3591 = fma(_3119, _3535, _3577);
    float _3593 = fma(_2525, _3543, _3583);
    float _3595 = _3455 + 0.5;
    float _3597 = fma(_3143, _3551, _3589);
    float _3599 = _3591 + 0.5;
    float _3601 = _3593 + 0.5;
    float _3603 = -_3579;
    float _3605 = _2489 + _3603;
    float _3607 = _3597 + 0.5;
    float _3609 = _656 + (-0.5);
    bool _3611 = !_2137;
    int _3613 = _3611 ? 0 : 1;
    out.m_69.x = _3595;
    out.m_69.y = _3599;
    out.m_69.z = _3585;
    out.m_69.w = _3601;
    float _3615 = fma(_3605, _3605, _3303);
    out.m_71.x = _3567;
    out.m_71.y = _3607;
    float _3617 = as_type<float>(_3541);
    if (_2527)
    {
        return out;
    }
    float _3619 = -_3259;
    float _3621 = _2435 + _3619;
    int _3623 = abs(_3613);
    float _3625 = -_3267;
    float _3627 = _2423 + _3625;
    float _3629 = float(_2115);
    float _3631 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3633 = _3621 + _3631;
    float _3635 = -_3579;
    float _3637 = _2471 + _3635;
    float _3639 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3641 = _3627 + _3639;
    float _3643 = fma(_3609, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2747);
    float _3645 = _3633 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3647 = _652 + _666;
    float _3649 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3651 = _3637 + _3649;
    float _3653 = fma(_2817, _3153, _3643);
    float _3655 = fma(_3641, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3645);
    float _3657 = float(_3623);
    float _3659 = _3647 + (-1.0);
    float _3661 = fma(_3651, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3655);
    float _3663 = _666 + (-0.5);
    float _3665 = _3657 * _3629;
    float _3667 = _3297 * 0.15915493667125701904296875;
    float _3669 = fma(_3659, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _3671 = _3661 >= 0.0;
    float _3673 = _3665 * (-2.0);
    float _3675 = _3653 * 0.15915493667125701904296875;
    float _3677 = sqrt(_3615);
    float _3679 = fma(_3673, _2617, _2617);
    float _3681 = fma(_3669, _3673, _3669);
    float _3683 = fma(_3663, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3679);
    float _3685 = _3667 * 6.283185482025146484375;
    float _3687 = sin(_3685);
    float _3689 = fma(_3681, _3153, _3683);
    float _3691 = (*spvDescriptorSet0.vp_c9)._m0[198].z;
    float _3693 = _3651;
    if (_3671)
    {
        _3691 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3695 = _3691;
    int _3697 = as_type<int>(_3695);
    if (_3671)
    {
        out.m_51.x = 0.0;
    }
    float _3699 = _3689 * 0.15915493667125701904296875;
    float _3701 = _3667 * 6.283185482025146484375;
    float _3703 = cos(_3701);
    if (_3671)
    {
        float _3705 = _3695 * 5.0;
        _3697 = as_type<int>(_3705);
    }
    int _3707 = _3697;
    if (_3671)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _10426 = as_type<float>(_3707);
        out.gl_Position.z = _10426;
    }
    float _3709 = _3675 * 6.283185482025146484375;
    float _3711 = sin(_3709);
    float _3713 = _3675 * 6.283185482025146484375;
    float _3715 = cos(_3713);
    float _3717 = _3699 * 6.283185482025146484375;
    float _3719 = sin(_3717);
    if (_3671)
    {
        return out;
    }
    float _3721 = -_2435;
    float _3723 = _3721 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3725 = -_2423;
    float _3727 = _3725 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3729 = in.m_73.x;
    float _3731 = in.m_73.y;
    float _3733 = in.m_73.z;
    float _3735 = -_2471;
    float _3737 = _3735 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3739 = _3723 * _3723;
    float _3741 = _3699 * 6.283185482025146484375;
    float _3743 = cos(_3741);
    float _3745 = _3687 * _3711;
    float _3747 = _3703 * _3715;
    float _3749 = fma(_3727, _3727, _3739);
    float _3751 = _3207 * _3677;
    float _3753 = _488 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3755 = fma(_3719, _3747, _3745);
    float _3757 = fma(_3737, _3737, _3749);
    float _3759 = fma(_3719, _3745, _3747);
    float _3761 = _3687 * _3715;
    float _3763 = rsqrt(_3757);
    float _3765 = _3703 * _3711;
    float _3767 = _506 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _3769 = _3715 * _3743;
    float _3771 = _3751 * _3753;
    float _3773 = _3687 * _3743;
    float _3775 = _654 * _3751;
    float _3777 = -_3765;
    float _3779 = fma(_3719, _3761, _3777);
    float _3781 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _3731);
    float _3783 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _3729);
    float _3785 = -_3761;
    float _3787 = fma(_3719, _3765, _3785);
    float _3789 = _3703 * _3743;
    float _3791 = _3781 * _3771;
    float _3793 = _3711 * _3743;
    float _3795 = _3727 * _3763;
    float _3797 = in.m_75.x;
    float _3799 = in.m_75.y;
    float _3801 = in.m_75.z;
    float _3803 = _3737 * _3763;
    float _3805 = _3783 * _3775;
    float _3807 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _3809 = _3795 * _3807;
    float _3811 = _3751 * _3767;
    float _3813 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _3733);
    bool _3815 = _3731 != 0.0;
    bool _3817 = isnan(_3731);
    bool _3819 = _3815 || _3817;
    bool _3821 = isnan(0.0);
    bool _3823 = _3819 || _3821;
    float _3825 = _3723 * _3763;
    float _3827 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3829 = _3803 * _3827;
    float _3831 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _3833 = -_3809;
    float _3835 = fma(_3803, _3831, _3833);
    float _3837 = _3813 * _3811;
    bool _3839 = _3729 == 0.0;
    bool _3841 = !_3823;
    bool _3843 = _3839 && _3841;
    float _3845 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _3847 = _3825 * _3845;
    float _3849 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _3851 = -_3829;
    float _3853 = fma(_3825, _3849, _3851);
    float _3855 = _3835 * _3835;
    bool _3857 = _3733 == 0.0;
    bool _3859 = _3857 && _3843;
    float _3861 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3863 = -_3847;
    float _3865 = fma(_3795, _3861, _3863);
    float _3867 = in.m_77.x;
    float _3869 = in.m_77.y;
    float _3871 = in.m_77.z;
    float _3873 = in.m_77.w;
    float _3875 = fma(_3853, _3853, _3855);
    float _3877 = -_3791;
    float _3879 = _3719 * _3877;
    float _3881 = _3789 * _3791;
    float _3883 = _3773 * _3791;
    float _3885 = fma(_3865, _3865, _3875);
    float _3887 = fma(_3769, _3805, _3879);
    float _3889 = fma(_3755, _3805, _3881);
    float _3891 = fma(_3779, _3805, _3883);
    float _3893 = rsqrt(_3885);
    float _3895 = _3805;
    float _3897 = _3881;
    float _3899 = _3797;
    float _3901 = _3875;
    if (_3859)
    {
        _3895 = _3797;
    }
    float _3903 = _3895;
    float _3905 = fma(_3787, _3837, _3889);
    float _3907 = _3903;
    if (_3859)
    {
        _2579 = _3799;
    }
    float _3909 = _2579;
    float _3911 = _3909;
    if (_3859)
    {
        _3897 = _3903;
    }
    float _3913 = _3897;
    float _3915 = _3913;
    if (!_3859)
    {
        _3907 = _3797;
    }
    float _3917 = _3907;
    if (_3859)
    {
        _3899 = _3909;
    }
    float _3919 = _3899;
    float _3921 = _3919;
    if (_3859)
    {
        _3617 = _3801;
    }
    float _3923 = _3617;
    float _3925 = _3923;
    if (!_3859)
    {
        float _3927 = fma(_3729, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3917);
        _3915 = _3927;
    }
    float _3929 = _3915;
    if (!_3859)
    {
        _3911 = _3799;
    }
    float _3931 = _3911;
    float _3933 = fma(_3793, _3837, _3887);
    if (_3859)
    {
        _3901 = _3923;
    }
    float _3935 = _3901;
    float _3937 = _3835 * _3893;
    float _3939 = _3935;
    if (!_3859)
    {
        _3925 = _3801;
    }
    float _3941 = _3925;
    if (!_3859)
    {
        float _3943 = fma(_3731, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3931);
        _3921 = _3943;
    }
    float _3945 = _3921;
    float _3947 = _3871 * _3917;
    float _3949 = _3853 * _3893;
    float _3951 = fma(_3759, _3837, _3891);
    float _3953 = _3865 * _3893;
    float _3955 = -_3947;
    float _3957 = fma(_3867, _3941, _3955);
    float _3959 = _3869 * _3941;
    float _3961 = _3803 * _3937;
    float _3963 = _3825 * _3949;
    if (!_3859)
    {
        float _3965 = fma(_3733, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3941);
        _3939 = _3965;
    }
    float _3967 = _3939;
    float _3969 = _3867 * _3931;
    float _3971 = -_3959;
    float _3973 = fma(_3871, _3931, _3971);
    float _3975 = -_3961;
    float _3977 = fma(_3825, _3953, _3975);
    float _3979 = -_3963;
    float _3981 = fma(_3795, _3937, _3979);
    float _3983 = -_3969;
    float _3985 = fma(_3869, _3917, _3983);
    float _3987 = _3957 * _3873;
    float _3989 = _3977 * _3905;
    float _3991 = _3981 * _3905;
    float _3993 = _3973 * _3873;
    float _3995 = _3985 * _3873;
    float _3997 = _3795 * _3953;
    float _3999 = fma(_3949, _3933, _3989);
    float _4001 = fma(_3953, _3933, _3991);
    float _4003 = _3755 * _3977;
    float _4005 = -_3997;
    float _4007 = fma(_3803, _3949, _4005);
    float _4009 = fma(_3795, _3951, _3999);
    float _4011 = fma(_3803, _3951, _4001);
    float _4013 = _3755 * _3981;
    float _4015 = _3755 * _4007;
    float _4017 = _2423 + _4009;
    float _4019 = _2471 + _4011;
    float _4021 = _3789 * _3977;
    float _4023 = _3789 * _4007;
    float _4025 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _4027 = _4017 + _4025;
    float _4029 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _4031 = _4019 + _4029;
    float _4033 = _3789 * _3981;
    float _4035 = _3787 * _3977;
    float _4037 = _4027 * _4027;
    float _4039 = _4031 * _4031;
    float _4041 = _3787 * _3981;
    float _4043 = _3787 * _4007;
    float _4045 = _4007 * _3905;
    float _4047 = _4037 + _4039;
    float _4049 = fma(_3769, _3949, _4003);
    float _4051 = fma(_3769, _3937, _4015);
    float _4053 = fma(_3769, _3953, _4013);
    float _4055 = -_3719;
    float _4057 = fma(_4055, _3949, _4021);
    float _4059 = sqrt(_4047);
    float _4061 = fma(_3793, _3949, _4035);
    float _4063 = -_3719;
    float _4065 = fma(_4063, _3937, _4023);
    float _4067 = fma(_3793, _3937, _4043);
    float _4069 = fma(_3937, _3933, _4045);
    float _4071 = -_3719;
    float _4073 = fma(_4071, _3953, _4033);
    float _4075 = fma(_3793, _3953, _4041);
    float _4077 = fma(_3779, _3803, _4053);
    float _4079 = fma(_3773, _3795, _4057);
    float _4081 = fma(_3773, _3825, _4065);
    float _4083 = fma(_3825, _3951, _4069);
    float _4085 = fma(_3779, _3795, _4049);
    float _4087 = fma(_3779, _3825, _4051);
    float _4089 = fma(_3773, _3803, _4073);
    float _4091 = fma(_3759, _3795, _4061);
    float _4093 = fma(_3759, _3803, _4075);
    bool _4095 = _4059 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4097 = fma(_3759, _3825, _4067);
    float _4099 = _2435 + _4083;
    float _4101 = _4079 * _3869;
    float _4103 = _4081 * _3869;
    float _4105 = _4079 * _3945;
    float _4107 = _4081 * _3945;
    float _4109 = _3987 * _4079;
    float _4111 = _3987 * _4081;
    float _4113 = _4089 * _3869;
    float _4115 = _4089 * _3945;
    float _4117 = _3987 * _4089;
    float _4119 = _4089;
    float _4121 = _4037;
    float _4123 = _4039;
    float _4125 = _4017;
    float _4127 = _4019;
    float _4129 = _4097;
    if (!_4095)
    {
        _4119 = _4099;
    }
    float _4131 = _4119;
    bool _4133 = !_4095;
    float _4135 = _4131;
    if (!_4133)
    {
        float _4137 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4139 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _4141 = _4059 + _4139;
        float _4143 = rsqrt(_4047);
        float _4145 = _4141 * _4137;
        float _4147 = _4099 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4149 = _4145 * 0.15915493667125701904296875;
        float _4151 = _4149 * 6.283185482025146484375;
        float _4153 = sin(_4151);
        float _4155 = _4149 * 6.283185482025146484375;
        float _4157 = cos(_4155);
        float _4159 = fma(_4153, _4147, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _4161 = _4143 * _4159;
        float _4163 = fma(_4027, _4161, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _4165 = _4157 + (-1.0);
        float _4167 = fma(_4031, _4161, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _4169 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _4171 = _4163 + _4169;
        float _4173 = _4165 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4175 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _4177 = _4167 + _4175;
        float _4179 = _4171 * _4171;
        float _4181 = fma(_4099, _4157, _4173);
        float _4183 = _4177 * _4177;
        _4135 = _4181;
        _4121 = _4179;
        _4123 = _4183;
        _4125 = _4163;
        _4127 = _4167;
    }
    float _4185 = _4135;
    float _4187 = _4121;
    float _4189 = _4123;
    float _4191 = _4125;
    float _4193 = _4127;
    float _4195 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _4197 = _4185 + _4195;
    float _4199 = fma(_4085, _3867, _4101);
    float _4201 = fma(_4085, _3929, _4105);
    float _4203 = fma(_3993, _4085, _4109);
    float _4205 = fma(_4197, _4197, _4187);
    float _4207 = fma(_4087, _3867, _4103);
    float _4209 = fma(_4077, _3867, _4113);
    float _4211 = fma(_4087, _3929, _4107);
    float _4213 = _4205 + _4189;
    float _4215 = fma(_4077, _3929, _4115);
    float _4217 = fma(_3993, _4087, _4111);
    float _4219 = fma(_3993, _4077, _4117);
    float _4221 = fma(_4091, _3871, _4199);
    float _4223 = fma(_4097, _3871, _4207);
    float _4225 = sqrt(_4213);
    float _4227 = fma(_4091, _3967, _4201);
    float _4229 = fma(_3995, _4091, _4203);
    float _4231 = fma(_4093, _3871, _4209);
    float _4233 = fma(_4097, _3967, _4211);
    float _4235 = fma(_3995, _4097, _4217);
    float _4237 = fma(_3995, _4093, _4219);
    float _4239 = fma(_4093, _3967, _4215);
    out.m_79.x = _4221;
    out.m_79.y = _4223;
    out.m_79.z = _4231;
    out.m_81.x = _4229;
    out.m_81.y = _4235;
    out.m_81.z = _4237;
    out.m_83.x = _4227;
    out.m_83.y = _4233;
    out.m_83.z = _4239;
    bool _4241 = _4225 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _4243 = isnan(_4225);
    bool _4245 = _4241 || _4243;
    bool _4247 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _4249 = _4245 || _4247;
    float _4251 = _4223;
    if (!_4249)
    {
        _4129 = 1.0;
    }
    float _4253 = _4129;
    bool _4255 = !_4249;
    float _4257 = _4253;
    if (!_4255)
    {
        bool _4259 = _4225 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _4261 = isnan(_4225);
        bool _4263 = _4259 || _4261;
        bool _4265 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _4267 = _4263 || _4265;
        if (!_4267)
        {
            float _4269 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4271 = _4225 + _4269;
            float _4273 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4275 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _4273;
            float _4277 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _4279 = _4277 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _4281 = 1.0 / _4275;
            float _4283 = _4271 * _4281;
            float _4285 = fma(_4283, _4279, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _4257 = _4285;
            _4287 = true;
        }
        else
        {
            bool _4289 = _4225 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _4291 = isnan(_4225);
            bool _4293 = _4289 || _4291;
            bool _4295 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _4297 = _4293 || _4295;
            if (!_4297)
            {
                float _4299 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4301 = _4225 + _4299;
                float _4303 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4305 = _4303 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _4307 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _4309 = _4307 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _4311 = 1.0 / _4305;
                float _4313 = _4301 * _4311;
                float _4315 = fma(_4313, _4309, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _4257 = _4315;
                _4287 = true;
            }
            else
            {
                _4257 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _4287 = false;
    float _4317 = _4257;
    float _4319 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _4321 = _4191 + _4319;
    float _4323 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _4325 = _4185 + _4323;
    float _4327 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _4329 = _4193 + _4327;
    bool _4331 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _4333 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _4335 = _4331 || _4333;
    bool _4337 = isnan(0.5);
    bool _4339 = _4335 || _4337;
    float _4341 = fma(_4321, _4317, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _4343 = fma(_4325, _4317, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _4345 = fma(_4329, _4317, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _4347 = -_3267;
    float _4349 = _4347 + _4341;
    float _4351 = -_3259;
    float _4353 = _4351 + _4343;
    float _4355 = -_3579;
    float _4357 = _4355 + _4345;
    float _4359 = _4353;
    float _4361 = _4349;
    float _4363 = _4357;
    if (!_4339)
    {
        float _4365 = _3633 * _3633;
        float _4367 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _4369 = -_2471;
        float _4371 = _4369 + _4345;
        float _4373 = fma(_3641, _3641, _4365);
        float _4375 = fma(_3651, _3651, _4373);
        float _4377 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _4379 = sqrt(_4375);
        float _4381 = 1.0 / _3751;
        float _4383 = _4377 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _4385 = precise::min(_4379, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _4387 = _4385 * _4367;
        float _4389 = -_2423;
        float _4391 = _4389 + _4341;
        float _4393 = _4387 * _4381;
        float _4395 = -_2435;
        float _4397 = _4395 + _4343;
        float _4399 = _4383 * _4393;
        float _4401 = _4371 * _4393;
        float _4403 = fma(_4391, _4399, _3627);
        float _4405 = fma(_4397, _4399, _3621);
        float _4407 = fma(_4383, _4401, _3637);
        _4359 = _4405;
        _4361 = _4403;
        _4363 = _4407;
    }
    float _4409 = _4359;
    float _4411 = _4361;
    float _4413 = _4363;
    float _4415 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4417 = _4409 + _4415;
    float _4419 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4421 = _4411 + _4419;
    float _4423 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4425 = _4413 + _4423;
    float _4427 = _4417 * _4417;
    float _4429 = fma(_4421, _4421, _4427);
    float _4431 = fma(_4425, _4425, _4429);
    float _4433 = rsqrt(_4431);
    float _4435 = _4433 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4437 = _4421 * _4435;
    float _4439 = _4425 * _4435;
    float _4441 = _4437 * _4437;
    float _4443 = _4439 * _4439;
    float _4445 = _4441 + _4443;
    float _4447 = sqrt(_4445);
    bool _4449 = _4447 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4451 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4453 = _4447 + _4451;
    float _4455 = _4433;
    float _4457 = _4453;
    float _4459 = _4417;
    float _4461 = _4437;
    if (_4449)
    {
        float _4463 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4455 = _4463;
    }
    float _4465 = _4455;
    float _4467 = _4465;
    if (_4449)
    {
        float _4469 = _4453 * _4465;
        _4457 = _4469;
    }
    float _4471 = _4457;
    if (_4449)
    {
        float _4473 = rsqrt(_4445);
        _4467 = _4473;
    }
    float _4475 = _4467;
    float _4477 = _4475;
    if (_4449)
    {
        float _4479 = _4471 * 0.15915493667125701904296875;
        _4251 = _4479;
    }
    float _4481 = _4251;
    float _4483 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4485 = _4425;
    if (_4449)
    {
        float _4487 = _4481 * 6.283185482025146484375;
        float _4489 = sin(_4487);
        _4485 = _4489;
    }
    float _4491 = _4485;
    float _4493 = _4409 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4495 = precise::max(0.0, _4483);
    float _4497 = fma(_4411, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4493);
    float _4499 = _3579;
    float _4501 = _4495;
    if (_4449)
    {
        float _4503 = _4481 * 6.283185482025146484375;
        float _4505 = cos(_4503);
        _4499 = _4505;
    }
    float _4507 = _4499;
    float _4509 = -_4435;
    float _4511 = -_4495;
    float _4513 = fma(_4417, _4509, _4511);
    if (_4449)
    {
        float _4515 = _4513 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4459 = _4515;
    }
    float _4517 = _4459;
    float _4519 = _4491;
    float _4521 = _4517;
    if (_4449)
    {
        float _4523 = fma(_4491, _4517, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4519 = _4523;
    }
    float _4525 = _4519;
    float _4527 = _4525;
    if (!_4449)
    {
        _4521 = _4439;
    }
    float _4529 = _4521;
    float _4531 = _4409 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4533 = _4529;
    if (_4449)
    {
        float _4535 = _4475 * _4525;
        _3693 = _4535;
    }
    float _4537 = _3693;
    if (!_4449)
    {
        _4477 = _4513;
    }
    float _4539 = _4477;
    float _4541 = fma(_4411, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4531);
    float _4543 = _4539;
    float _4545 = _4507;
    if (_4449)
    {
        float _4547 = _4507 + (-1.0);
        _4501 = _4547;
    }
    float _4549 = _4501;
    float _4551 = _4549;
    if (_4449)
    {
        float _4553 = _4437 * _4537;
        _4461 = _4553;
    }
    float _4555 = _4461;
    if (!_4449)
    {
        _4527 = _4441;
    }
    float _4557 = _4527;
    float _4559 = _4557;
    if (_4449)
    {
        float _4561 = _4439 * _4537;
        _4533 = _4561;
    }
    float _4563 = _4533;
    if (_4449)
    {
        float _4565 = _4549 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4551 = _4565;
    }
    float _4567 = _4551;
    if (_4449)
    {
        float _4569 = _4555 * _4555;
        _4559 = _4569;
    }
    float _4571 = _4559;
    float _4573 = _4409 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4575 = fma(_4413, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4541);
    if (_4449)
    {
        float _4577 = fma(_4513, _4507, _4567);
        _4543 = _4577;
    }
    float _4579 = _4543;
    if (!_4449)
    {
        _4545 = _4443;
    }
    float _4581 = _4545;
    float _4583 = _4581;
    if (_4449)
    {
        float _4585 = _4563 * _4563;
        _4583 = _4585;
    }
    float _4587 = _4583;
    float _4589 = sqrt(_4431);
    float _4591 = fma(_4579, _4579, _4571);
    float _4593 = fma(_4411, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4573);
    float _4595 = _4575 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4597 = _4591 + _4587;
    float _4599 = _4409 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4601 = fma(_3627, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _4603 = rsqrt(_4597);
    float _4605 = _4595 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4607 = fma(_4411, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4599);
    float _4609 = fma(_4413, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4607);
    float _4611 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4613 = fma(_4589, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4611);
    float _4615 = precise::clamp(_4613, 0.0, 1.0);
    float _4617 = floor(_4601);
    float _4619 = fma(_4413, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4497);
    float _4621 = _4609 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4623 = -_4615;
    float _4625 = _4623 + 1.0;
    float _4627 = fma(_4413, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4593);
    float _4629 = fma(_3637, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4631 = fma(_4621, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4605);
    float _4633 = _4619 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4635 = _4603 * _4555;
    float _4637 = _4603 * _4579;
    float _4639 = abs(_4625);
    float _4641 = log2(_4639);
    float _4643 = _4603 * _4563;
    float _4645 = _4635 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4647 = _4627 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4649 = -_4645;
    float _4651 = fma(_4637, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4649);
    float _4653 = fma(_4647, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4631);
    float _4655 = floor(_4629);
    float _4657 = -_4617;
    float _4659 = _4601 + _4657;
    float _4661 = -_4643;
    float _4663 = fma(_4661, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4651);
    float _4665 = _4647 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4667 = fma(_4633, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4653);
    float _4669 = fma(_4663, -0.5, 0.5);
    float _4671 = fma(_4663, 0.5, 0.5);
    float _4673 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4675 = _4641 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4677 = 1.0 / _4667;
    float _4679 = fma(_4671, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4681 = -_4665;
    float _4683 = fma(_4681, _4673, 1.0);
    float _4685 = _4595 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4687 = fma(_4671, _4679, -0.212114393711090087890625);
    float _4689 = fma(_4621, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4685);
    float _4691 = exp2(_4675);
    float _4693 = fma(_4671, _4687, 1.570728778839111328125);
    float _4695 = fma(_4647, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4689);
    float _4697 = log2(_4683);
    float _4699 = _4595 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4701 = fma(_4621, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4699);
    float _4703 = sqrt(_4669);
    float _4705 = fma(_4647, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4701);
    float _4707 = fma(_4633, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4705);
    float _4709 = _4697 * 0.693147182464599609375;
    float _4711 = -_4655;
    float _4713 = _4629 + _4711;
    float _4715 = _4637 + 1.0;
    float _4717 = fma(_4633, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4695);
    float2 _12074 = float2(_4659, _4713);
    float _4719 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_12074, float2(0.0), isnan(_12074)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_12074, float2(0.0), isnan(_12074)), level(0.0)).x;
    float _4721 = -_4637;
    float _4723 = fma(_4691, _4715, _4721);
    float _4725 = _4717 * _4677;
    float _4727 = _4707 * _4677;
    float _4729 = _4703 * 0.636619746685028076171875;
    float _4731 = _4709 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4733 = fma(_4725, 0.5, 0.5);
    float _4735 = fma(_4727, -0.5, 0.5);
    float _4737 = -_4693;
    float _4739 = fma(_4729, _4737, 1.0);
    float _4741 = fma(_4723, 0.5, 0.5);
    float3 _12115 = float3(_4733, _4735, _4731);
    float _4743 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_12115, float3(0.0), isnan(_12115)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_12115, float3(0.0), isnan(_12115)), level(0.0)).x;
    float3 _12126 = float3(_4733, _4735, _4731);
    float4 _4746 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_12126, float3(0.0), isnan(_12126)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_12126, float3(0.0), isnan(_12126)), level(0.0)).xyzw;
    float _4748 = _4746.x;
    float _4750 = _4746.y;
    float _4752 = _4746.z;
    float _4754 = _4746.w;
    float2 _12142 = float2(_4739, _4741);
    float3 _4758 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_12142, float2(0.0), isnan(_12142)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_12142, float2(0.0), isnan(_12142)), level(0.0)).xyz;
    float _4760 = _4758.x;
    float _4762 = _4758.y;
    float _4764 = _4758.z;
    float _4766 = _3621 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    out.m_85.x = _4411;
    out.m_85.y = _4409;
    out.m_85.z = _4413;
    bool _4768 = _4589 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4770 = isnan(_4589);
    bool _4772 = _4768 || _4770;
    bool _4774 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4776 = _4772 || _4774;
    float _4778 = fma(_3627, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4766);
    float _4780 = fma(_3637, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4778);
    float _4782 = _3621 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _4784 = _4780 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4786 = fma(_3627, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4782);
    float _4788 = 1.0 / _4784;
    float _4790 = fma(_3637, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4786);
    float _4792 = _4790 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4794 = _4792 + _4784;
    float _4796 = _4794 * _4788;
    float _4798 = _4796 * 0.5;
    float _4800 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _4802 = fma(_4798, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4800);
    float _4804 = 1.0 / _4802;
    float _4806 = _4641 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4808 = exp2(_4806);
    float _4810 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4812 = _4804 * _4810;
    float _4814 = abs(_4812);
    float _4816 = log2(_4814);
    float _4818 = -_4808;
    float _4820 = _4818 + 1.0;
    float _4822 = _4820 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _4824 = _4816 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _4826 = _4595 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4828 = fma(_4621, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4826);
    float _4830 = exp2(_4824);
    float _4832 = fma(_4647, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4828);
    float _4834 = fma(_4633, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4832);
    bool _4836 = _4812 <= 8000.0;
    bool _4838 = isnan(_4812);
    bool _4840 = _4836 || _4838;
    bool _4842 = isnan(8000.0);
    bool _4844 = _4840 || _4842;
    float _4846 = float(_4844);
    out.gl_Position.x = _4717;
    out.gl_Position.y = _4707;
    out.gl_Position.z = _4834;
    out.gl_Position.w = _4667;
    float _4848 = fma(_4830, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4850 = precise::clamp(_4848, 0.0, 1.0);
    float _4852 = in.m_87.x;
    float _4854 = fma(_4850, -2.0, 3.0);
    float _4856 = _4850 * _4850;
    float _4858 = _4856 * _4854;
    float _4860 = -_4858;
    float _4862 = _4860 + 1.0;
    float _4864 = fma(_4862, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4858);
    float _4866 = _4834 + _4667;
    float _4868 = _4846 * _4864;
    float _4870 = _4866 * 0.5;
    float _4872 = _4868 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_89.z = _4870;
    out.m_89.w = _4667;
    float _4874 = -_4719;
    float _4876 = _4874 + 1.0;
    float _4878 = _4876 * _4872;
    float _4880 = precise::clamp(_4878, 0.0, 1.0);
    float _4882 = -_4880;
    float _4884 = fma(_4882, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4886 = _4822 * _4743;
    float _4888 = _4884 * _4852;
    float _4890 = -_4822;
    float _4892 = _4890 + 1.0;
    float _4894 = _4754 * _4886;
    float _4896 = _4764 * _4886;
    float _4898 = _4754 * _4892;
    float _4900 = _4888 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _4902 = fma(_4760, _4894, _4748);
    float _4904 = fma(_4762, _4894, _4750);
    float _4906 = fma(_4754, _4896, _4752);
    float _4908 = _4894;
    float _4910 = _4754;
    float _4912 = _4752;
    if (!_4776)
    {
        _4908 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4914 = _4908;
    out.m_91.x = _4900;
    float _4916 = _4914;
    float _4918 = _4914;
    if (!_4776)
    {
        _4910 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4920 = _4910;
    float _4922 = _4920;
    float _4924 = _4920;
    if (!_4776)
    {
        _4912 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4926 = _4912;
    out.m_93.x = _4902;
    out.m_93.y = _4904;
    out.m_93.z = _4906;
    out.m_93.w = _4898;
    bool _4928 = !_4776;
    float _4930 = _4926;
    float _4932 = _4926;
    if (!_4928)
    {
        bool _4934 = _4589 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4936 = isnan(_4589);
        bool _4938 = _4934 || _4936;
        bool _4940 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4942 = _4938 || _4940;
        if (!_4942)
        {
            float _4944 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4946 = _4589 + _4944;
            float _4948 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4950 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4948;
            float _4952 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4954 = _4952 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4956 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4958 = _4956 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4960 = 1.0 / _4950;
            float _4962 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4964 = _4962 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4966 = _4946 * _4960;
            float _4968 = precise::clamp(_4966, 0.0, 1.0);
            float _4970 = fma(_4968, _4954, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4972 = fma(_4968, _4958, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4974 = fma(_4968, _4964, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            _4924 = _4972;
            _4918 = _4970;
            _4932 = _4974;
            _4976 = true;
        }
        else
        {
            bool _4978 = _4589 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4980 = isnan(_4589);
            bool _4982 = _4978 || _4980;
            bool _4984 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4986 = _4982 || _4984;
            if (!_4986)
            {
                _4916 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4988 = _4916;
            _4918 = _4988;
            if (!_4986)
            {
                _4922 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4990 = _4922;
            _4924 = _4990;
            if (!_4986)
            {
                _4930 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4992 = _4930;
            bool _4994 = !_4986;
            _4932 = _4992;
            if (!_4994)
            {
                bool _4996 = _4589 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4998 = isnan(_4589);
                bool _5000 = _4996 || _4998;
                bool _5002 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _5004 = _5000 || _5002;
                if (!_5004)
                {
                    float _5006 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5008 = _4589 + _5006;
                    float _5010 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5012 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _5010;
                    float _5014 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _5016 = _5014 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _5018 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _5020 = _5018 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _5022 = 1.0 / _5012;
                    float _5024 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _5026 = _5024 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _5028 = _5008 * _5022;
                    float _5030 = precise::clamp(_5028, 0.0, 1.0);
                    float _5032 = fma(_5030, _5016, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _5034 = fma(_5030, _5020, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _5036 = fma(_5030, _5026, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    _4924 = _5034;
                    _4918 = _5032;
                    _4932 = _5036;
                    _4976 = true;
                }
                else
                {
                    _4924 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4918 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4932 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _4976 = false;
    float _5038 = _4924;
    float _5040 = _4918;
    float _5042 = _4932;
    float _5044 = _5038 * 0.586610972881317138671875;
    bool _5046 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_51.x = 1.0;
    float _5048 = fma(_5040, 0.298911988735198974609375, _5044);
    out.m_95.x = 0.0;
    float _5050 = fma(_5042, 0.114477999508380889892578125, _5048);
    float _5052 = -_5050;
    float _5054 = _5052 + _5040;
    float _5056 = -_5050;
    float _5058 = _5056 + _5038;
    float _5060 = -_5050;
    float _5062 = _5060 + _5042;
    float _5064 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _5066 = fma(_5054, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5050);
    float _5068 = fma(_5058, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5050);
    float _5070 = fma(_5062, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5050);
    out.m_91.w = _5064;
    out.m_97.x = _5066;
    out.m_97.y = _5068;
    out.m_97.z = _5070;
    if (!_5046)
    {
        return out;
    }
    float _5072 = -_4409;
    float _5074 = _5072 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _5076 = -_4411;
    float _5078 = _5076 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _5080 = -_4413;
    float _5082 = _5080 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _5084 = _5074 * _5074;
    float _5086 = fma(_5078, _5078, _5084);
    float _5088 = fma(_5082, _5082, _5086);
    float _5090 = sqrt(_5088);
    float _5092 = rsqrt(_5088);
    float _5094 = -_5090;
    float _5096 = _5094 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _5098 = _5096 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _5100 = precise::clamp(_5098, 0.0, 1.0);
    float _5102 = _5078 * _5092;
    float _5104 = _5074 * _5092;
    float _5106 = abs(_5100);
    float _5108 = log2(_5106);
    float _5110 = _5082 * _5092;
    float _5112 = _5102 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _5114 = _4233 * _5104;
    float _5116 = -_5104;
    float _5118 = -_5112;
    float _5120 = fma(_5116, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5118);
    float _5122 = fma(_4227, _5102, _5114);
    float _5124 = -_5110;
    float _5126 = fma(_5124, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5120);
    float _5128 = fma(_4239, _5110, _5122);
    float _5130 = precise::clamp(_5128, 0.0, 1.0);
    float _5132 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _5134 = _5126 + _5132;
    float _5136 = _5108 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _5138 = _5134 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _5140 = precise::clamp(_5138, 0.0, 1.0);
    float _5142 = exp2(_5136);
    float _5144 = _5142 * _5140;
    float _5146 = _5130 * _5144;
    float _5148 = _5146 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _5150 = _5146 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _5152 = _5146 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_95.x = _5148;
    out.m_95.y = _5150;
    out.m_95.z = _5152;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint dm_vid [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4976 = false;
    bool _4287 = false;
    bool _638 = false;
    bool _534 = false;
    bool _416 = false;
    bool _194 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _111 = in.m_48.w;
    float _113 = trunc(_111);
    int _116 = int(_113);
    bool _120 = _116 >= 1;
    float _122 = 0.0;
    if (!_120)
    {
        _122 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _124 = _122;
    float _126 = _124;
    if (!_120)
    {
        out.m_51.x = 0.0;
    }
    int _128 = 0;
    if (!_120)
    {
        float _130 = _124 * 5.0;
        _128 = as_type<int>(_130);
    }
    int _132 = _128;
    int _134 = _132;
    if (!_120)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5209 = as_type<float>(_132);
        out.gl_Position.z = _5209;
    }
    if (!_120)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _136 = in.m_53.w;
    bool _138 = _136 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _140 = isnan(_136);
    bool _142 = _138 || _140;
    bool _144 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _146 = _142 || _144;
    float _148 = -_136;
    float _150 = _148 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _152 = _150;
    if (_146)
    {
        float _154 = float(_116);
        _126 = _154;
    }
    float _156 = _126;
    bool _158 = _150 >= _156;
    bool _160 = !_146;
    bool _162 = _158 || _160;
    float _164 = _156;
    if (_162)
    {
        _164 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _166 = _164;
    if (_162)
    {
        out.m_51.x = 0.0;
    }
    if (_162)
    {
        float _168 = _166 * 5.0;
        _134 = as_type<int>(_168);
    }
    int _170 = _134;
    if (_162)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5279 = as_type<float>(_170);
        out.gl_Position.z = _5279;
    }
    if (_162)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _172 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _174 = !_172;
    float _192;
    if (!_174)
    {
        float _176 = in.m_55.x;
        float _178 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _180 = _176 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _182 = fma(_180, (*spvDescriptorSet0.vp_c9)._m0[12].x, _150);
        float _184 = _182 * _178;
        float _186 = floor(_184);
        float _188 = -_186;
        float _190 = _184 + _188;
        _192 = _190;
        _194 = true;
    }
    else
    {
        float _196 = float(_116);
        float _198 = 1.0 / _196;
        float _200 = _150 * _198;
        _192 = _200;
    }
    _194 = false;
    float _202 = _192;
    float _204 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _206 = _202 + _204;
    float _208 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _210 = _202 + _208;
    float _212 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _214 = _202 + _212;
    float _216 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _218 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _216;
    float _220 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _222 = _220 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _224 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _226 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _224;
    float _228 = 1.0 / _218;
    bool _230 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _232 = 1.0 / _226;
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _236 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _234;
    float _238 = 1.0 / _222;
    float _240 = _206 * _228;
    bool _242 = _202 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _244 = isnan(_202);
    bool _246 = _242 || _244;
    bool _248 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _250 = _246 || _248;
    float _252 = float(_250);
    float _254 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _256 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _254;
    float _258 = fma(_236, _240, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _260 = fma(_256, _240, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _262 = _210 * _232;
    bool _264 = _202 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _266 = isnan(_202);
    bool _268 = _264 || _266;
    bool _270 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _272 = _268 || _270;
    float _274 = float(_272);
    float _276 = -_252;
    float _278 = _276 + 1.0;
    float _280 = _274 * _278;
    bool _282 = _202 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _284 = isnan(_202);
    bool _286 = _282 || _284;
    bool _288 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _290 = _286 || _288;
    float _292 = float(_290);
    float _294 = _214 * _238;
    bool _296 = _202 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _298 = isnan(_202);
    bool _300 = _296 || _298;
    bool _302 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _304 = _300 || _302;
    float _306 = float(_304);
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _310 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _308;
    float _312 = -_274;
    float _314 = _312 + 1.0;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _318 = _316 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _320 = fma(_310, _240, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _322 = -_306;
    float _324 = _322 + 1.0;
    float _326 = _306 * _314;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _330 = _328 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _334 = _332 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _336 = _292 * _324;
    float _338 = -_292;
    float _340 = _338 + 1.0;
    float _342 = fma(_318, _294, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _344 = fma(_334, _294, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _346 = _258 * _336;
    float _348 = _260 * _336;
    float _350 = _320 * _336;
    float _352 = fma(_340, (*spvDescriptorSet0.vp_c9)._m0[143].x, _346);
    float _354 = fma(_340, (*spvDescriptorSet0.vp_c9)._m0[143].y, _348);
    float _356 = fma(_340, (*spvDescriptorSet0.vp_c9)._m0[143].z, _350);
    float _358 = fma(_330, _294, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _362 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _360;
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _366 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _364;
    float _368 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _370 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _368;
    float _372 = fma(_342, _326, _352);
    float _374 = fma(_362, _262, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _376 = fma(_366, _262, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _378 = fma(_370, _262, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _380 = fma(_344, _326, _354);
    float _382 = fma(_358, _326, _356);
    float _384 = fma(_374, _280, _372);
    float _386 = fma(_376, _280, _380);
    float _388 = fma(_378, _280, _382);
    float _390 = fma(_252, (*spvDescriptorSet0.vp_c9)._m0[146].x, _384);
    float _392 = fma(_252, (*spvDescriptorSet0.vp_c9)._m0[146].y, _386);
    float _394 = fma(_252, (*spvDescriptorSet0.vp_c9)._m0[146].z, _388);
    bool _396 = !_230;
    float _414;
    if (!_396)
    {
        float _398 = in.m_55.x;
        float _400 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _402 = _398 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _404 = fma(_402, (*spvDescriptorSet0.vp_c9)._m0[11].y, _150);
        float _406 = _404 * _400;
        float _408 = floor(_406);
        float _410 = -_408;
        float _412 = _406 + _410;
        _414 = _412;
        _416 = true;
    }
    else
    {
        float _418 = float(_116);
        float _420 = 1.0 / _418;
        float _422 = _150 * _420;
        _414 = _422;
    }
    _416 = false;
    float _424 = _414;
    float _426 = in.m_57.x;
    float _428 = in.m_57.y;
    float _430 = in.m_57.z;
    bool _432 = _424 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _434 = isnan(_424);
    bool _436 = _432 || _434;
    bool _438 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _440 = _436 || _438;
    float _442 = float(_440);
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _446 = _444 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _448 = _424 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _450 = isnan(_424);
    bool _452 = _448 || _450;
    bool _454 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _456 = _452 || _454;
    float _458 = float(_456);
    float _460 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _462 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _460;
    bool _464 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _466 = 1.0 / _446;
    float _468 = -_442;
    float _470 = _468 + 1.0;
    float _472 = _458 * _470;
    float _474 = -_458;
    float _476 = _474 + 1.0;
    float _478 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _480 = _462 * _466;
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _484 = _424 + _482;
    float _486 = _478 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _488 = _392 * _428;
    float _490 = fma(_480, _484, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _492 = _390 * _426;
    float _494 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _496 = _490 * _472;
    float _498 = _494 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _500 = fma(_476, (*spvDescriptorSet0.vp_c9)._m0[115].x, _496);
    float _502 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _504 = fma(_442, (*spvDescriptorSet0.vp_c9)._m0[116].x, _500);
    float _506 = _394 * _430;
    float _508 = _502 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _510 = _504 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_59.x = _498;
    out.m_59.y = _508;
    out.m_59.z = _486;
    out.m_59.w = _510;
    bool _512 = !_464;
    float _514 = _428;
    float _532;
    if (!_512)
    {
        float _516 = in.m_55.x;
        float _518 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _520 = _516 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _522 = fma(_520, (*spvDescriptorSet0.vp_c9)._m0[11].w, _150);
        float _524 = _522 * _518;
        float _526 = floor(_524);
        float _528 = -_526;
        float _530 = _524 + _528;
        _532 = _530;
        _534 = true;
    }
    else
    {
        float _536 = float(_116);
        float _538 = 1.0 / _536;
        float _540 = _150 * _538;
        _532 = _540;
    }
    _534 = false;
    float _542 = _532;
    bool _544 = _542 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _546 = isnan(_542);
    bool _548 = _544 || _546;
    bool _550 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _552 = _548 || _550;
    float _554 = float(_552);
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _558 = _556 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _560 = _542 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _562 = isnan(_542);
    bool _564 = _560 || _562;
    bool _566 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _568 = _564 || _566;
    float _570 = float(_568);
    float _572 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _574 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _572;
    bool _576 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _578 = 1.0 / _558;
    float _580 = -_554;
    float _582 = _580 + 1.0;
    float _584 = _570 * _582;
    float _586 = -_570;
    float _588 = _586 + 1.0;
    float _590 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _592 = _574 * _578;
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _596 = _542 + _594;
    float _598 = _590 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _600 = fma(_592, _596, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _602 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _604 = _600 * _584;
    float _606 = _602 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _608 = fma(_588, (*spvDescriptorSet0.vp_c9)._m0[131].x, _604);
    float _610 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _612 = fma(_554, (*spvDescriptorSet0.vp_c9)._m0[132].x, _608);
    float _614 = _610 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _616 = _612 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_61.x = _606;
    out.m_61.y = _614;
    out.m_61.z = _598;
    out.m_61.w = _616;
    bool _618 = !_576;
    float _636;
    if (!_618)
    {
        float _620 = in.m_55.x;
        float _622 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _624 = _620 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _626 = fma(_624, (*spvDescriptorSet0.vp_c9)._m0[14].x, _150);
        float _628 = _626 * _622;
        float _630 = floor(_628);
        float _632 = -_630;
        float _634 = _628 + _632;
        _636 = _634;
        _638 = true;
    }
    else
    {
        float _640 = float(_116);
        float _642 = 1.0 / _640;
        float _644 = _150 * _642;
        _636 = _644;
    }
    _638 = false;
    float _646 = _636;
    float _648 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _650 = int(_648);
    float _652 = in.m_55.x;
    float _654 = _492 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _656 = in.m_55.y;
    int _658 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _660 = _658 != 0;
    float _662 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _664 = int(_662);
    float _666 = in.m_55.z;
    int _668 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _670 = _668 != 0;
    int _672 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _674 = _672 != 0;
    float _676 = in.m_63.x;
    float _678 = float(_650);
    float _680 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _682 = int(_680);
    float _684 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _686 = _684 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _688 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _690 = _688 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _692 = float(_664);
    float _694 = 1.0 / _678;
    bool _696 = false;
    if (_670)
    {
        bool _698 = _652 > 0.5;
        _696 = _698;
    }
    bool _700 = _696;
    float _702 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _704 = _702 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _706 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _708 = _706 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _710 = _652 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _712 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _714 = int(_712);
    float _716 = float(uint(_682));
    float _718 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _720 = _718 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    int _722 = ~_682;
    int _724 = _722 + 1;
    int _726 = 0;
    float _728 = _676;
    if (_674)
    {
        float _730 = -_676;
        float _732 = _730 + 1.0;
        _726 = as_type<int>(_732);
    }
    int _734 = _726;
    float _736 = 0.0;
    if (!_670)
    {
        _736 = _676;
    }
    float _738 = _736;
    float _740 = _656 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _742 = _666 > 0.5;
    float _744 = _694 * _150;
    float _746 = 1.0 / _692;
    float _748 = _738;
    if (!_674)
    {
        _514 = _676;
    }
    float _750 = _514;
    float _752 = _750;
    if (_674)
    {
        float _754 = _742 ? as_type<float>(_734) : _676;
        _752 = _754;
    }
    float _756 = _752;
    float _758 = float(_116);
    float _760 = float(uint(_714));
    float _762 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _764 = int(_762);
    int _766 = ~_714;
    int _768 = _766 + 1;
    float _770 = 1.0 / _716;
    float _772 = _746 * _150;
    float _774 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _776 = _774 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _778 = trunc(_744);
    int _780 = int(_778);
    float _782 = float(_764);
    float _784 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _786 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _784;
    float _788 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _790 = 1.0 / _760;
    float _792 = float(uint(_780));
    float _794 = trunc(_772);
    int _796 = int(_794);
    int _798 = as_type<int>(_770) + (-2);
    float _800 = as_type<float>(_798) * _792;
    int _802 = as_type<int>(_790) + (-2);
    float _804 = 1.0 / _782;
    float _806 = _792;
    float _808 = _782;
    if (_660)
    {
        _806 = 1.0;
    }
    float _810 = _806;
    float _812 = _810;
    if (!_660)
    {
        _812 = 7.345489978790283203125;
    }
    float _814 = _812;
    float _816 = trunc(_800);
    float _818 = precise::max(_816, 0.0);
    uint _821 = uint(_818);
    float _823 = float(uint(_796));
    float _825 = _814 * _652;
    float _827 = _823;
    if (_660)
    {
        _808 = 1.0;
    }
    float _829 = _808;
    float _831 = _829;
    if (!_660)
    {
        _831 = 1.2345600128173828125;
    }
    float _833 = _831;
    float _835 = as_type<float>(_802) * _823;
    float _837 = _833;
    if (_660)
    {
        _827 = _652;
    }
    float _839 = _827;
    float _841 = floor(_825);
    float _843 = _839;
    if (!_660)
    {
        _843 = _656;
    }
    float _845 = _843;
    float _847 = _804 * _150;
    float _849 = _845 * _833;
    float _851 = _845;
    if (_660)
    {
        _851 = _652;
    }
    float _853 = _851;
    int _855 = _724 * int(_821);
    int _857 = _855 + _780;
    float _859 = trunc(_835);
    float _861 = precise::max(_859, 0.0);
    uint _863 = uint(_861);
    float _865 = _853;
    if (_660)
    {
        _837 = 1.0;
    }
    float _867 = _837;
    float _869 = _867;
    if (!_660)
    {
        _865 = _666;
    }
    float _871 = _865;
    float _873 = float(uint(_857));
    if (!_660)
    {
        _869 = 5.839270114898681640625;
    }
    float _875 = _869;
    float _877 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _879 = int(_877);
    float _881 = in.m_55.w;
    float _883 = as_type<float>(_798) * _873;
    float _885 = -_841;
    float _887 = _825 + _885;
    float _889 = _871 * _875;
    float _891 = trunc(_883);
    float _893 = precise::max(_891, 0.0);
    uint _895 = uint(_893);
    int _897 = _768 * int(_863);
    int _899 = _897 + _796;
    float _901 = float(uint(_899));
    float _903 = floor(_849);
    float _905 = float(uint(_879));
    float _907 = as_type<float>(_802) * _901;
    int _909 = as_type<int>(_901);
    if (_670)
    {
        float _911 = -_676;
        float _913 = _911 + 1.0;
        _909 = as_type<int>(_913);
    }
    int _915 = _909;
    int _917 = ~_879;
    int _919 = _917 + 1;
    float _921 = floor(_889);
    bool _923 = _881 > 0.5;
    float _925 = float(_682);
    int _927 = int(_821) + int(_895);
    if (_670)
    {
        float _929 = _700 ? as_type<float>(_915) : _676;
        _748 = _929;
    }
    float _931 = _748;
    float _933 = trunc(_907);
    float _935 = precise::max(_933, 0.0);
    uint _937 = uint(_935);
    float _939 = _887 * _925;
    float _941 = float(_780);
    float _943 = -_903;
    float _945 = _849 + _943;
    int _947 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _949 = _947 != 0;
    bool _951 = _941 >= _925;
    bool _953 = isnan(_941);
    bool _955 = _951 || _953;
    bool _957 = isnan(_925);
    bool _959 = _955 || _957;
    float _961 = float(_959);
    float _963 = 1.0 / _905;
    int _965 = ~_682;
    int _967 = _965 + 1;
    float _969 = -_921;
    float _971 = _889 + _969;
    bool _973 = !_949;
    int _975 = _973 ? 0 : 1;
    int _977 = _967 * _927;
    int _979 = _977 + _780;
    float _981 = trunc(_847);
    int _983 = int(_981);
    int _985 = int(_863) + int(_937);
    bool _987 = uint(_979) >= uint(_682);
    int _989 = abs(_975);
    bool _991 = !_987;
    int _993 = _991 ? 0 : (-1);
    float _995 = trunc(_939);
    int _997 = int(_995);
    int _999 = as_type<int>(_963) + (-2);
    int _1001 = ~_927;
    int _1003 = _1001 + _993;
    int _1005 = _1003 + 1;
    int _1007 = ~_714;
    int _1009 = _1007 + 1;
    float _1011 = trunc(_961);
    int _1013 = int(_1011);
    float _1015 = float(uint(_983));
    int _1017 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1019 = _1017 != 0;
    int _1021 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1023 = _1021 != 0;
    int _1025 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1027 = _1025 != 0;
    int _1029 = _1009 * _985;
    int _1031 = _1029 + _796;
    bool _1033 = _682 == 0;
    float _1035 = as_type<float>(_999) * _1015;
    float _1037 = in.m_63.y;
    int _1039 = _997 * _989;
    int _1041 = _1039 + _780;
    bool _1043 = uint(_1031) >= uint(_714);
    float _1045 = trunc(_1035);
    float _1047 = precise::max(_1045, 0.0);
    uint _1049 = uint(_1047);
    int _1051 = _682 * _1005;
    int _1053 = _1051 + _780;
    int _1055 = _682 + (-1);
    bool _1057 = !_1043;
    int _1059 = _1057 ? 0 : (-1);
    int _1061 = ~_1013;
    int _1063 = _1061 + 1;
    int _1065 = _1063 + 1;
    bool _1067 = !_1033;
    int _1069 = _1067 ? _1053 : (-1);
    float _1071 = 1.0 / _758;
    float _1073 = float(_714);
    float _1075 = float(_796);
    int _1077 = _1069 * _1065;
    int _1079 = ~_985;
    int _1081 = _1079 + _1059;
    int _1083 = _1081 + 1;
    int _1085 = _1013 * _1055;
    int _1087 = _1085 + _1077;
    bool _1089 = _1075 >= _1073;
    bool _1091 = isnan(_1075);
    bool _1093 = _1089 || _1091;
    bool _1095 = isnan(_1073);
    bool _1097 = _1093 || _1095;
    float _1099 = float(_1097);
    int _1101 = _919 * int(_1049);
    int _1103 = _1101 + _983;
    int _1105 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1107 = _1105 != 0;
    float _1109 = _1073 * _945;
    float _1111 = trunc(_1099);
    int _1113 = int(_1111);
    bool _1115 = !_1027;
    int _1117 = _1115 ? 0 : 1;
    int _1119 = _714 * _1083;
    int _1121 = _1119 + _796;
    float _1123 = float(uint(_1103));
    float _1125 = -_1037;
    float _1127 = _1125 + 1.0;
    bool _1129 = _656 > 0.5;
    bool _1131 = !_1023;
    int _1133 = _1131 ? 0 : 1;
    float _1135 = as_type<float>(_999) * _1123;
    float _1137 = _925 * _150;
    bool _1139 = !_1107;
    int _1141 = _1139 ? 0 : 1;
    float _1143 = trunc(_1109);
    int _1145 = int(_1143);
    int _1147 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1149 = _1147 != 0;
    float _1151 = _1137 * _1071;
    bool _1153 = _714 == 0;
    float _1155 = _1071 * _150;
    int _1157 = _1129 ? as_type<int>(_1127) : as_type<int>(_1037);
    int _1159 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1161 = _1159 != 0;
    float _1163 = trunc(_1135);
    float _1165 = precise::max(_1163, 0.0);
    uint _1167 = uint(_1165);
    int _1169 = abs(_1133);
    float _1171 = _1073 * _1155;
    int _1173 = _923 ? as_type<int>(_1127) : as_type<int>(_1037);
    float _1175 = _1149 ? as_type<float>(_1157) : _1037;
    int _1177 = _1087 * _1169;
    int _1179 = ~_1113;
    int _1181 = _1179 + 1;
    int _1183 = _1181 + 1;
    float _1185 = trunc(_1151);
    int _1187 = int(_1185);
    bool _1189 = !_1153;
    int _1191 = _1189 ? _1121 : (-1);
    int _1193 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1195 = _1193 != 0;
    int _1197 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1199 = _1197 != 0;
    bool _1201 = !_1019;
    int _1203 = _1201 ? 0 : 1;
    int _1205 = _1183 * _1191;
    bool _1207 = !_1161;
    int _1209 = _1207 ? 0 : 1;
    float _1211 = 1.0 / _686;
    bool _1213 = !_1199;
    int _1215 = _1213 ? 0 : 1;
    int _1217 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1219 = _1217 != 0;
    int _1221 = abs(_1209);
    int _1223 = abs(_1203);
    float _1225 = 1.0 / _690;
    float _1227 = _1219 ? as_type<float>(_1173) : _1037;
    int _1229 = _1145 * _1221;
    int _1231 = _1229 + _796;
    int _1233 = ~_879;
    int _1235 = _1233 + 1;
    int _1237 = _1187 * _1223;
    int _1239 = _1237 + _1177;
    int _1241 = int(_1049) + int(_1167);
    float _1243 = 1.0 / _704;
    int _1245 = abs(_1117);
    int _1247 = _714 + (-1);
    int _1249 = _1235 * _1241;
    int _1251 = _1249 + _983;
    bool _1253 = !_1195;
    int _1255 = _1253 ? 0 : 1;
    int _1257 = _1041 * _1245;
    int _1259 = _1257 + _1239;
    int _1261 = abs(_1141);
    float _1263 = trunc(_1171);
    int _1265 = int(_1263);
    int _1267 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1269 = _1267 != 0;
    int _1271 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1273 = _1271 != 0;
    int _1275 = _1113 * _1247;
    int _1277 = _1275 + _1205;
    int _1279 = abs(_1215);
    int _1281 = _997 * _1261;
    int _1283 = _1281 + _1259;
    int _1285 = abs(_1255);
    bool _1287 = !_1269;
    int _1289 = _1287 ? 0 : 1;
    int _1291 = _1277 * _1279;
    float _1293 = 1.0 / _708;
    bool _1295 = uint(_1251) >= uint(_879);
    bool _1297 = !_1273;
    int _1299 = _1297 ? 0 : 1;
    float _1301 = float(_879);
    int _1303 = _1265 * _1285;
    int _1305 = _1303 + _1291;
    float _1307 = float(_983);
    float _1309 = 1.0 / _720;
    int _1311 = abs(_1289);
    float _1313 = _1301 * _1155;
    int _1315 = abs(_1299);
    bool _1317 = _1307 >= _1301;
    bool _1319 = isnan(_1307);
    bool _1321 = _1317 || _1319;
    bool _1323 = isnan(_1301);
    bool _1325 = _1321 || _1323;
    float _1327 = float(_1325);
    int _1329 = _1231 * _1311;
    int _1331 = _1329 + _1305;
    float _1333 = float(uint(_1283));
    float _1335 = 1.0 / _776;
    bool _1337 = !_1295;
    int _1339 = _1337 ? 0 : (-1);
    float _1341 = as_type<float>(_798) * _1333;
    int _1343 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1345 = _1343 != 0;
    int _1347 = _1145 * _1315;
    int _1349 = _1347 + _1331;
    float _1351 = _1301 * _971;
    float _1353 = trunc(_1327);
    int _1355 = int(_1353);
    int _1357 = ~_1241;
    int _1359 = _1357 + _1339;
    int _1361 = _1359 + 1;
    float _1363 = _666 * 2.0;
    float _1365 = float(uint(_1349));
    bool _1367 = !_1345;
    int _1369 = _1367 ? 0 : 1;
    int _1371 = _879 * _1361;
    int _1373 = _1371 + _983;
    int _1375 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1377 = _1375 != 0;
    int _1379 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1381 = _1379 != 0;
    float _1383 = trunc(_1341);
    float _1385 = precise::max(_1383, 0.0);
    uint _1387 = uint(_1385);
    bool _1389 = _879 == 0;
    float _1391 = as_type<float>(_802) * _1365;
    int _1393 = abs(_1369);
    float _1395 = _786 * _1335;
    int _1397 = ~_682;
    int _1399 = _1397 + 1;
    bool _1401 = !_1389;
    int _1403 = _1401 ? _1373 : (-1);
    float _1405 = trunc(_1351);
    int _1407 = int(_1405);
    bool _1409 = !_1381;
    int _1411 = _1409 ? 0 : 1;
    int _1413 = ~_1355;
    int _1415 = _1413 + 1;
    int _1417 = _1415 + 1;
    int _1419 = _879 + (-1);
    float _1421 = trunc(_1391);
    float _1423 = precise::max(_1421, 0.0);
    uint _1425 = uint(_1423);
    int _1427 = _1399 * int(_1387);
    int _1429 = _1427 + _1283;
    int _1431 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1433 = _1431 != 0;
    int _1435 = _1417 * _1403;
    int _1437 = ~_714;
    int _1439 = _1437 + 1;
    bool _1441 = _666 > 0.5;
    int _1443 = _1355 * _1419;
    int _1445 = _1443 + _1435;
    float _1447 = trunc(_1313);
    int _1449 = int(_1447);
    int _1451 = _1407 * _1393;
    int _1453 = _1451 + _983;
    int _1455 = abs(_1411);
    float _1457 = float(uint(_1429));
    bool _1459 = !_1377;
    int _1461 = _1459 ? 0 : 1;
    bool _1463 = !_1433;
    int _1465 = _1463 ? 0 : 1;
    float _1467 = as_type<float>(_798) * _1457;
    int _1469 = _1445 * _1455;
    int _1471 = abs(_1461);
    int _1473 = _1439 * int(_1425);
    int _1475 = _1473 + _1349;
    float _1477 = trunc(_1467);
    float _1479 = precise::max(_1477, 0.0);
    uint _1481 = uint(_1479);
    int _1483 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1485 = _1483 != 0;
    int _1487 = abs(_1465);
    bool _1489 = !_1485;
    int _1491 = _1489 ? 0 : 1;
    float _1493 = floor(_1363);
    float _1495 = float(uint(_1475));
    int _1497 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1499 = _1497 != 0;
    int _1501 = _1449 * _1471;
    int _1503 = _1501 + _1469;
    int _1505 = abs(_1491);
    float _1507 = as_type<float>(_802) * _1495;
    int _1509 = ~_682;
    int _1511 = _1509 + 1;
    int _1513 = _1453 * _1487;
    int _1515 = _1513 + _1503;
    int _1517 = int(_1387) + int(_1481);
    float _1519 = trunc(_1507);
    float _1521 = precise::max(_1519, 0.0);
    uint _1523 = uint(_1521);
    int _1525 = _1407 * _1505;
    int _1527 = _1525 + _1515;
    float _1529 = _1037;
    float _1531 = as_type<float>(_1169);
    if (_1499)
    {
        float _1533 = _1441 ? _1127 : _1037;
        _1529 = _1533;
    }
    float _1535 = _1529;
    int _1537 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1539 = _1537 != 0;
    int _1541 = _1511 * _1517;
    int _1543 = _1541 + _1283;
    float _1545 = float(uint(_1527));
    float _1547 = float(uint(_1041));
    bool _1549 = uint(_1543) >= uint(_682);
    float _1551 = as_type<float>(_999) * _1545;
    int _1553 = ~_714;
    int _1555 = _1553 + 1;
    float _1557 = as_type<float>(_798) * _1547;
    bool _1559 = !_1549;
    int _1561 = _1559 ? 0 : (-1);
    float _1563 = trunc(_1551);
    float _1565 = precise::max(_1563, 0.0);
    uint _1567 = uint(_1565);
    int _1569 = int(_1425) + int(_1523);
    int _1571 = int(_1523);
    if (_1539)
    {
        float _1573 = -_676;
        float _1575 = _1573 + 1.0;
        _1571 = as_type<int>(_1575);
    }
    int _1577 = _1571;
    int _1579 = ~_1517;
    int _1581 = _1579 + _1561;
    int _1583 = _1581 + 1;
    int _1585 = ~_879;
    int _1587 = _1585 + 1;
    if (_1539)
    {
        float _1589 = _1129 ? as_type<float>(_1577) : _676;
        _728 = _1589;
    }
    float _1591 = _728;
    float _1593 = trunc(_1557);
    float _1595 = precise::max(_1593, 0.0);
    uint _1597 = uint(_1595);
    int _1599 = _682 * _1583;
    int _1601 = _1599 + _1283;
    bool _1603 = _682 == 0;
    int _1605 = _1555 * _1569;
    int _1607 = _1605 + _1349;
    bool _1609 = !_1603;
    int _1611 = _1609 ? _1601 : (-1);
    int _1613 = ~_682;
    int _1615 = _1613 + 1;
    int _1617 = _1587 * int(_1567);
    int _1619 = _1617 + _1527;
    int _1621 = _1611 & 3;
    bool _1623 = _1621 != 0;
    int _1625 = _1611 & 3;
    bool _1627 = _1625 != 0;
    bool _1629 = uint(_1607) >= uint(_714);
    int _1631 = _1615 * int(_1597);
    int _1633 = _1631 + _1041;
    int _1635 = _1623 ? 0 : 1;
    bool _1637 = uint(_1625) >= 2u;
    bool _1639 = !_1629;
    int _1641 = _1639 ? 0 : (-1);
    float _1643 = float(uint(_1619));
    int _1645 = _1637 ? 0 : 1;
    bool _1647 = uint(_1625) > 1u;
    float _1649 = as_type<float>(_999) * _1643;
    bool _1651 = _1625 != 3;
    int _1653 = ~_1569;
    int _1655 = _1653 + _1641;
    int _1657 = _1655 + 1;
    float _1659 = float(uint(_1633));
    float _1661 = trunc(_1649);
    float _1663 = precise::max(_1661, 0.0);
    uint _1665 = uint(_1663);
    bool _1667 = _714 == 0;
    int _1669 = _714 * _1657;
    int _1671 = _1669 + _1349;
    int _1673 = ~_1635;
    int _1675 = _1673 + 1;
    int _1677 = _1675 + 1;
    float _1679 = as_type<float>(_798) * _1659;
    int _1681 = ~_1645;
    int _1683 = _1681 + 1;
    int _1685 = _1683 + 1;
    bool _1687 = !_1667;
    int _1689 = _1687 ? _1671 : (-1);
    int _1691 = _1677;
    int _1693 = _1685;
    if (!_1647)
    {
        int _1695 = ~_1635;
        int _1697 = _1695 + 1;
        _1691 = _1697;
    }
    int _1699 = _1691;
    float _1701 = trunc(_1679);
    float _1703 = precise::max(_1701, 0.0);
    uint _1705 = uint(_1703);
    if (_1651)
    {
        int _1707 = ~_1645;
        int _1709 = _1707 + 1;
        _1693 = _1709;
    }
    int _1711 = _1693;
    int _1713 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1715 = _1713 != 0;
    int _1717 = _1689 & 3;
    bool _1719 = _1717 != 0;
    bool _1721 = !_1715;
    int _1723 = _1721 ? 0 : 1;
    bool _1725 = uint(_1717) >= 2u;
    int _1727 = ~_879;
    int _1729 = _1727 + 1;
    int _1731 = _1725 ? 0 : 1;
    bool _1733 = _1717 != 3;
    int _1735 = int(_1567) + int(_1665);
    int _1737 = ~_682;
    int _1739 = _1737 + 1;
    int _1741 = int(_1597) + int(_1705);
    int _1743 = _1729 * _1735;
    int _1745 = _1743 + _1527;
    int _1747 = ~_1731;
    int _1749 = _1747 + 1;
    int _1751 = _1749 + 1;
    int _1753 = _1719 ? 0 : 1;
    bool _1755 = uint(_1745) >= uint(_879);
    int _1757 = _1751;
    int _1759 = _1739;
    if (_1733)
    {
        int _1761 = ~_1731;
        int _1763 = _1761 + 1;
        _1757 = _1763;
    }
    int _1765 = _1757;
    int _1767 = _1739 * _1741;
    int _1769 = _1767 + _1041;
    float _1771 = float(uint(_1231));
    bool _1773 = !_1755;
    int _1775 = _1773 ? 0 : (-1);
    bool _1777 = uint(_1769) >= uint(_682);
    float _1779 = as_type<float>(_802) * _1771;
    float _1781 = float(uint(_1453));
    int _1783 = ~_1735;
    int _1785 = _1783 + _1775;
    int _1787 = _1785 + 1;
    float _1789 = trunc(_1779);
    float _1791 = precise::max(_1789, 0.0);
    uint _1793 = uint(_1791);
    bool _1795 = uint(_1717) > 1u;
    float _1797 = as_type<float>(_999) * _1781;
    int _1799 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1801 = _1799 != 0;
    int _1803 = _879 * _1787;
    int _1805 = _1803 + _1527;
    int _1807 = ~_714;
    int _1809 = _1807 + 1;
    float _1811 = _652 * 2.0;
    int _1813 = ~_879;
    int _1815 = _1813 + 1;
    float _1817 = trunc(_1797);
    float _1819 = precise::max(_1817, 0.0);
    uint _1821 = uint(_1819);
    bool _1823 = !_1389;
    int _1825 = _1823 ? _1805 : (-1);
    int _1827 = ~_1753;
    int _1829 = _1827 + 1;
    int _1831 = _1829 + 1;
    bool _1833 = _646 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1835 = isnan(_646);
    bool _1837 = _1833 || _1835;
    bool _1839 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1841 = _1837 || _1839;
    float _1843 = float(_1841);
    int _1845 = _1831;
    int _1847 = as_type<int>(_1781);
    float _1849 = _1811;
    if (!_1795)
    {
        int _1851 = ~_1753;
        int _1853 = _1851 + 1;
        _1845 = _1853;
    }
    int _1855 = _1845;
    int _1857 = _1809 * int(_1793);
    int _1859 = _1857 + _1231;
    if (_1801)
    {
        _1759 = 0;
    }
    int _1861 = _1759;
    float _1863 = floor(_1811);
    int _1865 = _1825 & 3;
    bool _1867 = _1865 != 0;
    float _1869 = -_1843;
    float _1871 = _1869 + 1.0;
    float _1873 = float(uint(_1859));
    int _1875 = _1861;
    if (!_1801)
    {
        _1875 = 1;
    }
    int _1877 = _1875;
    int _1879 = _1815 * int(_1821);
    int _1881 = _1879 + _1453;
    float _1883 = _1867 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _1885 = as_type<float>(_802) * _1873;
    bool _1887 = _1877 != 1;
    float _1889 = _656 * 2.0;
    float _1891 = float(uint(_1881));
    float _1893 = trunc(_1885);
    float _1895 = precise::max(_1893, 0.0);
    uint _1897 = uint(_1895);
    float _1899 = _1883;
    if (_1801)
    {
        _1847 = 0;
    }
    int _1901 = _1847;
    int _1903 = _1901;
    if (!_1801)
    {
        _1903 = 2;
    }
    int _1905 = _1903;
    float _1907 = as_type<float>(_999) * _1891;
    bool _1909 = !_1777;
    int _1911 = _1909 ? 0 : (-1);
    bool _1913 = _1865 != 3;
    bool _1915 = uint(_1865) > 1u;
    float _1917 = trunc(_1907);
    float _1919 = precise::max(_1917, 0.0);
    uint _1921 = uint(_1919);
    bool _1923 = uint(_1865) >= 2u;
    float _1925 = as_type<float>(_1905);
    if (!_1887)
    {
        _1849 = _656;
    }
    float _1927 = _1849;
    float _1929 = _1923 ? 0.0 : 1.4012984643248170709237295832899e-45;
    int _1931 = ~as_type<int>(_1883);
    int _1933 = _1931 + 1;
    int _1935 = _1933 + 1;
    int _1937 = ~as_type<int>(_1929);
    int _1939 = _1937 + 1;
    int _1941 = _1939 + 1;
    bool _1943 = _1905 != 2;
    int _1945 = _1941;
    int _1947 = _1935;
    float _1949 = _1929;
    float _1951 = _1927;
    if (_1913)
    {
        int _1953 = ~as_type<int>(_1929);
        int _1955 = _1953 + 1;
        _1945 = _1955;
    }
    int _1957 = _1945;
    if (!_1915)
    {
        int _1959 = ~as_type<int>(_1883);
        int _1961 = _1959 + 1;
        _1947 = _1961;
    }
    int _1963 = _1947;
    int _1965 = ~_714;
    int _1967 = _1965 + 1;
    float _1969 = as_type<float>(_1967);
    if (!_1887)
    {
        _1925 = _1927;
    }
    float _1971 = _1925;
    float _1973 = _1971;
    if (!_1887)
    {
        _1949 = _666;
    }
    float _1975 = _1949;
    float _1977 = _1975;
    if (!_1887)
    {
        _1899 = _666;
    }
    float _1979 = _1899;
    float _1981 = _1979;
    if (_1887)
    {
        _1973 = _652;
    }
    float _1983 = _1973;
    if (_1887)
    {
        _1951 = _652;
    }
    float _1985 = _1951;
    if (_1887)
    {
        _1977 = _656;
    }
    float _1987 = _1977;
    float _1989 = _1983 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_1887)
    {
        _1981 = _656;
    }
    float _1991 = _1981;
    int _1993 = int(_1793) + int(_1897);
    bool _1995 = _1863 > 0.0;
    float _1997 = floor(_1889);
    bool _1999 = _1863 >= 0.0;
    bool _2001 = isnan(_1863);
    bool _2003 = _1999 || _2001;
    bool _2005 = isnan(0.0);
    bool _2007 = _2003 || _2005;
    int _2009 = int(_1821) + int(_1921);
    if (_1943)
    {
        _1531 = _652;
    }
    float _2011 = _1531;
    int _2013 = _1967 * _1993;
    int _2015 = _2013 + _1231;
    float _2017 = _2011;
    if (_1943)
    {
        _1969 = _656;
    }
    float _2019 = _1969;
    int _2021 = ~_879;
    int _2023 = _2021 + 1;
    float _2025 = _2019;
    if (!_1943)
    {
        _2017 = _666;
    }
    float _2027 = _2017;
    if (!_1943)
    {
        _2025 = _652;
    }
    float _2029 = _2025;
    bool _2031 = uint(_2015) >= uint(_714);
    float _2033 = _2027 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    int _2035 = _2007 ? 0 : 1;
    float _2037 = _2029 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _2039 = ~_1741;
    int _2041 = _2039 + _1911;
    int _2043 = _2041 + 1;
    float _2045 = fma(_2037, -2.0, _788);
    bool _2047 = !_2031;
    int _2049 = _2047 ? 0 : (-1);
    bool _2051 = _1997 > 0.0;
    int _2053 = _2023 * _2009;
    int _2055 = _2053 + _1453;
    bool _2057 = _1997 >= 0.0;
    bool _2059 = isnan(_1997);
    bool _2061 = _2057 || _2059;
    bool _2063 = isnan(0.0);
    bool _2065 = _2061 || _2063;
    int _2067 = _682 * _2043;
    int _2069 = _2067 + _1041;
    int _2071 = ~_2035;
    int _2073 = _2071 + 1;
    int _2075 = _2073 + 1;
    float _2077 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2045);
    int _2079 = _2075;
    int _2081 = as_type<int>(_2029);
    if (!_1995)
    {
        int _2083 = ~_2035;
        int _2085 = _2083 + 1;
        _2079 = _2085;
    }
    int _2087 = _2079;
    float _2089 = in.m_48.x;
    float _2091 = in.m_48.y;
    float _2093 = in.m_48.z;
    int _2095 = _2065 ? 0 : 1;
    bool _2097 = uint(_2055) >= uint(_879);
    float _2099 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2101 = _2099 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    int _2103 = ~_2095;
    int _2105 = _2103 + 1;
    int _2107 = _2105 + 1;
    int _2109 = _2107;
    if (!_2051)
    {
        int _2111 = ~_2095;
        int _2113 = _2111 + 1;
        _2109 = _2113;
    }
    int _2115 = _2109;
    float _2117 = 1.0 / _2101;
    bool _2119 = !_1603;
    int _2121 = _2119 ? _2069 : (-1);
    bool _2123 = !_2097;
    int _2125 = _2123 ? 0 : (-1);
    int _2127 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2129 = _2127 != 0;
    int _2131 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2133 = _2131 != 0;
    int _2135 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2137 = _2135 != 0;
    int _2139 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2141 = _2139 != 0;
    int _2143 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2145 = _2143 != 0;
    float _2147 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2149 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2151 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2153 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2151;
    float _2155 = _2091 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _2157 = -_2147;
    float _2159 = fma(_710, 2.0, _2157);
    float _2161 = fma(_740, -2.0, _2149);
    float _2163 = _2091 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _2165 = _2091 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _2167 = _2153 * _1211;
    float _2169 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2171 = _2169 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2173 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2175 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2173;
    float _2177 = fma(_2089, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2163);
    float _2179 = _2171 * _1225;
    float _2181 = fma(_2089, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2165);
    float _2183 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2185 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2183;
    float _2187 = fma(_2089, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2155);
    float _2189 = _2175 * _2117;
    float _2191 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2193 = _2191 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2195 = _2185 * _1243;
    float _2197 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2199 = _2197 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2201 = _652 + _656;
    bool _2203 = _646 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2205 = isnan(_646);
    bool _2207 = _2203 || _2205;
    bool _2209 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2211 = _2207 || _2209;
    float _2213 = float(_2211);
    float _2215 = _656 + _666;
    float _2217 = _2193 * _1293;
    float _2219 = _2199 * _1309;
    float _2221 = _2201 + (-1.0);
    float _2223 = _2215 + (-1.0);
    bool _2225 = _646 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2227 = isnan(_646);
    bool _2229 = _2225 || _2227;
    bool _2231 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2233 = _2229 || _2231;
    float _2235 = float(_2233);
    float _2237 = -_2213;
    float _2239 = _2237 + 1.0;
    float _2241 = fma(_2093, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2181);
    float _2243 = fma(_2221, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _2245 = fma(_2093, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2187);
    float _2247 = _2235 * _2239;
    float _2249 = -_2235;
    float _2251 = _2249 + 1.0;
    bool _2253 = _646 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2255 = isnan(_646);
    bool _2257 = _2253 || _2255;
    bool _2259 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2261 = _2257 || _2259;
    float _2263 = float(_2261);
    float _2265 = fma(_2223, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _2267 = !_2129;
    int _2269 = _2267 ? 0 : 1;
    float _2271 = _1843 * _2251;
    bool _2273 = _646 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2275 = isnan(_646);
    bool _2277 = _2273 || _2275;
    bool _2279 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2281 = _2277 || _2279;
    float _2283 = float(_2281);
    float _2285 = _2263 * _1871;
    float _2287 = -_2263;
    float _2289 = _2287 + 1.0;
    float _2291 = fma(_2093, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2177);
    bool _2293 = _646 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2295 = isnan(_646);
    bool _2297 = _2293 || _2295;
    bool _2299 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2301 = _2297 || _2299;
    float _2303 = float(_2301);
    float _2305 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2307 = _646 + _2305;
    bool _2309 = _1493 >= 0.0;
    bool _2311 = isnan(_1493);
    bool _2313 = _2309 || _2311;
    bool _2315 = isnan(0.0);
    bool _2317 = _2313 || _2315;
    float _2319 = _2283 * _2289;
    bool _2321 = _646 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2323 = isnan(_646);
    bool _2325 = _2321 || _2323;
    bool _2327 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2329 = _2325 || _2327;
    float _2331 = float(_2329);
    float _2333 = -_2303;
    float _2335 = _2333 + 1.0;
    int _2337 = _2317 ? 0 : 1;
    float _2339 = fma(_2167, _2307, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _2341 = _1493 > 0.0;
    float _2343 = _2331 * _2335;
    bool _2345 = _646 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2347 = isnan(_646);
    bool _2349 = _2345 || _2347;
    bool _2351 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2353 = _2349 || _2351;
    float _2355 = float(_2353);
    float _2357 = -_2283;
    float _2359 = _2357 + 1.0;
    float _2361 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2363 = _646 + _2361;
    float _2365 = _2339 * _2343;
    float _2367 = -_2331;
    float _2369 = _2367 + 1.0;
    float _2371 = -_2355;
    float _2373 = _2371 + 1.0;
    float _2375 = _2355 * _2359;
    float _2377 = fma(_2179, _2363, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2379 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2381 = _646 + _2379;
    float _2383 = _2303 * _2373;
    float _2385 = fma(_2369, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2365);
    float _2387 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2389 = _646 + _2387;
    float _2391 = fma(_2189, _2381, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2393 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2395 = _646 + _2393;
    float _2397 = fma(_2377, _2383, _2385);
    float _2399 = fma(_2217, _2389, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    bool _2401 = !_1627;
    int _2403 = _2401 ? 0 : 1;
    float _2405 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2407 = _646 + _2405;
    float _2409 = fma(_2391, _2375, _2397);
    int _2411 = _1689 & 3;
    bool _2413 = _2411 != 0;
    float _2415 = fma(_2195, _2395, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2417 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2419 = _646 + _2417;
    float _2421 = fma(_2399, _2319, _2409);
    float _2423 = _2291 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _2425 = !_2413;
    int _2427 = _2425 ? 0 : 1;
    float _2429 = fma(_1395, _2419, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    int _2431 = _1825 & 3;
    bool _2433 = _2431 != 0;
    float _2435 = _2241 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _2437 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    bool _2439 = !_2433;
    int _2441 = _2439 ? 0 : 1;
    float _2443 = fma(_2415, _2285, _2421);
    float _2445 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _2447 = _1625 != 3;
    float _2449 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2451 = _2435 + _2449;
    int _2453 = ~_2337;
    int _2455 = _2453 + 1;
    int _2457 = _2455 + 1;
    float _2459 = -_2437;
    float _2461 = fma(_2033, 2.0, _2459);
    int _2463 = _2457;
    if (!_2341)
    {
        int _2465 = ~_2337;
        int _2467 = _2465 + 1;
        _2463 = _2467;
    }
    int _2469 = _2463;
    float _2471 = _2245 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2473 = fma(_1985, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2445);
    float _2475 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2477 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2479 = _2423 + _2477;
    float _2481 = _2451 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _2483 = !_2447;
    int _2485 = _2483 ? 0 : (-1);
    float _2487 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2489 = _2471 + _2487;
    bool _2491 = _1717 != 3;
    float _2493 = fma(_2479, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2481);
    float _2495 = fma(_1991, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2475);
    int _2497 = _1611 >> 31;
    float _2499 = fma(_2219, _2407, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    bool _2501 = !_2491;
    int _2503 = _2501 ? 0 : (-1);
    float _2505 = -_150;
    float _2507 = fma(_2505, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2461);
    bool _2509 = _1865 != 3;
    float _2511 = fma(_2489, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2493);
    int _2513 = _2497 & 3;
    float _2515 = fma(_2499, _2271, _2443);
    int _2517 = _1689 >> 31;
    float _2519 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2473);
    bool _2521 = !_2509;
    int _2523 = _2521 ? 0 : (-1);
    float _2525 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2495);
    bool _2527 = _2511 >= 0.0;
    float _2529 = fma(_2429, _2247, _2515);
    int _2531 = _1611 + _2513;
    int _2533 = _2517 & 3;
    float _2535 = fma(_2213, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2529);
    int _2537 = _2531 >> 2;
    int _2539 = _1689 + _2533;
    float _2541 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _2543 = _2537 << 4;
    int _2545 = _2543 + 368;
    out.m_65.x = _2535;
    int _2547 = _2539 >> 2;
    float _2549 = -_2541;
    float _2551 = fma(_1989, 2.0, _2549);
    int _2553 = _1825 >> 31;
    uint _2555 = uint(int(uint(_2545) >> uint(2)));
    uint _2557 = uint(int(uint(int(_2555)) >> uint(2)));
    int _2559 = int(_2555) & 3;
    float _2561 = (*spvDescriptorSet0.vp_c9)._m0[int(_2557)][_2559];
    int _2563 = int(_2555) + 1;
    uint _2565 = uint(int(uint(_2563) >> uint(2)));
    int _2567 = _2563 & 3;
    float _2569 = (*spvDescriptorSet0.vp_c9)._m0[int(_2565)][_2567];
    int _2571 = _2547 << 4;
    int _2573 = _2571 + 512;
    float _2575 = -_150;
    float _2577 = fma(_2575, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2551);
    float _2579 = _2519;
    if (_2527)
    {
        out.m_51.x = 0.0;
    }
    int _2581 = abs(_2269);
    float _2583 = _1987 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _2585 = _2553 & 3;
    uint _2587 = uint(int(uint(_2573) >> uint(2)));
    uint _2589 = uint(int(uint(int(_2587)) >> uint(2)));
    int _2591 = int(_2587) & 3;
    float _2593 = (*spvDescriptorSet0.vp_c9)._m0[int(_2589)][_2591];
    int _2595 = int(_2587) + 1;
    uint _2597 = uint(int(uint(_2595) >> uint(2)));
    int _2599 = _2595 & 3;
    float _2601 = (*spvDescriptorSet0.vp_c9)._m0[int(_2597)][_2599];
    float _2603 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2605 = float(_2469);
    int _2607 = _1825 + _2585;
    float _2609 = fma(_2583, -2.0, _2603);
    float _2611 = float(_2581);
    float _2613 = in.m_67.x;
    float _2615 = in.m_67.y;
    float _2617 = in.m_67.z;
    int _2619 = _2607 >> 2;
    int _2621 = _2545 + 8;
    uint _2623 = uint(int(uint(_2621) >> uint(2)));
    uint _2625 = uint(int(uint(int(_2623)) >> uint(2)));
    int _2627 = int(_2623) & 3;
    float _2629 = (*spvDescriptorSet0.vp_c9)._m0[int(_2625)][_2627];
    int _2631 = int(_2623) + 1;
    uint _2633 = uint(int(uint(_2631) >> uint(2)));
    int _2635 = _2631 & 3;
    float _2637 = (*spvDescriptorSet0.vp_c9)._m0[int(_2633)][_2635];
    bool _2639 = !_2133;
    int _2641 = _2639 ? 0 : 1;
    float _2643 = _2611 * _2605;
    int _2645 = _2619 << 4;
    int _2647 = _2645 + 656;
    float _2649 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2609);
    int _2651 = abs(_2641);
    float _2653 = _2643 * (-2.0);
    float _2655 = float(_2087);
    uint _2657 = uint(int(uint(_2647) >> uint(2)));
    uint _2659 = uint(int(uint(int(_2657)) >> uint(2)));
    int _2661 = int(_2657) & 3;
    float _2663 = (*spvDescriptorSet0.vp_c9)._m0[int(_2659)][_2661];
    int _2665 = int(_2657) + 1;
    uint _2667 = uint(int(uint(_2665) >> uint(2)));
    int _2669 = _2665 & 3;
    float _2671 = (*spvDescriptorSet0.vp_c9)._m0[int(_2667)][_2669];
    float _2673 = float(_2651);
    float _2675 = 0.0;
    if (_2527)
    {
        _2675 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2677 = _2675;
    float _2679 = fma(_2243, _2653, _2243);
    int _2681 = ~_1993;
    int _2683 = _2681 + _2049;
    int _2685 = _2683 + 1;
    float _2687 = _2673 * _2655;
    int _2689 = ~_2009;
    int _2691 = _2689 + _2125;
    int _2693 = _2691 + 1;
    if (_2527)
    {
        float _2695 = _2677 * 5.0;
        _2081 = as_type<int>(_2695);
    }
    int _2697 = _2081;
    int _2699 = abs(_2427);
    float _2701 = _2687 * (-2.0);
    int _2703 = abs(_1723);
    int _2705 = _879 * _2693;
    int _2707 = _2705 + _1453;
    if (_2527)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _8991 = as_type<float>(_2697);
        out.gl_Position.z = _8991;
    }
    float _2709 = fma(_2653, _2613, _2613);
    int _2711 = abs(_1699);
    int _2713 = _714 * _2685;
    int _2715 = _2713 + _1231;
    int _2717 = abs(_1855);
    int _2719 = _2573 + 8;
    uint _2721 = uint(int(uint(_2719) >> uint(2)));
    uint _2723 = uint(int(uint(int(_2721)) >> uint(2)));
    int _2725 = int(_2721) & 3;
    float _2727 = (*spvDescriptorSet0.vp_c9)._m0[int(_2723)][_2725];
    int _2729 = int(_2721) + 1;
    uint _2731 = uint(int(uint(_2729) >> uint(2)));
    int _2733 = _2729 & 3;
    float _2735 = (*spvDescriptorSet0.vp_c9)._m0[int(_2731)][_2733];
    int _2737 = ~_2711;
    int _2739 = _2737 + 1;
    int _2741 = _2739 + 1;
    int _2743 = abs(_1963);
    int _2745 = abs(_1711);
    float _2747 = fma(_2701, _2615, _2615);
    int _2749 = ~_2717;
    int _2751 = _2749 + 1;
    int _2753 = _2751 + 1;
    int _2755 = _2741 * as_type<int>(_2569);
    int _2757 = abs(_2403);
    int _2759 = _2647 + 8;
    uint _2761 = uint(int(uint(_2759) >> uint(2)));
    uint _2763 = uint(int(uint(int(_2761)) >> uint(2)));
    int _2765 = int(_2761) & 3;
    float _2767 = (*spvDescriptorSet0.vp_c9)._m0[int(_2763)][_2765];
    int _2769 = int(_2761) + 1;
    uint _2771 = uint(int(uint(_2769) >> uint(2)));
    int _2773 = _2769 & 3;
    float _2775 = (*spvDescriptorSet0.vp_c9)._m0[int(_2771)][_2773];
    int _2777 = ~_2699;
    int _2779 = _2777 + 1;
    int _2781 = _2779 + 1;
    int _2783 = _2753 * as_type<int>(_2601);
    int _2785 = ~_2757;
    int _2787 = _2785 + 1;
    int _2789 = _2787 + 1;
    float _2791 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2793 = int(_2791);
    int _2795 = ~_2745;
    int _2797 = _2795 + 1;
    int _2799 = _2797 + 1;
    int _2801 = _2781 * as_type<int>(_2593);
    int _2803 = _2801 + _2783;
    int _2805 = ~_2743;
    int _2807 = _2805 + 1;
    int _2809 = _2807 + 1;
    int _2811 = _2789 * as_type<int>(_2561);
    int _2813 = _2811 + _2755;
    int _2815 = abs(_2441);
    float _2817 = fma(_2265, _2701, _2265);
    bool _2819 = _714 == 0;
    int _2821 = _2799 * as_type<int>(_2629);
    int _2823 = _2821 + _2813;
    int _2825 = abs(_2485);
    float _2827 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2829 = int(_2827);
    int _2831 = ~_2815;
    int _2833 = _2831 + 1;
    int _2835 = _2833 + 1;
    int _2837 = ~_2825;
    int _2839 = _2837 + 1;
    int _2841 = _2839 + 1;
    int _2843 = _2809 * as_type<int>(_2671);
    float _2845 = float(uint(_2793));
    int _2847 = _2841 * as_type<int>(_2637);
    int _2849 = _2847 + _2823;
    int _2851 = abs(_1765);
    float _2853 = 1.0 / _2845;
    int _2855 = _2835 * as_type<int>(_2663);
    int _2857 = _2855 + _2843;
    int _2859 = ~_2703;
    int _2861 = _2859 + 1;
    int _2863 = _2861 + 1;
    float _2865 = -_150;
    float _2867 = fma(_2865, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2159);
    int _2869 = ~_2851;
    int _2871 = _2869 + 1;
    int _2873 = _2871 + 1;
    int _2875 = abs(_2503);
    int _2877 = _2849 * _2863;
    int _2879 = abs(_1957);
    float _2881 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _2883 = int(_2881);
    int _2885 = ~_2875;
    int _2887 = _2885 + 1;
    int _2889 = _2887 + 1;
    int _2891 = _2121 * _2703;
    int _2893 = _2891 + _2877;
    int _2895 = ~_2879;
    int _2897 = _2895 + 1;
    int _2899 = _2897 + 1;
    int _2901 = _2873 * as_type<int>(_2727);
    int _2903 = _2901 + _2803;
    int _2905 = abs(_2523);
    int _2907 = as_type<int>(_2853) + (-2);
    int _2909 = _2889 * as_type<int>(_2735);
    int _2911 = _2909 + _2903;
    float _2913 = float(uint(_2893));
    float _2915 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2917 = log2(_2915);
    float _2919 = float(uint(_2829));
    bool _2921 = !_2145;
    int _2923 = _2921 ? 0 : 1;
    float _2925 = as_type<float>(_2907) * _2913;
    int _2927 = _2899 * as_type<int>(_2767);
    int _2929 = _2927 + _2857;
    bool _2931 = !_2141;
    int _2933 = _2931 ? 0 : 1;
    int _2935 = ~_2905;
    int _2937 = _2935 + 1;
    int _2939 = _2937 + 1;
    float _2941 = 1.0 / _2919;
    int _2943 = abs(_2933);
    int _2945 = abs(_2923);
    int _2947 = _2939 * as_type<int>(_2775);
    int _2949 = _2947 + _2929;
    int _2951 = ~_2943;
    int _2953 = _2951 + 1;
    int _2955 = _2953 + 1;
    bool _2957 = !_2819;
    int _2959 = _2957 ? _2715 : (-1);
    float _2961 = trunc(_2925);
    float _2963 = precise::max(_2961, 0.0);
    uint _2965 = uint(_2963);
    int _2967 = abs(_2793);
    int _2969 = _2955 * _2911;
    float _2971 = float(uint(_2883));
    float _2973 = _2917 * _150;
    int _2975 = ~_2793;
    int _2977 = _2975 + 1;
    int _2979 = _2959 * _2943;
    int _2981 = _2979 + _2969;
    int _2983 = ~_2945;
    int _2985 = _2983 + 1;
    int _2987 = _2985 + 1;
    float _2989 = exp2(_2973);
    float _2991 = float(uint(_2967));
    int _2993 = abs(_2829);
    int _2995 = _2987 * _2949;
    bool _2997 = !_1389;
    int _2999 = _2997 ? _2707 : (-1);
    float _3001 = float(uint(_2993));
    int _3003 = _2977 * int(_2965);
    int _3005 = _3003 + _2893;
    float _3007 = 1.0 / _2971;
    int _3009 = abs(_2883);
    int _3011 = as_type<int>(_2941) + (-2);
    float _3013 = float(uint(_3005));
    int _3015 = _2999 * _2945;
    int _3017 = _3015 + _2995;
    float _3019 = float(uint(_2981));
    float _3021 = 1.0 / _2991;
    float _3023 = float(uint(_3009));
    float _3025 = as_type<float>(_2907) * _3013;
    float _3027 = as_type<float>(_3011) * _3019;
    float _3029 = -_2989;
    float _3031 = _3029 + 1.0;
    int _3033 = abs(_2893);
    float _3035 = 1.0 / _3001;
    float _3037 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _3039 = 1.0 + _3037;
    float _3041 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _3043 = as_type<int>(_3007) + (-2);
    float _3045 = float(uint(_3017));
    float _3047 = fma(_652, (*spvDescriptorSet0.vp_c9)._m0[78].z, _3041);
    float _3049 = 1.0 / _3023;
    int _3051 = as_type<int>(_3021) + (-2);
    float _3053 = float(uint(_3033));
    float _3055 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _3057 = abs(_2981);
    int _3059 = abs(_3017);
    float _3061 = trunc(_3027);
    float _3063 = precise::max(_3061, 0.0);
    uint _3065 = uint(_3063);
    float _3067 = fma(_656, (*spvDescriptorSet0.vp_c9)._m0[78].w, _3055);
    bool _3069 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3071 = isnan(1.0);
    bool _3073 = _3069 || _3071;
    bool _3075 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3077 = _3073 || _3075;
    float _3079 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    int _3081 = as_type<int>(_3035) + (-2);
    float _3083 = 1.0 / _3039;
    float _3085 = float(uint(_3057));
    float _3087 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    bool _3089 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3091 = isnan(0.0);
    bool _3093 = _3089 || _3091;
    bool _3095 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3097 = _3093 || _3095;
    float _3099 = fma(_652, (*spvDescriptorSet0.vp_c9)._m0[88].z, _3079);
    int _3101 = ~_2829;
    int _3103 = _3101 + 1;
    float _3105 = as_type<float>(_3081) * _3085;
    int _3107 = as_type<int>(_3049) + (-2);
    float _3109 = fma(_656, (*spvDescriptorSet0.vp_c9)._m0[88].w, _3087);
    float _3111 = as_type<float>(_3043) * _3045;
    float _3113 = as_type<float>(_3051) * _3053;
    float _3115 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[77].z, _3047);
    float _3117 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2161);
    float _3119 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[77].w, _3067);
    float _3121 = trunc(_3111);
    float _3123 = precise::max(_3121, 0.0);
    uint _3125 = uint(_3123);
    float _3127 = float(uint(_3059));
    int _3129 = _3103 * int(_3065);
    int _3131 = _3129 + _2981;
    float _3133 = _3097 ? _3031 : 0.0;
    float _3135 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[87].z, _3099);
    int _3137 = ~_2883;
    int _3139 = _3137 + 1;
    float _3141 = as_type<float>(_3107) * _3127;
    float _3143 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[87].w, _3109);
    float _3145 = trunc(_3113);
    float _3147 = precise::max(_3145, 0.0);
    uint _3149 = uint(_3147);
    if (_3077)
    {
        float _3151 = _3133 * _3083;
        _152 = _3151;
    }
    float _3153 = _152;
    float _3155 = float(uint(_3131));
    float _3157 = _2451 * _2451;
    int _3159 = ~_2829;
    int _3161 = _3159 + 1;
    float _3163 = fma(_2479, _2479, _3157);
    float _3165 = trunc(_3105);
    float _3167 = precise::max(_3165, 0.0);
    uint _3169 = uint(_3167);
    int _3171 = _3139 * int(_3125);
    int _3173 = _3171 + _3017;
    float _3175 = as_type<float>(_3011) * _3155;
    int _3177 = ~_2993;
    int _3179 = _3177 + 1;
    float _3181 = fma(_2489, _2489, _3163);
    float _3183 = float(uint(_3173));
    float _3185 = trunc(_3141);
    float _3187 = precise::max(_3185, 0.0);
    uint _3189 = uint(_3187);
    float _3191 = as_type<float>(_3043) * _3183;
    float _3193 = trunc(_3025);
    float _3195 = precise::max(_3193, 0.0);
    uint _3197 = uint(_3195);
    int _3199 = ~_3009;
    int _3201 = _3199 + 1;
    int _3203 = _3179 * int(_3169);
    int _3205 = _3203 + _3057;
    float _3207 = rsqrt(_3181);
    int _3209 = ~_2967;
    int _3211 = _3209 + 1;
    int _3213 = _3201 * int(_3189);
    int _3215 = _3213 + _3059;
    int _3217 = _3211 * int(_3149);
    int _3219 = _3217 + _3033;
    float _3221 = float(uint(_3215));
    float _3223 = trunc(_3175);
    float _3225 = precise::max(_3223, 0.0);
    uint _3227 = uint(_3225);
    float _3229 = float(uint(_3219));
    float _3231 = as_type<float>(_3107) * _3221;
    int _3233 = int(_2965) + int(_3197);
    float _3235 = float(uint(_3205));
    float _3237 = as_type<float>(_3051) * _3229;
    float _3239 = _654 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _3241 = trunc(_3191);
    float _3243 = precise::max(_3241, 0.0);
    uint _3245 = uint(_3243);
    int _3247 = ~_2793;
    int _3249 = _3247 + 1;
    float _3251 = as_type<float>(_3081) * _3235;
    float _3253 = _3239 * _3207;
    float _3255 = _652 + (-0.5);
    int _3257 = int(_3065) + int(_3227);
    float _3259 = _2451 * _3253;
    float _3261 = trunc(_3237);
    float _3263 = precise::max(_3261, 0.0);
    uint _3265 = uint(_3263);
    float _3267 = _2479 * _3253;
    float _3269 = fma(_3255, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2709);
    float _3271 = -_3259;
    float _3273 = _2451 + _3271;
    int _3275 = _3249 * _3233;
    int _3277 = _3275 + _2893;
    float _3279 = -_3267;
    float _3281 = _2479 + _3279;
    int _3283 = _3161 * _3257;
    int _3285 = _3283 + _2981;
    float _3287 = _3273 * _3273;
    float _3289 = trunc(_3251);
    float _3291 = precise::max(_3289, 0.0);
    uint _3293 = uint(_3291);
    int _3295 = int(_3125) + int(_3245);
    float _3297 = fma(_2679, _3153, _3269);
    int _3299 = ~_2883;
    int _3301 = _3299 + 1;
    float _3303 = fma(_3281, _3281, _3287);
    bool _3305 = uint(_3277) >= uint(_2793);
    bool _3307 = uint(_3285) >= uint(_2829);
    float _3309 = trunc(_3231);
    float _3311 = precise::max(_3309, 0.0);
    uint _3313 = uint(_3311);
    int _3315 = int(_3149) + int(_3265);
    int _3317 = _3301 * _3295;
    int _3319 = _3317 + _3017;
    int _3321 = ~_2967;
    int _3323 = _3321 + 1;
    int _3325 = ~_3009;
    int _3327 = _3325 + 1;
    bool _3329 = uint(_3319) >= uint(_2883);
    int _3331 = _3323 * _3315;
    int _3333 = _3331 + _3033;
    int _3335 = int(_3169) + int(_3293);
    float _3337 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _3339 = ~_2993;
    int _3341 = _3339 + 1;
    bool _3343 = uint(_3333) >= uint(_2967);
    bool _3345 = !_3305;
    int _3347 = _3345 ? 0 : (-1);
    int _3349 = _3341 * _3335;
    int _3351 = _3349 + _3057;
    int _3353 = int(_3189) + int(_3313);
    float _3355 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _3357 = ~_3233;
    int _3359 = _3357 + _3347;
    int _3361 = _3359 + 1;
    bool _3363 = uint(_3351) >= uint(_2993);
    int _3365 = _3327 * _3353;
    int _3367 = _3365 + _3059;
    bool _3369 = !_3307;
    int _3371 = _3369 ? 0 : (-1);
    int _3373 = _2793 * _3361;
    int _3375 = _3373 + _2893;
    bool _3377 = !_3329;
    int _3379 = _3377 ? 0 : (-1);
    float _3381 = _3337 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _3383 = ~_3257;
    int _3385 = _3383 + _3371;
    int _3387 = _3385 + 1;
    float _3389 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _3391 = uint(_3367) >= uint(_3009);
    float _3393 = fma(_3381, _931, -0.5);
    bool _3395 = _2793 == 0;
    int _3397 = _2893 ^ _2793;
    bool _3399 = !_3363;
    int _3401 = _3399 ? 0 : (-1);
    float _3403 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _3405 = !_3391;
    int _3407 = _3405 ? 0 : (-1);
    int _3409 = _2981 ^ _2829;
    int _3411 = _2829 * _3387;
    int _3413 = _3411 + _2981;
    bool _3415 = _2829 == 0;
    bool _3417 = _2829 == 0;
    float _3419 = _3389 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _3421 = ~_3295;
    int _3423 = _3421 + _3379;
    int _3425 = _3423 + 1;
    bool _3427 = !_3395;
    int _3429 = _3427 ? _3375 : (-1);
    bool _3431 = !_3415;
    int _3433 = _3431 ? _3413 : (-1);
    int _3435 = _2883 * _3425;
    int _3437 = _3435 + _3017;
    float _3439 = float(_3429);
    int _3441 = _3017 ^ _2883;
    bool _3443 = !_3343;
    int _3445 = _3443 ? 0 : (-1);
    float _3447 = fma(_3381, _3439, _2867);
    bool _3449 = _2883 == 0;
    float _3451 = _3355 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _3453 = _2793 == 0;
    float _3455 = fma(_3115, _3393, _3447);
    bool _3457 = _2883 == 0;
    float _3459 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _3461 = _3403 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _3463 = float(_3433);
    float _3465 = fma(_3451, _1591, -0.5);
    uint _3467 = uint(int(uint(_3397) >> uint(31)));
    float _3469 = fma(_3461, _756, -0.5);
    uint _3471 = uint(int(uint(_3409) >> uint(31)));
    float _3473 = fma(_3461, _3463, _2577);
    uint _3475 = uint(int(uint(_3441) >> uint(31)));
    float _3477 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _3479 = !_3449;
    int _3481 = _3479 ? _3437 : (-1);
    float _3483 = fma(_2519, _3469, _3473);
    int _3485 = ~_3445;
    int _3487 = _3315 + _3485;
    int _3489 = _3487 + 1;
    int _3491 = ~int(_3467);
    int _3493 = _3491 + 1;
    int _3495 = ~_3401;
    int _3497 = _3335 + _3495;
    int _3499 = _3497 + 1;
    int _3501 = ~_3407;
    int _3503 = _3353 + _3501;
    int _3505 = _3503 + 1;
    int _3507 = ~int(_3471);
    int _3509 = _3507 + 1;
    int _3511 = ~int(_3475);
    int _3513 = _3511 + 1;
    float _3515 = float(_3481);
    float _3517 = _3477 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _3519 = _3489 ^ _3493;
    int _3521 = _3499 ^ _3509;
    float _3523 = fma(_3451, _3515, _2507);
    int _3525 = _3505 ^ _3513;
    float _3527 = _3459 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _3529 = ~_3493;
    int _3531 = _3529 + _3519;
    int _3533 = _3531 + 1;
    float _3535 = fma(_1175, _3419, -0.5);
    int _3537 = ~_3509;
    int _3539 = _3537 + _3521;
    int _3541 = _3539 + 1;
    float _3543 = fma(_1227, _3527, -0.5);
    int _3545 = ~_3513;
    int _3547 = _3545 + _3525;
    int _3549 = _3547 + 1;
    float _3551 = fma(_3517, _1535, -0.5);
    bool _3553 = !_3453;
    int _3555 = _3553 ? _3533 : (-1);
    float _3557 = fma(_3135, _3465, _3523);
    bool _3559 = !_3417;
    int _3561 = _3559 ? _3541 : (-1);
    bool _3563 = !_3457;
    int _3565 = _3563 ? _3549 : (-1);
    float _3567 = _3557 + 0.5;
    float _3569 = float(_3555);
    float _3571 = float(_3561);
    float _3573 = float(_3565);
    float _3575 = -_3117;
    float _3577 = fma(_3419, _3569, _3575);
    float _3579 = _2489 * _3253;
    float _3581 = -_2649;
    float _3583 = fma(_3527, _3571, _3581);
    float _3585 = _3483 + 0.5;
    float _3587 = -_2077;
    float _3589 = fma(_3517, _3573, _3587);
    float _3591 = fma(_3119, _3535, _3577);
    float _3593 = fma(_2525, _3543, _3583);
    float _3595 = _3455 + 0.5;
    float _3597 = fma(_3143, _3551, _3589);
    float _3599 = _3591 + 0.5;
    float _3601 = _3593 + 0.5;
    float _3603 = -_3579;
    float _3605 = _2489 + _3603;
    float _3607 = _3597 + 0.5;
    float _3609 = _656 + (-0.5);
    bool _3611 = !_2137;
    int _3613 = _3611 ? 0 : 1;
    out.m_69.x = _3595;
    out.m_69.y = _3599;
    out.m_69.z = _3585;
    out.m_69.w = _3601;
    float _3615 = fma(_3605, _3605, _3303);
    out.m_71.x = _3567;
    out.m_71.y = _3607;
    float _3617 = as_type<float>(_3541);
    if (_2527)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3619 = -_3259;
    float _3621 = _2435 + _3619;
    int _3623 = abs(_3613);
    float _3625 = -_3267;
    float _3627 = _2423 + _3625;
    float _3629 = float(_2115);
    float _3631 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3633 = _3621 + _3631;
    float _3635 = -_3579;
    float _3637 = _2471 + _3635;
    float _3639 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3641 = _3627 + _3639;
    float _3643 = fma(_3609, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2747);
    float _3645 = _3633 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3647 = _652 + _666;
    float _3649 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3651 = _3637 + _3649;
    float _3653 = fma(_2817, _3153, _3643);
    float _3655 = fma(_3641, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3645);
    float _3657 = float(_3623);
    float _3659 = _3647 + (-1.0);
    float _3661 = fma(_3651, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3655);
    float _3663 = _666 + (-0.5);
    float _3665 = _3657 * _3629;
    float _3667 = _3297 * 0.15915493667125701904296875;
    float _3669 = fma(_3659, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _3671 = _3661 >= 0.0;
    float _3673 = _3665 * (-2.0);
    float _3675 = _3653 * 0.15915493667125701904296875;
    float _3677 = sqrt(_3615);
    float _3679 = fma(_3673, _2617, _2617);
    float _3681 = fma(_3669, _3673, _3669);
    float _3683 = fma(_3663, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3679);
    float _3685 = _3667 * 6.283185482025146484375;
    float _3687 = sin(_3685);
    float _3689 = fma(_3681, _3153, _3683);
    float _3691 = (*spvDescriptorSet0.vp_c9)._m0[198].z;
    float _3693 = _3651;
    if (_3671)
    {
        _3691 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3695 = _3691;
    int _3697 = as_type<int>(_3695);
    if (_3671)
    {
        out.m_51.x = 0.0;
    }
    float _3699 = _3689 * 0.15915493667125701904296875;
    float _3701 = _3667 * 6.283185482025146484375;
    float _3703 = cos(_3701);
    if (_3671)
    {
        float _3705 = _3695 * 5.0;
        _3697 = as_type<int>(_3705);
    }
    int _3707 = _3697;
    if (_3671)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _10426 = as_type<float>(_3707);
        out.gl_Position.z = _10426;
    }
    float _3709 = _3675 * 6.283185482025146484375;
    float _3711 = sin(_3709);
    float _3713 = _3675 * 6.283185482025146484375;
    float _3715 = cos(_3713);
    float _3717 = _3699 * 6.283185482025146484375;
    float _3719 = sin(_3717);
    if (_3671)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3721 = -_2435;
    float _3723 = _3721 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3725 = -_2423;
    float _3727 = _3725 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3729 = in.m_73.x;
    float _3731 = in.m_73.y;
    float _3733 = in.m_73.z;
    float _3735 = -_2471;
    float _3737 = _3735 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3739 = _3723 * _3723;
    float _3741 = _3699 * 6.283185482025146484375;
    float _3743 = cos(_3741);
    float _3745 = _3687 * _3711;
    float _3747 = _3703 * _3715;
    float _3749 = fma(_3727, _3727, _3739);
    float _3751 = _3207 * _3677;
    float _3753 = _488 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3755 = fma(_3719, _3747, _3745);
    float _3757 = fma(_3737, _3737, _3749);
    float _3759 = fma(_3719, _3745, _3747);
    float _3761 = _3687 * _3715;
    float _3763 = rsqrt(_3757);
    float _3765 = _3703 * _3711;
    float _3767 = _506 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _3769 = _3715 * _3743;
    float _3771 = _3751 * _3753;
    float _3773 = _3687 * _3743;
    float _3775 = _654 * _3751;
    float _3777 = -_3765;
    float _3779 = fma(_3719, _3761, _3777);
    float _3781 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _3731);
    float _3783 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _3729);
    float _3785 = -_3761;
    float _3787 = fma(_3719, _3765, _3785);
    float _3789 = _3703 * _3743;
    float _3791 = _3781 * _3771;
    float _3793 = _3711 * _3743;
    float _3795 = _3727 * _3763;
    float _3797 = in.m_75.x;
    float _3799 = in.m_75.y;
    float _3801 = in.m_75.z;
    float _3803 = _3737 * _3763;
    float _3805 = _3783 * _3775;
    float _3807 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _3809 = _3795 * _3807;
    float _3811 = _3751 * _3767;
    float _3813 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _3733);
    bool _3815 = _3731 != 0.0;
    bool _3817 = isnan(_3731);
    bool _3819 = _3815 || _3817;
    bool _3821 = isnan(0.0);
    bool _3823 = _3819 || _3821;
    float _3825 = _3723 * _3763;
    float _3827 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3829 = _3803 * _3827;
    float _3831 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _3833 = -_3809;
    float _3835 = fma(_3803, _3831, _3833);
    float _3837 = _3813 * _3811;
    bool _3839 = _3729 == 0.0;
    bool _3841 = !_3823;
    bool _3843 = _3839 && _3841;
    float _3845 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _3847 = _3825 * _3845;
    float _3849 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _3851 = -_3829;
    float _3853 = fma(_3825, _3849, _3851);
    float _3855 = _3835 * _3835;
    bool _3857 = _3733 == 0.0;
    bool _3859 = _3857 && _3843;
    float _3861 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3863 = -_3847;
    float _3865 = fma(_3795, _3861, _3863);
    float _3867 = in.m_77.x;
    float _3869 = in.m_77.y;
    float _3871 = in.m_77.z;
    float _3873 = in.m_77.w;
    float _3875 = fma(_3853, _3853, _3855);
    float _3877 = -_3791;
    float _3879 = _3719 * _3877;
    float _3881 = _3789 * _3791;
    float _3883 = _3773 * _3791;
    float _3885 = fma(_3865, _3865, _3875);
    float _3887 = fma(_3769, _3805, _3879);
    float _3889 = fma(_3755, _3805, _3881);
    float _3891 = fma(_3779, _3805, _3883);
    float _3893 = rsqrt(_3885);
    float _3895 = _3805;
    float _3897 = _3881;
    float _3899 = _3797;
    float _3901 = _3875;
    if (_3859)
    {
        _3895 = _3797;
    }
    float _3903 = _3895;
    float _3905 = fma(_3787, _3837, _3889);
    float _3907 = _3903;
    if (_3859)
    {
        _2579 = _3799;
    }
    float _3909 = _2579;
    float _3911 = _3909;
    if (_3859)
    {
        _3897 = _3903;
    }
    float _3913 = _3897;
    float _3915 = _3913;
    if (!_3859)
    {
        _3907 = _3797;
    }
    float _3917 = _3907;
    if (_3859)
    {
        _3899 = _3909;
    }
    float _3919 = _3899;
    float _3921 = _3919;
    if (_3859)
    {
        _3617 = _3801;
    }
    float _3923 = _3617;
    float _3925 = _3923;
    if (!_3859)
    {
        float _3927 = fma(_3729, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3917);
        _3915 = _3927;
    }
    float _3929 = _3915;
    if (!_3859)
    {
        _3911 = _3799;
    }
    float _3931 = _3911;
    float _3933 = fma(_3793, _3837, _3887);
    if (_3859)
    {
        _3901 = _3923;
    }
    float _3935 = _3901;
    float _3937 = _3835 * _3893;
    float _3939 = _3935;
    if (!_3859)
    {
        _3925 = _3801;
    }
    float _3941 = _3925;
    if (!_3859)
    {
        float _3943 = fma(_3731, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3931);
        _3921 = _3943;
    }
    float _3945 = _3921;
    float _3947 = _3871 * _3917;
    float _3949 = _3853 * _3893;
    float _3951 = fma(_3759, _3837, _3891);
    float _3953 = _3865 * _3893;
    float _3955 = -_3947;
    float _3957 = fma(_3867, _3941, _3955);
    float _3959 = _3869 * _3941;
    float _3961 = _3803 * _3937;
    float _3963 = _3825 * _3949;
    if (!_3859)
    {
        float _3965 = fma(_3733, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3941);
        _3939 = _3965;
    }
    float _3967 = _3939;
    float _3969 = _3867 * _3931;
    float _3971 = -_3959;
    float _3973 = fma(_3871, _3931, _3971);
    float _3975 = -_3961;
    float _3977 = fma(_3825, _3953, _3975);
    float _3979 = -_3963;
    float _3981 = fma(_3795, _3937, _3979);
    float _3983 = -_3969;
    float _3985 = fma(_3869, _3917, _3983);
    float _3987 = _3957 * _3873;
    float _3989 = _3977 * _3905;
    float _3991 = _3981 * _3905;
    float _3993 = _3973 * _3873;
    float _3995 = _3985 * _3873;
    float _3997 = _3795 * _3953;
    float _3999 = fma(_3949, _3933, _3989);
    float _4001 = fma(_3953, _3933, _3991);
    float _4003 = _3755 * _3977;
    float _4005 = -_3997;
    float _4007 = fma(_3803, _3949, _4005);
    float _4009 = fma(_3795, _3951, _3999);
    float _4011 = fma(_3803, _3951, _4001);
    float _4013 = _3755 * _3981;
    float _4015 = _3755 * _4007;
    float _4017 = _2423 + _4009;
    float _4019 = _2471 + _4011;
    float _4021 = _3789 * _3977;
    float _4023 = _3789 * _4007;
    float _4025 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _4027 = _4017 + _4025;
    float _4029 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _4031 = _4019 + _4029;
    float _4033 = _3789 * _3981;
    float _4035 = _3787 * _3977;
    float _4037 = _4027 * _4027;
    float _4039 = _4031 * _4031;
    float _4041 = _3787 * _3981;
    float _4043 = _3787 * _4007;
    float _4045 = _4007 * _3905;
    float _4047 = _4037 + _4039;
    float _4049 = fma(_3769, _3949, _4003);
    float _4051 = fma(_3769, _3937, _4015);
    float _4053 = fma(_3769, _3953, _4013);
    float _4055 = -_3719;
    float _4057 = fma(_4055, _3949, _4021);
    float _4059 = sqrt(_4047);
    float _4061 = fma(_3793, _3949, _4035);
    float _4063 = -_3719;
    float _4065 = fma(_4063, _3937, _4023);
    float _4067 = fma(_3793, _3937, _4043);
    float _4069 = fma(_3937, _3933, _4045);
    float _4071 = -_3719;
    float _4073 = fma(_4071, _3953, _4033);
    float _4075 = fma(_3793, _3953, _4041);
    float _4077 = fma(_3779, _3803, _4053);
    float _4079 = fma(_3773, _3795, _4057);
    float _4081 = fma(_3773, _3825, _4065);
    float _4083 = fma(_3825, _3951, _4069);
    float _4085 = fma(_3779, _3795, _4049);
    float _4087 = fma(_3779, _3825, _4051);
    float _4089 = fma(_3773, _3803, _4073);
    float _4091 = fma(_3759, _3795, _4061);
    float _4093 = fma(_3759, _3803, _4075);
    bool _4095 = _4059 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4097 = fma(_3759, _3825, _4067);
    float _4099 = _2435 + _4083;
    float _4101 = _4079 * _3869;
    float _4103 = _4081 * _3869;
    float _4105 = _4079 * _3945;
    float _4107 = _4081 * _3945;
    float _4109 = _3987 * _4079;
    float _4111 = _3987 * _4081;
    float _4113 = _4089 * _3869;
    float _4115 = _4089 * _3945;
    float _4117 = _3987 * _4089;
    float _4119 = _4089;
    float _4121 = _4037;
    float _4123 = _4039;
    float _4125 = _4017;
    float _4127 = _4019;
    float _4129 = _4097;
    if (!_4095)
    {
        _4119 = _4099;
    }
    float _4131 = _4119;
    bool _4133 = !_4095;
    float _4135 = _4131;
    if (!_4133)
    {
        float _4137 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4139 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _4141 = _4059 + _4139;
        float _4143 = rsqrt(_4047);
        float _4145 = _4141 * _4137;
        float _4147 = _4099 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4149 = _4145 * 0.15915493667125701904296875;
        float _4151 = _4149 * 6.283185482025146484375;
        float _4153 = sin(_4151);
        float _4155 = _4149 * 6.283185482025146484375;
        float _4157 = cos(_4155);
        float _4159 = fma(_4153, _4147, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _4161 = _4143 * _4159;
        float _4163 = fma(_4027, _4161, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _4165 = _4157 + (-1.0);
        float _4167 = fma(_4031, _4161, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _4169 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _4171 = _4163 + _4169;
        float _4173 = _4165 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4175 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _4177 = _4167 + _4175;
        float _4179 = _4171 * _4171;
        float _4181 = fma(_4099, _4157, _4173);
        float _4183 = _4177 * _4177;
        _4135 = _4181;
        _4121 = _4179;
        _4123 = _4183;
        _4125 = _4163;
        _4127 = _4167;
    }
    float _4185 = _4135;
    float _4187 = _4121;
    float _4189 = _4123;
    float _4191 = _4125;
    float _4193 = _4127;
    float _4195 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _4197 = _4185 + _4195;
    float _4199 = fma(_4085, _3867, _4101);
    float _4201 = fma(_4085, _3929, _4105);
    float _4203 = fma(_3993, _4085, _4109);
    float _4205 = fma(_4197, _4197, _4187);
    float _4207 = fma(_4087, _3867, _4103);
    float _4209 = fma(_4077, _3867, _4113);
    float _4211 = fma(_4087, _3929, _4107);
    float _4213 = _4205 + _4189;
    float _4215 = fma(_4077, _3929, _4115);
    float _4217 = fma(_3993, _4087, _4111);
    float _4219 = fma(_3993, _4077, _4117);
    float _4221 = fma(_4091, _3871, _4199);
    float _4223 = fma(_4097, _3871, _4207);
    float _4225 = sqrt(_4213);
    float _4227 = fma(_4091, _3967, _4201);
    float _4229 = fma(_3995, _4091, _4203);
    float _4231 = fma(_4093, _3871, _4209);
    float _4233 = fma(_4097, _3967, _4211);
    float _4235 = fma(_3995, _4097, _4217);
    float _4237 = fma(_3995, _4093, _4219);
    float _4239 = fma(_4093, _3967, _4215);
    out.m_79.x = _4221;
    out.m_79.y = _4223;
    out.m_79.z = _4231;
    out.m_81.x = _4229;
    out.m_81.y = _4235;
    out.m_81.z = _4237;
    out.m_83.x = _4227;
    out.m_83.y = _4233;
    out.m_83.z = _4239;
    bool _4241 = _4225 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _4243 = isnan(_4225);
    bool _4245 = _4241 || _4243;
    bool _4247 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _4249 = _4245 || _4247;
    float _4251 = _4223;
    if (!_4249)
    {
        _4129 = 1.0;
    }
    float _4253 = _4129;
    bool _4255 = !_4249;
    float _4257 = _4253;
    if (!_4255)
    {
        bool _4259 = _4225 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _4261 = isnan(_4225);
        bool _4263 = _4259 || _4261;
        bool _4265 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _4267 = _4263 || _4265;
        if (!_4267)
        {
            float _4269 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4271 = _4225 + _4269;
            float _4273 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4275 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _4273;
            float _4277 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _4279 = _4277 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _4281 = 1.0 / _4275;
            float _4283 = _4271 * _4281;
            float _4285 = fma(_4283, _4279, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _4257 = _4285;
            _4287 = true;
        }
        else
        {
            bool _4289 = _4225 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _4291 = isnan(_4225);
            bool _4293 = _4289 || _4291;
            bool _4295 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _4297 = _4293 || _4295;
            if (!_4297)
            {
                float _4299 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4301 = _4225 + _4299;
                float _4303 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4305 = _4303 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _4307 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _4309 = _4307 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _4311 = 1.0 / _4305;
                float _4313 = _4301 * _4311;
                float _4315 = fma(_4313, _4309, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _4257 = _4315;
                _4287 = true;
            }
            else
            {
                _4257 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _4287 = false;
    float _4317 = _4257;
    float _4319 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _4321 = _4191 + _4319;
    float _4323 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _4325 = _4185 + _4323;
    float _4327 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _4329 = _4193 + _4327;
    bool _4331 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _4333 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _4335 = _4331 || _4333;
    bool _4337 = isnan(0.5);
    bool _4339 = _4335 || _4337;
    float _4341 = fma(_4321, _4317, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _4343 = fma(_4325, _4317, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _4345 = fma(_4329, _4317, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _4347 = -_3267;
    float _4349 = _4347 + _4341;
    float _4351 = -_3259;
    float _4353 = _4351 + _4343;
    float _4355 = -_3579;
    float _4357 = _4355 + _4345;
    float _4359 = _4353;
    float _4361 = _4349;
    float _4363 = _4357;
    if (!_4339)
    {
        float _4365 = _3633 * _3633;
        float _4367 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _4369 = -_2471;
        float _4371 = _4369 + _4345;
        float _4373 = fma(_3641, _3641, _4365);
        float _4375 = fma(_3651, _3651, _4373);
        float _4377 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _4379 = sqrt(_4375);
        float _4381 = 1.0 / _3751;
        float _4383 = _4377 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _4385 = precise::min(_4379, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _4387 = _4385 * _4367;
        float _4389 = -_2423;
        float _4391 = _4389 + _4341;
        float _4393 = _4387 * _4381;
        float _4395 = -_2435;
        float _4397 = _4395 + _4343;
        float _4399 = _4383 * _4393;
        float _4401 = _4371 * _4393;
        float _4403 = fma(_4391, _4399, _3627);
        float _4405 = fma(_4397, _4399, _3621);
        float _4407 = fma(_4383, _4401, _3637);
        _4359 = _4405;
        _4361 = _4403;
        _4363 = _4407;
    }
    float _4409 = _4359;
    float _4411 = _4361;
    float _4413 = _4363;
    float _4415 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4417 = _4409 + _4415;
    float _4419 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4421 = _4411 + _4419;
    float _4423 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4425 = _4413 + _4423;
    float _4427 = _4417 * _4417;
    float _4429 = fma(_4421, _4421, _4427);
    float _4431 = fma(_4425, _4425, _4429);
    float _4433 = rsqrt(_4431);
    float _4435 = _4433 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4437 = _4421 * _4435;
    float _4439 = _4425 * _4435;
    float _4441 = _4437 * _4437;
    float _4443 = _4439 * _4439;
    float _4445 = _4441 + _4443;
    float _4447 = sqrt(_4445);
    bool _4449 = _4447 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4451 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4453 = _4447 + _4451;
    float _4455 = _4433;
    float _4457 = _4453;
    float _4459 = _4417;
    float _4461 = _4437;
    if (_4449)
    {
        float _4463 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4455 = _4463;
    }
    float _4465 = _4455;
    float _4467 = _4465;
    if (_4449)
    {
        float _4469 = _4453 * _4465;
        _4457 = _4469;
    }
    float _4471 = _4457;
    if (_4449)
    {
        float _4473 = rsqrt(_4445);
        _4467 = _4473;
    }
    float _4475 = _4467;
    float _4477 = _4475;
    if (_4449)
    {
        float _4479 = _4471 * 0.15915493667125701904296875;
        _4251 = _4479;
    }
    float _4481 = _4251;
    float _4483 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4485 = _4425;
    if (_4449)
    {
        float _4487 = _4481 * 6.283185482025146484375;
        float _4489 = sin(_4487);
        _4485 = _4489;
    }
    float _4491 = _4485;
    float _4493 = _4409 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4495 = precise::max(0.0, _4483);
    float _4497 = fma(_4411, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4493);
    float _4499 = _3579;
    float _4501 = _4495;
    if (_4449)
    {
        float _4503 = _4481 * 6.283185482025146484375;
        float _4505 = cos(_4503);
        _4499 = _4505;
    }
    float _4507 = _4499;
    float _4509 = -_4435;
    float _4511 = -_4495;
    float _4513 = fma(_4417, _4509, _4511);
    if (_4449)
    {
        float _4515 = _4513 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4459 = _4515;
    }
    float _4517 = _4459;
    float _4519 = _4491;
    float _4521 = _4517;
    if (_4449)
    {
        float _4523 = fma(_4491, _4517, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4519 = _4523;
    }
    float _4525 = _4519;
    float _4527 = _4525;
    if (!_4449)
    {
        _4521 = _4439;
    }
    float _4529 = _4521;
    float _4531 = _4409 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4533 = _4529;
    if (_4449)
    {
        float _4535 = _4475 * _4525;
        _3693 = _4535;
    }
    float _4537 = _3693;
    if (!_4449)
    {
        _4477 = _4513;
    }
    float _4539 = _4477;
    float _4541 = fma(_4411, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4531);
    float _4543 = _4539;
    float _4545 = _4507;
    if (_4449)
    {
        float _4547 = _4507 + (-1.0);
        _4501 = _4547;
    }
    float _4549 = _4501;
    float _4551 = _4549;
    if (_4449)
    {
        float _4553 = _4437 * _4537;
        _4461 = _4553;
    }
    float _4555 = _4461;
    if (!_4449)
    {
        _4527 = _4441;
    }
    float _4557 = _4527;
    float _4559 = _4557;
    if (_4449)
    {
        float _4561 = _4439 * _4537;
        _4533 = _4561;
    }
    float _4563 = _4533;
    if (_4449)
    {
        float _4565 = _4549 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4551 = _4565;
    }
    float _4567 = _4551;
    if (_4449)
    {
        float _4569 = _4555 * _4555;
        _4559 = _4569;
    }
    float _4571 = _4559;
    float _4573 = _4409 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4575 = fma(_4413, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4541);
    if (_4449)
    {
        float _4577 = fma(_4513, _4507, _4567);
        _4543 = _4577;
    }
    float _4579 = _4543;
    if (!_4449)
    {
        _4545 = _4443;
    }
    float _4581 = _4545;
    float _4583 = _4581;
    if (_4449)
    {
        float _4585 = _4563 * _4563;
        _4583 = _4585;
    }
    float _4587 = _4583;
    float _4589 = sqrt(_4431);
    float _4591 = fma(_4579, _4579, _4571);
    float _4593 = fma(_4411, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4573);
    float _4595 = _4575 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4597 = _4591 + _4587;
    float _4599 = _4409 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4601 = fma(_3627, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _4603 = rsqrt(_4597);
    float _4605 = _4595 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4607 = fma(_4411, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4599);
    float _4609 = fma(_4413, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4607);
    float _4611 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4613 = fma(_4589, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4611);
    float _4615 = precise::clamp(_4613, 0.0, 1.0);
    float _4617 = floor(_4601);
    float _4619 = fma(_4413, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4497);
    float _4621 = _4609 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4623 = -_4615;
    float _4625 = _4623 + 1.0;
    float _4627 = fma(_4413, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4593);
    float _4629 = fma(_3637, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4631 = fma(_4621, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4605);
    float _4633 = _4619 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4635 = _4603 * _4555;
    float _4637 = _4603 * _4579;
    float _4639 = abs(_4625);
    float _4641 = log2(_4639);
    float _4643 = _4603 * _4563;
    float _4645 = _4635 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4647 = _4627 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4649 = -_4645;
    float _4651 = fma(_4637, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4649);
    float _4653 = fma(_4647, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4631);
    float _4655 = floor(_4629);
    float _4657 = -_4617;
    float _4659 = _4601 + _4657;
    float _4661 = -_4643;
    float _4663 = fma(_4661, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4651);
    float _4665 = _4647 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4667 = fma(_4633, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4653);
    float _4669 = fma(_4663, -0.5, 0.5);
    float _4671 = fma(_4663, 0.5, 0.5);
    float _4673 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4675 = _4641 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4677 = 1.0 / _4667;
    float _4679 = fma(_4671, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4681 = -_4665;
    float _4683 = fma(_4681, _4673, 1.0);
    float _4685 = _4595 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4687 = fma(_4671, _4679, -0.212114393711090087890625);
    float _4689 = fma(_4621, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4685);
    float _4691 = exp2(_4675);
    float _4693 = fma(_4671, _4687, 1.570728778839111328125);
    float _4695 = fma(_4647, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4689);
    float _4697 = log2(_4683);
    float _4699 = _4595 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4701 = fma(_4621, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4699);
    float _4703 = sqrt(_4669);
    float _4705 = fma(_4647, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4701);
    float _4707 = fma(_4633, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4705);
    float _4709 = _4697 * 0.693147182464599609375;
    float _4711 = -_4655;
    float _4713 = _4629 + _4711;
    float _4715 = _4637 + 1.0;
    float _4717 = fma(_4633, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4695);
    float2 _12074 = float2(_4659, _4713);
    float _4719 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_12074, float2(0.0), isnan(_12074)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_12074, float2(0.0), isnan(_12074)), level(0.0)).x;
    float _4721 = -_4637;
    float _4723 = fma(_4691, _4715, _4721);
    float _4725 = _4717 * _4677;
    float _4727 = _4707 * _4677;
    float _4729 = _4703 * 0.636619746685028076171875;
    float _4731 = _4709 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4733 = fma(_4725, 0.5, 0.5);
    float _4735 = fma(_4727, -0.5, 0.5);
    float _4737 = -_4693;
    float _4739 = fma(_4729, _4737, 1.0);
    float _4741 = fma(_4723, 0.5, 0.5);
    float3 _12115 = float3(_4733, _4735, _4731);
    float _4743 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_12115, float3(0.0), isnan(_12115)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_12115, float3(0.0), isnan(_12115)), level(0.0)).x;
    float3 _12126 = float3(_4733, _4735, _4731);
    float4 _4746 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_12126, float3(0.0), isnan(_12126)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_12126, float3(0.0), isnan(_12126)), level(0.0)).xyzw;
    float _4748 = _4746.x;
    float _4750 = _4746.y;
    float _4752 = _4746.z;
    float _4754 = _4746.w;
    float2 _12142 = float2(_4739, _4741);
    float3 _4758 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_12142, float2(0.0), isnan(_12142)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_12142, float2(0.0), isnan(_12142)), level(0.0)).xyz;
    float _4760 = _4758.x;
    float _4762 = _4758.y;
    float _4764 = _4758.z;
    float _4766 = _3621 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    out.m_85.x = _4411;
    out.m_85.y = _4409;
    out.m_85.z = _4413;
    bool _4768 = _4589 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4770 = isnan(_4589);
    bool _4772 = _4768 || _4770;
    bool _4774 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4776 = _4772 || _4774;
    float _4778 = fma(_3627, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4766);
    float _4780 = fma(_3637, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4778);
    float _4782 = _3621 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _4784 = _4780 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4786 = fma(_3627, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4782);
    float _4788 = 1.0 / _4784;
    float _4790 = fma(_3637, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4786);
    float _4792 = _4790 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4794 = _4792 + _4784;
    float _4796 = _4794 * _4788;
    float _4798 = _4796 * 0.5;
    float _4800 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _4802 = fma(_4798, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4800);
    float _4804 = 1.0 / _4802;
    float _4806 = _4641 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4808 = exp2(_4806);
    float _4810 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4812 = _4804 * _4810;
    float _4814 = abs(_4812);
    float _4816 = log2(_4814);
    float _4818 = -_4808;
    float _4820 = _4818 + 1.0;
    float _4822 = _4820 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _4824 = _4816 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _4826 = _4595 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4828 = fma(_4621, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4826);
    float _4830 = exp2(_4824);
    float _4832 = fma(_4647, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4828);
    float _4834 = fma(_4633, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4832);
    bool _4836 = _4812 <= 8000.0;
    bool _4838 = isnan(_4812);
    bool _4840 = _4836 || _4838;
    bool _4842 = isnan(8000.0);
    bool _4844 = _4840 || _4842;
    float _4846 = float(_4844);
    out.gl_Position.x = _4717;
    out.gl_Position.y = _4707;
    out.gl_Position.z = _4834;
    out.gl_Position.w = _4667;
    float _4848 = fma(_4830, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4850 = precise::clamp(_4848, 0.0, 1.0);
    float _4852 = in.m_87.x;
    float _4854 = fma(_4850, -2.0, 3.0);
    float _4856 = _4850 * _4850;
    float _4858 = _4856 * _4854;
    float _4860 = -_4858;
    float _4862 = _4860 + 1.0;
    float _4864 = fma(_4862, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4858);
    float _4866 = _4834 + _4667;
    float _4868 = _4846 * _4864;
    float _4870 = _4866 * 0.5;
    float _4872 = _4868 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_89.z = _4870;
    out.m_89.w = _4667;
    float _4874 = -_4719;
    float _4876 = _4874 + 1.0;
    float _4878 = _4876 * _4872;
    float _4880 = precise::clamp(_4878, 0.0, 1.0);
    float _4882 = -_4880;
    float _4884 = fma(_4882, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4886 = _4822 * _4743;
    float _4888 = _4884 * _4852;
    float _4890 = -_4822;
    float _4892 = _4890 + 1.0;
    float _4894 = _4754 * _4886;
    float _4896 = _4764 * _4886;
    float _4898 = _4754 * _4892;
    float _4900 = _4888 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _4902 = fma(_4760, _4894, _4748);
    float _4904 = fma(_4762, _4894, _4750);
    float _4906 = fma(_4754, _4896, _4752);
    float _4908 = _4894;
    float _4910 = _4754;
    float _4912 = _4752;
    if (!_4776)
    {
        _4908 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4914 = _4908;
    out.m_91.x = _4900;
    float _4916 = _4914;
    float _4918 = _4914;
    if (!_4776)
    {
        _4910 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4920 = _4910;
    float _4922 = _4920;
    float _4924 = _4920;
    if (!_4776)
    {
        _4912 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4926 = _4912;
    out.m_93.x = _4902;
    out.m_93.y = _4904;
    out.m_93.z = _4906;
    out.m_93.w = _4898;
    bool _4928 = !_4776;
    float _4930 = _4926;
    float _4932 = _4926;
    if (!_4928)
    {
        bool _4934 = _4589 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4936 = isnan(_4589);
        bool _4938 = _4934 || _4936;
        bool _4940 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4942 = _4938 || _4940;
        if (!_4942)
        {
            float _4944 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4946 = _4589 + _4944;
            float _4948 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4950 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4948;
            float _4952 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4954 = _4952 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4956 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4958 = _4956 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4960 = 1.0 / _4950;
            float _4962 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4964 = _4962 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4966 = _4946 * _4960;
            float _4968 = precise::clamp(_4966, 0.0, 1.0);
            float _4970 = fma(_4968, _4954, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4972 = fma(_4968, _4958, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4974 = fma(_4968, _4964, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            _4924 = _4972;
            _4918 = _4970;
            _4932 = _4974;
            _4976 = true;
        }
        else
        {
            bool _4978 = _4589 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4980 = isnan(_4589);
            bool _4982 = _4978 || _4980;
            bool _4984 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4986 = _4982 || _4984;
            if (!_4986)
            {
                _4916 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4988 = _4916;
            _4918 = _4988;
            if (!_4986)
            {
                _4922 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4990 = _4922;
            _4924 = _4990;
            if (!_4986)
            {
                _4930 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4992 = _4930;
            bool _4994 = !_4986;
            _4932 = _4992;
            if (!_4994)
            {
                bool _4996 = _4589 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4998 = isnan(_4589);
                bool _5000 = _4996 || _4998;
                bool _5002 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _5004 = _5000 || _5002;
                if (!_5004)
                {
                    float _5006 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5008 = _4589 + _5006;
                    float _5010 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5012 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _5010;
                    float _5014 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _5016 = _5014 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _5018 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _5020 = _5018 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _5022 = 1.0 / _5012;
                    float _5024 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _5026 = _5024 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _5028 = _5008 * _5022;
                    float _5030 = precise::clamp(_5028, 0.0, 1.0);
                    float _5032 = fma(_5030, _5016, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _5034 = fma(_5030, _5020, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _5036 = fma(_5030, _5026, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    _4924 = _5034;
                    _4918 = _5032;
                    _4932 = _5036;
                    _4976 = true;
                }
                else
                {
                    _4924 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4918 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4932 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _4976 = false;
    float _5038 = _4924;
    float _5040 = _4918;
    float _5042 = _4932;
    float _5044 = _5038 * 0.586610972881317138671875;
    bool _5046 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_51.x = 1.0;
    float _5048 = fma(_5040, 0.298911988735198974609375, _5044);
    out.m_95.x = 0.0;
    float _5050 = fma(_5042, 0.114477999508380889892578125, _5048);
    float _5052 = -_5050;
    float _5054 = _5052 + _5040;
    float _5056 = -_5050;
    float _5058 = _5056 + _5038;
    float _5060 = -_5050;
    float _5062 = _5060 + _5042;
    float _5064 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _5066 = fma(_5054, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5050);
    float _5068 = fma(_5058, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5050);
    float _5070 = fma(_5062, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5050);
    out.m_91.w = _5064;
    out.m_97.x = _5066;
    out.m_97.y = _5068;
    out.m_97.z = _5070;
    if (!_5046)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _5072 = -_4409;
    float _5074 = _5072 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _5076 = -_4411;
    float _5078 = _5076 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _5080 = -_4413;
    float _5082 = _5080 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _5084 = _5074 * _5074;
    float _5086 = fma(_5078, _5078, _5084);
    float _5088 = fma(_5082, _5082, _5086);
    float _5090 = sqrt(_5088);
    float _5092 = rsqrt(_5088);
    float _5094 = -_5090;
    float _5096 = _5094 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _5098 = _5096 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _5100 = precise::clamp(_5098, 0.0, 1.0);
    float _5102 = _5078 * _5092;
    float _5104 = _5074 * _5092;
    float _5106 = abs(_5100);
    float _5108 = log2(_5106);
    float _5110 = _5082 * _5092;
    float _5112 = _5102 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _5114 = _4233 * _5104;
    float _5116 = -_5104;
    float _5118 = -_5112;
    float _5120 = fma(_5116, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5118);
    float _5122 = fma(_4227, _5102, _5114);
    float _5124 = -_5110;
    float _5126 = fma(_5124, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5120);
    float _5128 = fma(_4239, _5110, _5122);
    float _5130 = precise::clamp(_5128, 0.0, 1.0);
    float _5132 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _5134 = _5126 + _5132;
    float _5136 = _5108 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _5138 = _5134 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _5140 = precise::clamp(_5138, 0.0, 1.0);
    float _5142 = exp2(_5136);
    float _5144 = _5142 * _5140;
    float _5146 = _5130 * _5144;
    float _5148 = _5146 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _5150 = _5146 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _5152 = _5146 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_95.x = _5148;
    out.m_95.y = _5150;
    out.m_95.z = _5152;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}


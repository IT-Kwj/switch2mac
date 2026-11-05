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
    constant _16* vp_c15 [[id(0)]];
    constant _16* vp_c8 [[id(1)]];
    constant _16* vp_c10 [[id(2)]];
    constant _16* vp_c9 [[id(3)]];
    constant _16* vp_c12 [[id(4)]];
    constant _16* vp_c13 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    texture2d<float> vp_t_tcb_22 [[id(7)]];
    sampler vp_t_tcb_22Smplr [[id(8)]];
    texture2d_array<float> vp_t_tcb_14 [[id(9)]];
    sampler vp_t_tcb_14Smplr [[id(10)]];
    texture3d<float> vp_t_tcb_32 [[id(11)]];
    sampler vp_t_tcb_32Smplr [[id(12)]];
    texture3d<float> vp_t_tcb_30 [[id(13)]];
    sampler vp_t_tcb_30Smplr [[id(14)]];
    texture2d<float> vp_t_tcb_1C [[id(15)]];
    sampler vp_t_tcb_1CSmplr [[id(16)]];
    sampler vp_t_tcb_22Smplr_w [[id(17)]];
    sampler vp_t_tcb_14Smplr_w [[id(18)]];
    sampler vp_t_tcb_32Smplr_w [[id(19)]];
    sampler vp_t_tcb_30Smplr_w [[id(20)]];
    sampler vp_t_tcb_1CSmplr_w [[id(21)]];
    constant dm_border_t* dm_border [[id(22)]];
};

struct main0_out
{
    float4 m_75 [[user(locn0)]];
    float4 m_81 [[user(locn1)]];
    float4 m_89 [[user(locn2)]];
    float4 m_85 [[user(locn3)]];
    float4 m_95 [[user(locn4)]];
    float4 m_56 [[user(locn5)]];
    float4 m_79 [[user(locn6)]];
    float4 m_83 [[user(locn7)]];
    float4 m_93 [[user(locn8)]];
    float4 m_87 [[user(locn9)]];
    float4 m_91 [[user(locn10)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_67 [[attribute(1)]];
    float4 m_69 [[attribute(2)]];
    float4 m_71 [[attribute(3)]];
    float4 m_77 [[attribute(4)]];
    float4 m_65 [[attribute(5)]];
    float4 m_53 [[attribute(6)]];
    float4 m_58 [[attribute(7)]];
    float4 m_60 [[attribute(8)]];
    float4 m_73 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3090 = false;
    bool _2872 = false;
    bool _1684 = false;
    bool _1672 = false;
    bool _678 = false;
    bool _530 = false;
    bool _338 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _109 = in.m_53.w;
    float _111 = trunc(_109);
    int _114 = int(_111);
    bool _118 = _114 >= 1;
    float _120 = 0.0;
    if (!_118)
    {
        _120 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _122 = _120;
    float _124 = _122;
    if (!_118)
    {
        out.m_56.x = 0.0;
    }
    int _126 = 0;
    if (!_118)
    {
        float _128 = _122 * 5.0;
        _126 = as_type<int>(_128);
    }
    int _130 = _126;
    int _132 = _130;
    if (!_118)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3375 = as_type<float>(_130);
        out.gl_Position.z = _3375;
    }
    if (!_118)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _134 = in.m_58.w;
    bool _136 = _134 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _138 = isnan(_134);
    bool _140 = _136 || _138;
    bool _142 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _144 = _140 || _142;
    float _146 = -_134;
    float _148 = _146 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _150 = 0.0;
    float _152 = _148;
    if (_144)
    {
        float _154 = float(_114);
        _150 = _154;
    }
    float _156 = _150;
    bool _158 = _148 >= _156;
    bool _160 = !_144;
    bool _162 = _158 || _160;
    if (_162)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _164 = _124;
    if (_162)
    {
        out.m_56.x = 0.0;
    }
    if (_162)
    {
        float _166 = _164 * 5.0;
        _132 = as_type<int>(_166);
    }
    int _168 = _132;
    if (_162)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3444 = as_type<float>(_168);
        out.gl_Position.z = _3444;
    }
    if (_162)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _170 = in.m_60.x;
    float _172 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _174 = _148 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _176 = as_type<float>(int(gl_VertexIndex));
    float _178 = in.m_65.x;
    float _180 = in.m_65.y;
    float _182 = in.m_65.z;
    float _184 = in.m_67.x;
    float _186 = in.m_67.y;
    float _188 = in.m_67.z;
    float _190 = in.m_69.x;
    float _192 = in.m_69.y;
    float _194 = in.m_69.z;
    float _196 = _174 * _172;
    float _198 = in.m_71.x;
    float _200 = in.m_71.y;
    float _202 = in.m_71.z;
    float _204 = fma(_170, (*spvDescriptorSet0.vp_c9)._m0[20].x, _196);
    int _206 = as_type<int>(_176) & 1;
    bool _208 = _206 != 0;
    int _210 = as_type<int>(_176) & 2;
    bool _212 = _210 != 0;
    float _214 = _204 * 6.283185482025146484375;
    int _216 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _218 = _216 != 0;
    float _220 = floor(_204);
    float _222 = _214 * 0.15915493667125701904296875;
    bool _224 = !_212;
    float _226 = _224 ? (-0.5) : 0.5;
    int _228 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _230 = _228 != 0;
    int _232 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _234 = _232 != 0;
    float _236 = _180 * _186;
    bool _238 = !_218;
    int _240 = _238 ? 0 : 1;
    float _242 = _222 * 6.283185482025146484375;
    float _244 = cos(_242);
    float _246 = _180 * _192;
    bool _248 = !_230;
    int _250 = _248 ? 0 : 1;
    float _252 = fma(_178, _184, _236);
    int _254 = abs(_240);
    float _256 = _180 * _200;
    int _258 = abs(_250);
    float _260 = fma(_178, _190, _246);
    float _262 = -_220;
    float _264 = _204 + _262;
    float _266 = fma(_178, _198, _256);
    float _268 = fma(_182, _194, _260);
    bool _270 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _272 = -_264;
    float _274 = fma(_272, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _276 = float(_258);
    float _278 = fma(_244, 0.5, 0.5);
    bool _280 = !_234;
    int _282 = _280 ? 0 : 1;
    float _284 = abs(_274);
    float _286 = _276 * _284;
    bool _288 = _264 < 0.5;
    float _290 = float(_288);
    float _292 = -_278;
    float _294 = fma(_292, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _296 = abs(_282);
    float _298 = float(_254);
    float _300 = -_290;
    float _302 = fma(_300, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _304 = float(_296);
    bool _306 = !_208;
    float _308 = _306 ? (-0.5) : 0.5;
    float _310 = fma(_298, _294, _286);
    float _312 = fma(_182, _188, _252);
    float _314 = fma(_182, _202, _266);
    float _316 = abs(_302);
    float _318 = fma(_304, _316, _310);
    bool _320 = !_270;
    float _336;
    if (!_320)
    {
        float _322 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _324 = _170 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _326 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[12].x, _148);
        float _328 = _326 * _322;
        float _330 = floor(_328);
        float _332 = -_330;
        float _334 = _328 + _332;
        _336 = _334;
        _338 = true;
    }
    else
    {
        float _340 = float(_114);
        float _342 = 1.0 / _340;
        float _344 = _148 * _342;
        _336 = _344;
    }
    _338 = false;
    float _346 = _336;
    float _348 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _350 = _346 + _348;
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _354 = _346 + _352;
    float _356 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _358 = _346 + _356;
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _362 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _360;
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _366 = _364 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _368 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _370 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _368;
    bool _372 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _374 = 1.0 / _362;
    float _376 = 1.0 / _370;
    bool _378 = _346 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _380 = isnan(_346);
    bool _382 = _378 || _380;
    bool _384 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _386 = _382 || _384;
    float _388 = float(_386);
    float _390 = 1.0 / _366;
    float _392 = _350 * _374;
    bool _394 = _346 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _396 = isnan(_346);
    bool _398 = _394 || _396;
    bool _400 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _402 = _398 || _400;
    float _404 = float(_402);
    float _406 = _354 * _376;
    bool _408 = _346 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _410 = isnan(_346);
    bool _412 = _408 || _410;
    bool _414 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _416 = _412 || _414;
    float _418 = float(_416);
    float _420 = -_404;
    float _422 = _420 + 1.0;
    bool _424 = _346 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _426 = isnan(_346);
    bool _428 = _424 || _426;
    bool _430 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _432 = _428 || _430;
    float _434 = float(_432);
    float _436 = _388 * _422;
    float _438 = _358 * _390;
    float _440 = -_388;
    float _442 = _440 + 1.0;
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _446 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _444;
    float _448 = _418 * _442;
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _452 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _450;
    float _454 = -_418;
    float _456 = _454 + 1.0;
    float _458 = fma(_446, _392, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _460 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _462 = _460 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _464 = fma(_452, _392, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _466 = _434 * _456;
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _470 = _468 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _472 = -_434;
    float _474 = _472 + 1.0;
    float _476 = _464 * _466;
    float _478 = _458 * _466;
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _482 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _480;
    float _484 = fma(_462, _438, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _486 = fma(_474, (*spvDescriptorSet0.vp_c9)._m0[143].x, _476);
    float _488 = fma(_470, _438, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _492 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _490;
    float _494 = fma(_474, (*spvDescriptorSet0.vp_c9)._m0[143].y, _478);
    float _496 = fma(_482, _406, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _498 = fma(_484, _448, _486);
    float _500 = fma(_492, _406, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _502 = fma(_488, _448, _494);
    float _504 = fma(_496, _436, _498);
    float _506 = fma(_500, _436, _502);
    float _508 = fma(_404, (*spvDescriptorSet0.vp_c9)._m0[146].x, _504);
    float _510 = fma(_404, (*spvDescriptorSet0.vp_c9)._m0[146].y, _506);
    bool _512 = !_372;
    float _528;
    if (!_512)
    {
        float _514 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _516 = _170 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _518 = fma(_516, (*spvDescriptorSet0.vp_c9)._m0[11].y, _148);
        float _520 = _518 * _514;
        float _522 = floor(_520);
        float _524 = -_522;
        float _526 = _520 + _524;
        _528 = _526;
        _530 = true;
    }
    else
    {
        float _532 = float(_114);
        float _534 = 1.0 / _532;
        float _536 = _148 * _534;
        _528 = _536;
    }
    _530 = false;
    float _538 = _528;
    float _540 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _542 = _540 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _544 = _538 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _546 = isnan(_538);
    bool _548 = _544 || _546;
    bool _550 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _552 = _548 || _550;
    float _554 = float(_552);
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _558 = _556 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _560 = _538 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _562 = isnan(_538);
    bool _564 = _560 || _562;
    bool _566 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _568 = _564 || _566;
    float _570 = float(_568);
    float _572 = 1.0 / _542;
    float _574 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _576 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _574;
    float _578 = -_554;
    float _580 = _578 + 1.0;
    bool _582 = _538 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _584 = isnan(_538);
    bool _586 = _582 || _584;
    bool _588 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _590 = _586 || _588;
    float _592 = float(_590);
    bool _594 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _596 = _570 * _580;
    float _598 = -_570;
    float _600 = _598 + 1.0;
    float _602 = 1.0 / _558;
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _606 = _604 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _608 = _576 * _572;
    float _610 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _612 = _538 + _610;
    float _614 = -_592;
    float _616 = _614 + 1.0;
    float _618 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _620 = _538 + _618;
    float _622 = fma(_608, _612, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _624 = _554 * _616;
    float _626 = _606 * _602;
    float _628 = _622 * _596;
    float _630 = fma(_626, _620, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _632 = fma(_600, (*spvDescriptorSet0.vp_c9)._m0[115].x, _628);
    float _634 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _636 = fma(_630, _624, _632);
    float _638 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _640 = _634 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _642 = fma(_592, (*spvDescriptorSet0.vp_c9)._m0[117].x, _636);
    float _644 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _646 = _638 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _648 = in.m_73.x;
    float _650 = in.m_73.y;
    float _652 = _642 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _654 = _644 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_75.x = _640;
    out.m_75.y = _654;
    out.m_75.z = _646;
    out.m_75.w = _652;
    float _656 = _510 * _650;
    float _658 = _508 * _648;
    bool _660 = !_594;
    float _676;
    if (!_660)
    {
        float _662 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _664 = _170 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _666 = fma(_664, (*spvDescriptorSet0.vp_c9)._m0[11].w, _148);
        float _668 = _666 * _662;
        float _670 = floor(_668);
        float _672 = -_670;
        float _674 = _668 + _672;
        _676 = _674;
        _678 = true;
    }
    else
    {
        float _680 = float(_114);
        float _682 = 1.0 / _680;
        float _684 = _148 * _682;
        _676 = _684;
    }
    _678 = false;
    float _686 = _676;
    float _688 = in.m_53.x;
    float _690 = in.m_53.y;
    float _692 = in.m_53.z;
    float _694 = _170 * 2.0;
    int _696 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _698 = _696 != 0;
    int _700 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _702 = _700 != 0;
    int _704 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _706 = _704 != 0;
    float _708 = in.m_60.y;
    int _710 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _712 = _710 != 0;
    float _714 = floor(_694);
    int _716 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _718 = _716 != 0;
    float _720 = in.m_71.w;
    float _722 = in.m_69.w;
    bool _724 = !_702;
    int _726 = _724 ? 0 : 1;
    bool _728 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _730 = isnan(0.0);
    bool _732 = _728 || _730;
    bool _734 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _736 = _732 || _734;
    float _738 = in.m_67.w;
    int _740 = abs(_726);
    bool _742 = _714 > 0.0;
    float _744 = _186 * _690;
    float _746 = _192 * _690;
    float _748 = _200 * _690;
    float _750 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _752 = _750 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _754 = fma(_184, _688, _744);
    float _756 = fma(_190, _688, _746);
    float _758 = _170 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _760 = fma(_198, _688, _748);
    float _762 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _764 = _762 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _766 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _768 = _766 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _770 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _772 = _708 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _774 = 1.0 / _764;
    float _776 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _778 = -_770;
    float _780 = fma(_758, 2.0, _778);
    float _782 = fma(_188, _692, _754);
    float _784 = in.m_60.z;
    float _786 = fma(_194, _692, _756);
    float _788 = fma(_202, _692, _760);
    float _790 = 1.0 / _752;
    float _792 = _708 * 2.0;
    bool _794 = _714 >= 0.0;
    bool _796 = isnan(_714);
    bool _798 = _794 || _796;
    bool _800 = isnan(0.0);
    bool _802 = _798 || _800;
    float _804 = _788 + _720;
    float _806 = _786 + _722;
    int _808 = _802 ? 0 : 1;
    float _810 = _782 + _738;
    float _812 = 1.0 / _768;
    float _814 = fma(_772, -2.0, _776);
    float _816 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    bool _818 = _170 > 0.5;
    bool _820 = _686 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _822 = isnan(_686);
    bool _824 = _820 || _822;
    bool _826 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _828 = _824 || _826;
    float _830 = float(_828);
    float _832 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _834 = _832 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _836 = floor(_792);
    float _838 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _840 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _838;
    float _842 = -_308;
    int _844 = _818 ? as_type<int>(_842) : as_type<int>(_308);
    float _846 = _834 * _774;
    float _848 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _850 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _848;
    float _852 = _840 * _790;
    float _854 = _170 + _708;
    float _856 = _850 * _812;
    float _858 = _784 * 2.0;
    float _860 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _862 = log2(_860);
    float _864 = _854 + (-1.0);
    int _866 = ~_808;
    int _868 = _866 + 1;
    int _870 = _868 + 1;
    float _872 = _708 + _784;
    int _874 = _870;
    if (!_742)
    {
        int _876 = ~_808;
        int _878 = _876 + 1;
        _874 = _878;
    }
    int _880 = _874;
    float _882 = _170 + _784;
    bool _884 = _836 > 0.0;
    float _886 = fma(_864, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _888 = floor(_858);
    float _890 = _872 + (-1.0);
    float _892 = _882 + (-1.0);
    bool _894 = _836 >= 0.0;
    bool _896 = isnan(_836);
    bool _898 = _894 || _896;
    bool _900 = isnan(0.0);
    bool _902 = _898 || _900;
    float _904 = fma(_890, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _906 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _908 = _686 + _906;
    float _910 = _862 * _148;
    int _912 = _902 ? 0 : 1;
    float _914 = fma(_892, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _916 = _708 > 0.5;
    float _918 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _920 = _686 + _918;
    int _922 = ~_912;
    int _924 = _922 + 1;
    int _926 = _924 + 1;
    float _928 = exp2(_910);
    float _930 = fma(_852, _908, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    int _932 = _926;
    if (!_884)
    {
        int _934 = ~_912;
        int _936 = _934 + 1;
        _932 = _936;
    }
    int _938 = _932;
    float _940 = fma(_856, _920, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _942 = -_226;
    int _944 = _916 ? as_type<int>(_942) : as_type<int>(_226);
    float _946 = fma(_784, (*spvDescriptorSet0.vp_c9)._m0[79].z, _816);
    bool _948 = _888 > 0.0;
    bool _950 = _888 >= 0.0;
    bool _952 = isnan(_888);
    bool _954 = _950 || _952;
    bool _956 = isnan(0.0);
    bool _958 = _954 || _956;
    float _960 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _962 = _686 + _960;
    bool _964 = _686 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _966 = isnan(_686);
    bool _968 = _964 || _966;
    bool _970 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _972 = _968 || _970;
    float _974 = float(_972);
    float _976 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[79].x, _946);
    bool _978 = _686 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _980 = isnan(_686);
    bool _982 = _978 || _980;
    bool _984 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _986 = _982 || _984;
    float _988 = float(_986);
    float _990 = fma(_846, _962, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _992 = -_974;
    float _994 = _992 + 1.0;
    float _996 = -_928;
    float _998 = _996 + 1.0;
    bool _1000 = _686 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1002 = isnan(_686);
    bool _1004 = _1000 || _1002;
    bool _1006 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1008 = _1004 || _1006;
    float _1010 = float(_1008);
    float _1012 = _976 * (-0.15915493667125701904296875);
    float _1014 = _988 * _994;
    float _1016 = -_988;
    float _1018 = _1016 + 1.0;
    float _1020 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1022 = 1.0 + _1020;
    float _1024 = _1012 * 6.283185482025146484375;
    float _1026 = cos(_1024);
    float _1028 = _830 * _1018;
    float _1030 = -_830;
    float _1032 = _1030 + 1.0;
    float _1034 = _736 ? _998 : 0.0;
    bool _1036 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1038 = isnan(1.0);
    bool _1040 = _1036 || _1038;
    bool _1042 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1044 = _1040 || _1042;
    float _1046 = _1010 * _1032;
    float _1048 = float(_740);
    float _1050 = 1.0 / _1022;
    float _1052 = float(_880);
    float _1054 = _930 * _1046;
    float _1056 = -_148;
    float _1058 = fma(_1056, (*spvDescriptorSet0.vp_c9)._m0[76].x, _780);
    float _1060 = float(_938);
    float _1062 = _1012 * 6.283185482025146484375;
    float _1064 = sin(_1062);
    float _1066 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1068 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1070 = -_1010;
    float _1072 = _1070 + 1.0;
    float _1074 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[76].y, _814);
    float _1076 = fma(_170, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1066);
    float _1078 = fma(_708, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1068);
    int _1080 = _958 ? 0 : 1;
    float _1082 = fma(_1072, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1054);
    float _1084 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1076);
    float _1086 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1078);
    if (_1044)
    {
        float _1088 = _1034 * _1050;
        _152 = _1088;
    }
    float _1090 = _152;
    bool _1092 = !_718;
    float _1094 = _1092 ? _226 : as_type<float>(_944);
    float _1096 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].x;
    bool _1098 = !_712;
    float _1100 = _1098 ? _308 : as_type<float>(_844);
    float _1102 = _708 + (-0.5);
    int _1104 = ~_1080;
    int _1106 = _1104 + 1;
    int _1108 = _1106 + 1;
    float _1110 = _1094 * _1064;
    float _1112 = _1094 * _1026;
    int _1114 = _1108;
    if (!_948)
    {
        int _1116 = ~_1080;
        int _1118 = _1116 + 1;
        _1114 = _1118;
    }
    int _1120 = _1114;
    float _1122 = fma(_990, _1028, _1082);
    float _1124 = -_1110;
    float _1126 = fma(_1100, _1026, _1124);
    float _1128 = _1048 * _1052;
    float _1130 = _806 + (*spvDescriptorSet0.vp_c12)._m0[0].y;
    float _1132 = fma(_1100, _1064, _1112);
    float _1134 = _810 + (*spvDescriptorSet0.vp_c12)._m0[0].x;
    bool _1136 = !_706;
    int _1138 = _1136 ? 0 : 1;
    float _1140 = _1130 * (*spvDescriptorSet0.vp_c12)._m0[7].x;
    float _1142 = _1130 * (*spvDescriptorSet0.vp_c12)._m0[7].y;
    float _1144 = _1130 * (*spvDescriptorSet0.vp_c12)._m0[7].z;
    bool _1146 = !_698;
    int _1148 = _1146 ? 0 : 1;
    float _1150 = fma(_1134, (*spvDescriptorSet0.vp_c12)._m0[6].x, _1140);
    float _1152 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1154 = fma(_940, _1014, _1122);
    int _1156 = abs(_1148);
    float _1158 = fma(_1134, (*spvDescriptorSet0.vp_c12)._m0[6].y, _1142);
    float _1160 = in.m_77.x;
    float _1162 = in.m_77.y;
    float _1164 = in.m_77.z;
    float _1166 = -_806;
    float _1168 = _1166 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1170 = fma(_1134, (*spvDescriptorSet0.vp_c12)._m0[6].z, _1144);
    int _1172 = abs(_1138);
    float _1174 = _804 + (*spvDescriptorSet0.vp_c12)._m0[0].z;
    float _1176 = -_810;
    float _1178 = _1176 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1180 = _1168 * _1168;
    float _1182 = -_804;
    float _1184 = _1182 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1186 = fma(_1174, (*spvDescriptorSet0.vp_c12)._m0[8].x, _1150);
    float _1188 = float(_1172);
    float _1190 = fma(_1178, _1178, _1180);
    float _1192 = float(_1156);
    float _1194 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _1196 = float(_1120);
    float _1198 = _1186 + (*spvDescriptorSet0.vp_c12)._m0[9].x;
    float _1200 = _1188 * _1060;
    float _1202 = fma(_1184, _1184, _1190);
    float _1204 = fma(_1174, (*spvDescriptorSet0.vp_c12)._m0[8].y, _1158);
    float _1206 = _1198 * _1096;
    float _1208 = _1192 * _1196;
    float _1210 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _1212 = _1152 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1214 = _1126 + 0.5;
    float _1216 = fma(_1174, (*spvDescriptorSet0.vp_c12)._m0[8].z, _1170);
    float _1218 = _1204 + (*spvDescriptorSet0.vp_c12)._m0[9].y;
    float _1220 = _170 + (-0.5);
    float _1222 = fma(_1212, _1214, _1058);
    float _1224 = _1128 * (-2.0);
    float _1226 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1228 = _1216 + (*spvDescriptorSet0.vp_c12)._m0[9].z;
    float _1230 = _1218 * _1194;
    float _1232 = fma(_1224, _1162, _1162);
    float _1234 = -_1084;
    float _1236 = _1234 + 1.0;
    float _1238 = -_1086;
    float _1240 = _1238 + 1.0;
    float _1242 = fma(_1230, 0.5, 0.5);
    float _1244 = fma(_1102, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1232);
    float _1246 = rsqrt(_1202);
    float _1248 = _1228 * _1210;
    float _1250 = fma(_904, _1224, _904);
    float _1252 = _1132 + (-0.5);
    float _1254 = _1208 * (-2.0);
    float _1256 = _1200 * (-2.0);
    float _1258 = fma(_1250, _1090, _1244);
    float _1260 = fma(_1206, 0.5, 0.5);
    float _1262 = _1226 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1264 = fma(_1254, _1160, _1160);
    float _1266 = fma(_1248, 0.5, 0.5);
    float _1268 = _1258 * 0.15915493667125701904296875;
    float _1270 = -_1262;
    float _1272 = -_1074;
    float _1274 = fma(_1270, _1252, _1272);
    float _1276 = fma(_886, _1254, _886);
    float _1278 = fma(_974, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1154);
    float _1280 = fma(_914, _1256, _914);
    float _1282 = fma(_1256, _1164, _1164);
    float _1284 = _784 + (-0.5);
    float _1286 = _1178 * _1246;
    float _1288 = _1168 * _1246;
    float _1290 = _1184 * _1246;
    float _1292 = fma(_1284, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1282);
    float _1294 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1296 = _1286 * _1294;
    float _1298 = fma(_1220, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1264);
    float _1300 = -_1236;
    float _1302 = fma(_1126, _1300, _1222);
    float _1304 = fma(_1280, _1090, _1292);
    float _1306 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1308 = _1290 * _1306;
    float _1310 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1312 = -_1296;
    float _1314 = fma(_1290, _1310, _1312);
    float _1316 = fma(_1276, _1090, _1298);
    float _1318 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1320 = _1288 * _1318;
    float _1322 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1324 = -_1308;
    float _1326 = fma(_1288, _1322, _1324);
    float _1328 = _1314 * _1314;
    float _1330 = _1316 * 0.15915493667125701904296875;
    float _1332 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1334 = -_1320;
    float _1336 = fma(_1286, _1332, _1334);
    float _1338 = _1304 * 0.15915493667125701904296875;
    float _1340 = fma(_1326, _1326, _1328);
    float _1342 = fma(_1132, _1240, _1274);
    float _1344 = _1330 * 6.283185482025146484375;
    float _1346 = sin(_1344);
    float _1348 = _656 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1350 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _226);
    float _1352 = _1278 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1354 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1356 = _1330 * 6.283185482025146484375;
    float _1358 = cos(_1356);
    float _1360 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1362 = _1348 * _1350;
    float _1364 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1366 = _1354 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1368 = _1360 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_79.x = _1302;
    out.m_79.y = _1342;
    float _1370 = _1364 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1372 = floor(_1260);
    float _1374 = fma(_1336, _1336, _1340);
    bool _1376 = 1.0 != (*spvDescriptorSet0.vp_c12)._m0[10].x;
    bool _1378 = isnan(1.0);
    bool _1380 = _1376 || _1378;
    bool _1382 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].x);
    bool _1384 = _1380 || _1382;
    out.m_81.x = _1366;
    out.m_81.y = _1368;
    out.m_81.z = _1370;
    out.m_81.w = _1352;
    float _1386 = floor(_1242);
    float _1388 = floor(_1266);
    float _1390 = -_1372;
    float _1392 = _1260 + _1390;
    float _1394 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _308);
    float _1396 = _308 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1398 = fma(_1392, 2.0, -1.0);
    float _1400 = _1268 * 6.283185482025146484375;
    float _1402 = sin(_1400);
    float _1404 = -_1386;
    float _1406 = _1242 + _1404;
    float _1408 = fma(_1406, 2.0, -1.0);
    float _1410 = _1268 * 6.283185482025146484375;
    float _1412 = cos(_1410);
    float _1414 = -_1388;
    float _1416 = _1266 + _1414;
    float _1418 = _1338 * 6.283185482025146484375;
    float _1420 = cos(_1418);
    float _1422 = _1346 * _1402;
    float _1424 = _1358 * _1402;
    float _1426 = rsqrt(_1374);
    float _1428 = _1346 * _1412;
    float _1430 = _1338 * 6.283185482025146484375;
    float _1432 = sin(_1430);
    float _1434 = _1346 * _1420;
    float _1436 = _1358 * _1412;
    float _1438 = _1358 * _1420;
    float _1440 = _658 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1442 = _1412 * _1420;
    float _1444 = _1402 * _1420;
    float _1446 = _1438 * _1362;
    float _1448 = _1314 * _1426;
    float _1450 = _1440 * _1394;
    float _1452 = _1408 * (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _1454 = _1336 * _1426;
    float _1456 = _1398 * (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _1458 = _1452 * (*spvDescriptorSet0.vp_c12)._m0[3].x;
    float _1460 = _1452 * (*spvDescriptorSet0.vp_c12)._m0[3].y;
    float _1462 = fma(_1432, _1436, _1422);
    float _1464 = fma(_1432, _1422, _1436);
    float _1466 = -_1362;
    float _1468 = _1432 * _1466;
    float _1470 = -_1424;
    float _1472 = fma(_1432, _1428, _1470);
    float _1474 = -_1428;
    float _1476 = fma(_1432, _1424, _1474);
    float _1478 = _1434 * _1362;
    float _1480 = _1326 * _1426;
    float _1482 = _1452 * (*spvDescriptorSet0.vp_c12)._m0[3].z;
    float _1484 = fma(_1442, _1450, _1468);
    float _1486 = fma(_1462, _1450, _1446);
    float _1488 = fma(_1472, _1450, _1478);
    float _1490 = fma(_1456, (*spvDescriptorSet0.vp_c12)._m0[2].x, _1458);
    float _1492 = _1290 * _1448;
    float _1494 = _1286 * _1454;
    float _1496 = _1288 * _1480;
    float _1498 = fma(_1456, (*spvDescriptorSet0.vp_c12)._m0[2].y, _1460);
    float _1500 = -_1492;
    float _1502 = fma(_1288, _1454, _1500);
    float _1504 = -_1494;
    float _1506 = fma(_1290, _1480, _1504);
    float _1508 = -_1496;
    float _1510 = fma(_1286, _1448, _1508);
    float _1512 = fma(_1456, (*spvDescriptorSet0.vp_c12)._m0[2].z, _1482);
    float _1514 = _1438 * _1502;
    float _1516 = _1438 * _1506;
    float _1518 = _1438 * _1510;
    float _1520 = _1462 * _1502;
    float _1522 = -_1432;
    float _1524 = fma(_1522, _1480, _1514);
    float _1526 = -_1432;
    float _1528 = fma(_1526, _1448, _1516);
    float _1530 = -_1432;
    float _1532 = fma(_1530, _1454, _1518);
    float _1534 = _1462 * _1510;
    float _1536 = fma(_1434, _1286, _1524);
    float _1538 = fma(_1434, _1288, _1528);
    float _1540 = fma(_1434, _1290, _1532);
    float _1542 = _226 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1544 = _1462 * _1506;
    float _1546 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1548 = fma(_1442, _1480, _1520);
    float _1550 = fma(_1442, _1454, _1534);
    float _1552 = _1542 * _1536;
    float _1554 = _1542 * _1538;
    float _1556 = _1542 * _1540;
    float _1558 = fma(_1442, _1448, _1544);
    float _1560 = fma(_1476, _1546, _1486);
    float _1562 = _1476 * _1502;
    float _1564 = _1476 * _1506;
    float _1566 = _1476 * _1510;
    float _1568 = fma(_1472, _1286, _1548);
    float _1570 = fma(_1472, _1288, _1558);
    float _1572 = fma(_1472, _1290, _1550);
    float _1574 = fma(_1444, _1480, _1562);
    float _1576 = fma(_1444, _1448, _1564);
    float _1578 = fma(_1444, _1454, _1566);
    float _1580 = fma(_1444, _1546, _1484);
    float _1582 = fma(_1464, _1286, _1574);
    float _1584 = fma(_1396, _1568, _1552);
    float _1586 = fma(_1396, _1570, _1554);
    float _1588 = fma(_1396, _1572, _1556);
    float _1590 = fma(_1464, _1288, _1576);
    float _1592 = fma(_1464, _1290, _1578);
    float _1594 = fma(_1464, _1546, _1488);
    float _1596 = _1582 + _1584;
    float _1598 = _1590 + _1586;
    float _1600 = _1592 + _1588;
    float _1602 = fma(_1416, 2.0, -1.0);
    float _1604 = _1502 * _1560;
    float _1606 = _1506 * _1560;
    float _1608 = _1510 * _1560;
    out.m_83.x = _1596;
    out.m_83.y = _1598;
    out.m_83.z = _1600;
    float _1610 = _1602 * (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _1612 = fma(_1480, _1580, _1604);
    float _1614 = fma(_1448, _1580, _1606);
    float _1616 = fma(_1454, _1580, _1608);
    float _1618 = fma(_1610, (*spvDescriptorSet0.vp_c12)._m0[4].x, _1490);
    float _1620 = fma(_1610, (*spvDescriptorSet0.vp_c12)._m0[4].y, _1498);
    float _1622 = fma(_1610, (*spvDescriptorSet0.vp_c12)._m0[4].z, _1512);
    float _1624 = fma(_1286, _1594, _1612);
    float _1626 = fma(_1288, _1594, _1614);
    float _1628 = fma(_1290, _1594, _1616);
    float _1630 = _1618 + (*spvDescriptorSet0.vp_c12)._m0[5].x;
    float _1632 = _1620 + (*spvDescriptorSet0.vp_c12)._m0[5].y;
    float _1634 = _1622 + (*spvDescriptorSet0.vp_c12)._m0[5].z;
    float _1636 = _1624 + _1630;
    float _1638 = _1626 + _1632;
    float _1640 = _1628 + _1634;
    float _1642 = _1564;
    float _1644 = _1628;
    float _1646 = _1622;
    float _1648 = _1628;
    float _1650 = _1624;
    float _1652 = _1622;
    float _1654 = _1398;
    float _1656 = _1408;
    float _1658 = _1610;
    float _1660 = _1602;
    int _1662 = as_type<int>(_1640);
    float _1664 = _1638;
    float _1666 = _1580;
    float _1676;
    float _1678;
    float _1680;
    float _1682;
    if (!_1384)
    {
        bool _1668 = _1632 > (*spvDescriptorSet0.vp_c12)._m0[10].y;
        bool _1670 = !_1668;
        _1672 = _1670;
        if (!_1672)
        {
            float _1674 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
            _1676 = _1674;
            _1678 = 0.0;
            _1680 = 0.0;
            _1682 = 0.0;
            _1684 = true;
        }
    }
    if ((!_1684) || _1672)
    {
        bool _1722;
        if (!_1672)
        {
            bool _1686 = _1632 >= (*spvDescriptorSet0.vp_c12)._m0[10].y;
            bool _1688 = isnan(_1632);
            bool _1690 = _1686 || _1688;
            bool _1692 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].y);
            bool _1694 = _1690 || _1692;
            bool _1696 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _1698 = !_1694;
            bool _1700 = _1696 && _1698;
            bool _1702 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            float _1704 = (*spvDescriptorSet0.vp_c12)._m0[10].x;
            if (_1700)
            {
                _1642 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
            }
            float _1706 = _1642;
            float _1708 = _1706;
            if (_1700)
            {
                _1644 = 0.0;
            }
            float _1710 = _1644;
            _1648 = _1710;
            _1678 = _1710;
            if (_1700)
            {
                _1704 = 0.0;
            }
            float _1712 = _1704;
            _1650 = _1712;
            _1680 = _1712;
            if (_1700)
            {
                float _1714 = _1706 * 5.0;
                _1708 = _1714;
            }
            float _1716 = _1708;
            _1676 = _1716;
            if (_1700)
            {
                _1646 = 0.0;
            }
            float _1718 = _1646;
            bool _1720 = !_1694;
            _1722 = _1720 && _1702;
            _1652 = _1718;
            _1682 = _1718;
        }
        if ((!_1722) || _1672)
        {
            _1672 = false;
            float _1724 = _1648;
            float _1726 = _1650;
            float _1728 = _1652;
            bool _1730 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].x;
            bool _1732 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].y;
            bool _1734 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].z;
            float _1736 = _1288;
            float _1738 = _1726;
            float _1740 = _1728;
            _1676 = _1640;
            if (_1730)
            {
                float _1742 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].x;
                _1736 = _1742;
            }
            float _1744 = _1736;
            if (_1730)
            {
                float _1746 = abs(_1398);
                float _1748 = -_1746;
                float _1750 = _1748 + 1.0;
                _1654 = _1750;
            }
            float _1752 = _1654;
            if (_1732)
            {
                float _1754 = abs(_1408);
                float _1756 = -_1754;
                float _1758 = _1756 + 1.0;
                _1656 = _1758;
            }
            float _1760 = _1656;
            if (!_1730)
            {
                _1658 = 1.0;
            }
            float _1762 = _1658;
            float _1764 = _1762;
            if (_1734)
            {
                float _1766 = abs(_1602);
                float _1768 = -_1766;
                float _1770 = _1768 + 1.0;
                _1660 = _1770;
            }
            float _1772 = _1660;
            if (!_1732)
            {
                _1738 = 1.0;
            }
            float _1774 = _1738;
            float _1776 = _1774;
            if (!_1734)
            {
                _1740 = 1.0;
            }
            float _1778 = _1740;
            float _1780 = _1594;
            float _1782 = _1778;
            if (_1732)
            {
                float _1784 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].y;
                _1780 = _1784;
            }
            float _1786 = _1780;
            float _1788 = _1724;
            if (_1734)
            {
                float _1790 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].z;
                _1788 = _1790;
            }
            float _1792 = _1788;
            if (_1730)
            {
                float _1794 = _1752 * _1744;
                float _1796 = precise::clamp(_1794, 0.0, 1.0);
                _1764 = _1796;
            }
            float _1798 = _1764;
            if (_1732)
            {
                float _1800 = _1760 * _1786;
                float _1802 = precise::clamp(_1800, 0.0, 1.0);
                _1776 = _1802;
            }
            float _1804 = _1776;
            float _1806 = _1798 * _1804;
            _1680 = _1638;
            if (_1734)
            {
                float _1808 = _1772 * _1792;
                float _1810 = precise::clamp(_1808, 0.0, 1.0);
                _1782 = _1810;
            }
            float _1812 = _1782;
            float _1814 = _1806 * _1812;
            _1678 = _1636;
            _1682 = _1814;
        }
    }
    _1684 = false;
    float _1816 = _1676;
    float _1818 = _1678;
    float _1820 = _1680;
    float _1822 = _1682;
    float _1824 = _1632 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1826 = fma(_1630, 6.2500002968590706586837768554688e-05, 0.5);
    float _1828 = _1824 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1830 = _1824 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1832 = fma(_1630, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1828);
    float _1834 = fma(_1630, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1830);
    float _1836 = fma(_1634, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1832);
    float _1838 = fma(_1634, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1834);
    float _1840 = _1836 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1842 = _1838 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1844 = trunc(_1840);
    int _1846 = int(_1844);
    float _1848 = trunc(_1842);
    int _1850 = int(_1848);
    int _1852 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1854 = _1846 + _1852;
    int _1856 = _1854 + 1;
    bool _1858 = _1856 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1860 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1862 = _1850 + _1860;
    int _1864 = _1862 + 1;
    int _1866 = _1856 | _1864;
    bool _1868 = _1866 < 0;
    bool _1870 = _1868 || _1858;
    bool _1872 = _1864 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1874 = _1872 || _1870;
    int _1876 = _1864;
    int _1878 = _1856;
    float _1880 = as_type<float>(_1866);
    float _1882 = _1842;
    float _1884 = _1818;
    float _1886 = _1816;
    if (!_1874)
    {
        int _1888 = _1864 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1890 = _1888 + _1856;
        _1662 = _1890;
    }
    int _1892 = _1662;
    float _1894 = _1618;
    if (!_1874)
    {
        float _1896 = floor(_1840);
        _1894 = _1896;
    }
    float _1898 = _1894;
    if (!_1874)
    {
        int _1900 = _1892 << 2;
        _1876 = _1900;
    }
    int _1902 = _1876;
    int _1904 = _1902;
    if (!_1874)
    {
        uint _1907 = uint(int(uint(_1892) >> uint(2)));
        _1878 = int(_1907);
    }
    int _1909 = _1878;
    if (!_1874)
    {
        int _1911 = 12 & _1902;
        _1904 = _1911;
    }
    int _1913 = _1904;
    if (!_1874)
    {
        int _1915 = _1909 << 4;
        int _1917 = _1915 + _1913;
        _1880 = as_type<float>(_1917);
    }
    float _1919 = _1880;
    float _1921 = fma(_1634, 6.2500002968590706586837768554688e-05, 0.5);
    float _1923 = as_type<float>(_1913);
    if (!_1874)
    {
        float _1925 = floor(_1842);
        _1923 = _1925;
    }
    float _1927 = _1923;
    if (!_1874)
    {
        float _1929 = -_1898;
        float _1931 = _1840 + _1929;
        _1664 = _1931;
    }
    float _1933 = _1664;
    float _1935 = _1919;
    if (!_1874)
    {
        int _1937 = as_type<int>(_1919) + 400;
        uint _1939 = uint(int(uint(_1937) >> uint(2)));
        uint _1941 = uint(int(uint(int(_1939)) >> uint(2)));
        int _1943 = int(_1939) & 3;
        float _1945 = (*spvDescriptorSet0.vp_c15)._m0[int(_1941)][_1943];
        _1935 = _1945;
    }
    float _1947 = _1935;
    float2 _6224 = float2(_1826, _1921);
    float _1949 = dm_bs(spvDescriptorSet0.vp_t_tcb_22.sample(spvDescriptorSet0.vp_t_tcb_22Smplr, select(_6224, float2(0.0), isnan(_6224)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_22, spvDescriptorSet0.vp_t_tcb_22Smplr_w, select(_6224, float2(0.0), isnan(_6224)), level(0.0)).x;
    float _1951 = _1927;
    if (!_1874)
    {
        float _1953 = -_1927;
        float _1955 = _1842 + _1953;
        _1951 = _1955;
    }
    float _1957 = _1951;
    float _1959 = _1620;
    if (!_1874)
    {
        float _1961 = rint(_1947);
        float _1963 = precise::max(_1961, 0.0);
        uint _1965 = uint(_1963);
        uint _1967 = clamp(_1965, 0u, 65535u);
        _1959 = as_type<float>(_1967);
    }
    float _1969 = _1959;
    float _1971 = _1957;
    float _1973 = _1969;
    if (!_1874)
    {
        float3 _6272 = float3(_1933, _1957, float(as_type<int>(_1969)));
        float3 _6276 = select(_6272, float3(0.0), isnan(_6272));
        float _1975 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6276.xy, uint(rint(_6276.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6276.xy, uint(rint(_6276.z)), level(0.0)).x;
        _1971 = _1975;
    }
    float _1977 = _1971;
    float _1979 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1981 = _1816 + _1979;
    float _1983 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1985 = _1818 + _1983;
    float _1987 = _1981 * _1981;
    float _1989 = fma(_1985, _1985, _1987);
    float _1991 = sqrt(_1989);
    bool _1993 = _1991 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1995 = _1985;
    if (!_1993)
    {
        _1882 = _1820;
    }
    float _1997 = _1882;
    bool _1999 = !_1993;
    float _2001 = _1997;
    if (!_1999)
    {
        float _2003 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2005 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2007 = _1991 + _2005;
        float _2009 = _1820 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2011 = rsqrt(_1989);
        float _2013 = _2007 * _2003;
        float _2015 = _2013 * 0.15915493667125701904296875;
        float _2017 = _2015 * 6.283185482025146484375;
        float _2019 = cos(_2017);
        float _2021 = _2015 * 6.283185482025146484375;
        float _2023 = sin(_2021);
        float _2025 = _2019 + (-1.0);
        float _2027 = _2025 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2029 = fma(_2023, _2009, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2031 = _2011 * _2029;
        float _2033 = fma(_2019, _1820, _2027);
        float _2035 = fma(_1985, _2031, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2037 = fma(_1981, _2031, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2001 = _2033;
        _1884 = _2035;
        _1886 = _2037;
    }
    float _2039 = _2001;
    float _2041 = _1884;
    float _2043 = _1886;
    float _2045 = -_1632;
    float _2047 = _2045 + _2039;
    float _2049 = -_1630;
    float _2051 = _2049 + _2041;
    float _2053 = -_1634;
    float _2055 = _2053 + _2043;
    float _2057 = _2047 * _2047;
    bool _2059 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2061 = isnan(0.5);
    bool _2063 = _2059 || _2061;
    bool _2065 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2067 = _2063 || _2065;
    float _2069 = fma(_2051, _2051, _2057);
    float _2071 = fma(_2055, _2055, _2069);
    float _2073 = sqrt(_2071);
    bool _2075 = _2073 > 0.0;
    bool _2077 = !_2075;
    float _2079 = _2041;
    float _2081 = _2043;
    float _2083 = _2039;
    float _2085 = _2047;
    if (!_2077)
    {
        float _2087 = _268 * _268;
        float _2089 = fma(_312, _312, _2087);
        float _2091 = fma(_314, _314, _2089);
        float _2093 = rsqrt(_2071);
        float _2095 = sqrt(_2091);
        float _2097 = _2051 * _2093;
        float _2099 = _2047 * _2093;
        float _2101 = _2055 * _2093;
        bool _2103 = _2095 > 0.0;
        bool _2105 = !_2103;
        _1995 = _2099;
        _1973 = _2097;
        if (!_2105)
        {
            float _2107 = rsqrt(_2091);
            float _2109 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2111 = _268 * _2107;
            float _2113 = _312 * _2107;
            float _2115 = _314 * _2107;
            float _2117 = _2099 * _2111;
            float _2119 = fma(_2097, _2113, _2117);
            float _2121 = _2109 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2123 = fma(_2101, _2115, _2119);
            float _2125 = _2123 * _2121;
            float _2127 = fma(_312, _2125, _2041);
            float _2129 = fma(_268, _2125, _2039);
            float _2131 = fma(_314, _2125, _2043);
            _2079 = _2127;
            _2081 = _2131;
            _2083 = _2129;
            _2085 = _2121;
        }
    }
    float _2133 = _2079;
    float _2135 = _2081;
    float _2137 = _2083;
    float _2139 = _2085;
    float _2141 = _1995;
    float _2143 = _1973;
    float _2145 = _2137;
    float _2147 = _2133;
    float _2149 = _2135;
    float _2151 = _2143;
    float _2153 = _2141;
    if (!_2067)
    {
        float _2155 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2157 = _1632 + _2155;
        float _2159 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2161 = _1630 + _2159;
        float _2163 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2165 = -_1630;
        float _2167 = _2165 + _2133;
        float _2169 = _2157 * _2157;
        float _2171 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2173 = _1634 + _2171;
        float _2175 = -_1634;
        float _2177 = _2175 + _2135;
        float _2179 = fma(_2161, _2161, _2169);
        float _2181 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2183 = fma(_2173, _2173, _2179);
        float _2185 = sqrt(_2183);
        float _2187 = _2163 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2189 = precise::min(_2185, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2191 = _2189 * _2181;
        float _2193 = _2187 * _2191;
        float _2195 = -_1632;
        float _2197 = _2195 + _2137;
        float _2199 = fma(_2167, _2193, _1630);
        float _2201 = fma(_2197, _2193, _1632);
        float _2203 = fma(_2177, _2193, _1634);
        _2145 = _2201;
        _2147 = _2199;
        _2149 = _2203;
    }
    float _2205 = _2145;
    float _2207 = _2147;
    float _2209 = _2149;
    float _2211 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2213 = _2205 + _2211;
    float _2215 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2217 = _2207 + _2215;
    float _2219 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2221 = _2209 + _2219;
    float _2223 = _2213 * _2213;
    float _2225 = fma(_2217, _2217, _2223);
    float _2227 = fma(_2221, _2221, _2225);
    float _2229 = rsqrt(_2227);
    float _2231 = sqrt(_2227);
    float _2233 = _2229 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2235 = _2217 * _2233;
    float _2237 = _2221 * _2233;
    float _2239 = _2235 * _2235;
    float _2241 = _2237 * _2237;
    float _2243 = _2239 + _2241;
    float _2245 = sqrt(_2243);
    bool _2247 = _2245 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2249 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2251 = _2245 + _2249;
    float _2253 = _2139;
    float _2255 = _2251;
    if (_2247)
    {
        float _2257 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2253 = _2257;
    }
    float _2259 = _2253;
    if (_2247)
    {
        float _2261 = rsqrt(_2243);
        _2151 = _2261;
    }
    float _2263 = _2151;
    float _2265 = _2263;
    if (_2247)
    {
        float _2267 = _2251 * _2259;
        _2255 = _2267;
    }
    float _2269 = _2255;
    if (_2247)
    {
        float _2271 = _2269 * 0.15915493667125701904296875;
        _2153 = _2271;
    }
    float _2273 = _2153;
    float _2275 = _2259;
    float _2277 = _2273;
    if (_2247)
    {
        float _2279 = _2273 * 6.283185482025146484375;
        float _2281 = sin(_2279);
        _2275 = _2281;
    }
    float _2283 = _2275;
    float _2285 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2287 = precise::max(0.0, _2285);
    float _2289 = _2055;
    float _2291 = _2287;
    if (_2247)
    {
        float _2293 = _2273 * 6.283185482025146484375;
        float _2295 = cos(_2293);
        _2289 = _2295;
    }
    float _2297 = _2289;
    float _2299 = -_2233;
    float _2301 = -_2287;
    float _2303 = fma(_2213, _2299, _2301);
    float _2305 = _2303;
    if (_2247)
    {
        float _2307 = _2303 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2291 = _2307;
    }
    float _2309 = _2291;
    float _2311 = _2283;
    float _2313 = _2309;
    if (_2247)
    {
        float _2315 = fma(_2283, _2309, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2311 = _2315;
    }
    float _2317 = _2311;
    float _2319 = _2317;
    float _2321 = _2297;
    if (_2247)
    {
        float _2323 = _2297 + (-1.0);
        _2313 = _2323;
    }
    float _2325 = _2313;
    float _2327 = _2325;
    if (_2247)
    {
        float _2329 = _2263 * _2317;
        _1666 = _2329;
    }
    float _2331 = _1666;
    if (!_2247)
    {
        _2319 = _2235;
    }
    float _2333 = _2319;
    float _2335 = _2333;
    if (_2247)
    {
        float _2337 = _2325 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2277 = _2337;
    }
    float _2339 = _2277;
    if (_2247)
    {
        float _2341 = _2235 * _2331;
        _2335 = _2341;
    }
    float _2343 = _2335;
    if (!_2247)
    {
        _2327 = _2237;
    }
    float _2345 = _2327;
    float _2347 = _2345;
    if (_2247)
    {
        float _2349 = _2237 * _2331;
        _2347 = _2349;
    }
    float _2351 = _2347;
    if (!_2247)
    {
        _2265 = _2239;
    }
    float _2353 = _2265;
    float _2355 = _2353;
    if (_2247)
    {
        float _2357 = fma(_2303, _2297, _2339);
        _2305 = _2357;
    }
    float _2359 = _2305;
    if (_2247)
    {
        float _2361 = _2343 * _2343;
        _2355 = _2361;
    }
    float _2363 = _2355;
    if (!_2247)
    {
        _2321 = _2241;
    }
    float _2365 = _2321;
    float _2367 = _2365;
    if (_2247)
    {
        float _2369 = _2351 * _2351;
        _2367 = _2369;
    }
    float _2371 = _2367;
    float _2373 = fma(_2359, _2359, _2363);
    float _2375 = abs(_1949);
    bool _2377 = _2375 != 0.0;
    bool _2379 = isnan(_2375);
    bool _2381 = _2377 || _2379;
    bool _2383 = isnan(0.0);
    bool _2385 = _2381 || _2383;
    float _2387 = _2373 + _2371;
    float _2389 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2391 = fma(_2231, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2389);
    float _2393 = precise::clamp(_2391, 0.0, 1.0);
    float _2395 = -_2393;
    float _2397 = _2395 + 1.0;
    float _2399 = rsqrt(_2387);
    float _2401 = _2205 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2403 = fma(_2207, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2401);
    float _2405 = abs(_2397);
    float _2407 = log2(_2405);
    float _2409 = fma(_2209, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2403);
    float _2411 = _2409 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2413 = _2399 * _2343;
    float _2415 = _2399 * _2359;
    float _2417 = _2399 * _2351;
    float _2419 = _2411 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2421 = _2413 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2423 = _2205 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2425 = _2411 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2427 = -_2421;
    float _2429 = fma(_2415, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2427);
    float _2431 = fma(_2207, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2423);
    float _2433 = _2407 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2435 = _2411 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2437 = -_2417;
    float _2439 = fma(_2437, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2429);
    float _2441 = fma(_2209, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2431);
    float _2443 = _2411 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2445 = _2205 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2447 = fma(_2439, -0.5, 0.5);
    float _2449 = _2441 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2451 = exp2(_2433);
    float _2453 = fma(_2439, 0.5, 0.5);
    float _2455 = fma(_2207, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2445);
    float _2457 = fma(_2449, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2443);
    float _2459 = fma(_2449, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2419);
    float _2461 = fma(_2449, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2435);
    float _2463 = fma(_2209, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2455);
    float _2465 = _2415 + 1.0;
    float _2467 = sqrt(_2447);
    float _2469 = fma(_2453, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2471 = _2463 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2473 = fma(_2453, _2469, -0.212114393711090087890625);
    float _2475 = fma(_2471, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2459);
    float _2477 = fma(_2471, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2457);
    float _2479 = -_2415;
    float _2481 = fma(_2451, _2465, _2479);
    float _2483 = fma(_2449, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2425);
    float _2485 = _2205 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2487 = fma(_2471, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2461);
    float _2489 = _2471 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2491 = fma(_2471, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2483);
    float _2493 = fma(_2207, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2485);
    float _2495 = fma(_2453, _2473, 1.570728778839111328125);
    float _2497 = _2467 * 0.636619746685028076171875;
    float _2499 = fma(_2209, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2493);
    float _2501 = -_2495;
    float _2503 = fma(_2497, _2501, 1.0);
    float _2505 = _2499 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2507 = fma(_2505, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2475);
    float _2509 = fma(_2505, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2477);
    float _2511 = fma(_2505, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2487);
    float _2513 = fma(_2505, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2491);
    float _2515 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    out.gl_Position.x = _2509;
    out.gl_Position.y = _2507;
    out.gl_Position.z = _2511;
    out.gl_Position.w = _2513;
    float _2517 = -_2489;
    float _2519 = fma(_2517, _2515, 1.0);
    float _2521 = _2461;
    if (_2385)
    {
        _2521 = _2513;
    }
    float _2523 = _2521;
    float _2525 = _2523;
    if (!_2385)
    {
        out.gl_Position.w = 0.0;
    }
    float _2527 = log2(_2519);
    if (!_2385)
    {
        _2525 = 0.0;
    }
    float _2529 = _2525;
    float _2531 = _2529;
    if (!_1874)
    {
        int _2533 = _1892 << 4;
        int _2535 = _2533 + 2048;
        uint _2537 = uint(int(uint(_2535) >> uint(2)));
        uint _2539 = uint(int(uint(int(_2537)) >> uint(2)));
        int _2541 = int(_2537) & 3;
        float _2543 = (*spvDescriptorSet0.vp_c15)._m0[int(_2539)][_2541];
        int _2545 = int(_2537) + 1;
        uint _2547 = uint(int(uint(_2545) >> uint(2)));
        int _2549 = _2545 & 3;
        float _2551 = (*spvDescriptorSet0.vp_c15)._m0[int(_2547)][_2549];
        int _2553 = _2535 + 8;
        uint _2555 = uint(int(uint(_2553) >> uint(2)));
        uint _2557 = uint(int(uint(int(_2555)) >> uint(2)));
        int _2559 = int(_2555) & 3;
        float _2561 = (*spvDescriptorSet0.vp_c15)._m0[int(_2557)][_2559];
        int _2563 = int(_2555) + 1;
        uint _2565 = uint(int(uint(_2563) >> uint(2)));
        int _2567 = _2563 & 3;
        float _2569 = (*spvDescriptorSet0.vp_c15)._m0[int(_2565)][_2567];
        float _2571 = _1824 * _2551;
        float _2573 = fma(_1630, _2543, _2571);
        float _2575 = fma(_1634, _2561, _2573);
        float _2577 = _2575 + _2569;
        float _2579 = precise::clamp(_2577, 0.0, 1.0);
        float _2581 = -_2579;
        float _2583 = _2581 + _1977;
        float _2585 = fma(_2583, 500.0, 1.5);
        float _2587 = exp2(_2585);
        float _2589 = 0.0 + _2587;
        float _2591 = precise::clamp(_2589, 0.0, 1.0);
        bool _2593 = _2591 >= 1.0;
        bool _2595 = isnan(_2591);
        bool _2597 = _2593 || _2595;
        bool _2599 = isnan(1.0);
        bool _2601 = _2597 || _2599;
        if (!_2601)
        {
            out.gl_Position.w = 0.0;
        }
        if (!_2601)
        {
            _2531 = 0.0;
        }
    }
    float _2603 = _2531;
    float _2605 = 1.0 / _2603;
    float _2607 = _2527 * 0.693147182464599609375;
    float _2609 = fma(_2481, 0.5, 0.5);
    float _2611 = _2607 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2613 = _2509 * _2605;
    float _2615 = _2507 * _2605;
    float _2617 = fma(_2613, 0.5, 0.5);
    float _2619 = fma(_2615, -0.5, 0.5);
    float3 _7314 = float3(_2617, _2619, _2611);
    float _2621 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7314, float3(0.0), isnan(_7314)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7314, float3(0.0), isnan(_7314)), level(0.0)).x;
    float3 _7323 = float3(_2617, _2619, _2611);
    float4 _2624 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7323, float3(0.0), isnan(_7323)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7323, float3(0.0), isnan(_7323)), level(0.0)).xyzw;
    float _2626 = _2624.x;
    float _2628 = _2624.y;
    float _2630 = _2624.z;
    float _2632 = _2624.w;
    float2 _7339 = float2(_2503, _2609);
    float3 _2636 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7339, float2(0.0), isnan(_7339)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7339, float2(0.0), isnan(_7339)), level(0.0)).xyz;
    float _2638 = _2636.x;
    float _2640 = _2636.y;
    float _2642 = _2636.z;
    float _2644 = _1632 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2646 = _1632 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2648 = _1632 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2650 = _1632 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2652 = fma(_1630, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2644);
    float _2654 = fma(_1630, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2646);
    float _2656 = fma(_1630, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2648);
    float _2658 = fma(_1630, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2650);
    float _2660 = fma(_1634, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2652);
    float _2662 = fma(_1634, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2654);
    float _2664 = fma(_1634, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2656);
    float _2666 = _2407 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2668 = _2660 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2670 = _2662 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2672 = _2664 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2674 = fma(_1634, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2658);
    float _2676 = _2668 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2678 = _2511 + _2513;
    float _2680 = _2513 * 0.5;
    float _2682 = _2672 * (*spvDescriptorSet0.vp_c8)._m0[7].z;
    float _2684 = fma(_2670, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2676);
    float _2686 = _1822 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2688 = fma(_2507, -0.5, _2680);
    float _2690 = _2509 + _2513;
    float _2692 = _2674 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2694 = _2682 + _2684;
    float _2696 = _2678 * 0.5;
    float _2698 = _2690 * 0.5;
    float _2700 = _318 * _2686;
    float _2702 = fma(_2692, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2694);
    float _2704 = _2668 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2706 = -_268;
    float _2708 = _2706 + _2205;
    float _2710 = _2668 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2712 = exp2(_2666);
    float _2714 = _2668 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_85.x = _2698;
    out.m_85.y = _2688;
    out.m_85.z = _2696;
    out.m_85.w = _2513;
    float _2716 = fma(_2670, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2704);
    float _2718 = -_312;
    float _2720 = _2718 + _2207;
    float _2722 = _2708 * (*spvDescriptorSet0.vp_c15)._m0[638].y;
    float _2724 = fma(_2670, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2710);
    float _2726 = fma(_2670, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2714);
    float _2728 = 1.0 / _2702;
    out.m_87.y = 1.0;
    float _2730 = fma(_2672, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2726);
    out.m_89.x = _2217;
    out.m_89.y = _2213;
    out.m_89.z = _2221;
    float _2732 = _2708 * (*spvDescriptorSet0.vp_c15)._m0[635].y;
    float _2734 = _2708 * (*spvDescriptorSet0.vp_c15)._m0[636].y;
    float _2736 = fma(_2720, (*spvDescriptorSet0.vp_c15)._m0[638].x, _2722);
    float _2738 = -_314;
    float _2740 = _2738 + _2209;
    float _2742 = fma(_2720, (*spvDescriptorSet0.vp_c15)._m0[635].x, _2732);
    float _2744 = fma(_2720, (*spvDescriptorSet0.vp_c15)._m0[636].x, _2734);
    float _2746 = _2672 * (*spvDescriptorSet0.vp_c8)._m0[4].z;
    float _2748 = fma(_2740, (*spvDescriptorSet0.vp_c15)._m0[638].z, _2736);
    float _2750 = fma(_2740, (*spvDescriptorSet0.vp_c15)._m0[635].z, _2742);
    float _2752 = fma(_2740, (*spvDescriptorSet0.vp_c15)._m0[636].z, _2744);
    float _2754 = fma(_2692, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2730);
    float _2756 = _2672 * (*spvDescriptorSet0.vp_c8)._m0[5].z;
    float _2758 = -_2712;
    float _2760 = _2758 + 1.0;
    float _2762 = _2746 + _2716;
    float _2764 = _2754 * _2728;
    float _2766 = _2756 + _2724;
    float _2768 = _2760 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2770 = fma(_2692, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2762);
    float _2772 = _2748 + (*spvDescriptorSet0.vp_c15)._m0[638].w;
    bool _2774 = _2764 > 0.0;
    float _2776 = fma(_2692, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2766);
    float _2778 = _2770 * _2728;
    float _2780 = 1.0 / _2772;
    bool _2782 = _2764 < 1.0;
    bool _2784 = _2782 && _2774;
    float _2786 = _2776 * _2728;
    float _2788 = -_2768;
    float _2790 = _2788 + 1.0;
    float _2792 = _2750 + (*spvDescriptorSet0.vp_c15)._m0[635].w;
    bool _2794 = _2613 > (-1.0);
    bool _2796 = _2794 && _2784;
    float _2798 = _2752 + (*spvDescriptorSet0.vp_c15)._m0[636].w;
    bool _2800 = _2615 > (-1.0);
    bool _2802 = _2800 && _2796;
    bool _2804 = _2613 < 1.0;
    bool _2806 = _2804 && _2802;
    float _2808 = _2792 * _2780;
    bool _2810 = _2615 < 1.0;
    bool _2812 = _2810 && _2806;
    float _2814 = _2798 * _2780;
    float _2816 = _2768 * _2621;
    float _2818 = _2632 * _2816;
    float _2820 = _2642 * _2816;
    float _2822 = _2632 * _2790;
    float _2824 = fma(_2638, _2818, _2626);
    float _2826 = fma(_2640, _2818, _2628);
    float _2828 = fma(_2632, _2820, _2630);
    out.m_91.x = _2824;
    out.m_91.y = _2826;
    out.m_91.z = _2828;
    out.m_91.w = _2822;
    bool _2830 = !_2812;
    float _2832 = _2818;
    float _2834 = _2790;
    float _2836 = _2746;
    float _2838 = _2700;
    float _2866;
    float _2868;
    float _2870;
    if (!_2830)
    {
        float _2840 = -_2786;
        float _2842 = _2615 + _2840;
        float _2844 = -_2778;
        float _2846 = _2613 + _2844;
        float _2848 = -_2808;
        float _2850 = _2613 + _2848;
        float _2852 = -_2814;
        float _2854 = _2615 + _2852;
        float _2856 = _2842 * _2842;
        float _2858 = fma(_2846, _2846, _2856);
        float _2860 = sqrt(_2858);
        bool _2862 = _2860 > 0.0;
        bool _2864 = !_2862;
        _2866 = _2860;
        _2832 = _2842;
        _2868 = _2846;
        _2870 = _2858;
        _2872 = _2864;
        if (!_2872)
        {
            float _2874 = _2854 * _2854;
            float _2876 = fma(_2850, _2850, _2874);
            float _2878 = rsqrt(_2858);
            float _2880 = sqrt(_2876);
            float _2882 = _2846 * _2878;
            float _2884 = _2842 * _2878;
            bool _2886 = _2880 > 0.0;
            bool _2888 = !_2886;
            _2866 = _2878;
            _2834 = _2880;
            _2872 = _2888;
            if (!_2872)
            {
                float _2890 = _1440 * _2692;
                float _2892 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
                float _2894 = fma(_2890, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2682);
                float _2896 = fma(_2890, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2746);
                float _2898 = fma(_2890, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2756);
                float _2900 = fma(_2692, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2894);
                float _2902 = rsqrt(_2876);
                float _2904 = fma(_2692, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2898);
                float _2906 = fma(_2692, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2896);
                float _2908 = 1.0 / _2900;
                float _2910 = _2892 * (*spvDescriptorSet0.vp_c13)._m0[0].w;
                float _2912 = _2854 * _2910;
                float _2914 = _2850 * _2910;
                float _2916 = _2912 * _2912;
                float _2918 = fma(_2914, _2914, _2916);
                float _2920 = _2854 * _2902;
                float _2922 = _2850 * _2902;
                float _2924 = _2904 * _2908;
                float _2926 = _2906 * _2908;
                float _2928 = _2884 * _2920;
                float _2930 = sqrt(_2918);
                float _2932 = _2924 * _2924;
                float _2934 = fma(_2882, _2922, _2928);
                float _2936 = fma(_2926, _2926, _2932);
                float _2938 = precise::min(0.0, _2934);
                float _2940 = sqrt(_2936);
                float _2942 = _2938 * _2603;
                float _2944 = fma(_2914, _2942, _2509);
                float _2946 = fma(_2912, _2942, _2507);
                out.gl_Position.x = _2944;
                out.gl_Position.y = _2946;
                float _2948 = fma(_2930, (*spvDescriptorSet0.vp_c13)._m0[1].x, _2940);
                float _2950 = 1.0 / _2948;
                float _2952 = _2940 * _2950;
                out.m_87.y = _2952;
                _2866 = _2942;
                _2832 = _2930;
                _2834 = _2952;
                _2868 = _2914;
                _2870 = _2912;
                _2836 = _2934;
                _2872 = true;
            }
        }
    }
    else
    {
        float _2954 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        out.gl_Position.z = _2954;
        _2866 = 0.0;
        _2868 = 0.0;
        _2870 = _2954;
        _2836 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
        _2838 = 0.0;
    }
    _2872 = false;
    float _2956 = _2866;
    float _2958 = _2832;
    float _2960 = _2834;
    float _2962 = _2868;
    float _2964 = _2870;
    float _2966 = _2836;
    float _2968 = _2838;
    bool _2970 = _2231 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2972 = isnan(_2231);
    bool _2974 = _2970 || _2972;
    bool _2976 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2978 = _2974 || _2976;
    float _2980 = _2960;
    float _2982 = _2958;
    float _2984 = _2964;
    float _2986 = _2962;
    float _2988 = _2956;
    float _2990 = _2966;
    if (!_2978)
    {
        _2980 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2992 = _2980;
    float _2994 = _2992;
    float _2996 = _2992;
    if (!_2978)
    {
        _2982 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2998 = _2982;
    float _3000 = _2998;
    float _3002 = _2998;
    if (!_2978)
    {
        _2984 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3004 = _2984;
    float _3006 = _3004;
    float _3008 = _3004;
    if (!_2978)
    {
        _2986 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3010 = _2986;
    float _3012 = _3010;
    float _3014 = _3010;
    if (!_2978)
    {
        _2988 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3016 = _2988;
    float _3018 = _3016;
    float _3020 = _3016;
    if (!_2978)
    {
        _2990 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3022 = _2990;
    bool _3024 = !_2978;
    float _3026 = _3022;
    float _3028 = _3022;
    if (!_3024)
    {
        bool _3030 = _2231 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3032 = isnan(_2231);
        bool _3034 = _3030 || _3032;
        bool _3036 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3038 = _3034 || _3036;
        if (!_3038)
        {
            float _3040 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3042 = _2231 + _3040;
            float _3044 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3046 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3044;
            float _3048 = 1.0 / _3046;
            float _3050 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3052 = _3050 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3054 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3056 = _3054 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3058 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3060 = _3058 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3062 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3064 = _3062 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3066 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3068 = _3066 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3070 = _3042 * _3048;
            float _3072 = precise::clamp(_3070, 0.0, 1.0);
            float _3074 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3076 = _3074 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3078 = fma(_3072, _3052, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3080 = fma(_3072, _3076, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3082 = fma(_3072, _3056, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3084 = fma(_3072, _3060, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3086 = fma(_3072, _3064, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3088 = fma(_3072, _3068, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3002 = _3080;
            _3020 = _3086;
            _2996 = _3078;
            _3014 = _3084;
            _3008 = _3082;
            _3028 = _3088;
            _3090 = true;
        }
        else
        {
            bool _3092 = _2231 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3094 = isnan(_2231);
            bool _3096 = _3092 || _3094;
            bool _3098 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3100 = _3096 || _3098;
            if (!_3100)
            {
                _2994 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3102 = _2994;
            _2996 = _3102;
            if (!_3100)
            {
                _3000 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3104 = _3000;
            _3002 = _3104;
            if (!_3100)
            {
                _3006 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3106 = _3006;
            _3008 = _3106;
            if (!_3100)
            {
                _3012 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3108 = _3012;
            _3014 = _3108;
            if (!_3100)
            {
                _3018 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3110 = _3018;
            _3020 = _3110;
            if (!_3100)
            {
                _3026 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3112 = _3026;
            bool _3114 = !_3100;
            _3028 = _3112;
            if (!_3114)
            {
                bool _3116 = _2231 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3118 = isnan(_2231);
                bool _3120 = _3116 || _3118;
                bool _3122 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3124 = _3120 || _3122;
                if (!_3124)
                {
                    float _3126 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3128 = _2231 + _3126;
                    float _3130 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3132 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3130;
                    float _3134 = 1.0 / _3132;
                    float _3136 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3138 = _3136 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3140 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3142 = _3140 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3144 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3146 = _3144 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3148 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3150 = _3148 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3152 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3154 = _3152 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3156 = _3128 * _3134;
                    float _3158 = precise::clamp(_3156, 0.0, 1.0);
                    float _3160 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3162 = _3160 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3164 = fma(_3158, _3138, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3166 = fma(_3158, _3162, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3168 = fma(_3158, _3142, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3170 = fma(_3158, _3146, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3172 = fma(_3158, _3150, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3174 = fma(_3158, _3154, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3002 = _3166;
                    _3020 = _3172;
                    _2996 = _3164;
                    _3014 = _3170;
                    _3008 = _3168;
                    _3028 = _3174;
                    _3090 = true;
                }
                else
                {
                    _3002 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3020 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2996 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3014 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3008 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3028 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3090 = false;
    float _3176 = _3002;
    float _3178 = _3020;
    float _3180 = _2996;
    float _3182 = _3014;
    float _3184 = _3008;
    float _3186 = _3028;
    float _3188 = fma(_1598, -0.5, 0.5);
    float _3190 = precise::clamp(_3188, 0.0, 1.0);
    float _3192 = -_3176;
    float _3194 = _3192 + _3178;
    float _3196 = -_3180;
    float _3198 = _3196 + _3182;
    float _3200 = -_3184;
    float _3202 = _3200 + _3186;
    bool _3204 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3206 = fma(_3190, _3194, _3176);
    float _3208 = fma(_3190, _3198, _3180);
    float _3210 = fma(_3190, _3202, _3184);
    float _3212 = _2968 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3214 = _3206 * 0.586610972881317138671875;
    out.m_93.x = 0.0;
    float _3216 = fma(_3208, 0.298911988735198974609375, _3214);
    out.m_56.x = _3212;
    float _3218 = fma(_3210, 0.114477999508380889892578125, _3216);
    float _3220 = -_3218;
    float _3222 = _3208 + _3220;
    float _3224 = -_3218;
    float _3226 = _3206 + _3224;
    float _3228 = -_3218;
    float _3230 = _3210 + _3228;
    float _3232 = fma(_3222, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3218);
    float _3234 = fma(_3226, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3218);
    float _3236 = fma(_3230, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3218);
    out.m_95.x = _3232;
    out.m_95.y = _3234;
    out.m_95.z = _3236;
    if (!_3204)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3238 = -_2205;
    float _3240 = _3238 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3242 = -_2207;
    float _3244 = _3242 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3246 = -_2209;
    float _3248 = _3246 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3250 = _3240 * _3240;
    float _3252 = fma(_3244, _3244, _3250);
    float _3254 = fma(_3248, _3248, _3252);
    float _3256 = sqrt(_3254);
    float _3258 = rsqrt(_3254);
    float _3260 = -_3256;
    float _3262 = _3260 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3264 = _3262 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3266 = precise::clamp(_3264, 0.0, 1.0);
    float _3268 = _3244 * _3258;
    float _3270 = _3240 * _3258;
    float _3272 = abs(_3266);
    float _3274 = log2(_3272);
    float _3276 = _3248 * _3258;
    float _3278 = _3268 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3280 = _1598 * _3270;
    float _3282 = -_3270;
    float _3284 = -_3278;
    float _3286 = fma(_3282, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3284);
    float _3288 = fma(_1596, _3268, _3280);
    float _3290 = -_3276;
    float _3292 = fma(_3290, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3286);
    float _3294 = fma(_1600, _3276, _3288);
    float _3296 = precise::clamp(_3294, 0.0, 1.0);
    float _3298 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3300 = _3292 + _3298;
    float _3302 = _3274 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3304 = _3300 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3306 = precise::clamp(_3304, 0.0, 1.0);
    float _3308 = exp2(_3302);
    float _3310 = _3308 * _3306;
    float _3312 = _3296 * _3310;
    float _3314 = _3312 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3316 = _3312 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3318 = _3312 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_93.x = _3314;
    out.m_93.y = _3316;
    out.m_93.z = _3318;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3090 = false;
    bool _2872 = false;
    bool _1684 = false;
    bool _1672 = false;
    bool _678 = false;
    bool _530 = false;
    bool _338 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _109 = in.m_53.w;
    float _111 = trunc(_109);
    int _114 = int(_111);
    bool _118 = _114 >= 1;
    float _120 = 0.0;
    if (!_118)
    {
        _120 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _122 = _120;
    float _124 = _122;
    if (!_118)
    {
        out.m_56.x = 0.0;
    }
    int _126 = 0;
    if (!_118)
    {
        float _128 = _122 * 5.0;
        _126 = as_type<int>(_128);
    }
    int _130 = _126;
    int _132 = _130;
    if (!_118)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3375 = as_type<float>(_130);
        out.gl_Position.z = _3375;
    }
    if (!_118)
    {
        return out;
    }
    float _134 = in.m_58.w;
    bool _136 = _134 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _138 = isnan(_134);
    bool _140 = _136 || _138;
    bool _142 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _144 = _140 || _142;
    float _146 = -_134;
    float _148 = _146 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _150 = 0.0;
    float _152 = _148;
    if (_144)
    {
        float _154 = float(_114);
        _150 = _154;
    }
    float _156 = _150;
    bool _158 = _148 >= _156;
    bool _160 = !_144;
    bool _162 = _158 || _160;
    if (_162)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _164 = _124;
    if (_162)
    {
        out.m_56.x = 0.0;
    }
    if (_162)
    {
        float _166 = _164 * 5.0;
        _132 = as_type<int>(_166);
    }
    int _168 = _132;
    if (_162)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3444 = as_type<float>(_168);
        out.gl_Position.z = _3444;
    }
    if (_162)
    {
        return out;
    }
    float _170 = in.m_60.x;
    float _172 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _174 = _148 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _176 = as_type<float>(int(gl_VertexIndex));
    float _178 = in.m_65.x;
    float _180 = in.m_65.y;
    float _182 = in.m_65.z;
    float _184 = in.m_67.x;
    float _186 = in.m_67.y;
    float _188 = in.m_67.z;
    float _190 = in.m_69.x;
    float _192 = in.m_69.y;
    float _194 = in.m_69.z;
    float _196 = _174 * _172;
    float _198 = in.m_71.x;
    float _200 = in.m_71.y;
    float _202 = in.m_71.z;
    float _204 = fma(_170, (*spvDescriptorSet0.vp_c9)._m0[20].x, _196);
    int _206 = as_type<int>(_176) & 1;
    bool _208 = _206 != 0;
    int _210 = as_type<int>(_176) & 2;
    bool _212 = _210 != 0;
    float _214 = _204 * 6.283185482025146484375;
    int _216 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _218 = _216 != 0;
    float _220 = floor(_204);
    float _222 = _214 * 0.15915493667125701904296875;
    bool _224 = !_212;
    float _226 = _224 ? (-0.5) : 0.5;
    int _228 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _230 = _228 != 0;
    int _232 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _234 = _232 != 0;
    float _236 = _180 * _186;
    bool _238 = !_218;
    int _240 = _238 ? 0 : 1;
    float _242 = _222 * 6.283185482025146484375;
    float _244 = cos(_242);
    float _246 = _180 * _192;
    bool _248 = !_230;
    int _250 = _248 ? 0 : 1;
    float _252 = fma(_178, _184, _236);
    int _254 = abs(_240);
    float _256 = _180 * _200;
    int _258 = abs(_250);
    float _260 = fma(_178, _190, _246);
    float _262 = -_220;
    float _264 = _204 + _262;
    float _266 = fma(_178, _198, _256);
    float _268 = fma(_182, _194, _260);
    bool _270 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _272 = -_264;
    float _274 = fma(_272, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _276 = float(_258);
    float _278 = fma(_244, 0.5, 0.5);
    bool _280 = !_234;
    int _282 = _280 ? 0 : 1;
    float _284 = abs(_274);
    float _286 = _276 * _284;
    bool _288 = _264 < 0.5;
    float _290 = float(_288);
    float _292 = -_278;
    float _294 = fma(_292, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _296 = abs(_282);
    float _298 = float(_254);
    float _300 = -_290;
    float _302 = fma(_300, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _304 = float(_296);
    bool _306 = !_208;
    float _308 = _306 ? (-0.5) : 0.5;
    float _310 = fma(_298, _294, _286);
    float _312 = fma(_182, _188, _252);
    float _314 = fma(_182, _202, _266);
    float _316 = abs(_302);
    float _318 = fma(_304, _316, _310);
    bool _320 = !_270;
    float _336;
    if (!_320)
    {
        float _322 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _324 = _170 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _326 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[12].x, _148);
        float _328 = _326 * _322;
        float _330 = floor(_328);
        float _332 = -_330;
        float _334 = _328 + _332;
        _336 = _334;
        _338 = true;
    }
    else
    {
        float _340 = float(_114);
        float _342 = 1.0 / _340;
        float _344 = _148 * _342;
        _336 = _344;
    }
    _338 = false;
    float _346 = _336;
    float _348 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _350 = _346 + _348;
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _354 = _346 + _352;
    float _356 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _358 = _346 + _356;
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _362 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _360;
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _366 = _364 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _368 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _370 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _368;
    bool _372 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _374 = 1.0 / _362;
    float _376 = 1.0 / _370;
    bool _378 = _346 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _380 = isnan(_346);
    bool _382 = _378 || _380;
    bool _384 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _386 = _382 || _384;
    float _388 = float(_386);
    float _390 = 1.0 / _366;
    float _392 = _350 * _374;
    bool _394 = _346 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _396 = isnan(_346);
    bool _398 = _394 || _396;
    bool _400 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _402 = _398 || _400;
    float _404 = float(_402);
    float _406 = _354 * _376;
    bool _408 = _346 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _410 = isnan(_346);
    bool _412 = _408 || _410;
    bool _414 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _416 = _412 || _414;
    float _418 = float(_416);
    float _420 = -_404;
    float _422 = _420 + 1.0;
    bool _424 = _346 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _426 = isnan(_346);
    bool _428 = _424 || _426;
    bool _430 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _432 = _428 || _430;
    float _434 = float(_432);
    float _436 = _388 * _422;
    float _438 = _358 * _390;
    float _440 = -_388;
    float _442 = _440 + 1.0;
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _446 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _444;
    float _448 = _418 * _442;
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _452 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _450;
    float _454 = -_418;
    float _456 = _454 + 1.0;
    float _458 = fma(_446, _392, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _460 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _462 = _460 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _464 = fma(_452, _392, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _466 = _434 * _456;
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _470 = _468 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _472 = -_434;
    float _474 = _472 + 1.0;
    float _476 = _464 * _466;
    float _478 = _458 * _466;
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _482 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _480;
    float _484 = fma(_462, _438, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _486 = fma(_474, (*spvDescriptorSet0.vp_c9)._m0[143].x, _476);
    float _488 = fma(_470, _438, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _492 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _490;
    float _494 = fma(_474, (*spvDescriptorSet0.vp_c9)._m0[143].y, _478);
    float _496 = fma(_482, _406, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _498 = fma(_484, _448, _486);
    float _500 = fma(_492, _406, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _502 = fma(_488, _448, _494);
    float _504 = fma(_496, _436, _498);
    float _506 = fma(_500, _436, _502);
    float _508 = fma(_404, (*spvDescriptorSet0.vp_c9)._m0[146].x, _504);
    float _510 = fma(_404, (*spvDescriptorSet0.vp_c9)._m0[146].y, _506);
    bool _512 = !_372;
    float _528;
    if (!_512)
    {
        float _514 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _516 = _170 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _518 = fma(_516, (*spvDescriptorSet0.vp_c9)._m0[11].y, _148);
        float _520 = _518 * _514;
        float _522 = floor(_520);
        float _524 = -_522;
        float _526 = _520 + _524;
        _528 = _526;
        _530 = true;
    }
    else
    {
        float _532 = float(_114);
        float _534 = 1.0 / _532;
        float _536 = _148 * _534;
        _528 = _536;
    }
    _530 = false;
    float _538 = _528;
    float _540 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _542 = _540 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _544 = _538 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _546 = isnan(_538);
    bool _548 = _544 || _546;
    bool _550 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _552 = _548 || _550;
    float _554 = float(_552);
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _558 = _556 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _560 = _538 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _562 = isnan(_538);
    bool _564 = _560 || _562;
    bool _566 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _568 = _564 || _566;
    float _570 = float(_568);
    float _572 = 1.0 / _542;
    float _574 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _576 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _574;
    float _578 = -_554;
    float _580 = _578 + 1.0;
    bool _582 = _538 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _584 = isnan(_538);
    bool _586 = _582 || _584;
    bool _588 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _590 = _586 || _588;
    float _592 = float(_590);
    bool _594 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _596 = _570 * _580;
    float _598 = -_570;
    float _600 = _598 + 1.0;
    float _602 = 1.0 / _558;
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _606 = _604 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _608 = _576 * _572;
    float _610 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _612 = _538 + _610;
    float _614 = -_592;
    float _616 = _614 + 1.0;
    float _618 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _620 = _538 + _618;
    float _622 = fma(_608, _612, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _624 = _554 * _616;
    float _626 = _606 * _602;
    float _628 = _622 * _596;
    float _630 = fma(_626, _620, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _632 = fma(_600, (*spvDescriptorSet0.vp_c9)._m0[115].x, _628);
    float _634 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _636 = fma(_630, _624, _632);
    float _638 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _640 = _634 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _642 = fma(_592, (*spvDescriptorSet0.vp_c9)._m0[117].x, _636);
    float _644 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _646 = _638 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _648 = in.m_73.x;
    float _650 = in.m_73.y;
    float _652 = _642 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _654 = _644 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_75.x = _640;
    out.m_75.y = _654;
    out.m_75.z = _646;
    out.m_75.w = _652;
    float _656 = _510 * _650;
    float _658 = _508 * _648;
    bool _660 = !_594;
    float _676;
    if (!_660)
    {
        float _662 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _664 = _170 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _666 = fma(_664, (*spvDescriptorSet0.vp_c9)._m0[11].w, _148);
        float _668 = _666 * _662;
        float _670 = floor(_668);
        float _672 = -_670;
        float _674 = _668 + _672;
        _676 = _674;
        _678 = true;
    }
    else
    {
        float _680 = float(_114);
        float _682 = 1.0 / _680;
        float _684 = _148 * _682;
        _676 = _684;
    }
    _678 = false;
    float _686 = _676;
    float _688 = in.m_53.x;
    float _690 = in.m_53.y;
    float _692 = in.m_53.z;
    float _694 = _170 * 2.0;
    int _696 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _698 = _696 != 0;
    int _700 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _702 = _700 != 0;
    int _704 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _706 = _704 != 0;
    float _708 = in.m_60.y;
    int _710 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _712 = _710 != 0;
    float _714 = floor(_694);
    int _716 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _718 = _716 != 0;
    float _720 = in.m_71.w;
    float _722 = in.m_69.w;
    bool _724 = !_702;
    int _726 = _724 ? 0 : 1;
    bool _728 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _730 = isnan(0.0);
    bool _732 = _728 || _730;
    bool _734 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _736 = _732 || _734;
    float _738 = in.m_67.w;
    int _740 = abs(_726);
    bool _742 = _714 > 0.0;
    float _744 = _186 * _690;
    float _746 = _192 * _690;
    float _748 = _200 * _690;
    float _750 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _752 = _750 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _754 = fma(_184, _688, _744);
    float _756 = fma(_190, _688, _746);
    float _758 = _170 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _760 = fma(_198, _688, _748);
    float _762 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _764 = _762 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _766 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _768 = _766 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _770 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _772 = _708 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _774 = 1.0 / _764;
    float _776 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _778 = -_770;
    float _780 = fma(_758, 2.0, _778);
    float _782 = fma(_188, _692, _754);
    float _784 = in.m_60.z;
    float _786 = fma(_194, _692, _756);
    float _788 = fma(_202, _692, _760);
    float _790 = 1.0 / _752;
    float _792 = _708 * 2.0;
    bool _794 = _714 >= 0.0;
    bool _796 = isnan(_714);
    bool _798 = _794 || _796;
    bool _800 = isnan(0.0);
    bool _802 = _798 || _800;
    float _804 = _788 + _720;
    float _806 = _786 + _722;
    int _808 = _802 ? 0 : 1;
    float _810 = _782 + _738;
    float _812 = 1.0 / _768;
    float _814 = fma(_772, -2.0, _776);
    float _816 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    bool _818 = _170 > 0.5;
    bool _820 = _686 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _822 = isnan(_686);
    bool _824 = _820 || _822;
    bool _826 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _828 = _824 || _826;
    float _830 = float(_828);
    float _832 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _834 = _832 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _836 = floor(_792);
    float _838 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _840 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _838;
    float _842 = -_308;
    int _844 = _818 ? as_type<int>(_842) : as_type<int>(_308);
    float _846 = _834 * _774;
    float _848 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _850 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _848;
    float _852 = _840 * _790;
    float _854 = _170 + _708;
    float _856 = _850 * _812;
    float _858 = _784 * 2.0;
    float _860 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _862 = log2(_860);
    float _864 = _854 + (-1.0);
    int _866 = ~_808;
    int _868 = _866 + 1;
    int _870 = _868 + 1;
    float _872 = _708 + _784;
    int _874 = _870;
    if (!_742)
    {
        int _876 = ~_808;
        int _878 = _876 + 1;
        _874 = _878;
    }
    int _880 = _874;
    float _882 = _170 + _784;
    bool _884 = _836 > 0.0;
    float _886 = fma(_864, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _888 = floor(_858);
    float _890 = _872 + (-1.0);
    float _892 = _882 + (-1.0);
    bool _894 = _836 >= 0.0;
    bool _896 = isnan(_836);
    bool _898 = _894 || _896;
    bool _900 = isnan(0.0);
    bool _902 = _898 || _900;
    float _904 = fma(_890, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _906 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _908 = _686 + _906;
    float _910 = _862 * _148;
    int _912 = _902 ? 0 : 1;
    float _914 = fma(_892, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _916 = _708 > 0.5;
    float _918 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _920 = _686 + _918;
    int _922 = ~_912;
    int _924 = _922 + 1;
    int _926 = _924 + 1;
    float _928 = exp2(_910);
    float _930 = fma(_852, _908, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    int _932 = _926;
    if (!_884)
    {
        int _934 = ~_912;
        int _936 = _934 + 1;
        _932 = _936;
    }
    int _938 = _932;
    float _940 = fma(_856, _920, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _942 = -_226;
    int _944 = _916 ? as_type<int>(_942) : as_type<int>(_226);
    float _946 = fma(_784, (*spvDescriptorSet0.vp_c9)._m0[79].z, _816);
    bool _948 = _888 > 0.0;
    bool _950 = _888 >= 0.0;
    bool _952 = isnan(_888);
    bool _954 = _950 || _952;
    bool _956 = isnan(0.0);
    bool _958 = _954 || _956;
    float _960 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _962 = _686 + _960;
    bool _964 = _686 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _966 = isnan(_686);
    bool _968 = _964 || _966;
    bool _970 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _972 = _968 || _970;
    float _974 = float(_972);
    float _976 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[79].x, _946);
    bool _978 = _686 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _980 = isnan(_686);
    bool _982 = _978 || _980;
    bool _984 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _986 = _982 || _984;
    float _988 = float(_986);
    float _990 = fma(_846, _962, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _992 = -_974;
    float _994 = _992 + 1.0;
    float _996 = -_928;
    float _998 = _996 + 1.0;
    bool _1000 = _686 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1002 = isnan(_686);
    bool _1004 = _1000 || _1002;
    bool _1006 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1008 = _1004 || _1006;
    float _1010 = float(_1008);
    float _1012 = _976 * (-0.15915493667125701904296875);
    float _1014 = _988 * _994;
    float _1016 = -_988;
    float _1018 = _1016 + 1.0;
    float _1020 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1022 = 1.0 + _1020;
    float _1024 = _1012 * 6.283185482025146484375;
    float _1026 = cos(_1024);
    float _1028 = _830 * _1018;
    float _1030 = -_830;
    float _1032 = _1030 + 1.0;
    float _1034 = _736 ? _998 : 0.0;
    bool _1036 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1038 = isnan(1.0);
    bool _1040 = _1036 || _1038;
    bool _1042 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1044 = _1040 || _1042;
    float _1046 = _1010 * _1032;
    float _1048 = float(_740);
    float _1050 = 1.0 / _1022;
    float _1052 = float(_880);
    float _1054 = _930 * _1046;
    float _1056 = -_148;
    float _1058 = fma(_1056, (*spvDescriptorSet0.vp_c9)._m0[76].x, _780);
    float _1060 = float(_938);
    float _1062 = _1012 * 6.283185482025146484375;
    float _1064 = sin(_1062);
    float _1066 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1068 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1070 = -_1010;
    float _1072 = _1070 + 1.0;
    float _1074 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[76].y, _814);
    float _1076 = fma(_170, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1066);
    float _1078 = fma(_708, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1068);
    int _1080 = _958 ? 0 : 1;
    float _1082 = fma(_1072, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1054);
    float _1084 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1076);
    float _1086 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1078);
    if (_1044)
    {
        float _1088 = _1034 * _1050;
        _152 = _1088;
    }
    float _1090 = _152;
    bool _1092 = !_718;
    float _1094 = _1092 ? _226 : as_type<float>(_944);
    float _1096 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].x;
    bool _1098 = !_712;
    float _1100 = _1098 ? _308 : as_type<float>(_844);
    float _1102 = _708 + (-0.5);
    int _1104 = ~_1080;
    int _1106 = _1104 + 1;
    int _1108 = _1106 + 1;
    float _1110 = _1094 * _1064;
    float _1112 = _1094 * _1026;
    int _1114 = _1108;
    if (!_948)
    {
        int _1116 = ~_1080;
        int _1118 = _1116 + 1;
        _1114 = _1118;
    }
    int _1120 = _1114;
    float _1122 = fma(_990, _1028, _1082);
    float _1124 = -_1110;
    float _1126 = fma(_1100, _1026, _1124);
    float _1128 = _1048 * _1052;
    float _1130 = _806 + (*spvDescriptorSet0.vp_c12)._m0[0].y;
    float _1132 = fma(_1100, _1064, _1112);
    float _1134 = _810 + (*spvDescriptorSet0.vp_c12)._m0[0].x;
    bool _1136 = !_706;
    int _1138 = _1136 ? 0 : 1;
    float _1140 = _1130 * (*spvDescriptorSet0.vp_c12)._m0[7].x;
    float _1142 = _1130 * (*spvDescriptorSet0.vp_c12)._m0[7].y;
    float _1144 = _1130 * (*spvDescriptorSet0.vp_c12)._m0[7].z;
    bool _1146 = !_698;
    int _1148 = _1146 ? 0 : 1;
    float _1150 = fma(_1134, (*spvDescriptorSet0.vp_c12)._m0[6].x, _1140);
    float _1152 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1154 = fma(_940, _1014, _1122);
    int _1156 = abs(_1148);
    float _1158 = fma(_1134, (*spvDescriptorSet0.vp_c12)._m0[6].y, _1142);
    float _1160 = in.m_77.x;
    float _1162 = in.m_77.y;
    float _1164 = in.m_77.z;
    float _1166 = -_806;
    float _1168 = _1166 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1170 = fma(_1134, (*spvDescriptorSet0.vp_c12)._m0[6].z, _1144);
    int _1172 = abs(_1138);
    float _1174 = _804 + (*spvDescriptorSet0.vp_c12)._m0[0].z;
    float _1176 = -_810;
    float _1178 = _1176 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1180 = _1168 * _1168;
    float _1182 = -_804;
    float _1184 = _1182 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1186 = fma(_1174, (*spvDescriptorSet0.vp_c12)._m0[8].x, _1150);
    float _1188 = float(_1172);
    float _1190 = fma(_1178, _1178, _1180);
    float _1192 = float(_1156);
    float _1194 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _1196 = float(_1120);
    float _1198 = _1186 + (*spvDescriptorSet0.vp_c12)._m0[9].x;
    float _1200 = _1188 * _1060;
    float _1202 = fma(_1184, _1184, _1190);
    float _1204 = fma(_1174, (*spvDescriptorSet0.vp_c12)._m0[8].y, _1158);
    float _1206 = _1198 * _1096;
    float _1208 = _1192 * _1196;
    float _1210 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _1212 = _1152 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1214 = _1126 + 0.5;
    float _1216 = fma(_1174, (*spvDescriptorSet0.vp_c12)._m0[8].z, _1170);
    float _1218 = _1204 + (*spvDescriptorSet0.vp_c12)._m0[9].y;
    float _1220 = _170 + (-0.5);
    float _1222 = fma(_1212, _1214, _1058);
    float _1224 = _1128 * (-2.0);
    float _1226 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1228 = _1216 + (*spvDescriptorSet0.vp_c12)._m0[9].z;
    float _1230 = _1218 * _1194;
    float _1232 = fma(_1224, _1162, _1162);
    float _1234 = -_1084;
    float _1236 = _1234 + 1.0;
    float _1238 = -_1086;
    float _1240 = _1238 + 1.0;
    float _1242 = fma(_1230, 0.5, 0.5);
    float _1244 = fma(_1102, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1232);
    float _1246 = rsqrt(_1202);
    float _1248 = _1228 * _1210;
    float _1250 = fma(_904, _1224, _904);
    float _1252 = _1132 + (-0.5);
    float _1254 = _1208 * (-2.0);
    float _1256 = _1200 * (-2.0);
    float _1258 = fma(_1250, _1090, _1244);
    float _1260 = fma(_1206, 0.5, 0.5);
    float _1262 = _1226 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1264 = fma(_1254, _1160, _1160);
    float _1266 = fma(_1248, 0.5, 0.5);
    float _1268 = _1258 * 0.15915493667125701904296875;
    float _1270 = -_1262;
    float _1272 = -_1074;
    float _1274 = fma(_1270, _1252, _1272);
    float _1276 = fma(_886, _1254, _886);
    float _1278 = fma(_974, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1154);
    float _1280 = fma(_914, _1256, _914);
    float _1282 = fma(_1256, _1164, _1164);
    float _1284 = _784 + (-0.5);
    float _1286 = _1178 * _1246;
    float _1288 = _1168 * _1246;
    float _1290 = _1184 * _1246;
    float _1292 = fma(_1284, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1282);
    float _1294 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1296 = _1286 * _1294;
    float _1298 = fma(_1220, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1264);
    float _1300 = -_1236;
    float _1302 = fma(_1126, _1300, _1222);
    float _1304 = fma(_1280, _1090, _1292);
    float _1306 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1308 = _1290 * _1306;
    float _1310 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1312 = -_1296;
    float _1314 = fma(_1290, _1310, _1312);
    float _1316 = fma(_1276, _1090, _1298);
    float _1318 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1320 = _1288 * _1318;
    float _1322 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1324 = -_1308;
    float _1326 = fma(_1288, _1322, _1324);
    float _1328 = _1314 * _1314;
    float _1330 = _1316 * 0.15915493667125701904296875;
    float _1332 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1334 = -_1320;
    float _1336 = fma(_1286, _1332, _1334);
    float _1338 = _1304 * 0.15915493667125701904296875;
    float _1340 = fma(_1326, _1326, _1328);
    float _1342 = fma(_1132, _1240, _1274);
    float _1344 = _1330 * 6.283185482025146484375;
    float _1346 = sin(_1344);
    float _1348 = _656 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1350 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _226);
    float _1352 = _1278 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1354 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1356 = _1330 * 6.283185482025146484375;
    float _1358 = cos(_1356);
    float _1360 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1362 = _1348 * _1350;
    float _1364 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1366 = _1354 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1368 = _1360 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_79.x = _1302;
    out.m_79.y = _1342;
    float _1370 = _1364 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1372 = floor(_1260);
    float _1374 = fma(_1336, _1336, _1340);
    bool _1376 = 1.0 != (*spvDescriptorSet0.vp_c12)._m0[10].x;
    bool _1378 = isnan(1.0);
    bool _1380 = _1376 || _1378;
    bool _1382 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].x);
    bool _1384 = _1380 || _1382;
    out.m_81.x = _1366;
    out.m_81.y = _1368;
    out.m_81.z = _1370;
    out.m_81.w = _1352;
    float _1386 = floor(_1242);
    float _1388 = floor(_1266);
    float _1390 = -_1372;
    float _1392 = _1260 + _1390;
    float _1394 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _308);
    float _1396 = _308 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1398 = fma(_1392, 2.0, -1.0);
    float _1400 = _1268 * 6.283185482025146484375;
    float _1402 = sin(_1400);
    float _1404 = -_1386;
    float _1406 = _1242 + _1404;
    float _1408 = fma(_1406, 2.0, -1.0);
    float _1410 = _1268 * 6.283185482025146484375;
    float _1412 = cos(_1410);
    float _1414 = -_1388;
    float _1416 = _1266 + _1414;
    float _1418 = _1338 * 6.283185482025146484375;
    float _1420 = cos(_1418);
    float _1422 = _1346 * _1402;
    float _1424 = _1358 * _1402;
    float _1426 = rsqrt(_1374);
    float _1428 = _1346 * _1412;
    float _1430 = _1338 * 6.283185482025146484375;
    float _1432 = sin(_1430);
    float _1434 = _1346 * _1420;
    float _1436 = _1358 * _1412;
    float _1438 = _1358 * _1420;
    float _1440 = _658 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1442 = _1412 * _1420;
    float _1444 = _1402 * _1420;
    float _1446 = _1438 * _1362;
    float _1448 = _1314 * _1426;
    float _1450 = _1440 * _1394;
    float _1452 = _1408 * (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _1454 = _1336 * _1426;
    float _1456 = _1398 * (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _1458 = _1452 * (*spvDescriptorSet0.vp_c12)._m0[3].x;
    float _1460 = _1452 * (*spvDescriptorSet0.vp_c12)._m0[3].y;
    float _1462 = fma(_1432, _1436, _1422);
    float _1464 = fma(_1432, _1422, _1436);
    float _1466 = -_1362;
    float _1468 = _1432 * _1466;
    float _1470 = -_1424;
    float _1472 = fma(_1432, _1428, _1470);
    float _1474 = -_1428;
    float _1476 = fma(_1432, _1424, _1474);
    float _1478 = _1434 * _1362;
    float _1480 = _1326 * _1426;
    float _1482 = _1452 * (*spvDescriptorSet0.vp_c12)._m0[3].z;
    float _1484 = fma(_1442, _1450, _1468);
    float _1486 = fma(_1462, _1450, _1446);
    float _1488 = fma(_1472, _1450, _1478);
    float _1490 = fma(_1456, (*spvDescriptorSet0.vp_c12)._m0[2].x, _1458);
    float _1492 = _1290 * _1448;
    float _1494 = _1286 * _1454;
    float _1496 = _1288 * _1480;
    float _1498 = fma(_1456, (*spvDescriptorSet0.vp_c12)._m0[2].y, _1460);
    float _1500 = -_1492;
    float _1502 = fma(_1288, _1454, _1500);
    float _1504 = -_1494;
    float _1506 = fma(_1290, _1480, _1504);
    float _1508 = -_1496;
    float _1510 = fma(_1286, _1448, _1508);
    float _1512 = fma(_1456, (*spvDescriptorSet0.vp_c12)._m0[2].z, _1482);
    float _1514 = _1438 * _1502;
    float _1516 = _1438 * _1506;
    float _1518 = _1438 * _1510;
    float _1520 = _1462 * _1502;
    float _1522 = -_1432;
    float _1524 = fma(_1522, _1480, _1514);
    float _1526 = -_1432;
    float _1528 = fma(_1526, _1448, _1516);
    float _1530 = -_1432;
    float _1532 = fma(_1530, _1454, _1518);
    float _1534 = _1462 * _1510;
    float _1536 = fma(_1434, _1286, _1524);
    float _1538 = fma(_1434, _1288, _1528);
    float _1540 = fma(_1434, _1290, _1532);
    float _1542 = _226 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1544 = _1462 * _1506;
    float _1546 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1548 = fma(_1442, _1480, _1520);
    float _1550 = fma(_1442, _1454, _1534);
    float _1552 = _1542 * _1536;
    float _1554 = _1542 * _1538;
    float _1556 = _1542 * _1540;
    float _1558 = fma(_1442, _1448, _1544);
    float _1560 = fma(_1476, _1546, _1486);
    float _1562 = _1476 * _1502;
    float _1564 = _1476 * _1506;
    float _1566 = _1476 * _1510;
    float _1568 = fma(_1472, _1286, _1548);
    float _1570 = fma(_1472, _1288, _1558);
    float _1572 = fma(_1472, _1290, _1550);
    float _1574 = fma(_1444, _1480, _1562);
    float _1576 = fma(_1444, _1448, _1564);
    float _1578 = fma(_1444, _1454, _1566);
    float _1580 = fma(_1444, _1546, _1484);
    float _1582 = fma(_1464, _1286, _1574);
    float _1584 = fma(_1396, _1568, _1552);
    float _1586 = fma(_1396, _1570, _1554);
    float _1588 = fma(_1396, _1572, _1556);
    float _1590 = fma(_1464, _1288, _1576);
    float _1592 = fma(_1464, _1290, _1578);
    float _1594 = fma(_1464, _1546, _1488);
    float _1596 = _1582 + _1584;
    float _1598 = _1590 + _1586;
    float _1600 = _1592 + _1588;
    float _1602 = fma(_1416, 2.0, -1.0);
    float _1604 = _1502 * _1560;
    float _1606 = _1506 * _1560;
    float _1608 = _1510 * _1560;
    out.m_83.x = _1596;
    out.m_83.y = _1598;
    out.m_83.z = _1600;
    float _1610 = _1602 * (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _1612 = fma(_1480, _1580, _1604);
    float _1614 = fma(_1448, _1580, _1606);
    float _1616 = fma(_1454, _1580, _1608);
    float _1618 = fma(_1610, (*spvDescriptorSet0.vp_c12)._m0[4].x, _1490);
    float _1620 = fma(_1610, (*spvDescriptorSet0.vp_c12)._m0[4].y, _1498);
    float _1622 = fma(_1610, (*spvDescriptorSet0.vp_c12)._m0[4].z, _1512);
    float _1624 = fma(_1286, _1594, _1612);
    float _1626 = fma(_1288, _1594, _1614);
    float _1628 = fma(_1290, _1594, _1616);
    float _1630 = _1618 + (*spvDescriptorSet0.vp_c12)._m0[5].x;
    float _1632 = _1620 + (*spvDescriptorSet0.vp_c12)._m0[5].y;
    float _1634 = _1622 + (*spvDescriptorSet0.vp_c12)._m0[5].z;
    float _1636 = _1624 + _1630;
    float _1638 = _1626 + _1632;
    float _1640 = _1628 + _1634;
    float _1642 = _1564;
    float _1644 = _1628;
    float _1646 = _1622;
    float _1648 = _1628;
    float _1650 = _1624;
    float _1652 = _1622;
    float _1654 = _1398;
    float _1656 = _1408;
    float _1658 = _1610;
    float _1660 = _1602;
    int _1662 = as_type<int>(_1640);
    float _1664 = _1638;
    float _1666 = _1580;
    float _1676;
    float _1678;
    float _1680;
    float _1682;
    if (!_1384)
    {
        bool _1668 = _1632 > (*spvDescriptorSet0.vp_c12)._m0[10].y;
        bool _1670 = !_1668;
        _1672 = _1670;
        if (!_1672)
        {
            float _1674 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
            _1676 = _1674;
            _1678 = 0.0;
            _1680 = 0.0;
            _1682 = 0.0;
            _1684 = true;
        }
    }
    if ((!_1684) || _1672)
    {
        bool _1722;
        if (!_1672)
        {
            bool _1686 = _1632 >= (*spvDescriptorSet0.vp_c12)._m0[10].y;
            bool _1688 = isnan(_1632);
            bool _1690 = _1686 || _1688;
            bool _1692 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].y);
            bool _1694 = _1690 || _1692;
            bool _1696 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _1698 = !_1694;
            bool _1700 = _1696 && _1698;
            bool _1702 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            float _1704 = (*spvDescriptorSet0.vp_c12)._m0[10].x;
            if (_1700)
            {
                _1642 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
            }
            float _1706 = _1642;
            float _1708 = _1706;
            if (_1700)
            {
                _1644 = 0.0;
            }
            float _1710 = _1644;
            _1648 = _1710;
            _1678 = _1710;
            if (_1700)
            {
                _1704 = 0.0;
            }
            float _1712 = _1704;
            _1650 = _1712;
            _1680 = _1712;
            if (_1700)
            {
                float _1714 = _1706 * 5.0;
                _1708 = _1714;
            }
            float _1716 = _1708;
            _1676 = _1716;
            if (_1700)
            {
                _1646 = 0.0;
            }
            float _1718 = _1646;
            bool _1720 = !_1694;
            _1722 = _1720 && _1702;
            _1652 = _1718;
            _1682 = _1718;
        }
        if ((!_1722) || _1672)
        {
            _1672 = false;
            float _1724 = _1648;
            float _1726 = _1650;
            float _1728 = _1652;
            bool _1730 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].x;
            bool _1732 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].y;
            bool _1734 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].z;
            float _1736 = _1288;
            float _1738 = _1726;
            float _1740 = _1728;
            _1676 = _1640;
            if (_1730)
            {
                float _1742 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].x;
                _1736 = _1742;
            }
            float _1744 = _1736;
            if (_1730)
            {
                float _1746 = abs(_1398);
                float _1748 = -_1746;
                float _1750 = _1748 + 1.0;
                _1654 = _1750;
            }
            float _1752 = _1654;
            if (_1732)
            {
                float _1754 = abs(_1408);
                float _1756 = -_1754;
                float _1758 = _1756 + 1.0;
                _1656 = _1758;
            }
            float _1760 = _1656;
            if (!_1730)
            {
                _1658 = 1.0;
            }
            float _1762 = _1658;
            float _1764 = _1762;
            if (_1734)
            {
                float _1766 = abs(_1602);
                float _1768 = -_1766;
                float _1770 = _1768 + 1.0;
                _1660 = _1770;
            }
            float _1772 = _1660;
            if (!_1732)
            {
                _1738 = 1.0;
            }
            float _1774 = _1738;
            float _1776 = _1774;
            if (!_1734)
            {
                _1740 = 1.0;
            }
            float _1778 = _1740;
            float _1780 = _1594;
            float _1782 = _1778;
            if (_1732)
            {
                float _1784 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].y;
                _1780 = _1784;
            }
            float _1786 = _1780;
            float _1788 = _1724;
            if (_1734)
            {
                float _1790 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].z;
                _1788 = _1790;
            }
            float _1792 = _1788;
            if (_1730)
            {
                float _1794 = _1752 * _1744;
                float _1796 = precise::clamp(_1794, 0.0, 1.0);
                _1764 = _1796;
            }
            float _1798 = _1764;
            if (_1732)
            {
                float _1800 = _1760 * _1786;
                float _1802 = precise::clamp(_1800, 0.0, 1.0);
                _1776 = _1802;
            }
            float _1804 = _1776;
            float _1806 = _1798 * _1804;
            _1680 = _1638;
            if (_1734)
            {
                float _1808 = _1772 * _1792;
                float _1810 = precise::clamp(_1808, 0.0, 1.0);
                _1782 = _1810;
            }
            float _1812 = _1782;
            float _1814 = _1806 * _1812;
            _1678 = _1636;
            _1682 = _1814;
        }
    }
    _1684 = false;
    float _1816 = _1676;
    float _1818 = _1678;
    float _1820 = _1680;
    float _1822 = _1682;
    float _1824 = _1632 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1826 = fma(_1630, 6.2500002968590706586837768554688e-05, 0.5);
    float _1828 = _1824 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1830 = _1824 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1832 = fma(_1630, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1828);
    float _1834 = fma(_1630, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1830);
    float _1836 = fma(_1634, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1832);
    float _1838 = fma(_1634, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1834);
    float _1840 = _1836 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1842 = _1838 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1844 = trunc(_1840);
    int _1846 = int(_1844);
    float _1848 = trunc(_1842);
    int _1850 = int(_1848);
    int _1852 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1854 = _1846 + _1852;
    int _1856 = _1854 + 1;
    bool _1858 = _1856 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1860 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1862 = _1850 + _1860;
    int _1864 = _1862 + 1;
    int _1866 = _1856 | _1864;
    bool _1868 = _1866 < 0;
    bool _1870 = _1868 || _1858;
    bool _1872 = _1864 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1874 = _1872 || _1870;
    int _1876 = _1864;
    int _1878 = _1856;
    float _1880 = as_type<float>(_1866);
    float _1882 = _1842;
    float _1884 = _1818;
    float _1886 = _1816;
    if (!_1874)
    {
        int _1888 = _1864 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1890 = _1888 + _1856;
        _1662 = _1890;
    }
    int _1892 = _1662;
    float _1894 = _1618;
    if (!_1874)
    {
        float _1896 = floor(_1840);
        _1894 = _1896;
    }
    float _1898 = _1894;
    if (!_1874)
    {
        int _1900 = _1892 << 2;
        _1876 = _1900;
    }
    int _1902 = _1876;
    int _1904 = _1902;
    if (!_1874)
    {
        uint _1907 = uint(int(uint(_1892) >> uint(2)));
        _1878 = int(_1907);
    }
    int _1909 = _1878;
    if (!_1874)
    {
        int _1911 = 12 & _1902;
        _1904 = _1911;
    }
    int _1913 = _1904;
    if (!_1874)
    {
        int _1915 = _1909 << 4;
        int _1917 = _1915 + _1913;
        _1880 = as_type<float>(_1917);
    }
    float _1919 = _1880;
    float _1921 = fma(_1634, 6.2500002968590706586837768554688e-05, 0.5);
    float _1923 = as_type<float>(_1913);
    if (!_1874)
    {
        float _1925 = floor(_1842);
        _1923 = _1925;
    }
    float _1927 = _1923;
    if (!_1874)
    {
        float _1929 = -_1898;
        float _1931 = _1840 + _1929;
        _1664 = _1931;
    }
    float _1933 = _1664;
    float _1935 = _1919;
    if (!_1874)
    {
        int _1937 = as_type<int>(_1919) + 400;
        uint _1939 = uint(int(uint(_1937) >> uint(2)));
        uint _1941 = uint(int(uint(int(_1939)) >> uint(2)));
        int _1943 = int(_1939) & 3;
        float _1945 = (*spvDescriptorSet0.vp_c15)._m0[int(_1941)][_1943];
        _1935 = _1945;
    }
    float _1947 = _1935;
    float2 _6224 = float2(_1826, _1921);
    float _1949 = dm_bs(spvDescriptorSet0.vp_t_tcb_22.sample(spvDescriptorSet0.vp_t_tcb_22Smplr, select(_6224, float2(0.0), isnan(_6224)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_22, spvDescriptorSet0.vp_t_tcb_22Smplr_w, select(_6224, float2(0.0), isnan(_6224)), level(0.0)).x;
    float _1951 = _1927;
    if (!_1874)
    {
        float _1953 = -_1927;
        float _1955 = _1842 + _1953;
        _1951 = _1955;
    }
    float _1957 = _1951;
    float _1959 = _1620;
    if (!_1874)
    {
        float _1961 = rint(_1947);
        float _1963 = precise::max(_1961, 0.0);
        uint _1965 = uint(_1963);
        uint _1967 = clamp(_1965, 0u, 65535u);
        _1959 = as_type<float>(_1967);
    }
    float _1969 = _1959;
    float _1971 = _1957;
    float _1973 = _1969;
    if (!_1874)
    {
        float3 _6272 = float3(_1933, _1957, float(as_type<int>(_1969)));
        float3 _6276 = select(_6272, float3(0.0), isnan(_6272));
        float _1975 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6276.xy, uint(rint(_6276.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6276.xy, uint(rint(_6276.z)), level(0.0)).x;
        _1971 = _1975;
    }
    float _1977 = _1971;
    float _1979 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1981 = _1816 + _1979;
    float _1983 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1985 = _1818 + _1983;
    float _1987 = _1981 * _1981;
    float _1989 = fma(_1985, _1985, _1987);
    float _1991 = sqrt(_1989);
    bool _1993 = _1991 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1995 = _1985;
    if (!_1993)
    {
        _1882 = _1820;
    }
    float _1997 = _1882;
    bool _1999 = !_1993;
    float _2001 = _1997;
    if (!_1999)
    {
        float _2003 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2005 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2007 = _1991 + _2005;
        float _2009 = _1820 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2011 = rsqrt(_1989);
        float _2013 = _2007 * _2003;
        float _2015 = _2013 * 0.15915493667125701904296875;
        float _2017 = _2015 * 6.283185482025146484375;
        float _2019 = cos(_2017);
        float _2021 = _2015 * 6.283185482025146484375;
        float _2023 = sin(_2021);
        float _2025 = _2019 + (-1.0);
        float _2027 = _2025 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2029 = fma(_2023, _2009, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2031 = _2011 * _2029;
        float _2033 = fma(_2019, _1820, _2027);
        float _2035 = fma(_1985, _2031, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2037 = fma(_1981, _2031, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2001 = _2033;
        _1884 = _2035;
        _1886 = _2037;
    }
    float _2039 = _2001;
    float _2041 = _1884;
    float _2043 = _1886;
    float _2045 = -_1632;
    float _2047 = _2045 + _2039;
    float _2049 = -_1630;
    float _2051 = _2049 + _2041;
    float _2053 = -_1634;
    float _2055 = _2053 + _2043;
    float _2057 = _2047 * _2047;
    bool _2059 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2061 = isnan(0.5);
    bool _2063 = _2059 || _2061;
    bool _2065 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2067 = _2063 || _2065;
    float _2069 = fma(_2051, _2051, _2057);
    float _2071 = fma(_2055, _2055, _2069);
    float _2073 = sqrt(_2071);
    bool _2075 = _2073 > 0.0;
    bool _2077 = !_2075;
    float _2079 = _2041;
    float _2081 = _2043;
    float _2083 = _2039;
    float _2085 = _2047;
    if (!_2077)
    {
        float _2087 = _268 * _268;
        float _2089 = fma(_312, _312, _2087);
        float _2091 = fma(_314, _314, _2089);
        float _2093 = rsqrt(_2071);
        float _2095 = sqrt(_2091);
        float _2097 = _2051 * _2093;
        float _2099 = _2047 * _2093;
        float _2101 = _2055 * _2093;
        bool _2103 = _2095 > 0.0;
        bool _2105 = !_2103;
        _1995 = _2099;
        _1973 = _2097;
        if (!_2105)
        {
            float _2107 = rsqrt(_2091);
            float _2109 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2111 = _268 * _2107;
            float _2113 = _312 * _2107;
            float _2115 = _314 * _2107;
            float _2117 = _2099 * _2111;
            float _2119 = fma(_2097, _2113, _2117);
            float _2121 = _2109 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2123 = fma(_2101, _2115, _2119);
            float _2125 = _2123 * _2121;
            float _2127 = fma(_312, _2125, _2041);
            float _2129 = fma(_268, _2125, _2039);
            float _2131 = fma(_314, _2125, _2043);
            _2079 = _2127;
            _2081 = _2131;
            _2083 = _2129;
            _2085 = _2121;
        }
    }
    float _2133 = _2079;
    float _2135 = _2081;
    float _2137 = _2083;
    float _2139 = _2085;
    float _2141 = _1995;
    float _2143 = _1973;
    float _2145 = _2137;
    float _2147 = _2133;
    float _2149 = _2135;
    float _2151 = _2143;
    float _2153 = _2141;
    if (!_2067)
    {
        float _2155 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2157 = _1632 + _2155;
        float _2159 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2161 = _1630 + _2159;
        float _2163 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2165 = -_1630;
        float _2167 = _2165 + _2133;
        float _2169 = _2157 * _2157;
        float _2171 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2173 = _1634 + _2171;
        float _2175 = -_1634;
        float _2177 = _2175 + _2135;
        float _2179 = fma(_2161, _2161, _2169);
        float _2181 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2183 = fma(_2173, _2173, _2179);
        float _2185 = sqrt(_2183);
        float _2187 = _2163 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2189 = precise::min(_2185, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2191 = _2189 * _2181;
        float _2193 = _2187 * _2191;
        float _2195 = -_1632;
        float _2197 = _2195 + _2137;
        float _2199 = fma(_2167, _2193, _1630);
        float _2201 = fma(_2197, _2193, _1632);
        float _2203 = fma(_2177, _2193, _1634);
        _2145 = _2201;
        _2147 = _2199;
        _2149 = _2203;
    }
    float _2205 = _2145;
    float _2207 = _2147;
    float _2209 = _2149;
    float _2211 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2213 = _2205 + _2211;
    float _2215 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2217 = _2207 + _2215;
    float _2219 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2221 = _2209 + _2219;
    float _2223 = _2213 * _2213;
    float _2225 = fma(_2217, _2217, _2223);
    float _2227 = fma(_2221, _2221, _2225);
    float _2229 = rsqrt(_2227);
    float _2231 = sqrt(_2227);
    float _2233 = _2229 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2235 = _2217 * _2233;
    float _2237 = _2221 * _2233;
    float _2239 = _2235 * _2235;
    float _2241 = _2237 * _2237;
    float _2243 = _2239 + _2241;
    float _2245 = sqrt(_2243);
    bool _2247 = _2245 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2249 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2251 = _2245 + _2249;
    float _2253 = _2139;
    float _2255 = _2251;
    if (_2247)
    {
        float _2257 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2253 = _2257;
    }
    float _2259 = _2253;
    if (_2247)
    {
        float _2261 = rsqrt(_2243);
        _2151 = _2261;
    }
    float _2263 = _2151;
    float _2265 = _2263;
    if (_2247)
    {
        float _2267 = _2251 * _2259;
        _2255 = _2267;
    }
    float _2269 = _2255;
    if (_2247)
    {
        float _2271 = _2269 * 0.15915493667125701904296875;
        _2153 = _2271;
    }
    float _2273 = _2153;
    float _2275 = _2259;
    float _2277 = _2273;
    if (_2247)
    {
        float _2279 = _2273 * 6.283185482025146484375;
        float _2281 = sin(_2279);
        _2275 = _2281;
    }
    float _2283 = _2275;
    float _2285 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2287 = precise::max(0.0, _2285);
    float _2289 = _2055;
    float _2291 = _2287;
    if (_2247)
    {
        float _2293 = _2273 * 6.283185482025146484375;
        float _2295 = cos(_2293);
        _2289 = _2295;
    }
    float _2297 = _2289;
    float _2299 = -_2233;
    float _2301 = -_2287;
    float _2303 = fma(_2213, _2299, _2301);
    float _2305 = _2303;
    if (_2247)
    {
        float _2307 = _2303 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2291 = _2307;
    }
    float _2309 = _2291;
    float _2311 = _2283;
    float _2313 = _2309;
    if (_2247)
    {
        float _2315 = fma(_2283, _2309, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2311 = _2315;
    }
    float _2317 = _2311;
    float _2319 = _2317;
    float _2321 = _2297;
    if (_2247)
    {
        float _2323 = _2297 + (-1.0);
        _2313 = _2323;
    }
    float _2325 = _2313;
    float _2327 = _2325;
    if (_2247)
    {
        float _2329 = _2263 * _2317;
        _1666 = _2329;
    }
    float _2331 = _1666;
    if (!_2247)
    {
        _2319 = _2235;
    }
    float _2333 = _2319;
    float _2335 = _2333;
    if (_2247)
    {
        float _2337 = _2325 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2277 = _2337;
    }
    float _2339 = _2277;
    if (_2247)
    {
        float _2341 = _2235 * _2331;
        _2335 = _2341;
    }
    float _2343 = _2335;
    if (!_2247)
    {
        _2327 = _2237;
    }
    float _2345 = _2327;
    float _2347 = _2345;
    if (_2247)
    {
        float _2349 = _2237 * _2331;
        _2347 = _2349;
    }
    float _2351 = _2347;
    if (!_2247)
    {
        _2265 = _2239;
    }
    float _2353 = _2265;
    float _2355 = _2353;
    if (_2247)
    {
        float _2357 = fma(_2303, _2297, _2339);
        _2305 = _2357;
    }
    float _2359 = _2305;
    if (_2247)
    {
        float _2361 = _2343 * _2343;
        _2355 = _2361;
    }
    float _2363 = _2355;
    if (!_2247)
    {
        _2321 = _2241;
    }
    float _2365 = _2321;
    float _2367 = _2365;
    if (_2247)
    {
        float _2369 = _2351 * _2351;
        _2367 = _2369;
    }
    float _2371 = _2367;
    float _2373 = fma(_2359, _2359, _2363);
    float _2375 = abs(_1949);
    bool _2377 = _2375 != 0.0;
    bool _2379 = isnan(_2375);
    bool _2381 = _2377 || _2379;
    bool _2383 = isnan(0.0);
    bool _2385 = _2381 || _2383;
    float _2387 = _2373 + _2371;
    float _2389 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2391 = fma(_2231, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2389);
    float _2393 = precise::clamp(_2391, 0.0, 1.0);
    float _2395 = -_2393;
    float _2397 = _2395 + 1.0;
    float _2399 = rsqrt(_2387);
    float _2401 = _2205 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2403 = fma(_2207, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2401);
    float _2405 = abs(_2397);
    float _2407 = log2(_2405);
    float _2409 = fma(_2209, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2403);
    float _2411 = _2409 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2413 = _2399 * _2343;
    float _2415 = _2399 * _2359;
    float _2417 = _2399 * _2351;
    float _2419 = _2411 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2421 = _2413 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2423 = _2205 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2425 = _2411 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2427 = -_2421;
    float _2429 = fma(_2415, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2427);
    float _2431 = fma(_2207, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2423);
    float _2433 = _2407 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2435 = _2411 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2437 = -_2417;
    float _2439 = fma(_2437, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2429);
    float _2441 = fma(_2209, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2431);
    float _2443 = _2411 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2445 = _2205 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2447 = fma(_2439, -0.5, 0.5);
    float _2449 = _2441 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2451 = exp2(_2433);
    float _2453 = fma(_2439, 0.5, 0.5);
    float _2455 = fma(_2207, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2445);
    float _2457 = fma(_2449, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2443);
    float _2459 = fma(_2449, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2419);
    float _2461 = fma(_2449, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2435);
    float _2463 = fma(_2209, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2455);
    float _2465 = _2415 + 1.0;
    float _2467 = sqrt(_2447);
    float _2469 = fma(_2453, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2471 = _2463 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2473 = fma(_2453, _2469, -0.212114393711090087890625);
    float _2475 = fma(_2471, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2459);
    float _2477 = fma(_2471, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2457);
    float _2479 = -_2415;
    float _2481 = fma(_2451, _2465, _2479);
    float _2483 = fma(_2449, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2425);
    float _2485 = _2205 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2487 = fma(_2471, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2461);
    float _2489 = _2471 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2491 = fma(_2471, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2483);
    float _2493 = fma(_2207, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2485);
    float _2495 = fma(_2453, _2473, 1.570728778839111328125);
    float _2497 = _2467 * 0.636619746685028076171875;
    float _2499 = fma(_2209, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2493);
    float _2501 = -_2495;
    float _2503 = fma(_2497, _2501, 1.0);
    float _2505 = _2499 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2507 = fma(_2505, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2475);
    float _2509 = fma(_2505, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2477);
    float _2511 = fma(_2505, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2487);
    float _2513 = fma(_2505, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2491);
    float _2515 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    out.gl_Position.x = _2509;
    out.gl_Position.y = _2507;
    out.gl_Position.z = _2511;
    out.gl_Position.w = _2513;
    float _2517 = -_2489;
    float _2519 = fma(_2517, _2515, 1.0);
    float _2521 = _2461;
    if (_2385)
    {
        _2521 = _2513;
    }
    float _2523 = _2521;
    float _2525 = _2523;
    if (!_2385)
    {
        out.gl_Position.w = 0.0;
    }
    float _2527 = log2(_2519);
    if (!_2385)
    {
        _2525 = 0.0;
    }
    float _2529 = _2525;
    float _2531 = _2529;
    if (!_1874)
    {
        int _2533 = _1892 << 4;
        int _2535 = _2533 + 2048;
        uint _2537 = uint(int(uint(_2535) >> uint(2)));
        uint _2539 = uint(int(uint(int(_2537)) >> uint(2)));
        int _2541 = int(_2537) & 3;
        float _2543 = (*spvDescriptorSet0.vp_c15)._m0[int(_2539)][_2541];
        int _2545 = int(_2537) + 1;
        uint _2547 = uint(int(uint(_2545) >> uint(2)));
        int _2549 = _2545 & 3;
        float _2551 = (*spvDescriptorSet0.vp_c15)._m0[int(_2547)][_2549];
        int _2553 = _2535 + 8;
        uint _2555 = uint(int(uint(_2553) >> uint(2)));
        uint _2557 = uint(int(uint(int(_2555)) >> uint(2)));
        int _2559 = int(_2555) & 3;
        float _2561 = (*spvDescriptorSet0.vp_c15)._m0[int(_2557)][_2559];
        int _2563 = int(_2555) + 1;
        uint _2565 = uint(int(uint(_2563) >> uint(2)));
        int _2567 = _2563 & 3;
        float _2569 = (*spvDescriptorSet0.vp_c15)._m0[int(_2565)][_2567];
        float _2571 = _1824 * _2551;
        float _2573 = fma(_1630, _2543, _2571);
        float _2575 = fma(_1634, _2561, _2573);
        float _2577 = _2575 + _2569;
        float _2579 = precise::clamp(_2577, 0.0, 1.0);
        float _2581 = -_2579;
        float _2583 = _2581 + _1977;
        float _2585 = fma(_2583, 500.0, 1.5);
        float _2587 = exp2(_2585);
        float _2589 = 0.0 + _2587;
        float _2591 = precise::clamp(_2589, 0.0, 1.0);
        bool _2593 = _2591 >= 1.0;
        bool _2595 = isnan(_2591);
        bool _2597 = _2593 || _2595;
        bool _2599 = isnan(1.0);
        bool _2601 = _2597 || _2599;
        if (!_2601)
        {
            out.gl_Position.w = 0.0;
        }
        if (!_2601)
        {
            _2531 = 0.0;
        }
    }
    float _2603 = _2531;
    float _2605 = 1.0 / _2603;
    float _2607 = _2527 * 0.693147182464599609375;
    float _2609 = fma(_2481, 0.5, 0.5);
    float _2611 = _2607 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2613 = _2509 * _2605;
    float _2615 = _2507 * _2605;
    float _2617 = fma(_2613, 0.5, 0.5);
    float _2619 = fma(_2615, -0.5, 0.5);
    float3 _7314 = float3(_2617, _2619, _2611);
    float _2621 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7314, float3(0.0), isnan(_7314)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7314, float3(0.0), isnan(_7314)), level(0.0)).x;
    float3 _7323 = float3(_2617, _2619, _2611);
    float4 _2624 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7323, float3(0.0), isnan(_7323)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7323, float3(0.0), isnan(_7323)), level(0.0)).xyzw;
    float _2626 = _2624.x;
    float _2628 = _2624.y;
    float _2630 = _2624.z;
    float _2632 = _2624.w;
    float2 _7339 = float2(_2503, _2609);
    float3 _2636 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7339, float2(0.0), isnan(_7339)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7339, float2(0.0), isnan(_7339)), level(0.0)).xyz;
    float _2638 = _2636.x;
    float _2640 = _2636.y;
    float _2642 = _2636.z;
    float _2644 = _1632 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2646 = _1632 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2648 = _1632 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2650 = _1632 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2652 = fma(_1630, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2644);
    float _2654 = fma(_1630, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2646);
    float _2656 = fma(_1630, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2648);
    float _2658 = fma(_1630, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2650);
    float _2660 = fma(_1634, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2652);
    float _2662 = fma(_1634, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2654);
    float _2664 = fma(_1634, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2656);
    float _2666 = _2407 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2668 = _2660 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2670 = _2662 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2672 = _2664 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2674 = fma(_1634, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2658);
    float _2676 = _2668 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2678 = _2511 + _2513;
    float _2680 = _2513 * 0.5;
    float _2682 = _2672 * (*spvDescriptorSet0.vp_c8)._m0[7].z;
    float _2684 = fma(_2670, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2676);
    float _2686 = _1822 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2688 = fma(_2507, -0.5, _2680);
    float _2690 = _2509 + _2513;
    float _2692 = _2674 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2694 = _2682 + _2684;
    float _2696 = _2678 * 0.5;
    float _2698 = _2690 * 0.5;
    float _2700 = _318 * _2686;
    float _2702 = fma(_2692, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2694);
    float _2704 = _2668 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2706 = -_268;
    float _2708 = _2706 + _2205;
    float _2710 = _2668 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2712 = exp2(_2666);
    float _2714 = _2668 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_85.x = _2698;
    out.m_85.y = _2688;
    out.m_85.z = _2696;
    out.m_85.w = _2513;
    float _2716 = fma(_2670, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2704);
    float _2718 = -_312;
    float _2720 = _2718 + _2207;
    float _2722 = _2708 * (*spvDescriptorSet0.vp_c15)._m0[638].y;
    float _2724 = fma(_2670, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2710);
    float _2726 = fma(_2670, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2714);
    float _2728 = 1.0 / _2702;
    out.m_87.y = 1.0;
    float _2730 = fma(_2672, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2726);
    out.m_89.x = _2217;
    out.m_89.y = _2213;
    out.m_89.z = _2221;
    float _2732 = _2708 * (*spvDescriptorSet0.vp_c15)._m0[635].y;
    float _2734 = _2708 * (*spvDescriptorSet0.vp_c15)._m0[636].y;
    float _2736 = fma(_2720, (*spvDescriptorSet0.vp_c15)._m0[638].x, _2722);
    float _2738 = -_314;
    float _2740 = _2738 + _2209;
    float _2742 = fma(_2720, (*spvDescriptorSet0.vp_c15)._m0[635].x, _2732);
    float _2744 = fma(_2720, (*spvDescriptorSet0.vp_c15)._m0[636].x, _2734);
    float _2746 = _2672 * (*spvDescriptorSet0.vp_c8)._m0[4].z;
    float _2748 = fma(_2740, (*spvDescriptorSet0.vp_c15)._m0[638].z, _2736);
    float _2750 = fma(_2740, (*spvDescriptorSet0.vp_c15)._m0[635].z, _2742);
    float _2752 = fma(_2740, (*spvDescriptorSet0.vp_c15)._m0[636].z, _2744);
    float _2754 = fma(_2692, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2730);
    float _2756 = _2672 * (*spvDescriptorSet0.vp_c8)._m0[5].z;
    float _2758 = -_2712;
    float _2760 = _2758 + 1.0;
    float _2762 = _2746 + _2716;
    float _2764 = _2754 * _2728;
    float _2766 = _2756 + _2724;
    float _2768 = _2760 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2770 = fma(_2692, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2762);
    float _2772 = _2748 + (*spvDescriptorSet0.vp_c15)._m0[638].w;
    bool _2774 = _2764 > 0.0;
    float _2776 = fma(_2692, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2766);
    float _2778 = _2770 * _2728;
    float _2780 = 1.0 / _2772;
    bool _2782 = _2764 < 1.0;
    bool _2784 = _2782 && _2774;
    float _2786 = _2776 * _2728;
    float _2788 = -_2768;
    float _2790 = _2788 + 1.0;
    float _2792 = _2750 + (*spvDescriptorSet0.vp_c15)._m0[635].w;
    bool _2794 = _2613 > (-1.0);
    bool _2796 = _2794 && _2784;
    float _2798 = _2752 + (*spvDescriptorSet0.vp_c15)._m0[636].w;
    bool _2800 = _2615 > (-1.0);
    bool _2802 = _2800 && _2796;
    bool _2804 = _2613 < 1.0;
    bool _2806 = _2804 && _2802;
    float _2808 = _2792 * _2780;
    bool _2810 = _2615 < 1.0;
    bool _2812 = _2810 && _2806;
    float _2814 = _2798 * _2780;
    float _2816 = _2768 * _2621;
    float _2818 = _2632 * _2816;
    float _2820 = _2642 * _2816;
    float _2822 = _2632 * _2790;
    float _2824 = fma(_2638, _2818, _2626);
    float _2826 = fma(_2640, _2818, _2628);
    float _2828 = fma(_2632, _2820, _2630);
    out.m_91.x = _2824;
    out.m_91.y = _2826;
    out.m_91.z = _2828;
    out.m_91.w = _2822;
    bool _2830 = !_2812;
    float _2832 = _2818;
    float _2834 = _2790;
    float _2836 = _2746;
    float _2838 = _2700;
    float _2866;
    float _2868;
    float _2870;
    if (!_2830)
    {
        float _2840 = -_2786;
        float _2842 = _2615 + _2840;
        float _2844 = -_2778;
        float _2846 = _2613 + _2844;
        float _2848 = -_2808;
        float _2850 = _2613 + _2848;
        float _2852 = -_2814;
        float _2854 = _2615 + _2852;
        float _2856 = _2842 * _2842;
        float _2858 = fma(_2846, _2846, _2856);
        float _2860 = sqrt(_2858);
        bool _2862 = _2860 > 0.0;
        bool _2864 = !_2862;
        _2866 = _2860;
        _2832 = _2842;
        _2868 = _2846;
        _2870 = _2858;
        _2872 = _2864;
        if (!_2872)
        {
            float _2874 = _2854 * _2854;
            float _2876 = fma(_2850, _2850, _2874);
            float _2878 = rsqrt(_2858);
            float _2880 = sqrt(_2876);
            float _2882 = _2846 * _2878;
            float _2884 = _2842 * _2878;
            bool _2886 = _2880 > 0.0;
            bool _2888 = !_2886;
            _2866 = _2878;
            _2834 = _2880;
            _2872 = _2888;
            if (!_2872)
            {
                float _2890 = _1440 * _2692;
                float _2892 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
                float _2894 = fma(_2890, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2682);
                float _2896 = fma(_2890, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2746);
                float _2898 = fma(_2890, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2756);
                float _2900 = fma(_2692, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2894);
                float _2902 = rsqrt(_2876);
                float _2904 = fma(_2692, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2898);
                float _2906 = fma(_2692, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2896);
                float _2908 = 1.0 / _2900;
                float _2910 = _2892 * (*spvDescriptorSet0.vp_c13)._m0[0].w;
                float _2912 = _2854 * _2910;
                float _2914 = _2850 * _2910;
                float _2916 = _2912 * _2912;
                float _2918 = fma(_2914, _2914, _2916);
                float _2920 = _2854 * _2902;
                float _2922 = _2850 * _2902;
                float _2924 = _2904 * _2908;
                float _2926 = _2906 * _2908;
                float _2928 = _2884 * _2920;
                float _2930 = sqrt(_2918);
                float _2932 = _2924 * _2924;
                float _2934 = fma(_2882, _2922, _2928);
                float _2936 = fma(_2926, _2926, _2932);
                float _2938 = precise::min(0.0, _2934);
                float _2940 = sqrt(_2936);
                float _2942 = _2938 * _2603;
                float _2944 = fma(_2914, _2942, _2509);
                float _2946 = fma(_2912, _2942, _2507);
                out.gl_Position.x = _2944;
                out.gl_Position.y = _2946;
                float _2948 = fma(_2930, (*spvDescriptorSet0.vp_c13)._m0[1].x, _2940);
                float _2950 = 1.0 / _2948;
                float _2952 = _2940 * _2950;
                out.m_87.y = _2952;
                _2866 = _2942;
                _2832 = _2930;
                _2834 = _2952;
                _2868 = _2914;
                _2870 = _2912;
                _2836 = _2934;
                _2872 = true;
            }
        }
    }
    else
    {
        float _2954 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        out.gl_Position.z = _2954;
        _2866 = 0.0;
        _2868 = 0.0;
        _2870 = _2954;
        _2836 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
        _2838 = 0.0;
    }
    _2872 = false;
    float _2956 = _2866;
    float _2958 = _2832;
    float _2960 = _2834;
    float _2962 = _2868;
    float _2964 = _2870;
    float _2966 = _2836;
    float _2968 = _2838;
    bool _2970 = _2231 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2972 = isnan(_2231);
    bool _2974 = _2970 || _2972;
    bool _2976 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2978 = _2974 || _2976;
    float _2980 = _2960;
    float _2982 = _2958;
    float _2984 = _2964;
    float _2986 = _2962;
    float _2988 = _2956;
    float _2990 = _2966;
    if (!_2978)
    {
        _2980 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2992 = _2980;
    float _2994 = _2992;
    float _2996 = _2992;
    if (!_2978)
    {
        _2982 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2998 = _2982;
    float _3000 = _2998;
    float _3002 = _2998;
    if (!_2978)
    {
        _2984 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3004 = _2984;
    float _3006 = _3004;
    float _3008 = _3004;
    if (!_2978)
    {
        _2986 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3010 = _2986;
    float _3012 = _3010;
    float _3014 = _3010;
    if (!_2978)
    {
        _2988 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3016 = _2988;
    float _3018 = _3016;
    float _3020 = _3016;
    if (!_2978)
    {
        _2990 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3022 = _2990;
    bool _3024 = !_2978;
    float _3026 = _3022;
    float _3028 = _3022;
    if (!_3024)
    {
        bool _3030 = _2231 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3032 = isnan(_2231);
        bool _3034 = _3030 || _3032;
        bool _3036 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3038 = _3034 || _3036;
        if (!_3038)
        {
            float _3040 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3042 = _2231 + _3040;
            float _3044 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3046 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3044;
            float _3048 = 1.0 / _3046;
            float _3050 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3052 = _3050 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3054 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3056 = _3054 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3058 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3060 = _3058 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3062 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3064 = _3062 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3066 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3068 = _3066 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3070 = _3042 * _3048;
            float _3072 = precise::clamp(_3070, 0.0, 1.0);
            float _3074 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3076 = _3074 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3078 = fma(_3072, _3052, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3080 = fma(_3072, _3076, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3082 = fma(_3072, _3056, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3084 = fma(_3072, _3060, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3086 = fma(_3072, _3064, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3088 = fma(_3072, _3068, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3002 = _3080;
            _3020 = _3086;
            _2996 = _3078;
            _3014 = _3084;
            _3008 = _3082;
            _3028 = _3088;
            _3090 = true;
        }
        else
        {
            bool _3092 = _2231 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3094 = isnan(_2231);
            bool _3096 = _3092 || _3094;
            bool _3098 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3100 = _3096 || _3098;
            if (!_3100)
            {
                _2994 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3102 = _2994;
            _2996 = _3102;
            if (!_3100)
            {
                _3000 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3104 = _3000;
            _3002 = _3104;
            if (!_3100)
            {
                _3006 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3106 = _3006;
            _3008 = _3106;
            if (!_3100)
            {
                _3012 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3108 = _3012;
            _3014 = _3108;
            if (!_3100)
            {
                _3018 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3110 = _3018;
            _3020 = _3110;
            if (!_3100)
            {
                _3026 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3112 = _3026;
            bool _3114 = !_3100;
            _3028 = _3112;
            if (!_3114)
            {
                bool _3116 = _2231 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3118 = isnan(_2231);
                bool _3120 = _3116 || _3118;
                bool _3122 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3124 = _3120 || _3122;
                if (!_3124)
                {
                    float _3126 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3128 = _2231 + _3126;
                    float _3130 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3132 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3130;
                    float _3134 = 1.0 / _3132;
                    float _3136 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3138 = _3136 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3140 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3142 = _3140 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3144 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3146 = _3144 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3148 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3150 = _3148 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3152 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3154 = _3152 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3156 = _3128 * _3134;
                    float _3158 = precise::clamp(_3156, 0.0, 1.0);
                    float _3160 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3162 = _3160 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3164 = fma(_3158, _3138, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3166 = fma(_3158, _3162, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3168 = fma(_3158, _3142, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3170 = fma(_3158, _3146, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3172 = fma(_3158, _3150, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3174 = fma(_3158, _3154, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3002 = _3166;
                    _3020 = _3172;
                    _2996 = _3164;
                    _3014 = _3170;
                    _3008 = _3168;
                    _3028 = _3174;
                    _3090 = true;
                }
                else
                {
                    _3002 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3020 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2996 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3014 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3008 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3028 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3090 = false;
    float _3176 = _3002;
    float _3178 = _3020;
    float _3180 = _2996;
    float _3182 = _3014;
    float _3184 = _3008;
    float _3186 = _3028;
    float _3188 = fma(_1598, -0.5, 0.5);
    float _3190 = precise::clamp(_3188, 0.0, 1.0);
    float _3192 = -_3176;
    float _3194 = _3192 + _3178;
    float _3196 = -_3180;
    float _3198 = _3196 + _3182;
    float _3200 = -_3184;
    float _3202 = _3200 + _3186;
    bool _3204 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3206 = fma(_3190, _3194, _3176);
    float _3208 = fma(_3190, _3198, _3180);
    float _3210 = fma(_3190, _3202, _3184);
    float _3212 = _2968 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3214 = _3206 * 0.586610972881317138671875;
    out.m_93.x = 0.0;
    float _3216 = fma(_3208, 0.298911988735198974609375, _3214);
    out.m_56.x = _3212;
    float _3218 = fma(_3210, 0.114477999508380889892578125, _3216);
    float _3220 = -_3218;
    float _3222 = _3208 + _3220;
    float _3224 = -_3218;
    float _3226 = _3206 + _3224;
    float _3228 = -_3218;
    float _3230 = _3210 + _3228;
    float _3232 = fma(_3222, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3218);
    float _3234 = fma(_3226, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3218);
    float _3236 = fma(_3230, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3218);
    out.m_95.x = _3232;
    out.m_95.y = _3234;
    out.m_95.z = _3236;
    if (!_3204)
    {
        return out;
    }
    float _3238 = -_2205;
    float _3240 = _3238 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3242 = -_2207;
    float _3244 = _3242 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3246 = -_2209;
    float _3248 = _3246 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3250 = _3240 * _3240;
    float _3252 = fma(_3244, _3244, _3250);
    float _3254 = fma(_3248, _3248, _3252);
    float _3256 = sqrt(_3254);
    float _3258 = rsqrt(_3254);
    float _3260 = -_3256;
    float _3262 = _3260 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3264 = _3262 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3266 = precise::clamp(_3264, 0.0, 1.0);
    float _3268 = _3244 * _3258;
    float _3270 = _3240 * _3258;
    float _3272 = abs(_3266);
    float _3274 = log2(_3272);
    float _3276 = _3248 * _3258;
    float _3278 = _3268 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3280 = _1598 * _3270;
    float _3282 = -_3270;
    float _3284 = -_3278;
    float _3286 = fma(_3282, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3284);
    float _3288 = fma(_1596, _3268, _3280);
    float _3290 = -_3276;
    float _3292 = fma(_3290, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3286);
    float _3294 = fma(_1600, _3276, _3288);
    float _3296 = precise::clamp(_3294, 0.0, 1.0);
    float _3298 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3300 = _3292 + _3298;
    float _3302 = _3274 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3304 = _3300 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3306 = precise::clamp(_3304, 0.0, 1.0);
    float _3308 = exp2(_3302);
    float _3310 = _3308 * _3306;
    float _3312 = _3296 * _3310;
    float _3314 = _3312 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3316 = _3312 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3318 = _3312 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_93.x = _3314;
    out.m_93.y = _3316;
    out.m_93.z = _3318;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint dm_vid = gl_VertexIndex;
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3090 = false;
    bool _2872 = false;
    bool _1684 = false;
    bool _1672 = false;
    bool _678 = false;
    bool _530 = false;
    bool _338 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _109 = in.m_53.w;
    float _111 = trunc(_109);
    int _114 = int(_111);
    bool _118 = _114 >= 1;
    float _120 = 0.0;
    if (!_118)
    {
        _120 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _122 = _120;
    float _124 = _122;
    if (!_118)
    {
        out.m_56.x = 0.0;
    }
    int _126 = 0;
    if (!_118)
    {
        float _128 = _122 * 5.0;
        _126 = as_type<int>(_128);
    }
    int _130 = _126;
    int _132 = _130;
    if (!_118)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3375 = as_type<float>(_130);
        out.gl_Position.z = _3375;
    }
    if (!_118)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _134 = in.m_58.w;
    bool _136 = _134 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _138 = isnan(_134);
    bool _140 = _136 || _138;
    bool _142 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _144 = _140 || _142;
    float _146 = -_134;
    float _148 = _146 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _150 = 0.0;
    float _152 = _148;
    if (_144)
    {
        float _154 = float(_114);
        _150 = _154;
    }
    float _156 = _150;
    bool _158 = _148 >= _156;
    bool _160 = !_144;
    bool _162 = _158 || _160;
    if (_162)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _164 = _124;
    if (_162)
    {
        out.m_56.x = 0.0;
    }
    if (_162)
    {
        float _166 = _164 * 5.0;
        _132 = as_type<int>(_166);
    }
    int _168 = _132;
    if (_162)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3444 = as_type<float>(_168);
        out.gl_Position.z = _3444;
    }
    if (_162)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _170 = in.m_60.x;
    float _172 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _174 = _148 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _176 = as_type<float>(int(gl_VertexIndex));
    float _178 = in.m_65.x;
    float _180 = in.m_65.y;
    float _182 = in.m_65.z;
    float _184 = in.m_67.x;
    float _186 = in.m_67.y;
    float _188 = in.m_67.z;
    float _190 = in.m_69.x;
    float _192 = in.m_69.y;
    float _194 = in.m_69.z;
    float _196 = _174 * _172;
    float _198 = in.m_71.x;
    float _200 = in.m_71.y;
    float _202 = in.m_71.z;
    float _204 = fma(_170, (*spvDescriptorSet0.vp_c9)._m0[20].x, _196);
    int _206 = as_type<int>(_176) & 1;
    bool _208 = _206 != 0;
    int _210 = as_type<int>(_176) & 2;
    bool _212 = _210 != 0;
    float _214 = _204 * 6.283185482025146484375;
    int _216 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _218 = _216 != 0;
    float _220 = floor(_204);
    float _222 = _214 * 0.15915493667125701904296875;
    bool _224 = !_212;
    float _226 = _224 ? (-0.5) : 0.5;
    int _228 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _230 = _228 != 0;
    int _232 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _234 = _232 != 0;
    float _236 = _180 * _186;
    bool _238 = !_218;
    int _240 = _238 ? 0 : 1;
    float _242 = _222 * 6.283185482025146484375;
    float _244 = cos(_242);
    float _246 = _180 * _192;
    bool _248 = !_230;
    int _250 = _248 ? 0 : 1;
    float _252 = fma(_178, _184, _236);
    int _254 = abs(_240);
    float _256 = _180 * _200;
    int _258 = abs(_250);
    float _260 = fma(_178, _190, _246);
    float _262 = -_220;
    float _264 = _204 + _262;
    float _266 = fma(_178, _198, _256);
    float _268 = fma(_182, _194, _260);
    bool _270 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _272 = -_264;
    float _274 = fma(_272, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _276 = float(_258);
    float _278 = fma(_244, 0.5, 0.5);
    bool _280 = !_234;
    int _282 = _280 ? 0 : 1;
    float _284 = abs(_274);
    float _286 = _276 * _284;
    bool _288 = _264 < 0.5;
    float _290 = float(_288);
    float _292 = -_278;
    float _294 = fma(_292, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _296 = abs(_282);
    float _298 = float(_254);
    float _300 = -_290;
    float _302 = fma(_300, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _304 = float(_296);
    bool _306 = !_208;
    float _308 = _306 ? (-0.5) : 0.5;
    float _310 = fma(_298, _294, _286);
    float _312 = fma(_182, _188, _252);
    float _314 = fma(_182, _202, _266);
    float _316 = abs(_302);
    float _318 = fma(_304, _316, _310);
    bool _320 = !_270;
    float _336;
    if (!_320)
    {
        float _322 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _324 = _170 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _326 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[12].x, _148);
        float _328 = _326 * _322;
        float _330 = floor(_328);
        float _332 = -_330;
        float _334 = _328 + _332;
        _336 = _334;
        _338 = true;
    }
    else
    {
        float _340 = float(_114);
        float _342 = 1.0 / _340;
        float _344 = _148 * _342;
        _336 = _344;
    }
    _338 = false;
    float _346 = _336;
    float _348 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _350 = _346 + _348;
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _354 = _346 + _352;
    float _356 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _358 = _346 + _356;
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _362 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _360;
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _366 = _364 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _368 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _370 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _368;
    bool _372 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _374 = 1.0 / _362;
    float _376 = 1.0 / _370;
    bool _378 = _346 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _380 = isnan(_346);
    bool _382 = _378 || _380;
    bool _384 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _386 = _382 || _384;
    float _388 = float(_386);
    float _390 = 1.0 / _366;
    float _392 = _350 * _374;
    bool _394 = _346 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _396 = isnan(_346);
    bool _398 = _394 || _396;
    bool _400 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _402 = _398 || _400;
    float _404 = float(_402);
    float _406 = _354 * _376;
    bool _408 = _346 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _410 = isnan(_346);
    bool _412 = _408 || _410;
    bool _414 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _416 = _412 || _414;
    float _418 = float(_416);
    float _420 = -_404;
    float _422 = _420 + 1.0;
    bool _424 = _346 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _426 = isnan(_346);
    bool _428 = _424 || _426;
    bool _430 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _432 = _428 || _430;
    float _434 = float(_432);
    float _436 = _388 * _422;
    float _438 = _358 * _390;
    float _440 = -_388;
    float _442 = _440 + 1.0;
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _446 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _444;
    float _448 = _418 * _442;
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _452 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _450;
    float _454 = -_418;
    float _456 = _454 + 1.0;
    float _458 = fma(_446, _392, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _460 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _462 = _460 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _464 = fma(_452, _392, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _466 = _434 * _456;
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _470 = _468 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _472 = -_434;
    float _474 = _472 + 1.0;
    float _476 = _464 * _466;
    float _478 = _458 * _466;
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _482 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _480;
    float _484 = fma(_462, _438, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _486 = fma(_474, (*spvDescriptorSet0.vp_c9)._m0[143].x, _476);
    float _488 = fma(_470, _438, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _492 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _490;
    float _494 = fma(_474, (*spvDescriptorSet0.vp_c9)._m0[143].y, _478);
    float _496 = fma(_482, _406, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _498 = fma(_484, _448, _486);
    float _500 = fma(_492, _406, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _502 = fma(_488, _448, _494);
    float _504 = fma(_496, _436, _498);
    float _506 = fma(_500, _436, _502);
    float _508 = fma(_404, (*spvDescriptorSet0.vp_c9)._m0[146].x, _504);
    float _510 = fma(_404, (*spvDescriptorSet0.vp_c9)._m0[146].y, _506);
    bool _512 = !_372;
    float _528;
    if (!_512)
    {
        float _514 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _516 = _170 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _518 = fma(_516, (*spvDescriptorSet0.vp_c9)._m0[11].y, _148);
        float _520 = _518 * _514;
        float _522 = floor(_520);
        float _524 = -_522;
        float _526 = _520 + _524;
        _528 = _526;
        _530 = true;
    }
    else
    {
        float _532 = float(_114);
        float _534 = 1.0 / _532;
        float _536 = _148 * _534;
        _528 = _536;
    }
    _530 = false;
    float _538 = _528;
    float _540 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _542 = _540 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _544 = _538 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _546 = isnan(_538);
    bool _548 = _544 || _546;
    bool _550 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _552 = _548 || _550;
    float _554 = float(_552);
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _558 = _556 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _560 = _538 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _562 = isnan(_538);
    bool _564 = _560 || _562;
    bool _566 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _568 = _564 || _566;
    float _570 = float(_568);
    float _572 = 1.0 / _542;
    float _574 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _576 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _574;
    float _578 = -_554;
    float _580 = _578 + 1.0;
    bool _582 = _538 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _584 = isnan(_538);
    bool _586 = _582 || _584;
    bool _588 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _590 = _586 || _588;
    float _592 = float(_590);
    bool _594 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _596 = _570 * _580;
    float _598 = -_570;
    float _600 = _598 + 1.0;
    float _602 = 1.0 / _558;
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _606 = _604 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _608 = _576 * _572;
    float _610 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _612 = _538 + _610;
    float _614 = -_592;
    float _616 = _614 + 1.0;
    float _618 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _620 = _538 + _618;
    float _622 = fma(_608, _612, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _624 = _554 * _616;
    float _626 = _606 * _602;
    float _628 = _622 * _596;
    float _630 = fma(_626, _620, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _632 = fma(_600, (*spvDescriptorSet0.vp_c9)._m0[115].x, _628);
    float _634 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _636 = fma(_630, _624, _632);
    float _638 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _640 = _634 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _642 = fma(_592, (*spvDescriptorSet0.vp_c9)._m0[117].x, _636);
    float _644 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _646 = _638 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _648 = in.m_73.x;
    float _650 = in.m_73.y;
    float _652 = _642 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _654 = _644 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_75.x = _640;
    out.m_75.y = _654;
    out.m_75.z = _646;
    out.m_75.w = _652;
    float _656 = _510 * _650;
    float _658 = _508 * _648;
    bool _660 = !_594;
    float _676;
    if (!_660)
    {
        float _662 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _664 = _170 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _666 = fma(_664, (*spvDescriptorSet0.vp_c9)._m0[11].w, _148);
        float _668 = _666 * _662;
        float _670 = floor(_668);
        float _672 = -_670;
        float _674 = _668 + _672;
        _676 = _674;
        _678 = true;
    }
    else
    {
        float _680 = float(_114);
        float _682 = 1.0 / _680;
        float _684 = _148 * _682;
        _676 = _684;
    }
    _678 = false;
    float _686 = _676;
    float _688 = in.m_53.x;
    float _690 = in.m_53.y;
    float _692 = in.m_53.z;
    float _694 = _170 * 2.0;
    int _696 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _698 = _696 != 0;
    int _700 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _702 = _700 != 0;
    int _704 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _706 = _704 != 0;
    float _708 = in.m_60.y;
    int _710 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _712 = _710 != 0;
    float _714 = floor(_694);
    int _716 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _718 = _716 != 0;
    float _720 = in.m_71.w;
    float _722 = in.m_69.w;
    bool _724 = !_702;
    int _726 = _724 ? 0 : 1;
    bool _728 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _730 = isnan(0.0);
    bool _732 = _728 || _730;
    bool _734 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _736 = _732 || _734;
    float _738 = in.m_67.w;
    int _740 = abs(_726);
    bool _742 = _714 > 0.0;
    float _744 = _186 * _690;
    float _746 = _192 * _690;
    float _748 = _200 * _690;
    float _750 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _752 = _750 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _754 = fma(_184, _688, _744);
    float _756 = fma(_190, _688, _746);
    float _758 = _170 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _760 = fma(_198, _688, _748);
    float _762 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _764 = _762 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _766 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _768 = _766 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _770 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _772 = _708 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _774 = 1.0 / _764;
    float _776 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _778 = -_770;
    float _780 = fma(_758, 2.0, _778);
    float _782 = fma(_188, _692, _754);
    float _784 = in.m_60.z;
    float _786 = fma(_194, _692, _756);
    float _788 = fma(_202, _692, _760);
    float _790 = 1.0 / _752;
    float _792 = _708 * 2.0;
    bool _794 = _714 >= 0.0;
    bool _796 = isnan(_714);
    bool _798 = _794 || _796;
    bool _800 = isnan(0.0);
    bool _802 = _798 || _800;
    float _804 = _788 + _720;
    float _806 = _786 + _722;
    int _808 = _802 ? 0 : 1;
    float _810 = _782 + _738;
    float _812 = 1.0 / _768;
    float _814 = fma(_772, -2.0, _776);
    float _816 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    bool _818 = _170 > 0.5;
    bool _820 = _686 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _822 = isnan(_686);
    bool _824 = _820 || _822;
    bool _826 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _828 = _824 || _826;
    float _830 = float(_828);
    float _832 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _834 = _832 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _836 = floor(_792);
    float _838 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _840 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _838;
    float _842 = -_308;
    int _844 = _818 ? as_type<int>(_842) : as_type<int>(_308);
    float _846 = _834 * _774;
    float _848 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _850 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _848;
    float _852 = _840 * _790;
    float _854 = _170 + _708;
    float _856 = _850 * _812;
    float _858 = _784 * 2.0;
    float _860 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _862 = log2(_860);
    float _864 = _854 + (-1.0);
    int _866 = ~_808;
    int _868 = _866 + 1;
    int _870 = _868 + 1;
    float _872 = _708 + _784;
    int _874 = _870;
    if (!_742)
    {
        int _876 = ~_808;
        int _878 = _876 + 1;
        _874 = _878;
    }
    int _880 = _874;
    float _882 = _170 + _784;
    bool _884 = _836 > 0.0;
    float _886 = fma(_864, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _888 = floor(_858);
    float _890 = _872 + (-1.0);
    float _892 = _882 + (-1.0);
    bool _894 = _836 >= 0.0;
    bool _896 = isnan(_836);
    bool _898 = _894 || _896;
    bool _900 = isnan(0.0);
    bool _902 = _898 || _900;
    float _904 = fma(_890, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _906 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _908 = _686 + _906;
    float _910 = _862 * _148;
    int _912 = _902 ? 0 : 1;
    float _914 = fma(_892, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _916 = _708 > 0.5;
    float _918 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _920 = _686 + _918;
    int _922 = ~_912;
    int _924 = _922 + 1;
    int _926 = _924 + 1;
    float _928 = exp2(_910);
    float _930 = fma(_852, _908, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    int _932 = _926;
    if (!_884)
    {
        int _934 = ~_912;
        int _936 = _934 + 1;
        _932 = _936;
    }
    int _938 = _932;
    float _940 = fma(_856, _920, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _942 = -_226;
    int _944 = _916 ? as_type<int>(_942) : as_type<int>(_226);
    float _946 = fma(_784, (*spvDescriptorSet0.vp_c9)._m0[79].z, _816);
    bool _948 = _888 > 0.0;
    bool _950 = _888 >= 0.0;
    bool _952 = isnan(_888);
    bool _954 = _950 || _952;
    bool _956 = isnan(0.0);
    bool _958 = _954 || _956;
    float _960 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _962 = _686 + _960;
    bool _964 = _686 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _966 = isnan(_686);
    bool _968 = _964 || _966;
    bool _970 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _972 = _968 || _970;
    float _974 = float(_972);
    float _976 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[79].x, _946);
    bool _978 = _686 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _980 = isnan(_686);
    bool _982 = _978 || _980;
    bool _984 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _986 = _982 || _984;
    float _988 = float(_986);
    float _990 = fma(_846, _962, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _992 = -_974;
    float _994 = _992 + 1.0;
    float _996 = -_928;
    float _998 = _996 + 1.0;
    bool _1000 = _686 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1002 = isnan(_686);
    bool _1004 = _1000 || _1002;
    bool _1006 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1008 = _1004 || _1006;
    float _1010 = float(_1008);
    float _1012 = _976 * (-0.15915493667125701904296875);
    float _1014 = _988 * _994;
    float _1016 = -_988;
    float _1018 = _1016 + 1.0;
    float _1020 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1022 = 1.0 + _1020;
    float _1024 = _1012 * 6.283185482025146484375;
    float _1026 = cos(_1024);
    float _1028 = _830 * _1018;
    float _1030 = -_830;
    float _1032 = _1030 + 1.0;
    float _1034 = _736 ? _998 : 0.0;
    bool _1036 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1038 = isnan(1.0);
    bool _1040 = _1036 || _1038;
    bool _1042 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1044 = _1040 || _1042;
    float _1046 = _1010 * _1032;
    float _1048 = float(_740);
    float _1050 = 1.0 / _1022;
    float _1052 = float(_880);
    float _1054 = _930 * _1046;
    float _1056 = -_148;
    float _1058 = fma(_1056, (*spvDescriptorSet0.vp_c9)._m0[76].x, _780);
    float _1060 = float(_938);
    float _1062 = _1012 * 6.283185482025146484375;
    float _1064 = sin(_1062);
    float _1066 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1068 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1070 = -_1010;
    float _1072 = _1070 + 1.0;
    float _1074 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[76].y, _814);
    float _1076 = fma(_170, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1066);
    float _1078 = fma(_708, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1068);
    int _1080 = _958 ? 0 : 1;
    float _1082 = fma(_1072, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1054);
    float _1084 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1076);
    float _1086 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1078);
    if (_1044)
    {
        float _1088 = _1034 * _1050;
        _152 = _1088;
    }
    float _1090 = _152;
    bool _1092 = !_718;
    float _1094 = _1092 ? _226 : as_type<float>(_944);
    float _1096 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].x;
    bool _1098 = !_712;
    float _1100 = _1098 ? _308 : as_type<float>(_844);
    float _1102 = _708 + (-0.5);
    int _1104 = ~_1080;
    int _1106 = _1104 + 1;
    int _1108 = _1106 + 1;
    float _1110 = _1094 * _1064;
    float _1112 = _1094 * _1026;
    int _1114 = _1108;
    if (!_948)
    {
        int _1116 = ~_1080;
        int _1118 = _1116 + 1;
        _1114 = _1118;
    }
    int _1120 = _1114;
    float _1122 = fma(_990, _1028, _1082);
    float _1124 = -_1110;
    float _1126 = fma(_1100, _1026, _1124);
    float _1128 = _1048 * _1052;
    float _1130 = _806 + (*spvDescriptorSet0.vp_c12)._m0[0].y;
    float _1132 = fma(_1100, _1064, _1112);
    float _1134 = _810 + (*spvDescriptorSet0.vp_c12)._m0[0].x;
    bool _1136 = !_706;
    int _1138 = _1136 ? 0 : 1;
    float _1140 = _1130 * (*spvDescriptorSet0.vp_c12)._m0[7].x;
    float _1142 = _1130 * (*spvDescriptorSet0.vp_c12)._m0[7].y;
    float _1144 = _1130 * (*spvDescriptorSet0.vp_c12)._m0[7].z;
    bool _1146 = !_698;
    int _1148 = _1146 ? 0 : 1;
    float _1150 = fma(_1134, (*spvDescriptorSet0.vp_c12)._m0[6].x, _1140);
    float _1152 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1154 = fma(_940, _1014, _1122);
    int _1156 = abs(_1148);
    float _1158 = fma(_1134, (*spvDescriptorSet0.vp_c12)._m0[6].y, _1142);
    float _1160 = in.m_77.x;
    float _1162 = in.m_77.y;
    float _1164 = in.m_77.z;
    float _1166 = -_806;
    float _1168 = _1166 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1170 = fma(_1134, (*spvDescriptorSet0.vp_c12)._m0[6].z, _1144);
    int _1172 = abs(_1138);
    float _1174 = _804 + (*spvDescriptorSet0.vp_c12)._m0[0].z;
    float _1176 = -_810;
    float _1178 = _1176 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1180 = _1168 * _1168;
    float _1182 = -_804;
    float _1184 = _1182 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1186 = fma(_1174, (*spvDescriptorSet0.vp_c12)._m0[8].x, _1150);
    float _1188 = float(_1172);
    float _1190 = fma(_1178, _1178, _1180);
    float _1192 = float(_1156);
    float _1194 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _1196 = float(_1120);
    float _1198 = _1186 + (*spvDescriptorSet0.vp_c12)._m0[9].x;
    float _1200 = _1188 * _1060;
    float _1202 = fma(_1184, _1184, _1190);
    float _1204 = fma(_1174, (*spvDescriptorSet0.vp_c12)._m0[8].y, _1158);
    float _1206 = _1198 * _1096;
    float _1208 = _1192 * _1196;
    float _1210 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _1212 = _1152 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1214 = _1126 + 0.5;
    float _1216 = fma(_1174, (*spvDescriptorSet0.vp_c12)._m0[8].z, _1170);
    float _1218 = _1204 + (*spvDescriptorSet0.vp_c12)._m0[9].y;
    float _1220 = _170 + (-0.5);
    float _1222 = fma(_1212, _1214, _1058);
    float _1224 = _1128 * (-2.0);
    float _1226 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1228 = _1216 + (*spvDescriptorSet0.vp_c12)._m0[9].z;
    float _1230 = _1218 * _1194;
    float _1232 = fma(_1224, _1162, _1162);
    float _1234 = -_1084;
    float _1236 = _1234 + 1.0;
    float _1238 = -_1086;
    float _1240 = _1238 + 1.0;
    float _1242 = fma(_1230, 0.5, 0.5);
    float _1244 = fma(_1102, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1232);
    float _1246 = rsqrt(_1202);
    float _1248 = _1228 * _1210;
    float _1250 = fma(_904, _1224, _904);
    float _1252 = _1132 + (-0.5);
    float _1254 = _1208 * (-2.0);
    float _1256 = _1200 * (-2.0);
    float _1258 = fma(_1250, _1090, _1244);
    float _1260 = fma(_1206, 0.5, 0.5);
    float _1262 = _1226 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1264 = fma(_1254, _1160, _1160);
    float _1266 = fma(_1248, 0.5, 0.5);
    float _1268 = _1258 * 0.15915493667125701904296875;
    float _1270 = -_1262;
    float _1272 = -_1074;
    float _1274 = fma(_1270, _1252, _1272);
    float _1276 = fma(_886, _1254, _886);
    float _1278 = fma(_974, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1154);
    float _1280 = fma(_914, _1256, _914);
    float _1282 = fma(_1256, _1164, _1164);
    float _1284 = _784 + (-0.5);
    float _1286 = _1178 * _1246;
    float _1288 = _1168 * _1246;
    float _1290 = _1184 * _1246;
    float _1292 = fma(_1284, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1282);
    float _1294 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1296 = _1286 * _1294;
    float _1298 = fma(_1220, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1264);
    float _1300 = -_1236;
    float _1302 = fma(_1126, _1300, _1222);
    float _1304 = fma(_1280, _1090, _1292);
    float _1306 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1308 = _1290 * _1306;
    float _1310 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1312 = -_1296;
    float _1314 = fma(_1290, _1310, _1312);
    float _1316 = fma(_1276, _1090, _1298);
    float _1318 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1320 = _1288 * _1318;
    float _1322 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1324 = -_1308;
    float _1326 = fma(_1288, _1322, _1324);
    float _1328 = _1314 * _1314;
    float _1330 = _1316 * 0.15915493667125701904296875;
    float _1332 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1334 = -_1320;
    float _1336 = fma(_1286, _1332, _1334);
    float _1338 = _1304 * 0.15915493667125701904296875;
    float _1340 = fma(_1326, _1326, _1328);
    float _1342 = fma(_1132, _1240, _1274);
    float _1344 = _1330 * 6.283185482025146484375;
    float _1346 = sin(_1344);
    float _1348 = _656 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1350 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _226);
    float _1352 = _1278 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1354 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1356 = _1330 * 6.283185482025146484375;
    float _1358 = cos(_1356);
    float _1360 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1362 = _1348 * _1350;
    float _1364 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1366 = _1354 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1368 = _1360 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_79.x = _1302;
    out.m_79.y = _1342;
    float _1370 = _1364 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1372 = floor(_1260);
    float _1374 = fma(_1336, _1336, _1340);
    bool _1376 = 1.0 != (*spvDescriptorSet0.vp_c12)._m0[10].x;
    bool _1378 = isnan(1.0);
    bool _1380 = _1376 || _1378;
    bool _1382 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].x);
    bool _1384 = _1380 || _1382;
    out.m_81.x = _1366;
    out.m_81.y = _1368;
    out.m_81.z = _1370;
    out.m_81.w = _1352;
    float _1386 = floor(_1242);
    float _1388 = floor(_1266);
    float _1390 = -_1372;
    float _1392 = _1260 + _1390;
    float _1394 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _308);
    float _1396 = _308 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1398 = fma(_1392, 2.0, -1.0);
    float _1400 = _1268 * 6.283185482025146484375;
    float _1402 = sin(_1400);
    float _1404 = -_1386;
    float _1406 = _1242 + _1404;
    float _1408 = fma(_1406, 2.0, -1.0);
    float _1410 = _1268 * 6.283185482025146484375;
    float _1412 = cos(_1410);
    float _1414 = -_1388;
    float _1416 = _1266 + _1414;
    float _1418 = _1338 * 6.283185482025146484375;
    float _1420 = cos(_1418);
    float _1422 = _1346 * _1402;
    float _1424 = _1358 * _1402;
    float _1426 = rsqrt(_1374);
    float _1428 = _1346 * _1412;
    float _1430 = _1338 * 6.283185482025146484375;
    float _1432 = sin(_1430);
    float _1434 = _1346 * _1420;
    float _1436 = _1358 * _1412;
    float _1438 = _1358 * _1420;
    float _1440 = _658 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1442 = _1412 * _1420;
    float _1444 = _1402 * _1420;
    float _1446 = _1438 * _1362;
    float _1448 = _1314 * _1426;
    float _1450 = _1440 * _1394;
    float _1452 = _1408 * (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _1454 = _1336 * _1426;
    float _1456 = _1398 * (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _1458 = _1452 * (*spvDescriptorSet0.vp_c12)._m0[3].x;
    float _1460 = _1452 * (*spvDescriptorSet0.vp_c12)._m0[3].y;
    float _1462 = fma(_1432, _1436, _1422);
    float _1464 = fma(_1432, _1422, _1436);
    float _1466 = -_1362;
    float _1468 = _1432 * _1466;
    float _1470 = -_1424;
    float _1472 = fma(_1432, _1428, _1470);
    float _1474 = -_1428;
    float _1476 = fma(_1432, _1424, _1474);
    float _1478 = _1434 * _1362;
    float _1480 = _1326 * _1426;
    float _1482 = _1452 * (*spvDescriptorSet0.vp_c12)._m0[3].z;
    float _1484 = fma(_1442, _1450, _1468);
    float _1486 = fma(_1462, _1450, _1446);
    float _1488 = fma(_1472, _1450, _1478);
    float _1490 = fma(_1456, (*spvDescriptorSet0.vp_c12)._m0[2].x, _1458);
    float _1492 = _1290 * _1448;
    float _1494 = _1286 * _1454;
    float _1496 = _1288 * _1480;
    float _1498 = fma(_1456, (*spvDescriptorSet0.vp_c12)._m0[2].y, _1460);
    float _1500 = -_1492;
    float _1502 = fma(_1288, _1454, _1500);
    float _1504 = -_1494;
    float _1506 = fma(_1290, _1480, _1504);
    float _1508 = -_1496;
    float _1510 = fma(_1286, _1448, _1508);
    float _1512 = fma(_1456, (*spvDescriptorSet0.vp_c12)._m0[2].z, _1482);
    float _1514 = _1438 * _1502;
    float _1516 = _1438 * _1506;
    float _1518 = _1438 * _1510;
    float _1520 = _1462 * _1502;
    float _1522 = -_1432;
    float _1524 = fma(_1522, _1480, _1514);
    float _1526 = -_1432;
    float _1528 = fma(_1526, _1448, _1516);
    float _1530 = -_1432;
    float _1532 = fma(_1530, _1454, _1518);
    float _1534 = _1462 * _1510;
    float _1536 = fma(_1434, _1286, _1524);
    float _1538 = fma(_1434, _1288, _1528);
    float _1540 = fma(_1434, _1290, _1532);
    float _1542 = _226 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1544 = _1462 * _1506;
    float _1546 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1548 = fma(_1442, _1480, _1520);
    float _1550 = fma(_1442, _1454, _1534);
    float _1552 = _1542 * _1536;
    float _1554 = _1542 * _1538;
    float _1556 = _1542 * _1540;
    float _1558 = fma(_1442, _1448, _1544);
    float _1560 = fma(_1476, _1546, _1486);
    float _1562 = _1476 * _1502;
    float _1564 = _1476 * _1506;
    float _1566 = _1476 * _1510;
    float _1568 = fma(_1472, _1286, _1548);
    float _1570 = fma(_1472, _1288, _1558);
    float _1572 = fma(_1472, _1290, _1550);
    float _1574 = fma(_1444, _1480, _1562);
    float _1576 = fma(_1444, _1448, _1564);
    float _1578 = fma(_1444, _1454, _1566);
    float _1580 = fma(_1444, _1546, _1484);
    float _1582 = fma(_1464, _1286, _1574);
    float _1584 = fma(_1396, _1568, _1552);
    float _1586 = fma(_1396, _1570, _1554);
    float _1588 = fma(_1396, _1572, _1556);
    float _1590 = fma(_1464, _1288, _1576);
    float _1592 = fma(_1464, _1290, _1578);
    float _1594 = fma(_1464, _1546, _1488);
    float _1596 = _1582 + _1584;
    float _1598 = _1590 + _1586;
    float _1600 = _1592 + _1588;
    float _1602 = fma(_1416, 2.0, -1.0);
    float _1604 = _1502 * _1560;
    float _1606 = _1506 * _1560;
    float _1608 = _1510 * _1560;
    out.m_83.x = _1596;
    out.m_83.y = _1598;
    out.m_83.z = _1600;
    float _1610 = _1602 * (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _1612 = fma(_1480, _1580, _1604);
    float _1614 = fma(_1448, _1580, _1606);
    float _1616 = fma(_1454, _1580, _1608);
    float _1618 = fma(_1610, (*spvDescriptorSet0.vp_c12)._m0[4].x, _1490);
    float _1620 = fma(_1610, (*spvDescriptorSet0.vp_c12)._m0[4].y, _1498);
    float _1622 = fma(_1610, (*spvDescriptorSet0.vp_c12)._m0[4].z, _1512);
    float _1624 = fma(_1286, _1594, _1612);
    float _1626 = fma(_1288, _1594, _1614);
    float _1628 = fma(_1290, _1594, _1616);
    float _1630 = _1618 + (*spvDescriptorSet0.vp_c12)._m0[5].x;
    float _1632 = _1620 + (*spvDescriptorSet0.vp_c12)._m0[5].y;
    float _1634 = _1622 + (*spvDescriptorSet0.vp_c12)._m0[5].z;
    float _1636 = _1624 + _1630;
    float _1638 = _1626 + _1632;
    float _1640 = _1628 + _1634;
    float _1642 = _1564;
    float _1644 = _1628;
    float _1646 = _1622;
    float _1648 = _1628;
    float _1650 = _1624;
    float _1652 = _1622;
    float _1654 = _1398;
    float _1656 = _1408;
    float _1658 = _1610;
    float _1660 = _1602;
    int _1662 = as_type<int>(_1640);
    float _1664 = _1638;
    float _1666 = _1580;
    float _1676;
    float _1678;
    float _1680;
    float _1682;
    if (!_1384)
    {
        bool _1668 = _1632 > (*spvDescriptorSet0.vp_c12)._m0[10].y;
        bool _1670 = !_1668;
        _1672 = _1670;
        if (!_1672)
        {
            float _1674 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
            _1676 = _1674;
            _1678 = 0.0;
            _1680 = 0.0;
            _1682 = 0.0;
            _1684 = true;
        }
    }
    if ((!_1684) || _1672)
    {
        bool _1722;
        if (!_1672)
        {
            bool _1686 = _1632 >= (*spvDescriptorSet0.vp_c12)._m0[10].y;
            bool _1688 = isnan(_1632);
            bool _1690 = _1686 || _1688;
            bool _1692 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].y);
            bool _1694 = _1690 || _1692;
            bool _1696 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _1698 = !_1694;
            bool _1700 = _1696 && _1698;
            bool _1702 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            float _1704 = (*spvDescriptorSet0.vp_c12)._m0[10].x;
            if (_1700)
            {
                _1642 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
            }
            float _1706 = _1642;
            float _1708 = _1706;
            if (_1700)
            {
                _1644 = 0.0;
            }
            float _1710 = _1644;
            _1648 = _1710;
            _1678 = _1710;
            if (_1700)
            {
                _1704 = 0.0;
            }
            float _1712 = _1704;
            _1650 = _1712;
            _1680 = _1712;
            if (_1700)
            {
                float _1714 = _1706 * 5.0;
                _1708 = _1714;
            }
            float _1716 = _1708;
            _1676 = _1716;
            if (_1700)
            {
                _1646 = 0.0;
            }
            float _1718 = _1646;
            bool _1720 = !_1694;
            _1722 = _1720 && _1702;
            _1652 = _1718;
            _1682 = _1718;
        }
        if ((!_1722) || _1672)
        {
            _1672 = false;
            float _1724 = _1648;
            float _1726 = _1650;
            float _1728 = _1652;
            bool _1730 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].x;
            bool _1732 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].y;
            bool _1734 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].z;
            float _1736 = _1288;
            float _1738 = _1726;
            float _1740 = _1728;
            _1676 = _1640;
            if (_1730)
            {
                float _1742 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].x;
                _1736 = _1742;
            }
            float _1744 = _1736;
            if (_1730)
            {
                float _1746 = abs(_1398);
                float _1748 = -_1746;
                float _1750 = _1748 + 1.0;
                _1654 = _1750;
            }
            float _1752 = _1654;
            if (_1732)
            {
                float _1754 = abs(_1408);
                float _1756 = -_1754;
                float _1758 = _1756 + 1.0;
                _1656 = _1758;
            }
            float _1760 = _1656;
            if (!_1730)
            {
                _1658 = 1.0;
            }
            float _1762 = _1658;
            float _1764 = _1762;
            if (_1734)
            {
                float _1766 = abs(_1602);
                float _1768 = -_1766;
                float _1770 = _1768 + 1.0;
                _1660 = _1770;
            }
            float _1772 = _1660;
            if (!_1732)
            {
                _1738 = 1.0;
            }
            float _1774 = _1738;
            float _1776 = _1774;
            if (!_1734)
            {
                _1740 = 1.0;
            }
            float _1778 = _1740;
            float _1780 = _1594;
            float _1782 = _1778;
            if (_1732)
            {
                float _1784 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].y;
                _1780 = _1784;
            }
            float _1786 = _1780;
            float _1788 = _1724;
            if (_1734)
            {
                float _1790 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].z;
                _1788 = _1790;
            }
            float _1792 = _1788;
            if (_1730)
            {
                float _1794 = _1752 * _1744;
                float _1796 = precise::clamp(_1794, 0.0, 1.0);
                _1764 = _1796;
            }
            float _1798 = _1764;
            if (_1732)
            {
                float _1800 = _1760 * _1786;
                float _1802 = precise::clamp(_1800, 0.0, 1.0);
                _1776 = _1802;
            }
            float _1804 = _1776;
            float _1806 = _1798 * _1804;
            _1680 = _1638;
            if (_1734)
            {
                float _1808 = _1772 * _1792;
                float _1810 = precise::clamp(_1808, 0.0, 1.0);
                _1782 = _1810;
            }
            float _1812 = _1782;
            float _1814 = _1806 * _1812;
            _1678 = _1636;
            _1682 = _1814;
        }
    }
    _1684 = false;
    float _1816 = _1676;
    float _1818 = _1678;
    float _1820 = _1680;
    float _1822 = _1682;
    float _1824 = _1632 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1826 = fma(_1630, 6.2500002968590706586837768554688e-05, 0.5);
    float _1828 = _1824 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1830 = _1824 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1832 = fma(_1630, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1828);
    float _1834 = fma(_1630, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1830);
    float _1836 = fma(_1634, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1832);
    float _1838 = fma(_1634, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1834);
    float _1840 = _1836 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1842 = _1838 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1844 = trunc(_1840);
    int _1846 = int(_1844);
    float _1848 = trunc(_1842);
    int _1850 = int(_1848);
    int _1852 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1854 = _1846 + _1852;
    int _1856 = _1854 + 1;
    bool _1858 = _1856 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1860 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1862 = _1850 + _1860;
    int _1864 = _1862 + 1;
    int _1866 = _1856 | _1864;
    bool _1868 = _1866 < 0;
    bool _1870 = _1868 || _1858;
    bool _1872 = _1864 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1874 = _1872 || _1870;
    int _1876 = _1864;
    int _1878 = _1856;
    float _1880 = as_type<float>(_1866);
    float _1882 = _1842;
    float _1884 = _1818;
    float _1886 = _1816;
    if (!_1874)
    {
        int _1888 = _1864 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1890 = _1888 + _1856;
        _1662 = _1890;
    }
    int _1892 = _1662;
    float _1894 = _1618;
    if (!_1874)
    {
        float _1896 = floor(_1840);
        _1894 = _1896;
    }
    float _1898 = _1894;
    if (!_1874)
    {
        int _1900 = _1892 << 2;
        _1876 = _1900;
    }
    int _1902 = _1876;
    int _1904 = _1902;
    if (!_1874)
    {
        uint _1907 = uint(int(uint(_1892) >> uint(2)));
        _1878 = int(_1907);
    }
    int _1909 = _1878;
    if (!_1874)
    {
        int _1911 = 12 & _1902;
        _1904 = _1911;
    }
    int _1913 = _1904;
    if (!_1874)
    {
        int _1915 = _1909 << 4;
        int _1917 = _1915 + _1913;
        _1880 = as_type<float>(_1917);
    }
    float _1919 = _1880;
    float _1921 = fma(_1634, 6.2500002968590706586837768554688e-05, 0.5);
    float _1923 = as_type<float>(_1913);
    if (!_1874)
    {
        float _1925 = floor(_1842);
        _1923 = _1925;
    }
    float _1927 = _1923;
    if (!_1874)
    {
        float _1929 = -_1898;
        float _1931 = _1840 + _1929;
        _1664 = _1931;
    }
    float _1933 = _1664;
    float _1935 = _1919;
    if (!_1874)
    {
        int _1937 = as_type<int>(_1919) + 400;
        uint _1939 = uint(int(uint(_1937) >> uint(2)));
        uint _1941 = uint(int(uint(int(_1939)) >> uint(2)));
        int _1943 = int(_1939) & 3;
        float _1945 = (*spvDescriptorSet0.vp_c15)._m0[int(_1941)][_1943];
        _1935 = _1945;
    }
    float _1947 = _1935;
    float2 _6224 = float2(_1826, _1921);
    float _1949 = dm_bs(spvDescriptorSet0.vp_t_tcb_22.sample(spvDescriptorSet0.vp_t_tcb_22Smplr, select(_6224, float2(0.0), isnan(_6224)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_22, spvDescriptorSet0.vp_t_tcb_22Smplr_w, select(_6224, float2(0.0), isnan(_6224)), level(0.0)).x;
    float _1951 = _1927;
    if (!_1874)
    {
        float _1953 = -_1927;
        float _1955 = _1842 + _1953;
        _1951 = _1955;
    }
    float _1957 = _1951;
    float _1959 = _1620;
    if (!_1874)
    {
        float _1961 = rint(_1947);
        float _1963 = precise::max(_1961, 0.0);
        uint _1965 = uint(_1963);
        uint _1967 = clamp(_1965, 0u, 65535u);
        _1959 = as_type<float>(_1967);
    }
    float _1969 = _1959;
    float _1971 = _1957;
    float _1973 = _1969;
    if (!_1874)
    {
        float3 _6272 = float3(_1933, _1957, float(as_type<int>(_1969)));
        float3 _6276 = select(_6272, float3(0.0), isnan(_6272));
        float _1975 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6276.xy, uint(rint(_6276.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6276.xy, uint(rint(_6276.z)), level(0.0)).x;
        _1971 = _1975;
    }
    float _1977 = _1971;
    float _1979 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1981 = _1816 + _1979;
    float _1983 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1985 = _1818 + _1983;
    float _1987 = _1981 * _1981;
    float _1989 = fma(_1985, _1985, _1987);
    float _1991 = sqrt(_1989);
    bool _1993 = _1991 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1995 = _1985;
    if (!_1993)
    {
        _1882 = _1820;
    }
    float _1997 = _1882;
    bool _1999 = !_1993;
    float _2001 = _1997;
    if (!_1999)
    {
        float _2003 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2005 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2007 = _1991 + _2005;
        float _2009 = _1820 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2011 = rsqrt(_1989);
        float _2013 = _2007 * _2003;
        float _2015 = _2013 * 0.15915493667125701904296875;
        float _2017 = _2015 * 6.283185482025146484375;
        float _2019 = cos(_2017);
        float _2021 = _2015 * 6.283185482025146484375;
        float _2023 = sin(_2021);
        float _2025 = _2019 + (-1.0);
        float _2027 = _2025 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2029 = fma(_2023, _2009, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2031 = _2011 * _2029;
        float _2033 = fma(_2019, _1820, _2027);
        float _2035 = fma(_1985, _2031, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2037 = fma(_1981, _2031, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2001 = _2033;
        _1884 = _2035;
        _1886 = _2037;
    }
    float _2039 = _2001;
    float _2041 = _1884;
    float _2043 = _1886;
    float _2045 = -_1632;
    float _2047 = _2045 + _2039;
    float _2049 = -_1630;
    float _2051 = _2049 + _2041;
    float _2053 = -_1634;
    float _2055 = _2053 + _2043;
    float _2057 = _2047 * _2047;
    bool _2059 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2061 = isnan(0.5);
    bool _2063 = _2059 || _2061;
    bool _2065 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2067 = _2063 || _2065;
    float _2069 = fma(_2051, _2051, _2057);
    float _2071 = fma(_2055, _2055, _2069);
    float _2073 = sqrt(_2071);
    bool _2075 = _2073 > 0.0;
    bool _2077 = !_2075;
    float _2079 = _2041;
    float _2081 = _2043;
    float _2083 = _2039;
    float _2085 = _2047;
    if (!_2077)
    {
        float _2087 = _268 * _268;
        float _2089 = fma(_312, _312, _2087);
        float _2091 = fma(_314, _314, _2089);
        float _2093 = rsqrt(_2071);
        float _2095 = sqrt(_2091);
        float _2097 = _2051 * _2093;
        float _2099 = _2047 * _2093;
        float _2101 = _2055 * _2093;
        bool _2103 = _2095 > 0.0;
        bool _2105 = !_2103;
        _1995 = _2099;
        _1973 = _2097;
        if (!_2105)
        {
            float _2107 = rsqrt(_2091);
            float _2109 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2111 = _268 * _2107;
            float _2113 = _312 * _2107;
            float _2115 = _314 * _2107;
            float _2117 = _2099 * _2111;
            float _2119 = fma(_2097, _2113, _2117);
            float _2121 = _2109 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2123 = fma(_2101, _2115, _2119);
            float _2125 = _2123 * _2121;
            float _2127 = fma(_312, _2125, _2041);
            float _2129 = fma(_268, _2125, _2039);
            float _2131 = fma(_314, _2125, _2043);
            _2079 = _2127;
            _2081 = _2131;
            _2083 = _2129;
            _2085 = _2121;
        }
    }
    float _2133 = _2079;
    float _2135 = _2081;
    float _2137 = _2083;
    float _2139 = _2085;
    float _2141 = _1995;
    float _2143 = _1973;
    float _2145 = _2137;
    float _2147 = _2133;
    float _2149 = _2135;
    float _2151 = _2143;
    float _2153 = _2141;
    if (!_2067)
    {
        float _2155 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2157 = _1632 + _2155;
        float _2159 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2161 = _1630 + _2159;
        float _2163 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2165 = -_1630;
        float _2167 = _2165 + _2133;
        float _2169 = _2157 * _2157;
        float _2171 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2173 = _1634 + _2171;
        float _2175 = -_1634;
        float _2177 = _2175 + _2135;
        float _2179 = fma(_2161, _2161, _2169);
        float _2181 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2183 = fma(_2173, _2173, _2179);
        float _2185 = sqrt(_2183);
        float _2187 = _2163 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2189 = precise::min(_2185, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2191 = _2189 * _2181;
        float _2193 = _2187 * _2191;
        float _2195 = -_1632;
        float _2197 = _2195 + _2137;
        float _2199 = fma(_2167, _2193, _1630);
        float _2201 = fma(_2197, _2193, _1632);
        float _2203 = fma(_2177, _2193, _1634);
        _2145 = _2201;
        _2147 = _2199;
        _2149 = _2203;
    }
    float _2205 = _2145;
    float _2207 = _2147;
    float _2209 = _2149;
    float _2211 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2213 = _2205 + _2211;
    float _2215 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2217 = _2207 + _2215;
    float _2219 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2221 = _2209 + _2219;
    float _2223 = _2213 * _2213;
    float _2225 = fma(_2217, _2217, _2223);
    float _2227 = fma(_2221, _2221, _2225);
    float _2229 = rsqrt(_2227);
    float _2231 = sqrt(_2227);
    float _2233 = _2229 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2235 = _2217 * _2233;
    float _2237 = _2221 * _2233;
    float _2239 = _2235 * _2235;
    float _2241 = _2237 * _2237;
    float _2243 = _2239 + _2241;
    float _2245 = sqrt(_2243);
    bool _2247 = _2245 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2249 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2251 = _2245 + _2249;
    float _2253 = _2139;
    float _2255 = _2251;
    if (_2247)
    {
        float _2257 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2253 = _2257;
    }
    float _2259 = _2253;
    if (_2247)
    {
        float _2261 = rsqrt(_2243);
        _2151 = _2261;
    }
    float _2263 = _2151;
    float _2265 = _2263;
    if (_2247)
    {
        float _2267 = _2251 * _2259;
        _2255 = _2267;
    }
    float _2269 = _2255;
    if (_2247)
    {
        float _2271 = _2269 * 0.15915493667125701904296875;
        _2153 = _2271;
    }
    float _2273 = _2153;
    float _2275 = _2259;
    float _2277 = _2273;
    if (_2247)
    {
        float _2279 = _2273 * 6.283185482025146484375;
        float _2281 = sin(_2279);
        _2275 = _2281;
    }
    float _2283 = _2275;
    float _2285 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2287 = precise::max(0.0, _2285);
    float _2289 = _2055;
    float _2291 = _2287;
    if (_2247)
    {
        float _2293 = _2273 * 6.283185482025146484375;
        float _2295 = cos(_2293);
        _2289 = _2295;
    }
    float _2297 = _2289;
    float _2299 = -_2233;
    float _2301 = -_2287;
    float _2303 = fma(_2213, _2299, _2301);
    float _2305 = _2303;
    if (_2247)
    {
        float _2307 = _2303 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2291 = _2307;
    }
    float _2309 = _2291;
    float _2311 = _2283;
    float _2313 = _2309;
    if (_2247)
    {
        float _2315 = fma(_2283, _2309, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2311 = _2315;
    }
    float _2317 = _2311;
    float _2319 = _2317;
    float _2321 = _2297;
    if (_2247)
    {
        float _2323 = _2297 + (-1.0);
        _2313 = _2323;
    }
    float _2325 = _2313;
    float _2327 = _2325;
    if (_2247)
    {
        float _2329 = _2263 * _2317;
        _1666 = _2329;
    }
    float _2331 = _1666;
    if (!_2247)
    {
        _2319 = _2235;
    }
    float _2333 = _2319;
    float _2335 = _2333;
    if (_2247)
    {
        float _2337 = _2325 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2277 = _2337;
    }
    float _2339 = _2277;
    if (_2247)
    {
        float _2341 = _2235 * _2331;
        _2335 = _2341;
    }
    float _2343 = _2335;
    if (!_2247)
    {
        _2327 = _2237;
    }
    float _2345 = _2327;
    float _2347 = _2345;
    if (_2247)
    {
        float _2349 = _2237 * _2331;
        _2347 = _2349;
    }
    float _2351 = _2347;
    if (!_2247)
    {
        _2265 = _2239;
    }
    float _2353 = _2265;
    float _2355 = _2353;
    if (_2247)
    {
        float _2357 = fma(_2303, _2297, _2339);
        _2305 = _2357;
    }
    float _2359 = _2305;
    if (_2247)
    {
        float _2361 = _2343 * _2343;
        _2355 = _2361;
    }
    float _2363 = _2355;
    if (!_2247)
    {
        _2321 = _2241;
    }
    float _2365 = _2321;
    float _2367 = _2365;
    if (_2247)
    {
        float _2369 = _2351 * _2351;
        _2367 = _2369;
    }
    float _2371 = _2367;
    float _2373 = fma(_2359, _2359, _2363);
    float _2375 = abs(_1949);
    bool _2377 = _2375 != 0.0;
    bool _2379 = isnan(_2375);
    bool _2381 = _2377 || _2379;
    bool _2383 = isnan(0.0);
    bool _2385 = _2381 || _2383;
    float _2387 = _2373 + _2371;
    float _2389 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2391 = fma(_2231, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2389);
    float _2393 = precise::clamp(_2391, 0.0, 1.0);
    float _2395 = -_2393;
    float _2397 = _2395 + 1.0;
    float _2399 = rsqrt(_2387);
    float _2401 = _2205 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2403 = fma(_2207, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2401);
    float _2405 = abs(_2397);
    float _2407 = log2(_2405);
    float _2409 = fma(_2209, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2403);
    float _2411 = _2409 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2413 = _2399 * _2343;
    float _2415 = _2399 * _2359;
    float _2417 = _2399 * _2351;
    float _2419 = _2411 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2421 = _2413 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2423 = _2205 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2425 = _2411 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2427 = -_2421;
    float _2429 = fma(_2415, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2427);
    float _2431 = fma(_2207, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2423);
    float _2433 = _2407 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2435 = _2411 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2437 = -_2417;
    float _2439 = fma(_2437, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2429);
    float _2441 = fma(_2209, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2431);
    float _2443 = _2411 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2445 = _2205 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2447 = fma(_2439, -0.5, 0.5);
    float _2449 = _2441 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2451 = exp2(_2433);
    float _2453 = fma(_2439, 0.5, 0.5);
    float _2455 = fma(_2207, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2445);
    float _2457 = fma(_2449, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2443);
    float _2459 = fma(_2449, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2419);
    float _2461 = fma(_2449, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2435);
    float _2463 = fma(_2209, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2455);
    float _2465 = _2415 + 1.0;
    float _2467 = sqrt(_2447);
    float _2469 = fma(_2453, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2471 = _2463 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2473 = fma(_2453, _2469, -0.212114393711090087890625);
    float _2475 = fma(_2471, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2459);
    float _2477 = fma(_2471, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2457);
    float _2479 = -_2415;
    float _2481 = fma(_2451, _2465, _2479);
    float _2483 = fma(_2449, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2425);
    float _2485 = _2205 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2487 = fma(_2471, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2461);
    float _2489 = _2471 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2491 = fma(_2471, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2483);
    float _2493 = fma(_2207, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2485);
    float _2495 = fma(_2453, _2473, 1.570728778839111328125);
    float _2497 = _2467 * 0.636619746685028076171875;
    float _2499 = fma(_2209, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2493);
    float _2501 = -_2495;
    float _2503 = fma(_2497, _2501, 1.0);
    float _2505 = _2499 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2507 = fma(_2505, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2475);
    float _2509 = fma(_2505, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2477);
    float _2511 = fma(_2505, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2487);
    float _2513 = fma(_2505, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2491);
    float _2515 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    out.gl_Position.x = _2509;
    out.gl_Position.y = _2507;
    out.gl_Position.z = _2511;
    out.gl_Position.w = _2513;
    float _2517 = -_2489;
    float _2519 = fma(_2517, _2515, 1.0);
    float _2521 = _2461;
    if (_2385)
    {
        _2521 = _2513;
    }
    float _2523 = _2521;
    float _2525 = _2523;
    if (!_2385)
    {
        out.gl_Position.w = 0.0;
    }
    float _2527 = log2(_2519);
    if (!_2385)
    {
        _2525 = 0.0;
    }
    float _2529 = _2525;
    float _2531 = _2529;
    if (!_1874)
    {
        int _2533 = _1892 << 4;
        int _2535 = _2533 + 2048;
        uint _2537 = uint(int(uint(_2535) >> uint(2)));
        uint _2539 = uint(int(uint(int(_2537)) >> uint(2)));
        int _2541 = int(_2537) & 3;
        float _2543 = (*spvDescriptorSet0.vp_c15)._m0[int(_2539)][_2541];
        int _2545 = int(_2537) + 1;
        uint _2547 = uint(int(uint(_2545) >> uint(2)));
        int _2549 = _2545 & 3;
        float _2551 = (*spvDescriptorSet0.vp_c15)._m0[int(_2547)][_2549];
        int _2553 = _2535 + 8;
        uint _2555 = uint(int(uint(_2553) >> uint(2)));
        uint _2557 = uint(int(uint(int(_2555)) >> uint(2)));
        int _2559 = int(_2555) & 3;
        float _2561 = (*spvDescriptorSet0.vp_c15)._m0[int(_2557)][_2559];
        int _2563 = int(_2555) + 1;
        uint _2565 = uint(int(uint(_2563) >> uint(2)));
        int _2567 = _2563 & 3;
        float _2569 = (*spvDescriptorSet0.vp_c15)._m0[int(_2565)][_2567];
        float _2571 = _1824 * _2551;
        float _2573 = fma(_1630, _2543, _2571);
        float _2575 = fma(_1634, _2561, _2573);
        float _2577 = _2575 + _2569;
        float _2579 = precise::clamp(_2577, 0.0, 1.0);
        float _2581 = -_2579;
        float _2583 = _2581 + _1977;
        float _2585 = fma(_2583, 500.0, 1.5);
        float _2587 = exp2(_2585);
        float _2589 = 0.0 + _2587;
        float _2591 = precise::clamp(_2589, 0.0, 1.0);
        bool _2593 = _2591 >= 1.0;
        bool _2595 = isnan(_2591);
        bool _2597 = _2593 || _2595;
        bool _2599 = isnan(1.0);
        bool _2601 = _2597 || _2599;
        if (!_2601)
        {
            out.gl_Position.w = 0.0;
        }
        if (!_2601)
        {
            _2531 = 0.0;
        }
    }
    float _2603 = _2531;
    float _2605 = 1.0 / _2603;
    float _2607 = _2527 * 0.693147182464599609375;
    float _2609 = fma(_2481, 0.5, 0.5);
    float _2611 = _2607 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2613 = _2509 * _2605;
    float _2615 = _2507 * _2605;
    float _2617 = fma(_2613, 0.5, 0.5);
    float _2619 = fma(_2615, -0.5, 0.5);
    float3 _7314 = float3(_2617, _2619, _2611);
    float _2621 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7314, float3(0.0), isnan(_7314)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7314, float3(0.0), isnan(_7314)), level(0.0)).x;
    float3 _7323 = float3(_2617, _2619, _2611);
    float4 _2624 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7323, float3(0.0), isnan(_7323)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7323, float3(0.0), isnan(_7323)), level(0.0)).xyzw;
    float _2626 = _2624.x;
    float _2628 = _2624.y;
    float _2630 = _2624.z;
    float _2632 = _2624.w;
    float2 _7339 = float2(_2503, _2609);
    float3 _2636 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7339, float2(0.0), isnan(_7339)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7339, float2(0.0), isnan(_7339)), level(0.0)).xyz;
    float _2638 = _2636.x;
    float _2640 = _2636.y;
    float _2642 = _2636.z;
    float _2644 = _1632 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2646 = _1632 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2648 = _1632 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2650 = _1632 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2652 = fma(_1630, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2644);
    float _2654 = fma(_1630, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2646);
    float _2656 = fma(_1630, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2648);
    float _2658 = fma(_1630, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2650);
    float _2660 = fma(_1634, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2652);
    float _2662 = fma(_1634, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2654);
    float _2664 = fma(_1634, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2656);
    float _2666 = _2407 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2668 = _2660 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2670 = _2662 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2672 = _2664 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2674 = fma(_1634, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2658);
    float _2676 = _2668 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2678 = _2511 + _2513;
    float _2680 = _2513 * 0.5;
    float _2682 = _2672 * (*spvDescriptorSet0.vp_c8)._m0[7].z;
    float _2684 = fma(_2670, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2676);
    float _2686 = _1822 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2688 = fma(_2507, -0.5, _2680);
    float _2690 = _2509 + _2513;
    float _2692 = _2674 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2694 = _2682 + _2684;
    float _2696 = _2678 * 0.5;
    float _2698 = _2690 * 0.5;
    float _2700 = _318 * _2686;
    float _2702 = fma(_2692, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2694);
    float _2704 = _2668 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2706 = -_268;
    float _2708 = _2706 + _2205;
    float _2710 = _2668 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2712 = exp2(_2666);
    float _2714 = _2668 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_85.x = _2698;
    out.m_85.y = _2688;
    out.m_85.z = _2696;
    out.m_85.w = _2513;
    float _2716 = fma(_2670, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2704);
    float _2718 = -_312;
    float _2720 = _2718 + _2207;
    float _2722 = _2708 * (*spvDescriptorSet0.vp_c15)._m0[638].y;
    float _2724 = fma(_2670, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2710);
    float _2726 = fma(_2670, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2714);
    float _2728 = 1.0 / _2702;
    out.m_87.y = 1.0;
    float _2730 = fma(_2672, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2726);
    out.m_89.x = _2217;
    out.m_89.y = _2213;
    out.m_89.z = _2221;
    float _2732 = _2708 * (*spvDescriptorSet0.vp_c15)._m0[635].y;
    float _2734 = _2708 * (*spvDescriptorSet0.vp_c15)._m0[636].y;
    float _2736 = fma(_2720, (*spvDescriptorSet0.vp_c15)._m0[638].x, _2722);
    float _2738 = -_314;
    float _2740 = _2738 + _2209;
    float _2742 = fma(_2720, (*spvDescriptorSet0.vp_c15)._m0[635].x, _2732);
    float _2744 = fma(_2720, (*spvDescriptorSet0.vp_c15)._m0[636].x, _2734);
    float _2746 = _2672 * (*spvDescriptorSet0.vp_c8)._m0[4].z;
    float _2748 = fma(_2740, (*spvDescriptorSet0.vp_c15)._m0[638].z, _2736);
    float _2750 = fma(_2740, (*spvDescriptorSet0.vp_c15)._m0[635].z, _2742);
    float _2752 = fma(_2740, (*spvDescriptorSet0.vp_c15)._m0[636].z, _2744);
    float _2754 = fma(_2692, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2730);
    float _2756 = _2672 * (*spvDescriptorSet0.vp_c8)._m0[5].z;
    float _2758 = -_2712;
    float _2760 = _2758 + 1.0;
    float _2762 = _2746 + _2716;
    float _2764 = _2754 * _2728;
    float _2766 = _2756 + _2724;
    float _2768 = _2760 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2770 = fma(_2692, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2762);
    float _2772 = _2748 + (*spvDescriptorSet0.vp_c15)._m0[638].w;
    bool _2774 = _2764 > 0.0;
    float _2776 = fma(_2692, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2766);
    float _2778 = _2770 * _2728;
    float _2780 = 1.0 / _2772;
    bool _2782 = _2764 < 1.0;
    bool _2784 = _2782 && _2774;
    float _2786 = _2776 * _2728;
    float _2788 = -_2768;
    float _2790 = _2788 + 1.0;
    float _2792 = _2750 + (*spvDescriptorSet0.vp_c15)._m0[635].w;
    bool _2794 = _2613 > (-1.0);
    bool _2796 = _2794 && _2784;
    float _2798 = _2752 + (*spvDescriptorSet0.vp_c15)._m0[636].w;
    bool _2800 = _2615 > (-1.0);
    bool _2802 = _2800 && _2796;
    bool _2804 = _2613 < 1.0;
    bool _2806 = _2804 && _2802;
    float _2808 = _2792 * _2780;
    bool _2810 = _2615 < 1.0;
    bool _2812 = _2810 && _2806;
    float _2814 = _2798 * _2780;
    float _2816 = _2768 * _2621;
    float _2818 = _2632 * _2816;
    float _2820 = _2642 * _2816;
    float _2822 = _2632 * _2790;
    float _2824 = fma(_2638, _2818, _2626);
    float _2826 = fma(_2640, _2818, _2628);
    float _2828 = fma(_2632, _2820, _2630);
    out.m_91.x = _2824;
    out.m_91.y = _2826;
    out.m_91.z = _2828;
    out.m_91.w = _2822;
    bool _2830 = !_2812;
    float _2832 = _2818;
    float _2834 = _2790;
    float _2836 = _2746;
    float _2838 = _2700;
    float _2866;
    float _2868;
    float _2870;
    if (!_2830)
    {
        float _2840 = -_2786;
        float _2842 = _2615 + _2840;
        float _2844 = -_2778;
        float _2846 = _2613 + _2844;
        float _2848 = -_2808;
        float _2850 = _2613 + _2848;
        float _2852 = -_2814;
        float _2854 = _2615 + _2852;
        float _2856 = _2842 * _2842;
        float _2858 = fma(_2846, _2846, _2856);
        float _2860 = sqrt(_2858);
        bool _2862 = _2860 > 0.0;
        bool _2864 = !_2862;
        _2866 = _2860;
        _2832 = _2842;
        _2868 = _2846;
        _2870 = _2858;
        _2872 = _2864;
        if (!_2872)
        {
            float _2874 = _2854 * _2854;
            float _2876 = fma(_2850, _2850, _2874);
            float _2878 = rsqrt(_2858);
            float _2880 = sqrt(_2876);
            float _2882 = _2846 * _2878;
            float _2884 = _2842 * _2878;
            bool _2886 = _2880 > 0.0;
            bool _2888 = !_2886;
            _2866 = _2878;
            _2834 = _2880;
            _2872 = _2888;
            if (!_2872)
            {
                float _2890 = _1440 * _2692;
                float _2892 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
                float _2894 = fma(_2890, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2682);
                float _2896 = fma(_2890, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2746);
                float _2898 = fma(_2890, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2756);
                float _2900 = fma(_2692, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2894);
                float _2902 = rsqrt(_2876);
                float _2904 = fma(_2692, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2898);
                float _2906 = fma(_2692, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2896);
                float _2908 = 1.0 / _2900;
                float _2910 = _2892 * (*spvDescriptorSet0.vp_c13)._m0[0].w;
                float _2912 = _2854 * _2910;
                float _2914 = _2850 * _2910;
                float _2916 = _2912 * _2912;
                float _2918 = fma(_2914, _2914, _2916);
                float _2920 = _2854 * _2902;
                float _2922 = _2850 * _2902;
                float _2924 = _2904 * _2908;
                float _2926 = _2906 * _2908;
                float _2928 = _2884 * _2920;
                float _2930 = sqrt(_2918);
                float _2932 = _2924 * _2924;
                float _2934 = fma(_2882, _2922, _2928);
                float _2936 = fma(_2926, _2926, _2932);
                float _2938 = precise::min(0.0, _2934);
                float _2940 = sqrt(_2936);
                float _2942 = _2938 * _2603;
                float _2944 = fma(_2914, _2942, _2509);
                float _2946 = fma(_2912, _2942, _2507);
                out.gl_Position.x = _2944;
                out.gl_Position.y = _2946;
                float _2948 = fma(_2930, (*spvDescriptorSet0.vp_c13)._m0[1].x, _2940);
                float _2950 = 1.0 / _2948;
                float _2952 = _2940 * _2950;
                out.m_87.y = _2952;
                _2866 = _2942;
                _2832 = _2930;
                _2834 = _2952;
                _2868 = _2914;
                _2870 = _2912;
                _2836 = _2934;
                _2872 = true;
            }
        }
    }
    else
    {
        float _2954 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        out.gl_Position.z = _2954;
        _2866 = 0.0;
        _2868 = 0.0;
        _2870 = _2954;
        _2836 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
        _2838 = 0.0;
    }
    _2872 = false;
    float _2956 = _2866;
    float _2958 = _2832;
    float _2960 = _2834;
    float _2962 = _2868;
    float _2964 = _2870;
    float _2966 = _2836;
    float _2968 = _2838;
    bool _2970 = _2231 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2972 = isnan(_2231);
    bool _2974 = _2970 || _2972;
    bool _2976 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2978 = _2974 || _2976;
    float _2980 = _2960;
    float _2982 = _2958;
    float _2984 = _2964;
    float _2986 = _2962;
    float _2988 = _2956;
    float _2990 = _2966;
    if (!_2978)
    {
        _2980 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2992 = _2980;
    float _2994 = _2992;
    float _2996 = _2992;
    if (!_2978)
    {
        _2982 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2998 = _2982;
    float _3000 = _2998;
    float _3002 = _2998;
    if (!_2978)
    {
        _2984 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3004 = _2984;
    float _3006 = _3004;
    float _3008 = _3004;
    if (!_2978)
    {
        _2986 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3010 = _2986;
    float _3012 = _3010;
    float _3014 = _3010;
    if (!_2978)
    {
        _2988 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3016 = _2988;
    float _3018 = _3016;
    float _3020 = _3016;
    if (!_2978)
    {
        _2990 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3022 = _2990;
    bool _3024 = !_2978;
    float _3026 = _3022;
    float _3028 = _3022;
    if (!_3024)
    {
        bool _3030 = _2231 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3032 = isnan(_2231);
        bool _3034 = _3030 || _3032;
        bool _3036 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3038 = _3034 || _3036;
        if (!_3038)
        {
            float _3040 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3042 = _2231 + _3040;
            float _3044 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3046 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3044;
            float _3048 = 1.0 / _3046;
            float _3050 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3052 = _3050 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3054 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3056 = _3054 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3058 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3060 = _3058 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3062 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3064 = _3062 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3066 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3068 = _3066 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3070 = _3042 * _3048;
            float _3072 = precise::clamp(_3070, 0.0, 1.0);
            float _3074 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3076 = _3074 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3078 = fma(_3072, _3052, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3080 = fma(_3072, _3076, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3082 = fma(_3072, _3056, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3084 = fma(_3072, _3060, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3086 = fma(_3072, _3064, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3088 = fma(_3072, _3068, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3002 = _3080;
            _3020 = _3086;
            _2996 = _3078;
            _3014 = _3084;
            _3008 = _3082;
            _3028 = _3088;
            _3090 = true;
        }
        else
        {
            bool _3092 = _2231 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3094 = isnan(_2231);
            bool _3096 = _3092 || _3094;
            bool _3098 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3100 = _3096 || _3098;
            if (!_3100)
            {
                _2994 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3102 = _2994;
            _2996 = _3102;
            if (!_3100)
            {
                _3000 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3104 = _3000;
            _3002 = _3104;
            if (!_3100)
            {
                _3006 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3106 = _3006;
            _3008 = _3106;
            if (!_3100)
            {
                _3012 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3108 = _3012;
            _3014 = _3108;
            if (!_3100)
            {
                _3018 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3110 = _3018;
            _3020 = _3110;
            if (!_3100)
            {
                _3026 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3112 = _3026;
            bool _3114 = !_3100;
            _3028 = _3112;
            if (!_3114)
            {
                bool _3116 = _2231 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3118 = isnan(_2231);
                bool _3120 = _3116 || _3118;
                bool _3122 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3124 = _3120 || _3122;
                if (!_3124)
                {
                    float _3126 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3128 = _2231 + _3126;
                    float _3130 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3132 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3130;
                    float _3134 = 1.0 / _3132;
                    float _3136 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3138 = _3136 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3140 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3142 = _3140 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3144 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3146 = _3144 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3148 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3150 = _3148 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3152 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3154 = _3152 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3156 = _3128 * _3134;
                    float _3158 = precise::clamp(_3156, 0.0, 1.0);
                    float _3160 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3162 = _3160 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3164 = fma(_3158, _3138, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3166 = fma(_3158, _3162, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3168 = fma(_3158, _3142, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3170 = fma(_3158, _3146, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3172 = fma(_3158, _3150, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3174 = fma(_3158, _3154, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3002 = _3166;
                    _3020 = _3172;
                    _2996 = _3164;
                    _3014 = _3170;
                    _3008 = _3168;
                    _3028 = _3174;
                    _3090 = true;
                }
                else
                {
                    _3002 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3020 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2996 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3014 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3008 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3028 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3090 = false;
    float _3176 = _3002;
    float _3178 = _3020;
    float _3180 = _2996;
    float _3182 = _3014;
    float _3184 = _3008;
    float _3186 = _3028;
    float _3188 = fma(_1598, -0.5, 0.5);
    float _3190 = precise::clamp(_3188, 0.0, 1.0);
    float _3192 = -_3176;
    float _3194 = _3192 + _3178;
    float _3196 = -_3180;
    float _3198 = _3196 + _3182;
    float _3200 = -_3184;
    float _3202 = _3200 + _3186;
    bool _3204 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3206 = fma(_3190, _3194, _3176);
    float _3208 = fma(_3190, _3198, _3180);
    float _3210 = fma(_3190, _3202, _3184);
    float _3212 = _2968 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3214 = _3206 * 0.586610972881317138671875;
    out.m_93.x = 0.0;
    float _3216 = fma(_3208, 0.298911988735198974609375, _3214);
    out.m_56.x = _3212;
    float _3218 = fma(_3210, 0.114477999508380889892578125, _3216);
    float _3220 = -_3218;
    float _3222 = _3208 + _3220;
    float _3224 = -_3218;
    float _3226 = _3206 + _3224;
    float _3228 = -_3218;
    float _3230 = _3210 + _3228;
    float _3232 = fma(_3222, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3218);
    float _3234 = fma(_3226, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3218);
    float _3236 = fma(_3230, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3218);
    out.m_95.x = _3232;
    out.m_95.y = _3234;
    out.m_95.z = _3236;
    if (!_3204)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3238 = -_2205;
    float _3240 = _3238 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3242 = -_2207;
    float _3244 = _3242 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3246 = -_2209;
    float _3248 = _3246 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3250 = _3240 * _3240;
    float _3252 = fma(_3244, _3244, _3250);
    float _3254 = fma(_3248, _3248, _3252);
    float _3256 = sqrt(_3254);
    float _3258 = rsqrt(_3254);
    float _3260 = -_3256;
    float _3262 = _3260 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3264 = _3262 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3266 = precise::clamp(_3264, 0.0, 1.0);
    float _3268 = _3244 * _3258;
    float _3270 = _3240 * _3258;
    float _3272 = abs(_3266);
    float _3274 = log2(_3272);
    float _3276 = _3248 * _3258;
    float _3278 = _3268 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3280 = _1598 * _3270;
    float _3282 = -_3270;
    float _3284 = -_3278;
    float _3286 = fma(_3282, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3284);
    float _3288 = fma(_1596, _3268, _3280);
    float _3290 = -_3276;
    float _3292 = fma(_3290, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3286);
    float _3294 = fma(_1600, _3276, _3288);
    float _3296 = precise::clamp(_3294, 0.0, 1.0);
    float _3298 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3300 = _3292 + _3298;
    float _3302 = _3274 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3304 = _3300 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3306 = precise::clamp(_3304, 0.0, 1.0);
    float _3308 = exp2(_3302);
    float _3310 = _3308 * _3306;
    float _3312 = _3296 * _3310;
    float _3314 = _3312 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3316 = _3312 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3318 = _3312 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_93.x = _3314;
    out.m_93.y = _3316;
    out.m_93.z = _3318;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}


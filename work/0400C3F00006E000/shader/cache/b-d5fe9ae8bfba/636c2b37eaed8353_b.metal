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
    constant _16* vp_c8 [[id(0)]];
    constant _16* vp_c10 [[id(1)]];
    constant _16* vp_c9 [[id(2)]];
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c16 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    texture3d<float> vp_t_tcb_32 [[id(6)]];
    sampler vp_t_tcb_32Smplr [[id(7)]];
    texture3d<float> vp_t_tcb_30 [[id(8)]];
    sampler vp_t_tcb_30Smplr [[id(9)]];
    texture2d<float> vp_t_tcb_1C [[id(10)]];
    sampler vp_t_tcb_1CSmplr [[id(11)]];
    sampler vp_t_tcb_32Smplr_w [[id(12)]];
    sampler vp_t_tcb_30Smplr_w [[id(13)]];
    sampler vp_t_tcb_1CSmplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_55 [[user(locn0)]];
    float4 m_65 [[user(locn1)]];
    float4 m_67 [[user(locn2)]];
    float4 m_69 [[user(locn3)]];
    float4 m_47 [[user(locn4)]];
    float4 m_61 [[user(locn5)]];
    float4 m_63 [[user(locn6)]];
    float4 m_71 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_57 [[attribute(5)]];
    float4 m_51 [[attribute(6)]];
    float4 m_53 [[attribute(7)]];
    float4 m_59 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1576 = false;
    bool _736 = false;
    bool _556 = false;
    bool _376 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _85 = in.m_44.w;
    float _87 = trunc(_85);
    int _90 = int(_87);
    bool _94 = _90 >= 1;
    float _96 = 0.0;
    if (!_94)
    {
        _96 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _98 = _96;
    float _100 = _98;
    if (!_94)
    {
        out.m_47.x = 0.0;
    }
    int _102 = 0;
    if (!_94)
    {
        float _104 = _98 * 5.0;
        _102 = as_type<int>(_104);
    }
    int _106 = _102;
    int _108 = _106;
    if (!_94)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2248 = as_type<float>(_106);
        out.gl_Position.z = _2248;
    }
    if (!_94)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _110 = in.m_49.w;
    bool _112 = _110 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _114 = isnan(_110);
    bool _116 = _112 || _114;
    bool _118 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _120 = _116 || _118;
    float _122 = -_110;
    float _124 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _126 = 0.0;
    if (_120)
    {
        float _128 = float(_90);
        _126 = _128;
    }
    float _130 = _126;
    bool _132 = _124 >= _130;
    bool _134 = !_120;
    bool _136 = _132 || _134;
    if (_136)
    {
        _100 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _138 = _100;
    if (_136)
    {
        out.m_47.x = 0.0;
    }
    if (_136)
    {
        float _140 = _138 * 5.0;
        _108 = as_type<int>(_140);
    }
    int _142 = _108;
    if (_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2316 = as_type<float>(_142);
        out.gl_Position.z = _2316;
    }
    if (_136)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _144 = in.m_51.x;
    float _146 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _148 = _124 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    bool _150 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _152 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _154 = _150 || _152;
    bool _156 = isnan(1.0);
    bool _158 = _154 || _156;
    int _160 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _162 = _160 != 0;
    float _164 = _148 * _146;
    float _166 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[20].x, _164);
    float _168 = in.m_49.x;
    float _170 = in.m_49.y;
    float _172 = in.m_49.z;
    float _174 = _166 * 6.283185482025146484375;
    float _176 = floor(_166);
    float _178 = _174 * 0.15915493667125701904296875;
    float _180 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _182 = 0.0;
    float _184 = _180;
    if (!_158)
    {
        float _186 = _180 * _180;
        float _188 = _186 * 0.5;
        _182 = _188;
    }
    float _190 = _182;
    float _192 = _178 * 6.283185482025146484375;
    float _194 = cos(_192);
    float _196 = _190;
    if (!_158)
    {
        float _198 = _190 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _196 = _198;
    }
    float _200 = _196;
    float _202 = -_176;
    float _204 = _166 + _202;
    bool _206 = !_158;
    float _208 = _200;
    if (!_206)
    {
        float _210 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _212 = log2(_210);
        float _214 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _216 = _214 + 1.0;
        float _218 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _220 = _180 * _212;
        float _222 = 1.0 / _216;
        float _224 = _218 * 0.693147182464599609375;
        float _226 = exp2(_220);
        float _228 = 1.0 / _224;
        float _230 = _226 + (-1.0);
        float _232 = -_230;
        float _234 = fma(_232, _228, _180);
        float _236 = _234 * _222;
        float _238 = _236 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _208 = _238;
    }
    float _240 = _208;
    bool _242 = !_158;
    if (!_242)
    {
        float _244 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _246 = log2(_244);
        float _248 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _250 = _248 + 1.0;
        float _252 = 1.0 / _250;
        float _254 = _180 * _246;
        float _256 = exp2(_254);
        float _258 = -_256;
        float _260 = _258 + 1.0;
        float _262 = _260 * _252;
        _184 = _262;
    }
    float _264 = _184;
    float _266 = in.m_53.w;
    int _268 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _270 = _268 != 0;
    int _272 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _274 = _272 != 0;
    float _276 = -_204;
    float _278 = fma(_276, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _280 = _204 < 0.5;
    float _282 = float(_280);
    float _284 = fma(_194, 0.5, 0.5);
    float _286 = in.m_44.x;
    float _288 = in.m_44.y;
    float _290 = in.m_44.z;
    bool _292 = !_270;
    int _294 = _292 ? 0 : 1;
    float _296 = _240 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _298 = -_282;
    float _300 = fma(_298, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _302 = !_162;
    int _304 = _302 ? 0 : 1;
    float _306 = -_284;
    float _308 = fma(_306, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _310 = abs(_294);
    float _312 = fma(_264, _168, _296);
    int _314 = abs(_304);
    float _316 = _240 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _318 = !_274;
    int _320 = _318 ? 0 : 1;
    float _322 = fma(_264, _170, _316);
    bool _324 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _326 = abs(_320);
    float _328 = _240 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _330 = float(_310);
    float _332 = float(_314);
    float _334 = fma(_264, _172, _328);
    float _336 = abs(_278);
    float _338 = _330 * _336;
    float _340 = fma(_312, _266, _286);
    float _342 = fma(_334, _266, _290);
    float _344 = float(_326);
    float _346 = fma(_332, _308, _338);
    float _348 = fma(_322, _266, _288);
    float _350 = abs(_300);
    float _352 = fma(_344, _350, _346);
    bool _354 = !_324;
    bool _356 = false;
    int _358 = as_type<int>(_352);
    float _374;
    if (!_354)
    {
        float _360 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _362 = _144 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _364 = fma(_362, (*spvDescriptorSet0.vp_c9)._m0[12].x, _124);
        float _366 = _364 * _360;
        float _368 = floor(_366);
        float _370 = -_368;
        float _372 = _366 + _370;
        _374 = _372;
        _376 = true;
    }
    else
    {
        float _378 = float(_90);
        float _380 = 1.0 / _378;
        float _382 = _124 * _380;
        _374 = _382;
    }
    _376 = false;
    float _384 = _374;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _388 = _384 + _386;
    bool _390 = _384 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _392 = isnan(_384);
    bool _394 = _390 || _392;
    bool _396 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _398 = _394 || _396;
    float _400 = float(_398);
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _404 = _384 + _402;
    bool _406 = _384 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _408 = isnan(_384);
    bool _410 = _406 || _408;
    bool _412 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _414 = _410 || _412;
    float _416 = float(_414);
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _420 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _418;
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _424 = _422 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _426 = _384 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _428 = isnan(_384);
    bool _430 = _426 || _428;
    bool _432 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _434 = _430 || _432;
    float _436 = float(_434);
    float _438 = -_400;
    float _440 = _438 + 1.0;
    float _442 = 1.0 / _424;
    float _444 = _436 * _440;
    float _446 = -_436;
    float _448 = _446 + 1.0;
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _452 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _450;
    bool _454 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _456 = 1.0 / _420;
    float _458 = _416 * _448;
    float _460 = -_416;
    float _462 = _460 + 1.0;
    float _464 = _404 * _442;
    float _466 = _388 * _456;
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _470 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _468;
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _474 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _472;
    float _476 = fma(_452, _466, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _478 = fma(_470, _466, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _480 = fma(_474, _466, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _482 = in.m_53.x;
    float _484 = in.m_53.y;
    float _486 = in.m_53.z;
    float _488 = _476 * _458;
    float _490 = _478 * _458;
    float _492 = _480 * _458;
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _496 = _494 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _500 = _498 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _504 = _502 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _506 = fma(_462, (*spvDescriptorSet0.vp_c9)._m0[143].x, _488);
    float _508 = fma(_496, _464, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _510 = fma(_500, _464, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _512 = fma(_504, _464, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _514 = fma(_462, (*spvDescriptorSet0.vp_c9)._m0[143].y, _490);
    float _516 = fma(_462, (*spvDescriptorSet0.vp_c9)._m0[143].z, _492);
    float _518 = fma(_508, _444, _506);
    float _520 = fma(_510, _444, _514);
    float _522 = fma(_512, _444, _516);
    float _524 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[145].x, _518);
    float _526 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[145].y, _520);
    float _528 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[145].z, _522);
    float _530 = _524 * _482;
    float _532 = _526 * _484;
    float _534 = _528 * _486;
    bool _536 = !_454;
    float _538 = _530;
    float _554;
    if (!_536)
    {
        float _540 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _542 = _144 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _544 = fma(_542, (*spvDescriptorSet0.vp_c9)._m0[11].x, _124);
        float _546 = _544 * _540;
        float _548 = floor(_546);
        float _550 = -_548;
        float _552 = _546 + _550;
        _554 = _552;
        _556 = true;
    }
    else
    {
        float _558 = float(_90);
        float _560 = 1.0 / _558;
        float _562 = _124 * _560;
        _554 = _562;
    }
    _556 = false;
    float _564 = _554;
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _568 = _564 + _566;
    bool _570 = _564 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _572 = isnan(_564);
    bool _574 = _570 || _572;
    bool _576 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _578 = _574 || _576;
    float _580 = float(_578);
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _584 = _564 + _582;
    bool _586 = _564 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _588 = isnan(_564);
    bool _590 = _586 || _588;
    bool _592 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _594 = _590 || _592;
    float _596 = float(_594);
    float _598 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _600 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _598;
    float _602 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _604 = _602 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _606 = _564 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _608 = isnan(_564);
    bool _610 = _606 || _608;
    bool _612 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _614 = _610 || _612;
    float _616 = float(_614);
    float _618 = -_580;
    float _620 = _618 + 1.0;
    float _622 = 1.0 / _604;
    float _624 = _616 * _620;
    float _626 = -_616;
    float _628 = _626 + 1.0;
    float _630 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _632 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _630;
    float _634 = 1.0 / _600;
    float _636 = _596 * _628;
    float _638 = -_596;
    float _640 = _638 + 1.0;
    float _642 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _644 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _646 = _584 * _622;
    float _648 = _568 * _634;
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _652 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _650;
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _656 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _654;
    float _658 = fma(_632, _648, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _660 = fma(_652, _648, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _662 = fma(_656, _648, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _664 = _658 * _636;
    float _666 = _660 * _636;
    float _668 = _662 * _636;
    float _670 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _672 = _670 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _674 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _676 = _674 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _678 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _680 = _678 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _682 = fma(_640, (*spvDescriptorSet0.vp_c9)._m0[107].x, _664);
    float _684 = fma(_640, (*spvDescriptorSet0.vp_c9)._m0[107].y, _666);
    float _686 = fma(_672, _646, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _688 = fma(_676, _646, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _690 = fma(_680, _646, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _692 = fma(_640, (*spvDescriptorSet0.vp_c9)._m0[107].z, _668);
    float _694 = fma(_686, _624, _682);
    float _696 = fma(_688, _624, _684);
    float _698 = fma(_690, _624, _692);
    float _700 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[109].x, _694);
    float _702 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[109].y, _696);
    float _704 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[109].z, _698);
    float _706 = _700 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _708 = _702 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _710 = _704 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _712 = _706 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _714 = _708 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _716 = _710 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_55.x = _712;
    out.m_55.y = _714;
    out.m_55.z = _716;
    out.m_55.w = _642;
    bool _718 = !_644;
    float _734;
    if (!_718)
    {
        float _720 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _722 = _144 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _724 = fma(_722, (*spvDescriptorSet0.vp_c9)._m0[11].z, _124);
        float _726 = _724 * _720;
        float _728 = floor(_726);
        float _730 = -_728;
        float _732 = _726 + _730;
        _734 = _732;
        _736 = true;
    }
    else
    {
        float _738 = float(_90);
        float _740 = 1.0 / _738;
        float _742 = _124 * _740;
        _734 = _742;
    }
    _736 = false;
    float _744 = _734;
    float _746 = in.m_57.x;
    float _748 = in.m_57.y;
    float _750 = in.m_57.z;
    float _752 = _352 * _532;
    float _754 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, 0.0166666693985462188720703125, _144);
    float _756 = _352 * _534;
    float _758 = _754 * 0.5;
    float _760 = _754 * 20.0;
    float _762 = _758 * 0.15915493667125701904296875;
    float _764 = _762 * 6.283185482025146484375;
    float _766 = sin(_764);
    float _768 = -_760;
    float _770 = fma(_748, 4.3982295989990234375, _768);
    float _772 = precise::max(_748, -0.60352802276611328125);
    float _774 = _770 * 0.15915493667125701904296875;
    float _776 = precise::min(_772, 1.20902001857757568359375);
    float _778 = _774 * 6.283185482025146484375;
    float _780 = sin(_778);
    float _782 = fma(_776, 0.55170953273773193359375, 0.33297216892242431640625);
    float _784 = _782 * _782;
    float _786 = _748 * _748;
    float _788 = fma(_766, 0.07500000298023223876953125, 0.324999988079071044921875);
    float _790 = fma(_784, 0.75, 0.25);
    float _792 = _780 * _788;
    float _794 = _352 * _530;
    float _796 = fma(_790, _792, _746);
    float _798 = fma(_796, _796, _786);
    float _800 = fma(_750, _750, _798);
    float _802 = rsqrt(_800);
    float _804 = _796 * _802;
    float _806 = _802 * _748;
    float _808 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _810 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _808;
    float _812 = abs(_804);
    float _814 = abs(_806);
    float _816 = precise::max(_812, _814);
    bool _818 = _816 >= 16.0;
    int _820 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _822 = _820 != 0;
    float _824 = _806;
    float _826 = _804;
    int _828 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    if (_818)
    {
        float _830 = _806 * 0.0625;
        _824 = _830;
    }
    float _832 = _824;
    if (_818)
    {
        float _834 = _804 * 0.0625;
        _826 = _834;
    }
    float _836 = _826;
    float _838 = abs(_832);
    bool _840 = _838 != 0.0;
    bool _842 = isnan(_838);
    bool _844 = _840 || _842;
    bool _846 = isnan(0.0);
    bool _848 = _844 || _846;
    float _850 = abs(_836);
    bool _852 = _850 == 0.0;
    float _854 = abs(_836);
    bool _856 = _854 == 0.0;
    bool _858 = !_848;
    bool _860 = _856 && _858;
    if (_860)
    {
        bool _862 = as_type<int>(_836) >= 0;
        _356 = _862;
    }
    bool _864 = _356;
    int _866 = _864 ? (-1) : 0;
    if (_860)
    {
        int _868 = _864 ? 0 : 1078530011;
        _828 = _868;
    }
    int _870 = _828;
    if (_860)
    {
        int _872 = int(0x80000000) & as_type<int>(_832);
        int _874 = _870 | _872;
        _538 = as_type<float>(_874);
    }
    float _876 = _538;
    bool _878 = !_848;
    bool _880 = _878 && _852;
    float _882 = _876;
    float _884 = _876;
    if (!_880)
    {
        float _886 = abs(_832);
        bool _888 = _886 != as_type<float>(0x7f800000u /* inf */);
        bool _890 = isnan(_886);
        bool _892 = _888 || _890;
        bool _894 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _896 = _892 || _894;
        float _898 = abs(_836);
        bool _900 = _898 == as_type<float>(0x7f800000u /* inf */);
        float _902 = abs(_836);
        bool _904 = _902 == as_type<float>(0x7f800000u /* inf */);
        bool _906 = !_896;
        bool _908 = _904 && _906;
        if (_908)
        {
            bool _910 = as_type<int>(_836) >= 0;
            _866 = _910 ? (-1) : 0;
        }
        int _912 = _866;
        if (_908)
        {
            _358 = 1075235812;
        }
        int _914 = _358;
        int _916 = _914;
        if (_908)
        {
            int _918 = ~_912;
            int _920 = (_918 != 0) ? _914 : 1061752795;
            _916 = _920;
        }
        int _922 = _916;
        if (_908)
        {
            int _924 = int(0x80000000) & as_type<int>(_832);
            int _926 = _922 | _924;
            _882 = as_type<float>(_926);
        }
        float _928 = _882;
        bool _930 = !_896;
        bool _932 = _930 && _900;
        _884 = _928;
        if (!_932)
        {
            float _934 = abs(_836);
            float _936 = abs(_832);
            float _938 = precise::max(_934, _936);
            float _940 = abs(_836);
            float _942 = abs(_832);
            float _944 = precise::min(_940, _942);
            float _946 = 1.0 / _938;
            float _948 = abs(_832);
            float _950 = abs(_836);
            bool _952 = _948 > _950;
            bool _954 = as_type<int>(_836) >= 0;
            float _956 = _944 * _946;
            float _958 = _956 * _956;
            float _960 = _958 + 11.33538818359375;
            float _962 = fma(_958, _960, 28.84246826171875);
            float _964 = fma(_958, _962, 19.6966705322265625);
            float _966 = fma(_958, -0.82336294651031494140625, -5.674867153167724609375);
            float _968 = fma(_958, _966, -6.565555095672607421875);
            float _970 = 1.0 / _964;
            float _972 = _958 * _968;
            float _974 = abs(_836);
            float _976 = abs(_832);
            float _978 = _974 + _976;
            int _980 = as_type<int>(_832) & int(0x80000000);
            float _982 = _956 * _972;
            bool _984 = _978 > as_type<float>(0x7f800000u /* inf */);
            bool _986 = isnan(_978);
            bool _988 = _984 || _986;
            bool _990 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _992 = _988 || _990;
            float _994 = fma(_982, _970, _956);
            float _996 = _994;
            _884 = _978;
            if (_952)
            {
                float _998 = -_994;
                float _1000 = _998 + 1.57079637050628662109375;
                _996 = _1000;
            }
            float _1002 = _996;
            int _1004 = as_type<int>(_1002);
            if (!_954)
            {
                float _1006 = -_1002;
                float _1008 = _1006 + 3.1415927410125732421875;
                _1004 = as_type<int>(_1008);
            }
            int _1010 = _1004;
            if (!_992)
            {
                int _1012 = _980 | _1010;
                _884 = as_type<float>(_1012);
            }
        }
    }
    float _1014 = _884;
    float _1016 = 1.0 / _810;
    float _1018 = _348 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1020 = _348 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1022 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1024 = _1022 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1026 = _348 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1028 = in.m_51.z;
    float _1030 = fma(_754, 4.0, _1014);
    float _1032 = fma(_340, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1018);
    float _1034 = 1.0 / _1024;
    float _1036 = fma(_340, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1020);
    float _1038 = fma(_340, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1026);
    float _1040 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1042 = _744 + _1040;
    float _1044 = in.m_59.y;
    float _1046 = _1030 * 3.0;
    float _1048 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1050 = _744 + _1048;
    float _1052 = in.m_51.y;
    float _1054 = _1042 * _1016;
    float _1056 = _1046 * 0.15915493667125701904296875;
    float _1058 = fma(_342, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1038);
    float _1060 = fma(_342, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1032);
    int _1062 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1064 = _1062 != 0;
    float _1066 = _1056 * 6.283185482025146484375;
    float _1068 = sin(_1066);
    float _1070 = _1050 * _1034;
    float _1072 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1074 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1072;
    int _1076 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1078 = _1076 != 0;
    float _1080 = fma(_342, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1036);
    int _1082 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1084 = _1082 != 0;
    float _1086 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1088 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1086;
    int _1090 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1092 = _1090 != 0;
    float _1094 = in.m_59.x;
    float _1096 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
    float _1098 = _1036;
    float _1100 = (*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1102 = _1080;
    if (_822)
    {
        _1096 = _144;
    }
    float _1104 = _1096;
    float _1106 = fma(_1074, _1054, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1108 = -_1044;
    float _1110 = _1108 + 1.0;
    bool _1112 = _1028 > 0.5;
    float _1114 = fma(_1088, _1054, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1116 = _1104;
    float _1118 = _1044;
    bool _1120 = _1112;
    if (!_822)
    {
        _1116 = _1028;
    }
    float _1122 = _1116;
    float _1124 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1126 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1124;
    float _1128 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1130 = _1068 * 0.20000000298023223876953125;
    bool _1132 = _1052 > 0.5;
    float _1134 = fma(_1126, _1054, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1136 = fma(_1052, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1128);
    float _1138 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1140 = _1130;
    if (_822)
    {
        _1098 = _1052;
    }
    float _1142 = _1098;
    float _1144 = _790 * _1130;
    int _1146 = _1112 ? as_type<int>(_1110) : as_type<int>(_1044);
    float _1148 = _752 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1150 = fma(_796, _1144, _796);
    float _1152 = _1084 ? as_type<float>(_1146) : _1044;
    float _1154 = fma(_1144, _750, _750);
    float _1156 = _1142;
    if (_1092)
    {
        float _1158 = _1132 ? _1110 : _1044;
        _1118 = _1158;
    }
    float _1160 = _1118;
    float _1162 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1164 = fma(_1144, _748, _748);
    if (_1064)
    {
        bool _1166 = _144 > 0.5;
        _1120 = _1166;
    }
    bool _1168 = _1120;
    float _1170 = _756 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1172 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1162);
    if (!_822)
    {
        _1156 = _144;
    }
    float _1174 = _1156;
    float _1176 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1164);
    float _1178 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1180 = _1178 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1182 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1150);
    float _1184 = _1138 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1186 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1154);
    float _1188 = _794 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1190 = _1148 * _1176;
    float _1192 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1194 = _1192 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1196 = fma(_1152, _1184, -0.5);
    float _1198 = _1170 * _1186;
    float _1200 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1202 = _1200 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1204 = _1188 * _1182;
    float _1206 = _1190 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1208 = _1190 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _1210 = as_type<int>(_1174);
    if (!_1064)
    {
        _1100 = _1094;
    }
    float _1212 = _1100;
    float _1214 = _1058 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1216 = fma(_1204, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1206);
    float _1218 = fma(_1204, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1208);
    float _1220 = _1212;
    if (!_1064)
    {
        _1140 = _1212;
    }
    float _1222 = _1140;
    float _1224 = fma(_1194, _1070, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1226 = _1222;
    if (_1064)
    {
        _1220 = _1094;
    }
    float _1228 = _1220;
    float _1230 = fma(_1198, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1218);
    bool _1232 = _744 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1234 = isnan(_744);
    bool _1236 = _1232 || _1234;
    bool _1238 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1240 = _1236 || _1238;
    float _1242 = float(_1240);
    float _1244 = fma(_1202, _1070, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    bool _1246 = _744 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1248 = isnan(_744);
    bool _1250 = _1246 || _1248;
    bool _1252 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1254 = _1250 || _1252;
    float _1256 = float(_1254);
    float _1258 = _1230 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    bool _1260 = _744 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1262 = isnan(_744);
    bool _1264 = _1260 || _1262;
    bool _1266 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1268 = _1264 || _1266;
    float _1270 = float(_1268);
    float _1272 = fma(_1198, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1216);
    float _1274 = _1060 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1276 = _1214 + _1258;
    float _1278 = -_1256;
    float _1280 = _1278 + 1.0;
    float _1282 = _1272 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1284 = -_1270;
    float _1286 = _1284 + 1.0;
    float _1288 = fma(_1180, _1070, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1290 = _1242 * _1280;
    float _1292 = _1274 + _1282;
    float _1294 = _1256 * _1286;
    float _1296 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1298 = _1276 + _1296;
    float _1300 = _1122 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1302 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1304 = _1292 + _1302;
    float _1306 = _1298 * _1298;
    float _1308 = _1134 * _1290;
    float _1310 = _1304 * _1304;
    float _1312 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1314 = _1190 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1316 = _1310 + _1306;
    float _1318 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1320 = -_1312;
    float _1322 = fma(_1300, 2.0, _1320);
    float _1324 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1326 = _1174 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _1328 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[87].y);
    float _1330 = _1290;
    float _1332 = _1310;
    float _1334 = _1306;
    float _1336 = _1292;
    float _1338 = _1276;
    float _1340 = _1298;
    if (_1078)
    {
        float _1342 = -_1228;
        float _1344 = _1342 + 1.0;
        _1328 = as_type<int>(_1344);
    }
    int _1346 = _1328;
    float _1348 = _1106 * _1290;
    if (_1064)
    {
        float _1350 = -_1228;
        float _1352 = _1350 + 1.0;
        _1210 = as_type<int>(_1352);
    }
    int _1354 = _1210;
    float _1356 = _1114 * _1290;
    float _1358 = sqrt(_1316);
    float _1360 = -_1242;
    float _1362 = _1360 + 1.0;
    if (!_1078)
    {
        _1330 = _1228;
    }
    float _1364 = _1330;
    float _1366 = fma(_1326, -2.0, _1324);
    float _1368 = fma(_1204, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1314);
    float _1370 = _1364;
    if (_1078)
    {
        float _1372 = _1132 ? as_type<float>(_1346) : _1228;
        _1370 = _1372;
    }
    float _1374 = _1370;
    float _1376 = fma(_1362, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1356);
    if (_1064)
    {
        float _1378 = _1168 ? as_type<float>(_1354) : _1228;
        _1226 = _1378;
    }
    float _1380 = _1226;
    float _1382 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1172);
    float _1384 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1136);
    float _1386 = -_124;
    float _1388 = fma(_1386, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1322);
    float _1390 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1366);
    float _1392 = fma(_1198, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1368);
    float _1394 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1396 = _1080 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1398 = fma(_1362, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1348);
    bool _1400 = _1358 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1402 = _1392 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1404 = _1318 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1406 = fma(_1362, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1308);
    float _1408 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1410 = _1396 + _1402;
    float _1412 = fma(_1224, _1294, _1398);
    float _1414 = fma(_1244, _1294, _1376);
    float _1416 = fma(_1404, _1374, -0.5);
    if (!_1400)
    {
        _1102 = _1410;
    }
    float _1418 = _1102;
    bool _1420 = !_1400;
    float _1422 = _1418;
    if (!_1420)
    {
        float _1424 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1426 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1428 = _1358 + _1426;
        float _1430 = _1410 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1432 = rsqrt(_1316);
        float _1434 = _1428 * _1424;
        float _1436 = _1434 * 0.15915493667125701904296875;
        float _1438 = _1436 * 6.283185482025146484375;
        float _1440 = sin(_1438);
        float _1442 = _1436 * 6.283185482025146484375;
        float _1444 = cos(_1442);
        float _1446 = fma(_1440, _1430, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1448 = _1432 * _1446;
        float _1450 = fma(_1304, _1448, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1452 = _1444 + (-1.0);
        float _1454 = fma(_1298, _1448, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1456 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1458 = _1450 + _1456;
        float _1460 = _1452 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1462 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1464 = _1454 + _1462;
        float _1466 = _1458 * _1458;
        float _1468 = fma(_1410, _1444, _1460);
        float _1470 = _1464 * _1464;
        _1422 = _1468;
        _1332 = _1466;
        _1334 = _1470;
        _1336 = _1450;
        _1338 = _1454;
    }
    float _1472 = _1422;
    float _1474 = _1332;
    float _1476 = _1334;
    float _1478 = _1336;
    float _1480 = _1338;
    float _1482 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1484 = _1472 + _1482;
    float _1486 = fma(_1288, _1294, _1406);
    float _1488 = fma(_1270, (*spvDescriptorSet0.vp_c9)._m0[125].x, _1412);
    float _1490 = fma(_1270, (*spvDescriptorSet0.vp_c9)._m0[125].y, _1414);
    float _1492 = fma(_1484, _1484, _1474);
    float _1494 = fma(_1270, (*spvDescriptorSet0.vp_c9)._m0[125].z, _1486);
    float _1496 = _1160 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1498 = _1380 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1500 = _1492 + _1476;
    float _1502 = -_1390;
    float _1504 = fma(_1384, _1196, _1502);
    float _1506 = fma(_1382, _1416, _1388);
    float _1508 = _1488 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1510 = _1490 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1512 = _1494 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1514 = sqrt(_1500);
    float _1516 = _1496 * _1408;
    float _1518 = _1498 * _1394;
    float _1520 = _1504 + 0.5;
    float _1522 = _1506 + 0.5;
    float _1524 = _1508 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1526 = _1510 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1528 = _1512 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_61.x = _1518;
    out.m_61.y = _1516;
    out.m_63.x = _1522;
    out.m_63.y = _1520;
    out.m_65.x = _1524;
    out.m_65.y = _1526;
    out.m_65.z = _1528;
    bool _1530 = _1514 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1532 = isnan(_1514);
    bool _1534 = _1530 || _1532;
    bool _1536 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1538 = _1534 || _1536;
    out.m_67.y = _1164;
    float _1540 = _1504;
    if (!_1538)
    {
        _1540 = 1.0;
    }
    float _1542 = _1540;
    bool _1544 = !_1538;
    float _1546 = _1542;
    if (!_1544)
    {
        bool _1548 = _1514 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1550 = isnan(_1514);
        bool _1552 = _1548 || _1550;
        bool _1554 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1556 = _1552 || _1554;
        if (!_1556)
        {
            float _1558 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1560 = _1514 + _1558;
            float _1562 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1564 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1562;
            float _1566 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1568 = _1566 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1570 = 1.0 / _1564;
            float _1572 = _1560 * _1570;
            float _1574 = fma(_1572, _1568, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1546 = _1574;
            _1576 = true;
        }
        else
        {
            bool _1578 = _1514 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1580 = isnan(_1514);
            bool _1582 = _1578 || _1580;
            bool _1584 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1586 = _1582 || _1584;
            if (!_1586)
            {
                float _1588 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1590 = _1514 + _1588;
                float _1592 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1594 = _1592 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1596 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1598 = _1596 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1600 = 1.0 / _1594;
                float _1602 = _1590 * _1600;
                float _1604 = fma(_1602, _1598, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1546 = _1604;
                _1576 = true;
            }
            else
            {
                _1546 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1576 = false;
    float _1606 = _1546;
    float _1608 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1610 = _1472 + _1608;
    float _1612 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1614 = _1478 + _1612;
    float _1616 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1618 = _1480 + _1616;
    float _1620 = fma(_1610, _1606, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1622 = fma(_1614, _1606, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1624 = fma(_1618, _1606, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1626 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1628 = _1620 + _1626;
    float _1630 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1632 = _1622 + _1630;
    float _1634 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1636 = _1624 + _1634;
    float _1638 = _1628 * _1628;
    float _1640 = fma(_1632, _1632, _1638);
    float _1642 = fma(_1636, _1636, _1640);
    float _1644 = rsqrt(_1642);
    float _1646 = sqrt(_1642);
    float _1648 = _1644 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1650 = _1632 * _1648;
    float _1652 = _1636 * _1648;
    float _1654 = _1650 * _1650;
    float _1656 = _1652 * _1652;
    float _1658 = _1654 + _1656;
    float _1660 = sqrt(_1658);
    bool _1662 = _1660 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1664 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1666 = _1660 + _1664;
    float _1668 = _1506;
    float _1670 = _1658;
    float _1672 = _1666;
    float _1674 = _1628;
    float _1676 = _1648;
    float _1678 = _1650;
    if (_1662)
    {
        float _1680 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1668 = _1680;
    }
    float _1682 = _1668;
    if (_1662)
    {
        float _1684 = rsqrt(_1658);
        _1670 = _1684;
    }
    float _1686 = _1670;
    float _1688 = _1682;
    if (_1662)
    {
        float _1690 = _1666 * _1682;
        _1672 = _1690;
    }
    float _1692 = _1672;
    if (_1662)
    {
        float _1694 = _1692 * 0.15915493667125701904296875;
        _1688 = _1694;
    }
    float _1696 = _1688;
    float _1698 = _1644;
    float _1700 = _1696;
    if (_1662)
    {
        float _1702 = _1696 * 6.283185482025146484375;
        float _1704 = sin(_1702);
        _1698 = _1704;
    }
    float _1706 = _1698;
    float _1708 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1710 = precise::max(0.0, _1708);
    float _1712 = _1636;
    float _1714 = _1710;
    if (_1662)
    {
        float _1716 = _1696 * 6.283185482025146484375;
        float _1718 = cos(_1716);
        _1712 = _1718;
    }
    float _1720 = _1712;
    float _1722 = -_1648;
    float _1724 = -_1710;
    float _1726 = fma(_1628, _1722, _1724);
    if (_1662)
    {
        float _1728 = _1726 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1674 = _1728;
    }
    float _1730 = _1674;
    float _1732 = _1730;
    if (!_1662)
    {
        _1700 = _1654;
    }
    float _1734 = _1700;
    float _1736 = _1706;
    float _1738 = _1734;
    if (_1662)
    {
        float _1740 = fma(_1706, _1730, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1732 = _1740;
    }
    float _1742 = _1732;
    float _1744 = _1742;
    if (!_1662)
    {
        _1736 = _1726;
    }
    float _1746 = _1736;
    float _1748 = _1746;
    if (_1662)
    {
        float _1750 = _1720 + (-1.0);
        _1714 = _1750;
    }
    float _1752 = _1714;
    float _1754 = _1752;
    if (_1662)
    {
        float _1756 = _1686 * _1742;
        _1340 = _1756;
    }
    float _1758 = _1340;
    if (!_1662)
    {
        _1744 = _1652;
    }
    float _1760 = _1744;
    float _1762 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1764 = _1760;
    if (_1662)
    {
        float _1766 = _1752 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1676 = _1766;
    }
    float _1768 = _1676;
    if (_1662)
    {
        float _1770 = _1650 * _1758;
        _1678 = _1770;
    }
    float _1772 = _1678;
    if (_1662)
    {
        float _1774 = _1652 * _1758;
        _1764 = _1774;
    }
    float _1776 = _1764;
    if (!_1662)
    {
        _1754 = _1656;
    }
    float _1778 = _1754;
    float _1780 = _1778;
    if (_1662)
    {
        float _1782 = fma(_1726, _1720, _1768);
        _1748 = _1782;
    }
    float _1784 = _1748;
    if (_1662)
    {
        float _1786 = _1772 * _1772;
        _1738 = _1786;
    }
    float _1788 = _1738;
    if (_1662)
    {
        float _1790 = _1776 * _1776;
        _1780 = _1790;
    }
    float _1792 = _1780;
    float _1794 = fma(_1784, _1784, _1788);
    float _1796 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1798 = fma(_1646, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1796);
    float _1800 = precise::clamp(_1798, 0.0, 1.0);
    float _1802 = _1794 + _1792;
    float _1804 = _1620 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1806 = _1620 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1808 = -_1800;
    float _1810 = _1808 + 1.0;
    float _1812 = rsqrt(_1802);
    float _1814 = fma(_1622, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1804);
    float _1816 = fma(_1622, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1806);
    float _1818 = fma(_1624, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1814);
    float _1820 = _1620 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1822 = fma(_1624, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1816);
    float _1824 = abs(_1810);
    float _1826 = log2(_1824);
    float _1828 = _1620 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1830 = fma(_1622, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1820);
    float _1832 = _1822 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1834 = _1818 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1836 = fma(_1622, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1828);
    float _1838 = fma(_1624, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1830);
    float _1840 = _1812 * _1772;
    float _1842 = _1812 * _1784;
    float _1844 = _1838 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1846 = _1832 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1848 = _1840 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1850 = _1812 * _1776;
    float _1852 = fma(_1624, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1836);
    float _1854 = fma(_1844, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1846);
    float _1856 = -_1848;
    float _1858 = fma(_1842, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1856);
    float _1860 = _1834 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1862 = _1852 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1864 = fma(_1834, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1854);
    float _1866 = -_1850;
    float _1868 = fma(_1866, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1858);
    float _1870 = -_1860;
    float _1872 = fma(_1870, _1762, 1.0);
    float _1874 = _1826 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1876 = fma(_1862, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1864);
    float _1878 = fma(_1868, -0.5, 0.5);
    float _1880 = _1832 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1882 = exp2(_1874);
    float _1884 = _1832 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1886 = fma(_1868, 0.5, 0.5);
    float _1888 = fma(_1844, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1880);
    float _1890 = _1842 + 1.0;
    float _1892 = fma(_1844, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1884);
    float _1894 = fma(_1886, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1896 = log2(_1872);
    float _1898 = fma(_1834, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1888);
    float _1900 = fma(_1834, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1892);
    float _1902 = fma(_1886, _1894, -0.212114393711090087890625);
    float _1904 = fma(_1862, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1898);
    float _1906 = fma(_1862, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1900);
    float _1908 = fma(_1886, _1902, 1.570728778839111328125);
    float _1910 = 1.0 / _1876;
    float _1912 = -_1842;
    float _1914 = fma(_1882, _1890, _1912);
    float _1916 = fma(_1914, 0.5, 0.5);
    float _1918 = sqrt(_1878);
    float _1920 = _1896 * 0.693147182464599609375;
    float _1922 = _1904 * _1910;
    float _1924 = _1906 * _1910;
    float _1926 = _1920 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1928 = fma(_1922, 0.5, 0.5);
    float _1930 = fma(_1924, -0.5, 0.5);
    float _1932 = _1918 * 0.636619746685028076171875;
    float _1934 = -_1908;
    float _1936 = fma(_1932, _1934, 1.0);
    float3 _5243 = float3(_1928, _1930, _1926);
    float _1938 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5243, float3(0.0), isnan(_5243)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5243, float3(0.0), isnan(_5243)), level(0.0)).x;
    float3 _5254 = float3(_1928, _1930, _1926);
    float4 _1941 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5254, float3(0.0), isnan(_5254)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5254, float3(0.0), isnan(_5254)), level(0.0)).xyzw;
    float _1943 = _1941.x;
    float _1945 = _1941.y;
    float _1947 = _1941.z;
    float _1949 = _1941.w;
    float2 _5271 = float2(_1936, _1916);
    float3 _1953 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5271, float2(0.0), isnan(_5271)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5271, float2(0.0), isnan(_5271)), level(0.0)).xyz;
    float _1955 = _1953.x;
    float _1957 = _1953.y;
    float _1959 = _1953.z;
    float _1961 = _1396 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1963 = _1396 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1965 = fma(_1274, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1961);
    float _1967 = fma(_1274, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1963);
    float _1969 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1965);
    float _1971 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1967);
    float _1973 = _1969 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1975 = _1971 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1977 = 1.0 / _1973;
    float _1979 = _1975 + _1973;
    float _1981 = _1979 * _1977;
    float _1983 = _1981 * 0.5;
    float _1985 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1987 = fma(_1983, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1985);
    float _1989 = _1832 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1991 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1993 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1995 = _1991 || _1993;
    bool _1997 = isnan(0.5);
    bool _1999 = _1995 || _1997;
    float _2001 = _1826 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2003 = 1.0 / _1987;
    float _2005 = fma(_1844, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1989);
    float _2007 = fma(_1834, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2005);
    float _2009 = exp2(_2001);
    float _2011 = fma(_1862, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2007);
    float _2013 = _1826;
    float _2015 = _2005;
    if (_1999)
    {
        _2013 = 1.0;
    }
    float _2017 = _2013;
    float _2019 = _2017;
    if (_1999)
    {
        _2015 = 1.0;
    }
    float _2021 = _2015;
    float _2023 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2025 = _2003 * _2023;
    float _2027 = _2021;
    if (!_1999)
    {
        float _2029 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2031 = _2029 * 0.15915493667125701904296875;
        float _2033 = _2031 * 6.283185482025146484375;
        float _2035 = cos(_2033);
        float _2037 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2039 = _2037 * 0.15915493667125701904296875;
        float _2041 = _2031 * 6.283185482025146484375;
        float _2043 = sin(_2041);
        float _2045 = 1.0 / _2035;
        float _2047 = _2039 * 6.283185482025146484375;
        float _2049 = cos(_2047);
        float _2051 = _2043 * _2045;
        float _2053 = _2039 * 6.283185482025146484375;
        float _2055 = sin(_2053);
        float _2057 = _2049 * _2051;
        float _2059 = 1.0 / _2057;
        float _2061 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2063 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2061;
        float _2065 = 1.0 / _2063;
        float _2067 = _2055 * _2059;
        float _2069 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2071 = fma(_2025, _2067, _2069);
        float _2073 = _2071 * _2065;
        float _2075 = precise::clamp(_2073, 0.0, 1.0);
        _2019 = _2075;
    }
    float _2077 = _2019;
    if (!_1999)
    {
        float _2079 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2081 = _2079 * 0.15915493667125701904296875;
        float _2083 = _2081 * 6.283185482025146484375;
        float _2085 = cos(_2083);
        float _2087 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2089 = _2087 * 0.15915493667125701904296875;
        float _2091 = _2081 * 6.283185482025146484375;
        float _2093 = sin(_2091);
        float _2095 = 1.0 / _2085;
        float _2097 = _2089 * 6.283185482025146484375;
        float _2099 = cos(_2097);
        float _2101 = _2093 * _2095;
        float _2103 = _2089 * 6.283185482025146484375;
        float _2105 = sin(_2103);
        float _2107 = _2099 * _2101;
        float _2109 = 1.0 / _2107;
        float _2111 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2113 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2111;
        float _2115 = 1.0 / _2113;
        float _2117 = _2105 * _2109;
        float _2119 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2121 = fma(_2025, _2117, _2119);
        float _2123 = _2121 * _2115;
        float _2125 = precise::clamp(_2123, 0.0, 1.0);
        float _2127 = -_2125;
        float _2129 = _2127 + 1.0;
        _2027 = _2129;
    }
    float _2131 = _2027;
    float _2133 = -_2009;
    float _2135 = _2133 + 1.0;
    bool _2137 = _2077 > 0.0;
    bool _2139 = isnan(_2077);
    bool _2141 = _2137 || _2139;
    bool _2143 = isnan(0.0);
    bool _2145 = _2141 || _2143;
    float _2147 = _2077 * _2131;
    float _2149 = _1876 * 0.5;
    float _2151 = _2135 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _2153 = _2131 <= 0.0;
    bool _2155 = !_2145;
    bool _2157 = _2153 || _2155;
    float _2159 = _2011 + _1876;
    float _2161 = _1904 + _1876;
    float _2163 = _2151 * _1938;
    float _2165 = _2147 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2167 = -_2151;
    float _2169 = _2167 + 1.0;
    float _2171 = fma(_1906, -0.5, _2149);
    float _2173 = _1949 * _2163;
    float _2175 = _1959 * _2163;
    float _2177 = _2159 * 0.5;
    float _2179 = _2161 * 0.5;
    float _2181 = _2165 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2183 = fma(_1955, _2173, _1943);
    float _2185 = fma(_1957, _2173, _1945);
    float _2187 = _1949 * _2169;
    float _2189 = fma(_1949, _2175, _1947);
    out.gl_Position.x = _1904;
    out.gl_Position.y = _1906;
    out.gl_Position.z = _2011;
    out.gl_Position.w = _1876;
    out.m_69.x = _2179;
    out.m_69.y = _2171;
    out.m_69.z = _2177;
    out.m_69.w = _1876;
    out.m_47.x = _2181;
    out.m_71.x = _2183;
    out.m_71.y = _2185;
    out.m_71.z = _2189;
    out.m_71.w = _2187;
    if (!_2157)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _2191 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2191;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1576 = false;
    bool _736 = false;
    bool _556 = false;
    bool _376 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _85 = in.m_44.w;
    float _87 = trunc(_85);
    int _90 = int(_87);
    bool _94 = _90 >= 1;
    float _96 = 0.0;
    if (!_94)
    {
        _96 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _98 = _96;
    float _100 = _98;
    if (!_94)
    {
        out.m_47.x = 0.0;
    }
    int _102 = 0;
    if (!_94)
    {
        float _104 = _98 * 5.0;
        _102 = as_type<int>(_104);
    }
    int _106 = _102;
    int _108 = _106;
    if (!_94)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2248 = as_type<float>(_106);
        out.gl_Position.z = _2248;
    }
    if (!_94)
    {
        return out;
    }
    float _110 = in.m_49.w;
    bool _112 = _110 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _114 = isnan(_110);
    bool _116 = _112 || _114;
    bool _118 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _120 = _116 || _118;
    float _122 = -_110;
    float _124 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _126 = 0.0;
    if (_120)
    {
        float _128 = float(_90);
        _126 = _128;
    }
    float _130 = _126;
    bool _132 = _124 >= _130;
    bool _134 = !_120;
    bool _136 = _132 || _134;
    if (_136)
    {
        _100 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _138 = _100;
    if (_136)
    {
        out.m_47.x = 0.0;
    }
    if (_136)
    {
        float _140 = _138 * 5.0;
        _108 = as_type<int>(_140);
    }
    int _142 = _108;
    if (_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2316 = as_type<float>(_142);
        out.gl_Position.z = _2316;
    }
    if (_136)
    {
        return out;
    }
    float _144 = in.m_51.x;
    float _146 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _148 = _124 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    bool _150 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _152 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _154 = _150 || _152;
    bool _156 = isnan(1.0);
    bool _158 = _154 || _156;
    int _160 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _162 = _160 != 0;
    float _164 = _148 * _146;
    float _166 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[20].x, _164);
    float _168 = in.m_49.x;
    float _170 = in.m_49.y;
    float _172 = in.m_49.z;
    float _174 = _166 * 6.283185482025146484375;
    float _176 = floor(_166);
    float _178 = _174 * 0.15915493667125701904296875;
    float _180 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _182 = 0.0;
    float _184 = _180;
    if (!_158)
    {
        float _186 = _180 * _180;
        float _188 = _186 * 0.5;
        _182 = _188;
    }
    float _190 = _182;
    float _192 = _178 * 6.283185482025146484375;
    float _194 = cos(_192);
    float _196 = _190;
    if (!_158)
    {
        float _198 = _190 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _196 = _198;
    }
    float _200 = _196;
    float _202 = -_176;
    float _204 = _166 + _202;
    bool _206 = !_158;
    float _208 = _200;
    if (!_206)
    {
        float _210 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _212 = log2(_210);
        float _214 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _216 = _214 + 1.0;
        float _218 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _220 = _180 * _212;
        float _222 = 1.0 / _216;
        float _224 = _218 * 0.693147182464599609375;
        float _226 = exp2(_220);
        float _228 = 1.0 / _224;
        float _230 = _226 + (-1.0);
        float _232 = -_230;
        float _234 = fma(_232, _228, _180);
        float _236 = _234 * _222;
        float _238 = _236 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _208 = _238;
    }
    float _240 = _208;
    bool _242 = !_158;
    if (!_242)
    {
        float _244 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _246 = log2(_244);
        float _248 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _250 = _248 + 1.0;
        float _252 = 1.0 / _250;
        float _254 = _180 * _246;
        float _256 = exp2(_254);
        float _258 = -_256;
        float _260 = _258 + 1.0;
        float _262 = _260 * _252;
        _184 = _262;
    }
    float _264 = _184;
    float _266 = in.m_53.w;
    int _268 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _270 = _268 != 0;
    int _272 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _274 = _272 != 0;
    float _276 = -_204;
    float _278 = fma(_276, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _280 = _204 < 0.5;
    float _282 = float(_280);
    float _284 = fma(_194, 0.5, 0.5);
    float _286 = in.m_44.x;
    float _288 = in.m_44.y;
    float _290 = in.m_44.z;
    bool _292 = !_270;
    int _294 = _292 ? 0 : 1;
    float _296 = _240 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _298 = -_282;
    float _300 = fma(_298, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _302 = !_162;
    int _304 = _302 ? 0 : 1;
    float _306 = -_284;
    float _308 = fma(_306, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _310 = abs(_294);
    float _312 = fma(_264, _168, _296);
    int _314 = abs(_304);
    float _316 = _240 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _318 = !_274;
    int _320 = _318 ? 0 : 1;
    float _322 = fma(_264, _170, _316);
    bool _324 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _326 = abs(_320);
    float _328 = _240 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _330 = float(_310);
    float _332 = float(_314);
    float _334 = fma(_264, _172, _328);
    float _336 = abs(_278);
    float _338 = _330 * _336;
    float _340 = fma(_312, _266, _286);
    float _342 = fma(_334, _266, _290);
    float _344 = float(_326);
    float _346 = fma(_332, _308, _338);
    float _348 = fma(_322, _266, _288);
    float _350 = abs(_300);
    float _352 = fma(_344, _350, _346);
    bool _354 = !_324;
    bool _356 = false;
    int _358 = as_type<int>(_352);
    float _374;
    if (!_354)
    {
        float _360 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _362 = _144 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _364 = fma(_362, (*spvDescriptorSet0.vp_c9)._m0[12].x, _124);
        float _366 = _364 * _360;
        float _368 = floor(_366);
        float _370 = -_368;
        float _372 = _366 + _370;
        _374 = _372;
        _376 = true;
    }
    else
    {
        float _378 = float(_90);
        float _380 = 1.0 / _378;
        float _382 = _124 * _380;
        _374 = _382;
    }
    _376 = false;
    float _384 = _374;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _388 = _384 + _386;
    bool _390 = _384 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _392 = isnan(_384);
    bool _394 = _390 || _392;
    bool _396 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _398 = _394 || _396;
    float _400 = float(_398);
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _404 = _384 + _402;
    bool _406 = _384 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _408 = isnan(_384);
    bool _410 = _406 || _408;
    bool _412 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _414 = _410 || _412;
    float _416 = float(_414);
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _420 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _418;
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _424 = _422 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _426 = _384 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _428 = isnan(_384);
    bool _430 = _426 || _428;
    bool _432 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _434 = _430 || _432;
    float _436 = float(_434);
    float _438 = -_400;
    float _440 = _438 + 1.0;
    float _442 = 1.0 / _424;
    float _444 = _436 * _440;
    float _446 = -_436;
    float _448 = _446 + 1.0;
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _452 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _450;
    bool _454 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _456 = 1.0 / _420;
    float _458 = _416 * _448;
    float _460 = -_416;
    float _462 = _460 + 1.0;
    float _464 = _404 * _442;
    float _466 = _388 * _456;
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _470 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _468;
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _474 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _472;
    float _476 = fma(_452, _466, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _478 = fma(_470, _466, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _480 = fma(_474, _466, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _482 = in.m_53.x;
    float _484 = in.m_53.y;
    float _486 = in.m_53.z;
    float _488 = _476 * _458;
    float _490 = _478 * _458;
    float _492 = _480 * _458;
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _496 = _494 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _500 = _498 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _504 = _502 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _506 = fma(_462, (*spvDescriptorSet0.vp_c9)._m0[143].x, _488);
    float _508 = fma(_496, _464, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _510 = fma(_500, _464, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _512 = fma(_504, _464, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _514 = fma(_462, (*spvDescriptorSet0.vp_c9)._m0[143].y, _490);
    float _516 = fma(_462, (*spvDescriptorSet0.vp_c9)._m0[143].z, _492);
    float _518 = fma(_508, _444, _506);
    float _520 = fma(_510, _444, _514);
    float _522 = fma(_512, _444, _516);
    float _524 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[145].x, _518);
    float _526 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[145].y, _520);
    float _528 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[145].z, _522);
    float _530 = _524 * _482;
    float _532 = _526 * _484;
    float _534 = _528 * _486;
    bool _536 = !_454;
    float _538 = _530;
    float _554;
    if (!_536)
    {
        float _540 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _542 = _144 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _544 = fma(_542, (*spvDescriptorSet0.vp_c9)._m0[11].x, _124);
        float _546 = _544 * _540;
        float _548 = floor(_546);
        float _550 = -_548;
        float _552 = _546 + _550;
        _554 = _552;
        _556 = true;
    }
    else
    {
        float _558 = float(_90);
        float _560 = 1.0 / _558;
        float _562 = _124 * _560;
        _554 = _562;
    }
    _556 = false;
    float _564 = _554;
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _568 = _564 + _566;
    bool _570 = _564 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _572 = isnan(_564);
    bool _574 = _570 || _572;
    bool _576 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _578 = _574 || _576;
    float _580 = float(_578);
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _584 = _564 + _582;
    bool _586 = _564 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _588 = isnan(_564);
    bool _590 = _586 || _588;
    bool _592 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _594 = _590 || _592;
    float _596 = float(_594);
    float _598 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _600 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _598;
    float _602 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _604 = _602 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _606 = _564 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _608 = isnan(_564);
    bool _610 = _606 || _608;
    bool _612 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _614 = _610 || _612;
    float _616 = float(_614);
    float _618 = -_580;
    float _620 = _618 + 1.0;
    float _622 = 1.0 / _604;
    float _624 = _616 * _620;
    float _626 = -_616;
    float _628 = _626 + 1.0;
    float _630 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _632 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _630;
    float _634 = 1.0 / _600;
    float _636 = _596 * _628;
    float _638 = -_596;
    float _640 = _638 + 1.0;
    float _642 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _644 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _646 = _584 * _622;
    float _648 = _568 * _634;
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _652 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _650;
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _656 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _654;
    float _658 = fma(_632, _648, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _660 = fma(_652, _648, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _662 = fma(_656, _648, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _664 = _658 * _636;
    float _666 = _660 * _636;
    float _668 = _662 * _636;
    float _670 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _672 = _670 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _674 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _676 = _674 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _678 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _680 = _678 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _682 = fma(_640, (*spvDescriptorSet0.vp_c9)._m0[107].x, _664);
    float _684 = fma(_640, (*spvDescriptorSet0.vp_c9)._m0[107].y, _666);
    float _686 = fma(_672, _646, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _688 = fma(_676, _646, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _690 = fma(_680, _646, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _692 = fma(_640, (*spvDescriptorSet0.vp_c9)._m0[107].z, _668);
    float _694 = fma(_686, _624, _682);
    float _696 = fma(_688, _624, _684);
    float _698 = fma(_690, _624, _692);
    float _700 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[109].x, _694);
    float _702 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[109].y, _696);
    float _704 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[109].z, _698);
    float _706 = _700 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _708 = _702 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _710 = _704 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _712 = _706 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _714 = _708 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _716 = _710 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_55.x = _712;
    out.m_55.y = _714;
    out.m_55.z = _716;
    out.m_55.w = _642;
    bool _718 = !_644;
    float _734;
    if (!_718)
    {
        float _720 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _722 = _144 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _724 = fma(_722, (*spvDescriptorSet0.vp_c9)._m0[11].z, _124);
        float _726 = _724 * _720;
        float _728 = floor(_726);
        float _730 = -_728;
        float _732 = _726 + _730;
        _734 = _732;
        _736 = true;
    }
    else
    {
        float _738 = float(_90);
        float _740 = 1.0 / _738;
        float _742 = _124 * _740;
        _734 = _742;
    }
    _736 = false;
    float _744 = _734;
    float _746 = in.m_57.x;
    float _748 = in.m_57.y;
    float _750 = in.m_57.z;
    float _752 = _352 * _532;
    float _754 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, 0.0166666693985462188720703125, _144);
    float _756 = _352 * _534;
    float _758 = _754 * 0.5;
    float _760 = _754 * 20.0;
    float _762 = _758 * 0.15915493667125701904296875;
    float _764 = _762 * 6.283185482025146484375;
    float _766 = sin(_764);
    float _768 = -_760;
    float _770 = fma(_748, 4.3982295989990234375, _768);
    float _772 = precise::max(_748, -0.60352802276611328125);
    float _774 = _770 * 0.15915493667125701904296875;
    float _776 = precise::min(_772, 1.20902001857757568359375);
    float _778 = _774 * 6.283185482025146484375;
    float _780 = sin(_778);
    float _782 = fma(_776, 0.55170953273773193359375, 0.33297216892242431640625);
    float _784 = _782 * _782;
    float _786 = _748 * _748;
    float _788 = fma(_766, 0.07500000298023223876953125, 0.324999988079071044921875);
    float _790 = fma(_784, 0.75, 0.25);
    float _792 = _780 * _788;
    float _794 = _352 * _530;
    float _796 = fma(_790, _792, _746);
    float _798 = fma(_796, _796, _786);
    float _800 = fma(_750, _750, _798);
    float _802 = rsqrt(_800);
    float _804 = _796 * _802;
    float _806 = _802 * _748;
    float _808 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _810 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _808;
    float _812 = abs(_804);
    float _814 = abs(_806);
    float _816 = precise::max(_812, _814);
    bool _818 = _816 >= 16.0;
    int _820 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _822 = _820 != 0;
    float _824 = _806;
    float _826 = _804;
    int _828 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    if (_818)
    {
        float _830 = _806 * 0.0625;
        _824 = _830;
    }
    float _832 = _824;
    if (_818)
    {
        float _834 = _804 * 0.0625;
        _826 = _834;
    }
    float _836 = _826;
    float _838 = abs(_832);
    bool _840 = _838 != 0.0;
    bool _842 = isnan(_838);
    bool _844 = _840 || _842;
    bool _846 = isnan(0.0);
    bool _848 = _844 || _846;
    float _850 = abs(_836);
    bool _852 = _850 == 0.0;
    float _854 = abs(_836);
    bool _856 = _854 == 0.0;
    bool _858 = !_848;
    bool _860 = _856 && _858;
    if (_860)
    {
        bool _862 = as_type<int>(_836) >= 0;
        _356 = _862;
    }
    bool _864 = _356;
    int _866 = _864 ? (-1) : 0;
    if (_860)
    {
        int _868 = _864 ? 0 : 1078530011;
        _828 = _868;
    }
    int _870 = _828;
    if (_860)
    {
        int _872 = int(0x80000000) & as_type<int>(_832);
        int _874 = _870 | _872;
        _538 = as_type<float>(_874);
    }
    float _876 = _538;
    bool _878 = !_848;
    bool _880 = _878 && _852;
    float _882 = _876;
    float _884 = _876;
    if (!_880)
    {
        float _886 = abs(_832);
        bool _888 = _886 != as_type<float>(0x7f800000u /* inf */);
        bool _890 = isnan(_886);
        bool _892 = _888 || _890;
        bool _894 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _896 = _892 || _894;
        float _898 = abs(_836);
        bool _900 = _898 == as_type<float>(0x7f800000u /* inf */);
        float _902 = abs(_836);
        bool _904 = _902 == as_type<float>(0x7f800000u /* inf */);
        bool _906 = !_896;
        bool _908 = _904 && _906;
        if (_908)
        {
            bool _910 = as_type<int>(_836) >= 0;
            _866 = _910 ? (-1) : 0;
        }
        int _912 = _866;
        if (_908)
        {
            _358 = 1075235812;
        }
        int _914 = _358;
        int _916 = _914;
        if (_908)
        {
            int _918 = ~_912;
            int _920 = (_918 != 0) ? _914 : 1061752795;
            _916 = _920;
        }
        int _922 = _916;
        if (_908)
        {
            int _924 = int(0x80000000) & as_type<int>(_832);
            int _926 = _922 | _924;
            _882 = as_type<float>(_926);
        }
        float _928 = _882;
        bool _930 = !_896;
        bool _932 = _930 && _900;
        _884 = _928;
        if (!_932)
        {
            float _934 = abs(_836);
            float _936 = abs(_832);
            float _938 = precise::max(_934, _936);
            float _940 = abs(_836);
            float _942 = abs(_832);
            float _944 = precise::min(_940, _942);
            float _946 = 1.0 / _938;
            float _948 = abs(_832);
            float _950 = abs(_836);
            bool _952 = _948 > _950;
            bool _954 = as_type<int>(_836) >= 0;
            float _956 = _944 * _946;
            float _958 = _956 * _956;
            float _960 = _958 + 11.33538818359375;
            float _962 = fma(_958, _960, 28.84246826171875);
            float _964 = fma(_958, _962, 19.6966705322265625);
            float _966 = fma(_958, -0.82336294651031494140625, -5.674867153167724609375);
            float _968 = fma(_958, _966, -6.565555095672607421875);
            float _970 = 1.0 / _964;
            float _972 = _958 * _968;
            float _974 = abs(_836);
            float _976 = abs(_832);
            float _978 = _974 + _976;
            int _980 = as_type<int>(_832) & int(0x80000000);
            float _982 = _956 * _972;
            bool _984 = _978 > as_type<float>(0x7f800000u /* inf */);
            bool _986 = isnan(_978);
            bool _988 = _984 || _986;
            bool _990 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _992 = _988 || _990;
            float _994 = fma(_982, _970, _956);
            float _996 = _994;
            _884 = _978;
            if (_952)
            {
                float _998 = -_994;
                float _1000 = _998 + 1.57079637050628662109375;
                _996 = _1000;
            }
            float _1002 = _996;
            int _1004 = as_type<int>(_1002);
            if (!_954)
            {
                float _1006 = -_1002;
                float _1008 = _1006 + 3.1415927410125732421875;
                _1004 = as_type<int>(_1008);
            }
            int _1010 = _1004;
            if (!_992)
            {
                int _1012 = _980 | _1010;
                _884 = as_type<float>(_1012);
            }
        }
    }
    float _1014 = _884;
    float _1016 = 1.0 / _810;
    float _1018 = _348 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1020 = _348 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1022 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1024 = _1022 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1026 = _348 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1028 = in.m_51.z;
    float _1030 = fma(_754, 4.0, _1014);
    float _1032 = fma(_340, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1018);
    float _1034 = 1.0 / _1024;
    float _1036 = fma(_340, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1020);
    float _1038 = fma(_340, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1026);
    float _1040 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1042 = _744 + _1040;
    float _1044 = in.m_59.y;
    float _1046 = _1030 * 3.0;
    float _1048 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1050 = _744 + _1048;
    float _1052 = in.m_51.y;
    float _1054 = _1042 * _1016;
    float _1056 = _1046 * 0.15915493667125701904296875;
    float _1058 = fma(_342, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1038);
    float _1060 = fma(_342, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1032);
    int _1062 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1064 = _1062 != 0;
    float _1066 = _1056 * 6.283185482025146484375;
    float _1068 = sin(_1066);
    float _1070 = _1050 * _1034;
    float _1072 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1074 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1072;
    int _1076 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1078 = _1076 != 0;
    float _1080 = fma(_342, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1036);
    int _1082 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1084 = _1082 != 0;
    float _1086 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1088 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1086;
    int _1090 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1092 = _1090 != 0;
    float _1094 = in.m_59.x;
    float _1096 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
    float _1098 = _1036;
    float _1100 = (*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1102 = _1080;
    if (_822)
    {
        _1096 = _144;
    }
    float _1104 = _1096;
    float _1106 = fma(_1074, _1054, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1108 = -_1044;
    float _1110 = _1108 + 1.0;
    bool _1112 = _1028 > 0.5;
    float _1114 = fma(_1088, _1054, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1116 = _1104;
    float _1118 = _1044;
    bool _1120 = _1112;
    if (!_822)
    {
        _1116 = _1028;
    }
    float _1122 = _1116;
    float _1124 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1126 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1124;
    float _1128 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1130 = _1068 * 0.20000000298023223876953125;
    bool _1132 = _1052 > 0.5;
    float _1134 = fma(_1126, _1054, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1136 = fma(_1052, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1128);
    float _1138 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1140 = _1130;
    if (_822)
    {
        _1098 = _1052;
    }
    float _1142 = _1098;
    float _1144 = _790 * _1130;
    int _1146 = _1112 ? as_type<int>(_1110) : as_type<int>(_1044);
    float _1148 = _752 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1150 = fma(_796, _1144, _796);
    float _1152 = _1084 ? as_type<float>(_1146) : _1044;
    float _1154 = fma(_1144, _750, _750);
    float _1156 = _1142;
    if (_1092)
    {
        float _1158 = _1132 ? _1110 : _1044;
        _1118 = _1158;
    }
    float _1160 = _1118;
    float _1162 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1164 = fma(_1144, _748, _748);
    if (_1064)
    {
        bool _1166 = _144 > 0.5;
        _1120 = _1166;
    }
    bool _1168 = _1120;
    float _1170 = _756 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1172 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1162);
    if (!_822)
    {
        _1156 = _144;
    }
    float _1174 = _1156;
    float _1176 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1164);
    float _1178 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1180 = _1178 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1182 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1150);
    float _1184 = _1138 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1186 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1154);
    float _1188 = _794 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1190 = _1148 * _1176;
    float _1192 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1194 = _1192 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1196 = fma(_1152, _1184, -0.5);
    float _1198 = _1170 * _1186;
    float _1200 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1202 = _1200 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1204 = _1188 * _1182;
    float _1206 = _1190 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1208 = _1190 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _1210 = as_type<int>(_1174);
    if (!_1064)
    {
        _1100 = _1094;
    }
    float _1212 = _1100;
    float _1214 = _1058 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1216 = fma(_1204, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1206);
    float _1218 = fma(_1204, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1208);
    float _1220 = _1212;
    if (!_1064)
    {
        _1140 = _1212;
    }
    float _1222 = _1140;
    float _1224 = fma(_1194, _1070, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1226 = _1222;
    if (_1064)
    {
        _1220 = _1094;
    }
    float _1228 = _1220;
    float _1230 = fma(_1198, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1218);
    bool _1232 = _744 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1234 = isnan(_744);
    bool _1236 = _1232 || _1234;
    bool _1238 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1240 = _1236 || _1238;
    float _1242 = float(_1240);
    float _1244 = fma(_1202, _1070, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    bool _1246 = _744 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1248 = isnan(_744);
    bool _1250 = _1246 || _1248;
    bool _1252 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1254 = _1250 || _1252;
    float _1256 = float(_1254);
    float _1258 = _1230 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    bool _1260 = _744 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1262 = isnan(_744);
    bool _1264 = _1260 || _1262;
    bool _1266 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1268 = _1264 || _1266;
    float _1270 = float(_1268);
    float _1272 = fma(_1198, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1216);
    float _1274 = _1060 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1276 = _1214 + _1258;
    float _1278 = -_1256;
    float _1280 = _1278 + 1.0;
    float _1282 = _1272 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1284 = -_1270;
    float _1286 = _1284 + 1.0;
    float _1288 = fma(_1180, _1070, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1290 = _1242 * _1280;
    float _1292 = _1274 + _1282;
    float _1294 = _1256 * _1286;
    float _1296 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1298 = _1276 + _1296;
    float _1300 = _1122 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1302 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1304 = _1292 + _1302;
    float _1306 = _1298 * _1298;
    float _1308 = _1134 * _1290;
    float _1310 = _1304 * _1304;
    float _1312 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1314 = _1190 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1316 = _1310 + _1306;
    float _1318 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1320 = -_1312;
    float _1322 = fma(_1300, 2.0, _1320);
    float _1324 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1326 = _1174 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _1328 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[87].y);
    float _1330 = _1290;
    float _1332 = _1310;
    float _1334 = _1306;
    float _1336 = _1292;
    float _1338 = _1276;
    float _1340 = _1298;
    if (_1078)
    {
        float _1342 = -_1228;
        float _1344 = _1342 + 1.0;
        _1328 = as_type<int>(_1344);
    }
    int _1346 = _1328;
    float _1348 = _1106 * _1290;
    if (_1064)
    {
        float _1350 = -_1228;
        float _1352 = _1350 + 1.0;
        _1210 = as_type<int>(_1352);
    }
    int _1354 = _1210;
    float _1356 = _1114 * _1290;
    float _1358 = sqrt(_1316);
    float _1360 = -_1242;
    float _1362 = _1360 + 1.0;
    if (!_1078)
    {
        _1330 = _1228;
    }
    float _1364 = _1330;
    float _1366 = fma(_1326, -2.0, _1324);
    float _1368 = fma(_1204, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1314);
    float _1370 = _1364;
    if (_1078)
    {
        float _1372 = _1132 ? as_type<float>(_1346) : _1228;
        _1370 = _1372;
    }
    float _1374 = _1370;
    float _1376 = fma(_1362, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1356);
    if (_1064)
    {
        float _1378 = _1168 ? as_type<float>(_1354) : _1228;
        _1226 = _1378;
    }
    float _1380 = _1226;
    float _1382 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1172);
    float _1384 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1136);
    float _1386 = -_124;
    float _1388 = fma(_1386, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1322);
    float _1390 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1366);
    float _1392 = fma(_1198, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1368);
    float _1394 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1396 = _1080 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1398 = fma(_1362, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1348);
    bool _1400 = _1358 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1402 = _1392 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1404 = _1318 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1406 = fma(_1362, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1308);
    float _1408 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1410 = _1396 + _1402;
    float _1412 = fma(_1224, _1294, _1398);
    float _1414 = fma(_1244, _1294, _1376);
    float _1416 = fma(_1404, _1374, -0.5);
    if (!_1400)
    {
        _1102 = _1410;
    }
    float _1418 = _1102;
    bool _1420 = !_1400;
    float _1422 = _1418;
    if (!_1420)
    {
        float _1424 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1426 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1428 = _1358 + _1426;
        float _1430 = _1410 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1432 = rsqrt(_1316);
        float _1434 = _1428 * _1424;
        float _1436 = _1434 * 0.15915493667125701904296875;
        float _1438 = _1436 * 6.283185482025146484375;
        float _1440 = sin(_1438);
        float _1442 = _1436 * 6.283185482025146484375;
        float _1444 = cos(_1442);
        float _1446 = fma(_1440, _1430, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1448 = _1432 * _1446;
        float _1450 = fma(_1304, _1448, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1452 = _1444 + (-1.0);
        float _1454 = fma(_1298, _1448, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1456 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1458 = _1450 + _1456;
        float _1460 = _1452 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1462 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1464 = _1454 + _1462;
        float _1466 = _1458 * _1458;
        float _1468 = fma(_1410, _1444, _1460);
        float _1470 = _1464 * _1464;
        _1422 = _1468;
        _1332 = _1466;
        _1334 = _1470;
        _1336 = _1450;
        _1338 = _1454;
    }
    float _1472 = _1422;
    float _1474 = _1332;
    float _1476 = _1334;
    float _1478 = _1336;
    float _1480 = _1338;
    float _1482 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1484 = _1472 + _1482;
    float _1486 = fma(_1288, _1294, _1406);
    float _1488 = fma(_1270, (*spvDescriptorSet0.vp_c9)._m0[125].x, _1412);
    float _1490 = fma(_1270, (*spvDescriptorSet0.vp_c9)._m0[125].y, _1414);
    float _1492 = fma(_1484, _1484, _1474);
    float _1494 = fma(_1270, (*spvDescriptorSet0.vp_c9)._m0[125].z, _1486);
    float _1496 = _1160 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1498 = _1380 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1500 = _1492 + _1476;
    float _1502 = -_1390;
    float _1504 = fma(_1384, _1196, _1502);
    float _1506 = fma(_1382, _1416, _1388);
    float _1508 = _1488 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1510 = _1490 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1512 = _1494 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1514 = sqrt(_1500);
    float _1516 = _1496 * _1408;
    float _1518 = _1498 * _1394;
    float _1520 = _1504 + 0.5;
    float _1522 = _1506 + 0.5;
    float _1524 = _1508 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1526 = _1510 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1528 = _1512 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_61.x = _1518;
    out.m_61.y = _1516;
    out.m_63.x = _1522;
    out.m_63.y = _1520;
    out.m_65.x = _1524;
    out.m_65.y = _1526;
    out.m_65.z = _1528;
    bool _1530 = _1514 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1532 = isnan(_1514);
    bool _1534 = _1530 || _1532;
    bool _1536 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1538 = _1534 || _1536;
    out.m_67.y = _1164;
    float _1540 = _1504;
    if (!_1538)
    {
        _1540 = 1.0;
    }
    float _1542 = _1540;
    bool _1544 = !_1538;
    float _1546 = _1542;
    if (!_1544)
    {
        bool _1548 = _1514 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1550 = isnan(_1514);
        bool _1552 = _1548 || _1550;
        bool _1554 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1556 = _1552 || _1554;
        if (!_1556)
        {
            float _1558 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1560 = _1514 + _1558;
            float _1562 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1564 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1562;
            float _1566 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1568 = _1566 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1570 = 1.0 / _1564;
            float _1572 = _1560 * _1570;
            float _1574 = fma(_1572, _1568, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1546 = _1574;
            _1576 = true;
        }
        else
        {
            bool _1578 = _1514 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1580 = isnan(_1514);
            bool _1582 = _1578 || _1580;
            bool _1584 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1586 = _1582 || _1584;
            if (!_1586)
            {
                float _1588 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1590 = _1514 + _1588;
                float _1592 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1594 = _1592 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1596 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1598 = _1596 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1600 = 1.0 / _1594;
                float _1602 = _1590 * _1600;
                float _1604 = fma(_1602, _1598, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1546 = _1604;
                _1576 = true;
            }
            else
            {
                _1546 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1576 = false;
    float _1606 = _1546;
    float _1608 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1610 = _1472 + _1608;
    float _1612 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1614 = _1478 + _1612;
    float _1616 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1618 = _1480 + _1616;
    float _1620 = fma(_1610, _1606, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1622 = fma(_1614, _1606, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1624 = fma(_1618, _1606, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1626 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1628 = _1620 + _1626;
    float _1630 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1632 = _1622 + _1630;
    float _1634 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1636 = _1624 + _1634;
    float _1638 = _1628 * _1628;
    float _1640 = fma(_1632, _1632, _1638);
    float _1642 = fma(_1636, _1636, _1640);
    float _1644 = rsqrt(_1642);
    float _1646 = sqrt(_1642);
    float _1648 = _1644 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1650 = _1632 * _1648;
    float _1652 = _1636 * _1648;
    float _1654 = _1650 * _1650;
    float _1656 = _1652 * _1652;
    float _1658 = _1654 + _1656;
    float _1660 = sqrt(_1658);
    bool _1662 = _1660 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1664 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1666 = _1660 + _1664;
    float _1668 = _1506;
    float _1670 = _1658;
    float _1672 = _1666;
    float _1674 = _1628;
    float _1676 = _1648;
    float _1678 = _1650;
    if (_1662)
    {
        float _1680 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1668 = _1680;
    }
    float _1682 = _1668;
    if (_1662)
    {
        float _1684 = rsqrt(_1658);
        _1670 = _1684;
    }
    float _1686 = _1670;
    float _1688 = _1682;
    if (_1662)
    {
        float _1690 = _1666 * _1682;
        _1672 = _1690;
    }
    float _1692 = _1672;
    if (_1662)
    {
        float _1694 = _1692 * 0.15915493667125701904296875;
        _1688 = _1694;
    }
    float _1696 = _1688;
    float _1698 = _1644;
    float _1700 = _1696;
    if (_1662)
    {
        float _1702 = _1696 * 6.283185482025146484375;
        float _1704 = sin(_1702);
        _1698 = _1704;
    }
    float _1706 = _1698;
    float _1708 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1710 = precise::max(0.0, _1708);
    float _1712 = _1636;
    float _1714 = _1710;
    if (_1662)
    {
        float _1716 = _1696 * 6.283185482025146484375;
        float _1718 = cos(_1716);
        _1712 = _1718;
    }
    float _1720 = _1712;
    float _1722 = -_1648;
    float _1724 = -_1710;
    float _1726 = fma(_1628, _1722, _1724);
    if (_1662)
    {
        float _1728 = _1726 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1674 = _1728;
    }
    float _1730 = _1674;
    float _1732 = _1730;
    if (!_1662)
    {
        _1700 = _1654;
    }
    float _1734 = _1700;
    float _1736 = _1706;
    float _1738 = _1734;
    if (_1662)
    {
        float _1740 = fma(_1706, _1730, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1732 = _1740;
    }
    float _1742 = _1732;
    float _1744 = _1742;
    if (!_1662)
    {
        _1736 = _1726;
    }
    float _1746 = _1736;
    float _1748 = _1746;
    if (_1662)
    {
        float _1750 = _1720 + (-1.0);
        _1714 = _1750;
    }
    float _1752 = _1714;
    float _1754 = _1752;
    if (_1662)
    {
        float _1756 = _1686 * _1742;
        _1340 = _1756;
    }
    float _1758 = _1340;
    if (!_1662)
    {
        _1744 = _1652;
    }
    float _1760 = _1744;
    float _1762 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1764 = _1760;
    if (_1662)
    {
        float _1766 = _1752 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1676 = _1766;
    }
    float _1768 = _1676;
    if (_1662)
    {
        float _1770 = _1650 * _1758;
        _1678 = _1770;
    }
    float _1772 = _1678;
    if (_1662)
    {
        float _1774 = _1652 * _1758;
        _1764 = _1774;
    }
    float _1776 = _1764;
    if (!_1662)
    {
        _1754 = _1656;
    }
    float _1778 = _1754;
    float _1780 = _1778;
    if (_1662)
    {
        float _1782 = fma(_1726, _1720, _1768);
        _1748 = _1782;
    }
    float _1784 = _1748;
    if (_1662)
    {
        float _1786 = _1772 * _1772;
        _1738 = _1786;
    }
    float _1788 = _1738;
    if (_1662)
    {
        float _1790 = _1776 * _1776;
        _1780 = _1790;
    }
    float _1792 = _1780;
    float _1794 = fma(_1784, _1784, _1788);
    float _1796 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1798 = fma(_1646, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1796);
    float _1800 = precise::clamp(_1798, 0.0, 1.0);
    float _1802 = _1794 + _1792;
    float _1804 = _1620 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1806 = _1620 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1808 = -_1800;
    float _1810 = _1808 + 1.0;
    float _1812 = rsqrt(_1802);
    float _1814 = fma(_1622, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1804);
    float _1816 = fma(_1622, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1806);
    float _1818 = fma(_1624, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1814);
    float _1820 = _1620 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1822 = fma(_1624, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1816);
    float _1824 = abs(_1810);
    float _1826 = log2(_1824);
    float _1828 = _1620 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1830 = fma(_1622, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1820);
    float _1832 = _1822 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1834 = _1818 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1836 = fma(_1622, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1828);
    float _1838 = fma(_1624, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1830);
    float _1840 = _1812 * _1772;
    float _1842 = _1812 * _1784;
    float _1844 = _1838 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1846 = _1832 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1848 = _1840 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1850 = _1812 * _1776;
    float _1852 = fma(_1624, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1836);
    float _1854 = fma(_1844, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1846);
    float _1856 = -_1848;
    float _1858 = fma(_1842, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1856);
    float _1860 = _1834 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1862 = _1852 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1864 = fma(_1834, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1854);
    float _1866 = -_1850;
    float _1868 = fma(_1866, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1858);
    float _1870 = -_1860;
    float _1872 = fma(_1870, _1762, 1.0);
    float _1874 = _1826 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1876 = fma(_1862, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1864);
    float _1878 = fma(_1868, -0.5, 0.5);
    float _1880 = _1832 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1882 = exp2(_1874);
    float _1884 = _1832 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1886 = fma(_1868, 0.5, 0.5);
    float _1888 = fma(_1844, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1880);
    float _1890 = _1842 + 1.0;
    float _1892 = fma(_1844, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1884);
    float _1894 = fma(_1886, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1896 = log2(_1872);
    float _1898 = fma(_1834, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1888);
    float _1900 = fma(_1834, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1892);
    float _1902 = fma(_1886, _1894, -0.212114393711090087890625);
    float _1904 = fma(_1862, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1898);
    float _1906 = fma(_1862, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1900);
    float _1908 = fma(_1886, _1902, 1.570728778839111328125);
    float _1910 = 1.0 / _1876;
    float _1912 = -_1842;
    float _1914 = fma(_1882, _1890, _1912);
    float _1916 = fma(_1914, 0.5, 0.5);
    float _1918 = sqrt(_1878);
    float _1920 = _1896 * 0.693147182464599609375;
    float _1922 = _1904 * _1910;
    float _1924 = _1906 * _1910;
    float _1926 = _1920 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1928 = fma(_1922, 0.5, 0.5);
    float _1930 = fma(_1924, -0.5, 0.5);
    float _1932 = _1918 * 0.636619746685028076171875;
    float _1934 = -_1908;
    float _1936 = fma(_1932, _1934, 1.0);
    float3 _5243 = float3(_1928, _1930, _1926);
    float _1938 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5243, float3(0.0), isnan(_5243)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5243, float3(0.0), isnan(_5243)), level(0.0)).x;
    float3 _5254 = float3(_1928, _1930, _1926);
    float4 _1941 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5254, float3(0.0), isnan(_5254)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5254, float3(0.0), isnan(_5254)), level(0.0)).xyzw;
    float _1943 = _1941.x;
    float _1945 = _1941.y;
    float _1947 = _1941.z;
    float _1949 = _1941.w;
    float2 _5271 = float2(_1936, _1916);
    float3 _1953 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5271, float2(0.0), isnan(_5271)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5271, float2(0.0), isnan(_5271)), level(0.0)).xyz;
    float _1955 = _1953.x;
    float _1957 = _1953.y;
    float _1959 = _1953.z;
    float _1961 = _1396 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1963 = _1396 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1965 = fma(_1274, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1961);
    float _1967 = fma(_1274, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1963);
    float _1969 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1965);
    float _1971 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1967);
    float _1973 = _1969 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1975 = _1971 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1977 = 1.0 / _1973;
    float _1979 = _1975 + _1973;
    float _1981 = _1979 * _1977;
    float _1983 = _1981 * 0.5;
    float _1985 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1987 = fma(_1983, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1985);
    float _1989 = _1832 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1991 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1993 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1995 = _1991 || _1993;
    bool _1997 = isnan(0.5);
    bool _1999 = _1995 || _1997;
    float _2001 = _1826 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2003 = 1.0 / _1987;
    float _2005 = fma(_1844, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1989);
    float _2007 = fma(_1834, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2005);
    float _2009 = exp2(_2001);
    float _2011 = fma(_1862, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2007);
    float _2013 = _1826;
    float _2015 = _2005;
    if (_1999)
    {
        _2013 = 1.0;
    }
    float _2017 = _2013;
    float _2019 = _2017;
    if (_1999)
    {
        _2015 = 1.0;
    }
    float _2021 = _2015;
    float _2023 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2025 = _2003 * _2023;
    float _2027 = _2021;
    if (!_1999)
    {
        float _2029 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2031 = _2029 * 0.15915493667125701904296875;
        float _2033 = _2031 * 6.283185482025146484375;
        float _2035 = cos(_2033);
        float _2037 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2039 = _2037 * 0.15915493667125701904296875;
        float _2041 = _2031 * 6.283185482025146484375;
        float _2043 = sin(_2041);
        float _2045 = 1.0 / _2035;
        float _2047 = _2039 * 6.283185482025146484375;
        float _2049 = cos(_2047);
        float _2051 = _2043 * _2045;
        float _2053 = _2039 * 6.283185482025146484375;
        float _2055 = sin(_2053);
        float _2057 = _2049 * _2051;
        float _2059 = 1.0 / _2057;
        float _2061 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2063 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2061;
        float _2065 = 1.0 / _2063;
        float _2067 = _2055 * _2059;
        float _2069 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2071 = fma(_2025, _2067, _2069);
        float _2073 = _2071 * _2065;
        float _2075 = precise::clamp(_2073, 0.0, 1.0);
        _2019 = _2075;
    }
    float _2077 = _2019;
    if (!_1999)
    {
        float _2079 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2081 = _2079 * 0.15915493667125701904296875;
        float _2083 = _2081 * 6.283185482025146484375;
        float _2085 = cos(_2083);
        float _2087 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2089 = _2087 * 0.15915493667125701904296875;
        float _2091 = _2081 * 6.283185482025146484375;
        float _2093 = sin(_2091);
        float _2095 = 1.0 / _2085;
        float _2097 = _2089 * 6.283185482025146484375;
        float _2099 = cos(_2097);
        float _2101 = _2093 * _2095;
        float _2103 = _2089 * 6.283185482025146484375;
        float _2105 = sin(_2103);
        float _2107 = _2099 * _2101;
        float _2109 = 1.0 / _2107;
        float _2111 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2113 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2111;
        float _2115 = 1.0 / _2113;
        float _2117 = _2105 * _2109;
        float _2119 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2121 = fma(_2025, _2117, _2119);
        float _2123 = _2121 * _2115;
        float _2125 = precise::clamp(_2123, 0.0, 1.0);
        float _2127 = -_2125;
        float _2129 = _2127 + 1.0;
        _2027 = _2129;
    }
    float _2131 = _2027;
    float _2133 = -_2009;
    float _2135 = _2133 + 1.0;
    bool _2137 = _2077 > 0.0;
    bool _2139 = isnan(_2077);
    bool _2141 = _2137 || _2139;
    bool _2143 = isnan(0.0);
    bool _2145 = _2141 || _2143;
    float _2147 = _2077 * _2131;
    float _2149 = _1876 * 0.5;
    float _2151 = _2135 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _2153 = _2131 <= 0.0;
    bool _2155 = !_2145;
    bool _2157 = _2153 || _2155;
    float _2159 = _2011 + _1876;
    float _2161 = _1904 + _1876;
    float _2163 = _2151 * _1938;
    float _2165 = _2147 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2167 = -_2151;
    float _2169 = _2167 + 1.0;
    float _2171 = fma(_1906, -0.5, _2149);
    float _2173 = _1949 * _2163;
    float _2175 = _1959 * _2163;
    float _2177 = _2159 * 0.5;
    float _2179 = _2161 * 0.5;
    float _2181 = _2165 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2183 = fma(_1955, _2173, _1943);
    float _2185 = fma(_1957, _2173, _1945);
    float _2187 = _1949 * _2169;
    float _2189 = fma(_1949, _2175, _1947);
    out.gl_Position.x = _1904;
    out.gl_Position.y = _1906;
    out.gl_Position.z = _2011;
    out.gl_Position.w = _1876;
    out.m_69.x = _2179;
    out.m_69.y = _2171;
    out.m_69.z = _2177;
    out.m_69.w = _1876;
    out.m_47.x = _2181;
    out.m_71.x = _2183;
    out.m_71.y = _2185;
    out.m_71.z = _2189;
    out.m_71.w = _2187;
    if (!_2157)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _2191 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2191;
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
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1576 = false;
    bool _736 = false;
    bool _556 = false;
    bool _376 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _85 = in.m_44.w;
    float _87 = trunc(_85);
    int _90 = int(_87);
    bool _94 = _90 >= 1;
    float _96 = 0.0;
    if (!_94)
    {
        _96 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _98 = _96;
    float _100 = _98;
    if (!_94)
    {
        out.m_47.x = 0.0;
    }
    int _102 = 0;
    if (!_94)
    {
        float _104 = _98 * 5.0;
        _102 = as_type<int>(_104);
    }
    int _106 = _102;
    int _108 = _106;
    if (!_94)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2248 = as_type<float>(_106);
        out.gl_Position.z = _2248;
    }
    if (!_94)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _110 = in.m_49.w;
    bool _112 = _110 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _114 = isnan(_110);
    bool _116 = _112 || _114;
    bool _118 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _120 = _116 || _118;
    float _122 = -_110;
    float _124 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _126 = 0.0;
    if (_120)
    {
        float _128 = float(_90);
        _126 = _128;
    }
    float _130 = _126;
    bool _132 = _124 >= _130;
    bool _134 = !_120;
    bool _136 = _132 || _134;
    if (_136)
    {
        _100 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _138 = _100;
    if (_136)
    {
        out.m_47.x = 0.0;
    }
    if (_136)
    {
        float _140 = _138 * 5.0;
        _108 = as_type<int>(_140);
    }
    int _142 = _108;
    if (_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2316 = as_type<float>(_142);
        out.gl_Position.z = _2316;
    }
    if (_136)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _144 = in.m_51.x;
    float _146 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _148 = _124 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    bool _150 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _152 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _154 = _150 || _152;
    bool _156 = isnan(1.0);
    bool _158 = _154 || _156;
    int _160 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _162 = _160 != 0;
    float _164 = _148 * _146;
    float _166 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[20].x, _164);
    float _168 = in.m_49.x;
    float _170 = in.m_49.y;
    float _172 = in.m_49.z;
    float _174 = _166 * 6.283185482025146484375;
    float _176 = floor(_166);
    float _178 = _174 * 0.15915493667125701904296875;
    float _180 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _182 = 0.0;
    float _184 = _180;
    if (!_158)
    {
        float _186 = _180 * _180;
        float _188 = _186 * 0.5;
        _182 = _188;
    }
    float _190 = _182;
    float _192 = _178 * 6.283185482025146484375;
    float _194 = cos(_192);
    float _196 = _190;
    if (!_158)
    {
        float _198 = _190 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _196 = _198;
    }
    float _200 = _196;
    float _202 = -_176;
    float _204 = _166 + _202;
    bool _206 = !_158;
    float _208 = _200;
    if (!_206)
    {
        float _210 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _212 = log2(_210);
        float _214 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _216 = _214 + 1.0;
        float _218 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _220 = _180 * _212;
        float _222 = 1.0 / _216;
        float _224 = _218 * 0.693147182464599609375;
        float _226 = exp2(_220);
        float _228 = 1.0 / _224;
        float _230 = _226 + (-1.0);
        float _232 = -_230;
        float _234 = fma(_232, _228, _180);
        float _236 = _234 * _222;
        float _238 = _236 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _208 = _238;
    }
    float _240 = _208;
    bool _242 = !_158;
    if (!_242)
    {
        float _244 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _246 = log2(_244);
        float _248 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _250 = _248 + 1.0;
        float _252 = 1.0 / _250;
        float _254 = _180 * _246;
        float _256 = exp2(_254);
        float _258 = -_256;
        float _260 = _258 + 1.0;
        float _262 = _260 * _252;
        _184 = _262;
    }
    float _264 = _184;
    float _266 = in.m_53.w;
    int _268 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _270 = _268 != 0;
    int _272 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _274 = _272 != 0;
    float _276 = -_204;
    float _278 = fma(_276, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _280 = _204 < 0.5;
    float _282 = float(_280);
    float _284 = fma(_194, 0.5, 0.5);
    float _286 = in.m_44.x;
    float _288 = in.m_44.y;
    float _290 = in.m_44.z;
    bool _292 = !_270;
    int _294 = _292 ? 0 : 1;
    float _296 = _240 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _298 = -_282;
    float _300 = fma(_298, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _302 = !_162;
    int _304 = _302 ? 0 : 1;
    float _306 = -_284;
    float _308 = fma(_306, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _310 = abs(_294);
    float _312 = fma(_264, _168, _296);
    int _314 = abs(_304);
    float _316 = _240 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _318 = !_274;
    int _320 = _318 ? 0 : 1;
    float _322 = fma(_264, _170, _316);
    bool _324 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _326 = abs(_320);
    float _328 = _240 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _330 = float(_310);
    float _332 = float(_314);
    float _334 = fma(_264, _172, _328);
    float _336 = abs(_278);
    float _338 = _330 * _336;
    float _340 = fma(_312, _266, _286);
    float _342 = fma(_334, _266, _290);
    float _344 = float(_326);
    float _346 = fma(_332, _308, _338);
    float _348 = fma(_322, _266, _288);
    float _350 = abs(_300);
    float _352 = fma(_344, _350, _346);
    bool _354 = !_324;
    bool _356 = false;
    int _358 = as_type<int>(_352);
    float _374;
    if (!_354)
    {
        float _360 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _362 = _144 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _364 = fma(_362, (*spvDescriptorSet0.vp_c9)._m0[12].x, _124);
        float _366 = _364 * _360;
        float _368 = floor(_366);
        float _370 = -_368;
        float _372 = _366 + _370;
        _374 = _372;
        _376 = true;
    }
    else
    {
        float _378 = float(_90);
        float _380 = 1.0 / _378;
        float _382 = _124 * _380;
        _374 = _382;
    }
    _376 = false;
    float _384 = _374;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _388 = _384 + _386;
    bool _390 = _384 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _392 = isnan(_384);
    bool _394 = _390 || _392;
    bool _396 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _398 = _394 || _396;
    float _400 = float(_398);
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _404 = _384 + _402;
    bool _406 = _384 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _408 = isnan(_384);
    bool _410 = _406 || _408;
    bool _412 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _414 = _410 || _412;
    float _416 = float(_414);
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _420 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _418;
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _424 = _422 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _426 = _384 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _428 = isnan(_384);
    bool _430 = _426 || _428;
    bool _432 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _434 = _430 || _432;
    float _436 = float(_434);
    float _438 = -_400;
    float _440 = _438 + 1.0;
    float _442 = 1.0 / _424;
    float _444 = _436 * _440;
    float _446 = -_436;
    float _448 = _446 + 1.0;
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _452 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _450;
    bool _454 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _456 = 1.0 / _420;
    float _458 = _416 * _448;
    float _460 = -_416;
    float _462 = _460 + 1.0;
    float _464 = _404 * _442;
    float _466 = _388 * _456;
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _470 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _468;
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _474 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _472;
    float _476 = fma(_452, _466, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _478 = fma(_470, _466, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _480 = fma(_474, _466, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _482 = in.m_53.x;
    float _484 = in.m_53.y;
    float _486 = in.m_53.z;
    float _488 = _476 * _458;
    float _490 = _478 * _458;
    float _492 = _480 * _458;
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _496 = _494 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _500 = _498 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _504 = _502 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _506 = fma(_462, (*spvDescriptorSet0.vp_c9)._m0[143].x, _488);
    float _508 = fma(_496, _464, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _510 = fma(_500, _464, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _512 = fma(_504, _464, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _514 = fma(_462, (*spvDescriptorSet0.vp_c9)._m0[143].y, _490);
    float _516 = fma(_462, (*spvDescriptorSet0.vp_c9)._m0[143].z, _492);
    float _518 = fma(_508, _444, _506);
    float _520 = fma(_510, _444, _514);
    float _522 = fma(_512, _444, _516);
    float _524 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[145].x, _518);
    float _526 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[145].y, _520);
    float _528 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[145].z, _522);
    float _530 = _524 * _482;
    float _532 = _526 * _484;
    float _534 = _528 * _486;
    bool _536 = !_454;
    float _538 = _530;
    float _554;
    if (!_536)
    {
        float _540 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _542 = _144 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _544 = fma(_542, (*spvDescriptorSet0.vp_c9)._m0[11].x, _124);
        float _546 = _544 * _540;
        float _548 = floor(_546);
        float _550 = -_548;
        float _552 = _546 + _550;
        _554 = _552;
        _556 = true;
    }
    else
    {
        float _558 = float(_90);
        float _560 = 1.0 / _558;
        float _562 = _124 * _560;
        _554 = _562;
    }
    _556 = false;
    float _564 = _554;
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _568 = _564 + _566;
    bool _570 = _564 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _572 = isnan(_564);
    bool _574 = _570 || _572;
    bool _576 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _578 = _574 || _576;
    float _580 = float(_578);
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _584 = _564 + _582;
    bool _586 = _564 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _588 = isnan(_564);
    bool _590 = _586 || _588;
    bool _592 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _594 = _590 || _592;
    float _596 = float(_594);
    float _598 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _600 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _598;
    float _602 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _604 = _602 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _606 = _564 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _608 = isnan(_564);
    bool _610 = _606 || _608;
    bool _612 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _614 = _610 || _612;
    float _616 = float(_614);
    float _618 = -_580;
    float _620 = _618 + 1.0;
    float _622 = 1.0 / _604;
    float _624 = _616 * _620;
    float _626 = -_616;
    float _628 = _626 + 1.0;
    float _630 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _632 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _630;
    float _634 = 1.0 / _600;
    float _636 = _596 * _628;
    float _638 = -_596;
    float _640 = _638 + 1.0;
    float _642 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _644 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _646 = _584 * _622;
    float _648 = _568 * _634;
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _652 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _650;
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _656 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _654;
    float _658 = fma(_632, _648, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _660 = fma(_652, _648, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _662 = fma(_656, _648, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _664 = _658 * _636;
    float _666 = _660 * _636;
    float _668 = _662 * _636;
    float _670 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _672 = _670 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _674 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _676 = _674 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _678 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _680 = _678 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _682 = fma(_640, (*spvDescriptorSet0.vp_c9)._m0[107].x, _664);
    float _684 = fma(_640, (*spvDescriptorSet0.vp_c9)._m0[107].y, _666);
    float _686 = fma(_672, _646, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _688 = fma(_676, _646, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _690 = fma(_680, _646, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _692 = fma(_640, (*spvDescriptorSet0.vp_c9)._m0[107].z, _668);
    float _694 = fma(_686, _624, _682);
    float _696 = fma(_688, _624, _684);
    float _698 = fma(_690, _624, _692);
    float _700 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[109].x, _694);
    float _702 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[109].y, _696);
    float _704 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[109].z, _698);
    float _706 = _700 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _708 = _702 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _710 = _704 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _712 = _706 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _714 = _708 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _716 = _710 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_55.x = _712;
    out.m_55.y = _714;
    out.m_55.z = _716;
    out.m_55.w = _642;
    bool _718 = !_644;
    float _734;
    if (!_718)
    {
        float _720 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _722 = _144 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _724 = fma(_722, (*spvDescriptorSet0.vp_c9)._m0[11].z, _124);
        float _726 = _724 * _720;
        float _728 = floor(_726);
        float _730 = -_728;
        float _732 = _726 + _730;
        _734 = _732;
        _736 = true;
    }
    else
    {
        float _738 = float(_90);
        float _740 = 1.0 / _738;
        float _742 = _124 * _740;
        _734 = _742;
    }
    _736 = false;
    float _744 = _734;
    float _746 = in.m_57.x;
    float _748 = in.m_57.y;
    float _750 = in.m_57.z;
    float _752 = _352 * _532;
    float _754 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, 0.0166666693985462188720703125, _144);
    float _756 = _352 * _534;
    float _758 = _754 * 0.5;
    float _760 = _754 * 20.0;
    float _762 = _758 * 0.15915493667125701904296875;
    float _764 = _762 * 6.283185482025146484375;
    float _766 = sin(_764);
    float _768 = -_760;
    float _770 = fma(_748, 4.3982295989990234375, _768);
    float _772 = precise::max(_748, -0.60352802276611328125);
    float _774 = _770 * 0.15915493667125701904296875;
    float _776 = precise::min(_772, 1.20902001857757568359375);
    float _778 = _774 * 6.283185482025146484375;
    float _780 = sin(_778);
    float _782 = fma(_776, 0.55170953273773193359375, 0.33297216892242431640625);
    float _784 = _782 * _782;
    float _786 = _748 * _748;
    float _788 = fma(_766, 0.07500000298023223876953125, 0.324999988079071044921875);
    float _790 = fma(_784, 0.75, 0.25);
    float _792 = _780 * _788;
    float _794 = _352 * _530;
    float _796 = fma(_790, _792, _746);
    float _798 = fma(_796, _796, _786);
    float _800 = fma(_750, _750, _798);
    float _802 = rsqrt(_800);
    float _804 = _796 * _802;
    float _806 = _802 * _748;
    float _808 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _810 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _808;
    float _812 = abs(_804);
    float _814 = abs(_806);
    float _816 = precise::max(_812, _814);
    bool _818 = _816 >= 16.0;
    int _820 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _822 = _820 != 0;
    float _824 = _806;
    float _826 = _804;
    int _828 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    if (_818)
    {
        float _830 = _806 * 0.0625;
        _824 = _830;
    }
    float _832 = _824;
    if (_818)
    {
        float _834 = _804 * 0.0625;
        _826 = _834;
    }
    float _836 = _826;
    float _838 = abs(_832);
    bool _840 = _838 != 0.0;
    bool _842 = isnan(_838);
    bool _844 = _840 || _842;
    bool _846 = isnan(0.0);
    bool _848 = _844 || _846;
    float _850 = abs(_836);
    bool _852 = _850 == 0.0;
    float _854 = abs(_836);
    bool _856 = _854 == 0.0;
    bool _858 = !_848;
    bool _860 = _856 && _858;
    if (_860)
    {
        bool _862 = as_type<int>(_836) >= 0;
        _356 = _862;
    }
    bool _864 = _356;
    int _866 = _864 ? (-1) : 0;
    if (_860)
    {
        int _868 = _864 ? 0 : 1078530011;
        _828 = _868;
    }
    int _870 = _828;
    if (_860)
    {
        int _872 = int(0x80000000) & as_type<int>(_832);
        int _874 = _870 | _872;
        _538 = as_type<float>(_874);
    }
    float _876 = _538;
    bool _878 = !_848;
    bool _880 = _878 && _852;
    float _882 = _876;
    float _884 = _876;
    if (!_880)
    {
        float _886 = abs(_832);
        bool _888 = _886 != as_type<float>(0x7f800000u /* inf */);
        bool _890 = isnan(_886);
        bool _892 = _888 || _890;
        bool _894 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _896 = _892 || _894;
        float _898 = abs(_836);
        bool _900 = _898 == as_type<float>(0x7f800000u /* inf */);
        float _902 = abs(_836);
        bool _904 = _902 == as_type<float>(0x7f800000u /* inf */);
        bool _906 = !_896;
        bool _908 = _904 && _906;
        if (_908)
        {
            bool _910 = as_type<int>(_836) >= 0;
            _866 = _910 ? (-1) : 0;
        }
        int _912 = _866;
        if (_908)
        {
            _358 = 1075235812;
        }
        int _914 = _358;
        int _916 = _914;
        if (_908)
        {
            int _918 = ~_912;
            int _920 = (_918 != 0) ? _914 : 1061752795;
            _916 = _920;
        }
        int _922 = _916;
        if (_908)
        {
            int _924 = int(0x80000000) & as_type<int>(_832);
            int _926 = _922 | _924;
            _882 = as_type<float>(_926);
        }
        float _928 = _882;
        bool _930 = !_896;
        bool _932 = _930 && _900;
        _884 = _928;
        if (!_932)
        {
            float _934 = abs(_836);
            float _936 = abs(_832);
            float _938 = precise::max(_934, _936);
            float _940 = abs(_836);
            float _942 = abs(_832);
            float _944 = precise::min(_940, _942);
            float _946 = 1.0 / _938;
            float _948 = abs(_832);
            float _950 = abs(_836);
            bool _952 = _948 > _950;
            bool _954 = as_type<int>(_836) >= 0;
            float _956 = _944 * _946;
            float _958 = _956 * _956;
            float _960 = _958 + 11.33538818359375;
            float _962 = fma(_958, _960, 28.84246826171875);
            float _964 = fma(_958, _962, 19.6966705322265625);
            float _966 = fma(_958, -0.82336294651031494140625, -5.674867153167724609375);
            float _968 = fma(_958, _966, -6.565555095672607421875);
            float _970 = 1.0 / _964;
            float _972 = _958 * _968;
            float _974 = abs(_836);
            float _976 = abs(_832);
            float _978 = _974 + _976;
            int _980 = as_type<int>(_832) & int(0x80000000);
            float _982 = _956 * _972;
            bool _984 = _978 > as_type<float>(0x7f800000u /* inf */);
            bool _986 = isnan(_978);
            bool _988 = _984 || _986;
            bool _990 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _992 = _988 || _990;
            float _994 = fma(_982, _970, _956);
            float _996 = _994;
            _884 = _978;
            if (_952)
            {
                float _998 = -_994;
                float _1000 = _998 + 1.57079637050628662109375;
                _996 = _1000;
            }
            float _1002 = _996;
            int _1004 = as_type<int>(_1002);
            if (!_954)
            {
                float _1006 = -_1002;
                float _1008 = _1006 + 3.1415927410125732421875;
                _1004 = as_type<int>(_1008);
            }
            int _1010 = _1004;
            if (!_992)
            {
                int _1012 = _980 | _1010;
                _884 = as_type<float>(_1012);
            }
        }
    }
    float _1014 = _884;
    float _1016 = 1.0 / _810;
    float _1018 = _348 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1020 = _348 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1022 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1024 = _1022 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1026 = _348 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1028 = in.m_51.z;
    float _1030 = fma(_754, 4.0, _1014);
    float _1032 = fma(_340, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1018);
    float _1034 = 1.0 / _1024;
    float _1036 = fma(_340, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1020);
    float _1038 = fma(_340, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1026);
    float _1040 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1042 = _744 + _1040;
    float _1044 = in.m_59.y;
    float _1046 = _1030 * 3.0;
    float _1048 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1050 = _744 + _1048;
    float _1052 = in.m_51.y;
    float _1054 = _1042 * _1016;
    float _1056 = _1046 * 0.15915493667125701904296875;
    float _1058 = fma(_342, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1038);
    float _1060 = fma(_342, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1032);
    int _1062 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1064 = _1062 != 0;
    float _1066 = _1056 * 6.283185482025146484375;
    float _1068 = sin(_1066);
    float _1070 = _1050 * _1034;
    float _1072 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1074 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1072;
    int _1076 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1078 = _1076 != 0;
    float _1080 = fma(_342, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1036);
    int _1082 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1084 = _1082 != 0;
    float _1086 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1088 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1086;
    int _1090 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1092 = _1090 != 0;
    float _1094 = in.m_59.x;
    float _1096 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
    float _1098 = _1036;
    float _1100 = (*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1102 = _1080;
    if (_822)
    {
        _1096 = _144;
    }
    float _1104 = _1096;
    float _1106 = fma(_1074, _1054, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1108 = -_1044;
    float _1110 = _1108 + 1.0;
    bool _1112 = _1028 > 0.5;
    float _1114 = fma(_1088, _1054, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1116 = _1104;
    float _1118 = _1044;
    bool _1120 = _1112;
    if (!_822)
    {
        _1116 = _1028;
    }
    float _1122 = _1116;
    float _1124 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1126 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1124;
    float _1128 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1130 = _1068 * 0.20000000298023223876953125;
    bool _1132 = _1052 > 0.5;
    float _1134 = fma(_1126, _1054, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1136 = fma(_1052, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1128);
    float _1138 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1140 = _1130;
    if (_822)
    {
        _1098 = _1052;
    }
    float _1142 = _1098;
    float _1144 = _790 * _1130;
    int _1146 = _1112 ? as_type<int>(_1110) : as_type<int>(_1044);
    float _1148 = _752 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1150 = fma(_796, _1144, _796);
    float _1152 = _1084 ? as_type<float>(_1146) : _1044;
    float _1154 = fma(_1144, _750, _750);
    float _1156 = _1142;
    if (_1092)
    {
        float _1158 = _1132 ? _1110 : _1044;
        _1118 = _1158;
    }
    float _1160 = _1118;
    float _1162 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1164 = fma(_1144, _748, _748);
    if (_1064)
    {
        bool _1166 = _144 > 0.5;
        _1120 = _1166;
    }
    bool _1168 = _1120;
    float _1170 = _756 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1172 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1162);
    if (!_822)
    {
        _1156 = _144;
    }
    float _1174 = _1156;
    float _1176 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1164);
    float _1178 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1180 = _1178 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1182 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1150);
    float _1184 = _1138 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1186 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1154);
    float _1188 = _794 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1190 = _1148 * _1176;
    float _1192 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1194 = _1192 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1196 = fma(_1152, _1184, -0.5);
    float _1198 = _1170 * _1186;
    float _1200 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1202 = _1200 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1204 = _1188 * _1182;
    float _1206 = _1190 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1208 = _1190 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _1210 = as_type<int>(_1174);
    if (!_1064)
    {
        _1100 = _1094;
    }
    float _1212 = _1100;
    float _1214 = _1058 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1216 = fma(_1204, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1206);
    float _1218 = fma(_1204, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1208);
    float _1220 = _1212;
    if (!_1064)
    {
        _1140 = _1212;
    }
    float _1222 = _1140;
    float _1224 = fma(_1194, _1070, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1226 = _1222;
    if (_1064)
    {
        _1220 = _1094;
    }
    float _1228 = _1220;
    float _1230 = fma(_1198, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1218);
    bool _1232 = _744 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1234 = isnan(_744);
    bool _1236 = _1232 || _1234;
    bool _1238 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1240 = _1236 || _1238;
    float _1242 = float(_1240);
    float _1244 = fma(_1202, _1070, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    bool _1246 = _744 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1248 = isnan(_744);
    bool _1250 = _1246 || _1248;
    bool _1252 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1254 = _1250 || _1252;
    float _1256 = float(_1254);
    float _1258 = _1230 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    bool _1260 = _744 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1262 = isnan(_744);
    bool _1264 = _1260 || _1262;
    bool _1266 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1268 = _1264 || _1266;
    float _1270 = float(_1268);
    float _1272 = fma(_1198, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1216);
    float _1274 = _1060 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1276 = _1214 + _1258;
    float _1278 = -_1256;
    float _1280 = _1278 + 1.0;
    float _1282 = _1272 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1284 = -_1270;
    float _1286 = _1284 + 1.0;
    float _1288 = fma(_1180, _1070, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1290 = _1242 * _1280;
    float _1292 = _1274 + _1282;
    float _1294 = _1256 * _1286;
    float _1296 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1298 = _1276 + _1296;
    float _1300 = _1122 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1302 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1304 = _1292 + _1302;
    float _1306 = _1298 * _1298;
    float _1308 = _1134 * _1290;
    float _1310 = _1304 * _1304;
    float _1312 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1314 = _1190 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1316 = _1310 + _1306;
    float _1318 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1320 = -_1312;
    float _1322 = fma(_1300, 2.0, _1320);
    float _1324 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1326 = _1174 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _1328 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[87].y);
    float _1330 = _1290;
    float _1332 = _1310;
    float _1334 = _1306;
    float _1336 = _1292;
    float _1338 = _1276;
    float _1340 = _1298;
    if (_1078)
    {
        float _1342 = -_1228;
        float _1344 = _1342 + 1.0;
        _1328 = as_type<int>(_1344);
    }
    int _1346 = _1328;
    float _1348 = _1106 * _1290;
    if (_1064)
    {
        float _1350 = -_1228;
        float _1352 = _1350 + 1.0;
        _1210 = as_type<int>(_1352);
    }
    int _1354 = _1210;
    float _1356 = _1114 * _1290;
    float _1358 = sqrt(_1316);
    float _1360 = -_1242;
    float _1362 = _1360 + 1.0;
    if (!_1078)
    {
        _1330 = _1228;
    }
    float _1364 = _1330;
    float _1366 = fma(_1326, -2.0, _1324);
    float _1368 = fma(_1204, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1314);
    float _1370 = _1364;
    if (_1078)
    {
        float _1372 = _1132 ? as_type<float>(_1346) : _1228;
        _1370 = _1372;
    }
    float _1374 = _1370;
    float _1376 = fma(_1362, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1356);
    if (_1064)
    {
        float _1378 = _1168 ? as_type<float>(_1354) : _1228;
        _1226 = _1378;
    }
    float _1380 = _1226;
    float _1382 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1172);
    float _1384 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1136);
    float _1386 = -_124;
    float _1388 = fma(_1386, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1322);
    float _1390 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1366);
    float _1392 = fma(_1198, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1368);
    float _1394 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1396 = _1080 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1398 = fma(_1362, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1348);
    bool _1400 = _1358 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1402 = _1392 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1404 = _1318 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1406 = fma(_1362, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1308);
    float _1408 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1410 = _1396 + _1402;
    float _1412 = fma(_1224, _1294, _1398);
    float _1414 = fma(_1244, _1294, _1376);
    float _1416 = fma(_1404, _1374, -0.5);
    if (!_1400)
    {
        _1102 = _1410;
    }
    float _1418 = _1102;
    bool _1420 = !_1400;
    float _1422 = _1418;
    if (!_1420)
    {
        float _1424 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1426 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1428 = _1358 + _1426;
        float _1430 = _1410 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1432 = rsqrt(_1316);
        float _1434 = _1428 * _1424;
        float _1436 = _1434 * 0.15915493667125701904296875;
        float _1438 = _1436 * 6.283185482025146484375;
        float _1440 = sin(_1438);
        float _1442 = _1436 * 6.283185482025146484375;
        float _1444 = cos(_1442);
        float _1446 = fma(_1440, _1430, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1448 = _1432 * _1446;
        float _1450 = fma(_1304, _1448, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1452 = _1444 + (-1.0);
        float _1454 = fma(_1298, _1448, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1456 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1458 = _1450 + _1456;
        float _1460 = _1452 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1462 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1464 = _1454 + _1462;
        float _1466 = _1458 * _1458;
        float _1468 = fma(_1410, _1444, _1460);
        float _1470 = _1464 * _1464;
        _1422 = _1468;
        _1332 = _1466;
        _1334 = _1470;
        _1336 = _1450;
        _1338 = _1454;
    }
    float _1472 = _1422;
    float _1474 = _1332;
    float _1476 = _1334;
    float _1478 = _1336;
    float _1480 = _1338;
    float _1482 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1484 = _1472 + _1482;
    float _1486 = fma(_1288, _1294, _1406);
    float _1488 = fma(_1270, (*spvDescriptorSet0.vp_c9)._m0[125].x, _1412);
    float _1490 = fma(_1270, (*spvDescriptorSet0.vp_c9)._m0[125].y, _1414);
    float _1492 = fma(_1484, _1484, _1474);
    float _1494 = fma(_1270, (*spvDescriptorSet0.vp_c9)._m0[125].z, _1486);
    float _1496 = _1160 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1498 = _1380 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1500 = _1492 + _1476;
    float _1502 = -_1390;
    float _1504 = fma(_1384, _1196, _1502);
    float _1506 = fma(_1382, _1416, _1388);
    float _1508 = _1488 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1510 = _1490 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1512 = _1494 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1514 = sqrt(_1500);
    float _1516 = _1496 * _1408;
    float _1518 = _1498 * _1394;
    float _1520 = _1504 + 0.5;
    float _1522 = _1506 + 0.5;
    float _1524 = _1508 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1526 = _1510 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1528 = _1512 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_61.x = _1518;
    out.m_61.y = _1516;
    out.m_63.x = _1522;
    out.m_63.y = _1520;
    out.m_65.x = _1524;
    out.m_65.y = _1526;
    out.m_65.z = _1528;
    bool _1530 = _1514 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1532 = isnan(_1514);
    bool _1534 = _1530 || _1532;
    bool _1536 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1538 = _1534 || _1536;
    out.m_67.y = _1164;
    float _1540 = _1504;
    if (!_1538)
    {
        _1540 = 1.0;
    }
    float _1542 = _1540;
    bool _1544 = !_1538;
    float _1546 = _1542;
    if (!_1544)
    {
        bool _1548 = _1514 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1550 = isnan(_1514);
        bool _1552 = _1548 || _1550;
        bool _1554 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1556 = _1552 || _1554;
        if (!_1556)
        {
            float _1558 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1560 = _1514 + _1558;
            float _1562 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1564 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1562;
            float _1566 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1568 = _1566 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1570 = 1.0 / _1564;
            float _1572 = _1560 * _1570;
            float _1574 = fma(_1572, _1568, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1546 = _1574;
            _1576 = true;
        }
        else
        {
            bool _1578 = _1514 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1580 = isnan(_1514);
            bool _1582 = _1578 || _1580;
            bool _1584 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1586 = _1582 || _1584;
            if (!_1586)
            {
                float _1588 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1590 = _1514 + _1588;
                float _1592 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1594 = _1592 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1596 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1598 = _1596 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1600 = 1.0 / _1594;
                float _1602 = _1590 * _1600;
                float _1604 = fma(_1602, _1598, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1546 = _1604;
                _1576 = true;
            }
            else
            {
                _1546 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1576 = false;
    float _1606 = _1546;
    float _1608 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1610 = _1472 + _1608;
    float _1612 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1614 = _1478 + _1612;
    float _1616 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1618 = _1480 + _1616;
    float _1620 = fma(_1610, _1606, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1622 = fma(_1614, _1606, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1624 = fma(_1618, _1606, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1626 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1628 = _1620 + _1626;
    float _1630 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1632 = _1622 + _1630;
    float _1634 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1636 = _1624 + _1634;
    float _1638 = _1628 * _1628;
    float _1640 = fma(_1632, _1632, _1638);
    float _1642 = fma(_1636, _1636, _1640);
    float _1644 = rsqrt(_1642);
    float _1646 = sqrt(_1642);
    float _1648 = _1644 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1650 = _1632 * _1648;
    float _1652 = _1636 * _1648;
    float _1654 = _1650 * _1650;
    float _1656 = _1652 * _1652;
    float _1658 = _1654 + _1656;
    float _1660 = sqrt(_1658);
    bool _1662 = _1660 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1664 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1666 = _1660 + _1664;
    float _1668 = _1506;
    float _1670 = _1658;
    float _1672 = _1666;
    float _1674 = _1628;
    float _1676 = _1648;
    float _1678 = _1650;
    if (_1662)
    {
        float _1680 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1668 = _1680;
    }
    float _1682 = _1668;
    if (_1662)
    {
        float _1684 = rsqrt(_1658);
        _1670 = _1684;
    }
    float _1686 = _1670;
    float _1688 = _1682;
    if (_1662)
    {
        float _1690 = _1666 * _1682;
        _1672 = _1690;
    }
    float _1692 = _1672;
    if (_1662)
    {
        float _1694 = _1692 * 0.15915493667125701904296875;
        _1688 = _1694;
    }
    float _1696 = _1688;
    float _1698 = _1644;
    float _1700 = _1696;
    if (_1662)
    {
        float _1702 = _1696 * 6.283185482025146484375;
        float _1704 = sin(_1702);
        _1698 = _1704;
    }
    float _1706 = _1698;
    float _1708 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1710 = precise::max(0.0, _1708);
    float _1712 = _1636;
    float _1714 = _1710;
    if (_1662)
    {
        float _1716 = _1696 * 6.283185482025146484375;
        float _1718 = cos(_1716);
        _1712 = _1718;
    }
    float _1720 = _1712;
    float _1722 = -_1648;
    float _1724 = -_1710;
    float _1726 = fma(_1628, _1722, _1724);
    if (_1662)
    {
        float _1728 = _1726 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1674 = _1728;
    }
    float _1730 = _1674;
    float _1732 = _1730;
    if (!_1662)
    {
        _1700 = _1654;
    }
    float _1734 = _1700;
    float _1736 = _1706;
    float _1738 = _1734;
    if (_1662)
    {
        float _1740 = fma(_1706, _1730, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1732 = _1740;
    }
    float _1742 = _1732;
    float _1744 = _1742;
    if (!_1662)
    {
        _1736 = _1726;
    }
    float _1746 = _1736;
    float _1748 = _1746;
    if (_1662)
    {
        float _1750 = _1720 + (-1.0);
        _1714 = _1750;
    }
    float _1752 = _1714;
    float _1754 = _1752;
    if (_1662)
    {
        float _1756 = _1686 * _1742;
        _1340 = _1756;
    }
    float _1758 = _1340;
    if (!_1662)
    {
        _1744 = _1652;
    }
    float _1760 = _1744;
    float _1762 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1764 = _1760;
    if (_1662)
    {
        float _1766 = _1752 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1676 = _1766;
    }
    float _1768 = _1676;
    if (_1662)
    {
        float _1770 = _1650 * _1758;
        _1678 = _1770;
    }
    float _1772 = _1678;
    if (_1662)
    {
        float _1774 = _1652 * _1758;
        _1764 = _1774;
    }
    float _1776 = _1764;
    if (!_1662)
    {
        _1754 = _1656;
    }
    float _1778 = _1754;
    float _1780 = _1778;
    if (_1662)
    {
        float _1782 = fma(_1726, _1720, _1768);
        _1748 = _1782;
    }
    float _1784 = _1748;
    if (_1662)
    {
        float _1786 = _1772 * _1772;
        _1738 = _1786;
    }
    float _1788 = _1738;
    if (_1662)
    {
        float _1790 = _1776 * _1776;
        _1780 = _1790;
    }
    float _1792 = _1780;
    float _1794 = fma(_1784, _1784, _1788);
    float _1796 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1798 = fma(_1646, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1796);
    float _1800 = precise::clamp(_1798, 0.0, 1.0);
    float _1802 = _1794 + _1792;
    float _1804 = _1620 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1806 = _1620 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1808 = -_1800;
    float _1810 = _1808 + 1.0;
    float _1812 = rsqrt(_1802);
    float _1814 = fma(_1622, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1804);
    float _1816 = fma(_1622, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1806);
    float _1818 = fma(_1624, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1814);
    float _1820 = _1620 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1822 = fma(_1624, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1816);
    float _1824 = abs(_1810);
    float _1826 = log2(_1824);
    float _1828 = _1620 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1830 = fma(_1622, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1820);
    float _1832 = _1822 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1834 = _1818 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1836 = fma(_1622, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1828);
    float _1838 = fma(_1624, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1830);
    float _1840 = _1812 * _1772;
    float _1842 = _1812 * _1784;
    float _1844 = _1838 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1846 = _1832 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1848 = _1840 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1850 = _1812 * _1776;
    float _1852 = fma(_1624, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1836);
    float _1854 = fma(_1844, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1846);
    float _1856 = -_1848;
    float _1858 = fma(_1842, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1856);
    float _1860 = _1834 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1862 = _1852 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1864 = fma(_1834, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1854);
    float _1866 = -_1850;
    float _1868 = fma(_1866, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1858);
    float _1870 = -_1860;
    float _1872 = fma(_1870, _1762, 1.0);
    float _1874 = _1826 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1876 = fma(_1862, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1864);
    float _1878 = fma(_1868, -0.5, 0.5);
    float _1880 = _1832 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1882 = exp2(_1874);
    float _1884 = _1832 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1886 = fma(_1868, 0.5, 0.5);
    float _1888 = fma(_1844, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1880);
    float _1890 = _1842 + 1.0;
    float _1892 = fma(_1844, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1884);
    float _1894 = fma(_1886, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1896 = log2(_1872);
    float _1898 = fma(_1834, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1888);
    float _1900 = fma(_1834, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1892);
    float _1902 = fma(_1886, _1894, -0.212114393711090087890625);
    float _1904 = fma(_1862, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1898);
    float _1906 = fma(_1862, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1900);
    float _1908 = fma(_1886, _1902, 1.570728778839111328125);
    float _1910 = 1.0 / _1876;
    float _1912 = -_1842;
    float _1914 = fma(_1882, _1890, _1912);
    float _1916 = fma(_1914, 0.5, 0.5);
    float _1918 = sqrt(_1878);
    float _1920 = _1896 * 0.693147182464599609375;
    float _1922 = _1904 * _1910;
    float _1924 = _1906 * _1910;
    float _1926 = _1920 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1928 = fma(_1922, 0.5, 0.5);
    float _1930 = fma(_1924, -0.5, 0.5);
    float _1932 = _1918 * 0.636619746685028076171875;
    float _1934 = -_1908;
    float _1936 = fma(_1932, _1934, 1.0);
    float3 _5243 = float3(_1928, _1930, _1926);
    float _1938 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5243, float3(0.0), isnan(_5243)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5243, float3(0.0), isnan(_5243)), level(0.0)).x;
    float3 _5254 = float3(_1928, _1930, _1926);
    float4 _1941 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5254, float3(0.0), isnan(_5254)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5254, float3(0.0), isnan(_5254)), level(0.0)).xyzw;
    float _1943 = _1941.x;
    float _1945 = _1941.y;
    float _1947 = _1941.z;
    float _1949 = _1941.w;
    float2 _5271 = float2(_1936, _1916);
    float3 _1953 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5271, float2(0.0), isnan(_5271)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5271, float2(0.0), isnan(_5271)), level(0.0)).xyz;
    float _1955 = _1953.x;
    float _1957 = _1953.y;
    float _1959 = _1953.z;
    float _1961 = _1396 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1963 = _1396 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1965 = fma(_1274, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1961);
    float _1967 = fma(_1274, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1963);
    float _1969 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1965);
    float _1971 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1967);
    float _1973 = _1969 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1975 = _1971 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1977 = 1.0 / _1973;
    float _1979 = _1975 + _1973;
    float _1981 = _1979 * _1977;
    float _1983 = _1981 * 0.5;
    float _1985 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1987 = fma(_1983, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1985);
    float _1989 = _1832 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1991 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1993 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1995 = _1991 || _1993;
    bool _1997 = isnan(0.5);
    bool _1999 = _1995 || _1997;
    float _2001 = _1826 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2003 = 1.0 / _1987;
    float _2005 = fma(_1844, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1989);
    float _2007 = fma(_1834, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2005);
    float _2009 = exp2(_2001);
    float _2011 = fma(_1862, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2007);
    float _2013 = _1826;
    float _2015 = _2005;
    if (_1999)
    {
        _2013 = 1.0;
    }
    float _2017 = _2013;
    float _2019 = _2017;
    if (_1999)
    {
        _2015 = 1.0;
    }
    float _2021 = _2015;
    float _2023 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2025 = _2003 * _2023;
    float _2027 = _2021;
    if (!_1999)
    {
        float _2029 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2031 = _2029 * 0.15915493667125701904296875;
        float _2033 = _2031 * 6.283185482025146484375;
        float _2035 = cos(_2033);
        float _2037 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2039 = _2037 * 0.15915493667125701904296875;
        float _2041 = _2031 * 6.283185482025146484375;
        float _2043 = sin(_2041);
        float _2045 = 1.0 / _2035;
        float _2047 = _2039 * 6.283185482025146484375;
        float _2049 = cos(_2047);
        float _2051 = _2043 * _2045;
        float _2053 = _2039 * 6.283185482025146484375;
        float _2055 = sin(_2053);
        float _2057 = _2049 * _2051;
        float _2059 = 1.0 / _2057;
        float _2061 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2063 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2061;
        float _2065 = 1.0 / _2063;
        float _2067 = _2055 * _2059;
        float _2069 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2071 = fma(_2025, _2067, _2069);
        float _2073 = _2071 * _2065;
        float _2075 = precise::clamp(_2073, 0.0, 1.0);
        _2019 = _2075;
    }
    float _2077 = _2019;
    if (!_1999)
    {
        float _2079 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2081 = _2079 * 0.15915493667125701904296875;
        float _2083 = _2081 * 6.283185482025146484375;
        float _2085 = cos(_2083);
        float _2087 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2089 = _2087 * 0.15915493667125701904296875;
        float _2091 = _2081 * 6.283185482025146484375;
        float _2093 = sin(_2091);
        float _2095 = 1.0 / _2085;
        float _2097 = _2089 * 6.283185482025146484375;
        float _2099 = cos(_2097);
        float _2101 = _2093 * _2095;
        float _2103 = _2089 * 6.283185482025146484375;
        float _2105 = sin(_2103);
        float _2107 = _2099 * _2101;
        float _2109 = 1.0 / _2107;
        float _2111 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2113 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2111;
        float _2115 = 1.0 / _2113;
        float _2117 = _2105 * _2109;
        float _2119 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2121 = fma(_2025, _2117, _2119);
        float _2123 = _2121 * _2115;
        float _2125 = precise::clamp(_2123, 0.0, 1.0);
        float _2127 = -_2125;
        float _2129 = _2127 + 1.0;
        _2027 = _2129;
    }
    float _2131 = _2027;
    float _2133 = -_2009;
    float _2135 = _2133 + 1.0;
    bool _2137 = _2077 > 0.0;
    bool _2139 = isnan(_2077);
    bool _2141 = _2137 || _2139;
    bool _2143 = isnan(0.0);
    bool _2145 = _2141 || _2143;
    float _2147 = _2077 * _2131;
    float _2149 = _1876 * 0.5;
    float _2151 = _2135 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _2153 = _2131 <= 0.0;
    bool _2155 = !_2145;
    bool _2157 = _2153 || _2155;
    float _2159 = _2011 + _1876;
    float _2161 = _1904 + _1876;
    float _2163 = _2151 * _1938;
    float _2165 = _2147 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2167 = -_2151;
    float _2169 = _2167 + 1.0;
    float _2171 = fma(_1906, -0.5, _2149);
    float _2173 = _1949 * _2163;
    float _2175 = _1959 * _2163;
    float _2177 = _2159 * 0.5;
    float _2179 = _2161 * 0.5;
    float _2181 = _2165 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2183 = fma(_1955, _2173, _1943);
    float _2185 = fma(_1957, _2173, _1945);
    float _2187 = _1949 * _2169;
    float _2189 = fma(_1949, _2175, _1947);
    out.gl_Position.x = _1904;
    out.gl_Position.y = _1906;
    out.gl_Position.z = _2011;
    out.gl_Position.w = _1876;
    out.m_69.x = _2179;
    out.m_69.y = _2171;
    out.m_69.z = _2177;
    out.m_69.w = _1876;
    out.m_47.x = _2181;
    out.m_71.x = _2183;
    out.m_71.y = _2185;
    out.m_71.z = _2189;
    out.m_71.w = _2187;
    if (!_2157)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _2191 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2191;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}


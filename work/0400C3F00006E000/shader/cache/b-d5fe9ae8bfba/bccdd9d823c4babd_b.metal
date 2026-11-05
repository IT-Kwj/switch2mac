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
    constant _16* vp_c10 [[id(1)]];
    constant _16* vp_c8 [[id(2)]];
    constant _16* vp_c13 [[id(3)]];
    constant _16* vp_c15 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    texture2d<float> vp_t_tcb_24 [[id(6)]];
    sampler vp_t_tcb_24Smplr [[id(7)]];
    texture3d<float> vp_t_tcb_32 [[id(8)]];
    sampler vp_t_tcb_32Smplr [[id(9)]];
    texture3d<float> vp_t_tcb_30 [[id(10)]];
    sampler vp_t_tcb_30Smplr [[id(11)]];
    texture2d<float> vp_t_tcb_1C [[id(12)]];
    sampler vp_t_tcb_1CSmplr [[id(13)]];
    sampler vp_t_tcb_24Smplr_w [[id(14)]];
    sampler vp_t_tcb_32Smplr_w [[id(15)]];
    sampler vp_t_tcb_30Smplr_w [[id(16)]];
    sampler vp_t_tcb_1CSmplr_w [[id(17)]];
    constant dm_border_t* dm_border [[id(18)]];
};

struct main0_out
{
    float4 m_74 [[user(locn0)]];
    float4 m_68 [[user(locn1)]];
    float4 m_70 [[user(locn2)]];
    float4 m_76 [[user(locn3)]];
    float4 m_90 [[user(locn4)]];
    float4 m_84 [[user(locn5)]];
    float4 m_96 [[user(locn6)]];
    float4 m_92 [[user(locn7)]];
    float4 m_72 [[user(locn8)]];
    float4 m_51 [[user(locn9)]];
    float4 m_78 [[user(locn10)]];
    float4 m_88 [[user(locn11)]];
    float4 m_53 [[user(locn12)]];
    float4 m_94 [[user(locn13)]];
    float4 m_82 [[user(locn14)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_86 [[attribute(0)]];
    float4 m_62 [[attribute(1)]];
    float4 m_64 [[attribute(2)]];
    float4 m_66 [[attribute(3)]];
    float4 m_80 [[attribute(4)]];
    float4 m_46 [[attribute(5)]];
    float4 m_48 [[attribute(6)]];
    float4 m_58 [[attribute(7)]];
    float4 m_60 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2987 = false;
    bool _213 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _110 = in.m_46.w;
    float _112 = in.m_48.w;
    float _114 = trunc(_110);
    int _117 = int(_114);
    float _119 = -_112;
    float _121 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _121;
    bool _125 = _117 >= 1;
    float _127 = 0.0;
    float _129 = as_type<float>(_117);
    float _131 = _121;
    if (!_125)
    {
        _127 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _133 = _127;
    if (!_125)
    {
        out.m_53.x = 0.0;
    }
    int _135 = 0;
    if (!_125)
    {
        float _137 = _133 * 5.0;
        _135 = as_type<int>(_137);
    }
    int _139 = _135;
    int _141 = _139;
    if (!_125)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3304 = as_type<float>(_139);
        out.gl_Position.z = _3304;
    }
    if (!_125)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _143 = _112 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _145 = isnan(_112);
    bool _147 = _143 || _145;
    bool _149 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _151 = _147 || _149;
    float _153 = float(_117);
    bool _155 = _121 >= _153;
    bool _157 = !_151;
    bool _159 = _155 || _157;
    if (_159)
    {
        _129 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _161 = _129;
    if (_159)
    {
        out.m_53.x = 0.0;
    }
    if (_159)
    {
        float _163 = _161 * 5.0;
        _141 = as_type<int>(_163);
    }
    int _165 = _141;
    if (_159)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3359 = as_type<float>(_165);
        out.gl_Position.z = _3359;
    }
    if (_159)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _167 = as_type<float>(int(gl_VertexIndex));
    float _169 = 1.0 / _153;
    bool _171 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _173 = _121 * _169;
    int _175 = as_type<int>(_167) & 1;
    bool _177 = _175 != 0;
    int _179 = as_type<int>(_167) & 2;
    bool _181 = _179 != 0;
    bool _183 = !_177;
    float _185 = _183 ? (-0.5) : 0.5;
    bool _187 = !_181;
    float _189 = _187 ? (-0.5) : 0.5;
    bool _191 = !_171;
    float _193 = _173;
    float _211;
    if (!_191)
    {
        float _195 = in.m_58.x;
        float _197 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _199 = _195 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _201 = fma(_199, (*spvDescriptorSet0.vp_c9)._m0[12].x, _121);
        float _203 = _201 * _197;
        float _205 = floor(_203);
        float _207 = -_205;
        float _209 = _203 + _207;
        _211 = _209;
        _213 = true;
    }
    else
    {
        _211 = _173;
    }
    _213 = false;
    float _215 = _211;
    float _217 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _219 = _215 + _217;
    float _221 = in.m_60.x;
    float _223 = in.m_60.y;
    bool _225 = _215 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _227 = isnan(_215);
    bool _229 = _225 || _227;
    bool _231 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _233 = _229 || _231;
    float _235 = float(_233);
    float _237 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _239 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _237;
    bool _241 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _243 = 1.0 / _239;
    float _245 = -_235;
    float _247 = _245 + 1.0;
    float _249 = _219 * _243;
    bool _251 = _215 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _253 = isnan(_215);
    bool _255 = _251 || _253;
    bool _257 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _259 = _255 || _257;
    float _261 = float(_259);
    float _263 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _265 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _263;
    float _267 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _269 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _267;
    float _271 = _261 * _247;
    float _273 = fma(_265, _249, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _275 = fma(_269, _249, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _277 = -_261;
    float _279 = _277 + 1.0;
    float _281 = _273 * _271;
    float _283 = _275 * _271;
    float _285 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[143].x, _281);
    float _287 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[143].y, _283);
    float _289 = fma(_235, (*spvDescriptorSet0.vp_c9)._m0[144].x, _285);
    float _291 = fma(_235, (*spvDescriptorSet0.vp_c9)._m0[144].y, _287);
    float _293 = _289 * _221;
    float _295 = _291 * _223;
    bool _297 = !_241;
    if (!_297)
    {
        float _299 = in.m_58.x;
        float _301 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _303 = _299 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _305 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[11].y, _121);
        float _307 = _305 * _301;
        float _309 = floor(_307);
        float _311 = -_309;
        float _313 = _307 + _311;
        _193 = _313;
    }
    float _315 = _193;
    float _317 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _319 = int(_317);
    float _321 = in.m_62.x;
    float _323 = in.m_62.y;
    float _325 = in.m_62.z;
    float _327 = in.m_62.w;
    float _329 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _331 = int(_329);
    float _333 = float(_319);
    float _335 = 1.0 / _333;
    float _337 = float(uint(_331));
    bool _339 = _331 == 0;
    int _341 = ~_331;
    int _343 = _341 + 1;
    float _345 = 1.0 / _337;
    float _347 = _335 * _121;
    float _349 = trunc(_347);
    int _351 = int(_349);
    int _353 = as_type<int>(_345) + (-2);
    float _355 = float(uint(_351));
    float _357 = float(_351);
    float _359 = as_type<float>(_353) * _355;
    int _361 = ~_331;
    int _363 = _361 + 1;
    float _365 = trunc(_359);
    float _367 = precise::max(_365, 0.0);
    uint _370 = uint(_367);
    int _372 = ~_331;
    int _374 = _372 + 1;
    int _376 = _363 * int(_370);
    int _378 = _376 + _351;
    float _380 = in.m_58.x;
    float _382 = in.m_58.y;
    float _384 = float(uint(_378));
    float _386 = as_type<float>(_353) * _384;
    int _388 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _390 = _388 != 0;
    float _392 = trunc(_386);
    float _394 = precise::max(_392, 0.0);
    uint _396 = uint(_394);
    bool _398 = !_390;
    float _400 = _398 ? 7.345489978790283203125 : 1.0;
    float _402 = _400 * _380;
    float _404 = floor(_402);
    int _406 = int(_370) + int(_396);
    float _408 = float(_331);
    int _410 = _374 * _406;
    int _412 = _410 + _351;
    bool _414 = _357 >= _408;
    bool _416 = isnan(_357);
    bool _418 = _414 || _416;
    bool _420 = isnan(_408);
    bool _422 = _418 || _420;
    float _424 = float(_422);
    bool _426 = uint(_412) >= uint(_331);
    float _428 = trunc(_424);
    int _430 = int(_428);
    bool _432 = !_426;
    int _434 = _432 ? 0 : (-1);
    float _436 = -_404;
    float _438 = _402 + _436;
    int _440 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _442 = _440 != 0;
    int _444 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _446 = _444 != 0;
    int _448 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _450 = _448 != 0;
    int _452 = ~_406;
    int _454 = _452 + _434;
    int _456 = _454 + 1;
    int _458 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _460 = _458 != 0;
    int _462 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _464 = _462 != 0;
    int _466 = _331 * _456;
    int _468 = _466 + _351;
    int _470 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _472 = _470 != 0;
    bool _474 = !_339;
    int _476 = _474 ? _468 : (-1);
    float _478 = _438 * _408;
    float _480 = _408 * _121;
    int _482 = ~_430;
    int _484 = _482 + 1;
    int _486 = _484 + 1;
    float _488 = trunc(_478);
    int _490 = int(_488);
    float _492 = _480 * _169;
    bool _494 = !_446;
    int _496 = _494 ? 0 : 1;
    int _498 = _476 * _486;
    int _500 = _331 + (-1);
    bool _502 = !_442;
    int _504 = _502 ? 0 : 1;
    float _506 = trunc(_492);
    int _508 = int(_506);
    int _510 = _430 * _500;
    int _512 = _510 + _498;
    int _514 = abs(_496);
    bool _516 = !_450;
    int _518 = _516 ? 0 : 1;
    bool _520 = !_460;
    int _522 = _520 ? 0 : 1;
    int _524 = _512 * _514;
    int _526 = abs(_504);
    int _528 = abs(_518);
    int _530 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _532 = _530 != 0;
    int _534 = abs(_522);
    bool _536 = !_532;
    int _538 = _536 ? 0 : 1;
    int _540 = _490 * _534;
    int _542 = _540 + _351;
    float _544 = in.m_64.x;
    float _546 = in.m_64.y;
    float _548 = in.m_64.z;
    float _550 = in.m_64.w;
    int _552 = _508 * _526;
    int _554 = _552 + _524;
    int _556 = abs(_538);
    float _558 = in.m_46.x;
    float _560 = in.m_46.y;
    float _562 = in.m_46.z;
    int _564 = _542 * _528;
    int _566 = _564 + _554;
    int _568 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _570 = _568 != 0;
    int _572 = ~_331;
    int _574 = _572 + 1;
    int _576 = _490 * _556;
    int _578 = _576 + _566;
    float _580 = in.m_66.x;
    float _582 = in.m_66.y;
    float _584 = in.m_66.z;
    float _586 = in.m_66.w;
    float _588 = float(uint(_578));
    float _590 = as_type<float>(_353) * _588;
    float _592 = trunc(_590);
    float _594 = precise::max(_592, 0.0);
    uint _596 = uint(_594);
    float _598 = _560 * _323;
    float _600 = _560 * _546;
    float _602 = fma(_558, _321, _598);
    float _604 = float(uint(_542));
    float _606 = fma(_558, _544, _600);
    float _608 = _560 * _582;
    float _610 = fma(_562, _325, _602);
    float _612 = as_type<float>(_353) * _604;
    float _614 = fma(_558, _580, _608);
    int _616 = _574 * int(_596);
    int _618 = _616 + _578;
    float _620 = fma(_562, _548, _606);
    float _622 = fma(_562, _584, _614);
    float _624 = float(uint(_618));
    float _626 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _628 = _626 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _630 = trunc(_612);
    float _632 = precise::max(_630, 0.0);
    uint _634 = uint(_632);
    float _636 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _638 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _640 = as_type<float>(_353) * _624;
    float _642 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _644 = _642 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _646 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _648 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _646;
    float _650 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _652 = 1.0 / _644;
    float _654 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _656 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _658 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _660 = _658 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _662 = _650 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _664 = _636 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _666 = _656 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _668 = trunc(_640);
    float _670 = precise::max(_668, 0.0);
    uint _672 = uint(_670);
    int _674 = _343 * int(_634);
    int _676 = _674 + _542;
    int _678 = ~_331;
    int _680 = _678 + 1;
    float _682 = _382 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    out.m_68.x = _662;
    out.m_68.y = _664;
    out.m_68.z = _666;
    out.m_68.w = _638;
    float _684 = float(uint(_676));
    float _686 = fma(_682, -2.0, _654);
    float _688 = 1.0 / _628;
    float _690 = _648 * _652;
    float _692 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _694 = _692 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _696 = as_type<float>(_353) * _684;
    float _698 = _620 + _550;
    float _700 = _622 + _586;
    float _702 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[76].y, _686);
    int _704 = int(_596) + int(_672);
    float _706 = trunc(_696);
    float _708 = precise::max(_706, 0.0);
    uint _710 = uint(_708);
    float _712 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _714 = _698 + _712;
    float _716 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _718 = _315 + _716;
    int _720 = _680 * _704;
    int _722 = _720 + _578;
    float _724 = _660 * _688;
    float _726 = 1.0 / _694;
    bool _728 = uint(_722) >= uint(_331);
    float _730 = _610 + _327;
    int _732 = ~_331;
    int _734 = _732 + 1;
    bool _736 = !_728;
    int _738 = _736 ? 0 : (-1);
    float _740 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _742 = _730 + _740;
    bool _744 = _380 > 0.5;
    int _746 = ~_704;
    int _748 = _746 + _738;
    int _750 = _748 + 1;
    float _752 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _754 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _752;
    int _756 = int(_634) + int(_710);
    float _758 = _714 * _714;
    bool _760 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _762 = isnan(_315);
    bool _764 = _760 || _762;
    bool _766 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _768 = _764 || _766;
    float _770 = float(_768);
    int _772 = _331 * _750;
    int _774 = _772 + _578;
    float _776 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _778 = _700 + _776;
    float _780 = fma(_742, _742, _758);
    int _782 = _734 * _756;
    int _784 = _782 + _542;
    float _786 = _754 * _726;
    bool _788 = !_339;
    int _790 = _788 ? _774 : (-1);
    float _792 = fma(_778, _778, _780);
    bool _794 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _796 = isnan(_315);
    bool _798 = _794 || _796;
    bool _800 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _802 = _798 || _800;
    float _804 = float(_802);
    float _806 = fma(_690, _718, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _808 = uint(_784) >= uint(_331);
    float _810 = sqrt(_792);
    int _812 = _790 & 3;
    bool _814 = _812 != 0;
    float _816 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _818 = _315 + _816;
    float _820 = -_185;
    int _822 = _744 ? as_type<int>(_820) : as_type<int>(_185);
    float _824 = _293 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _826 = !_808;
    int _828 = _826 ? 0 : (-1);
    float _830 = -_770;
    float _832 = _830 + 1.0;
    int _834 = _814 ? 0 : 1;
    float _836 = rsqrt(_792);
    int _838 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _840 = _838 != 0;
    int _842 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _844 = _842 != 0;
    int _846 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _848 = _846 != 0;
    float _850 = -_804;
    float _852 = _850 + 1.0;
    bool _854 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _856 = isnan(_315);
    bool _858 = _854 || _856;
    bool _860 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _862 = _858 || _860;
    float _864 = float(_862);
    float _866 = fma(_724, _818, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _868 = _804 * _832;
    float _870 = _824 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    bool _872 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _874 = isnan(_315);
    bool _876 = _872 || _874;
    bool _878 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _880 = _876 || _878;
    float _882 = float(_880);
    float _884 = _810 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _886 = _864 * _852;
    float _888 = -_864;
    float _890 = _888 + 1.0;
    float _892 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _894 = _315 + _892;
    float _896 = precise::min(_870, _884);
    float _898 = _882 * _890;
    float _900 = fma(_786, _894, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _902 = _714 * _836;
    float _904 = _742 * _836;
    float _906 = _806 * _898;
    int _908 = _790 >> 31;
    float _910 = _902 * _896;
    float _912 = _904 * _896;
    float _914 = -_882;
    float _916 = _914 + 1.0;
    int _918 = _908 & 3;
    float _920 = -_910;
    float _922 = _714 + _920;
    float _924 = -_912;
    float _926 = _742 + _924;
    float _928 = fma(_916, (*spvDescriptorSet0.vp_c9)._m0[115].x, _906);
    int _930 = _790 + _918;
    float _932 = _922 * _922;
    float _934 = _778 * _836;
    float _936 = fma(_866, _886, _928);
    float _938 = fma(_926, _926, _932);
    int _940 = _930 >> 2;
    float _942 = _934 * _896;
    float _944 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _946 = !_464;
    float _948 = _946 ? _185 : as_type<float>(_822);
    float _950 = _380 * 2.0;
    int _952 = _940 << 4;
    int _954 = _952 + 368;
    float _956 = -_942;
    float _958 = _778 + _956;
    bool _960 = _382 > 0.5;
    float _962 = -_944;
    float _964 = fma(_950, (*spvDescriptorSet0.vp_c9)._m0[77].x, _962);
    uint _966 = uint(int(uint(_954) >> uint(2)));
    uint _968 = uint(int(uint(int(_966)) >> uint(2)));
    int _970 = int(_966) & 3;
    float _972 = (*spvDescriptorSet0.vp_c9)._m0[int(_968)][_970];
    int _974 = int(_966) + 1;
    uint _976 = uint(int(uint(_974) >> uint(2)));
    int _978 = _974 & 3;
    float _980 = (*spvDescriptorSet0.vp_c9)._m0[int(_976)][_978];
    float _982 = fma(_958, _958, _938);
    float _984 = -_189;
    int _986 = _960 ? as_type<int>(_984) : as_type<int>(_189);
    float _988 = _948 + 0.5;
    int _990 = _790 & 3;
    bool _992 = _990 != 0;
    float _994 = -_121;
    float _996 = fma(_994, (*spvDescriptorSet0.vp_c9)._m0[76].x, _964);
    float _998 = sqrt(_982);
    bool _1000 = !_472;
    float _1002 = _1000 ? _189 : as_type<float>(_986);
    float _1004 = fma(_900, _868, _936);
    bool _1006 = uint(_990) > 1u;
    float _1008 = fma(_988, (*spvDescriptorSet0.vp_c9)._m0[80].x, _996);
    float _1010 = _714 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1012 = _954 + 8;
    uint _1014 = uint(int(uint(_1012) >> uint(2)));
    uint _1016 = uint(int(uint(int(_1014)) >> uint(2)));
    int _1018 = int(_1014) & 3;
    float _1020 = (*spvDescriptorSet0.vp_c9)._m0[int(_1016)][_1018];
    int _1022 = int(_1014) + 1;
    uint _1024 = uint(int(uint(_1022) >> uint(2)));
    int _1026 = _1022 & 3;
    float _1028 = (*spvDescriptorSet0.vp_c9)._m0[int(_1024)][_1026];
    float _1030 = _1002 + (-0.5);
    float _1032 = fma(_770, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1004);
    float _1034 = fma(_742, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1010);
    int _1036 = ~_756;
    int _1038 = _1036 + _828;
    int _1040 = _1038 + 1;
    float _1042 = -_1030;
    float _1044 = -_702;
    float _1046 = fma(_1042, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1044);
    int _1048 = ~_834;
    int _1050 = _1048 + 1;
    int _1052 = _1050 + 1;
    float _1054 = fma(_778, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1034);
    out.m_70.w = _896;
    int _1056 = _331 * _1040;
    int _1058 = _1056 + _542;
    int _1060 = _1052;
    float _1062 = _700;
    float _1064 = _912;
    if (!_1006)
    {
        int _1066 = ~_834;
        int _1068 = _1066 + 1;
        _1060 = _1068;
    }
    int _1070 = _1060;
    float _1072 = _836 * _998;
    bool _1074 = !_992;
    int _1076 = _1074 ? 0 : 1;
    bool _1078 = uint(_990) >= 2u;
    float _1080 = _824 * _1072;
    bool _1082 = _990 != 3;
    int _1084 = _1078 ? 0 : 1;
    float _1086 = _1080 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    bool _1088 = _990 != 3;
    int _1090 = abs(_1070);
    float _1092 = _902 * _1086;
    bool _1094 = !_1082;
    int _1096 = _1094 ? 0 : (-1);
    bool _1098 = _1054 >= 0.0;
    float _1100 = _904 * _1086;
    float _1102 = -_1092;
    float _1104 = _714 + _1102;
    int _1106 = abs(_1076);
    float _1108 = _934 * _1086;
    int _1110 = ~_1090;
    int _1112 = _1110 + 1;
    int _1114 = _1112 + 1;
    float _1116 = _1104 * _1104;
    int _1118 = ~_1084;
    int _1120 = _1118 + 1;
    int _1122 = _1120 + 1;
    float _1124 = -_1100;
    float _1126 = _742 + _1124;
    int _1128 = _1122;
    float _1130 = _1092;
    float _1132 = _1108;
    float _1134 = _1100;
    if (_1088)
    {
        int _1136 = ~_1084;
        int _1138 = _1136 + 1;
        _1128 = _1138;
    }
    int _1140 = _1128;
    int _1142 = _1114 * as_type<int>(_980);
    int _1144 = ~_1106;
    int _1146 = _1144 + 1;
    int _1148 = _1146 + 1;
    float _1150 = fma(_1126, _1126, _1116);
    int _1152 = abs(_1140);
    float _1154 = -_1108;
    float _1156 = _778 + _1154;
    int _1158 = abs(_1096);
    int _1160 = _1148 * as_type<int>(_972);
    int _1162 = _1160 + _1142;
    float _1164 = fma(_1156, _1156, _1150);
    bool _1166 = !_570;
    int _1168 = _1166 ? 0 : 1;
    float _1170 = _1156;
    if (_1098)
    {
        out.m_53.x = 0.0;
    }
    int _1172 = ~_1152;
    int _1174 = _1172 + 1;
    int _1176 = _1174 + 1;
    float _1178 = sqrt(_1164);
    int _1180 = abs(_1168);
    int _1182 = _1176 * as_type<int>(_1020);
    int _1184 = _1182 + _1162;
    float _1186 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1188 = ~_1158;
    int _1190 = _1188 + 1;
    int _1192 = _1190 + 1;
    float _1194 = _1032 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1196 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1198 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1186);
    int _1200 = _1192 * as_type<int>(_1028);
    int _1202 = _1200 + _1184;
    int _1204 = ~_1180;
    int _1206 = _1204 + 1;
    int _1208 = _1206 + 1;
    float _1210 = fma(_382, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1196);
    bool _1212 = !_339;
    int _1214 = _1212 ? _1058 : (-1);
    float _1216 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1198);
    int _1218 = _1202 * _1208;
    float _1220 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1210);
    float _1222 = -_1216;
    float _1224 = _1222 + 1.0;
    int _1226 = _1214 * _1180;
    int _1228 = _1226 + _1218;
    float _1230 = -_1220;
    float _1232 = _1230 + 1.0;
    float _1234 = -_1224;
    float _1236 = fma(_948, _1234, _1008);
    if (_1098)
    {
        _1170 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1238 = _1170;
    float _1240 = fma(_1002, _1232, _1046);
    float _1242 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1244 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1246 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1248 = _836 * _1178;
    float _1250 = _1242 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1252 = _1244 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1254 = _1246 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1256 = as_type<int>(_1238);
    if (_1098)
    {
        float _1258 = _1238 * 5.0;
        _1256 = as_type<int>(_1258);
    }
    int _1260 = _1256;
    float _1262 = float(_1228);
    float _1264 = _1080 * _1248;
    out.m_72.x = _1236;
    out.m_72.y = _1240;
    bool _1266 = !_844;
    int _1268 = _1266 ? 0 : 1;
    bool _1270 = !_848;
    int _1272 = _1270 ? 0 : 1;
    out.m_74.x = _1250;
    out.m_74.y = _1252;
    out.m_74.z = _1254;
    out.m_74.w = _1194;
    bool _1274 = !_840;
    int _1276 = _1274 ? 0 : 1;
    if (_1098)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5022 = as_type<float>(_1260);
        out.gl_Position.z = _5022;
    }
    out.m_76.x = _1262;
    out.m_78.x = _1264;
    if (_1098)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1278 = -_1092;
    float _1280 = _698 + _1278;
    float _1282 = -_1100;
    float _1284 = _730 + _1282;
    float _1286 = -_1108;
    float _1288 = _700 + _1286;
    float _1290 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1292 = _1280 + _1290;
    float _1294 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1296 = _1284 + _1294;
    float _1298 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1300 = _1288 + _1298;
    float _1302 = _1292 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1304 = fma(_1296, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1302);
    float _1306 = fma(_1300, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1304);
    bool _1308 = _1306 >= 0.0;
    float _1310 = _1300;
    if (_1308)
    {
        _1310 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1312 = _1310;
    int _1314 = as_type<int>(_1312);
    if (_1308)
    {
        out.m_53.x = 0.0;
    }
    if (_1308)
    {
        float _1316 = _1312 * 5.0;
        _1314 = as_type<int>(_1316);
    }
    int _1318 = _1314;
    if (_1308)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5107 = as_type<float>(_1318);
        out.gl_Position.z = _5107;
    }
    if (_1308)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1320 = -_698;
    float _1322 = _1320 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1324 = -_730;
    float _1326 = _1324 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1328 = -_700;
    float _1330 = _1328 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1332 = _1322 * _1322;
    float _1334 = floor(_950);
    float _1336 = fma(_1326, _1326, _1332);
    float _1338 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1340 = _295 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1342 = fma(_1330, _1330, _1336);
    float _1344 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _1346 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1348 = -_1338;
    float _1350 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _1348);
    float _1352 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1354 = -_1344;
    float _1356 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1354);
    float _1358 = rsqrt(_1342);
    float _1360 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1362 = -_1352;
    float _1364 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1362);
    int _1366 = abs(_1276);
    float _1368 = -_910;
    float _1370 = _698 + _1368;
    float _1372 = -_1360;
    float _1374 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1372);
    float _1376 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    bool _1378 = _1334 > 0.0;
    bool _1380 = _1334 >= 0.0;
    bool _1382 = isnan(_1334);
    bool _1384 = _1380 || _1382;
    bool _1386 = isnan(0.0);
    bool _1388 = _1384 || _1386;
    float _1390 = -_1376;
    float _1392 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _1390);
    float _1394 = _1326 * _1358;
    float _1396 = _1330 * _1358;
    float _1398 = -_1346;
    float _1400 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1398);
    float _1402 = _1350 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1404 = _1394 * _1394;
    float _1406 = _1322 * _1358;
    float _1408 = _1400 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1410 = -_1402;
    float _1412 = fma(_1356, (*spvDescriptorSet0.vp_c8)._m0[1].y, _1410);
    float _1414 = fma(_1396, _1396, _1404);
    float _1416 = _1400 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1418 = _382 * 2.0;
    float _1420 = fma(_1374, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1412);
    float _1422 = rsqrt(_1414);
    float _1424 = -_1416;
    float _1426 = fma(_1356, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1424);
    float _1428 = fma(_1364, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1426);
    float _1430 = floor(_1418);
    float _1432 = _1428 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1434 = -_1408;
    float _1436 = fma(_1350, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1434);
    float _1438 = _1364 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1440 = -_1432;
    float _1442 = fma(_1420, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1440);
    float _1444 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1436);
    float _1446 = -_1438;
    float _1448 = fma(_1374, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1446);
    float _1450 = _1396 * _1422;
    float _1452 = _1394 * _1422;
    float _1454 = fma(_1444, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1442);
    float _1456 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1448);
    float _1458 = -_1450;
    float _1460 = _1396 * _1458;
    float _1462 = -_1450;
    float _1464 = _1406 * _1462;
    float _1466 = _1400 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _1468 = -_1456;
    float _1470 = fma(_1468, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1454);
    float _1472 = -_1460;
    float _1474 = fma(_1394, _1452, _1472);
    float _1476 = _1406 * _1452;
    float _1478 = -_1466;
    float _1480 = fma(_1356, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1478);
    bool _1482 = _1430 > 0.0;
    float _1484 = _1474 * _1474;
    float _1486 = 1.0 / _1470;
    float _1488 = fma(_1364, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1480);
    bool _1490 = _1430 >= 0.0;
    bool _1492 = isnan(_1430);
    bool _1494 = _1490 || _1492;
    bool _1496 = isnan(0.0);
    bool _1498 = _1494 || _1496;
    float _1500 = fma(_1476, _1476, _1484);
    float _1502 = in.m_58.z;
    float _1504 = fma(_1464, _1464, _1500);
    float _1506 = _1350 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _1508 = rsqrt(_1504);
    float _1510 = -_1506;
    float _1512 = fma(_1356, (*spvDescriptorSet0.vp_c8)._m0[0].y, _1510);
    float _1514 = _1400 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1516 = fma(_1374, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1512);
    float _1518 = -_1514;
    float _1520 = fma(_1350, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1518);
    float _1522 = fma(_1488, _1486, -1.0);
    float _1524 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1520);
    int _1526 = _1498 ? 0 : 1;
    int _1528 = ~_1526;
    int _1530 = _1528 + 1;
    int _1532 = _1530 + 1;
    float _1534 = _1474 * _1508;
    float _1536 = precise::clamp(_1534, 0.0, 1.0);
    int _1538 = _1532;
    if (!_1482)
    {
        int _1540 = ~_1526;
        int _1542 = _1540 + 1;
        _1538 = _1542;
    }
    int _1544 = _1538;
    float _1546 = _1502 * 2.0;
    float _1548 = -_1536;
    float _1550 = _1548 + 1.0;
    float _1552 = _1550 * _1486;
    float _1554 = fma(_1550, _1522, 1.0);
    float _1556 = floor(_1546);
    float _1558 = _1516 * _1552;
    float _1560 = _1554 * _1554;
    float _1562 = _1524 * _1552;
    float _1564 = fma(_1558, _1558, _1560);
    float _1566 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1568 = log2(_1566);
    float _1570 = fma(_1562, _1562, _1564);
    float _1572 = rsqrt(_1570);
    bool _1574 = _1556 > 0.0;
    bool _1576 = _1556 >= 0.0;
    bool _1578 = isnan(_1556);
    bool _1580 = _1576 || _1578;
    bool _1582 = isnan(0.0);
    bool _1584 = _1580 || _1582;
    float _1586 = _382 + _380;
    int _1588 = _1584 ? 0 : 1;
    float _1590 = _1586 + (-1.0);
    int _1592 = ~_1588;
    int _1594 = _1592 + 1;
    int _1596 = _1594 + 1;
    float _1598 = fma(_1590, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1600 = _1568 * _121;
    int _1602 = _1596;
    if (!_1574)
    {
        int _1604 = ~_1588;
        int _1606 = _1604 + 1;
        _1602 = _1606;
    }
    int _1608 = _1602;
    float _1610 = _1562 * _1572;
    float _1612 = float(_1366);
    float _1614 = _1554 * _1572;
    float _1616 = float(_1608);
    float _1618 = _1558 * _1572;
    float _1620 = -_1610;
    float _1622 = _1394 * _1620;
    float _1624 = exp2(_1600);
    float _1626 = _1612 * _1616;
    float _1628 = _1396 * _1614;
    float _1630 = -_1618;
    float _1632 = -_1622;
    float _1634 = fma(_1396, _1630, _1632);
    float _1636 = -_1618;
    float _1638 = _1406 * _1636;
    bool _1640 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1642 = isnan(1.0);
    bool _1644 = _1640 || _1642;
    bool _1646 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1648 = _1644 || _1646;
    float _1650 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1652 = 1.0 + _1650;
    float _1654 = -_1610;
    float _1656 = -_1628;
    float _1658 = fma(_1406, _1654, _1656);
    bool _1660 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1662 = isnan(0.0);
    bool _1664 = _1660 || _1662;
    bool _1666 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1668 = _1664 || _1666;
    float _1670 = -_1638;
    float _1672 = fma(_1394, _1614, _1670);
    float _1674 = in.m_80.x;
    float _1676 = in.m_80.y;
    float _1678 = in.m_80.z;
    float _1680 = _1634 * _1634;
    float _1682 = 1.0 / _1652;
    float _1684 = _1502 + _380;
    float _1686 = _380 + (-0.5);
    float _1688 = fma(_1658, _1658, _1680);
    float _1690 = -_1624;
    float _1692 = _1690 + 1.0;
    int _1694 = abs(_1272);
    float _1696 = _1684 + (-1.0);
    float _1698 = fma(_1672, _1672, _1688);
    float _1700 = _1668 ? _1692 : 0.0;
    float _1702 = rsqrt(_1698);
    float _1704 = float(_1544);
    float _1706 = fma(_1696, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    if (_1648)
    {
        float _1708 = _1700 * _1682;
        _131 = _1708;
    }
    float _1710 = _131;
    float _1712 = _1626 * (-2.0);
    float _1714 = float(_1694);
    int _1716 = _1388 ? 0 : 1;
    float _1718 = fma(_1598, _1712, _1598);
    float _1720 = fma(_1712, _1674, _1674);
    float _1722 = _1714 * _1704;
    int _1724 = ~_1716;
    int _1726 = _1724 + 1;
    int _1728 = _1726 + 1;
    float _1730 = _1502 + (-0.5);
    float _1732 = fma(_1686, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1720);
    float _1734 = _1722 * (-2.0);
    int _1736 = _1728;
    if (!_1378)
    {
        int _1738 = ~_1716;
        int _1740 = _1738 + 1;
        _1736 = _1740;
    }
    int _1742 = _1736;
    float _1744 = _1658 * _1702;
    float _1746 = fma(_1718, _1710, _1732);
    float _1748 = _1672 * _1702;
    float _1750 = fma(_1706, _1734, _1706);
    float _1752 = _1396 * _1744;
    float _1754 = fma(_1734, _1678, _1678);
    int _1756 = abs(_1268);
    float _1758 = _1634 * _1702;
    float _1760 = _1406 * _1748;
    float _1762 = -_1752;
    float _1764 = fma(_1394, _1748, _1762);
    float _1766 = _1746 * 0.15915493667125701904296875;
    float _1768 = -_1760;
    float _1770 = fma(_1396, _1758, _1768);
    float _1772 = _1394 * _1758;
    float _1774 = _1764 * _1764;
    float _1776 = float(_1742);
    float _1778 = _382 + _1502;
    float _1780 = float(_1756);
    float _1782 = -_1772;
    float _1784 = fma(_1406, _1744, _1782);
    float _1786 = fma(_1770, _1770, _1774);
    float _1788 = _1778 + (-1.0);
    float _1790 = _1780 * _1776;
    float _1792 = fma(_1784, _1784, _1786);
    float _1794 = _382 + (-0.5);
    float _1796 = fma(_1788, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1798 = _1790 * (-2.0);
    float _1800 = fma(_1730, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1754);
    float _1802 = _1766 * 6.283185482025146484375;
    float _1804 = sin(_1802);
    bool _1806 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1808 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1810 = _1806 || _1808;
    bool _1812 = isnan(0.5);
    bool _1814 = _1810 || _1812;
    float _1816 = fma(_1798, _1676, _1676);
    float _1818 = fma(_1796, _1798, _1796);
    float _1820 = fma(_1750, _1710, _1800);
    float _1822 = fma(_1794, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1816);
    float _1824 = rsqrt(_1792);
    float _1826 = fma(_1818, _1710, _1822);
    float _1828 = _1826 * 0.15915493667125701904296875;
    float _1830 = _1340 * _1072;
    float _1832 = _1766 * 6.283185482025146484375;
    float _1834 = cos(_1832);
    float _1836 = _1830 * _1248;
    float _1838 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _189);
    float _1840 = _1784 * _1824;
    float _1842 = _1770 * _1824;
    float _1844 = _1764 * _1824;
    float _1846 = _1820 * 0.15915493667125701904296875;
    float _1848 = _1394 * _1840;
    float _1850 = _1406 * _1842;
    float _1852 = _1396 * _1844;
    float _1854 = _1846 * 6.283185482025146484375;
    float _1856 = sin(_1854);
    float _1858 = -_1848;
    float _1860 = fma(_1396, _1842, _1858);
    float _1862 = -_1850;
    float _1864 = fma(_1394, _1844, _1862);
    float _1866 = -_1852;
    float _1868 = fma(_1406, _1840, _1866);
    float _1870 = _1836 * _1838;
    float _1872 = _1860 * _1860;
    float _1874 = _1846 * 6.283185482025146484375;
    float _1876 = cos(_1874);
    float _1878 = fma(_1868, _1868, _1872);
    float _1880 = fma(_1864, _1864, _1878);
    float _1882 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _185);
    float _1884 = _1828 * 6.283185482025146484375;
    float _1886 = sin(_1884);
    float _1888 = _1804 * _1856;
    float _1890 = _1834 * _1856;
    float _1892 = _1264 * _1882;
    float _1894 = _1828 * 6.283185482025146484375;
    float _1896 = cos(_1894);
    float _1898 = _1834 * _1876;
    float _1900 = _1804 * _1876;
    float _1902 = rsqrt(_1880);
    float _1904 = fma(_1886, _1888, _1898);
    float _1906 = -_1890;
    float _1908 = fma(_1886, _1900, _1906);
    float _1910 = _1908 * _1870;
    float _1912 = _1856 * _1896;
    float _1914 = _1904 * _1870;
    float _1916 = _1876 * _1896;
    float _1918 = _1804 * _1896;
    float _1920 = fma(_1912, _1892, _1914);
    float _1922 = fma(_1916, _1892, _1910);
    float _1924 = _1918 * _1870;
    float _1926 = _1864 * _1902;
    float _1928 = _1920 * _1840;
    float _1930 = _1920 * _1842;
    float _1932 = -_1886;
    float _1934 = fma(_1932, _1892, _1924);
    float _1936 = _1868 * _1902;
    float _1938 = fma(_1922, _1926, _1928);
    float _1940 = -_942;
    float _1942 = _700 + _1940;
    float _1944 = _1860 * _1902;
    float _1946 = fma(_1922, _1936, _1930);
    float _1948 = fma(_1934, _1396, _1938);
    float _1950 = -_912;
    float _1952 = _730 + _1950;
    float _1954 = -_1108;
    float _1956 = _1954 + _1942;
    float _1958 = fma(_1934, _1394, _1946);
    float _1960 = _700 + _1948;
    float _1962 = -_1092;
    float _1964 = _1962 + _1370;
    float _1966 = -_1100;
    float _1968 = _1966 + _1952;
    float _1970 = _730 + _1958;
    float _1972 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1974 = _1960 + _1972;
    float _1976 = _1964 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1978 = _1920 * _1844;
    float _1980 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1982 = _1970 + _1980;
    float _1984 = _1974 * _1974;
    float _1986 = fma(_1968, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1976);
    float _1988 = fma(_1922, _1944, _1978);
    float _1990 = fma(_1982, _1982, _1984);
    float _1992 = fma(_1956, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1986);
    float _1994 = _1964 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1996 = fma(_1934, _1406, _1988);
    float _1998 = sqrt(_1990);
    float _2000 = _1992 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2002 = fma(_1968, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1994);
    bool _2004 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2006 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2008 = _2004 || _2006;
    bool _2010 = isnan(0.5);
    bool _2012 = _2008 || _2010;
    float _2014 = _698 + _1996;
    float _2016 = fma(_1956, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2002);
    float _2018 = 1.0 / _2000;
    float _2020 = _2016 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2022 = _2020 + _2000;
    bool _2024 = _1998 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2026 = _2022 * _2018;
    float _2028 = _2026 * 0.5;
    float _2030 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2032 = fma(_2028, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2030);
    float _2034 = _1934;
    float _2036 = _1970;
    float _2038 = _1960;
    float _2040 = _1996;
    float _2042 = _1982;
    float _2044 = _1956;
    if (!_2024)
    {
        _2034 = _2014;
    }
    float _2046 = _2034;
    bool _2048 = !_2024;
    float _2050 = _2046;
    if (!_2048)
    {
        float _2052 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2054 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2056 = _1998 + _2054;
        float _2058 = rsqrt(_1990);
        float _2060 = _2056 * _2052;
        float _2062 = _2014 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2064 = _2060 * 0.15915493667125701904296875;
        float _2066 = _2064 * 6.283185482025146484375;
        float _2068 = cos(_2066);
        float _2070 = _2064 * 6.283185482025146484375;
        float _2072 = sin(_2070);
        float _2074 = _2068 + (-1.0);
        float _2076 = fma(_2072, _2062, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2078 = _2074 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2080 = _2058 * _2076;
        float _2082 = fma(_2014, _2068, _2078);
        float _2084 = fma(_1982, _2080, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2086 = fma(_1974, _2080, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2050 = _2082;
        _2036 = _2084;
        _2038 = _2086;
        _2040 = _2076;
    }
    float _2088 = _2050;
    float _2090 = _2036;
    float _2092 = _2038;
    float _2094 = _2040;
    float _2096 = 1.0 / _2032;
    float _2098 = -_910;
    float _2100 = _2098 + _2088;
    float _2102 = -_912;
    float _2104 = _2102 + _2090;
    float _2106 = -_942;
    float _2108 = _2106 + _2092;
    float _2110 = -_1092;
    float _2112 = _2110 + _2100;
    float _2114 = -_1100;
    float _2116 = _2114 + _2104;
    float _2118 = -_1108;
    float _2120 = _2118 + _2108;
    float _2122 = _2112;
    float _2124 = _2116;
    float _2126 = _2120;
    float _2128 = _2094;
    if (_1814)
    {
        _1130 = 1.0;
    }
    float _2130 = _1130;
    float _2132 = _2130;
    if (!_2012)
    {
        float _2134 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2136 = _1964 + _2134;
        float _2138 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2140 = _1968 + _2138;
        float _2142 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2144 = -_700;
        float _2146 = _2144 + _2092;
        float _2148 = _2136 * _2136;
        float _2150 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2152 = _1956 + _2150;
        float _2154 = -_730;
        float _2156 = _2154 + _2090;
        float _2158 = fma(_2140, _2140, _2148);
        float _2160 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2162 = fma(_2152, _2152, _2158);
        float _2164 = sqrt(_2162);
        float _2166 = 1.0 / _1248;
        float _2168 = _2160 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2170 = precise::min(_2164, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2172 = _2170 * _2142;
        float _2174 = -_698;
        float _2176 = _2174 + _2088;
        float _2178 = _2172 * _2166;
        float _2180 = _2168 * _2178;
        float _2182 = _2146 * _2178;
        float _2184 = fma(_2176, _2180, _1964);
        float _2186 = fma(_2156, _2180, _1968);
        float _2188 = fma(_2168, _2182, _1956);
        _1062 = _2182;
        _2122 = _2184;
        _2124 = _2186;
        _2126 = _2188;
    }
    float _2190 = _1062;
    float _2192 = _2122;
    float _2194 = _2124;
    float _2196 = _2126;
    float _2198 = _2190;
    if (_1814)
    {
        _1132 = 1.0;
    }
    float _2200 = _1132;
    float _2202 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2204 = _2096 * _2202;
    float _2206 = _2200;
    if (!_1814)
    {
        float _2208 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2210 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2212 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2210;
        float _2214 = _2208 * 0.15915493667125701904296875;
        float _2216 = 1.0 / _2212;
        float _2218 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2220 = _2214 * 6.283185482025146484375;
        float _2222 = cos(_2220);
        float _2224 = _2218 * 0.15915493667125701904296875;
        float _2226 = _2214 * 6.283185482025146484375;
        float _2228 = sin(_2226);
        float _2230 = 1.0 / _2222;
        float _2232 = _2224 * 6.283185482025146484375;
        float _2234 = cos(_2232);
        float _2236 = _2228 * _2230;
        float _2238 = _2224 * 6.283185482025146484375;
        float _2240 = sin(_2238);
        float _2242 = _2234 * _2236;
        float _2244 = 1.0 / _2242;
        float _2246 = _2240 * _2244;
        float _2248 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2250 = fma(_2204, _2246, _2248);
        float _2252 = _2250 * _2216;
        float _2254 = precise::clamp(_2252, 0.0, 1.0);
        _2198 = _2236;
        _2128 = _2214;
        _2132 = _2254;
    }
    float _2256 = _2198;
    float _2258 = _2128;
    float _2260 = _2132;
    float _2262 = _2256;
    float _2264 = _2258;
    if (!_1814)
    {
        float _2266 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2268 = _2266 * 0.15915493667125701904296875;
        float _2270 = _2268 * 6.283185482025146484375;
        float _2272 = cos(_2270);
        float _2274 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2276 = _2274 * 0.15915493667125701904296875;
        float _2278 = _2268 * 6.283185482025146484375;
        float _2280 = sin(_2278);
        float _2282 = 1.0 / _2272;
        float _2284 = _2276 * 6.283185482025146484375;
        float _2286 = cos(_2284);
        float _2288 = _2280 * _2282;
        float _2290 = _2276 * 6.283185482025146484375;
        float _2292 = sin(_2290);
        float _2294 = _2286 * _2288;
        float _2296 = 1.0 / _2294;
        float _2298 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2300 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2298;
        float _2302 = 1.0 / _2300;
        float _2304 = _2292 * _2296;
        float _2306 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2308 = fma(_2204, _2304, _2306);
        float _2310 = _2308 * _2302;
        float _2312 = precise::clamp(_2310, 0.0, 1.0);
        float _2314 = -_2312;
        float _2316 = _2314 + 1.0;
        _2262 = _2282;
        _2264 = _2294;
        _2206 = _2316;
    }
    float _2318 = _2262;
    float _2320 = _2264;
    float _2322 = _2206;
    float _2324 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2326 = _2192 + _2324;
    float _2328 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2330 = _2194 + _2328;
    float _2332 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2334 = _2196 + _2332;
    float _2336 = _2326 * _2326;
    float _2338 = fma(_2330, _2330, _2336);
    float _2340 = fma(_2334, _2334, _2338);
    float _2342 = rsqrt(_2340);
    float _2344 = sqrt(_2340);
    float _2346 = _2342 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2348 = _2330 * _2346;
    float _2350 = _2334 * _2346;
    float _2352 = _2348 * _2348;
    float _2354 = _2350 * _2350;
    float _2356 = _2352 + _2354;
    float _2358 = sqrt(_2356);
    bool _2360 = _2358 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2362 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2364 = _2358 + _2362;
    float _2366 = _2318;
    float _2368 = _2364;
    float _2370 = _2326;
    float _2372 = _2348;
    float _2374 = _2350;
    if (_2360)
    {
        float _2376 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2366 = _2376;
    }
    float _2378 = _2366;
    if (_2360)
    {
        float _2380 = rsqrt(_2356);
        _1064 = _2380;
    }
    float _2382 = _1064;
    if (_2360)
    {
        float _2384 = _2364 * _2378;
        _2368 = _2384;
    }
    float _2386 = _2368;
    float _2388 = _2192 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (_2360)
    {
        float _2390 = _2386 * 0.15915493667125701904296875;
        _1134 = _2390;
    }
    float _2392 = _1134;
    float _2394 = fma(_2194, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2388);
    float _2396 = _2378;
    if (_2360)
    {
        float _2398 = _2392 * 6.283185482025146484375;
        float _2400 = sin(_2398);
        _2396 = _2400;
    }
    float _2402 = _2396;
    float _2404 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2406 = fma(_2196, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2394);
    float _2408 = precise::max(0.0, _2404);
    float _2410 = _2320;
    float _2412 = _2408;
    if (_2360)
    {
        float _2414 = _2392 * 6.283185482025146484375;
        float _2416 = cos(_2414);
        _2410 = _2416;
    }
    float _2418 = _2410;
    float _2420 = _2406 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2422 = -_2346;
    float _2424 = -_2408;
    float _2426 = fma(_2326, _2422, _2424);
    if (_2360)
    {
        float _2428 = _2426 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2412 = _2428;
    }
    float _2430 = _2412;
    float _2432 = _2402;
    float _2434 = _2430;
    if (_2360)
    {
        float _2436 = fma(_2402, _2430, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2042 = _2436;
    }
    float _2438 = _2042;
    float _2440 = _2438;
    if (!_2360)
    {
        _2432 = _2426;
    }
    float _2442 = _2432;
    float _2444 = _2442;
    if (_2360)
    {
        float _2446 = _2418 + (-1.0);
        _2370 = _2446;
    }
    float _2448 = _2370;
    float _2450 = _2448;
    if (_2360)
    {
        float _2452 = _2382 * _2438;
        _2440 = _2452;
    }
    float _2454 = _2440;
    if (_2360)
    {
        float _2456 = _2448 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2434 = _2456;
    }
    float _2458 = _2434;
    float _2460 = _2458;
    if (_2360)
    {
        float _2462 = _2348 * _2454;
        _2372 = _2462;
    }
    float _2464 = _2372;
    if (_2360)
    {
        float _2466 = _2350 * _2454;
        _2374 = _2466;
    }
    float _2468 = _2374;
    if (!_2360)
    {
        _2450 = _2354;
    }
    float _2470 = _2450;
    float _2472 = _2470;
    if (_2360)
    {
        float _2474 = fma(_2426, _2418, _2458);
        _2444 = _2474;
    }
    float _2476 = _2444;
    if (!_2360)
    {
        _2460 = _2352;
    }
    float _2478 = _2460;
    float _2480 = _2478;
    if (_2360)
    {
        float _2482 = _2464 * _2464;
        _2480 = _2482;
    }
    float _2484 = _2480;
    float _2486 = fma(_1968, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    if (_2360)
    {
        float _2488 = _2468 * _2468;
        _2472 = _2488;
    }
    float _2490 = _2472;
    float _2492 = fma(_2476, _2476, _2484);
    float _2494 = _2192 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2496 = floor(_2486);
    float _2498 = _2492 + _2490;
    float _2500 = fma(_2194, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2494);
    float _2502 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2504 = fma(_2344, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2502);
    float _2506 = precise::clamp(_2504, 0.0, 1.0);
    float _2508 = _2192 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2510 = fma(_2196, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2500);
    float _2512 = rsqrt(_2498);
    float _2514 = -_2506;
    float _2516 = _2514 + 1.0;
    float _2518 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2520 = _2510 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2522 = fma(_2194, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2508);
    float _2524 = _2520 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2526 = fma(_2196, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2522);
    float _2528 = abs(_2516);
    float _2530 = log2(_2528);
    float _2532 = fma(_1956, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2534 = -_2524;
    float _2536 = fma(_2534, _2518, 1.0);
    float _2538 = _2192 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2540 = _2526 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2542 = -_2496;
    float _2544 = _2486 + _2542;
    float _2546 = _2512 * _2464;
    float _2548 = fma(_2194, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2538);
    float _2550 = _2512 * _2476;
    float _2552 = _2512 * _2468;
    float _2554 = _2546 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2556 = fma(_2196, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2548);
    float _2558 = floor(_2532);
    float _2560 = _2540 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2562 = -_2554;
    float _2564 = fma(_2550, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2562);
    float _2566 = _2556 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2568 = _2540 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2570 = _2530 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2572 = -_2552;
    float _2574 = fma(_2572, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2564);
    float _2576 = fma(_2566, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2560);
    float _2578 = fma(_2566, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2568);
    float _2580 = log2(_2536);
    float _2582 = fma(_2574, 0.5, 0.5);
    float _2584 = fma(_2520, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2578);
    float _2586 = fma(_2582, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2588 = fma(_2420, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2584);
    float _2590 = exp2(_2570);
    float _2592 = fma(_2574, -0.5, 0.5);
    float _2594 = _2540 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2596 = -_2558;
    float _2598 = _2532 + _2596;
    float _2600 = _2550 + 1.0;
    float _2602 = fma(_2566, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2594);
    float _2604 = 1.0 / _2588;
    float _2606 = fma(_2582, _2586, -0.212114393711090087890625);
    float _2608 = fma(_2520, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2576);
    float _2610 = fma(_2520, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2602);
    float _2612 = _2580 * 0.693147182464599609375;
    float _2614 = fma(_2582, _2606, 1.570728778839111328125);
    float _2616 = fma(_2420, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2608);
    float _2618 = fma(_2420, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2610);
    float _2620 = sqrt(_2592);
    float _2622 = -_2550;
    float _2624 = fma(_2590, _2600, _2622);
    float _2626 = _2612 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float2 _7105 = float2(_2544, _2598);
    float _2628 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7105, float2(0.0), isnan(_7105)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7105, float2(0.0), isnan(_7105)), level(0.0)).x;
    float _2630 = fma(_2624, 0.5, 0.5);
    float _2632 = _2616 * _2604;
    float _2634 = _2618 * _2604;
    float _2636 = fma(_2632, 0.5, 0.5);
    float _2638 = fma(_2634, -0.5, 0.5);
    float _2640 = _2620 * 0.636619746685028076171875;
    float _2642 = -_2614;
    float _2644 = fma(_2640, _2642, 1.0);
    float3 _7136 = float3(_2636, _2638, _2626);
    float _2646 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7136, float3(0.0), isnan(_7136)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7136, float3(0.0), isnan(_7136)), level(0.0)).x;
    float3 _7147 = float3(_2636, _2638, _2626);
    float4 _2649 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7147, float3(0.0), isnan(_7147)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7147, float3(0.0), isnan(_7147)), level(0.0)).xyzw;
    float _2651 = _2649.x;
    float _2653 = _2649.y;
    float _2655 = _2649.z;
    float _2657 = _2649.w;
    float2 _7163 = float2(_2644, _2630);
    float3 _2661 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7163, float2(0.0), isnan(_7163)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7163, float2(0.0), isnan(_7163)), level(0.0)).xyz;
    float _2663 = _2661.x;
    float _2665 = _2661.y;
    float _2667 = _2661.z;
    float _2669 = abs(_2204);
    float _2671 = log2(_2669);
    float _2673 = _2530 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2675 = -_1900;
    float _2677 = fma(_1886, _1890, _2675);
    float _2679 = fma(_1886, _1898, _1888);
    float _2681 = _1834 * _1896;
    float _2683 = _1904 * _1842;
    float _2685 = _189 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2687 = _2540 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_82.x = _1968;
    out.m_82.y = _1964;
    out.m_82.z = _1956;
    bool _2689 = _2344 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2691 = isnan(_2344);
    bool _2693 = _2689 || _2691;
    bool _2695 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2697 = _2693 || _2695;
    out.m_84.x = _2194;
    out.m_84.y = _2192;
    out.m_84.z = _2196;
    float _2699 = _2671 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    bool _2701 = _2204 <= 8000.0;
    bool _2703 = isnan(_2204);
    bool _2705 = _2701 || _2703;
    bool _2707 = isnan(8000.0);
    bool _2709 = _2705 || _2707;
    float _2711 = float(_2709);
    float _2713 = _1912 * _1842;
    float _2715 = _2677 * _1842;
    float _2717 = exp2(_2673);
    float _2719 = _1912 * _1844;
    float _2721 = _1912 * _1840;
    float _2723 = _1904 * _1844;
    float _2725 = _1904 * _1840;
    float _2727 = fma(_2679, _1936, _2715);
    float _2729 = fma(_1916, _1926, _2721);
    float _2731 = fma(_2566, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2687);
    float _2733 = exp2(_2699);
    float _2735 = _2616;
    if (!_2697)
    {
        _2044 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2737 = _2044;
    float _2739 = fma(_2520, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2731);
    float _2741 = -_2717;
    float _2743 = _2741 + 1.0;
    float _2745 = fma(_2733, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2747 = precise::clamp(_2745, 0.0, 1.0);
    float _2749 = _2677 * _1844;
    float _2751 = _2677 * _1840;
    float _2753 = fma(_1908, _1936, _2683);
    float _2755 = fma(_2747, -2.0, 3.0);
    float _2757 = _2747 * _2747;
    float _2759 = fma(_1916, _1944, _2719);
    float _2761 = fma(_2679, _1944, _2749);
    float _2763 = fma(_2679, _1926, _2751);
    float _2765 = _2757 * _2755;
    float _2767 = -_1886;
    float _2769 = fma(_2767, _1406, _2759);
    float _2771 = fma(_2681, _1406, _2761);
    float _2773 = -_2765;
    float _2775 = _2773 + 1.0;
    float _2777 = fma(_2775, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2765);
    float _2779 = _2711 * _2777;
    float _2781 = fma(_1916, _1936, _2713);
    float _2783 = fma(_1908, _1944, _2723);
    float _2785 = fma(_1908, _1926, _2725);
    float _2787 = fma(_1918, _1394, _2753);
    float _2789 = -_1886;
    float _2791 = fma(_2789, _1394, _2781);
    float _2793 = fma(_1918, _1406, _2783);
    float _2795 = fma(_1918, _1396, _2785);
    float _2797 = -_1886;
    float _2799 = fma(_2797, _1396, _2729);
    float _2801 = fma(_2681, _1396, _2763);
    float _2803 = _185 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2805 = _2685 * _2787;
    float _2807 = _2685 * _2793;
    float _2809 = _2685 * _2795;
    float _2811 = in.m_86.x;
    float _2813 = fma(_2803, _2791, _2805);
    float _2815 = fma(_2803, _2769, _2807);
    float _2817 = fma(_2803, _2799, _2809);
    float _2819 = _2743 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2821 = fma(_2420, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2739);
    float _2823 = fma(_2681, _1394, _2727);
    float _2825 = _2779 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2827 = _2616 + _2588;
    float _2829 = _2821 + _2588;
    float _2831 = _2588 * 0.5;
    float _2833 = _2771 + _2815;
    float _2835 = _2829 * 0.5;
    float _2837 = _2827 * 0.5;
    float _2839 = fma(_2618, -0.5, _2831);
    float _2841 = _2823 + _2813;
    float _2843 = _2801 + _2817;
    out.gl_Position.x = _2616;
    out.gl_Position.y = _2618;
    out.gl_Position.z = _2821;
    out.gl_Position.w = _2588;
    float _2845 = _2813;
    float _2847 = _2737;
    float _2849 = _2737;
    if (!_2697)
    {
        _2845 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2851 = _2845;
    out.m_88.x = _2837;
    out.m_88.y = _2839;
    out.m_88.z = _2835;
    out.m_88.w = _2588;
    out.m_90.x = _2841;
    out.m_90.y = _2833;
    out.m_90.z = _2843;
    float _2853 = _2851;
    float _2855 = _2851;
    if (!_2697)
    {
        _2735 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2857 = _2735;
    float _2859 = -_2628;
    float _2861 = _2859 + 1.0;
    float _2863 = _2861 * _2825;
    float _2865 = precise::clamp(_2863, 0.0, 1.0);
    float _2867 = -_2865;
    float _2869 = fma(_2867, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2871 = _2869 * _2811;
    float _2873 = _2871 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2875 = _2871;
    float _2877 = _2873;
    float _2879 = _2857;
    float _2881 = _2857;
    if (!_2697)
    {
        _2875 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2883 = _2875;
    float _2885 = _2819 * _2646;
    float _2887 = -_2819;
    float _2889 = _2887 + 1.0;
    out.m_92.x = _2873;
    float _2891 = _2657 * _2885;
    float _2893 = _2667 * _2885;
    float _2895 = _2657 * _2889;
    float _2897 = fma(_2663, _2891, _2651);
    float _2899 = fma(_2665, _2891, _2653);
    float _2901 = fma(_2657, _2893, _2655);
    float _2903 = _2260 * _2322;
    float _2905 = _2903;
    float _2907 = _2883;
    float _2909 = _2883;
    if (!_2697)
    {
        _2877 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2911 = _2877;
    out.m_94.x = _2897;
    out.m_94.y = _2899;
    out.m_94.z = _2901;
    out.m_94.w = _2895;
    float _2913 = _2903 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2915 = _2911;
    float _2917 = _2911;
    if (!_2697)
    {
        _2905 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2919 = _2905;
    bool _2921 = !_2697;
    float _2923 = _2919;
    float _2925 = _2919;
    if (!_2921)
    {
        bool _2927 = _2344 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2929 = isnan(_2344);
        bool _2931 = _2927 || _2929;
        bool _2933 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2935 = _2931 || _2933;
        if (!_2935)
        {
            float _2937 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2939 = _2344 + _2937;
            float _2941 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2943 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2941;
            float _2945 = 1.0 / _2943;
            float _2947 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2949 = _2947 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2951 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2953 = _2951 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2955 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2957 = _2955 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2959 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2961 = _2959 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2963 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2965 = _2963 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2967 = _2939 * _2945;
            float _2969 = precise::clamp(_2967, 0.0, 1.0);
            float _2971 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2973 = _2971 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2975 = fma(_2969, _2949, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2977 = fma(_2969, _2973, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2979 = fma(_2969, _2953, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2981 = fma(_2969, _2957, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2983 = fma(_2969, _2961, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2985 = fma(_2969, _2965, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2881 = _2977;
            _2917 = _2983;
            _2855 = _2975;
            _2849 = _2981;
            _2909 = _2979;
            _2925 = _2985;
            _2987 = true;
        }
        else
        {
            bool _2989 = _2344 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2991 = isnan(_2344);
            bool _2993 = _2989 || _2991;
            bool _2995 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2997 = _2993 || _2995;
            if (!_2997)
            {
                _2853 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2999 = _2853;
            _2855 = _2999;
            if (!_2997)
            {
                _2879 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3001 = _2879;
            _2881 = _3001;
            if (!_2997)
            {
                _2907 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3003 = _2907;
            _2909 = _3003;
            if (!_2997)
            {
                _2847 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3005 = _2847;
            _2849 = _3005;
            if (!_2997)
            {
                _2915 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3007 = _2915;
            _2917 = _3007;
            if (!_2997)
            {
                _2923 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3009 = _2923;
            bool _3011 = !_2997;
            _2925 = _3009;
            if (!_3011)
            {
                bool _3013 = _2344 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3015 = isnan(_2344);
                bool _3017 = _3013 || _3015;
                bool _3019 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3021 = _3017 || _3019;
                if (!_3021)
                {
                    float _3023 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3025 = _2344 + _3023;
                    float _3027 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3029 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3027;
                    float _3031 = 1.0 / _3029;
                    float _3033 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3035 = _3033 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3037 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3039 = _3037 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3041 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3043 = _3041 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3045 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3047 = _3045 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3049 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3051 = _3049 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3053 = _3025 * _3031;
                    float _3055 = precise::clamp(_3053, 0.0, 1.0);
                    float _3057 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3059 = _3057 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3061 = fma(_3055, _3035, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3063 = fma(_3055, _3059, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3065 = fma(_3055, _3039, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3067 = fma(_3055, _3043, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3069 = fma(_3055, _3047, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3071 = fma(_3055, _3051, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2881 = _3063;
                    _2917 = _3069;
                    _2855 = _3061;
                    _2849 = _3067;
                    _2909 = _3065;
                    _2925 = _3071;
                    _2987 = true;
                }
                else
                {
                    _2881 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2917 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2855 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2849 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2909 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2925 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2987 = false;
    float _3073 = _2881;
    float _3075 = _2917;
    float _3077 = _2855;
    float _3079 = _2849;
    float _3081 = _2909;
    float _3083 = _2925;
    float _3085 = fma(_2833, -0.5, 0.5);
    float _3087 = precise::clamp(_3085, 0.0, 1.0);
    float _3089 = -_3073;
    float _3091 = _3089 + _3075;
    float _3093 = _2913 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3095 = -_3077;
    float _3097 = _3095 + _3079;
    float _3099 = fma(_3087, _3091, _3073);
    out.m_96.x = 0.0;
    float _3101 = -_3081;
    float _3103 = _3101 + _3083;
    float _3105 = fma(_3087, _3097, _3077);
    float _3107 = _3099 * 0.586610972881317138671875;
    out.m_53.x = _3093;
    bool _3109 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3111 = fma(_3087, _3103, _3081);
    float _3113 = fma(_3105, 0.298911988735198974609375, _3107);
    bool _3115 = _2260 > 0.0;
    bool _3117 = isnan(_2260);
    bool _3119 = _3115 || _3117;
    bool _3121 = isnan(0.0);
    bool _3123 = _3119 || _3121;
    float _3125 = fma(_3111, 0.114477999508380889892578125, _3113);
    bool _3127 = _2322 <= 0.0;
    bool _3129 = !_3123;
    bool _3131 = _3127 || _3129;
    float _3133 = -_3125;
    float _3135 = _3105 + _3133;
    float _3137 = -_3125;
    float _3139 = _3099 + _3137;
    float _3141 = -_3125;
    float _3143 = _3111 + _3141;
    float _3145 = fma(_3135, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3125);
    float _3147 = fma(_3139, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3125);
    float _3149 = fma(_3143, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3125);
    bool _3151 = !_3109;
    if (!_3151)
    {
        float _3153 = -_2192;
        float _3155 = _3153 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3157 = -_2194;
        float _3159 = _3157 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3161 = -_2196;
        float _3163 = _3161 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3165 = _3155 * _3155;
        float _3167 = fma(_3159, _3159, _3165);
        float _3169 = fma(_3163, _3163, _3167);
        float _3171 = sqrt(_3169);
        float _3173 = rsqrt(_3169);
        float _3175 = -_3171;
        float _3177 = _3175 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3179 = _3177 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3181 = precise::clamp(_3179, 0.0, 1.0);
        float _3183 = _3159 * _3173;
        float _3185 = _3155 * _3173;
        float _3187 = abs(_3181);
        float _3189 = log2(_3187);
        float _3191 = _3163 * _3173;
        float _3193 = _3183 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3195 = _2833 * _3185;
        float _3197 = -_3185;
        float _3199 = -_3193;
        float _3201 = fma(_3197, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3199);
        float _3203 = fma(_2841, _3183, _3195);
        float _3205 = -_3191;
        float _3207 = fma(_3205, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3201);
        float _3209 = fma(_2843, _3191, _3203);
        float _3211 = precise::clamp(_3209, 0.0, 1.0);
        float _3213 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3215 = _3207 + _3213;
        float _3217 = _3189 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3219 = _3215 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3221 = precise::clamp(_3219, 0.0, 1.0);
        float _3223 = exp2(_3217);
        float _3225 = _3223 * _3221;
        float _3227 = _3211 * _3225;
        float _3229 = _3227 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3231 = _3227 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3233 = _3227 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_96.x = _3229;
        out.m_96.y = _3231;
        out.m_96.z = _3233;
    }
    out.m_70.x = _3145;
    out.m_70.y = _3147;
    out.m_70.z = _3149;
    if (!_3131)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_53.x = 0.0;
    float _3235 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3235;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2987 = false;
    bool _213 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _110 = in.m_46.w;
    float _112 = in.m_48.w;
    float _114 = trunc(_110);
    int _117 = int(_114);
    float _119 = -_112;
    float _121 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _121;
    bool _125 = _117 >= 1;
    float _127 = 0.0;
    float _129 = as_type<float>(_117);
    float _131 = _121;
    if (!_125)
    {
        _127 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _133 = _127;
    if (!_125)
    {
        out.m_53.x = 0.0;
    }
    int _135 = 0;
    if (!_125)
    {
        float _137 = _133 * 5.0;
        _135 = as_type<int>(_137);
    }
    int _139 = _135;
    int _141 = _139;
    if (!_125)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3304 = as_type<float>(_139);
        out.gl_Position.z = _3304;
    }
    if (!_125)
    {
        return out;
    }
    bool _143 = _112 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _145 = isnan(_112);
    bool _147 = _143 || _145;
    bool _149 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _151 = _147 || _149;
    float _153 = float(_117);
    bool _155 = _121 >= _153;
    bool _157 = !_151;
    bool _159 = _155 || _157;
    if (_159)
    {
        _129 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _161 = _129;
    if (_159)
    {
        out.m_53.x = 0.0;
    }
    if (_159)
    {
        float _163 = _161 * 5.0;
        _141 = as_type<int>(_163);
    }
    int _165 = _141;
    if (_159)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3359 = as_type<float>(_165);
        out.gl_Position.z = _3359;
    }
    if (_159)
    {
        return out;
    }
    float _167 = as_type<float>(int(gl_VertexIndex));
    float _169 = 1.0 / _153;
    bool _171 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _173 = _121 * _169;
    int _175 = as_type<int>(_167) & 1;
    bool _177 = _175 != 0;
    int _179 = as_type<int>(_167) & 2;
    bool _181 = _179 != 0;
    bool _183 = !_177;
    float _185 = _183 ? (-0.5) : 0.5;
    bool _187 = !_181;
    float _189 = _187 ? (-0.5) : 0.5;
    bool _191 = !_171;
    float _193 = _173;
    float _211;
    if (!_191)
    {
        float _195 = in.m_58.x;
        float _197 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _199 = _195 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _201 = fma(_199, (*spvDescriptorSet0.vp_c9)._m0[12].x, _121);
        float _203 = _201 * _197;
        float _205 = floor(_203);
        float _207 = -_205;
        float _209 = _203 + _207;
        _211 = _209;
        _213 = true;
    }
    else
    {
        _211 = _173;
    }
    _213 = false;
    float _215 = _211;
    float _217 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _219 = _215 + _217;
    float _221 = in.m_60.x;
    float _223 = in.m_60.y;
    bool _225 = _215 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _227 = isnan(_215);
    bool _229 = _225 || _227;
    bool _231 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _233 = _229 || _231;
    float _235 = float(_233);
    float _237 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _239 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _237;
    bool _241 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _243 = 1.0 / _239;
    float _245 = -_235;
    float _247 = _245 + 1.0;
    float _249 = _219 * _243;
    bool _251 = _215 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _253 = isnan(_215);
    bool _255 = _251 || _253;
    bool _257 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _259 = _255 || _257;
    float _261 = float(_259);
    float _263 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _265 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _263;
    float _267 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _269 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _267;
    float _271 = _261 * _247;
    float _273 = fma(_265, _249, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _275 = fma(_269, _249, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _277 = -_261;
    float _279 = _277 + 1.0;
    float _281 = _273 * _271;
    float _283 = _275 * _271;
    float _285 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[143].x, _281);
    float _287 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[143].y, _283);
    float _289 = fma(_235, (*spvDescriptorSet0.vp_c9)._m0[144].x, _285);
    float _291 = fma(_235, (*spvDescriptorSet0.vp_c9)._m0[144].y, _287);
    float _293 = _289 * _221;
    float _295 = _291 * _223;
    bool _297 = !_241;
    if (!_297)
    {
        float _299 = in.m_58.x;
        float _301 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _303 = _299 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _305 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[11].y, _121);
        float _307 = _305 * _301;
        float _309 = floor(_307);
        float _311 = -_309;
        float _313 = _307 + _311;
        _193 = _313;
    }
    float _315 = _193;
    float _317 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _319 = int(_317);
    float _321 = in.m_62.x;
    float _323 = in.m_62.y;
    float _325 = in.m_62.z;
    float _327 = in.m_62.w;
    float _329 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _331 = int(_329);
    float _333 = float(_319);
    float _335 = 1.0 / _333;
    float _337 = float(uint(_331));
    bool _339 = _331 == 0;
    int _341 = ~_331;
    int _343 = _341 + 1;
    float _345 = 1.0 / _337;
    float _347 = _335 * _121;
    float _349 = trunc(_347);
    int _351 = int(_349);
    int _353 = as_type<int>(_345) + (-2);
    float _355 = float(uint(_351));
    float _357 = float(_351);
    float _359 = as_type<float>(_353) * _355;
    int _361 = ~_331;
    int _363 = _361 + 1;
    float _365 = trunc(_359);
    float _367 = precise::max(_365, 0.0);
    uint _370 = uint(_367);
    int _372 = ~_331;
    int _374 = _372 + 1;
    int _376 = _363 * int(_370);
    int _378 = _376 + _351;
    float _380 = in.m_58.x;
    float _382 = in.m_58.y;
    float _384 = float(uint(_378));
    float _386 = as_type<float>(_353) * _384;
    int _388 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _390 = _388 != 0;
    float _392 = trunc(_386);
    float _394 = precise::max(_392, 0.0);
    uint _396 = uint(_394);
    bool _398 = !_390;
    float _400 = _398 ? 7.345489978790283203125 : 1.0;
    float _402 = _400 * _380;
    float _404 = floor(_402);
    int _406 = int(_370) + int(_396);
    float _408 = float(_331);
    int _410 = _374 * _406;
    int _412 = _410 + _351;
    bool _414 = _357 >= _408;
    bool _416 = isnan(_357);
    bool _418 = _414 || _416;
    bool _420 = isnan(_408);
    bool _422 = _418 || _420;
    float _424 = float(_422);
    bool _426 = uint(_412) >= uint(_331);
    float _428 = trunc(_424);
    int _430 = int(_428);
    bool _432 = !_426;
    int _434 = _432 ? 0 : (-1);
    float _436 = -_404;
    float _438 = _402 + _436;
    int _440 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _442 = _440 != 0;
    int _444 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _446 = _444 != 0;
    int _448 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _450 = _448 != 0;
    int _452 = ~_406;
    int _454 = _452 + _434;
    int _456 = _454 + 1;
    int _458 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _460 = _458 != 0;
    int _462 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _464 = _462 != 0;
    int _466 = _331 * _456;
    int _468 = _466 + _351;
    int _470 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _472 = _470 != 0;
    bool _474 = !_339;
    int _476 = _474 ? _468 : (-1);
    float _478 = _438 * _408;
    float _480 = _408 * _121;
    int _482 = ~_430;
    int _484 = _482 + 1;
    int _486 = _484 + 1;
    float _488 = trunc(_478);
    int _490 = int(_488);
    float _492 = _480 * _169;
    bool _494 = !_446;
    int _496 = _494 ? 0 : 1;
    int _498 = _476 * _486;
    int _500 = _331 + (-1);
    bool _502 = !_442;
    int _504 = _502 ? 0 : 1;
    float _506 = trunc(_492);
    int _508 = int(_506);
    int _510 = _430 * _500;
    int _512 = _510 + _498;
    int _514 = abs(_496);
    bool _516 = !_450;
    int _518 = _516 ? 0 : 1;
    bool _520 = !_460;
    int _522 = _520 ? 0 : 1;
    int _524 = _512 * _514;
    int _526 = abs(_504);
    int _528 = abs(_518);
    int _530 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _532 = _530 != 0;
    int _534 = abs(_522);
    bool _536 = !_532;
    int _538 = _536 ? 0 : 1;
    int _540 = _490 * _534;
    int _542 = _540 + _351;
    float _544 = in.m_64.x;
    float _546 = in.m_64.y;
    float _548 = in.m_64.z;
    float _550 = in.m_64.w;
    int _552 = _508 * _526;
    int _554 = _552 + _524;
    int _556 = abs(_538);
    float _558 = in.m_46.x;
    float _560 = in.m_46.y;
    float _562 = in.m_46.z;
    int _564 = _542 * _528;
    int _566 = _564 + _554;
    int _568 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _570 = _568 != 0;
    int _572 = ~_331;
    int _574 = _572 + 1;
    int _576 = _490 * _556;
    int _578 = _576 + _566;
    float _580 = in.m_66.x;
    float _582 = in.m_66.y;
    float _584 = in.m_66.z;
    float _586 = in.m_66.w;
    float _588 = float(uint(_578));
    float _590 = as_type<float>(_353) * _588;
    float _592 = trunc(_590);
    float _594 = precise::max(_592, 0.0);
    uint _596 = uint(_594);
    float _598 = _560 * _323;
    float _600 = _560 * _546;
    float _602 = fma(_558, _321, _598);
    float _604 = float(uint(_542));
    float _606 = fma(_558, _544, _600);
    float _608 = _560 * _582;
    float _610 = fma(_562, _325, _602);
    float _612 = as_type<float>(_353) * _604;
    float _614 = fma(_558, _580, _608);
    int _616 = _574 * int(_596);
    int _618 = _616 + _578;
    float _620 = fma(_562, _548, _606);
    float _622 = fma(_562, _584, _614);
    float _624 = float(uint(_618));
    float _626 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _628 = _626 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _630 = trunc(_612);
    float _632 = precise::max(_630, 0.0);
    uint _634 = uint(_632);
    float _636 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _638 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _640 = as_type<float>(_353) * _624;
    float _642 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _644 = _642 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _646 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _648 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _646;
    float _650 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _652 = 1.0 / _644;
    float _654 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _656 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _658 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _660 = _658 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _662 = _650 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _664 = _636 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _666 = _656 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _668 = trunc(_640);
    float _670 = precise::max(_668, 0.0);
    uint _672 = uint(_670);
    int _674 = _343 * int(_634);
    int _676 = _674 + _542;
    int _678 = ~_331;
    int _680 = _678 + 1;
    float _682 = _382 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    out.m_68.x = _662;
    out.m_68.y = _664;
    out.m_68.z = _666;
    out.m_68.w = _638;
    float _684 = float(uint(_676));
    float _686 = fma(_682, -2.0, _654);
    float _688 = 1.0 / _628;
    float _690 = _648 * _652;
    float _692 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _694 = _692 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _696 = as_type<float>(_353) * _684;
    float _698 = _620 + _550;
    float _700 = _622 + _586;
    float _702 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[76].y, _686);
    int _704 = int(_596) + int(_672);
    float _706 = trunc(_696);
    float _708 = precise::max(_706, 0.0);
    uint _710 = uint(_708);
    float _712 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _714 = _698 + _712;
    float _716 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _718 = _315 + _716;
    int _720 = _680 * _704;
    int _722 = _720 + _578;
    float _724 = _660 * _688;
    float _726 = 1.0 / _694;
    bool _728 = uint(_722) >= uint(_331);
    float _730 = _610 + _327;
    int _732 = ~_331;
    int _734 = _732 + 1;
    bool _736 = !_728;
    int _738 = _736 ? 0 : (-1);
    float _740 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _742 = _730 + _740;
    bool _744 = _380 > 0.5;
    int _746 = ~_704;
    int _748 = _746 + _738;
    int _750 = _748 + 1;
    float _752 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _754 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _752;
    int _756 = int(_634) + int(_710);
    float _758 = _714 * _714;
    bool _760 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _762 = isnan(_315);
    bool _764 = _760 || _762;
    bool _766 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _768 = _764 || _766;
    float _770 = float(_768);
    int _772 = _331 * _750;
    int _774 = _772 + _578;
    float _776 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _778 = _700 + _776;
    float _780 = fma(_742, _742, _758);
    int _782 = _734 * _756;
    int _784 = _782 + _542;
    float _786 = _754 * _726;
    bool _788 = !_339;
    int _790 = _788 ? _774 : (-1);
    float _792 = fma(_778, _778, _780);
    bool _794 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _796 = isnan(_315);
    bool _798 = _794 || _796;
    bool _800 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _802 = _798 || _800;
    float _804 = float(_802);
    float _806 = fma(_690, _718, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _808 = uint(_784) >= uint(_331);
    float _810 = sqrt(_792);
    int _812 = _790 & 3;
    bool _814 = _812 != 0;
    float _816 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _818 = _315 + _816;
    float _820 = -_185;
    int _822 = _744 ? as_type<int>(_820) : as_type<int>(_185);
    float _824 = _293 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _826 = !_808;
    int _828 = _826 ? 0 : (-1);
    float _830 = -_770;
    float _832 = _830 + 1.0;
    int _834 = _814 ? 0 : 1;
    float _836 = rsqrt(_792);
    int _838 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _840 = _838 != 0;
    int _842 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _844 = _842 != 0;
    int _846 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _848 = _846 != 0;
    float _850 = -_804;
    float _852 = _850 + 1.0;
    bool _854 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _856 = isnan(_315);
    bool _858 = _854 || _856;
    bool _860 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _862 = _858 || _860;
    float _864 = float(_862);
    float _866 = fma(_724, _818, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _868 = _804 * _832;
    float _870 = _824 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    bool _872 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _874 = isnan(_315);
    bool _876 = _872 || _874;
    bool _878 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _880 = _876 || _878;
    float _882 = float(_880);
    float _884 = _810 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _886 = _864 * _852;
    float _888 = -_864;
    float _890 = _888 + 1.0;
    float _892 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _894 = _315 + _892;
    float _896 = precise::min(_870, _884);
    float _898 = _882 * _890;
    float _900 = fma(_786, _894, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _902 = _714 * _836;
    float _904 = _742 * _836;
    float _906 = _806 * _898;
    int _908 = _790 >> 31;
    float _910 = _902 * _896;
    float _912 = _904 * _896;
    float _914 = -_882;
    float _916 = _914 + 1.0;
    int _918 = _908 & 3;
    float _920 = -_910;
    float _922 = _714 + _920;
    float _924 = -_912;
    float _926 = _742 + _924;
    float _928 = fma(_916, (*spvDescriptorSet0.vp_c9)._m0[115].x, _906);
    int _930 = _790 + _918;
    float _932 = _922 * _922;
    float _934 = _778 * _836;
    float _936 = fma(_866, _886, _928);
    float _938 = fma(_926, _926, _932);
    int _940 = _930 >> 2;
    float _942 = _934 * _896;
    float _944 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _946 = !_464;
    float _948 = _946 ? _185 : as_type<float>(_822);
    float _950 = _380 * 2.0;
    int _952 = _940 << 4;
    int _954 = _952 + 368;
    float _956 = -_942;
    float _958 = _778 + _956;
    bool _960 = _382 > 0.5;
    float _962 = -_944;
    float _964 = fma(_950, (*spvDescriptorSet0.vp_c9)._m0[77].x, _962);
    uint _966 = uint(int(uint(_954) >> uint(2)));
    uint _968 = uint(int(uint(int(_966)) >> uint(2)));
    int _970 = int(_966) & 3;
    float _972 = (*spvDescriptorSet0.vp_c9)._m0[int(_968)][_970];
    int _974 = int(_966) + 1;
    uint _976 = uint(int(uint(_974) >> uint(2)));
    int _978 = _974 & 3;
    float _980 = (*spvDescriptorSet0.vp_c9)._m0[int(_976)][_978];
    float _982 = fma(_958, _958, _938);
    float _984 = -_189;
    int _986 = _960 ? as_type<int>(_984) : as_type<int>(_189);
    float _988 = _948 + 0.5;
    int _990 = _790 & 3;
    bool _992 = _990 != 0;
    float _994 = -_121;
    float _996 = fma(_994, (*spvDescriptorSet0.vp_c9)._m0[76].x, _964);
    float _998 = sqrt(_982);
    bool _1000 = !_472;
    float _1002 = _1000 ? _189 : as_type<float>(_986);
    float _1004 = fma(_900, _868, _936);
    bool _1006 = uint(_990) > 1u;
    float _1008 = fma(_988, (*spvDescriptorSet0.vp_c9)._m0[80].x, _996);
    float _1010 = _714 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1012 = _954 + 8;
    uint _1014 = uint(int(uint(_1012) >> uint(2)));
    uint _1016 = uint(int(uint(int(_1014)) >> uint(2)));
    int _1018 = int(_1014) & 3;
    float _1020 = (*spvDescriptorSet0.vp_c9)._m0[int(_1016)][_1018];
    int _1022 = int(_1014) + 1;
    uint _1024 = uint(int(uint(_1022) >> uint(2)));
    int _1026 = _1022 & 3;
    float _1028 = (*spvDescriptorSet0.vp_c9)._m0[int(_1024)][_1026];
    float _1030 = _1002 + (-0.5);
    float _1032 = fma(_770, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1004);
    float _1034 = fma(_742, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1010);
    int _1036 = ~_756;
    int _1038 = _1036 + _828;
    int _1040 = _1038 + 1;
    float _1042 = -_1030;
    float _1044 = -_702;
    float _1046 = fma(_1042, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1044);
    int _1048 = ~_834;
    int _1050 = _1048 + 1;
    int _1052 = _1050 + 1;
    float _1054 = fma(_778, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1034);
    out.m_70.w = _896;
    int _1056 = _331 * _1040;
    int _1058 = _1056 + _542;
    int _1060 = _1052;
    float _1062 = _700;
    float _1064 = _912;
    if (!_1006)
    {
        int _1066 = ~_834;
        int _1068 = _1066 + 1;
        _1060 = _1068;
    }
    int _1070 = _1060;
    float _1072 = _836 * _998;
    bool _1074 = !_992;
    int _1076 = _1074 ? 0 : 1;
    bool _1078 = uint(_990) >= 2u;
    float _1080 = _824 * _1072;
    bool _1082 = _990 != 3;
    int _1084 = _1078 ? 0 : 1;
    float _1086 = _1080 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    bool _1088 = _990 != 3;
    int _1090 = abs(_1070);
    float _1092 = _902 * _1086;
    bool _1094 = !_1082;
    int _1096 = _1094 ? 0 : (-1);
    bool _1098 = _1054 >= 0.0;
    float _1100 = _904 * _1086;
    float _1102 = -_1092;
    float _1104 = _714 + _1102;
    int _1106 = abs(_1076);
    float _1108 = _934 * _1086;
    int _1110 = ~_1090;
    int _1112 = _1110 + 1;
    int _1114 = _1112 + 1;
    float _1116 = _1104 * _1104;
    int _1118 = ~_1084;
    int _1120 = _1118 + 1;
    int _1122 = _1120 + 1;
    float _1124 = -_1100;
    float _1126 = _742 + _1124;
    int _1128 = _1122;
    float _1130 = _1092;
    float _1132 = _1108;
    float _1134 = _1100;
    if (_1088)
    {
        int _1136 = ~_1084;
        int _1138 = _1136 + 1;
        _1128 = _1138;
    }
    int _1140 = _1128;
    int _1142 = _1114 * as_type<int>(_980);
    int _1144 = ~_1106;
    int _1146 = _1144 + 1;
    int _1148 = _1146 + 1;
    float _1150 = fma(_1126, _1126, _1116);
    int _1152 = abs(_1140);
    float _1154 = -_1108;
    float _1156 = _778 + _1154;
    int _1158 = abs(_1096);
    int _1160 = _1148 * as_type<int>(_972);
    int _1162 = _1160 + _1142;
    float _1164 = fma(_1156, _1156, _1150);
    bool _1166 = !_570;
    int _1168 = _1166 ? 0 : 1;
    float _1170 = _1156;
    if (_1098)
    {
        out.m_53.x = 0.0;
    }
    int _1172 = ~_1152;
    int _1174 = _1172 + 1;
    int _1176 = _1174 + 1;
    float _1178 = sqrt(_1164);
    int _1180 = abs(_1168);
    int _1182 = _1176 * as_type<int>(_1020);
    int _1184 = _1182 + _1162;
    float _1186 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1188 = ~_1158;
    int _1190 = _1188 + 1;
    int _1192 = _1190 + 1;
    float _1194 = _1032 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1196 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1198 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1186);
    int _1200 = _1192 * as_type<int>(_1028);
    int _1202 = _1200 + _1184;
    int _1204 = ~_1180;
    int _1206 = _1204 + 1;
    int _1208 = _1206 + 1;
    float _1210 = fma(_382, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1196);
    bool _1212 = !_339;
    int _1214 = _1212 ? _1058 : (-1);
    float _1216 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1198);
    int _1218 = _1202 * _1208;
    float _1220 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1210);
    float _1222 = -_1216;
    float _1224 = _1222 + 1.0;
    int _1226 = _1214 * _1180;
    int _1228 = _1226 + _1218;
    float _1230 = -_1220;
    float _1232 = _1230 + 1.0;
    float _1234 = -_1224;
    float _1236 = fma(_948, _1234, _1008);
    if (_1098)
    {
        _1170 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1238 = _1170;
    float _1240 = fma(_1002, _1232, _1046);
    float _1242 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1244 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1246 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1248 = _836 * _1178;
    float _1250 = _1242 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1252 = _1244 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1254 = _1246 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1256 = as_type<int>(_1238);
    if (_1098)
    {
        float _1258 = _1238 * 5.0;
        _1256 = as_type<int>(_1258);
    }
    int _1260 = _1256;
    float _1262 = float(_1228);
    float _1264 = _1080 * _1248;
    out.m_72.x = _1236;
    out.m_72.y = _1240;
    bool _1266 = !_844;
    int _1268 = _1266 ? 0 : 1;
    bool _1270 = !_848;
    int _1272 = _1270 ? 0 : 1;
    out.m_74.x = _1250;
    out.m_74.y = _1252;
    out.m_74.z = _1254;
    out.m_74.w = _1194;
    bool _1274 = !_840;
    int _1276 = _1274 ? 0 : 1;
    if (_1098)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5022 = as_type<float>(_1260);
        out.gl_Position.z = _5022;
    }
    out.m_76.x = _1262;
    out.m_78.x = _1264;
    if (_1098)
    {
        return out;
    }
    float _1278 = -_1092;
    float _1280 = _698 + _1278;
    float _1282 = -_1100;
    float _1284 = _730 + _1282;
    float _1286 = -_1108;
    float _1288 = _700 + _1286;
    float _1290 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1292 = _1280 + _1290;
    float _1294 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1296 = _1284 + _1294;
    float _1298 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1300 = _1288 + _1298;
    float _1302 = _1292 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1304 = fma(_1296, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1302);
    float _1306 = fma(_1300, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1304);
    bool _1308 = _1306 >= 0.0;
    float _1310 = _1300;
    if (_1308)
    {
        _1310 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1312 = _1310;
    int _1314 = as_type<int>(_1312);
    if (_1308)
    {
        out.m_53.x = 0.0;
    }
    if (_1308)
    {
        float _1316 = _1312 * 5.0;
        _1314 = as_type<int>(_1316);
    }
    int _1318 = _1314;
    if (_1308)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5107 = as_type<float>(_1318);
        out.gl_Position.z = _5107;
    }
    if (_1308)
    {
        return out;
    }
    float _1320 = -_698;
    float _1322 = _1320 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1324 = -_730;
    float _1326 = _1324 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1328 = -_700;
    float _1330 = _1328 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1332 = _1322 * _1322;
    float _1334 = floor(_950);
    float _1336 = fma(_1326, _1326, _1332);
    float _1338 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1340 = _295 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1342 = fma(_1330, _1330, _1336);
    float _1344 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _1346 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1348 = -_1338;
    float _1350 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _1348);
    float _1352 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1354 = -_1344;
    float _1356 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1354);
    float _1358 = rsqrt(_1342);
    float _1360 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1362 = -_1352;
    float _1364 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1362);
    int _1366 = abs(_1276);
    float _1368 = -_910;
    float _1370 = _698 + _1368;
    float _1372 = -_1360;
    float _1374 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1372);
    float _1376 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    bool _1378 = _1334 > 0.0;
    bool _1380 = _1334 >= 0.0;
    bool _1382 = isnan(_1334);
    bool _1384 = _1380 || _1382;
    bool _1386 = isnan(0.0);
    bool _1388 = _1384 || _1386;
    float _1390 = -_1376;
    float _1392 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _1390);
    float _1394 = _1326 * _1358;
    float _1396 = _1330 * _1358;
    float _1398 = -_1346;
    float _1400 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1398);
    float _1402 = _1350 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1404 = _1394 * _1394;
    float _1406 = _1322 * _1358;
    float _1408 = _1400 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1410 = -_1402;
    float _1412 = fma(_1356, (*spvDescriptorSet0.vp_c8)._m0[1].y, _1410);
    float _1414 = fma(_1396, _1396, _1404);
    float _1416 = _1400 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1418 = _382 * 2.0;
    float _1420 = fma(_1374, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1412);
    float _1422 = rsqrt(_1414);
    float _1424 = -_1416;
    float _1426 = fma(_1356, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1424);
    float _1428 = fma(_1364, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1426);
    float _1430 = floor(_1418);
    float _1432 = _1428 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1434 = -_1408;
    float _1436 = fma(_1350, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1434);
    float _1438 = _1364 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1440 = -_1432;
    float _1442 = fma(_1420, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1440);
    float _1444 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1436);
    float _1446 = -_1438;
    float _1448 = fma(_1374, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1446);
    float _1450 = _1396 * _1422;
    float _1452 = _1394 * _1422;
    float _1454 = fma(_1444, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1442);
    float _1456 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1448);
    float _1458 = -_1450;
    float _1460 = _1396 * _1458;
    float _1462 = -_1450;
    float _1464 = _1406 * _1462;
    float _1466 = _1400 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _1468 = -_1456;
    float _1470 = fma(_1468, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1454);
    float _1472 = -_1460;
    float _1474 = fma(_1394, _1452, _1472);
    float _1476 = _1406 * _1452;
    float _1478 = -_1466;
    float _1480 = fma(_1356, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1478);
    bool _1482 = _1430 > 0.0;
    float _1484 = _1474 * _1474;
    float _1486 = 1.0 / _1470;
    float _1488 = fma(_1364, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1480);
    bool _1490 = _1430 >= 0.0;
    bool _1492 = isnan(_1430);
    bool _1494 = _1490 || _1492;
    bool _1496 = isnan(0.0);
    bool _1498 = _1494 || _1496;
    float _1500 = fma(_1476, _1476, _1484);
    float _1502 = in.m_58.z;
    float _1504 = fma(_1464, _1464, _1500);
    float _1506 = _1350 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _1508 = rsqrt(_1504);
    float _1510 = -_1506;
    float _1512 = fma(_1356, (*spvDescriptorSet0.vp_c8)._m0[0].y, _1510);
    float _1514 = _1400 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1516 = fma(_1374, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1512);
    float _1518 = -_1514;
    float _1520 = fma(_1350, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1518);
    float _1522 = fma(_1488, _1486, -1.0);
    float _1524 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1520);
    int _1526 = _1498 ? 0 : 1;
    int _1528 = ~_1526;
    int _1530 = _1528 + 1;
    int _1532 = _1530 + 1;
    float _1534 = _1474 * _1508;
    float _1536 = precise::clamp(_1534, 0.0, 1.0);
    int _1538 = _1532;
    if (!_1482)
    {
        int _1540 = ~_1526;
        int _1542 = _1540 + 1;
        _1538 = _1542;
    }
    int _1544 = _1538;
    float _1546 = _1502 * 2.0;
    float _1548 = -_1536;
    float _1550 = _1548 + 1.0;
    float _1552 = _1550 * _1486;
    float _1554 = fma(_1550, _1522, 1.0);
    float _1556 = floor(_1546);
    float _1558 = _1516 * _1552;
    float _1560 = _1554 * _1554;
    float _1562 = _1524 * _1552;
    float _1564 = fma(_1558, _1558, _1560);
    float _1566 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1568 = log2(_1566);
    float _1570 = fma(_1562, _1562, _1564);
    float _1572 = rsqrt(_1570);
    bool _1574 = _1556 > 0.0;
    bool _1576 = _1556 >= 0.0;
    bool _1578 = isnan(_1556);
    bool _1580 = _1576 || _1578;
    bool _1582 = isnan(0.0);
    bool _1584 = _1580 || _1582;
    float _1586 = _382 + _380;
    int _1588 = _1584 ? 0 : 1;
    float _1590 = _1586 + (-1.0);
    int _1592 = ~_1588;
    int _1594 = _1592 + 1;
    int _1596 = _1594 + 1;
    float _1598 = fma(_1590, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1600 = _1568 * _121;
    int _1602 = _1596;
    if (!_1574)
    {
        int _1604 = ~_1588;
        int _1606 = _1604 + 1;
        _1602 = _1606;
    }
    int _1608 = _1602;
    float _1610 = _1562 * _1572;
    float _1612 = float(_1366);
    float _1614 = _1554 * _1572;
    float _1616 = float(_1608);
    float _1618 = _1558 * _1572;
    float _1620 = -_1610;
    float _1622 = _1394 * _1620;
    float _1624 = exp2(_1600);
    float _1626 = _1612 * _1616;
    float _1628 = _1396 * _1614;
    float _1630 = -_1618;
    float _1632 = -_1622;
    float _1634 = fma(_1396, _1630, _1632);
    float _1636 = -_1618;
    float _1638 = _1406 * _1636;
    bool _1640 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1642 = isnan(1.0);
    bool _1644 = _1640 || _1642;
    bool _1646 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1648 = _1644 || _1646;
    float _1650 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1652 = 1.0 + _1650;
    float _1654 = -_1610;
    float _1656 = -_1628;
    float _1658 = fma(_1406, _1654, _1656);
    bool _1660 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1662 = isnan(0.0);
    bool _1664 = _1660 || _1662;
    bool _1666 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1668 = _1664 || _1666;
    float _1670 = -_1638;
    float _1672 = fma(_1394, _1614, _1670);
    float _1674 = in.m_80.x;
    float _1676 = in.m_80.y;
    float _1678 = in.m_80.z;
    float _1680 = _1634 * _1634;
    float _1682 = 1.0 / _1652;
    float _1684 = _1502 + _380;
    float _1686 = _380 + (-0.5);
    float _1688 = fma(_1658, _1658, _1680);
    float _1690 = -_1624;
    float _1692 = _1690 + 1.0;
    int _1694 = abs(_1272);
    float _1696 = _1684 + (-1.0);
    float _1698 = fma(_1672, _1672, _1688);
    float _1700 = _1668 ? _1692 : 0.0;
    float _1702 = rsqrt(_1698);
    float _1704 = float(_1544);
    float _1706 = fma(_1696, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    if (_1648)
    {
        float _1708 = _1700 * _1682;
        _131 = _1708;
    }
    float _1710 = _131;
    float _1712 = _1626 * (-2.0);
    float _1714 = float(_1694);
    int _1716 = _1388 ? 0 : 1;
    float _1718 = fma(_1598, _1712, _1598);
    float _1720 = fma(_1712, _1674, _1674);
    float _1722 = _1714 * _1704;
    int _1724 = ~_1716;
    int _1726 = _1724 + 1;
    int _1728 = _1726 + 1;
    float _1730 = _1502 + (-0.5);
    float _1732 = fma(_1686, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1720);
    float _1734 = _1722 * (-2.0);
    int _1736 = _1728;
    if (!_1378)
    {
        int _1738 = ~_1716;
        int _1740 = _1738 + 1;
        _1736 = _1740;
    }
    int _1742 = _1736;
    float _1744 = _1658 * _1702;
    float _1746 = fma(_1718, _1710, _1732);
    float _1748 = _1672 * _1702;
    float _1750 = fma(_1706, _1734, _1706);
    float _1752 = _1396 * _1744;
    float _1754 = fma(_1734, _1678, _1678);
    int _1756 = abs(_1268);
    float _1758 = _1634 * _1702;
    float _1760 = _1406 * _1748;
    float _1762 = -_1752;
    float _1764 = fma(_1394, _1748, _1762);
    float _1766 = _1746 * 0.15915493667125701904296875;
    float _1768 = -_1760;
    float _1770 = fma(_1396, _1758, _1768);
    float _1772 = _1394 * _1758;
    float _1774 = _1764 * _1764;
    float _1776 = float(_1742);
    float _1778 = _382 + _1502;
    float _1780 = float(_1756);
    float _1782 = -_1772;
    float _1784 = fma(_1406, _1744, _1782);
    float _1786 = fma(_1770, _1770, _1774);
    float _1788 = _1778 + (-1.0);
    float _1790 = _1780 * _1776;
    float _1792 = fma(_1784, _1784, _1786);
    float _1794 = _382 + (-0.5);
    float _1796 = fma(_1788, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1798 = _1790 * (-2.0);
    float _1800 = fma(_1730, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1754);
    float _1802 = _1766 * 6.283185482025146484375;
    float _1804 = sin(_1802);
    bool _1806 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1808 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1810 = _1806 || _1808;
    bool _1812 = isnan(0.5);
    bool _1814 = _1810 || _1812;
    float _1816 = fma(_1798, _1676, _1676);
    float _1818 = fma(_1796, _1798, _1796);
    float _1820 = fma(_1750, _1710, _1800);
    float _1822 = fma(_1794, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1816);
    float _1824 = rsqrt(_1792);
    float _1826 = fma(_1818, _1710, _1822);
    float _1828 = _1826 * 0.15915493667125701904296875;
    float _1830 = _1340 * _1072;
    float _1832 = _1766 * 6.283185482025146484375;
    float _1834 = cos(_1832);
    float _1836 = _1830 * _1248;
    float _1838 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _189);
    float _1840 = _1784 * _1824;
    float _1842 = _1770 * _1824;
    float _1844 = _1764 * _1824;
    float _1846 = _1820 * 0.15915493667125701904296875;
    float _1848 = _1394 * _1840;
    float _1850 = _1406 * _1842;
    float _1852 = _1396 * _1844;
    float _1854 = _1846 * 6.283185482025146484375;
    float _1856 = sin(_1854);
    float _1858 = -_1848;
    float _1860 = fma(_1396, _1842, _1858);
    float _1862 = -_1850;
    float _1864 = fma(_1394, _1844, _1862);
    float _1866 = -_1852;
    float _1868 = fma(_1406, _1840, _1866);
    float _1870 = _1836 * _1838;
    float _1872 = _1860 * _1860;
    float _1874 = _1846 * 6.283185482025146484375;
    float _1876 = cos(_1874);
    float _1878 = fma(_1868, _1868, _1872);
    float _1880 = fma(_1864, _1864, _1878);
    float _1882 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _185);
    float _1884 = _1828 * 6.283185482025146484375;
    float _1886 = sin(_1884);
    float _1888 = _1804 * _1856;
    float _1890 = _1834 * _1856;
    float _1892 = _1264 * _1882;
    float _1894 = _1828 * 6.283185482025146484375;
    float _1896 = cos(_1894);
    float _1898 = _1834 * _1876;
    float _1900 = _1804 * _1876;
    float _1902 = rsqrt(_1880);
    float _1904 = fma(_1886, _1888, _1898);
    float _1906 = -_1890;
    float _1908 = fma(_1886, _1900, _1906);
    float _1910 = _1908 * _1870;
    float _1912 = _1856 * _1896;
    float _1914 = _1904 * _1870;
    float _1916 = _1876 * _1896;
    float _1918 = _1804 * _1896;
    float _1920 = fma(_1912, _1892, _1914);
    float _1922 = fma(_1916, _1892, _1910);
    float _1924 = _1918 * _1870;
    float _1926 = _1864 * _1902;
    float _1928 = _1920 * _1840;
    float _1930 = _1920 * _1842;
    float _1932 = -_1886;
    float _1934 = fma(_1932, _1892, _1924);
    float _1936 = _1868 * _1902;
    float _1938 = fma(_1922, _1926, _1928);
    float _1940 = -_942;
    float _1942 = _700 + _1940;
    float _1944 = _1860 * _1902;
    float _1946 = fma(_1922, _1936, _1930);
    float _1948 = fma(_1934, _1396, _1938);
    float _1950 = -_912;
    float _1952 = _730 + _1950;
    float _1954 = -_1108;
    float _1956 = _1954 + _1942;
    float _1958 = fma(_1934, _1394, _1946);
    float _1960 = _700 + _1948;
    float _1962 = -_1092;
    float _1964 = _1962 + _1370;
    float _1966 = -_1100;
    float _1968 = _1966 + _1952;
    float _1970 = _730 + _1958;
    float _1972 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1974 = _1960 + _1972;
    float _1976 = _1964 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1978 = _1920 * _1844;
    float _1980 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1982 = _1970 + _1980;
    float _1984 = _1974 * _1974;
    float _1986 = fma(_1968, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1976);
    float _1988 = fma(_1922, _1944, _1978);
    float _1990 = fma(_1982, _1982, _1984);
    float _1992 = fma(_1956, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1986);
    float _1994 = _1964 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1996 = fma(_1934, _1406, _1988);
    float _1998 = sqrt(_1990);
    float _2000 = _1992 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2002 = fma(_1968, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1994);
    bool _2004 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2006 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2008 = _2004 || _2006;
    bool _2010 = isnan(0.5);
    bool _2012 = _2008 || _2010;
    float _2014 = _698 + _1996;
    float _2016 = fma(_1956, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2002);
    float _2018 = 1.0 / _2000;
    float _2020 = _2016 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2022 = _2020 + _2000;
    bool _2024 = _1998 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2026 = _2022 * _2018;
    float _2028 = _2026 * 0.5;
    float _2030 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2032 = fma(_2028, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2030);
    float _2034 = _1934;
    float _2036 = _1970;
    float _2038 = _1960;
    float _2040 = _1996;
    float _2042 = _1982;
    float _2044 = _1956;
    if (!_2024)
    {
        _2034 = _2014;
    }
    float _2046 = _2034;
    bool _2048 = !_2024;
    float _2050 = _2046;
    if (!_2048)
    {
        float _2052 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2054 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2056 = _1998 + _2054;
        float _2058 = rsqrt(_1990);
        float _2060 = _2056 * _2052;
        float _2062 = _2014 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2064 = _2060 * 0.15915493667125701904296875;
        float _2066 = _2064 * 6.283185482025146484375;
        float _2068 = cos(_2066);
        float _2070 = _2064 * 6.283185482025146484375;
        float _2072 = sin(_2070);
        float _2074 = _2068 + (-1.0);
        float _2076 = fma(_2072, _2062, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2078 = _2074 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2080 = _2058 * _2076;
        float _2082 = fma(_2014, _2068, _2078);
        float _2084 = fma(_1982, _2080, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2086 = fma(_1974, _2080, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2050 = _2082;
        _2036 = _2084;
        _2038 = _2086;
        _2040 = _2076;
    }
    float _2088 = _2050;
    float _2090 = _2036;
    float _2092 = _2038;
    float _2094 = _2040;
    float _2096 = 1.0 / _2032;
    float _2098 = -_910;
    float _2100 = _2098 + _2088;
    float _2102 = -_912;
    float _2104 = _2102 + _2090;
    float _2106 = -_942;
    float _2108 = _2106 + _2092;
    float _2110 = -_1092;
    float _2112 = _2110 + _2100;
    float _2114 = -_1100;
    float _2116 = _2114 + _2104;
    float _2118 = -_1108;
    float _2120 = _2118 + _2108;
    float _2122 = _2112;
    float _2124 = _2116;
    float _2126 = _2120;
    float _2128 = _2094;
    if (_1814)
    {
        _1130 = 1.0;
    }
    float _2130 = _1130;
    float _2132 = _2130;
    if (!_2012)
    {
        float _2134 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2136 = _1964 + _2134;
        float _2138 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2140 = _1968 + _2138;
        float _2142 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2144 = -_700;
        float _2146 = _2144 + _2092;
        float _2148 = _2136 * _2136;
        float _2150 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2152 = _1956 + _2150;
        float _2154 = -_730;
        float _2156 = _2154 + _2090;
        float _2158 = fma(_2140, _2140, _2148);
        float _2160 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2162 = fma(_2152, _2152, _2158);
        float _2164 = sqrt(_2162);
        float _2166 = 1.0 / _1248;
        float _2168 = _2160 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2170 = precise::min(_2164, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2172 = _2170 * _2142;
        float _2174 = -_698;
        float _2176 = _2174 + _2088;
        float _2178 = _2172 * _2166;
        float _2180 = _2168 * _2178;
        float _2182 = _2146 * _2178;
        float _2184 = fma(_2176, _2180, _1964);
        float _2186 = fma(_2156, _2180, _1968);
        float _2188 = fma(_2168, _2182, _1956);
        _1062 = _2182;
        _2122 = _2184;
        _2124 = _2186;
        _2126 = _2188;
    }
    float _2190 = _1062;
    float _2192 = _2122;
    float _2194 = _2124;
    float _2196 = _2126;
    float _2198 = _2190;
    if (_1814)
    {
        _1132 = 1.0;
    }
    float _2200 = _1132;
    float _2202 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2204 = _2096 * _2202;
    float _2206 = _2200;
    if (!_1814)
    {
        float _2208 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2210 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2212 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2210;
        float _2214 = _2208 * 0.15915493667125701904296875;
        float _2216 = 1.0 / _2212;
        float _2218 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2220 = _2214 * 6.283185482025146484375;
        float _2222 = cos(_2220);
        float _2224 = _2218 * 0.15915493667125701904296875;
        float _2226 = _2214 * 6.283185482025146484375;
        float _2228 = sin(_2226);
        float _2230 = 1.0 / _2222;
        float _2232 = _2224 * 6.283185482025146484375;
        float _2234 = cos(_2232);
        float _2236 = _2228 * _2230;
        float _2238 = _2224 * 6.283185482025146484375;
        float _2240 = sin(_2238);
        float _2242 = _2234 * _2236;
        float _2244 = 1.0 / _2242;
        float _2246 = _2240 * _2244;
        float _2248 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2250 = fma(_2204, _2246, _2248);
        float _2252 = _2250 * _2216;
        float _2254 = precise::clamp(_2252, 0.0, 1.0);
        _2198 = _2236;
        _2128 = _2214;
        _2132 = _2254;
    }
    float _2256 = _2198;
    float _2258 = _2128;
    float _2260 = _2132;
    float _2262 = _2256;
    float _2264 = _2258;
    if (!_1814)
    {
        float _2266 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2268 = _2266 * 0.15915493667125701904296875;
        float _2270 = _2268 * 6.283185482025146484375;
        float _2272 = cos(_2270);
        float _2274 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2276 = _2274 * 0.15915493667125701904296875;
        float _2278 = _2268 * 6.283185482025146484375;
        float _2280 = sin(_2278);
        float _2282 = 1.0 / _2272;
        float _2284 = _2276 * 6.283185482025146484375;
        float _2286 = cos(_2284);
        float _2288 = _2280 * _2282;
        float _2290 = _2276 * 6.283185482025146484375;
        float _2292 = sin(_2290);
        float _2294 = _2286 * _2288;
        float _2296 = 1.0 / _2294;
        float _2298 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2300 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2298;
        float _2302 = 1.0 / _2300;
        float _2304 = _2292 * _2296;
        float _2306 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2308 = fma(_2204, _2304, _2306);
        float _2310 = _2308 * _2302;
        float _2312 = precise::clamp(_2310, 0.0, 1.0);
        float _2314 = -_2312;
        float _2316 = _2314 + 1.0;
        _2262 = _2282;
        _2264 = _2294;
        _2206 = _2316;
    }
    float _2318 = _2262;
    float _2320 = _2264;
    float _2322 = _2206;
    float _2324 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2326 = _2192 + _2324;
    float _2328 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2330 = _2194 + _2328;
    float _2332 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2334 = _2196 + _2332;
    float _2336 = _2326 * _2326;
    float _2338 = fma(_2330, _2330, _2336);
    float _2340 = fma(_2334, _2334, _2338);
    float _2342 = rsqrt(_2340);
    float _2344 = sqrt(_2340);
    float _2346 = _2342 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2348 = _2330 * _2346;
    float _2350 = _2334 * _2346;
    float _2352 = _2348 * _2348;
    float _2354 = _2350 * _2350;
    float _2356 = _2352 + _2354;
    float _2358 = sqrt(_2356);
    bool _2360 = _2358 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2362 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2364 = _2358 + _2362;
    float _2366 = _2318;
    float _2368 = _2364;
    float _2370 = _2326;
    float _2372 = _2348;
    float _2374 = _2350;
    if (_2360)
    {
        float _2376 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2366 = _2376;
    }
    float _2378 = _2366;
    if (_2360)
    {
        float _2380 = rsqrt(_2356);
        _1064 = _2380;
    }
    float _2382 = _1064;
    if (_2360)
    {
        float _2384 = _2364 * _2378;
        _2368 = _2384;
    }
    float _2386 = _2368;
    float _2388 = _2192 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (_2360)
    {
        float _2390 = _2386 * 0.15915493667125701904296875;
        _1134 = _2390;
    }
    float _2392 = _1134;
    float _2394 = fma(_2194, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2388);
    float _2396 = _2378;
    if (_2360)
    {
        float _2398 = _2392 * 6.283185482025146484375;
        float _2400 = sin(_2398);
        _2396 = _2400;
    }
    float _2402 = _2396;
    float _2404 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2406 = fma(_2196, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2394);
    float _2408 = precise::max(0.0, _2404);
    float _2410 = _2320;
    float _2412 = _2408;
    if (_2360)
    {
        float _2414 = _2392 * 6.283185482025146484375;
        float _2416 = cos(_2414);
        _2410 = _2416;
    }
    float _2418 = _2410;
    float _2420 = _2406 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2422 = -_2346;
    float _2424 = -_2408;
    float _2426 = fma(_2326, _2422, _2424);
    if (_2360)
    {
        float _2428 = _2426 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2412 = _2428;
    }
    float _2430 = _2412;
    float _2432 = _2402;
    float _2434 = _2430;
    if (_2360)
    {
        float _2436 = fma(_2402, _2430, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2042 = _2436;
    }
    float _2438 = _2042;
    float _2440 = _2438;
    if (!_2360)
    {
        _2432 = _2426;
    }
    float _2442 = _2432;
    float _2444 = _2442;
    if (_2360)
    {
        float _2446 = _2418 + (-1.0);
        _2370 = _2446;
    }
    float _2448 = _2370;
    float _2450 = _2448;
    if (_2360)
    {
        float _2452 = _2382 * _2438;
        _2440 = _2452;
    }
    float _2454 = _2440;
    if (_2360)
    {
        float _2456 = _2448 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2434 = _2456;
    }
    float _2458 = _2434;
    float _2460 = _2458;
    if (_2360)
    {
        float _2462 = _2348 * _2454;
        _2372 = _2462;
    }
    float _2464 = _2372;
    if (_2360)
    {
        float _2466 = _2350 * _2454;
        _2374 = _2466;
    }
    float _2468 = _2374;
    if (!_2360)
    {
        _2450 = _2354;
    }
    float _2470 = _2450;
    float _2472 = _2470;
    if (_2360)
    {
        float _2474 = fma(_2426, _2418, _2458);
        _2444 = _2474;
    }
    float _2476 = _2444;
    if (!_2360)
    {
        _2460 = _2352;
    }
    float _2478 = _2460;
    float _2480 = _2478;
    if (_2360)
    {
        float _2482 = _2464 * _2464;
        _2480 = _2482;
    }
    float _2484 = _2480;
    float _2486 = fma(_1968, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    if (_2360)
    {
        float _2488 = _2468 * _2468;
        _2472 = _2488;
    }
    float _2490 = _2472;
    float _2492 = fma(_2476, _2476, _2484);
    float _2494 = _2192 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2496 = floor(_2486);
    float _2498 = _2492 + _2490;
    float _2500 = fma(_2194, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2494);
    float _2502 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2504 = fma(_2344, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2502);
    float _2506 = precise::clamp(_2504, 0.0, 1.0);
    float _2508 = _2192 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2510 = fma(_2196, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2500);
    float _2512 = rsqrt(_2498);
    float _2514 = -_2506;
    float _2516 = _2514 + 1.0;
    float _2518 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2520 = _2510 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2522 = fma(_2194, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2508);
    float _2524 = _2520 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2526 = fma(_2196, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2522);
    float _2528 = abs(_2516);
    float _2530 = log2(_2528);
    float _2532 = fma(_1956, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2534 = -_2524;
    float _2536 = fma(_2534, _2518, 1.0);
    float _2538 = _2192 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2540 = _2526 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2542 = -_2496;
    float _2544 = _2486 + _2542;
    float _2546 = _2512 * _2464;
    float _2548 = fma(_2194, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2538);
    float _2550 = _2512 * _2476;
    float _2552 = _2512 * _2468;
    float _2554 = _2546 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2556 = fma(_2196, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2548);
    float _2558 = floor(_2532);
    float _2560 = _2540 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2562 = -_2554;
    float _2564 = fma(_2550, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2562);
    float _2566 = _2556 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2568 = _2540 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2570 = _2530 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2572 = -_2552;
    float _2574 = fma(_2572, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2564);
    float _2576 = fma(_2566, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2560);
    float _2578 = fma(_2566, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2568);
    float _2580 = log2(_2536);
    float _2582 = fma(_2574, 0.5, 0.5);
    float _2584 = fma(_2520, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2578);
    float _2586 = fma(_2582, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2588 = fma(_2420, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2584);
    float _2590 = exp2(_2570);
    float _2592 = fma(_2574, -0.5, 0.5);
    float _2594 = _2540 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2596 = -_2558;
    float _2598 = _2532 + _2596;
    float _2600 = _2550 + 1.0;
    float _2602 = fma(_2566, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2594);
    float _2604 = 1.0 / _2588;
    float _2606 = fma(_2582, _2586, -0.212114393711090087890625);
    float _2608 = fma(_2520, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2576);
    float _2610 = fma(_2520, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2602);
    float _2612 = _2580 * 0.693147182464599609375;
    float _2614 = fma(_2582, _2606, 1.570728778839111328125);
    float _2616 = fma(_2420, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2608);
    float _2618 = fma(_2420, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2610);
    float _2620 = sqrt(_2592);
    float _2622 = -_2550;
    float _2624 = fma(_2590, _2600, _2622);
    float _2626 = _2612 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float2 _7105 = float2(_2544, _2598);
    float _2628 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7105, float2(0.0), isnan(_7105)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7105, float2(0.0), isnan(_7105)), level(0.0)).x;
    float _2630 = fma(_2624, 0.5, 0.5);
    float _2632 = _2616 * _2604;
    float _2634 = _2618 * _2604;
    float _2636 = fma(_2632, 0.5, 0.5);
    float _2638 = fma(_2634, -0.5, 0.5);
    float _2640 = _2620 * 0.636619746685028076171875;
    float _2642 = -_2614;
    float _2644 = fma(_2640, _2642, 1.0);
    float3 _7136 = float3(_2636, _2638, _2626);
    float _2646 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7136, float3(0.0), isnan(_7136)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7136, float3(0.0), isnan(_7136)), level(0.0)).x;
    float3 _7147 = float3(_2636, _2638, _2626);
    float4 _2649 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7147, float3(0.0), isnan(_7147)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7147, float3(0.0), isnan(_7147)), level(0.0)).xyzw;
    float _2651 = _2649.x;
    float _2653 = _2649.y;
    float _2655 = _2649.z;
    float _2657 = _2649.w;
    float2 _7163 = float2(_2644, _2630);
    float3 _2661 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7163, float2(0.0), isnan(_7163)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7163, float2(0.0), isnan(_7163)), level(0.0)).xyz;
    float _2663 = _2661.x;
    float _2665 = _2661.y;
    float _2667 = _2661.z;
    float _2669 = abs(_2204);
    float _2671 = log2(_2669);
    float _2673 = _2530 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2675 = -_1900;
    float _2677 = fma(_1886, _1890, _2675);
    float _2679 = fma(_1886, _1898, _1888);
    float _2681 = _1834 * _1896;
    float _2683 = _1904 * _1842;
    float _2685 = _189 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2687 = _2540 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_82.x = _1968;
    out.m_82.y = _1964;
    out.m_82.z = _1956;
    bool _2689 = _2344 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2691 = isnan(_2344);
    bool _2693 = _2689 || _2691;
    bool _2695 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2697 = _2693 || _2695;
    out.m_84.x = _2194;
    out.m_84.y = _2192;
    out.m_84.z = _2196;
    float _2699 = _2671 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    bool _2701 = _2204 <= 8000.0;
    bool _2703 = isnan(_2204);
    bool _2705 = _2701 || _2703;
    bool _2707 = isnan(8000.0);
    bool _2709 = _2705 || _2707;
    float _2711 = float(_2709);
    float _2713 = _1912 * _1842;
    float _2715 = _2677 * _1842;
    float _2717 = exp2(_2673);
    float _2719 = _1912 * _1844;
    float _2721 = _1912 * _1840;
    float _2723 = _1904 * _1844;
    float _2725 = _1904 * _1840;
    float _2727 = fma(_2679, _1936, _2715);
    float _2729 = fma(_1916, _1926, _2721);
    float _2731 = fma(_2566, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2687);
    float _2733 = exp2(_2699);
    float _2735 = _2616;
    if (!_2697)
    {
        _2044 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2737 = _2044;
    float _2739 = fma(_2520, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2731);
    float _2741 = -_2717;
    float _2743 = _2741 + 1.0;
    float _2745 = fma(_2733, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2747 = precise::clamp(_2745, 0.0, 1.0);
    float _2749 = _2677 * _1844;
    float _2751 = _2677 * _1840;
    float _2753 = fma(_1908, _1936, _2683);
    float _2755 = fma(_2747, -2.0, 3.0);
    float _2757 = _2747 * _2747;
    float _2759 = fma(_1916, _1944, _2719);
    float _2761 = fma(_2679, _1944, _2749);
    float _2763 = fma(_2679, _1926, _2751);
    float _2765 = _2757 * _2755;
    float _2767 = -_1886;
    float _2769 = fma(_2767, _1406, _2759);
    float _2771 = fma(_2681, _1406, _2761);
    float _2773 = -_2765;
    float _2775 = _2773 + 1.0;
    float _2777 = fma(_2775, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2765);
    float _2779 = _2711 * _2777;
    float _2781 = fma(_1916, _1936, _2713);
    float _2783 = fma(_1908, _1944, _2723);
    float _2785 = fma(_1908, _1926, _2725);
    float _2787 = fma(_1918, _1394, _2753);
    float _2789 = -_1886;
    float _2791 = fma(_2789, _1394, _2781);
    float _2793 = fma(_1918, _1406, _2783);
    float _2795 = fma(_1918, _1396, _2785);
    float _2797 = -_1886;
    float _2799 = fma(_2797, _1396, _2729);
    float _2801 = fma(_2681, _1396, _2763);
    float _2803 = _185 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2805 = _2685 * _2787;
    float _2807 = _2685 * _2793;
    float _2809 = _2685 * _2795;
    float _2811 = in.m_86.x;
    float _2813 = fma(_2803, _2791, _2805);
    float _2815 = fma(_2803, _2769, _2807);
    float _2817 = fma(_2803, _2799, _2809);
    float _2819 = _2743 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2821 = fma(_2420, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2739);
    float _2823 = fma(_2681, _1394, _2727);
    float _2825 = _2779 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2827 = _2616 + _2588;
    float _2829 = _2821 + _2588;
    float _2831 = _2588 * 0.5;
    float _2833 = _2771 + _2815;
    float _2835 = _2829 * 0.5;
    float _2837 = _2827 * 0.5;
    float _2839 = fma(_2618, -0.5, _2831);
    float _2841 = _2823 + _2813;
    float _2843 = _2801 + _2817;
    out.gl_Position.x = _2616;
    out.gl_Position.y = _2618;
    out.gl_Position.z = _2821;
    out.gl_Position.w = _2588;
    float _2845 = _2813;
    float _2847 = _2737;
    float _2849 = _2737;
    if (!_2697)
    {
        _2845 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2851 = _2845;
    out.m_88.x = _2837;
    out.m_88.y = _2839;
    out.m_88.z = _2835;
    out.m_88.w = _2588;
    out.m_90.x = _2841;
    out.m_90.y = _2833;
    out.m_90.z = _2843;
    float _2853 = _2851;
    float _2855 = _2851;
    if (!_2697)
    {
        _2735 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2857 = _2735;
    float _2859 = -_2628;
    float _2861 = _2859 + 1.0;
    float _2863 = _2861 * _2825;
    float _2865 = precise::clamp(_2863, 0.0, 1.0);
    float _2867 = -_2865;
    float _2869 = fma(_2867, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2871 = _2869 * _2811;
    float _2873 = _2871 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2875 = _2871;
    float _2877 = _2873;
    float _2879 = _2857;
    float _2881 = _2857;
    if (!_2697)
    {
        _2875 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2883 = _2875;
    float _2885 = _2819 * _2646;
    float _2887 = -_2819;
    float _2889 = _2887 + 1.0;
    out.m_92.x = _2873;
    float _2891 = _2657 * _2885;
    float _2893 = _2667 * _2885;
    float _2895 = _2657 * _2889;
    float _2897 = fma(_2663, _2891, _2651);
    float _2899 = fma(_2665, _2891, _2653);
    float _2901 = fma(_2657, _2893, _2655);
    float _2903 = _2260 * _2322;
    float _2905 = _2903;
    float _2907 = _2883;
    float _2909 = _2883;
    if (!_2697)
    {
        _2877 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2911 = _2877;
    out.m_94.x = _2897;
    out.m_94.y = _2899;
    out.m_94.z = _2901;
    out.m_94.w = _2895;
    float _2913 = _2903 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2915 = _2911;
    float _2917 = _2911;
    if (!_2697)
    {
        _2905 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2919 = _2905;
    bool _2921 = !_2697;
    float _2923 = _2919;
    float _2925 = _2919;
    if (!_2921)
    {
        bool _2927 = _2344 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2929 = isnan(_2344);
        bool _2931 = _2927 || _2929;
        bool _2933 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2935 = _2931 || _2933;
        if (!_2935)
        {
            float _2937 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2939 = _2344 + _2937;
            float _2941 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2943 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2941;
            float _2945 = 1.0 / _2943;
            float _2947 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2949 = _2947 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2951 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2953 = _2951 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2955 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2957 = _2955 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2959 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2961 = _2959 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2963 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2965 = _2963 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2967 = _2939 * _2945;
            float _2969 = precise::clamp(_2967, 0.0, 1.0);
            float _2971 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2973 = _2971 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2975 = fma(_2969, _2949, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2977 = fma(_2969, _2973, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2979 = fma(_2969, _2953, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2981 = fma(_2969, _2957, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2983 = fma(_2969, _2961, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2985 = fma(_2969, _2965, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2881 = _2977;
            _2917 = _2983;
            _2855 = _2975;
            _2849 = _2981;
            _2909 = _2979;
            _2925 = _2985;
            _2987 = true;
        }
        else
        {
            bool _2989 = _2344 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2991 = isnan(_2344);
            bool _2993 = _2989 || _2991;
            bool _2995 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2997 = _2993 || _2995;
            if (!_2997)
            {
                _2853 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2999 = _2853;
            _2855 = _2999;
            if (!_2997)
            {
                _2879 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3001 = _2879;
            _2881 = _3001;
            if (!_2997)
            {
                _2907 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3003 = _2907;
            _2909 = _3003;
            if (!_2997)
            {
                _2847 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3005 = _2847;
            _2849 = _3005;
            if (!_2997)
            {
                _2915 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3007 = _2915;
            _2917 = _3007;
            if (!_2997)
            {
                _2923 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3009 = _2923;
            bool _3011 = !_2997;
            _2925 = _3009;
            if (!_3011)
            {
                bool _3013 = _2344 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3015 = isnan(_2344);
                bool _3017 = _3013 || _3015;
                bool _3019 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3021 = _3017 || _3019;
                if (!_3021)
                {
                    float _3023 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3025 = _2344 + _3023;
                    float _3027 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3029 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3027;
                    float _3031 = 1.0 / _3029;
                    float _3033 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3035 = _3033 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3037 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3039 = _3037 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3041 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3043 = _3041 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3045 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3047 = _3045 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3049 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3051 = _3049 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3053 = _3025 * _3031;
                    float _3055 = precise::clamp(_3053, 0.0, 1.0);
                    float _3057 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3059 = _3057 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3061 = fma(_3055, _3035, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3063 = fma(_3055, _3059, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3065 = fma(_3055, _3039, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3067 = fma(_3055, _3043, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3069 = fma(_3055, _3047, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3071 = fma(_3055, _3051, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2881 = _3063;
                    _2917 = _3069;
                    _2855 = _3061;
                    _2849 = _3067;
                    _2909 = _3065;
                    _2925 = _3071;
                    _2987 = true;
                }
                else
                {
                    _2881 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2917 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2855 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2849 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2909 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2925 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2987 = false;
    float _3073 = _2881;
    float _3075 = _2917;
    float _3077 = _2855;
    float _3079 = _2849;
    float _3081 = _2909;
    float _3083 = _2925;
    float _3085 = fma(_2833, -0.5, 0.5);
    float _3087 = precise::clamp(_3085, 0.0, 1.0);
    float _3089 = -_3073;
    float _3091 = _3089 + _3075;
    float _3093 = _2913 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3095 = -_3077;
    float _3097 = _3095 + _3079;
    float _3099 = fma(_3087, _3091, _3073);
    out.m_96.x = 0.0;
    float _3101 = -_3081;
    float _3103 = _3101 + _3083;
    float _3105 = fma(_3087, _3097, _3077);
    float _3107 = _3099 * 0.586610972881317138671875;
    out.m_53.x = _3093;
    bool _3109 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3111 = fma(_3087, _3103, _3081);
    float _3113 = fma(_3105, 0.298911988735198974609375, _3107);
    bool _3115 = _2260 > 0.0;
    bool _3117 = isnan(_2260);
    bool _3119 = _3115 || _3117;
    bool _3121 = isnan(0.0);
    bool _3123 = _3119 || _3121;
    float _3125 = fma(_3111, 0.114477999508380889892578125, _3113);
    bool _3127 = _2322 <= 0.0;
    bool _3129 = !_3123;
    bool _3131 = _3127 || _3129;
    float _3133 = -_3125;
    float _3135 = _3105 + _3133;
    float _3137 = -_3125;
    float _3139 = _3099 + _3137;
    float _3141 = -_3125;
    float _3143 = _3111 + _3141;
    float _3145 = fma(_3135, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3125);
    float _3147 = fma(_3139, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3125);
    float _3149 = fma(_3143, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3125);
    bool _3151 = !_3109;
    if (!_3151)
    {
        float _3153 = -_2192;
        float _3155 = _3153 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3157 = -_2194;
        float _3159 = _3157 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3161 = -_2196;
        float _3163 = _3161 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3165 = _3155 * _3155;
        float _3167 = fma(_3159, _3159, _3165);
        float _3169 = fma(_3163, _3163, _3167);
        float _3171 = sqrt(_3169);
        float _3173 = rsqrt(_3169);
        float _3175 = -_3171;
        float _3177 = _3175 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3179 = _3177 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3181 = precise::clamp(_3179, 0.0, 1.0);
        float _3183 = _3159 * _3173;
        float _3185 = _3155 * _3173;
        float _3187 = abs(_3181);
        float _3189 = log2(_3187);
        float _3191 = _3163 * _3173;
        float _3193 = _3183 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3195 = _2833 * _3185;
        float _3197 = -_3185;
        float _3199 = -_3193;
        float _3201 = fma(_3197, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3199);
        float _3203 = fma(_2841, _3183, _3195);
        float _3205 = -_3191;
        float _3207 = fma(_3205, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3201);
        float _3209 = fma(_2843, _3191, _3203);
        float _3211 = precise::clamp(_3209, 0.0, 1.0);
        float _3213 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3215 = _3207 + _3213;
        float _3217 = _3189 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3219 = _3215 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3221 = precise::clamp(_3219, 0.0, 1.0);
        float _3223 = exp2(_3217);
        float _3225 = _3223 * _3221;
        float _3227 = _3211 * _3225;
        float _3229 = _3227 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3231 = _3227 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3233 = _3227 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_96.x = _3229;
        out.m_96.y = _3231;
        out.m_96.z = _3233;
    }
    out.m_70.x = _3145;
    out.m_70.y = _3147;
    out.m_70.z = _3149;
    if (!_3131)
    {
        return out;
    }
    out.m_53.x = 0.0;
    float _3235 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3235;
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
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2987 = false;
    bool _213 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _110 = in.m_46.w;
    float _112 = in.m_48.w;
    float _114 = trunc(_110);
    int _117 = int(_114);
    float _119 = -_112;
    float _121 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _121;
    bool _125 = _117 >= 1;
    float _127 = 0.0;
    float _129 = as_type<float>(_117);
    float _131 = _121;
    if (!_125)
    {
        _127 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _133 = _127;
    if (!_125)
    {
        out.m_53.x = 0.0;
    }
    int _135 = 0;
    if (!_125)
    {
        float _137 = _133 * 5.0;
        _135 = as_type<int>(_137);
    }
    int _139 = _135;
    int _141 = _139;
    if (!_125)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3304 = as_type<float>(_139);
        out.gl_Position.z = _3304;
    }
    if (!_125)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _143 = _112 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _145 = isnan(_112);
    bool _147 = _143 || _145;
    bool _149 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _151 = _147 || _149;
    float _153 = float(_117);
    bool _155 = _121 >= _153;
    bool _157 = !_151;
    bool _159 = _155 || _157;
    if (_159)
    {
        _129 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _161 = _129;
    if (_159)
    {
        out.m_53.x = 0.0;
    }
    if (_159)
    {
        float _163 = _161 * 5.0;
        _141 = as_type<int>(_163);
    }
    int _165 = _141;
    if (_159)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3359 = as_type<float>(_165);
        out.gl_Position.z = _3359;
    }
    if (_159)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _167 = as_type<float>(int(gl_VertexIndex));
    float _169 = 1.0 / _153;
    bool _171 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _173 = _121 * _169;
    int _175 = as_type<int>(_167) & 1;
    bool _177 = _175 != 0;
    int _179 = as_type<int>(_167) & 2;
    bool _181 = _179 != 0;
    bool _183 = !_177;
    float _185 = _183 ? (-0.5) : 0.5;
    bool _187 = !_181;
    float _189 = _187 ? (-0.5) : 0.5;
    bool _191 = !_171;
    float _193 = _173;
    float _211;
    if (!_191)
    {
        float _195 = in.m_58.x;
        float _197 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _199 = _195 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _201 = fma(_199, (*spvDescriptorSet0.vp_c9)._m0[12].x, _121);
        float _203 = _201 * _197;
        float _205 = floor(_203);
        float _207 = -_205;
        float _209 = _203 + _207;
        _211 = _209;
        _213 = true;
    }
    else
    {
        _211 = _173;
    }
    _213 = false;
    float _215 = _211;
    float _217 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _219 = _215 + _217;
    float _221 = in.m_60.x;
    float _223 = in.m_60.y;
    bool _225 = _215 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _227 = isnan(_215);
    bool _229 = _225 || _227;
    bool _231 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _233 = _229 || _231;
    float _235 = float(_233);
    float _237 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _239 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _237;
    bool _241 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _243 = 1.0 / _239;
    float _245 = -_235;
    float _247 = _245 + 1.0;
    float _249 = _219 * _243;
    bool _251 = _215 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _253 = isnan(_215);
    bool _255 = _251 || _253;
    bool _257 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _259 = _255 || _257;
    float _261 = float(_259);
    float _263 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _265 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _263;
    float _267 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _269 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _267;
    float _271 = _261 * _247;
    float _273 = fma(_265, _249, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _275 = fma(_269, _249, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _277 = -_261;
    float _279 = _277 + 1.0;
    float _281 = _273 * _271;
    float _283 = _275 * _271;
    float _285 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[143].x, _281);
    float _287 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[143].y, _283);
    float _289 = fma(_235, (*spvDescriptorSet0.vp_c9)._m0[144].x, _285);
    float _291 = fma(_235, (*spvDescriptorSet0.vp_c9)._m0[144].y, _287);
    float _293 = _289 * _221;
    float _295 = _291 * _223;
    bool _297 = !_241;
    if (!_297)
    {
        float _299 = in.m_58.x;
        float _301 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _303 = _299 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _305 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[11].y, _121);
        float _307 = _305 * _301;
        float _309 = floor(_307);
        float _311 = -_309;
        float _313 = _307 + _311;
        _193 = _313;
    }
    float _315 = _193;
    float _317 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _319 = int(_317);
    float _321 = in.m_62.x;
    float _323 = in.m_62.y;
    float _325 = in.m_62.z;
    float _327 = in.m_62.w;
    float _329 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _331 = int(_329);
    float _333 = float(_319);
    float _335 = 1.0 / _333;
    float _337 = float(uint(_331));
    bool _339 = _331 == 0;
    int _341 = ~_331;
    int _343 = _341 + 1;
    float _345 = 1.0 / _337;
    float _347 = _335 * _121;
    float _349 = trunc(_347);
    int _351 = int(_349);
    int _353 = as_type<int>(_345) + (-2);
    float _355 = float(uint(_351));
    float _357 = float(_351);
    float _359 = as_type<float>(_353) * _355;
    int _361 = ~_331;
    int _363 = _361 + 1;
    float _365 = trunc(_359);
    float _367 = precise::max(_365, 0.0);
    uint _370 = uint(_367);
    int _372 = ~_331;
    int _374 = _372 + 1;
    int _376 = _363 * int(_370);
    int _378 = _376 + _351;
    float _380 = in.m_58.x;
    float _382 = in.m_58.y;
    float _384 = float(uint(_378));
    float _386 = as_type<float>(_353) * _384;
    int _388 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _390 = _388 != 0;
    float _392 = trunc(_386);
    float _394 = precise::max(_392, 0.0);
    uint _396 = uint(_394);
    bool _398 = !_390;
    float _400 = _398 ? 7.345489978790283203125 : 1.0;
    float _402 = _400 * _380;
    float _404 = floor(_402);
    int _406 = int(_370) + int(_396);
    float _408 = float(_331);
    int _410 = _374 * _406;
    int _412 = _410 + _351;
    bool _414 = _357 >= _408;
    bool _416 = isnan(_357);
    bool _418 = _414 || _416;
    bool _420 = isnan(_408);
    bool _422 = _418 || _420;
    float _424 = float(_422);
    bool _426 = uint(_412) >= uint(_331);
    float _428 = trunc(_424);
    int _430 = int(_428);
    bool _432 = !_426;
    int _434 = _432 ? 0 : (-1);
    float _436 = -_404;
    float _438 = _402 + _436;
    int _440 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _442 = _440 != 0;
    int _444 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _446 = _444 != 0;
    int _448 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _450 = _448 != 0;
    int _452 = ~_406;
    int _454 = _452 + _434;
    int _456 = _454 + 1;
    int _458 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _460 = _458 != 0;
    int _462 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _464 = _462 != 0;
    int _466 = _331 * _456;
    int _468 = _466 + _351;
    int _470 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _472 = _470 != 0;
    bool _474 = !_339;
    int _476 = _474 ? _468 : (-1);
    float _478 = _438 * _408;
    float _480 = _408 * _121;
    int _482 = ~_430;
    int _484 = _482 + 1;
    int _486 = _484 + 1;
    float _488 = trunc(_478);
    int _490 = int(_488);
    float _492 = _480 * _169;
    bool _494 = !_446;
    int _496 = _494 ? 0 : 1;
    int _498 = _476 * _486;
    int _500 = _331 + (-1);
    bool _502 = !_442;
    int _504 = _502 ? 0 : 1;
    float _506 = trunc(_492);
    int _508 = int(_506);
    int _510 = _430 * _500;
    int _512 = _510 + _498;
    int _514 = abs(_496);
    bool _516 = !_450;
    int _518 = _516 ? 0 : 1;
    bool _520 = !_460;
    int _522 = _520 ? 0 : 1;
    int _524 = _512 * _514;
    int _526 = abs(_504);
    int _528 = abs(_518);
    int _530 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _532 = _530 != 0;
    int _534 = abs(_522);
    bool _536 = !_532;
    int _538 = _536 ? 0 : 1;
    int _540 = _490 * _534;
    int _542 = _540 + _351;
    float _544 = in.m_64.x;
    float _546 = in.m_64.y;
    float _548 = in.m_64.z;
    float _550 = in.m_64.w;
    int _552 = _508 * _526;
    int _554 = _552 + _524;
    int _556 = abs(_538);
    float _558 = in.m_46.x;
    float _560 = in.m_46.y;
    float _562 = in.m_46.z;
    int _564 = _542 * _528;
    int _566 = _564 + _554;
    int _568 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _570 = _568 != 0;
    int _572 = ~_331;
    int _574 = _572 + 1;
    int _576 = _490 * _556;
    int _578 = _576 + _566;
    float _580 = in.m_66.x;
    float _582 = in.m_66.y;
    float _584 = in.m_66.z;
    float _586 = in.m_66.w;
    float _588 = float(uint(_578));
    float _590 = as_type<float>(_353) * _588;
    float _592 = trunc(_590);
    float _594 = precise::max(_592, 0.0);
    uint _596 = uint(_594);
    float _598 = _560 * _323;
    float _600 = _560 * _546;
    float _602 = fma(_558, _321, _598);
    float _604 = float(uint(_542));
    float _606 = fma(_558, _544, _600);
    float _608 = _560 * _582;
    float _610 = fma(_562, _325, _602);
    float _612 = as_type<float>(_353) * _604;
    float _614 = fma(_558, _580, _608);
    int _616 = _574 * int(_596);
    int _618 = _616 + _578;
    float _620 = fma(_562, _548, _606);
    float _622 = fma(_562, _584, _614);
    float _624 = float(uint(_618));
    float _626 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _628 = _626 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _630 = trunc(_612);
    float _632 = precise::max(_630, 0.0);
    uint _634 = uint(_632);
    float _636 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _638 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _640 = as_type<float>(_353) * _624;
    float _642 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _644 = _642 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _646 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _648 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _646;
    float _650 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _652 = 1.0 / _644;
    float _654 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _656 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _658 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _660 = _658 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _662 = _650 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _664 = _636 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _666 = _656 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _668 = trunc(_640);
    float _670 = precise::max(_668, 0.0);
    uint _672 = uint(_670);
    int _674 = _343 * int(_634);
    int _676 = _674 + _542;
    int _678 = ~_331;
    int _680 = _678 + 1;
    float _682 = _382 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    out.m_68.x = _662;
    out.m_68.y = _664;
    out.m_68.z = _666;
    out.m_68.w = _638;
    float _684 = float(uint(_676));
    float _686 = fma(_682, -2.0, _654);
    float _688 = 1.0 / _628;
    float _690 = _648 * _652;
    float _692 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _694 = _692 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _696 = as_type<float>(_353) * _684;
    float _698 = _620 + _550;
    float _700 = _622 + _586;
    float _702 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[76].y, _686);
    int _704 = int(_596) + int(_672);
    float _706 = trunc(_696);
    float _708 = precise::max(_706, 0.0);
    uint _710 = uint(_708);
    float _712 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _714 = _698 + _712;
    float _716 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _718 = _315 + _716;
    int _720 = _680 * _704;
    int _722 = _720 + _578;
    float _724 = _660 * _688;
    float _726 = 1.0 / _694;
    bool _728 = uint(_722) >= uint(_331);
    float _730 = _610 + _327;
    int _732 = ~_331;
    int _734 = _732 + 1;
    bool _736 = !_728;
    int _738 = _736 ? 0 : (-1);
    float _740 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _742 = _730 + _740;
    bool _744 = _380 > 0.5;
    int _746 = ~_704;
    int _748 = _746 + _738;
    int _750 = _748 + 1;
    float _752 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _754 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _752;
    int _756 = int(_634) + int(_710);
    float _758 = _714 * _714;
    bool _760 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _762 = isnan(_315);
    bool _764 = _760 || _762;
    bool _766 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _768 = _764 || _766;
    float _770 = float(_768);
    int _772 = _331 * _750;
    int _774 = _772 + _578;
    float _776 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _778 = _700 + _776;
    float _780 = fma(_742, _742, _758);
    int _782 = _734 * _756;
    int _784 = _782 + _542;
    float _786 = _754 * _726;
    bool _788 = !_339;
    int _790 = _788 ? _774 : (-1);
    float _792 = fma(_778, _778, _780);
    bool _794 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _796 = isnan(_315);
    bool _798 = _794 || _796;
    bool _800 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _802 = _798 || _800;
    float _804 = float(_802);
    float _806 = fma(_690, _718, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _808 = uint(_784) >= uint(_331);
    float _810 = sqrt(_792);
    int _812 = _790 & 3;
    bool _814 = _812 != 0;
    float _816 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _818 = _315 + _816;
    float _820 = -_185;
    int _822 = _744 ? as_type<int>(_820) : as_type<int>(_185);
    float _824 = _293 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _826 = !_808;
    int _828 = _826 ? 0 : (-1);
    float _830 = -_770;
    float _832 = _830 + 1.0;
    int _834 = _814 ? 0 : 1;
    float _836 = rsqrt(_792);
    int _838 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _840 = _838 != 0;
    int _842 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _844 = _842 != 0;
    int _846 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _848 = _846 != 0;
    float _850 = -_804;
    float _852 = _850 + 1.0;
    bool _854 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _856 = isnan(_315);
    bool _858 = _854 || _856;
    bool _860 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _862 = _858 || _860;
    float _864 = float(_862);
    float _866 = fma(_724, _818, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _868 = _804 * _832;
    float _870 = _824 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    bool _872 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _874 = isnan(_315);
    bool _876 = _872 || _874;
    bool _878 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _880 = _876 || _878;
    float _882 = float(_880);
    float _884 = _810 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _886 = _864 * _852;
    float _888 = -_864;
    float _890 = _888 + 1.0;
    float _892 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _894 = _315 + _892;
    float _896 = precise::min(_870, _884);
    float _898 = _882 * _890;
    float _900 = fma(_786, _894, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _902 = _714 * _836;
    float _904 = _742 * _836;
    float _906 = _806 * _898;
    int _908 = _790 >> 31;
    float _910 = _902 * _896;
    float _912 = _904 * _896;
    float _914 = -_882;
    float _916 = _914 + 1.0;
    int _918 = _908 & 3;
    float _920 = -_910;
    float _922 = _714 + _920;
    float _924 = -_912;
    float _926 = _742 + _924;
    float _928 = fma(_916, (*spvDescriptorSet0.vp_c9)._m0[115].x, _906);
    int _930 = _790 + _918;
    float _932 = _922 * _922;
    float _934 = _778 * _836;
    float _936 = fma(_866, _886, _928);
    float _938 = fma(_926, _926, _932);
    int _940 = _930 >> 2;
    float _942 = _934 * _896;
    float _944 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _946 = !_464;
    float _948 = _946 ? _185 : as_type<float>(_822);
    float _950 = _380 * 2.0;
    int _952 = _940 << 4;
    int _954 = _952 + 368;
    float _956 = -_942;
    float _958 = _778 + _956;
    bool _960 = _382 > 0.5;
    float _962 = -_944;
    float _964 = fma(_950, (*spvDescriptorSet0.vp_c9)._m0[77].x, _962);
    uint _966 = uint(int(uint(_954) >> uint(2)));
    uint _968 = uint(int(uint(int(_966)) >> uint(2)));
    int _970 = int(_966) & 3;
    float _972 = (*spvDescriptorSet0.vp_c9)._m0[int(_968)][_970];
    int _974 = int(_966) + 1;
    uint _976 = uint(int(uint(_974) >> uint(2)));
    int _978 = _974 & 3;
    float _980 = (*spvDescriptorSet0.vp_c9)._m0[int(_976)][_978];
    float _982 = fma(_958, _958, _938);
    float _984 = -_189;
    int _986 = _960 ? as_type<int>(_984) : as_type<int>(_189);
    float _988 = _948 + 0.5;
    int _990 = _790 & 3;
    bool _992 = _990 != 0;
    float _994 = -_121;
    float _996 = fma(_994, (*spvDescriptorSet0.vp_c9)._m0[76].x, _964);
    float _998 = sqrt(_982);
    bool _1000 = !_472;
    float _1002 = _1000 ? _189 : as_type<float>(_986);
    float _1004 = fma(_900, _868, _936);
    bool _1006 = uint(_990) > 1u;
    float _1008 = fma(_988, (*spvDescriptorSet0.vp_c9)._m0[80].x, _996);
    float _1010 = _714 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1012 = _954 + 8;
    uint _1014 = uint(int(uint(_1012) >> uint(2)));
    uint _1016 = uint(int(uint(int(_1014)) >> uint(2)));
    int _1018 = int(_1014) & 3;
    float _1020 = (*spvDescriptorSet0.vp_c9)._m0[int(_1016)][_1018];
    int _1022 = int(_1014) + 1;
    uint _1024 = uint(int(uint(_1022) >> uint(2)));
    int _1026 = _1022 & 3;
    float _1028 = (*spvDescriptorSet0.vp_c9)._m0[int(_1024)][_1026];
    float _1030 = _1002 + (-0.5);
    float _1032 = fma(_770, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1004);
    float _1034 = fma(_742, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1010);
    int _1036 = ~_756;
    int _1038 = _1036 + _828;
    int _1040 = _1038 + 1;
    float _1042 = -_1030;
    float _1044 = -_702;
    float _1046 = fma(_1042, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1044);
    int _1048 = ~_834;
    int _1050 = _1048 + 1;
    int _1052 = _1050 + 1;
    float _1054 = fma(_778, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1034);
    out.m_70.w = _896;
    int _1056 = _331 * _1040;
    int _1058 = _1056 + _542;
    int _1060 = _1052;
    float _1062 = _700;
    float _1064 = _912;
    if (!_1006)
    {
        int _1066 = ~_834;
        int _1068 = _1066 + 1;
        _1060 = _1068;
    }
    int _1070 = _1060;
    float _1072 = _836 * _998;
    bool _1074 = !_992;
    int _1076 = _1074 ? 0 : 1;
    bool _1078 = uint(_990) >= 2u;
    float _1080 = _824 * _1072;
    bool _1082 = _990 != 3;
    int _1084 = _1078 ? 0 : 1;
    float _1086 = _1080 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    bool _1088 = _990 != 3;
    int _1090 = abs(_1070);
    float _1092 = _902 * _1086;
    bool _1094 = !_1082;
    int _1096 = _1094 ? 0 : (-1);
    bool _1098 = _1054 >= 0.0;
    float _1100 = _904 * _1086;
    float _1102 = -_1092;
    float _1104 = _714 + _1102;
    int _1106 = abs(_1076);
    float _1108 = _934 * _1086;
    int _1110 = ~_1090;
    int _1112 = _1110 + 1;
    int _1114 = _1112 + 1;
    float _1116 = _1104 * _1104;
    int _1118 = ~_1084;
    int _1120 = _1118 + 1;
    int _1122 = _1120 + 1;
    float _1124 = -_1100;
    float _1126 = _742 + _1124;
    int _1128 = _1122;
    float _1130 = _1092;
    float _1132 = _1108;
    float _1134 = _1100;
    if (_1088)
    {
        int _1136 = ~_1084;
        int _1138 = _1136 + 1;
        _1128 = _1138;
    }
    int _1140 = _1128;
    int _1142 = _1114 * as_type<int>(_980);
    int _1144 = ~_1106;
    int _1146 = _1144 + 1;
    int _1148 = _1146 + 1;
    float _1150 = fma(_1126, _1126, _1116);
    int _1152 = abs(_1140);
    float _1154 = -_1108;
    float _1156 = _778 + _1154;
    int _1158 = abs(_1096);
    int _1160 = _1148 * as_type<int>(_972);
    int _1162 = _1160 + _1142;
    float _1164 = fma(_1156, _1156, _1150);
    bool _1166 = !_570;
    int _1168 = _1166 ? 0 : 1;
    float _1170 = _1156;
    if (_1098)
    {
        out.m_53.x = 0.0;
    }
    int _1172 = ~_1152;
    int _1174 = _1172 + 1;
    int _1176 = _1174 + 1;
    float _1178 = sqrt(_1164);
    int _1180 = abs(_1168);
    int _1182 = _1176 * as_type<int>(_1020);
    int _1184 = _1182 + _1162;
    float _1186 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1188 = ~_1158;
    int _1190 = _1188 + 1;
    int _1192 = _1190 + 1;
    float _1194 = _1032 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1196 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1198 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1186);
    int _1200 = _1192 * as_type<int>(_1028);
    int _1202 = _1200 + _1184;
    int _1204 = ~_1180;
    int _1206 = _1204 + 1;
    int _1208 = _1206 + 1;
    float _1210 = fma(_382, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1196);
    bool _1212 = !_339;
    int _1214 = _1212 ? _1058 : (-1);
    float _1216 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1198);
    int _1218 = _1202 * _1208;
    float _1220 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1210);
    float _1222 = -_1216;
    float _1224 = _1222 + 1.0;
    int _1226 = _1214 * _1180;
    int _1228 = _1226 + _1218;
    float _1230 = -_1220;
    float _1232 = _1230 + 1.0;
    float _1234 = -_1224;
    float _1236 = fma(_948, _1234, _1008);
    if (_1098)
    {
        _1170 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1238 = _1170;
    float _1240 = fma(_1002, _1232, _1046);
    float _1242 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1244 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1246 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1248 = _836 * _1178;
    float _1250 = _1242 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1252 = _1244 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1254 = _1246 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1256 = as_type<int>(_1238);
    if (_1098)
    {
        float _1258 = _1238 * 5.0;
        _1256 = as_type<int>(_1258);
    }
    int _1260 = _1256;
    float _1262 = float(_1228);
    float _1264 = _1080 * _1248;
    out.m_72.x = _1236;
    out.m_72.y = _1240;
    bool _1266 = !_844;
    int _1268 = _1266 ? 0 : 1;
    bool _1270 = !_848;
    int _1272 = _1270 ? 0 : 1;
    out.m_74.x = _1250;
    out.m_74.y = _1252;
    out.m_74.z = _1254;
    out.m_74.w = _1194;
    bool _1274 = !_840;
    int _1276 = _1274 ? 0 : 1;
    if (_1098)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5022 = as_type<float>(_1260);
        out.gl_Position.z = _5022;
    }
    out.m_76.x = _1262;
    out.m_78.x = _1264;
    if (_1098)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1278 = -_1092;
    float _1280 = _698 + _1278;
    float _1282 = -_1100;
    float _1284 = _730 + _1282;
    float _1286 = -_1108;
    float _1288 = _700 + _1286;
    float _1290 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1292 = _1280 + _1290;
    float _1294 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1296 = _1284 + _1294;
    float _1298 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1300 = _1288 + _1298;
    float _1302 = _1292 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1304 = fma(_1296, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1302);
    float _1306 = fma(_1300, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1304);
    bool _1308 = _1306 >= 0.0;
    float _1310 = _1300;
    if (_1308)
    {
        _1310 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1312 = _1310;
    int _1314 = as_type<int>(_1312);
    if (_1308)
    {
        out.m_53.x = 0.0;
    }
    if (_1308)
    {
        float _1316 = _1312 * 5.0;
        _1314 = as_type<int>(_1316);
    }
    int _1318 = _1314;
    if (_1308)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5107 = as_type<float>(_1318);
        out.gl_Position.z = _5107;
    }
    if (_1308)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1320 = -_698;
    float _1322 = _1320 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1324 = -_730;
    float _1326 = _1324 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1328 = -_700;
    float _1330 = _1328 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1332 = _1322 * _1322;
    float _1334 = floor(_950);
    float _1336 = fma(_1326, _1326, _1332);
    float _1338 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1340 = _295 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1342 = fma(_1330, _1330, _1336);
    float _1344 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _1346 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1348 = -_1338;
    float _1350 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _1348);
    float _1352 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1354 = -_1344;
    float _1356 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1354);
    float _1358 = rsqrt(_1342);
    float _1360 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1362 = -_1352;
    float _1364 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1362);
    int _1366 = abs(_1276);
    float _1368 = -_910;
    float _1370 = _698 + _1368;
    float _1372 = -_1360;
    float _1374 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1372);
    float _1376 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    bool _1378 = _1334 > 0.0;
    bool _1380 = _1334 >= 0.0;
    bool _1382 = isnan(_1334);
    bool _1384 = _1380 || _1382;
    bool _1386 = isnan(0.0);
    bool _1388 = _1384 || _1386;
    float _1390 = -_1376;
    float _1392 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _1390);
    float _1394 = _1326 * _1358;
    float _1396 = _1330 * _1358;
    float _1398 = -_1346;
    float _1400 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1398);
    float _1402 = _1350 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1404 = _1394 * _1394;
    float _1406 = _1322 * _1358;
    float _1408 = _1400 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1410 = -_1402;
    float _1412 = fma(_1356, (*spvDescriptorSet0.vp_c8)._m0[1].y, _1410);
    float _1414 = fma(_1396, _1396, _1404);
    float _1416 = _1400 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1418 = _382 * 2.0;
    float _1420 = fma(_1374, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1412);
    float _1422 = rsqrt(_1414);
    float _1424 = -_1416;
    float _1426 = fma(_1356, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1424);
    float _1428 = fma(_1364, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1426);
    float _1430 = floor(_1418);
    float _1432 = _1428 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1434 = -_1408;
    float _1436 = fma(_1350, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1434);
    float _1438 = _1364 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1440 = -_1432;
    float _1442 = fma(_1420, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1440);
    float _1444 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1436);
    float _1446 = -_1438;
    float _1448 = fma(_1374, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1446);
    float _1450 = _1396 * _1422;
    float _1452 = _1394 * _1422;
    float _1454 = fma(_1444, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1442);
    float _1456 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1448);
    float _1458 = -_1450;
    float _1460 = _1396 * _1458;
    float _1462 = -_1450;
    float _1464 = _1406 * _1462;
    float _1466 = _1400 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _1468 = -_1456;
    float _1470 = fma(_1468, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1454);
    float _1472 = -_1460;
    float _1474 = fma(_1394, _1452, _1472);
    float _1476 = _1406 * _1452;
    float _1478 = -_1466;
    float _1480 = fma(_1356, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1478);
    bool _1482 = _1430 > 0.0;
    float _1484 = _1474 * _1474;
    float _1486 = 1.0 / _1470;
    float _1488 = fma(_1364, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1480);
    bool _1490 = _1430 >= 0.0;
    bool _1492 = isnan(_1430);
    bool _1494 = _1490 || _1492;
    bool _1496 = isnan(0.0);
    bool _1498 = _1494 || _1496;
    float _1500 = fma(_1476, _1476, _1484);
    float _1502 = in.m_58.z;
    float _1504 = fma(_1464, _1464, _1500);
    float _1506 = _1350 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _1508 = rsqrt(_1504);
    float _1510 = -_1506;
    float _1512 = fma(_1356, (*spvDescriptorSet0.vp_c8)._m0[0].y, _1510);
    float _1514 = _1400 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1516 = fma(_1374, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1512);
    float _1518 = -_1514;
    float _1520 = fma(_1350, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1518);
    float _1522 = fma(_1488, _1486, -1.0);
    float _1524 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1520);
    int _1526 = _1498 ? 0 : 1;
    int _1528 = ~_1526;
    int _1530 = _1528 + 1;
    int _1532 = _1530 + 1;
    float _1534 = _1474 * _1508;
    float _1536 = precise::clamp(_1534, 0.0, 1.0);
    int _1538 = _1532;
    if (!_1482)
    {
        int _1540 = ~_1526;
        int _1542 = _1540 + 1;
        _1538 = _1542;
    }
    int _1544 = _1538;
    float _1546 = _1502 * 2.0;
    float _1548 = -_1536;
    float _1550 = _1548 + 1.0;
    float _1552 = _1550 * _1486;
    float _1554 = fma(_1550, _1522, 1.0);
    float _1556 = floor(_1546);
    float _1558 = _1516 * _1552;
    float _1560 = _1554 * _1554;
    float _1562 = _1524 * _1552;
    float _1564 = fma(_1558, _1558, _1560);
    float _1566 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1568 = log2(_1566);
    float _1570 = fma(_1562, _1562, _1564);
    float _1572 = rsqrt(_1570);
    bool _1574 = _1556 > 0.0;
    bool _1576 = _1556 >= 0.0;
    bool _1578 = isnan(_1556);
    bool _1580 = _1576 || _1578;
    bool _1582 = isnan(0.0);
    bool _1584 = _1580 || _1582;
    float _1586 = _382 + _380;
    int _1588 = _1584 ? 0 : 1;
    float _1590 = _1586 + (-1.0);
    int _1592 = ~_1588;
    int _1594 = _1592 + 1;
    int _1596 = _1594 + 1;
    float _1598 = fma(_1590, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1600 = _1568 * _121;
    int _1602 = _1596;
    if (!_1574)
    {
        int _1604 = ~_1588;
        int _1606 = _1604 + 1;
        _1602 = _1606;
    }
    int _1608 = _1602;
    float _1610 = _1562 * _1572;
    float _1612 = float(_1366);
    float _1614 = _1554 * _1572;
    float _1616 = float(_1608);
    float _1618 = _1558 * _1572;
    float _1620 = -_1610;
    float _1622 = _1394 * _1620;
    float _1624 = exp2(_1600);
    float _1626 = _1612 * _1616;
    float _1628 = _1396 * _1614;
    float _1630 = -_1618;
    float _1632 = -_1622;
    float _1634 = fma(_1396, _1630, _1632);
    float _1636 = -_1618;
    float _1638 = _1406 * _1636;
    bool _1640 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1642 = isnan(1.0);
    bool _1644 = _1640 || _1642;
    bool _1646 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1648 = _1644 || _1646;
    float _1650 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1652 = 1.0 + _1650;
    float _1654 = -_1610;
    float _1656 = -_1628;
    float _1658 = fma(_1406, _1654, _1656);
    bool _1660 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1662 = isnan(0.0);
    bool _1664 = _1660 || _1662;
    bool _1666 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1668 = _1664 || _1666;
    float _1670 = -_1638;
    float _1672 = fma(_1394, _1614, _1670);
    float _1674 = in.m_80.x;
    float _1676 = in.m_80.y;
    float _1678 = in.m_80.z;
    float _1680 = _1634 * _1634;
    float _1682 = 1.0 / _1652;
    float _1684 = _1502 + _380;
    float _1686 = _380 + (-0.5);
    float _1688 = fma(_1658, _1658, _1680);
    float _1690 = -_1624;
    float _1692 = _1690 + 1.0;
    int _1694 = abs(_1272);
    float _1696 = _1684 + (-1.0);
    float _1698 = fma(_1672, _1672, _1688);
    float _1700 = _1668 ? _1692 : 0.0;
    float _1702 = rsqrt(_1698);
    float _1704 = float(_1544);
    float _1706 = fma(_1696, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    if (_1648)
    {
        float _1708 = _1700 * _1682;
        _131 = _1708;
    }
    float _1710 = _131;
    float _1712 = _1626 * (-2.0);
    float _1714 = float(_1694);
    int _1716 = _1388 ? 0 : 1;
    float _1718 = fma(_1598, _1712, _1598);
    float _1720 = fma(_1712, _1674, _1674);
    float _1722 = _1714 * _1704;
    int _1724 = ~_1716;
    int _1726 = _1724 + 1;
    int _1728 = _1726 + 1;
    float _1730 = _1502 + (-0.5);
    float _1732 = fma(_1686, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1720);
    float _1734 = _1722 * (-2.0);
    int _1736 = _1728;
    if (!_1378)
    {
        int _1738 = ~_1716;
        int _1740 = _1738 + 1;
        _1736 = _1740;
    }
    int _1742 = _1736;
    float _1744 = _1658 * _1702;
    float _1746 = fma(_1718, _1710, _1732);
    float _1748 = _1672 * _1702;
    float _1750 = fma(_1706, _1734, _1706);
    float _1752 = _1396 * _1744;
    float _1754 = fma(_1734, _1678, _1678);
    int _1756 = abs(_1268);
    float _1758 = _1634 * _1702;
    float _1760 = _1406 * _1748;
    float _1762 = -_1752;
    float _1764 = fma(_1394, _1748, _1762);
    float _1766 = _1746 * 0.15915493667125701904296875;
    float _1768 = -_1760;
    float _1770 = fma(_1396, _1758, _1768);
    float _1772 = _1394 * _1758;
    float _1774 = _1764 * _1764;
    float _1776 = float(_1742);
    float _1778 = _382 + _1502;
    float _1780 = float(_1756);
    float _1782 = -_1772;
    float _1784 = fma(_1406, _1744, _1782);
    float _1786 = fma(_1770, _1770, _1774);
    float _1788 = _1778 + (-1.0);
    float _1790 = _1780 * _1776;
    float _1792 = fma(_1784, _1784, _1786);
    float _1794 = _382 + (-0.5);
    float _1796 = fma(_1788, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1798 = _1790 * (-2.0);
    float _1800 = fma(_1730, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1754);
    float _1802 = _1766 * 6.283185482025146484375;
    float _1804 = sin(_1802);
    bool _1806 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1808 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1810 = _1806 || _1808;
    bool _1812 = isnan(0.5);
    bool _1814 = _1810 || _1812;
    float _1816 = fma(_1798, _1676, _1676);
    float _1818 = fma(_1796, _1798, _1796);
    float _1820 = fma(_1750, _1710, _1800);
    float _1822 = fma(_1794, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1816);
    float _1824 = rsqrt(_1792);
    float _1826 = fma(_1818, _1710, _1822);
    float _1828 = _1826 * 0.15915493667125701904296875;
    float _1830 = _1340 * _1072;
    float _1832 = _1766 * 6.283185482025146484375;
    float _1834 = cos(_1832);
    float _1836 = _1830 * _1248;
    float _1838 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _189);
    float _1840 = _1784 * _1824;
    float _1842 = _1770 * _1824;
    float _1844 = _1764 * _1824;
    float _1846 = _1820 * 0.15915493667125701904296875;
    float _1848 = _1394 * _1840;
    float _1850 = _1406 * _1842;
    float _1852 = _1396 * _1844;
    float _1854 = _1846 * 6.283185482025146484375;
    float _1856 = sin(_1854);
    float _1858 = -_1848;
    float _1860 = fma(_1396, _1842, _1858);
    float _1862 = -_1850;
    float _1864 = fma(_1394, _1844, _1862);
    float _1866 = -_1852;
    float _1868 = fma(_1406, _1840, _1866);
    float _1870 = _1836 * _1838;
    float _1872 = _1860 * _1860;
    float _1874 = _1846 * 6.283185482025146484375;
    float _1876 = cos(_1874);
    float _1878 = fma(_1868, _1868, _1872);
    float _1880 = fma(_1864, _1864, _1878);
    float _1882 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _185);
    float _1884 = _1828 * 6.283185482025146484375;
    float _1886 = sin(_1884);
    float _1888 = _1804 * _1856;
    float _1890 = _1834 * _1856;
    float _1892 = _1264 * _1882;
    float _1894 = _1828 * 6.283185482025146484375;
    float _1896 = cos(_1894);
    float _1898 = _1834 * _1876;
    float _1900 = _1804 * _1876;
    float _1902 = rsqrt(_1880);
    float _1904 = fma(_1886, _1888, _1898);
    float _1906 = -_1890;
    float _1908 = fma(_1886, _1900, _1906);
    float _1910 = _1908 * _1870;
    float _1912 = _1856 * _1896;
    float _1914 = _1904 * _1870;
    float _1916 = _1876 * _1896;
    float _1918 = _1804 * _1896;
    float _1920 = fma(_1912, _1892, _1914);
    float _1922 = fma(_1916, _1892, _1910);
    float _1924 = _1918 * _1870;
    float _1926 = _1864 * _1902;
    float _1928 = _1920 * _1840;
    float _1930 = _1920 * _1842;
    float _1932 = -_1886;
    float _1934 = fma(_1932, _1892, _1924);
    float _1936 = _1868 * _1902;
    float _1938 = fma(_1922, _1926, _1928);
    float _1940 = -_942;
    float _1942 = _700 + _1940;
    float _1944 = _1860 * _1902;
    float _1946 = fma(_1922, _1936, _1930);
    float _1948 = fma(_1934, _1396, _1938);
    float _1950 = -_912;
    float _1952 = _730 + _1950;
    float _1954 = -_1108;
    float _1956 = _1954 + _1942;
    float _1958 = fma(_1934, _1394, _1946);
    float _1960 = _700 + _1948;
    float _1962 = -_1092;
    float _1964 = _1962 + _1370;
    float _1966 = -_1100;
    float _1968 = _1966 + _1952;
    float _1970 = _730 + _1958;
    float _1972 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1974 = _1960 + _1972;
    float _1976 = _1964 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1978 = _1920 * _1844;
    float _1980 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1982 = _1970 + _1980;
    float _1984 = _1974 * _1974;
    float _1986 = fma(_1968, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1976);
    float _1988 = fma(_1922, _1944, _1978);
    float _1990 = fma(_1982, _1982, _1984);
    float _1992 = fma(_1956, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1986);
    float _1994 = _1964 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1996 = fma(_1934, _1406, _1988);
    float _1998 = sqrt(_1990);
    float _2000 = _1992 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2002 = fma(_1968, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1994);
    bool _2004 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2006 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2008 = _2004 || _2006;
    bool _2010 = isnan(0.5);
    bool _2012 = _2008 || _2010;
    float _2014 = _698 + _1996;
    float _2016 = fma(_1956, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2002);
    float _2018 = 1.0 / _2000;
    float _2020 = _2016 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2022 = _2020 + _2000;
    bool _2024 = _1998 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2026 = _2022 * _2018;
    float _2028 = _2026 * 0.5;
    float _2030 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2032 = fma(_2028, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2030);
    float _2034 = _1934;
    float _2036 = _1970;
    float _2038 = _1960;
    float _2040 = _1996;
    float _2042 = _1982;
    float _2044 = _1956;
    if (!_2024)
    {
        _2034 = _2014;
    }
    float _2046 = _2034;
    bool _2048 = !_2024;
    float _2050 = _2046;
    if (!_2048)
    {
        float _2052 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2054 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2056 = _1998 + _2054;
        float _2058 = rsqrt(_1990);
        float _2060 = _2056 * _2052;
        float _2062 = _2014 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2064 = _2060 * 0.15915493667125701904296875;
        float _2066 = _2064 * 6.283185482025146484375;
        float _2068 = cos(_2066);
        float _2070 = _2064 * 6.283185482025146484375;
        float _2072 = sin(_2070);
        float _2074 = _2068 + (-1.0);
        float _2076 = fma(_2072, _2062, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2078 = _2074 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2080 = _2058 * _2076;
        float _2082 = fma(_2014, _2068, _2078);
        float _2084 = fma(_1982, _2080, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2086 = fma(_1974, _2080, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2050 = _2082;
        _2036 = _2084;
        _2038 = _2086;
        _2040 = _2076;
    }
    float _2088 = _2050;
    float _2090 = _2036;
    float _2092 = _2038;
    float _2094 = _2040;
    float _2096 = 1.0 / _2032;
    float _2098 = -_910;
    float _2100 = _2098 + _2088;
    float _2102 = -_912;
    float _2104 = _2102 + _2090;
    float _2106 = -_942;
    float _2108 = _2106 + _2092;
    float _2110 = -_1092;
    float _2112 = _2110 + _2100;
    float _2114 = -_1100;
    float _2116 = _2114 + _2104;
    float _2118 = -_1108;
    float _2120 = _2118 + _2108;
    float _2122 = _2112;
    float _2124 = _2116;
    float _2126 = _2120;
    float _2128 = _2094;
    if (_1814)
    {
        _1130 = 1.0;
    }
    float _2130 = _1130;
    float _2132 = _2130;
    if (!_2012)
    {
        float _2134 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2136 = _1964 + _2134;
        float _2138 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2140 = _1968 + _2138;
        float _2142 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2144 = -_700;
        float _2146 = _2144 + _2092;
        float _2148 = _2136 * _2136;
        float _2150 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2152 = _1956 + _2150;
        float _2154 = -_730;
        float _2156 = _2154 + _2090;
        float _2158 = fma(_2140, _2140, _2148);
        float _2160 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2162 = fma(_2152, _2152, _2158);
        float _2164 = sqrt(_2162);
        float _2166 = 1.0 / _1248;
        float _2168 = _2160 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2170 = precise::min(_2164, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2172 = _2170 * _2142;
        float _2174 = -_698;
        float _2176 = _2174 + _2088;
        float _2178 = _2172 * _2166;
        float _2180 = _2168 * _2178;
        float _2182 = _2146 * _2178;
        float _2184 = fma(_2176, _2180, _1964);
        float _2186 = fma(_2156, _2180, _1968);
        float _2188 = fma(_2168, _2182, _1956);
        _1062 = _2182;
        _2122 = _2184;
        _2124 = _2186;
        _2126 = _2188;
    }
    float _2190 = _1062;
    float _2192 = _2122;
    float _2194 = _2124;
    float _2196 = _2126;
    float _2198 = _2190;
    if (_1814)
    {
        _1132 = 1.0;
    }
    float _2200 = _1132;
    float _2202 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2204 = _2096 * _2202;
    float _2206 = _2200;
    if (!_1814)
    {
        float _2208 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2210 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2212 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2210;
        float _2214 = _2208 * 0.15915493667125701904296875;
        float _2216 = 1.0 / _2212;
        float _2218 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2220 = _2214 * 6.283185482025146484375;
        float _2222 = cos(_2220);
        float _2224 = _2218 * 0.15915493667125701904296875;
        float _2226 = _2214 * 6.283185482025146484375;
        float _2228 = sin(_2226);
        float _2230 = 1.0 / _2222;
        float _2232 = _2224 * 6.283185482025146484375;
        float _2234 = cos(_2232);
        float _2236 = _2228 * _2230;
        float _2238 = _2224 * 6.283185482025146484375;
        float _2240 = sin(_2238);
        float _2242 = _2234 * _2236;
        float _2244 = 1.0 / _2242;
        float _2246 = _2240 * _2244;
        float _2248 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2250 = fma(_2204, _2246, _2248);
        float _2252 = _2250 * _2216;
        float _2254 = precise::clamp(_2252, 0.0, 1.0);
        _2198 = _2236;
        _2128 = _2214;
        _2132 = _2254;
    }
    float _2256 = _2198;
    float _2258 = _2128;
    float _2260 = _2132;
    float _2262 = _2256;
    float _2264 = _2258;
    if (!_1814)
    {
        float _2266 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2268 = _2266 * 0.15915493667125701904296875;
        float _2270 = _2268 * 6.283185482025146484375;
        float _2272 = cos(_2270);
        float _2274 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2276 = _2274 * 0.15915493667125701904296875;
        float _2278 = _2268 * 6.283185482025146484375;
        float _2280 = sin(_2278);
        float _2282 = 1.0 / _2272;
        float _2284 = _2276 * 6.283185482025146484375;
        float _2286 = cos(_2284);
        float _2288 = _2280 * _2282;
        float _2290 = _2276 * 6.283185482025146484375;
        float _2292 = sin(_2290);
        float _2294 = _2286 * _2288;
        float _2296 = 1.0 / _2294;
        float _2298 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2300 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2298;
        float _2302 = 1.0 / _2300;
        float _2304 = _2292 * _2296;
        float _2306 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2308 = fma(_2204, _2304, _2306);
        float _2310 = _2308 * _2302;
        float _2312 = precise::clamp(_2310, 0.0, 1.0);
        float _2314 = -_2312;
        float _2316 = _2314 + 1.0;
        _2262 = _2282;
        _2264 = _2294;
        _2206 = _2316;
    }
    float _2318 = _2262;
    float _2320 = _2264;
    float _2322 = _2206;
    float _2324 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2326 = _2192 + _2324;
    float _2328 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2330 = _2194 + _2328;
    float _2332 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2334 = _2196 + _2332;
    float _2336 = _2326 * _2326;
    float _2338 = fma(_2330, _2330, _2336);
    float _2340 = fma(_2334, _2334, _2338);
    float _2342 = rsqrt(_2340);
    float _2344 = sqrt(_2340);
    float _2346 = _2342 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2348 = _2330 * _2346;
    float _2350 = _2334 * _2346;
    float _2352 = _2348 * _2348;
    float _2354 = _2350 * _2350;
    float _2356 = _2352 + _2354;
    float _2358 = sqrt(_2356);
    bool _2360 = _2358 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2362 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2364 = _2358 + _2362;
    float _2366 = _2318;
    float _2368 = _2364;
    float _2370 = _2326;
    float _2372 = _2348;
    float _2374 = _2350;
    if (_2360)
    {
        float _2376 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2366 = _2376;
    }
    float _2378 = _2366;
    if (_2360)
    {
        float _2380 = rsqrt(_2356);
        _1064 = _2380;
    }
    float _2382 = _1064;
    if (_2360)
    {
        float _2384 = _2364 * _2378;
        _2368 = _2384;
    }
    float _2386 = _2368;
    float _2388 = _2192 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (_2360)
    {
        float _2390 = _2386 * 0.15915493667125701904296875;
        _1134 = _2390;
    }
    float _2392 = _1134;
    float _2394 = fma(_2194, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2388);
    float _2396 = _2378;
    if (_2360)
    {
        float _2398 = _2392 * 6.283185482025146484375;
        float _2400 = sin(_2398);
        _2396 = _2400;
    }
    float _2402 = _2396;
    float _2404 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2406 = fma(_2196, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2394);
    float _2408 = precise::max(0.0, _2404);
    float _2410 = _2320;
    float _2412 = _2408;
    if (_2360)
    {
        float _2414 = _2392 * 6.283185482025146484375;
        float _2416 = cos(_2414);
        _2410 = _2416;
    }
    float _2418 = _2410;
    float _2420 = _2406 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2422 = -_2346;
    float _2424 = -_2408;
    float _2426 = fma(_2326, _2422, _2424);
    if (_2360)
    {
        float _2428 = _2426 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2412 = _2428;
    }
    float _2430 = _2412;
    float _2432 = _2402;
    float _2434 = _2430;
    if (_2360)
    {
        float _2436 = fma(_2402, _2430, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2042 = _2436;
    }
    float _2438 = _2042;
    float _2440 = _2438;
    if (!_2360)
    {
        _2432 = _2426;
    }
    float _2442 = _2432;
    float _2444 = _2442;
    if (_2360)
    {
        float _2446 = _2418 + (-1.0);
        _2370 = _2446;
    }
    float _2448 = _2370;
    float _2450 = _2448;
    if (_2360)
    {
        float _2452 = _2382 * _2438;
        _2440 = _2452;
    }
    float _2454 = _2440;
    if (_2360)
    {
        float _2456 = _2448 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2434 = _2456;
    }
    float _2458 = _2434;
    float _2460 = _2458;
    if (_2360)
    {
        float _2462 = _2348 * _2454;
        _2372 = _2462;
    }
    float _2464 = _2372;
    if (_2360)
    {
        float _2466 = _2350 * _2454;
        _2374 = _2466;
    }
    float _2468 = _2374;
    if (!_2360)
    {
        _2450 = _2354;
    }
    float _2470 = _2450;
    float _2472 = _2470;
    if (_2360)
    {
        float _2474 = fma(_2426, _2418, _2458);
        _2444 = _2474;
    }
    float _2476 = _2444;
    if (!_2360)
    {
        _2460 = _2352;
    }
    float _2478 = _2460;
    float _2480 = _2478;
    if (_2360)
    {
        float _2482 = _2464 * _2464;
        _2480 = _2482;
    }
    float _2484 = _2480;
    float _2486 = fma(_1968, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    if (_2360)
    {
        float _2488 = _2468 * _2468;
        _2472 = _2488;
    }
    float _2490 = _2472;
    float _2492 = fma(_2476, _2476, _2484);
    float _2494 = _2192 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2496 = floor(_2486);
    float _2498 = _2492 + _2490;
    float _2500 = fma(_2194, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2494);
    float _2502 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2504 = fma(_2344, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2502);
    float _2506 = precise::clamp(_2504, 0.0, 1.0);
    float _2508 = _2192 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2510 = fma(_2196, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2500);
    float _2512 = rsqrt(_2498);
    float _2514 = -_2506;
    float _2516 = _2514 + 1.0;
    float _2518 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2520 = _2510 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2522 = fma(_2194, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2508);
    float _2524 = _2520 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2526 = fma(_2196, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2522);
    float _2528 = abs(_2516);
    float _2530 = log2(_2528);
    float _2532 = fma(_1956, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2534 = -_2524;
    float _2536 = fma(_2534, _2518, 1.0);
    float _2538 = _2192 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2540 = _2526 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2542 = -_2496;
    float _2544 = _2486 + _2542;
    float _2546 = _2512 * _2464;
    float _2548 = fma(_2194, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2538);
    float _2550 = _2512 * _2476;
    float _2552 = _2512 * _2468;
    float _2554 = _2546 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2556 = fma(_2196, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2548);
    float _2558 = floor(_2532);
    float _2560 = _2540 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2562 = -_2554;
    float _2564 = fma(_2550, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2562);
    float _2566 = _2556 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2568 = _2540 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2570 = _2530 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2572 = -_2552;
    float _2574 = fma(_2572, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2564);
    float _2576 = fma(_2566, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2560);
    float _2578 = fma(_2566, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2568);
    float _2580 = log2(_2536);
    float _2582 = fma(_2574, 0.5, 0.5);
    float _2584 = fma(_2520, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2578);
    float _2586 = fma(_2582, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2588 = fma(_2420, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2584);
    float _2590 = exp2(_2570);
    float _2592 = fma(_2574, -0.5, 0.5);
    float _2594 = _2540 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2596 = -_2558;
    float _2598 = _2532 + _2596;
    float _2600 = _2550 + 1.0;
    float _2602 = fma(_2566, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2594);
    float _2604 = 1.0 / _2588;
    float _2606 = fma(_2582, _2586, -0.212114393711090087890625);
    float _2608 = fma(_2520, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2576);
    float _2610 = fma(_2520, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2602);
    float _2612 = _2580 * 0.693147182464599609375;
    float _2614 = fma(_2582, _2606, 1.570728778839111328125);
    float _2616 = fma(_2420, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2608);
    float _2618 = fma(_2420, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2610);
    float _2620 = sqrt(_2592);
    float _2622 = -_2550;
    float _2624 = fma(_2590, _2600, _2622);
    float _2626 = _2612 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float2 _7105 = float2(_2544, _2598);
    float _2628 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7105, float2(0.0), isnan(_7105)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7105, float2(0.0), isnan(_7105)), level(0.0)).x;
    float _2630 = fma(_2624, 0.5, 0.5);
    float _2632 = _2616 * _2604;
    float _2634 = _2618 * _2604;
    float _2636 = fma(_2632, 0.5, 0.5);
    float _2638 = fma(_2634, -0.5, 0.5);
    float _2640 = _2620 * 0.636619746685028076171875;
    float _2642 = -_2614;
    float _2644 = fma(_2640, _2642, 1.0);
    float3 _7136 = float3(_2636, _2638, _2626);
    float _2646 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7136, float3(0.0), isnan(_7136)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7136, float3(0.0), isnan(_7136)), level(0.0)).x;
    float3 _7147 = float3(_2636, _2638, _2626);
    float4 _2649 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7147, float3(0.0), isnan(_7147)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7147, float3(0.0), isnan(_7147)), level(0.0)).xyzw;
    float _2651 = _2649.x;
    float _2653 = _2649.y;
    float _2655 = _2649.z;
    float _2657 = _2649.w;
    float2 _7163 = float2(_2644, _2630);
    float3 _2661 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7163, float2(0.0), isnan(_7163)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7163, float2(0.0), isnan(_7163)), level(0.0)).xyz;
    float _2663 = _2661.x;
    float _2665 = _2661.y;
    float _2667 = _2661.z;
    float _2669 = abs(_2204);
    float _2671 = log2(_2669);
    float _2673 = _2530 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2675 = -_1900;
    float _2677 = fma(_1886, _1890, _2675);
    float _2679 = fma(_1886, _1898, _1888);
    float _2681 = _1834 * _1896;
    float _2683 = _1904 * _1842;
    float _2685 = _189 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2687 = _2540 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_82.x = _1968;
    out.m_82.y = _1964;
    out.m_82.z = _1956;
    bool _2689 = _2344 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2691 = isnan(_2344);
    bool _2693 = _2689 || _2691;
    bool _2695 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2697 = _2693 || _2695;
    out.m_84.x = _2194;
    out.m_84.y = _2192;
    out.m_84.z = _2196;
    float _2699 = _2671 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    bool _2701 = _2204 <= 8000.0;
    bool _2703 = isnan(_2204);
    bool _2705 = _2701 || _2703;
    bool _2707 = isnan(8000.0);
    bool _2709 = _2705 || _2707;
    float _2711 = float(_2709);
    float _2713 = _1912 * _1842;
    float _2715 = _2677 * _1842;
    float _2717 = exp2(_2673);
    float _2719 = _1912 * _1844;
    float _2721 = _1912 * _1840;
    float _2723 = _1904 * _1844;
    float _2725 = _1904 * _1840;
    float _2727 = fma(_2679, _1936, _2715);
    float _2729 = fma(_1916, _1926, _2721);
    float _2731 = fma(_2566, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2687);
    float _2733 = exp2(_2699);
    float _2735 = _2616;
    if (!_2697)
    {
        _2044 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2737 = _2044;
    float _2739 = fma(_2520, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2731);
    float _2741 = -_2717;
    float _2743 = _2741 + 1.0;
    float _2745 = fma(_2733, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2747 = precise::clamp(_2745, 0.0, 1.0);
    float _2749 = _2677 * _1844;
    float _2751 = _2677 * _1840;
    float _2753 = fma(_1908, _1936, _2683);
    float _2755 = fma(_2747, -2.0, 3.0);
    float _2757 = _2747 * _2747;
    float _2759 = fma(_1916, _1944, _2719);
    float _2761 = fma(_2679, _1944, _2749);
    float _2763 = fma(_2679, _1926, _2751);
    float _2765 = _2757 * _2755;
    float _2767 = -_1886;
    float _2769 = fma(_2767, _1406, _2759);
    float _2771 = fma(_2681, _1406, _2761);
    float _2773 = -_2765;
    float _2775 = _2773 + 1.0;
    float _2777 = fma(_2775, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2765);
    float _2779 = _2711 * _2777;
    float _2781 = fma(_1916, _1936, _2713);
    float _2783 = fma(_1908, _1944, _2723);
    float _2785 = fma(_1908, _1926, _2725);
    float _2787 = fma(_1918, _1394, _2753);
    float _2789 = -_1886;
    float _2791 = fma(_2789, _1394, _2781);
    float _2793 = fma(_1918, _1406, _2783);
    float _2795 = fma(_1918, _1396, _2785);
    float _2797 = -_1886;
    float _2799 = fma(_2797, _1396, _2729);
    float _2801 = fma(_2681, _1396, _2763);
    float _2803 = _185 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2805 = _2685 * _2787;
    float _2807 = _2685 * _2793;
    float _2809 = _2685 * _2795;
    float _2811 = in.m_86.x;
    float _2813 = fma(_2803, _2791, _2805);
    float _2815 = fma(_2803, _2769, _2807);
    float _2817 = fma(_2803, _2799, _2809);
    float _2819 = _2743 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2821 = fma(_2420, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2739);
    float _2823 = fma(_2681, _1394, _2727);
    float _2825 = _2779 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2827 = _2616 + _2588;
    float _2829 = _2821 + _2588;
    float _2831 = _2588 * 0.5;
    float _2833 = _2771 + _2815;
    float _2835 = _2829 * 0.5;
    float _2837 = _2827 * 0.5;
    float _2839 = fma(_2618, -0.5, _2831);
    float _2841 = _2823 + _2813;
    float _2843 = _2801 + _2817;
    out.gl_Position.x = _2616;
    out.gl_Position.y = _2618;
    out.gl_Position.z = _2821;
    out.gl_Position.w = _2588;
    float _2845 = _2813;
    float _2847 = _2737;
    float _2849 = _2737;
    if (!_2697)
    {
        _2845 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2851 = _2845;
    out.m_88.x = _2837;
    out.m_88.y = _2839;
    out.m_88.z = _2835;
    out.m_88.w = _2588;
    out.m_90.x = _2841;
    out.m_90.y = _2833;
    out.m_90.z = _2843;
    float _2853 = _2851;
    float _2855 = _2851;
    if (!_2697)
    {
        _2735 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2857 = _2735;
    float _2859 = -_2628;
    float _2861 = _2859 + 1.0;
    float _2863 = _2861 * _2825;
    float _2865 = precise::clamp(_2863, 0.0, 1.0);
    float _2867 = -_2865;
    float _2869 = fma(_2867, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2871 = _2869 * _2811;
    float _2873 = _2871 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2875 = _2871;
    float _2877 = _2873;
    float _2879 = _2857;
    float _2881 = _2857;
    if (!_2697)
    {
        _2875 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2883 = _2875;
    float _2885 = _2819 * _2646;
    float _2887 = -_2819;
    float _2889 = _2887 + 1.0;
    out.m_92.x = _2873;
    float _2891 = _2657 * _2885;
    float _2893 = _2667 * _2885;
    float _2895 = _2657 * _2889;
    float _2897 = fma(_2663, _2891, _2651);
    float _2899 = fma(_2665, _2891, _2653);
    float _2901 = fma(_2657, _2893, _2655);
    float _2903 = _2260 * _2322;
    float _2905 = _2903;
    float _2907 = _2883;
    float _2909 = _2883;
    if (!_2697)
    {
        _2877 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2911 = _2877;
    out.m_94.x = _2897;
    out.m_94.y = _2899;
    out.m_94.z = _2901;
    out.m_94.w = _2895;
    float _2913 = _2903 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2915 = _2911;
    float _2917 = _2911;
    if (!_2697)
    {
        _2905 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2919 = _2905;
    bool _2921 = !_2697;
    float _2923 = _2919;
    float _2925 = _2919;
    if (!_2921)
    {
        bool _2927 = _2344 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2929 = isnan(_2344);
        bool _2931 = _2927 || _2929;
        bool _2933 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2935 = _2931 || _2933;
        if (!_2935)
        {
            float _2937 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2939 = _2344 + _2937;
            float _2941 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2943 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2941;
            float _2945 = 1.0 / _2943;
            float _2947 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2949 = _2947 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2951 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2953 = _2951 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2955 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2957 = _2955 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2959 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2961 = _2959 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2963 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2965 = _2963 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2967 = _2939 * _2945;
            float _2969 = precise::clamp(_2967, 0.0, 1.0);
            float _2971 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2973 = _2971 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2975 = fma(_2969, _2949, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2977 = fma(_2969, _2973, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2979 = fma(_2969, _2953, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2981 = fma(_2969, _2957, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2983 = fma(_2969, _2961, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2985 = fma(_2969, _2965, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2881 = _2977;
            _2917 = _2983;
            _2855 = _2975;
            _2849 = _2981;
            _2909 = _2979;
            _2925 = _2985;
            _2987 = true;
        }
        else
        {
            bool _2989 = _2344 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2991 = isnan(_2344);
            bool _2993 = _2989 || _2991;
            bool _2995 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2997 = _2993 || _2995;
            if (!_2997)
            {
                _2853 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2999 = _2853;
            _2855 = _2999;
            if (!_2997)
            {
                _2879 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3001 = _2879;
            _2881 = _3001;
            if (!_2997)
            {
                _2907 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3003 = _2907;
            _2909 = _3003;
            if (!_2997)
            {
                _2847 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3005 = _2847;
            _2849 = _3005;
            if (!_2997)
            {
                _2915 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3007 = _2915;
            _2917 = _3007;
            if (!_2997)
            {
                _2923 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3009 = _2923;
            bool _3011 = !_2997;
            _2925 = _3009;
            if (!_3011)
            {
                bool _3013 = _2344 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3015 = isnan(_2344);
                bool _3017 = _3013 || _3015;
                bool _3019 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3021 = _3017 || _3019;
                if (!_3021)
                {
                    float _3023 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3025 = _2344 + _3023;
                    float _3027 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3029 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3027;
                    float _3031 = 1.0 / _3029;
                    float _3033 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3035 = _3033 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3037 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3039 = _3037 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3041 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3043 = _3041 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3045 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3047 = _3045 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3049 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3051 = _3049 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3053 = _3025 * _3031;
                    float _3055 = precise::clamp(_3053, 0.0, 1.0);
                    float _3057 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3059 = _3057 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3061 = fma(_3055, _3035, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3063 = fma(_3055, _3059, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3065 = fma(_3055, _3039, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3067 = fma(_3055, _3043, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3069 = fma(_3055, _3047, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3071 = fma(_3055, _3051, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2881 = _3063;
                    _2917 = _3069;
                    _2855 = _3061;
                    _2849 = _3067;
                    _2909 = _3065;
                    _2925 = _3071;
                    _2987 = true;
                }
                else
                {
                    _2881 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2917 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2855 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2849 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2909 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2925 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2987 = false;
    float _3073 = _2881;
    float _3075 = _2917;
    float _3077 = _2855;
    float _3079 = _2849;
    float _3081 = _2909;
    float _3083 = _2925;
    float _3085 = fma(_2833, -0.5, 0.5);
    float _3087 = precise::clamp(_3085, 0.0, 1.0);
    float _3089 = -_3073;
    float _3091 = _3089 + _3075;
    float _3093 = _2913 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3095 = -_3077;
    float _3097 = _3095 + _3079;
    float _3099 = fma(_3087, _3091, _3073);
    out.m_96.x = 0.0;
    float _3101 = -_3081;
    float _3103 = _3101 + _3083;
    float _3105 = fma(_3087, _3097, _3077);
    float _3107 = _3099 * 0.586610972881317138671875;
    out.m_53.x = _3093;
    bool _3109 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3111 = fma(_3087, _3103, _3081);
    float _3113 = fma(_3105, 0.298911988735198974609375, _3107);
    bool _3115 = _2260 > 0.0;
    bool _3117 = isnan(_2260);
    bool _3119 = _3115 || _3117;
    bool _3121 = isnan(0.0);
    bool _3123 = _3119 || _3121;
    float _3125 = fma(_3111, 0.114477999508380889892578125, _3113);
    bool _3127 = _2322 <= 0.0;
    bool _3129 = !_3123;
    bool _3131 = _3127 || _3129;
    float _3133 = -_3125;
    float _3135 = _3105 + _3133;
    float _3137 = -_3125;
    float _3139 = _3099 + _3137;
    float _3141 = -_3125;
    float _3143 = _3111 + _3141;
    float _3145 = fma(_3135, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3125);
    float _3147 = fma(_3139, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3125);
    float _3149 = fma(_3143, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3125);
    bool _3151 = !_3109;
    if (!_3151)
    {
        float _3153 = -_2192;
        float _3155 = _3153 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3157 = -_2194;
        float _3159 = _3157 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3161 = -_2196;
        float _3163 = _3161 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3165 = _3155 * _3155;
        float _3167 = fma(_3159, _3159, _3165);
        float _3169 = fma(_3163, _3163, _3167);
        float _3171 = sqrt(_3169);
        float _3173 = rsqrt(_3169);
        float _3175 = -_3171;
        float _3177 = _3175 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3179 = _3177 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3181 = precise::clamp(_3179, 0.0, 1.0);
        float _3183 = _3159 * _3173;
        float _3185 = _3155 * _3173;
        float _3187 = abs(_3181);
        float _3189 = log2(_3187);
        float _3191 = _3163 * _3173;
        float _3193 = _3183 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3195 = _2833 * _3185;
        float _3197 = -_3185;
        float _3199 = -_3193;
        float _3201 = fma(_3197, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3199);
        float _3203 = fma(_2841, _3183, _3195);
        float _3205 = -_3191;
        float _3207 = fma(_3205, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3201);
        float _3209 = fma(_2843, _3191, _3203);
        float _3211 = precise::clamp(_3209, 0.0, 1.0);
        float _3213 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3215 = _3207 + _3213;
        float _3217 = _3189 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3219 = _3215 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3221 = precise::clamp(_3219, 0.0, 1.0);
        float _3223 = exp2(_3217);
        float _3225 = _3223 * _3221;
        float _3227 = _3211 * _3225;
        float _3229 = _3227 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3231 = _3227 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3233 = _3227 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_96.x = _3229;
        out.m_96.y = _3231;
        out.m_96.z = _3233;
    }
    out.m_70.x = _3145;
    out.m_70.y = _3147;
    out.m_70.z = _3149;
    if (!_3131)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_53.x = 0.0;
    float _3235 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3235;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}


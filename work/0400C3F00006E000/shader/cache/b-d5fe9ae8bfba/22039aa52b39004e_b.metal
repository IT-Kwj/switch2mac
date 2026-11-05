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
    float4 m_68 [[user(locn0)]];
    float4 m_62 [[user(locn1)]];
    float4 m_55 [[user(locn2)]];
    float4 m_86 [[user(locn3)]];
    float4 m_53 [[user(locn4)]];
    float4 m_64 [[user(locn5)]];
    float4 m_78 [[user(locn6)]];
    float4 m_70 [[user(locn7)]];
    float4 m_74 [[user(locn8)]];
    float4 m_84 [[user(locn9)]];
    float4 m_80 [[user(locn10)]];
    float4 m_82 [[user(locn11)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_76 [[attribute(0)]];
    float4 m_66 [[attribute(1)]];
    float4 m_48 [[attribute(2)]];
    float4 m_50 [[attribute(3)]];
    float4 m_60 [[attribute(4)]];
    float4 m_72 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2627 = false;
    bool _1748 = false;
    bool _203 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _100 = in.m_48.w;
    float _102 = in.m_50.w;
    float _104 = trunc(_100);
    int _107 = int(_104);
    float _109 = -_102;
    float _111 = _109 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.y = _111;
    bool _115 = _107 >= 1;
    float _117 = 0.0;
    float _119 = _102;
    float _121 = _111;
    if (!_115)
    {
        _117 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _123 = _117;
    if (!_115)
    {
        out.m_55.x = 0.0;
    }
    int _125 = 0;
    if (!_115)
    {
        float _127 = _123 * 5.0;
        _125 = as_type<int>(_127);
    }
    int _129 = _125;
    int _131 = _129;
    if (!_115)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2943 = as_type<float>(_129);
        out.gl_Position.z = _2943;
    }
    if (!_115)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _133 = _102 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _135 = isnan(_102);
    bool _137 = _133 || _135;
    bool _139 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _141 = _137 || _139;
    float _143 = float(_107);
    bool _145 = _111 >= _143;
    bool _147 = !_141;
    bool _149 = _145 || _147;
    if (_149)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _151 = _119;
    if (_149)
    {
        out.m_55.x = 0.0;
    }
    if (_149)
    {
        float _153 = _151 * 5.0;
        _131 = as_type<int>(_153);
    }
    int _155 = _131;
    if (_149)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2998 = as_type<float>(_155);
        out.gl_Position.z = _2998;
    }
    if (_149)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _157 = as_type<float>(int(gl_VertexIndex));
    float _159 = 1.0 / _143;
    bool _161 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _163 = _111 * _159;
    int _165 = as_type<int>(_157) & 1;
    bool _167 = _165 != 0;
    int _169 = as_type<int>(_157) & 2;
    bool _171 = _169 != 0;
    bool _173 = !_167;
    float _175 = _173 ? (-0.5) : 0.5;
    bool _177 = !_171;
    float _179 = _177 ? (-0.5) : 0.5;
    bool _181 = !_161;
    float _183 = _163;
    float _201;
    if (!_181)
    {
        float _185 = in.m_60.x;
        float _187 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _189 = _185 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _191 = fma(_189, (*spvDescriptorSet0.vp_c9)._m0[12].x, _111);
        float _193 = _191 * _187;
        float _195 = floor(_193);
        float _197 = -_195;
        float _199 = _193 + _197;
        _201 = _199;
        _203 = true;
    }
    else
    {
        _201 = _163;
    }
    _203 = false;
    float _205 = _201;
    float _207 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _209 = _205 + _207;
    bool _211 = _205 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _213 = isnan(_205);
    bool _215 = _211 || _213;
    bool _217 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _219 = _215 || _217;
    float _221 = float(_219);
    float _223 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _225 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _223;
    float _227 = -_221;
    float _229 = _227 + 1.0;
    bool _231 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _233 = 1.0 / _225;
    float _235 = _209 * _233;
    bool _237 = _205 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _239 = isnan(_205);
    bool _241 = _237 || _239;
    bool _243 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _245 = _241 || _243;
    float _247 = float(_245);
    float _249 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _251 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _249;
    float _253 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _255 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _253;
    float _257 = _247 * _229;
    float _259 = fma(_251, _235, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _261 = fma(_255, _235, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _263 = -_247;
    float _265 = _263 + 1.0;
    float _267 = _259 * _257;
    float _269 = _261 * _257;
    float _271 = fma(_265, (*spvDescriptorSet0.vp_c9)._m0[143].x, _267);
    float _273 = fma(_265, (*spvDescriptorSet0.vp_c9)._m0[143].y, _269);
    float _275 = fma(_221, (*spvDescriptorSet0.vp_c9)._m0[144].x, _271);
    float _277 = fma(_221, (*spvDescriptorSet0.vp_c9)._m0[144].y, _273);
    bool _279 = !_231;
    if (!_279)
    {
        float _281 = in.m_60.x;
        float _283 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _285 = _281 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _287 = fma(_285, (*spvDescriptorSet0.vp_c9)._m0[11].y, _111);
        float _289 = _287 * _283;
        float _291 = floor(_289);
        float _293 = -_291;
        float _295 = _289 + _293;
        _183 = _295;
    }
    float _297 = _183;
    float _299 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _301 = int(_299);
    float _303 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _305 = int(_303);
    float _307 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _309 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _311 = float(_301);
    float _313 = 1.0 / _311;
    bool _315 = _297 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _317 = isnan(_297);
    bool _319 = _315 || _317;
    bool _321 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _323 = _319 || _321;
    float _325 = float(_323);
    float _327 = float(uint(_305));
    int _329 = ~_305;
    int _331 = _329 + 1;
    int _333 = ~_305;
    int _335 = _333 + 1;
    float _337 = 1.0 / _327;
    float _339 = _313 * _111;
    float _341 = trunc(_339);
    int _343 = int(_341);
    int _345 = as_type<int>(_337) + (-2);
    float _347 = float(_305);
    float _349 = float(uint(_343));
    float _351 = as_type<float>(_345) * _349;
    float _353 = trunc(_351);
    float _355 = precise::max(_353, 0.0);
    uint _358 = uint(_355);
    int _360 = _331 * int(_358);
    int _362 = _360 + _343;
    float _364 = in.m_60.x;
    float _366 = in.m_60.y;
    float _368 = float(uint(_362));
    float _370 = as_type<float>(_345) * _368;
    float _372 = trunc(_370);
    float _374 = precise::max(_372, 0.0);
    uint _376 = uint(_374);
    int _378 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _380 = _378 != 0;
    bool _382 = !_380;
    float _384 = _382 ? 7.345489978790283203125 : 1.0;
    float _386 = _384 * _364;
    int _388 = int(_358) + int(_376);
    float _390 = float(_343);
    float _392 = floor(_386);
    int _394 = _335 * _388;
    int _396 = _394 + _343;
    bool _398 = _390 >= _347;
    bool _400 = isnan(_390);
    bool _402 = _398 || _400;
    bool _404 = isnan(_347);
    bool _406 = _402 || _404;
    float _408 = float(_406);
    bool _410 = uint(_396) >= uint(_305);
    float _412 = trunc(_408);
    int _414 = int(_412);
    bool _416 = !_410;
    int _418 = _416 ? 0 : (-1);
    bool _420 = _305 == 0;
    int _422 = ~_388;
    int _424 = _422 + _418;
    int _426 = _424 + 1;
    float _428 = -_392;
    float _430 = _386 + _428;
    int _432 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _434 = _432 != 0;
    int _436 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _438 = _436 != 0;
    int _440 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _442 = _440 != 0;
    int _444 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _446 = _444 != 0;
    int _448 = _305 * _426;
    int _450 = _448 + _343;
    float _452 = _430 * _347;
    int _454 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _456 = _454 != 0;
    int _458 = ~_414;
    int _460 = _458 + 1;
    int _462 = _460 + 1;
    bool _464 = !_420;
    int _466 = _464 ? _450 : (-1);
    float _468 = trunc(_452);
    int _470 = int(_468);
    int _472 = _466 * _462;
    float _474 = _347 * _111;
    int _476 = _305 + (-1);
    bool _478 = !_446;
    int _480 = _478 ? 0 : 1;
    float _482 = _474 * _159;
    bool _484 = !_438;
    int _486 = _484 ? 0 : 1;
    int _488 = _414 * _476;
    int _490 = _488 + _472;
    bool _492 = !_434;
    int _494 = _492 ? 0 : 1;
    int _496 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _498 = _496 != 0;
    float _500 = trunc(_482);
    int _502 = int(_500);
    int _504 = abs(_486);
    bool _506 = !_442;
    int _508 = _506 ? 0 : 1;
    int _510 = abs(_480);
    int _512 = abs(_494);
    bool _514 = !_498;
    int _516 = _514 ? 0 : 1;
    int _518 = _470 * _510;
    int _520 = _518 + _343;
    int _522 = abs(_508);
    int _524 = _490 * _504;
    int _526 = abs(_516);
    int _528 = _502 * _512;
    int _530 = _528 + _524;
    int _532 = ~_305;
    int _534 = _532 + 1;
    int _536 = _520 * _522;
    int _538 = _536 + _530;
    int _540 = ~_305;
    int _542 = _540 + 1;
    int _544 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _546 = _544 != 0;
    int _548 = _470 * _526;
    int _550 = _548 + _538;
    int _552 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _554 = _552 != 0;
    float _556 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _558 = log2(_556);
    bool _560 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _562 = isnan(1.0);
    bool _564 = _560 || _562;
    bool _566 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _568 = _564 || _566;
    float _570 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _572 = 1.0 + _570;
    float _574 = float(uint(_550));
    bool _576 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _578 = isnan(0.0);
    bool _580 = _576 || _578;
    bool _582 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _584 = _580 || _582;
    float _586 = as_type<float>(_345) * _574;
    float _588 = 1.0 / _572;
    float _590 = _558 * _111;
    float _592 = trunc(_586);
    float _594 = precise::max(_592, 0.0);
    uint _596 = uint(_594);
    int _598 = _542 * int(_596);
    int _600 = _598 + _550;
    float _602 = float(uint(_600));
    float _604 = as_type<float>(_345) * _602;
    float _606 = in.m_48.x;
    float _608 = in.m_48.y;
    float _610 = in.m_48.z;
    float _612 = trunc(_604);
    float _614 = precise::max(_612, 0.0);
    uint _616 = uint(_614);
    int _618 = int(_596) + int(_616);
    float _620 = _364 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _622 = _608 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _624 = _534 * _618;
    int _626 = _624 + _550;
    float _628 = _608 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _630 = -_307;
    float _632 = fma(_620, 2.0, _630);
    float _634 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _636 = uint(_626) >= uint(_305);
    float _638 = _366 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _640 = fma(_606, (*spvDescriptorSet0.vp_c10)._m0[4].x, _622);
    float _642 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _644 = !_636;
    int _646 = _644 ? 0 : (-1);
    float _648 = fma(_638, -2.0, _309);
    float _650 = fma(_606, (*spvDescriptorSet0.vp_c10)._m0[6].x, _628);
    int _652 = ~_618;
    int _654 = _652 + _646;
    int _656 = _654 + 1;
    float _658 = _608 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _660 = exp2(_590);
    float _662 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _664 = fma(_606, (*spvDescriptorSet0.vp_c10)._m0[5].x, _658);
    int _666 = _305 * _656;
    int _668 = _666 + _550;
    float _670 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _672 = _634 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _674 = _642 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _676 = _670 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _678 = !_420;
    int _680 = _678 ? _668 : (-1);
    float _682 = in.m_60.z;
    float _684 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[76].y, _648);
    float _686 = fma(_610, (*spvDescriptorSet0.vp_c10)._m0[4].z, _640);
    int _688 = _680 & 3;
    bool _690 = _688 != 0;
    out.m_62.x = _672;
    out.m_62.y = _674;
    out.m_62.z = _676;
    out.m_62.w = _662;
    float _692 = fma(_610, (*spvDescriptorSet0.vp_c10)._m0[5].z, _664);
    float _694 = fma(_610, (*spvDescriptorSet0.vp_c10)._m0[6].z, _650);
    float _696 = -_660;
    float _698 = _696 + 1.0;
    float _700 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _702 = _364 * 2.0;
    int _704 = _690 ? 0 : 1;
    float _706 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _708 = _706 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _710 = _680 & 3;
    bool _712 = _710 != 0;
    float _714 = fma(_364, (*spvDescriptorSet0.vp_c9)._m0[78].z, _700);
    float _716 = _584 ? _698 : 0.0;
    float _718 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _720 = floor(_702);
    float _722 = _366 * 2.0;
    bool _724 = uint(_710) > 1u;
    float _726 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[78].w, _718);
    float _728 = -_111;
    float _730 = fma(_728, (*spvDescriptorSet0.vp_c9)._m0[76].x, _632);
    float _732 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[77].z, _714);
    int _734 = ~_704;
    int _736 = _734 + 1;
    int _738 = _736 + 1;
    float _740 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[77].w, _726);
    float _742 = floor(_722);
    int _744 = _738;
    if (_568)
    {
        float _746 = _716 * _588;
        _121 = _746;
    }
    float _748 = _121;
    bool _750 = _364 > 0.5;
    float _752 = _366 + _682;
    float _754 = -_732;
    float _756 = _754 + 1.0;
    float _758 = -_175;
    int _760 = _750 ? as_type<int>(_758) : as_type<int>(_175);
    bool _762 = _366 > 0.5;
    float _764 = 1.0 / _708;
    if (!_724)
    {
        int _766 = ~_704;
        int _768 = _766 + 1;
        _744 = _768;
    }
    int _770 = _744;
    float _772 = _366 + _364;
    bool _774 = _720 >= 0.0;
    bool _776 = isnan(_720);
    bool _778 = _774 || _776;
    bool _780 = isnan(0.0);
    bool _782 = _778 || _780;
    float _784 = -_179;
    int _786 = _762 ? as_type<int>(_784) : as_type<int>(_179);
    float _788 = _772 + (-1.0);
    bool _790 = _720 > 0.0;
    int _792 = _782 ? 0 : 1;
    float _794 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _796 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _794;
    bool _798 = !_456;
    float _800 = _798 ? _175 : as_type<float>(_760);
    float _802 = _752 + (-1.0);
    bool _804 = _742 > 0.0;
    float _806 = fma(_788, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _808 = _742 >= 0.0;
    bool _810 = isnan(_742);
    bool _812 = _808 || _810;
    bool _814 = isnan(0.0);
    bool _816 = _812 || _814;
    float _818 = _796 * _764;
    float _820 = float(uint(_520));
    float _822 = _682 * 2.0;
    float _824 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _826 = _297 + _824;
    bool _828 = !_554;
    float _830 = _828 ? _179 : as_type<float>(_786);
    float _832 = fma(_802, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _834 = as_type<float>(_345) * _820;
    int _836 = _680 >> 31;
    float _838 = floor(_822);
    bool _840 = uint(_710) >= 2u;
    float _842 = _800 + 0.5;
    int _844 = _836 & 3;
    int _846 = _816 ? 0 : 1;
    int _848 = _680 + _844;
    float _850 = trunc(_834);
    float _852 = precise::max(_850, 0.0);
    uint _854 = uint(_852);
    int _856 = ~_792;
    int _858 = _856 + 1;
    int _860 = _858 + 1;
    float _862 = fma(_818, _826, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    int _864 = _848 >> 2;
    float _866 = -_325;
    float _868 = _866 + 1.0;
    int _870 = _860;
    if (!_790)
    {
        int _872 = ~_792;
        int _874 = _872 + 1;
        _870 = _874;
    }
    int _876 = _870;
    int _878 = _840 ? 0 : 1;
    bool _880 = _297 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _882 = isnan(_297);
    bool _884 = _880 || _882;
    bool _886 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _888 = _884 || _886;
    float _890 = float(_888);
    int _892 = ~_846;
    int _894 = _892 + 1;
    int _896 = _894 + 1;
    int _898 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _900 = _898 != 0;
    int _902 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _904 = _902 != 0;
    int _906 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _908 = _906 != 0;
    float _910 = _890 * _868;
    int _912 = _896;
    if (!_804)
    {
        int _914 = ~_846;
        int _916 = _914 + 1;
        _912 = _916;
    }
    int _918 = _912;
    float _920 = -_890;
    float _922 = _920 + 1.0;
    int _924 = ~_305;
    int _926 = _924 + 1;
    int _928 = _864 << 4;
    int _930 = _928 + 368;
    bool _932 = !_900;
    int _934 = _932 ? 0 : 1;
    int _936 = _926 * int(_854);
    int _938 = _936 + _520;
    uint _940 = uint(int(uint(_930) >> uint(2)));
    uint _942 = uint(int(uint(int(_940)) >> uint(2)));
    int _944 = int(_940) & 3;
    float _946 = (*spvDescriptorSet0.vp_c9)._m0[int(_942)][_944];
    int _948 = int(_940) + 1;
    uint _950 = uint(int(uint(_948) >> uint(2)));
    int _952 = _948 & 3;
    float _954 = (*spvDescriptorSet0.vp_c9)._m0[int(_950)][_952];
    bool _956 = _838 >= 0.0;
    bool _958 = isnan(_838);
    bool _960 = _956 || _958;
    bool _962 = isnan(0.0);
    bool _964 = _960 || _962;
    bool _966 = _838 > 0.0;
    float _968 = float(uint(_938));
    float _970 = _862 * _910;
    float _972 = fma(_842, (*spvDescriptorSet0.vp_c9)._m0[80].x, _730);
    float _974 = _830 + (-0.5);
    int _976 = _930 + 8;
    uint _978 = uint(int(uint(_976) >> uint(2)));
    uint _980 = uint(int(uint(int(_978)) >> uint(2)));
    int _982 = int(_978) & 3;
    float _984 = (*spvDescriptorSet0.vp_c9)._m0[int(_980)][_982];
    int _986 = int(_978) + 1;
    uint _988 = uint(int(uint(_986) >> uint(2)));
    int _990 = _986 & 3;
    float _992 = (*spvDescriptorSet0.vp_c9)._m0[int(_988)][_990];
    float _994 = as_type<float>(_345) * _968;
    float _996 = fma(_922, (*spvDescriptorSet0.vp_c9)._m0[115].x, _970);
    float _998 = -_740;
    float _1000 = _998 + 1.0;
    int _1002 = _964 ? 0 : 1;
    float _1004 = -_974;
    float _1006 = -_684;
    float _1008 = fma(_1004, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1006);
    bool _1010 = _710 != 3;
    float _1012 = trunc(_994);
    float _1014 = precise::max(_1012, 0.0);
    uint _1016 = uint(_1014);
    float _1018 = -_756;
    float _1020 = fma(_800, _1018, _972);
    float _1022 = fma(_830, _1000, _1008);
    int _1024 = ~_1002;
    int _1026 = _1024 + 1;
    int _1028 = _1026 + 1;
    float _1030 = fma(_325, (*spvDescriptorSet0.vp_c9)._m0[116].x, _996);
    int _1032 = abs(_934);
    bool _1034 = !_712;
    int _1036 = _1034 ? 0 : 1;
    out.m_64.x = _1020;
    out.m_64.y = _1022;
    int _1038 = _1028;
    int _1040 = as_type<int>(_1030);
    if (!_966)
    {
        int _1042 = ~_1002;
        int _1044 = _1042 + 1;
        _1038 = _1044;
    }
    int _1046 = _1038;
    int _1048 = abs(_770);
    int _1050 = ~_878;
    int _1052 = _1050 + 1;
    int _1054 = _1052 + 1;
    int _1056 = ~_305;
    int _1058 = _1056 + 1;
    int _1060 = int(_854) + int(_1016);
    int _1062 = _1054;
    if (_1010)
    {
        int _1064 = ~_878;
        int _1066 = _1064 + 1;
        _1062 = _1066;
    }
    int _1068 = _1062;
    int _1070 = _1058 * _1060;
    int _1072 = _1070 + _520;
    int _1074 = abs(_1036);
    float _1076 = float(_1032);
    float _1078 = float(_1046);
    int _1080 = ~_1048;
    int _1082 = _1080 + 1;
    int _1084 = _1082 + 1;
    int _1086 = abs(_1068);
    float _1088 = _1076 * _1078;
    bool _1090 = uint(_1072) >= uint(_305);
    int _1092 = _1084 * as_type<int>(_954);
    int _1094 = ~_1074;
    int _1096 = _1094 + 1;
    int _1098 = _1096 + 1;
    float _1100 = _694 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1102 = !_546;
    int _1104 = _1102 ? 0 : 1;
    int _1106 = _1098 * as_type<int>(_946);
    int _1108 = _1106 + _1092;
    int _1110 = ~_1086;
    int _1112 = _1110 + 1;
    int _1114 = _1112 + 1;
    float _1116 = _692 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1118 = abs(_1104);
    float _1120 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1122 = _1100 + _1120;
    bool _1124 = _710 != 3;
    int _1126 = _1114 * as_type<int>(_984);
    int _1128 = _1126 + _1108;
    bool _1130 = !_1090;
    int _1132 = _1130 ? 0 : (-1);
    float _1134 = in.m_66.x;
    float _1136 = in.m_66.y;
    float _1138 = in.m_66.z;
    bool _1140 = !_1124;
    int _1142 = _1140 ? 0 : (-1);
    float _1144 = _686 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1146 = ~_1060;
    int _1148 = _1146 + _1132;
    int _1150 = _1148 + 1;
    float _1152 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1154 = _1116 + _1152;
    int _1156 = abs(_1142);
    bool _1158 = !_904;
    int _1160 = _1158 ? 0 : 1;
    int _1162 = _305 * _1150;
    int _1164 = _1162 + _520;
    int _1166 = ~_1156;
    int _1168 = _1166 + 1;
    int _1170 = _1168 + 1;
    float _1172 = _1154 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1174 = float(_876);
    float _1176 = _1088 * (-2.0);
    int _1178 = abs(_1160);
    float _1180 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1182 = _1144 + _1180;
    int _1184 = ~_1118;
    int _1186 = _1184 + 1;
    int _1188 = _1186 + 1;
    int _1190 = _1170 * as_type<int>(_992);
    int _1192 = _1190 + _1128;
    bool _1194 = !_420;
    int _1196 = _1194 ? _1164 : (-1);
    float _1198 = fma(_1182, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1172);
    float _1200 = float(_1178);
    int _1202 = _1192 * _1188;
    float _1204 = fma(_806, _1176, _806);
    float _1206 = fma(_1122, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1198);
    float _1208 = fma(_1176, _1134, _1134);
    int _1210 = _1196 * _1118;
    int _1212 = _1210 + _1202;
    float _1214 = _1154 * _1154;
    bool _1216 = _1206 >= 0.0;
    float _1218 = _1200 * _1174;
    float _1220 = fma(_1182, _1182, _1214);
    float _1222 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1224 = fma(_1122, _1122, _1220);
    float _1226 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1228 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1230 = _364 + (-0.5);
    float _1232 = _1030 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1234 = _1226 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1236 = rsqrt(_1224);
    float _1238 = as_type<float>(_1128);
    float _1240 = _1138;
    if (_1216)
    {
        _1238 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1242 = _1238;
    float _1244 = _1222 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1246 = _1228 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1248 = float(_1212);
    if (_1216)
    {
        out.m_55.x = 0.0;
    }
    if (_1216)
    {
        float _1250 = _1242 * 5.0;
        _1040 = as_type<int>(_1250);
    }
    int _1252 = _1040;
    float _1254 = fma(_1230, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1208);
    bool _1256 = !_908;
    int _1258 = _1256 ? 0 : 1;
    out.m_68.x = _1234;
    out.m_68.y = _1244;
    out.m_68.z = _1246;
    out.m_68.w = _1232;
    float _1260 = fma(_1204, _748, _1254);
    int _1262 = abs(_1258);
    if (_1216)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4642 = as_type<float>(_1252);
        out.gl_Position.z = _4642;
    }
    float _1264 = _366 + (-0.5);
    float _1266 = _1154 * _1236;
    out.m_70.x = _1248;
    float _1268 = _1182 * _1236;
    if (_1216)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1270 = -_1266;
    float _1272 = fma(_1270, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1116);
    float _1274 = _1122 * _1236;
    float _1276 = -_1268;
    float _1278 = fma(_1276, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1144);
    float _1280 = _1218 * (-2.0);
    float _1282 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1284 = _1272 + _1282;
    float _1286 = -_1274;
    float _1288 = fma(_1286, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1100);
    float _1290 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1292 = _1278 + _1290;
    float _1294 = fma(_1280, _1136, _1136);
    float _1296 = _1284 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1298 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1300 = _1288 + _1298;
    float _1302 = float(_918);
    float _1304 = -_1266;
    float _1306 = fma(_1304, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1154);
    float _1308 = fma(_1292, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1296);
    float _1310 = float(_1262);
    float _1312 = fma(_832, _1280, _832);
    float _1314 = fma(_1264, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1294);
    float _1316 = fma(_1300, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1308);
    float _1318 = _1260 * 0.15915493667125701904296875;
    float _1320 = _1306 * _1306;
    float _1322 = _682 + _364;
    float _1324 = _1310 * _1302;
    bool _1326 = _1316 >= 0.0;
    float _1328 = -_1268;
    float _1330 = fma(_1328, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1182);
    float _1332 = fma(_1312, _748, _1314);
    float _1334 = in.m_72.x;
    float _1336 = in.m_72.y;
    float _1338 = fma(_1330, _1330, _1320);
    float _1340 = _1322 + (-1.0);
    float _1342 = _1324 * (-2.0);
    float _1344 = -_1274;
    float _1346 = fma(_1344, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1122);
    float _1348 = _682 + (-0.5);
    float _1350 = fma(_1340, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1352 = fma(_1342, _1138, _1138);
    float _1354 = _1332 * 0.15915493667125701904296875;
    float _1356 = fma(_1346, _1346, _1338);
    float _1358 = _1300;
    if (_1326)
    {
        _1240 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1360 = _1240;
    float _1362 = fma(_1348, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1352);
    float _1364 = _1318 * 6.283185482025146484375;
    float _1366 = sin(_1364);
    float _1368 = fma(_1350, _1342, _1350);
    int _1370 = as_type<int>(_1360);
    if (_1326)
    {
        out.m_55.x = 0.0;
    }
    if (_1326)
    {
        float _1372 = _1360 * 5.0;
        _1370 = as_type<int>(_1372);
    }
    int _1374 = _1370;
    float _1376 = fma(_1368, _748, _1362);
    float _1378 = _1318 * 6.283185482025146484375;
    float _1380 = cos(_1378);
    if (_1326)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4851 = as_type<float>(_1374);
        out.gl_Position.z = _4851;
    }
    float _1382 = _1376 * 0.15915493667125701904296875;
    float _1384 = _277 * _1336;
    float _1386 = _1354 * 6.283185482025146484375;
    float _1388 = sin(_1386);
    float _1390 = sqrt(_1356);
    float _1392 = _1354 * 6.283185482025146484375;
    float _1394 = cos(_1392);
    if (_1326)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1396 = _1382 * 6.283185482025146484375;
    float _1398 = cos(_1396);
    float _1400 = _1236 * _1390;
    float _1402 = _1384 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1404 = _275 * _1334;
    float _1406 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _179);
    float _1408 = _1366 * _1388;
    float _1410 = _1402 * _1400;
    float _1412 = _1404 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1414 = _1382 * 6.283185482025146484375;
    float _1416 = sin(_1414);
    float _1418 = _1380 * _1394;
    float _1420 = _1406 * _1410;
    float _1422 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _175);
    float _1424 = _1412 * _1400;
    float _1426 = _1366 * _1394;
    float _1428 = _1380 * _1388;
    float _1430 = _1380 * _1398;
    float _1432 = _1394 * _1398;
    float _1434 = _1366 * _1398;
    float _1436 = _1388 * _1398;
    float _1438 = _1422 * _1424;
    float _1440 = _1430 * _1420;
    float _1442 = _1400 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1444 = _1442 * 0.5;
    float _1446 = fma(_1416, _1418, _1408);
    float _1448 = -_1426;
    float _1450 = fma(_1416, _1428, _1448);
    float _1452 = -_1420;
    float _1454 = _1416 * _1452;
    float _1456 = -_1428;
    float _1458 = fma(_1416, _1426, _1456);
    float _1460 = fma(_1446, _1438, _1440);
    float _1462 = _1434 * _1420;
    float _1464 = fma(_1432, _1438, _1454);
    float _1466 = fma(_1450, _1444, _1460);
    float _1468 = fma(_1458, _1438, _1462);
    float _1470 = fma(_1416, _1408, _1418);
    float _1472 = fma(_1436, _1444, _1464);
    float _1474 = _1466 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1476 = _1466 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1478 = fma(_1470, _1444, _1468);
    float _1480 = _1466 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1482 = fma(_1472, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1474);
    float _1484 = fma(_1472, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1476);
    float _1486 = _1446 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1488 = fma(_1472, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1480);
    float _1490 = fma(_1478, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1482);
    float _1492 = fma(_1478, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1484);
    float _1494 = _1446 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1496 = fma(_1478, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1488);
    float _1498 = _1490 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1500 = _1492 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1502 = _1446 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1504 = _1496 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1506 = _1144 + _1498;
    float _1508 = _1100 + _1500;
    float _1510 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1486);
    float _1512 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1494);
    float _1514 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1516 = _1506 + _1514;
    float _1518 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1520 = _1508 + _1518;
    float _1522 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1502);
    float _1524 = _1430 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1526 = _1516 * _1516;
    float _1528 = _1520 * _1520;
    float _1530 = _1430 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1532 = _1430 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1534 = _1450 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1536 = _1526 + _1528;
    float _1538 = _1450 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1540 = _1116 + _1504;
    float _1542 = _1450 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1544 = sqrt(_1536);
    float _1546 = -_1416;
    float _1548 = fma(_1546, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1524);
    float _1550 = -_1416;
    float _1552 = fma(_1550, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1530);
    float _1554 = -_1416;
    float _1556 = fma(_1554, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1532);
    float _1558 = fma(_1458, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1510);
    float _1560 = fma(_1458, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1512);
    float _1562 = fma(_1436, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1534);
    float _1564 = fma(_1436, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1538);
    float _1566 = fma(_1458, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1522);
    float _1568 = fma(_1436, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1542);
    bool _1570 = _1544 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1572 = _1450;
    float _1574 = _1538;
    float _1576 = _1534;
    float _1578 = _1506;
    float _1580 = _1526;
    if (!_1570)
    {
        _1572 = _1506;
    }
    float _1582 = _1572;
    float _1584 = _1582;
    if (!_1570)
    {
        _1574 = _1528;
    }
    float _1586 = _1574;
    float _1588 = _1586;
    if (!_1570)
    {
        _1576 = _1508;
    }
    float _1590 = _1576;
    float _1592 = _1590;
    if (!_1570)
    {
        _1578 = _1540;
    }
    float _1594 = _1578;
    bool _1596 = !_1570;
    float _1598 = _1594;
    if (!_1596)
    {
        float _1600 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1602 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1604 = _1544 + _1602;
        float _1606 = rsqrt(_1536);
        float _1608 = _1604 * _1600;
        float _1610 = _1540 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1612 = _1608 * 0.15915493667125701904296875;
        float _1614 = _1612 * 6.283185482025146484375;
        float _1616 = sin(_1614);
        float _1618 = _1612 * 6.283185482025146484375;
        float _1620 = cos(_1618);
        float _1622 = fma(_1616, _1610, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1624 = _1606 * _1622;
        float _1626 = fma(_1516, _1624, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1628 = _1620 + (-1.0);
        float _1630 = fma(_1520, _1624, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1632 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1634 = _1626 + _1632;
        float _1636 = _1628 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1638 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1640 = _1630 + _1638;
        float _1642 = _1634 * _1634;
        float _1644 = fma(_1540, _1620, _1636);
        float _1646 = _1640 * _1640;
        _1598 = _1644;
        _1580 = _1642;
        _1588 = _1646;
        _1584 = _1626;
        _1592 = _1630;
    }
    float _1648 = _1598;
    float _1650 = _1580;
    float _1652 = _1588;
    float _1654 = _1584;
    float _1656 = _1592;
    float _1658 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1660 = _1648 + _1658;
    float _1662 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1548);
    float _1664 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1552);
    float _1666 = _179 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1668 = fma(_1660, _1660, _1650);
    float _1670 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1556);
    float _1672 = fma(_1470, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1568);
    float _1674 = _175 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1676 = _1668 + _1652;
    float _1678 = _1666 * _1662;
    float _1680 = _1666 * _1664;
    float _1682 = _1666 * _1670;
    float _1684 = fma(_1470, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1562);
    float _1686 = fma(_1470, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1564);
    float _1688 = sqrt(_1676);
    float _1690 = fma(_1674, _1558, _1678);
    float _1692 = fma(_1674, _1560, _1680);
    float _1694 = fma(_1674, _1566, _1682);
    float _1696 = _1684 + _1690;
    float _1698 = _1686 + _1692;
    float _1700 = _1672 + _1694;
    out.m_74.x = _1696;
    out.m_74.y = _1698;
    out.m_74.z = _1700;
    bool _1702 = _1688 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1704 = isnan(_1688);
    bool _1706 = _1702 || _1704;
    bool _1708 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1710 = _1706 || _1708;
    float _1712 = _1692;
    if (!_1710)
    {
        _1712 = 1.0;
    }
    float _1714 = _1712;
    bool _1716 = !_1710;
    float _1718 = _1714;
    if (!_1716)
    {
        bool _1720 = _1688 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1722 = isnan(_1688);
        bool _1724 = _1720 || _1722;
        bool _1726 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1728 = _1724 || _1726;
        if (!_1728)
        {
            float _1730 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1732 = _1688 + _1730;
            float _1734 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1736 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1734;
            float _1738 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1740 = _1738 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1742 = 1.0 / _1736;
            float _1744 = _1732 * _1742;
            float _1746 = fma(_1744, _1740, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1718 = _1746;
            _1748 = true;
        }
        else
        {
            bool _1750 = _1688 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1752 = isnan(_1688);
            bool _1754 = _1750 || _1752;
            bool _1756 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1758 = _1754 || _1756;
            if (!_1758)
            {
                float _1760 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1762 = _1688 + _1760;
                float _1764 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1766 = _1764 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1768 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1770 = _1768 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1772 = 1.0 / _1766;
                float _1774 = _1762 * _1772;
                float _1776 = fma(_1774, _1770, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1718 = _1776;
                _1748 = true;
            }
            else
            {
                _1718 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1748 = false;
    float _1778 = _1718;
    float _1780 = _1272 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1782 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1784 = _1654 + _1782;
    float _1786 = fma(_1278, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1780);
    float _1788 = _1272 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1790 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1792 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1794 = _1790 || _1792;
    bool _1796 = isnan(0.5);
    bool _1798 = _1794 || _1796;
    float _1800 = fma(_1288, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1786);
    bool _1802 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1804 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1806 = _1802 || _1804;
    bool _1808 = isnan(0.5);
    bool _1810 = _1806 || _1808;
    float _1812 = _1800 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1814 = fma(_1278, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1788);
    float _1816 = 1.0 / _1812;
    float _1818 = fma(_1288, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1814);
    float _1820 = _1818 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1822 = _1820 + _1812;
    float _1824 = fma(_1784, _1778, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1826 = _1784;
    if (_1810)
    {
        _1826 = 1.0;
    }
    float _1828 = _1826;
    float _1830 = _1822 * _1816;
    float _1832 = _1830 * 0.5;
    float _1834 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1836 = _1648 + _1834;
    float _1838 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1840 = fma(_1832, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1838);
    float _1842 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1844 = _1656 + _1842;
    float _1846 = fma(_1836, _1778, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1848 = -_1268;
    float _1850 = fma(_1848, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1824);
    float _1852 = fma(_1844, _1778, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1854 = 1.0 / _1840;
    float _1856 = -_1266;
    float _1858 = fma(_1856, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1846);
    float _1860 = -_1274;
    float _1862 = fma(_1860, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1852);
    float _1864 = _1858;
    float _1866 = _1850;
    float _1868 = _1862;
    float _1870 = _1846;
    float _1872 = _1828;
    if (!_1798)
    {
        float _1874 = _1284 * _1284;
        float _1876 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1878 = -_1100;
        float _1880 = _1878 + _1852;
        float _1882 = -_1144;
        float _1884 = _1882 + _1824;
        float _1886 = fma(_1292, _1292, _1874);
        float _1888 = fma(_1300, _1300, _1886);
        float _1890 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1892 = sqrt(_1888);
        float _1894 = 1.0 / _1400;
        float _1896 = _1890 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1898 = precise::min(_1892, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1900 = _1898 * _1876;
        float _1902 = _1900 * _1894;
        float _1904 = -_1116;
        float _1906 = _1904 + _1846;
        float _1908 = _1896 * _1902;
        float _1910 = _1880 * _1902;
        float _1912 = fma(_1906, _1908, _1272);
        float _1914 = fma(_1884, _1908, _1278);
        float _1916 = fma(_1896, _1910, _1288);
        _1864 = _1912;
        _1866 = _1914;
        _1868 = _1916;
    }
    float _1918 = _1864;
    float _1920 = _1866;
    float _1922 = _1868;
    if (_1810)
    {
        _1358 = 1.0;
    }
    float _1924 = _1358;
    float _1926 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1928 = _1854 * _1926;
    float _1930 = _1924;
    if (!_1810)
    {
        float _1932 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1934 = _1932 * 0.15915493667125701904296875;
        float _1936 = _1934 * 6.283185482025146484375;
        float _1938 = cos(_1936);
        float _1940 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1942 = _1940 * 0.15915493667125701904296875;
        float _1944 = _1934 * 6.283185482025146484375;
        float _1946 = sin(_1944);
        float _1948 = 1.0 / _1938;
        float _1950 = _1942 * 6.283185482025146484375;
        float _1952 = cos(_1950);
        float _1954 = _1946 * _1948;
        float _1956 = _1942 * 6.283185482025146484375;
        float _1958 = sin(_1956);
        float _1960 = _1952 * _1954;
        float _1962 = 1.0 / _1960;
        float _1964 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1966 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1964;
        float _1968 = 1.0 / _1966;
        float _1970 = _1958 * _1962;
        float _1972 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1974 = fma(_1928, _1970, _1972);
        float _1976 = _1974 * _1968;
        float _1978 = precise::clamp(_1976, 0.0, 1.0);
        _1870 = _1934;
        _1872 = _1978;
    }
    float _1980 = _1870;
    float _1982 = _1872;
    float _1984 = _1980;
    if (!_1810)
    {
        float _1986 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1988 = _1986 * 0.15915493667125701904296875;
        float _1990 = _1988 * 6.283185482025146484375;
        float _1992 = cos(_1990);
        float _1994 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1996 = _1994 * 0.15915493667125701904296875;
        float _1998 = _1988 * 6.283185482025146484375;
        float _2000 = sin(_1998);
        float _2002 = 1.0 / _1992;
        float _2004 = _1996 * 6.283185482025146484375;
        float _2006 = cos(_2004);
        float _2008 = _2000 * _2002;
        float _2010 = _1996 * 6.283185482025146484375;
        float _2012 = sin(_2010);
        float _2014 = _2006 * _2008;
        float _2016 = 1.0 / _2014;
        float _2018 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2020 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2018;
        float _2022 = 1.0 / _2020;
        float _2024 = _2012 * _2016;
        float _2026 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2028 = fma(_1928, _2024, _2026);
        float _2030 = _2028 * _2022;
        float _2032 = precise::clamp(_2030, 0.0, 1.0);
        float _2034 = -_2032;
        float _2036 = _2034 + 1.0;
        _1930 = _2036;
    }
    float _2038 = _1930;
    float _2040 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2042 = _1918 + _2040;
    float _2044 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2046 = _1920 + _2044;
    float _2048 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2050 = _1922 + _2048;
    float _2052 = _2042 * _2042;
    float _2054 = fma(_2046, _2046, _2052);
    float _2056 = fma(_2050, _2050, _2054);
    float _2058 = rsqrt(_2056);
    float _2060 = _2058 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2062 = _2046 * _2060;
    float _2064 = _2050 * _2060;
    float _2066 = _2062 * _2062;
    float _2068 = _2064 * _2064;
    float _2070 = _2066 + _2068;
    float _2072 = sqrt(_2070);
    bool _2074 = _2072 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2076 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2078 = _2072 + _2076;
    float _2080 = _2054;
    float _2082 = _2070;
    float _2084 = _2078;
    float _2086 = _2042;
    if (_2074)
    {
        float _2088 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2080 = _2088;
    }
    float _2090 = _2080;
    if (_2074)
    {
        float _2092 = rsqrt(_2070);
        _2082 = _2092;
    }
    float _2094 = _2082;
    float _2096 = _2090;
    float _2098 = _2094;
    if (_2074)
    {
        float _2100 = _2078 * _2090;
        _2084 = _2100;
    }
    float _2102 = _2084;
    if (_2074)
    {
        float _2104 = _2102 * 0.15915493667125701904296875;
        _1984 = _2104;
    }
    float _2106 = _1984;
    float _2108 = _2050;
    float _2110 = _2106;
    if (_2074)
    {
        float _2112 = _2106 * 6.283185482025146484375;
        float _2114 = sin(_2112);
        _2108 = _2114;
    }
    float _2116 = _2108;
    float _2118 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2120 = precise::max(0.0, _2118);
    float _2122 = _1688;
    if (_2074)
    {
        float _2124 = _2106 * 6.283185482025146484375;
        float _2126 = cos(_2124);
        _2122 = _2126;
    }
    float _2128 = _2122;
    float _2130 = -_2060;
    float _2132 = -_2120;
    float _2134 = fma(_2042, _2130, _2132);
    float _2136 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_2074)
    {
        float _2138 = _2134 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2086 = _2138;
    }
    float _2140 = _2086;
    float _2142 = _2140;
    if (!_2074)
    {
        _2110 = _2062;
    }
    float _2144 = _2110;
    float _2146 = fma(_1278, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2148 = sqrt(_2056);
    float _2150 = _2116;
    float _2152 = _2144;
    if (_2074)
    {
        float _2154 = fma(_2116, _2140, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2096 = _2154;
    }
    float _2156 = _2096;
    float _2158 = _2156;
    if (!_2074)
    {
        _2150 = _2064;
    }
    float _2160 = _2150;
    float _2162 = _2160;
    if (_2074)
    {
        float _2164 = _2128 + (-1.0);
        _2142 = _2164;
    }
    float _2166 = _2142;
    float _2168 = _2166;
    if (_2074)
    {
        float _2170 = _2094 * _2156;
        _2136 = _2170;
    }
    float _2172 = _2136;
    if (!_2074)
    {
        _2158 = _2134;
    }
    float _2174 = _2158;
    float _2176 = _2174;
    if (_2074)
    {
        float _2178 = _2166 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2168 = _2178;
    }
    float _2180 = _2168;
    float _2182 = _2180;
    if (_2074)
    {
        float _2184 = _2062 * _2172;
        _2152 = _2184;
    }
    float _2186 = _2152;
    if (!_2074)
    {
        _2098 = _2066;
    }
    float _2188 = _2098;
    float _2190 = _2188;
    if (_2074)
    {
        float _2192 = _2064 * _2172;
        _2162 = _2192;
    }
    float _2194 = _2162;
    if (_2074)
    {
        float _2196 = fma(_2134, _2128, _2180);
        _2176 = _2196;
    }
    float _2198 = _2176;
    if (_2074)
    {
        float _2200 = _2186 * _2186;
        _2190 = _2200;
    }
    float _2202 = _2190;
    float _2204 = _1918 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (!_2074)
    {
        _2182 = _2068;
    }
    float _2206 = _2182;
    float _2208 = _2206;
    if (_2074)
    {
        float _2210 = _2194 * _2194;
        _2208 = _2210;
    }
    float _2212 = _2208;
    float _2214 = fma(_2198, _2198, _2202);
    float _2216 = fma(_1920, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2204);
    float _2218 = floor(_2146);
    float _2220 = _2214 + _2212;
    float _2222 = fma(_1922, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2216);
    float _2224 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2226 = _2222 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2228 = rsqrt(_2220);
    float _2230 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2232 = fma(_2148, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2230);
    float _2234 = precise::clamp(_2232, 0.0, 1.0);
    float _2236 = _2226 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2238 = fma(_1288, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2240 = _1918 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2242 = -_2234;
    float _2244 = _2242 + 1.0;
    float _2246 = -_2236;
    float _2248 = fma(_2246, _2224, 1.0);
    float _2250 = _1918 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2252 = fma(_1920, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2240);
    float _2254 = _1918 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2256 = floor(_2238);
    float _2258 = fma(_1920, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2250);
    float _2260 = fma(_1922, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2252);
    float _2262 = fma(_1920, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2254);
    float _2264 = -_2218;
    float _2266 = _2146 + _2264;
    float _2268 = _2228 * _2186;
    float _2270 = _2228 * _2198;
    float _2272 = fma(_1922, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2258);
    float _2274 = abs(_2244);
    float _2276 = log2(_2274);
    float _2278 = _2268 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2280 = _2228 * _2194;
    float _2282 = _2272 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2284 = _2260 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2286 = -_2278;
    float _2288 = fma(_2270, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2286);
    float _2290 = _2282 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2292 = log2(_2248);
    float _2294 = -_2280;
    float _2296 = fma(_2294, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2288);
    float _2298 = fma(_1922, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2262);
    float _2300 = fma(_2284, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2290);
    float _2302 = _2282 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2304 = fma(_2296, -0.5, 0.5);
    float _2306 = _2298 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2308 = fma(_2226, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2300);
    float _2310 = _2276 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2312 = _2282 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2314 = sqrt(_2304);
    float _2316 = fma(_2306, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2308);
    float _2318 = fma(_2284, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2302);
    float _2320 = fma(_2284, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2312);
    float _2322 = fma(_2296, 0.5, 0.5);
    float _2324 = -_2256;
    float _2326 = _2238 + _2324;
    float _2328 = fma(_2226, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2318);
    float _2330 = fma(_2226, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2320);
    float _2332 = 1.0 / _2316;
    float _2334 = fma(_2322, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2336 = _2270 + 1.0;
    float _2338 = fma(_2306, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2330);
    float _2340 = fma(_2306, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2328);
    float _2342 = fma(_2322, _2334, -0.212114393711090087890625);
    float _2344 = _2292 * 0.693147182464599609375;
    float _2346 = exp2(_2310);
    float2 _6438 = float2(_2266, _2326);
    float _2348 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6438, float2(0.0), isnan(_6438)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6438, float2(0.0), isnan(_6438)), level(0.0)).x;
    float _2350 = fma(_2322, _2342, 1.570728778839111328125);
    float _2352 = _2314 * 0.636619746685028076171875;
    float _2354 = _2344 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2356 = -_2350;
    float _2358 = fma(_2352, _2356, 1.0);
    float _2360 = _2338 * _2332;
    float _2362 = _2340 * _2332;
    float _2364 = fma(_2360, 0.5, 0.5);
    float _2366 = fma(_2362, -0.5, 0.5);
    float _2368 = -_2270;
    float _2370 = fma(_2346, _2336, _2368);
    float3 _6481 = float3(_2364, _2366, _2354);
    float _2372 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6481, float3(0.0), isnan(_6481)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6481, float3(0.0), isnan(_6481)), level(0.0)).x;
    float _2374 = fma(_2370, 0.5, 0.5);
    float3 _6494 = float3(_2364, _2366, _2354);
    float4 _2377 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6494, float3(0.0), isnan(_6494)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6494, float3(0.0), isnan(_6494)), level(0.0)).xyzw;
    float _2379 = _2377.x;
    float _2381 = _2377.y;
    float _2383 = _2377.z;
    float _2385 = _2377.w;
    float2 _6510 = float2(_2358, _2374);
    float3 _2389 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6510, float2(0.0), isnan(_6510)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6510, float2(0.0), isnan(_6510)), level(0.0)).xyz;
    float _2391 = _2389.x;
    float _2393 = _2389.y;
    float _2395 = _2389.z;
    float _2397 = abs(_1928);
    float _2399 = log2(_2397);
    float _2401 = _2282 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2403 = _2276 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2405 = _2148 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2407 = isnan(_2148);
    bool _2409 = _2405 || _2407;
    bool _2411 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2413 = _2409 || _2411;
    float _2415 = fma(_2284, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2401);
    float _2417 = exp2(_2403);
    float _2419 = fma(_2226, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2415);
    float _2421 = in.m_76.x;
    float _2423 = _2338 + _2316;
    float _2425 = fma(_2306, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2419);
    float _2427 = _2399 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    bool _2429 = _1928 <= 8000.0;
    bool _2431 = isnan(_1928);
    bool _2433 = _2429 || _2431;
    bool _2435 = isnan(8000.0);
    bool _2437 = _2433 || _2435;
    float _2439 = float(_2437);
    float _2441 = _2316 * 0.5;
    float _2443 = _2425 + _2316;
    float _2445 = _2423 * 0.5;
    out.gl_Position.x = _2338;
    out.gl_Position.y = _2340;
    out.gl_Position.z = _2425;
    out.gl_Position.w = _2316;
    float _2447 = exp2(_2427);
    float _2449 = _2443 * 0.5;
    float _2451 = -_2417;
    float _2453 = _2451 + 1.0;
    float _2455 = _1982 * _2038;
    float _2457 = _2425;
    float _2459 = _2316;
    float _2461 = _2340;
    float _2463 = _2455;
    if (!_2413)
    {
        _2457 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2465 = _2457;
    float _2467 = fma(_2447, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2469 = precise::clamp(_2467, 0.0, 1.0);
    float _2471 = _2465;
    float _2473 = _2465;
    if (!_2413)
    {
        _2459 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2475 = _2459;
    float _2477 = fma(_2469, -2.0, 3.0);
    float _2479 = _2469 * _2469;
    float _2481 = _2479 * _2477;
    float _2483 = -_2481;
    float _2485 = _2483 + 1.0;
    float _2487 = fma(_2485, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2481);
    float _2489 = fma(_2340, -0.5, _2441);
    float _2491 = _2453 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2493 = _2475;
    float _2495 = _2475;
    if (!_2413)
    {
        _2461 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2497 = _2461;
    float _2499 = _2439 * _2487;
    out.m_78.x = _2445;
    out.m_78.y = _2489;
    out.m_78.z = _2449;
    out.m_78.w = _2316;
    float _2501 = _2499 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2503 = _2455 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2505 = _2497;
    float _2507 = _2497;
    if (!_2413)
    {
        _2463 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2509 = _2463;
    float _2511 = -_2348;
    float _2513 = _2511 + 1.0;
    float _2515 = _2513 * _2501;
    float _2517 = precise::clamp(_2515, 0.0, 1.0);
    float _2519 = -_2517;
    float _2521 = fma(_2519, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2523 = _2521 * _2421;
    float _2525 = _2491 * _2372;
    float _2527 = -_2491;
    float _2529 = _2527 + 1.0;
    float _2531 = _2523 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2533 = _2523;
    float _2535 = _2529;
    float _2537 = _2509;
    float _2539 = _2509;
    if (!_2413)
    {
        _2533 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2541 = _2533;
    float _2543 = _2385 * _2525;
    out.m_80.x = _2531;
    float _2545 = _2395 * _2525;
    float _2547 = fma(_2391, _2543, _2379);
    float _2549 = fma(_2393, _2543, _2381);
    float _2551 = _2385 * _2529;
    float _2553 = fma(_2385, _2545, _2383);
    float _2555 = _2541;
    float _2557 = _2541;
    if (!_2413)
    {
        _2535 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2559 = _2535;
    out.m_82.x = _2547;
    out.m_82.y = _2549;
    out.m_82.z = _2553;
    out.m_82.w = _2551;
    bool _2561 = !_2413;
    float _2563 = _2559;
    float _2565 = _2559;
    if (!_2561)
    {
        bool _2567 = _2148 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2569 = isnan(_2148);
        bool _2571 = _2567 || _2569;
        bool _2573 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2575 = _2571 || _2573;
        if (!_2575)
        {
            float _2577 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2579 = _2148 + _2577;
            float _2581 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2583 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2581;
            float _2585 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2587 = _2585 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2589 = 1.0 / _2583;
            float _2591 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2593 = _2591 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2595 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2597 = _2595 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2599 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2601 = _2599 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2603 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2605 = _2603 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2607 = _2579 * _2589;
            float _2609 = precise::clamp(_2607, 0.0, 1.0);
            float _2611 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2613 = _2611 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2615 = fma(_2609, _2587, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2617 = fma(_2609, _2613, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2619 = fma(_2609, _2593, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2621 = fma(_2609, _2597, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2623 = fma(_2609, _2601, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2625 = fma(_2609, _2605, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2565 = _2619;
            _2507 = _2623;
            _2557 = _2615;
            _2473 = _2621;
            _2495 = _2617;
            _2539 = _2625;
            _2627 = true;
        }
        else
        {
            bool _2629 = _2148 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2631 = isnan(_2148);
            bool _2633 = _2629 || _2631;
            bool _2635 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2637 = _2633 || _2635;
            if (!_2637)
            {
                _2555 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2639 = _2555;
            _2557 = _2639;
            if (!_2637)
            {
                _2563 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2641 = _2563;
            _2565 = _2641;
            if (!_2637)
            {
                _2493 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2643 = _2493;
            _2495 = _2643;
            if (!_2637)
            {
                _2471 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2645 = _2471;
            _2473 = _2645;
            if (!_2637)
            {
                _2505 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2647 = _2505;
            _2507 = _2647;
            if (!_2637)
            {
                _2537 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2649 = _2537;
            bool _2651 = !_2637;
            _2539 = _2649;
            if (!_2651)
            {
                bool _2653 = _2148 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2655 = isnan(_2148);
                bool _2657 = _2653 || _2655;
                bool _2659 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2661 = _2657 || _2659;
                if (!_2661)
                {
                    float _2663 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2665 = _2148 + _2663;
                    float _2667 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2669 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2667;
                    float _2671 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2673 = _2671 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2675 = 1.0 / _2669;
                    float _2677 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2679 = _2677 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2681 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2683 = _2681 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2685 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2687 = _2685 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2689 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2691 = _2689 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2693 = _2665 * _2675;
                    float _2695 = precise::clamp(_2693, 0.0, 1.0);
                    float _2697 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2699 = _2697 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2701 = fma(_2695, _2673, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2703 = fma(_2695, _2699, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2705 = fma(_2695, _2679, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2707 = fma(_2695, _2683, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2709 = fma(_2695, _2687, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2711 = fma(_2695, _2691, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2565 = _2705;
                    _2507 = _2709;
                    _2557 = _2701;
                    _2473 = _2707;
                    _2495 = _2703;
                    _2539 = _2711;
                    _2627 = true;
                }
                else
                {
                    _2565 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2507 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2557 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2473 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2495 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2539 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2627 = false;
    float _2713 = _2565;
    float _2715 = _2507;
    float _2717 = _2557;
    float _2719 = _2473;
    float _2721 = _2495;
    float _2723 = _2539;
    float _2725 = fma(_1698, -0.5, 0.5);
    float _2727 = precise::clamp(_2725, 0.0, 1.0);
    float _2729 = -_2713;
    float _2731 = _2729 + _2715;
    float _2733 = _2503 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2735 = -_2717;
    float _2737 = _2735 + _2719;
    out.m_84.x = 0.0;
    float _2739 = fma(_2727, _2731, _2713);
    float _2741 = fma(_2727, _2737, _2717);
    out.m_55.x = _2733;
    float _2743 = -_2721;
    float _2745 = _2743 + _2723;
    float _2747 = _2739 * 0.586610972881317138671875;
    bool _2749 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2751 = fma(_2727, _2745, _2721);
    float _2753 = fma(_2741, 0.298911988735198974609375, _2747);
    bool _2755 = _1982 > 0.0;
    bool _2757 = isnan(_1982);
    bool _2759 = _2755 || _2757;
    bool _2761 = isnan(0.0);
    bool _2763 = _2759 || _2761;
    float _2765 = fma(_2751, 0.114477999508380889892578125, _2753);
    bool _2767 = _2038 <= 0.0;
    bool _2769 = !_2763;
    bool _2771 = _2767 || _2769;
    float _2773 = -_2765;
    float _2775 = _2741 + _2773;
    float _2777 = -_2765;
    float _2779 = _2739 + _2777;
    float _2781 = -_2765;
    float _2783 = _2751 + _2781;
    float _2785 = fma(_2775, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2765);
    float _2787 = fma(_2779, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2765);
    float _2789 = fma(_2783, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2765);
    bool _2791 = !_2749;
    if (!_2791)
    {
        float _2793 = -_1918;
        float _2795 = _2793 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2797 = -_1920;
        float _2799 = _2797 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2801 = -_1922;
        float _2803 = _2801 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2805 = _2795 * _2795;
        float _2807 = fma(_2799, _2799, _2805);
        float _2809 = fma(_2803, _2803, _2807);
        float _2811 = sqrt(_2809);
        float _2813 = rsqrt(_2809);
        float _2815 = -_2811;
        float _2817 = _2815 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2819 = _2817 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2821 = precise::clamp(_2819, 0.0, 1.0);
        float _2823 = _2799 * _2813;
        float _2825 = _2795 * _2813;
        float _2827 = abs(_2821);
        float _2829 = log2(_2827);
        float _2831 = _2803 * _2813;
        float _2833 = _2823 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2835 = _1698 * _2825;
        float _2837 = -_2825;
        float _2839 = -_2833;
        float _2841 = fma(_2837, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2839);
        float _2843 = fma(_1696, _2823, _2835);
        float _2845 = -_2831;
        float _2847 = fma(_2845, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2841);
        float _2849 = fma(_1700, _2831, _2843);
        float _2851 = precise::clamp(_2849, 0.0, 1.0);
        float _2853 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2855 = _2847 + _2853;
        float _2857 = _2829 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2859 = _2855 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2861 = precise::clamp(_2859, 0.0, 1.0);
        float _2863 = exp2(_2857);
        float _2865 = _2863 * _2861;
        float _2867 = _2851 * _2865;
        float _2869 = _2867 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2871 = _2867 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2873 = _2867 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_84.x = _2869;
        out.m_84.y = _2871;
        out.m_84.z = _2873;
    }
    out.m_86.x = _2785;
    out.m_86.y = _2787;
    out.m_86.z = _2789;
    if (!_2771)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_55.x = 0.0;
    float _2875 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2875;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2627 = false;
    bool _1748 = false;
    bool _203 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _100 = in.m_48.w;
    float _102 = in.m_50.w;
    float _104 = trunc(_100);
    int _107 = int(_104);
    float _109 = -_102;
    float _111 = _109 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.y = _111;
    bool _115 = _107 >= 1;
    float _117 = 0.0;
    float _119 = _102;
    float _121 = _111;
    if (!_115)
    {
        _117 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _123 = _117;
    if (!_115)
    {
        out.m_55.x = 0.0;
    }
    int _125 = 0;
    if (!_115)
    {
        float _127 = _123 * 5.0;
        _125 = as_type<int>(_127);
    }
    int _129 = _125;
    int _131 = _129;
    if (!_115)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2943 = as_type<float>(_129);
        out.gl_Position.z = _2943;
    }
    if (!_115)
    {
        return out;
    }
    bool _133 = _102 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _135 = isnan(_102);
    bool _137 = _133 || _135;
    bool _139 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _141 = _137 || _139;
    float _143 = float(_107);
    bool _145 = _111 >= _143;
    bool _147 = !_141;
    bool _149 = _145 || _147;
    if (_149)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _151 = _119;
    if (_149)
    {
        out.m_55.x = 0.0;
    }
    if (_149)
    {
        float _153 = _151 * 5.0;
        _131 = as_type<int>(_153);
    }
    int _155 = _131;
    if (_149)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2998 = as_type<float>(_155);
        out.gl_Position.z = _2998;
    }
    if (_149)
    {
        return out;
    }
    float _157 = as_type<float>(int(gl_VertexIndex));
    float _159 = 1.0 / _143;
    bool _161 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _163 = _111 * _159;
    int _165 = as_type<int>(_157) & 1;
    bool _167 = _165 != 0;
    int _169 = as_type<int>(_157) & 2;
    bool _171 = _169 != 0;
    bool _173 = !_167;
    float _175 = _173 ? (-0.5) : 0.5;
    bool _177 = !_171;
    float _179 = _177 ? (-0.5) : 0.5;
    bool _181 = !_161;
    float _183 = _163;
    float _201;
    if (!_181)
    {
        float _185 = in.m_60.x;
        float _187 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _189 = _185 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _191 = fma(_189, (*spvDescriptorSet0.vp_c9)._m0[12].x, _111);
        float _193 = _191 * _187;
        float _195 = floor(_193);
        float _197 = -_195;
        float _199 = _193 + _197;
        _201 = _199;
        _203 = true;
    }
    else
    {
        _201 = _163;
    }
    _203 = false;
    float _205 = _201;
    float _207 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _209 = _205 + _207;
    bool _211 = _205 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _213 = isnan(_205);
    bool _215 = _211 || _213;
    bool _217 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _219 = _215 || _217;
    float _221 = float(_219);
    float _223 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _225 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _223;
    float _227 = -_221;
    float _229 = _227 + 1.0;
    bool _231 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _233 = 1.0 / _225;
    float _235 = _209 * _233;
    bool _237 = _205 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _239 = isnan(_205);
    bool _241 = _237 || _239;
    bool _243 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _245 = _241 || _243;
    float _247 = float(_245);
    float _249 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _251 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _249;
    float _253 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _255 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _253;
    float _257 = _247 * _229;
    float _259 = fma(_251, _235, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _261 = fma(_255, _235, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _263 = -_247;
    float _265 = _263 + 1.0;
    float _267 = _259 * _257;
    float _269 = _261 * _257;
    float _271 = fma(_265, (*spvDescriptorSet0.vp_c9)._m0[143].x, _267);
    float _273 = fma(_265, (*spvDescriptorSet0.vp_c9)._m0[143].y, _269);
    float _275 = fma(_221, (*spvDescriptorSet0.vp_c9)._m0[144].x, _271);
    float _277 = fma(_221, (*spvDescriptorSet0.vp_c9)._m0[144].y, _273);
    bool _279 = !_231;
    if (!_279)
    {
        float _281 = in.m_60.x;
        float _283 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _285 = _281 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _287 = fma(_285, (*spvDescriptorSet0.vp_c9)._m0[11].y, _111);
        float _289 = _287 * _283;
        float _291 = floor(_289);
        float _293 = -_291;
        float _295 = _289 + _293;
        _183 = _295;
    }
    float _297 = _183;
    float _299 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _301 = int(_299);
    float _303 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _305 = int(_303);
    float _307 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _309 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _311 = float(_301);
    float _313 = 1.0 / _311;
    bool _315 = _297 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _317 = isnan(_297);
    bool _319 = _315 || _317;
    bool _321 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _323 = _319 || _321;
    float _325 = float(_323);
    float _327 = float(uint(_305));
    int _329 = ~_305;
    int _331 = _329 + 1;
    int _333 = ~_305;
    int _335 = _333 + 1;
    float _337 = 1.0 / _327;
    float _339 = _313 * _111;
    float _341 = trunc(_339);
    int _343 = int(_341);
    int _345 = as_type<int>(_337) + (-2);
    float _347 = float(_305);
    float _349 = float(uint(_343));
    float _351 = as_type<float>(_345) * _349;
    float _353 = trunc(_351);
    float _355 = precise::max(_353, 0.0);
    uint _358 = uint(_355);
    int _360 = _331 * int(_358);
    int _362 = _360 + _343;
    float _364 = in.m_60.x;
    float _366 = in.m_60.y;
    float _368 = float(uint(_362));
    float _370 = as_type<float>(_345) * _368;
    float _372 = trunc(_370);
    float _374 = precise::max(_372, 0.0);
    uint _376 = uint(_374);
    int _378 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _380 = _378 != 0;
    bool _382 = !_380;
    float _384 = _382 ? 7.345489978790283203125 : 1.0;
    float _386 = _384 * _364;
    int _388 = int(_358) + int(_376);
    float _390 = float(_343);
    float _392 = floor(_386);
    int _394 = _335 * _388;
    int _396 = _394 + _343;
    bool _398 = _390 >= _347;
    bool _400 = isnan(_390);
    bool _402 = _398 || _400;
    bool _404 = isnan(_347);
    bool _406 = _402 || _404;
    float _408 = float(_406);
    bool _410 = uint(_396) >= uint(_305);
    float _412 = trunc(_408);
    int _414 = int(_412);
    bool _416 = !_410;
    int _418 = _416 ? 0 : (-1);
    bool _420 = _305 == 0;
    int _422 = ~_388;
    int _424 = _422 + _418;
    int _426 = _424 + 1;
    float _428 = -_392;
    float _430 = _386 + _428;
    int _432 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _434 = _432 != 0;
    int _436 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _438 = _436 != 0;
    int _440 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _442 = _440 != 0;
    int _444 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _446 = _444 != 0;
    int _448 = _305 * _426;
    int _450 = _448 + _343;
    float _452 = _430 * _347;
    int _454 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _456 = _454 != 0;
    int _458 = ~_414;
    int _460 = _458 + 1;
    int _462 = _460 + 1;
    bool _464 = !_420;
    int _466 = _464 ? _450 : (-1);
    float _468 = trunc(_452);
    int _470 = int(_468);
    int _472 = _466 * _462;
    float _474 = _347 * _111;
    int _476 = _305 + (-1);
    bool _478 = !_446;
    int _480 = _478 ? 0 : 1;
    float _482 = _474 * _159;
    bool _484 = !_438;
    int _486 = _484 ? 0 : 1;
    int _488 = _414 * _476;
    int _490 = _488 + _472;
    bool _492 = !_434;
    int _494 = _492 ? 0 : 1;
    int _496 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _498 = _496 != 0;
    float _500 = trunc(_482);
    int _502 = int(_500);
    int _504 = abs(_486);
    bool _506 = !_442;
    int _508 = _506 ? 0 : 1;
    int _510 = abs(_480);
    int _512 = abs(_494);
    bool _514 = !_498;
    int _516 = _514 ? 0 : 1;
    int _518 = _470 * _510;
    int _520 = _518 + _343;
    int _522 = abs(_508);
    int _524 = _490 * _504;
    int _526 = abs(_516);
    int _528 = _502 * _512;
    int _530 = _528 + _524;
    int _532 = ~_305;
    int _534 = _532 + 1;
    int _536 = _520 * _522;
    int _538 = _536 + _530;
    int _540 = ~_305;
    int _542 = _540 + 1;
    int _544 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _546 = _544 != 0;
    int _548 = _470 * _526;
    int _550 = _548 + _538;
    int _552 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _554 = _552 != 0;
    float _556 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _558 = log2(_556);
    bool _560 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _562 = isnan(1.0);
    bool _564 = _560 || _562;
    bool _566 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _568 = _564 || _566;
    float _570 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _572 = 1.0 + _570;
    float _574 = float(uint(_550));
    bool _576 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _578 = isnan(0.0);
    bool _580 = _576 || _578;
    bool _582 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _584 = _580 || _582;
    float _586 = as_type<float>(_345) * _574;
    float _588 = 1.0 / _572;
    float _590 = _558 * _111;
    float _592 = trunc(_586);
    float _594 = precise::max(_592, 0.0);
    uint _596 = uint(_594);
    int _598 = _542 * int(_596);
    int _600 = _598 + _550;
    float _602 = float(uint(_600));
    float _604 = as_type<float>(_345) * _602;
    float _606 = in.m_48.x;
    float _608 = in.m_48.y;
    float _610 = in.m_48.z;
    float _612 = trunc(_604);
    float _614 = precise::max(_612, 0.0);
    uint _616 = uint(_614);
    int _618 = int(_596) + int(_616);
    float _620 = _364 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _622 = _608 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _624 = _534 * _618;
    int _626 = _624 + _550;
    float _628 = _608 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _630 = -_307;
    float _632 = fma(_620, 2.0, _630);
    float _634 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _636 = uint(_626) >= uint(_305);
    float _638 = _366 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _640 = fma(_606, (*spvDescriptorSet0.vp_c10)._m0[4].x, _622);
    float _642 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _644 = !_636;
    int _646 = _644 ? 0 : (-1);
    float _648 = fma(_638, -2.0, _309);
    float _650 = fma(_606, (*spvDescriptorSet0.vp_c10)._m0[6].x, _628);
    int _652 = ~_618;
    int _654 = _652 + _646;
    int _656 = _654 + 1;
    float _658 = _608 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _660 = exp2(_590);
    float _662 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _664 = fma(_606, (*spvDescriptorSet0.vp_c10)._m0[5].x, _658);
    int _666 = _305 * _656;
    int _668 = _666 + _550;
    float _670 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _672 = _634 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _674 = _642 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _676 = _670 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _678 = !_420;
    int _680 = _678 ? _668 : (-1);
    float _682 = in.m_60.z;
    float _684 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[76].y, _648);
    float _686 = fma(_610, (*spvDescriptorSet0.vp_c10)._m0[4].z, _640);
    int _688 = _680 & 3;
    bool _690 = _688 != 0;
    out.m_62.x = _672;
    out.m_62.y = _674;
    out.m_62.z = _676;
    out.m_62.w = _662;
    float _692 = fma(_610, (*spvDescriptorSet0.vp_c10)._m0[5].z, _664);
    float _694 = fma(_610, (*spvDescriptorSet0.vp_c10)._m0[6].z, _650);
    float _696 = -_660;
    float _698 = _696 + 1.0;
    float _700 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _702 = _364 * 2.0;
    int _704 = _690 ? 0 : 1;
    float _706 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _708 = _706 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _710 = _680 & 3;
    bool _712 = _710 != 0;
    float _714 = fma(_364, (*spvDescriptorSet0.vp_c9)._m0[78].z, _700);
    float _716 = _584 ? _698 : 0.0;
    float _718 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _720 = floor(_702);
    float _722 = _366 * 2.0;
    bool _724 = uint(_710) > 1u;
    float _726 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[78].w, _718);
    float _728 = -_111;
    float _730 = fma(_728, (*spvDescriptorSet0.vp_c9)._m0[76].x, _632);
    float _732 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[77].z, _714);
    int _734 = ~_704;
    int _736 = _734 + 1;
    int _738 = _736 + 1;
    float _740 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[77].w, _726);
    float _742 = floor(_722);
    int _744 = _738;
    if (_568)
    {
        float _746 = _716 * _588;
        _121 = _746;
    }
    float _748 = _121;
    bool _750 = _364 > 0.5;
    float _752 = _366 + _682;
    float _754 = -_732;
    float _756 = _754 + 1.0;
    float _758 = -_175;
    int _760 = _750 ? as_type<int>(_758) : as_type<int>(_175);
    bool _762 = _366 > 0.5;
    float _764 = 1.0 / _708;
    if (!_724)
    {
        int _766 = ~_704;
        int _768 = _766 + 1;
        _744 = _768;
    }
    int _770 = _744;
    float _772 = _366 + _364;
    bool _774 = _720 >= 0.0;
    bool _776 = isnan(_720);
    bool _778 = _774 || _776;
    bool _780 = isnan(0.0);
    bool _782 = _778 || _780;
    float _784 = -_179;
    int _786 = _762 ? as_type<int>(_784) : as_type<int>(_179);
    float _788 = _772 + (-1.0);
    bool _790 = _720 > 0.0;
    int _792 = _782 ? 0 : 1;
    float _794 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _796 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _794;
    bool _798 = !_456;
    float _800 = _798 ? _175 : as_type<float>(_760);
    float _802 = _752 + (-1.0);
    bool _804 = _742 > 0.0;
    float _806 = fma(_788, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _808 = _742 >= 0.0;
    bool _810 = isnan(_742);
    bool _812 = _808 || _810;
    bool _814 = isnan(0.0);
    bool _816 = _812 || _814;
    float _818 = _796 * _764;
    float _820 = float(uint(_520));
    float _822 = _682 * 2.0;
    float _824 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _826 = _297 + _824;
    bool _828 = !_554;
    float _830 = _828 ? _179 : as_type<float>(_786);
    float _832 = fma(_802, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _834 = as_type<float>(_345) * _820;
    int _836 = _680 >> 31;
    float _838 = floor(_822);
    bool _840 = uint(_710) >= 2u;
    float _842 = _800 + 0.5;
    int _844 = _836 & 3;
    int _846 = _816 ? 0 : 1;
    int _848 = _680 + _844;
    float _850 = trunc(_834);
    float _852 = precise::max(_850, 0.0);
    uint _854 = uint(_852);
    int _856 = ~_792;
    int _858 = _856 + 1;
    int _860 = _858 + 1;
    float _862 = fma(_818, _826, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    int _864 = _848 >> 2;
    float _866 = -_325;
    float _868 = _866 + 1.0;
    int _870 = _860;
    if (!_790)
    {
        int _872 = ~_792;
        int _874 = _872 + 1;
        _870 = _874;
    }
    int _876 = _870;
    int _878 = _840 ? 0 : 1;
    bool _880 = _297 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _882 = isnan(_297);
    bool _884 = _880 || _882;
    bool _886 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _888 = _884 || _886;
    float _890 = float(_888);
    int _892 = ~_846;
    int _894 = _892 + 1;
    int _896 = _894 + 1;
    int _898 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _900 = _898 != 0;
    int _902 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _904 = _902 != 0;
    int _906 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _908 = _906 != 0;
    float _910 = _890 * _868;
    int _912 = _896;
    if (!_804)
    {
        int _914 = ~_846;
        int _916 = _914 + 1;
        _912 = _916;
    }
    int _918 = _912;
    float _920 = -_890;
    float _922 = _920 + 1.0;
    int _924 = ~_305;
    int _926 = _924 + 1;
    int _928 = _864 << 4;
    int _930 = _928 + 368;
    bool _932 = !_900;
    int _934 = _932 ? 0 : 1;
    int _936 = _926 * int(_854);
    int _938 = _936 + _520;
    uint _940 = uint(int(uint(_930) >> uint(2)));
    uint _942 = uint(int(uint(int(_940)) >> uint(2)));
    int _944 = int(_940) & 3;
    float _946 = (*spvDescriptorSet0.vp_c9)._m0[int(_942)][_944];
    int _948 = int(_940) + 1;
    uint _950 = uint(int(uint(_948) >> uint(2)));
    int _952 = _948 & 3;
    float _954 = (*spvDescriptorSet0.vp_c9)._m0[int(_950)][_952];
    bool _956 = _838 >= 0.0;
    bool _958 = isnan(_838);
    bool _960 = _956 || _958;
    bool _962 = isnan(0.0);
    bool _964 = _960 || _962;
    bool _966 = _838 > 0.0;
    float _968 = float(uint(_938));
    float _970 = _862 * _910;
    float _972 = fma(_842, (*spvDescriptorSet0.vp_c9)._m0[80].x, _730);
    float _974 = _830 + (-0.5);
    int _976 = _930 + 8;
    uint _978 = uint(int(uint(_976) >> uint(2)));
    uint _980 = uint(int(uint(int(_978)) >> uint(2)));
    int _982 = int(_978) & 3;
    float _984 = (*spvDescriptorSet0.vp_c9)._m0[int(_980)][_982];
    int _986 = int(_978) + 1;
    uint _988 = uint(int(uint(_986) >> uint(2)));
    int _990 = _986 & 3;
    float _992 = (*spvDescriptorSet0.vp_c9)._m0[int(_988)][_990];
    float _994 = as_type<float>(_345) * _968;
    float _996 = fma(_922, (*spvDescriptorSet0.vp_c9)._m0[115].x, _970);
    float _998 = -_740;
    float _1000 = _998 + 1.0;
    int _1002 = _964 ? 0 : 1;
    float _1004 = -_974;
    float _1006 = -_684;
    float _1008 = fma(_1004, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1006);
    bool _1010 = _710 != 3;
    float _1012 = trunc(_994);
    float _1014 = precise::max(_1012, 0.0);
    uint _1016 = uint(_1014);
    float _1018 = -_756;
    float _1020 = fma(_800, _1018, _972);
    float _1022 = fma(_830, _1000, _1008);
    int _1024 = ~_1002;
    int _1026 = _1024 + 1;
    int _1028 = _1026 + 1;
    float _1030 = fma(_325, (*spvDescriptorSet0.vp_c9)._m0[116].x, _996);
    int _1032 = abs(_934);
    bool _1034 = !_712;
    int _1036 = _1034 ? 0 : 1;
    out.m_64.x = _1020;
    out.m_64.y = _1022;
    int _1038 = _1028;
    int _1040 = as_type<int>(_1030);
    if (!_966)
    {
        int _1042 = ~_1002;
        int _1044 = _1042 + 1;
        _1038 = _1044;
    }
    int _1046 = _1038;
    int _1048 = abs(_770);
    int _1050 = ~_878;
    int _1052 = _1050 + 1;
    int _1054 = _1052 + 1;
    int _1056 = ~_305;
    int _1058 = _1056 + 1;
    int _1060 = int(_854) + int(_1016);
    int _1062 = _1054;
    if (_1010)
    {
        int _1064 = ~_878;
        int _1066 = _1064 + 1;
        _1062 = _1066;
    }
    int _1068 = _1062;
    int _1070 = _1058 * _1060;
    int _1072 = _1070 + _520;
    int _1074 = abs(_1036);
    float _1076 = float(_1032);
    float _1078 = float(_1046);
    int _1080 = ~_1048;
    int _1082 = _1080 + 1;
    int _1084 = _1082 + 1;
    int _1086 = abs(_1068);
    float _1088 = _1076 * _1078;
    bool _1090 = uint(_1072) >= uint(_305);
    int _1092 = _1084 * as_type<int>(_954);
    int _1094 = ~_1074;
    int _1096 = _1094 + 1;
    int _1098 = _1096 + 1;
    float _1100 = _694 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1102 = !_546;
    int _1104 = _1102 ? 0 : 1;
    int _1106 = _1098 * as_type<int>(_946);
    int _1108 = _1106 + _1092;
    int _1110 = ~_1086;
    int _1112 = _1110 + 1;
    int _1114 = _1112 + 1;
    float _1116 = _692 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1118 = abs(_1104);
    float _1120 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1122 = _1100 + _1120;
    bool _1124 = _710 != 3;
    int _1126 = _1114 * as_type<int>(_984);
    int _1128 = _1126 + _1108;
    bool _1130 = !_1090;
    int _1132 = _1130 ? 0 : (-1);
    float _1134 = in.m_66.x;
    float _1136 = in.m_66.y;
    float _1138 = in.m_66.z;
    bool _1140 = !_1124;
    int _1142 = _1140 ? 0 : (-1);
    float _1144 = _686 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1146 = ~_1060;
    int _1148 = _1146 + _1132;
    int _1150 = _1148 + 1;
    float _1152 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1154 = _1116 + _1152;
    int _1156 = abs(_1142);
    bool _1158 = !_904;
    int _1160 = _1158 ? 0 : 1;
    int _1162 = _305 * _1150;
    int _1164 = _1162 + _520;
    int _1166 = ~_1156;
    int _1168 = _1166 + 1;
    int _1170 = _1168 + 1;
    float _1172 = _1154 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1174 = float(_876);
    float _1176 = _1088 * (-2.0);
    int _1178 = abs(_1160);
    float _1180 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1182 = _1144 + _1180;
    int _1184 = ~_1118;
    int _1186 = _1184 + 1;
    int _1188 = _1186 + 1;
    int _1190 = _1170 * as_type<int>(_992);
    int _1192 = _1190 + _1128;
    bool _1194 = !_420;
    int _1196 = _1194 ? _1164 : (-1);
    float _1198 = fma(_1182, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1172);
    float _1200 = float(_1178);
    int _1202 = _1192 * _1188;
    float _1204 = fma(_806, _1176, _806);
    float _1206 = fma(_1122, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1198);
    float _1208 = fma(_1176, _1134, _1134);
    int _1210 = _1196 * _1118;
    int _1212 = _1210 + _1202;
    float _1214 = _1154 * _1154;
    bool _1216 = _1206 >= 0.0;
    float _1218 = _1200 * _1174;
    float _1220 = fma(_1182, _1182, _1214);
    float _1222 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1224 = fma(_1122, _1122, _1220);
    float _1226 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1228 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1230 = _364 + (-0.5);
    float _1232 = _1030 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1234 = _1226 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1236 = rsqrt(_1224);
    float _1238 = as_type<float>(_1128);
    float _1240 = _1138;
    if (_1216)
    {
        _1238 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1242 = _1238;
    float _1244 = _1222 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1246 = _1228 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1248 = float(_1212);
    if (_1216)
    {
        out.m_55.x = 0.0;
    }
    if (_1216)
    {
        float _1250 = _1242 * 5.0;
        _1040 = as_type<int>(_1250);
    }
    int _1252 = _1040;
    float _1254 = fma(_1230, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1208);
    bool _1256 = !_908;
    int _1258 = _1256 ? 0 : 1;
    out.m_68.x = _1234;
    out.m_68.y = _1244;
    out.m_68.z = _1246;
    out.m_68.w = _1232;
    float _1260 = fma(_1204, _748, _1254);
    int _1262 = abs(_1258);
    if (_1216)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4642 = as_type<float>(_1252);
        out.gl_Position.z = _4642;
    }
    float _1264 = _366 + (-0.5);
    float _1266 = _1154 * _1236;
    out.m_70.x = _1248;
    float _1268 = _1182 * _1236;
    if (_1216)
    {
        return out;
    }
    float _1270 = -_1266;
    float _1272 = fma(_1270, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1116);
    float _1274 = _1122 * _1236;
    float _1276 = -_1268;
    float _1278 = fma(_1276, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1144);
    float _1280 = _1218 * (-2.0);
    float _1282 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1284 = _1272 + _1282;
    float _1286 = -_1274;
    float _1288 = fma(_1286, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1100);
    float _1290 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1292 = _1278 + _1290;
    float _1294 = fma(_1280, _1136, _1136);
    float _1296 = _1284 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1298 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1300 = _1288 + _1298;
    float _1302 = float(_918);
    float _1304 = -_1266;
    float _1306 = fma(_1304, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1154);
    float _1308 = fma(_1292, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1296);
    float _1310 = float(_1262);
    float _1312 = fma(_832, _1280, _832);
    float _1314 = fma(_1264, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1294);
    float _1316 = fma(_1300, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1308);
    float _1318 = _1260 * 0.15915493667125701904296875;
    float _1320 = _1306 * _1306;
    float _1322 = _682 + _364;
    float _1324 = _1310 * _1302;
    bool _1326 = _1316 >= 0.0;
    float _1328 = -_1268;
    float _1330 = fma(_1328, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1182);
    float _1332 = fma(_1312, _748, _1314);
    float _1334 = in.m_72.x;
    float _1336 = in.m_72.y;
    float _1338 = fma(_1330, _1330, _1320);
    float _1340 = _1322 + (-1.0);
    float _1342 = _1324 * (-2.0);
    float _1344 = -_1274;
    float _1346 = fma(_1344, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1122);
    float _1348 = _682 + (-0.5);
    float _1350 = fma(_1340, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1352 = fma(_1342, _1138, _1138);
    float _1354 = _1332 * 0.15915493667125701904296875;
    float _1356 = fma(_1346, _1346, _1338);
    float _1358 = _1300;
    if (_1326)
    {
        _1240 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1360 = _1240;
    float _1362 = fma(_1348, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1352);
    float _1364 = _1318 * 6.283185482025146484375;
    float _1366 = sin(_1364);
    float _1368 = fma(_1350, _1342, _1350);
    int _1370 = as_type<int>(_1360);
    if (_1326)
    {
        out.m_55.x = 0.0;
    }
    if (_1326)
    {
        float _1372 = _1360 * 5.0;
        _1370 = as_type<int>(_1372);
    }
    int _1374 = _1370;
    float _1376 = fma(_1368, _748, _1362);
    float _1378 = _1318 * 6.283185482025146484375;
    float _1380 = cos(_1378);
    if (_1326)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4851 = as_type<float>(_1374);
        out.gl_Position.z = _4851;
    }
    float _1382 = _1376 * 0.15915493667125701904296875;
    float _1384 = _277 * _1336;
    float _1386 = _1354 * 6.283185482025146484375;
    float _1388 = sin(_1386);
    float _1390 = sqrt(_1356);
    float _1392 = _1354 * 6.283185482025146484375;
    float _1394 = cos(_1392);
    if (_1326)
    {
        return out;
    }
    float _1396 = _1382 * 6.283185482025146484375;
    float _1398 = cos(_1396);
    float _1400 = _1236 * _1390;
    float _1402 = _1384 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1404 = _275 * _1334;
    float _1406 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _179);
    float _1408 = _1366 * _1388;
    float _1410 = _1402 * _1400;
    float _1412 = _1404 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1414 = _1382 * 6.283185482025146484375;
    float _1416 = sin(_1414);
    float _1418 = _1380 * _1394;
    float _1420 = _1406 * _1410;
    float _1422 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _175);
    float _1424 = _1412 * _1400;
    float _1426 = _1366 * _1394;
    float _1428 = _1380 * _1388;
    float _1430 = _1380 * _1398;
    float _1432 = _1394 * _1398;
    float _1434 = _1366 * _1398;
    float _1436 = _1388 * _1398;
    float _1438 = _1422 * _1424;
    float _1440 = _1430 * _1420;
    float _1442 = _1400 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1444 = _1442 * 0.5;
    float _1446 = fma(_1416, _1418, _1408);
    float _1448 = -_1426;
    float _1450 = fma(_1416, _1428, _1448);
    float _1452 = -_1420;
    float _1454 = _1416 * _1452;
    float _1456 = -_1428;
    float _1458 = fma(_1416, _1426, _1456);
    float _1460 = fma(_1446, _1438, _1440);
    float _1462 = _1434 * _1420;
    float _1464 = fma(_1432, _1438, _1454);
    float _1466 = fma(_1450, _1444, _1460);
    float _1468 = fma(_1458, _1438, _1462);
    float _1470 = fma(_1416, _1408, _1418);
    float _1472 = fma(_1436, _1444, _1464);
    float _1474 = _1466 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1476 = _1466 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1478 = fma(_1470, _1444, _1468);
    float _1480 = _1466 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1482 = fma(_1472, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1474);
    float _1484 = fma(_1472, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1476);
    float _1486 = _1446 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1488 = fma(_1472, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1480);
    float _1490 = fma(_1478, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1482);
    float _1492 = fma(_1478, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1484);
    float _1494 = _1446 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1496 = fma(_1478, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1488);
    float _1498 = _1490 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1500 = _1492 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1502 = _1446 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1504 = _1496 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1506 = _1144 + _1498;
    float _1508 = _1100 + _1500;
    float _1510 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1486);
    float _1512 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1494);
    float _1514 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1516 = _1506 + _1514;
    float _1518 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1520 = _1508 + _1518;
    float _1522 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1502);
    float _1524 = _1430 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1526 = _1516 * _1516;
    float _1528 = _1520 * _1520;
    float _1530 = _1430 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1532 = _1430 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1534 = _1450 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1536 = _1526 + _1528;
    float _1538 = _1450 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1540 = _1116 + _1504;
    float _1542 = _1450 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1544 = sqrt(_1536);
    float _1546 = -_1416;
    float _1548 = fma(_1546, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1524);
    float _1550 = -_1416;
    float _1552 = fma(_1550, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1530);
    float _1554 = -_1416;
    float _1556 = fma(_1554, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1532);
    float _1558 = fma(_1458, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1510);
    float _1560 = fma(_1458, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1512);
    float _1562 = fma(_1436, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1534);
    float _1564 = fma(_1436, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1538);
    float _1566 = fma(_1458, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1522);
    float _1568 = fma(_1436, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1542);
    bool _1570 = _1544 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1572 = _1450;
    float _1574 = _1538;
    float _1576 = _1534;
    float _1578 = _1506;
    float _1580 = _1526;
    if (!_1570)
    {
        _1572 = _1506;
    }
    float _1582 = _1572;
    float _1584 = _1582;
    if (!_1570)
    {
        _1574 = _1528;
    }
    float _1586 = _1574;
    float _1588 = _1586;
    if (!_1570)
    {
        _1576 = _1508;
    }
    float _1590 = _1576;
    float _1592 = _1590;
    if (!_1570)
    {
        _1578 = _1540;
    }
    float _1594 = _1578;
    bool _1596 = !_1570;
    float _1598 = _1594;
    if (!_1596)
    {
        float _1600 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1602 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1604 = _1544 + _1602;
        float _1606 = rsqrt(_1536);
        float _1608 = _1604 * _1600;
        float _1610 = _1540 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1612 = _1608 * 0.15915493667125701904296875;
        float _1614 = _1612 * 6.283185482025146484375;
        float _1616 = sin(_1614);
        float _1618 = _1612 * 6.283185482025146484375;
        float _1620 = cos(_1618);
        float _1622 = fma(_1616, _1610, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1624 = _1606 * _1622;
        float _1626 = fma(_1516, _1624, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1628 = _1620 + (-1.0);
        float _1630 = fma(_1520, _1624, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1632 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1634 = _1626 + _1632;
        float _1636 = _1628 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1638 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1640 = _1630 + _1638;
        float _1642 = _1634 * _1634;
        float _1644 = fma(_1540, _1620, _1636);
        float _1646 = _1640 * _1640;
        _1598 = _1644;
        _1580 = _1642;
        _1588 = _1646;
        _1584 = _1626;
        _1592 = _1630;
    }
    float _1648 = _1598;
    float _1650 = _1580;
    float _1652 = _1588;
    float _1654 = _1584;
    float _1656 = _1592;
    float _1658 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1660 = _1648 + _1658;
    float _1662 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1548);
    float _1664 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1552);
    float _1666 = _179 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1668 = fma(_1660, _1660, _1650);
    float _1670 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1556);
    float _1672 = fma(_1470, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1568);
    float _1674 = _175 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1676 = _1668 + _1652;
    float _1678 = _1666 * _1662;
    float _1680 = _1666 * _1664;
    float _1682 = _1666 * _1670;
    float _1684 = fma(_1470, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1562);
    float _1686 = fma(_1470, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1564);
    float _1688 = sqrt(_1676);
    float _1690 = fma(_1674, _1558, _1678);
    float _1692 = fma(_1674, _1560, _1680);
    float _1694 = fma(_1674, _1566, _1682);
    float _1696 = _1684 + _1690;
    float _1698 = _1686 + _1692;
    float _1700 = _1672 + _1694;
    out.m_74.x = _1696;
    out.m_74.y = _1698;
    out.m_74.z = _1700;
    bool _1702 = _1688 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1704 = isnan(_1688);
    bool _1706 = _1702 || _1704;
    bool _1708 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1710 = _1706 || _1708;
    float _1712 = _1692;
    if (!_1710)
    {
        _1712 = 1.0;
    }
    float _1714 = _1712;
    bool _1716 = !_1710;
    float _1718 = _1714;
    if (!_1716)
    {
        bool _1720 = _1688 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1722 = isnan(_1688);
        bool _1724 = _1720 || _1722;
        bool _1726 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1728 = _1724 || _1726;
        if (!_1728)
        {
            float _1730 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1732 = _1688 + _1730;
            float _1734 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1736 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1734;
            float _1738 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1740 = _1738 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1742 = 1.0 / _1736;
            float _1744 = _1732 * _1742;
            float _1746 = fma(_1744, _1740, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1718 = _1746;
            _1748 = true;
        }
        else
        {
            bool _1750 = _1688 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1752 = isnan(_1688);
            bool _1754 = _1750 || _1752;
            bool _1756 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1758 = _1754 || _1756;
            if (!_1758)
            {
                float _1760 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1762 = _1688 + _1760;
                float _1764 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1766 = _1764 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1768 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1770 = _1768 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1772 = 1.0 / _1766;
                float _1774 = _1762 * _1772;
                float _1776 = fma(_1774, _1770, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1718 = _1776;
                _1748 = true;
            }
            else
            {
                _1718 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1748 = false;
    float _1778 = _1718;
    float _1780 = _1272 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1782 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1784 = _1654 + _1782;
    float _1786 = fma(_1278, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1780);
    float _1788 = _1272 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1790 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1792 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1794 = _1790 || _1792;
    bool _1796 = isnan(0.5);
    bool _1798 = _1794 || _1796;
    float _1800 = fma(_1288, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1786);
    bool _1802 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1804 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1806 = _1802 || _1804;
    bool _1808 = isnan(0.5);
    bool _1810 = _1806 || _1808;
    float _1812 = _1800 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1814 = fma(_1278, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1788);
    float _1816 = 1.0 / _1812;
    float _1818 = fma(_1288, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1814);
    float _1820 = _1818 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1822 = _1820 + _1812;
    float _1824 = fma(_1784, _1778, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1826 = _1784;
    if (_1810)
    {
        _1826 = 1.0;
    }
    float _1828 = _1826;
    float _1830 = _1822 * _1816;
    float _1832 = _1830 * 0.5;
    float _1834 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1836 = _1648 + _1834;
    float _1838 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1840 = fma(_1832, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1838);
    float _1842 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1844 = _1656 + _1842;
    float _1846 = fma(_1836, _1778, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1848 = -_1268;
    float _1850 = fma(_1848, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1824);
    float _1852 = fma(_1844, _1778, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1854 = 1.0 / _1840;
    float _1856 = -_1266;
    float _1858 = fma(_1856, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1846);
    float _1860 = -_1274;
    float _1862 = fma(_1860, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1852);
    float _1864 = _1858;
    float _1866 = _1850;
    float _1868 = _1862;
    float _1870 = _1846;
    float _1872 = _1828;
    if (!_1798)
    {
        float _1874 = _1284 * _1284;
        float _1876 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1878 = -_1100;
        float _1880 = _1878 + _1852;
        float _1882 = -_1144;
        float _1884 = _1882 + _1824;
        float _1886 = fma(_1292, _1292, _1874);
        float _1888 = fma(_1300, _1300, _1886);
        float _1890 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1892 = sqrt(_1888);
        float _1894 = 1.0 / _1400;
        float _1896 = _1890 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1898 = precise::min(_1892, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1900 = _1898 * _1876;
        float _1902 = _1900 * _1894;
        float _1904 = -_1116;
        float _1906 = _1904 + _1846;
        float _1908 = _1896 * _1902;
        float _1910 = _1880 * _1902;
        float _1912 = fma(_1906, _1908, _1272);
        float _1914 = fma(_1884, _1908, _1278);
        float _1916 = fma(_1896, _1910, _1288);
        _1864 = _1912;
        _1866 = _1914;
        _1868 = _1916;
    }
    float _1918 = _1864;
    float _1920 = _1866;
    float _1922 = _1868;
    if (_1810)
    {
        _1358 = 1.0;
    }
    float _1924 = _1358;
    float _1926 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1928 = _1854 * _1926;
    float _1930 = _1924;
    if (!_1810)
    {
        float _1932 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1934 = _1932 * 0.15915493667125701904296875;
        float _1936 = _1934 * 6.283185482025146484375;
        float _1938 = cos(_1936);
        float _1940 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1942 = _1940 * 0.15915493667125701904296875;
        float _1944 = _1934 * 6.283185482025146484375;
        float _1946 = sin(_1944);
        float _1948 = 1.0 / _1938;
        float _1950 = _1942 * 6.283185482025146484375;
        float _1952 = cos(_1950);
        float _1954 = _1946 * _1948;
        float _1956 = _1942 * 6.283185482025146484375;
        float _1958 = sin(_1956);
        float _1960 = _1952 * _1954;
        float _1962 = 1.0 / _1960;
        float _1964 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1966 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1964;
        float _1968 = 1.0 / _1966;
        float _1970 = _1958 * _1962;
        float _1972 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1974 = fma(_1928, _1970, _1972);
        float _1976 = _1974 * _1968;
        float _1978 = precise::clamp(_1976, 0.0, 1.0);
        _1870 = _1934;
        _1872 = _1978;
    }
    float _1980 = _1870;
    float _1982 = _1872;
    float _1984 = _1980;
    if (!_1810)
    {
        float _1986 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1988 = _1986 * 0.15915493667125701904296875;
        float _1990 = _1988 * 6.283185482025146484375;
        float _1992 = cos(_1990);
        float _1994 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1996 = _1994 * 0.15915493667125701904296875;
        float _1998 = _1988 * 6.283185482025146484375;
        float _2000 = sin(_1998);
        float _2002 = 1.0 / _1992;
        float _2004 = _1996 * 6.283185482025146484375;
        float _2006 = cos(_2004);
        float _2008 = _2000 * _2002;
        float _2010 = _1996 * 6.283185482025146484375;
        float _2012 = sin(_2010);
        float _2014 = _2006 * _2008;
        float _2016 = 1.0 / _2014;
        float _2018 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2020 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2018;
        float _2022 = 1.0 / _2020;
        float _2024 = _2012 * _2016;
        float _2026 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2028 = fma(_1928, _2024, _2026);
        float _2030 = _2028 * _2022;
        float _2032 = precise::clamp(_2030, 0.0, 1.0);
        float _2034 = -_2032;
        float _2036 = _2034 + 1.0;
        _1930 = _2036;
    }
    float _2038 = _1930;
    float _2040 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2042 = _1918 + _2040;
    float _2044 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2046 = _1920 + _2044;
    float _2048 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2050 = _1922 + _2048;
    float _2052 = _2042 * _2042;
    float _2054 = fma(_2046, _2046, _2052);
    float _2056 = fma(_2050, _2050, _2054);
    float _2058 = rsqrt(_2056);
    float _2060 = _2058 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2062 = _2046 * _2060;
    float _2064 = _2050 * _2060;
    float _2066 = _2062 * _2062;
    float _2068 = _2064 * _2064;
    float _2070 = _2066 + _2068;
    float _2072 = sqrt(_2070);
    bool _2074 = _2072 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2076 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2078 = _2072 + _2076;
    float _2080 = _2054;
    float _2082 = _2070;
    float _2084 = _2078;
    float _2086 = _2042;
    if (_2074)
    {
        float _2088 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2080 = _2088;
    }
    float _2090 = _2080;
    if (_2074)
    {
        float _2092 = rsqrt(_2070);
        _2082 = _2092;
    }
    float _2094 = _2082;
    float _2096 = _2090;
    float _2098 = _2094;
    if (_2074)
    {
        float _2100 = _2078 * _2090;
        _2084 = _2100;
    }
    float _2102 = _2084;
    if (_2074)
    {
        float _2104 = _2102 * 0.15915493667125701904296875;
        _1984 = _2104;
    }
    float _2106 = _1984;
    float _2108 = _2050;
    float _2110 = _2106;
    if (_2074)
    {
        float _2112 = _2106 * 6.283185482025146484375;
        float _2114 = sin(_2112);
        _2108 = _2114;
    }
    float _2116 = _2108;
    float _2118 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2120 = precise::max(0.0, _2118);
    float _2122 = _1688;
    if (_2074)
    {
        float _2124 = _2106 * 6.283185482025146484375;
        float _2126 = cos(_2124);
        _2122 = _2126;
    }
    float _2128 = _2122;
    float _2130 = -_2060;
    float _2132 = -_2120;
    float _2134 = fma(_2042, _2130, _2132);
    float _2136 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_2074)
    {
        float _2138 = _2134 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2086 = _2138;
    }
    float _2140 = _2086;
    float _2142 = _2140;
    if (!_2074)
    {
        _2110 = _2062;
    }
    float _2144 = _2110;
    float _2146 = fma(_1278, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2148 = sqrt(_2056);
    float _2150 = _2116;
    float _2152 = _2144;
    if (_2074)
    {
        float _2154 = fma(_2116, _2140, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2096 = _2154;
    }
    float _2156 = _2096;
    float _2158 = _2156;
    if (!_2074)
    {
        _2150 = _2064;
    }
    float _2160 = _2150;
    float _2162 = _2160;
    if (_2074)
    {
        float _2164 = _2128 + (-1.0);
        _2142 = _2164;
    }
    float _2166 = _2142;
    float _2168 = _2166;
    if (_2074)
    {
        float _2170 = _2094 * _2156;
        _2136 = _2170;
    }
    float _2172 = _2136;
    if (!_2074)
    {
        _2158 = _2134;
    }
    float _2174 = _2158;
    float _2176 = _2174;
    if (_2074)
    {
        float _2178 = _2166 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2168 = _2178;
    }
    float _2180 = _2168;
    float _2182 = _2180;
    if (_2074)
    {
        float _2184 = _2062 * _2172;
        _2152 = _2184;
    }
    float _2186 = _2152;
    if (!_2074)
    {
        _2098 = _2066;
    }
    float _2188 = _2098;
    float _2190 = _2188;
    if (_2074)
    {
        float _2192 = _2064 * _2172;
        _2162 = _2192;
    }
    float _2194 = _2162;
    if (_2074)
    {
        float _2196 = fma(_2134, _2128, _2180);
        _2176 = _2196;
    }
    float _2198 = _2176;
    if (_2074)
    {
        float _2200 = _2186 * _2186;
        _2190 = _2200;
    }
    float _2202 = _2190;
    float _2204 = _1918 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (!_2074)
    {
        _2182 = _2068;
    }
    float _2206 = _2182;
    float _2208 = _2206;
    if (_2074)
    {
        float _2210 = _2194 * _2194;
        _2208 = _2210;
    }
    float _2212 = _2208;
    float _2214 = fma(_2198, _2198, _2202);
    float _2216 = fma(_1920, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2204);
    float _2218 = floor(_2146);
    float _2220 = _2214 + _2212;
    float _2222 = fma(_1922, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2216);
    float _2224 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2226 = _2222 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2228 = rsqrt(_2220);
    float _2230 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2232 = fma(_2148, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2230);
    float _2234 = precise::clamp(_2232, 0.0, 1.0);
    float _2236 = _2226 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2238 = fma(_1288, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2240 = _1918 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2242 = -_2234;
    float _2244 = _2242 + 1.0;
    float _2246 = -_2236;
    float _2248 = fma(_2246, _2224, 1.0);
    float _2250 = _1918 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2252 = fma(_1920, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2240);
    float _2254 = _1918 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2256 = floor(_2238);
    float _2258 = fma(_1920, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2250);
    float _2260 = fma(_1922, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2252);
    float _2262 = fma(_1920, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2254);
    float _2264 = -_2218;
    float _2266 = _2146 + _2264;
    float _2268 = _2228 * _2186;
    float _2270 = _2228 * _2198;
    float _2272 = fma(_1922, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2258);
    float _2274 = abs(_2244);
    float _2276 = log2(_2274);
    float _2278 = _2268 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2280 = _2228 * _2194;
    float _2282 = _2272 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2284 = _2260 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2286 = -_2278;
    float _2288 = fma(_2270, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2286);
    float _2290 = _2282 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2292 = log2(_2248);
    float _2294 = -_2280;
    float _2296 = fma(_2294, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2288);
    float _2298 = fma(_1922, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2262);
    float _2300 = fma(_2284, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2290);
    float _2302 = _2282 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2304 = fma(_2296, -0.5, 0.5);
    float _2306 = _2298 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2308 = fma(_2226, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2300);
    float _2310 = _2276 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2312 = _2282 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2314 = sqrt(_2304);
    float _2316 = fma(_2306, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2308);
    float _2318 = fma(_2284, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2302);
    float _2320 = fma(_2284, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2312);
    float _2322 = fma(_2296, 0.5, 0.5);
    float _2324 = -_2256;
    float _2326 = _2238 + _2324;
    float _2328 = fma(_2226, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2318);
    float _2330 = fma(_2226, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2320);
    float _2332 = 1.0 / _2316;
    float _2334 = fma(_2322, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2336 = _2270 + 1.0;
    float _2338 = fma(_2306, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2330);
    float _2340 = fma(_2306, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2328);
    float _2342 = fma(_2322, _2334, -0.212114393711090087890625);
    float _2344 = _2292 * 0.693147182464599609375;
    float _2346 = exp2(_2310);
    float2 _6438 = float2(_2266, _2326);
    float _2348 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6438, float2(0.0), isnan(_6438)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6438, float2(0.0), isnan(_6438)), level(0.0)).x;
    float _2350 = fma(_2322, _2342, 1.570728778839111328125);
    float _2352 = _2314 * 0.636619746685028076171875;
    float _2354 = _2344 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2356 = -_2350;
    float _2358 = fma(_2352, _2356, 1.0);
    float _2360 = _2338 * _2332;
    float _2362 = _2340 * _2332;
    float _2364 = fma(_2360, 0.5, 0.5);
    float _2366 = fma(_2362, -0.5, 0.5);
    float _2368 = -_2270;
    float _2370 = fma(_2346, _2336, _2368);
    float3 _6481 = float3(_2364, _2366, _2354);
    float _2372 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6481, float3(0.0), isnan(_6481)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6481, float3(0.0), isnan(_6481)), level(0.0)).x;
    float _2374 = fma(_2370, 0.5, 0.5);
    float3 _6494 = float3(_2364, _2366, _2354);
    float4 _2377 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6494, float3(0.0), isnan(_6494)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6494, float3(0.0), isnan(_6494)), level(0.0)).xyzw;
    float _2379 = _2377.x;
    float _2381 = _2377.y;
    float _2383 = _2377.z;
    float _2385 = _2377.w;
    float2 _6510 = float2(_2358, _2374);
    float3 _2389 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6510, float2(0.0), isnan(_6510)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6510, float2(0.0), isnan(_6510)), level(0.0)).xyz;
    float _2391 = _2389.x;
    float _2393 = _2389.y;
    float _2395 = _2389.z;
    float _2397 = abs(_1928);
    float _2399 = log2(_2397);
    float _2401 = _2282 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2403 = _2276 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2405 = _2148 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2407 = isnan(_2148);
    bool _2409 = _2405 || _2407;
    bool _2411 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2413 = _2409 || _2411;
    float _2415 = fma(_2284, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2401);
    float _2417 = exp2(_2403);
    float _2419 = fma(_2226, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2415);
    float _2421 = in.m_76.x;
    float _2423 = _2338 + _2316;
    float _2425 = fma(_2306, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2419);
    float _2427 = _2399 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    bool _2429 = _1928 <= 8000.0;
    bool _2431 = isnan(_1928);
    bool _2433 = _2429 || _2431;
    bool _2435 = isnan(8000.0);
    bool _2437 = _2433 || _2435;
    float _2439 = float(_2437);
    float _2441 = _2316 * 0.5;
    float _2443 = _2425 + _2316;
    float _2445 = _2423 * 0.5;
    out.gl_Position.x = _2338;
    out.gl_Position.y = _2340;
    out.gl_Position.z = _2425;
    out.gl_Position.w = _2316;
    float _2447 = exp2(_2427);
    float _2449 = _2443 * 0.5;
    float _2451 = -_2417;
    float _2453 = _2451 + 1.0;
    float _2455 = _1982 * _2038;
    float _2457 = _2425;
    float _2459 = _2316;
    float _2461 = _2340;
    float _2463 = _2455;
    if (!_2413)
    {
        _2457 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2465 = _2457;
    float _2467 = fma(_2447, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2469 = precise::clamp(_2467, 0.0, 1.0);
    float _2471 = _2465;
    float _2473 = _2465;
    if (!_2413)
    {
        _2459 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2475 = _2459;
    float _2477 = fma(_2469, -2.0, 3.0);
    float _2479 = _2469 * _2469;
    float _2481 = _2479 * _2477;
    float _2483 = -_2481;
    float _2485 = _2483 + 1.0;
    float _2487 = fma(_2485, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2481);
    float _2489 = fma(_2340, -0.5, _2441);
    float _2491 = _2453 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2493 = _2475;
    float _2495 = _2475;
    if (!_2413)
    {
        _2461 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2497 = _2461;
    float _2499 = _2439 * _2487;
    out.m_78.x = _2445;
    out.m_78.y = _2489;
    out.m_78.z = _2449;
    out.m_78.w = _2316;
    float _2501 = _2499 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2503 = _2455 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2505 = _2497;
    float _2507 = _2497;
    if (!_2413)
    {
        _2463 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2509 = _2463;
    float _2511 = -_2348;
    float _2513 = _2511 + 1.0;
    float _2515 = _2513 * _2501;
    float _2517 = precise::clamp(_2515, 0.0, 1.0);
    float _2519 = -_2517;
    float _2521 = fma(_2519, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2523 = _2521 * _2421;
    float _2525 = _2491 * _2372;
    float _2527 = -_2491;
    float _2529 = _2527 + 1.0;
    float _2531 = _2523 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2533 = _2523;
    float _2535 = _2529;
    float _2537 = _2509;
    float _2539 = _2509;
    if (!_2413)
    {
        _2533 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2541 = _2533;
    float _2543 = _2385 * _2525;
    out.m_80.x = _2531;
    float _2545 = _2395 * _2525;
    float _2547 = fma(_2391, _2543, _2379);
    float _2549 = fma(_2393, _2543, _2381);
    float _2551 = _2385 * _2529;
    float _2553 = fma(_2385, _2545, _2383);
    float _2555 = _2541;
    float _2557 = _2541;
    if (!_2413)
    {
        _2535 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2559 = _2535;
    out.m_82.x = _2547;
    out.m_82.y = _2549;
    out.m_82.z = _2553;
    out.m_82.w = _2551;
    bool _2561 = !_2413;
    float _2563 = _2559;
    float _2565 = _2559;
    if (!_2561)
    {
        bool _2567 = _2148 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2569 = isnan(_2148);
        bool _2571 = _2567 || _2569;
        bool _2573 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2575 = _2571 || _2573;
        if (!_2575)
        {
            float _2577 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2579 = _2148 + _2577;
            float _2581 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2583 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2581;
            float _2585 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2587 = _2585 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2589 = 1.0 / _2583;
            float _2591 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2593 = _2591 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2595 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2597 = _2595 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2599 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2601 = _2599 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2603 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2605 = _2603 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2607 = _2579 * _2589;
            float _2609 = precise::clamp(_2607, 0.0, 1.0);
            float _2611 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2613 = _2611 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2615 = fma(_2609, _2587, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2617 = fma(_2609, _2613, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2619 = fma(_2609, _2593, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2621 = fma(_2609, _2597, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2623 = fma(_2609, _2601, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2625 = fma(_2609, _2605, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2565 = _2619;
            _2507 = _2623;
            _2557 = _2615;
            _2473 = _2621;
            _2495 = _2617;
            _2539 = _2625;
            _2627 = true;
        }
        else
        {
            bool _2629 = _2148 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2631 = isnan(_2148);
            bool _2633 = _2629 || _2631;
            bool _2635 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2637 = _2633 || _2635;
            if (!_2637)
            {
                _2555 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2639 = _2555;
            _2557 = _2639;
            if (!_2637)
            {
                _2563 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2641 = _2563;
            _2565 = _2641;
            if (!_2637)
            {
                _2493 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2643 = _2493;
            _2495 = _2643;
            if (!_2637)
            {
                _2471 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2645 = _2471;
            _2473 = _2645;
            if (!_2637)
            {
                _2505 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2647 = _2505;
            _2507 = _2647;
            if (!_2637)
            {
                _2537 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2649 = _2537;
            bool _2651 = !_2637;
            _2539 = _2649;
            if (!_2651)
            {
                bool _2653 = _2148 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2655 = isnan(_2148);
                bool _2657 = _2653 || _2655;
                bool _2659 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2661 = _2657 || _2659;
                if (!_2661)
                {
                    float _2663 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2665 = _2148 + _2663;
                    float _2667 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2669 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2667;
                    float _2671 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2673 = _2671 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2675 = 1.0 / _2669;
                    float _2677 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2679 = _2677 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2681 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2683 = _2681 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2685 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2687 = _2685 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2689 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2691 = _2689 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2693 = _2665 * _2675;
                    float _2695 = precise::clamp(_2693, 0.0, 1.0);
                    float _2697 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2699 = _2697 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2701 = fma(_2695, _2673, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2703 = fma(_2695, _2699, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2705 = fma(_2695, _2679, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2707 = fma(_2695, _2683, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2709 = fma(_2695, _2687, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2711 = fma(_2695, _2691, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2565 = _2705;
                    _2507 = _2709;
                    _2557 = _2701;
                    _2473 = _2707;
                    _2495 = _2703;
                    _2539 = _2711;
                    _2627 = true;
                }
                else
                {
                    _2565 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2507 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2557 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2473 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2495 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2539 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2627 = false;
    float _2713 = _2565;
    float _2715 = _2507;
    float _2717 = _2557;
    float _2719 = _2473;
    float _2721 = _2495;
    float _2723 = _2539;
    float _2725 = fma(_1698, -0.5, 0.5);
    float _2727 = precise::clamp(_2725, 0.0, 1.0);
    float _2729 = -_2713;
    float _2731 = _2729 + _2715;
    float _2733 = _2503 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2735 = -_2717;
    float _2737 = _2735 + _2719;
    out.m_84.x = 0.0;
    float _2739 = fma(_2727, _2731, _2713);
    float _2741 = fma(_2727, _2737, _2717);
    out.m_55.x = _2733;
    float _2743 = -_2721;
    float _2745 = _2743 + _2723;
    float _2747 = _2739 * 0.586610972881317138671875;
    bool _2749 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2751 = fma(_2727, _2745, _2721);
    float _2753 = fma(_2741, 0.298911988735198974609375, _2747);
    bool _2755 = _1982 > 0.0;
    bool _2757 = isnan(_1982);
    bool _2759 = _2755 || _2757;
    bool _2761 = isnan(0.0);
    bool _2763 = _2759 || _2761;
    float _2765 = fma(_2751, 0.114477999508380889892578125, _2753);
    bool _2767 = _2038 <= 0.0;
    bool _2769 = !_2763;
    bool _2771 = _2767 || _2769;
    float _2773 = -_2765;
    float _2775 = _2741 + _2773;
    float _2777 = -_2765;
    float _2779 = _2739 + _2777;
    float _2781 = -_2765;
    float _2783 = _2751 + _2781;
    float _2785 = fma(_2775, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2765);
    float _2787 = fma(_2779, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2765);
    float _2789 = fma(_2783, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2765);
    bool _2791 = !_2749;
    if (!_2791)
    {
        float _2793 = -_1918;
        float _2795 = _2793 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2797 = -_1920;
        float _2799 = _2797 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2801 = -_1922;
        float _2803 = _2801 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2805 = _2795 * _2795;
        float _2807 = fma(_2799, _2799, _2805);
        float _2809 = fma(_2803, _2803, _2807);
        float _2811 = sqrt(_2809);
        float _2813 = rsqrt(_2809);
        float _2815 = -_2811;
        float _2817 = _2815 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2819 = _2817 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2821 = precise::clamp(_2819, 0.0, 1.0);
        float _2823 = _2799 * _2813;
        float _2825 = _2795 * _2813;
        float _2827 = abs(_2821);
        float _2829 = log2(_2827);
        float _2831 = _2803 * _2813;
        float _2833 = _2823 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2835 = _1698 * _2825;
        float _2837 = -_2825;
        float _2839 = -_2833;
        float _2841 = fma(_2837, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2839);
        float _2843 = fma(_1696, _2823, _2835);
        float _2845 = -_2831;
        float _2847 = fma(_2845, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2841);
        float _2849 = fma(_1700, _2831, _2843);
        float _2851 = precise::clamp(_2849, 0.0, 1.0);
        float _2853 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2855 = _2847 + _2853;
        float _2857 = _2829 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2859 = _2855 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2861 = precise::clamp(_2859, 0.0, 1.0);
        float _2863 = exp2(_2857);
        float _2865 = _2863 * _2861;
        float _2867 = _2851 * _2865;
        float _2869 = _2867 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2871 = _2867 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2873 = _2867 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_84.x = _2869;
        out.m_84.y = _2871;
        out.m_84.z = _2873;
    }
    out.m_86.x = _2785;
    out.m_86.y = _2787;
    out.m_86.z = _2789;
    if (!_2771)
    {
        return out;
    }
    out.m_55.x = 0.0;
    float _2875 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2875;
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
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2627 = false;
    bool _1748 = false;
    bool _203 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _100 = in.m_48.w;
    float _102 = in.m_50.w;
    float _104 = trunc(_100);
    int _107 = int(_104);
    float _109 = -_102;
    float _111 = _109 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.y = _111;
    bool _115 = _107 >= 1;
    float _117 = 0.0;
    float _119 = _102;
    float _121 = _111;
    if (!_115)
    {
        _117 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _123 = _117;
    if (!_115)
    {
        out.m_55.x = 0.0;
    }
    int _125 = 0;
    if (!_115)
    {
        float _127 = _123 * 5.0;
        _125 = as_type<int>(_127);
    }
    int _129 = _125;
    int _131 = _129;
    if (!_115)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2943 = as_type<float>(_129);
        out.gl_Position.z = _2943;
    }
    if (!_115)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _133 = _102 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _135 = isnan(_102);
    bool _137 = _133 || _135;
    bool _139 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _141 = _137 || _139;
    float _143 = float(_107);
    bool _145 = _111 >= _143;
    bool _147 = !_141;
    bool _149 = _145 || _147;
    if (_149)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _151 = _119;
    if (_149)
    {
        out.m_55.x = 0.0;
    }
    if (_149)
    {
        float _153 = _151 * 5.0;
        _131 = as_type<int>(_153);
    }
    int _155 = _131;
    if (_149)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2998 = as_type<float>(_155);
        out.gl_Position.z = _2998;
    }
    if (_149)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _157 = as_type<float>(int(gl_VertexIndex));
    float _159 = 1.0 / _143;
    bool _161 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _163 = _111 * _159;
    int _165 = as_type<int>(_157) & 1;
    bool _167 = _165 != 0;
    int _169 = as_type<int>(_157) & 2;
    bool _171 = _169 != 0;
    bool _173 = !_167;
    float _175 = _173 ? (-0.5) : 0.5;
    bool _177 = !_171;
    float _179 = _177 ? (-0.5) : 0.5;
    bool _181 = !_161;
    float _183 = _163;
    float _201;
    if (!_181)
    {
        float _185 = in.m_60.x;
        float _187 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _189 = _185 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _191 = fma(_189, (*spvDescriptorSet0.vp_c9)._m0[12].x, _111);
        float _193 = _191 * _187;
        float _195 = floor(_193);
        float _197 = -_195;
        float _199 = _193 + _197;
        _201 = _199;
        _203 = true;
    }
    else
    {
        _201 = _163;
    }
    _203 = false;
    float _205 = _201;
    float _207 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _209 = _205 + _207;
    bool _211 = _205 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _213 = isnan(_205);
    bool _215 = _211 || _213;
    bool _217 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _219 = _215 || _217;
    float _221 = float(_219);
    float _223 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _225 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _223;
    float _227 = -_221;
    float _229 = _227 + 1.0;
    bool _231 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _233 = 1.0 / _225;
    float _235 = _209 * _233;
    bool _237 = _205 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _239 = isnan(_205);
    bool _241 = _237 || _239;
    bool _243 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _245 = _241 || _243;
    float _247 = float(_245);
    float _249 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _251 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _249;
    float _253 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _255 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _253;
    float _257 = _247 * _229;
    float _259 = fma(_251, _235, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _261 = fma(_255, _235, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _263 = -_247;
    float _265 = _263 + 1.0;
    float _267 = _259 * _257;
    float _269 = _261 * _257;
    float _271 = fma(_265, (*spvDescriptorSet0.vp_c9)._m0[143].x, _267);
    float _273 = fma(_265, (*spvDescriptorSet0.vp_c9)._m0[143].y, _269);
    float _275 = fma(_221, (*spvDescriptorSet0.vp_c9)._m0[144].x, _271);
    float _277 = fma(_221, (*spvDescriptorSet0.vp_c9)._m0[144].y, _273);
    bool _279 = !_231;
    if (!_279)
    {
        float _281 = in.m_60.x;
        float _283 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _285 = _281 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _287 = fma(_285, (*spvDescriptorSet0.vp_c9)._m0[11].y, _111);
        float _289 = _287 * _283;
        float _291 = floor(_289);
        float _293 = -_291;
        float _295 = _289 + _293;
        _183 = _295;
    }
    float _297 = _183;
    float _299 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _301 = int(_299);
    float _303 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _305 = int(_303);
    float _307 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _309 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _311 = float(_301);
    float _313 = 1.0 / _311;
    bool _315 = _297 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _317 = isnan(_297);
    bool _319 = _315 || _317;
    bool _321 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _323 = _319 || _321;
    float _325 = float(_323);
    float _327 = float(uint(_305));
    int _329 = ~_305;
    int _331 = _329 + 1;
    int _333 = ~_305;
    int _335 = _333 + 1;
    float _337 = 1.0 / _327;
    float _339 = _313 * _111;
    float _341 = trunc(_339);
    int _343 = int(_341);
    int _345 = as_type<int>(_337) + (-2);
    float _347 = float(_305);
    float _349 = float(uint(_343));
    float _351 = as_type<float>(_345) * _349;
    float _353 = trunc(_351);
    float _355 = precise::max(_353, 0.0);
    uint _358 = uint(_355);
    int _360 = _331 * int(_358);
    int _362 = _360 + _343;
    float _364 = in.m_60.x;
    float _366 = in.m_60.y;
    float _368 = float(uint(_362));
    float _370 = as_type<float>(_345) * _368;
    float _372 = trunc(_370);
    float _374 = precise::max(_372, 0.0);
    uint _376 = uint(_374);
    int _378 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _380 = _378 != 0;
    bool _382 = !_380;
    float _384 = _382 ? 7.345489978790283203125 : 1.0;
    float _386 = _384 * _364;
    int _388 = int(_358) + int(_376);
    float _390 = float(_343);
    float _392 = floor(_386);
    int _394 = _335 * _388;
    int _396 = _394 + _343;
    bool _398 = _390 >= _347;
    bool _400 = isnan(_390);
    bool _402 = _398 || _400;
    bool _404 = isnan(_347);
    bool _406 = _402 || _404;
    float _408 = float(_406);
    bool _410 = uint(_396) >= uint(_305);
    float _412 = trunc(_408);
    int _414 = int(_412);
    bool _416 = !_410;
    int _418 = _416 ? 0 : (-1);
    bool _420 = _305 == 0;
    int _422 = ~_388;
    int _424 = _422 + _418;
    int _426 = _424 + 1;
    float _428 = -_392;
    float _430 = _386 + _428;
    int _432 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _434 = _432 != 0;
    int _436 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _438 = _436 != 0;
    int _440 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _442 = _440 != 0;
    int _444 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _446 = _444 != 0;
    int _448 = _305 * _426;
    int _450 = _448 + _343;
    float _452 = _430 * _347;
    int _454 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _456 = _454 != 0;
    int _458 = ~_414;
    int _460 = _458 + 1;
    int _462 = _460 + 1;
    bool _464 = !_420;
    int _466 = _464 ? _450 : (-1);
    float _468 = trunc(_452);
    int _470 = int(_468);
    int _472 = _466 * _462;
    float _474 = _347 * _111;
    int _476 = _305 + (-1);
    bool _478 = !_446;
    int _480 = _478 ? 0 : 1;
    float _482 = _474 * _159;
    bool _484 = !_438;
    int _486 = _484 ? 0 : 1;
    int _488 = _414 * _476;
    int _490 = _488 + _472;
    bool _492 = !_434;
    int _494 = _492 ? 0 : 1;
    int _496 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _498 = _496 != 0;
    float _500 = trunc(_482);
    int _502 = int(_500);
    int _504 = abs(_486);
    bool _506 = !_442;
    int _508 = _506 ? 0 : 1;
    int _510 = abs(_480);
    int _512 = abs(_494);
    bool _514 = !_498;
    int _516 = _514 ? 0 : 1;
    int _518 = _470 * _510;
    int _520 = _518 + _343;
    int _522 = abs(_508);
    int _524 = _490 * _504;
    int _526 = abs(_516);
    int _528 = _502 * _512;
    int _530 = _528 + _524;
    int _532 = ~_305;
    int _534 = _532 + 1;
    int _536 = _520 * _522;
    int _538 = _536 + _530;
    int _540 = ~_305;
    int _542 = _540 + 1;
    int _544 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _546 = _544 != 0;
    int _548 = _470 * _526;
    int _550 = _548 + _538;
    int _552 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _554 = _552 != 0;
    float _556 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _558 = log2(_556);
    bool _560 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _562 = isnan(1.0);
    bool _564 = _560 || _562;
    bool _566 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _568 = _564 || _566;
    float _570 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _572 = 1.0 + _570;
    float _574 = float(uint(_550));
    bool _576 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _578 = isnan(0.0);
    bool _580 = _576 || _578;
    bool _582 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _584 = _580 || _582;
    float _586 = as_type<float>(_345) * _574;
    float _588 = 1.0 / _572;
    float _590 = _558 * _111;
    float _592 = trunc(_586);
    float _594 = precise::max(_592, 0.0);
    uint _596 = uint(_594);
    int _598 = _542 * int(_596);
    int _600 = _598 + _550;
    float _602 = float(uint(_600));
    float _604 = as_type<float>(_345) * _602;
    float _606 = in.m_48.x;
    float _608 = in.m_48.y;
    float _610 = in.m_48.z;
    float _612 = trunc(_604);
    float _614 = precise::max(_612, 0.0);
    uint _616 = uint(_614);
    int _618 = int(_596) + int(_616);
    float _620 = _364 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _622 = _608 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _624 = _534 * _618;
    int _626 = _624 + _550;
    float _628 = _608 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _630 = -_307;
    float _632 = fma(_620, 2.0, _630);
    float _634 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _636 = uint(_626) >= uint(_305);
    float _638 = _366 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _640 = fma(_606, (*spvDescriptorSet0.vp_c10)._m0[4].x, _622);
    float _642 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _644 = !_636;
    int _646 = _644 ? 0 : (-1);
    float _648 = fma(_638, -2.0, _309);
    float _650 = fma(_606, (*spvDescriptorSet0.vp_c10)._m0[6].x, _628);
    int _652 = ~_618;
    int _654 = _652 + _646;
    int _656 = _654 + 1;
    float _658 = _608 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _660 = exp2(_590);
    float _662 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _664 = fma(_606, (*spvDescriptorSet0.vp_c10)._m0[5].x, _658);
    int _666 = _305 * _656;
    int _668 = _666 + _550;
    float _670 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _672 = _634 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _674 = _642 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _676 = _670 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _678 = !_420;
    int _680 = _678 ? _668 : (-1);
    float _682 = in.m_60.z;
    float _684 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[76].y, _648);
    float _686 = fma(_610, (*spvDescriptorSet0.vp_c10)._m0[4].z, _640);
    int _688 = _680 & 3;
    bool _690 = _688 != 0;
    out.m_62.x = _672;
    out.m_62.y = _674;
    out.m_62.z = _676;
    out.m_62.w = _662;
    float _692 = fma(_610, (*spvDescriptorSet0.vp_c10)._m0[5].z, _664);
    float _694 = fma(_610, (*spvDescriptorSet0.vp_c10)._m0[6].z, _650);
    float _696 = -_660;
    float _698 = _696 + 1.0;
    float _700 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _702 = _364 * 2.0;
    int _704 = _690 ? 0 : 1;
    float _706 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _708 = _706 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _710 = _680 & 3;
    bool _712 = _710 != 0;
    float _714 = fma(_364, (*spvDescriptorSet0.vp_c9)._m0[78].z, _700);
    float _716 = _584 ? _698 : 0.0;
    float _718 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _720 = floor(_702);
    float _722 = _366 * 2.0;
    bool _724 = uint(_710) > 1u;
    float _726 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[78].w, _718);
    float _728 = -_111;
    float _730 = fma(_728, (*spvDescriptorSet0.vp_c9)._m0[76].x, _632);
    float _732 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[77].z, _714);
    int _734 = ~_704;
    int _736 = _734 + 1;
    int _738 = _736 + 1;
    float _740 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[77].w, _726);
    float _742 = floor(_722);
    int _744 = _738;
    if (_568)
    {
        float _746 = _716 * _588;
        _121 = _746;
    }
    float _748 = _121;
    bool _750 = _364 > 0.5;
    float _752 = _366 + _682;
    float _754 = -_732;
    float _756 = _754 + 1.0;
    float _758 = -_175;
    int _760 = _750 ? as_type<int>(_758) : as_type<int>(_175);
    bool _762 = _366 > 0.5;
    float _764 = 1.0 / _708;
    if (!_724)
    {
        int _766 = ~_704;
        int _768 = _766 + 1;
        _744 = _768;
    }
    int _770 = _744;
    float _772 = _366 + _364;
    bool _774 = _720 >= 0.0;
    bool _776 = isnan(_720);
    bool _778 = _774 || _776;
    bool _780 = isnan(0.0);
    bool _782 = _778 || _780;
    float _784 = -_179;
    int _786 = _762 ? as_type<int>(_784) : as_type<int>(_179);
    float _788 = _772 + (-1.0);
    bool _790 = _720 > 0.0;
    int _792 = _782 ? 0 : 1;
    float _794 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _796 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _794;
    bool _798 = !_456;
    float _800 = _798 ? _175 : as_type<float>(_760);
    float _802 = _752 + (-1.0);
    bool _804 = _742 > 0.0;
    float _806 = fma(_788, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _808 = _742 >= 0.0;
    bool _810 = isnan(_742);
    bool _812 = _808 || _810;
    bool _814 = isnan(0.0);
    bool _816 = _812 || _814;
    float _818 = _796 * _764;
    float _820 = float(uint(_520));
    float _822 = _682 * 2.0;
    float _824 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _826 = _297 + _824;
    bool _828 = !_554;
    float _830 = _828 ? _179 : as_type<float>(_786);
    float _832 = fma(_802, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _834 = as_type<float>(_345) * _820;
    int _836 = _680 >> 31;
    float _838 = floor(_822);
    bool _840 = uint(_710) >= 2u;
    float _842 = _800 + 0.5;
    int _844 = _836 & 3;
    int _846 = _816 ? 0 : 1;
    int _848 = _680 + _844;
    float _850 = trunc(_834);
    float _852 = precise::max(_850, 0.0);
    uint _854 = uint(_852);
    int _856 = ~_792;
    int _858 = _856 + 1;
    int _860 = _858 + 1;
    float _862 = fma(_818, _826, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    int _864 = _848 >> 2;
    float _866 = -_325;
    float _868 = _866 + 1.0;
    int _870 = _860;
    if (!_790)
    {
        int _872 = ~_792;
        int _874 = _872 + 1;
        _870 = _874;
    }
    int _876 = _870;
    int _878 = _840 ? 0 : 1;
    bool _880 = _297 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _882 = isnan(_297);
    bool _884 = _880 || _882;
    bool _886 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _888 = _884 || _886;
    float _890 = float(_888);
    int _892 = ~_846;
    int _894 = _892 + 1;
    int _896 = _894 + 1;
    int _898 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _900 = _898 != 0;
    int _902 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _904 = _902 != 0;
    int _906 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _908 = _906 != 0;
    float _910 = _890 * _868;
    int _912 = _896;
    if (!_804)
    {
        int _914 = ~_846;
        int _916 = _914 + 1;
        _912 = _916;
    }
    int _918 = _912;
    float _920 = -_890;
    float _922 = _920 + 1.0;
    int _924 = ~_305;
    int _926 = _924 + 1;
    int _928 = _864 << 4;
    int _930 = _928 + 368;
    bool _932 = !_900;
    int _934 = _932 ? 0 : 1;
    int _936 = _926 * int(_854);
    int _938 = _936 + _520;
    uint _940 = uint(int(uint(_930) >> uint(2)));
    uint _942 = uint(int(uint(int(_940)) >> uint(2)));
    int _944 = int(_940) & 3;
    float _946 = (*spvDescriptorSet0.vp_c9)._m0[int(_942)][_944];
    int _948 = int(_940) + 1;
    uint _950 = uint(int(uint(_948) >> uint(2)));
    int _952 = _948 & 3;
    float _954 = (*spvDescriptorSet0.vp_c9)._m0[int(_950)][_952];
    bool _956 = _838 >= 0.0;
    bool _958 = isnan(_838);
    bool _960 = _956 || _958;
    bool _962 = isnan(0.0);
    bool _964 = _960 || _962;
    bool _966 = _838 > 0.0;
    float _968 = float(uint(_938));
    float _970 = _862 * _910;
    float _972 = fma(_842, (*spvDescriptorSet0.vp_c9)._m0[80].x, _730);
    float _974 = _830 + (-0.5);
    int _976 = _930 + 8;
    uint _978 = uint(int(uint(_976) >> uint(2)));
    uint _980 = uint(int(uint(int(_978)) >> uint(2)));
    int _982 = int(_978) & 3;
    float _984 = (*spvDescriptorSet0.vp_c9)._m0[int(_980)][_982];
    int _986 = int(_978) + 1;
    uint _988 = uint(int(uint(_986) >> uint(2)));
    int _990 = _986 & 3;
    float _992 = (*spvDescriptorSet0.vp_c9)._m0[int(_988)][_990];
    float _994 = as_type<float>(_345) * _968;
    float _996 = fma(_922, (*spvDescriptorSet0.vp_c9)._m0[115].x, _970);
    float _998 = -_740;
    float _1000 = _998 + 1.0;
    int _1002 = _964 ? 0 : 1;
    float _1004 = -_974;
    float _1006 = -_684;
    float _1008 = fma(_1004, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1006);
    bool _1010 = _710 != 3;
    float _1012 = trunc(_994);
    float _1014 = precise::max(_1012, 0.0);
    uint _1016 = uint(_1014);
    float _1018 = -_756;
    float _1020 = fma(_800, _1018, _972);
    float _1022 = fma(_830, _1000, _1008);
    int _1024 = ~_1002;
    int _1026 = _1024 + 1;
    int _1028 = _1026 + 1;
    float _1030 = fma(_325, (*spvDescriptorSet0.vp_c9)._m0[116].x, _996);
    int _1032 = abs(_934);
    bool _1034 = !_712;
    int _1036 = _1034 ? 0 : 1;
    out.m_64.x = _1020;
    out.m_64.y = _1022;
    int _1038 = _1028;
    int _1040 = as_type<int>(_1030);
    if (!_966)
    {
        int _1042 = ~_1002;
        int _1044 = _1042 + 1;
        _1038 = _1044;
    }
    int _1046 = _1038;
    int _1048 = abs(_770);
    int _1050 = ~_878;
    int _1052 = _1050 + 1;
    int _1054 = _1052 + 1;
    int _1056 = ~_305;
    int _1058 = _1056 + 1;
    int _1060 = int(_854) + int(_1016);
    int _1062 = _1054;
    if (_1010)
    {
        int _1064 = ~_878;
        int _1066 = _1064 + 1;
        _1062 = _1066;
    }
    int _1068 = _1062;
    int _1070 = _1058 * _1060;
    int _1072 = _1070 + _520;
    int _1074 = abs(_1036);
    float _1076 = float(_1032);
    float _1078 = float(_1046);
    int _1080 = ~_1048;
    int _1082 = _1080 + 1;
    int _1084 = _1082 + 1;
    int _1086 = abs(_1068);
    float _1088 = _1076 * _1078;
    bool _1090 = uint(_1072) >= uint(_305);
    int _1092 = _1084 * as_type<int>(_954);
    int _1094 = ~_1074;
    int _1096 = _1094 + 1;
    int _1098 = _1096 + 1;
    float _1100 = _694 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1102 = !_546;
    int _1104 = _1102 ? 0 : 1;
    int _1106 = _1098 * as_type<int>(_946);
    int _1108 = _1106 + _1092;
    int _1110 = ~_1086;
    int _1112 = _1110 + 1;
    int _1114 = _1112 + 1;
    float _1116 = _692 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1118 = abs(_1104);
    float _1120 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1122 = _1100 + _1120;
    bool _1124 = _710 != 3;
    int _1126 = _1114 * as_type<int>(_984);
    int _1128 = _1126 + _1108;
    bool _1130 = !_1090;
    int _1132 = _1130 ? 0 : (-1);
    float _1134 = in.m_66.x;
    float _1136 = in.m_66.y;
    float _1138 = in.m_66.z;
    bool _1140 = !_1124;
    int _1142 = _1140 ? 0 : (-1);
    float _1144 = _686 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1146 = ~_1060;
    int _1148 = _1146 + _1132;
    int _1150 = _1148 + 1;
    float _1152 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1154 = _1116 + _1152;
    int _1156 = abs(_1142);
    bool _1158 = !_904;
    int _1160 = _1158 ? 0 : 1;
    int _1162 = _305 * _1150;
    int _1164 = _1162 + _520;
    int _1166 = ~_1156;
    int _1168 = _1166 + 1;
    int _1170 = _1168 + 1;
    float _1172 = _1154 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1174 = float(_876);
    float _1176 = _1088 * (-2.0);
    int _1178 = abs(_1160);
    float _1180 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1182 = _1144 + _1180;
    int _1184 = ~_1118;
    int _1186 = _1184 + 1;
    int _1188 = _1186 + 1;
    int _1190 = _1170 * as_type<int>(_992);
    int _1192 = _1190 + _1128;
    bool _1194 = !_420;
    int _1196 = _1194 ? _1164 : (-1);
    float _1198 = fma(_1182, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1172);
    float _1200 = float(_1178);
    int _1202 = _1192 * _1188;
    float _1204 = fma(_806, _1176, _806);
    float _1206 = fma(_1122, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1198);
    float _1208 = fma(_1176, _1134, _1134);
    int _1210 = _1196 * _1118;
    int _1212 = _1210 + _1202;
    float _1214 = _1154 * _1154;
    bool _1216 = _1206 >= 0.0;
    float _1218 = _1200 * _1174;
    float _1220 = fma(_1182, _1182, _1214);
    float _1222 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1224 = fma(_1122, _1122, _1220);
    float _1226 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1228 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1230 = _364 + (-0.5);
    float _1232 = _1030 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1234 = _1226 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1236 = rsqrt(_1224);
    float _1238 = as_type<float>(_1128);
    float _1240 = _1138;
    if (_1216)
    {
        _1238 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1242 = _1238;
    float _1244 = _1222 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1246 = _1228 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1248 = float(_1212);
    if (_1216)
    {
        out.m_55.x = 0.0;
    }
    if (_1216)
    {
        float _1250 = _1242 * 5.0;
        _1040 = as_type<int>(_1250);
    }
    int _1252 = _1040;
    float _1254 = fma(_1230, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1208);
    bool _1256 = !_908;
    int _1258 = _1256 ? 0 : 1;
    out.m_68.x = _1234;
    out.m_68.y = _1244;
    out.m_68.z = _1246;
    out.m_68.w = _1232;
    float _1260 = fma(_1204, _748, _1254);
    int _1262 = abs(_1258);
    if (_1216)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4642 = as_type<float>(_1252);
        out.gl_Position.z = _4642;
    }
    float _1264 = _366 + (-0.5);
    float _1266 = _1154 * _1236;
    out.m_70.x = _1248;
    float _1268 = _1182 * _1236;
    if (_1216)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1270 = -_1266;
    float _1272 = fma(_1270, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1116);
    float _1274 = _1122 * _1236;
    float _1276 = -_1268;
    float _1278 = fma(_1276, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1144);
    float _1280 = _1218 * (-2.0);
    float _1282 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1284 = _1272 + _1282;
    float _1286 = -_1274;
    float _1288 = fma(_1286, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1100);
    float _1290 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1292 = _1278 + _1290;
    float _1294 = fma(_1280, _1136, _1136);
    float _1296 = _1284 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1298 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1300 = _1288 + _1298;
    float _1302 = float(_918);
    float _1304 = -_1266;
    float _1306 = fma(_1304, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1154);
    float _1308 = fma(_1292, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1296);
    float _1310 = float(_1262);
    float _1312 = fma(_832, _1280, _832);
    float _1314 = fma(_1264, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1294);
    float _1316 = fma(_1300, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1308);
    float _1318 = _1260 * 0.15915493667125701904296875;
    float _1320 = _1306 * _1306;
    float _1322 = _682 + _364;
    float _1324 = _1310 * _1302;
    bool _1326 = _1316 >= 0.0;
    float _1328 = -_1268;
    float _1330 = fma(_1328, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1182);
    float _1332 = fma(_1312, _748, _1314);
    float _1334 = in.m_72.x;
    float _1336 = in.m_72.y;
    float _1338 = fma(_1330, _1330, _1320);
    float _1340 = _1322 + (-1.0);
    float _1342 = _1324 * (-2.0);
    float _1344 = -_1274;
    float _1346 = fma(_1344, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1122);
    float _1348 = _682 + (-0.5);
    float _1350 = fma(_1340, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1352 = fma(_1342, _1138, _1138);
    float _1354 = _1332 * 0.15915493667125701904296875;
    float _1356 = fma(_1346, _1346, _1338);
    float _1358 = _1300;
    if (_1326)
    {
        _1240 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1360 = _1240;
    float _1362 = fma(_1348, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1352);
    float _1364 = _1318 * 6.283185482025146484375;
    float _1366 = sin(_1364);
    float _1368 = fma(_1350, _1342, _1350);
    int _1370 = as_type<int>(_1360);
    if (_1326)
    {
        out.m_55.x = 0.0;
    }
    if (_1326)
    {
        float _1372 = _1360 * 5.0;
        _1370 = as_type<int>(_1372);
    }
    int _1374 = _1370;
    float _1376 = fma(_1368, _748, _1362);
    float _1378 = _1318 * 6.283185482025146484375;
    float _1380 = cos(_1378);
    if (_1326)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4851 = as_type<float>(_1374);
        out.gl_Position.z = _4851;
    }
    float _1382 = _1376 * 0.15915493667125701904296875;
    float _1384 = _277 * _1336;
    float _1386 = _1354 * 6.283185482025146484375;
    float _1388 = sin(_1386);
    float _1390 = sqrt(_1356);
    float _1392 = _1354 * 6.283185482025146484375;
    float _1394 = cos(_1392);
    if (_1326)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1396 = _1382 * 6.283185482025146484375;
    float _1398 = cos(_1396);
    float _1400 = _1236 * _1390;
    float _1402 = _1384 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1404 = _275 * _1334;
    float _1406 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _179);
    float _1408 = _1366 * _1388;
    float _1410 = _1402 * _1400;
    float _1412 = _1404 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1414 = _1382 * 6.283185482025146484375;
    float _1416 = sin(_1414);
    float _1418 = _1380 * _1394;
    float _1420 = _1406 * _1410;
    float _1422 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _175);
    float _1424 = _1412 * _1400;
    float _1426 = _1366 * _1394;
    float _1428 = _1380 * _1388;
    float _1430 = _1380 * _1398;
    float _1432 = _1394 * _1398;
    float _1434 = _1366 * _1398;
    float _1436 = _1388 * _1398;
    float _1438 = _1422 * _1424;
    float _1440 = _1430 * _1420;
    float _1442 = _1400 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1444 = _1442 * 0.5;
    float _1446 = fma(_1416, _1418, _1408);
    float _1448 = -_1426;
    float _1450 = fma(_1416, _1428, _1448);
    float _1452 = -_1420;
    float _1454 = _1416 * _1452;
    float _1456 = -_1428;
    float _1458 = fma(_1416, _1426, _1456);
    float _1460 = fma(_1446, _1438, _1440);
    float _1462 = _1434 * _1420;
    float _1464 = fma(_1432, _1438, _1454);
    float _1466 = fma(_1450, _1444, _1460);
    float _1468 = fma(_1458, _1438, _1462);
    float _1470 = fma(_1416, _1408, _1418);
    float _1472 = fma(_1436, _1444, _1464);
    float _1474 = _1466 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1476 = _1466 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1478 = fma(_1470, _1444, _1468);
    float _1480 = _1466 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1482 = fma(_1472, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1474);
    float _1484 = fma(_1472, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1476);
    float _1486 = _1446 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1488 = fma(_1472, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1480);
    float _1490 = fma(_1478, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1482);
    float _1492 = fma(_1478, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1484);
    float _1494 = _1446 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1496 = fma(_1478, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1488);
    float _1498 = _1490 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1500 = _1492 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1502 = _1446 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1504 = _1496 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1506 = _1144 + _1498;
    float _1508 = _1100 + _1500;
    float _1510 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1486);
    float _1512 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1494);
    float _1514 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1516 = _1506 + _1514;
    float _1518 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1520 = _1508 + _1518;
    float _1522 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1502);
    float _1524 = _1430 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1526 = _1516 * _1516;
    float _1528 = _1520 * _1520;
    float _1530 = _1430 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1532 = _1430 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1534 = _1450 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1536 = _1526 + _1528;
    float _1538 = _1450 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1540 = _1116 + _1504;
    float _1542 = _1450 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1544 = sqrt(_1536);
    float _1546 = -_1416;
    float _1548 = fma(_1546, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1524);
    float _1550 = -_1416;
    float _1552 = fma(_1550, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1530);
    float _1554 = -_1416;
    float _1556 = fma(_1554, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1532);
    float _1558 = fma(_1458, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1510);
    float _1560 = fma(_1458, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1512);
    float _1562 = fma(_1436, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1534);
    float _1564 = fma(_1436, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1538);
    float _1566 = fma(_1458, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1522);
    float _1568 = fma(_1436, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1542);
    bool _1570 = _1544 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1572 = _1450;
    float _1574 = _1538;
    float _1576 = _1534;
    float _1578 = _1506;
    float _1580 = _1526;
    if (!_1570)
    {
        _1572 = _1506;
    }
    float _1582 = _1572;
    float _1584 = _1582;
    if (!_1570)
    {
        _1574 = _1528;
    }
    float _1586 = _1574;
    float _1588 = _1586;
    if (!_1570)
    {
        _1576 = _1508;
    }
    float _1590 = _1576;
    float _1592 = _1590;
    if (!_1570)
    {
        _1578 = _1540;
    }
    float _1594 = _1578;
    bool _1596 = !_1570;
    float _1598 = _1594;
    if (!_1596)
    {
        float _1600 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1602 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1604 = _1544 + _1602;
        float _1606 = rsqrt(_1536);
        float _1608 = _1604 * _1600;
        float _1610 = _1540 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1612 = _1608 * 0.15915493667125701904296875;
        float _1614 = _1612 * 6.283185482025146484375;
        float _1616 = sin(_1614);
        float _1618 = _1612 * 6.283185482025146484375;
        float _1620 = cos(_1618);
        float _1622 = fma(_1616, _1610, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1624 = _1606 * _1622;
        float _1626 = fma(_1516, _1624, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1628 = _1620 + (-1.0);
        float _1630 = fma(_1520, _1624, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1632 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1634 = _1626 + _1632;
        float _1636 = _1628 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1638 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1640 = _1630 + _1638;
        float _1642 = _1634 * _1634;
        float _1644 = fma(_1540, _1620, _1636);
        float _1646 = _1640 * _1640;
        _1598 = _1644;
        _1580 = _1642;
        _1588 = _1646;
        _1584 = _1626;
        _1592 = _1630;
    }
    float _1648 = _1598;
    float _1650 = _1580;
    float _1652 = _1588;
    float _1654 = _1584;
    float _1656 = _1592;
    float _1658 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1660 = _1648 + _1658;
    float _1662 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1548);
    float _1664 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1552);
    float _1666 = _179 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1668 = fma(_1660, _1660, _1650);
    float _1670 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1556);
    float _1672 = fma(_1470, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1568);
    float _1674 = _175 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1676 = _1668 + _1652;
    float _1678 = _1666 * _1662;
    float _1680 = _1666 * _1664;
    float _1682 = _1666 * _1670;
    float _1684 = fma(_1470, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1562);
    float _1686 = fma(_1470, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1564);
    float _1688 = sqrt(_1676);
    float _1690 = fma(_1674, _1558, _1678);
    float _1692 = fma(_1674, _1560, _1680);
    float _1694 = fma(_1674, _1566, _1682);
    float _1696 = _1684 + _1690;
    float _1698 = _1686 + _1692;
    float _1700 = _1672 + _1694;
    out.m_74.x = _1696;
    out.m_74.y = _1698;
    out.m_74.z = _1700;
    bool _1702 = _1688 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1704 = isnan(_1688);
    bool _1706 = _1702 || _1704;
    bool _1708 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1710 = _1706 || _1708;
    float _1712 = _1692;
    if (!_1710)
    {
        _1712 = 1.0;
    }
    float _1714 = _1712;
    bool _1716 = !_1710;
    float _1718 = _1714;
    if (!_1716)
    {
        bool _1720 = _1688 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1722 = isnan(_1688);
        bool _1724 = _1720 || _1722;
        bool _1726 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1728 = _1724 || _1726;
        if (!_1728)
        {
            float _1730 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1732 = _1688 + _1730;
            float _1734 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1736 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1734;
            float _1738 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1740 = _1738 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1742 = 1.0 / _1736;
            float _1744 = _1732 * _1742;
            float _1746 = fma(_1744, _1740, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1718 = _1746;
            _1748 = true;
        }
        else
        {
            bool _1750 = _1688 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1752 = isnan(_1688);
            bool _1754 = _1750 || _1752;
            bool _1756 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1758 = _1754 || _1756;
            if (!_1758)
            {
                float _1760 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1762 = _1688 + _1760;
                float _1764 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1766 = _1764 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1768 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1770 = _1768 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1772 = 1.0 / _1766;
                float _1774 = _1762 * _1772;
                float _1776 = fma(_1774, _1770, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1718 = _1776;
                _1748 = true;
            }
            else
            {
                _1718 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1748 = false;
    float _1778 = _1718;
    float _1780 = _1272 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1782 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1784 = _1654 + _1782;
    float _1786 = fma(_1278, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1780);
    float _1788 = _1272 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1790 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1792 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1794 = _1790 || _1792;
    bool _1796 = isnan(0.5);
    bool _1798 = _1794 || _1796;
    float _1800 = fma(_1288, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1786);
    bool _1802 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1804 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1806 = _1802 || _1804;
    bool _1808 = isnan(0.5);
    bool _1810 = _1806 || _1808;
    float _1812 = _1800 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1814 = fma(_1278, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1788);
    float _1816 = 1.0 / _1812;
    float _1818 = fma(_1288, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1814);
    float _1820 = _1818 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1822 = _1820 + _1812;
    float _1824 = fma(_1784, _1778, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1826 = _1784;
    if (_1810)
    {
        _1826 = 1.0;
    }
    float _1828 = _1826;
    float _1830 = _1822 * _1816;
    float _1832 = _1830 * 0.5;
    float _1834 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1836 = _1648 + _1834;
    float _1838 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1840 = fma(_1832, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1838);
    float _1842 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1844 = _1656 + _1842;
    float _1846 = fma(_1836, _1778, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1848 = -_1268;
    float _1850 = fma(_1848, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1824);
    float _1852 = fma(_1844, _1778, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1854 = 1.0 / _1840;
    float _1856 = -_1266;
    float _1858 = fma(_1856, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1846);
    float _1860 = -_1274;
    float _1862 = fma(_1860, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1852);
    float _1864 = _1858;
    float _1866 = _1850;
    float _1868 = _1862;
    float _1870 = _1846;
    float _1872 = _1828;
    if (!_1798)
    {
        float _1874 = _1284 * _1284;
        float _1876 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1878 = -_1100;
        float _1880 = _1878 + _1852;
        float _1882 = -_1144;
        float _1884 = _1882 + _1824;
        float _1886 = fma(_1292, _1292, _1874);
        float _1888 = fma(_1300, _1300, _1886);
        float _1890 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1892 = sqrt(_1888);
        float _1894 = 1.0 / _1400;
        float _1896 = _1890 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1898 = precise::min(_1892, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1900 = _1898 * _1876;
        float _1902 = _1900 * _1894;
        float _1904 = -_1116;
        float _1906 = _1904 + _1846;
        float _1908 = _1896 * _1902;
        float _1910 = _1880 * _1902;
        float _1912 = fma(_1906, _1908, _1272);
        float _1914 = fma(_1884, _1908, _1278);
        float _1916 = fma(_1896, _1910, _1288);
        _1864 = _1912;
        _1866 = _1914;
        _1868 = _1916;
    }
    float _1918 = _1864;
    float _1920 = _1866;
    float _1922 = _1868;
    if (_1810)
    {
        _1358 = 1.0;
    }
    float _1924 = _1358;
    float _1926 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1928 = _1854 * _1926;
    float _1930 = _1924;
    if (!_1810)
    {
        float _1932 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1934 = _1932 * 0.15915493667125701904296875;
        float _1936 = _1934 * 6.283185482025146484375;
        float _1938 = cos(_1936);
        float _1940 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1942 = _1940 * 0.15915493667125701904296875;
        float _1944 = _1934 * 6.283185482025146484375;
        float _1946 = sin(_1944);
        float _1948 = 1.0 / _1938;
        float _1950 = _1942 * 6.283185482025146484375;
        float _1952 = cos(_1950);
        float _1954 = _1946 * _1948;
        float _1956 = _1942 * 6.283185482025146484375;
        float _1958 = sin(_1956);
        float _1960 = _1952 * _1954;
        float _1962 = 1.0 / _1960;
        float _1964 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1966 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1964;
        float _1968 = 1.0 / _1966;
        float _1970 = _1958 * _1962;
        float _1972 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1974 = fma(_1928, _1970, _1972);
        float _1976 = _1974 * _1968;
        float _1978 = precise::clamp(_1976, 0.0, 1.0);
        _1870 = _1934;
        _1872 = _1978;
    }
    float _1980 = _1870;
    float _1982 = _1872;
    float _1984 = _1980;
    if (!_1810)
    {
        float _1986 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1988 = _1986 * 0.15915493667125701904296875;
        float _1990 = _1988 * 6.283185482025146484375;
        float _1992 = cos(_1990);
        float _1994 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1996 = _1994 * 0.15915493667125701904296875;
        float _1998 = _1988 * 6.283185482025146484375;
        float _2000 = sin(_1998);
        float _2002 = 1.0 / _1992;
        float _2004 = _1996 * 6.283185482025146484375;
        float _2006 = cos(_2004);
        float _2008 = _2000 * _2002;
        float _2010 = _1996 * 6.283185482025146484375;
        float _2012 = sin(_2010);
        float _2014 = _2006 * _2008;
        float _2016 = 1.0 / _2014;
        float _2018 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2020 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2018;
        float _2022 = 1.0 / _2020;
        float _2024 = _2012 * _2016;
        float _2026 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2028 = fma(_1928, _2024, _2026);
        float _2030 = _2028 * _2022;
        float _2032 = precise::clamp(_2030, 0.0, 1.0);
        float _2034 = -_2032;
        float _2036 = _2034 + 1.0;
        _1930 = _2036;
    }
    float _2038 = _1930;
    float _2040 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2042 = _1918 + _2040;
    float _2044 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2046 = _1920 + _2044;
    float _2048 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2050 = _1922 + _2048;
    float _2052 = _2042 * _2042;
    float _2054 = fma(_2046, _2046, _2052);
    float _2056 = fma(_2050, _2050, _2054);
    float _2058 = rsqrt(_2056);
    float _2060 = _2058 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2062 = _2046 * _2060;
    float _2064 = _2050 * _2060;
    float _2066 = _2062 * _2062;
    float _2068 = _2064 * _2064;
    float _2070 = _2066 + _2068;
    float _2072 = sqrt(_2070);
    bool _2074 = _2072 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2076 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2078 = _2072 + _2076;
    float _2080 = _2054;
    float _2082 = _2070;
    float _2084 = _2078;
    float _2086 = _2042;
    if (_2074)
    {
        float _2088 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2080 = _2088;
    }
    float _2090 = _2080;
    if (_2074)
    {
        float _2092 = rsqrt(_2070);
        _2082 = _2092;
    }
    float _2094 = _2082;
    float _2096 = _2090;
    float _2098 = _2094;
    if (_2074)
    {
        float _2100 = _2078 * _2090;
        _2084 = _2100;
    }
    float _2102 = _2084;
    if (_2074)
    {
        float _2104 = _2102 * 0.15915493667125701904296875;
        _1984 = _2104;
    }
    float _2106 = _1984;
    float _2108 = _2050;
    float _2110 = _2106;
    if (_2074)
    {
        float _2112 = _2106 * 6.283185482025146484375;
        float _2114 = sin(_2112);
        _2108 = _2114;
    }
    float _2116 = _2108;
    float _2118 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2120 = precise::max(0.0, _2118);
    float _2122 = _1688;
    if (_2074)
    {
        float _2124 = _2106 * 6.283185482025146484375;
        float _2126 = cos(_2124);
        _2122 = _2126;
    }
    float _2128 = _2122;
    float _2130 = -_2060;
    float _2132 = -_2120;
    float _2134 = fma(_2042, _2130, _2132);
    float _2136 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_2074)
    {
        float _2138 = _2134 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2086 = _2138;
    }
    float _2140 = _2086;
    float _2142 = _2140;
    if (!_2074)
    {
        _2110 = _2062;
    }
    float _2144 = _2110;
    float _2146 = fma(_1278, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2148 = sqrt(_2056);
    float _2150 = _2116;
    float _2152 = _2144;
    if (_2074)
    {
        float _2154 = fma(_2116, _2140, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2096 = _2154;
    }
    float _2156 = _2096;
    float _2158 = _2156;
    if (!_2074)
    {
        _2150 = _2064;
    }
    float _2160 = _2150;
    float _2162 = _2160;
    if (_2074)
    {
        float _2164 = _2128 + (-1.0);
        _2142 = _2164;
    }
    float _2166 = _2142;
    float _2168 = _2166;
    if (_2074)
    {
        float _2170 = _2094 * _2156;
        _2136 = _2170;
    }
    float _2172 = _2136;
    if (!_2074)
    {
        _2158 = _2134;
    }
    float _2174 = _2158;
    float _2176 = _2174;
    if (_2074)
    {
        float _2178 = _2166 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2168 = _2178;
    }
    float _2180 = _2168;
    float _2182 = _2180;
    if (_2074)
    {
        float _2184 = _2062 * _2172;
        _2152 = _2184;
    }
    float _2186 = _2152;
    if (!_2074)
    {
        _2098 = _2066;
    }
    float _2188 = _2098;
    float _2190 = _2188;
    if (_2074)
    {
        float _2192 = _2064 * _2172;
        _2162 = _2192;
    }
    float _2194 = _2162;
    if (_2074)
    {
        float _2196 = fma(_2134, _2128, _2180);
        _2176 = _2196;
    }
    float _2198 = _2176;
    if (_2074)
    {
        float _2200 = _2186 * _2186;
        _2190 = _2200;
    }
    float _2202 = _2190;
    float _2204 = _1918 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (!_2074)
    {
        _2182 = _2068;
    }
    float _2206 = _2182;
    float _2208 = _2206;
    if (_2074)
    {
        float _2210 = _2194 * _2194;
        _2208 = _2210;
    }
    float _2212 = _2208;
    float _2214 = fma(_2198, _2198, _2202);
    float _2216 = fma(_1920, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2204);
    float _2218 = floor(_2146);
    float _2220 = _2214 + _2212;
    float _2222 = fma(_1922, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2216);
    float _2224 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2226 = _2222 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2228 = rsqrt(_2220);
    float _2230 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2232 = fma(_2148, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2230);
    float _2234 = precise::clamp(_2232, 0.0, 1.0);
    float _2236 = _2226 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2238 = fma(_1288, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2240 = _1918 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2242 = -_2234;
    float _2244 = _2242 + 1.0;
    float _2246 = -_2236;
    float _2248 = fma(_2246, _2224, 1.0);
    float _2250 = _1918 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2252 = fma(_1920, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2240);
    float _2254 = _1918 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2256 = floor(_2238);
    float _2258 = fma(_1920, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2250);
    float _2260 = fma(_1922, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2252);
    float _2262 = fma(_1920, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2254);
    float _2264 = -_2218;
    float _2266 = _2146 + _2264;
    float _2268 = _2228 * _2186;
    float _2270 = _2228 * _2198;
    float _2272 = fma(_1922, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2258);
    float _2274 = abs(_2244);
    float _2276 = log2(_2274);
    float _2278 = _2268 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2280 = _2228 * _2194;
    float _2282 = _2272 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2284 = _2260 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2286 = -_2278;
    float _2288 = fma(_2270, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2286);
    float _2290 = _2282 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2292 = log2(_2248);
    float _2294 = -_2280;
    float _2296 = fma(_2294, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2288);
    float _2298 = fma(_1922, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2262);
    float _2300 = fma(_2284, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2290);
    float _2302 = _2282 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2304 = fma(_2296, -0.5, 0.5);
    float _2306 = _2298 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2308 = fma(_2226, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2300);
    float _2310 = _2276 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2312 = _2282 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2314 = sqrt(_2304);
    float _2316 = fma(_2306, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2308);
    float _2318 = fma(_2284, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2302);
    float _2320 = fma(_2284, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2312);
    float _2322 = fma(_2296, 0.5, 0.5);
    float _2324 = -_2256;
    float _2326 = _2238 + _2324;
    float _2328 = fma(_2226, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2318);
    float _2330 = fma(_2226, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2320);
    float _2332 = 1.0 / _2316;
    float _2334 = fma(_2322, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2336 = _2270 + 1.0;
    float _2338 = fma(_2306, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2330);
    float _2340 = fma(_2306, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2328);
    float _2342 = fma(_2322, _2334, -0.212114393711090087890625);
    float _2344 = _2292 * 0.693147182464599609375;
    float _2346 = exp2(_2310);
    float2 _6438 = float2(_2266, _2326);
    float _2348 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6438, float2(0.0), isnan(_6438)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6438, float2(0.0), isnan(_6438)), level(0.0)).x;
    float _2350 = fma(_2322, _2342, 1.570728778839111328125);
    float _2352 = _2314 * 0.636619746685028076171875;
    float _2354 = _2344 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2356 = -_2350;
    float _2358 = fma(_2352, _2356, 1.0);
    float _2360 = _2338 * _2332;
    float _2362 = _2340 * _2332;
    float _2364 = fma(_2360, 0.5, 0.5);
    float _2366 = fma(_2362, -0.5, 0.5);
    float _2368 = -_2270;
    float _2370 = fma(_2346, _2336, _2368);
    float3 _6481 = float3(_2364, _2366, _2354);
    float _2372 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6481, float3(0.0), isnan(_6481)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6481, float3(0.0), isnan(_6481)), level(0.0)).x;
    float _2374 = fma(_2370, 0.5, 0.5);
    float3 _6494 = float3(_2364, _2366, _2354);
    float4 _2377 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6494, float3(0.0), isnan(_6494)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6494, float3(0.0), isnan(_6494)), level(0.0)).xyzw;
    float _2379 = _2377.x;
    float _2381 = _2377.y;
    float _2383 = _2377.z;
    float _2385 = _2377.w;
    float2 _6510 = float2(_2358, _2374);
    float3 _2389 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6510, float2(0.0), isnan(_6510)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6510, float2(0.0), isnan(_6510)), level(0.0)).xyz;
    float _2391 = _2389.x;
    float _2393 = _2389.y;
    float _2395 = _2389.z;
    float _2397 = abs(_1928);
    float _2399 = log2(_2397);
    float _2401 = _2282 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2403 = _2276 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2405 = _2148 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2407 = isnan(_2148);
    bool _2409 = _2405 || _2407;
    bool _2411 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2413 = _2409 || _2411;
    float _2415 = fma(_2284, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2401);
    float _2417 = exp2(_2403);
    float _2419 = fma(_2226, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2415);
    float _2421 = in.m_76.x;
    float _2423 = _2338 + _2316;
    float _2425 = fma(_2306, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2419);
    float _2427 = _2399 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    bool _2429 = _1928 <= 8000.0;
    bool _2431 = isnan(_1928);
    bool _2433 = _2429 || _2431;
    bool _2435 = isnan(8000.0);
    bool _2437 = _2433 || _2435;
    float _2439 = float(_2437);
    float _2441 = _2316 * 0.5;
    float _2443 = _2425 + _2316;
    float _2445 = _2423 * 0.5;
    out.gl_Position.x = _2338;
    out.gl_Position.y = _2340;
    out.gl_Position.z = _2425;
    out.gl_Position.w = _2316;
    float _2447 = exp2(_2427);
    float _2449 = _2443 * 0.5;
    float _2451 = -_2417;
    float _2453 = _2451 + 1.0;
    float _2455 = _1982 * _2038;
    float _2457 = _2425;
    float _2459 = _2316;
    float _2461 = _2340;
    float _2463 = _2455;
    if (!_2413)
    {
        _2457 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2465 = _2457;
    float _2467 = fma(_2447, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2469 = precise::clamp(_2467, 0.0, 1.0);
    float _2471 = _2465;
    float _2473 = _2465;
    if (!_2413)
    {
        _2459 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2475 = _2459;
    float _2477 = fma(_2469, -2.0, 3.0);
    float _2479 = _2469 * _2469;
    float _2481 = _2479 * _2477;
    float _2483 = -_2481;
    float _2485 = _2483 + 1.0;
    float _2487 = fma(_2485, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2481);
    float _2489 = fma(_2340, -0.5, _2441);
    float _2491 = _2453 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2493 = _2475;
    float _2495 = _2475;
    if (!_2413)
    {
        _2461 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2497 = _2461;
    float _2499 = _2439 * _2487;
    out.m_78.x = _2445;
    out.m_78.y = _2489;
    out.m_78.z = _2449;
    out.m_78.w = _2316;
    float _2501 = _2499 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2503 = _2455 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2505 = _2497;
    float _2507 = _2497;
    if (!_2413)
    {
        _2463 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2509 = _2463;
    float _2511 = -_2348;
    float _2513 = _2511 + 1.0;
    float _2515 = _2513 * _2501;
    float _2517 = precise::clamp(_2515, 0.0, 1.0);
    float _2519 = -_2517;
    float _2521 = fma(_2519, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2523 = _2521 * _2421;
    float _2525 = _2491 * _2372;
    float _2527 = -_2491;
    float _2529 = _2527 + 1.0;
    float _2531 = _2523 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2533 = _2523;
    float _2535 = _2529;
    float _2537 = _2509;
    float _2539 = _2509;
    if (!_2413)
    {
        _2533 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2541 = _2533;
    float _2543 = _2385 * _2525;
    out.m_80.x = _2531;
    float _2545 = _2395 * _2525;
    float _2547 = fma(_2391, _2543, _2379);
    float _2549 = fma(_2393, _2543, _2381);
    float _2551 = _2385 * _2529;
    float _2553 = fma(_2385, _2545, _2383);
    float _2555 = _2541;
    float _2557 = _2541;
    if (!_2413)
    {
        _2535 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2559 = _2535;
    out.m_82.x = _2547;
    out.m_82.y = _2549;
    out.m_82.z = _2553;
    out.m_82.w = _2551;
    bool _2561 = !_2413;
    float _2563 = _2559;
    float _2565 = _2559;
    if (!_2561)
    {
        bool _2567 = _2148 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2569 = isnan(_2148);
        bool _2571 = _2567 || _2569;
        bool _2573 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2575 = _2571 || _2573;
        if (!_2575)
        {
            float _2577 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2579 = _2148 + _2577;
            float _2581 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2583 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2581;
            float _2585 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2587 = _2585 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2589 = 1.0 / _2583;
            float _2591 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2593 = _2591 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2595 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2597 = _2595 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2599 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2601 = _2599 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2603 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2605 = _2603 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2607 = _2579 * _2589;
            float _2609 = precise::clamp(_2607, 0.0, 1.0);
            float _2611 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2613 = _2611 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2615 = fma(_2609, _2587, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2617 = fma(_2609, _2613, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2619 = fma(_2609, _2593, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2621 = fma(_2609, _2597, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2623 = fma(_2609, _2601, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2625 = fma(_2609, _2605, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2565 = _2619;
            _2507 = _2623;
            _2557 = _2615;
            _2473 = _2621;
            _2495 = _2617;
            _2539 = _2625;
            _2627 = true;
        }
        else
        {
            bool _2629 = _2148 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2631 = isnan(_2148);
            bool _2633 = _2629 || _2631;
            bool _2635 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2637 = _2633 || _2635;
            if (!_2637)
            {
                _2555 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2639 = _2555;
            _2557 = _2639;
            if (!_2637)
            {
                _2563 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2641 = _2563;
            _2565 = _2641;
            if (!_2637)
            {
                _2493 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2643 = _2493;
            _2495 = _2643;
            if (!_2637)
            {
                _2471 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2645 = _2471;
            _2473 = _2645;
            if (!_2637)
            {
                _2505 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2647 = _2505;
            _2507 = _2647;
            if (!_2637)
            {
                _2537 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2649 = _2537;
            bool _2651 = !_2637;
            _2539 = _2649;
            if (!_2651)
            {
                bool _2653 = _2148 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2655 = isnan(_2148);
                bool _2657 = _2653 || _2655;
                bool _2659 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2661 = _2657 || _2659;
                if (!_2661)
                {
                    float _2663 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2665 = _2148 + _2663;
                    float _2667 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2669 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2667;
                    float _2671 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2673 = _2671 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2675 = 1.0 / _2669;
                    float _2677 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2679 = _2677 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2681 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2683 = _2681 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2685 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2687 = _2685 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2689 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2691 = _2689 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2693 = _2665 * _2675;
                    float _2695 = precise::clamp(_2693, 0.0, 1.0);
                    float _2697 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2699 = _2697 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2701 = fma(_2695, _2673, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2703 = fma(_2695, _2699, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2705 = fma(_2695, _2679, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2707 = fma(_2695, _2683, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2709 = fma(_2695, _2687, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2711 = fma(_2695, _2691, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2565 = _2705;
                    _2507 = _2709;
                    _2557 = _2701;
                    _2473 = _2707;
                    _2495 = _2703;
                    _2539 = _2711;
                    _2627 = true;
                }
                else
                {
                    _2565 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2507 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2557 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2473 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2495 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2539 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2627 = false;
    float _2713 = _2565;
    float _2715 = _2507;
    float _2717 = _2557;
    float _2719 = _2473;
    float _2721 = _2495;
    float _2723 = _2539;
    float _2725 = fma(_1698, -0.5, 0.5);
    float _2727 = precise::clamp(_2725, 0.0, 1.0);
    float _2729 = -_2713;
    float _2731 = _2729 + _2715;
    float _2733 = _2503 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2735 = -_2717;
    float _2737 = _2735 + _2719;
    out.m_84.x = 0.0;
    float _2739 = fma(_2727, _2731, _2713);
    float _2741 = fma(_2727, _2737, _2717);
    out.m_55.x = _2733;
    float _2743 = -_2721;
    float _2745 = _2743 + _2723;
    float _2747 = _2739 * 0.586610972881317138671875;
    bool _2749 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2751 = fma(_2727, _2745, _2721);
    float _2753 = fma(_2741, 0.298911988735198974609375, _2747);
    bool _2755 = _1982 > 0.0;
    bool _2757 = isnan(_1982);
    bool _2759 = _2755 || _2757;
    bool _2761 = isnan(0.0);
    bool _2763 = _2759 || _2761;
    float _2765 = fma(_2751, 0.114477999508380889892578125, _2753);
    bool _2767 = _2038 <= 0.0;
    bool _2769 = !_2763;
    bool _2771 = _2767 || _2769;
    float _2773 = -_2765;
    float _2775 = _2741 + _2773;
    float _2777 = -_2765;
    float _2779 = _2739 + _2777;
    float _2781 = -_2765;
    float _2783 = _2751 + _2781;
    float _2785 = fma(_2775, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2765);
    float _2787 = fma(_2779, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2765);
    float _2789 = fma(_2783, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2765);
    bool _2791 = !_2749;
    if (!_2791)
    {
        float _2793 = -_1918;
        float _2795 = _2793 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2797 = -_1920;
        float _2799 = _2797 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2801 = -_1922;
        float _2803 = _2801 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2805 = _2795 * _2795;
        float _2807 = fma(_2799, _2799, _2805);
        float _2809 = fma(_2803, _2803, _2807);
        float _2811 = sqrt(_2809);
        float _2813 = rsqrt(_2809);
        float _2815 = -_2811;
        float _2817 = _2815 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2819 = _2817 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2821 = precise::clamp(_2819, 0.0, 1.0);
        float _2823 = _2799 * _2813;
        float _2825 = _2795 * _2813;
        float _2827 = abs(_2821);
        float _2829 = log2(_2827);
        float _2831 = _2803 * _2813;
        float _2833 = _2823 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2835 = _1698 * _2825;
        float _2837 = -_2825;
        float _2839 = -_2833;
        float _2841 = fma(_2837, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2839);
        float _2843 = fma(_1696, _2823, _2835);
        float _2845 = -_2831;
        float _2847 = fma(_2845, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2841);
        float _2849 = fma(_1700, _2831, _2843);
        float _2851 = precise::clamp(_2849, 0.0, 1.0);
        float _2853 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2855 = _2847 + _2853;
        float _2857 = _2829 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2859 = _2855 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2861 = precise::clamp(_2859, 0.0, 1.0);
        float _2863 = exp2(_2857);
        float _2865 = _2863 * _2861;
        float _2867 = _2851 * _2865;
        float _2869 = _2867 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2871 = _2867 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2873 = _2867 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_84.x = _2869;
        out.m_84.y = _2871;
        out.m_84.z = _2873;
    }
    out.m_86.x = _2785;
    out.m_86.y = _2787;
    out.m_86.z = _2789;
    if (!_2771)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_55.x = 0.0;
    float _2875 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2875;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}


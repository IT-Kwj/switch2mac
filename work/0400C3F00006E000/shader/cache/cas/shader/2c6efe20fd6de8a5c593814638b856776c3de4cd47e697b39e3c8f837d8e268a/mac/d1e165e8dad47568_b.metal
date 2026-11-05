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
    texture2d<float> vp_t_tcb_20 [[id(7)]];
    sampler vp_t_tcb_20Smplr [[id(8)]];
    texture2d<float> vp_t_tcb_24 [[id(9)]];
    sampler vp_t_tcb_24Smplr [[id(10)]];
    texture3d<float> vp_t_tcb_32 [[id(11)]];
    sampler vp_t_tcb_32Smplr [[id(12)]];
    texture3d<float> vp_t_tcb_30 [[id(13)]];
    sampler vp_t_tcb_30Smplr [[id(14)]];
    texture2d<float> vp_t_tcb_1C [[id(15)]];
    sampler vp_t_tcb_1CSmplr [[id(16)]];
    sampler vp_t_tcb_20Smplr_w [[id(17)]];
    sampler vp_t_tcb_24Smplr_w [[id(18)]];
    sampler vp_t_tcb_32Smplr_w [[id(19)]];
    sampler vp_t_tcb_30Smplr_w [[id(20)]];
    sampler vp_t_tcb_1CSmplr_w [[id(21)]];
    constant dm_border_t* dm_border [[id(22)]];
};

struct main0_out
{
    float4 m_76 [[user(locn0)]];
    float4 m_72 [[user(locn1)]];
    float4 m_57 [[user(locn2)]];
    float4 m_96 [[user(locn3)]];
    float4 m_55 [[user(locn4)]];
    float4 m_74 [[user(locn5)]];
    float4 m_88 [[user(locn6)]];
    float4 m_80 [[user(locn7)]];
    float4 m_82 [[user(locn8)]];
    float4 m_94 [[user(locn9)]];
    float4 m_84 [[user(locn10)]];
    float4 m_90 [[user(locn11)]];
    float4 m_92 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_86 [[attribute(0)]];
    float4 m_64 [[attribute(1)]];
    float4 m_66 [[attribute(2)]];
    float4 m_70 [[attribute(3)]];
    float4 m_78 [[attribute(4)]];
    float4 m_50 [[attribute(5)]];
    float4 m_52 [[attribute(6)]];
    float4 m_62 [[attribute(7)]];
    float4 m_68 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2717 = false;
    bool _1838 = false;
    bool _213 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _110 = in.m_50.w;
    float _112 = in.m_52.w;
    float _114 = trunc(_110);
    int _117 = int(_114);
    float _119 = -_112;
    float _121 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_55.y = _121;
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
        out.m_57.x = 0.0;
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
        float _3034 = as_type<float>(_139);
        out.gl_Position.z = _3034;
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
        out.m_57.x = 0.0;
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
        float _3089 = as_type<float>(_165);
        out.gl_Position.z = _3089;
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
        float _195 = in.m_62.x;
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
    bool _221 = _215 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _223 = isnan(_215);
    bool _225 = _221 || _223;
    bool _227 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _229 = _225 || _227;
    float _231 = float(_229);
    float _233 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _235 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _233;
    float _237 = -_231;
    float _239 = _237 + 1.0;
    bool _241 = _215 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _243 = isnan(_215);
    bool _245 = _241 || _243;
    bool _247 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _249 = _245 || _247;
    float _251 = float(_249);
    float _253 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _255 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _253;
    bool _257 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _259 = 1.0 / _235;
    float _261 = _251 * _239;
    float _263 = -_251;
    float _265 = _263 + 1.0;
    float _267 = _219 * _259;
    float _269 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _271 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _269;
    float _273 = fma(_255, _267, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _275 = fma(_271, _267, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _277 = _273 * _261;
    float _279 = _275 * _261;
    float _281 = fma(_265, (*spvDescriptorSet0.vp_c9)._m0[143].x, _277);
    float _283 = fma(_265, (*spvDescriptorSet0.vp_c9)._m0[143].y, _279);
    float _285 = fma(_231, (*spvDescriptorSet0.vp_c9)._m0[144].x, _281);
    float _287 = fma(_231, (*spvDescriptorSet0.vp_c9)._m0[144].y, _283);
    bool _289 = !_257;
    if (!_289)
    {
        float _291 = in.m_62.x;
        float _293 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _295 = _291 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _297 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[11].y, _121);
        float _299 = _297 * _293;
        float _301 = floor(_299);
        float _303 = -_301;
        float _305 = _299 + _303;
        _193 = _305;
    }
    float _307 = _193;
    float _309 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _311 = int(_309);
    float _313 = in.m_62.x;
    float _315 = in.m_62.y;
    float _317 = in.m_50.x;
    float _319 = in.m_50.y;
    float _321 = in.m_50.z;
    float _323 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _325 = int(_323);
    float _327 = float(_311);
    float _329 = 1.0 / _327;
    float _331 = float(uint(_325));
    int _333 = ~_325;
    int _335 = _333 + 1;
    int _337 = ~_325;
    int _339 = _337 + 1;
    float _341 = 1.0 / _331;
    bool _343 = _325 == 0;
    int _345 = _325 + (-1);
    float _347 = _329 * _121;
    float _349 = trunc(_347);
    int _351 = int(_349);
    int _353 = as_type<int>(_341) + (-2);
    float _355 = float(uint(_351));
    float _357 = float(_351);
    float _359 = as_type<float>(_353) * _355;
    float _361 = trunc(_359);
    float _363 = precise::max(_361, 0.0);
    uint _366 = uint(_363);
    int _368 = _335 * int(_366);
    int _370 = _368 + _351;
    float _372 = float(uint(_370));
    float _374 = as_type<float>(_353) * _372;
    float _376 = trunc(_374);
    float _378 = precise::max(_376, 0.0);
    uint _380 = uint(_378);
    int _382 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _384 = _382 != 0;
    bool _386 = !_384;
    float _388 = _386 ? 7.345489978790283203125 : 1.0;
    float _390 = _388 * _313;
    float _392 = floor(_390);
    int _394 = int(_366) + int(_380);
    float _396 = float(_325);
    int _398 = _339 * _394;
    int _400 = _398 + _351;
    bool _402 = _357 >= _396;
    bool _404 = isnan(_357);
    bool _406 = _402 || _404;
    bool _408 = isnan(_396);
    bool _410 = _406 || _408;
    float _412 = float(_410);
    float _414 = _396 * _121;
    bool _416 = uint(_400) >= uint(_325);
    float _418 = trunc(_412);
    int _420 = int(_418);
    float _422 = _414 * _169;
    bool _424 = !_416;
    int _426 = _424 ? 0 : (-1);
    float _428 = -_392;
    float _430 = _390 + _428;
    int _432 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _434 = _432 != 0;
    int _436 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _438 = _436 != 0;
    int _440 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _442 = _440 != 0;
    int _444 = ~_394;
    int _446 = _444 + _426;
    int _448 = _446 + 1;
    float _450 = _430 * _396;
    int _452 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _454 = _452 != 0;
    float _456 = trunc(_422);
    int _458 = int(_456);
    bool _460 = !_438;
    int _462 = _460 ? 0 : 1;
    int _464 = _325 * _448;
    int _466 = _464 + _351;
    bool _468 = !_454;
    int _470 = _468 ? 0 : 1;
    float _472 = in.m_64.x;
    float _474 = in.m_64.y;
    float _476 = in.m_64.z;
    float _478 = in.m_64.w;
    bool _480 = !_434;
    int _482 = _480 ? 0 : 1;
    int _484 = ~_420;
    int _486 = _484 + 1;
    int _488 = _486 + 1;
    float _490 = trunc(_450);
    int _492 = int(_490);
    bool _494 = !_343;
    int _496 = _494 ? _466 : (-1);
    int _498 = abs(_462);
    int _500 = abs(_470);
    int _502 = _496 * _488;
    int _504 = abs(_482);
    float _506 = in.m_66.x;
    float _508 = in.m_66.y;
    float _510 = in.m_66.z;
    float _512 = in.m_66.w;
    int _514 = _420 * _345;
    int _516 = _514 + _502;
    bool _518 = !_442;
    int _520 = _518 ? 0 : 1;
    float _522 = in.m_68.x;
    float _524 = in.m_68.y;
    int _526 = _516 * _498;
    float _528 = in.m_70.x;
    float _530 = in.m_70.y;
    float _532 = in.m_70.z;
    float _534 = in.m_70.w;
    int _536 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _538 = _536 != 0;
    int _540 = _492 * _500;
    int _542 = _540 + _351;
    int _544 = abs(_520);
    int _546 = _458 * _504;
    int _548 = _546 + _526;
    bool _550 = !_538;
    int _552 = _550 ? 0 : 1;
    float _554 = _319 * _474;
    float _556 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _558 = log2(_556);
    int _560 = abs(_552);
    float _562 = fma(_317, _472, _554);
    int _564 = _542 * _544;
    int _566 = _564 + _548;
    float _568 = _315 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _570 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _572 = isnan(0.0);
    bool _574 = _570 || _572;
    bool _576 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _578 = _574 || _576;
    float _580 = _319 * _508;
    int _582 = _492 * _560;
    int _584 = _582 + _566;
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _588 = _586 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _590 = _285 * _522;
    float _592 = fma(_317, _506, _580);
    float _594 = float(uint(_584));
    float _596 = _319 * _530;
    float _598 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _600 = as_type<float>(_353) * _594;
    float _602 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _604 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _606 = 1.0 / _588;
    float _608 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _610 = fma(_317, _528, _596);
    float _612 = fma(_321, _476, _562);
    float _614 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _616 = _598 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _618 = _602 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _620 = trunc(_600);
    float _622 = precise::max(_620, 0.0);
    uint _624 = uint(_622);
    float _626 = _604 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _628 = ~_325;
    int _630 = _628 + 1;
    float _632 = fma(_568, -2.0, _608);
    float _634 = fma(_321, _510, _592);
    float _636 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    out.m_72.x = _616;
    out.m_72.y = _618;
    out.m_72.z = _626;
    out.m_72.w = _614;
    float _638 = _558 * _121;
    float _640 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _642 = _640 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _644 = _313 * 2.0;
    float _646 = fma(_321, _532, _610);
    bool _648 = _313 > 0.5;
    int _650 = _630 * int(_624);
    int _652 = _650 + _584;
    float _654 = 1.0 / _642;
    bool _656 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _658 = isnan(1.0);
    bool _660 = _656 || _658;
    bool _662 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _664 = _660 || _662;
    float _666 = _634 + _512;
    int _668 = ~_325;
    int _670 = _668 + 1;
    float _672 = _646 + _534;
    float _674 = float(uint(_652));
    float _676 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _678 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _676;
    float _680 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _682 = _680 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _684 = exp2(_638);
    float _686 = -_636;
    float _688 = fma(_644, (*spvDescriptorSet0.vp_c9)._m0[77].x, _686);
    float _690 = as_type<float>(_353) * _674;
    float _692 = _682 * _606;
    float _694 = in.m_62.z;
    float _696 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _698 = 1.0 + _696;
    float _700 = _315 * 2.0;
    float _702 = trunc(_690);
    float _704 = precise::max(_702, 0.0);
    uint _706 = uint(_704);
    float _708 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _710 = _678 * _654;
    float _712 = _612 + _478;
    float _714 = fma(_315, (*spvDescriptorSet0.vp_c9)._m0[78].w, _708);
    int _716 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _718 = _716 != 0;
    float _720 = floor(_644);
    float _722 = -_684;
    float _724 = _722 + 1.0;
    float _726 = -_121;
    float _728 = fma(_726, (*spvDescriptorSet0.vp_c9)._m0[76].x, _688);
    float _730 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _732 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[76].y, _632);
    float _734 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].w, _714);
    float _736 = _578 ? _724 : 0.0;
    float _738 = fma(_313, (*spvDescriptorSet0.vp_c9)._m0[78].z, _730);
    float _740 = 1.0 / _698;
    int _742 = int(_624) + int(_706);
    float _744 = _315 + _313;
    float _746 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].z, _738);
    int _748 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _750 = _748 != 0;
    float _752 = _694 * 2.0;
    float _754 = _744 + (-1.0);
    float _756 = _315 + _694;
    bool _758 = _720 >= 0.0;
    bool _760 = isnan(_720);
    bool _762 = _758 || _760;
    bool _764 = isnan(0.0);
    bool _766 = _762 || _764;
    float _768 = floor(_700);
    float _770 = -_185;
    int _772 = _648 ? as_type<int>(_770) : as_type<int>(_185);
    float _774 = _756 + (-1.0);
    bool _776 = _720 > 0.0;
    float _778 = -_746;
    float _780 = _778 + 1.0;
    int _782 = _766 ? 0 : 1;
    float _784 = _672;
    if (_664)
    {
        float _786 = _736 * _740;
        _131 = _786;
    }
    float _788 = _131;
    float _790 = floor(_752);
    float _792 = fma(_774, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _794 = _315 > 0.5;
    int _796 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _798 = _796 != 0;
    float _800 = fma(_754, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _802 = _670 * _742;
    int _804 = _802 + _584;
    int _806 = ~_782;
    int _808 = _806 + 1;
    int _810 = _808 + 1;
    int _812 = _810;
    if (!_776)
    {
        int _814 = ~_782;
        int _816 = _814 + 1;
        _812 = _816;
    }
    int _818 = _812;
    float _820 = -_189;
    int _822 = _794 ? as_type<int>(_820) : as_type<int>(_189);
    bool _824 = _768 >= 0.0;
    bool _826 = isnan(_768);
    bool _828 = _824 || _826;
    bool _830 = isnan(0.0);
    bool _832 = _828 || _830;
    bool _834 = !_718;
    float _836 = _834 ? _185 : as_type<float>(_772);
    bool _838 = uint(_804) >= uint(_325);
    bool _840 = _768 > 0.0;
    float _842 = _836 + 0.5;
    bool _844 = _790 >= 0.0;
    bool _846 = isnan(_790);
    bool _848 = _844 || _846;
    bool _850 = isnan(0.0);
    bool _852 = _848 || _850;
    float _854 = float(uint(_542));
    float _856 = fma(_842, (*spvDescriptorSet0.vp_c9)._m0[80].x, _728);
    bool _858 = !_750;
    float _860 = _858 ? _189 : as_type<float>(_822);
    int _862 = _832 ? 0 : 1;
    float _864 = as_type<float>(_353) * _854;
    bool _866 = !_838;
    int _868 = _866 ? 0 : (-1);
    float _870 = _860 + (-0.5);
    int _872 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _874 = _872 != 0;
    int _876 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _878 = _876 != 0;
    int _880 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _882 = _880 != 0;
    float _884 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _886 = _307 + _884;
    bool _888 = _307 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _890 = isnan(_307);
    bool _892 = _888 || _890;
    bool _894 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _896 = _892 || _894;
    float _898 = float(_896);
    float _900 = -_870;
    float _902 = -_732;
    float _904 = fma(_900, (*spvDescriptorSet0.vp_c9)._m0[80].y, _902);
    int _906 = _852 ? 0 : 1;
    float _908 = fma(_710, _886, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _910 = _790 > 0.0;
    float _912 = trunc(_864);
    float _914 = precise::max(_912, 0.0);
    uint _916 = uint(_914);
    float _918 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _920 = _307 + _918;
    bool _922 = _307 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _924 = isnan(_307);
    bool _926 = _922 || _924;
    bool _928 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _930 = _926 || _928;
    float _932 = float(_930);
    float _934 = -_898;
    float _936 = _934 + 1.0;
    bool _938 = _307 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _940 = isnan(_307);
    bool _942 = _938 || _940;
    bool _944 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _946 = _942 || _944;
    float _948 = float(_946);
    float _950 = fma(_692, _920, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    int _952 = ~_325;
    int _954 = _952 + 1;
    float _956 = _932 * _936;
    int _958 = ~_742;
    int _960 = _958 + _868;
    int _962 = _960 + 1;
    float _964 = -_932;
    float _966 = _964 + 1.0;
    float _968 = -_780;
    float _970 = fma(_836, _968, _856);
    bool _972 = !_874;
    int _974 = _972 ? 0 : 1;
    float _976 = _948 * _966;
    int _978 = _325 * _962;
    int _980 = _978 + _584;
    float _982 = -_948;
    float _984 = _982 + 1.0;
    int _986 = _954 * int(_916);
    int _988 = _986 + _542;
    float _990 = _908 * _976;
    float _992 = -_734;
    float _994 = _992 + 1.0;
    bool _996 = !_343;
    int _998 = _996 ? _980 : (-1);
    float _1000 = fma(_984, (*spvDescriptorSet0.vp_c9)._m0[115].x, _990);
    float _1002 = float(uint(_988));
    float _1004 = fma(_860, _994, _904);
    int _1006 = _998 >> 31;
    float _1008 = fma(_950, _956, _1000);
    int _1010 = abs(_974);
    float _1012 = as_type<float>(_353) * _1002;
    int _1014 = _1006 & 3;
    float _1016 = fma(_898, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1008);
    bool _1018 = !_878;
    int _1020 = _1018 ? 0 : 1;
    float _1022 = trunc(_1012);
    float _1024 = precise::max(_1022, 0.0);
    uint _1026 = uint(_1024);
    int _1028 = _998 + _1014;
    float _1030 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1032 = _712 + _1030;
    int _1034 = abs(_1020);
    out.m_74.x = _970;
    out.m_74.y = _1004;
    int _1036 = _1028 >> 2;
    int _1038 = _1036 << 4;
    int _1040 = _1038 + 368;
    int _1042 = ~_862;
    int _1044 = _1042 + 1;
    int _1046 = _1044 + 1;
    uint _1048 = uint(int(uint(_1040) >> uint(2)));
    uint _1050 = uint(int(uint(int(_1048)) >> uint(2)));
    int _1052 = int(_1048) & 3;
    float _1054 = (*spvDescriptorSet0.vp_c9)._m0[int(_1050)][_1052];
    int _1056 = int(_1048) + 1;
    uint _1058 = uint(int(uint(_1056) >> uint(2)));
    int _1060 = _1056 & 3;
    float _1062 = (*spvDescriptorSet0.vp_c9)._m0[int(_1058)][_1060];
    int _1064 = _1046;
    if (!_840)
    {
        int _1066 = ~_862;
        int _1068 = _1066 + 1;
        _1064 = _1068;
    }
    int _1070 = _1064;
    float _1072 = _1016 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _1074 = _998 & 3;
    bool _1076 = _1074 != 0;
    int _1078 = _998 & 3;
    bool _1080 = _1078 != 0;
    int _1082 = ~_906;
    int _1084 = _1082 + 1;
    int _1086 = _1084 + 1;
    int _1088 = _1086;
    if (!_910)
    {
        int _1090 = ~_906;
        int _1092 = _1090 + 1;
        _1088 = _1092;
    }
    int _1094 = _1088;
    bool _1096 = uint(_1078) > 1u;
    int _1098 = int(_916) + int(_1026);
    float _1100 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1102 = _666 + _1100;
    int _1104 = _1040 + 8;
    uint _1106 = uint(int(uint(_1104) >> uint(2)));
    uint _1108 = uint(int(uint(int(_1106)) >> uint(2)));
    int _1110 = int(_1106) & 3;
    float _1112 = (*spvDescriptorSet0.vp_c9)._m0[int(_1108)][_1110];
    int _1114 = int(_1106) + 1;
    uint _1116 = uint(int(uint(_1114) >> uint(2)));
    int _1118 = _1114 & 3;
    float _1120 = (*spvDescriptorSet0.vp_c9)._m0[int(_1116)][_1118];
    float _1122 = float(_818);
    int _1124 = _1076 ? 0 : 1;
    float _1126 = float(_1094);
    int _1128 = ~_1124;
    int _1130 = _1128 + 1;
    int _1132 = _1130 + 1;
    int _1134 = _1132;
    if (!_1096)
    {
        int _1136 = ~_1124;
        int _1138 = _1136 + 1;
        _1134 = _1138;
    }
    int _1140 = _1134;
    float _1142 = _1102 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1144 = float(_1034);
    float _1146 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1148 = float(_1010);
    float _1150 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1152 = _672 + _1150;
    float _1154 = fma(_1032, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1142);
    bool _1156 = _1078 != 3;
    float _1158 = _1144 * _1122;
    float _1160 = _1148 * _1126;
    float _1162 = fma(_1152, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1154);
    float _1164 = _1146 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1166 = uint(_1078) >= 2u;
    float _1168 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _1170 = ~_325;
    int _1172 = _1170 + 1;
    float _1174 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _1176 = abs(_1140);
    float _1178 = _1168 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1180 = _1166 ? 0 : 1;
    int _1182 = _1172 * _1098;
    int _1184 = _1182 + _542;
    bool _1186 = _1162 >= 0.0;
    float _1188 = _1174 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1190 = ~_1176;
    int _1192 = _1190 + 1;
    int _1194 = _1192 + 1;
    float _1196 = _1160 * (-2.0);
    bool _1198 = !_1080;
    int _1200 = _1198 ? 0 : 1;
    float _1202 = _1158 * (-2.0);
    bool _1204 = _1078 != 3;
    out.m_76.x = _1178;
    out.m_76.y = _1188;
    out.m_76.z = _1164;
    out.m_76.w = _1072;
    int _1206 = ~_1180;
    int _1208 = _1206 + 1;
    int _1210 = _1208 + 1;
    int _1212 = _1210;
    if (_1156)
    {
        int _1214 = ~_1180;
        int _1216 = _1214 + 1;
        _1212 = _1216;
    }
    int _1218 = _1212;
    int _1220 = _1194 * as_type<int>(_1062);
    bool _1222 = uint(_1184) >= uint(_325);
    if (_1186)
    {
        out.m_57.x = 0.0;
    }
    bool _1224 = !_1204;
    int _1226 = _1224 ? 0 : (-1);
    int _1228 = abs(_1200);
    float _1230 = in.m_78.x;
    float _1232 = in.m_78.y;
    float _1234 = in.m_78.z;
    bool _1236 = !_798;
    int _1238 = _1236 ? 0 : 1;
    int _1240 = abs(_1226);
    int _1242 = abs(_1218);
    int _1244 = abs(_1238);
    bool _1246 = !_1222;
    int _1248 = _1246 ? 0 : (-1);
    float _1250 = _1102 * _1102;
    int _1252 = ~_1228;
    int _1254 = _1252 + 1;
    int _1256 = _1254 + 1;
    int _1258 = ~_1098;
    int _1260 = _1258 + _1248;
    int _1262 = _1260 + 1;
    float _1264 = fma(_1032, _1032, _1250);
    int _1266 = ~_1242;
    int _1268 = _1266 + 1;
    int _1270 = _1268 + 1;
    int _1272 = _1256 * as_type<int>(_1054);
    int _1274 = _1272 + _1220;
    int _1276 = _325 * _1262;
    int _1278 = _1276 + _542;
    int _1280 = ~_1240;
    int _1282 = _1280 + 1;
    int _1284 = _1282 + 1;
    float _1286 = fma(_1152, _1152, _1264);
    int _1288 = _1270 * as_type<int>(_1112);
    int _1290 = _1288 + _1274;
    int _1292 = ~_1244;
    int _1294 = _1292 + 1;
    int _1296 = _1294 + 1;
    float _1298 = fma(_1196, _1230, _1230);
    float _1300 = _1264;
    if (_1186)
    {
        _1300 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1302 = _1300;
    int _1304 = _1284 * as_type<int>(_1120);
    int _1306 = _1304 + _1290;
    float _1308 = rsqrt(_1286);
    bool _1310 = !_343;
    int _1312 = _1310 ? _1278 : (-1);
    float _1314 = _590 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1316 = _1306 * _1296;
    float _1318 = fma(_800, _1196, _800);
    float _1320 = _313 + (-0.5);
    float _1322 = fma(_792, _1202, _792);
    int _1324 = _1312 * _1244;
    int _1326 = _1324 + _1316;
    int _1328 = as_type<int>(_1302);
    if (_1186)
    {
        float _1330 = _1302 * 5.0;
        _1328 = as_type<int>(_1330);
    }
    int _1332 = _1328;
    float _1334 = _1314 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _1336 = fma(_1320, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1298);
    float _1338 = float(_1326);
    float _1340 = fma(_1202, _1232, _1232);
    bool _1342 = !_882;
    int _1344 = _1342 ? 0 : 1;
    if (_1186)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4819 = as_type<float>(_1332);
        out.gl_Position.z = _4819;
    }
    float _1346 = _1334 * _1308;
    float _1348 = fma(_1318, _788, _1336);
    float _1350 = _315 + (-0.5);
    out.m_80.x = _1338;
    float _1352 = _1032 * _1346;
    float _1354 = _1102 * _1346;
    int _1356 = abs(_1344);
    if (_1186)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1358 = -_1354;
    float _1360 = _666 + _1358;
    float _1362 = _1152 * _1346;
    float _1364 = -_1352;
    float _1366 = _712 + _1364;
    float _1368 = float(_1070);
    float _1370 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1372 = _1360 + _1370;
    float _1374 = -_1362;
    float _1376 = _672 + _1374;
    float _1378 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1380 = _1366 + _1378;
    float _1382 = _1348 * 0.15915493667125701904296875;
    float _1384 = _1372 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1386 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1388 = _1376 + _1386;
    float _1390 = fma(_1350, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1340);
    float _1392 = -_1354;
    float _1394 = _1102 + _1392;
    float _1396 = fma(_1380, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1384);
    float _1398 = float(_1356);
    float _1400 = -_1352;
    float _1402 = _1032 + _1400;
    float _1404 = _694 + _313;
    float _1406 = fma(_1388, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1396);
    float _1408 = _1394 * _1394;
    float _1410 = _1398 * _1368;
    float _1412 = _1404 + (-1.0);
    bool _1414 = _1406 >= 0.0;
    float _1416 = fma(_1402, _1402, _1408);
    float _1418 = -_1362;
    float _1420 = _1152 + _1418;
    float _1422 = fma(_1322, _788, _1390);
    float _1424 = _1382 * 6.283185482025146484375;
    float _1426 = sin(_1424);
    float _1428 = _1410 * (-2.0);
    float _1430 = fma(_1412, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1432 = _1422 * 0.15915493667125701904296875;
    float _1434 = _694 + (-0.5);
    float _1436 = fma(_1428, _1234, _1234);
    float _1438 = _1382 * 6.283185482025146484375;
    float _1440 = cos(_1438);
    float _1442 = _1430;
    int _1444 = as_type<int>(_1436);
    float _1446 = _1380;
    float _1448 = _1372;
    if (_1414)
    {
        out.m_57.x = 0.0;
    }
    float _1450 = _1432 * 6.283185482025146484375;
    float _1452 = sin(_1450);
    float _1454 = fma(_1420, _1420, _1416);
    float _1456 = fma(_1430, _1428, _1430);
    if (_1414)
    {
        _1442 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1458 = _1442;
    float _1460 = fma(_1434, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1436);
    float _1462 = sqrt(_1454);
    if (_1414)
    {
        float _1464 = _1458 * 5.0;
        _1444 = as_type<int>(_1464);
    }
    int _1466 = _1444;
    float _1468 = fma(_1456, _788, _1460);
    if (_1414)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5018 = as_type<float>(_1466);
        out.gl_Position.z = _5018;
    }
    float _1470 = _1468 * 0.15915493667125701904296875;
    float _1472 = _1432 * 6.283185482025146484375;
    float _1474 = cos(_1472);
    if (_1414)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1476 = _1470 * 6.283185482025146484375;
    float _1478 = cos(_1476);
    float _1480 = _287 * _524;
    float _1482 = _1308 * _1462;
    float _1484 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _189);
    float _1486 = _1426 * _1452;
    float _1488 = _1480 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1490 = _1314 * _1482;
    float _1492 = _1440 * _1452;
    float _1494 = _1470 * 6.283185482025146484375;
    float _1496 = sin(_1494);
    float _1498 = _1488 * _1482;
    float _1500 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _185);
    float _1502 = _1484 * _1498;
    float _1504 = _1440 * _1474;
    float _1506 = _1426 * _1474;
    float _1508 = _1440 * _1478;
    float _1510 = _1474 * _1478;
    float _1512 = _1426 * _1478;
    float _1514 = _1452 * _1478;
    float _1516 = _1500 * _1490;
    float _1518 = _1508 * _1502;
    float _1520 = _1482 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1522 = _1520 * 0.5;
    float _1524 = fma(_1496, _1504, _1486);
    float _1526 = -_1506;
    float _1528 = fma(_1496, _1492, _1526);
    float _1530 = -_1502;
    float _1532 = _1496 * _1530;
    float _1534 = -_1492;
    float _1536 = fma(_1496, _1506, _1534);
    float _1538 = fma(_1524, _1516, _1518);
    float _1540 = _1512 * _1502;
    float _1542 = fma(_1510, _1516, _1532);
    float _1544 = fma(_1496, _1486, _1504);
    float _1546 = fma(_1528, _1522, _1538);
    float _1548 = fma(_1536, _1516, _1540);
    float _1550 = fma(_1514, _1522, _1542);
    float _1552 = _1546 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1554 = _1546 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1556 = fma(_1544, _1522, _1548);
    float _1558 = fma(_1550, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1552);
    float _1560 = fma(_1550, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1554);
    float _1562 = fma(_1556, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1558);
    float _1564 = fma(_1556, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1560);
    float _1566 = _1562 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1568 = _1564 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1570 = _712 + _1566;
    float _1572 = _672 + _1568;
    float _1574 = _1546 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1576 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1578 = _1570 + _1576;
    float _1580 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1582 = _1572 + _1580;
    float _1584 = fma(_1550, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1574);
    float _1586 = _1578 * _1578;
    float _1588 = _1582 * _1582;
    float _1590 = fma(_1556, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1584);
    float _1592 = _1586 + _1588;
    float _1594 = _1590 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1596 = sqrt(_1592);
    float _1598 = _666 + _1594;
    bool _1600 = _1596 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1602 = _1546;
    float _1604 = _1556;
    float _1606 = _1570;
    float _1608 = _1586;
    float _1610 = _1588;
    if (!_1600)
    {
        _1602 = _1570;
    }
    float _1612 = _1602;
    float _1614 = _1612;
    if (!_1600)
    {
        _1604 = _1572;
    }
    float _1616 = _1604;
    float _1618 = _1616;
    if (!_1600)
    {
        _1606 = _1598;
    }
    float _1620 = _1606;
    bool _1622 = !_1600;
    float _1624 = _1620;
    if (!_1622)
    {
        float _1626 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1628 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1630 = _1596 + _1628;
        float _1632 = rsqrt(_1592);
        float _1634 = _1630 * _1626;
        float _1636 = _1598 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1638 = _1634 * 0.15915493667125701904296875;
        float _1640 = _1638 * 6.283185482025146484375;
        float _1642 = sin(_1640);
        float _1644 = _1638 * 6.283185482025146484375;
        float _1646 = cos(_1644);
        float _1648 = fma(_1642, _1636, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1650 = _1632 * _1648;
        float _1652 = _1646 + (-1.0);
        float _1654 = fma(_1578, _1650, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1656 = fma(_1582, _1650, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1658 = _1652 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1660 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1662 = _1654 + _1660;
        float _1664 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1666 = _1656 + _1664;
        float _1668 = fma(_1598, _1646, _1658);
        float _1670 = _1662 * _1662;
        float _1672 = _1666 * _1666;
        _1614 = _1654;
        _1618 = _1656;
        _1624 = _1668;
        _1608 = _1670;
        _1610 = _1672;
    }
    float _1674 = _1614;
    float _1676 = _1618;
    float _1678 = _1624;
    float _1680 = _1608;
    float _1682 = _1610;
    float _1684 = fma(_1674, 6.2500002968590706586837768554688e-05, 0.5);
    float _1686 = fma(_1676, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _5370 = float2(_1684, _1686);
    float3 _1690 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_5370, float2(0.0), isnan(_5370)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_5370, float2(0.0), isnan(_5370)), level(0.0)).xyz;
    float _1692 = _1690.x;
    float _1694 = _1690.y;
    float _1696 = _1690.z;
    float _1698 = _1524 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1700 = _1524 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1702 = _1524 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1704 = _1528 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1706 = fma(_1510, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1698);
    float _1708 = fma(_1510, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1700);
    float _1710 = _1508 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1712 = _1508 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1714 = _1508 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1716 = fma(_1510, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1702);
    float _1718 = -_1496;
    float _1720 = fma(_1718, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1710);
    float _1722 = -_1496;
    float _1724 = fma(_1722, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1712);
    float _1726 = -_1496;
    float _1728 = fma(_1726, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1714);
    float _1730 = _1528 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1732 = _1528 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1734 = fma(_1536, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1706);
    float _1736 = fma(_1536, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1708);
    float _1738 = fma(_1536, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1716);
    float _1740 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1742 = _1678 + _1740;
    float _1744 = fma(_1514, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1704);
    float _1746 = fma(_1514, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1730);
    float _1748 = fma(_1514, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1732);
    float _1750 = fma(_1742, _1742, _1680);
    float _1752 = fma(_1512, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1720);
    float _1754 = fma(_1512, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1724);
    float _1756 = _189 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1758 = fma(_1512, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1728);
    float _1760 = _1750 + _1682;
    float _1762 = _185 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1764 = _1756 * _1752;
    float _1766 = _1756 * _1754;
    float _1768 = _1756 * _1758;
    float _1770 = fma(_1544, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1744);
    float _1772 = sqrt(_1760);
    float _1774 = fma(_1762, _1734, _1764);
    float _1776 = fma(_1544, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1746);
    float _1778 = fma(_1544, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1748);
    float _1780 = fma(_1762, _1736, _1766);
    float _1782 = fma(_1762, _1738, _1768);
    float _1784 = _1770 + _1774;
    float _1786 = _1776 + _1780;
    float _1788 = _1778 + _1782;
    out.m_82.x = _1784;
    out.m_82.y = _1786;
    out.m_82.z = _1788;
    bool _1790 = _1772 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1792 = isnan(_1772);
    bool _1794 = _1790 || _1792;
    bool _1796 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1798 = _1794 || _1796;
    float _1800 = _1762;
    float _1802 = _1674;
    if (!_1798)
    {
        _1800 = 1.0;
    }
    float _1804 = _1800;
    out.m_84.x = _1692;
    out.m_84.y = _1694;
    out.m_84.z = _1696;
    bool _1806 = !_1798;
    float _1808 = _1804;
    if (!_1806)
    {
        bool _1810 = _1772 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1812 = isnan(_1772);
        bool _1814 = _1810 || _1812;
        bool _1816 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1818 = _1814 || _1816;
        if (!_1818)
        {
            float _1820 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1822 = _1772 + _1820;
            float _1824 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1826 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1824;
            float _1828 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1830 = _1828 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1832 = 1.0 / _1826;
            float _1834 = _1822 * _1832;
            float _1836 = fma(_1834, _1830, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1808 = _1836;
            _1838 = true;
        }
        else
        {
            bool _1840 = _1772 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1842 = isnan(_1772);
            bool _1844 = _1840 || _1842;
            bool _1846 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1848 = _1844 || _1846;
            if (!_1848)
            {
                float _1850 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1852 = _1772 + _1850;
                float _1854 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1856 = _1854 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1858 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1860 = _1858 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1862 = 1.0 / _1856;
                float _1864 = _1852 * _1862;
                float _1866 = fma(_1864, _1860, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1808 = _1866;
                _1838 = true;
            }
            else
            {
                _1808 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1838 = false;
    float _1868 = _1808;
    float _1870 = _1360 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1872 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1874 = _1678 + _1872;
    float _1876 = fma(_1366, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1870);
    float _1878 = _1360 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1880 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1882 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1884 = _1880 || _1882;
    bool _1886 = isnan(0.5);
    bool _1888 = _1884 || _1886;
    float _1890 = fma(_1874, _1868, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1892 = fma(_1376, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1876);
    bool _1894 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1896 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1898 = _1894 || _1896;
    bool _1900 = isnan(0.5);
    bool _1902 = _1898 || _1900;
    float _1904 = _1892 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1906 = fma(_1366, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1878);
    float _1908 = -_1354;
    float _1910 = _1908 + _1890;
    float _1912 = 1.0 / _1904;
    float _1914 = fma(_1376, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1906);
    float _1916 = _1914 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1918 = _1916 + _1904;
    float _1920 = _1918 * _1912;
    float _1922 = _1920 * 0.5;
    float _1924 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1926 = _1674 + _1924;
    float _1928 = _1910;
    if (_1902)
    {
        _1802 = 1.0;
    }
    float _1930 = _1802;
    float _1932 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1934 = fma(_1922, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1932);
    float _1936 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1938 = _1676 + _1936;
    float _1940 = fma(_1926, _1868, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1942 = 1.0 / _1934;
    float _1944 = fma(_1938, _1868, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1946 = -_1352;
    float _1948 = _1946 + _1940;
    float _1950 = -_1362;
    float _1952 = _1950 + _1944;
    float _1954 = _1948;
    float _1956 = _1952;
    float _1958 = _1930;
    if (!_1888)
    {
        float _1960 = _1372 * _1372;
        float _1962 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1964 = -_672;
        float _1966 = _1964 + _1944;
        float _1968 = -_666;
        float _1970 = _1968 + _1890;
        float _1972 = fma(_1380, _1380, _1960);
        float _1974 = -_712;
        float _1976 = _1974 + _1940;
        float _1978 = fma(_1388, _1388, _1972);
        float _1980 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1982 = sqrt(_1978);
        float _1984 = 1.0 / _1482;
        float _1986 = _1980 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1988 = precise::min(_1982, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1990 = _1988 * _1962;
        float _1992 = _1990 * _1984;
        float _1994 = _1986 * _1992;
        float _1996 = _1966 * _1992;
        float _1998 = fma(_1970, _1994, _1360);
        float _2000 = fma(_1976, _1994, _1366);
        float _2002 = fma(_1986, _1996, _1376);
        _1928 = _1998;
        _1954 = _2000;
        _1956 = _2002;
        _1446 = _1982;
        _784 = _1996;
    }
    float _2004 = _1928;
    float _2006 = _1954;
    float _2008 = _1956;
    float _2010 = _1446;
    float _2012 = _784;
    float _2014 = _2012;
    float _2016 = _2010;
    if (_1902)
    {
        _2014 = 1.0;
    }
    float _2018 = _2014;
    float _2020 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2022 = _1942 * _2020;
    float _2024 = _2018;
    if (!_1902)
    {
        float _2026 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2028 = _2026 * 0.15915493667125701904296875;
        float _2030 = _2028 * 6.283185482025146484375;
        float _2032 = cos(_2030);
        float _2034 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2036 = _2034 * 0.15915493667125701904296875;
        float _2038 = _2028 * 6.283185482025146484375;
        float _2040 = sin(_2038);
        float _2042 = 1.0 / _2032;
        float _2044 = _2036 * 6.283185482025146484375;
        float _2046 = cos(_2044);
        float _2048 = _2040 * _2042;
        float _2050 = _2036 * 6.283185482025146484375;
        float _2052 = sin(_2050);
        float _2054 = _2046 * _2048;
        float _2056 = 1.0 / _2054;
        float _2058 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2060 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2058;
        float _2062 = 1.0 / _2060;
        float _2064 = _2052 * _2056;
        float _2066 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2068 = fma(_2022, _2064, _2066);
        float _2070 = _2068 * _2062;
        float _2072 = precise::clamp(_2070, 0.0, 1.0);
        _1958 = _2072;
    }
    float _2074 = _1958;
    if (!_1902)
    {
        float _2076 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2078 = _2076 * 0.15915493667125701904296875;
        float _2080 = _2078 * 6.283185482025146484375;
        float _2082 = cos(_2080);
        float _2084 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2086 = _2084 * 0.15915493667125701904296875;
        float _2088 = _2078 * 6.283185482025146484375;
        float _2090 = sin(_2088);
        float _2092 = 1.0 / _2082;
        float _2094 = _2086 * 6.283185482025146484375;
        float _2096 = cos(_2094);
        float _2098 = _2090 * _2092;
        float _2100 = _2086 * 6.283185482025146484375;
        float _2102 = sin(_2100);
        float _2104 = _2096 * _2098;
        float _2106 = 1.0 / _2104;
        float _2108 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2110 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2108;
        float _2112 = 1.0 / _2110;
        float _2114 = _2102 * _2106;
        float _2116 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2118 = fma(_2022, _2114, _2116);
        float _2120 = _2118 * _2112;
        float _2122 = precise::clamp(_2120, 0.0, 1.0);
        float _2124 = -_2122;
        float _2126 = _2124 + 1.0;
        _1448 = _2104;
        _2024 = _2126;
    }
    float _2128 = _1448;
    float _2130 = _2024;
    float _2132 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2134 = _2004 + _2132;
    float _2136 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2138 = _2006 + _2136;
    float _2140 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2142 = _2008 + _2140;
    float _2144 = _2134 * _2134;
    float _2146 = fma(_2138, _2138, _2144);
    float _2148 = fma(_2142, _2142, _2146);
    float _2150 = rsqrt(_2148);
    float _2152 = _2150 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2154 = _2138 * _2152;
    float _2156 = _2142 * _2152;
    float _2158 = _2154 * _2154;
    float _2160 = _2156 * _2156;
    float _2162 = _2158 + _2160;
    float _2164 = sqrt(_2162);
    bool _2166 = _2164 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2168 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2170 = _2164 + _2168;
    float _2172 = _2150;
    float _2174 = _2162;
    float _2176 = _2170;
    float _2178 = _2128;
    float _2180 = _2152;
    if (_2166)
    {
        float _2182 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2172 = _2182;
    }
    float _2184 = _2172;
    if (_2166)
    {
        float _2186 = rsqrt(_2162);
        _2174 = _2186;
    }
    float _2188 = _2174;
    float _2190 = _2188;
    if (_2166)
    {
        float _2192 = _2170 * _2184;
        _2176 = _2192;
    }
    float _2194 = _2176;
    if (_2166)
    {
        float _2196 = _2194 * 0.15915493667125701904296875;
        _2016 = _2196;
    }
    float _2198 = _2016;
    float _2200 = _2184;
    float _2202 = _2198;
    if (_2166)
    {
        float _2204 = _2198 * 6.283185482025146484375;
        float _2206 = sin(_2204);
        _2200 = _2206;
    }
    float _2208 = _2200;
    float _2210 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2212 = precise::max(0.0, _2210);
    float _2214 = _2142;
    float _2216 = _2212;
    if (_2166)
    {
        float _2218 = _2198 * 6.283185482025146484375;
        float _2220 = cos(_2218);
        _2214 = _2220;
    }
    float _2222 = _2214;
    float _2224 = -_2152;
    float _2226 = -_2212;
    float _2228 = fma(_2134, _2224, _2226);
    float _2230 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_2166)
    {
        float _2232 = _2228 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2216 = _2232;
    }
    float _2234 = _2216;
    if (!_2166)
    {
        _2202 = _2154;
    }
    float _2236 = _2202;
    float _2238 = _2208;
    float _2240 = _2236;
    if (_2166)
    {
        float _2242 = fma(_2208, _2234, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2178 = _2242;
    }
    float _2244 = _2178;
    float _2246 = fma(_1366, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2248 = _2244;
    if (!_2166)
    {
        _2238 = _2156;
    }
    float _2250 = _2238;
    float _2252 = sqrt(_2148);
    float _2254 = _2250;
    float _2256 = _2222;
    if (_2166)
    {
        float _2258 = _2222 + (-1.0);
        _2230 = _2258;
    }
    float _2260 = _2230;
    float _2262 = _2260;
    if (_2166)
    {
        float _2264 = _2188 * _2244;
        _2180 = _2264;
    }
    float _2266 = _2180;
    if (!_2166)
    {
        _2248 = _2228;
    }
    float _2268 = _2248;
    float _2270 = _2268;
    if (_2166)
    {
        float _2272 = _2260 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2262 = _2272;
    }
    float _2274 = _2262;
    if (_2166)
    {
        float _2276 = _2154 * _2266;
        _2240 = _2276;
    }
    float _2278 = _2240;
    if (!_2166)
    {
        _2190 = _2158;
    }
    float _2280 = _2190;
    float _2282 = _2280;
    if (_2166)
    {
        float _2284 = _2156 * _2266;
        _2254 = _2284;
    }
    float _2286 = _2254;
    if (_2166)
    {
        float _2288 = fma(_2228, _2222, _2274);
        _2270 = _2288;
    }
    float _2290 = _2270;
    if (_2166)
    {
        float _2292 = _2278 * _2278;
        _2282 = _2292;
    }
    float _2294 = _2282;
    if (!_2166)
    {
        _2256 = _2160;
    }
    float _2296 = _2256;
    float _2298 = _2296;
    if (_2166)
    {
        float _2300 = _2286 * _2286;
        _2298 = _2300;
    }
    float _2302 = _2298;
    float _2304 = _2004 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2306 = fma(_2290, _2290, _2294);
    float _2308 = floor(_2246);
    float _2310 = _2306 + _2302;
    float _2312 = fma(_2006, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2304);
    float _2314 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2316 = fma(_2252, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2314);
    float _2318 = precise::clamp(_2316, 0.0, 1.0);
    float _2320 = fma(_1376, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2322 = fma(_2008, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2312);
    float _2324 = rsqrt(_2310);
    float _2326 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2328 = -_2318;
    float _2330 = _2328 + 1.0;
    float _2332 = _2322 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2334 = _2004 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2336 = _2332 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2338 = abs(_2330);
    float _2340 = log2(_2338);
    float _2342 = _2004 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2344 = -_2336;
    float _2346 = fma(_2344, _2326, 1.0);
    float _2348 = _2004 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2350 = fma(_2006, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2342);
    float _2352 = fma(_2006, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2334);
    float _2354 = _2324 * _2278;
    float _2356 = _2324 * _2290;
    float _2358 = _2324 * _2286;
    float _2360 = fma(_2006, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2348);
    float _2362 = fma(_2008, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2350);
    float _2364 = _2354 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2366 = floor(_2320);
    float _2368 = fma(_2008, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2360);
    float _2370 = _2362 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2372 = -_2364;
    float _2374 = fma(_2356, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2372);
    float _2376 = fma(_2008, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2352);
    float _2378 = _2368 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2380 = _2370 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2382 = -_2358;
    float _2384 = fma(_2382, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2374);
    float _2386 = _2340 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2388 = log2(_2346);
    float _2390 = fma(_2378, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2380);
    float _2392 = fma(_2384, -0.5, 0.5);
    float _2394 = -_2308;
    float _2396 = _2246 + _2394;
    float _2398 = fma(_2332, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2390);
    float _2400 = fma(_2384, 0.5, 0.5);
    float _2402 = _2370 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2404 = exp2(_2386);
    float _2406 = _2376 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2408 = _2370 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2410 = -_2366;
    float _2412 = _2320 + _2410;
    float _2414 = fma(_2400, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2416 = fma(_2406, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2398);
    float _2418 = fma(_2378, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2402);
    float _2420 = fma(_2378, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2408);
    float _2422 = sqrt(_2392);
    float _2424 = _2356 + 1.0;
    float _2426 = fma(_2332, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2418);
    float _2428 = fma(_2332, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2420);
    float _2430 = fma(_2400, _2414, -0.212114393711090087890625);
    float _2432 = _2388 * 0.693147182464599609375;
    float _2434 = fma(_2406, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2426);
    float _2436 = 1.0 / _2416;
    float _2438 = -_2356;
    float _2440 = fma(_2404, _2424, _2438);
    float _2442 = fma(_2406, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2428);
    float _2444 = fma(_2400, _2430, 1.570728778839111328125);
    float2 _6621 = float2(_2396, _2412);
    float _2446 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6621, float2(0.0), isnan(_6621)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6621, float2(0.0), isnan(_6621)), level(0.0)).x;
    float _2448 = _2432 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2450 = fma(_2440, 0.5, 0.5);
    float _2452 = _2422 * 0.636619746685028076171875;
    float _2454 = -_2444;
    float _2456 = fma(_2452, _2454, 1.0);
    float _2458 = _2434 * _2436;
    float _2460 = _2442 * _2436;
    float _2462 = fma(_2458, 0.5, 0.5);
    float _2464 = fma(_2460, -0.5, 0.5);
    float3 _6654 = float3(_2462, _2464, _2448);
    float _2466 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6654, float3(0.0), isnan(_6654)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6654, float3(0.0), isnan(_6654)), level(0.0)).x;
    float3 _6665 = float3(_2462, _2464, _2448);
    float4 _2469 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6665, float3(0.0), isnan(_6665)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6665, float3(0.0), isnan(_6665)), level(0.0)).xyzw;
    float _2471 = _2469.x;
    float _2473 = _2469.y;
    float _2475 = _2469.z;
    float _2477 = _2469.w;
    float2 _6681 = float2(_2456, _2450);
    float3 _2479 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6681, float2(0.0), isnan(_6681)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6681, float2(0.0), isnan(_6681)), level(0.0)).xyz;
    float _2481 = _2479.x;
    float _2483 = _2479.y;
    float _2485 = _2479.z;
    float _2487 = abs(_2022);
    float _2489 = log2(_2487);
    float _2491 = _2370 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2493 = _2252 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2495 = isnan(_2252);
    bool _2497 = _2493 || _2495;
    bool _2499 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2501 = _2497 || _2499;
    float _2503 = fma(_2378, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2491);
    float _2505 = _2340 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2507 = _2022 <= 8000.0;
    bool _2509 = isnan(_2022);
    bool _2511 = _2507 || _2509;
    bool _2513 = isnan(8000.0);
    bool _2515 = _2511 || _2513;
    float _2517 = float(_2515);
    float _2519 = fma(_2332, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2503);
    float _2521 = in.m_86.x;
    float _2523 = exp2(_2505);
    float _2525 = fma(_2406, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2519);
    float _2527 = _2416 * 0.5;
    float _2529 = _2489 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    out.gl_Position.x = _2434;
    out.gl_Position.y = _2442;
    out.gl_Position.z = _2525;
    out.gl_Position.w = _2416;
    float _2531 = exp2(_2529);
    float _2533 = -_2523;
    float _2535 = _2533 + 1.0;
    float _2537 = fma(_2442, -0.5, _2527);
    float _2539 = _2535 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2541 = _2442;
    float _2543 = _2525;
    float _2545 = _2416;
    float _2547 = _2539;
    if (!_2501)
    {
        _2541 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2549 = _2541;
    float _2551 = fma(_2531, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2553 = precise::clamp(_2551, 0.0, 1.0);
    float _2555 = _2525 + _2416;
    float _2557 = _2549;
    float _2559 = _2549;
    if (!_2501)
    {
        _2543 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2561 = _2543;
    float _2563 = fma(_2553, -2.0, 3.0);
    float _2565 = _2553 * _2553;
    float _2567 = _2555 * 0.5;
    float _2569 = _2565 * _2563;
    float _2571 = -_2569;
    float _2573 = _2571 + 1.0;
    float _2575 = fma(_2573, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2569);
    float _2577 = _2434 + _2416;
    float _2579 = -_2539;
    float _2581 = _2579 + 1.0;
    float _2583 = _2517 * _2575;
    float _2585 = _2577 * 0.5;
    float _2587 = _2561;
    float _2589 = _2561;
    if (!_2501)
    {
        _2545 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2591 = _2545;
    float _2593 = _2583 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_88.x = _2585;
    out.m_88.y = _2537;
    out.m_88.z = _2567;
    out.m_88.w = _2416;
    float _2595 = -_2446;
    float _2597 = _2595 + 1.0;
    float _2599 = _2597 * _2593;
    float _2601 = precise::clamp(_2599, 0.0, 1.0);
    float _2603 = -_2601;
    float _2605 = fma(_2603, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2607 = _2605 * _2521;
    float _2609 = _2539 * _2466;
    float _2611 = _2477 * _2581;
    float _2613 = _2074 * _2130;
    float _2615 = _2607;
    float _2617 = _2613;
    float _2619 = _2591;
    float _2621 = _2591;
    if (!_2501)
    {
        _2547 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2623 = _2547;
    float _2625 = _2477 * _2609;
    float _2627 = _2485 * _2609;
    float _2629 = fma(_2481, _2625, _2471);
    float _2631 = fma(_2483, _2625, _2473);
    float _2633 = _2607 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2635 = fma(_2477, _2627, _2475);
    float _2637 = _2613 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2639 = _2623;
    float _2641 = _2623;
    if (!_2501)
    {
        _2615 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2643 = _2615;
    out.m_90.x = _2633;
    float _2645 = _2643;
    float _2647 = _2643;
    if (!_2501)
    {
        _2617 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2649 = _2617;
    out.m_92.x = _2629;
    out.m_92.y = _2631;
    out.m_92.z = _2635;
    out.m_92.w = _2611;
    bool _2651 = !_2501;
    float _2653 = _2649;
    float _2655 = _2649;
    if (!_2651)
    {
        bool _2657 = _2252 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2659 = isnan(_2252);
        bool _2661 = _2657 || _2659;
        bool _2663 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2665 = _2661 || _2663;
        if (!_2665)
        {
            float _2667 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2669 = _2252 + _2667;
            float _2671 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2673 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2671;
            float _2675 = 1.0 / _2673;
            float _2677 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2679 = _2677 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2681 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2683 = _2681 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2685 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2687 = _2685 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2689 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2691 = _2689 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2693 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2695 = _2693 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2697 = _2669 * _2675;
            float _2699 = precise::clamp(_2697, 0.0, 1.0);
            float _2701 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2703 = _2701 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2705 = fma(_2699, _2679, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2707 = fma(_2699, _2703, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2709 = fma(_2699, _2683, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2711 = fma(_2699, _2687, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2713 = fma(_2699, _2691, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2715 = fma(_2699, _2695, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2647 = _2707;
            _2559 = _2713;
            _2641 = _2705;
            _2589 = _2711;
            _2621 = _2709;
            _2655 = _2715;
            _2717 = true;
        }
        else
        {
            bool _2719 = _2252 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2721 = isnan(_2252);
            bool _2723 = _2719 || _2721;
            bool _2725 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2727 = _2723 || _2725;
            if (!_2727)
            {
                _2639 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2729 = _2639;
            _2641 = _2729;
            if (!_2727)
            {
                _2645 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2731 = _2645;
            _2647 = _2731;
            if (!_2727)
            {
                _2619 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2733 = _2619;
            _2621 = _2733;
            if (!_2727)
            {
                _2587 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2735 = _2587;
            _2589 = _2735;
            if (!_2727)
            {
                _2557 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2737 = _2557;
            _2559 = _2737;
            if (!_2727)
            {
                _2653 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2739 = _2653;
            bool _2741 = !_2727;
            _2655 = _2739;
            if (!_2741)
            {
                bool _2743 = _2252 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2745 = isnan(_2252);
                bool _2747 = _2743 || _2745;
                bool _2749 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2751 = _2747 || _2749;
                if (!_2751)
                {
                    float _2753 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2755 = _2252 + _2753;
                    float _2757 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2759 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2757;
                    float _2761 = 1.0 / _2759;
                    float _2763 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2765 = _2763 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2767 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2769 = _2767 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2771 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2773 = _2771 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2775 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2777 = _2775 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2779 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2781 = _2779 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2783 = _2755 * _2761;
                    float _2785 = precise::clamp(_2783, 0.0, 1.0);
                    float _2787 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2789 = _2787 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2791 = fma(_2785, _2765, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2793 = fma(_2785, _2789, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2795 = fma(_2785, _2769, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2797 = fma(_2785, _2773, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2799 = fma(_2785, _2777, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2801 = fma(_2785, _2781, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2647 = _2793;
                    _2559 = _2799;
                    _2641 = _2791;
                    _2589 = _2797;
                    _2621 = _2795;
                    _2655 = _2801;
                    _2717 = true;
                }
                else
                {
                    _2647 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2559 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2641 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2589 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2621 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2655 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2717 = false;
    float _2803 = _2647;
    float _2805 = _2559;
    float _2807 = _2641;
    float _2809 = _2589;
    float _2811 = _2621;
    float _2813 = _2655;
    float _2815 = fma(_1786, -0.5, 0.5);
    float _2817 = precise::clamp(_2815, 0.0, 1.0);
    float _2819 = -_2803;
    float _2821 = _2819 + _2805;
    float _2823 = -_2807;
    float _2825 = _2823 + _2809;
    out.m_94.x = 0.0;
    float _2827 = fma(_2817, _2821, _2803);
    float _2829 = -_2811;
    float _2831 = _2829 + _2813;
    float _2833 = fma(_2817, _2825, _2807);
    float _2835 = _2827 * 0.586610972881317138671875;
    bool _2837 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2839 = fma(_2817, _2831, _2811);
    float _2841 = _2637 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2843 = fma(_2833, 0.298911988735198974609375, _2835);
    bool _2845 = _2074 > 0.0;
    bool _2847 = isnan(_2074);
    bool _2849 = _2845 || _2847;
    bool _2851 = isnan(0.0);
    bool _2853 = _2849 || _2851;
    float _2855 = fma(_2839, 0.114477999508380889892578125, _2843);
    out.m_57.x = _2841;
    bool _2857 = _2130 <= 0.0;
    bool _2859 = !_2853;
    bool _2861 = _2857 || _2859;
    float _2863 = -_2855;
    float _2865 = _2833 + _2863;
    float _2867 = -_2855;
    float _2869 = _2827 + _2867;
    float _2871 = -_2855;
    float _2873 = _2839 + _2871;
    float _2875 = fma(_2865, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2855);
    float _2877 = fma(_2869, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2855);
    float _2879 = fma(_2873, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2855);
    bool _2881 = !_2837;
    if (!_2881)
    {
        float _2883 = -_2004;
        float _2885 = _2883 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2887 = -_2006;
        float _2889 = _2887 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2891 = -_2008;
        float _2893 = _2891 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2895 = _2885 * _2885;
        float _2897 = fma(_2889, _2889, _2895);
        float _2899 = fma(_2893, _2893, _2897);
        float _2901 = sqrt(_2899);
        float _2903 = rsqrt(_2899);
        float _2905 = -_2901;
        float _2907 = _2905 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2909 = _2907 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2911 = precise::clamp(_2909, 0.0, 1.0);
        float _2913 = _2889 * _2903;
        float _2915 = _2885 * _2903;
        float _2917 = abs(_2911);
        float _2919 = log2(_2917);
        float _2921 = _2893 * _2903;
        float _2923 = _2913 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2925 = _1786 * _2915;
        float _2927 = -_2915;
        float _2929 = -_2923;
        float _2931 = fma(_2927, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2929);
        float _2933 = fma(_1784, _2913, _2925);
        float _2935 = -_2921;
        float _2937 = fma(_2935, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2931);
        float _2939 = fma(_1788, _2921, _2933);
        float _2941 = precise::clamp(_2939, 0.0, 1.0);
        float _2943 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2945 = _2937 + _2943;
        float _2947 = _2919 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2949 = _2945 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2951 = precise::clamp(_2949, 0.0, 1.0);
        float _2953 = exp2(_2947);
        float _2955 = _2953 * _2951;
        float _2957 = _2941 * _2955;
        float _2959 = _2957 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2961 = _2957 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2963 = _2957 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_94.x = _2959;
        out.m_94.y = _2961;
        out.m_94.z = _2963;
    }
    out.m_96.x = _2875;
    out.m_96.y = _2877;
    out.m_96.z = _2879;
    if (!_2861)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_57.x = 0.0;
    float _2965 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2965;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2717 = false;
    bool _1838 = false;
    bool _213 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _110 = in.m_50.w;
    float _112 = in.m_52.w;
    float _114 = trunc(_110);
    int _117 = int(_114);
    float _119 = -_112;
    float _121 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_55.y = _121;
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
        out.m_57.x = 0.0;
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
        float _3034 = as_type<float>(_139);
        out.gl_Position.z = _3034;
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
        out.m_57.x = 0.0;
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
        float _3089 = as_type<float>(_165);
        out.gl_Position.z = _3089;
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
        float _195 = in.m_62.x;
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
    bool _221 = _215 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _223 = isnan(_215);
    bool _225 = _221 || _223;
    bool _227 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _229 = _225 || _227;
    float _231 = float(_229);
    float _233 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _235 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _233;
    float _237 = -_231;
    float _239 = _237 + 1.0;
    bool _241 = _215 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _243 = isnan(_215);
    bool _245 = _241 || _243;
    bool _247 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _249 = _245 || _247;
    float _251 = float(_249);
    float _253 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _255 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _253;
    bool _257 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _259 = 1.0 / _235;
    float _261 = _251 * _239;
    float _263 = -_251;
    float _265 = _263 + 1.0;
    float _267 = _219 * _259;
    float _269 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _271 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _269;
    float _273 = fma(_255, _267, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _275 = fma(_271, _267, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _277 = _273 * _261;
    float _279 = _275 * _261;
    float _281 = fma(_265, (*spvDescriptorSet0.vp_c9)._m0[143].x, _277);
    float _283 = fma(_265, (*spvDescriptorSet0.vp_c9)._m0[143].y, _279);
    float _285 = fma(_231, (*spvDescriptorSet0.vp_c9)._m0[144].x, _281);
    float _287 = fma(_231, (*spvDescriptorSet0.vp_c9)._m0[144].y, _283);
    bool _289 = !_257;
    if (!_289)
    {
        float _291 = in.m_62.x;
        float _293 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _295 = _291 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _297 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[11].y, _121);
        float _299 = _297 * _293;
        float _301 = floor(_299);
        float _303 = -_301;
        float _305 = _299 + _303;
        _193 = _305;
    }
    float _307 = _193;
    float _309 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _311 = int(_309);
    float _313 = in.m_62.x;
    float _315 = in.m_62.y;
    float _317 = in.m_50.x;
    float _319 = in.m_50.y;
    float _321 = in.m_50.z;
    float _323 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _325 = int(_323);
    float _327 = float(_311);
    float _329 = 1.0 / _327;
    float _331 = float(uint(_325));
    int _333 = ~_325;
    int _335 = _333 + 1;
    int _337 = ~_325;
    int _339 = _337 + 1;
    float _341 = 1.0 / _331;
    bool _343 = _325 == 0;
    int _345 = _325 + (-1);
    float _347 = _329 * _121;
    float _349 = trunc(_347);
    int _351 = int(_349);
    int _353 = as_type<int>(_341) + (-2);
    float _355 = float(uint(_351));
    float _357 = float(_351);
    float _359 = as_type<float>(_353) * _355;
    float _361 = trunc(_359);
    float _363 = precise::max(_361, 0.0);
    uint _366 = uint(_363);
    int _368 = _335 * int(_366);
    int _370 = _368 + _351;
    float _372 = float(uint(_370));
    float _374 = as_type<float>(_353) * _372;
    float _376 = trunc(_374);
    float _378 = precise::max(_376, 0.0);
    uint _380 = uint(_378);
    int _382 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _384 = _382 != 0;
    bool _386 = !_384;
    float _388 = _386 ? 7.345489978790283203125 : 1.0;
    float _390 = _388 * _313;
    float _392 = floor(_390);
    int _394 = int(_366) + int(_380);
    float _396 = float(_325);
    int _398 = _339 * _394;
    int _400 = _398 + _351;
    bool _402 = _357 >= _396;
    bool _404 = isnan(_357);
    bool _406 = _402 || _404;
    bool _408 = isnan(_396);
    bool _410 = _406 || _408;
    float _412 = float(_410);
    float _414 = _396 * _121;
    bool _416 = uint(_400) >= uint(_325);
    float _418 = trunc(_412);
    int _420 = int(_418);
    float _422 = _414 * _169;
    bool _424 = !_416;
    int _426 = _424 ? 0 : (-1);
    float _428 = -_392;
    float _430 = _390 + _428;
    int _432 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _434 = _432 != 0;
    int _436 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _438 = _436 != 0;
    int _440 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _442 = _440 != 0;
    int _444 = ~_394;
    int _446 = _444 + _426;
    int _448 = _446 + 1;
    float _450 = _430 * _396;
    int _452 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _454 = _452 != 0;
    float _456 = trunc(_422);
    int _458 = int(_456);
    bool _460 = !_438;
    int _462 = _460 ? 0 : 1;
    int _464 = _325 * _448;
    int _466 = _464 + _351;
    bool _468 = !_454;
    int _470 = _468 ? 0 : 1;
    float _472 = in.m_64.x;
    float _474 = in.m_64.y;
    float _476 = in.m_64.z;
    float _478 = in.m_64.w;
    bool _480 = !_434;
    int _482 = _480 ? 0 : 1;
    int _484 = ~_420;
    int _486 = _484 + 1;
    int _488 = _486 + 1;
    float _490 = trunc(_450);
    int _492 = int(_490);
    bool _494 = !_343;
    int _496 = _494 ? _466 : (-1);
    int _498 = abs(_462);
    int _500 = abs(_470);
    int _502 = _496 * _488;
    int _504 = abs(_482);
    float _506 = in.m_66.x;
    float _508 = in.m_66.y;
    float _510 = in.m_66.z;
    float _512 = in.m_66.w;
    int _514 = _420 * _345;
    int _516 = _514 + _502;
    bool _518 = !_442;
    int _520 = _518 ? 0 : 1;
    float _522 = in.m_68.x;
    float _524 = in.m_68.y;
    int _526 = _516 * _498;
    float _528 = in.m_70.x;
    float _530 = in.m_70.y;
    float _532 = in.m_70.z;
    float _534 = in.m_70.w;
    int _536 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _538 = _536 != 0;
    int _540 = _492 * _500;
    int _542 = _540 + _351;
    int _544 = abs(_520);
    int _546 = _458 * _504;
    int _548 = _546 + _526;
    bool _550 = !_538;
    int _552 = _550 ? 0 : 1;
    float _554 = _319 * _474;
    float _556 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _558 = log2(_556);
    int _560 = abs(_552);
    float _562 = fma(_317, _472, _554);
    int _564 = _542 * _544;
    int _566 = _564 + _548;
    float _568 = _315 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _570 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _572 = isnan(0.0);
    bool _574 = _570 || _572;
    bool _576 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _578 = _574 || _576;
    float _580 = _319 * _508;
    int _582 = _492 * _560;
    int _584 = _582 + _566;
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _588 = _586 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _590 = _285 * _522;
    float _592 = fma(_317, _506, _580);
    float _594 = float(uint(_584));
    float _596 = _319 * _530;
    float _598 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _600 = as_type<float>(_353) * _594;
    float _602 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _604 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _606 = 1.0 / _588;
    float _608 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _610 = fma(_317, _528, _596);
    float _612 = fma(_321, _476, _562);
    float _614 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _616 = _598 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _618 = _602 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _620 = trunc(_600);
    float _622 = precise::max(_620, 0.0);
    uint _624 = uint(_622);
    float _626 = _604 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _628 = ~_325;
    int _630 = _628 + 1;
    float _632 = fma(_568, -2.0, _608);
    float _634 = fma(_321, _510, _592);
    float _636 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    out.m_72.x = _616;
    out.m_72.y = _618;
    out.m_72.z = _626;
    out.m_72.w = _614;
    float _638 = _558 * _121;
    float _640 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _642 = _640 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _644 = _313 * 2.0;
    float _646 = fma(_321, _532, _610);
    bool _648 = _313 > 0.5;
    int _650 = _630 * int(_624);
    int _652 = _650 + _584;
    float _654 = 1.0 / _642;
    bool _656 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _658 = isnan(1.0);
    bool _660 = _656 || _658;
    bool _662 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _664 = _660 || _662;
    float _666 = _634 + _512;
    int _668 = ~_325;
    int _670 = _668 + 1;
    float _672 = _646 + _534;
    float _674 = float(uint(_652));
    float _676 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _678 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _676;
    float _680 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _682 = _680 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _684 = exp2(_638);
    float _686 = -_636;
    float _688 = fma(_644, (*spvDescriptorSet0.vp_c9)._m0[77].x, _686);
    float _690 = as_type<float>(_353) * _674;
    float _692 = _682 * _606;
    float _694 = in.m_62.z;
    float _696 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _698 = 1.0 + _696;
    float _700 = _315 * 2.0;
    float _702 = trunc(_690);
    float _704 = precise::max(_702, 0.0);
    uint _706 = uint(_704);
    float _708 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _710 = _678 * _654;
    float _712 = _612 + _478;
    float _714 = fma(_315, (*spvDescriptorSet0.vp_c9)._m0[78].w, _708);
    int _716 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _718 = _716 != 0;
    float _720 = floor(_644);
    float _722 = -_684;
    float _724 = _722 + 1.0;
    float _726 = -_121;
    float _728 = fma(_726, (*spvDescriptorSet0.vp_c9)._m0[76].x, _688);
    float _730 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _732 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[76].y, _632);
    float _734 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].w, _714);
    float _736 = _578 ? _724 : 0.0;
    float _738 = fma(_313, (*spvDescriptorSet0.vp_c9)._m0[78].z, _730);
    float _740 = 1.0 / _698;
    int _742 = int(_624) + int(_706);
    float _744 = _315 + _313;
    float _746 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].z, _738);
    int _748 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _750 = _748 != 0;
    float _752 = _694 * 2.0;
    float _754 = _744 + (-1.0);
    float _756 = _315 + _694;
    bool _758 = _720 >= 0.0;
    bool _760 = isnan(_720);
    bool _762 = _758 || _760;
    bool _764 = isnan(0.0);
    bool _766 = _762 || _764;
    float _768 = floor(_700);
    float _770 = -_185;
    int _772 = _648 ? as_type<int>(_770) : as_type<int>(_185);
    float _774 = _756 + (-1.0);
    bool _776 = _720 > 0.0;
    float _778 = -_746;
    float _780 = _778 + 1.0;
    int _782 = _766 ? 0 : 1;
    float _784 = _672;
    if (_664)
    {
        float _786 = _736 * _740;
        _131 = _786;
    }
    float _788 = _131;
    float _790 = floor(_752);
    float _792 = fma(_774, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _794 = _315 > 0.5;
    int _796 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _798 = _796 != 0;
    float _800 = fma(_754, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _802 = _670 * _742;
    int _804 = _802 + _584;
    int _806 = ~_782;
    int _808 = _806 + 1;
    int _810 = _808 + 1;
    int _812 = _810;
    if (!_776)
    {
        int _814 = ~_782;
        int _816 = _814 + 1;
        _812 = _816;
    }
    int _818 = _812;
    float _820 = -_189;
    int _822 = _794 ? as_type<int>(_820) : as_type<int>(_189);
    bool _824 = _768 >= 0.0;
    bool _826 = isnan(_768);
    bool _828 = _824 || _826;
    bool _830 = isnan(0.0);
    bool _832 = _828 || _830;
    bool _834 = !_718;
    float _836 = _834 ? _185 : as_type<float>(_772);
    bool _838 = uint(_804) >= uint(_325);
    bool _840 = _768 > 0.0;
    float _842 = _836 + 0.5;
    bool _844 = _790 >= 0.0;
    bool _846 = isnan(_790);
    bool _848 = _844 || _846;
    bool _850 = isnan(0.0);
    bool _852 = _848 || _850;
    float _854 = float(uint(_542));
    float _856 = fma(_842, (*spvDescriptorSet0.vp_c9)._m0[80].x, _728);
    bool _858 = !_750;
    float _860 = _858 ? _189 : as_type<float>(_822);
    int _862 = _832 ? 0 : 1;
    float _864 = as_type<float>(_353) * _854;
    bool _866 = !_838;
    int _868 = _866 ? 0 : (-1);
    float _870 = _860 + (-0.5);
    int _872 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _874 = _872 != 0;
    int _876 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _878 = _876 != 0;
    int _880 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _882 = _880 != 0;
    float _884 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _886 = _307 + _884;
    bool _888 = _307 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _890 = isnan(_307);
    bool _892 = _888 || _890;
    bool _894 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _896 = _892 || _894;
    float _898 = float(_896);
    float _900 = -_870;
    float _902 = -_732;
    float _904 = fma(_900, (*spvDescriptorSet0.vp_c9)._m0[80].y, _902);
    int _906 = _852 ? 0 : 1;
    float _908 = fma(_710, _886, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _910 = _790 > 0.0;
    float _912 = trunc(_864);
    float _914 = precise::max(_912, 0.0);
    uint _916 = uint(_914);
    float _918 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _920 = _307 + _918;
    bool _922 = _307 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _924 = isnan(_307);
    bool _926 = _922 || _924;
    bool _928 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _930 = _926 || _928;
    float _932 = float(_930);
    float _934 = -_898;
    float _936 = _934 + 1.0;
    bool _938 = _307 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _940 = isnan(_307);
    bool _942 = _938 || _940;
    bool _944 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _946 = _942 || _944;
    float _948 = float(_946);
    float _950 = fma(_692, _920, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    int _952 = ~_325;
    int _954 = _952 + 1;
    float _956 = _932 * _936;
    int _958 = ~_742;
    int _960 = _958 + _868;
    int _962 = _960 + 1;
    float _964 = -_932;
    float _966 = _964 + 1.0;
    float _968 = -_780;
    float _970 = fma(_836, _968, _856);
    bool _972 = !_874;
    int _974 = _972 ? 0 : 1;
    float _976 = _948 * _966;
    int _978 = _325 * _962;
    int _980 = _978 + _584;
    float _982 = -_948;
    float _984 = _982 + 1.0;
    int _986 = _954 * int(_916);
    int _988 = _986 + _542;
    float _990 = _908 * _976;
    float _992 = -_734;
    float _994 = _992 + 1.0;
    bool _996 = !_343;
    int _998 = _996 ? _980 : (-1);
    float _1000 = fma(_984, (*spvDescriptorSet0.vp_c9)._m0[115].x, _990);
    float _1002 = float(uint(_988));
    float _1004 = fma(_860, _994, _904);
    int _1006 = _998 >> 31;
    float _1008 = fma(_950, _956, _1000);
    int _1010 = abs(_974);
    float _1012 = as_type<float>(_353) * _1002;
    int _1014 = _1006 & 3;
    float _1016 = fma(_898, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1008);
    bool _1018 = !_878;
    int _1020 = _1018 ? 0 : 1;
    float _1022 = trunc(_1012);
    float _1024 = precise::max(_1022, 0.0);
    uint _1026 = uint(_1024);
    int _1028 = _998 + _1014;
    float _1030 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1032 = _712 + _1030;
    int _1034 = abs(_1020);
    out.m_74.x = _970;
    out.m_74.y = _1004;
    int _1036 = _1028 >> 2;
    int _1038 = _1036 << 4;
    int _1040 = _1038 + 368;
    int _1042 = ~_862;
    int _1044 = _1042 + 1;
    int _1046 = _1044 + 1;
    uint _1048 = uint(int(uint(_1040) >> uint(2)));
    uint _1050 = uint(int(uint(int(_1048)) >> uint(2)));
    int _1052 = int(_1048) & 3;
    float _1054 = (*spvDescriptorSet0.vp_c9)._m0[int(_1050)][_1052];
    int _1056 = int(_1048) + 1;
    uint _1058 = uint(int(uint(_1056) >> uint(2)));
    int _1060 = _1056 & 3;
    float _1062 = (*spvDescriptorSet0.vp_c9)._m0[int(_1058)][_1060];
    int _1064 = _1046;
    if (!_840)
    {
        int _1066 = ~_862;
        int _1068 = _1066 + 1;
        _1064 = _1068;
    }
    int _1070 = _1064;
    float _1072 = _1016 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _1074 = _998 & 3;
    bool _1076 = _1074 != 0;
    int _1078 = _998 & 3;
    bool _1080 = _1078 != 0;
    int _1082 = ~_906;
    int _1084 = _1082 + 1;
    int _1086 = _1084 + 1;
    int _1088 = _1086;
    if (!_910)
    {
        int _1090 = ~_906;
        int _1092 = _1090 + 1;
        _1088 = _1092;
    }
    int _1094 = _1088;
    bool _1096 = uint(_1078) > 1u;
    int _1098 = int(_916) + int(_1026);
    float _1100 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1102 = _666 + _1100;
    int _1104 = _1040 + 8;
    uint _1106 = uint(int(uint(_1104) >> uint(2)));
    uint _1108 = uint(int(uint(int(_1106)) >> uint(2)));
    int _1110 = int(_1106) & 3;
    float _1112 = (*spvDescriptorSet0.vp_c9)._m0[int(_1108)][_1110];
    int _1114 = int(_1106) + 1;
    uint _1116 = uint(int(uint(_1114) >> uint(2)));
    int _1118 = _1114 & 3;
    float _1120 = (*spvDescriptorSet0.vp_c9)._m0[int(_1116)][_1118];
    float _1122 = float(_818);
    int _1124 = _1076 ? 0 : 1;
    float _1126 = float(_1094);
    int _1128 = ~_1124;
    int _1130 = _1128 + 1;
    int _1132 = _1130 + 1;
    int _1134 = _1132;
    if (!_1096)
    {
        int _1136 = ~_1124;
        int _1138 = _1136 + 1;
        _1134 = _1138;
    }
    int _1140 = _1134;
    float _1142 = _1102 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1144 = float(_1034);
    float _1146 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1148 = float(_1010);
    float _1150 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1152 = _672 + _1150;
    float _1154 = fma(_1032, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1142);
    bool _1156 = _1078 != 3;
    float _1158 = _1144 * _1122;
    float _1160 = _1148 * _1126;
    float _1162 = fma(_1152, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1154);
    float _1164 = _1146 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1166 = uint(_1078) >= 2u;
    float _1168 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _1170 = ~_325;
    int _1172 = _1170 + 1;
    float _1174 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _1176 = abs(_1140);
    float _1178 = _1168 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1180 = _1166 ? 0 : 1;
    int _1182 = _1172 * _1098;
    int _1184 = _1182 + _542;
    bool _1186 = _1162 >= 0.0;
    float _1188 = _1174 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1190 = ~_1176;
    int _1192 = _1190 + 1;
    int _1194 = _1192 + 1;
    float _1196 = _1160 * (-2.0);
    bool _1198 = !_1080;
    int _1200 = _1198 ? 0 : 1;
    float _1202 = _1158 * (-2.0);
    bool _1204 = _1078 != 3;
    out.m_76.x = _1178;
    out.m_76.y = _1188;
    out.m_76.z = _1164;
    out.m_76.w = _1072;
    int _1206 = ~_1180;
    int _1208 = _1206 + 1;
    int _1210 = _1208 + 1;
    int _1212 = _1210;
    if (_1156)
    {
        int _1214 = ~_1180;
        int _1216 = _1214 + 1;
        _1212 = _1216;
    }
    int _1218 = _1212;
    int _1220 = _1194 * as_type<int>(_1062);
    bool _1222 = uint(_1184) >= uint(_325);
    if (_1186)
    {
        out.m_57.x = 0.0;
    }
    bool _1224 = !_1204;
    int _1226 = _1224 ? 0 : (-1);
    int _1228 = abs(_1200);
    float _1230 = in.m_78.x;
    float _1232 = in.m_78.y;
    float _1234 = in.m_78.z;
    bool _1236 = !_798;
    int _1238 = _1236 ? 0 : 1;
    int _1240 = abs(_1226);
    int _1242 = abs(_1218);
    int _1244 = abs(_1238);
    bool _1246 = !_1222;
    int _1248 = _1246 ? 0 : (-1);
    float _1250 = _1102 * _1102;
    int _1252 = ~_1228;
    int _1254 = _1252 + 1;
    int _1256 = _1254 + 1;
    int _1258 = ~_1098;
    int _1260 = _1258 + _1248;
    int _1262 = _1260 + 1;
    float _1264 = fma(_1032, _1032, _1250);
    int _1266 = ~_1242;
    int _1268 = _1266 + 1;
    int _1270 = _1268 + 1;
    int _1272 = _1256 * as_type<int>(_1054);
    int _1274 = _1272 + _1220;
    int _1276 = _325 * _1262;
    int _1278 = _1276 + _542;
    int _1280 = ~_1240;
    int _1282 = _1280 + 1;
    int _1284 = _1282 + 1;
    float _1286 = fma(_1152, _1152, _1264);
    int _1288 = _1270 * as_type<int>(_1112);
    int _1290 = _1288 + _1274;
    int _1292 = ~_1244;
    int _1294 = _1292 + 1;
    int _1296 = _1294 + 1;
    float _1298 = fma(_1196, _1230, _1230);
    float _1300 = _1264;
    if (_1186)
    {
        _1300 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1302 = _1300;
    int _1304 = _1284 * as_type<int>(_1120);
    int _1306 = _1304 + _1290;
    float _1308 = rsqrt(_1286);
    bool _1310 = !_343;
    int _1312 = _1310 ? _1278 : (-1);
    float _1314 = _590 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1316 = _1306 * _1296;
    float _1318 = fma(_800, _1196, _800);
    float _1320 = _313 + (-0.5);
    float _1322 = fma(_792, _1202, _792);
    int _1324 = _1312 * _1244;
    int _1326 = _1324 + _1316;
    int _1328 = as_type<int>(_1302);
    if (_1186)
    {
        float _1330 = _1302 * 5.0;
        _1328 = as_type<int>(_1330);
    }
    int _1332 = _1328;
    float _1334 = _1314 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _1336 = fma(_1320, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1298);
    float _1338 = float(_1326);
    float _1340 = fma(_1202, _1232, _1232);
    bool _1342 = !_882;
    int _1344 = _1342 ? 0 : 1;
    if (_1186)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4819 = as_type<float>(_1332);
        out.gl_Position.z = _4819;
    }
    float _1346 = _1334 * _1308;
    float _1348 = fma(_1318, _788, _1336);
    float _1350 = _315 + (-0.5);
    out.m_80.x = _1338;
    float _1352 = _1032 * _1346;
    float _1354 = _1102 * _1346;
    int _1356 = abs(_1344);
    if (_1186)
    {
        return out;
    }
    float _1358 = -_1354;
    float _1360 = _666 + _1358;
    float _1362 = _1152 * _1346;
    float _1364 = -_1352;
    float _1366 = _712 + _1364;
    float _1368 = float(_1070);
    float _1370 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1372 = _1360 + _1370;
    float _1374 = -_1362;
    float _1376 = _672 + _1374;
    float _1378 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1380 = _1366 + _1378;
    float _1382 = _1348 * 0.15915493667125701904296875;
    float _1384 = _1372 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1386 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1388 = _1376 + _1386;
    float _1390 = fma(_1350, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1340);
    float _1392 = -_1354;
    float _1394 = _1102 + _1392;
    float _1396 = fma(_1380, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1384);
    float _1398 = float(_1356);
    float _1400 = -_1352;
    float _1402 = _1032 + _1400;
    float _1404 = _694 + _313;
    float _1406 = fma(_1388, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1396);
    float _1408 = _1394 * _1394;
    float _1410 = _1398 * _1368;
    float _1412 = _1404 + (-1.0);
    bool _1414 = _1406 >= 0.0;
    float _1416 = fma(_1402, _1402, _1408);
    float _1418 = -_1362;
    float _1420 = _1152 + _1418;
    float _1422 = fma(_1322, _788, _1390);
    float _1424 = _1382 * 6.283185482025146484375;
    float _1426 = sin(_1424);
    float _1428 = _1410 * (-2.0);
    float _1430 = fma(_1412, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1432 = _1422 * 0.15915493667125701904296875;
    float _1434 = _694 + (-0.5);
    float _1436 = fma(_1428, _1234, _1234);
    float _1438 = _1382 * 6.283185482025146484375;
    float _1440 = cos(_1438);
    float _1442 = _1430;
    int _1444 = as_type<int>(_1436);
    float _1446 = _1380;
    float _1448 = _1372;
    if (_1414)
    {
        out.m_57.x = 0.0;
    }
    float _1450 = _1432 * 6.283185482025146484375;
    float _1452 = sin(_1450);
    float _1454 = fma(_1420, _1420, _1416);
    float _1456 = fma(_1430, _1428, _1430);
    if (_1414)
    {
        _1442 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1458 = _1442;
    float _1460 = fma(_1434, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1436);
    float _1462 = sqrt(_1454);
    if (_1414)
    {
        float _1464 = _1458 * 5.0;
        _1444 = as_type<int>(_1464);
    }
    int _1466 = _1444;
    float _1468 = fma(_1456, _788, _1460);
    if (_1414)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5018 = as_type<float>(_1466);
        out.gl_Position.z = _5018;
    }
    float _1470 = _1468 * 0.15915493667125701904296875;
    float _1472 = _1432 * 6.283185482025146484375;
    float _1474 = cos(_1472);
    if (_1414)
    {
        return out;
    }
    float _1476 = _1470 * 6.283185482025146484375;
    float _1478 = cos(_1476);
    float _1480 = _287 * _524;
    float _1482 = _1308 * _1462;
    float _1484 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _189);
    float _1486 = _1426 * _1452;
    float _1488 = _1480 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1490 = _1314 * _1482;
    float _1492 = _1440 * _1452;
    float _1494 = _1470 * 6.283185482025146484375;
    float _1496 = sin(_1494);
    float _1498 = _1488 * _1482;
    float _1500 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _185);
    float _1502 = _1484 * _1498;
    float _1504 = _1440 * _1474;
    float _1506 = _1426 * _1474;
    float _1508 = _1440 * _1478;
    float _1510 = _1474 * _1478;
    float _1512 = _1426 * _1478;
    float _1514 = _1452 * _1478;
    float _1516 = _1500 * _1490;
    float _1518 = _1508 * _1502;
    float _1520 = _1482 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1522 = _1520 * 0.5;
    float _1524 = fma(_1496, _1504, _1486);
    float _1526 = -_1506;
    float _1528 = fma(_1496, _1492, _1526);
    float _1530 = -_1502;
    float _1532 = _1496 * _1530;
    float _1534 = -_1492;
    float _1536 = fma(_1496, _1506, _1534);
    float _1538 = fma(_1524, _1516, _1518);
    float _1540 = _1512 * _1502;
    float _1542 = fma(_1510, _1516, _1532);
    float _1544 = fma(_1496, _1486, _1504);
    float _1546 = fma(_1528, _1522, _1538);
    float _1548 = fma(_1536, _1516, _1540);
    float _1550 = fma(_1514, _1522, _1542);
    float _1552 = _1546 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1554 = _1546 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1556 = fma(_1544, _1522, _1548);
    float _1558 = fma(_1550, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1552);
    float _1560 = fma(_1550, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1554);
    float _1562 = fma(_1556, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1558);
    float _1564 = fma(_1556, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1560);
    float _1566 = _1562 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1568 = _1564 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1570 = _712 + _1566;
    float _1572 = _672 + _1568;
    float _1574 = _1546 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1576 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1578 = _1570 + _1576;
    float _1580 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1582 = _1572 + _1580;
    float _1584 = fma(_1550, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1574);
    float _1586 = _1578 * _1578;
    float _1588 = _1582 * _1582;
    float _1590 = fma(_1556, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1584);
    float _1592 = _1586 + _1588;
    float _1594 = _1590 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1596 = sqrt(_1592);
    float _1598 = _666 + _1594;
    bool _1600 = _1596 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1602 = _1546;
    float _1604 = _1556;
    float _1606 = _1570;
    float _1608 = _1586;
    float _1610 = _1588;
    if (!_1600)
    {
        _1602 = _1570;
    }
    float _1612 = _1602;
    float _1614 = _1612;
    if (!_1600)
    {
        _1604 = _1572;
    }
    float _1616 = _1604;
    float _1618 = _1616;
    if (!_1600)
    {
        _1606 = _1598;
    }
    float _1620 = _1606;
    bool _1622 = !_1600;
    float _1624 = _1620;
    if (!_1622)
    {
        float _1626 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1628 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1630 = _1596 + _1628;
        float _1632 = rsqrt(_1592);
        float _1634 = _1630 * _1626;
        float _1636 = _1598 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1638 = _1634 * 0.15915493667125701904296875;
        float _1640 = _1638 * 6.283185482025146484375;
        float _1642 = sin(_1640);
        float _1644 = _1638 * 6.283185482025146484375;
        float _1646 = cos(_1644);
        float _1648 = fma(_1642, _1636, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1650 = _1632 * _1648;
        float _1652 = _1646 + (-1.0);
        float _1654 = fma(_1578, _1650, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1656 = fma(_1582, _1650, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1658 = _1652 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1660 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1662 = _1654 + _1660;
        float _1664 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1666 = _1656 + _1664;
        float _1668 = fma(_1598, _1646, _1658);
        float _1670 = _1662 * _1662;
        float _1672 = _1666 * _1666;
        _1614 = _1654;
        _1618 = _1656;
        _1624 = _1668;
        _1608 = _1670;
        _1610 = _1672;
    }
    float _1674 = _1614;
    float _1676 = _1618;
    float _1678 = _1624;
    float _1680 = _1608;
    float _1682 = _1610;
    float _1684 = fma(_1674, 6.2500002968590706586837768554688e-05, 0.5);
    float _1686 = fma(_1676, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _5370 = float2(_1684, _1686);
    float3 _1690 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_5370, float2(0.0), isnan(_5370)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_5370, float2(0.0), isnan(_5370)), level(0.0)).xyz;
    float _1692 = _1690.x;
    float _1694 = _1690.y;
    float _1696 = _1690.z;
    float _1698 = _1524 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1700 = _1524 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1702 = _1524 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1704 = _1528 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1706 = fma(_1510, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1698);
    float _1708 = fma(_1510, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1700);
    float _1710 = _1508 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1712 = _1508 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1714 = _1508 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1716 = fma(_1510, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1702);
    float _1718 = -_1496;
    float _1720 = fma(_1718, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1710);
    float _1722 = -_1496;
    float _1724 = fma(_1722, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1712);
    float _1726 = -_1496;
    float _1728 = fma(_1726, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1714);
    float _1730 = _1528 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1732 = _1528 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1734 = fma(_1536, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1706);
    float _1736 = fma(_1536, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1708);
    float _1738 = fma(_1536, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1716);
    float _1740 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1742 = _1678 + _1740;
    float _1744 = fma(_1514, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1704);
    float _1746 = fma(_1514, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1730);
    float _1748 = fma(_1514, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1732);
    float _1750 = fma(_1742, _1742, _1680);
    float _1752 = fma(_1512, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1720);
    float _1754 = fma(_1512, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1724);
    float _1756 = _189 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1758 = fma(_1512, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1728);
    float _1760 = _1750 + _1682;
    float _1762 = _185 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1764 = _1756 * _1752;
    float _1766 = _1756 * _1754;
    float _1768 = _1756 * _1758;
    float _1770 = fma(_1544, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1744);
    float _1772 = sqrt(_1760);
    float _1774 = fma(_1762, _1734, _1764);
    float _1776 = fma(_1544, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1746);
    float _1778 = fma(_1544, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1748);
    float _1780 = fma(_1762, _1736, _1766);
    float _1782 = fma(_1762, _1738, _1768);
    float _1784 = _1770 + _1774;
    float _1786 = _1776 + _1780;
    float _1788 = _1778 + _1782;
    out.m_82.x = _1784;
    out.m_82.y = _1786;
    out.m_82.z = _1788;
    bool _1790 = _1772 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1792 = isnan(_1772);
    bool _1794 = _1790 || _1792;
    bool _1796 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1798 = _1794 || _1796;
    float _1800 = _1762;
    float _1802 = _1674;
    if (!_1798)
    {
        _1800 = 1.0;
    }
    float _1804 = _1800;
    out.m_84.x = _1692;
    out.m_84.y = _1694;
    out.m_84.z = _1696;
    bool _1806 = !_1798;
    float _1808 = _1804;
    if (!_1806)
    {
        bool _1810 = _1772 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1812 = isnan(_1772);
        bool _1814 = _1810 || _1812;
        bool _1816 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1818 = _1814 || _1816;
        if (!_1818)
        {
            float _1820 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1822 = _1772 + _1820;
            float _1824 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1826 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1824;
            float _1828 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1830 = _1828 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1832 = 1.0 / _1826;
            float _1834 = _1822 * _1832;
            float _1836 = fma(_1834, _1830, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1808 = _1836;
            _1838 = true;
        }
        else
        {
            bool _1840 = _1772 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1842 = isnan(_1772);
            bool _1844 = _1840 || _1842;
            bool _1846 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1848 = _1844 || _1846;
            if (!_1848)
            {
                float _1850 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1852 = _1772 + _1850;
                float _1854 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1856 = _1854 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1858 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1860 = _1858 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1862 = 1.0 / _1856;
                float _1864 = _1852 * _1862;
                float _1866 = fma(_1864, _1860, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1808 = _1866;
                _1838 = true;
            }
            else
            {
                _1808 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1838 = false;
    float _1868 = _1808;
    float _1870 = _1360 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1872 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1874 = _1678 + _1872;
    float _1876 = fma(_1366, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1870);
    float _1878 = _1360 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1880 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1882 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1884 = _1880 || _1882;
    bool _1886 = isnan(0.5);
    bool _1888 = _1884 || _1886;
    float _1890 = fma(_1874, _1868, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1892 = fma(_1376, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1876);
    bool _1894 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1896 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1898 = _1894 || _1896;
    bool _1900 = isnan(0.5);
    bool _1902 = _1898 || _1900;
    float _1904 = _1892 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1906 = fma(_1366, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1878);
    float _1908 = -_1354;
    float _1910 = _1908 + _1890;
    float _1912 = 1.0 / _1904;
    float _1914 = fma(_1376, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1906);
    float _1916 = _1914 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1918 = _1916 + _1904;
    float _1920 = _1918 * _1912;
    float _1922 = _1920 * 0.5;
    float _1924 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1926 = _1674 + _1924;
    float _1928 = _1910;
    if (_1902)
    {
        _1802 = 1.0;
    }
    float _1930 = _1802;
    float _1932 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1934 = fma(_1922, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1932);
    float _1936 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1938 = _1676 + _1936;
    float _1940 = fma(_1926, _1868, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1942 = 1.0 / _1934;
    float _1944 = fma(_1938, _1868, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1946 = -_1352;
    float _1948 = _1946 + _1940;
    float _1950 = -_1362;
    float _1952 = _1950 + _1944;
    float _1954 = _1948;
    float _1956 = _1952;
    float _1958 = _1930;
    if (!_1888)
    {
        float _1960 = _1372 * _1372;
        float _1962 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1964 = -_672;
        float _1966 = _1964 + _1944;
        float _1968 = -_666;
        float _1970 = _1968 + _1890;
        float _1972 = fma(_1380, _1380, _1960);
        float _1974 = -_712;
        float _1976 = _1974 + _1940;
        float _1978 = fma(_1388, _1388, _1972);
        float _1980 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1982 = sqrt(_1978);
        float _1984 = 1.0 / _1482;
        float _1986 = _1980 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1988 = precise::min(_1982, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1990 = _1988 * _1962;
        float _1992 = _1990 * _1984;
        float _1994 = _1986 * _1992;
        float _1996 = _1966 * _1992;
        float _1998 = fma(_1970, _1994, _1360);
        float _2000 = fma(_1976, _1994, _1366);
        float _2002 = fma(_1986, _1996, _1376);
        _1928 = _1998;
        _1954 = _2000;
        _1956 = _2002;
        _1446 = _1982;
        _784 = _1996;
    }
    float _2004 = _1928;
    float _2006 = _1954;
    float _2008 = _1956;
    float _2010 = _1446;
    float _2012 = _784;
    float _2014 = _2012;
    float _2016 = _2010;
    if (_1902)
    {
        _2014 = 1.0;
    }
    float _2018 = _2014;
    float _2020 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2022 = _1942 * _2020;
    float _2024 = _2018;
    if (!_1902)
    {
        float _2026 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2028 = _2026 * 0.15915493667125701904296875;
        float _2030 = _2028 * 6.283185482025146484375;
        float _2032 = cos(_2030);
        float _2034 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2036 = _2034 * 0.15915493667125701904296875;
        float _2038 = _2028 * 6.283185482025146484375;
        float _2040 = sin(_2038);
        float _2042 = 1.0 / _2032;
        float _2044 = _2036 * 6.283185482025146484375;
        float _2046 = cos(_2044);
        float _2048 = _2040 * _2042;
        float _2050 = _2036 * 6.283185482025146484375;
        float _2052 = sin(_2050);
        float _2054 = _2046 * _2048;
        float _2056 = 1.0 / _2054;
        float _2058 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2060 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2058;
        float _2062 = 1.0 / _2060;
        float _2064 = _2052 * _2056;
        float _2066 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2068 = fma(_2022, _2064, _2066);
        float _2070 = _2068 * _2062;
        float _2072 = precise::clamp(_2070, 0.0, 1.0);
        _1958 = _2072;
    }
    float _2074 = _1958;
    if (!_1902)
    {
        float _2076 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2078 = _2076 * 0.15915493667125701904296875;
        float _2080 = _2078 * 6.283185482025146484375;
        float _2082 = cos(_2080);
        float _2084 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2086 = _2084 * 0.15915493667125701904296875;
        float _2088 = _2078 * 6.283185482025146484375;
        float _2090 = sin(_2088);
        float _2092 = 1.0 / _2082;
        float _2094 = _2086 * 6.283185482025146484375;
        float _2096 = cos(_2094);
        float _2098 = _2090 * _2092;
        float _2100 = _2086 * 6.283185482025146484375;
        float _2102 = sin(_2100);
        float _2104 = _2096 * _2098;
        float _2106 = 1.0 / _2104;
        float _2108 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2110 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2108;
        float _2112 = 1.0 / _2110;
        float _2114 = _2102 * _2106;
        float _2116 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2118 = fma(_2022, _2114, _2116);
        float _2120 = _2118 * _2112;
        float _2122 = precise::clamp(_2120, 0.0, 1.0);
        float _2124 = -_2122;
        float _2126 = _2124 + 1.0;
        _1448 = _2104;
        _2024 = _2126;
    }
    float _2128 = _1448;
    float _2130 = _2024;
    float _2132 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2134 = _2004 + _2132;
    float _2136 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2138 = _2006 + _2136;
    float _2140 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2142 = _2008 + _2140;
    float _2144 = _2134 * _2134;
    float _2146 = fma(_2138, _2138, _2144);
    float _2148 = fma(_2142, _2142, _2146);
    float _2150 = rsqrt(_2148);
    float _2152 = _2150 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2154 = _2138 * _2152;
    float _2156 = _2142 * _2152;
    float _2158 = _2154 * _2154;
    float _2160 = _2156 * _2156;
    float _2162 = _2158 + _2160;
    float _2164 = sqrt(_2162);
    bool _2166 = _2164 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2168 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2170 = _2164 + _2168;
    float _2172 = _2150;
    float _2174 = _2162;
    float _2176 = _2170;
    float _2178 = _2128;
    float _2180 = _2152;
    if (_2166)
    {
        float _2182 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2172 = _2182;
    }
    float _2184 = _2172;
    if (_2166)
    {
        float _2186 = rsqrt(_2162);
        _2174 = _2186;
    }
    float _2188 = _2174;
    float _2190 = _2188;
    if (_2166)
    {
        float _2192 = _2170 * _2184;
        _2176 = _2192;
    }
    float _2194 = _2176;
    if (_2166)
    {
        float _2196 = _2194 * 0.15915493667125701904296875;
        _2016 = _2196;
    }
    float _2198 = _2016;
    float _2200 = _2184;
    float _2202 = _2198;
    if (_2166)
    {
        float _2204 = _2198 * 6.283185482025146484375;
        float _2206 = sin(_2204);
        _2200 = _2206;
    }
    float _2208 = _2200;
    float _2210 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2212 = precise::max(0.0, _2210);
    float _2214 = _2142;
    float _2216 = _2212;
    if (_2166)
    {
        float _2218 = _2198 * 6.283185482025146484375;
        float _2220 = cos(_2218);
        _2214 = _2220;
    }
    float _2222 = _2214;
    float _2224 = -_2152;
    float _2226 = -_2212;
    float _2228 = fma(_2134, _2224, _2226);
    float _2230 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_2166)
    {
        float _2232 = _2228 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2216 = _2232;
    }
    float _2234 = _2216;
    if (!_2166)
    {
        _2202 = _2154;
    }
    float _2236 = _2202;
    float _2238 = _2208;
    float _2240 = _2236;
    if (_2166)
    {
        float _2242 = fma(_2208, _2234, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2178 = _2242;
    }
    float _2244 = _2178;
    float _2246 = fma(_1366, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2248 = _2244;
    if (!_2166)
    {
        _2238 = _2156;
    }
    float _2250 = _2238;
    float _2252 = sqrt(_2148);
    float _2254 = _2250;
    float _2256 = _2222;
    if (_2166)
    {
        float _2258 = _2222 + (-1.0);
        _2230 = _2258;
    }
    float _2260 = _2230;
    float _2262 = _2260;
    if (_2166)
    {
        float _2264 = _2188 * _2244;
        _2180 = _2264;
    }
    float _2266 = _2180;
    if (!_2166)
    {
        _2248 = _2228;
    }
    float _2268 = _2248;
    float _2270 = _2268;
    if (_2166)
    {
        float _2272 = _2260 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2262 = _2272;
    }
    float _2274 = _2262;
    if (_2166)
    {
        float _2276 = _2154 * _2266;
        _2240 = _2276;
    }
    float _2278 = _2240;
    if (!_2166)
    {
        _2190 = _2158;
    }
    float _2280 = _2190;
    float _2282 = _2280;
    if (_2166)
    {
        float _2284 = _2156 * _2266;
        _2254 = _2284;
    }
    float _2286 = _2254;
    if (_2166)
    {
        float _2288 = fma(_2228, _2222, _2274);
        _2270 = _2288;
    }
    float _2290 = _2270;
    if (_2166)
    {
        float _2292 = _2278 * _2278;
        _2282 = _2292;
    }
    float _2294 = _2282;
    if (!_2166)
    {
        _2256 = _2160;
    }
    float _2296 = _2256;
    float _2298 = _2296;
    if (_2166)
    {
        float _2300 = _2286 * _2286;
        _2298 = _2300;
    }
    float _2302 = _2298;
    float _2304 = _2004 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2306 = fma(_2290, _2290, _2294);
    float _2308 = floor(_2246);
    float _2310 = _2306 + _2302;
    float _2312 = fma(_2006, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2304);
    float _2314 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2316 = fma(_2252, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2314);
    float _2318 = precise::clamp(_2316, 0.0, 1.0);
    float _2320 = fma(_1376, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2322 = fma(_2008, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2312);
    float _2324 = rsqrt(_2310);
    float _2326 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2328 = -_2318;
    float _2330 = _2328 + 1.0;
    float _2332 = _2322 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2334 = _2004 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2336 = _2332 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2338 = abs(_2330);
    float _2340 = log2(_2338);
    float _2342 = _2004 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2344 = -_2336;
    float _2346 = fma(_2344, _2326, 1.0);
    float _2348 = _2004 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2350 = fma(_2006, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2342);
    float _2352 = fma(_2006, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2334);
    float _2354 = _2324 * _2278;
    float _2356 = _2324 * _2290;
    float _2358 = _2324 * _2286;
    float _2360 = fma(_2006, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2348);
    float _2362 = fma(_2008, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2350);
    float _2364 = _2354 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2366 = floor(_2320);
    float _2368 = fma(_2008, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2360);
    float _2370 = _2362 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2372 = -_2364;
    float _2374 = fma(_2356, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2372);
    float _2376 = fma(_2008, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2352);
    float _2378 = _2368 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2380 = _2370 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2382 = -_2358;
    float _2384 = fma(_2382, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2374);
    float _2386 = _2340 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2388 = log2(_2346);
    float _2390 = fma(_2378, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2380);
    float _2392 = fma(_2384, -0.5, 0.5);
    float _2394 = -_2308;
    float _2396 = _2246 + _2394;
    float _2398 = fma(_2332, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2390);
    float _2400 = fma(_2384, 0.5, 0.5);
    float _2402 = _2370 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2404 = exp2(_2386);
    float _2406 = _2376 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2408 = _2370 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2410 = -_2366;
    float _2412 = _2320 + _2410;
    float _2414 = fma(_2400, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2416 = fma(_2406, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2398);
    float _2418 = fma(_2378, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2402);
    float _2420 = fma(_2378, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2408);
    float _2422 = sqrt(_2392);
    float _2424 = _2356 + 1.0;
    float _2426 = fma(_2332, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2418);
    float _2428 = fma(_2332, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2420);
    float _2430 = fma(_2400, _2414, -0.212114393711090087890625);
    float _2432 = _2388 * 0.693147182464599609375;
    float _2434 = fma(_2406, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2426);
    float _2436 = 1.0 / _2416;
    float _2438 = -_2356;
    float _2440 = fma(_2404, _2424, _2438);
    float _2442 = fma(_2406, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2428);
    float _2444 = fma(_2400, _2430, 1.570728778839111328125);
    float2 _6621 = float2(_2396, _2412);
    float _2446 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6621, float2(0.0), isnan(_6621)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6621, float2(0.0), isnan(_6621)), level(0.0)).x;
    float _2448 = _2432 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2450 = fma(_2440, 0.5, 0.5);
    float _2452 = _2422 * 0.636619746685028076171875;
    float _2454 = -_2444;
    float _2456 = fma(_2452, _2454, 1.0);
    float _2458 = _2434 * _2436;
    float _2460 = _2442 * _2436;
    float _2462 = fma(_2458, 0.5, 0.5);
    float _2464 = fma(_2460, -0.5, 0.5);
    float3 _6654 = float3(_2462, _2464, _2448);
    float _2466 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6654, float3(0.0), isnan(_6654)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6654, float3(0.0), isnan(_6654)), level(0.0)).x;
    float3 _6665 = float3(_2462, _2464, _2448);
    float4 _2469 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6665, float3(0.0), isnan(_6665)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6665, float3(0.0), isnan(_6665)), level(0.0)).xyzw;
    float _2471 = _2469.x;
    float _2473 = _2469.y;
    float _2475 = _2469.z;
    float _2477 = _2469.w;
    float2 _6681 = float2(_2456, _2450);
    float3 _2479 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6681, float2(0.0), isnan(_6681)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6681, float2(0.0), isnan(_6681)), level(0.0)).xyz;
    float _2481 = _2479.x;
    float _2483 = _2479.y;
    float _2485 = _2479.z;
    float _2487 = abs(_2022);
    float _2489 = log2(_2487);
    float _2491 = _2370 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2493 = _2252 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2495 = isnan(_2252);
    bool _2497 = _2493 || _2495;
    bool _2499 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2501 = _2497 || _2499;
    float _2503 = fma(_2378, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2491);
    float _2505 = _2340 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2507 = _2022 <= 8000.0;
    bool _2509 = isnan(_2022);
    bool _2511 = _2507 || _2509;
    bool _2513 = isnan(8000.0);
    bool _2515 = _2511 || _2513;
    float _2517 = float(_2515);
    float _2519 = fma(_2332, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2503);
    float _2521 = in.m_86.x;
    float _2523 = exp2(_2505);
    float _2525 = fma(_2406, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2519);
    float _2527 = _2416 * 0.5;
    float _2529 = _2489 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    out.gl_Position.x = _2434;
    out.gl_Position.y = _2442;
    out.gl_Position.z = _2525;
    out.gl_Position.w = _2416;
    float _2531 = exp2(_2529);
    float _2533 = -_2523;
    float _2535 = _2533 + 1.0;
    float _2537 = fma(_2442, -0.5, _2527);
    float _2539 = _2535 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2541 = _2442;
    float _2543 = _2525;
    float _2545 = _2416;
    float _2547 = _2539;
    if (!_2501)
    {
        _2541 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2549 = _2541;
    float _2551 = fma(_2531, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2553 = precise::clamp(_2551, 0.0, 1.0);
    float _2555 = _2525 + _2416;
    float _2557 = _2549;
    float _2559 = _2549;
    if (!_2501)
    {
        _2543 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2561 = _2543;
    float _2563 = fma(_2553, -2.0, 3.0);
    float _2565 = _2553 * _2553;
    float _2567 = _2555 * 0.5;
    float _2569 = _2565 * _2563;
    float _2571 = -_2569;
    float _2573 = _2571 + 1.0;
    float _2575 = fma(_2573, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2569);
    float _2577 = _2434 + _2416;
    float _2579 = -_2539;
    float _2581 = _2579 + 1.0;
    float _2583 = _2517 * _2575;
    float _2585 = _2577 * 0.5;
    float _2587 = _2561;
    float _2589 = _2561;
    if (!_2501)
    {
        _2545 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2591 = _2545;
    float _2593 = _2583 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_88.x = _2585;
    out.m_88.y = _2537;
    out.m_88.z = _2567;
    out.m_88.w = _2416;
    float _2595 = -_2446;
    float _2597 = _2595 + 1.0;
    float _2599 = _2597 * _2593;
    float _2601 = precise::clamp(_2599, 0.0, 1.0);
    float _2603 = -_2601;
    float _2605 = fma(_2603, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2607 = _2605 * _2521;
    float _2609 = _2539 * _2466;
    float _2611 = _2477 * _2581;
    float _2613 = _2074 * _2130;
    float _2615 = _2607;
    float _2617 = _2613;
    float _2619 = _2591;
    float _2621 = _2591;
    if (!_2501)
    {
        _2547 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2623 = _2547;
    float _2625 = _2477 * _2609;
    float _2627 = _2485 * _2609;
    float _2629 = fma(_2481, _2625, _2471);
    float _2631 = fma(_2483, _2625, _2473);
    float _2633 = _2607 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2635 = fma(_2477, _2627, _2475);
    float _2637 = _2613 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2639 = _2623;
    float _2641 = _2623;
    if (!_2501)
    {
        _2615 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2643 = _2615;
    out.m_90.x = _2633;
    float _2645 = _2643;
    float _2647 = _2643;
    if (!_2501)
    {
        _2617 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2649 = _2617;
    out.m_92.x = _2629;
    out.m_92.y = _2631;
    out.m_92.z = _2635;
    out.m_92.w = _2611;
    bool _2651 = !_2501;
    float _2653 = _2649;
    float _2655 = _2649;
    if (!_2651)
    {
        bool _2657 = _2252 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2659 = isnan(_2252);
        bool _2661 = _2657 || _2659;
        bool _2663 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2665 = _2661 || _2663;
        if (!_2665)
        {
            float _2667 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2669 = _2252 + _2667;
            float _2671 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2673 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2671;
            float _2675 = 1.0 / _2673;
            float _2677 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2679 = _2677 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2681 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2683 = _2681 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2685 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2687 = _2685 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2689 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2691 = _2689 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2693 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2695 = _2693 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2697 = _2669 * _2675;
            float _2699 = precise::clamp(_2697, 0.0, 1.0);
            float _2701 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2703 = _2701 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2705 = fma(_2699, _2679, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2707 = fma(_2699, _2703, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2709 = fma(_2699, _2683, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2711 = fma(_2699, _2687, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2713 = fma(_2699, _2691, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2715 = fma(_2699, _2695, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2647 = _2707;
            _2559 = _2713;
            _2641 = _2705;
            _2589 = _2711;
            _2621 = _2709;
            _2655 = _2715;
            _2717 = true;
        }
        else
        {
            bool _2719 = _2252 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2721 = isnan(_2252);
            bool _2723 = _2719 || _2721;
            bool _2725 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2727 = _2723 || _2725;
            if (!_2727)
            {
                _2639 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2729 = _2639;
            _2641 = _2729;
            if (!_2727)
            {
                _2645 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2731 = _2645;
            _2647 = _2731;
            if (!_2727)
            {
                _2619 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2733 = _2619;
            _2621 = _2733;
            if (!_2727)
            {
                _2587 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2735 = _2587;
            _2589 = _2735;
            if (!_2727)
            {
                _2557 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2737 = _2557;
            _2559 = _2737;
            if (!_2727)
            {
                _2653 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2739 = _2653;
            bool _2741 = !_2727;
            _2655 = _2739;
            if (!_2741)
            {
                bool _2743 = _2252 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2745 = isnan(_2252);
                bool _2747 = _2743 || _2745;
                bool _2749 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2751 = _2747 || _2749;
                if (!_2751)
                {
                    float _2753 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2755 = _2252 + _2753;
                    float _2757 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2759 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2757;
                    float _2761 = 1.0 / _2759;
                    float _2763 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2765 = _2763 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2767 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2769 = _2767 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2771 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2773 = _2771 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2775 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2777 = _2775 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2779 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2781 = _2779 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2783 = _2755 * _2761;
                    float _2785 = precise::clamp(_2783, 0.0, 1.0);
                    float _2787 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2789 = _2787 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2791 = fma(_2785, _2765, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2793 = fma(_2785, _2789, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2795 = fma(_2785, _2769, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2797 = fma(_2785, _2773, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2799 = fma(_2785, _2777, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2801 = fma(_2785, _2781, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2647 = _2793;
                    _2559 = _2799;
                    _2641 = _2791;
                    _2589 = _2797;
                    _2621 = _2795;
                    _2655 = _2801;
                    _2717 = true;
                }
                else
                {
                    _2647 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2559 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2641 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2589 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2621 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2655 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2717 = false;
    float _2803 = _2647;
    float _2805 = _2559;
    float _2807 = _2641;
    float _2809 = _2589;
    float _2811 = _2621;
    float _2813 = _2655;
    float _2815 = fma(_1786, -0.5, 0.5);
    float _2817 = precise::clamp(_2815, 0.0, 1.0);
    float _2819 = -_2803;
    float _2821 = _2819 + _2805;
    float _2823 = -_2807;
    float _2825 = _2823 + _2809;
    out.m_94.x = 0.0;
    float _2827 = fma(_2817, _2821, _2803);
    float _2829 = -_2811;
    float _2831 = _2829 + _2813;
    float _2833 = fma(_2817, _2825, _2807);
    float _2835 = _2827 * 0.586610972881317138671875;
    bool _2837 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2839 = fma(_2817, _2831, _2811);
    float _2841 = _2637 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2843 = fma(_2833, 0.298911988735198974609375, _2835);
    bool _2845 = _2074 > 0.0;
    bool _2847 = isnan(_2074);
    bool _2849 = _2845 || _2847;
    bool _2851 = isnan(0.0);
    bool _2853 = _2849 || _2851;
    float _2855 = fma(_2839, 0.114477999508380889892578125, _2843);
    out.m_57.x = _2841;
    bool _2857 = _2130 <= 0.0;
    bool _2859 = !_2853;
    bool _2861 = _2857 || _2859;
    float _2863 = -_2855;
    float _2865 = _2833 + _2863;
    float _2867 = -_2855;
    float _2869 = _2827 + _2867;
    float _2871 = -_2855;
    float _2873 = _2839 + _2871;
    float _2875 = fma(_2865, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2855);
    float _2877 = fma(_2869, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2855);
    float _2879 = fma(_2873, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2855);
    bool _2881 = !_2837;
    if (!_2881)
    {
        float _2883 = -_2004;
        float _2885 = _2883 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2887 = -_2006;
        float _2889 = _2887 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2891 = -_2008;
        float _2893 = _2891 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2895 = _2885 * _2885;
        float _2897 = fma(_2889, _2889, _2895);
        float _2899 = fma(_2893, _2893, _2897);
        float _2901 = sqrt(_2899);
        float _2903 = rsqrt(_2899);
        float _2905 = -_2901;
        float _2907 = _2905 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2909 = _2907 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2911 = precise::clamp(_2909, 0.0, 1.0);
        float _2913 = _2889 * _2903;
        float _2915 = _2885 * _2903;
        float _2917 = abs(_2911);
        float _2919 = log2(_2917);
        float _2921 = _2893 * _2903;
        float _2923 = _2913 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2925 = _1786 * _2915;
        float _2927 = -_2915;
        float _2929 = -_2923;
        float _2931 = fma(_2927, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2929);
        float _2933 = fma(_1784, _2913, _2925);
        float _2935 = -_2921;
        float _2937 = fma(_2935, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2931);
        float _2939 = fma(_1788, _2921, _2933);
        float _2941 = precise::clamp(_2939, 0.0, 1.0);
        float _2943 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2945 = _2937 + _2943;
        float _2947 = _2919 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2949 = _2945 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2951 = precise::clamp(_2949, 0.0, 1.0);
        float _2953 = exp2(_2947);
        float _2955 = _2953 * _2951;
        float _2957 = _2941 * _2955;
        float _2959 = _2957 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2961 = _2957 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2963 = _2957 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_94.x = _2959;
        out.m_94.y = _2961;
        out.m_94.z = _2963;
    }
    out.m_96.x = _2875;
    out.m_96.y = _2877;
    out.m_96.z = _2879;
    if (!_2861)
    {
        return out;
    }
    out.m_57.x = 0.0;
    float _2965 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2965;
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
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2717 = false;
    bool _1838 = false;
    bool _213 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _110 = in.m_50.w;
    float _112 = in.m_52.w;
    float _114 = trunc(_110);
    int _117 = int(_114);
    float _119 = -_112;
    float _121 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_55.y = _121;
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
        out.m_57.x = 0.0;
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
        float _3034 = as_type<float>(_139);
        out.gl_Position.z = _3034;
    }
    if (!_125)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        out.m_57.x = 0.0;
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
        float _3089 = as_type<float>(_165);
        out.gl_Position.z = _3089;
    }
    if (_159)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _195 = in.m_62.x;
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
    bool _221 = _215 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _223 = isnan(_215);
    bool _225 = _221 || _223;
    bool _227 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _229 = _225 || _227;
    float _231 = float(_229);
    float _233 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _235 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _233;
    float _237 = -_231;
    float _239 = _237 + 1.0;
    bool _241 = _215 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _243 = isnan(_215);
    bool _245 = _241 || _243;
    bool _247 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _249 = _245 || _247;
    float _251 = float(_249);
    float _253 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _255 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _253;
    bool _257 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _259 = 1.0 / _235;
    float _261 = _251 * _239;
    float _263 = -_251;
    float _265 = _263 + 1.0;
    float _267 = _219 * _259;
    float _269 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _271 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _269;
    float _273 = fma(_255, _267, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _275 = fma(_271, _267, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _277 = _273 * _261;
    float _279 = _275 * _261;
    float _281 = fma(_265, (*spvDescriptorSet0.vp_c9)._m0[143].x, _277);
    float _283 = fma(_265, (*spvDescriptorSet0.vp_c9)._m0[143].y, _279);
    float _285 = fma(_231, (*spvDescriptorSet0.vp_c9)._m0[144].x, _281);
    float _287 = fma(_231, (*spvDescriptorSet0.vp_c9)._m0[144].y, _283);
    bool _289 = !_257;
    if (!_289)
    {
        float _291 = in.m_62.x;
        float _293 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _295 = _291 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _297 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[11].y, _121);
        float _299 = _297 * _293;
        float _301 = floor(_299);
        float _303 = -_301;
        float _305 = _299 + _303;
        _193 = _305;
    }
    float _307 = _193;
    float _309 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _311 = int(_309);
    float _313 = in.m_62.x;
    float _315 = in.m_62.y;
    float _317 = in.m_50.x;
    float _319 = in.m_50.y;
    float _321 = in.m_50.z;
    float _323 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _325 = int(_323);
    float _327 = float(_311);
    float _329 = 1.0 / _327;
    float _331 = float(uint(_325));
    int _333 = ~_325;
    int _335 = _333 + 1;
    int _337 = ~_325;
    int _339 = _337 + 1;
    float _341 = 1.0 / _331;
    bool _343 = _325 == 0;
    int _345 = _325 + (-1);
    float _347 = _329 * _121;
    float _349 = trunc(_347);
    int _351 = int(_349);
    int _353 = as_type<int>(_341) + (-2);
    float _355 = float(uint(_351));
    float _357 = float(_351);
    float _359 = as_type<float>(_353) * _355;
    float _361 = trunc(_359);
    float _363 = precise::max(_361, 0.0);
    uint _366 = uint(_363);
    int _368 = _335 * int(_366);
    int _370 = _368 + _351;
    float _372 = float(uint(_370));
    float _374 = as_type<float>(_353) * _372;
    float _376 = trunc(_374);
    float _378 = precise::max(_376, 0.0);
    uint _380 = uint(_378);
    int _382 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _384 = _382 != 0;
    bool _386 = !_384;
    float _388 = _386 ? 7.345489978790283203125 : 1.0;
    float _390 = _388 * _313;
    float _392 = floor(_390);
    int _394 = int(_366) + int(_380);
    float _396 = float(_325);
    int _398 = _339 * _394;
    int _400 = _398 + _351;
    bool _402 = _357 >= _396;
    bool _404 = isnan(_357);
    bool _406 = _402 || _404;
    bool _408 = isnan(_396);
    bool _410 = _406 || _408;
    float _412 = float(_410);
    float _414 = _396 * _121;
    bool _416 = uint(_400) >= uint(_325);
    float _418 = trunc(_412);
    int _420 = int(_418);
    float _422 = _414 * _169;
    bool _424 = !_416;
    int _426 = _424 ? 0 : (-1);
    float _428 = -_392;
    float _430 = _390 + _428;
    int _432 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _434 = _432 != 0;
    int _436 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _438 = _436 != 0;
    int _440 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _442 = _440 != 0;
    int _444 = ~_394;
    int _446 = _444 + _426;
    int _448 = _446 + 1;
    float _450 = _430 * _396;
    int _452 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _454 = _452 != 0;
    float _456 = trunc(_422);
    int _458 = int(_456);
    bool _460 = !_438;
    int _462 = _460 ? 0 : 1;
    int _464 = _325 * _448;
    int _466 = _464 + _351;
    bool _468 = !_454;
    int _470 = _468 ? 0 : 1;
    float _472 = in.m_64.x;
    float _474 = in.m_64.y;
    float _476 = in.m_64.z;
    float _478 = in.m_64.w;
    bool _480 = !_434;
    int _482 = _480 ? 0 : 1;
    int _484 = ~_420;
    int _486 = _484 + 1;
    int _488 = _486 + 1;
    float _490 = trunc(_450);
    int _492 = int(_490);
    bool _494 = !_343;
    int _496 = _494 ? _466 : (-1);
    int _498 = abs(_462);
    int _500 = abs(_470);
    int _502 = _496 * _488;
    int _504 = abs(_482);
    float _506 = in.m_66.x;
    float _508 = in.m_66.y;
    float _510 = in.m_66.z;
    float _512 = in.m_66.w;
    int _514 = _420 * _345;
    int _516 = _514 + _502;
    bool _518 = !_442;
    int _520 = _518 ? 0 : 1;
    float _522 = in.m_68.x;
    float _524 = in.m_68.y;
    int _526 = _516 * _498;
    float _528 = in.m_70.x;
    float _530 = in.m_70.y;
    float _532 = in.m_70.z;
    float _534 = in.m_70.w;
    int _536 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _538 = _536 != 0;
    int _540 = _492 * _500;
    int _542 = _540 + _351;
    int _544 = abs(_520);
    int _546 = _458 * _504;
    int _548 = _546 + _526;
    bool _550 = !_538;
    int _552 = _550 ? 0 : 1;
    float _554 = _319 * _474;
    float _556 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _558 = log2(_556);
    int _560 = abs(_552);
    float _562 = fma(_317, _472, _554);
    int _564 = _542 * _544;
    int _566 = _564 + _548;
    float _568 = _315 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _570 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _572 = isnan(0.0);
    bool _574 = _570 || _572;
    bool _576 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _578 = _574 || _576;
    float _580 = _319 * _508;
    int _582 = _492 * _560;
    int _584 = _582 + _566;
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _588 = _586 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _590 = _285 * _522;
    float _592 = fma(_317, _506, _580);
    float _594 = float(uint(_584));
    float _596 = _319 * _530;
    float _598 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _600 = as_type<float>(_353) * _594;
    float _602 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _604 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _606 = 1.0 / _588;
    float _608 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _610 = fma(_317, _528, _596);
    float _612 = fma(_321, _476, _562);
    float _614 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _616 = _598 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _618 = _602 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _620 = trunc(_600);
    float _622 = precise::max(_620, 0.0);
    uint _624 = uint(_622);
    float _626 = _604 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _628 = ~_325;
    int _630 = _628 + 1;
    float _632 = fma(_568, -2.0, _608);
    float _634 = fma(_321, _510, _592);
    float _636 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    out.m_72.x = _616;
    out.m_72.y = _618;
    out.m_72.z = _626;
    out.m_72.w = _614;
    float _638 = _558 * _121;
    float _640 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _642 = _640 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _644 = _313 * 2.0;
    float _646 = fma(_321, _532, _610);
    bool _648 = _313 > 0.5;
    int _650 = _630 * int(_624);
    int _652 = _650 + _584;
    float _654 = 1.0 / _642;
    bool _656 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _658 = isnan(1.0);
    bool _660 = _656 || _658;
    bool _662 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _664 = _660 || _662;
    float _666 = _634 + _512;
    int _668 = ~_325;
    int _670 = _668 + 1;
    float _672 = _646 + _534;
    float _674 = float(uint(_652));
    float _676 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _678 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _676;
    float _680 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _682 = _680 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _684 = exp2(_638);
    float _686 = -_636;
    float _688 = fma(_644, (*spvDescriptorSet0.vp_c9)._m0[77].x, _686);
    float _690 = as_type<float>(_353) * _674;
    float _692 = _682 * _606;
    float _694 = in.m_62.z;
    float _696 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _698 = 1.0 + _696;
    float _700 = _315 * 2.0;
    float _702 = trunc(_690);
    float _704 = precise::max(_702, 0.0);
    uint _706 = uint(_704);
    float _708 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _710 = _678 * _654;
    float _712 = _612 + _478;
    float _714 = fma(_315, (*spvDescriptorSet0.vp_c9)._m0[78].w, _708);
    int _716 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _718 = _716 != 0;
    float _720 = floor(_644);
    float _722 = -_684;
    float _724 = _722 + 1.0;
    float _726 = -_121;
    float _728 = fma(_726, (*spvDescriptorSet0.vp_c9)._m0[76].x, _688);
    float _730 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _732 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[76].y, _632);
    float _734 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].w, _714);
    float _736 = _578 ? _724 : 0.0;
    float _738 = fma(_313, (*spvDescriptorSet0.vp_c9)._m0[78].z, _730);
    float _740 = 1.0 / _698;
    int _742 = int(_624) + int(_706);
    float _744 = _315 + _313;
    float _746 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].z, _738);
    int _748 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _750 = _748 != 0;
    float _752 = _694 * 2.0;
    float _754 = _744 + (-1.0);
    float _756 = _315 + _694;
    bool _758 = _720 >= 0.0;
    bool _760 = isnan(_720);
    bool _762 = _758 || _760;
    bool _764 = isnan(0.0);
    bool _766 = _762 || _764;
    float _768 = floor(_700);
    float _770 = -_185;
    int _772 = _648 ? as_type<int>(_770) : as_type<int>(_185);
    float _774 = _756 + (-1.0);
    bool _776 = _720 > 0.0;
    float _778 = -_746;
    float _780 = _778 + 1.0;
    int _782 = _766 ? 0 : 1;
    float _784 = _672;
    if (_664)
    {
        float _786 = _736 * _740;
        _131 = _786;
    }
    float _788 = _131;
    float _790 = floor(_752);
    float _792 = fma(_774, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _794 = _315 > 0.5;
    int _796 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _798 = _796 != 0;
    float _800 = fma(_754, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _802 = _670 * _742;
    int _804 = _802 + _584;
    int _806 = ~_782;
    int _808 = _806 + 1;
    int _810 = _808 + 1;
    int _812 = _810;
    if (!_776)
    {
        int _814 = ~_782;
        int _816 = _814 + 1;
        _812 = _816;
    }
    int _818 = _812;
    float _820 = -_189;
    int _822 = _794 ? as_type<int>(_820) : as_type<int>(_189);
    bool _824 = _768 >= 0.0;
    bool _826 = isnan(_768);
    bool _828 = _824 || _826;
    bool _830 = isnan(0.0);
    bool _832 = _828 || _830;
    bool _834 = !_718;
    float _836 = _834 ? _185 : as_type<float>(_772);
    bool _838 = uint(_804) >= uint(_325);
    bool _840 = _768 > 0.0;
    float _842 = _836 + 0.5;
    bool _844 = _790 >= 0.0;
    bool _846 = isnan(_790);
    bool _848 = _844 || _846;
    bool _850 = isnan(0.0);
    bool _852 = _848 || _850;
    float _854 = float(uint(_542));
    float _856 = fma(_842, (*spvDescriptorSet0.vp_c9)._m0[80].x, _728);
    bool _858 = !_750;
    float _860 = _858 ? _189 : as_type<float>(_822);
    int _862 = _832 ? 0 : 1;
    float _864 = as_type<float>(_353) * _854;
    bool _866 = !_838;
    int _868 = _866 ? 0 : (-1);
    float _870 = _860 + (-0.5);
    int _872 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _874 = _872 != 0;
    int _876 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _878 = _876 != 0;
    int _880 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _882 = _880 != 0;
    float _884 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _886 = _307 + _884;
    bool _888 = _307 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _890 = isnan(_307);
    bool _892 = _888 || _890;
    bool _894 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _896 = _892 || _894;
    float _898 = float(_896);
    float _900 = -_870;
    float _902 = -_732;
    float _904 = fma(_900, (*spvDescriptorSet0.vp_c9)._m0[80].y, _902);
    int _906 = _852 ? 0 : 1;
    float _908 = fma(_710, _886, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _910 = _790 > 0.0;
    float _912 = trunc(_864);
    float _914 = precise::max(_912, 0.0);
    uint _916 = uint(_914);
    float _918 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _920 = _307 + _918;
    bool _922 = _307 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _924 = isnan(_307);
    bool _926 = _922 || _924;
    bool _928 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _930 = _926 || _928;
    float _932 = float(_930);
    float _934 = -_898;
    float _936 = _934 + 1.0;
    bool _938 = _307 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _940 = isnan(_307);
    bool _942 = _938 || _940;
    bool _944 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _946 = _942 || _944;
    float _948 = float(_946);
    float _950 = fma(_692, _920, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    int _952 = ~_325;
    int _954 = _952 + 1;
    float _956 = _932 * _936;
    int _958 = ~_742;
    int _960 = _958 + _868;
    int _962 = _960 + 1;
    float _964 = -_932;
    float _966 = _964 + 1.0;
    float _968 = -_780;
    float _970 = fma(_836, _968, _856);
    bool _972 = !_874;
    int _974 = _972 ? 0 : 1;
    float _976 = _948 * _966;
    int _978 = _325 * _962;
    int _980 = _978 + _584;
    float _982 = -_948;
    float _984 = _982 + 1.0;
    int _986 = _954 * int(_916);
    int _988 = _986 + _542;
    float _990 = _908 * _976;
    float _992 = -_734;
    float _994 = _992 + 1.0;
    bool _996 = !_343;
    int _998 = _996 ? _980 : (-1);
    float _1000 = fma(_984, (*spvDescriptorSet0.vp_c9)._m0[115].x, _990);
    float _1002 = float(uint(_988));
    float _1004 = fma(_860, _994, _904);
    int _1006 = _998 >> 31;
    float _1008 = fma(_950, _956, _1000);
    int _1010 = abs(_974);
    float _1012 = as_type<float>(_353) * _1002;
    int _1014 = _1006 & 3;
    float _1016 = fma(_898, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1008);
    bool _1018 = !_878;
    int _1020 = _1018 ? 0 : 1;
    float _1022 = trunc(_1012);
    float _1024 = precise::max(_1022, 0.0);
    uint _1026 = uint(_1024);
    int _1028 = _998 + _1014;
    float _1030 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1032 = _712 + _1030;
    int _1034 = abs(_1020);
    out.m_74.x = _970;
    out.m_74.y = _1004;
    int _1036 = _1028 >> 2;
    int _1038 = _1036 << 4;
    int _1040 = _1038 + 368;
    int _1042 = ~_862;
    int _1044 = _1042 + 1;
    int _1046 = _1044 + 1;
    uint _1048 = uint(int(uint(_1040) >> uint(2)));
    uint _1050 = uint(int(uint(int(_1048)) >> uint(2)));
    int _1052 = int(_1048) & 3;
    float _1054 = (*spvDescriptorSet0.vp_c9)._m0[int(_1050)][_1052];
    int _1056 = int(_1048) + 1;
    uint _1058 = uint(int(uint(_1056) >> uint(2)));
    int _1060 = _1056 & 3;
    float _1062 = (*spvDescriptorSet0.vp_c9)._m0[int(_1058)][_1060];
    int _1064 = _1046;
    if (!_840)
    {
        int _1066 = ~_862;
        int _1068 = _1066 + 1;
        _1064 = _1068;
    }
    int _1070 = _1064;
    float _1072 = _1016 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _1074 = _998 & 3;
    bool _1076 = _1074 != 0;
    int _1078 = _998 & 3;
    bool _1080 = _1078 != 0;
    int _1082 = ~_906;
    int _1084 = _1082 + 1;
    int _1086 = _1084 + 1;
    int _1088 = _1086;
    if (!_910)
    {
        int _1090 = ~_906;
        int _1092 = _1090 + 1;
        _1088 = _1092;
    }
    int _1094 = _1088;
    bool _1096 = uint(_1078) > 1u;
    int _1098 = int(_916) + int(_1026);
    float _1100 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1102 = _666 + _1100;
    int _1104 = _1040 + 8;
    uint _1106 = uint(int(uint(_1104) >> uint(2)));
    uint _1108 = uint(int(uint(int(_1106)) >> uint(2)));
    int _1110 = int(_1106) & 3;
    float _1112 = (*spvDescriptorSet0.vp_c9)._m0[int(_1108)][_1110];
    int _1114 = int(_1106) + 1;
    uint _1116 = uint(int(uint(_1114) >> uint(2)));
    int _1118 = _1114 & 3;
    float _1120 = (*spvDescriptorSet0.vp_c9)._m0[int(_1116)][_1118];
    float _1122 = float(_818);
    int _1124 = _1076 ? 0 : 1;
    float _1126 = float(_1094);
    int _1128 = ~_1124;
    int _1130 = _1128 + 1;
    int _1132 = _1130 + 1;
    int _1134 = _1132;
    if (!_1096)
    {
        int _1136 = ~_1124;
        int _1138 = _1136 + 1;
        _1134 = _1138;
    }
    int _1140 = _1134;
    float _1142 = _1102 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1144 = float(_1034);
    float _1146 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1148 = float(_1010);
    float _1150 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1152 = _672 + _1150;
    float _1154 = fma(_1032, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1142);
    bool _1156 = _1078 != 3;
    float _1158 = _1144 * _1122;
    float _1160 = _1148 * _1126;
    float _1162 = fma(_1152, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1154);
    float _1164 = _1146 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1166 = uint(_1078) >= 2u;
    float _1168 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _1170 = ~_325;
    int _1172 = _1170 + 1;
    float _1174 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _1176 = abs(_1140);
    float _1178 = _1168 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1180 = _1166 ? 0 : 1;
    int _1182 = _1172 * _1098;
    int _1184 = _1182 + _542;
    bool _1186 = _1162 >= 0.0;
    float _1188 = _1174 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1190 = ~_1176;
    int _1192 = _1190 + 1;
    int _1194 = _1192 + 1;
    float _1196 = _1160 * (-2.0);
    bool _1198 = !_1080;
    int _1200 = _1198 ? 0 : 1;
    float _1202 = _1158 * (-2.0);
    bool _1204 = _1078 != 3;
    out.m_76.x = _1178;
    out.m_76.y = _1188;
    out.m_76.z = _1164;
    out.m_76.w = _1072;
    int _1206 = ~_1180;
    int _1208 = _1206 + 1;
    int _1210 = _1208 + 1;
    int _1212 = _1210;
    if (_1156)
    {
        int _1214 = ~_1180;
        int _1216 = _1214 + 1;
        _1212 = _1216;
    }
    int _1218 = _1212;
    int _1220 = _1194 * as_type<int>(_1062);
    bool _1222 = uint(_1184) >= uint(_325);
    if (_1186)
    {
        out.m_57.x = 0.0;
    }
    bool _1224 = !_1204;
    int _1226 = _1224 ? 0 : (-1);
    int _1228 = abs(_1200);
    float _1230 = in.m_78.x;
    float _1232 = in.m_78.y;
    float _1234 = in.m_78.z;
    bool _1236 = !_798;
    int _1238 = _1236 ? 0 : 1;
    int _1240 = abs(_1226);
    int _1242 = abs(_1218);
    int _1244 = abs(_1238);
    bool _1246 = !_1222;
    int _1248 = _1246 ? 0 : (-1);
    float _1250 = _1102 * _1102;
    int _1252 = ~_1228;
    int _1254 = _1252 + 1;
    int _1256 = _1254 + 1;
    int _1258 = ~_1098;
    int _1260 = _1258 + _1248;
    int _1262 = _1260 + 1;
    float _1264 = fma(_1032, _1032, _1250);
    int _1266 = ~_1242;
    int _1268 = _1266 + 1;
    int _1270 = _1268 + 1;
    int _1272 = _1256 * as_type<int>(_1054);
    int _1274 = _1272 + _1220;
    int _1276 = _325 * _1262;
    int _1278 = _1276 + _542;
    int _1280 = ~_1240;
    int _1282 = _1280 + 1;
    int _1284 = _1282 + 1;
    float _1286 = fma(_1152, _1152, _1264);
    int _1288 = _1270 * as_type<int>(_1112);
    int _1290 = _1288 + _1274;
    int _1292 = ~_1244;
    int _1294 = _1292 + 1;
    int _1296 = _1294 + 1;
    float _1298 = fma(_1196, _1230, _1230);
    float _1300 = _1264;
    if (_1186)
    {
        _1300 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1302 = _1300;
    int _1304 = _1284 * as_type<int>(_1120);
    int _1306 = _1304 + _1290;
    float _1308 = rsqrt(_1286);
    bool _1310 = !_343;
    int _1312 = _1310 ? _1278 : (-1);
    float _1314 = _590 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1316 = _1306 * _1296;
    float _1318 = fma(_800, _1196, _800);
    float _1320 = _313 + (-0.5);
    float _1322 = fma(_792, _1202, _792);
    int _1324 = _1312 * _1244;
    int _1326 = _1324 + _1316;
    int _1328 = as_type<int>(_1302);
    if (_1186)
    {
        float _1330 = _1302 * 5.0;
        _1328 = as_type<int>(_1330);
    }
    int _1332 = _1328;
    float _1334 = _1314 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _1336 = fma(_1320, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1298);
    float _1338 = float(_1326);
    float _1340 = fma(_1202, _1232, _1232);
    bool _1342 = !_882;
    int _1344 = _1342 ? 0 : 1;
    if (_1186)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4819 = as_type<float>(_1332);
        out.gl_Position.z = _4819;
    }
    float _1346 = _1334 * _1308;
    float _1348 = fma(_1318, _788, _1336);
    float _1350 = _315 + (-0.5);
    out.m_80.x = _1338;
    float _1352 = _1032 * _1346;
    float _1354 = _1102 * _1346;
    int _1356 = abs(_1344);
    if (_1186)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1358 = -_1354;
    float _1360 = _666 + _1358;
    float _1362 = _1152 * _1346;
    float _1364 = -_1352;
    float _1366 = _712 + _1364;
    float _1368 = float(_1070);
    float _1370 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1372 = _1360 + _1370;
    float _1374 = -_1362;
    float _1376 = _672 + _1374;
    float _1378 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1380 = _1366 + _1378;
    float _1382 = _1348 * 0.15915493667125701904296875;
    float _1384 = _1372 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1386 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1388 = _1376 + _1386;
    float _1390 = fma(_1350, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1340);
    float _1392 = -_1354;
    float _1394 = _1102 + _1392;
    float _1396 = fma(_1380, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1384);
    float _1398 = float(_1356);
    float _1400 = -_1352;
    float _1402 = _1032 + _1400;
    float _1404 = _694 + _313;
    float _1406 = fma(_1388, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1396);
    float _1408 = _1394 * _1394;
    float _1410 = _1398 * _1368;
    float _1412 = _1404 + (-1.0);
    bool _1414 = _1406 >= 0.0;
    float _1416 = fma(_1402, _1402, _1408);
    float _1418 = -_1362;
    float _1420 = _1152 + _1418;
    float _1422 = fma(_1322, _788, _1390);
    float _1424 = _1382 * 6.283185482025146484375;
    float _1426 = sin(_1424);
    float _1428 = _1410 * (-2.0);
    float _1430 = fma(_1412, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1432 = _1422 * 0.15915493667125701904296875;
    float _1434 = _694 + (-0.5);
    float _1436 = fma(_1428, _1234, _1234);
    float _1438 = _1382 * 6.283185482025146484375;
    float _1440 = cos(_1438);
    float _1442 = _1430;
    int _1444 = as_type<int>(_1436);
    float _1446 = _1380;
    float _1448 = _1372;
    if (_1414)
    {
        out.m_57.x = 0.0;
    }
    float _1450 = _1432 * 6.283185482025146484375;
    float _1452 = sin(_1450);
    float _1454 = fma(_1420, _1420, _1416);
    float _1456 = fma(_1430, _1428, _1430);
    if (_1414)
    {
        _1442 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1458 = _1442;
    float _1460 = fma(_1434, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1436);
    float _1462 = sqrt(_1454);
    if (_1414)
    {
        float _1464 = _1458 * 5.0;
        _1444 = as_type<int>(_1464);
    }
    int _1466 = _1444;
    float _1468 = fma(_1456, _788, _1460);
    if (_1414)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5018 = as_type<float>(_1466);
        out.gl_Position.z = _5018;
    }
    float _1470 = _1468 * 0.15915493667125701904296875;
    float _1472 = _1432 * 6.283185482025146484375;
    float _1474 = cos(_1472);
    if (_1414)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1476 = _1470 * 6.283185482025146484375;
    float _1478 = cos(_1476);
    float _1480 = _287 * _524;
    float _1482 = _1308 * _1462;
    float _1484 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _189);
    float _1486 = _1426 * _1452;
    float _1488 = _1480 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1490 = _1314 * _1482;
    float _1492 = _1440 * _1452;
    float _1494 = _1470 * 6.283185482025146484375;
    float _1496 = sin(_1494);
    float _1498 = _1488 * _1482;
    float _1500 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _185);
    float _1502 = _1484 * _1498;
    float _1504 = _1440 * _1474;
    float _1506 = _1426 * _1474;
    float _1508 = _1440 * _1478;
    float _1510 = _1474 * _1478;
    float _1512 = _1426 * _1478;
    float _1514 = _1452 * _1478;
    float _1516 = _1500 * _1490;
    float _1518 = _1508 * _1502;
    float _1520 = _1482 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1522 = _1520 * 0.5;
    float _1524 = fma(_1496, _1504, _1486);
    float _1526 = -_1506;
    float _1528 = fma(_1496, _1492, _1526);
    float _1530 = -_1502;
    float _1532 = _1496 * _1530;
    float _1534 = -_1492;
    float _1536 = fma(_1496, _1506, _1534);
    float _1538 = fma(_1524, _1516, _1518);
    float _1540 = _1512 * _1502;
    float _1542 = fma(_1510, _1516, _1532);
    float _1544 = fma(_1496, _1486, _1504);
    float _1546 = fma(_1528, _1522, _1538);
    float _1548 = fma(_1536, _1516, _1540);
    float _1550 = fma(_1514, _1522, _1542);
    float _1552 = _1546 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1554 = _1546 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1556 = fma(_1544, _1522, _1548);
    float _1558 = fma(_1550, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1552);
    float _1560 = fma(_1550, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1554);
    float _1562 = fma(_1556, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1558);
    float _1564 = fma(_1556, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1560);
    float _1566 = _1562 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1568 = _1564 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1570 = _712 + _1566;
    float _1572 = _672 + _1568;
    float _1574 = _1546 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1576 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1578 = _1570 + _1576;
    float _1580 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1582 = _1572 + _1580;
    float _1584 = fma(_1550, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1574);
    float _1586 = _1578 * _1578;
    float _1588 = _1582 * _1582;
    float _1590 = fma(_1556, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1584);
    float _1592 = _1586 + _1588;
    float _1594 = _1590 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1596 = sqrt(_1592);
    float _1598 = _666 + _1594;
    bool _1600 = _1596 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1602 = _1546;
    float _1604 = _1556;
    float _1606 = _1570;
    float _1608 = _1586;
    float _1610 = _1588;
    if (!_1600)
    {
        _1602 = _1570;
    }
    float _1612 = _1602;
    float _1614 = _1612;
    if (!_1600)
    {
        _1604 = _1572;
    }
    float _1616 = _1604;
    float _1618 = _1616;
    if (!_1600)
    {
        _1606 = _1598;
    }
    float _1620 = _1606;
    bool _1622 = !_1600;
    float _1624 = _1620;
    if (!_1622)
    {
        float _1626 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1628 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1630 = _1596 + _1628;
        float _1632 = rsqrt(_1592);
        float _1634 = _1630 * _1626;
        float _1636 = _1598 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1638 = _1634 * 0.15915493667125701904296875;
        float _1640 = _1638 * 6.283185482025146484375;
        float _1642 = sin(_1640);
        float _1644 = _1638 * 6.283185482025146484375;
        float _1646 = cos(_1644);
        float _1648 = fma(_1642, _1636, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1650 = _1632 * _1648;
        float _1652 = _1646 + (-1.0);
        float _1654 = fma(_1578, _1650, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1656 = fma(_1582, _1650, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1658 = _1652 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1660 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1662 = _1654 + _1660;
        float _1664 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1666 = _1656 + _1664;
        float _1668 = fma(_1598, _1646, _1658);
        float _1670 = _1662 * _1662;
        float _1672 = _1666 * _1666;
        _1614 = _1654;
        _1618 = _1656;
        _1624 = _1668;
        _1608 = _1670;
        _1610 = _1672;
    }
    float _1674 = _1614;
    float _1676 = _1618;
    float _1678 = _1624;
    float _1680 = _1608;
    float _1682 = _1610;
    float _1684 = fma(_1674, 6.2500002968590706586837768554688e-05, 0.5);
    float _1686 = fma(_1676, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _5370 = float2(_1684, _1686);
    float3 _1690 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_5370, float2(0.0), isnan(_5370)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_5370, float2(0.0), isnan(_5370)), level(0.0)).xyz;
    float _1692 = _1690.x;
    float _1694 = _1690.y;
    float _1696 = _1690.z;
    float _1698 = _1524 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1700 = _1524 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1702 = _1524 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1704 = _1528 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1706 = fma(_1510, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1698);
    float _1708 = fma(_1510, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1700);
    float _1710 = _1508 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1712 = _1508 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1714 = _1508 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1716 = fma(_1510, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1702);
    float _1718 = -_1496;
    float _1720 = fma(_1718, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1710);
    float _1722 = -_1496;
    float _1724 = fma(_1722, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1712);
    float _1726 = -_1496;
    float _1728 = fma(_1726, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1714);
    float _1730 = _1528 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1732 = _1528 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1734 = fma(_1536, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1706);
    float _1736 = fma(_1536, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1708);
    float _1738 = fma(_1536, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1716);
    float _1740 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1742 = _1678 + _1740;
    float _1744 = fma(_1514, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1704);
    float _1746 = fma(_1514, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1730);
    float _1748 = fma(_1514, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1732);
    float _1750 = fma(_1742, _1742, _1680);
    float _1752 = fma(_1512, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1720);
    float _1754 = fma(_1512, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1724);
    float _1756 = _189 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1758 = fma(_1512, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1728);
    float _1760 = _1750 + _1682;
    float _1762 = _185 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1764 = _1756 * _1752;
    float _1766 = _1756 * _1754;
    float _1768 = _1756 * _1758;
    float _1770 = fma(_1544, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1744);
    float _1772 = sqrt(_1760);
    float _1774 = fma(_1762, _1734, _1764);
    float _1776 = fma(_1544, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1746);
    float _1778 = fma(_1544, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1748);
    float _1780 = fma(_1762, _1736, _1766);
    float _1782 = fma(_1762, _1738, _1768);
    float _1784 = _1770 + _1774;
    float _1786 = _1776 + _1780;
    float _1788 = _1778 + _1782;
    out.m_82.x = _1784;
    out.m_82.y = _1786;
    out.m_82.z = _1788;
    bool _1790 = _1772 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1792 = isnan(_1772);
    bool _1794 = _1790 || _1792;
    bool _1796 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1798 = _1794 || _1796;
    float _1800 = _1762;
    float _1802 = _1674;
    if (!_1798)
    {
        _1800 = 1.0;
    }
    float _1804 = _1800;
    out.m_84.x = _1692;
    out.m_84.y = _1694;
    out.m_84.z = _1696;
    bool _1806 = !_1798;
    float _1808 = _1804;
    if (!_1806)
    {
        bool _1810 = _1772 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1812 = isnan(_1772);
        bool _1814 = _1810 || _1812;
        bool _1816 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1818 = _1814 || _1816;
        if (!_1818)
        {
            float _1820 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1822 = _1772 + _1820;
            float _1824 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1826 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1824;
            float _1828 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1830 = _1828 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1832 = 1.0 / _1826;
            float _1834 = _1822 * _1832;
            float _1836 = fma(_1834, _1830, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1808 = _1836;
            _1838 = true;
        }
        else
        {
            bool _1840 = _1772 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1842 = isnan(_1772);
            bool _1844 = _1840 || _1842;
            bool _1846 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1848 = _1844 || _1846;
            if (!_1848)
            {
                float _1850 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1852 = _1772 + _1850;
                float _1854 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1856 = _1854 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1858 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1860 = _1858 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1862 = 1.0 / _1856;
                float _1864 = _1852 * _1862;
                float _1866 = fma(_1864, _1860, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1808 = _1866;
                _1838 = true;
            }
            else
            {
                _1808 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1838 = false;
    float _1868 = _1808;
    float _1870 = _1360 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1872 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1874 = _1678 + _1872;
    float _1876 = fma(_1366, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1870);
    float _1878 = _1360 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1880 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1882 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1884 = _1880 || _1882;
    bool _1886 = isnan(0.5);
    bool _1888 = _1884 || _1886;
    float _1890 = fma(_1874, _1868, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1892 = fma(_1376, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1876);
    bool _1894 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1896 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1898 = _1894 || _1896;
    bool _1900 = isnan(0.5);
    bool _1902 = _1898 || _1900;
    float _1904 = _1892 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1906 = fma(_1366, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1878);
    float _1908 = -_1354;
    float _1910 = _1908 + _1890;
    float _1912 = 1.0 / _1904;
    float _1914 = fma(_1376, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1906);
    float _1916 = _1914 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1918 = _1916 + _1904;
    float _1920 = _1918 * _1912;
    float _1922 = _1920 * 0.5;
    float _1924 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1926 = _1674 + _1924;
    float _1928 = _1910;
    if (_1902)
    {
        _1802 = 1.0;
    }
    float _1930 = _1802;
    float _1932 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1934 = fma(_1922, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1932);
    float _1936 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1938 = _1676 + _1936;
    float _1940 = fma(_1926, _1868, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1942 = 1.0 / _1934;
    float _1944 = fma(_1938, _1868, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1946 = -_1352;
    float _1948 = _1946 + _1940;
    float _1950 = -_1362;
    float _1952 = _1950 + _1944;
    float _1954 = _1948;
    float _1956 = _1952;
    float _1958 = _1930;
    if (!_1888)
    {
        float _1960 = _1372 * _1372;
        float _1962 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1964 = -_672;
        float _1966 = _1964 + _1944;
        float _1968 = -_666;
        float _1970 = _1968 + _1890;
        float _1972 = fma(_1380, _1380, _1960);
        float _1974 = -_712;
        float _1976 = _1974 + _1940;
        float _1978 = fma(_1388, _1388, _1972);
        float _1980 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1982 = sqrt(_1978);
        float _1984 = 1.0 / _1482;
        float _1986 = _1980 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1988 = precise::min(_1982, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1990 = _1988 * _1962;
        float _1992 = _1990 * _1984;
        float _1994 = _1986 * _1992;
        float _1996 = _1966 * _1992;
        float _1998 = fma(_1970, _1994, _1360);
        float _2000 = fma(_1976, _1994, _1366);
        float _2002 = fma(_1986, _1996, _1376);
        _1928 = _1998;
        _1954 = _2000;
        _1956 = _2002;
        _1446 = _1982;
        _784 = _1996;
    }
    float _2004 = _1928;
    float _2006 = _1954;
    float _2008 = _1956;
    float _2010 = _1446;
    float _2012 = _784;
    float _2014 = _2012;
    float _2016 = _2010;
    if (_1902)
    {
        _2014 = 1.0;
    }
    float _2018 = _2014;
    float _2020 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2022 = _1942 * _2020;
    float _2024 = _2018;
    if (!_1902)
    {
        float _2026 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2028 = _2026 * 0.15915493667125701904296875;
        float _2030 = _2028 * 6.283185482025146484375;
        float _2032 = cos(_2030);
        float _2034 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2036 = _2034 * 0.15915493667125701904296875;
        float _2038 = _2028 * 6.283185482025146484375;
        float _2040 = sin(_2038);
        float _2042 = 1.0 / _2032;
        float _2044 = _2036 * 6.283185482025146484375;
        float _2046 = cos(_2044);
        float _2048 = _2040 * _2042;
        float _2050 = _2036 * 6.283185482025146484375;
        float _2052 = sin(_2050);
        float _2054 = _2046 * _2048;
        float _2056 = 1.0 / _2054;
        float _2058 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2060 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2058;
        float _2062 = 1.0 / _2060;
        float _2064 = _2052 * _2056;
        float _2066 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2068 = fma(_2022, _2064, _2066);
        float _2070 = _2068 * _2062;
        float _2072 = precise::clamp(_2070, 0.0, 1.0);
        _1958 = _2072;
    }
    float _2074 = _1958;
    if (!_1902)
    {
        float _2076 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2078 = _2076 * 0.15915493667125701904296875;
        float _2080 = _2078 * 6.283185482025146484375;
        float _2082 = cos(_2080);
        float _2084 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2086 = _2084 * 0.15915493667125701904296875;
        float _2088 = _2078 * 6.283185482025146484375;
        float _2090 = sin(_2088);
        float _2092 = 1.0 / _2082;
        float _2094 = _2086 * 6.283185482025146484375;
        float _2096 = cos(_2094);
        float _2098 = _2090 * _2092;
        float _2100 = _2086 * 6.283185482025146484375;
        float _2102 = sin(_2100);
        float _2104 = _2096 * _2098;
        float _2106 = 1.0 / _2104;
        float _2108 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2110 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2108;
        float _2112 = 1.0 / _2110;
        float _2114 = _2102 * _2106;
        float _2116 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2118 = fma(_2022, _2114, _2116);
        float _2120 = _2118 * _2112;
        float _2122 = precise::clamp(_2120, 0.0, 1.0);
        float _2124 = -_2122;
        float _2126 = _2124 + 1.0;
        _1448 = _2104;
        _2024 = _2126;
    }
    float _2128 = _1448;
    float _2130 = _2024;
    float _2132 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2134 = _2004 + _2132;
    float _2136 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2138 = _2006 + _2136;
    float _2140 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2142 = _2008 + _2140;
    float _2144 = _2134 * _2134;
    float _2146 = fma(_2138, _2138, _2144);
    float _2148 = fma(_2142, _2142, _2146);
    float _2150 = rsqrt(_2148);
    float _2152 = _2150 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2154 = _2138 * _2152;
    float _2156 = _2142 * _2152;
    float _2158 = _2154 * _2154;
    float _2160 = _2156 * _2156;
    float _2162 = _2158 + _2160;
    float _2164 = sqrt(_2162);
    bool _2166 = _2164 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2168 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2170 = _2164 + _2168;
    float _2172 = _2150;
    float _2174 = _2162;
    float _2176 = _2170;
    float _2178 = _2128;
    float _2180 = _2152;
    if (_2166)
    {
        float _2182 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2172 = _2182;
    }
    float _2184 = _2172;
    if (_2166)
    {
        float _2186 = rsqrt(_2162);
        _2174 = _2186;
    }
    float _2188 = _2174;
    float _2190 = _2188;
    if (_2166)
    {
        float _2192 = _2170 * _2184;
        _2176 = _2192;
    }
    float _2194 = _2176;
    if (_2166)
    {
        float _2196 = _2194 * 0.15915493667125701904296875;
        _2016 = _2196;
    }
    float _2198 = _2016;
    float _2200 = _2184;
    float _2202 = _2198;
    if (_2166)
    {
        float _2204 = _2198 * 6.283185482025146484375;
        float _2206 = sin(_2204);
        _2200 = _2206;
    }
    float _2208 = _2200;
    float _2210 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2212 = precise::max(0.0, _2210);
    float _2214 = _2142;
    float _2216 = _2212;
    if (_2166)
    {
        float _2218 = _2198 * 6.283185482025146484375;
        float _2220 = cos(_2218);
        _2214 = _2220;
    }
    float _2222 = _2214;
    float _2224 = -_2152;
    float _2226 = -_2212;
    float _2228 = fma(_2134, _2224, _2226);
    float _2230 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_2166)
    {
        float _2232 = _2228 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2216 = _2232;
    }
    float _2234 = _2216;
    if (!_2166)
    {
        _2202 = _2154;
    }
    float _2236 = _2202;
    float _2238 = _2208;
    float _2240 = _2236;
    if (_2166)
    {
        float _2242 = fma(_2208, _2234, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2178 = _2242;
    }
    float _2244 = _2178;
    float _2246 = fma(_1366, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2248 = _2244;
    if (!_2166)
    {
        _2238 = _2156;
    }
    float _2250 = _2238;
    float _2252 = sqrt(_2148);
    float _2254 = _2250;
    float _2256 = _2222;
    if (_2166)
    {
        float _2258 = _2222 + (-1.0);
        _2230 = _2258;
    }
    float _2260 = _2230;
    float _2262 = _2260;
    if (_2166)
    {
        float _2264 = _2188 * _2244;
        _2180 = _2264;
    }
    float _2266 = _2180;
    if (!_2166)
    {
        _2248 = _2228;
    }
    float _2268 = _2248;
    float _2270 = _2268;
    if (_2166)
    {
        float _2272 = _2260 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2262 = _2272;
    }
    float _2274 = _2262;
    if (_2166)
    {
        float _2276 = _2154 * _2266;
        _2240 = _2276;
    }
    float _2278 = _2240;
    if (!_2166)
    {
        _2190 = _2158;
    }
    float _2280 = _2190;
    float _2282 = _2280;
    if (_2166)
    {
        float _2284 = _2156 * _2266;
        _2254 = _2284;
    }
    float _2286 = _2254;
    if (_2166)
    {
        float _2288 = fma(_2228, _2222, _2274);
        _2270 = _2288;
    }
    float _2290 = _2270;
    if (_2166)
    {
        float _2292 = _2278 * _2278;
        _2282 = _2292;
    }
    float _2294 = _2282;
    if (!_2166)
    {
        _2256 = _2160;
    }
    float _2296 = _2256;
    float _2298 = _2296;
    if (_2166)
    {
        float _2300 = _2286 * _2286;
        _2298 = _2300;
    }
    float _2302 = _2298;
    float _2304 = _2004 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2306 = fma(_2290, _2290, _2294);
    float _2308 = floor(_2246);
    float _2310 = _2306 + _2302;
    float _2312 = fma(_2006, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2304);
    float _2314 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2316 = fma(_2252, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2314);
    float _2318 = precise::clamp(_2316, 0.0, 1.0);
    float _2320 = fma(_1376, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2322 = fma(_2008, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2312);
    float _2324 = rsqrt(_2310);
    float _2326 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2328 = -_2318;
    float _2330 = _2328 + 1.0;
    float _2332 = _2322 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2334 = _2004 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2336 = _2332 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2338 = abs(_2330);
    float _2340 = log2(_2338);
    float _2342 = _2004 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2344 = -_2336;
    float _2346 = fma(_2344, _2326, 1.0);
    float _2348 = _2004 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2350 = fma(_2006, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2342);
    float _2352 = fma(_2006, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2334);
    float _2354 = _2324 * _2278;
    float _2356 = _2324 * _2290;
    float _2358 = _2324 * _2286;
    float _2360 = fma(_2006, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2348);
    float _2362 = fma(_2008, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2350);
    float _2364 = _2354 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2366 = floor(_2320);
    float _2368 = fma(_2008, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2360);
    float _2370 = _2362 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2372 = -_2364;
    float _2374 = fma(_2356, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2372);
    float _2376 = fma(_2008, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2352);
    float _2378 = _2368 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2380 = _2370 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2382 = -_2358;
    float _2384 = fma(_2382, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2374);
    float _2386 = _2340 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2388 = log2(_2346);
    float _2390 = fma(_2378, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2380);
    float _2392 = fma(_2384, -0.5, 0.5);
    float _2394 = -_2308;
    float _2396 = _2246 + _2394;
    float _2398 = fma(_2332, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2390);
    float _2400 = fma(_2384, 0.5, 0.5);
    float _2402 = _2370 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2404 = exp2(_2386);
    float _2406 = _2376 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2408 = _2370 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2410 = -_2366;
    float _2412 = _2320 + _2410;
    float _2414 = fma(_2400, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2416 = fma(_2406, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2398);
    float _2418 = fma(_2378, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2402);
    float _2420 = fma(_2378, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2408);
    float _2422 = sqrt(_2392);
    float _2424 = _2356 + 1.0;
    float _2426 = fma(_2332, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2418);
    float _2428 = fma(_2332, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2420);
    float _2430 = fma(_2400, _2414, -0.212114393711090087890625);
    float _2432 = _2388 * 0.693147182464599609375;
    float _2434 = fma(_2406, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2426);
    float _2436 = 1.0 / _2416;
    float _2438 = -_2356;
    float _2440 = fma(_2404, _2424, _2438);
    float _2442 = fma(_2406, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2428);
    float _2444 = fma(_2400, _2430, 1.570728778839111328125);
    float2 _6621 = float2(_2396, _2412);
    float _2446 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6621, float2(0.0), isnan(_6621)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6621, float2(0.0), isnan(_6621)), level(0.0)).x;
    float _2448 = _2432 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2450 = fma(_2440, 0.5, 0.5);
    float _2452 = _2422 * 0.636619746685028076171875;
    float _2454 = -_2444;
    float _2456 = fma(_2452, _2454, 1.0);
    float _2458 = _2434 * _2436;
    float _2460 = _2442 * _2436;
    float _2462 = fma(_2458, 0.5, 0.5);
    float _2464 = fma(_2460, -0.5, 0.5);
    float3 _6654 = float3(_2462, _2464, _2448);
    float _2466 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6654, float3(0.0), isnan(_6654)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6654, float3(0.0), isnan(_6654)), level(0.0)).x;
    float3 _6665 = float3(_2462, _2464, _2448);
    float4 _2469 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6665, float3(0.0), isnan(_6665)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6665, float3(0.0), isnan(_6665)), level(0.0)).xyzw;
    float _2471 = _2469.x;
    float _2473 = _2469.y;
    float _2475 = _2469.z;
    float _2477 = _2469.w;
    float2 _6681 = float2(_2456, _2450);
    float3 _2479 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6681, float2(0.0), isnan(_6681)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6681, float2(0.0), isnan(_6681)), level(0.0)).xyz;
    float _2481 = _2479.x;
    float _2483 = _2479.y;
    float _2485 = _2479.z;
    float _2487 = abs(_2022);
    float _2489 = log2(_2487);
    float _2491 = _2370 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2493 = _2252 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2495 = isnan(_2252);
    bool _2497 = _2493 || _2495;
    bool _2499 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2501 = _2497 || _2499;
    float _2503 = fma(_2378, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2491);
    float _2505 = _2340 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2507 = _2022 <= 8000.0;
    bool _2509 = isnan(_2022);
    bool _2511 = _2507 || _2509;
    bool _2513 = isnan(8000.0);
    bool _2515 = _2511 || _2513;
    float _2517 = float(_2515);
    float _2519 = fma(_2332, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2503);
    float _2521 = in.m_86.x;
    float _2523 = exp2(_2505);
    float _2525 = fma(_2406, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2519);
    float _2527 = _2416 * 0.5;
    float _2529 = _2489 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    out.gl_Position.x = _2434;
    out.gl_Position.y = _2442;
    out.gl_Position.z = _2525;
    out.gl_Position.w = _2416;
    float _2531 = exp2(_2529);
    float _2533 = -_2523;
    float _2535 = _2533 + 1.0;
    float _2537 = fma(_2442, -0.5, _2527);
    float _2539 = _2535 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2541 = _2442;
    float _2543 = _2525;
    float _2545 = _2416;
    float _2547 = _2539;
    if (!_2501)
    {
        _2541 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2549 = _2541;
    float _2551 = fma(_2531, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2553 = precise::clamp(_2551, 0.0, 1.0);
    float _2555 = _2525 + _2416;
    float _2557 = _2549;
    float _2559 = _2549;
    if (!_2501)
    {
        _2543 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2561 = _2543;
    float _2563 = fma(_2553, -2.0, 3.0);
    float _2565 = _2553 * _2553;
    float _2567 = _2555 * 0.5;
    float _2569 = _2565 * _2563;
    float _2571 = -_2569;
    float _2573 = _2571 + 1.0;
    float _2575 = fma(_2573, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2569);
    float _2577 = _2434 + _2416;
    float _2579 = -_2539;
    float _2581 = _2579 + 1.0;
    float _2583 = _2517 * _2575;
    float _2585 = _2577 * 0.5;
    float _2587 = _2561;
    float _2589 = _2561;
    if (!_2501)
    {
        _2545 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2591 = _2545;
    float _2593 = _2583 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_88.x = _2585;
    out.m_88.y = _2537;
    out.m_88.z = _2567;
    out.m_88.w = _2416;
    float _2595 = -_2446;
    float _2597 = _2595 + 1.0;
    float _2599 = _2597 * _2593;
    float _2601 = precise::clamp(_2599, 0.0, 1.0);
    float _2603 = -_2601;
    float _2605 = fma(_2603, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2607 = _2605 * _2521;
    float _2609 = _2539 * _2466;
    float _2611 = _2477 * _2581;
    float _2613 = _2074 * _2130;
    float _2615 = _2607;
    float _2617 = _2613;
    float _2619 = _2591;
    float _2621 = _2591;
    if (!_2501)
    {
        _2547 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2623 = _2547;
    float _2625 = _2477 * _2609;
    float _2627 = _2485 * _2609;
    float _2629 = fma(_2481, _2625, _2471);
    float _2631 = fma(_2483, _2625, _2473);
    float _2633 = _2607 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2635 = fma(_2477, _2627, _2475);
    float _2637 = _2613 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2639 = _2623;
    float _2641 = _2623;
    if (!_2501)
    {
        _2615 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2643 = _2615;
    out.m_90.x = _2633;
    float _2645 = _2643;
    float _2647 = _2643;
    if (!_2501)
    {
        _2617 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2649 = _2617;
    out.m_92.x = _2629;
    out.m_92.y = _2631;
    out.m_92.z = _2635;
    out.m_92.w = _2611;
    bool _2651 = !_2501;
    float _2653 = _2649;
    float _2655 = _2649;
    if (!_2651)
    {
        bool _2657 = _2252 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2659 = isnan(_2252);
        bool _2661 = _2657 || _2659;
        bool _2663 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2665 = _2661 || _2663;
        if (!_2665)
        {
            float _2667 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2669 = _2252 + _2667;
            float _2671 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2673 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2671;
            float _2675 = 1.0 / _2673;
            float _2677 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2679 = _2677 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2681 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2683 = _2681 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2685 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2687 = _2685 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2689 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2691 = _2689 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2693 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2695 = _2693 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2697 = _2669 * _2675;
            float _2699 = precise::clamp(_2697, 0.0, 1.0);
            float _2701 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2703 = _2701 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2705 = fma(_2699, _2679, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2707 = fma(_2699, _2703, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2709 = fma(_2699, _2683, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2711 = fma(_2699, _2687, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2713 = fma(_2699, _2691, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2715 = fma(_2699, _2695, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2647 = _2707;
            _2559 = _2713;
            _2641 = _2705;
            _2589 = _2711;
            _2621 = _2709;
            _2655 = _2715;
            _2717 = true;
        }
        else
        {
            bool _2719 = _2252 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2721 = isnan(_2252);
            bool _2723 = _2719 || _2721;
            bool _2725 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2727 = _2723 || _2725;
            if (!_2727)
            {
                _2639 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2729 = _2639;
            _2641 = _2729;
            if (!_2727)
            {
                _2645 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2731 = _2645;
            _2647 = _2731;
            if (!_2727)
            {
                _2619 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2733 = _2619;
            _2621 = _2733;
            if (!_2727)
            {
                _2587 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2735 = _2587;
            _2589 = _2735;
            if (!_2727)
            {
                _2557 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2737 = _2557;
            _2559 = _2737;
            if (!_2727)
            {
                _2653 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2739 = _2653;
            bool _2741 = !_2727;
            _2655 = _2739;
            if (!_2741)
            {
                bool _2743 = _2252 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2745 = isnan(_2252);
                bool _2747 = _2743 || _2745;
                bool _2749 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2751 = _2747 || _2749;
                if (!_2751)
                {
                    float _2753 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2755 = _2252 + _2753;
                    float _2757 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2759 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2757;
                    float _2761 = 1.0 / _2759;
                    float _2763 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2765 = _2763 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2767 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2769 = _2767 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2771 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2773 = _2771 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2775 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2777 = _2775 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2779 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2781 = _2779 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2783 = _2755 * _2761;
                    float _2785 = precise::clamp(_2783, 0.0, 1.0);
                    float _2787 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2789 = _2787 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2791 = fma(_2785, _2765, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2793 = fma(_2785, _2789, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2795 = fma(_2785, _2769, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2797 = fma(_2785, _2773, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2799 = fma(_2785, _2777, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2801 = fma(_2785, _2781, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2647 = _2793;
                    _2559 = _2799;
                    _2641 = _2791;
                    _2589 = _2797;
                    _2621 = _2795;
                    _2655 = _2801;
                    _2717 = true;
                }
                else
                {
                    _2647 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2559 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2641 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2589 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2621 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2655 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2717 = false;
    float _2803 = _2647;
    float _2805 = _2559;
    float _2807 = _2641;
    float _2809 = _2589;
    float _2811 = _2621;
    float _2813 = _2655;
    float _2815 = fma(_1786, -0.5, 0.5);
    float _2817 = precise::clamp(_2815, 0.0, 1.0);
    float _2819 = -_2803;
    float _2821 = _2819 + _2805;
    float _2823 = -_2807;
    float _2825 = _2823 + _2809;
    out.m_94.x = 0.0;
    float _2827 = fma(_2817, _2821, _2803);
    float _2829 = -_2811;
    float _2831 = _2829 + _2813;
    float _2833 = fma(_2817, _2825, _2807);
    float _2835 = _2827 * 0.586610972881317138671875;
    bool _2837 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2839 = fma(_2817, _2831, _2811);
    float _2841 = _2637 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2843 = fma(_2833, 0.298911988735198974609375, _2835);
    bool _2845 = _2074 > 0.0;
    bool _2847 = isnan(_2074);
    bool _2849 = _2845 || _2847;
    bool _2851 = isnan(0.0);
    bool _2853 = _2849 || _2851;
    float _2855 = fma(_2839, 0.114477999508380889892578125, _2843);
    out.m_57.x = _2841;
    bool _2857 = _2130 <= 0.0;
    bool _2859 = !_2853;
    bool _2861 = _2857 || _2859;
    float _2863 = -_2855;
    float _2865 = _2833 + _2863;
    float _2867 = -_2855;
    float _2869 = _2827 + _2867;
    float _2871 = -_2855;
    float _2873 = _2839 + _2871;
    float _2875 = fma(_2865, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2855);
    float _2877 = fma(_2869, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2855);
    float _2879 = fma(_2873, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2855);
    bool _2881 = !_2837;
    if (!_2881)
    {
        float _2883 = -_2004;
        float _2885 = _2883 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2887 = -_2006;
        float _2889 = _2887 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2891 = -_2008;
        float _2893 = _2891 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2895 = _2885 * _2885;
        float _2897 = fma(_2889, _2889, _2895);
        float _2899 = fma(_2893, _2893, _2897);
        float _2901 = sqrt(_2899);
        float _2903 = rsqrt(_2899);
        float _2905 = -_2901;
        float _2907 = _2905 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2909 = _2907 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2911 = precise::clamp(_2909, 0.0, 1.0);
        float _2913 = _2889 * _2903;
        float _2915 = _2885 * _2903;
        float _2917 = abs(_2911);
        float _2919 = log2(_2917);
        float _2921 = _2893 * _2903;
        float _2923 = _2913 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2925 = _1786 * _2915;
        float _2927 = -_2915;
        float _2929 = -_2923;
        float _2931 = fma(_2927, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2929);
        float _2933 = fma(_1784, _2913, _2925);
        float _2935 = -_2921;
        float _2937 = fma(_2935, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2931);
        float _2939 = fma(_1788, _2921, _2933);
        float _2941 = precise::clamp(_2939, 0.0, 1.0);
        float _2943 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2945 = _2937 + _2943;
        float _2947 = _2919 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2949 = _2945 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2951 = precise::clamp(_2949, 0.0, 1.0);
        float _2953 = exp2(_2947);
        float _2955 = _2953 * _2951;
        float _2957 = _2941 * _2955;
        float _2959 = _2957 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2961 = _2957 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2963 = _2957 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_94.x = _2959;
        out.m_94.y = _2961;
        out.m_94.z = _2963;
    }
    out.m_96.x = _2875;
    out.m_96.y = _2877;
    out.m_96.z = _2879;
    if (!_2861)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_57.x = 0.0;
    float _2965 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2965;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}


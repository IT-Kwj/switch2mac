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
    float4 m_70 [[user(locn0)]];
    float4 m_64 [[user(locn1)]];
    float4 m_55 [[user(locn2)]];
    float4 m_86 [[user(locn3)]];
    float4 m_53 [[user(locn4)]];
    float4 m_66 [[user(locn5)]];
    float4 m_78 [[user(locn6)]];
    float4 m_72 [[user(locn7)]];
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
    float4 m_68 [[attribute(1)]];
    float4 m_48 [[attribute(2)]];
    float4 m_50 [[attribute(3)]];
    float4 m_60 [[attribute(4)]];
    float4 m_62 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2681 = false;
    bool _1856 = false;
    bool _297 = false;
    bool _201 = false;
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
        float _2991 = as_type<float>(_129);
        out.gl_Position.z = _2991;
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
        float _3046 = as_type<float>(_155);
        out.gl_Position.z = _3046;
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
    float _199;
    if (!_181)
    {
        float _183 = in.m_60.x;
        float _185 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _187 = _183 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _189 = fma(_187, (*spvDescriptorSet0.vp_c9)._m0[12].x, _111);
        float _191 = _189 * _185;
        float _193 = floor(_191);
        float _195 = -_193;
        float _197 = _191 + _195;
        _199 = _197;
        _201 = true;
    }
    else
    {
        _199 = _163;
    }
    _201 = false;
    float _203 = _199;
    float _205 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _207 = _203 + _205;
    bool _209 = _203 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _211 = isnan(_203);
    bool _213 = _209 || _211;
    bool _215 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _217 = _213 || _215;
    float _219 = float(_217);
    float _221 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _223 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _221;
    float _225 = -_219;
    float _227 = _225 + 1.0;
    bool _229 = _203 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _231 = isnan(_203);
    bool _233 = _229 || _231;
    bool _235 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _237 = _233 || _235;
    float _239 = float(_237);
    float _241 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _243 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _241;
    bool _245 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _247 = 1.0 / _223;
    float _249 = _239 * _227;
    float _251 = -_239;
    float _253 = _251 + 1.0;
    float _255 = _207 * _247;
    float _257 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _259 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _257;
    float _261 = fma(_243, _255, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _263 = fma(_259, _255, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _265 = _261 * _249;
    float _267 = _263 * _249;
    float _269 = fma(_253, (*spvDescriptorSet0.vp_c9)._m0[143].x, _265);
    float _271 = fma(_253, (*spvDescriptorSet0.vp_c9)._m0[143].y, _267);
    float _273 = fma(_219, (*spvDescriptorSet0.vp_c9)._m0[144].x, _269);
    float _275 = fma(_219, (*spvDescriptorSet0.vp_c9)._m0[144].y, _271);
    bool _277 = !_245;
    float _295;
    if (!_277)
    {
        float _279 = in.m_60.x;
        float _281 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _283 = _279 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _285 = fma(_283, (*spvDescriptorSet0.vp_c9)._m0[11].y, _111);
        float _287 = _285 * _281;
        float _289 = floor(_287);
        float _291 = -_289;
        float _293 = _287 + _291;
        _295 = _293;
        _297 = true;
    }
    else
    {
        _295 = _163;
    }
    _297 = false;
    float _299 = _295;
    float _301 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _303 = int(_301);
    float _305 = in.m_60.x;
    float _307 = in.m_60.y;
    float _309 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _311 = int(_309);
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _315 = _313 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _317 = float(_303);
    float _319 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _321 = log2(_319);
    float _323 = float(uint(_311));
    float _325 = 1.0 / _317;
    int _327 = ~_311;
    int _329 = _327 + 1;
    float _331 = _307 * 2.0;
    float _333 = float(_311);
    int _335 = ~_311;
    int _337 = _335 + 1;
    float _339 = 1.0 / _323;
    float _341 = _321 * _111;
    float _343 = _325 * _111;
    float _345 = exp2(_341);
    int _347 = as_type<int>(_339) + (-2);
    float _349 = trunc(_343);
    int _351 = int(_349);
    float _353 = 1.0 / _315;
    float _355 = -_345;
    float _357 = _355 + 1.0;
    float _359 = float(uint(_351));
    float _361 = floor(_331);
    float _363 = float(_351);
    float _365 = as_type<float>(_347) * _359;
    float _367 = trunc(_365);
    float _369 = precise::max(_367, 0.0);
    uint _372 = uint(_369);
    int _374 = ~_311;
    int _376 = _374 + 1;
    int _378 = _329 * int(_372);
    int _380 = _378 + _351;
    float _382 = float(uint(_380));
    float _384 = as_type<float>(_347) * _382;
    int _386 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _388 = _386 != 0;
    bool _390 = _363 >= _333;
    bool _392 = isnan(_363);
    bool _394 = _390 || _392;
    bool _396 = isnan(_333);
    bool _398 = _394 || _396;
    float _400 = float(_398);
    float _402 = trunc(_384);
    float _404 = precise::max(_402, 0.0);
    uint _406 = uint(_404);
    int _408 = int(_372) + int(_406);
    float _410 = trunc(_400);
    int _412 = int(_410);
    int _414 = _376 * _408;
    int _416 = _414 + _351;
    bool _418 = !_388;
    float _420 = _418 ? 7.345489978790283203125 : 1.0;
    bool _422 = uint(_416) >= uint(_311);
    float _424 = _420 * _305;
    bool _426 = !_422;
    int _428 = _426 ? 0 : (-1);
    float _430 = floor(_424);
    bool _432 = _311 == 0;
    int _434 = ~_408;
    int _436 = _434 + _428;
    int _438 = _436 + 1;
    int _440 = ~_412;
    int _442 = _440 + 1;
    int _444 = _442 + 1;
    int _446 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _448 = _446 != 0;
    int _450 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _452 = _450 != 0;
    int _454 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _456 = _454 != 0;
    int _458 = _311 * _438;
    int _460 = _458 + _351;
    int _462 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _464 = _462 != 0;
    int _466 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _468 = _466 != 0;
    bool _470 = !_432;
    int _472 = _470 ? _460 : (-1);
    float _474 = -_430;
    float _476 = _424 + _474;
    int _478 = _311 + (-1);
    int _480 = _472 * _444;
    float _482 = in.m_62.x;
    float _484 = in.m_62.y;
    float _486 = _476 * _333;
    float _488 = _333 * _111;
    int _490 = _412 * _478;
    int _492 = _490 + _480;
    bool _494 = !_452;
    int _496 = _494 ? 0 : 1;
    float _498 = _488 * _159;
    bool _500 = !_448;
    int _502 = _500 ? 0 : 1;
    float _504 = trunc(_486);
    int _506 = int(_504);
    int _508 = abs(_496);
    int _510 = abs(_502);
    bool _512 = !_464;
    int _514 = _512 ? 0 : 1;
    float _516 = trunc(_498);
    int _518 = int(_516);
    int _520 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _522 = _520 != 0;
    int _524 = _492 * _508;
    int _526 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _528 = _526 != 0;
    int _530 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _532 = _530 != 0;
    int _534 = abs(_514);
    float _536 = _273 * _482;
    bool _538 = !_468;
    int _540 = _538 ? 0 : 1;
    int _542 = _506 * _534;
    int _544 = _542 + _351;
    bool _546 = !_456;
    int _548 = _546 ? 0 : 1;
    int _550 = abs(_540);
    int _552 = _518 * _510;
    int _554 = _552 + _524;
    int _556 = abs(_548);
    float _558 = in.m_48.x;
    float _560 = in.m_48.y;
    float _562 = in.m_48.z;
    float _564 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _566 = _564 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    int _568 = _544 * _556;
    int _570 = _568 + _554;
    float _572 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _574 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _576 = _574 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _578 = 1.0 / _566;
    int _580 = _506 * _550;
    int _582 = _580 + _570;
    float _584 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _586 = _305 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _588 = _307 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _590 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _592 = isnan(0.0);
    bool _594 = _590 || _592;
    bool _596 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _598 = _594 || _596;
    float _600 = 1.0 / _576;
    float _602 = -_584;
    float _604 = fma(_586, 2.0, _602);
    float _606 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _608 = _305 * 2.0;
    float _610 = fma(_588, -2.0, _572);
    float _612 = _598 ? _357 : 0.0;
    out.m_64.w = _606;
    float _614 = _560 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _616 = _560 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _618 = _560 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _620 = float(uint(_582));
    float _622 = fma(_558, (*spvDescriptorSet0.vp_c10)._m0[4].x, _614);
    float _624 = fma(_558, (*spvDescriptorSet0.vp_c10)._m0[5].x, _616);
    float _626 = fma(_558, (*spvDescriptorSet0.vp_c10)._m0[6].x, _618);
    float _628 = as_type<float>(_347) * _620;
    float _630 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _632 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _630;
    float _634 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _636 = _634 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _638 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _640 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _638;
    float _642 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _644 = _642 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    int _646 = ~_311;
    int _648 = _646 + 1;
    float _650 = trunc(_628);
    float _652 = precise::max(_650, 0.0);
    uint _654 = uint(_652);
    float _656 = _636 * _600;
    float _658 = _640 * _578;
    float _660 = _632 * _353;
    float _662 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _664 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _666 = isnan(1.0);
    bool _668 = _664 || _666;
    bool _670 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _672 = _668 || _670;
    float _674 = floor(_608);
    float _676 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _678 = 1.0 + _676;
    float _680 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _682 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[78].w, _662);
    float _684 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _686 = _684 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _688 = 1.0 / _644;
    float _690 = 1.0 / _678;
    int _692 = _648 * int(_654);
    int _694 = _692 + _582;
    bool _696 = _674 > 0.0;
    float _698 = in.m_60.z;
    bool _700 = _674 >= 0.0;
    bool _702 = isnan(_674);
    bool _704 = _700 || _702;
    bool _706 = isnan(0.0);
    bool _708 = _704 || _706;
    float _710 = _307 + _305;
    float _712 = float(uint(_694));
    float _714 = fma(_305, (*spvDescriptorSet0.vp_c9)._m0[78].z, _680);
    float _716 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[77].w, _682);
    float _718 = _710 + (-1.0);
    float _720 = as_type<float>(_347) * _712;
    float _722 = -_111;
    float _724 = fma(_722, (*spvDescriptorSet0.vp_c9)._m0[76].x, _604);
    float _726 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[77].z, _714);
    float _728 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[76].y, _610);
    int _730 = _708 ? 0 : 1;
    if (_672)
    {
        float _732 = _612 * _690;
        _121 = _732;
    }
    float _734 = _121;
    float _736 = trunc(_720);
    float _738 = precise::max(_736, 0.0);
    uint _740 = uint(_738);
    bool _742 = _305 > 0.5;
    float _744 = fma(_718, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _746 = _361 >= 0.0;
    bool _748 = isnan(_361);
    bool _750 = _746 || _748;
    bool _752 = isnan(0.0);
    bool _754 = _750 || _752;
    float _756 = _686 * _688;
    float _758 = -_175;
    int _760 = _742 ? as_type<int>(_758) : as_type<int>(_175);
    float _762 = -_726;
    float _764 = _762 + 1.0;
    bool _766 = _361 > 0.0;
    float _768 = -_716;
    float _770 = _768 + 1.0;
    float _772 = float(uint(_544));
    float _774 = _698 * 2.0;
    int _776 = ~_730;
    int _778 = _776 + 1;
    int _780 = _778 + 1;
    int _782 = _780;
    if (!_696)
    {
        int _784 = ~_730;
        int _786 = _784 + 1;
        _782 = _786;
    }
    int _788 = _782;
    float _790 = as_type<float>(_347) * _772;
    float _792 = _307 + _698;
    int _794 = int(_654) + int(_740);
    float _796 = floor(_774);
    int _798 = ~_311;
    int _800 = _798 + 1;
    float _802 = _792 + (-1.0);
    bool _804 = _307 > 0.5;
    int _806 = _800 * _794;
    int _808 = _806 + _582;
    float _810 = trunc(_790);
    float _812 = precise::max(_810, 0.0);
    uint _814 = uint(_812);
    float _816 = fma(_802, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _818 = _754 ? 0 : 1;
    float _820 = -_179;
    int _822 = _804 ? as_type<int>(_820) : as_type<int>(_179);
    bool _824 = uint(_808) >= uint(_311);
    bool _826 = !_528;
    float _828 = _826 ? _175 : as_type<float>(_760);
    int _830 = ~_818;
    int _832 = _830 + 1;
    int _834 = _832 + 1;
    bool _836 = !_532;
    float _838 = _836 ? _179 : as_type<float>(_822);
    int _840 = _834;
    if (!_766)
    {
        int _842 = ~_818;
        int _844 = _842 + 1;
        _840 = _844;
    }
    int _846 = _840;
    bool _848 = !_824;
    int _850 = _848 ? 0 : (-1);
    int _852 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _854 = _852 != 0;
    int _856 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _858 = _856 != 0;
    int _860 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _862 = _860 != 0;
    float _864 = fma(_562, (*spvDescriptorSet0.vp_c10)._m0[4].z, _622);
    bool _866 = _796 > 0.0;
    float _868 = fma(_562, (*spvDescriptorSet0.vp_c10)._m0[5].z, _624);
    bool _870 = _796 >= 0.0;
    bool _872 = isnan(_796);
    bool _874 = _870 || _872;
    bool _876 = isnan(0.0);
    bool _878 = _874 || _876;
    int _880 = _337 * int(_814);
    int _882 = _880 + _544;
    int _884 = ~_794;
    int _886 = _884 + _850;
    int _888 = _886 + 1;
    float _890 = fma(_562, (*spvDescriptorSet0.vp_c10)._m0[6].z, _626);
    float _892 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _894 = _299 + _892;
    bool _896 = _299 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _898 = isnan(_299);
    bool _900 = _896 || _898;
    bool _902 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _904 = _900 || _902;
    float _906 = float(_904);
    float _908 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _910 = _299 + _908;
    float _912 = float(uint(_882));
    int _914 = _311 * _888;
    int _916 = _914 + _582;
    float _918 = fma(_660, _894, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _920 = _299 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _922 = isnan(_299);
    bool _924 = _920 || _922;
    bool _926 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _928 = _924 || _926;
    float _930 = float(_928);
    float _932 = -_906;
    float _934 = _932 + 1.0;
    float _936 = as_type<float>(_347) * _912;
    bool _938 = !_432;
    int _940 = _938 ? _916 : (-1);
    float _942 = _868 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _944 = _930 * _934;
    bool _946 = _299 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _948 = isnan(_299);
    bool _950 = _946 || _948;
    bool _952 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _954 = _950 || _952;
    float _956 = float(_954);
    float _958 = -_930;
    float _960 = _958 + 1.0;
    bool _962 = _299 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _964 = isnan(_299);
    bool _966 = _962 || _964;
    bool _968 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _970 = _966 || _968;
    float _972 = float(_970);
    float _974 = trunc(_936);
    float _976 = precise::max(_974, 0.0);
    uint _978 = uint(_976);
    int _980 = _940 >> 31;
    float _982 = -_956;
    float _984 = _982 + 1.0;
    bool _986 = _299 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _988 = isnan(_299);
    bool _990 = _986 || _988;
    bool _992 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _994 = _990 || _992;
    float _996 = float(_994);
    float _998 = _972 * _960;
    int _1000 = _980 & 3;
    float _1002 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1004 = _299 + _1002;
    float _1006 = -_972;
    float _1008 = _1006 + 1.0;
    float _1010 = _996 * _984;
    int _1012 = _940 + _1000;
    float _1014 = fma(_656, _1004, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1016 = _956 * _1008;
    float _1018 = _918 * _1010;
    int _1020 = _1012 >> 2;
    float _1022 = fma(_658, _910, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1024 = _838 + (-0.5);
    float _1026 = _828 + 0.5;
    int _1028 = _1020 << 4;
    int _1030 = _1028 + 368;
    float _1032 = -_996;
    float _1034 = _1032 + 1.0;
    float _1036 = -_1024;
    float _1038 = -_728;
    float _1040 = fma(_1036, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1038);
    float _1042 = fma(_1026, (*spvDescriptorSet0.vp_c9)._m0[80].x, _724);
    uint _1044 = uint(int(uint(_1030) >> uint(2)));
    uint _1046 = uint(int(uint(int(_1044)) >> uint(2)));
    int _1048 = int(_1044) & 3;
    float _1050 = (*spvDescriptorSet0.vp_c9)._m0[int(_1046)][_1048];
    int _1052 = int(_1044) + 1;
    uint _1054 = uint(int(uint(_1052) >> uint(2)));
    int _1056 = _1052 & 3;
    float _1058 = (*spvDescriptorSet0.vp_c9)._m0[int(_1054)][_1056];
    float _1060 = fma(_1034, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1018);
    int _1062 = int(_814) + int(_978);
    float _1064 = -_764;
    float _1066 = fma(_828, _1064, _1042);
    bool _1068 = !_858;
    int _1070 = _1068 ? 0 : 1;
    float _1072 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1074 = _299 + _1072;
    int _1076 = ~_311;
    int _1078 = _1076 + 1;
    float _1080 = fma(_1014, _1016, _1060);
    int _1082 = _940 & 3;
    bool _1084 = _1082 != 0;
    float _1086 = fma(_756, _1074, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    int _1088 = _878 ? 0 : 1;
    int _1090 = _1078 * _1062;
    int _1092 = _1090 + _544;
    int _1094 = _940 & 3;
    bool _1096 = _1094 != 0;
    float _1098 = fma(_838, _770, _1040);
    int _1100 = _1084 ? 0 : 1;
    float _1102 = fma(_1022, _998, _1080);
    bool _1104 = !_854;
    int _1106 = _1104 ? 0 : 1;
    float _1108 = _864 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _1110 = uint(_1094) > 1u;
    out.m_66.x = _1066;
    out.m_66.y = _1098;
    int _1112 = ~_1088;
    int _1114 = _1112 + 1;
    int _1116 = _1114 + 1;
    float _1118 = fma(_1086, _944, _1102);
    int _1120 = _1116;
    if (!_866)
    {
        int _1122 = ~_1088;
        int _1124 = _1122 + 1;
        _1120 = _1124;
    }
    int _1126 = _1120;
    float _1128 = _890 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1130 = uint(_1092) >= uint(_311);
    int _1132 = abs(_1106);
    int _1134 = _1030 + 8;
    uint _1136 = uint(int(uint(_1134) >> uint(2)));
    uint _1138 = uint(int(uint(int(_1136)) >> uint(2)));
    int _1140 = int(_1136) & 3;
    float _1142 = (*spvDescriptorSet0.vp_c9)._m0[int(_1138)][_1140];
    int _1144 = int(_1136) + 1;
    uint _1146 = uint(int(uint(_1144) >> uint(2)));
    int _1148 = _1144 & 3;
    float _1150 = (*spvDescriptorSet0.vp_c9)._m0[int(_1146)][_1148];
    int _1152 = abs(_1070);
    int _1154 = ~_1100;
    int _1156 = _1154 + 1;
    int _1158 = _1156 + 1;
    int _1160 = _1158;
    float _1162 = _1128;
    if (!_1110)
    {
        int _1164 = ~_1100;
        int _1166 = _1164 + 1;
        _1160 = _1166;
    }
    int _1168 = _1160;
    float _1170 = float(_788);
    float _1172 = float(_1152);
    bool _1174 = uint(_1094) >= 2u;
    int _1176 = abs(_1168);
    float _1178 = _1172 * _1170;
    int _1180 = _1174 ? 0 : 1;
    bool _1182 = _1094 != 3;
    float _1184 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1186 = _1108 + _1184;
    float _1188 = float(_1132);
    float _1190 = float(_1126);
    int _1192 = ~_1176;
    int _1194 = _1192 + 1;
    int _1196 = _1194 + 1;
    bool _1198 = !_1130;
    int _1200 = _1198 ? 0 : (-1);
    float _1202 = _1188 * _1190;
    bool _1204 = !_522;
    int _1206 = _1204 ? 0 : 1;
    int _1208 = _1196 * as_type<int>(_1058);
    bool _1210 = !_1096;
    int _1212 = _1210 ? 0 : 1;
    bool _1214 = _1094 != 3;
    int _1216 = ~_1180;
    int _1218 = _1216 + 1;
    int _1220 = _1218 + 1;
    int _1222 = ~_1062;
    int _1224 = _1222 + _1200;
    int _1226 = _1224 + 1;
    int _1228 = _1220;
    if (_1182)
    {
        int _1230 = ~_1180;
        int _1232 = _1230 + 1;
        _1228 = _1232;
    }
    int _1234 = _1228;
    float _1236 = in.m_68.x;
    float _1238 = in.m_68.y;
    float _1240 = in.m_68.z;
    int _1242 = abs(_1206);
    float _1244 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1246 = _942 + _1244;
    int _1248 = abs(_1212);
    int _1250 = _311 * _1226;
    int _1252 = _1250 + _544;
    bool _1254 = !_1214;
    int _1256 = _1254 ? 0 : (-1);
    float _1258 = _1246 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1260 = abs(_1234);
    int _1262 = abs(_1256);
    float _1264 = fma(_1186, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1258);
    int _1266 = ~_1248;
    int _1268 = _1266 + 1;
    int _1270 = _1268 + 1;
    float _1272 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1274 = _1128 + _1272;
    int _1276 = ~_1260;
    int _1278 = _1276 + 1;
    int _1280 = _1278 + 1;
    int _1282 = _1270 * as_type<int>(_1050);
    int _1284 = _1282 + _1208;
    int _1286 = ~_1262;
    int _1288 = _1286 + 1;
    int _1290 = _1288 + 1;
    float _1292 = fma(_1274, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1264);
    int _1294 = _1280 * as_type<int>(_1142);
    int _1296 = _1294 + _1284;
    float _1298 = _1178 * (-2.0);
    int _1300 = ~_1242;
    int _1302 = _1300 + 1;
    int _1304 = _1302 + 1;
    int _1306 = _1290 * as_type<int>(_1150);
    int _1308 = _1306 + _1296;
    float _1310 = _1202 * (-2.0);
    float _1312 = fma(_906, (*spvDescriptorSet0.vp_c9)._m0[119].x, _1118);
    bool _1314 = _1292 >= 0.0;
    int _1316 = _1308 * _1304;
    float _1318 = fma(_744, _1310, _744);
    float _1320 = fma(_1310, _1236, _1236);
    float _1322 = _1246 * _1246;
    bool _1324 = !_432;
    int _1326 = _1324 ? _1252 : (-1);
    float _1328 = fma(_816, _1298, _816);
    float _1330 = fma(_1298, _1238, _1238);
    float _1332 = fma(_1186, _1186, _1322);
    int _1334 = _1326 * _1242;
    int _1336 = _1334 + _1316;
    float _1338 = fma(_1274, _1274, _1332);
    float _1340 = _305 + (-0.5);
    float _1342 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1344 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1346 = (*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1348 = _1240;
    if (_1314)
    {
        _1346 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1350 = _1346;
    float _1352 = rsqrt(_1338);
    float _1354 = fma(_1340, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1320);
    float _1356 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1358 = _536 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1360 = _1342 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1362 = _1344 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1364 = _1356 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1366 = _1312 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _1368 = as_type<int>(_1350);
    if (_1314)
    {
        float _1370 = _1350 * 5.0;
        _1368 = as_type<int>(_1370);
    }
    int _1372 = _1368;
    float _1374 = float(_1336);
    float _1376 = _1358 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    bool _1378 = !_862;
    int _1380 = _1378 ? 0 : 1;
    out.m_70.x = _1364;
    out.m_70.y = _1360;
    out.m_70.z = _1362;
    out.m_70.w = _1366;
    float _1382 = fma(_1318, _734, _1354);
    float _1384 = _307 + (-0.5);
    float _1386 = _1376 * _1352;
    if (_1314)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4860 = as_type<float>(_1372);
        out.gl_Position.z = _4860;
    }
    int _1388 = abs(_1380);
    float _1390 = _1186 * _1386;
    out.m_72.x = _1374;
    float _1392 = _1246 * _1386;
    if (_1314)
    {
        out.m_55.x = 0.0;
    }
    if (_1314)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1394 = -_1392;
    float _1396 = _942 + _1394;
    float _1398 = _1274 * _1386;
    float _1400 = -_1390;
    float _1402 = _1108 + _1400;
    float _1404 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1406 = _1396 + _1404;
    float _1408 = float(_846);
    float _1410 = -_1398;
    float _1412 = _1128 + _1410;
    float _1414 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1416 = _1402 + _1414;
    float _1418 = _1406 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1420 = float(_1388);
    float _1422 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1424 = _1412 + _1422;
    float _1426 = -_1392;
    float _1428 = _1246 + _1426;
    float _1430 = fma(_1416, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1418);
    float _1432 = -_1390;
    float _1434 = _1186 + _1432;
    float _1436 = fma(_1384, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1330);
    float _1438 = _1428 * _1428;
    float _1440 = fma(_1424, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1430);
    float _1442 = _698 + _305;
    float _1444 = _1420 * _1408;
    float _1446 = fma(_1434, _1434, _1438);
    float _1448 = fma(_1328, _734, _1436);
    bool _1450 = _1440 >= 0.0;
    float _1452 = _1442 + (-1.0);
    float _1454 = _1444 * (-2.0);
    float _1456 = -_1398;
    float _1458 = _1274 + _1456;
    float _1460 = _1448 * 0.15915493667125701904296875;
    float _1462 = fma(_1452, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1464 = _698 + (-0.5);
    float _1466 = fma(_1454, _1240, _1240);
    float _1468 = _1382 * 0.15915493667125701904296875;
    float _1470 = fma(_1458, _1458, _1446);
    float _1472 = _1460 * 6.283185482025146484375;
    float _1474 = sin(_1472);
    float _1476 = fma(_1464, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1466);
    float _1478 = fma(_1462, _1454, _1462);
    if (_1450)
    {
        _1348 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1480 = _1348;
    int _1482 = as_type<int>(_1480);
    if (_1450)
    {
        out.m_55.x = 0.0;
    }
    float _1484 = fma(_1478, _734, _1476);
    float _1486 = _1468 * 6.283185482025146484375;
    float _1488 = sin(_1486);
    if (_1450)
    {
        float _1490 = _1480 * 5.0;
        _1482 = as_type<int>(_1490);
    }
    int _1492 = _1482;
    float _1494 = _1484 * 0.15915493667125701904296875;
    if (_1450)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5047 = as_type<float>(_1492);
        out.gl_Position.z = _5047;
    }
    float _1496 = _1468 * 6.283185482025146484375;
    float _1498 = cos(_1496);
    float _1500 = sqrt(_1470);
    float _1502 = _1460 * 6.283185482025146484375;
    float _1504 = cos(_1502);
    if (_1450)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1506 = _1494 * 6.283185482025146484375;
    float _1508 = cos(_1506);
    float _1510 = _275 * _484;
    float _1512 = _1352 * _1500;
    float _1514 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _179);
    float _1516 = _1488 * _1474;
    float _1518 = _1510 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1520 = _1498 * _1504;
    float _1522 = _1498 * _1474;
    float _1524 = _1494 * 6.283185482025146484375;
    float _1526 = sin(_1524);
    float _1528 = _1518 * _1512;
    float _1530 = _1488 * _1504;
    float _1532 = _1512 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1534 = _1532 * 0.5;
    float _1536 = _1514 * _1528;
    float _1538 = _1358 * _1512;
    float _1540 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _175);
    float _1542 = _1498 * _1508;
    float _1544 = _1504 * _1508;
    float _1546 = _1488 * _1508;
    float _1548 = _1540 * _1538;
    float _1550 = _1542 * _1536;
    float _1552 = _1474 * _1508;
    float _1554 = fma(_1526, _1520, _1516);
    float _1556 = -_1536;
    float _1558 = _1526 * _1556;
    float _1560 = -_1530;
    float _1562 = fma(_1526, _1522, _1560);
    float _1564 = -_1522;
    float _1566 = fma(_1526, _1530, _1564);
    float _1568 = fma(_1554, _1548, _1550);
    float _1570 = _1546 * _1536;
    float _1572 = fma(_1544, _1548, _1558);
    float _1574 = fma(_1526, _1516, _1520);
    float _1576 = fma(_1562, _1534, _1568);
    float _1578 = fma(_1566, _1548, _1570);
    float _1580 = fma(_1552, _1534, _1572);
    float _1582 = _1554 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1584 = _1576 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1586 = _1576 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1588 = fma(_1574, _1534, _1578);
    float _1590 = _1576 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1592 = fma(_1580, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1584);
    float _1594 = fma(_1580, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1586);
    float _1596 = _1554 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1598 = fma(_1580, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1590);
    float _1600 = fma(_1588, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1592);
    float _1602 = fma(_1588, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1594);
    float _1604 = _1554 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1606 = fma(_1588, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1598);
    float _1608 = _1600 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1610 = _1602 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1612 = fma(_1544, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1582);
    float _1614 = _1606 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1616 = _1108 + _1608;
    float _1618 = _1128 + _1610;
    float _1620 = fma(_1544, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1596);
    float _1622 = fma(_1544, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1604);
    float _1624 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1626 = _1616 + _1624;
    float _1628 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1630 = _1618 + _1628;
    float _1632 = _1542 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1634 = _1542 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1636 = _1626 * _1626;
    float _1638 = _1630 * _1630;
    float _1640 = _1542 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1642 = _1562 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1644 = _1562 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1646 = _1636 + _1638;
    float _1648 = _942 + _1614;
    float _1650 = _1562 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1652 = -_1526;
    float _1654 = fma(_1652, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1632);
    float _1656 = sqrt(_1646);
    float _1658 = -_1526;
    float _1660 = fma(_1658, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1634);
    float _1662 = -_1526;
    float _1664 = fma(_1662, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1640);
    float _1666 = fma(_1566, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1612);
    float _1668 = fma(_1566, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1620);
    float _1670 = fma(_1552, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1642);
    float _1672 = fma(_1552, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1644);
    float _1674 = fma(_1566, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1622);
    float _1676 = fma(_1552, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1650);
    bool _1678 = _1656 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1680 = _1562;
    float _1682 = _1616;
    float _1684 = _1642;
    float _1686 = _1618;
    float _1688 = _1636;
    if (!_1678)
    {
        _1680 = _1616;
    }
    float _1690 = _1680;
    float _1692 = _1690;
    if (!_1678)
    {
        _1682 = _1618;
    }
    float _1694 = _1682;
    float _1696 = _1694;
    if (!_1678)
    {
        _1684 = _1638;
    }
    float _1698 = _1684;
    float _1700 = _1698;
    if (!_1678)
    {
        _1686 = _1648;
    }
    float _1702 = _1686;
    bool _1704 = !_1678;
    float _1706 = _1702;
    if (!_1704)
    {
        float _1708 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1710 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1712 = _1656 + _1710;
        float _1714 = rsqrt(_1646);
        float _1716 = _1712 * _1708;
        float _1718 = _1648 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1720 = _1716 * 0.15915493667125701904296875;
        float _1722 = _1720 * 6.283185482025146484375;
        float _1724 = sin(_1722);
        float _1726 = _1720 * 6.283185482025146484375;
        float _1728 = cos(_1726);
        float _1730 = fma(_1724, _1718, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1732 = _1714 * _1730;
        float _1734 = _1728 + (-1.0);
        float _1736 = fma(_1626, _1732, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1738 = fma(_1630, _1732, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1740 = _1734 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1742 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1744 = _1736 + _1742;
        float _1746 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1748 = _1738 + _1746;
        float _1750 = fma(_1648, _1728, _1740);
        float _1752 = _1744 * _1744;
        float _1754 = _1748 * _1748;
        _1706 = _1750;
        _1688 = _1752;
        _1700 = _1754;
        _1692 = _1736;
        _1696 = _1738;
    }
    float _1756 = _1706;
    float _1758 = _1688;
    float _1760 = _1700;
    float _1762 = _1692;
    float _1764 = _1696;
    float _1766 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1768 = _1756 + _1766;
    float _1770 = fma(_1546, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1654);
    float _1772 = fma(_1546, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1660);
    float _1774 = _179 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1776 = fma(_1768, _1768, _1758);
    float _1778 = fma(_1546, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1664);
    float _1780 = _175 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1782 = _1774 * _1770;
    float _1784 = _1776 + _1760;
    float _1786 = _1774 * _1772;
    float _1788 = _1774 * _1778;
    float _1790 = fma(_1574, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1670);
    float _1792 = fma(_1574, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1672);
    float _1794 = fma(_1574, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1676);
    float _1796 = sqrt(_1784);
    float _1798 = fma(_1780, _1666, _1782);
    float _1800 = fma(_1780, _1668, _1786);
    float _1802 = fma(_1780, _1674, _1788);
    float _1804 = _1790 + _1798;
    float _1806 = _1792 + _1800;
    float _1808 = _1794 + _1802;
    out.m_74.x = _1804;
    out.m_74.y = _1806;
    out.m_74.z = _1808;
    bool _1810 = _1796 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1812 = isnan(_1796);
    bool _1814 = _1810 || _1812;
    bool _1816 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1818 = _1814 || _1816;
    float _1820 = _1778;
    if (!_1818)
    {
        _1820 = 1.0;
    }
    float _1822 = _1820;
    bool _1824 = !_1818;
    float _1826 = _1822;
    if (!_1824)
    {
        bool _1828 = _1796 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1830 = isnan(_1796);
        bool _1832 = _1828 || _1830;
        bool _1834 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1836 = _1832 || _1834;
        if (!_1836)
        {
            float _1838 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1840 = _1796 + _1838;
            float _1842 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1844 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1842;
            float _1846 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1848 = _1846 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1850 = 1.0 / _1844;
            float _1852 = _1840 * _1850;
            float _1854 = fma(_1852, _1848, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1826 = _1854;
            _1856 = true;
        }
        else
        {
            bool _1858 = _1796 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1860 = isnan(_1796);
            bool _1862 = _1858 || _1860;
            bool _1864 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1866 = _1862 || _1864;
            if (!_1866)
            {
                float _1868 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1870 = _1796 + _1868;
                float _1872 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1874 = _1872 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1876 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1878 = _1876 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1880 = 1.0 / _1874;
                float _1882 = _1870 * _1880;
                float _1884 = fma(_1882, _1878, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1826 = _1884;
                _1856 = true;
            }
            else
            {
                _1826 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1856 = false;
    float _1886 = _1826;
    float _1888 = _1396 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1890 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1892 = _1762 + _1890;
    float _1894 = fma(_1402, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1888);
    float _1896 = _1396 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1898 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1900 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1902 = _1898 || _1900;
    bool _1904 = isnan(0.5);
    bool _1906 = _1902 || _1904;
    float _1908 = fma(_1412, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1894);
    bool _1910 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1912 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1914 = _1910 || _1912;
    bool _1916 = isnan(0.5);
    bool _1918 = _1914 || _1916;
    float _1920 = _1908 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1922 = fma(_1402, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1896);
    float _1924 = fma(_1892, _1886, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1926 = 1.0 / _1920;
    float _1928 = fma(_1412, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1922);
    float _1930 = _1928 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1932 = _1892;
    if (_1918)
    {
        _1932 = 1.0;
    }
    float _1934 = _1932;
    float _1936 = _1930 + _1920;
    float _1938 = _1936 * _1926;
    float _1940 = _1938 * 0.5;
    float _1942 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1944 = _1756 + _1942;
    float _1946 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1948 = fma(_1940, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1946);
    float _1950 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1952 = _1764 + _1950;
    float _1954 = fma(_1944, _1886, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1956 = -_1390;
    float _1958 = _1956 + _1924;
    float _1960 = fma(_1952, _1886, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1962 = 1.0 / _1948;
    float _1964 = -_1392;
    float _1966 = _1964 + _1954;
    float _1968 = -_1398;
    float _1970 = _1968 + _1960;
    float _1972 = _1966;
    float _1974 = _1958;
    float _1976 = _1970;
    float _1978 = _1962;
    float _1980 = _1960;
    float _1982 = _1934;
    if (!_1906)
    {
        float _1984 = _1406 * _1406;
        float _1986 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1988 = -_1128;
        float _1990 = _1988 + _1960;
        float _1992 = -_942;
        float _1994 = _1992 + _1954;
        float _1996 = fma(_1416, _1416, _1984);
        float _1998 = -_1108;
        float _2000 = _1998 + _1924;
        float _2002 = fma(_1424, _1424, _1996);
        float _2004 = 1.0 / _1512;
        float _2006 = sqrt(_2002);
        float _2008 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2010 = precise::min(_2006, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2012 = _2010 * _1986;
        float _2014 = _2008 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2016 = _2012 * _2004;
        float _2018 = _2014 * _2016;
        float _2020 = _1990 * _2016;
        float _2022 = fma(_1994, _2018, _1396);
        float _2024 = fma(_2000, _2018, _1402);
        float _2026 = fma(_2014, _2020, _1412);
        _1972 = _2022;
        _1974 = _2024;
        _1976 = _2026;
        _1162 = _2020;
    }
    float _2028 = _1972;
    float _2030 = _1974;
    float _2032 = _1976;
    float _2034 = _1162;
    float _2036 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2038 = _1962 * _2036;
    float _2040 = _2034;
    if (!_1918)
    {
        float _2042 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2044 = _2042 * 0.15915493667125701904296875;
        float _2046 = _2044 * 6.283185482025146484375;
        float _2048 = cos(_2046);
        float _2050 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2052 = _2050 * 0.15915493667125701904296875;
        float _2054 = _2044 * 6.283185482025146484375;
        float _2056 = sin(_2054);
        float _2058 = 1.0 / _2048;
        float _2060 = _2052 * 6.283185482025146484375;
        float _2062 = cos(_2060);
        float _2064 = _2056 * _2058;
        float _2066 = _2052 * 6.283185482025146484375;
        float _2068 = sin(_2066);
        float _2070 = _2062 * _2064;
        float _2072 = 1.0 / _2070;
        float _2074 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2076 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2074;
        float _2078 = 1.0 / _2076;
        float _2080 = _2068 * _2072;
        float _2082 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2084 = fma(_2038, _2080, _2082);
        float _2086 = _2084 * _2078;
        float _2088 = precise::clamp(_2086, 0.0, 1.0);
        _1978 = _2084;
        _1980 = _2044;
        _1982 = _2088;
    }
    float _2090 = _1978;
    float _2092 = _1980;
    float _2094 = _1982;
    float _2096 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2098 = _2028 + _2096;
    float _2100 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2102 = _2030 + _2100;
    float _2104 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2106 = _2032 + _2104;
    float _2108 = _2098 * _2098;
    float _2110 = fma(_2102, _2102, _2108);
    float _2112 = fma(_2106, _2106, _2110);
    float _2114 = rsqrt(_2112);
    float _2116 = _2114 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2118 = _2102 * _2116;
    float _2120 = _2106 * _2116;
    float _2122 = _2118 * _2118;
    float _2124 = _2120 * _2120;
    float _2126 = _2122 + _2124;
    float _2128 = sqrt(_2126);
    bool _2130 = _2128 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2132 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2134 = _2128 + _2132;
    float _2136 = _2114;
    float _2138 = _2092;
    float _2140 = _2134;
    float _2142 = _2090;
    float _2144 = _2098;
    float _2146 = _2126;
    if (_2130)
    {
        float _2148 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2136 = _2148;
    }
    float _2150 = _2136;
    if (_2130)
    {
        float _2152 = rsqrt(_2126);
        _2138 = _2152;
    }
    float _2154 = _2138;
    float _2156 = _2154;
    if (_2130)
    {
        float _2158 = _2134 * _2150;
        _2140 = _2158;
    }
    float _2160 = _2140;
    if (_2130)
    {
        float _2162 = _2160 * 0.15915493667125701904296875;
        _2142 = _2162;
    }
    float _2164 = _2142;
    float _2166 = _2106;
    float _2168 = _2164;
    if (_2130)
    {
        float _2170 = _2164 * 6.283185482025146484375;
        float _2172 = sin(_2170);
        _2166 = _2172;
    }
    float _2174 = _2166;
    float _2176 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2178 = precise::max(0.0, _2176);
    float _2180 = _2150;
    if (_2130)
    {
        float _2182 = _2164 * 6.283185482025146484375;
        float _2184 = cos(_2182);
        _2180 = _2184;
    }
    float _2186 = _2180;
    float _2188 = -_2116;
    float _2190 = -_2178;
    float _2192 = fma(_2098, _2188, _2190);
    float _2194 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_2130)
    {
        float _2196 = _2192 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2144 = _2196;
    }
    float _2198 = _2144;
    float _2200 = _2198;
    if (!_2130)
    {
        _2168 = _2118;
    }
    float _2202 = _2168;
    float _2204 = fma(_1402, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2206 = _2174;
    float _2208 = _2202;
    if (_2130)
    {
        float _2210 = fma(_2174, _2198, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2206 = _2210;
    }
    float _2212 = _2206;
    if (!_2130)
    {
        _2200 = _2120;
    }
    float _2214 = _2200;
    float _2216 = _2214;
    float _2218 = _2186;
    if (_2130)
    {
        float _2220 = _2186 + (-1.0);
        _2194 = _2220;
    }
    float _2222 = _2194;
    float _2224 = _2222;
    if (_2130)
    {
        float _2226 = _2154 * _2212;
        _2040 = _2226;
    }
    float _2228 = _2040;
    if (!_2130)
    {
        _2156 = _2192;
    }
    float _2230 = _2156;
    float _2232 = sqrt(_2112);
    float _2234 = _2230;
    if (_2130)
    {
        float _2236 = _2222 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2146 = _2236;
    }
    float _2238 = _2146;
    if (_2130)
    {
        float _2240 = _2118 * _2228;
        _2208 = _2240;
    }
    float _2242 = _2208;
    if (!_2130)
    {
        _2224 = _2122;
    }
    float _2244 = _2224;
    float _2246 = _2244;
    if (_2130)
    {
        float _2248 = _2120 * _2228;
        _2216 = _2248;
    }
    float _2250 = _2216;
    if (_2130)
    {
        float _2252 = fma(_2192, _2186, _2238);
        _2234 = _2252;
    }
    float _2254 = _2234;
    if (_2130)
    {
        float _2256 = _2242 * _2242;
        _2246 = _2256;
    }
    float _2258 = _2246;
    if (!_2130)
    {
        _2218 = _2124;
    }
    float _2260 = _2218;
    float _2262 = _2260;
    if (_2130)
    {
        float _2264 = _2250 * _2250;
        _2262 = _2264;
    }
    float _2266 = _2262;
    float _2268 = fma(_2254, _2254, _2258);
    float _2270 = _2028 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2272 = _2028 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2274 = _2268 + _2266;
    float _2276 = fma(_2030, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2270);
    float _2278 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2280 = fma(_2232, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2278);
    float _2282 = precise::clamp(_2280, 0.0, 1.0);
    float _2284 = rsqrt(_2274);
    float _2286 = fma(_2032, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2276);
    float _2288 = fma(_1412, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2290 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2292 = -_2282;
    float _2294 = _2292 + 1.0;
    float _2296 = _2286 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2298 = _2028 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2300 = floor(_2204);
    float _2302 = _2296 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2304 = fma(_2030, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2272);
    float _2306 = -_2302;
    float _2308 = fma(_2306, _2290, 1.0);
    float _2310 = _2028 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2312 = _2284 * _2242;
    float _2314 = _2284 * _2254;
    float _2316 = fma(_2030, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2310);
    float _2318 = _2284 * _2250;
    float _2320 = abs(_2294);
    float _2322 = log2(_2320);
    float _2324 = fma(_2030, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2298);
    float _2326 = fma(_2032, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2316);
    float _2328 = _2312 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2330 = -_2300;
    float _2332 = _2204 + _2330;
    float _2334 = fma(_2032, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2324);
    float _2336 = _2326 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2338 = -_2328;
    float _2340 = fma(_2314, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2338);
    float _2342 = floor(_2288);
    float _2344 = _2334 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2346 = _2336 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2348 = -_2318;
    float _2350 = fma(_2348, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2340);
    float _2352 = fma(_2032, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2304);
    float _2354 = _2336 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2356 = fma(_2344, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2346);
    float _2358 = fma(_2350, -0.5, 0.5);
    float _2360 = _2322 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2362 = _2352 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2364 = fma(_2296, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2356);
    float _2366 = log2(_2308);
    float _2368 = _2336 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2370 = fma(_2362, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2364);
    float _2372 = fma(_2344, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2354);
    float _2374 = fma(_2350, 0.5, 0.5);
    float _2376 = _2314 + 1.0;
    float _2378 = -_2342;
    float _2380 = _2288 + _2378;
    float _2382 = exp2(_2360);
    float _2384 = fma(_2296, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2372);
    float _2386 = fma(_2374, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2388 = fma(_2362, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2384);
    float _2390 = fma(_2374, _2386, -0.212114393711090087890625);
    float _2392 = 1.0 / _2370;
    float _2394 = fma(_2344, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2368);
    float _2396 = _2366 * 0.693147182464599609375;
    float _2398 = sqrt(_2358);
    float _2400 = fma(_2296, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2394);
    float _2402 = -_2314;
    float _2404 = fma(_2382, _2376, _2402);
    float2 _6550 = float2(_2332, _2380);
    float _2406 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6550, float2(0.0), isnan(_6550)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6550, float2(0.0), isnan(_6550)), level(0.0)).x;
    float _2408 = fma(_2374, _2390, 1.570728778839111328125);
    float _2410 = fma(_2362, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2400);
    float _2412 = _2396 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2414 = fma(_2404, 0.5, 0.5);
    float _2416 = _2388 * _2392;
    float _2418 = _2410 * _2392;
    float _2420 = fma(_2416, 0.5, 0.5);
    float _2422 = fma(_2418, -0.5, 0.5);
    float _2424 = _2398 * 0.636619746685028076171875;
    float _2426 = -_2408;
    float _2428 = fma(_2424, _2426, 1.0);
    float3 _6594 = float3(_2420, _2422, _2412);
    float _2430 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6594, float3(0.0), isnan(_6594)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6594, float3(0.0), isnan(_6594)), level(0.0)).x;
    float3 _6605 = float3(_2420, _2422, _2412);
    float4 _2433 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6605, float3(0.0), isnan(_6605)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6605, float3(0.0), isnan(_6605)), level(0.0)).xyzw;
    float _2435 = _2433.x;
    float _2437 = _2433.y;
    float _2439 = _2433.z;
    float _2441 = _2433.w;
    float2 _6621 = float2(_2428, _2414);
    float3 _2445 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6621, float2(0.0), isnan(_6621)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6621, float2(0.0), isnan(_6621)), level(0.0)).xyz;
    float _2447 = _2445.x;
    float _2449 = _2445.y;
    float _2451 = _2445.z;
    float _2453 = abs(_2038);
    float _2455 = log2(_2453);
    float _2457 = _2336 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2459 = fma(_2344, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2457);
    bool _2461 = _2232 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2463 = isnan(_2232);
    bool _2465 = _2461 || _2463;
    bool _2467 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2469 = _2465 || _2467;
    float _2471 = in.m_76.x;
    float _2473 = fma(_2296, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2459);
    float _2475 = _2322 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2477 = _2038 <= 8000.0;
    bool _2479 = isnan(_2038);
    bool _2481 = _2477 || _2479;
    bool _2483 = isnan(8000.0);
    bool _2485 = _2481 || _2483;
    float _2487 = float(_2485);
    float _2489 = fma(_2362, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2473);
    float _2491 = _2388 + _2370;
    float _2493 = _2455 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2495 = exp2(_2475);
    out.gl_Position.x = _2388;
    out.gl_Position.y = _2410;
    out.gl_Position.z = _2489;
    out.gl_Position.w = _2370;
    float _2497 = _2491 * 0.5;
    float _2499 = exp2(_2493);
    float _2501 = -_2495;
    float _2503 = _2501 + 1.0;
    float _2505 = _2503 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2507 = fma(_2499, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2509 = precise::clamp(_2507, 0.0, 1.0);
    float _2511 = -_2505;
    float _2513 = _2511 + 1.0;
    float _2515 = _2489 + _2370;
    float _2517 = _2489;
    float _2519 = _2370;
    float _2521 = _2410;
    float _2523 = _2497;
    float _2525 = _2513;
    if (!_2469)
    {
        _2517 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2527 = _2517;
    float _2529 = fma(_2509, -2.0, 3.0);
    float _2531 = _2509 * _2509;
    float _2533 = _2515 * 0.5;
    float _2535 = _2531 * _2529;
    float _2537 = -_2535;
    float _2539 = _2537 + 1.0;
    float _2541 = fma(_2539, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2535);
    float _2543 = _2370 * 0.5;
    float _2545 = _2487 * _2541;
    float _2547 = fma(_2410, -0.5, _2543);
    float _2549 = _2527;
    float _2551 = _2527;
    if (!_2469)
    {
        _2519 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2553 = _2519;
    float _2555 = _2545 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_78.x = _2497;
    out.m_78.y = _2547;
    out.m_78.z = _2533;
    out.m_78.w = _2370;
    float _2557 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    float _2559 = _2553;
    float _2561 = _2553;
    if (!_2469)
    {
        _2521 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2563 = _2521;
    float _2565 = _2094 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2567 = _2563;
    float _2569 = _2563;
    if (!_2469)
    {
        _2523 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2571 = _2523;
    float _2573 = -_2406;
    float _2575 = _2573 + 1.0;
    float _2577 = _2575 * _2555;
    float _2579 = precise::clamp(_2577, 0.0, 1.0);
    float _2581 = -_2579;
    float _2583 = fma(_2581, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2585 = _2571;
    float _2587 = _2571;
    if (!_2469)
    {
        _2557 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2589 = _2557;
    float _2591 = _2583 * _2471;
    float _2593 = _2591 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2595 = _2505 * _2430;
    float _2597 = _2441 * _2513;
    out.m_80.x = _2593;
    float _2599 = _2589;
    float _2601 = _2589;
    if (!_2469)
    {
        _2525 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2603 = _2525;
    float _2605 = _2441 * _2595;
    float _2607 = _2451 * _2595;
    float _2609 = fma(_2447, _2605, _2435);
    float _2611 = fma(_2449, _2605, _2437);
    float _2613 = fma(_2441, _2607, _2439);
    out.m_82.x = _2609;
    out.m_82.y = _2611;
    out.m_82.z = _2613;
    out.m_82.w = _2597;
    bool _2615 = !_2469;
    float _2617 = _2603;
    float _2619 = _2603;
    if (!_2615)
    {
        bool _2621 = _2232 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2623 = isnan(_2232);
        bool _2625 = _2621 || _2623;
        bool _2627 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2629 = _2625 || _2627;
        if (!_2629)
        {
            float _2631 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2633 = _2232 + _2631;
            float _2635 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2637 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2635;
            float _2639 = 1.0 / _2637;
            float _2641 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2643 = _2641 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2645 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2647 = _2645 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2649 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2651 = _2649 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2653 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2655 = _2653 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2657 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2659 = _2657 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2661 = _2633 * _2639;
            float _2663 = precise::clamp(_2661, 0.0, 1.0);
            float _2665 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2667 = _2665 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2669 = fma(_2663, _2643, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2671 = fma(_2663, _2667, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2673 = fma(_2663, _2647, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2675 = fma(_2663, _2651, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2677 = fma(_2663, _2655, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2679 = fma(_2663, _2659, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2587 = _2671;
            _2569 = _2677;
            _2601 = _2669;
            _2551 = _2675;
            _2561 = _2673;
            _2619 = _2679;
            _2681 = true;
        }
        else
        {
            bool _2683 = _2232 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2685 = isnan(_2232);
            bool _2687 = _2683 || _2685;
            bool _2689 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2691 = _2687 || _2689;
            if (!_2691)
            {
                _2599 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2693 = _2599;
            _2601 = _2693;
            if (!_2691)
            {
                _2585 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2695 = _2585;
            _2587 = _2695;
            if (!_2691)
            {
                _2559 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2697 = _2559;
            _2561 = _2697;
            if (!_2691)
            {
                _2549 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2699 = _2549;
            _2551 = _2699;
            if (!_2691)
            {
                _2567 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2701 = _2567;
            _2569 = _2701;
            if (!_2691)
            {
                _2617 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2703 = _2617;
            bool _2705 = !_2691;
            _2619 = _2703;
            if (!_2705)
            {
                bool _2707 = _2232 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2709 = isnan(_2232);
                bool _2711 = _2707 || _2709;
                bool _2713 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2715 = _2711 || _2713;
                if (!_2715)
                {
                    float _2717 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2719 = _2232 + _2717;
                    float _2721 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2723 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2721;
                    float _2725 = 1.0 / _2723;
                    float _2727 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2729 = _2727 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2731 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2733 = _2731 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2735 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2737 = _2735 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2739 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2741 = _2739 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2743 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2745 = _2743 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2747 = _2719 * _2725;
                    float _2749 = precise::clamp(_2747, 0.0, 1.0);
                    float _2751 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2753 = _2751 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2755 = fma(_2749, _2729, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2757 = fma(_2749, _2753, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2759 = fma(_2749, _2733, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2761 = fma(_2749, _2737, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2763 = fma(_2749, _2741, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2765 = fma(_2749, _2745, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2587 = _2757;
                    _2569 = _2763;
                    _2601 = _2755;
                    _2551 = _2761;
                    _2561 = _2759;
                    _2619 = _2765;
                    _2681 = true;
                }
                else
                {
                    _2587 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2569 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2601 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2551 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2561 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2619 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2681 = false;
    float _2767 = _2587;
    float _2769 = _2569;
    float _2771 = _2601;
    float _2773 = _2551;
    float _2775 = _2561;
    float _2777 = _2619;
    float _2779 = fma(_1806, -0.5, 0.5);
    float _2781 = precise::clamp(_2779, 0.0, 1.0);
    float _2783 = -_2767;
    float _2785 = _2783 + _2769;
    float _2787 = _2565 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2789 = -_2771;
    float _2791 = _2789 + _2773;
    float _2793 = fma(_2781, _2785, _2767);
    out.m_84.x = 0.0;
    float _2795 = -_2775;
    float _2797 = _2795 + _2777;
    float _2799 = fma(_2781, _2791, _2771);
    float _2801 = _2793 * 0.586610972881317138671875;
    out.m_55.x = _2787;
    bool _2803 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2805 = fma(_2781, _2797, _2775);
    float _2807 = fma(_2799, 0.298911988735198974609375, _2801);
    bool _2809 = _2094 > 0.0;
    bool _2811 = isnan(_2094);
    bool _2813 = _2809 || _2811;
    bool _2815 = isnan(0.0);
    bool _2817 = _2813 || _2815;
    float _2819 = fma(_2805, 0.114477999508380889892578125, _2807);
    float _2821 = -_2819;
    float _2823 = _2799 + _2821;
    float _2825 = -_2819;
    float _2827 = _2793 + _2825;
    float _2829 = -_2819;
    float _2831 = _2805 + _2829;
    float _2833 = fma(_2823, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2819);
    float _2835 = fma(_2827, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2819);
    float _2837 = fma(_2831, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2819);
    bool _2839 = !_2803;
    if (!_2839)
    {
        float _2841 = -_2028;
        float _2843 = _2841 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2845 = -_2030;
        float _2847 = _2845 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2849 = -_2032;
        float _2851 = _2849 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2853 = _2843 * _2843;
        float _2855 = fma(_2847, _2847, _2853);
        float _2857 = fma(_2851, _2851, _2855);
        float _2859 = sqrt(_2857);
        float _2861 = rsqrt(_2857);
        float _2863 = -_2859;
        float _2865 = _2863 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2867 = _2865 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2869 = precise::clamp(_2867, 0.0, 1.0);
        float _2871 = _2847 * _2861;
        float _2873 = _2843 * _2861;
        float _2875 = abs(_2869);
        float _2877 = log2(_2875);
        float _2879 = _2851 * _2861;
        float _2881 = _2871 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2883 = _1806 * _2873;
        float _2885 = -_2873;
        float _2887 = -_2881;
        float _2889 = fma(_2885, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2887);
        float _2891 = fma(_1804, _2871, _2883);
        float _2893 = -_2879;
        float _2895 = fma(_2893, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2889);
        float _2897 = fma(_1808, _2879, _2891);
        float _2899 = precise::clamp(_2897, 0.0, 1.0);
        float _2901 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2903 = _2895 + _2901;
        float _2905 = _2877 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2907 = _2903 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2909 = precise::clamp(_2907, 0.0, 1.0);
        float _2911 = exp2(_2905);
        float _2913 = _2911 * _2909;
        float _2915 = _2899 * _2913;
        float _2917 = _2915 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2919 = _2915 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2921 = _2915 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_84.x = _2917;
        out.m_84.y = _2919;
        out.m_84.z = _2921;
    }
    out.m_86.x = _2833;
    out.m_86.y = _2835;
    out.m_86.z = _2837;
    if (_2817)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_55.x = 0.0;
    float _2923 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2923;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2681 = false;
    bool _1856 = false;
    bool _297 = false;
    bool _201 = false;
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
        float _2991 = as_type<float>(_129);
        out.gl_Position.z = _2991;
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
        float _3046 = as_type<float>(_155);
        out.gl_Position.z = _3046;
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
    float _199;
    if (!_181)
    {
        float _183 = in.m_60.x;
        float _185 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _187 = _183 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _189 = fma(_187, (*spvDescriptorSet0.vp_c9)._m0[12].x, _111);
        float _191 = _189 * _185;
        float _193 = floor(_191);
        float _195 = -_193;
        float _197 = _191 + _195;
        _199 = _197;
        _201 = true;
    }
    else
    {
        _199 = _163;
    }
    _201 = false;
    float _203 = _199;
    float _205 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _207 = _203 + _205;
    bool _209 = _203 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _211 = isnan(_203);
    bool _213 = _209 || _211;
    bool _215 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _217 = _213 || _215;
    float _219 = float(_217);
    float _221 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _223 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _221;
    float _225 = -_219;
    float _227 = _225 + 1.0;
    bool _229 = _203 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _231 = isnan(_203);
    bool _233 = _229 || _231;
    bool _235 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _237 = _233 || _235;
    float _239 = float(_237);
    float _241 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _243 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _241;
    bool _245 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _247 = 1.0 / _223;
    float _249 = _239 * _227;
    float _251 = -_239;
    float _253 = _251 + 1.0;
    float _255 = _207 * _247;
    float _257 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _259 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _257;
    float _261 = fma(_243, _255, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _263 = fma(_259, _255, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _265 = _261 * _249;
    float _267 = _263 * _249;
    float _269 = fma(_253, (*spvDescriptorSet0.vp_c9)._m0[143].x, _265);
    float _271 = fma(_253, (*spvDescriptorSet0.vp_c9)._m0[143].y, _267);
    float _273 = fma(_219, (*spvDescriptorSet0.vp_c9)._m0[144].x, _269);
    float _275 = fma(_219, (*spvDescriptorSet0.vp_c9)._m0[144].y, _271);
    bool _277 = !_245;
    float _295;
    if (!_277)
    {
        float _279 = in.m_60.x;
        float _281 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _283 = _279 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _285 = fma(_283, (*spvDescriptorSet0.vp_c9)._m0[11].y, _111);
        float _287 = _285 * _281;
        float _289 = floor(_287);
        float _291 = -_289;
        float _293 = _287 + _291;
        _295 = _293;
        _297 = true;
    }
    else
    {
        _295 = _163;
    }
    _297 = false;
    float _299 = _295;
    float _301 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _303 = int(_301);
    float _305 = in.m_60.x;
    float _307 = in.m_60.y;
    float _309 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _311 = int(_309);
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _315 = _313 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _317 = float(_303);
    float _319 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _321 = log2(_319);
    float _323 = float(uint(_311));
    float _325 = 1.0 / _317;
    int _327 = ~_311;
    int _329 = _327 + 1;
    float _331 = _307 * 2.0;
    float _333 = float(_311);
    int _335 = ~_311;
    int _337 = _335 + 1;
    float _339 = 1.0 / _323;
    float _341 = _321 * _111;
    float _343 = _325 * _111;
    float _345 = exp2(_341);
    int _347 = as_type<int>(_339) + (-2);
    float _349 = trunc(_343);
    int _351 = int(_349);
    float _353 = 1.0 / _315;
    float _355 = -_345;
    float _357 = _355 + 1.0;
    float _359 = float(uint(_351));
    float _361 = floor(_331);
    float _363 = float(_351);
    float _365 = as_type<float>(_347) * _359;
    float _367 = trunc(_365);
    float _369 = precise::max(_367, 0.0);
    uint _372 = uint(_369);
    int _374 = ~_311;
    int _376 = _374 + 1;
    int _378 = _329 * int(_372);
    int _380 = _378 + _351;
    float _382 = float(uint(_380));
    float _384 = as_type<float>(_347) * _382;
    int _386 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _388 = _386 != 0;
    bool _390 = _363 >= _333;
    bool _392 = isnan(_363);
    bool _394 = _390 || _392;
    bool _396 = isnan(_333);
    bool _398 = _394 || _396;
    float _400 = float(_398);
    float _402 = trunc(_384);
    float _404 = precise::max(_402, 0.0);
    uint _406 = uint(_404);
    int _408 = int(_372) + int(_406);
    float _410 = trunc(_400);
    int _412 = int(_410);
    int _414 = _376 * _408;
    int _416 = _414 + _351;
    bool _418 = !_388;
    float _420 = _418 ? 7.345489978790283203125 : 1.0;
    bool _422 = uint(_416) >= uint(_311);
    float _424 = _420 * _305;
    bool _426 = !_422;
    int _428 = _426 ? 0 : (-1);
    float _430 = floor(_424);
    bool _432 = _311 == 0;
    int _434 = ~_408;
    int _436 = _434 + _428;
    int _438 = _436 + 1;
    int _440 = ~_412;
    int _442 = _440 + 1;
    int _444 = _442 + 1;
    int _446 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _448 = _446 != 0;
    int _450 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _452 = _450 != 0;
    int _454 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _456 = _454 != 0;
    int _458 = _311 * _438;
    int _460 = _458 + _351;
    int _462 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _464 = _462 != 0;
    int _466 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _468 = _466 != 0;
    bool _470 = !_432;
    int _472 = _470 ? _460 : (-1);
    float _474 = -_430;
    float _476 = _424 + _474;
    int _478 = _311 + (-1);
    int _480 = _472 * _444;
    float _482 = in.m_62.x;
    float _484 = in.m_62.y;
    float _486 = _476 * _333;
    float _488 = _333 * _111;
    int _490 = _412 * _478;
    int _492 = _490 + _480;
    bool _494 = !_452;
    int _496 = _494 ? 0 : 1;
    float _498 = _488 * _159;
    bool _500 = !_448;
    int _502 = _500 ? 0 : 1;
    float _504 = trunc(_486);
    int _506 = int(_504);
    int _508 = abs(_496);
    int _510 = abs(_502);
    bool _512 = !_464;
    int _514 = _512 ? 0 : 1;
    float _516 = trunc(_498);
    int _518 = int(_516);
    int _520 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _522 = _520 != 0;
    int _524 = _492 * _508;
    int _526 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _528 = _526 != 0;
    int _530 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _532 = _530 != 0;
    int _534 = abs(_514);
    float _536 = _273 * _482;
    bool _538 = !_468;
    int _540 = _538 ? 0 : 1;
    int _542 = _506 * _534;
    int _544 = _542 + _351;
    bool _546 = !_456;
    int _548 = _546 ? 0 : 1;
    int _550 = abs(_540);
    int _552 = _518 * _510;
    int _554 = _552 + _524;
    int _556 = abs(_548);
    float _558 = in.m_48.x;
    float _560 = in.m_48.y;
    float _562 = in.m_48.z;
    float _564 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _566 = _564 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    int _568 = _544 * _556;
    int _570 = _568 + _554;
    float _572 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _574 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _576 = _574 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _578 = 1.0 / _566;
    int _580 = _506 * _550;
    int _582 = _580 + _570;
    float _584 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _586 = _305 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _588 = _307 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _590 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _592 = isnan(0.0);
    bool _594 = _590 || _592;
    bool _596 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _598 = _594 || _596;
    float _600 = 1.0 / _576;
    float _602 = -_584;
    float _604 = fma(_586, 2.0, _602);
    float _606 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _608 = _305 * 2.0;
    float _610 = fma(_588, -2.0, _572);
    float _612 = _598 ? _357 : 0.0;
    out.m_64.w = _606;
    float _614 = _560 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _616 = _560 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _618 = _560 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _620 = float(uint(_582));
    float _622 = fma(_558, (*spvDescriptorSet0.vp_c10)._m0[4].x, _614);
    float _624 = fma(_558, (*spvDescriptorSet0.vp_c10)._m0[5].x, _616);
    float _626 = fma(_558, (*spvDescriptorSet0.vp_c10)._m0[6].x, _618);
    float _628 = as_type<float>(_347) * _620;
    float _630 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _632 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _630;
    float _634 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _636 = _634 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _638 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _640 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _638;
    float _642 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _644 = _642 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    int _646 = ~_311;
    int _648 = _646 + 1;
    float _650 = trunc(_628);
    float _652 = precise::max(_650, 0.0);
    uint _654 = uint(_652);
    float _656 = _636 * _600;
    float _658 = _640 * _578;
    float _660 = _632 * _353;
    float _662 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _664 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _666 = isnan(1.0);
    bool _668 = _664 || _666;
    bool _670 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _672 = _668 || _670;
    float _674 = floor(_608);
    float _676 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _678 = 1.0 + _676;
    float _680 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _682 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[78].w, _662);
    float _684 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _686 = _684 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _688 = 1.0 / _644;
    float _690 = 1.0 / _678;
    int _692 = _648 * int(_654);
    int _694 = _692 + _582;
    bool _696 = _674 > 0.0;
    float _698 = in.m_60.z;
    bool _700 = _674 >= 0.0;
    bool _702 = isnan(_674);
    bool _704 = _700 || _702;
    bool _706 = isnan(0.0);
    bool _708 = _704 || _706;
    float _710 = _307 + _305;
    float _712 = float(uint(_694));
    float _714 = fma(_305, (*spvDescriptorSet0.vp_c9)._m0[78].z, _680);
    float _716 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[77].w, _682);
    float _718 = _710 + (-1.0);
    float _720 = as_type<float>(_347) * _712;
    float _722 = -_111;
    float _724 = fma(_722, (*spvDescriptorSet0.vp_c9)._m0[76].x, _604);
    float _726 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[77].z, _714);
    float _728 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[76].y, _610);
    int _730 = _708 ? 0 : 1;
    if (_672)
    {
        float _732 = _612 * _690;
        _121 = _732;
    }
    float _734 = _121;
    float _736 = trunc(_720);
    float _738 = precise::max(_736, 0.0);
    uint _740 = uint(_738);
    bool _742 = _305 > 0.5;
    float _744 = fma(_718, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _746 = _361 >= 0.0;
    bool _748 = isnan(_361);
    bool _750 = _746 || _748;
    bool _752 = isnan(0.0);
    bool _754 = _750 || _752;
    float _756 = _686 * _688;
    float _758 = -_175;
    int _760 = _742 ? as_type<int>(_758) : as_type<int>(_175);
    float _762 = -_726;
    float _764 = _762 + 1.0;
    bool _766 = _361 > 0.0;
    float _768 = -_716;
    float _770 = _768 + 1.0;
    float _772 = float(uint(_544));
    float _774 = _698 * 2.0;
    int _776 = ~_730;
    int _778 = _776 + 1;
    int _780 = _778 + 1;
    int _782 = _780;
    if (!_696)
    {
        int _784 = ~_730;
        int _786 = _784 + 1;
        _782 = _786;
    }
    int _788 = _782;
    float _790 = as_type<float>(_347) * _772;
    float _792 = _307 + _698;
    int _794 = int(_654) + int(_740);
    float _796 = floor(_774);
    int _798 = ~_311;
    int _800 = _798 + 1;
    float _802 = _792 + (-1.0);
    bool _804 = _307 > 0.5;
    int _806 = _800 * _794;
    int _808 = _806 + _582;
    float _810 = trunc(_790);
    float _812 = precise::max(_810, 0.0);
    uint _814 = uint(_812);
    float _816 = fma(_802, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _818 = _754 ? 0 : 1;
    float _820 = -_179;
    int _822 = _804 ? as_type<int>(_820) : as_type<int>(_179);
    bool _824 = uint(_808) >= uint(_311);
    bool _826 = !_528;
    float _828 = _826 ? _175 : as_type<float>(_760);
    int _830 = ~_818;
    int _832 = _830 + 1;
    int _834 = _832 + 1;
    bool _836 = !_532;
    float _838 = _836 ? _179 : as_type<float>(_822);
    int _840 = _834;
    if (!_766)
    {
        int _842 = ~_818;
        int _844 = _842 + 1;
        _840 = _844;
    }
    int _846 = _840;
    bool _848 = !_824;
    int _850 = _848 ? 0 : (-1);
    int _852 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _854 = _852 != 0;
    int _856 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _858 = _856 != 0;
    int _860 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _862 = _860 != 0;
    float _864 = fma(_562, (*spvDescriptorSet0.vp_c10)._m0[4].z, _622);
    bool _866 = _796 > 0.0;
    float _868 = fma(_562, (*spvDescriptorSet0.vp_c10)._m0[5].z, _624);
    bool _870 = _796 >= 0.0;
    bool _872 = isnan(_796);
    bool _874 = _870 || _872;
    bool _876 = isnan(0.0);
    bool _878 = _874 || _876;
    int _880 = _337 * int(_814);
    int _882 = _880 + _544;
    int _884 = ~_794;
    int _886 = _884 + _850;
    int _888 = _886 + 1;
    float _890 = fma(_562, (*spvDescriptorSet0.vp_c10)._m0[6].z, _626);
    float _892 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _894 = _299 + _892;
    bool _896 = _299 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _898 = isnan(_299);
    bool _900 = _896 || _898;
    bool _902 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _904 = _900 || _902;
    float _906 = float(_904);
    float _908 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _910 = _299 + _908;
    float _912 = float(uint(_882));
    int _914 = _311 * _888;
    int _916 = _914 + _582;
    float _918 = fma(_660, _894, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _920 = _299 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _922 = isnan(_299);
    bool _924 = _920 || _922;
    bool _926 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _928 = _924 || _926;
    float _930 = float(_928);
    float _932 = -_906;
    float _934 = _932 + 1.0;
    float _936 = as_type<float>(_347) * _912;
    bool _938 = !_432;
    int _940 = _938 ? _916 : (-1);
    float _942 = _868 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _944 = _930 * _934;
    bool _946 = _299 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _948 = isnan(_299);
    bool _950 = _946 || _948;
    bool _952 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _954 = _950 || _952;
    float _956 = float(_954);
    float _958 = -_930;
    float _960 = _958 + 1.0;
    bool _962 = _299 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _964 = isnan(_299);
    bool _966 = _962 || _964;
    bool _968 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _970 = _966 || _968;
    float _972 = float(_970);
    float _974 = trunc(_936);
    float _976 = precise::max(_974, 0.0);
    uint _978 = uint(_976);
    int _980 = _940 >> 31;
    float _982 = -_956;
    float _984 = _982 + 1.0;
    bool _986 = _299 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _988 = isnan(_299);
    bool _990 = _986 || _988;
    bool _992 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _994 = _990 || _992;
    float _996 = float(_994);
    float _998 = _972 * _960;
    int _1000 = _980 & 3;
    float _1002 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1004 = _299 + _1002;
    float _1006 = -_972;
    float _1008 = _1006 + 1.0;
    float _1010 = _996 * _984;
    int _1012 = _940 + _1000;
    float _1014 = fma(_656, _1004, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1016 = _956 * _1008;
    float _1018 = _918 * _1010;
    int _1020 = _1012 >> 2;
    float _1022 = fma(_658, _910, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1024 = _838 + (-0.5);
    float _1026 = _828 + 0.5;
    int _1028 = _1020 << 4;
    int _1030 = _1028 + 368;
    float _1032 = -_996;
    float _1034 = _1032 + 1.0;
    float _1036 = -_1024;
    float _1038 = -_728;
    float _1040 = fma(_1036, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1038);
    float _1042 = fma(_1026, (*spvDescriptorSet0.vp_c9)._m0[80].x, _724);
    uint _1044 = uint(int(uint(_1030) >> uint(2)));
    uint _1046 = uint(int(uint(int(_1044)) >> uint(2)));
    int _1048 = int(_1044) & 3;
    float _1050 = (*spvDescriptorSet0.vp_c9)._m0[int(_1046)][_1048];
    int _1052 = int(_1044) + 1;
    uint _1054 = uint(int(uint(_1052) >> uint(2)));
    int _1056 = _1052 & 3;
    float _1058 = (*spvDescriptorSet0.vp_c9)._m0[int(_1054)][_1056];
    float _1060 = fma(_1034, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1018);
    int _1062 = int(_814) + int(_978);
    float _1064 = -_764;
    float _1066 = fma(_828, _1064, _1042);
    bool _1068 = !_858;
    int _1070 = _1068 ? 0 : 1;
    float _1072 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1074 = _299 + _1072;
    int _1076 = ~_311;
    int _1078 = _1076 + 1;
    float _1080 = fma(_1014, _1016, _1060);
    int _1082 = _940 & 3;
    bool _1084 = _1082 != 0;
    float _1086 = fma(_756, _1074, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    int _1088 = _878 ? 0 : 1;
    int _1090 = _1078 * _1062;
    int _1092 = _1090 + _544;
    int _1094 = _940 & 3;
    bool _1096 = _1094 != 0;
    float _1098 = fma(_838, _770, _1040);
    int _1100 = _1084 ? 0 : 1;
    float _1102 = fma(_1022, _998, _1080);
    bool _1104 = !_854;
    int _1106 = _1104 ? 0 : 1;
    float _1108 = _864 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _1110 = uint(_1094) > 1u;
    out.m_66.x = _1066;
    out.m_66.y = _1098;
    int _1112 = ~_1088;
    int _1114 = _1112 + 1;
    int _1116 = _1114 + 1;
    float _1118 = fma(_1086, _944, _1102);
    int _1120 = _1116;
    if (!_866)
    {
        int _1122 = ~_1088;
        int _1124 = _1122 + 1;
        _1120 = _1124;
    }
    int _1126 = _1120;
    float _1128 = _890 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1130 = uint(_1092) >= uint(_311);
    int _1132 = abs(_1106);
    int _1134 = _1030 + 8;
    uint _1136 = uint(int(uint(_1134) >> uint(2)));
    uint _1138 = uint(int(uint(int(_1136)) >> uint(2)));
    int _1140 = int(_1136) & 3;
    float _1142 = (*spvDescriptorSet0.vp_c9)._m0[int(_1138)][_1140];
    int _1144 = int(_1136) + 1;
    uint _1146 = uint(int(uint(_1144) >> uint(2)));
    int _1148 = _1144 & 3;
    float _1150 = (*spvDescriptorSet0.vp_c9)._m0[int(_1146)][_1148];
    int _1152 = abs(_1070);
    int _1154 = ~_1100;
    int _1156 = _1154 + 1;
    int _1158 = _1156 + 1;
    int _1160 = _1158;
    float _1162 = _1128;
    if (!_1110)
    {
        int _1164 = ~_1100;
        int _1166 = _1164 + 1;
        _1160 = _1166;
    }
    int _1168 = _1160;
    float _1170 = float(_788);
    float _1172 = float(_1152);
    bool _1174 = uint(_1094) >= 2u;
    int _1176 = abs(_1168);
    float _1178 = _1172 * _1170;
    int _1180 = _1174 ? 0 : 1;
    bool _1182 = _1094 != 3;
    float _1184 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1186 = _1108 + _1184;
    float _1188 = float(_1132);
    float _1190 = float(_1126);
    int _1192 = ~_1176;
    int _1194 = _1192 + 1;
    int _1196 = _1194 + 1;
    bool _1198 = !_1130;
    int _1200 = _1198 ? 0 : (-1);
    float _1202 = _1188 * _1190;
    bool _1204 = !_522;
    int _1206 = _1204 ? 0 : 1;
    int _1208 = _1196 * as_type<int>(_1058);
    bool _1210 = !_1096;
    int _1212 = _1210 ? 0 : 1;
    bool _1214 = _1094 != 3;
    int _1216 = ~_1180;
    int _1218 = _1216 + 1;
    int _1220 = _1218 + 1;
    int _1222 = ~_1062;
    int _1224 = _1222 + _1200;
    int _1226 = _1224 + 1;
    int _1228 = _1220;
    if (_1182)
    {
        int _1230 = ~_1180;
        int _1232 = _1230 + 1;
        _1228 = _1232;
    }
    int _1234 = _1228;
    float _1236 = in.m_68.x;
    float _1238 = in.m_68.y;
    float _1240 = in.m_68.z;
    int _1242 = abs(_1206);
    float _1244 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1246 = _942 + _1244;
    int _1248 = abs(_1212);
    int _1250 = _311 * _1226;
    int _1252 = _1250 + _544;
    bool _1254 = !_1214;
    int _1256 = _1254 ? 0 : (-1);
    float _1258 = _1246 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1260 = abs(_1234);
    int _1262 = abs(_1256);
    float _1264 = fma(_1186, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1258);
    int _1266 = ~_1248;
    int _1268 = _1266 + 1;
    int _1270 = _1268 + 1;
    float _1272 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1274 = _1128 + _1272;
    int _1276 = ~_1260;
    int _1278 = _1276 + 1;
    int _1280 = _1278 + 1;
    int _1282 = _1270 * as_type<int>(_1050);
    int _1284 = _1282 + _1208;
    int _1286 = ~_1262;
    int _1288 = _1286 + 1;
    int _1290 = _1288 + 1;
    float _1292 = fma(_1274, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1264);
    int _1294 = _1280 * as_type<int>(_1142);
    int _1296 = _1294 + _1284;
    float _1298 = _1178 * (-2.0);
    int _1300 = ~_1242;
    int _1302 = _1300 + 1;
    int _1304 = _1302 + 1;
    int _1306 = _1290 * as_type<int>(_1150);
    int _1308 = _1306 + _1296;
    float _1310 = _1202 * (-2.0);
    float _1312 = fma(_906, (*spvDescriptorSet0.vp_c9)._m0[119].x, _1118);
    bool _1314 = _1292 >= 0.0;
    int _1316 = _1308 * _1304;
    float _1318 = fma(_744, _1310, _744);
    float _1320 = fma(_1310, _1236, _1236);
    float _1322 = _1246 * _1246;
    bool _1324 = !_432;
    int _1326 = _1324 ? _1252 : (-1);
    float _1328 = fma(_816, _1298, _816);
    float _1330 = fma(_1298, _1238, _1238);
    float _1332 = fma(_1186, _1186, _1322);
    int _1334 = _1326 * _1242;
    int _1336 = _1334 + _1316;
    float _1338 = fma(_1274, _1274, _1332);
    float _1340 = _305 + (-0.5);
    float _1342 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1344 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1346 = (*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1348 = _1240;
    if (_1314)
    {
        _1346 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1350 = _1346;
    float _1352 = rsqrt(_1338);
    float _1354 = fma(_1340, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1320);
    float _1356 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1358 = _536 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1360 = _1342 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1362 = _1344 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1364 = _1356 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1366 = _1312 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _1368 = as_type<int>(_1350);
    if (_1314)
    {
        float _1370 = _1350 * 5.0;
        _1368 = as_type<int>(_1370);
    }
    int _1372 = _1368;
    float _1374 = float(_1336);
    float _1376 = _1358 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    bool _1378 = !_862;
    int _1380 = _1378 ? 0 : 1;
    out.m_70.x = _1364;
    out.m_70.y = _1360;
    out.m_70.z = _1362;
    out.m_70.w = _1366;
    float _1382 = fma(_1318, _734, _1354);
    float _1384 = _307 + (-0.5);
    float _1386 = _1376 * _1352;
    if (_1314)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4860 = as_type<float>(_1372);
        out.gl_Position.z = _4860;
    }
    int _1388 = abs(_1380);
    float _1390 = _1186 * _1386;
    out.m_72.x = _1374;
    float _1392 = _1246 * _1386;
    if (_1314)
    {
        out.m_55.x = 0.0;
    }
    if (_1314)
    {
        return out;
    }
    float _1394 = -_1392;
    float _1396 = _942 + _1394;
    float _1398 = _1274 * _1386;
    float _1400 = -_1390;
    float _1402 = _1108 + _1400;
    float _1404 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1406 = _1396 + _1404;
    float _1408 = float(_846);
    float _1410 = -_1398;
    float _1412 = _1128 + _1410;
    float _1414 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1416 = _1402 + _1414;
    float _1418 = _1406 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1420 = float(_1388);
    float _1422 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1424 = _1412 + _1422;
    float _1426 = -_1392;
    float _1428 = _1246 + _1426;
    float _1430 = fma(_1416, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1418);
    float _1432 = -_1390;
    float _1434 = _1186 + _1432;
    float _1436 = fma(_1384, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1330);
    float _1438 = _1428 * _1428;
    float _1440 = fma(_1424, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1430);
    float _1442 = _698 + _305;
    float _1444 = _1420 * _1408;
    float _1446 = fma(_1434, _1434, _1438);
    float _1448 = fma(_1328, _734, _1436);
    bool _1450 = _1440 >= 0.0;
    float _1452 = _1442 + (-1.0);
    float _1454 = _1444 * (-2.0);
    float _1456 = -_1398;
    float _1458 = _1274 + _1456;
    float _1460 = _1448 * 0.15915493667125701904296875;
    float _1462 = fma(_1452, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1464 = _698 + (-0.5);
    float _1466 = fma(_1454, _1240, _1240);
    float _1468 = _1382 * 0.15915493667125701904296875;
    float _1470 = fma(_1458, _1458, _1446);
    float _1472 = _1460 * 6.283185482025146484375;
    float _1474 = sin(_1472);
    float _1476 = fma(_1464, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1466);
    float _1478 = fma(_1462, _1454, _1462);
    if (_1450)
    {
        _1348 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1480 = _1348;
    int _1482 = as_type<int>(_1480);
    if (_1450)
    {
        out.m_55.x = 0.0;
    }
    float _1484 = fma(_1478, _734, _1476);
    float _1486 = _1468 * 6.283185482025146484375;
    float _1488 = sin(_1486);
    if (_1450)
    {
        float _1490 = _1480 * 5.0;
        _1482 = as_type<int>(_1490);
    }
    int _1492 = _1482;
    float _1494 = _1484 * 0.15915493667125701904296875;
    if (_1450)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5047 = as_type<float>(_1492);
        out.gl_Position.z = _5047;
    }
    float _1496 = _1468 * 6.283185482025146484375;
    float _1498 = cos(_1496);
    float _1500 = sqrt(_1470);
    float _1502 = _1460 * 6.283185482025146484375;
    float _1504 = cos(_1502);
    if (_1450)
    {
        return out;
    }
    float _1506 = _1494 * 6.283185482025146484375;
    float _1508 = cos(_1506);
    float _1510 = _275 * _484;
    float _1512 = _1352 * _1500;
    float _1514 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _179);
    float _1516 = _1488 * _1474;
    float _1518 = _1510 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1520 = _1498 * _1504;
    float _1522 = _1498 * _1474;
    float _1524 = _1494 * 6.283185482025146484375;
    float _1526 = sin(_1524);
    float _1528 = _1518 * _1512;
    float _1530 = _1488 * _1504;
    float _1532 = _1512 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1534 = _1532 * 0.5;
    float _1536 = _1514 * _1528;
    float _1538 = _1358 * _1512;
    float _1540 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _175);
    float _1542 = _1498 * _1508;
    float _1544 = _1504 * _1508;
    float _1546 = _1488 * _1508;
    float _1548 = _1540 * _1538;
    float _1550 = _1542 * _1536;
    float _1552 = _1474 * _1508;
    float _1554 = fma(_1526, _1520, _1516);
    float _1556 = -_1536;
    float _1558 = _1526 * _1556;
    float _1560 = -_1530;
    float _1562 = fma(_1526, _1522, _1560);
    float _1564 = -_1522;
    float _1566 = fma(_1526, _1530, _1564);
    float _1568 = fma(_1554, _1548, _1550);
    float _1570 = _1546 * _1536;
    float _1572 = fma(_1544, _1548, _1558);
    float _1574 = fma(_1526, _1516, _1520);
    float _1576 = fma(_1562, _1534, _1568);
    float _1578 = fma(_1566, _1548, _1570);
    float _1580 = fma(_1552, _1534, _1572);
    float _1582 = _1554 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1584 = _1576 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1586 = _1576 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1588 = fma(_1574, _1534, _1578);
    float _1590 = _1576 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1592 = fma(_1580, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1584);
    float _1594 = fma(_1580, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1586);
    float _1596 = _1554 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1598 = fma(_1580, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1590);
    float _1600 = fma(_1588, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1592);
    float _1602 = fma(_1588, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1594);
    float _1604 = _1554 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1606 = fma(_1588, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1598);
    float _1608 = _1600 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1610 = _1602 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1612 = fma(_1544, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1582);
    float _1614 = _1606 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1616 = _1108 + _1608;
    float _1618 = _1128 + _1610;
    float _1620 = fma(_1544, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1596);
    float _1622 = fma(_1544, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1604);
    float _1624 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1626 = _1616 + _1624;
    float _1628 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1630 = _1618 + _1628;
    float _1632 = _1542 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1634 = _1542 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1636 = _1626 * _1626;
    float _1638 = _1630 * _1630;
    float _1640 = _1542 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1642 = _1562 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1644 = _1562 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1646 = _1636 + _1638;
    float _1648 = _942 + _1614;
    float _1650 = _1562 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1652 = -_1526;
    float _1654 = fma(_1652, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1632);
    float _1656 = sqrt(_1646);
    float _1658 = -_1526;
    float _1660 = fma(_1658, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1634);
    float _1662 = -_1526;
    float _1664 = fma(_1662, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1640);
    float _1666 = fma(_1566, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1612);
    float _1668 = fma(_1566, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1620);
    float _1670 = fma(_1552, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1642);
    float _1672 = fma(_1552, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1644);
    float _1674 = fma(_1566, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1622);
    float _1676 = fma(_1552, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1650);
    bool _1678 = _1656 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1680 = _1562;
    float _1682 = _1616;
    float _1684 = _1642;
    float _1686 = _1618;
    float _1688 = _1636;
    if (!_1678)
    {
        _1680 = _1616;
    }
    float _1690 = _1680;
    float _1692 = _1690;
    if (!_1678)
    {
        _1682 = _1618;
    }
    float _1694 = _1682;
    float _1696 = _1694;
    if (!_1678)
    {
        _1684 = _1638;
    }
    float _1698 = _1684;
    float _1700 = _1698;
    if (!_1678)
    {
        _1686 = _1648;
    }
    float _1702 = _1686;
    bool _1704 = !_1678;
    float _1706 = _1702;
    if (!_1704)
    {
        float _1708 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1710 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1712 = _1656 + _1710;
        float _1714 = rsqrt(_1646);
        float _1716 = _1712 * _1708;
        float _1718 = _1648 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1720 = _1716 * 0.15915493667125701904296875;
        float _1722 = _1720 * 6.283185482025146484375;
        float _1724 = sin(_1722);
        float _1726 = _1720 * 6.283185482025146484375;
        float _1728 = cos(_1726);
        float _1730 = fma(_1724, _1718, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1732 = _1714 * _1730;
        float _1734 = _1728 + (-1.0);
        float _1736 = fma(_1626, _1732, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1738 = fma(_1630, _1732, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1740 = _1734 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1742 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1744 = _1736 + _1742;
        float _1746 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1748 = _1738 + _1746;
        float _1750 = fma(_1648, _1728, _1740);
        float _1752 = _1744 * _1744;
        float _1754 = _1748 * _1748;
        _1706 = _1750;
        _1688 = _1752;
        _1700 = _1754;
        _1692 = _1736;
        _1696 = _1738;
    }
    float _1756 = _1706;
    float _1758 = _1688;
    float _1760 = _1700;
    float _1762 = _1692;
    float _1764 = _1696;
    float _1766 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1768 = _1756 + _1766;
    float _1770 = fma(_1546, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1654);
    float _1772 = fma(_1546, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1660);
    float _1774 = _179 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1776 = fma(_1768, _1768, _1758);
    float _1778 = fma(_1546, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1664);
    float _1780 = _175 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1782 = _1774 * _1770;
    float _1784 = _1776 + _1760;
    float _1786 = _1774 * _1772;
    float _1788 = _1774 * _1778;
    float _1790 = fma(_1574, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1670);
    float _1792 = fma(_1574, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1672);
    float _1794 = fma(_1574, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1676);
    float _1796 = sqrt(_1784);
    float _1798 = fma(_1780, _1666, _1782);
    float _1800 = fma(_1780, _1668, _1786);
    float _1802 = fma(_1780, _1674, _1788);
    float _1804 = _1790 + _1798;
    float _1806 = _1792 + _1800;
    float _1808 = _1794 + _1802;
    out.m_74.x = _1804;
    out.m_74.y = _1806;
    out.m_74.z = _1808;
    bool _1810 = _1796 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1812 = isnan(_1796);
    bool _1814 = _1810 || _1812;
    bool _1816 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1818 = _1814 || _1816;
    float _1820 = _1778;
    if (!_1818)
    {
        _1820 = 1.0;
    }
    float _1822 = _1820;
    bool _1824 = !_1818;
    float _1826 = _1822;
    if (!_1824)
    {
        bool _1828 = _1796 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1830 = isnan(_1796);
        bool _1832 = _1828 || _1830;
        bool _1834 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1836 = _1832 || _1834;
        if (!_1836)
        {
            float _1838 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1840 = _1796 + _1838;
            float _1842 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1844 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1842;
            float _1846 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1848 = _1846 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1850 = 1.0 / _1844;
            float _1852 = _1840 * _1850;
            float _1854 = fma(_1852, _1848, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1826 = _1854;
            _1856 = true;
        }
        else
        {
            bool _1858 = _1796 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1860 = isnan(_1796);
            bool _1862 = _1858 || _1860;
            bool _1864 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1866 = _1862 || _1864;
            if (!_1866)
            {
                float _1868 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1870 = _1796 + _1868;
                float _1872 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1874 = _1872 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1876 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1878 = _1876 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1880 = 1.0 / _1874;
                float _1882 = _1870 * _1880;
                float _1884 = fma(_1882, _1878, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1826 = _1884;
                _1856 = true;
            }
            else
            {
                _1826 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1856 = false;
    float _1886 = _1826;
    float _1888 = _1396 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1890 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1892 = _1762 + _1890;
    float _1894 = fma(_1402, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1888);
    float _1896 = _1396 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1898 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1900 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1902 = _1898 || _1900;
    bool _1904 = isnan(0.5);
    bool _1906 = _1902 || _1904;
    float _1908 = fma(_1412, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1894);
    bool _1910 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1912 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1914 = _1910 || _1912;
    bool _1916 = isnan(0.5);
    bool _1918 = _1914 || _1916;
    float _1920 = _1908 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1922 = fma(_1402, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1896);
    float _1924 = fma(_1892, _1886, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1926 = 1.0 / _1920;
    float _1928 = fma(_1412, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1922);
    float _1930 = _1928 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1932 = _1892;
    if (_1918)
    {
        _1932 = 1.0;
    }
    float _1934 = _1932;
    float _1936 = _1930 + _1920;
    float _1938 = _1936 * _1926;
    float _1940 = _1938 * 0.5;
    float _1942 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1944 = _1756 + _1942;
    float _1946 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1948 = fma(_1940, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1946);
    float _1950 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1952 = _1764 + _1950;
    float _1954 = fma(_1944, _1886, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1956 = -_1390;
    float _1958 = _1956 + _1924;
    float _1960 = fma(_1952, _1886, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1962 = 1.0 / _1948;
    float _1964 = -_1392;
    float _1966 = _1964 + _1954;
    float _1968 = -_1398;
    float _1970 = _1968 + _1960;
    float _1972 = _1966;
    float _1974 = _1958;
    float _1976 = _1970;
    float _1978 = _1962;
    float _1980 = _1960;
    float _1982 = _1934;
    if (!_1906)
    {
        float _1984 = _1406 * _1406;
        float _1986 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1988 = -_1128;
        float _1990 = _1988 + _1960;
        float _1992 = -_942;
        float _1994 = _1992 + _1954;
        float _1996 = fma(_1416, _1416, _1984);
        float _1998 = -_1108;
        float _2000 = _1998 + _1924;
        float _2002 = fma(_1424, _1424, _1996);
        float _2004 = 1.0 / _1512;
        float _2006 = sqrt(_2002);
        float _2008 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2010 = precise::min(_2006, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2012 = _2010 * _1986;
        float _2014 = _2008 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2016 = _2012 * _2004;
        float _2018 = _2014 * _2016;
        float _2020 = _1990 * _2016;
        float _2022 = fma(_1994, _2018, _1396);
        float _2024 = fma(_2000, _2018, _1402);
        float _2026 = fma(_2014, _2020, _1412);
        _1972 = _2022;
        _1974 = _2024;
        _1976 = _2026;
        _1162 = _2020;
    }
    float _2028 = _1972;
    float _2030 = _1974;
    float _2032 = _1976;
    float _2034 = _1162;
    float _2036 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2038 = _1962 * _2036;
    float _2040 = _2034;
    if (!_1918)
    {
        float _2042 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2044 = _2042 * 0.15915493667125701904296875;
        float _2046 = _2044 * 6.283185482025146484375;
        float _2048 = cos(_2046);
        float _2050 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2052 = _2050 * 0.15915493667125701904296875;
        float _2054 = _2044 * 6.283185482025146484375;
        float _2056 = sin(_2054);
        float _2058 = 1.0 / _2048;
        float _2060 = _2052 * 6.283185482025146484375;
        float _2062 = cos(_2060);
        float _2064 = _2056 * _2058;
        float _2066 = _2052 * 6.283185482025146484375;
        float _2068 = sin(_2066);
        float _2070 = _2062 * _2064;
        float _2072 = 1.0 / _2070;
        float _2074 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2076 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2074;
        float _2078 = 1.0 / _2076;
        float _2080 = _2068 * _2072;
        float _2082 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2084 = fma(_2038, _2080, _2082);
        float _2086 = _2084 * _2078;
        float _2088 = precise::clamp(_2086, 0.0, 1.0);
        _1978 = _2084;
        _1980 = _2044;
        _1982 = _2088;
    }
    float _2090 = _1978;
    float _2092 = _1980;
    float _2094 = _1982;
    float _2096 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2098 = _2028 + _2096;
    float _2100 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2102 = _2030 + _2100;
    float _2104 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2106 = _2032 + _2104;
    float _2108 = _2098 * _2098;
    float _2110 = fma(_2102, _2102, _2108);
    float _2112 = fma(_2106, _2106, _2110);
    float _2114 = rsqrt(_2112);
    float _2116 = _2114 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2118 = _2102 * _2116;
    float _2120 = _2106 * _2116;
    float _2122 = _2118 * _2118;
    float _2124 = _2120 * _2120;
    float _2126 = _2122 + _2124;
    float _2128 = sqrt(_2126);
    bool _2130 = _2128 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2132 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2134 = _2128 + _2132;
    float _2136 = _2114;
    float _2138 = _2092;
    float _2140 = _2134;
    float _2142 = _2090;
    float _2144 = _2098;
    float _2146 = _2126;
    if (_2130)
    {
        float _2148 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2136 = _2148;
    }
    float _2150 = _2136;
    if (_2130)
    {
        float _2152 = rsqrt(_2126);
        _2138 = _2152;
    }
    float _2154 = _2138;
    float _2156 = _2154;
    if (_2130)
    {
        float _2158 = _2134 * _2150;
        _2140 = _2158;
    }
    float _2160 = _2140;
    if (_2130)
    {
        float _2162 = _2160 * 0.15915493667125701904296875;
        _2142 = _2162;
    }
    float _2164 = _2142;
    float _2166 = _2106;
    float _2168 = _2164;
    if (_2130)
    {
        float _2170 = _2164 * 6.283185482025146484375;
        float _2172 = sin(_2170);
        _2166 = _2172;
    }
    float _2174 = _2166;
    float _2176 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2178 = precise::max(0.0, _2176);
    float _2180 = _2150;
    if (_2130)
    {
        float _2182 = _2164 * 6.283185482025146484375;
        float _2184 = cos(_2182);
        _2180 = _2184;
    }
    float _2186 = _2180;
    float _2188 = -_2116;
    float _2190 = -_2178;
    float _2192 = fma(_2098, _2188, _2190);
    float _2194 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_2130)
    {
        float _2196 = _2192 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2144 = _2196;
    }
    float _2198 = _2144;
    float _2200 = _2198;
    if (!_2130)
    {
        _2168 = _2118;
    }
    float _2202 = _2168;
    float _2204 = fma(_1402, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2206 = _2174;
    float _2208 = _2202;
    if (_2130)
    {
        float _2210 = fma(_2174, _2198, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2206 = _2210;
    }
    float _2212 = _2206;
    if (!_2130)
    {
        _2200 = _2120;
    }
    float _2214 = _2200;
    float _2216 = _2214;
    float _2218 = _2186;
    if (_2130)
    {
        float _2220 = _2186 + (-1.0);
        _2194 = _2220;
    }
    float _2222 = _2194;
    float _2224 = _2222;
    if (_2130)
    {
        float _2226 = _2154 * _2212;
        _2040 = _2226;
    }
    float _2228 = _2040;
    if (!_2130)
    {
        _2156 = _2192;
    }
    float _2230 = _2156;
    float _2232 = sqrt(_2112);
    float _2234 = _2230;
    if (_2130)
    {
        float _2236 = _2222 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2146 = _2236;
    }
    float _2238 = _2146;
    if (_2130)
    {
        float _2240 = _2118 * _2228;
        _2208 = _2240;
    }
    float _2242 = _2208;
    if (!_2130)
    {
        _2224 = _2122;
    }
    float _2244 = _2224;
    float _2246 = _2244;
    if (_2130)
    {
        float _2248 = _2120 * _2228;
        _2216 = _2248;
    }
    float _2250 = _2216;
    if (_2130)
    {
        float _2252 = fma(_2192, _2186, _2238);
        _2234 = _2252;
    }
    float _2254 = _2234;
    if (_2130)
    {
        float _2256 = _2242 * _2242;
        _2246 = _2256;
    }
    float _2258 = _2246;
    if (!_2130)
    {
        _2218 = _2124;
    }
    float _2260 = _2218;
    float _2262 = _2260;
    if (_2130)
    {
        float _2264 = _2250 * _2250;
        _2262 = _2264;
    }
    float _2266 = _2262;
    float _2268 = fma(_2254, _2254, _2258);
    float _2270 = _2028 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2272 = _2028 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2274 = _2268 + _2266;
    float _2276 = fma(_2030, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2270);
    float _2278 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2280 = fma(_2232, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2278);
    float _2282 = precise::clamp(_2280, 0.0, 1.0);
    float _2284 = rsqrt(_2274);
    float _2286 = fma(_2032, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2276);
    float _2288 = fma(_1412, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2290 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2292 = -_2282;
    float _2294 = _2292 + 1.0;
    float _2296 = _2286 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2298 = _2028 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2300 = floor(_2204);
    float _2302 = _2296 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2304 = fma(_2030, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2272);
    float _2306 = -_2302;
    float _2308 = fma(_2306, _2290, 1.0);
    float _2310 = _2028 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2312 = _2284 * _2242;
    float _2314 = _2284 * _2254;
    float _2316 = fma(_2030, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2310);
    float _2318 = _2284 * _2250;
    float _2320 = abs(_2294);
    float _2322 = log2(_2320);
    float _2324 = fma(_2030, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2298);
    float _2326 = fma(_2032, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2316);
    float _2328 = _2312 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2330 = -_2300;
    float _2332 = _2204 + _2330;
    float _2334 = fma(_2032, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2324);
    float _2336 = _2326 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2338 = -_2328;
    float _2340 = fma(_2314, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2338);
    float _2342 = floor(_2288);
    float _2344 = _2334 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2346 = _2336 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2348 = -_2318;
    float _2350 = fma(_2348, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2340);
    float _2352 = fma(_2032, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2304);
    float _2354 = _2336 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2356 = fma(_2344, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2346);
    float _2358 = fma(_2350, -0.5, 0.5);
    float _2360 = _2322 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2362 = _2352 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2364 = fma(_2296, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2356);
    float _2366 = log2(_2308);
    float _2368 = _2336 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2370 = fma(_2362, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2364);
    float _2372 = fma(_2344, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2354);
    float _2374 = fma(_2350, 0.5, 0.5);
    float _2376 = _2314 + 1.0;
    float _2378 = -_2342;
    float _2380 = _2288 + _2378;
    float _2382 = exp2(_2360);
    float _2384 = fma(_2296, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2372);
    float _2386 = fma(_2374, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2388 = fma(_2362, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2384);
    float _2390 = fma(_2374, _2386, -0.212114393711090087890625);
    float _2392 = 1.0 / _2370;
    float _2394 = fma(_2344, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2368);
    float _2396 = _2366 * 0.693147182464599609375;
    float _2398 = sqrt(_2358);
    float _2400 = fma(_2296, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2394);
    float _2402 = -_2314;
    float _2404 = fma(_2382, _2376, _2402);
    float2 _6550 = float2(_2332, _2380);
    float _2406 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6550, float2(0.0), isnan(_6550)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6550, float2(0.0), isnan(_6550)), level(0.0)).x;
    float _2408 = fma(_2374, _2390, 1.570728778839111328125);
    float _2410 = fma(_2362, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2400);
    float _2412 = _2396 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2414 = fma(_2404, 0.5, 0.5);
    float _2416 = _2388 * _2392;
    float _2418 = _2410 * _2392;
    float _2420 = fma(_2416, 0.5, 0.5);
    float _2422 = fma(_2418, -0.5, 0.5);
    float _2424 = _2398 * 0.636619746685028076171875;
    float _2426 = -_2408;
    float _2428 = fma(_2424, _2426, 1.0);
    float3 _6594 = float3(_2420, _2422, _2412);
    float _2430 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6594, float3(0.0), isnan(_6594)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6594, float3(0.0), isnan(_6594)), level(0.0)).x;
    float3 _6605 = float3(_2420, _2422, _2412);
    float4 _2433 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6605, float3(0.0), isnan(_6605)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6605, float3(0.0), isnan(_6605)), level(0.0)).xyzw;
    float _2435 = _2433.x;
    float _2437 = _2433.y;
    float _2439 = _2433.z;
    float _2441 = _2433.w;
    float2 _6621 = float2(_2428, _2414);
    float3 _2445 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6621, float2(0.0), isnan(_6621)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6621, float2(0.0), isnan(_6621)), level(0.0)).xyz;
    float _2447 = _2445.x;
    float _2449 = _2445.y;
    float _2451 = _2445.z;
    float _2453 = abs(_2038);
    float _2455 = log2(_2453);
    float _2457 = _2336 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2459 = fma(_2344, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2457);
    bool _2461 = _2232 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2463 = isnan(_2232);
    bool _2465 = _2461 || _2463;
    bool _2467 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2469 = _2465 || _2467;
    float _2471 = in.m_76.x;
    float _2473 = fma(_2296, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2459);
    float _2475 = _2322 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2477 = _2038 <= 8000.0;
    bool _2479 = isnan(_2038);
    bool _2481 = _2477 || _2479;
    bool _2483 = isnan(8000.0);
    bool _2485 = _2481 || _2483;
    float _2487 = float(_2485);
    float _2489 = fma(_2362, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2473);
    float _2491 = _2388 + _2370;
    float _2493 = _2455 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2495 = exp2(_2475);
    out.gl_Position.x = _2388;
    out.gl_Position.y = _2410;
    out.gl_Position.z = _2489;
    out.gl_Position.w = _2370;
    float _2497 = _2491 * 0.5;
    float _2499 = exp2(_2493);
    float _2501 = -_2495;
    float _2503 = _2501 + 1.0;
    float _2505 = _2503 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2507 = fma(_2499, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2509 = precise::clamp(_2507, 0.0, 1.0);
    float _2511 = -_2505;
    float _2513 = _2511 + 1.0;
    float _2515 = _2489 + _2370;
    float _2517 = _2489;
    float _2519 = _2370;
    float _2521 = _2410;
    float _2523 = _2497;
    float _2525 = _2513;
    if (!_2469)
    {
        _2517 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2527 = _2517;
    float _2529 = fma(_2509, -2.0, 3.0);
    float _2531 = _2509 * _2509;
    float _2533 = _2515 * 0.5;
    float _2535 = _2531 * _2529;
    float _2537 = -_2535;
    float _2539 = _2537 + 1.0;
    float _2541 = fma(_2539, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2535);
    float _2543 = _2370 * 0.5;
    float _2545 = _2487 * _2541;
    float _2547 = fma(_2410, -0.5, _2543);
    float _2549 = _2527;
    float _2551 = _2527;
    if (!_2469)
    {
        _2519 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2553 = _2519;
    float _2555 = _2545 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_78.x = _2497;
    out.m_78.y = _2547;
    out.m_78.z = _2533;
    out.m_78.w = _2370;
    float _2557 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    float _2559 = _2553;
    float _2561 = _2553;
    if (!_2469)
    {
        _2521 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2563 = _2521;
    float _2565 = _2094 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2567 = _2563;
    float _2569 = _2563;
    if (!_2469)
    {
        _2523 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2571 = _2523;
    float _2573 = -_2406;
    float _2575 = _2573 + 1.0;
    float _2577 = _2575 * _2555;
    float _2579 = precise::clamp(_2577, 0.0, 1.0);
    float _2581 = -_2579;
    float _2583 = fma(_2581, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2585 = _2571;
    float _2587 = _2571;
    if (!_2469)
    {
        _2557 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2589 = _2557;
    float _2591 = _2583 * _2471;
    float _2593 = _2591 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2595 = _2505 * _2430;
    float _2597 = _2441 * _2513;
    out.m_80.x = _2593;
    float _2599 = _2589;
    float _2601 = _2589;
    if (!_2469)
    {
        _2525 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2603 = _2525;
    float _2605 = _2441 * _2595;
    float _2607 = _2451 * _2595;
    float _2609 = fma(_2447, _2605, _2435);
    float _2611 = fma(_2449, _2605, _2437);
    float _2613 = fma(_2441, _2607, _2439);
    out.m_82.x = _2609;
    out.m_82.y = _2611;
    out.m_82.z = _2613;
    out.m_82.w = _2597;
    bool _2615 = !_2469;
    float _2617 = _2603;
    float _2619 = _2603;
    if (!_2615)
    {
        bool _2621 = _2232 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2623 = isnan(_2232);
        bool _2625 = _2621 || _2623;
        bool _2627 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2629 = _2625 || _2627;
        if (!_2629)
        {
            float _2631 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2633 = _2232 + _2631;
            float _2635 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2637 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2635;
            float _2639 = 1.0 / _2637;
            float _2641 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2643 = _2641 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2645 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2647 = _2645 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2649 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2651 = _2649 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2653 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2655 = _2653 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2657 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2659 = _2657 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2661 = _2633 * _2639;
            float _2663 = precise::clamp(_2661, 0.0, 1.0);
            float _2665 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2667 = _2665 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2669 = fma(_2663, _2643, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2671 = fma(_2663, _2667, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2673 = fma(_2663, _2647, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2675 = fma(_2663, _2651, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2677 = fma(_2663, _2655, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2679 = fma(_2663, _2659, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2587 = _2671;
            _2569 = _2677;
            _2601 = _2669;
            _2551 = _2675;
            _2561 = _2673;
            _2619 = _2679;
            _2681 = true;
        }
        else
        {
            bool _2683 = _2232 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2685 = isnan(_2232);
            bool _2687 = _2683 || _2685;
            bool _2689 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2691 = _2687 || _2689;
            if (!_2691)
            {
                _2599 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2693 = _2599;
            _2601 = _2693;
            if (!_2691)
            {
                _2585 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2695 = _2585;
            _2587 = _2695;
            if (!_2691)
            {
                _2559 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2697 = _2559;
            _2561 = _2697;
            if (!_2691)
            {
                _2549 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2699 = _2549;
            _2551 = _2699;
            if (!_2691)
            {
                _2567 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2701 = _2567;
            _2569 = _2701;
            if (!_2691)
            {
                _2617 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2703 = _2617;
            bool _2705 = !_2691;
            _2619 = _2703;
            if (!_2705)
            {
                bool _2707 = _2232 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2709 = isnan(_2232);
                bool _2711 = _2707 || _2709;
                bool _2713 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2715 = _2711 || _2713;
                if (!_2715)
                {
                    float _2717 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2719 = _2232 + _2717;
                    float _2721 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2723 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2721;
                    float _2725 = 1.0 / _2723;
                    float _2727 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2729 = _2727 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2731 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2733 = _2731 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2735 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2737 = _2735 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2739 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2741 = _2739 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2743 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2745 = _2743 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2747 = _2719 * _2725;
                    float _2749 = precise::clamp(_2747, 0.0, 1.0);
                    float _2751 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2753 = _2751 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2755 = fma(_2749, _2729, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2757 = fma(_2749, _2753, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2759 = fma(_2749, _2733, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2761 = fma(_2749, _2737, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2763 = fma(_2749, _2741, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2765 = fma(_2749, _2745, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2587 = _2757;
                    _2569 = _2763;
                    _2601 = _2755;
                    _2551 = _2761;
                    _2561 = _2759;
                    _2619 = _2765;
                    _2681 = true;
                }
                else
                {
                    _2587 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2569 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2601 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2551 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2561 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2619 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2681 = false;
    float _2767 = _2587;
    float _2769 = _2569;
    float _2771 = _2601;
    float _2773 = _2551;
    float _2775 = _2561;
    float _2777 = _2619;
    float _2779 = fma(_1806, -0.5, 0.5);
    float _2781 = precise::clamp(_2779, 0.0, 1.0);
    float _2783 = -_2767;
    float _2785 = _2783 + _2769;
    float _2787 = _2565 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2789 = -_2771;
    float _2791 = _2789 + _2773;
    float _2793 = fma(_2781, _2785, _2767);
    out.m_84.x = 0.0;
    float _2795 = -_2775;
    float _2797 = _2795 + _2777;
    float _2799 = fma(_2781, _2791, _2771);
    float _2801 = _2793 * 0.586610972881317138671875;
    out.m_55.x = _2787;
    bool _2803 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2805 = fma(_2781, _2797, _2775);
    float _2807 = fma(_2799, 0.298911988735198974609375, _2801);
    bool _2809 = _2094 > 0.0;
    bool _2811 = isnan(_2094);
    bool _2813 = _2809 || _2811;
    bool _2815 = isnan(0.0);
    bool _2817 = _2813 || _2815;
    float _2819 = fma(_2805, 0.114477999508380889892578125, _2807);
    float _2821 = -_2819;
    float _2823 = _2799 + _2821;
    float _2825 = -_2819;
    float _2827 = _2793 + _2825;
    float _2829 = -_2819;
    float _2831 = _2805 + _2829;
    float _2833 = fma(_2823, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2819);
    float _2835 = fma(_2827, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2819);
    float _2837 = fma(_2831, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2819);
    bool _2839 = !_2803;
    if (!_2839)
    {
        float _2841 = -_2028;
        float _2843 = _2841 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2845 = -_2030;
        float _2847 = _2845 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2849 = -_2032;
        float _2851 = _2849 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2853 = _2843 * _2843;
        float _2855 = fma(_2847, _2847, _2853);
        float _2857 = fma(_2851, _2851, _2855);
        float _2859 = sqrt(_2857);
        float _2861 = rsqrt(_2857);
        float _2863 = -_2859;
        float _2865 = _2863 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2867 = _2865 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2869 = precise::clamp(_2867, 0.0, 1.0);
        float _2871 = _2847 * _2861;
        float _2873 = _2843 * _2861;
        float _2875 = abs(_2869);
        float _2877 = log2(_2875);
        float _2879 = _2851 * _2861;
        float _2881 = _2871 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2883 = _1806 * _2873;
        float _2885 = -_2873;
        float _2887 = -_2881;
        float _2889 = fma(_2885, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2887);
        float _2891 = fma(_1804, _2871, _2883);
        float _2893 = -_2879;
        float _2895 = fma(_2893, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2889);
        float _2897 = fma(_1808, _2879, _2891);
        float _2899 = precise::clamp(_2897, 0.0, 1.0);
        float _2901 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2903 = _2895 + _2901;
        float _2905 = _2877 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2907 = _2903 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2909 = precise::clamp(_2907, 0.0, 1.0);
        float _2911 = exp2(_2905);
        float _2913 = _2911 * _2909;
        float _2915 = _2899 * _2913;
        float _2917 = _2915 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2919 = _2915 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2921 = _2915 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_84.x = _2917;
        out.m_84.y = _2919;
        out.m_84.z = _2921;
    }
    out.m_86.x = _2833;
    out.m_86.y = _2835;
    out.m_86.z = _2837;
    if (_2817)
    {
        return out;
    }
    out.m_55.x = 0.0;
    float _2923 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2923;
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
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2681 = false;
    bool _1856 = false;
    bool _297 = false;
    bool _201 = false;
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
        float _2991 = as_type<float>(_129);
        out.gl_Position.z = _2991;
    }
    if (!_115)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _3046 = as_type<float>(_155);
        out.gl_Position.z = _3046;
    }
    if (_149)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    float _199;
    if (!_181)
    {
        float _183 = in.m_60.x;
        float _185 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _187 = _183 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _189 = fma(_187, (*spvDescriptorSet0.vp_c9)._m0[12].x, _111);
        float _191 = _189 * _185;
        float _193 = floor(_191);
        float _195 = -_193;
        float _197 = _191 + _195;
        _199 = _197;
        _201 = true;
    }
    else
    {
        _199 = _163;
    }
    _201 = false;
    float _203 = _199;
    float _205 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _207 = _203 + _205;
    bool _209 = _203 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _211 = isnan(_203);
    bool _213 = _209 || _211;
    bool _215 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _217 = _213 || _215;
    float _219 = float(_217);
    float _221 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _223 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _221;
    float _225 = -_219;
    float _227 = _225 + 1.0;
    bool _229 = _203 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _231 = isnan(_203);
    bool _233 = _229 || _231;
    bool _235 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _237 = _233 || _235;
    float _239 = float(_237);
    float _241 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _243 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _241;
    bool _245 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _247 = 1.0 / _223;
    float _249 = _239 * _227;
    float _251 = -_239;
    float _253 = _251 + 1.0;
    float _255 = _207 * _247;
    float _257 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _259 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _257;
    float _261 = fma(_243, _255, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _263 = fma(_259, _255, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _265 = _261 * _249;
    float _267 = _263 * _249;
    float _269 = fma(_253, (*spvDescriptorSet0.vp_c9)._m0[143].x, _265);
    float _271 = fma(_253, (*spvDescriptorSet0.vp_c9)._m0[143].y, _267);
    float _273 = fma(_219, (*spvDescriptorSet0.vp_c9)._m0[144].x, _269);
    float _275 = fma(_219, (*spvDescriptorSet0.vp_c9)._m0[144].y, _271);
    bool _277 = !_245;
    float _295;
    if (!_277)
    {
        float _279 = in.m_60.x;
        float _281 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _283 = _279 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _285 = fma(_283, (*spvDescriptorSet0.vp_c9)._m0[11].y, _111);
        float _287 = _285 * _281;
        float _289 = floor(_287);
        float _291 = -_289;
        float _293 = _287 + _291;
        _295 = _293;
        _297 = true;
    }
    else
    {
        _295 = _163;
    }
    _297 = false;
    float _299 = _295;
    float _301 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _303 = int(_301);
    float _305 = in.m_60.x;
    float _307 = in.m_60.y;
    float _309 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _311 = int(_309);
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _315 = _313 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _317 = float(_303);
    float _319 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _321 = log2(_319);
    float _323 = float(uint(_311));
    float _325 = 1.0 / _317;
    int _327 = ~_311;
    int _329 = _327 + 1;
    float _331 = _307 * 2.0;
    float _333 = float(_311);
    int _335 = ~_311;
    int _337 = _335 + 1;
    float _339 = 1.0 / _323;
    float _341 = _321 * _111;
    float _343 = _325 * _111;
    float _345 = exp2(_341);
    int _347 = as_type<int>(_339) + (-2);
    float _349 = trunc(_343);
    int _351 = int(_349);
    float _353 = 1.0 / _315;
    float _355 = -_345;
    float _357 = _355 + 1.0;
    float _359 = float(uint(_351));
    float _361 = floor(_331);
    float _363 = float(_351);
    float _365 = as_type<float>(_347) * _359;
    float _367 = trunc(_365);
    float _369 = precise::max(_367, 0.0);
    uint _372 = uint(_369);
    int _374 = ~_311;
    int _376 = _374 + 1;
    int _378 = _329 * int(_372);
    int _380 = _378 + _351;
    float _382 = float(uint(_380));
    float _384 = as_type<float>(_347) * _382;
    int _386 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _388 = _386 != 0;
    bool _390 = _363 >= _333;
    bool _392 = isnan(_363);
    bool _394 = _390 || _392;
    bool _396 = isnan(_333);
    bool _398 = _394 || _396;
    float _400 = float(_398);
    float _402 = trunc(_384);
    float _404 = precise::max(_402, 0.0);
    uint _406 = uint(_404);
    int _408 = int(_372) + int(_406);
    float _410 = trunc(_400);
    int _412 = int(_410);
    int _414 = _376 * _408;
    int _416 = _414 + _351;
    bool _418 = !_388;
    float _420 = _418 ? 7.345489978790283203125 : 1.0;
    bool _422 = uint(_416) >= uint(_311);
    float _424 = _420 * _305;
    bool _426 = !_422;
    int _428 = _426 ? 0 : (-1);
    float _430 = floor(_424);
    bool _432 = _311 == 0;
    int _434 = ~_408;
    int _436 = _434 + _428;
    int _438 = _436 + 1;
    int _440 = ~_412;
    int _442 = _440 + 1;
    int _444 = _442 + 1;
    int _446 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _448 = _446 != 0;
    int _450 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _452 = _450 != 0;
    int _454 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _456 = _454 != 0;
    int _458 = _311 * _438;
    int _460 = _458 + _351;
    int _462 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _464 = _462 != 0;
    int _466 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _468 = _466 != 0;
    bool _470 = !_432;
    int _472 = _470 ? _460 : (-1);
    float _474 = -_430;
    float _476 = _424 + _474;
    int _478 = _311 + (-1);
    int _480 = _472 * _444;
    float _482 = in.m_62.x;
    float _484 = in.m_62.y;
    float _486 = _476 * _333;
    float _488 = _333 * _111;
    int _490 = _412 * _478;
    int _492 = _490 + _480;
    bool _494 = !_452;
    int _496 = _494 ? 0 : 1;
    float _498 = _488 * _159;
    bool _500 = !_448;
    int _502 = _500 ? 0 : 1;
    float _504 = trunc(_486);
    int _506 = int(_504);
    int _508 = abs(_496);
    int _510 = abs(_502);
    bool _512 = !_464;
    int _514 = _512 ? 0 : 1;
    float _516 = trunc(_498);
    int _518 = int(_516);
    int _520 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _522 = _520 != 0;
    int _524 = _492 * _508;
    int _526 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _528 = _526 != 0;
    int _530 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _532 = _530 != 0;
    int _534 = abs(_514);
    float _536 = _273 * _482;
    bool _538 = !_468;
    int _540 = _538 ? 0 : 1;
    int _542 = _506 * _534;
    int _544 = _542 + _351;
    bool _546 = !_456;
    int _548 = _546 ? 0 : 1;
    int _550 = abs(_540);
    int _552 = _518 * _510;
    int _554 = _552 + _524;
    int _556 = abs(_548);
    float _558 = in.m_48.x;
    float _560 = in.m_48.y;
    float _562 = in.m_48.z;
    float _564 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _566 = _564 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    int _568 = _544 * _556;
    int _570 = _568 + _554;
    float _572 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _574 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _576 = _574 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _578 = 1.0 / _566;
    int _580 = _506 * _550;
    int _582 = _580 + _570;
    float _584 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _586 = _305 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _588 = _307 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _590 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _592 = isnan(0.0);
    bool _594 = _590 || _592;
    bool _596 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _598 = _594 || _596;
    float _600 = 1.0 / _576;
    float _602 = -_584;
    float _604 = fma(_586, 2.0, _602);
    float _606 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _608 = _305 * 2.0;
    float _610 = fma(_588, -2.0, _572);
    float _612 = _598 ? _357 : 0.0;
    out.m_64.w = _606;
    float _614 = _560 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _616 = _560 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _618 = _560 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _620 = float(uint(_582));
    float _622 = fma(_558, (*spvDescriptorSet0.vp_c10)._m0[4].x, _614);
    float _624 = fma(_558, (*spvDescriptorSet0.vp_c10)._m0[5].x, _616);
    float _626 = fma(_558, (*spvDescriptorSet0.vp_c10)._m0[6].x, _618);
    float _628 = as_type<float>(_347) * _620;
    float _630 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _632 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _630;
    float _634 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _636 = _634 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _638 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _640 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _638;
    float _642 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _644 = _642 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    int _646 = ~_311;
    int _648 = _646 + 1;
    float _650 = trunc(_628);
    float _652 = precise::max(_650, 0.0);
    uint _654 = uint(_652);
    float _656 = _636 * _600;
    float _658 = _640 * _578;
    float _660 = _632 * _353;
    float _662 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _664 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _666 = isnan(1.0);
    bool _668 = _664 || _666;
    bool _670 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _672 = _668 || _670;
    float _674 = floor(_608);
    float _676 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _678 = 1.0 + _676;
    float _680 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _682 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[78].w, _662);
    float _684 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _686 = _684 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _688 = 1.0 / _644;
    float _690 = 1.0 / _678;
    int _692 = _648 * int(_654);
    int _694 = _692 + _582;
    bool _696 = _674 > 0.0;
    float _698 = in.m_60.z;
    bool _700 = _674 >= 0.0;
    bool _702 = isnan(_674);
    bool _704 = _700 || _702;
    bool _706 = isnan(0.0);
    bool _708 = _704 || _706;
    float _710 = _307 + _305;
    float _712 = float(uint(_694));
    float _714 = fma(_305, (*spvDescriptorSet0.vp_c9)._m0[78].z, _680);
    float _716 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[77].w, _682);
    float _718 = _710 + (-1.0);
    float _720 = as_type<float>(_347) * _712;
    float _722 = -_111;
    float _724 = fma(_722, (*spvDescriptorSet0.vp_c9)._m0[76].x, _604);
    float _726 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[77].z, _714);
    float _728 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[76].y, _610);
    int _730 = _708 ? 0 : 1;
    if (_672)
    {
        float _732 = _612 * _690;
        _121 = _732;
    }
    float _734 = _121;
    float _736 = trunc(_720);
    float _738 = precise::max(_736, 0.0);
    uint _740 = uint(_738);
    bool _742 = _305 > 0.5;
    float _744 = fma(_718, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _746 = _361 >= 0.0;
    bool _748 = isnan(_361);
    bool _750 = _746 || _748;
    bool _752 = isnan(0.0);
    bool _754 = _750 || _752;
    float _756 = _686 * _688;
    float _758 = -_175;
    int _760 = _742 ? as_type<int>(_758) : as_type<int>(_175);
    float _762 = -_726;
    float _764 = _762 + 1.0;
    bool _766 = _361 > 0.0;
    float _768 = -_716;
    float _770 = _768 + 1.0;
    float _772 = float(uint(_544));
    float _774 = _698 * 2.0;
    int _776 = ~_730;
    int _778 = _776 + 1;
    int _780 = _778 + 1;
    int _782 = _780;
    if (!_696)
    {
        int _784 = ~_730;
        int _786 = _784 + 1;
        _782 = _786;
    }
    int _788 = _782;
    float _790 = as_type<float>(_347) * _772;
    float _792 = _307 + _698;
    int _794 = int(_654) + int(_740);
    float _796 = floor(_774);
    int _798 = ~_311;
    int _800 = _798 + 1;
    float _802 = _792 + (-1.0);
    bool _804 = _307 > 0.5;
    int _806 = _800 * _794;
    int _808 = _806 + _582;
    float _810 = trunc(_790);
    float _812 = precise::max(_810, 0.0);
    uint _814 = uint(_812);
    float _816 = fma(_802, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _818 = _754 ? 0 : 1;
    float _820 = -_179;
    int _822 = _804 ? as_type<int>(_820) : as_type<int>(_179);
    bool _824 = uint(_808) >= uint(_311);
    bool _826 = !_528;
    float _828 = _826 ? _175 : as_type<float>(_760);
    int _830 = ~_818;
    int _832 = _830 + 1;
    int _834 = _832 + 1;
    bool _836 = !_532;
    float _838 = _836 ? _179 : as_type<float>(_822);
    int _840 = _834;
    if (!_766)
    {
        int _842 = ~_818;
        int _844 = _842 + 1;
        _840 = _844;
    }
    int _846 = _840;
    bool _848 = !_824;
    int _850 = _848 ? 0 : (-1);
    int _852 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _854 = _852 != 0;
    int _856 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _858 = _856 != 0;
    int _860 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _862 = _860 != 0;
    float _864 = fma(_562, (*spvDescriptorSet0.vp_c10)._m0[4].z, _622);
    bool _866 = _796 > 0.0;
    float _868 = fma(_562, (*spvDescriptorSet0.vp_c10)._m0[5].z, _624);
    bool _870 = _796 >= 0.0;
    bool _872 = isnan(_796);
    bool _874 = _870 || _872;
    bool _876 = isnan(0.0);
    bool _878 = _874 || _876;
    int _880 = _337 * int(_814);
    int _882 = _880 + _544;
    int _884 = ~_794;
    int _886 = _884 + _850;
    int _888 = _886 + 1;
    float _890 = fma(_562, (*spvDescriptorSet0.vp_c10)._m0[6].z, _626);
    float _892 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _894 = _299 + _892;
    bool _896 = _299 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _898 = isnan(_299);
    bool _900 = _896 || _898;
    bool _902 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _904 = _900 || _902;
    float _906 = float(_904);
    float _908 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _910 = _299 + _908;
    float _912 = float(uint(_882));
    int _914 = _311 * _888;
    int _916 = _914 + _582;
    float _918 = fma(_660, _894, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _920 = _299 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _922 = isnan(_299);
    bool _924 = _920 || _922;
    bool _926 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _928 = _924 || _926;
    float _930 = float(_928);
    float _932 = -_906;
    float _934 = _932 + 1.0;
    float _936 = as_type<float>(_347) * _912;
    bool _938 = !_432;
    int _940 = _938 ? _916 : (-1);
    float _942 = _868 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _944 = _930 * _934;
    bool _946 = _299 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _948 = isnan(_299);
    bool _950 = _946 || _948;
    bool _952 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _954 = _950 || _952;
    float _956 = float(_954);
    float _958 = -_930;
    float _960 = _958 + 1.0;
    bool _962 = _299 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _964 = isnan(_299);
    bool _966 = _962 || _964;
    bool _968 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _970 = _966 || _968;
    float _972 = float(_970);
    float _974 = trunc(_936);
    float _976 = precise::max(_974, 0.0);
    uint _978 = uint(_976);
    int _980 = _940 >> 31;
    float _982 = -_956;
    float _984 = _982 + 1.0;
    bool _986 = _299 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _988 = isnan(_299);
    bool _990 = _986 || _988;
    bool _992 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _994 = _990 || _992;
    float _996 = float(_994);
    float _998 = _972 * _960;
    int _1000 = _980 & 3;
    float _1002 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1004 = _299 + _1002;
    float _1006 = -_972;
    float _1008 = _1006 + 1.0;
    float _1010 = _996 * _984;
    int _1012 = _940 + _1000;
    float _1014 = fma(_656, _1004, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1016 = _956 * _1008;
    float _1018 = _918 * _1010;
    int _1020 = _1012 >> 2;
    float _1022 = fma(_658, _910, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1024 = _838 + (-0.5);
    float _1026 = _828 + 0.5;
    int _1028 = _1020 << 4;
    int _1030 = _1028 + 368;
    float _1032 = -_996;
    float _1034 = _1032 + 1.0;
    float _1036 = -_1024;
    float _1038 = -_728;
    float _1040 = fma(_1036, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1038);
    float _1042 = fma(_1026, (*spvDescriptorSet0.vp_c9)._m0[80].x, _724);
    uint _1044 = uint(int(uint(_1030) >> uint(2)));
    uint _1046 = uint(int(uint(int(_1044)) >> uint(2)));
    int _1048 = int(_1044) & 3;
    float _1050 = (*spvDescriptorSet0.vp_c9)._m0[int(_1046)][_1048];
    int _1052 = int(_1044) + 1;
    uint _1054 = uint(int(uint(_1052) >> uint(2)));
    int _1056 = _1052 & 3;
    float _1058 = (*spvDescriptorSet0.vp_c9)._m0[int(_1054)][_1056];
    float _1060 = fma(_1034, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1018);
    int _1062 = int(_814) + int(_978);
    float _1064 = -_764;
    float _1066 = fma(_828, _1064, _1042);
    bool _1068 = !_858;
    int _1070 = _1068 ? 0 : 1;
    float _1072 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1074 = _299 + _1072;
    int _1076 = ~_311;
    int _1078 = _1076 + 1;
    float _1080 = fma(_1014, _1016, _1060);
    int _1082 = _940 & 3;
    bool _1084 = _1082 != 0;
    float _1086 = fma(_756, _1074, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    int _1088 = _878 ? 0 : 1;
    int _1090 = _1078 * _1062;
    int _1092 = _1090 + _544;
    int _1094 = _940 & 3;
    bool _1096 = _1094 != 0;
    float _1098 = fma(_838, _770, _1040);
    int _1100 = _1084 ? 0 : 1;
    float _1102 = fma(_1022, _998, _1080);
    bool _1104 = !_854;
    int _1106 = _1104 ? 0 : 1;
    float _1108 = _864 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _1110 = uint(_1094) > 1u;
    out.m_66.x = _1066;
    out.m_66.y = _1098;
    int _1112 = ~_1088;
    int _1114 = _1112 + 1;
    int _1116 = _1114 + 1;
    float _1118 = fma(_1086, _944, _1102);
    int _1120 = _1116;
    if (!_866)
    {
        int _1122 = ~_1088;
        int _1124 = _1122 + 1;
        _1120 = _1124;
    }
    int _1126 = _1120;
    float _1128 = _890 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1130 = uint(_1092) >= uint(_311);
    int _1132 = abs(_1106);
    int _1134 = _1030 + 8;
    uint _1136 = uint(int(uint(_1134) >> uint(2)));
    uint _1138 = uint(int(uint(int(_1136)) >> uint(2)));
    int _1140 = int(_1136) & 3;
    float _1142 = (*spvDescriptorSet0.vp_c9)._m0[int(_1138)][_1140];
    int _1144 = int(_1136) + 1;
    uint _1146 = uint(int(uint(_1144) >> uint(2)));
    int _1148 = _1144 & 3;
    float _1150 = (*spvDescriptorSet0.vp_c9)._m0[int(_1146)][_1148];
    int _1152 = abs(_1070);
    int _1154 = ~_1100;
    int _1156 = _1154 + 1;
    int _1158 = _1156 + 1;
    int _1160 = _1158;
    float _1162 = _1128;
    if (!_1110)
    {
        int _1164 = ~_1100;
        int _1166 = _1164 + 1;
        _1160 = _1166;
    }
    int _1168 = _1160;
    float _1170 = float(_788);
    float _1172 = float(_1152);
    bool _1174 = uint(_1094) >= 2u;
    int _1176 = abs(_1168);
    float _1178 = _1172 * _1170;
    int _1180 = _1174 ? 0 : 1;
    bool _1182 = _1094 != 3;
    float _1184 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1186 = _1108 + _1184;
    float _1188 = float(_1132);
    float _1190 = float(_1126);
    int _1192 = ~_1176;
    int _1194 = _1192 + 1;
    int _1196 = _1194 + 1;
    bool _1198 = !_1130;
    int _1200 = _1198 ? 0 : (-1);
    float _1202 = _1188 * _1190;
    bool _1204 = !_522;
    int _1206 = _1204 ? 0 : 1;
    int _1208 = _1196 * as_type<int>(_1058);
    bool _1210 = !_1096;
    int _1212 = _1210 ? 0 : 1;
    bool _1214 = _1094 != 3;
    int _1216 = ~_1180;
    int _1218 = _1216 + 1;
    int _1220 = _1218 + 1;
    int _1222 = ~_1062;
    int _1224 = _1222 + _1200;
    int _1226 = _1224 + 1;
    int _1228 = _1220;
    if (_1182)
    {
        int _1230 = ~_1180;
        int _1232 = _1230 + 1;
        _1228 = _1232;
    }
    int _1234 = _1228;
    float _1236 = in.m_68.x;
    float _1238 = in.m_68.y;
    float _1240 = in.m_68.z;
    int _1242 = abs(_1206);
    float _1244 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1246 = _942 + _1244;
    int _1248 = abs(_1212);
    int _1250 = _311 * _1226;
    int _1252 = _1250 + _544;
    bool _1254 = !_1214;
    int _1256 = _1254 ? 0 : (-1);
    float _1258 = _1246 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1260 = abs(_1234);
    int _1262 = abs(_1256);
    float _1264 = fma(_1186, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1258);
    int _1266 = ~_1248;
    int _1268 = _1266 + 1;
    int _1270 = _1268 + 1;
    float _1272 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1274 = _1128 + _1272;
    int _1276 = ~_1260;
    int _1278 = _1276 + 1;
    int _1280 = _1278 + 1;
    int _1282 = _1270 * as_type<int>(_1050);
    int _1284 = _1282 + _1208;
    int _1286 = ~_1262;
    int _1288 = _1286 + 1;
    int _1290 = _1288 + 1;
    float _1292 = fma(_1274, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1264);
    int _1294 = _1280 * as_type<int>(_1142);
    int _1296 = _1294 + _1284;
    float _1298 = _1178 * (-2.0);
    int _1300 = ~_1242;
    int _1302 = _1300 + 1;
    int _1304 = _1302 + 1;
    int _1306 = _1290 * as_type<int>(_1150);
    int _1308 = _1306 + _1296;
    float _1310 = _1202 * (-2.0);
    float _1312 = fma(_906, (*spvDescriptorSet0.vp_c9)._m0[119].x, _1118);
    bool _1314 = _1292 >= 0.0;
    int _1316 = _1308 * _1304;
    float _1318 = fma(_744, _1310, _744);
    float _1320 = fma(_1310, _1236, _1236);
    float _1322 = _1246 * _1246;
    bool _1324 = !_432;
    int _1326 = _1324 ? _1252 : (-1);
    float _1328 = fma(_816, _1298, _816);
    float _1330 = fma(_1298, _1238, _1238);
    float _1332 = fma(_1186, _1186, _1322);
    int _1334 = _1326 * _1242;
    int _1336 = _1334 + _1316;
    float _1338 = fma(_1274, _1274, _1332);
    float _1340 = _305 + (-0.5);
    float _1342 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1344 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1346 = (*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1348 = _1240;
    if (_1314)
    {
        _1346 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1350 = _1346;
    float _1352 = rsqrt(_1338);
    float _1354 = fma(_1340, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1320);
    float _1356 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1358 = _536 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1360 = _1342 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1362 = _1344 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1364 = _1356 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1366 = _1312 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _1368 = as_type<int>(_1350);
    if (_1314)
    {
        float _1370 = _1350 * 5.0;
        _1368 = as_type<int>(_1370);
    }
    int _1372 = _1368;
    float _1374 = float(_1336);
    float _1376 = _1358 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    bool _1378 = !_862;
    int _1380 = _1378 ? 0 : 1;
    out.m_70.x = _1364;
    out.m_70.y = _1360;
    out.m_70.z = _1362;
    out.m_70.w = _1366;
    float _1382 = fma(_1318, _734, _1354);
    float _1384 = _307 + (-0.5);
    float _1386 = _1376 * _1352;
    if (_1314)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4860 = as_type<float>(_1372);
        out.gl_Position.z = _4860;
    }
    int _1388 = abs(_1380);
    float _1390 = _1186 * _1386;
    out.m_72.x = _1374;
    float _1392 = _1246 * _1386;
    if (_1314)
    {
        out.m_55.x = 0.0;
    }
    if (_1314)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1394 = -_1392;
    float _1396 = _942 + _1394;
    float _1398 = _1274 * _1386;
    float _1400 = -_1390;
    float _1402 = _1108 + _1400;
    float _1404 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1406 = _1396 + _1404;
    float _1408 = float(_846);
    float _1410 = -_1398;
    float _1412 = _1128 + _1410;
    float _1414 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1416 = _1402 + _1414;
    float _1418 = _1406 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1420 = float(_1388);
    float _1422 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1424 = _1412 + _1422;
    float _1426 = -_1392;
    float _1428 = _1246 + _1426;
    float _1430 = fma(_1416, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1418);
    float _1432 = -_1390;
    float _1434 = _1186 + _1432;
    float _1436 = fma(_1384, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1330);
    float _1438 = _1428 * _1428;
    float _1440 = fma(_1424, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1430);
    float _1442 = _698 + _305;
    float _1444 = _1420 * _1408;
    float _1446 = fma(_1434, _1434, _1438);
    float _1448 = fma(_1328, _734, _1436);
    bool _1450 = _1440 >= 0.0;
    float _1452 = _1442 + (-1.0);
    float _1454 = _1444 * (-2.0);
    float _1456 = -_1398;
    float _1458 = _1274 + _1456;
    float _1460 = _1448 * 0.15915493667125701904296875;
    float _1462 = fma(_1452, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1464 = _698 + (-0.5);
    float _1466 = fma(_1454, _1240, _1240);
    float _1468 = _1382 * 0.15915493667125701904296875;
    float _1470 = fma(_1458, _1458, _1446);
    float _1472 = _1460 * 6.283185482025146484375;
    float _1474 = sin(_1472);
    float _1476 = fma(_1464, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1466);
    float _1478 = fma(_1462, _1454, _1462);
    if (_1450)
    {
        _1348 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1480 = _1348;
    int _1482 = as_type<int>(_1480);
    if (_1450)
    {
        out.m_55.x = 0.0;
    }
    float _1484 = fma(_1478, _734, _1476);
    float _1486 = _1468 * 6.283185482025146484375;
    float _1488 = sin(_1486);
    if (_1450)
    {
        float _1490 = _1480 * 5.0;
        _1482 = as_type<int>(_1490);
    }
    int _1492 = _1482;
    float _1494 = _1484 * 0.15915493667125701904296875;
    if (_1450)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5047 = as_type<float>(_1492);
        out.gl_Position.z = _5047;
    }
    float _1496 = _1468 * 6.283185482025146484375;
    float _1498 = cos(_1496);
    float _1500 = sqrt(_1470);
    float _1502 = _1460 * 6.283185482025146484375;
    float _1504 = cos(_1502);
    if (_1450)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1506 = _1494 * 6.283185482025146484375;
    float _1508 = cos(_1506);
    float _1510 = _275 * _484;
    float _1512 = _1352 * _1500;
    float _1514 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _179);
    float _1516 = _1488 * _1474;
    float _1518 = _1510 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1520 = _1498 * _1504;
    float _1522 = _1498 * _1474;
    float _1524 = _1494 * 6.283185482025146484375;
    float _1526 = sin(_1524);
    float _1528 = _1518 * _1512;
    float _1530 = _1488 * _1504;
    float _1532 = _1512 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1534 = _1532 * 0.5;
    float _1536 = _1514 * _1528;
    float _1538 = _1358 * _1512;
    float _1540 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _175);
    float _1542 = _1498 * _1508;
    float _1544 = _1504 * _1508;
    float _1546 = _1488 * _1508;
    float _1548 = _1540 * _1538;
    float _1550 = _1542 * _1536;
    float _1552 = _1474 * _1508;
    float _1554 = fma(_1526, _1520, _1516);
    float _1556 = -_1536;
    float _1558 = _1526 * _1556;
    float _1560 = -_1530;
    float _1562 = fma(_1526, _1522, _1560);
    float _1564 = -_1522;
    float _1566 = fma(_1526, _1530, _1564);
    float _1568 = fma(_1554, _1548, _1550);
    float _1570 = _1546 * _1536;
    float _1572 = fma(_1544, _1548, _1558);
    float _1574 = fma(_1526, _1516, _1520);
    float _1576 = fma(_1562, _1534, _1568);
    float _1578 = fma(_1566, _1548, _1570);
    float _1580 = fma(_1552, _1534, _1572);
    float _1582 = _1554 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1584 = _1576 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1586 = _1576 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1588 = fma(_1574, _1534, _1578);
    float _1590 = _1576 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1592 = fma(_1580, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1584);
    float _1594 = fma(_1580, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1586);
    float _1596 = _1554 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1598 = fma(_1580, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1590);
    float _1600 = fma(_1588, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1592);
    float _1602 = fma(_1588, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1594);
    float _1604 = _1554 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1606 = fma(_1588, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1598);
    float _1608 = _1600 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1610 = _1602 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1612 = fma(_1544, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1582);
    float _1614 = _1606 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1616 = _1108 + _1608;
    float _1618 = _1128 + _1610;
    float _1620 = fma(_1544, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1596);
    float _1622 = fma(_1544, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1604);
    float _1624 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1626 = _1616 + _1624;
    float _1628 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1630 = _1618 + _1628;
    float _1632 = _1542 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1634 = _1542 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1636 = _1626 * _1626;
    float _1638 = _1630 * _1630;
    float _1640 = _1542 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1642 = _1562 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1644 = _1562 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1646 = _1636 + _1638;
    float _1648 = _942 + _1614;
    float _1650 = _1562 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1652 = -_1526;
    float _1654 = fma(_1652, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1632);
    float _1656 = sqrt(_1646);
    float _1658 = -_1526;
    float _1660 = fma(_1658, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1634);
    float _1662 = -_1526;
    float _1664 = fma(_1662, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1640);
    float _1666 = fma(_1566, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1612);
    float _1668 = fma(_1566, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1620);
    float _1670 = fma(_1552, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1642);
    float _1672 = fma(_1552, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1644);
    float _1674 = fma(_1566, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1622);
    float _1676 = fma(_1552, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1650);
    bool _1678 = _1656 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1680 = _1562;
    float _1682 = _1616;
    float _1684 = _1642;
    float _1686 = _1618;
    float _1688 = _1636;
    if (!_1678)
    {
        _1680 = _1616;
    }
    float _1690 = _1680;
    float _1692 = _1690;
    if (!_1678)
    {
        _1682 = _1618;
    }
    float _1694 = _1682;
    float _1696 = _1694;
    if (!_1678)
    {
        _1684 = _1638;
    }
    float _1698 = _1684;
    float _1700 = _1698;
    if (!_1678)
    {
        _1686 = _1648;
    }
    float _1702 = _1686;
    bool _1704 = !_1678;
    float _1706 = _1702;
    if (!_1704)
    {
        float _1708 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1710 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1712 = _1656 + _1710;
        float _1714 = rsqrt(_1646);
        float _1716 = _1712 * _1708;
        float _1718 = _1648 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1720 = _1716 * 0.15915493667125701904296875;
        float _1722 = _1720 * 6.283185482025146484375;
        float _1724 = sin(_1722);
        float _1726 = _1720 * 6.283185482025146484375;
        float _1728 = cos(_1726);
        float _1730 = fma(_1724, _1718, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1732 = _1714 * _1730;
        float _1734 = _1728 + (-1.0);
        float _1736 = fma(_1626, _1732, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1738 = fma(_1630, _1732, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1740 = _1734 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1742 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1744 = _1736 + _1742;
        float _1746 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1748 = _1738 + _1746;
        float _1750 = fma(_1648, _1728, _1740);
        float _1752 = _1744 * _1744;
        float _1754 = _1748 * _1748;
        _1706 = _1750;
        _1688 = _1752;
        _1700 = _1754;
        _1692 = _1736;
        _1696 = _1738;
    }
    float _1756 = _1706;
    float _1758 = _1688;
    float _1760 = _1700;
    float _1762 = _1692;
    float _1764 = _1696;
    float _1766 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1768 = _1756 + _1766;
    float _1770 = fma(_1546, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1654);
    float _1772 = fma(_1546, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1660);
    float _1774 = _179 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1776 = fma(_1768, _1768, _1758);
    float _1778 = fma(_1546, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1664);
    float _1780 = _175 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1782 = _1774 * _1770;
    float _1784 = _1776 + _1760;
    float _1786 = _1774 * _1772;
    float _1788 = _1774 * _1778;
    float _1790 = fma(_1574, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1670);
    float _1792 = fma(_1574, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1672);
    float _1794 = fma(_1574, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1676);
    float _1796 = sqrt(_1784);
    float _1798 = fma(_1780, _1666, _1782);
    float _1800 = fma(_1780, _1668, _1786);
    float _1802 = fma(_1780, _1674, _1788);
    float _1804 = _1790 + _1798;
    float _1806 = _1792 + _1800;
    float _1808 = _1794 + _1802;
    out.m_74.x = _1804;
    out.m_74.y = _1806;
    out.m_74.z = _1808;
    bool _1810 = _1796 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1812 = isnan(_1796);
    bool _1814 = _1810 || _1812;
    bool _1816 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1818 = _1814 || _1816;
    float _1820 = _1778;
    if (!_1818)
    {
        _1820 = 1.0;
    }
    float _1822 = _1820;
    bool _1824 = !_1818;
    float _1826 = _1822;
    if (!_1824)
    {
        bool _1828 = _1796 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1830 = isnan(_1796);
        bool _1832 = _1828 || _1830;
        bool _1834 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1836 = _1832 || _1834;
        if (!_1836)
        {
            float _1838 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1840 = _1796 + _1838;
            float _1842 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1844 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1842;
            float _1846 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1848 = _1846 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1850 = 1.0 / _1844;
            float _1852 = _1840 * _1850;
            float _1854 = fma(_1852, _1848, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1826 = _1854;
            _1856 = true;
        }
        else
        {
            bool _1858 = _1796 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1860 = isnan(_1796);
            bool _1862 = _1858 || _1860;
            bool _1864 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1866 = _1862 || _1864;
            if (!_1866)
            {
                float _1868 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1870 = _1796 + _1868;
                float _1872 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1874 = _1872 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1876 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1878 = _1876 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1880 = 1.0 / _1874;
                float _1882 = _1870 * _1880;
                float _1884 = fma(_1882, _1878, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1826 = _1884;
                _1856 = true;
            }
            else
            {
                _1826 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1856 = false;
    float _1886 = _1826;
    float _1888 = _1396 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1890 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1892 = _1762 + _1890;
    float _1894 = fma(_1402, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1888);
    float _1896 = _1396 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1898 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1900 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1902 = _1898 || _1900;
    bool _1904 = isnan(0.5);
    bool _1906 = _1902 || _1904;
    float _1908 = fma(_1412, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1894);
    bool _1910 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1912 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1914 = _1910 || _1912;
    bool _1916 = isnan(0.5);
    bool _1918 = _1914 || _1916;
    float _1920 = _1908 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1922 = fma(_1402, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1896);
    float _1924 = fma(_1892, _1886, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1926 = 1.0 / _1920;
    float _1928 = fma(_1412, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1922);
    float _1930 = _1928 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1932 = _1892;
    if (_1918)
    {
        _1932 = 1.0;
    }
    float _1934 = _1932;
    float _1936 = _1930 + _1920;
    float _1938 = _1936 * _1926;
    float _1940 = _1938 * 0.5;
    float _1942 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1944 = _1756 + _1942;
    float _1946 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1948 = fma(_1940, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1946);
    float _1950 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1952 = _1764 + _1950;
    float _1954 = fma(_1944, _1886, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1956 = -_1390;
    float _1958 = _1956 + _1924;
    float _1960 = fma(_1952, _1886, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1962 = 1.0 / _1948;
    float _1964 = -_1392;
    float _1966 = _1964 + _1954;
    float _1968 = -_1398;
    float _1970 = _1968 + _1960;
    float _1972 = _1966;
    float _1974 = _1958;
    float _1976 = _1970;
    float _1978 = _1962;
    float _1980 = _1960;
    float _1982 = _1934;
    if (!_1906)
    {
        float _1984 = _1406 * _1406;
        float _1986 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1988 = -_1128;
        float _1990 = _1988 + _1960;
        float _1992 = -_942;
        float _1994 = _1992 + _1954;
        float _1996 = fma(_1416, _1416, _1984);
        float _1998 = -_1108;
        float _2000 = _1998 + _1924;
        float _2002 = fma(_1424, _1424, _1996);
        float _2004 = 1.0 / _1512;
        float _2006 = sqrt(_2002);
        float _2008 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2010 = precise::min(_2006, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2012 = _2010 * _1986;
        float _2014 = _2008 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2016 = _2012 * _2004;
        float _2018 = _2014 * _2016;
        float _2020 = _1990 * _2016;
        float _2022 = fma(_1994, _2018, _1396);
        float _2024 = fma(_2000, _2018, _1402);
        float _2026 = fma(_2014, _2020, _1412);
        _1972 = _2022;
        _1974 = _2024;
        _1976 = _2026;
        _1162 = _2020;
    }
    float _2028 = _1972;
    float _2030 = _1974;
    float _2032 = _1976;
    float _2034 = _1162;
    float _2036 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2038 = _1962 * _2036;
    float _2040 = _2034;
    if (!_1918)
    {
        float _2042 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2044 = _2042 * 0.15915493667125701904296875;
        float _2046 = _2044 * 6.283185482025146484375;
        float _2048 = cos(_2046);
        float _2050 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2052 = _2050 * 0.15915493667125701904296875;
        float _2054 = _2044 * 6.283185482025146484375;
        float _2056 = sin(_2054);
        float _2058 = 1.0 / _2048;
        float _2060 = _2052 * 6.283185482025146484375;
        float _2062 = cos(_2060);
        float _2064 = _2056 * _2058;
        float _2066 = _2052 * 6.283185482025146484375;
        float _2068 = sin(_2066);
        float _2070 = _2062 * _2064;
        float _2072 = 1.0 / _2070;
        float _2074 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2076 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2074;
        float _2078 = 1.0 / _2076;
        float _2080 = _2068 * _2072;
        float _2082 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2084 = fma(_2038, _2080, _2082);
        float _2086 = _2084 * _2078;
        float _2088 = precise::clamp(_2086, 0.0, 1.0);
        _1978 = _2084;
        _1980 = _2044;
        _1982 = _2088;
    }
    float _2090 = _1978;
    float _2092 = _1980;
    float _2094 = _1982;
    float _2096 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2098 = _2028 + _2096;
    float _2100 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2102 = _2030 + _2100;
    float _2104 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2106 = _2032 + _2104;
    float _2108 = _2098 * _2098;
    float _2110 = fma(_2102, _2102, _2108);
    float _2112 = fma(_2106, _2106, _2110);
    float _2114 = rsqrt(_2112);
    float _2116 = _2114 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2118 = _2102 * _2116;
    float _2120 = _2106 * _2116;
    float _2122 = _2118 * _2118;
    float _2124 = _2120 * _2120;
    float _2126 = _2122 + _2124;
    float _2128 = sqrt(_2126);
    bool _2130 = _2128 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2132 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2134 = _2128 + _2132;
    float _2136 = _2114;
    float _2138 = _2092;
    float _2140 = _2134;
    float _2142 = _2090;
    float _2144 = _2098;
    float _2146 = _2126;
    if (_2130)
    {
        float _2148 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2136 = _2148;
    }
    float _2150 = _2136;
    if (_2130)
    {
        float _2152 = rsqrt(_2126);
        _2138 = _2152;
    }
    float _2154 = _2138;
    float _2156 = _2154;
    if (_2130)
    {
        float _2158 = _2134 * _2150;
        _2140 = _2158;
    }
    float _2160 = _2140;
    if (_2130)
    {
        float _2162 = _2160 * 0.15915493667125701904296875;
        _2142 = _2162;
    }
    float _2164 = _2142;
    float _2166 = _2106;
    float _2168 = _2164;
    if (_2130)
    {
        float _2170 = _2164 * 6.283185482025146484375;
        float _2172 = sin(_2170);
        _2166 = _2172;
    }
    float _2174 = _2166;
    float _2176 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2178 = precise::max(0.0, _2176);
    float _2180 = _2150;
    if (_2130)
    {
        float _2182 = _2164 * 6.283185482025146484375;
        float _2184 = cos(_2182);
        _2180 = _2184;
    }
    float _2186 = _2180;
    float _2188 = -_2116;
    float _2190 = -_2178;
    float _2192 = fma(_2098, _2188, _2190);
    float _2194 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_2130)
    {
        float _2196 = _2192 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2144 = _2196;
    }
    float _2198 = _2144;
    float _2200 = _2198;
    if (!_2130)
    {
        _2168 = _2118;
    }
    float _2202 = _2168;
    float _2204 = fma(_1402, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2206 = _2174;
    float _2208 = _2202;
    if (_2130)
    {
        float _2210 = fma(_2174, _2198, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2206 = _2210;
    }
    float _2212 = _2206;
    if (!_2130)
    {
        _2200 = _2120;
    }
    float _2214 = _2200;
    float _2216 = _2214;
    float _2218 = _2186;
    if (_2130)
    {
        float _2220 = _2186 + (-1.0);
        _2194 = _2220;
    }
    float _2222 = _2194;
    float _2224 = _2222;
    if (_2130)
    {
        float _2226 = _2154 * _2212;
        _2040 = _2226;
    }
    float _2228 = _2040;
    if (!_2130)
    {
        _2156 = _2192;
    }
    float _2230 = _2156;
    float _2232 = sqrt(_2112);
    float _2234 = _2230;
    if (_2130)
    {
        float _2236 = _2222 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2146 = _2236;
    }
    float _2238 = _2146;
    if (_2130)
    {
        float _2240 = _2118 * _2228;
        _2208 = _2240;
    }
    float _2242 = _2208;
    if (!_2130)
    {
        _2224 = _2122;
    }
    float _2244 = _2224;
    float _2246 = _2244;
    if (_2130)
    {
        float _2248 = _2120 * _2228;
        _2216 = _2248;
    }
    float _2250 = _2216;
    if (_2130)
    {
        float _2252 = fma(_2192, _2186, _2238);
        _2234 = _2252;
    }
    float _2254 = _2234;
    if (_2130)
    {
        float _2256 = _2242 * _2242;
        _2246 = _2256;
    }
    float _2258 = _2246;
    if (!_2130)
    {
        _2218 = _2124;
    }
    float _2260 = _2218;
    float _2262 = _2260;
    if (_2130)
    {
        float _2264 = _2250 * _2250;
        _2262 = _2264;
    }
    float _2266 = _2262;
    float _2268 = fma(_2254, _2254, _2258);
    float _2270 = _2028 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2272 = _2028 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2274 = _2268 + _2266;
    float _2276 = fma(_2030, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2270);
    float _2278 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2280 = fma(_2232, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2278);
    float _2282 = precise::clamp(_2280, 0.0, 1.0);
    float _2284 = rsqrt(_2274);
    float _2286 = fma(_2032, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2276);
    float _2288 = fma(_1412, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2290 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2292 = -_2282;
    float _2294 = _2292 + 1.0;
    float _2296 = _2286 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2298 = _2028 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2300 = floor(_2204);
    float _2302 = _2296 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2304 = fma(_2030, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2272);
    float _2306 = -_2302;
    float _2308 = fma(_2306, _2290, 1.0);
    float _2310 = _2028 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2312 = _2284 * _2242;
    float _2314 = _2284 * _2254;
    float _2316 = fma(_2030, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2310);
    float _2318 = _2284 * _2250;
    float _2320 = abs(_2294);
    float _2322 = log2(_2320);
    float _2324 = fma(_2030, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2298);
    float _2326 = fma(_2032, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2316);
    float _2328 = _2312 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2330 = -_2300;
    float _2332 = _2204 + _2330;
    float _2334 = fma(_2032, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2324);
    float _2336 = _2326 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2338 = -_2328;
    float _2340 = fma(_2314, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2338);
    float _2342 = floor(_2288);
    float _2344 = _2334 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2346 = _2336 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2348 = -_2318;
    float _2350 = fma(_2348, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2340);
    float _2352 = fma(_2032, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2304);
    float _2354 = _2336 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2356 = fma(_2344, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2346);
    float _2358 = fma(_2350, -0.5, 0.5);
    float _2360 = _2322 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2362 = _2352 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2364 = fma(_2296, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2356);
    float _2366 = log2(_2308);
    float _2368 = _2336 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2370 = fma(_2362, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2364);
    float _2372 = fma(_2344, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2354);
    float _2374 = fma(_2350, 0.5, 0.5);
    float _2376 = _2314 + 1.0;
    float _2378 = -_2342;
    float _2380 = _2288 + _2378;
    float _2382 = exp2(_2360);
    float _2384 = fma(_2296, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2372);
    float _2386 = fma(_2374, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2388 = fma(_2362, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2384);
    float _2390 = fma(_2374, _2386, -0.212114393711090087890625);
    float _2392 = 1.0 / _2370;
    float _2394 = fma(_2344, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2368);
    float _2396 = _2366 * 0.693147182464599609375;
    float _2398 = sqrt(_2358);
    float _2400 = fma(_2296, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2394);
    float _2402 = -_2314;
    float _2404 = fma(_2382, _2376, _2402);
    float2 _6550 = float2(_2332, _2380);
    float _2406 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6550, float2(0.0), isnan(_6550)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6550, float2(0.0), isnan(_6550)), level(0.0)).x;
    float _2408 = fma(_2374, _2390, 1.570728778839111328125);
    float _2410 = fma(_2362, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2400);
    float _2412 = _2396 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2414 = fma(_2404, 0.5, 0.5);
    float _2416 = _2388 * _2392;
    float _2418 = _2410 * _2392;
    float _2420 = fma(_2416, 0.5, 0.5);
    float _2422 = fma(_2418, -0.5, 0.5);
    float _2424 = _2398 * 0.636619746685028076171875;
    float _2426 = -_2408;
    float _2428 = fma(_2424, _2426, 1.0);
    float3 _6594 = float3(_2420, _2422, _2412);
    float _2430 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6594, float3(0.0), isnan(_6594)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6594, float3(0.0), isnan(_6594)), level(0.0)).x;
    float3 _6605 = float3(_2420, _2422, _2412);
    float4 _2433 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6605, float3(0.0), isnan(_6605)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6605, float3(0.0), isnan(_6605)), level(0.0)).xyzw;
    float _2435 = _2433.x;
    float _2437 = _2433.y;
    float _2439 = _2433.z;
    float _2441 = _2433.w;
    float2 _6621 = float2(_2428, _2414);
    float3 _2445 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6621, float2(0.0), isnan(_6621)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6621, float2(0.0), isnan(_6621)), level(0.0)).xyz;
    float _2447 = _2445.x;
    float _2449 = _2445.y;
    float _2451 = _2445.z;
    float _2453 = abs(_2038);
    float _2455 = log2(_2453);
    float _2457 = _2336 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2459 = fma(_2344, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2457);
    bool _2461 = _2232 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2463 = isnan(_2232);
    bool _2465 = _2461 || _2463;
    bool _2467 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2469 = _2465 || _2467;
    float _2471 = in.m_76.x;
    float _2473 = fma(_2296, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2459);
    float _2475 = _2322 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2477 = _2038 <= 8000.0;
    bool _2479 = isnan(_2038);
    bool _2481 = _2477 || _2479;
    bool _2483 = isnan(8000.0);
    bool _2485 = _2481 || _2483;
    float _2487 = float(_2485);
    float _2489 = fma(_2362, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2473);
    float _2491 = _2388 + _2370;
    float _2493 = _2455 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2495 = exp2(_2475);
    out.gl_Position.x = _2388;
    out.gl_Position.y = _2410;
    out.gl_Position.z = _2489;
    out.gl_Position.w = _2370;
    float _2497 = _2491 * 0.5;
    float _2499 = exp2(_2493);
    float _2501 = -_2495;
    float _2503 = _2501 + 1.0;
    float _2505 = _2503 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2507 = fma(_2499, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2509 = precise::clamp(_2507, 0.0, 1.0);
    float _2511 = -_2505;
    float _2513 = _2511 + 1.0;
    float _2515 = _2489 + _2370;
    float _2517 = _2489;
    float _2519 = _2370;
    float _2521 = _2410;
    float _2523 = _2497;
    float _2525 = _2513;
    if (!_2469)
    {
        _2517 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2527 = _2517;
    float _2529 = fma(_2509, -2.0, 3.0);
    float _2531 = _2509 * _2509;
    float _2533 = _2515 * 0.5;
    float _2535 = _2531 * _2529;
    float _2537 = -_2535;
    float _2539 = _2537 + 1.0;
    float _2541 = fma(_2539, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2535);
    float _2543 = _2370 * 0.5;
    float _2545 = _2487 * _2541;
    float _2547 = fma(_2410, -0.5, _2543);
    float _2549 = _2527;
    float _2551 = _2527;
    if (!_2469)
    {
        _2519 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2553 = _2519;
    float _2555 = _2545 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_78.x = _2497;
    out.m_78.y = _2547;
    out.m_78.z = _2533;
    out.m_78.w = _2370;
    float _2557 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    float _2559 = _2553;
    float _2561 = _2553;
    if (!_2469)
    {
        _2521 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2563 = _2521;
    float _2565 = _2094 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2567 = _2563;
    float _2569 = _2563;
    if (!_2469)
    {
        _2523 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2571 = _2523;
    float _2573 = -_2406;
    float _2575 = _2573 + 1.0;
    float _2577 = _2575 * _2555;
    float _2579 = precise::clamp(_2577, 0.0, 1.0);
    float _2581 = -_2579;
    float _2583 = fma(_2581, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2585 = _2571;
    float _2587 = _2571;
    if (!_2469)
    {
        _2557 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2589 = _2557;
    float _2591 = _2583 * _2471;
    float _2593 = _2591 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2595 = _2505 * _2430;
    float _2597 = _2441 * _2513;
    out.m_80.x = _2593;
    float _2599 = _2589;
    float _2601 = _2589;
    if (!_2469)
    {
        _2525 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2603 = _2525;
    float _2605 = _2441 * _2595;
    float _2607 = _2451 * _2595;
    float _2609 = fma(_2447, _2605, _2435);
    float _2611 = fma(_2449, _2605, _2437);
    float _2613 = fma(_2441, _2607, _2439);
    out.m_82.x = _2609;
    out.m_82.y = _2611;
    out.m_82.z = _2613;
    out.m_82.w = _2597;
    bool _2615 = !_2469;
    float _2617 = _2603;
    float _2619 = _2603;
    if (!_2615)
    {
        bool _2621 = _2232 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2623 = isnan(_2232);
        bool _2625 = _2621 || _2623;
        bool _2627 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2629 = _2625 || _2627;
        if (!_2629)
        {
            float _2631 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2633 = _2232 + _2631;
            float _2635 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2637 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2635;
            float _2639 = 1.0 / _2637;
            float _2641 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2643 = _2641 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2645 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2647 = _2645 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2649 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2651 = _2649 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2653 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2655 = _2653 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2657 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2659 = _2657 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2661 = _2633 * _2639;
            float _2663 = precise::clamp(_2661, 0.0, 1.0);
            float _2665 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2667 = _2665 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2669 = fma(_2663, _2643, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2671 = fma(_2663, _2667, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2673 = fma(_2663, _2647, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2675 = fma(_2663, _2651, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2677 = fma(_2663, _2655, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2679 = fma(_2663, _2659, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2587 = _2671;
            _2569 = _2677;
            _2601 = _2669;
            _2551 = _2675;
            _2561 = _2673;
            _2619 = _2679;
            _2681 = true;
        }
        else
        {
            bool _2683 = _2232 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2685 = isnan(_2232);
            bool _2687 = _2683 || _2685;
            bool _2689 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2691 = _2687 || _2689;
            if (!_2691)
            {
                _2599 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2693 = _2599;
            _2601 = _2693;
            if (!_2691)
            {
                _2585 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2695 = _2585;
            _2587 = _2695;
            if (!_2691)
            {
                _2559 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2697 = _2559;
            _2561 = _2697;
            if (!_2691)
            {
                _2549 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2699 = _2549;
            _2551 = _2699;
            if (!_2691)
            {
                _2567 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2701 = _2567;
            _2569 = _2701;
            if (!_2691)
            {
                _2617 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2703 = _2617;
            bool _2705 = !_2691;
            _2619 = _2703;
            if (!_2705)
            {
                bool _2707 = _2232 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2709 = isnan(_2232);
                bool _2711 = _2707 || _2709;
                bool _2713 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2715 = _2711 || _2713;
                if (!_2715)
                {
                    float _2717 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2719 = _2232 + _2717;
                    float _2721 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2723 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2721;
                    float _2725 = 1.0 / _2723;
                    float _2727 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2729 = _2727 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2731 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2733 = _2731 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2735 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2737 = _2735 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2739 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2741 = _2739 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2743 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2745 = _2743 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2747 = _2719 * _2725;
                    float _2749 = precise::clamp(_2747, 0.0, 1.0);
                    float _2751 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2753 = _2751 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2755 = fma(_2749, _2729, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2757 = fma(_2749, _2753, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2759 = fma(_2749, _2733, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2761 = fma(_2749, _2737, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2763 = fma(_2749, _2741, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2765 = fma(_2749, _2745, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2587 = _2757;
                    _2569 = _2763;
                    _2601 = _2755;
                    _2551 = _2761;
                    _2561 = _2759;
                    _2619 = _2765;
                    _2681 = true;
                }
                else
                {
                    _2587 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2569 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2601 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2551 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2561 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2619 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2681 = false;
    float _2767 = _2587;
    float _2769 = _2569;
    float _2771 = _2601;
    float _2773 = _2551;
    float _2775 = _2561;
    float _2777 = _2619;
    float _2779 = fma(_1806, -0.5, 0.5);
    float _2781 = precise::clamp(_2779, 0.0, 1.0);
    float _2783 = -_2767;
    float _2785 = _2783 + _2769;
    float _2787 = _2565 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2789 = -_2771;
    float _2791 = _2789 + _2773;
    float _2793 = fma(_2781, _2785, _2767);
    out.m_84.x = 0.0;
    float _2795 = -_2775;
    float _2797 = _2795 + _2777;
    float _2799 = fma(_2781, _2791, _2771);
    float _2801 = _2793 * 0.586610972881317138671875;
    out.m_55.x = _2787;
    bool _2803 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2805 = fma(_2781, _2797, _2775);
    float _2807 = fma(_2799, 0.298911988735198974609375, _2801);
    bool _2809 = _2094 > 0.0;
    bool _2811 = isnan(_2094);
    bool _2813 = _2809 || _2811;
    bool _2815 = isnan(0.0);
    bool _2817 = _2813 || _2815;
    float _2819 = fma(_2805, 0.114477999508380889892578125, _2807);
    float _2821 = -_2819;
    float _2823 = _2799 + _2821;
    float _2825 = -_2819;
    float _2827 = _2793 + _2825;
    float _2829 = -_2819;
    float _2831 = _2805 + _2829;
    float _2833 = fma(_2823, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2819);
    float _2835 = fma(_2827, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2819);
    float _2837 = fma(_2831, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2819);
    bool _2839 = !_2803;
    if (!_2839)
    {
        float _2841 = -_2028;
        float _2843 = _2841 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2845 = -_2030;
        float _2847 = _2845 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2849 = -_2032;
        float _2851 = _2849 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2853 = _2843 * _2843;
        float _2855 = fma(_2847, _2847, _2853);
        float _2857 = fma(_2851, _2851, _2855);
        float _2859 = sqrt(_2857);
        float _2861 = rsqrt(_2857);
        float _2863 = -_2859;
        float _2865 = _2863 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2867 = _2865 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2869 = precise::clamp(_2867, 0.0, 1.0);
        float _2871 = _2847 * _2861;
        float _2873 = _2843 * _2861;
        float _2875 = abs(_2869);
        float _2877 = log2(_2875);
        float _2879 = _2851 * _2861;
        float _2881 = _2871 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2883 = _1806 * _2873;
        float _2885 = -_2873;
        float _2887 = -_2881;
        float _2889 = fma(_2885, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2887);
        float _2891 = fma(_1804, _2871, _2883);
        float _2893 = -_2879;
        float _2895 = fma(_2893, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2889);
        float _2897 = fma(_1808, _2879, _2891);
        float _2899 = precise::clamp(_2897, 0.0, 1.0);
        float _2901 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2903 = _2895 + _2901;
        float _2905 = _2877 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2907 = _2903 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2909 = precise::clamp(_2907, 0.0, 1.0);
        float _2911 = exp2(_2905);
        float _2913 = _2911 * _2909;
        float _2915 = _2899 * _2913;
        float _2917 = _2915 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2919 = _2915 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2921 = _2915 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_84.x = _2917;
        out.m_84.y = _2919;
        out.m_84.z = _2921;
    }
    out.m_86.x = _2833;
    out.m_86.y = _2835;
    out.m_86.z = _2837;
    if (_2817)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_55.x = 0.0;
    float _2923 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2923;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}


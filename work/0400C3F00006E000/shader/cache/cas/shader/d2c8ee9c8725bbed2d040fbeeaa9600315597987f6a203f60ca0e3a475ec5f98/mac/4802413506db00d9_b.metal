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
    constant _16* vp_c7 [[id(4)]];
    texture3d<float> vp_t_tcb_32 [[id(5)]];
    sampler vp_t_tcb_32Smplr [[id(6)]];
    texture3d<float> vp_t_tcb_30 [[id(7)]];
    sampler vp_t_tcb_30Smplr [[id(8)]];
    texture2d<float> vp_t_tcb_1C [[id(9)]];
    sampler vp_t_tcb_1CSmplr [[id(10)]];
    sampler vp_t_tcb_32Smplr_w [[id(11)]];
    sampler vp_t_tcb_30Smplr_w [[id(12)]];
    sampler vp_t_tcb_1CSmplr_w [[id(13)]];
    constant dm_border_t* dm_border [[id(14)]];
};

struct main0_out
{
    float4 m_56 [[user(locn0)]];
    float4 m_62 [[user(locn1)]];
    float4 m_64 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_60 [[user(locn4)]];
    float4 m_66 [[user(locn5)]];
    float4 m_58 [[user(locn7)]];
    float4 m_68 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_49 [[attribute(4)]];
    float4 m_54 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    bool _534 = false;
    bool _401 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _82 = in.m_42.w;
    float _84 = trunc(_82);
    int _87 = int(_84);
    bool _91 = _87 >= 1;
    float _93 = 0.0;
    if (!_91)
    {
        _93 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _95 = _93;
    float _97 = _95;
    if (!_91)
    {
        out.m_45.x = 0.0;
    }
    int _99 = 0;
    if (!_91)
    {
        float _101 = _95 * 5.0;
        _99 = as_type<int>(_101);
    }
    int _103 = _99;
    int _105 = _103;
    if (!_91)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2222 = as_type<float>(_103);
        out.gl_Position.z = _2222;
    }
    if (!_91)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _107 = in.m_47.w;
    bool _109 = _107 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _111 = isnan(_107);
    bool _113 = _109 || _111;
    bool _115 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _117 = _113 || _115;
    float _119 = -_107;
    float _121 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _123 = 0.0;
    if (_117)
    {
        float _125 = float(_87);
        _123 = _125;
    }
    float _127 = _123;
    bool _129 = _121 >= _127;
    bool _131 = !_117;
    bool _133 = _129 || _131;
    if (_133)
    {
        _97 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _135 = _97;
    if (_133)
    {
        out.m_45.x = 0.0;
    }
    if (_133)
    {
        float _137 = _135 * 5.0;
        _105 = as_type<int>(_137);
    }
    int _139 = _105;
    if (_133)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2290 = as_type<float>(_139);
        out.gl_Position.z = _2290;
    }
    if (_133)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _141 = in.m_49.x;
    float _143 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _145 = _121 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _147 = as_type<float>(int(gl_VertexIndex));
    bool _149 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _151 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _153 = _149 || _151;
    bool _155 = isnan(1.0);
    bool _157 = _153 || _155;
    float _159 = _145 * _143;
    float _161 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[20].x, _159);
    float _163 = in.m_47.x;
    float _165 = in.m_47.y;
    float _167 = in.m_47.z;
    float _169 = _161 * 6.283185482025146484375;
    float _171 = floor(_161);
    int _173 = as_type<int>(_147) & 1;
    bool _175 = _173 != 0;
    int _177 = as_type<int>(_147) & 2;
    bool _179 = _177 != 0;
    float _181 = _169 * 0.15915493667125701904296875;
    float _183 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    int _185 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _187 = _185 != 0;
    bool _189 = !_175;
    float _191 = _189 ? (-0.5) : 0.5;
    float _193 = _147;
    float _195 = _183;
    float _197 = _191;
    if (!_157)
    {
        float _199 = _183 * _183;
        float _201 = _199 * 0.5;
        _193 = _201;
    }
    float _203 = _193;
    float _205 = _181 * 6.283185482025146484375;
    float _207 = cos(_205);
    bool _209 = !_179;
    float _211 = _209 ? (-0.5) : 0.5;
    float _213 = _203;
    if (!_157)
    {
        float _215 = _203 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _213 = _215;
    }
    float _217 = _213;
    float _219 = -_171;
    float _221 = _161 + _219;
    bool _223 = _221 < 0.5;
    float _225 = float(_223);
    bool _227 = !_157;
    float _229 = _217;
    if (!_227)
    {
        float _231 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _233 = log2(_231);
        float _235 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _237 = _235 + 1.0;
        float _239 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _241 = _183 * _233;
        float _243 = 1.0 / _237;
        float _245 = _239 * 0.693147182464599609375;
        float _247 = exp2(_241);
        float _249 = 1.0 / _245;
        float _251 = _247 + (-1.0);
        float _253 = -_251;
        float _255 = fma(_253, _249, _183);
        float _257 = _255 * _243;
        float _259 = _257 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _229 = _259;
    }
    float _261 = _229;
    bool _263 = !_157;
    if (!_263)
    {
        float _265 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _267 = log2(_265);
        float _269 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _271 = _269 + 1.0;
        float _273 = 1.0 / _271;
        float _275 = _183 * _267;
        float _277 = exp2(_275);
        float _279 = -_277;
        float _281 = _279 + 1.0;
        float _283 = _281 * _273;
        _195 = _283;
    }
    float _285 = _195;
    float _287 = fma(_207, 0.5, 0.5);
    float _289 = -_225;
    float _291 = fma(_289, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _293 = _261 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    int _295 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _297 = _295 != 0;
    int _299 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _301 = _299 != 0;
    float _303 = -_287;
    float _305 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _307 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _309 = in.m_54.w;
    float _311 = -_221;
    float _313 = fma(_311, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _315 = !_297;
    int _317 = _315 ? 0 : 1;
    float _319 = fma(_285, _163, _293);
    float _321 = in.m_42.x;
    float _323 = in.m_42.y;
    float _325 = in.m_42.z;
    float _327 = _307 * _141;
    bool _329 = !_187;
    int _331 = _329 ? 0 : 1;
    int _333 = abs(_317);
    int _335 = abs(_331);
    float _337 = trunc(_327);
    int _339 = int(_337);
    bool _341 = !_301;
    int _343 = _341 ? 0 : 1;
    float _345 = _261 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _347 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    int _349 = abs(_343);
    float _351 = fma(_285, _165, _345);
    float _353 = float(_333);
    float _355 = _261 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _357 = float(_335);
    float _359 = abs(_313);
    float _361 = _353 * _359;
    float _363 = fma(_285, _167, _355);
    int _365 = _339 << 4;
    int _367 = _365 + 1712;
    float _369 = fma(_351, _309, _323);
    float _371 = float(_349);
    float _373 = fma(_357, _305, _361);
    float _375 = fma(_319, _309, _321);
    float _377 = fma(_363, _309, _325);
    float _379 = abs(_291);
    float _381 = fma(_371, _379, _373);
    bool _383 = !_347;
    float _399;
    if (!_383)
    {
        float _385 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _387 = _141 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _389 = fma(_387, (*spvDescriptorSet0.vp_c9)._m0[11].y, _121);
        float _391 = _389 * _385;
        float _393 = floor(_391);
        float _395 = -_393;
        float _397 = _391 + _395;
        _399 = _397;
        _401 = true;
    }
    else
    {
        float _403 = float(_87);
        float _405 = 1.0 / _403;
        float _407 = _121 * _405;
        _399 = _407;
    }
    _401 = false;
    float _409 = _399;
    uint _412 = uint(int(uint(_367) >> uint(2)));
    uint _414 = uint(int(uint(int(_412)) >> uint(2)));
    int _416 = int(_412) & 3;
    float _418 = (*spvDescriptorSet0.vp_c9)._m0[int(_414)][_416];
    int _420 = int(_412) + 1;
    uint _422 = uint(int(uint(_420) >> uint(2)));
    int _424 = _420 & 3;
    float _426 = (*spvDescriptorSet0.vp_c9)._m0[int(_422)][_424];
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _430 = _409 + _428;
    bool _432 = _409 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _434 = isnan(_409);
    bool _436 = _432 || _434;
    bool _438 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _440 = _436 || _438;
    float _442 = float(_440);
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _446 = _444 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _448 = _409 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _450 = isnan(_409);
    bool _452 = _448 || _450;
    bool _454 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _456 = _452 || _454;
    float _458 = float(_456);
    int _460 = _367 + 8;
    uint _462 = uint(int(uint(_460) >> uint(2)));
    uint _464 = uint(int(uint(int(_462)) >> uint(2)));
    int _466 = int(_462) & 3;
    float _468 = (*spvDescriptorSet0.vp_c9)._m0[int(_464)][_466];
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _472 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _470;
    float _474 = -_442;
    float _476 = _474 + 1.0;
    bool _478 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _480 = 1.0 / _446;
    float _482 = _472 * _480;
    float _484 = fma(_482, _430, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _486 = _458 * _476;
    float _488 = -_458;
    float _490 = _488 + 1.0;
    float _492 = _484 * _486;
    float _494 = fma(_490, (*spvDescriptorSet0.vp_c9)._m0[115].x, _492);
    float _496 = fma(_442, (*spvDescriptorSet0.vp_c9)._m0[116].x, _494);
    float _498 = _418 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _500 = _426 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _502 = _496 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _504 = _498 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _506 = _500 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _508 = _468 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _510 = _508 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _512 = !_478;
    float _530;
    float _532;
    if (!_512)
    {
        float _514 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _516 = _141 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _518 = float(_87);
        float _520 = fma(_516, (*spvDescriptorSet0.vp_c9)._m0[11].w, _121);
        float _522 = _520 * _514;
        float _524 = floor(_522);
        float _526 = -_524;
        float _528 = _522 + _526;
        _530 = _518;
        _532 = _528;
        _534 = true;
    }
    else
    {
        float _536 = float(_87);
        float _538 = 1.0 / _536;
        float _540 = _121 * _538;
        _530 = _536;
        _532 = _540;
    }
    _534 = false;
    float _542 = _530;
    float _544 = _532;
    float _546 = _369 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _548 = _369 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _550 = in.m_54.x;
    float _552 = in.m_54.y;
    float _554 = fma(_121, 0.02500000037252902984619140625, _141);
    float _556 = fma(_375, (*spvDescriptorSet0.vp_c10)._m0[5].x, _546);
    float _558 = _369 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _560 = fma(_375, (*spvDescriptorSet0.vp_c10)._m0[4].x, _548);
    float _562 = floor(_554);
    float _564 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[5].z, _556);
    float _566 = fma(_375, (*spvDescriptorSet0.vp_c10)._m0[6].x, _558);
    float _568 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[4].z, _560);
    float _570 = _564 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _572 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[6].z, _566);
    float _574 = _568 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _576 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _211);
    float _578 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _580 = _570 + _578;
    float _582 = _572 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _584 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _586 = _574 + _584;
    float _588 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _191);
    float _590 = _580 * _580;
    float _592 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _594 = _582 + _592;
    float _596 = (*spvDescriptorSet0.vp_c9)._m0[191].x * 0.100000001490116119384765625;
    float _598 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _600 = _574 + _598;
    float _602 = fma(_586, _586, _590);
    float _604 = _562 * _596;
    float _606 = fma(_594, _594, _602);
    float _608 = rsqrt(_606);
    float _610 = _580 * _608;
    float _612 = _586 * _608;
    float _614 = _594 * _608;
    float _616 = -_610;
    float _618 = fma(_616, (*spvDescriptorSet0.vp_c9)._m0[18].w, _580);
    float _620 = -_612;
    float _622 = fma(_620, (*spvDescriptorSet0.vp_c9)._m0[18].w, _586);
    float _624 = -_614;
    float _626 = fma(_624, (*spvDescriptorSet0.vp_c9)._m0[18].w, _594);
    float _628 = -_612;
    float _630 = fma(_628, (*spvDescriptorSet0.vp_c9)._m0[18].w, _574);
    float _632 = _618 * _618;
    float _634 = fma(_622, _622, _632);
    float _636 = _552 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _638 = fma(_626, _626, _634);
    float _640 = sqrt(_638);
    float _642 = _636 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _644 = fma(_562, -0.1500000059604644775390625, 1.0);
    float _646 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _648 = _582 + _646;
    float _650 = _608 * _640;
    float _652 = _550 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _654 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _656 = _570 + _654;
    float _658 = _642 * _650;
    float _660 = _652 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _662 = _656 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _664 = _658 * _576;
    float _666 = _660 * _650;
    float _668 = fma(_600, (*spvDescriptorSet0.vp_c10)._m0[8].x, _662);
    float _670 = precise::max(_644, 0.20000000298023223876953125);
    float _672 = _664 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _674 = _666 * _588;
    float _676 = _650 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _678 = _676 * 0.5;
    float _680 = _664 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _682 = fma(_648, (*spvDescriptorSet0.vp_c10)._m0[10].x, _668);
    float _684 = fma(_674, (*spvDescriptorSet0.vp_c10)._m0[10].x, _672);
    float _686 = precise::min(_670, 1.0);
    float _688 = fma(_674, (*spvDescriptorSet0.vp_c10)._m0[8].x, _680);
    float _690 = _682 * _604;
    float _692 = fma(_678, (*spvDescriptorSet0.vp_c10)._m0[10].z, _684);
    float _694 = fma(_678, (*spvDescriptorSet0.vp_c10)._m0[8].z, _688);
    float _696 = fma(_692, _686, _582);
    float _698 = fma(_694, _686, _574);
    float _700 = fma(_690, (*spvDescriptorSet0.vp_c10)._m0[10].x, _696);
    float _702 = fma(_690, (*spvDescriptorSet0.vp_c10)._m0[8].x, _698);
    float _704 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _706 = _700 + _704;
    float _708 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _710 = _702 + _708;
    float _712 = _706 * _706;
    float _714 = fma(_710, _710, _712);
    float _716 = _664 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _718 = sqrt(_714);
    float _720 = fma(_674, (*spvDescriptorSet0.vp_c10)._m0[9].x, _716);
    float _722 = fma(_678, (*spvDescriptorSet0.vp_c10)._m0[9].z, _720);
    float _724 = fma(_722, _686, _570);
    float _726 = fma(_690, (*spvDescriptorSet0.vp_c10)._m0[9].x, _724);
    bool _728 = _718 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _730 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _732 = _730 != 0;
    int _734 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _736 = _734 != 0;
    int _738 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _740 = _738 != 0;
    int _742 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _744 = _742 != 0;
    bool _746 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _748 = isnan(0.5);
    bool _750 = _746 || _748;
    bool _752 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _754 = _750 || _752;
    bool _756 = !_736;
    int _758 = _756 ? 0 : 1;
    bool _760 = !_732;
    int _762 = _760 ? 0 : 1;
    bool _764 = !_740;
    int _766 = _764 ? 0 : 1;
    bool _768 = !_744;
    int _770 = _768 ? 0 : 1;
    float _772 = _724;
    float _774 = _678;
    float _776 = _716;
    float _778 = _614;
    if (!_728)
    {
        _772 = _702;
    }
    float _780 = _772;
    float _782 = _780;
    if (!_728)
    {
        _774 = _700;
    }
    float _784 = _774;
    float _786 = _784;
    if (!_728)
    {
        _776 = _726;
    }
    float _788 = _776;
    bool _790 = !_728;
    float _792 = _788;
    if (!_790)
    {
        float _794 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _796 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _798 = _718 + _796;
        float _800 = rsqrt(_714);
        float _802 = _798 * _794;
        float _804 = _726 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _806 = _802 * 0.15915493667125701904296875;
        float _808 = _806 * 6.283185482025146484375;
        float _810 = sin(_808);
        float _812 = _806 * 6.283185482025146484375;
        float _814 = cos(_812);
        float _816 = fma(_810, _804, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _818 = _800 * _816;
        float _820 = _814 + (-1.0);
        float _822 = fma(_710, _818, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _824 = fma(_706, _818, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _826 = _820 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _828 = fma(_726, _814, _826);
        _786 = _824;
        _792 = _828;
        _782 = _822;
    }
    float _830 = _786;
    float _832 = _792;
    float _834 = _782;
    float _836 = -_614;
    float _838 = fma(_836, (*spvDescriptorSet0.vp_c9)._m0[18].w, _830);
    float _840 = -_610;
    float _842 = fma(_840, (*spvDescriptorSet0.vp_c9)._m0[18].w, _832);
    float _844 = -_614;
    float _846 = fma(_844, (*spvDescriptorSet0.vp_c9)._m0[18].w, _582);
    float _848 = -_612;
    float _850 = fma(_848, (*spvDescriptorSet0.vp_c9)._m0[18].w, _834);
    float _852 = -_610;
    float _854 = fma(_852, (*spvDescriptorSet0.vp_c9)._m0[18].w, _570);
    float _856 = _842;
    float _858 = _850;
    float _860 = _832;
    if (_754)
    {
        _778 = _838;
    }
    float _862 = _778;
    float _864 = _862;
    if (!_754)
    {
        float _866 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _868 = _854 + _866;
        float _870 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _872 = _630 + _870;
        float _874 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].y;
        float _876 = -_574;
        float _878 = _876 + _834;
        float _880 = _868 * _868;
        float _882 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _884 = _846 + _882;
        float _886 = -_570;
        float _888 = _886 + _832;
        float _890 = -_582;
        float _892 = _890 + _830;
        float _894 = fma(_872, _872, _880);
        float _896 = 1.0 / _650;
        float _898 = fma(_884, _884, _894);
        float _900 = sqrt(_898);
        float _902 = precise::max(_900, (*spvDescriptorSet0.vp_c9)._m0[199].y);
        float _904 = _902 * _874;
        float _906 = _904 * _896;
        float _908 = fma(_878, _906, _630);
        float _910 = fma(_888, _906, _854);
        float _912 = fma(_892, _906, _846);
        _856 = _910;
        _858 = _908;
        _864 = _912;
    }
    float _914 = _856;
    float _916 = _858;
    float _918 = _864;
    float _920 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _922 = _914 + _920;
    float _924 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _926 = _916 + _924;
    float _928 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _930 = _918 + _928;
    float _932 = _922 * _922;
    float _934 = _914 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _936 = fma(_926, _926, _932);
    float _938 = fma(_930, _930, _936);
    float _940 = rsqrt(_938);
    float _942 = sqrt(_938);
    float _944 = _940 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _946 = _926 * _944;
    float _948 = _930 * _944;
    float _950 = _946 * _946;
    float _952 = _948 * _948;
    float _954 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _956 = fma(_942, (*spvDescriptorSet0.vp_c15)._m0[23].w, _954);
    float _958 = precise::clamp(_956, 0.0, 1.0);
    float _960 = _950 + _952;
    float _962 = sqrt(_960);
    bool _964 = _962 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _966 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _968 = _962 + _966;
    float _970 = _936;
    float _972 = _960;
    float _974 = _968;
    float _976 = _922;
    float _978 = _944;
    if (_964)
    {
        float _980 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _970 = _980;
    }
    float _982 = _970;
    if (_964)
    {
        float _984 = rsqrt(_960);
        _972 = _984;
    }
    float _986 = _972;
    float _988 = _982;
    if (_964)
    {
        float _990 = _968 * _982;
        _974 = _990;
    }
    float _992 = _974;
    if (_964)
    {
        float _994 = _992 * 0.15915493667125701904296875;
        _860 = _994;
    }
    float _996 = _860;
    float _998 = _930;
    if (_964)
    {
        float _1000 = _996 * 6.283185482025146484375;
        float _1002 = sin(_1000);
        _998 = _1002;
    }
    float _1004 = _998;
    float _1006 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1008 = precise::max(0.0, _1006);
    float _1010 = _940;
    float _1012 = _1008;
    if (_964)
    {
        float _1014 = _996 * 6.283185482025146484375;
        float _1016 = cos(_1014);
        _1010 = _1016;
    }
    float _1018 = _1010;
    float _1020 = -_944;
    float _1022 = -_1008;
    float _1024 = fma(_922, _1020, _1022);
    if (_964)
    {
        float _1026 = _1024 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _976 = _1026;
    }
    float _1028 = _976;
    float _1030 = _1004;
    float _1032 = _1028;
    if (_964)
    {
        float _1034 = fma(_1004, _1028, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _978 = _1034;
    }
    float _1036 = _978;
    float _1038 = _1036;
    if (!_964)
    {
        _1030 = _946;
    }
    float _1040 = _1030;
    float _1042 = _1040;
    if (!_964)
    {
        _1032 = _1024;
    }
    float _1044 = _1032;
    float _1046 = _1044;
    float _1048 = _1018;
    if (_964)
    {
        float _1050 = _1018 + (-1.0);
        _1012 = _1050;
    }
    float _1052 = _1012;
    float _1054 = _1052;
    if (_964)
    {
        float _1056 = _986 * _1036;
        _1038 = _1056;
    }
    float _1058 = _1038;
    if (_964)
    {
        float _1060 = _1052 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _988 = _1060;
    }
    float _1062 = _988;
    float _1064 = _1062;
    if (_964)
    {
        float _1066 = _946 * _1058;
        _1042 = _1066;
    }
    float _1068 = _1042;
    if (!_964)
    {
        _1054 = _948;
    }
    float _1070 = _1054;
    float _1072 = _1070;
    if (_964)
    {
        float _1074 = _948 * _1058;
        _1072 = _1074;
    }
    float _1076 = _1072;
    if (_964)
    {
        float _1078 = fma(_1024, _1018, _1062);
        _1046 = _1078;
    }
    float _1080 = _1046;
    if (!_964)
    {
        _1048 = _950;
    }
    float _1082 = _1048;
    float _1084 = _1082;
    if (_964)
    {
        float _1086 = _1068 * _1068;
        _1084 = _1086;
    }
    float _1088 = _1084;
    float _1090 = _914 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    if (!_964)
    {
        _1064 = _952;
    }
    float _1092 = _1064;
    float _1094 = _1092;
    if (_964)
    {
        float _1096 = _1076 * _1076;
        _1094 = _1096;
    }
    float _1098 = _1094;
    float _1100 = fma(_1080, _1080, _1088);
    float _1102 = fma(_916, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1090);
    float _1104 = _914 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1106 = _914 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1108 = _1100 + _1098;
    float _1110 = fma(_918, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1102);
    float _1112 = fma(_916, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1104);
    float _1114 = fma(_916, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1106);
    float _1116 = fma(_916, (*spvDescriptorSet0.vp_c8)._m0[3].x, _934);
    float _1118 = -_958;
    float _1120 = _1118 + 1.0;
    float _1122 = rsqrt(_1108);
    float _1124 = fma(_918, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1112);
    float _1126 = fma(_918, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1116);
    float _1128 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1130 = fma(_918, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1114);
    float _1132 = _1124 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1134 = _1110 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1136 = _1126 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1138 = abs(_1120);
    float _1140 = log2(_1138);
    float _1142 = _1132 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1144 = _1130 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1146 = fma(_1134, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1142);
    float _1148 = _1144 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1150 = _1122 * _1068;
    float _1152 = _1122 * _1080;
    float _1154 = _1122 * _1076;
    float _1156 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1146);
    float _1158 = _1150 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1160 = -_1148;
    float _1162 = fma(_1160, _1128, 1.0);
    float _1164 = fma(_1136, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1156);
    float _1166 = -_1158;
    float _1168 = fma(_1152, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1166);
    float _1170 = _1140 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1172 = _1132 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1174 = log2(_1162);
    float _1176 = -_1154;
    float _1178 = fma(_1176, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1168);
    float _1180 = _1132 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1182 = fma(_1134, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1172);
    float _1184 = _1152 + 1.0;
    float _1186 = fma(_1178, -0.5, 0.5);
    float _1188 = fma(_1178, 0.5, 0.5);
    float _1190 = fma(_1134, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1180);
    float _1192 = 1.0 / _1164;
    float _1194 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1182);
    float _1196 = fma(_1188, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1198 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1190);
    float _1200 = fma(_1136, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1194);
    float _1202 = fma(_1188, _1196, -0.212114393711090087890625);
    float _1204 = fma(_1136, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1198);
    float _1206 = exp2(_1170);
    float _1208 = _1174 * 0.693147182464599609375;
    float _1210 = fma(_1188, _1202, 1.570728778839111328125);
    float _1212 = _1208 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1214 = sqrt(_1186);
    float _1216 = _1204 * _1192;
    float _1218 = _1200 * _1192;
    float _1220 = fma(_1216, 0.5, 0.5);
    float _1222 = fma(_1218, -0.5, 0.5);
    float _1224 = -_1152;
    float _1226 = fma(_1206, _1184, _1224);
    float _1228 = fma(_1226, 0.5, 0.5);
    float _1230 = _1214 * 0.636619746685028076171875;
    float _1232 = -_1210;
    float _1234 = fma(_1230, _1232, 1.0);
    float3 _4031 = float3(_1220, _1222, _1212);
    float _1236 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4031, float3(0.0), isnan(_4031)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4031, float3(0.0), isnan(_4031)), level(0.0)).x;
    float3 _4042 = float3(_1220, _1222, _1212);
    float4 _1239 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4042, float3(0.0), isnan(_4042)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4042, float3(0.0), isnan(_4042)), level(0.0)).xyzw;
    float _1241 = _1239.x;
    float _1243 = _1239.y;
    float _1245 = _1239.z;
    float _1247 = _1239.w;
    float2 _4059 = float2(_1234, _1228);
    float3 _1251 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4059, float2(0.0), isnan(_4059)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4059, float2(0.0), isnan(_4059)), level(0.0)).xyz;
    float _1253 = _1251.x;
    float _1255 = _1251.y;
    float _1257 = _1251.z;
    float _1259 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1261 = int(_1259);
    int _1263 = abs(_758);
    out.m_56.x = _504;
    out.m_56.y = _506;
    out.m_56.z = _510;
    out.m_56.w = _502;
    bool _1265 = _141 > 0.5;
    float _1267 = _1140 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1269 = _1132 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_58.y = _914;
    float _1271 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1273 = int(_1271);
    float _1275 = fma(_1134, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1269);
    float _1277 = in.m_49.y;
    float _1279 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1275);
    float _1281 = float(_1261);
    float _1283 = 1.0 / _542;
    float _1285 = -_191;
    int _1287 = _1265 ? as_type<int>(_1285) : as_type<int>(_191);
    float _1289 = fma(_1136, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1279);
    float _1291 = float(uint(_1273));
    float _1293 = 1.0 / _1281;
    int _1295 = ~_1273;
    int _1297 = _1295 + 1;
    int _1299 = _1273 + (-1);
    int _1301 = ~_1273;
    int _1303 = _1301 + 1;
    float _1305 = 1.0 / _1291;
    float _1307 = _1277 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1309 = _121 * _1293;
    int _1311 = ~_1273;
    int _1313 = _1311 + 1;
    float _1315 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1317 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1319 = _1317 != 0;
    int _1321 = as_type<int>(_1305) + (-2);
    float _1323 = trunc(_1309);
    int _1325 = int(_1323);
    bool _1327 = !_1319;
    float _1329 = _1327 ? _1277 : _141;
    float _1331 = exp2(_1267);
    float _1333 = float(uint(_1325));
    float _1335 = as_type<float>(_1321) * _1333;
    float _1337 = -_1331;
    float _1339 = _1337 + 1.0;
    float _1341 = trunc(_1335);
    float _1343 = precise::max(_1341, 0.0);
    uint _1345 = uint(_1343);
    float _1347 = _1339 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1349 = float(_1273);
    int _1351 = _1313 * int(_1345);
    int _1353 = _1351 + _1325;
    float _1355 = float(uint(_1353));
    float _1357 = as_type<float>(_1321) * _1355;
    bool _1359 = !_1319;
    float _1361 = _1359 ? 1.2345600128173828125 : 1.0;
    float _1363 = trunc(_1357);
    float _1365 = precise::max(_1363, 0.0);
    uint _1367 = uint(_1365);
    float _1369 = _1361 * _1329;
    float _1371 = floor(_1369);
    int _1373 = int(_1345) + int(_1367);
    float _1375 = float(_1325);
    int _1377 = _1297 * _1373;
    int _1379 = _1377 + _1325;
    bool _1381 = _1375 >= _1349;
    bool _1383 = isnan(_1375);
    bool _1385 = _1381 || _1383;
    bool _1387 = isnan(_1349);
    bool _1389 = _1385 || _1387;
    float _1391 = float(_1389);
    float _1393 = -_1371;
    float _1395 = _1369 + _1393;
    bool _1397 = uint(_1379) >= uint(_1273);
    float _1399 = trunc(_1391);
    int _1401 = int(_1399);
    float _1403 = _1395 * _1349;
    float _1405 = _121 * _1349;
    bool _1407 = !_1397;
    int _1409 = _1407 ? 0 : (-1);
    bool _1411 = _1273 == 0;
    float _1413 = _1405 * _1283;
    int _1415 = ~_1373;
    int _1417 = _1415 + _1409;
    int _1419 = _1417 + 1;
    float _1421 = trunc(_1403);
    int _1423 = int(_1421);
    int _1425 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1427 = _1425 != 0;
    int _1429 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1431 = _1429 != 0;
    int _1433 = _1273 * _1419;
    int _1435 = _1433 + _1325;
    bool _1437 = !_1427;
    int _1439 = _1437 ? 0 : 1;
    bool _1441 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1443 = isnan(0.5);
    bool _1445 = _1441 || _1443;
    bool _1447 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1449 = _1445 || _1447;
    float _1451 = trunc(_1413);
    int _1453 = int(_1451);
    int _1455 = ~_1401;
    int _1457 = _1455 + 1;
    int _1459 = _1457 + 1;
    bool _1461 = !_1411;
    int _1463 = _1461 ? _1435 : (-1);
    int _1465 = abs(_1439);
    int _1467 = _1463 * _1459;
    int _1469 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1471 = _1469 != 0;
    int _1473 = _1401 * _1299;
    int _1475 = _1473 + _1467;
    int _1477 = abs(_762);
    float _1479 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1481 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1483 = in.m_49.w;
    int _1485 = abs(_766);
    int _1487 = _1475 * _1263;
    int _1489 = _1423 * _1465;
    int _1491 = _1489 + _1325;
    int _1493 = abs(_770);
    float _1495 = _141 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1497 = _1453 * _1477;
    int _1499 = _1497 + _1487;
    float _1501 = -_1479;
    float _1503 = fma(_1495, 2.0, _1501);
    float _1505 = in.m_49.z;
    int _1507 = _1491 * _1485;
    int _1509 = _1507 + _1499;
    float _1511 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1513 = _1423 * _1493;
    int _1515 = _1513 + _1509;
    float _1517 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1519 = _1517 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1521 = float(uint(_1515));
    float _1523 = 1.0 / _1519;
    float _1525 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1527 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1525;
    bool _1529 = _1483 > 0.5;
    float _1531 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1533 = as_type<float>(_1321) * _1521;
    float _1535 = float(uint(_1491));
    float _1537 = _1519;
    float _1539 = (*spvDescriptorSet0.vp_c9)._m0[78].w;
    if (!_1319)
    {
        _1537 = _1277;
    }
    float _1541 = _1537;
    float _1543 = trunc(_1533);
    float _1545 = precise::max(_1543, 0.0);
    uint _1547 = uint(_1545);
    float _1549 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1551 = _1541;
    if (_1319)
    {
        _1551 = _141;
    }
    float _1553 = _1551;
    bool _1555 = _1505 > 0.5;
    float _1557 = fma(_1307, -2.0, _1549);
    float _1559 = _1527 * _1523;
    float _1561 = -_191;
    int _1563 = _1555 ? as_type<int>(_1561) : as_type<int>(_191);
    int _1565 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1567 = _1565 != 0;
    bool _1569 = !_1431;
    float _1571 = _1569 ? _191 : as_type<float>(_1563);
    int _1573 = ~_1273;
    int _1575 = _1573 + 1;
    int _1577 = _1303 * int(_1547);
    int _1579 = _1577 + _1515;
    float _1581 = float(uint(_1579));
    bool _1583 = !_1471;
    float _1585 = _1583 ? _191 : as_type<float>(_1287);
    float _1587 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1589 = _1277 > 0.5;
    float _1591 = as_type<float>(_1321) * _1581;
    if (!_1319)
    {
        _197 = _1505;
    }
    float _1593 = _197;
    float _1595 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1531);
    float _1597 = _1593;
    if (!_1319)
    {
        _1539 = _1505;
    }
    float _1599 = _1539;
    float _1601 = trunc(_1591);
    float _1603 = precise::max(_1601, 0.0);
    uint _1605 = uint(_1603);
    float _1607 = fma(_1277, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1587);
    float _1609 = _1599;
    if (_1319)
    {
        _1597 = _1277;
    }
    float _1611 = _1597;
    float _1613 = _1585 + 0.5;
    if (_1319)
    {
        _1609 = _1277;
    }
    float _1615 = _1609;
    float _1617 = _1511 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _1619 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1621 = _1619 != 0;
    float _1623 = -_121;
    float _1625 = fma(_1623, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1503);
    float _1627 = -_211;
    int _1629 = _1589 ? as_type<int>(_1627) : as_type<int>(_211);
    float _1631 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1633 = _544 + _1631;
    float _1635 = -_211;
    int _1637 = _1529 ? as_type<int>(_1635) : as_type<int>(_211);
    float _1639 = fma(_1615, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1481);
    bool _1641 = !_1621;
    float _1643 = _1641 ? _211 : as_type<float>(_1629);
    float _1645 = fma(_1559, _1633, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _1647 = !_1567;
    float _1649 = _1647 ? _211 : as_type<float>(_1637);
    float _1651 = fma(_1617, _1613, _1625);
    float _1653 = as_type<float>(_1321) * _1535;
    int _1655 = int(_1547) + int(_1605);
    float _1657 = _1643 + (-0.5);
    bool _1659 = _544 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1661 = isnan(_544);
    bool _1663 = _1659 || _1661;
    bool _1665 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1667 = _1663 || _1665;
    float _1669 = float(_1667);
    float _1671 = _1611 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1673 = trunc(_1653);
    float _1675 = precise::max(_1673, 0.0);
    uint _1677 = uint(_1675);
    bool _1679 = _544 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1681 = isnan(_544);
    bool _1683 = _1679 || _1681;
    bool _1685 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1687 = _1683 || _1685;
    float _1689 = float(_1687);
    float _1691 = _1315 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1693 = -_1669;
    float _1695 = _1693 + 1.0;
    float _1697 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1699 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1557);
    int _1701 = _1575 * _1655;
    int _1703 = _1701 + _1515;
    float _1705 = _1689 * _1695;
    float _1707 = fma(_1553, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1697);
    float _1709 = -_1691;
    float _1711 = -_1699;
    float _1713 = fma(_1709, _1657, _1711);
    float _1715 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1717 = _1553 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1719 = _1645 * _1705;
    bool _1721 = uint(_1703) >= uint(_1273);
    float _1723 = -_1715;
    float _1725 = fma(_1717, 2.0, _1723);
    int _1727 = ~_1273;
    int _1729 = _1727 + 1;
    float _1731 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _1733 = !_1721;
    int _1735 = _1733 ? 0 : (-1);
    float _1737 = _854 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1739 = _854 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1741 = fma(_1671, -2.0, _1731);
    int _1743 = ~_1655;
    int _1745 = _1743 + _1735;
    int _1747 = _1745 + 1;
    int _1749 = _1729 * int(_1677);
    int _1751 = _1749 + _1491;
    float _1753 = fma(_630, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1737);
    float _1755 = fma(_630, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1739);
    float _1757 = -_1689;
    float _1759 = _1757 + 1.0;
    int _1761 = _1273 * _1747;
    int _1763 = _1761 + _1515;
    float _1765 = float(uint(_1751));
    float _1767 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1753);
    float _1769 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1755);
    float _1771 = -_121;
    float _1773 = fma(_1771, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1725);
    bool _1775 = !_1411;
    int _1777 = _1775 ? _1763 : (-1);
    float _1779 = as_type<float>(_1321) * _1765;
    float _1781 = _1767 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1783 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1595);
    int _1785 = _1777 >> 31;
    float _1787 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1607);
    float _1789 = 1.0 / _1781;
    float _1791 = -_1783;
    float _1793 = _1791 + 1.0;
    int _1795 = _1785 & 3;
    float _1797 = _1571 + 0.5;
    int _1799 = _1777 & 3;
    bool _1801 = _1799 != 0;
    float _1803 = -_1793;
    float _1805 = fma(_1585, _1803, _1651);
    int _1807 = _1777 + _1795;
    float _1809 = _1769 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1811 = trunc(_1779);
    float _1813 = precise::max(_1811, 0.0);
    uint _1815 = uint(_1813);
    float _1817 = fma(_1797, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1773);
    int _1819 = _1807 >> 2;
    float _1821 = _1809 + _1781;
    float _1823 = as_type<float>(_1807);
    float _1825 = _1793;
    float _1827 = _1713;
    float _1829 = as_type<float>(_1747);
    float _1831 = _1669;
    if (!_1449)
    {
        _1823 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _1833 = _1823;
    float _1835 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1707);
    int _1837 = _1819 << 4;
    int _1839 = _1837 + 512;
    float _1841 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1639);
    float _1843 = _1821 * _1789;
    float _1845 = _1843 * 0.5;
    int _1847 = _1777 & 3;
    bool _1849 = _1847 != 0;
    float _1851 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1741);
    int _1853 = ~_1273;
    int _1855 = _1853 + 1;
    float _1857 = _1833;
    if (!_1449)
    {
        float _1859 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1861 = fma(_1845, _1833, _1859);
        _1857 = _1861;
    }
    float _1863 = _1857;
    bool _1865 = uint(_1847) > 1u;
    int _1867 = _1839 + 8;
    uint _1869 = uint(int(uint(_1867) >> uint(2)));
    uint _1871 = uint(int(uint(int(_1869)) >> uint(2)));
    int _1873 = int(_1869) & 3;
    float _1875 = (*spvDescriptorSet0.vp_c9)._m0[int(_1871)][_1873];
    int _1877 = int(_1869) + 1;
    uint _1879 = uint(int(uint(_1877) >> uint(2)));
    int _1881 = _1877 & 3;
    float _1883 = (*spvDescriptorSet0.vp_c9)._m0[int(_1879)][_1881];
    float _1885 = _1649 + (-0.5);
    int _1887 = int(_1677) + int(_1815);
    float _1889 = -_1841;
    float _1891 = _1889 + 1.0;
    int _1893 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1895 = _1893 != 0;
    float _1897 = -_1885;
    float _1899 = -_1851;
    float _1901 = fma(_1897, (*spvDescriptorSet0.vp_c9)._m0[85].y, _1899);
    int _1903 = _1801 ? 0 : 1;
    int _1905 = _1855 * _1887;
    int _1907 = _1905 + _1491;
    uint _1909 = uint(int(uint(_1839) >> uint(2)));
    uint _1911 = uint(int(uint(int(_1909)) >> uint(2)));
    int _1913 = int(_1909) & 3;
    float _1915 = (*spvDescriptorSet0.vp_c9)._m0[int(_1911)][_1913];
    int _1917 = int(_1909) + 1;
    uint _1919 = uint(int(uint(_1917) >> uint(2)));
    int _1921 = _1917 & 3;
    float _1923 = (*spvDescriptorSet0.vp_c9)._m0[int(_1919)][_1921];
    float _1925 = fma(_1649, _1891, _1901);
    float _1927 = -_1787;
    float _1929 = _1927 + 1.0;
    if (!_1449)
    {
        _1825 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _1931 = _1825;
    float _1933 = -_1835;
    float _1935 = _1933 + 1.0;
    bool _1937 = uint(_1907) >= uint(_1273);
    float _1939 = fma(_1643, _1929, _1713);
    int _1941 = ~_1903;
    int _1943 = _1941 + 1;
    int _1945 = _1943 + 1;
    int _1947 = _1945;
    if (!_1449)
    {
        float _1949 = -_1931;
        float _1951 = _1949 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _1827 = _1951;
    }
    float _1953 = _1827;
    bool _1955 = !_1937;
    int _1957 = _1955 ? 0 : (-1);
    float _1959 = -_1935;
    float _1961 = fma(_1571, _1959, _1817);
    if (!_1865)
    {
        int _1963 = ~_1903;
        int _1965 = _1963 + 1;
        _1947 = _1965;
    }
    int _1967 = _1947;
    if (!_1449)
    {
        float _1969 = 1.0 / _1953;
        _1829 = _1969;
    }
    float _1971 = _1829;
    bool _1973 = _1847 != 3;
    float _1975 = fma(_1759, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1719);
    int _1977 = ~_1887;
    int _1979 = _1977 + _1957;
    int _1981 = _1979 + 1;
    out.m_60.x = _1805;
    out.m_60.y = _1939;
    out.m_60.z = _1961;
    out.m_60.w = _1925;
    int _1983 = abs(_1967);
    float _1985 = fma(_1669, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1975);
    bool _1987 = uint(_1847) >= 2u;
    int _1989 = _1273 * _1981;
    int _1991 = _1989 + _1491;
    bool _1993 = !_1849;
    int _1995 = _1993 ? 0 : 1;
    float _1997 = _1863;
    if (!_1449)
    {
        float _1999 = 1.0 / _1863;
        _1997 = _1999;
    }
    float _2001 = _1997;
    float _2003 = _1347 * _1236;
    int _2005 = _1987 ? 0 : 1;
    float _2007 = -_1347;
    float _2009 = _2007 + 1.0;
    int _2011 = ~_1983;
    int _2013 = _2011 + 1;
    int _2015 = _2013 + 1;
    float _2017 = _1985 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _2019 = _1847 != 3;
    int _2021 = abs(_1995);
    int _2023 = ~_2005;
    int _2025 = _2023 + 1;
    int _2027 = _2025 + 1;
    int _2029 = _2027;
    if (!_1449)
    {
        float _2031 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2033 = -_1931;
        float _2035 = fma(_2001, _2031, _2033);
        _1831 = _2035;
    }
    float _2037 = _1831;
    float _2039 = _2037;
    if (_1973)
    {
        int _2041 = ~_2005;
        int _2043 = _2041 + 1;
        _2029 = _2043;
    }
    int _2045 = _2029;
    float _2047 = _1257 * _2003;
    int _2049 = ~_2021;
    int _2051 = _2049 + 1;
    int _2053 = _2051 + 1;
    if (!_1449)
    {
        float _2055 = _2037 * _1971;
        float _2057 = precise::clamp(_2055, 0.0, 1.0);
        _2039 = _2057;
    }
    float _2059 = _2039;
    int _2061 = abs(_2045);
    float _2063 = fma(_1247, _2047, _1245);
    bool _2065 = !_2019;
    float _2067 = _2065 ? 0.0 : as_type<float>(0xffffffffu /* nan */);
    out.m_62.w = _2017;
    int _2069 = _2015 * as_type<int>(_1923);
    int _2071 = abs(as_type<int>(_2067));
    float _2073 = _2067;
    if (_1449)
    {
        _2073 = 1.0;
    }
    float _2075 = _2073;
    int _2077 = _2053 * as_type<int>(_1915);
    int _2079 = _2077 + _2069;
    bool _2081 = !_1895;
    int _2083 = _2081 ? 0 : 1;
    float _2085 = _2075;
    if (!_1449)
    {
        float _2087 = -_2059;
        float _2089 = _2087 + 1.0;
        _2085 = _2089;
    }
    float _2091 = _2085;
    int _2093 = ~_2061;
    int _2095 = _2093 + 1;
    int _2097 = _2095 + 1;
    int _2099 = abs(_2083);
    float _2101 = _2091 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    int _2103 = _2097 * as_type<int>(_1875);
    int _2105 = _2103 + _2079;
    int _2107 = ~_2099;
    int _2109 = _2107 + 1;
    int _2111 = _2109 + 1;
    float _2113 = _381 * _2101;
    int _2115 = ~_2071;
    int _2117 = _2115 + 1;
    int _2119 = _2117 + 1;
    float _2121 = _2113 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2123 = _1247 * _2003;
    int _2125 = _2119 * as_type<int>(_1883);
    int _2127 = _2125 + _2105;
    bool _2129 = !_1411;
    int _2131 = _2129 ? _1991 : (-1);
    float _2133 = _1247 * _2009;
    bool _2135 = _2091 > 0.0;
    bool _2137 = isnan(_2091);
    bool _2139 = _2135 || _2137;
    bool _2141 = isnan(0.0);
    bool _2143 = _2139 || _2141;
    int _2145 = _2127 * _2111;
    float _2147 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _2149 = _1289 + _2147;
    float _2151 = fma(_1253, _2123, _1241);
    int _2153 = _2131 * _2099;
    int _2155 = _2153 + _2145;
    float _2157 = _1164 + _2149;
    out.gl_Position.x = _1204;
    out.gl_Position.y = _1200;
    out.gl_Position.z = _2149;
    out.gl_Position.w = _1164;
    float _2159 = fma(_1255, _2123, _1243);
    float _2161 = _2157 * 0.5;
    float _2163 = float(_2155);
    out.m_45.x = _2121;
    out.m_64.z = _2161;
    out.m_64.w = _1164;
    out.m_66.y = _2163;
    out.m_68.x = _2151;
    out.m_68.y = _2159;
    out.m_68.z = _2063;
    out.m_68.w = _2133;
    if (_2143)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _2165 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2165;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    bool _534 = false;
    bool _401 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _82 = in.m_42.w;
    float _84 = trunc(_82);
    int _87 = int(_84);
    bool _91 = _87 >= 1;
    float _93 = 0.0;
    if (!_91)
    {
        _93 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _95 = _93;
    float _97 = _95;
    if (!_91)
    {
        out.m_45.x = 0.0;
    }
    int _99 = 0;
    if (!_91)
    {
        float _101 = _95 * 5.0;
        _99 = as_type<int>(_101);
    }
    int _103 = _99;
    int _105 = _103;
    if (!_91)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2222 = as_type<float>(_103);
        out.gl_Position.z = _2222;
    }
    if (!_91)
    {
        return out;
    }
    float _107 = in.m_47.w;
    bool _109 = _107 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _111 = isnan(_107);
    bool _113 = _109 || _111;
    bool _115 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _117 = _113 || _115;
    float _119 = -_107;
    float _121 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _123 = 0.0;
    if (_117)
    {
        float _125 = float(_87);
        _123 = _125;
    }
    float _127 = _123;
    bool _129 = _121 >= _127;
    bool _131 = !_117;
    bool _133 = _129 || _131;
    if (_133)
    {
        _97 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _135 = _97;
    if (_133)
    {
        out.m_45.x = 0.0;
    }
    if (_133)
    {
        float _137 = _135 * 5.0;
        _105 = as_type<int>(_137);
    }
    int _139 = _105;
    if (_133)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2290 = as_type<float>(_139);
        out.gl_Position.z = _2290;
    }
    if (_133)
    {
        return out;
    }
    float _141 = in.m_49.x;
    float _143 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _145 = _121 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _147 = as_type<float>(int(gl_VertexIndex));
    bool _149 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _151 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _153 = _149 || _151;
    bool _155 = isnan(1.0);
    bool _157 = _153 || _155;
    float _159 = _145 * _143;
    float _161 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[20].x, _159);
    float _163 = in.m_47.x;
    float _165 = in.m_47.y;
    float _167 = in.m_47.z;
    float _169 = _161 * 6.283185482025146484375;
    float _171 = floor(_161);
    int _173 = as_type<int>(_147) & 1;
    bool _175 = _173 != 0;
    int _177 = as_type<int>(_147) & 2;
    bool _179 = _177 != 0;
    float _181 = _169 * 0.15915493667125701904296875;
    float _183 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    int _185 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _187 = _185 != 0;
    bool _189 = !_175;
    float _191 = _189 ? (-0.5) : 0.5;
    float _193 = _147;
    float _195 = _183;
    float _197 = _191;
    if (!_157)
    {
        float _199 = _183 * _183;
        float _201 = _199 * 0.5;
        _193 = _201;
    }
    float _203 = _193;
    float _205 = _181 * 6.283185482025146484375;
    float _207 = cos(_205);
    bool _209 = !_179;
    float _211 = _209 ? (-0.5) : 0.5;
    float _213 = _203;
    if (!_157)
    {
        float _215 = _203 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _213 = _215;
    }
    float _217 = _213;
    float _219 = -_171;
    float _221 = _161 + _219;
    bool _223 = _221 < 0.5;
    float _225 = float(_223);
    bool _227 = !_157;
    float _229 = _217;
    if (!_227)
    {
        float _231 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _233 = log2(_231);
        float _235 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _237 = _235 + 1.0;
        float _239 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _241 = _183 * _233;
        float _243 = 1.0 / _237;
        float _245 = _239 * 0.693147182464599609375;
        float _247 = exp2(_241);
        float _249 = 1.0 / _245;
        float _251 = _247 + (-1.0);
        float _253 = -_251;
        float _255 = fma(_253, _249, _183);
        float _257 = _255 * _243;
        float _259 = _257 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _229 = _259;
    }
    float _261 = _229;
    bool _263 = !_157;
    if (!_263)
    {
        float _265 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _267 = log2(_265);
        float _269 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _271 = _269 + 1.0;
        float _273 = 1.0 / _271;
        float _275 = _183 * _267;
        float _277 = exp2(_275);
        float _279 = -_277;
        float _281 = _279 + 1.0;
        float _283 = _281 * _273;
        _195 = _283;
    }
    float _285 = _195;
    float _287 = fma(_207, 0.5, 0.5);
    float _289 = -_225;
    float _291 = fma(_289, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _293 = _261 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    int _295 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _297 = _295 != 0;
    int _299 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _301 = _299 != 0;
    float _303 = -_287;
    float _305 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _307 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _309 = in.m_54.w;
    float _311 = -_221;
    float _313 = fma(_311, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _315 = !_297;
    int _317 = _315 ? 0 : 1;
    float _319 = fma(_285, _163, _293);
    float _321 = in.m_42.x;
    float _323 = in.m_42.y;
    float _325 = in.m_42.z;
    float _327 = _307 * _141;
    bool _329 = !_187;
    int _331 = _329 ? 0 : 1;
    int _333 = abs(_317);
    int _335 = abs(_331);
    float _337 = trunc(_327);
    int _339 = int(_337);
    bool _341 = !_301;
    int _343 = _341 ? 0 : 1;
    float _345 = _261 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _347 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    int _349 = abs(_343);
    float _351 = fma(_285, _165, _345);
    float _353 = float(_333);
    float _355 = _261 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _357 = float(_335);
    float _359 = abs(_313);
    float _361 = _353 * _359;
    float _363 = fma(_285, _167, _355);
    int _365 = _339 << 4;
    int _367 = _365 + 1712;
    float _369 = fma(_351, _309, _323);
    float _371 = float(_349);
    float _373 = fma(_357, _305, _361);
    float _375 = fma(_319, _309, _321);
    float _377 = fma(_363, _309, _325);
    float _379 = abs(_291);
    float _381 = fma(_371, _379, _373);
    bool _383 = !_347;
    float _399;
    if (!_383)
    {
        float _385 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _387 = _141 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _389 = fma(_387, (*spvDescriptorSet0.vp_c9)._m0[11].y, _121);
        float _391 = _389 * _385;
        float _393 = floor(_391);
        float _395 = -_393;
        float _397 = _391 + _395;
        _399 = _397;
        _401 = true;
    }
    else
    {
        float _403 = float(_87);
        float _405 = 1.0 / _403;
        float _407 = _121 * _405;
        _399 = _407;
    }
    _401 = false;
    float _409 = _399;
    uint _412 = uint(int(uint(_367) >> uint(2)));
    uint _414 = uint(int(uint(int(_412)) >> uint(2)));
    int _416 = int(_412) & 3;
    float _418 = (*spvDescriptorSet0.vp_c9)._m0[int(_414)][_416];
    int _420 = int(_412) + 1;
    uint _422 = uint(int(uint(_420) >> uint(2)));
    int _424 = _420 & 3;
    float _426 = (*spvDescriptorSet0.vp_c9)._m0[int(_422)][_424];
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _430 = _409 + _428;
    bool _432 = _409 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _434 = isnan(_409);
    bool _436 = _432 || _434;
    bool _438 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _440 = _436 || _438;
    float _442 = float(_440);
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _446 = _444 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _448 = _409 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _450 = isnan(_409);
    bool _452 = _448 || _450;
    bool _454 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _456 = _452 || _454;
    float _458 = float(_456);
    int _460 = _367 + 8;
    uint _462 = uint(int(uint(_460) >> uint(2)));
    uint _464 = uint(int(uint(int(_462)) >> uint(2)));
    int _466 = int(_462) & 3;
    float _468 = (*spvDescriptorSet0.vp_c9)._m0[int(_464)][_466];
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _472 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _470;
    float _474 = -_442;
    float _476 = _474 + 1.0;
    bool _478 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _480 = 1.0 / _446;
    float _482 = _472 * _480;
    float _484 = fma(_482, _430, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _486 = _458 * _476;
    float _488 = -_458;
    float _490 = _488 + 1.0;
    float _492 = _484 * _486;
    float _494 = fma(_490, (*spvDescriptorSet0.vp_c9)._m0[115].x, _492);
    float _496 = fma(_442, (*spvDescriptorSet0.vp_c9)._m0[116].x, _494);
    float _498 = _418 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _500 = _426 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _502 = _496 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _504 = _498 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _506 = _500 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _508 = _468 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _510 = _508 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _512 = !_478;
    float _530;
    float _532;
    if (!_512)
    {
        float _514 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _516 = _141 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _518 = float(_87);
        float _520 = fma(_516, (*spvDescriptorSet0.vp_c9)._m0[11].w, _121);
        float _522 = _520 * _514;
        float _524 = floor(_522);
        float _526 = -_524;
        float _528 = _522 + _526;
        _530 = _518;
        _532 = _528;
        _534 = true;
    }
    else
    {
        float _536 = float(_87);
        float _538 = 1.0 / _536;
        float _540 = _121 * _538;
        _530 = _536;
        _532 = _540;
    }
    _534 = false;
    float _542 = _530;
    float _544 = _532;
    float _546 = _369 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _548 = _369 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _550 = in.m_54.x;
    float _552 = in.m_54.y;
    float _554 = fma(_121, 0.02500000037252902984619140625, _141);
    float _556 = fma(_375, (*spvDescriptorSet0.vp_c10)._m0[5].x, _546);
    float _558 = _369 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _560 = fma(_375, (*spvDescriptorSet0.vp_c10)._m0[4].x, _548);
    float _562 = floor(_554);
    float _564 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[5].z, _556);
    float _566 = fma(_375, (*spvDescriptorSet0.vp_c10)._m0[6].x, _558);
    float _568 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[4].z, _560);
    float _570 = _564 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _572 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[6].z, _566);
    float _574 = _568 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _576 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _211);
    float _578 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _580 = _570 + _578;
    float _582 = _572 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _584 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _586 = _574 + _584;
    float _588 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _191);
    float _590 = _580 * _580;
    float _592 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _594 = _582 + _592;
    float _596 = (*spvDescriptorSet0.vp_c9)._m0[191].x * 0.100000001490116119384765625;
    float _598 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _600 = _574 + _598;
    float _602 = fma(_586, _586, _590);
    float _604 = _562 * _596;
    float _606 = fma(_594, _594, _602);
    float _608 = rsqrt(_606);
    float _610 = _580 * _608;
    float _612 = _586 * _608;
    float _614 = _594 * _608;
    float _616 = -_610;
    float _618 = fma(_616, (*spvDescriptorSet0.vp_c9)._m0[18].w, _580);
    float _620 = -_612;
    float _622 = fma(_620, (*spvDescriptorSet0.vp_c9)._m0[18].w, _586);
    float _624 = -_614;
    float _626 = fma(_624, (*spvDescriptorSet0.vp_c9)._m0[18].w, _594);
    float _628 = -_612;
    float _630 = fma(_628, (*spvDescriptorSet0.vp_c9)._m0[18].w, _574);
    float _632 = _618 * _618;
    float _634 = fma(_622, _622, _632);
    float _636 = _552 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _638 = fma(_626, _626, _634);
    float _640 = sqrt(_638);
    float _642 = _636 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _644 = fma(_562, -0.1500000059604644775390625, 1.0);
    float _646 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _648 = _582 + _646;
    float _650 = _608 * _640;
    float _652 = _550 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _654 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _656 = _570 + _654;
    float _658 = _642 * _650;
    float _660 = _652 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _662 = _656 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _664 = _658 * _576;
    float _666 = _660 * _650;
    float _668 = fma(_600, (*spvDescriptorSet0.vp_c10)._m0[8].x, _662);
    float _670 = precise::max(_644, 0.20000000298023223876953125);
    float _672 = _664 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _674 = _666 * _588;
    float _676 = _650 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _678 = _676 * 0.5;
    float _680 = _664 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _682 = fma(_648, (*spvDescriptorSet0.vp_c10)._m0[10].x, _668);
    float _684 = fma(_674, (*spvDescriptorSet0.vp_c10)._m0[10].x, _672);
    float _686 = precise::min(_670, 1.0);
    float _688 = fma(_674, (*spvDescriptorSet0.vp_c10)._m0[8].x, _680);
    float _690 = _682 * _604;
    float _692 = fma(_678, (*spvDescriptorSet0.vp_c10)._m0[10].z, _684);
    float _694 = fma(_678, (*spvDescriptorSet0.vp_c10)._m0[8].z, _688);
    float _696 = fma(_692, _686, _582);
    float _698 = fma(_694, _686, _574);
    float _700 = fma(_690, (*spvDescriptorSet0.vp_c10)._m0[10].x, _696);
    float _702 = fma(_690, (*spvDescriptorSet0.vp_c10)._m0[8].x, _698);
    float _704 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _706 = _700 + _704;
    float _708 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _710 = _702 + _708;
    float _712 = _706 * _706;
    float _714 = fma(_710, _710, _712);
    float _716 = _664 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _718 = sqrt(_714);
    float _720 = fma(_674, (*spvDescriptorSet0.vp_c10)._m0[9].x, _716);
    float _722 = fma(_678, (*spvDescriptorSet0.vp_c10)._m0[9].z, _720);
    float _724 = fma(_722, _686, _570);
    float _726 = fma(_690, (*spvDescriptorSet0.vp_c10)._m0[9].x, _724);
    bool _728 = _718 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _730 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _732 = _730 != 0;
    int _734 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _736 = _734 != 0;
    int _738 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _740 = _738 != 0;
    int _742 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _744 = _742 != 0;
    bool _746 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _748 = isnan(0.5);
    bool _750 = _746 || _748;
    bool _752 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _754 = _750 || _752;
    bool _756 = !_736;
    int _758 = _756 ? 0 : 1;
    bool _760 = !_732;
    int _762 = _760 ? 0 : 1;
    bool _764 = !_740;
    int _766 = _764 ? 0 : 1;
    bool _768 = !_744;
    int _770 = _768 ? 0 : 1;
    float _772 = _724;
    float _774 = _678;
    float _776 = _716;
    float _778 = _614;
    if (!_728)
    {
        _772 = _702;
    }
    float _780 = _772;
    float _782 = _780;
    if (!_728)
    {
        _774 = _700;
    }
    float _784 = _774;
    float _786 = _784;
    if (!_728)
    {
        _776 = _726;
    }
    float _788 = _776;
    bool _790 = !_728;
    float _792 = _788;
    if (!_790)
    {
        float _794 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _796 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _798 = _718 + _796;
        float _800 = rsqrt(_714);
        float _802 = _798 * _794;
        float _804 = _726 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _806 = _802 * 0.15915493667125701904296875;
        float _808 = _806 * 6.283185482025146484375;
        float _810 = sin(_808);
        float _812 = _806 * 6.283185482025146484375;
        float _814 = cos(_812);
        float _816 = fma(_810, _804, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _818 = _800 * _816;
        float _820 = _814 + (-1.0);
        float _822 = fma(_710, _818, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _824 = fma(_706, _818, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _826 = _820 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _828 = fma(_726, _814, _826);
        _786 = _824;
        _792 = _828;
        _782 = _822;
    }
    float _830 = _786;
    float _832 = _792;
    float _834 = _782;
    float _836 = -_614;
    float _838 = fma(_836, (*spvDescriptorSet0.vp_c9)._m0[18].w, _830);
    float _840 = -_610;
    float _842 = fma(_840, (*spvDescriptorSet0.vp_c9)._m0[18].w, _832);
    float _844 = -_614;
    float _846 = fma(_844, (*spvDescriptorSet0.vp_c9)._m0[18].w, _582);
    float _848 = -_612;
    float _850 = fma(_848, (*spvDescriptorSet0.vp_c9)._m0[18].w, _834);
    float _852 = -_610;
    float _854 = fma(_852, (*spvDescriptorSet0.vp_c9)._m0[18].w, _570);
    float _856 = _842;
    float _858 = _850;
    float _860 = _832;
    if (_754)
    {
        _778 = _838;
    }
    float _862 = _778;
    float _864 = _862;
    if (!_754)
    {
        float _866 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _868 = _854 + _866;
        float _870 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _872 = _630 + _870;
        float _874 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].y;
        float _876 = -_574;
        float _878 = _876 + _834;
        float _880 = _868 * _868;
        float _882 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _884 = _846 + _882;
        float _886 = -_570;
        float _888 = _886 + _832;
        float _890 = -_582;
        float _892 = _890 + _830;
        float _894 = fma(_872, _872, _880);
        float _896 = 1.0 / _650;
        float _898 = fma(_884, _884, _894);
        float _900 = sqrt(_898);
        float _902 = precise::max(_900, (*spvDescriptorSet0.vp_c9)._m0[199].y);
        float _904 = _902 * _874;
        float _906 = _904 * _896;
        float _908 = fma(_878, _906, _630);
        float _910 = fma(_888, _906, _854);
        float _912 = fma(_892, _906, _846);
        _856 = _910;
        _858 = _908;
        _864 = _912;
    }
    float _914 = _856;
    float _916 = _858;
    float _918 = _864;
    float _920 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _922 = _914 + _920;
    float _924 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _926 = _916 + _924;
    float _928 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _930 = _918 + _928;
    float _932 = _922 * _922;
    float _934 = _914 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _936 = fma(_926, _926, _932);
    float _938 = fma(_930, _930, _936);
    float _940 = rsqrt(_938);
    float _942 = sqrt(_938);
    float _944 = _940 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _946 = _926 * _944;
    float _948 = _930 * _944;
    float _950 = _946 * _946;
    float _952 = _948 * _948;
    float _954 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _956 = fma(_942, (*spvDescriptorSet0.vp_c15)._m0[23].w, _954);
    float _958 = precise::clamp(_956, 0.0, 1.0);
    float _960 = _950 + _952;
    float _962 = sqrt(_960);
    bool _964 = _962 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _966 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _968 = _962 + _966;
    float _970 = _936;
    float _972 = _960;
    float _974 = _968;
    float _976 = _922;
    float _978 = _944;
    if (_964)
    {
        float _980 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _970 = _980;
    }
    float _982 = _970;
    if (_964)
    {
        float _984 = rsqrt(_960);
        _972 = _984;
    }
    float _986 = _972;
    float _988 = _982;
    if (_964)
    {
        float _990 = _968 * _982;
        _974 = _990;
    }
    float _992 = _974;
    if (_964)
    {
        float _994 = _992 * 0.15915493667125701904296875;
        _860 = _994;
    }
    float _996 = _860;
    float _998 = _930;
    if (_964)
    {
        float _1000 = _996 * 6.283185482025146484375;
        float _1002 = sin(_1000);
        _998 = _1002;
    }
    float _1004 = _998;
    float _1006 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1008 = precise::max(0.0, _1006);
    float _1010 = _940;
    float _1012 = _1008;
    if (_964)
    {
        float _1014 = _996 * 6.283185482025146484375;
        float _1016 = cos(_1014);
        _1010 = _1016;
    }
    float _1018 = _1010;
    float _1020 = -_944;
    float _1022 = -_1008;
    float _1024 = fma(_922, _1020, _1022);
    if (_964)
    {
        float _1026 = _1024 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _976 = _1026;
    }
    float _1028 = _976;
    float _1030 = _1004;
    float _1032 = _1028;
    if (_964)
    {
        float _1034 = fma(_1004, _1028, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _978 = _1034;
    }
    float _1036 = _978;
    float _1038 = _1036;
    if (!_964)
    {
        _1030 = _946;
    }
    float _1040 = _1030;
    float _1042 = _1040;
    if (!_964)
    {
        _1032 = _1024;
    }
    float _1044 = _1032;
    float _1046 = _1044;
    float _1048 = _1018;
    if (_964)
    {
        float _1050 = _1018 + (-1.0);
        _1012 = _1050;
    }
    float _1052 = _1012;
    float _1054 = _1052;
    if (_964)
    {
        float _1056 = _986 * _1036;
        _1038 = _1056;
    }
    float _1058 = _1038;
    if (_964)
    {
        float _1060 = _1052 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _988 = _1060;
    }
    float _1062 = _988;
    float _1064 = _1062;
    if (_964)
    {
        float _1066 = _946 * _1058;
        _1042 = _1066;
    }
    float _1068 = _1042;
    if (!_964)
    {
        _1054 = _948;
    }
    float _1070 = _1054;
    float _1072 = _1070;
    if (_964)
    {
        float _1074 = _948 * _1058;
        _1072 = _1074;
    }
    float _1076 = _1072;
    if (_964)
    {
        float _1078 = fma(_1024, _1018, _1062);
        _1046 = _1078;
    }
    float _1080 = _1046;
    if (!_964)
    {
        _1048 = _950;
    }
    float _1082 = _1048;
    float _1084 = _1082;
    if (_964)
    {
        float _1086 = _1068 * _1068;
        _1084 = _1086;
    }
    float _1088 = _1084;
    float _1090 = _914 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    if (!_964)
    {
        _1064 = _952;
    }
    float _1092 = _1064;
    float _1094 = _1092;
    if (_964)
    {
        float _1096 = _1076 * _1076;
        _1094 = _1096;
    }
    float _1098 = _1094;
    float _1100 = fma(_1080, _1080, _1088);
    float _1102 = fma(_916, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1090);
    float _1104 = _914 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1106 = _914 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1108 = _1100 + _1098;
    float _1110 = fma(_918, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1102);
    float _1112 = fma(_916, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1104);
    float _1114 = fma(_916, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1106);
    float _1116 = fma(_916, (*spvDescriptorSet0.vp_c8)._m0[3].x, _934);
    float _1118 = -_958;
    float _1120 = _1118 + 1.0;
    float _1122 = rsqrt(_1108);
    float _1124 = fma(_918, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1112);
    float _1126 = fma(_918, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1116);
    float _1128 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1130 = fma(_918, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1114);
    float _1132 = _1124 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1134 = _1110 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1136 = _1126 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1138 = abs(_1120);
    float _1140 = log2(_1138);
    float _1142 = _1132 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1144 = _1130 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1146 = fma(_1134, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1142);
    float _1148 = _1144 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1150 = _1122 * _1068;
    float _1152 = _1122 * _1080;
    float _1154 = _1122 * _1076;
    float _1156 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1146);
    float _1158 = _1150 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1160 = -_1148;
    float _1162 = fma(_1160, _1128, 1.0);
    float _1164 = fma(_1136, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1156);
    float _1166 = -_1158;
    float _1168 = fma(_1152, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1166);
    float _1170 = _1140 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1172 = _1132 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1174 = log2(_1162);
    float _1176 = -_1154;
    float _1178 = fma(_1176, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1168);
    float _1180 = _1132 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1182 = fma(_1134, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1172);
    float _1184 = _1152 + 1.0;
    float _1186 = fma(_1178, -0.5, 0.5);
    float _1188 = fma(_1178, 0.5, 0.5);
    float _1190 = fma(_1134, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1180);
    float _1192 = 1.0 / _1164;
    float _1194 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1182);
    float _1196 = fma(_1188, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1198 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1190);
    float _1200 = fma(_1136, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1194);
    float _1202 = fma(_1188, _1196, -0.212114393711090087890625);
    float _1204 = fma(_1136, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1198);
    float _1206 = exp2(_1170);
    float _1208 = _1174 * 0.693147182464599609375;
    float _1210 = fma(_1188, _1202, 1.570728778839111328125);
    float _1212 = _1208 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1214 = sqrt(_1186);
    float _1216 = _1204 * _1192;
    float _1218 = _1200 * _1192;
    float _1220 = fma(_1216, 0.5, 0.5);
    float _1222 = fma(_1218, -0.5, 0.5);
    float _1224 = -_1152;
    float _1226 = fma(_1206, _1184, _1224);
    float _1228 = fma(_1226, 0.5, 0.5);
    float _1230 = _1214 * 0.636619746685028076171875;
    float _1232 = -_1210;
    float _1234 = fma(_1230, _1232, 1.0);
    float3 _4031 = float3(_1220, _1222, _1212);
    float _1236 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4031, float3(0.0), isnan(_4031)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4031, float3(0.0), isnan(_4031)), level(0.0)).x;
    float3 _4042 = float3(_1220, _1222, _1212);
    float4 _1239 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4042, float3(0.0), isnan(_4042)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4042, float3(0.0), isnan(_4042)), level(0.0)).xyzw;
    float _1241 = _1239.x;
    float _1243 = _1239.y;
    float _1245 = _1239.z;
    float _1247 = _1239.w;
    float2 _4059 = float2(_1234, _1228);
    float3 _1251 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4059, float2(0.0), isnan(_4059)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4059, float2(0.0), isnan(_4059)), level(0.0)).xyz;
    float _1253 = _1251.x;
    float _1255 = _1251.y;
    float _1257 = _1251.z;
    float _1259 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1261 = int(_1259);
    int _1263 = abs(_758);
    out.m_56.x = _504;
    out.m_56.y = _506;
    out.m_56.z = _510;
    out.m_56.w = _502;
    bool _1265 = _141 > 0.5;
    float _1267 = _1140 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1269 = _1132 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_58.y = _914;
    float _1271 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1273 = int(_1271);
    float _1275 = fma(_1134, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1269);
    float _1277 = in.m_49.y;
    float _1279 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1275);
    float _1281 = float(_1261);
    float _1283 = 1.0 / _542;
    float _1285 = -_191;
    int _1287 = _1265 ? as_type<int>(_1285) : as_type<int>(_191);
    float _1289 = fma(_1136, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1279);
    float _1291 = float(uint(_1273));
    float _1293 = 1.0 / _1281;
    int _1295 = ~_1273;
    int _1297 = _1295 + 1;
    int _1299 = _1273 + (-1);
    int _1301 = ~_1273;
    int _1303 = _1301 + 1;
    float _1305 = 1.0 / _1291;
    float _1307 = _1277 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1309 = _121 * _1293;
    int _1311 = ~_1273;
    int _1313 = _1311 + 1;
    float _1315 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1317 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1319 = _1317 != 0;
    int _1321 = as_type<int>(_1305) + (-2);
    float _1323 = trunc(_1309);
    int _1325 = int(_1323);
    bool _1327 = !_1319;
    float _1329 = _1327 ? _1277 : _141;
    float _1331 = exp2(_1267);
    float _1333 = float(uint(_1325));
    float _1335 = as_type<float>(_1321) * _1333;
    float _1337 = -_1331;
    float _1339 = _1337 + 1.0;
    float _1341 = trunc(_1335);
    float _1343 = precise::max(_1341, 0.0);
    uint _1345 = uint(_1343);
    float _1347 = _1339 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1349 = float(_1273);
    int _1351 = _1313 * int(_1345);
    int _1353 = _1351 + _1325;
    float _1355 = float(uint(_1353));
    float _1357 = as_type<float>(_1321) * _1355;
    bool _1359 = !_1319;
    float _1361 = _1359 ? 1.2345600128173828125 : 1.0;
    float _1363 = trunc(_1357);
    float _1365 = precise::max(_1363, 0.0);
    uint _1367 = uint(_1365);
    float _1369 = _1361 * _1329;
    float _1371 = floor(_1369);
    int _1373 = int(_1345) + int(_1367);
    float _1375 = float(_1325);
    int _1377 = _1297 * _1373;
    int _1379 = _1377 + _1325;
    bool _1381 = _1375 >= _1349;
    bool _1383 = isnan(_1375);
    bool _1385 = _1381 || _1383;
    bool _1387 = isnan(_1349);
    bool _1389 = _1385 || _1387;
    float _1391 = float(_1389);
    float _1393 = -_1371;
    float _1395 = _1369 + _1393;
    bool _1397 = uint(_1379) >= uint(_1273);
    float _1399 = trunc(_1391);
    int _1401 = int(_1399);
    float _1403 = _1395 * _1349;
    float _1405 = _121 * _1349;
    bool _1407 = !_1397;
    int _1409 = _1407 ? 0 : (-1);
    bool _1411 = _1273 == 0;
    float _1413 = _1405 * _1283;
    int _1415 = ~_1373;
    int _1417 = _1415 + _1409;
    int _1419 = _1417 + 1;
    float _1421 = trunc(_1403);
    int _1423 = int(_1421);
    int _1425 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1427 = _1425 != 0;
    int _1429 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1431 = _1429 != 0;
    int _1433 = _1273 * _1419;
    int _1435 = _1433 + _1325;
    bool _1437 = !_1427;
    int _1439 = _1437 ? 0 : 1;
    bool _1441 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1443 = isnan(0.5);
    bool _1445 = _1441 || _1443;
    bool _1447 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1449 = _1445 || _1447;
    float _1451 = trunc(_1413);
    int _1453 = int(_1451);
    int _1455 = ~_1401;
    int _1457 = _1455 + 1;
    int _1459 = _1457 + 1;
    bool _1461 = !_1411;
    int _1463 = _1461 ? _1435 : (-1);
    int _1465 = abs(_1439);
    int _1467 = _1463 * _1459;
    int _1469 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1471 = _1469 != 0;
    int _1473 = _1401 * _1299;
    int _1475 = _1473 + _1467;
    int _1477 = abs(_762);
    float _1479 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1481 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1483 = in.m_49.w;
    int _1485 = abs(_766);
    int _1487 = _1475 * _1263;
    int _1489 = _1423 * _1465;
    int _1491 = _1489 + _1325;
    int _1493 = abs(_770);
    float _1495 = _141 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1497 = _1453 * _1477;
    int _1499 = _1497 + _1487;
    float _1501 = -_1479;
    float _1503 = fma(_1495, 2.0, _1501);
    float _1505 = in.m_49.z;
    int _1507 = _1491 * _1485;
    int _1509 = _1507 + _1499;
    float _1511 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1513 = _1423 * _1493;
    int _1515 = _1513 + _1509;
    float _1517 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1519 = _1517 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1521 = float(uint(_1515));
    float _1523 = 1.0 / _1519;
    float _1525 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1527 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1525;
    bool _1529 = _1483 > 0.5;
    float _1531 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1533 = as_type<float>(_1321) * _1521;
    float _1535 = float(uint(_1491));
    float _1537 = _1519;
    float _1539 = (*spvDescriptorSet0.vp_c9)._m0[78].w;
    if (!_1319)
    {
        _1537 = _1277;
    }
    float _1541 = _1537;
    float _1543 = trunc(_1533);
    float _1545 = precise::max(_1543, 0.0);
    uint _1547 = uint(_1545);
    float _1549 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1551 = _1541;
    if (_1319)
    {
        _1551 = _141;
    }
    float _1553 = _1551;
    bool _1555 = _1505 > 0.5;
    float _1557 = fma(_1307, -2.0, _1549);
    float _1559 = _1527 * _1523;
    float _1561 = -_191;
    int _1563 = _1555 ? as_type<int>(_1561) : as_type<int>(_191);
    int _1565 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1567 = _1565 != 0;
    bool _1569 = !_1431;
    float _1571 = _1569 ? _191 : as_type<float>(_1563);
    int _1573 = ~_1273;
    int _1575 = _1573 + 1;
    int _1577 = _1303 * int(_1547);
    int _1579 = _1577 + _1515;
    float _1581 = float(uint(_1579));
    bool _1583 = !_1471;
    float _1585 = _1583 ? _191 : as_type<float>(_1287);
    float _1587 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1589 = _1277 > 0.5;
    float _1591 = as_type<float>(_1321) * _1581;
    if (!_1319)
    {
        _197 = _1505;
    }
    float _1593 = _197;
    float _1595 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1531);
    float _1597 = _1593;
    if (!_1319)
    {
        _1539 = _1505;
    }
    float _1599 = _1539;
    float _1601 = trunc(_1591);
    float _1603 = precise::max(_1601, 0.0);
    uint _1605 = uint(_1603);
    float _1607 = fma(_1277, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1587);
    float _1609 = _1599;
    if (_1319)
    {
        _1597 = _1277;
    }
    float _1611 = _1597;
    float _1613 = _1585 + 0.5;
    if (_1319)
    {
        _1609 = _1277;
    }
    float _1615 = _1609;
    float _1617 = _1511 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _1619 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1621 = _1619 != 0;
    float _1623 = -_121;
    float _1625 = fma(_1623, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1503);
    float _1627 = -_211;
    int _1629 = _1589 ? as_type<int>(_1627) : as_type<int>(_211);
    float _1631 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1633 = _544 + _1631;
    float _1635 = -_211;
    int _1637 = _1529 ? as_type<int>(_1635) : as_type<int>(_211);
    float _1639 = fma(_1615, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1481);
    bool _1641 = !_1621;
    float _1643 = _1641 ? _211 : as_type<float>(_1629);
    float _1645 = fma(_1559, _1633, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _1647 = !_1567;
    float _1649 = _1647 ? _211 : as_type<float>(_1637);
    float _1651 = fma(_1617, _1613, _1625);
    float _1653 = as_type<float>(_1321) * _1535;
    int _1655 = int(_1547) + int(_1605);
    float _1657 = _1643 + (-0.5);
    bool _1659 = _544 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1661 = isnan(_544);
    bool _1663 = _1659 || _1661;
    bool _1665 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1667 = _1663 || _1665;
    float _1669 = float(_1667);
    float _1671 = _1611 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1673 = trunc(_1653);
    float _1675 = precise::max(_1673, 0.0);
    uint _1677 = uint(_1675);
    bool _1679 = _544 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1681 = isnan(_544);
    bool _1683 = _1679 || _1681;
    bool _1685 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1687 = _1683 || _1685;
    float _1689 = float(_1687);
    float _1691 = _1315 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1693 = -_1669;
    float _1695 = _1693 + 1.0;
    float _1697 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1699 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1557);
    int _1701 = _1575 * _1655;
    int _1703 = _1701 + _1515;
    float _1705 = _1689 * _1695;
    float _1707 = fma(_1553, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1697);
    float _1709 = -_1691;
    float _1711 = -_1699;
    float _1713 = fma(_1709, _1657, _1711);
    float _1715 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1717 = _1553 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1719 = _1645 * _1705;
    bool _1721 = uint(_1703) >= uint(_1273);
    float _1723 = -_1715;
    float _1725 = fma(_1717, 2.0, _1723);
    int _1727 = ~_1273;
    int _1729 = _1727 + 1;
    float _1731 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _1733 = !_1721;
    int _1735 = _1733 ? 0 : (-1);
    float _1737 = _854 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1739 = _854 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1741 = fma(_1671, -2.0, _1731);
    int _1743 = ~_1655;
    int _1745 = _1743 + _1735;
    int _1747 = _1745 + 1;
    int _1749 = _1729 * int(_1677);
    int _1751 = _1749 + _1491;
    float _1753 = fma(_630, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1737);
    float _1755 = fma(_630, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1739);
    float _1757 = -_1689;
    float _1759 = _1757 + 1.0;
    int _1761 = _1273 * _1747;
    int _1763 = _1761 + _1515;
    float _1765 = float(uint(_1751));
    float _1767 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1753);
    float _1769 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1755);
    float _1771 = -_121;
    float _1773 = fma(_1771, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1725);
    bool _1775 = !_1411;
    int _1777 = _1775 ? _1763 : (-1);
    float _1779 = as_type<float>(_1321) * _1765;
    float _1781 = _1767 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1783 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1595);
    int _1785 = _1777 >> 31;
    float _1787 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1607);
    float _1789 = 1.0 / _1781;
    float _1791 = -_1783;
    float _1793 = _1791 + 1.0;
    int _1795 = _1785 & 3;
    float _1797 = _1571 + 0.5;
    int _1799 = _1777 & 3;
    bool _1801 = _1799 != 0;
    float _1803 = -_1793;
    float _1805 = fma(_1585, _1803, _1651);
    int _1807 = _1777 + _1795;
    float _1809 = _1769 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1811 = trunc(_1779);
    float _1813 = precise::max(_1811, 0.0);
    uint _1815 = uint(_1813);
    float _1817 = fma(_1797, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1773);
    int _1819 = _1807 >> 2;
    float _1821 = _1809 + _1781;
    float _1823 = as_type<float>(_1807);
    float _1825 = _1793;
    float _1827 = _1713;
    float _1829 = as_type<float>(_1747);
    float _1831 = _1669;
    if (!_1449)
    {
        _1823 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _1833 = _1823;
    float _1835 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1707);
    int _1837 = _1819 << 4;
    int _1839 = _1837 + 512;
    float _1841 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1639);
    float _1843 = _1821 * _1789;
    float _1845 = _1843 * 0.5;
    int _1847 = _1777 & 3;
    bool _1849 = _1847 != 0;
    float _1851 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1741);
    int _1853 = ~_1273;
    int _1855 = _1853 + 1;
    float _1857 = _1833;
    if (!_1449)
    {
        float _1859 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1861 = fma(_1845, _1833, _1859);
        _1857 = _1861;
    }
    float _1863 = _1857;
    bool _1865 = uint(_1847) > 1u;
    int _1867 = _1839 + 8;
    uint _1869 = uint(int(uint(_1867) >> uint(2)));
    uint _1871 = uint(int(uint(int(_1869)) >> uint(2)));
    int _1873 = int(_1869) & 3;
    float _1875 = (*spvDescriptorSet0.vp_c9)._m0[int(_1871)][_1873];
    int _1877 = int(_1869) + 1;
    uint _1879 = uint(int(uint(_1877) >> uint(2)));
    int _1881 = _1877 & 3;
    float _1883 = (*spvDescriptorSet0.vp_c9)._m0[int(_1879)][_1881];
    float _1885 = _1649 + (-0.5);
    int _1887 = int(_1677) + int(_1815);
    float _1889 = -_1841;
    float _1891 = _1889 + 1.0;
    int _1893 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1895 = _1893 != 0;
    float _1897 = -_1885;
    float _1899 = -_1851;
    float _1901 = fma(_1897, (*spvDescriptorSet0.vp_c9)._m0[85].y, _1899);
    int _1903 = _1801 ? 0 : 1;
    int _1905 = _1855 * _1887;
    int _1907 = _1905 + _1491;
    uint _1909 = uint(int(uint(_1839) >> uint(2)));
    uint _1911 = uint(int(uint(int(_1909)) >> uint(2)));
    int _1913 = int(_1909) & 3;
    float _1915 = (*spvDescriptorSet0.vp_c9)._m0[int(_1911)][_1913];
    int _1917 = int(_1909) + 1;
    uint _1919 = uint(int(uint(_1917) >> uint(2)));
    int _1921 = _1917 & 3;
    float _1923 = (*spvDescriptorSet0.vp_c9)._m0[int(_1919)][_1921];
    float _1925 = fma(_1649, _1891, _1901);
    float _1927 = -_1787;
    float _1929 = _1927 + 1.0;
    if (!_1449)
    {
        _1825 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _1931 = _1825;
    float _1933 = -_1835;
    float _1935 = _1933 + 1.0;
    bool _1937 = uint(_1907) >= uint(_1273);
    float _1939 = fma(_1643, _1929, _1713);
    int _1941 = ~_1903;
    int _1943 = _1941 + 1;
    int _1945 = _1943 + 1;
    int _1947 = _1945;
    if (!_1449)
    {
        float _1949 = -_1931;
        float _1951 = _1949 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _1827 = _1951;
    }
    float _1953 = _1827;
    bool _1955 = !_1937;
    int _1957 = _1955 ? 0 : (-1);
    float _1959 = -_1935;
    float _1961 = fma(_1571, _1959, _1817);
    if (!_1865)
    {
        int _1963 = ~_1903;
        int _1965 = _1963 + 1;
        _1947 = _1965;
    }
    int _1967 = _1947;
    if (!_1449)
    {
        float _1969 = 1.0 / _1953;
        _1829 = _1969;
    }
    float _1971 = _1829;
    bool _1973 = _1847 != 3;
    float _1975 = fma(_1759, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1719);
    int _1977 = ~_1887;
    int _1979 = _1977 + _1957;
    int _1981 = _1979 + 1;
    out.m_60.x = _1805;
    out.m_60.y = _1939;
    out.m_60.z = _1961;
    out.m_60.w = _1925;
    int _1983 = abs(_1967);
    float _1985 = fma(_1669, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1975);
    bool _1987 = uint(_1847) >= 2u;
    int _1989 = _1273 * _1981;
    int _1991 = _1989 + _1491;
    bool _1993 = !_1849;
    int _1995 = _1993 ? 0 : 1;
    float _1997 = _1863;
    if (!_1449)
    {
        float _1999 = 1.0 / _1863;
        _1997 = _1999;
    }
    float _2001 = _1997;
    float _2003 = _1347 * _1236;
    int _2005 = _1987 ? 0 : 1;
    float _2007 = -_1347;
    float _2009 = _2007 + 1.0;
    int _2011 = ~_1983;
    int _2013 = _2011 + 1;
    int _2015 = _2013 + 1;
    float _2017 = _1985 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _2019 = _1847 != 3;
    int _2021 = abs(_1995);
    int _2023 = ~_2005;
    int _2025 = _2023 + 1;
    int _2027 = _2025 + 1;
    int _2029 = _2027;
    if (!_1449)
    {
        float _2031 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2033 = -_1931;
        float _2035 = fma(_2001, _2031, _2033);
        _1831 = _2035;
    }
    float _2037 = _1831;
    float _2039 = _2037;
    if (_1973)
    {
        int _2041 = ~_2005;
        int _2043 = _2041 + 1;
        _2029 = _2043;
    }
    int _2045 = _2029;
    float _2047 = _1257 * _2003;
    int _2049 = ~_2021;
    int _2051 = _2049 + 1;
    int _2053 = _2051 + 1;
    if (!_1449)
    {
        float _2055 = _2037 * _1971;
        float _2057 = precise::clamp(_2055, 0.0, 1.0);
        _2039 = _2057;
    }
    float _2059 = _2039;
    int _2061 = abs(_2045);
    float _2063 = fma(_1247, _2047, _1245);
    bool _2065 = !_2019;
    float _2067 = _2065 ? 0.0 : as_type<float>(0xffffffffu /* nan */);
    out.m_62.w = _2017;
    int _2069 = _2015 * as_type<int>(_1923);
    int _2071 = abs(as_type<int>(_2067));
    float _2073 = _2067;
    if (_1449)
    {
        _2073 = 1.0;
    }
    float _2075 = _2073;
    int _2077 = _2053 * as_type<int>(_1915);
    int _2079 = _2077 + _2069;
    bool _2081 = !_1895;
    int _2083 = _2081 ? 0 : 1;
    float _2085 = _2075;
    if (!_1449)
    {
        float _2087 = -_2059;
        float _2089 = _2087 + 1.0;
        _2085 = _2089;
    }
    float _2091 = _2085;
    int _2093 = ~_2061;
    int _2095 = _2093 + 1;
    int _2097 = _2095 + 1;
    int _2099 = abs(_2083);
    float _2101 = _2091 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    int _2103 = _2097 * as_type<int>(_1875);
    int _2105 = _2103 + _2079;
    int _2107 = ~_2099;
    int _2109 = _2107 + 1;
    int _2111 = _2109 + 1;
    float _2113 = _381 * _2101;
    int _2115 = ~_2071;
    int _2117 = _2115 + 1;
    int _2119 = _2117 + 1;
    float _2121 = _2113 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2123 = _1247 * _2003;
    int _2125 = _2119 * as_type<int>(_1883);
    int _2127 = _2125 + _2105;
    bool _2129 = !_1411;
    int _2131 = _2129 ? _1991 : (-1);
    float _2133 = _1247 * _2009;
    bool _2135 = _2091 > 0.0;
    bool _2137 = isnan(_2091);
    bool _2139 = _2135 || _2137;
    bool _2141 = isnan(0.0);
    bool _2143 = _2139 || _2141;
    int _2145 = _2127 * _2111;
    float _2147 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _2149 = _1289 + _2147;
    float _2151 = fma(_1253, _2123, _1241);
    int _2153 = _2131 * _2099;
    int _2155 = _2153 + _2145;
    float _2157 = _1164 + _2149;
    out.gl_Position.x = _1204;
    out.gl_Position.y = _1200;
    out.gl_Position.z = _2149;
    out.gl_Position.w = _1164;
    float _2159 = fma(_1255, _2123, _1243);
    float _2161 = _2157 * 0.5;
    float _2163 = float(_2155);
    out.m_45.x = _2121;
    out.m_64.z = _2161;
    out.m_64.w = _1164;
    out.m_66.y = _2163;
    out.m_68.x = _2151;
    out.m_68.y = _2159;
    out.m_68.z = _2063;
    out.m_68.w = _2133;
    if (_2143)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _2165 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2165;
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
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    bool _534 = false;
    bool _401 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _82 = in.m_42.w;
    float _84 = trunc(_82);
    int _87 = int(_84);
    bool _91 = _87 >= 1;
    float _93 = 0.0;
    if (!_91)
    {
        _93 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _95 = _93;
    float _97 = _95;
    if (!_91)
    {
        out.m_45.x = 0.0;
    }
    int _99 = 0;
    if (!_91)
    {
        float _101 = _95 * 5.0;
        _99 = as_type<int>(_101);
    }
    int _103 = _99;
    int _105 = _103;
    if (!_91)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2222 = as_type<float>(_103);
        out.gl_Position.z = _2222;
    }
    if (!_91)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _107 = in.m_47.w;
    bool _109 = _107 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _111 = isnan(_107);
    bool _113 = _109 || _111;
    bool _115 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _117 = _113 || _115;
    float _119 = -_107;
    float _121 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _123 = 0.0;
    if (_117)
    {
        float _125 = float(_87);
        _123 = _125;
    }
    float _127 = _123;
    bool _129 = _121 >= _127;
    bool _131 = !_117;
    bool _133 = _129 || _131;
    if (_133)
    {
        _97 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _135 = _97;
    if (_133)
    {
        out.m_45.x = 0.0;
    }
    if (_133)
    {
        float _137 = _135 * 5.0;
        _105 = as_type<int>(_137);
    }
    int _139 = _105;
    if (_133)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2290 = as_type<float>(_139);
        out.gl_Position.z = _2290;
    }
    if (_133)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _141 = in.m_49.x;
    float _143 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _145 = _121 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _147 = as_type<float>(int(gl_VertexIndex));
    bool _149 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _151 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _153 = _149 || _151;
    bool _155 = isnan(1.0);
    bool _157 = _153 || _155;
    float _159 = _145 * _143;
    float _161 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[20].x, _159);
    float _163 = in.m_47.x;
    float _165 = in.m_47.y;
    float _167 = in.m_47.z;
    float _169 = _161 * 6.283185482025146484375;
    float _171 = floor(_161);
    int _173 = as_type<int>(_147) & 1;
    bool _175 = _173 != 0;
    int _177 = as_type<int>(_147) & 2;
    bool _179 = _177 != 0;
    float _181 = _169 * 0.15915493667125701904296875;
    float _183 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    int _185 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _187 = _185 != 0;
    bool _189 = !_175;
    float _191 = _189 ? (-0.5) : 0.5;
    float _193 = _147;
    float _195 = _183;
    float _197 = _191;
    if (!_157)
    {
        float _199 = _183 * _183;
        float _201 = _199 * 0.5;
        _193 = _201;
    }
    float _203 = _193;
    float _205 = _181 * 6.283185482025146484375;
    float _207 = cos(_205);
    bool _209 = !_179;
    float _211 = _209 ? (-0.5) : 0.5;
    float _213 = _203;
    if (!_157)
    {
        float _215 = _203 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _213 = _215;
    }
    float _217 = _213;
    float _219 = -_171;
    float _221 = _161 + _219;
    bool _223 = _221 < 0.5;
    float _225 = float(_223);
    bool _227 = !_157;
    float _229 = _217;
    if (!_227)
    {
        float _231 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _233 = log2(_231);
        float _235 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _237 = _235 + 1.0;
        float _239 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _241 = _183 * _233;
        float _243 = 1.0 / _237;
        float _245 = _239 * 0.693147182464599609375;
        float _247 = exp2(_241);
        float _249 = 1.0 / _245;
        float _251 = _247 + (-1.0);
        float _253 = -_251;
        float _255 = fma(_253, _249, _183);
        float _257 = _255 * _243;
        float _259 = _257 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _229 = _259;
    }
    float _261 = _229;
    bool _263 = !_157;
    if (!_263)
    {
        float _265 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _267 = log2(_265);
        float _269 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _271 = _269 + 1.0;
        float _273 = 1.0 / _271;
        float _275 = _183 * _267;
        float _277 = exp2(_275);
        float _279 = -_277;
        float _281 = _279 + 1.0;
        float _283 = _281 * _273;
        _195 = _283;
    }
    float _285 = _195;
    float _287 = fma(_207, 0.5, 0.5);
    float _289 = -_225;
    float _291 = fma(_289, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _293 = _261 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    int _295 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _297 = _295 != 0;
    int _299 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _301 = _299 != 0;
    float _303 = -_287;
    float _305 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _307 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _309 = in.m_54.w;
    float _311 = -_221;
    float _313 = fma(_311, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _315 = !_297;
    int _317 = _315 ? 0 : 1;
    float _319 = fma(_285, _163, _293);
    float _321 = in.m_42.x;
    float _323 = in.m_42.y;
    float _325 = in.m_42.z;
    float _327 = _307 * _141;
    bool _329 = !_187;
    int _331 = _329 ? 0 : 1;
    int _333 = abs(_317);
    int _335 = abs(_331);
    float _337 = trunc(_327);
    int _339 = int(_337);
    bool _341 = !_301;
    int _343 = _341 ? 0 : 1;
    float _345 = _261 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _347 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    int _349 = abs(_343);
    float _351 = fma(_285, _165, _345);
    float _353 = float(_333);
    float _355 = _261 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _357 = float(_335);
    float _359 = abs(_313);
    float _361 = _353 * _359;
    float _363 = fma(_285, _167, _355);
    int _365 = _339 << 4;
    int _367 = _365 + 1712;
    float _369 = fma(_351, _309, _323);
    float _371 = float(_349);
    float _373 = fma(_357, _305, _361);
    float _375 = fma(_319, _309, _321);
    float _377 = fma(_363, _309, _325);
    float _379 = abs(_291);
    float _381 = fma(_371, _379, _373);
    bool _383 = !_347;
    float _399;
    if (!_383)
    {
        float _385 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _387 = _141 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _389 = fma(_387, (*spvDescriptorSet0.vp_c9)._m0[11].y, _121);
        float _391 = _389 * _385;
        float _393 = floor(_391);
        float _395 = -_393;
        float _397 = _391 + _395;
        _399 = _397;
        _401 = true;
    }
    else
    {
        float _403 = float(_87);
        float _405 = 1.0 / _403;
        float _407 = _121 * _405;
        _399 = _407;
    }
    _401 = false;
    float _409 = _399;
    uint _412 = uint(int(uint(_367) >> uint(2)));
    uint _414 = uint(int(uint(int(_412)) >> uint(2)));
    int _416 = int(_412) & 3;
    float _418 = (*spvDescriptorSet0.vp_c9)._m0[int(_414)][_416];
    int _420 = int(_412) + 1;
    uint _422 = uint(int(uint(_420) >> uint(2)));
    int _424 = _420 & 3;
    float _426 = (*spvDescriptorSet0.vp_c9)._m0[int(_422)][_424];
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _430 = _409 + _428;
    bool _432 = _409 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _434 = isnan(_409);
    bool _436 = _432 || _434;
    bool _438 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _440 = _436 || _438;
    float _442 = float(_440);
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _446 = _444 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _448 = _409 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _450 = isnan(_409);
    bool _452 = _448 || _450;
    bool _454 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _456 = _452 || _454;
    float _458 = float(_456);
    int _460 = _367 + 8;
    uint _462 = uint(int(uint(_460) >> uint(2)));
    uint _464 = uint(int(uint(int(_462)) >> uint(2)));
    int _466 = int(_462) & 3;
    float _468 = (*spvDescriptorSet0.vp_c9)._m0[int(_464)][_466];
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _472 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _470;
    float _474 = -_442;
    float _476 = _474 + 1.0;
    bool _478 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _480 = 1.0 / _446;
    float _482 = _472 * _480;
    float _484 = fma(_482, _430, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _486 = _458 * _476;
    float _488 = -_458;
    float _490 = _488 + 1.0;
    float _492 = _484 * _486;
    float _494 = fma(_490, (*spvDescriptorSet0.vp_c9)._m0[115].x, _492);
    float _496 = fma(_442, (*spvDescriptorSet0.vp_c9)._m0[116].x, _494);
    float _498 = _418 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _500 = _426 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _502 = _496 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _504 = _498 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _506 = _500 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _508 = _468 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _510 = _508 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _512 = !_478;
    float _530;
    float _532;
    if (!_512)
    {
        float _514 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _516 = _141 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _518 = float(_87);
        float _520 = fma(_516, (*spvDescriptorSet0.vp_c9)._m0[11].w, _121);
        float _522 = _520 * _514;
        float _524 = floor(_522);
        float _526 = -_524;
        float _528 = _522 + _526;
        _530 = _518;
        _532 = _528;
        _534 = true;
    }
    else
    {
        float _536 = float(_87);
        float _538 = 1.0 / _536;
        float _540 = _121 * _538;
        _530 = _536;
        _532 = _540;
    }
    _534 = false;
    float _542 = _530;
    float _544 = _532;
    float _546 = _369 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _548 = _369 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _550 = in.m_54.x;
    float _552 = in.m_54.y;
    float _554 = fma(_121, 0.02500000037252902984619140625, _141);
    float _556 = fma(_375, (*spvDescriptorSet0.vp_c10)._m0[5].x, _546);
    float _558 = _369 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _560 = fma(_375, (*spvDescriptorSet0.vp_c10)._m0[4].x, _548);
    float _562 = floor(_554);
    float _564 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[5].z, _556);
    float _566 = fma(_375, (*spvDescriptorSet0.vp_c10)._m0[6].x, _558);
    float _568 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[4].z, _560);
    float _570 = _564 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _572 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[6].z, _566);
    float _574 = _568 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _576 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _211);
    float _578 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _580 = _570 + _578;
    float _582 = _572 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _584 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _586 = _574 + _584;
    float _588 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _191);
    float _590 = _580 * _580;
    float _592 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _594 = _582 + _592;
    float _596 = (*spvDescriptorSet0.vp_c9)._m0[191].x * 0.100000001490116119384765625;
    float _598 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _600 = _574 + _598;
    float _602 = fma(_586, _586, _590);
    float _604 = _562 * _596;
    float _606 = fma(_594, _594, _602);
    float _608 = rsqrt(_606);
    float _610 = _580 * _608;
    float _612 = _586 * _608;
    float _614 = _594 * _608;
    float _616 = -_610;
    float _618 = fma(_616, (*spvDescriptorSet0.vp_c9)._m0[18].w, _580);
    float _620 = -_612;
    float _622 = fma(_620, (*spvDescriptorSet0.vp_c9)._m0[18].w, _586);
    float _624 = -_614;
    float _626 = fma(_624, (*spvDescriptorSet0.vp_c9)._m0[18].w, _594);
    float _628 = -_612;
    float _630 = fma(_628, (*spvDescriptorSet0.vp_c9)._m0[18].w, _574);
    float _632 = _618 * _618;
    float _634 = fma(_622, _622, _632);
    float _636 = _552 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _638 = fma(_626, _626, _634);
    float _640 = sqrt(_638);
    float _642 = _636 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _644 = fma(_562, -0.1500000059604644775390625, 1.0);
    float _646 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _648 = _582 + _646;
    float _650 = _608 * _640;
    float _652 = _550 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _654 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _656 = _570 + _654;
    float _658 = _642 * _650;
    float _660 = _652 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _662 = _656 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _664 = _658 * _576;
    float _666 = _660 * _650;
    float _668 = fma(_600, (*spvDescriptorSet0.vp_c10)._m0[8].x, _662);
    float _670 = precise::max(_644, 0.20000000298023223876953125);
    float _672 = _664 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _674 = _666 * _588;
    float _676 = _650 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _678 = _676 * 0.5;
    float _680 = _664 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _682 = fma(_648, (*spvDescriptorSet0.vp_c10)._m0[10].x, _668);
    float _684 = fma(_674, (*spvDescriptorSet0.vp_c10)._m0[10].x, _672);
    float _686 = precise::min(_670, 1.0);
    float _688 = fma(_674, (*spvDescriptorSet0.vp_c10)._m0[8].x, _680);
    float _690 = _682 * _604;
    float _692 = fma(_678, (*spvDescriptorSet0.vp_c10)._m0[10].z, _684);
    float _694 = fma(_678, (*spvDescriptorSet0.vp_c10)._m0[8].z, _688);
    float _696 = fma(_692, _686, _582);
    float _698 = fma(_694, _686, _574);
    float _700 = fma(_690, (*spvDescriptorSet0.vp_c10)._m0[10].x, _696);
    float _702 = fma(_690, (*spvDescriptorSet0.vp_c10)._m0[8].x, _698);
    float _704 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _706 = _700 + _704;
    float _708 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _710 = _702 + _708;
    float _712 = _706 * _706;
    float _714 = fma(_710, _710, _712);
    float _716 = _664 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _718 = sqrt(_714);
    float _720 = fma(_674, (*spvDescriptorSet0.vp_c10)._m0[9].x, _716);
    float _722 = fma(_678, (*spvDescriptorSet0.vp_c10)._m0[9].z, _720);
    float _724 = fma(_722, _686, _570);
    float _726 = fma(_690, (*spvDescriptorSet0.vp_c10)._m0[9].x, _724);
    bool _728 = _718 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _730 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _732 = _730 != 0;
    int _734 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _736 = _734 != 0;
    int _738 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _740 = _738 != 0;
    int _742 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _744 = _742 != 0;
    bool _746 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _748 = isnan(0.5);
    bool _750 = _746 || _748;
    bool _752 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _754 = _750 || _752;
    bool _756 = !_736;
    int _758 = _756 ? 0 : 1;
    bool _760 = !_732;
    int _762 = _760 ? 0 : 1;
    bool _764 = !_740;
    int _766 = _764 ? 0 : 1;
    bool _768 = !_744;
    int _770 = _768 ? 0 : 1;
    float _772 = _724;
    float _774 = _678;
    float _776 = _716;
    float _778 = _614;
    if (!_728)
    {
        _772 = _702;
    }
    float _780 = _772;
    float _782 = _780;
    if (!_728)
    {
        _774 = _700;
    }
    float _784 = _774;
    float _786 = _784;
    if (!_728)
    {
        _776 = _726;
    }
    float _788 = _776;
    bool _790 = !_728;
    float _792 = _788;
    if (!_790)
    {
        float _794 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _796 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _798 = _718 + _796;
        float _800 = rsqrt(_714);
        float _802 = _798 * _794;
        float _804 = _726 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _806 = _802 * 0.15915493667125701904296875;
        float _808 = _806 * 6.283185482025146484375;
        float _810 = sin(_808);
        float _812 = _806 * 6.283185482025146484375;
        float _814 = cos(_812);
        float _816 = fma(_810, _804, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _818 = _800 * _816;
        float _820 = _814 + (-1.0);
        float _822 = fma(_710, _818, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _824 = fma(_706, _818, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _826 = _820 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _828 = fma(_726, _814, _826);
        _786 = _824;
        _792 = _828;
        _782 = _822;
    }
    float _830 = _786;
    float _832 = _792;
    float _834 = _782;
    float _836 = -_614;
    float _838 = fma(_836, (*spvDescriptorSet0.vp_c9)._m0[18].w, _830);
    float _840 = -_610;
    float _842 = fma(_840, (*spvDescriptorSet0.vp_c9)._m0[18].w, _832);
    float _844 = -_614;
    float _846 = fma(_844, (*spvDescriptorSet0.vp_c9)._m0[18].w, _582);
    float _848 = -_612;
    float _850 = fma(_848, (*spvDescriptorSet0.vp_c9)._m0[18].w, _834);
    float _852 = -_610;
    float _854 = fma(_852, (*spvDescriptorSet0.vp_c9)._m0[18].w, _570);
    float _856 = _842;
    float _858 = _850;
    float _860 = _832;
    if (_754)
    {
        _778 = _838;
    }
    float _862 = _778;
    float _864 = _862;
    if (!_754)
    {
        float _866 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _868 = _854 + _866;
        float _870 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _872 = _630 + _870;
        float _874 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].y;
        float _876 = -_574;
        float _878 = _876 + _834;
        float _880 = _868 * _868;
        float _882 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _884 = _846 + _882;
        float _886 = -_570;
        float _888 = _886 + _832;
        float _890 = -_582;
        float _892 = _890 + _830;
        float _894 = fma(_872, _872, _880);
        float _896 = 1.0 / _650;
        float _898 = fma(_884, _884, _894);
        float _900 = sqrt(_898);
        float _902 = precise::max(_900, (*spvDescriptorSet0.vp_c9)._m0[199].y);
        float _904 = _902 * _874;
        float _906 = _904 * _896;
        float _908 = fma(_878, _906, _630);
        float _910 = fma(_888, _906, _854);
        float _912 = fma(_892, _906, _846);
        _856 = _910;
        _858 = _908;
        _864 = _912;
    }
    float _914 = _856;
    float _916 = _858;
    float _918 = _864;
    float _920 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _922 = _914 + _920;
    float _924 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _926 = _916 + _924;
    float _928 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _930 = _918 + _928;
    float _932 = _922 * _922;
    float _934 = _914 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _936 = fma(_926, _926, _932);
    float _938 = fma(_930, _930, _936);
    float _940 = rsqrt(_938);
    float _942 = sqrt(_938);
    float _944 = _940 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _946 = _926 * _944;
    float _948 = _930 * _944;
    float _950 = _946 * _946;
    float _952 = _948 * _948;
    float _954 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _956 = fma(_942, (*spvDescriptorSet0.vp_c15)._m0[23].w, _954);
    float _958 = precise::clamp(_956, 0.0, 1.0);
    float _960 = _950 + _952;
    float _962 = sqrt(_960);
    bool _964 = _962 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _966 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _968 = _962 + _966;
    float _970 = _936;
    float _972 = _960;
    float _974 = _968;
    float _976 = _922;
    float _978 = _944;
    if (_964)
    {
        float _980 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _970 = _980;
    }
    float _982 = _970;
    if (_964)
    {
        float _984 = rsqrt(_960);
        _972 = _984;
    }
    float _986 = _972;
    float _988 = _982;
    if (_964)
    {
        float _990 = _968 * _982;
        _974 = _990;
    }
    float _992 = _974;
    if (_964)
    {
        float _994 = _992 * 0.15915493667125701904296875;
        _860 = _994;
    }
    float _996 = _860;
    float _998 = _930;
    if (_964)
    {
        float _1000 = _996 * 6.283185482025146484375;
        float _1002 = sin(_1000);
        _998 = _1002;
    }
    float _1004 = _998;
    float _1006 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1008 = precise::max(0.0, _1006);
    float _1010 = _940;
    float _1012 = _1008;
    if (_964)
    {
        float _1014 = _996 * 6.283185482025146484375;
        float _1016 = cos(_1014);
        _1010 = _1016;
    }
    float _1018 = _1010;
    float _1020 = -_944;
    float _1022 = -_1008;
    float _1024 = fma(_922, _1020, _1022);
    if (_964)
    {
        float _1026 = _1024 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _976 = _1026;
    }
    float _1028 = _976;
    float _1030 = _1004;
    float _1032 = _1028;
    if (_964)
    {
        float _1034 = fma(_1004, _1028, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _978 = _1034;
    }
    float _1036 = _978;
    float _1038 = _1036;
    if (!_964)
    {
        _1030 = _946;
    }
    float _1040 = _1030;
    float _1042 = _1040;
    if (!_964)
    {
        _1032 = _1024;
    }
    float _1044 = _1032;
    float _1046 = _1044;
    float _1048 = _1018;
    if (_964)
    {
        float _1050 = _1018 + (-1.0);
        _1012 = _1050;
    }
    float _1052 = _1012;
    float _1054 = _1052;
    if (_964)
    {
        float _1056 = _986 * _1036;
        _1038 = _1056;
    }
    float _1058 = _1038;
    if (_964)
    {
        float _1060 = _1052 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _988 = _1060;
    }
    float _1062 = _988;
    float _1064 = _1062;
    if (_964)
    {
        float _1066 = _946 * _1058;
        _1042 = _1066;
    }
    float _1068 = _1042;
    if (!_964)
    {
        _1054 = _948;
    }
    float _1070 = _1054;
    float _1072 = _1070;
    if (_964)
    {
        float _1074 = _948 * _1058;
        _1072 = _1074;
    }
    float _1076 = _1072;
    if (_964)
    {
        float _1078 = fma(_1024, _1018, _1062);
        _1046 = _1078;
    }
    float _1080 = _1046;
    if (!_964)
    {
        _1048 = _950;
    }
    float _1082 = _1048;
    float _1084 = _1082;
    if (_964)
    {
        float _1086 = _1068 * _1068;
        _1084 = _1086;
    }
    float _1088 = _1084;
    float _1090 = _914 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    if (!_964)
    {
        _1064 = _952;
    }
    float _1092 = _1064;
    float _1094 = _1092;
    if (_964)
    {
        float _1096 = _1076 * _1076;
        _1094 = _1096;
    }
    float _1098 = _1094;
    float _1100 = fma(_1080, _1080, _1088);
    float _1102 = fma(_916, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1090);
    float _1104 = _914 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1106 = _914 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1108 = _1100 + _1098;
    float _1110 = fma(_918, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1102);
    float _1112 = fma(_916, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1104);
    float _1114 = fma(_916, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1106);
    float _1116 = fma(_916, (*spvDescriptorSet0.vp_c8)._m0[3].x, _934);
    float _1118 = -_958;
    float _1120 = _1118 + 1.0;
    float _1122 = rsqrt(_1108);
    float _1124 = fma(_918, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1112);
    float _1126 = fma(_918, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1116);
    float _1128 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1130 = fma(_918, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1114);
    float _1132 = _1124 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1134 = _1110 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1136 = _1126 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1138 = abs(_1120);
    float _1140 = log2(_1138);
    float _1142 = _1132 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1144 = _1130 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1146 = fma(_1134, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1142);
    float _1148 = _1144 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1150 = _1122 * _1068;
    float _1152 = _1122 * _1080;
    float _1154 = _1122 * _1076;
    float _1156 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1146);
    float _1158 = _1150 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1160 = -_1148;
    float _1162 = fma(_1160, _1128, 1.0);
    float _1164 = fma(_1136, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1156);
    float _1166 = -_1158;
    float _1168 = fma(_1152, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1166);
    float _1170 = _1140 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1172 = _1132 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1174 = log2(_1162);
    float _1176 = -_1154;
    float _1178 = fma(_1176, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1168);
    float _1180 = _1132 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1182 = fma(_1134, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1172);
    float _1184 = _1152 + 1.0;
    float _1186 = fma(_1178, -0.5, 0.5);
    float _1188 = fma(_1178, 0.5, 0.5);
    float _1190 = fma(_1134, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1180);
    float _1192 = 1.0 / _1164;
    float _1194 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1182);
    float _1196 = fma(_1188, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1198 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1190);
    float _1200 = fma(_1136, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1194);
    float _1202 = fma(_1188, _1196, -0.212114393711090087890625);
    float _1204 = fma(_1136, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1198);
    float _1206 = exp2(_1170);
    float _1208 = _1174 * 0.693147182464599609375;
    float _1210 = fma(_1188, _1202, 1.570728778839111328125);
    float _1212 = _1208 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1214 = sqrt(_1186);
    float _1216 = _1204 * _1192;
    float _1218 = _1200 * _1192;
    float _1220 = fma(_1216, 0.5, 0.5);
    float _1222 = fma(_1218, -0.5, 0.5);
    float _1224 = -_1152;
    float _1226 = fma(_1206, _1184, _1224);
    float _1228 = fma(_1226, 0.5, 0.5);
    float _1230 = _1214 * 0.636619746685028076171875;
    float _1232 = -_1210;
    float _1234 = fma(_1230, _1232, 1.0);
    float3 _4031 = float3(_1220, _1222, _1212);
    float _1236 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4031, float3(0.0), isnan(_4031)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4031, float3(0.0), isnan(_4031)), level(0.0)).x;
    float3 _4042 = float3(_1220, _1222, _1212);
    float4 _1239 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4042, float3(0.0), isnan(_4042)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4042, float3(0.0), isnan(_4042)), level(0.0)).xyzw;
    float _1241 = _1239.x;
    float _1243 = _1239.y;
    float _1245 = _1239.z;
    float _1247 = _1239.w;
    float2 _4059 = float2(_1234, _1228);
    float3 _1251 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4059, float2(0.0), isnan(_4059)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4059, float2(0.0), isnan(_4059)), level(0.0)).xyz;
    float _1253 = _1251.x;
    float _1255 = _1251.y;
    float _1257 = _1251.z;
    float _1259 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1261 = int(_1259);
    int _1263 = abs(_758);
    out.m_56.x = _504;
    out.m_56.y = _506;
    out.m_56.z = _510;
    out.m_56.w = _502;
    bool _1265 = _141 > 0.5;
    float _1267 = _1140 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1269 = _1132 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_58.y = _914;
    float _1271 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1273 = int(_1271);
    float _1275 = fma(_1134, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1269);
    float _1277 = in.m_49.y;
    float _1279 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1275);
    float _1281 = float(_1261);
    float _1283 = 1.0 / _542;
    float _1285 = -_191;
    int _1287 = _1265 ? as_type<int>(_1285) : as_type<int>(_191);
    float _1289 = fma(_1136, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1279);
    float _1291 = float(uint(_1273));
    float _1293 = 1.0 / _1281;
    int _1295 = ~_1273;
    int _1297 = _1295 + 1;
    int _1299 = _1273 + (-1);
    int _1301 = ~_1273;
    int _1303 = _1301 + 1;
    float _1305 = 1.0 / _1291;
    float _1307 = _1277 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1309 = _121 * _1293;
    int _1311 = ~_1273;
    int _1313 = _1311 + 1;
    float _1315 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1317 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1319 = _1317 != 0;
    int _1321 = as_type<int>(_1305) + (-2);
    float _1323 = trunc(_1309);
    int _1325 = int(_1323);
    bool _1327 = !_1319;
    float _1329 = _1327 ? _1277 : _141;
    float _1331 = exp2(_1267);
    float _1333 = float(uint(_1325));
    float _1335 = as_type<float>(_1321) * _1333;
    float _1337 = -_1331;
    float _1339 = _1337 + 1.0;
    float _1341 = trunc(_1335);
    float _1343 = precise::max(_1341, 0.0);
    uint _1345 = uint(_1343);
    float _1347 = _1339 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1349 = float(_1273);
    int _1351 = _1313 * int(_1345);
    int _1353 = _1351 + _1325;
    float _1355 = float(uint(_1353));
    float _1357 = as_type<float>(_1321) * _1355;
    bool _1359 = !_1319;
    float _1361 = _1359 ? 1.2345600128173828125 : 1.0;
    float _1363 = trunc(_1357);
    float _1365 = precise::max(_1363, 0.0);
    uint _1367 = uint(_1365);
    float _1369 = _1361 * _1329;
    float _1371 = floor(_1369);
    int _1373 = int(_1345) + int(_1367);
    float _1375 = float(_1325);
    int _1377 = _1297 * _1373;
    int _1379 = _1377 + _1325;
    bool _1381 = _1375 >= _1349;
    bool _1383 = isnan(_1375);
    bool _1385 = _1381 || _1383;
    bool _1387 = isnan(_1349);
    bool _1389 = _1385 || _1387;
    float _1391 = float(_1389);
    float _1393 = -_1371;
    float _1395 = _1369 + _1393;
    bool _1397 = uint(_1379) >= uint(_1273);
    float _1399 = trunc(_1391);
    int _1401 = int(_1399);
    float _1403 = _1395 * _1349;
    float _1405 = _121 * _1349;
    bool _1407 = !_1397;
    int _1409 = _1407 ? 0 : (-1);
    bool _1411 = _1273 == 0;
    float _1413 = _1405 * _1283;
    int _1415 = ~_1373;
    int _1417 = _1415 + _1409;
    int _1419 = _1417 + 1;
    float _1421 = trunc(_1403);
    int _1423 = int(_1421);
    int _1425 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1427 = _1425 != 0;
    int _1429 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1431 = _1429 != 0;
    int _1433 = _1273 * _1419;
    int _1435 = _1433 + _1325;
    bool _1437 = !_1427;
    int _1439 = _1437 ? 0 : 1;
    bool _1441 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1443 = isnan(0.5);
    bool _1445 = _1441 || _1443;
    bool _1447 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1449 = _1445 || _1447;
    float _1451 = trunc(_1413);
    int _1453 = int(_1451);
    int _1455 = ~_1401;
    int _1457 = _1455 + 1;
    int _1459 = _1457 + 1;
    bool _1461 = !_1411;
    int _1463 = _1461 ? _1435 : (-1);
    int _1465 = abs(_1439);
    int _1467 = _1463 * _1459;
    int _1469 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1471 = _1469 != 0;
    int _1473 = _1401 * _1299;
    int _1475 = _1473 + _1467;
    int _1477 = abs(_762);
    float _1479 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1481 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1483 = in.m_49.w;
    int _1485 = abs(_766);
    int _1487 = _1475 * _1263;
    int _1489 = _1423 * _1465;
    int _1491 = _1489 + _1325;
    int _1493 = abs(_770);
    float _1495 = _141 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1497 = _1453 * _1477;
    int _1499 = _1497 + _1487;
    float _1501 = -_1479;
    float _1503 = fma(_1495, 2.0, _1501);
    float _1505 = in.m_49.z;
    int _1507 = _1491 * _1485;
    int _1509 = _1507 + _1499;
    float _1511 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1513 = _1423 * _1493;
    int _1515 = _1513 + _1509;
    float _1517 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1519 = _1517 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1521 = float(uint(_1515));
    float _1523 = 1.0 / _1519;
    float _1525 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1527 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1525;
    bool _1529 = _1483 > 0.5;
    float _1531 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1533 = as_type<float>(_1321) * _1521;
    float _1535 = float(uint(_1491));
    float _1537 = _1519;
    float _1539 = (*spvDescriptorSet0.vp_c9)._m0[78].w;
    if (!_1319)
    {
        _1537 = _1277;
    }
    float _1541 = _1537;
    float _1543 = trunc(_1533);
    float _1545 = precise::max(_1543, 0.0);
    uint _1547 = uint(_1545);
    float _1549 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1551 = _1541;
    if (_1319)
    {
        _1551 = _141;
    }
    float _1553 = _1551;
    bool _1555 = _1505 > 0.5;
    float _1557 = fma(_1307, -2.0, _1549);
    float _1559 = _1527 * _1523;
    float _1561 = -_191;
    int _1563 = _1555 ? as_type<int>(_1561) : as_type<int>(_191);
    int _1565 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1567 = _1565 != 0;
    bool _1569 = !_1431;
    float _1571 = _1569 ? _191 : as_type<float>(_1563);
    int _1573 = ~_1273;
    int _1575 = _1573 + 1;
    int _1577 = _1303 * int(_1547);
    int _1579 = _1577 + _1515;
    float _1581 = float(uint(_1579));
    bool _1583 = !_1471;
    float _1585 = _1583 ? _191 : as_type<float>(_1287);
    float _1587 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1589 = _1277 > 0.5;
    float _1591 = as_type<float>(_1321) * _1581;
    if (!_1319)
    {
        _197 = _1505;
    }
    float _1593 = _197;
    float _1595 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1531);
    float _1597 = _1593;
    if (!_1319)
    {
        _1539 = _1505;
    }
    float _1599 = _1539;
    float _1601 = trunc(_1591);
    float _1603 = precise::max(_1601, 0.0);
    uint _1605 = uint(_1603);
    float _1607 = fma(_1277, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1587);
    float _1609 = _1599;
    if (_1319)
    {
        _1597 = _1277;
    }
    float _1611 = _1597;
    float _1613 = _1585 + 0.5;
    if (_1319)
    {
        _1609 = _1277;
    }
    float _1615 = _1609;
    float _1617 = _1511 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _1619 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1621 = _1619 != 0;
    float _1623 = -_121;
    float _1625 = fma(_1623, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1503);
    float _1627 = -_211;
    int _1629 = _1589 ? as_type<int>(_1627) : as_type<int>(_211);
    float _1631 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1633 = _544 + _1631;
    float _1635 = -_211;
    int _1637 = _1529 ? as_type<int>(_1635) : as_type<int>(_211);
    float _1639 = fma(_1615, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1481);
    bool _1641 = !_1621;
    float _1643 = _1641 ? _211 : as_type<float>(_1629);
    float _1645 = fma(_1559, _1633, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _1647 = !_1567;
    float _1649 = _1647 ? _211 : as_type<float>(_1637);
    float _1651 = fma(_1617, _1613, _1625);
    float _1653 = as_type<float>(_1321) * _1535;
    int _1655 = int(_1547) + int(_1605);
    float _1657 = _1643 + (-0.5);
    bool _1659 = _544 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1661 = isnan(_544);
    bool _1663 = _1659 || _1661;
    bool _1665 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1667 = _1663 || _1665;
    float _1669 = float(_1667);
    float _1671 = _1611 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1673 = trunc(_1653);
    float _1675 = precise::max(_1673, 0.0);
    uint _1677 = uint(_1675);
    bool _1679 = _544 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1681 = isnan(_544);
    bool _1683 = _1679 || _1681;
    bool _1685 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1687 = _1683 || _1685;
    float _1689 = float(_1687);
    float _1691 = _1315 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1693 = -_1669;
    float _1695 = _1693 + 1.0;
    float _1697 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1699 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1557);
    int _1701 = _1575 * _1655;
    int _1703 = _1701 + _1515;
    float _1705 = _1689 * _1695;
    float _1707 = fma(_1553, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1697);
    float _1709 = -_1691;
    float _1711 = -_1699;
    float _1713 = fma(_1709, _1657, _1711);
    float _1715 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1717 = _1553 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1719 = _1645 * _1705;
    bool _1721 = uint(_1703) >= uint(_1273);
    float _1723 = -_1715;
    float _1725 = fma(_1717, 2.0, _1723);
    int _1727 = ~_1273;
    int _1729 = _1727 + 1;
    float _1731 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _1733 = !_1721;
    int _1735 = _1733 ? 0 : (-1);
    float _1737 = _854 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1739 = _854 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1741 = fma(_1671, -2.0, _1731);
    int _1743 = ~_1655;
    int _1745 = _1743 + _1735;
    int _1747 = _1745 + 1;
    int _1749 = _1729 * int(_1677);
    int _1751 = _1749 + _1491;
    float _1753 = fma(_630, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1737);
    float _1755 = fma(_630, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1739);
    float _1757 = -_1689;
    float _1759 = _1757 + 1.0;
    int _1761 = _1273 * _1747;
    int _1763 = _1761 + _1515;
    float _1765 = float(uint(_1751));
    float _1767 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1753);
    float _1769 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1755);
    float _1771 = -_121;
    float _1773 = fma(_1771, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1725);
    bool _1775 = !_1411;
    int _1777 = _1775 ? _1763 : (-1);
    float _1779 = as_type<float>(_1321) * _1765;
    float _1781 = _1767 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1783 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1595);
    int _1785 = _1777 >> 31;
    float _1787 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1607);
    float _1789 = 1.0 / _1781;
    float _1791 = -_1783;
    float _1793 = _1791 + 1.0;
    int _1795 = _1785 & 3;
    float _1797 = _1571 + 0.5;
    int _1799 = _1777 & 3;
    bool _1801 = _1799 != 0;
    float _1803 = -_1793;
    float _1805 = fma(_1585, _1803, _1651);
    int _1807 = _1777 + _1795;
    float _1809 = _1769 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1811 = trunc(_1779);
    float _1813 = precise::max(_1811, 0.0);
    uint _1815 = uint(_1813);
    float _1817 = fma(_1797, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1773);
    int _1819 = _1807 >> 2;
    float _1821 = _1809 + _1781;
    float _1823 = as_type<float>(_1807);
    float _1825 = _1793;
    float _1827 = _1713;
    float _1829 = as_type<float>(_1747);
    float _1831 = _1669;
    if (!_1449)
    {
        _1823 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _1833 = _1823;
    float _1835 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1707);
    int _1837 = _1819 << 4;
    int _1839 = _1837 + 512;
    float _1841 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1639);
    float _1843 = _1821 * _1789;
    float _1845 = _1843 * 0.5;
    int _1847 = _1777 & 3;
    bool _1849 = _1847 != 0;
    float _1851 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1741);
    int _1853 = ~_1273;
    int _1855 = _1853 + 1;
    float _1857 = _1833;
    if (!_1449)
    {
        float _1859 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1861 = fma(_1845, _1833, _1859);
        _1857 = _1861;
    }
    float _1863 = _1857;
    bool _1865 = uint(_1847) > 1u;
    int _1867 = _1839 + 8;
    uint _1869 = uint(int(uint(_1867) >> uint(2)));
    uint _1871 = uint(int(uint(int(_1869)) >> uint(2)));
    int _1873 = int(_1869) & 3;
    float _1875 = (*spvDescriptorSet0.vp_c9)._m0[int(_1871)][_1873];
    int _1877 = int(_1869) + 1;
    uint _1879 = uint(int(uint(_1877) >> uint(2)));
    int _1881 = _1877 & 3;
    float _1883 = (*spvDescriptorSet0.vp_c9)._m0[int(_1879)][_1881];
    float _1885 = _1649 + (-0.5);
    int _1887 = int(_1677) + int(_1815);
    float _1889 = -_1841;
    float _1891 = _1889 + 1.0;
    int _1893 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1895 = _1893 != 0;
    float _1897 = -_1885;
    float _1899 = -_1851;
    float _1901 = fma(_1897, (*spvDescriptorSet0.vp_c9)._m0[85].y, _1899);
    int _1903 = _1801 ? 0 : 1;
    int _1905 = _1855 * _1887;
    int _1907 = _1905 + _1491;
    uint _1909 = uint(int(uint(_1839) >> uint(2)));
    uint _1911 = uint(int(uint(int(_1909)) >> uint(2)));
    int _1913 = int(_1909) & 3;
    float _1915 = (*spvDescriptorSet0.vp_c9)._m0[int(_1911)][_1913];
    int _1917 = int(_1909) + 1;
    uint _1919 = uint(int(uint(_1917) >> uint(2)));
    int _1921 = _1917 & 3;
    float _1923 = (*spvDescriptorSet0.vp_c9)._m0[int(_1919)][_1921];
    float _1925 = fma(_1649, _1891, _1901);
    float _1927 = -_1787;
    float _1929 = _1927 + 1.0;
    if (!_1449)
    {
        _1825 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _1931 = _1825;
    float _1933 = -_1835;
    float _1935 = _1933 + 1.0;
    bool _1937 = uint(_1907) >= uint(_1273);
    float _1939 = fma(_1643, _1929, _1713);
    int _1941 = ~_1903;
    int _1943 = _1941 + 1;
    int _1945 = _1943 + 1;
    int _1947 = _1945;
    if (!_1449)
    {
        float _1949 = -_1931;
        float _1951 = _1949 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _1827 = _1951;
    }
    float _1953 = _1827;
    bool _1955 = !_1937;
    int _1957 = _1955 ? 0 : (-1);
    float _1959 = -_1935;
    float _1961 = fma(_1571, _1959, _1817);
    if (!_1865)
    {
        int _1963 = ~_1903;
        int _1965 = _1963 + 1;
        _1947 = _1965;
    }
    int _1967 = _1947;
    if (!_1449)
    {
        float _1969 = 1.0 / _1953;
        _1829 = _1969;
    }
    float _1971 = _1829;
    bool _1973 = _1847 != 3;
    float _1975 = fma(_1759, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1719);
    int _1977 = ~_1887;
    int _1979 = _1977 + _1957;
    int _1981 = _1979 + 1;
    out.m_60.x = _1805;
    out.m_60.y = _1939;
    out.m_60.z = _1961;
    out.m_60.w = _1925;
    int _1983 = abs(_1967);
    float _1985 = fma(_1669, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1975);
    bool _1987 = uint(_1847) >= 2u;
    int _1989 = _1273 * _1981;
    int _1991 = _1989 + _1491;
    bool _1993 = !_1849;
    int _1995 = _1993 ? 0 : 1;
    float _1997 = _1863;
    if (!_1449)
    {
        float _1999 = 1.0 / _1863;
        _1997 = _1999;
    }
    float _2001 = _1997;
    float _2003 = _1347 * _1236;
    int _2005 = _1987 ? 0 : 1;
    float _2007 = -_1347;
    float _2009 = _2007 + 1.0;
    int _2011 = ~_1983;
    int _2013 = _2011 + 1;
    int _2015 = _2013 + 1;
    float _2017 = _1985 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _2019 = _1847 != 3;
    int _2021 = abs(_1995);
    int _2023 = ~_2005;
    int _2025 = _2023 + 1;
    int _2027 = _2025 + 1;
    int _2029 = _2027;
    if (!_1449)
    {
        float _2031 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2033 = -_1931;
        float _2035 = fma(_2001, _2031, _2033);
        _1831 = _2035;
    }
    float _2037 = _1831;
    float _2039 = _2037;
    if (_1973)
    {
        int _2041 = ~_2005;
        int _2043 = _2041 + 1;
        _2029 = _2043;
    }
    int _2045 = _2029;
    float _2047 = _1257 * _2003;
    int _2049 = ~_2021;
    int _2051 = _2049 + 1;
    int _2053 = _2051 + 1;
    if (!_1449)
    {
        float _2055 = _2037 * _1971;
        float _2057 = precise::clamp(_2055, 0.0, 1.0);
        _2039 = _2057;
    }
    float _2059 = _2039;
    int _2061 = abs(_2045);
    float _2063 = fma(_1247, _2047, _1245);
    bool _2065 = !_2019;
    float _2067 = _2065 ? 0.0 : as_type<float>(0xffffffffu /* nan */);
    out.m_62.w = _2017;
    int _2069 = _2015 * as_type<int>(_1923);
    int _2071 = abs(as_type<int>(_2067));
    float _2073 = _2067;
    if (_1449)
    {
        _2073 = 1.0;
    }
    float _2075 = _2073;
    int _2077 = _2053 * as_type<int>(_1915);
    int _2079 = _2077 + _2069;
    bool _2081 = !_1895;
    int _2083 = _2081 ? 0 : 1;
    float _2085 = _2075;
    if (!_1449)
    {
        float _2087 = -_2059;
        float _2089 = _2087 + 1.0;
        _2085 = _2089;
    }
    float _2091 = _2085;
    int _2093 = ~_2061;
    int _2095 = _2093 + 1;
    int _2097 = _2095 + 1;
    int _2099 = abs(_2083);
    float _2101 = _2091 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    int _2103 = _2097 * as_type<int>(_1875);
    int _2105 = _2103 + _2079;
    int _2107 = ~_2099;
    int _2109 = _2107 + 1;
    int _2111 = _2109 + 1;
    float _2113 = _381 * _2101;
    int _2115 = ~_2071;
    int _2117 = _2115 + 1;
    int _2119 = _2117 + 1;
    float _2121 = _2113 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2123 = _1247 * _2003;
    int _2125 = _2119 * as_type<int>(_1883);
    int _2127 = _2125 + _2105;
    bool _2129 = !_1411;
    int _2131 = _2129 ? _1991 : (-1);
    float _2133 = _1247 * _2009;
    bool _2135 = _2091 > 0.0;
    bool _2137 = isnan(_2091);
    bool _2139 = _2135 || _2137;
    bool _2141 = isnan(0.0);
    bool _2143 = _2139 || _2141;
    int _2145 = _2127 * _2111;
    float _2147 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _2149 = _1289 + _2147;
    float _2151 = fma(_1253, _2123, _1241);
    int _2153 = _2131 * _2099;
    int _2155 = _2153 + _2145;
    float _2157 = _1164 + _2149;
    out.gl_Position.x = _1204;
    out.gl_Position.y = _1200;
    out.gl_Position.z = _2149;
    out.gl_Position.w = _1164;
    float _2159 = fma(_1255, _2123, _1243);
    float _2161 = _2157 * 0.5;
    float _2163 = float(_2155);
    out.m_45.x = _2121;
    out.m_64.z = _2161;
    out.m_64.w = _1164;
    out.m_66.y = _2163;
    out.m_68.x = _2151;
    out.m_68.y = _2159;
    out.m_68.z = _2063;
    out.m_68.w = _2133;
    if (_2143)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _2165 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2165;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}


#pragma clang diagnostic ignored "-Wmissing-prototypes"

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
    uint4 _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float4 _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    constant _16* vp_c8 [[id(1)]];
    constant _16* vp_c10 [[id(2)]];
    constant _16* vp_c9 [[id(3)]];
    constant _16* vp_c15 [[id(4)]];
    constant _16* vp_c16 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    texture2d<float> vp_t_tcb_C [[id(7)]];
    sampler vp_t_tcb_CSmplr [[id(8)]];
    texture3d<float> vp_t_tcb_32 [[id(9)]];
    sampler vp_t_tcb_32Smplr [[id(10)]];
    texture3d<float> vp_t_tcb_30 [[id(11)]];
    sampler vp_t_tcb_30Smplr [[id(12)]];
    texture2d<float> vp_t_tcb_1C [[id(13)]];
    sampler vp_t_tcb_1CSmplr [[id(14)]];
    sampler vp_t_tcb_32Smplr_w [[id(15)]];
    sampler vp_t_tcb_30Smplr_w [[id(16)]];
    sampler vp_t_tcb_1CSmplr_w [[id(17)]];
    constant dm_border_t* dm_border [[id(18)]];
};

struct main0_out
{
    float4 m_55 [[user(locn0)]];
    float4 m_61 [[user(locn1)]];
    float4 m_65 [[user(locn2)]];
    float4 m_69 [[user(locn3)]];
    float4 m_49 [[user(locn4)]];
    float4 m_67 [[user(locn5)]];
    float4 m_63 [[user(locn7)]];
    float4 m_71 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_46 [[attribute(2)]];
    float4 m_51 [[attribute(3)]];
    float4 m_57 [[attribute(5)]];
    float4 m_53 [[attribute(6)]];
    float4 m_59 [[attribute(7)]];
};

static inline __attribute__((always_inline))
int _86(thread const int& _4494, thread const int& _4495, constant _10& support_buffer)
{
    float _4498 = as_type<float>(support_buffer._m4);
    int _4500 = _4495 + as_type<int>(_4498);
    int _4502 = 1 + _4500;
    float _4504 = support_buffer._m5[_4502].x;
    float _4506 = abs(_4504);
    bool _4508 = _4506 == 1.0;
    if (_4508)
    {
        return _4494;
    }
    float _4510 = float(_4494);
    float _4512 = _4510 / _4506;
    int _4514 = int(_4512);
    return _4514;
}

static inline __attribute__((always_inline))
int _87(thread const int& _4544, thread const int& _4545, constant _10& support_buffer)
{
    float _4548 = as_type<float>(support_buffer._m4);
    int _4550 = _4545 + as_type<int>(_4548);
    int _4552 = 1 + _4550;
    float _4554 = support_buffer._m5[_4552].x;
    bool _4556 = _4554 == 1.0;
    if (_4556)
    {
        return _4544;
    }
    float _4558 = float(_4544);
    float _4560 = _4558 * _4554;
    int _4562 = int(_4560);
    return _4562;
}

static inline __attribute__((always_inline))
void _84(thread int& _4491, thread float4& gl_Position, thread float& gl_PointSize)
{
    gl_PointSize = 1.0;
    _4491 = 0;
}

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1173 = false;
    bool _311 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _91 = in.m_46.w;
    float _93 = trunc(_91);
    int _95 = int(_93);
    bool _99 = _95 >= 1;
    float _101 = 0.0;
    float _103 = as_type<float>(_95);
    if (!_99)
    {
        _101 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _105 = _101;
    if (!_99)
    {
        out.m_49.x = 0.0;
    }
    int _107 = 0;
    if (!_99)
    {
        float _109 = _105 * 5.0;
        _107 = as_type<int>(_109);
    }
    int _111 = _107;
    int _113 = _111;
    if (!_99)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1805 = as_type<float>(_111);
        out.gl_Position.z = _1805;
    }
    if (!_99)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _115 = in.m_51.w;
    float _117 = float(_95);
    float _119 = -_115;
    float _121 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _123 = _115 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _125 = isnan(_115);
    bool _127 = _123 || _125;
    bool _129 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _131 = _127 || _129;
    bool _133 = _121 >= _117;
    bool _135 = !_131;
    bool _137 = _133 || _135;
    float _139 = _121;
    if (_137)
    {
        _103 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _141 = _103;
    if (_137)
    {
        out.m_49.x = 0.0;
    }
    if (_137)
    {
        float _143 = _141 * 5.0;
        _113 = as_type<int>(_143);
    }
    int _145 = _113;
    if (_137)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1869 = as_type<float>(_145);
        out.gl_Position.z = _1869;
    }
    if (_137)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _147 = in.m_53.w;
    float _149 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _151 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _153 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _155 = _151 || _153;
    bool _157 = isnan(1.0);
    bool _159 = _155 || _157;
    float _161 = in.m_51.x;
    float _163 = in.m_51.y;
    float _165 = in.m_51.z;
    float _167 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _169 = in.m_46.x;
    float _171 = in.m_46.y;
    float _173 = in.m_46.z;
    float _175 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _177 = _167 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _179 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _181 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _183 = _175 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _185 = 0.0;
    float _187 = _149;
    if (!_159)
    {
        float _189 = _149 * _149;
        float _191 = _189 * 0.5;
        _185 = _191;
    }
    float _193 = _185;
    float _195 = _179 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _197 = _193;
    if (!_159)
    {
        float _199 = _193 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _197 = _199;
    }
    float _201 = _197;
    bool _203 = !_159;
    float _205 = _201;
    if (!_203)
    {
        float _207 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _209 = log2(_207);
        float _211 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _213 = _211 + 1.0;
        float _215 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _217 = _149 * _209;
        float _219 = 1.0 / _213;
        float _221 = _215 * 0.693147182464599609375;
        float _223 = exp2(_217);
        float _225 = 1.0 / _221;
        float _227 = _223 + (-1.0);
        float _229 = -_227;
        float _231 = fma(_229, _225, _149);
        float _233 = _231 * _219;
        float _235 = _233 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _205 = _235;
    }
    float _237 = _205;
    bool _239 = !_159;
    if (!_239)
    {
        float _241 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _243 = log2(_241);
        float _245 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _247 = _245 + 1.0;
        float _249 = 1.0 / _247;
        float _251 = _149 * _243;
        float _253 = exp2(_251);
        float _255 = -_253;
        float _257 = _255 + 1.0;
        float _259 = _257 * _249;
        _187 = _259;
    }
    float _261 = _187;
    out.m_55.x = _177;
    out.m_55.y = _183;
    out.m_55.z = _195;
    out.m_55.w = _181;
    float _263 = 1.0 / _117;
    bool _265 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _267 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _269 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _271 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _273 = fma(_261, _161, _267);
    float _275 = fma(_261, _163, _269);
    float _277 = fma(_261, _165, _271);
    float _279 = fma(_273, _147, _169);
    float _281 = fma(_275, _147, _171);
    float _283 = fma(_277, _147, _173);
    float _285 = _121 * _263;
    bool _287 = !_265;
    float _289 = _283;
    float _291 = _279;
    float _309;
    if (!_287)
    {
        float _293 = in.m_57.x;
        float _295 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _297 = _293 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _299 = fma(_297, (*spvDescriptorSet0.vp_c9)._m0[11].w, _121);
        float _301 = _299 * _295;
        float _303 = floor(_301);
        float _305 = -_303;
        float _307 = _301 + _305;
        _309 = _307;
        _311 = true;
    }
    else
    {
        _309 = _285;
    }
    _311 = false;
    float _313 = _309;
    int _315 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _317 = _315;
    int _319 = 0;
    int _321 = _86(_317, _319, (*spvDescriptorSet0.support_buffer));
    float _323 = in.m_59.z;
    float _325 = 0.0 + _285;
    float _327 = precise::clamp(_325, 0.0, 1.0);
    float _329 = trunc(_323);
    int _331 = int(_329);
    int _333 = _321 + (-1);
    float _335 = float(_333);
    float _337 = _327 * _335;
    float _339 = trunc(_337);
    int _341 = int(_339);
    int _343 = _341;
    int _345 = 0;
    int _347 = _87(_343, _345, (*spvDescriptorSet0.support_buffer));
    int _349 = _331;
    int _351 = 0;
    int _353 = _87(_349, _351, (*spvDescriptorSet0.support_buffer));
    float4 _356 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_347, _353)), 0).xyzw;
    float _358 = _356.x;
    float _360 = _356.y;
    float _362 = _356.z;
    float _364 = _356.w;
    float _366 = in.m_57.x;
    float _368 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _370 = in.m_59.y;
    float _372 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _374 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _376 = _374 != 0;
    float _378 = in.m_57.y;
    int _380 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _382 = _380 != 0;
    float _384 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _386 = in.m_57.z;
    int _388 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _390 = _388 != 0;
    int _392 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _394 = _392 != 0;
    float _396 = in.m_57.w;
    int _398 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _400 = _398 != 0;
    float _402 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _404 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _406 = _404 != 0;
    float _408 = in.m_59.x;
    float _410 = _366 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _412 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[78].z, _402);
    float _414 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _416 = -_372;
    float _418 = fma(_410, 2.0, _416);
    float _420 = -_370;
    float _422 = _420 + 1.0;
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _426 = _424 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _428 = _378 > 0.5;
    bool _430 = _428 && _382;
    float _432 = _378 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _436 = _434 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _438 = fma(_378, (*spvDescriptorSet0.vp_c9)._m0[78].w, _414);
    bool _440 = _386 > 0.5;
    float _442 = 1.0 / _436;
    float _444 = _430 ? _422 : _370;
    float _446 = fma(_432, -2.0, _384);
    bool _448 = _430;
    float _450 = _446;
    int _452 = as_type<int>(_313);
    float _454 = _370;
    if (_376)
    {
        bool _456 = _366 > 0.5;
        _448 = _456;
    }
    bool _458 = _448;
    float _460 = -_121;
    float _462 = fma(_460, (*spvDescriptorSet0.vp_c9)._m0[76].x, _418);
    int _464 = _440 ? as_type<int>(_422) : as_type<int>(_370);
    float _466 = 1.0 / _426;
    bool _468 = _396 > 0.5;
    bool _470 = _468 && _406;
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _474 = _472 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _476 = _400 ? as_type<float>(_464) : _370;
    bool _478 = _378 > 0.5;
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _482 = _480 + (*spvDescriptorSet0.vp_c9)._m0[135].w;
    float _484 = 1.0 / _474;
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _488 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _486;
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _492 = _490 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _494 = _488 * _442;
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[135].w;
    float _498 = _496 + (*spvDescriptorSet0.vp_c9)._m0[136].w;
    bool _500 = _313 >= (*spvDescriptorSet0.vp_c9)._m0[136].w;
    bool _502 = isnan(_313);
    bool _504 = _500 || _502;
    bool _506 = isnan((*spvDescriptorSet0.vp_c9)._m0[136].w);
    bool _508 = _504 || _506;
    float _510 = float(_508);
    float _512 = 1.0 / _482;
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _516 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _514;
    bool _518 = _313 >= (*spvDescriptorSet0.vp_c9)._m0[135].w;
    bool _520 = isnan(_313);
    bool _522 = _518 || _520;
    bool _524 = isnan((*spvDescriptorSet0.vp_c9)._m0[135].w);
    bool _526 = _522 || _524;
    float _528 = float(_526);
    float _530 = _492 * _466;
    float _532 = -_510;
    float _534 = _532 + 1.0;
    bool _536 = _313 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _538 = isnan(_313);
    bool _540 = _536 || _538;
    bool _542 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _544 = _540 || _542;
    float _546 = float(_544);
    float _548 = -(*spvDescriptorSet0.vp_c9)._m0[134].x;
    float _550 = _548 + (*spvDescriptorSet0.vp_c9)._m0[135].x;
    float _552 = _470 ? _422 : _370;
    float _554 = 1.0 / _498;
    float _556 = _516 * _484;
    bool _558 = _313 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _560 = isnan(_313);
    bool _562 = _558 || _560;
    bool _564 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _566 = _562 || _564;
    float _568 = float(_566);
    float _570 = -_528;
    float _572 = _570 + 1.0;
    float _574 = _528 * _534;
    float _576 = -_546;
    float _578 = _576 + 1.0;
    float _580 = _476 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _582 = _568 * _572;
    float _584 = -_568;
    float _586 = _584 + 1.0;
    float _588 = -(*spvDescriptorSet0.vp_c9)._m0[135].x;
    float _590 = (*spvDescriptorSet0.vp_c9)._m0[136].x + _588;
    bool _592 = _313 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _594 = isnan(_313);
    bool _596 = _592 || _594;
    bool _598 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _600 = _596 || _598;
    float _602 = float(_600);
    float _604 = _550 * _512;
    bool _606 = _313 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _608 = isnan(_313);
    bool _610 = _606 || _608;
    bool _612 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _614 = _610 || _612;
    float _616 = float(_614);
    float _618 = _546 * _586;
    float _620 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _622 = _313 + _620;
    float _624 = _602 * _578;
    float _626 = _590 * _554;
    float _628 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _630 = _313 + _628;
    float _632 = -_602;
    float _634 = _632 + 1.0;
    float _636 = fma(_530, _622, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _638 = -(*spvDescriptorSet0.vp_c9)._m0[135].w;
    float _640 = _313 + _638;
    float _642 = fma(_494, _630, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _644 = _616 * _634;
    float _646 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].z, _412);
    float _648 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[76].y, _446);
    float _650 = -_616;
    float _652 = _650 + 1.0;
    float _654 = _642 * _644;
    int _656 = as_type<int>(_582);
    if (!_376)
    {
        _450 = _408;
    }
    float _658 = _450;
    float _660 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].w, _438);
    float _662 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _664 = _313 + _662;
    float _666 = fma(_652, (*spvDescriptorSet0.vp_c9)._m0[131].x, _654);
    float _668 = _658;
    if (!_376)
    {
        _139 = _658;
    }
    float _670 = _139;
    float _672 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _674 = _670;
    if (_376)
    {
        _668 = _408;
    }
    float _676 = _668;
    float _678 = fma(_556, _664, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _680 = fma(_636, _624, _666);
    float _682 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _684 = _313 + _682;
    float _686 = fma(_626, _640, (*spvDescriptorSet0.vp_c9)._m0[135].x);
    float _688 = _676;
    if (_376)
    {
        float _690 = -_676;
        float _692 = _690 + 1.0;
        _452 = as_type<int>(_692);
    }
    int _694 = _452;
    float _696 = fma(_678, _618, _680);
    float _698 = fma(_604, _684, (*spvDescriptorSet0.vp_c9)._m0[134].x);
    if (!_394)
    {
        _454 = _676;
    }
    float _700 = _454;
    float _702 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _704 = _700;
    if (_376)
    {
        float _706 = _458 ? as_type<float>(_694) : _676;
        _674 = _706;
    }
    float _708 = _674;
    float _710 = fma(_698, _582, _696);
    float _712 = _368 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (_394)
    {
        float _714 = -_676;
        float _716 = _714 + 1.0;
        _656 = as_type<int>(_716);
    }
    int _718 = _656;
    float _720 = _672 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _722 = fma(_712, _444, -0.5);
    float _724 = fma(_686, _574, _710);
    if (_394)
    {
        float _726 = _478 ? as_type<float>(_718) : _676;
        _704 = _726;
    }
    float _728 = _704;
    float _730 = fma(_720, _708, -0.5);
    float _732 = -_648;
    float _734 = fma(_660, _722, _732);
    int _736 = _341 + 1;
    float _738 = fma(_510, (*spvDescriptorSet0.vp_c9)._m0[136].x, _724);
    float _740 = _728 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _742 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _744 = min(_333, _736);
    float _746 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _748 = _580 * _702;
    float _750 = _742 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _752 = _738 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _754 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _756 = fma(_646, _730, _462);
    float _758 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _760 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _762 = _754 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _764 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[123].y);
    if (_390)
    {
        float _766 = -_676;
        float _768 = _766 + 1.0;
        _764 = as_type<int>(_768);
    }
    int _770 = _764;
    float _772 = _758 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _774 = _552 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _776 = _740 * _746;
    out.m_61.x = _762;
    out.m_61.y = _772;
    out.m_61.z = _750;
    out.m_61.w = _752;
    if (_390)
    {
        float _778 = _440 ? as_type<float>(_770) : _676;
        _688 = _778;
    }
    float _780 = _688;
    out.m_63.x = _776;
    out.m_63.y = _748;
    float _782 = _774 * _760;
    float _784 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _786 = _780 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _788 = _734 + 0.5;
    float _790 = _786 * _784;
    uint _793 = as_type<uint>(half2(float2(_364, 0.0)));
    uint _795 = extract_bits(_793, 0u, 8u);
    int _797 = int(_795) & 255;
    uint _799 = extract_bits(_793, 8u, 8u);
    int _801 = int(_799) & 255;
    int _803 = _801 << 8;
    int _805 = _797 | _803;
    bool _807 = _805 >= 32768;
    int _809 = _805 + (-1024);
    int _811 = _809;
    if (_807)
    {
        int _813 = ~_805;
        int _815 = _813 + 33792;
        int _817 = _815 + 1;
        _811 = _817;
    }
    int _819 = _811;
    int _821 = _819 + 30719;
    float _823 = float(_821);
    float _825 = fma(_823, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _827 = abs(_825);
    float _829 = -_827;
    float _831 = _829 + 1.0;
    int _833 = as_type<int>(_831) + (-218103808);
    bool _835 = uint(_833) >= 1920991232u;
    float _837 = _756 + 0.5;
    bool _839 = !_835;
    if (!_839)
    {
        int _841;
        _84(_841, out.gl_Position, out.gl_PointSize);
    }
    int _843 = _744;
    int _845 = 0;
    int _847 = _87(_843, _845, (*spvDescriptorSet0.support_buffer));
    int _849 = _331;
    int _851 = 0;
    int _853 = _87(_849, _851, (*spvDescriptorSet0.support_buffer));
    float4 _855 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_847, _853)), 0).xyzw;
    float _857 = _855.x;
    float _859 = _855.y;
    float _861 = _855.z;
    float _863 = _855.w;
    float _865 = floor(_337);
    float _867 = -_865;
    float _869 = _337 + _867;
    uint _871 = as_type<uint>(half2(float2(_863, 0.0)));
    float _873 = -_358;
    float _875 = _873 + _857;
    uint _877 = extract_bits(_871, 0u, 8u);
    int _879 = int(_877) & 255;
    uint _881 = extract_bits(_871, 8u, 8u);
    int _883 = int(_881) & 255;
    int _885 = _883 << 8;
    int _887 = _879 | _885;
    float _889 = fma(_869, _875, _358);
    bool _891 = _887 >= 32768;
    int _893 = _887 + (-1024);
    int _895 = _893;
    if (_891)
    {
        int _897 = ~_887;
        int _899 = _897 + 33792;
        int _901 = _899 + 1;
        _895 = _901;
    }
    int _903 = _895;
    int _905 = _903 + 30719;
    float _907 = float(_905);
    float _909 = fma(_907, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _911 = -_362;
    float _913 = _911 + _861;
    float _915 = abs(_909);
    float _917 = -_915;
    float _919 = _917 + 1.0;
    float _921 = fma(_869, _913, _362);
    int _923 = as_type<int>(_919) + (-218103808);
    bool _925 = uint(_923) >= 1920991232u;
    float _927 = -_360;
    float _929 = _927 + _859;
    float _931 = fma(_869, _929, _360);
    bool _933 = !_925;
    if (!_933)
    {
        int _935;
        _84(_935, out.gl_Position, out.gl_PointSize);
    }
    float _937 = in.m_53.x;
    float _939 = in.m_53.y;
    float _941 = in.m_53.z;
    float _943 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _889);
    float _945 = _937 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _947 = _939 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _949 = _941 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _951 = _945 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _953 = _947 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _955 = _949 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _957 = _951 * _943;
    float _959 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _931);
    float _961 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _921);
    float _963 = _281 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _965 = _281 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _967 = _953 * _959;
    float _969 = _955 * _961;
    float _971 = fma(_279, (*spvDescriptorSet0.vp_c10)._m0[4].x, _963);
    float _973 = fma(_279, (*spvDescriptorSet0.vp_c10)._m0[6].x, _965);
    float _975 = _967 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _977 = _967 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _979 = fma(_283, (*spvDescriptorSet0.vp_c10)._m0[4].z, _971);
    float _981 = fma(_283, (*spvDescriptorSet0.vp_c10)._m0[6].z, _973);
    float _983 = fma(_957, (*spvDescriptorSet0.vp_c10)._m0[8].x, _975);
    float _985 = fma(_957, (*spvDescriptorSet0.vp_c10)._m0[10].x, _977);
    float _987 = _979 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _989 = _981 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _991 = fma(_969, (*spvDescriptorSet0.vp_c10)._m0[8].z, _983);
    float _993 = fma(_969, (*spvDescriptorSet0.vp_c10)._m0[10].z, _985);
    float _995 = _281 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _997 = _967 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _999 = _987 + _991;
    float _1001 = _989 + _993;
    float _1003 = fma(_279, (*spvDescriptorSet0.vp_c10)._m0[5].x, _995);
    float _1005 = fma(_957, (*spvDescriptorSet0.vp_c10)._m0[9].x, _997);
    float _1007 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1009 = _999 + _1007;
    float _1011 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1013 = _1001 + _1011;
    float _1015 = fma(_283, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1003);
    float _1017 = fma(_969, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1005);
    float _1019 = _1009 * _1009;
    float _1021 = _1013 * _1013;
    float _1023 = _1015 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1025 = _1019 + _1021;
    float _1027 = _1023 + _1017;
    float _1029 = sqrt(_1025);
    bool _1031 = _1029 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1033 = _997;
    float _1035 = _999;
    float _1037 = _1003;
    float _1039 = _1021;
    float _1041 = _1025;
    float _1043 = _989;
    if (!_1031)
    {
        _289 = _999;
    }
    float _1045 = _289;
    float _1047 = _1045;
    if (!_1031)
    {
        _1033 = _1019;
    }
    float _1049 = _1033;
    float _1051 = _1049;
    if (!_1031)
    {
        _1035 = _1001;
    }
    float _1053 = _1035;
    float _1055 = _1053;
    if (!_1031)
    {
        _1037 = _1027;
    }
    float _1057 = _1037;
    bool _1059 = !_1031;
    float _1061 = _1057;
    if (!_1059)
    {
        float _1063 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1065 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1067 = _1029 + _1065;
        float _1069 = rsqrt(_1025);
        float _1071 = _1067 * _1063;
        float _1073 = _1027 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1075 = _1071 * 0.15915493667125701904296875;
        float _1077 = _1075 * 6.283185482025146484375;
        float _1079 = sin(_1077);
        float _1081 = _1075 * 6.283185482025146484375;
        float _1083 = cos(_1081);
        float _1085 = fma(_1079, _1073, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1087 = _1069 * _1085;
        float _1089 = _1083 + (-1.0);
        float _1091 = _1089 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1093 = _1009 * _1087;
        float _1095 = _1013 * _1087;
        float _1097 = fma(_1027, _1083, _1091);
        float _1099 = _1093 + (*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1101 = _1095 + (*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1103 = _1093 * _1093;
        float _1105 = _1095 * _1095;
        _1061 = _1097;
        _1051 = _1103;
        _1039 = _1105;
        _1047 = _1099;
        _1055 = _1101;
    }
    float _1107 = _1061;
    float _1109 = _1051;
    float _1111 = _1039;
    float _1113 = _1047;
    float _1115 = _1055;
    float _1117 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1119 = _1107 + _1117;
    out.m_65.x = _837;
    out.m_65.y = _788;
    out.m_65.z = _790;
    out.m_65.w = _782;
    float _1121 = fma(_1119, _1119, _1109);
    float _1123 = _1121 + _1111;
    float _1125 = sqrt(_1123);
    out.m_67.x = 1.0;
    out.m_67.y = 1.0;
    out.m_67.z = 1.0;
    bool _1127 = _1125 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1129 = isnan(_1125);
    bool _1131 = _1127 || _1129;
    bool _1133 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1135 = _1131 || _1133;
    float _1137 = _1125;
    if (!_1135)
    {
        _291 = 1.0;
    }
    float _1139 = _291;
    bool _1141 = !_1135;
    float _1143 = _1139;
    if (!_1141)
    {
        bool _1145 = _1125 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1147 = isnan(_1125);
        bool _1149 = _1145 || _1147;
        bool _1151 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1153 = _1149 || _1151;
        if (!_1153)
        {
            float _1155 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1157 = _1125 + _1155;
            float _1159 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1161 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1159;
            float _1163 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1165 = _1163 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1167 = 1.0 / _1161;
            float _1169 = _1157 * _1167;
            float _1171 = fma(_1169, _1165, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1143 = _1171;
            _1173 = true;
        }
        else
        {
            bool _1175 = _1125 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1177 = isnan(_1125);
            bool _1179 = _1175 || _1177;
            bool _1181 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1183 = _1179 || _1181;
            if (!_1183)
            {
                float _1185 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1187 = _1125 + _1185;
                float _1189 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1191 = _1189 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1193 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1195 = _1193 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1197 = 1.0 / _1191;
                float _1199 = _1187 * _1197;
                float _1201 = fma(_1199, _1195, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1143 = _1201;
                _1173 = true;
            }
            else
            {
                _1143 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1173 = false;
    float _1203 = _1143;
    float _1205 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1207 = _1107 + _1205;
    float _1209 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1211 = _1113 + _1209;
    float _1213 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1215 = _1115 + _1213;
    float _1217 = fma(_1207, _1203, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1219 = fma(_1211, _1203, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1221 = fma(_1215, _1203, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1223 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1225 = _1217 + _1223;
    float _1227 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1229 = _1219 + _1227;
    float _1231 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1233 = _1221 + _1231;
    float _1235 = _1225 * _1225;
    float _1237 = fma(_1229, _1229, _1235);
    float _1239 = fma(_1233, _1233, _1237);
    float _1241 = rsqrt(_1239);
    float _1243 = sqrt(_1239);
    float _1245 = _1241 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1247 = _1229 * _1245;
    float _1249 = _1233 * _1245;
    float _1251 = _1247 * _1247;
    float _1253 = _1249 * _1249;
    float _1255 = _1251 + _1253;
    float _1257 = sqrt(_1255);
    bool _1259 = _1257 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1261 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1263 = _1257 + _1261;
    float _1265 = _1233;
    float _1267 = _1255;
    float _1269 = _1263;
    float _1271 = _1225;
    if (_1259)
    {
        float _1273 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1265 = _1273;
    }
    float _1275 = _1265;
    if (_1259)
    {
        float _1277 = rsqrt(_1255);
        _1267 = _1277;
    }
    float _1279 = _1267;
    float _1281 = _1279;
    if (_1259)
    {
        float _1283 = _1263 * _1275;
        _1269 = _1283;
    }
    float _1285 = _1269;
    if (_1259)
    {
        float _1287 = _1285 * 0.15915493667125701904296875;
        _1137 = _1287;
    }
    float _1289 = _1137;
    float _1291 = _1241;
    float _1293 = _1289;
    if (_1259)
    {
        float _1295 = _1289 * 6.283185482025146484375;
        float _1297 = sin(_1295);
        _1291 = _1297;
    }
    float _1299 = _1291;
    float _1301 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1303 = precise::max(0.0, _1301);
    float _1305 = _1237;
    float _1307 = _1303;
    float _1309 = _1301;
    if (_1259)
    {
        float _1311 = _1289 * 6.283185482025146484375;
        float _1313 = cos(_1311);
        _1305 = _1313;
    }
    float _1315 = _1305;
    float _1317 = -_1245;
    float _1319 = -_1303;
    float _1321 = fma(_1225, _1317, _1319);
    if (!_1259)
    {
        _1307 = _1249;
    }
    float _1323 = _1307;
    float _1325 = _1323;
    if (_1259)
    {
        float _1327 = _1321 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1309 = _1327;
    }
    float _1329 = _1309;
    float _1331 = _1299;
    float _1333 = _1329;
    if (_1259)
    {
        float _1335 = fma(_1299, _1329, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1271 = _1335;
    }
    float _1337 = _1271;
    float _1339 = _1337;
    if (!_1259)
    {
        _1331 = _1247;
    }
    float _1341 = _1331;
    float _1343 = _1341;
    if (_1259)
    {
        float _1345 = _1315 + (-1.0);
        _1333 = _1345;
    }
    float _1347 = _1333;
    float _1349 = _1347;
    if (_1259)
    {
        float _1351 = _1279 * _1337;
        _1041 = _1351;
    }
    float _1353 = _1041;
    if (!_1259)
    {
        _1339 = _1321;
    }
    float _1355 = _1339;
    float _1357 = _1355;
    if (_1259)
    {
        float _1359 = _1347 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1293 = _1359;
    }
    float _1361 = _1293;
    if (_1259)
    {
        float _1363 = _1247 * _1353;
        _1343 = _1363;
    }
    float _1365 = _1343;
    if (!_1259)
    {
        _1281 = _1251;
    }
    float _1367 = _1281;
    float _1369 = _1367;
    if (_1259)
    {
        float _1371 = _1249 * _1353;
        _1325 = _1371;
    }
    float _1373 = _1325;
    if (_1259)
    {
        float _1375 = fma(_1321, _1315, _1361);
        _1357 = _1375;
    }
    float _1377 = _1357;
    if (_1259)
    {
        float _1379 = _1365 * _1365;
        _1369 = _1379;
    }
    float _1381 = _1369;
    if (!_1259)
    {
        _1349 = _1253;
    }
    float _1383 = _1349;
    float _1385 = _1383;
    if (_1259)
    {
        float _1387 = _1373 * _1373;
        _1385 = _1387;
    }
    float _1389 = _1385;
    float _1391 = _1217 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1393 = fma(_1377, _1377, _1381);
    float _1395 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1397 = fma(_1219, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1391);
    float _1399 = _1393 + _1389;
    float _1401 = _1217 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1403 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1405 = fma(_1243, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1403);
    float _1407 = precise::clamp(_1405, 0.0, 1.0);
    float _1409 = fma(_1221, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1397);
    float _1411 = rsqrt(_1399);
    float _1413 = _1217 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1415 = -_1407;
    float _1417 = _1415 + 1.0;
    float _1419 = fma(_1219, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1401);
    float _1421 = _1409 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1423 = _1217 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1425 = fma(_1219, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1413);
    float _1427 = fma(_1221, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1419);
    float _1429 = abs(_1417);
    float _1431 = log2(_1429);
    float _1433 = _1421 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1435 = fma(_1219, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1423);
    float _1437 = fma(_1221, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1425);
    float _1439 = _1427 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1441 = -_1433;
    float _1443 = fma(_1441, _1395, 1.0);
    float _1445 = fma(_1221, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1435);
    float _1447 = _1437 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1449 = _1411 * _1365;
    float _1451 = _1439 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1453 = _1411 * _1377;
    float _1455 = _1445 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1457 = _1449 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1459 = fma(_1447, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1451);
    float _1461 = _1411 * _1373;
    float _1463 = log2(_1443);
    float _1465 = -_1457;
    float _1467 = fma(_1453, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1465);
    float _1469 = _1431 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1471 = fma(_1421, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1459);
    float _1473 = -_1461;
    float _1475 = fma(_1473, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1467);
    float _1477 = _1439 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1479 = fma(_1455, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1471);
    float _1481 = exp2(_1469);
    float _1483 = fma(_1475, -0.5, 0.5);
    float _1485 = _1439 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1487 = fma(_1475, 0.5, 0.5);
    float _1489 = fma(_1447, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1477);
    float _1491 = _1453 + 1.0;
    float _1493 = fma(_1447, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1485);
    float _1495 = 1.0 / _1479;
    float _1497 = fma(_1487, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1499 = fma(_1421, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1493);
    float _1501 = fma(_1421, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1489);
    float _1503 = _1463 * 0.693147182464599609375;
    float _1505 = fma(_1487, _1497, -0.212114393711090087890625);
    float _1507 = sqrt(_1483);
    float _1509 = -_1453;
    float _1511 = fma(_1481, _1491, _1509);
    float _1513 = fma(_1455, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1499);
    float _1515 = fma(_1455, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1501);
    float _1517 = fma(_1487, _1505, 1.570728778839111328125);
    float _1519 = _1503 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1521 = fma(_1511, 0.5, 0.5);
    float _1523 = _1513 * _1495;
    float _1525 = _1515 * _1495;
    float _1527 = fma(_1523, 0.5, 0.5);
    float _1529 = fma(_1525, -0.5, 0.5);
    float _1531 = _1507 * 0.636619746685028076171875;
    float3 _4110 = float3(_1527, _1529, _1519);
    float _1533 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4110, float3(0.0), isnan(_4110)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4110, float3(0.0), isnan(_4110)), level(0.0)).x;
    float3 _4121 = float3(_1527, _1529, _1519);
    float4 _1535 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4121, float3(0.0), isnan(_4121)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4121, float3(0.0), isnan(_4121)), level(0.0)).xyzw;
    float _1537 = _1535.x;
    float _1539 = _1535.y;
    float _1541 = _1535.z;
    float _1543 = _1535.w;
    float _1545 = -_1517;
    float _1547 = fma(_1531, _1545, 1.0);
    float2 _4142 = float2(_1547, _1521);
    float3 _1551 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4142, float2(0.0), isnan(_4142)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4142, float2(0.0), isnan(_4142)), level(0.0)).xyz;
    float _1553 = _1551.x;
    float _1555 = _1551.y;
    float _1557 = _1551.z;
    float _1559 = _1023 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1561 = _1439 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1563 = fma(_987, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1559);
    float _1565 = _1023 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1567 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1569 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1571 = _1567 || _1569;
    bool _1573 = isnan(0.5);
    bool _1575 = _1571 || _1573;
    float _1577 = fma(_1447, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1561);
    float _1579 = fma(_989, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1563);
    float _1581 = fma(_987, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1565);
    float _1583 = fma(_1421, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1577);
    float _1585 = _1579 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1587 = fma(_989, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1581);
    float _1589 = _1431 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1591 = 1.0 / _1585;
    float _1593 = _1587 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1595 = _1593 + _1585;
    float _1597 = _1527;
    float _1599 = _1529;
    float _1601 = _1447;
    float _1603 = _1431;
    if (!_1575)
    {
        _1597 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _1605 = _1597;
    float _1607 = exp2(_1589);
    if (!_1575)
    {
        float _1609 = -_1605;
        float _1611 = _1609 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _1043 = _1611;
    }
    float _1613 = _1043;
    float _1615 = _1595 * _1591;
    float _1617 = _1615 * 0.5;
    float _1619 = _1617;
    float _1621 = _1591;
    float _1623 = _1613;
    if (!_1575)
    {
        float _1625 = 1.0 / _1613;
        _1599 = _1625;
    }
    float _1627 = _1599;
    float _1629 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1631 = fma(_1617, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1629);
    if (!_1575)
    {
        _1619 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _1633 = _1619;
    float _1635 = -_1607;
    float _1637 = _1635 + 1.0;
    float _1639 = 1.0 / _1631;
    float _1641 = _1633;
    if (!_1575)
    {
        float _1643 = -_1633;
        float _1645 = _1643 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1621 = _1645;
    }
    float _1647 = _1621;
    if (_1575)
    {
        _1623 = 1.0;
    }
    float _1649 = _1623;
    float _1651 = _1637 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1653 = _1519;
    float _1655 = _1649;
    if (!_1575)
    {
        float _1657 = 1.0 / _1647;
        _1653 = _1657;
    }
    float _1659 = _1653;
    if (!_1575)
    {
        float _1661 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1663 = -_1605;
        float _1665 = fma(_1639, _1661, _1663);
        _1601 = _1665;
    }
    float _1667 = _1601;
    float _1669 = _1667;
    if (!_1575)
    {
        float _1671 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1673 = -_1633;
        float _1675 = fma(_1639, _1671, _1673);
        _1603 = _1675;
    }
    float _1677 = _1603;
    if (_1575)
    {
        _1641 = 1.0;
    }
    float _1679 = _1641;
    float _1681 = _1679;
    if (!_1575)
    {
        float _1683 = _1667 * _1627;
        float _1685 = precise::clamp(_1683, 0.0, 1.0);
        _1669 = _1685;
    }
    float _1687 = _1669;
    if (!_1575)
    {
        float _1689 = _1677 * _1659;
        float _1691 = precise::clamp(_1689, 0.0, 1.0);
        _1655 = _1691;
    }
    float _1693 = _1655;
    if (!_1575)
    {
        float _1695 = -_1687;
        float _1697 = _1695 + 1.0;
        _1681 = _1697;
    }
    float _1699 = _1681;
    float _1701 = fma(_1455, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1583);
    float _1703 = _1693 * _1699;
    bool _1705 = _1693 > 0.0;
    bool _1707 = isnan(_1693);
    bool _1709 = _1705 || _1707;
    bool _1711 = isnan(0.0);
    bool _1713 = _1709 || _1711;
    float _1715 = _1701 + _1479;
    float _1717 = _1703 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _1719 = _1699 <= 0.0;
    bool _1721 = !_1713;
    bool _1723 = _1719 || _1721;
    float _1725 = _1715 * 0.5;
    float _1727 = _1717 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_69.z = _1725;
    out.m_69.w = _1479;
    out.gl_Position.x = _1513;
    out.gl_Position.y = _1515;
    out.gl_Position.z = _1701;
    out.gl_Position.w = _1479;
    out.m_49.x = _1727;
    float _1729 = _1651 * _1533;
    float _1731 = _1543 * _1729;
    float _1733 = _1557 * _1729;
    float _1735 = -_1651;
    float _1737 = _1735 + 1.0;
    float _1739 = fma(_1553, _1731, _1537);
    float _1741 = fma(_1555, _1731, _1539);
    float _1743 = fma(_1543, _1733, _1541);
    float _1745 = _1543 * _1737;
    out.m_71.x = _1739;
    out.m_71.y = _1741;
    out.m_71.z = _1743;
    out.m_71.w = _1745;
    if (!_1723)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_49.x = 0.0;
    float _1747 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1747;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1173 = false;
    bool _311 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _91 = in.m_46.w;
    float _93 = trunc(_91);
    int _95 = int(_93);
    bool _99 = _95 >= 1;
    float _101 = 0.0;
    float _103 = as_type<float>(_95);
    if (!_99)
    {
        _101 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _105 = _101;
    if (!_99)
    {
        out.m_49.x = 0.0;
    }
    int _107 = 0;
    if (!_99)
    {
        float _109 = _105 * 5.0;
        _107 = as_type<int>(_109);
    }
    int _111 = _107;
    int _113 = _111;
    if (!_99)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1805 = as_type<float>(_111);
        out.gl_Position.z = _1805;
    }
    if (!_99)
    {
        return out;
    }
    float _115 = in.m_51.w;
    float _117 = float(_95);
    float _119 = -_115;
    float _121 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _123 = _115 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _125 = isnan(_115);
    bool _127 = _123 || _125;
    bool _129 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _131 = _127 || _129;
    bool _133 = _121 >= _117;
    bool _135 = !_131;
    bool _137 = _133 || _135;
    float _139 = _121;
    if (_137)
    {
        _103 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _141 = _103;
    if (_137)
    {
        out.m_49.x = 0.0;
    }
    if (_137)
    {
        float _143 = _141 * 5.0;
        _113 = as_type<int>(_143);
    }
    int _145 = _113;
    if (_137)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1869 = as_type<float>(_145);
        out.gl_Position.z = _1869;
    }
    if (_137)
    {
        return out;
    }
    float _147 = in.m_53.w;
    float _149 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _151 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _153 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _155 = _151 || _153;
    bool _157 = isnan(1.0);
    bool _159 = _155 || _157;
    float _161 = in.m_51.x;
    float _163 = in.m_51.y;
    float _165 = in.m_51.z;
    float _167 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _169 = in.m_46.x;
    float _171 = in.m_46.y;
    float _173 = in.m_46.z;
    float _175 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _177 = _167 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _179 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _181 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _183 = _175 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _185 = 0.0;
    float _187 = _149;
    if (!_159)
    {
        float _189 = _149 * _149;
        float _191 = _189 * 0.5;
        _185 = _191;
    }
    float _193 = _185;
    float _195 = _179 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _197 = _193;
    if (!_159)
    {
        float _199 = _193 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _197 = _199;
    }
    float _201 = _197;
    bool _203 = !_159;
    float _205 = _201;
    if (!_203)
    {
        float _207 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _209 = log2(_207);
        float _211 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _213 = _211 + 1.0;
        float _215 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _217 = _149 * _209;
        float _219 = 1.0 / _213;
        float _221 = _215 * 0.693147182464599609375;
        float _223 = exp2(_217);
        float _225 = 1.0 / _221;
        float _227 = _223 + (-1.0);
        float _229 = -_227;
        float _231 = fma(_229, _225, _149);
        float _233 = _231 * _219;
        float _235 = _233 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _205 = _235;
    }
    float _237 = _205;
    bool _239 = !_159;
    if (!_239)
    {
        float _241 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _243 = log2(_241);
        float _245 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _247 = _245 + 1.0;
        float _249 = 1.0 / _247;
        float _251 = _149 * _243;
        float _253 = exp2(_251);
        float _255 = -_253;
        float _257 = _255 + 1.0;
        float _259 = _257 * _249;
        _187 = _259;
    }
    float _261 = _187;
    out.m_55.x = _177;
    out.m_55.y = _183;
    out.m_55.z = _195;
    out.m_55.w = _181;
    float _263 = 1.0 / _117;
    bool _265 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _267 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _269 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _271 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _273 = fma(_261, _161, _267);
    float _275 = fma(_261, _163, _269);
    float _277 = fma(_261, _165, _271);
    float _279 = fma(_273, _147, _169);
    float _281 = fma(_275, _147, _171);
    float _283 = fma(_277, _147, _173);
    float _285 = _121 * _263;
    bool _287 = !_265;
    float _289 = _283;
    float _291 = _279;
    float _309;
    if (!_287)
    {
        float _293 = in.m_57.x;
        float _295 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _297 = _293 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _299 = fma(_297, (*spvDescriptorSet0.vp_c9)._m0[11].w, _121);
        float _301 = _299 * _295;
        float _303 = floor(_301);
        float _305 = -_303;
        float _307 = _301 + _305;
        _309 = _307;
        _311 = true;
    }
    else
    {
        _309 = _285;
    }
    _311 = false;
    float _313 = _309;
    int _315 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _317 = _315;
    int _319 = 0;
    int _321 = _86(_317, _319, (*spvDescriptorSet0.support_buffer));
    float _323 = in.m_59.z;
    float _325 = 0.0 + _285;
    float _327 = precise::clamp(_325, 0.0, 1.0);
    float _329 = trunc(_323);
    int _331 = int(_329);
    int _333 = _321 + (-1);
    float _335 = float(_333);
    float _337 = _327 * _335;
    float _339 = trunc(_337);
    int _341 = int(_339);
    int _343 = _341;
    int _345 = 0;
    int _347 = _87(_343, _345, (*spvDescriptorSet0.support_buffer));
    int _349 = _331;
    int _351 = 0;
    int _353 = _87(_349, _351, (*spvDescriptorSet0.support_buffer));
    float4 _356 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_347, _353)), 0).xyzw;
    float _358 = _356.x;
    float _360 = _356.y;
    float _362 = _356.z;
    float _364 = _356.w;
    float _366 = in.m_57.x;
    float _368 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _370 = in.m_59.y;
    float _372 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _374 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _376 = _374 != 0;
    float _378 = in.m_57.y;
    int _380 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _382 = _380 != 0;
    float _384 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _386 = in.m_57.z;
    int _388 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _390 = _388 != 0;
    int _392 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _394 = _392 != 0;
    float _396 = in.m_57.w;
    int _398 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _400 = _398 != 0;
    float _402 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _404 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _406 = _404 != 0;
    float _408 = in.m_59.x;
    float _410 = _366 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _412 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[78].z, _402);
    float _414 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _416 = -_372;
    float _418 = fma(_410, 2.0, _416);
    float _420 = -_370;
    float _422 = _420 + 1.0;
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _426 = _424 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _428 = _378 > 0.5;
    bool _430 = _428 && _382;
    float _432 = _378 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _436 = _434 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _438 = fma(_378, (*spvDescriptorSet0.vp_c9)._m0[78].w, _414);
    bool _440 = _386 > 0.5;
    float _442 = 1.0 / _436;
    float _444 = _430 ? _422 : _370;
    float _446 = fma(_432, -2.0, _384);
    bool _448 = _430;
    float _450 = _446;
    int _452 = as_type<int>(_313);
    float _454 = _370;
    if (_376)
    {
        bool _456 = _366 > 0.5;
        _448 = _456;
    }
    bool _458 = _448;
    float _460 = -_121;
    float _462 = fma(_460, (*spvDescriptorSet0.vp_c9)._m0[76].x, _418);
    int _464 = _440 ? as_type<int>(_422) : as_type<int>(_370);
    float _466 = 1.0 / _426;
    bool _468 = _396 > 0.5;
    bool _470 = _468 && _406;
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _474 = _472 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _476 = _400 ? as_type<float>(_464) : _370;
    bool _478 = _378 > 0.5;
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _482 = _480 + (*spvDescriptorSet0.vp_c9)._m0[135].w;
    float _484 = 1.0 / _474;
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _488 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _486;
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _492 = _490 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _494 = _488 * _442;
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[135].w;
    float _498 = _496 + (*spvDescriptorSet0.vp_c9)._m0[136].w;
    bool _500 = _313 >= (*spvDescriptorSet0.vp_c9)._m0[136].w;
    bool _502 = isnan(_313);
    bool _504 = _500 || _502;
    bool _506 = isnan((*spvDescriptorSet0.vp_c9)._m0[136].w);
    bool _508 = _504 || _506;
    float _510 = float(_508);
    float _512 = 1.0 / _482;
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _516 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _514;
    bool _518 = _313 >= (*spvDescriptorSet0.vp_c9)._m0[135].w;
    bool _520 = isnan(_313);
    bool _522 = _518 || _520;
    bool _524 = isnan((*spvDescriptorSet0.vp_c9)._m0[135].w);
    bool _526 = _522 || _524;
    float _528 = float(_526);
    float _530 = _492 * _466;
    float _532 = -_510;
    float _534 = _532 + 1.0;
    bool _536 = _313 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _538 = isnan(_313);
    bool _540 = _536 || _538;
    bool _542 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _544 = _540 || _542;
    float _546 = float(_544);
    float _548 = -(*spvDescriptorSet0.vp_c9)._m0[134].x;
    float _550 = _548 + (*spvDescriptorSet0.vp_c9)._m0[135].x;
    float _552 = _470 ? _422 : _370;
    float _554 = 1.0 / _498;
    float _556 = _516 * _484;
    bool _558 = _313 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _560 = isnan(_313);
    bool _562 = _558 || _560;
    bool _564 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _566 = _562 || _564;
    float _568 = float(_566);
    float _570 = -_528;
    float _572 = _570 + 1.0;
    float _574 = _528 * _534;
    float _576 = -_546;
    float _578 = _576 + 1.0;
    float _580 = _476 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _582 = _568 * _572;
    float _584 = -_568;
    float _586 = _584 + 1.0;
    float _588 = -(*spvDescriptorSet0.vp_c9)._m0[135].x;
    float _590 = (*spvDescriptorSet0.vp_c9)._m0[136].x + _588;
    bool _592 = _313 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _594 = isnan(_313);
    bool _596 = _592 || _594;
    bool _598 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _600 = _596 || _598;
    float _602 = float(_600);
    float _604 = _550 * _512;
    bool _606 = _313 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _608 = isnan(_313);
    bool _610 = _606 || _608;
    bool _612 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _614 = _610 || _612;
    float _616 = float(_614);
    float _618 = _546 * _586;
    float _620 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _622 = _313 + _620;
    float _624 = _602 * _578;
    float _626 = _590 * _554;
    float _628 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _630 = _313 + _628;
    float _632 = -_602;
    float _634 = _632 + 1.0;
    float _636 = fma(_530, _622, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _638 = -(*spvDescriptorSet0.vp_c9)._m0[135].w;
    float _640 = _313 + _638;
    float _642 = fma(_494, _630, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _644 = _616 * _634;
    float _646 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].z, _412);
    float _648 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[76].y, _446);
    float _650 = -_616;
    float _652 = _650 + 1.0;
    float _654 = _642 * _644;
    int _656 = as_type<int>(_582);
    if (!_376)
    {
        _450 = _408;
    }
    float _658 = _450;
    float _660 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].w, _438);
    float _662 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _664 = _313 + _662;
    float _666 = fma(_652, (*spvDescriptorSet0.vp_c9)._m0[131].x, _654);
    float _668 = _658;
    if (!_376)
    {
        _139 = _658;
    }
    float _670 = _139;
    float _672 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _674 = _670;
    if (_376)
    {
        _668 = _408;
    }
    float _676 = _668;
    float _678 = fma(_556, _664, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _680 = fma(_636, _624, _666);
    float _682 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _684 = _313 + _682;
    float _686 = fma(_626, _640, (*spvDescriptorSet0.vp_c9)._m0[135].x);
    float _688 = _676;
    if (_376)
    {
        float _690 = -_676;
        float _692 = _690 + 1.0;
        _452 = as_type<int>(_692);
    }
    int _694 = _452;
    float _696 = fma(_678, _618, _680);
    float _698 = fma(_604, _684, (*spvDescriptorSet0.vp_c9)._m0[134].x);
    if (!_394)
    {
        _454 = _676;
    }
    float _700 = _454;
    float _702 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _704 = _700;
    if (_376)
    {
        float _706 = _458 ? as_type<float>(_694) : _676;
        _674 = _706;
    }
    float _708 = _674;
    float _710 = fma(_698, _582, _696);
    float _712 = _368 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (_394)
    {
        float _714 = -_676;
        float _716 = _714 + 1.0;
        _656 = as_type<int>(_716);
    }
    int _718 = _656;
    float _720 = _672 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _722 = fma(_712, _444, -0.5);
    float _724 = fma(_686, _574, _710);
    if (_394)
    {
        float _726 = _478 ? as_type<float>(_718) : _676;
        _704 = _726;
    }
    float _728 = _704;
    float _730 = fma(_720, _708, -0.5);
    float _732 = -_648;
    float _734 = fma(_660, _722, _732);
    int _736 = _341 + 1;
    float _738 = fma(_510, (*spvDescriptorSet0.vp_c9)._m0[136].x, _724);
    float _740 = _728 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _742 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _744 = min(_333, _736);
    float _746 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _748 = _580 * _702;
    float _750 = _742 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _752 = _738 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _754 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _756 = fma(_646, _730, _462);
    float _758 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _760 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _762 = _754 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _764 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[123].y);
    if (_390)
    {
        float _766 = -_676;
        float _768 = _766 + 1.0;
        _764 = as_type<int>(_768);
    }
    int _770 = _764;
    float _772 = _758 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _774 = _552 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _776 = _740 * _746;
    out.m_61.x = _762;
    out.m_61.y = _772;
    out.m_61.z = _750;
    out.m_61.w = _752;
    if (_390)
    {
        float _778 = _440 ? as_type<float>(_770) : _676;
        _688 = _778;
    }
    float _780 = _688;
    out.m_63.x = _776;
    out.m_63.y = _748;
    float _782 = _774 * _760;
    float _784 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _786 = _780 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _788 = _734 + 0.5;
    float _790 = _786 * _784;
    uint _793 = as_type<uint>(half2(float2(_364, 0.0)));
    uint _795 = extract_bits(_793, 0u, 8u);
    int _797 = int(_795) & 255;
    uint _799 = extract_bits(_793, 8u, 8u);
    int _801 = int(_799) & 255;
    int _803 = _801 << 8;
    int _805 = _797 | _803;
    bool _807 = _805 >= 32768;
    int _809 = _805 + (-1024);
    int _811 = _809;
    if (_807)
    {
        int _813 = ~_805;
        int _815 = _813 + 33792;
        int _817 = _815 + 1;
        _811 = _817;
    }
    int _819 = _811;
    int _821 = _819 + 30719;
    float _823 = float(_821);
    float _825 = fma(_823, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _827 = abs(_825);
    float _829 = -_827;
    float _831 = _829 + 1.0;
    int _833 = as_type<int>(_831) + (-218103808);
    bool _835 = uint(_833) >= 1920991232u;
    float _837 = _756 + 0.5;
    bool _839 = !_835;
    if (!_839)
    {
        int _841;
        _84(_841, out.gl_Position, out.gl_PointSize);
    }
    int _843 = _744;
    int _845 = 0;
    int _847 = _87(_843, _845, (*spvDescriptorSet0.support_buffer));
    int _849 = _331;
    int _851 = 0;
    int _853 = _87(_849, _851, (*spvDescriptorSet0.support_buffer));
    float4 _855 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_847, _853)), 0).xyzw;
    float _857 = _855.x;
    float _859 = _855.y;
    float _861 = _855.z;
    float _863 = _855.w;
    float _865 = floor(_337);
    float _867 = -_865;
    float _869 = _337 + _867;
    uint _871 = as_type<uint>(half2(float2(_863, 0.0)));
    float _873 = -_358;
    float _875 = _873 + _857;
    uint _877 = extract_bits(_871, 0u, 8u);
    int _879 = int(_877) & 255;
    uint _881 = extract_bits(_871, 8u, 8u);
    int _883 = int(_881) & 255;
    int _885 = _883 << 8;
    int _887 = _879 | _885;
    float _889 = fma(_869, _875, _358);
    bool _891 = _887 >= 32768;
    int _893 = _887 + (-1024);
    int _895 = _893;
    if (_891)
    {
        int _897 = ~_887;
        int _899 = _897 + 33792;
        int _901 = _899 + 1;
        _895 = _901;
    }
    int _903 = _895;
    int _905 = _903 + 30719;
    float _907 = float(_905);
    float _909 = fma(_907, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _911 = -_362;
    float _913 = _911 + _861;
    float _915 = abs(_909);
    float _917 = -_915;
    float _919 = _917 + 1.0;
    float _921 = fma(_869, _913, _362);
    int _923 = as_type<int>(_919) + (-218103808);
    bool _925 = uint(_923) >= 1920991232u;
    float _927 = -_360;
    float _929 = _927 + _859;
    float _931 = fma(_869, _929, _360);
    bool _933 = !_925;
    if (!_933)
    {
        int _935;
        _84(_935, out.gl_Position, out.gl_PointSize);
    }
    float _937 = in.m_53.x;
    float _939 = in.m_53.y;
    float _941 = in.m_53.z;
    float _943 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _889);
    float _945 = _937 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _947 = _939 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _949 = _941 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _951 = _945 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _953 = _947 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _955 = _949 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _957 = _951 * _943;
    float _959 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _931);
    float _961 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _921);
    float _963 = _281 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _965 = _281 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _967 = _953 * _959;
    float _969 = _955 * _961;
    float _971 = fma(_279, (*spvDescriptorSet0.vp_c10)._m0[4].x, _963);
    float _973 = fma(_279, (*spvDescriptorSet0.vp_c10)._m0[6].x, _965);
    float _975 = _967 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _977 = _967 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _979 = fma(_283, (*spvDescriptorSet0.vp_c10)._m0[4].z, _971);
    float _981 = fma(_283, (*spvDescriptorSet0.vp_c10)._m0[6].z, _973);
    float _983 = fma(_957, (*spvDescriptorSet0.vp_c10)._m0[8].x, _975);
    float _985 = fma(_957, (*spvDescriptorSet0.vp_c10)._m0[10].x, _977);
    float _987 = _979 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _989 = _981 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _991 = fma(_969, (*spvDescriptorSet0.vp_c10)._m0[8].z, _983);
    float _993 = fma(_969, (*spvDescriptorSet0.vp_c10)._m0[10].z, _985);
    float _995 = _281 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _997 = _967 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _999 = _987 + _991;
    float _1001 = _989 + _993;
    float _1003 = fma(_279, (*spvDescriptorSet0.vp_c10)._m0[5].x, _995);
    float _1005 = fma(_957, (*spvDescriptorSet0.vp_c10)._m0[9].x, _997);
    float _1007 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1009 = _999 + _1007;
    float _1011 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1013 = _1001 + _1011;
    float _1015 = fma(_283, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1003);
    float _1017 = fma(_969, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1005);
    float _1019 = _1009 * _1009;
    float _1021 = _1013 * _1013;
    float _1023 = _1015 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1025 = _1019 + _1021;
    float _1027 = _1023 + _1017;
    float _1029 = sqrt(_1025);
    bool _1031 = _1029 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1033 = _997;
    float _1035 = _999;
    float _1037 = _1003;
    float _1039 = _1021;
    float _1041 = _1025;
    float _1043 = _989;
    if (!_1031)
    {
        _289 = _999;
    }
    float _1045 = _289;
    float _1047 = _1045;
    if (!_1031)
    {
        _1033 = _1019;
    }
    float _1049 = _1033;
    float _1051 = _1049;
    if (!_1031)
    {
        _1035 = _1001;
    }
    float _1053 = _1035;
    float _1055 = _1053;
    if (!_1031)
    {
        _1037 = _1027;
    }
    float _1057 = _1037;
    bool _1059 = !_1031;
    float _1061 = _1057;
    if (!_1059)
    {
        float _1063 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1065 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1067 = _1029 + _1065;
        float _1069 = rsqrt(_1025);
        float _1071 = _1067 * _1063;
        float _1073 = _1027 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1075 = _1071 * 0.15915493667125701904296875;
        float _1077 = _1075 * 6.283185482025146484375;
        float _1079 = sin(_1077);
        float _1081 = _1075 * 6.283185482025146484375;
        float _1083 = cos(_1081);
        float _1085 = fma(_1079, _1073, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1087 = _1069 * _1085;
        float _1089 = _1083 + (-1.0);
        float _1091 = _1089 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1093 = _1009 * _1087;
        float _1095 = _1013 * _1087;
        float _1097 = fma(_1027, _1083, _1091);
        float _1099 = _1093 + (*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1101 = _1095 + (*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1103 = _1093 * _1093;
        float _1105 = _1095 * _1095;
        _1061 = _1097;
        _1051 = _1103;
        _1039 = _1105;
        _1047 = _1099;
        _1055 = _1101;
    }
    float _1107 = _1061;
    float _1109 = _1051;
    float _1111 = _1039;
    float _1113 = _1047;
    float _1115 = _1055;
    float _1117 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1119 = _1107 + _1117;
    out.m_65.x = _837;
    out.m_65.y = _788;
    out.m_65.z = _790;
    out.m_65.w = _782;
    float _1121 = fma(_1119, _1119, _1109);
    float _1123 = _1121 + _1111;
    float _1125 = sqrt(_1123);
    out.m_67.x = 1.0;
    out.m_67.y = 1.0;
    out.m_67.z = 1.0;
    bool _1127 = _1125 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1129 = isnan(_1125);
    bool _1131 = _1127 || _1129;
    bool _1133 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1135 = _1131 || _1133;
    float _1137 = _1125;
    if (!_1135)
    {
        _291 = 1.0;
    }
    float _1139 = _291;
    bool _1141 = !_1135;
    float _1143 = _1139;
    if (!_1141)
    {
        bool _1145 = _1125 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1147 = isnan(_1125);
        bool _1149 = _1145 || _1147;
        bool _1151 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1153 = _1149 || _1151;
        if (!_1153)
        {
            float _1155 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1157 = _1125 + _1155;
            float _1159 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1161 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1159;
            float _1163 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1165 = _1163 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1167 = 1.0 / _1161;
            float _1169 = _1157 * _1167;
            float _1171 = fma(_1169, _1165, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1143 = _1171;
            _1173 = true;
        }
        else
        {
            bool _1175 = _1125 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1177 = isnan(_1125);
            bool _1179 = _1175 || _1177;
            bool _1181 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1183 = _1179 || _1181;
            if (!_1183)
            {
                float _1185 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1187 = _1125 + _1185;
                float _1189 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1191 = _1189 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1193 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1195 = _1193 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1197 = 1.0 / _1191;
                float _1199 = _1187 * _1197;
                float _1201 = fma(_1199, _1195, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1143 = _1201;
                _1173 = true;
            }
            else
            {
                _1143 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1173 = false;
    float _1203 = _1143;
    float _1205 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1207 = _1107 + _1205;
    float _1209 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1211 = _1113 + _1209;
    float _1213 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1215 = _1115 + _1213;
    float _1217 = fma(_1207, _1203, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1219 = fma(_1211, _1203, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1221 = fma(_1215, _1203, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1223 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1225 = _1217 + _1223;
    float _1227 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1229 = _1219 + _1227;
    float _1231 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1233 = _1221 + _1231;
    float _1235 = _1225 * _1225;
    float _1237 = fma(_1229, _1229, _1235);
    float _1239 = fma(_1233, _1233, _1237);
    float _1241 = rsqrt(_1239);
    float _1243 = sqrt(_1239);
    float _1245 = _1241 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1247 = _1229 * _1245;
    float _1249 = _1233 * _1245;
    float _1251 = _1247 * _1247;
    float _1253 = _1249 * _1249;
    float _1255 = _1251 + _1253;
    float _1257 = sqrt(_1255);
    bool _1259 = _1257 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1261 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1263 = _1257 + _1261;
    float _1265 = _1233;
    float _1267 = _1255;
    float _1269 = _1263;
    float _1271 = _1225;
    if (_1259)
    {
        float _1273 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1265 = _1273;
    }
    float _1275 = _1265;
    if (_1259)
    {
        float _1277 = rsqrt(_1255);
        _1267 = _1277;
    }
    float _1279 = _1267;
    float _1281 = _1279;
    if (_1259)
    {
        float _1283 = _1263 * _1275;
        _1269 = _1283;
    }
    float _1285 = _1269;
    if (_1259)
    {
        float _1287 = _1285 * 0.15915493667125701904296875;
        _1137 = _1287;
    }
    float _1289 = _1137;
    float _1291 = _1241;
    float _1293 = _1289;
    if (_1259)
    {
        float _1295 = _1289 * 6.283185482025146484375;
        float _1297 = sin(_1295);
        _1291 = _1297;
    }
    float _1299 = _1291;
    float _1301 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1303 = precise::max(0.0, _1301);
    float _1305 = _1237;
    float _1307 = _1303;
    float _1309 = _1301;
    if (_1259)
    {
        float _1311 = _1289 * 6.283185482025146484375;
        float _1313 = cos(_1311);
        _1305 = _1313;
    }
    float _1315 = _1305;
    float _1317 = -_1245;
    float _1319 = -_1303;
    float _1321 = fma(_1225, _1317, _1319);
    if (!_1259)
    {
        _1307 = _1249;
    }
    float _1323 = _1307;
    float _1325 = _1323;
    if (_1259)
    {
        float _1327 = _1321 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1309 = _1327;
    }
    float _1329 = _1309;
    float _1331 = _1299;
    float _1333 = _1329;
    if (_1259)
    {
        float _1335 = fma(_1299, _1329, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1271 = _1335;
    }
    float _1337 = _1271;
    float _1339 = _1337;
    if (!_1259)
    {
        _1331 = _1247;
    }
    float _1341 = _1331;
    float _1343 = _1341;
    if (_1259)
    {
        float _1345 = _1315 + (-1.0);
        _1333 = _1345;
    }
    float _1347 = _1333;
    float _1349 = _1347;
    if (_1259)
    {
        float _1351 = _1279 * _1337;
        _1041 = _1351;
    }
    float _1353 = _1041;
    if (!_1259)
    {
        _1339 = _1321;
    }
    float _1355 = _1339;
    float _1357 = _1355;
    if (_1259)
    {
        float _1359 = _1347 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1293 = _1359;
    }
    float _1361 = _1293;
    if (_1259)
    {
        float _1363 = _1247 * _1353;
        _1343 = _1363;
    }
    float _1365 = _1343;
    if (!_1259)
    {
        _1281 = _1251;
    }
    float _1367 = _1281;
    float _1369 = _1367;
    if (_1259)
    {
        float _1371 = _1249 * _1353;
        _1325 = _1371;
    }
    float _1373 = _1325;
    if (_1259)
    {
        float _1375 = fma(_1321, _1315, _1361);
        _1357 = _1375;
    }
    float _1377 = _1357;
    if (_1259)
    {
        float _1379 = _1365 * _1365;
        _1369 = _1379;
    }
    float _1381 = _1369;
    if (!_1259)
    {
        _1349 = _1253;
    }
    float _1383 = _1349;
    float _1385 = _1383;
    if (_1259)
    {
        float _1387 = _1373 * _1373;
        _1385 = _1387;
    }
    float _1389 = _1385;
    float _1391 = _1217 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1393 = fma(_1377, _1377, _1381);
    float _1395 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1397 = fma(_1219, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1391);
    float _1399 = _1393 + _1389;
    float _1401 = _1217 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1403 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1405 = fma(_1243, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1403);
    float _1407 = precise::clamp(_1405, 0.0, 1.0);
    float _1409 = fma(_1221, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1397);
    float _1411 = rsqrt(_1399);
    float _1413 = _1217 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1415 = -_1407;
    float _1417 = _1415 + 1.0;
    float _1419 = fma(_1219, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1401);
    float _1421 = _1409 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1423 = _1217 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1425 = fma(_1219, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1413);
    float _1427 = fma(_1221, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1419);
    float _1429 = abs(_1417);
    float _1431 = log2(_1429);
    float _1433 = _1421 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1435 = fma(_1219, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1423);
    float _1437 = fma(_1221, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1425);
    float _1439 = _1427 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1441 = -_1433;
    float _1443 = fma(_1441, _1395, 1.0);
    float _1445 = fma(_1221, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1435);
    float _1447 = _1437 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1449 = _1411 * _1365;
    float _1451 = _1439 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1453 = _1411 * _1377;
    float _1455 = _1445 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1457 = _1449 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1459 = fma(_1447, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1451);
    float _1461 = _1411 * _1373;
    float _1463 = log2(_1443);
    float _1465 = -_1457;
    float _1467 = fma(_1453, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1465);
    float _1469 = _1431 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1471 = fma(_1421, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1459);
    float _1473 = -_1461;
    float _1475 = fma(_1473, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1467);
    float _1477 = _1439 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1479 = fma(_1455, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1471);
    float _1481 = exp2(_1469);
    float _1483 = fma(_1475, -0.5, 0.5);
    float _1485 = _1439 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1487 = fma(_1475, 0.5, 0.5);
    float _1489 = fma(_1447, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1477);
    float _1491 = _1453 + 1.0;
    float _1493 = fma(_1447, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1485);
    float _1495 = 1.0 / _1479;
    float _1497 = fma(_1487, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1499 = fma(_1421, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1493);
    float _1501 = fma(_1421, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1489);
    float _1503 = _1463 * 0.693147182464599609375;
    float _1505 = fma(_1487, _1497, -0.212114393711090087890625);
    float _1507 = sqrt(_1483);
    float _1509 = -_1453;
    float _1511 = fma(_1481, _1491, _1509);
    float _1513 = fma(_1455, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1499);
    float _1515 = fma(_1455, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1501);
    float _1517 = fma(_1487, _1505, 1.570728778839111328125);
    float _1519 = _1503 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1521 = fma(_1511, 0.5, 0.5);
    float _1523 = _1513 * _1495;
    float _1525 = _1515 * _1495;
    float _1527 = fma(_1523, 0.5, 0.5);
    float _1529 = fma(_1525, -0.5, 0.5);
    float _1531 = _1507 * 0.636619746685028076171875;
    float3 _4110 = float3(_1527, _1529, _1519);
    float _1533 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4110, float3(0.0), isnan(_4110)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4110, float3(0.0), isnan(_4110)), level(0.0)).x;
    float3 _4121 = float3(_1527, _1529, _1519);
    float4 _1535 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4121, float3(0.0), isnan(_4121)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4121, float3(0.0), isnan(_4121)), level(0.0)).xyzw;
    float _1537 = _1535.x;
    float _1539 = _1535.y;
    float _1541 = _1535.z;
    float _1543 = _1535.w;
    float _1545 = -_1517;
    float _1547 = fma(_1531, _1545, 1.0);
    float2 _4142 = float2(_1547, _1521);
    float3 _1551 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4142, float2(0.0), isnan(_4142)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4142, float2(0.0), isnan(_4142)), level(0.0)).xyz;
    float _1553 = _1551.x;
    float _1555 = _1551.y;
    float _1557 = _1551.z;
    float _1559 = _1023 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1561 = _1439 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1563 = fma(_987, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1559);
    float _1565 = _1023 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1567 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1569 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1571 = _1567 || _1569;
    bool _1573 = isnan(0.5);
    bool _1575 = _1571 || _1573;
    float _1577 = fma(_1447, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1561);
    float _1579 = fma(_989, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1563);
    float _1581 = fma(_987, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1565);
    float _1583 = fma(_1421, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1577);
    float _1585 = _1579 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1587 = fma(_989, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1581);
    float _1589 = _1431 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1591 = 1.0 / _1585;
    float _1593 = _1587 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1595 = _1593 + _1585;
    float _1597 = _1527;
    float _1599 = _1529;
    float _1601 = _1447;
    float _1603 = _1431;
    if (!_1575)
    {
        _1597 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _1605 = _1597;
    float _1607 = exp2(_1589);
    if (!_1575)
    {
        float _1609 = -_1605;
        float _1611 = _1609 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _1043 = _1611;
    }
    float _1613 = _1043;
    float _1615 = _1595 * _1591;
    float _1617 = _1615 * 0.5;
    float _1619 = _1617;
    float _1621 = _1591;
    float _1623 = _1613;
    if (!_1575)
    {
        float _1625 = 1.0 / _1613;
        _1599 = _1625;
    }
    float _1627 = _1599;
    float _1629 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1631 = fma(_1617, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1629);
    if (!_1575)
    {
        _1619 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _1633 = _1619;
    float _1635 = -_1607;
    float _1637 = _1635 + 1.0;
    float _1639 = 1.0 / _1631;
    float _1641 = _1633;
    if (!_1575)
    {
        float _1643 = -_1633;
        float _1645 = _1643 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1621 = _1645;
    }
    float _1647 = _1621;
    if (_1575)
    {
        _1623 = 1.0;
    }
    float _1649 = _1623;
    float _1651 = _1637 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1653 = _1519;
    float _1655 = _1649;
    if (!_1575)
    {
        float _1657 = 1.0 / _1647;
        _1653 = _1657;
    }
    float _1659 = _1653;
    if (!_1575)
    {
        float _1661 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1663 = -_1605;
        float _1665 = fma(_1639, _1661, _1663);
        _1601 = _1665;
    }
    float _1667 = _1601;
    float _1669 = _1667;
    if (!_1575)
    {
        float _1671 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1673 = -_1633;
        float _1675 = fma(_1639, _1671, _1673);
        _1603 = _1675;
    }
    float _1677 = _1603;
    if (_1575)
    {
        _1641 = 1.0;
    }
    float _1679 = _1641;
    float _1681 = _1679;
    if (!_1575)
    {
        float _1683 = _1667 * _1627;
        float _1685 = precise::clamp(_1683, 0.0, 1.0);
        _1669 = _1685;
    }
    float _1687 = _1669;
    if (!_1575)
    {
        float _1689 = _1677 * _1659;
        float _1691 = precise::clamp(_1689, 0.0, 1.0);
        _1655 = _1691;
    }
    float _1693 = _1655;
    if (!_1575)
    {
        float _1695 = -_1687;
        float _1697 = _1695 + 1.0;
        _1681 = _1697;
    }
    float _1699 = _1681;
    float _1701 = fma(_1455, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1583);
    float _1703 = _1693 * _1699;
    bool _1705 = _1693 > 0.0;
    bool _1707 = isnan(_1693);
    bool _1709 = _1705 || _1707;
    bool _1711 = isnan(0.0);
    bool _1713 = _1709 || _1711;
    float _1715 = _1701 + _1479;
    float _1717 = _1703 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _1719 = _1699 <= 0.0;
    bool _1721 = !_1713;
    bool _1723 = _1719 || _1721;
    float _1725 = _1715 * 0.5;
    float _1727 = _1717 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_69.z = _1725;
    out.m_69.w = _1479;
    out.gl_Position.x = _1513;
    out.gl_Position.y = _1515;
    out.gl_Position.z = _1701;
    out.gl_Position.w = _1479;
    out.m_49.x = _1727;
    float _1729 = _1651 * _1533;
    float _1731 = _1543 * _1729;
    float _1733 = _1557 * _1729;
    float _1735 = -_1651;
    float _1737 = _1735 + 1.0;
    float _1739 = fma(_1553, _1731, _1537);
    float _1741 = fma(_1555, _1731, _1539);
    float _1743 = fma(_1543, _1733, _1541);
    float _1745 = _1543 * _1737;
    out.m_71.x = _1739;
    out.m_71.y = _1741;
    out.m_71.z = _1743;
    out.m_71.w = _1745;
    if (!_1723)
    {
        return out;
    }
    out.m_49.x = 0.0;
    float _1747 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1747;
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
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1173 = false;
    bool _311 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _91 = in.m_46.w;
    float _93 = trunc(_91);
    int _95 = int(_93);
    bool _99 = _95 >= 1;
    float _101 = 0.0;
    float _103 = as_type<float>(_95);
    if (!_99)
    {
        _101 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _105 = _101;
    if (!_99)
    {
        out.m_49.x = 0.0;
    }
    int _107 = 0;
    if (!_99)
    {
        float _109 = _105 * 5.0;
        _107 = as_type<int>(_109);
    }
    int _111 = _107;
    int _113 = _111;
    if (!_99)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1805 = as_type<float>(_111);
        out.gl_Position.z = _1805;
    }
    if (!_99)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _115 = in.m_51.w;
    float _117 = float(_95);
    float _119 = -_115;
    float _121 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _123 = _115 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _125 = isnan(_115);
    bool _127 = _123 || _125;
    bool _129 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _131 = _127 || _129;
    bool _133 = _121 >= _117;
    bool _135 = !_131;
    bool _137 = _133 || _135;
    float _139 = _121;
    if (_137)
    {
        _103 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _141 = _103;
    if (_137)
    {
        out.m_49.x = 0.0;
    }
    if (_137)
    {
        float _143 = _141 * 5.0;
        _113 = as_type<int>(_143);
    }
    int _145 = _113;
    if (_137)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1869 = as_type<float>(_145);
        out.gl_Position.z = _1869;
    }
    if (_137)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _147 = in.m_53.w;
    float _149 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _151 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _153 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _155 = _151 || _153;
    bool _157 = isnan(1.0);
    bool _159 = _155 || _157;
    float _161 = in.m_51.x;
    float _163 = in.m_51.y;
    float _165 = in.m_51.z;
    float _167 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _169 = in.m_46.x;
    float _171 = in.m_46.y;
    float _173 = in.m_46.z;
    float _175 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _177 = _167 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _179 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _181 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _183 = _175 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _185 = 0.0;
    float _187 = _149;
    if (!_159)
    {
        float _189 = _149 * _149;
        float _191 = _189 * 0.5;
        _185 = _191;
    }
    float _193 = _185;
    float _195 = _179 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _197 = _193;
    if (!_159)
    {
        float _199 = _193 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _197 = _199;
    }
    float _201 = _197;
    bool _203 = !_159;
    float _205 = _201;
    if (!_203)
    {
        float _207 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _209 = log2(_207);
        float _211 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _213 = _211 + 1.0;
        float _215 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _217 = _149 * _209;
        float _219 = 1.0 / _213;
        float _221 = _215 * 0.693147182464599609375;
        float _223 = exp2(_217);
        float _225 = 1.0 / _221;
        float _227 = _223 + (-1.0);
        float _229 = -_227;
        float _231 = fma(_229, _225, _149);
        float _233 = _231 * _219;
        float _235 = _233 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _205 = _235;
    }
    float _237 = _205;
    bool _239 = !_159;
    if (!_239)
    {
        float _241 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _243 = log2(_241);
        float _245 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _247 = _245 + 1.0;
        float _249 = 1.0 / _247;
        float _251 = _149 * _243;
        float _253 = exp2(_251);
        float _255 = -_253;
        float _257 = _255 + 1.0;
        float _259 = _257 * _249;
        _187 = _259;
    }
    float _261 = _187;
    out.m_55.x = _177;
    out.m_55.y = _183;
    out.m_55.z = _195;
    out.m_55.w = _181;
    float _263 = 1.0 / _117;
    bool _265 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _267 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _269 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _271 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _273 = fma(_261, _161, _267);
    float _275 = fma(_261, _163, _269);
    float _277 = fma(_261, _165, _271);
    float _279 = fma(_273, _147, _169);
    float _281 = fma(_275, _147, _171);
    float _283 = fma(_277, _147, _173);
    float _285 = _121 * _263;
    bool _287 = !_265;
    float _289 = _283;
    float _291 = _279;
    float _309;
    if (!_287)
    {
        float _293 = in.m_57.x;
        float _295 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _297 = _293 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _299 = fma(_297, (*spvDescriptorSet0.vp_c9)._m0[11].w, _121);
        float _301 = _299 * _295;
        float _303 = floor(_301);
        float _305 = -_303;
        float _307 = _301 + _305;
        _309 = _307;
        _311 = true;
    }
    else
    {
        _309 = _285;
    }
    _311 = false;
    float _313 = _309;
    int _315 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _317 = _315;
    int _319 = 0;
    int _321 = _86(_317, _319, (*spvDescriptorSet0.support_buffer));
    float _323 = in.m_59.z;
    float _325 = 0.0 + _285;
    float _327 = precise::clamp(_325, 0.0, 1.0);
    float _329 = trunc(_323);
    int _331 = int(_329);
    int _333 = _321 + (-1);
    float _335 = float(_333);
    float _337 = _327 * _335;
    float _339 = trunc(_337);
    int _341 = int(_339);
    int _343 = _341;
    int _345 = 0;
    int _347 = _87(_343, _345, (*spvDescriptorSet0.support_buffer));
    int _349 = _331;
    int _351 = 0;
    int _353 = _87(_349, _351, (*spvDescriptorSet0.support_buffer));
    float4 _356 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_347, _353)), 0).xyzw;
    float _358 = _356.x;
    float _360 = _356.y;
    float _362 = _356.z;
    float _364 = _356.w;
    float _366 = in.m_57.x;
    float _368 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _370 = in.m_59.y;
    float _372 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _374 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _376 = _374 != 0;
    float _378 = in.m_57.y;
    int _380 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _382 = _380 != 0;
    float _384 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _386 = in.m_57.z;
    int _388 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _390 = _388 != 0;
    int _392 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _394 = _392 != 0;
    float _396 = in.m_57.w;
    int _398 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _400 = _398 != 0;
    float _402 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _404 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _406 = _404 != 0;
    float _408 = in.m_59.x;
    float _410 = _366 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _412 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[78].z, _402);
    float _414 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _416 = -_372;
    float _418 = fma(_410, 2.0, _416);
    float _420 = -_370;
    float _422 = _420 + 1.0;
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _426 = _424 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _428 = _378 > 0.5;
    bool _430 = _428 && _382;
    float _432 = _378 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _436 = _434 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _438 = fma(_378, (*spvDescriptorSet0.vp_c9)._m0[78].w, _414);
    bool _440 = _386 > 0.5;
    float _442 = 1.0 / _436;
    float _444 = _430 ? _422 : _370;
    float _446 = fma(_432, -2.0, _384);
    bool _448 = _430;
    float _450 = _446;
    int _452 = as_type<int>(_313);
    float _454 = _370;
    if (_376)
    {
        bool _456 = _366 > 0.5;
        _448 = _456;
    }
    bool _458 = _448;
    float _460 = -_121;
    float _462 = fma(_460, (*spvDescriptorSet0.vp_c9)._m0[76].x, _418);
    int _464 = _440 ? as_type<int>(_422) : as_type<int>(_370);
    float _466 = 1.0 / _426;
    bool _468 = _396 > 0.5;
    bool _470 = _468 && _406;
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _474 = _472 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _476 = _400 ? as_type<float>(_464) : _370;
    bool _478 = _378 > 0.5;
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _482 = _480 + (*spvDescriptorSet0.vp_c9)._m0[135].w;
    float _484 = 1.0 / _474;
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _488 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _486;
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _492 = _490 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _494 = _488 * _442;
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[135].w;
    float _498 = _496 + (*spvDescriptorSet0.vp_c9)._m0[136].w;
    bool _500 = _313 >= (*spvDescriptorSet0.vp_c9)._m0[136].w;
    bool _502 = isnan(_313);
    bool _504 = _500 || _502;
    bool _506 = isnan((*spvDescriptorSet0.vp_c9)._m0[136].w);
    bool _508 = _504 || _506;
    float _510 = float(_508);
    float _512 = 1.0 / _482;
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _516 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _514;
    bool _518 = _313 >= (*spvDescriptorSet0.vp_c9)._m0[135].w;
    bool _520 = isnan(_313);
    bool _522 = _518 || _520;
    bool _524 = isnan((*spvDescriptorSet0.vp_c9)._m0[135].w);
    bool _526 = _522 || _524;
    float _528 = float(_526);
    float _530 = _492 * _466;
    float _532 = -_510;
    float _534 = _532 + 1.0;
    bool _536 = _313 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _538 = isnan(_313);
    bool _540 = _536 || _538;
    bool _542 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _544 = _540 || _542;
    float _546 = float(_544);
    float _548 = -(*spvDescriptorSet0.vp_c9)._m0[134].x;
    float _550 = _548 + (*spvDescriptorSet0.vp_c9)._m0[135].x;
    float _552 = _470 ? _422 : _370;
    float _554 = 1.0 / _498;
    float _556 = _516 * _484;
    bool _558 = _313 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _560 = isnan(_313);
    bool _562 = _558 || _560;
    bool _564 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _566 = _562 || _564;
    float _568 = float(_566);
    float _570 = -_528;
    float _572 = _570 + 1.0;
    float _574 = _528 * _534;
    float _576 = -_546;
    float _578 = _576 + 1.0;
    float _580 = _476 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _582 = _568 * _572;
    float _584 = -_568;
    float _586 = _584 + 1.0;
    float _588 = -(*spvDescriptorSet0.vp_c9)._m0[135].x;
    float _590 = (*spvDescriptorSet0.vp_c9)._m0[136].x + _588;
    bool _592 = _313 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _594 = isnan(_313);
    bool _596 = _592 || _594;
    bool _598 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _600 = _596 || _598;
    float _602 = float(_600);
    float _604 = _550 * _512;
    bool _606 = _313 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _608 = isnan(_313);
    bool _610 = _606 || _608;
    bool _612 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _614 = _610 || _612;
    float _616 = float(_614);
    float _618 = _546 * _586;
    float _620 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _622 = _313 + _620;
    float _624 = _602 * _578;
    float _626 = _590 * _554;
    float _628 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _630 = _313 + _628;
    float _632 = -_602;
    float _634 = _632 + 1.0;
    float _636 = fma(_530, _622, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _638 = -(*spvDescriptorSet0.vp_c9)._m0[135].w;
    float _640 = _313 + _638;
    float _642 = fma(_494, _630, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _644 = _616 * _634;
    float _646 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].z, _412);
    float _648 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[76].y, _446);
    float _650 = -_616;
    float _652 = _650 + 1.0;
    float _654 = _642 * _644;
    int _656 = as_type<int>(_582);
    if (!_376)
    {
        _450 = _408;
    }
    float _658 = _450;
    float _660 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].w, _438);
    float _662 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _664 = _313 + _662;
    float _666 = fma(_652, (*spvDescriptorSet0.vp_c9)._m0[131].x, _654);
    float _668 = _658;
    if (!_376)
    {
        _139 = _658;
    }
    float _670 = _139;
    float _672 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _674 = _670;
    if (_376)
    {
        _668 = _408;
    }
    float _676 = _668;
    float _678 = fma(_556, _664, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _680 = fma(_636, _624, _666);
    float _682 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _684 = _313 + _682;
    float _686 = fma(_626, _640, (*spvDescriptorSet0.vp_c9)._m0[135].x);
    float _688 = _676;
    if (_376)
    {
        float _690 = -_676;
        float _692 = _690 + 1.0;
        _452 = as_type<int>(_692);
    }
    int _694 = _452;
    float _696 = fma(_678, _618, _680);
    float _698 = fma(_604, _684, (*spvDescriptorSet0.vp_c9)._m0[134].x);
    if (!_394)
    {
        _454 = _676;
    }
    float _700 = _454;
    float _702 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _704 = _700;
    if (_376)
    {
        float _706 = _458 ? as_type<float>(_694) : _676;
        _674 = _706;
    }
    float _708 = _674;
    float _710 = fma(_698, _582, _696);
    float _712 = _368 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (_394)
    {
        float _714 = -_676;
        float _716 = _714 + 1.0;
        _656 = as_type<int>(_716);
    }
    int _718 = _656;
    float _720 = _672 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _722 = fma(_712, _444, -0.5);
    float _724 = fma(_686, _574, _710);
    if (_394)
    {
        float _726 = _478 ? as_type<float>(_718) : _676;
        _704 = _726;
    }
    float _728 = _704;
    float _730 = fma(_720, _708, -0.5);
    float _732 = -_648;
    float _734 = fma(_660, _722, _732);
    int _736 = _341 + 1;
    float _738 = fma(_510, (*spvDescriptorSet0.vp_c9)._m0[136].x, _724);
    float _740 = _728 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _742 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _744 = min(_333, _736);
    float _746 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _748 = _580 * _702;
    float _750 = _742 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _752 = _738 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _754 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _756 = fma(_646, _730, _462);
    float _758 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _760 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _762 = _754 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _764 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[123].y);
    if (_390)
    {
        float _766 = -_676;
        float _768 = _766 + 1.0;
        _764 = as_type<int>(_768);
    }
    int _770 = _764;
    float _772 = _758 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _774 = _552 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _776 = _740 * _746;
    out.m_61.x = _762;
    out.m_61.y = _772;
    out.m_61.z = _750;
    out.m_61.w = _752;
    if (_390)
    {
        float _778 = _440 ? as_type<float>(_770) : _676;
        _688 = _778;
    }
    float _780 = _688;
    out.m_63.x = _776;
    out.m_63.y = _748;
    float _782 = _774 * _760;
    float _784 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _786 = _780 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _788 = _734 + 0.5;
    float _790 = _786 * _784;
    uint _793 = as_type<uint>(half2(float2(_364, 0.0)));
    uint _795 = extract_bits(_793, 0u, 8u);
    int _797 = int(_795) & 255;
    uint _799 = extract_bits(_793, 8u, 8u);
    int _801 = int(_799) & 255;
    int _803 = _801 << 8;
    int _805 = _797 | _803;
    bool _807 = _805 >= 32768;
    int _809 = _805 + (-1024);
    int _811 = _809;
    if (_807)
    {
        int _813 = ~_805;
        int _815 = _813 + 33792;
        int _817 = _815 + 1;
        _811 = _817;
    }
    int _819 = _811;
    int _821 = _819 + 30719;
    float _823 = float(_821);
    float _825 = fma(_823, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _827 = abs(_825);
    float _829 = -_827;
    float _831 = _829 + 1.0;
    int _833 = as_type<int>(_831) + (-218103808);
    bool _835 = uint(_833) >= 1920991232u;
    float _837 = _756 + 0.5;
    bool _839 = !_835;
    if (!_839)
    {
        int _841;
        _84(_841, out.gl_Position, out.gl_PointSize);
    }
    int _843 = _744;
    int _845 = 0;
    int _847 = _87(_843, _845, (*spvDescriptorSet0.support_buffer));
    int _849 = _331;
    int _851 = 0;
    int _853 = _87(_849, _851, (*spvDescriptorSet0.support_buffer));
    float4 _855 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_847, _853)), 0).xyzw;
    float _857 = _855.x;
    float _859 = _855.y;
    float _861 = _855.z;
    float _863 = _855.w;
    float _865 = floor(_337);
    float _867 = -_865;
    float _869 = _337 + _867;
    uint _871 = as_type<uint>(half2(float2(_863, 0.0)));
    float _873 = -_358;
    float _875 = _873 + _857;
    uint _877 = extract_bits(_871, 0u, 8u);
    int _879 = int(_877) & 255;
    uint _881 = extract_bits(_871, 8u, 8u);
    int _883 = int(_881) & 255;
    int _885 = _883 << 8;
    int _887 = _879 | _885;
    float _889 = fma(_869, _875, _358);
    bool _891 = _887 >= 32768;
    int _893 = _887 + (-1024);
    int _895 = _893;
    if (_891)
    {
        int _897 = ~_887;
        int _899 = _897 + 33792;
        int _901 = _899 + 1;
        _895 = _901;
    }
    int _903 = _895;
    int _905 = _903 + 30719;
    float _907 = float(_905);
    float _909 = fma(_907, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _911 = -_362;
    float _913 = _911 + _861;
    float _915 = abs(_909);
    float _917 = -_915;
    float _919 = _917 + 1.0;
    float _921 = fma(_869, _913, _362);
    int _923 = as_type<int>(_919) + (-218103808);
    bool _925 = uint(_923) >= 1920991232u;
    float _927 = -_360;
    float _929 = _927 + _859;
    float _931 = fma(_869, _929, _360);
    bool _933 = !_925;
    if (!_933)
    {
        int _935;
        _84(_935, out.gl_Position, out.gl_PointSize);
    }
    float _937 = in.m_53.x;
    float _939 = in.m_53.y;
    float _941 = in.m_53.z;
    float _943 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _889);
    float _945 = _937 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _947 = _939 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _949 = _941 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _951 = _945 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _953 = _947 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _955 = _949 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _957 = _951 * _943;
    float _959 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _931);
    float _961 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _921);
    float _963 = _281 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _965 = _281 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _967 = _953 * _959;
    float _969 = _955 * _961;
    float _971 = fma(_279, (*spvDescriptorSet0.vp_c10)._m0[4].x, _963);
    float _973 = fma(_279, (*spvDescriptorSet0.vp_c10)._m0[6].x, _965);
    float _975 = _967 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _977 = _967 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _979 = fma(_283, (*spvDescriptorSet0.vp_c10)._m0[4].z, _971);
    float _981 = fma(_283, (*spvDescriptorSet0.vp_c10)._m0[6].z, _973);
    float _983 = fma(_957, (*spvDescriptorSet0.vp_c10)._m0[8].x, _975);
    float _985 = fma(_957, (*spvDescriptorSet0.vp_c10)._m0[10].x, _977);
    float _987 = _979 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _989 = _981 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _991 = fma(_969, (*spvDescriptorSet0.vp_c10)._m0[8].z, _983);
    float _993 = fma(_969, (*spvDescriptorSet0.vp_c10)._m0[10].z, _985);
    float _995 = _281 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _997 = _967 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _999 = _987 + _991;
    float _1001 = _989 + _993;
    float _1003 = fma(_279, (*spvDescriptorSet0.vp_c10)._m0[5].x, _995);
    float _1005 = fma(_957, (*spvDescriptorSet0.vp_c10)._m0[9].x, _997);
    float _1007 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1009 = _999 + _1007;
    float _1011 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1013 = _1001 + _1011;
    float _1015 = fma(_283, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1003);
    float _1017 = fma(_969, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1005);
    float _1019 = _1009 * _1009;
    float _1021 = _1013 * _1013;
    float _1023 = _1015 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1025 = _1019 + _1021;
    float _1027 = _1023 + _1017;
    float _1029 = sqrt(_1025);
    bool _1031 = _1029 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1033 = _997;
    float _1035 = _999;
    float _1037 = _1003;
    float _1039 = _1021;
    float _1041 = _1025;
    float _1043 = _989;
    if (!_1031)
    {
        _289 = _999;
    }
    float _1045 = _289;
    float _1047 = _1045;
    if (!_1031)
    {
        _1033 = _1019;
    }
    float _1049 = _1033;
    float _1051 = _1049;
    if (!_1031)
    {
        _1035 = _1001;
    }
    float _1053 = _1035;
    float _1055 = _1053;
    if (!_1031)
    {
        _1037 = _1027;
    }
    float _1057 = _1037;
    bool _1059 = !_1031;
    float _1061 = _1057;
    if (!_1059)
    {
        float _1063 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1065 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1067 = _1029 + _1065;
        float _1069 = rsqrt(_1025);
        float _1071 = _1067 * _1063;
        float _1073 = _1027 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1075 = _1071 * 0.15915493667125701904296875;
        float _1077 = _1075 * 6.283185482025146484375;
        float _1079 = sin(_1077);
        float _1081 = _1075 * 6.283185482025146484375;
        float _1083 = cos(_1081);
        float _1085 = fma(_1079, _1073, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1087 = _1069 * _1085;
        float _1089 = _1083 + (-1.0);
        float _1091 = _1089 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1093 = _1009 * _1087;
        float _1095 = _1013 * _1087;
        float _1097 = fma(_1027, _1083, _1091);
        float _1099 = _1093 + (*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1101 = _1095 + (*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1103 = _1093 * _1093;
        float _1105 = _1095 * _1095;
        _1061 = _1097;
        _1051 = _1103;
        _1039 = _1105;
        _1047 = _1099;
        _1055 = _1101;
    }
    float _1107 = _1061;
    float _1109 = _1051;
    float _1111 = _1039;
    float _1113 = _1047;
    float _1115 = _1055;
    float _1117 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1119 = _1107 + _1117;
    out.m_65.x = _837;
    out.m_65.y = _788;
    out.m_65.z = _790;
    out.m_65.w = _782;
    float _1121 = fma(_1119, _1119, _1109);
    float _1123 = _1121 + _1111;
    float _1125 = sqrt(_1123);
    out.m_67.x = 1.0;
    out.m_67.y = 1.0;
    out.m_67.z = 1.0;
    bool _1127 = _1125 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1129 = isnan(_1125);
    bool _1131 = _1127 || _1129;
    bool _1133 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1135 = _1131 || _1133;
    float _1137 = _1125;
    if (!_1135)
    {
        _291 = 1.0;
    }
    float _1139 = _291;
    bool _1141 = !_1135;
    float _1143 = _1139;
    if (!_1141)
    {
        bool _1145 = _1125 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1147 = isnan(_1125);
        bool _1149 = _1145 || _1147;
        bool _1151 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1153 = _1149 || _1151;
        if (!_1153)
        {
            float _1155 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1157 = _1125 + _1155;
            float _1159 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1161 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1159;
            float _1163 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1165 = _1163 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1167 = 1.0 / _1161;
            float _1169 = _1157 * _1167;
            float _1171 = fma(_1169, _1165, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1143 = _1171;
            _1173 = true;
        }
        else
        {
            bool _1175 = _1125 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1177 = isnan(_1125);
            bool _1179 = _1175 || _1177;
            bool _1181 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1183 = _1179 || _1181;
            if (!_1183)
            {
                float _1185 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1187 = _1125 + _1185;
                float _1189 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1191 = _1189 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1193 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1195 = _1193 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1197 = 1.0 / _1191;
                float _1199 = _1187 * _1197;
                float _1201 = fma(_1199, _1195, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1143 = _1201;
                _1173 = true;
            }
            else
            {
                _1143 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1173 = false;
    float _1203 = _1143;
    float _1205 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1207 = _1107 + _1205;
    float _1209 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1211 = _1113 + _1209;
    float _1213 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1215 = _1115 + _1213;
    float _1217 = fma(_1207, _1203, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1219 = fma(_1211, _1203, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1221 = fma(_1215, _1203, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1223 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1225 = _1217 + _1223;
    float _1227 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1229 = _1219 + _1227;
    float _1231 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1233 = _1221 + _1231;
    float _1235 = _1225 * _1225;
    float _1237 = fma(_1229, _1229, _1235);
    float _1239 = fma(_1233, _1233, _1237);
    float _1241 = rsqrt(_1239);
    float _1243 = sqrt(_1239);
    float _1245 = _1241 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1247 = _1229 * _1245;
    float _1249 = _1233 * _1245;
    float _1251 = _1247 * _1247;
    float _1253 = _1249 * _1249;
    float _1255 = _1251 + _1253;
    float _1257 = sqrt(_1255);
    bool _1259 = _1257 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1261 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1263 = _1257 + _1261;
    float _1265 = _1233;
    float _1267 = _1255;
    float _1269 = _1263;
    float _1271 = _1225;
    if (_1259)
    {
        float _1273 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1265 = _1273;
    }
    float _1275 = _1265;
    if (_1259)
    {
        float _1277 = rsqrt(_1255);
        _1267 = _1277;
    }
    float _1279 = _1267;
    float _1281 = _1279;
    if (_1259)
    {
        float _1283 = _1263 * _1275;
        _1269 = _1283;
    }
    float _1285 = _1269;
    if (_1259)
    {
        float _1287 = _1285 * 0.15915493667125701904296875;
        _1137 = _1287;
    }
    float _1289 = _1137;
    float _1291 = _1241;
    float _1293 = _1289;
    if (_1259)
    {
        float _1295 = _1289 * 6.283185482025146484375;
        float _1297 = sin(_1295);
        _1291 = _1297;
    }
    float _1299 = _1291;
    float _1301 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1303 = precise::max(0.0, _1301);
    float _1305 = _1237;
    float _1307 = _1303;
    float _1309 = _1301;
    if (_1259)
    {
        float _1311 = _1289 * 6.283185482025146484375;
        float _1313 = cos(_1311);
        _1305 = _1313;
    }
    float _1315 = _1305;
    float _1317 = -_1245;
    float _1319 = -_1303;
    float _1321 = fma(_1225, _1317, _1319);
    if (!_1259)
    {
        _1307 = _1249;
    }
    float _1323 = _1307;
    float _1325 = _1323;
    if (_1259)
    {
        float _1327 = _1321 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1309 = _1327;
    }
    float _1329 = _1309;
    float _1331 = _1299;
    float _1333 = _1329;
    if (_1259)
    {
        float _1335 = fma(_1299, _1329, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1271 = _1335;
    }
    float _1337 = _1271;
    float _1339 = _1337;
    if (!_1259)
    {
        _1331 = _1247;
    }
    float _1341 = _1331;
    float _1343 = _1341;
    if (_1259)
    {
        float _1345 = _1315 + (-1.0);
        _1333 = _1345;
    }
    float _1347 = _1333;
    float _1349 = _1347;
    if (_1259)
    {
        float _1351 = _1279 * _1337;
        _1041 = _1351;
    }
    float _1353 = _1041;
    if (!_1259)
    {
        _1339 = _1321;
    }
    float _1355 = _1339;
    float _1357 = _1355;
    if (_1259)
    {
        float _1359 = _1347 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1293 = _1359;
    }
    float _1361 = _1293;
    if (_1259)
    {
        float _1363 = _1247 * _1353;
        _1343 = _1363;
    }
    float _1365 = _1343;
    if (!_1259)
    {
        _1281 = _1251;
    }
    float _1367 = _1281;
    float _1369 = _1367;
    if (_1259)
    {
        float _1371 = _1249 * _1353;
        _1325 = _1371;
    }
    float _1373 = _1325;
    if (_1259)
    {
        float _1375 = fma(_1321, _1315, _1361);
        _1357 = _1375;
    }
    float _1377 = _1357;
    if (_1259)
    {
        float _1379 = _1365 * _1365;
        _1369 = _1379;
    }
    float _1381 = _1369;
    if (!_1259)
    {
        _1349 = _1253;
    }
    float _1383 = _1349;
    float _1385 = _1383;
    if (_1259)
    {
        float _1387 = _1373 * _1373;
        _1385 = _1387;
    }
    float _1389 = _1385;
    float _1391 = _1217 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1393 = fma(_1377, _1377, _1381);
    float _1395 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1397 = fma(_1219, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1391);
    float _1399 = _1393 + _1389;
    float _1401 = _1217 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1403 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1405 = fma(_1243, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1403);
    float _1407 = precise::clamp(_1405, 0.0, 1.0);
    float _1409 = fma(_1221, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1397);
    float _1411 = rsqrt(_1399);
    float _1413 = _1217 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1415 = -_1407;
    float _1417 = _1415 + 1.0;
    float _1419 = fma(_1219, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1401);
    float _1421 = _1409 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1423 = _1217 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1425 = fma(_1219, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1413);
    float _1427 = fma(_1221, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1419);
    float _1429 = abs(_1417);
    float _1431 = log2(_1429);
    float _1433 = _1421 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1435 = fma(_1219, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1423);
    float _1437 = fma(_1221, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1425);
    float _1439 = _1427 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1441 = -_1433;
    float _1443 = fma(_1441, _1395, 1.0);
    float _1445 = fma(_1221, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1435);
    float _1447 = _1437 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1449 = _1411 * _1365;
    float _1451 = _1439 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1453 = _1411 * _1377;
    float _1455 = _1445 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1457 = _1449 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1459 = fma(_1447, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1451);
    float _1461 = _1411 * _1373;
    float _1463 = log2(_1443);
    float _1465 = -_1457;
    float _1467 = fma(_1453, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1465);
    float _1469 = _1431 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1471 = fma(_1421, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1459);
    float _1473 = -_1461;
    float _1475 = fma(_1473, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1467);
    float _1477 = _1439 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1479 = fma(_1455, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1471);
    float _1481 = exp2(_1469);
    float _1483 = fma(_1475, -0.5, 0.5);
    float _1485 = _1439 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1487 = fma(_1475, 0.5, 0.5);
    float _1489 = fma(_1447, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1477);
    float _1491 = _1453 + 1.0;
    float _1493 = fma(_1447, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1485);
    float _1495 = 1.0 / _1479;
    float _1497 = fma(_1487, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1499 = fma(_1421, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1493);
    float _1501 = fma(_1421, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1489);
    float _1503 = _1463 * 0.693147182464599609375;
    float _1505 = fma(_1487, _1497, -0.212114393711090087890625);
    float _1507 = sqrt(_1483);
    float _1509 = -_1453;
    float _1511 = fma(_1481, _1491, _1509);
    float _1513 = fma(_1455, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1499);
    float _1515 = fma(_1455, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1501);
    float _1517 = fma(_1487, _1505, 1.570728778839111328125);
    float _1519 = _1503 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1521 = fma(_1511, 0.5, 0.5);
    float _1523 = _1513 * _1495;
    float _1525 = _1515 * _1495;
    float _1527 = fma(_1523, 0.5, 0.5);
    float _1529 = fma(_1525, -0.5, 0.5);
    float _1531 = _1507 * 0.636619746685028076171875;
    float3 _4110 = float3(_1527, _1529, _1519);
    float _1533 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4110, float3(0.0), isnan(_4110)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4110, float3(0.0), isnan(_4110)), level(0.0)).x;
    float3 _4121 = float3(_1527, _1529, _1519);
    float4 _1535 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4121, float3(0.0), isnan(_4121)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4121, float3(0.0), isnan(_4121)), level(0.0)).xyzw;
    float _1537 = _1535.x;
    float _1539 = _1535.y;
    float _1541 = _1535.z;
    float _1543 = _1535.w;
    float _1545 = -_1517;
    float _1547 = fma(_1531, _1545, 1.0);
    float2 _4142 = float2(_1547, _1521);
    float3 _1551 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4142, float2(0.0), isnan(_4142)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4142, float2(0.0), isnan(_4142)), level(0.0)).xyz;
    float _1553 = _1551.x;
    float _1555 = _1551.y;
    float _1557 = _1551.z;
    float _1559 = _1023 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1561 = _1439 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1563 = fma(_987, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1559);
    float _1565 = _1023 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1567 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1569 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1571 = _1567 || _1569;
    bool _1573 = isnan(0.5);
    bool _1575 = _1571 || _1573;
    float _1577 = fma(_1447, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1561);
    float _1579 = fma(_989, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1563);
    float _1581 = fma(_987, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1565);
    float _1583 = fma(_1421, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1577);
    float _1585 = _1579 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1587 = fma(_989, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1581);
    float _1589 = _1431 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1591 = 1.0 / _1585;
    float _1593 = _1587 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1595 = _1593 + _1585;
    float _1597 = _1527;
    float _1599 = _1529;
    float _1601 = _1447;
    float _1603 = _1431;
    if (!_1575)
    {
        _1597 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _1605 = _1597;
    float _1607 = exp2(_1589);
    if (!_1575)
    {
        float _1609 = -_1605;
        float _1611 = _1609 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _1043 = _1611;
    }
    float _1613 = _1043;
    float _1615 = _1595 * _1591;
    float _1617 = _1615 * 0.5;
    float _1619 = _1617;
    float _1621 = _1591;
    float _1623 = _1613;
    if (!_1575)
    {
        float _1625 = 1.0 / _1613;
        _1599 = _1625;
    }
    float _1627 = _1599;
    float _1629 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1631 = fma(_1617, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1629);
    if (!_1575)
    {
        _1619 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _1633 = _1619;
    float _1635 = -_1607;
    float _1637 = _1635 + 1.0;
    float _1639 = 1.0 / _1631;
    float _1641 = _1633;
    if (!_1575)
    {
        float _1643 = -_1633;
        float _1645 = _1643 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1621 = _1645;
    }
    float _1647 = _1621;
    if (_1575)
    {
        _1623 = 1.0;
    }
    float _1649 = _1623;
    float _1651 = _1637 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1653 = _1519;
    float _1655 = _1649;
    if (!_1575)
    {
        float _1657 = 1.0 / _1647;
        _1653 = _1657;
    }
    float _1659 = _1653;
    if (!_1575)
    {
        float _1661 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1663 = -_1605;
        float _1665 = fma(_1639, _1661, _1663);
        _1601 = _1665;
    }
    float _1667 = _1601;
    float _1669 = _1667;
    if (!_1575)
    {
        float _1671 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1673 = -_1633;
        float _1675 = fma(_1639, _1671, _1673);
        _1603 = _1675;
    }
    float _1677 = _1603;
    if (_1575)
    {
        _1641 = 1.0;
    }
    float _1679 = _1641;
    float _1681 = _1679;
    if (!_1575)
    {
        float _1683 = _1667 * _1627;
        float _1685 = precise::clamp(_1683, 0.0, 1.0);
        _1669 = _1685;
    }
    float _1687 = _1669;
    if (!_1575)
    {
        float _1689 = _1677 * _1659;
        float _1691 = precise::clamp(_1689, 0.0, 1.0);
        _1655 = _1691;
    }
    float _1693 = _1655;
    if (!_1575)
    {
        float _1695 = -_1687;
        float _1697 = _1695 + 1.0;
        _1681 = _1697;
    }
    float _1699 = _1681;
    float _1701 = fma(_1455, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1583);
    float _1703 = _1693 * _1699;
    bool _1705 = _1693 > 0.0;
    bool _1707 = isnan(_1693);
    bool _1709 = _1705 || _1707;
    bool _1711 = isnan(0.0);
    bool _1713 = _1709 || _1711;
    float _1715 = _1701 + _1479;
    float _1717 = _1703 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _1719 = _1699 <= 0.0;
    bool _1721 = !_1713;
    bool _1723 = _1719 || _1721;
    float _1725 = _1715 * 0.5;
    float _1727 = _1717 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_69.z = _1725;
    out.m_69.w = _1479;
    out.gl_Position.x = _1513;
    out.gl_Position.y = _1515;
    out.gl_Position.z = _1701;
    out.gl_Position.w = _1479;
    out.m_49.x = _1727;
    float _1729 = _1651 * _1533;
    float _1731 = _1543 * _1729;
    float _1733 = _1557 * _1729;
    float _1735 = -_1651;
    float _1737 = _1735 + 1.0;
    float _1739 = fma(_1553, _1731, _1537);
    float _1741 = fma(_1555, _1731, _1539);
    float _1743 = fma(_1543, _1733, _1541);
    float _1745 = _1543 * _1737;
    out.m_71.x = _1739;
    out.m_71.y = _1741;
    out.m_71.z = _1743;
    out.m_71.w = _1745;
    if (!_1723)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_49.x = 0.0;
    float _1747 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1747;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}


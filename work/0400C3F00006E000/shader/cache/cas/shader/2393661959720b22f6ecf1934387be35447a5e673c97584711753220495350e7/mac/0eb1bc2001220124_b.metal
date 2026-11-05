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
    float4 m_64 [[user(locn0)]];
    float4 m_72 [[user(locn1)]];
    float4 m_90 [[user(locn2)]];
    float4 m_55 [[user(locn4)]];
    float4 m_82 [[user(locn5)]];
    float4 m_57 [[user(locn6)]];
    float4 m_68 [[user(locn7)]];
    float4 m_74 [[user(locn9)]];
    float4 m_76 [[user(locn10)]];
    float4 m_88 [[user(locn11)]];
    float4 m_78 [[user(locn12)]];
    float4 m_84 [[user(locn13)]];
    float4 m_86 [[user(locn14)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
    float4 dm_pad3 [[user(locn3)]];
};

struct main0_in
{
    float4 m_80 [[attribute(0)]];
    float4 m_70 [[attribute(1)]];
    float4 m_50 [[attribute(2)]];
    float4 m_52 [[attribute(3)]];
    float4 m_62 [[attribute(4)]];
    float4 m_66 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.dm_pad3 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2697 = false;
    bool _1882 = false;
    bool _315 = false;
    bool _205 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _104 = in.m_50.w;
    float _106 = in.m_52.w;
    float _108 = trunc(_104);
    int _111 = int(_108);
    float _113 = -_106;
    float _115 = _113 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_55.y = _115;
    bool _119 = _111 >= 1;
    float _121 = 0.0;
    float _123 = as_type<float>(_111);
    float _125 = _115;
    if (!_119)
    {
        _121 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _127 = _121;
    if (!_119)
    {
        out.m_57.x = 0.0;
    }
    int _129 = 0;
    if (!_119)
    {
        float _131 = _127 * 5.0;
        _129 = as_type<int>(_131);
    }
    int _133 = _129;
    int _135 = _133;
    if (!_119)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3008 = as_type<float>(_133);
        out.gl_Position.z = _3008;
    }
    if (!_119)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _137 = _106 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _139 = isnan(_106);
    bool _141 = _137 || _139;
    bool _143 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _145 = _141 || _143;
    float _147 = float(_111);
    bool _149 = _115 >= _147;
    bool _151 = !_145;
    bool _153 = _149 || _151;
    if (_153)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _155 = _123;
    if (_153)
    {
        out.m_57.x = 0.0;
    }
    if (_153)
    {
        float _157 = _155 * 5.0;
        _135 = as_type<int>(_157);
    }
    int _159 = _135;
    if (_153)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3063 = as_type<float>(_159);
        out.gl_Position.z = _3063;
    }
    if (_153)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _161 = as_type<float>(int(gl_VertexIndex));
    float _163 = 1.0 / _147;
    bool _165 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _167 = _115 * _163;
    int _169 = as_type<int>(_161) & 1;
    bool _171 = _169 != 0;
    int _173 = as_type<int>(_161) & 2;
    bool _175 = _173 != 0;
    bool _177 = !_171;
    float _179 = _177 ? (-0.5) : 0.5;
    bool _181 = !_175;
    float _183 = _181 ? (-0.5) : 0.5;
    bool _185 = !_165;
    float _203;
    if (!_185)
    {
        float _187 = in.m_62.x;
        float _189 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _191 = _187 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _193 = fma(_191, (*spvDescriptorSet0.vp_c9)._m0[12].x, _115);
        float _195 = _193 * _189;
        float _197 = floor(_195);
        float _199 = -_197;
        float _201 = _195 + _199;
        _203 = _201;
        _205 = true;
    }
    else
    {
        _203 = _167;
    }
    _205 = false;
    float _207 = _203;
    float _209 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _211 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _209;
    float _213 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _215 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _217 = _207 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _219 = isnan(_207);
    bool _221 = _217 || _219;
    bool _223 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _225 = _221 || _223;
    float _227 = float(_225);
    float _229 = 1.0 / _211;
    float _231 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _233 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _235 = _213 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _237 = _215 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _239 = _231 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _241 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _243 = _207 + _241;
    float _245 = -_227;
    float _247 = _245 + 1.0;
    out.m_64.x = _235;
    out.m_64.y = _237;
    out.m_64.z = _239;
    out.m_64.w = _233;
    bool _249 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _251 = _243 * _229;
    bool _253 = _207 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _255 = isnan(_207);
    bool _257 = _253 || _255;
    bool _259 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _261 = _257 || _259;
    float _263 = float(_261);
    float _265 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _267 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _265;
    float _269 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _271 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _269;
    float _273 = _263 * _247;
    float _275 = fma(_267, _251, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _277 = fma(_271, _251, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _279 = -_263;
    float _281 = _279 + 1.0;
    float _283 = _275 * _273;
    float _285 = _277 * _273;
    float _287 = fma(_281, (*spvDescriptorSet0.vp_c9)._m0[143].x, _283);
    float _289 = fma(_281, (*spvDescriptorSet0.vp_c9)._m0[143].y, _285);
    float _291 = fma(_227, (*spvDescriptorSet0.vp_c9)._m0[144].x, _287);
    float _293 = fma(_227, (*spvDescriptorSet0.vp_c9)._m0[144].y, _289);
    bool _295 = !_249;
    float _313;
    if (!_295)
    {
        float _297 = in.m_62.x;
        float _299 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _301 = _297 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _303 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[11].w, _115);
        float _305 = _303 * _299;
        float _307 = floor(_305);
        float _309 = -_307;
        float _311 = _305 + _309;
        _313 = _311;
        _315 = true;
    }
    else
    {
        _313 = _167;
    }
    _315 = false;
    float _317 = _313;
    float _319 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _321 = int(_319);
    float _323 = in.m_62.x;
    float _325 = in.m_62.y;
    float _327 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _329 = int(_327);
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _333 = _331 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _335 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _337 = float(_321);
    float _339 = 1.0 / _333;
    float _341 = float(uint(_329));
    float _343 = 1.0 / _337;
    int _345 = ~_329;
    int _347 = _345 + 1;
    float _349 = _325 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _351 = ~_329;
    int _353 = _351 + 1;
    int _355 = ~_329;
    int _357 = _355 + 1;
    float _359 = 1.0 / _341;
    float _361 = _343 * _115;
    float _363 = trunc(_361);
    int _365 = int(_363);
    int _367 = as_type<int>(_359) + (-2);
    float _369 = float(uint(_365));
    float _371 = float(_365);
    float _373 = as_type<float>(_367) * _369;
    float _375 = trunc(_373);
    float _377 = precise::max(_375, 0.0);
    uint _380 = uint(_377);
    int _382 = _347 * int(_380);
    int _384 = _382 + _365;
    float _386 = float(uint(_384));
    float _388 = as_type<float>(_367) * _386;
    int _390 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _392 = _390 != 0;
    float _394 = trunc(_388);
    float _396 = precise::max(_394, 0.0);
    uint _398 = uint(_396);
    bool _400 = !_392;
    float _402 = _400 ? 7.345489978790283203125 : 1.0;
    float _404 = _402 * _323;
    float _406 = floor(_404);
    int _408 = int(_380) + int(_398);
    float _410 = float(_329);
    int _412 = _353 * _408;
    int _414 = _412 + _365;
    bool _416 = _371 >= _410;
    bool _418 = isnan(_371);
    bool _420 = _416 || _418;
    bool _422 = isnan(_410);
    bool _424 = _420 || _422;
    float _426 = float(_424);
    float _428 = _410 * _115;
    float _430 = in.m_66.x;
    float _432 = in.m_66.y;
    bool _434 = uint(_414) >= uint(_329);
    float _436 = trunc(_426);
    int _438 = int(_436);
    float _440 = -_406;
    float _442 = _404 + _440;
    bool _444 = !_434;
    int _446 = _444 ? 0 : (-1);
    float _448 = _428 * _163;
    bool _450 = _329 == 0;
    float _452 = _442 * _410;
    int _454 = ~_408;
    int _456 = _454 + _446;
    int _458 = _456 + 1;
    int _460 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _462 = _460 != 0;
    int _464 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _466 = _464 != 0;
    int _468 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _470 = _468 != 0;
    float _472 = trunc(_448);
    int _474 = int(_472);
    int _476 = _329 * _458;
    int _478 = _476 + _365;
    bool _480 = !_466;
    int _482 = _480 ? 0 : 1;
    int _484 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _486 = _484 != 0;
    int _488 = ~_438;
    int _490 = _488 + 1;
    int _492 = _490 + 1;
    float _494 = trunc(_452);
    int _496 = int(_494);
    bool _498 = !_450;
    int _500 = _498 ? _478 : (-1);
    float _502 = _291 * _430;
    int _504 = _329 + (-1);
    bool _506 = !_462;
    int _508 = _506 ? 0 : 1;
    int _510 = _500 * _492;
    int _512 = abs(_482);
    float _514 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _516 = log2(_514);
    bool _518 = !_486;
    int _520 = _518 ? 0 : 1;
    int _522 = _438 * _504;
    int _524 = _522 + _510;
    int _526 = abs(_508);
    int _528 = abs(_520);
    int _530 = _524 * _512;
    int _532 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _534 = _532 != 0;
    int _536 = _474 * _526;
    int _538 = _536 + _530;
    bool _540 = !_470;
    int _542 = _540 ? 0 : 1;
    int _544 = _496 * _528;
    int _546 = _544 + _365;
    float _548 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _550 = _548 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _552 = in.m_50.x;
    float _554 = in.m_50.y;
    float _556 = in.m_50.z;
    bool _558 = !_534;
    int _560 = _558 ? 0 : 1;
    float _562 = _516 * _115;
    int _564 = abs(_542);
    float _566 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _568 = abs(_560);
    float _570 = 1.0 / _550;
    int _572 = _546 * _564;
    int _574 = _572 + _538;
    float _576 = _323 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _578 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _580 = isnan(0.0);
    bool _582 = _578 || _580;
    bool _584 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _586 = _582 || _584;
    int _588 = _496 * _568;
    int _590 = _588 + _574;
    float _592 = _323 * 2.0;
    float _594 = exp2(_562);
    float _596 = fma(_349, -2.0, _566);
    float _598 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _600 = _598 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _602 = float(uint(_590));
    float _604 = -_335;
    float _606 = fma(_576, 2.0, _604);
    float _608 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[76].y, _596);
    float _610 = as_type<float>(_367) * _602;
    float _612 = 1.0 / _600;
    float _614 = _554 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _616 = _554 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _618 = _554 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _620 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _622 = isnan(1.0);
    bool _624 = _620 || _622;
    bool _626 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _628 = _624 || _626;
    float _630 = fma(_552, (*spvDescriptorSet0.vp_c10)._m0[4].x, _614);
    float _632 = fma(_552, (*spvDescriptorSet0.vp_c10)._m0[5].x, _616);
    float _634 = fma(_552, (*spvDescriptorSet0.vp_c10)._m0[6].x, _618);
    float _636 = floor(_592);
    float _638 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _640 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _638;
    float _642 = -_594;
    float _644 = _642 + 1.0;
    float _646 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _648 = 1.0 + _646;
    float _650 = _640 * _339;
    float _652 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _654 = _652 + (*spvDescriptorSet0.vp_c9)._m0[135].w;
    int _656 = ~_329;
    int _658 = _656 + 1;
    float _660 = trunc(_610);
    float _662 = precise::max(_660, 0.0);
    uint _664 = uint(_662);
    float _666 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _668 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _666;
    float _670 = _586 ? _644 : 0.0;
    float _672 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _674 = _672 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _676 = _668 * _612;
    float _678 = _325 * 2.0;
    float _680 = _674 * _570;
    bool _682 = _636 > 0.0;
    float _684 = 1.0 / _648;
    bool _686 = _636 >= 0.0;
    bool _688 = isnan(_636);
    bool _690 = _686 || _688;
    bool _692 = isnan(0.0);
    bool _694 = _690 || _692;
    float _696 = in.m_62.z;
    float _698 = -_115;
    float _700 = fma(_698, (*spvDescriptorSet0.vp_c9)._m0[76].x, _606);
    float _702 = -(*spvDescriptorSet0.vp_c9)._m0[134].x;
    float _704 = _702 + (*spvDescriptorSet0.vp_c9)._m0[135].x;
    int _706 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _708 = _706 != 0;
    int _710 = _658 * int(_664);
    int _712 = _710 + _590;
    float _714 = 1.0 / _654;
    float _716 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _718 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _720 = _718 != 0;
    float _722 = float(uint(_712));
    float _724 = fma(_323, (*spvDescriptorSet0.vp_c9)._m0[78].z, _716);
    float _726 = _325 + _323;
    float _728 = floor(_678);
    float _730 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _732 = as_type<float>(_367) * _722;
    float _734 = _726 + (-1.0);
    float _736 = fma(_325, (*spvDescriptorSet0.vp_c9)._m0[78].w, _730);
    float _738 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[77].z, _724);
    float _740 = trunc(_732);
    float _742 = precise::max(_740, 0.0);
    uint _744 = uint(_742);
    float _746 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[77].w, _736);
    if (_628)
    {
        float _748 = _670 * _684;
        _125 = _748;
    }
    float _750 = _125;
    bool _752 = _323 > 0.5;
    float _754 = _704 * _714;
    float _756 = -_738;
    float _758 = _756 + 1.0;
    int _760 = _694 ? 0 : 1;
    float _762 = -_746;
    float _764 = _762 + 1.0;
    float _766 = -_179;
    int _768 = _752 ? as_type<int>(_766) : as_type<int>(_179);
    float _770 = fma(_734, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _772 = _728 > 0.0;
    float _774 = _696 * 2.0;
    bool _776 = _728 >= 0.0;
    bool _778 = isnan(_728);
    bool _780 = _776 || _778;
    bool _782 = isnan(0.0);
    bool _784 = _780 || _782;
    float _786 = float(uint(_546));
    float _788 = floor(_774);
    int _790 = ~_760;
    int _792 = _790 + 1;
    int _794 = _792 + 1;
    int _796 = _794;
    if (!_682)
    {
        int _798 = ~_760;
        int _800 = _798 + 1;
        _796 = _800;
    }
    int _802 = _796;
    float _804 = as_type<float>(_367) * _786;
    int _806 = int(_664) + int(_744);
    float _808 = _325 + _696;
    int _810 = ~_329;
    int _812 = _810 + 1;
    bool _814 = _325 > 0.5;
    float _816 = trunc(_804);
    float _818 = precise::max(_816, 0.0);
    uint _820 = uint(_818);
    int _822 = _784 ? 0 : 1;
    int _824 = _812 * _806;
    int _826 = _824 + _590;
    float _828 = _808 + (-1.0);
    float _830 = -_183;
    int _832 = _814 ? as_type<int>(_830) : as_type<int>(_183);
    bool _834 = uint(_826) >= uint(_329);
    float _836 = fma(_828, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _838 = ~_822;
    int _840 = _838 + 1;
    int _842 = _840 + 1;
    int _844 = _842;
    float _846 = _836;
    if (!_772)
    {
        int _848 = ~_822;
        int _850 = _848 + 1;
        _844 = _850;
    }
    int _852 = _844;
    bool _854 = !_708;
    float _856 = _854 ? _179 : as_type<float>(_768);
    bool _858 = !_720;
    float _860 = _858 ? _183 : as_type<float>(_832);
    float _862 = fma(_556, (*spvDescriptorSet0.vp_c10)._m0[4].z, _630);
    int _864 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _866 = _864 != 0;
    int _868 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _870 = _868 != 0;
    int _872 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _874 = _872 != 0;
    float _876 = fma(_556, (*spvDescriptorSet0.vp_c10)._m0[5].z, _632);
    bool _878 = !_834;
    int _880 = _878 ? 0 : (-1);
    int _882 = _357 * int(_820);
    int _884 = _882 + _546;
    bool _886 = _788 > 0.0;
    float _888 = _876 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _890 = _788 >= 0.0;
    bool _892 = isnan(_788);
    bool _894 = _890 || _892;
    bool _896 = isnan(0.0);
    bool _898 = _894 || _896;
    float _900 = fma(_556, (*spvDescriptorSet0.vp_c10)._m0[6].z, _634);
    float _902 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _904 = _317 + _902;
    bool _906 = _317 >= (*spvDescriptorSet0.vp_c9)._m0[135].w;
    bool _908 = isnan(_317);
    bool _910 = _906 || _908;
    bool _912 = isnan((*spvDescriptorSet0.vp_c9)._m0[135].w);
    bool _914 = _910 || _912;
    float _916 = float(_914);
    int _918 = ~_806;
    int _920 = _918 + _880;
    int _922 = _920 + 1;
    float _924 = fma(_650, _904, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _926 = _317 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _928 = isnan(_317);
    bool _930 = _926 || _928;
    bool _932 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _934 = _930 || _932;
    float _936 = float(_934);
    float _938 = -_916;
    float _940 = _938 + 1.0;
    float _942 = float(uint(_884));
    int _944 = _329 * _922;
    int _946 = _944 + _590;
    bool _948 = _317 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _950 = isnan(_317);
    bool _952 = _948 || _950;
    bool _954 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _956 = _952 || _954;
    float _958 = float(_956);
    float _960 = _936 * _940;
    bool _962 = _317 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _964 = isnan(_317);
    bool _966 = _962 || _964;
    bool _968 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _970 = _966 || _968;
    float _972 = float(_970);
    float _974 = as_type<float>(_367) * _942;
    bool _976 = !_450;
    int _978 = _976 ? _946 : (-1);
    float _980 = -_936;
    float _982 = _980 + 1.0;
    bool _984 = _317 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _986 = isnan(_317);
    bool _988 = _984 || _986;
    bool _990 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _992 = _988 || _990;
    float _994 = float(_992);
    int _996 = _978 >> 31;
    float _998 = trunc(_974);
    float _1000 = precise::max(_998, 0.0);
    uint _1002 = uint(_1000);
    int _1004 = _978 & 3;
    bool _1006 = _1004 != 0;
    float _1008 = _994 * _982;
    float _1010 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1012 = _317 + _1010;
    int _1014 = _996 & 3;
    float _1016 = -_994;
    float _1018 = _1016 + 1.0;
    float _1020 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1022 = _317 + _1020;
    float _1024 = fma(_680, _1012, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    int _1026 = _978 + _1014;
    float _1028 = _958 * _1018;
    float _1030 = -_958;
    float _1032 = _1030 + 1.0;
    float _1034 = fma(_676, _1022, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    int _1036 = _1026 >> 2;
    float _1038 = _856 + 0.5;
    float _1040 = _972 * _1032;
    float _1042 = _860 + (-0.5);
    int _1044 = _1036 << 4;
    int _1046 = _1044 + 368;
    float _1048 = fma(_1038, (*spvDescriptorSet0.vp_c9)._m0[80].x, _700);
    int _1050 = int(_820) + int(_1002);
    float _1052 = -_1042;
    float _1054 = -_608;
    float _1056 = fma(_1052, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1054);
    int _1058 = ~_329;
    int _1060 = _1058 + 1;
    uint _1062 = uint(int(uint(_1046) >> uint(2)));
    uint _1064 = uint(int(uint(int(_1062)) >> uint(2)));
    int _1066 = int(_1062) & 3;
    float _1068 = (*spvDescriptorSet0.vp_c9)._m0[int(_1064)][_1066];
    int _1070 = int(_1062) + 1;
    uint _1072 = uint(int(uint(_1070) >> uint(2)));
    int _1074 = _1070 & 3;
    float _1076 = (*spvDescriptorSet0.vp_c9)._m0[int(_1072)][_1074];
    float _1078 = -_758;
    float _1080 = fma(_856, _1078, _1048);
    float _1082 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1084 = _317 + _1082;
    int _1086 = _898 ? 0 : 1;
    float _1088 = _924 * _1040;
    float _1090 = -_972;
    float _1092 = _1090 + 1.0;
    float _1094 = fma(_754, _1084, (*spvDescriptorSet0.vp_c9)._m0[134].x);
    int _1096 = ~_1086;
    int _1098 = _1096 + 1;
    int _1100 = _1098 + 1;
    int _1102 = _1060 * _1050;
    int _1104 = _1102 + _546;
    int _1106 = _1100;
    if (!_886)
    {
        int _1108 = ~_1086;
        int _1110 = _1108 + 1;
        _1106 = _1110;
    }
    int _1112 = _1106;
    float _1114 = fma(_1092, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1088);
    int _1116 = _978 & 3;
    bool _1118 = _1116 != 0;
    float _1120 = fma(_860, _764, _1056);
    bool _1122 = !_866;
    int _1124 = _1122 ? 0 : 1;
    float _1126 = fma(_1024, _1028, _1114);
    int _1128 = _1006 ? 0 : 1;
    bool _1130 = uint(_1116) > 1u;
    out.m_68.x = _1080;
    out.m_68.y = _1120;
    bool _1132 = uint(_1104) >= uint(_329);
    int _1134 = abs(_1124);
    int _1136 = _1046 + 8;
    uint _1138 = uint(int(uint(_1136) >> uint(2)));
    uint _1140 = uint(int(uint(int(_1138)) >> uint(2)));
    int _1142 = int(_1138) & 3;
    float _1144 = (*spvDescriptorSet0.vp_c9)._m0[int(_1140)][_1142];
    int _1146 = int(_1138) + 1;
    uint _1148 = uint(int(uint(_1146) >> uint(2)));
    int _1150 = _1146 & 3;
    float _1152 = (*spvDescriptorSet0.vp_c9)._m0[int(_1148)][_1150];
    bool _1154 = !_870;
    int _1156 = _1154 ? 0 : 1;
    int _1158 = ~_1128;
    int _1160 = _1158 + 1;
    int _1162 = _1160 + 1;
    int _1164 = abs(_1156);
    int _1166 = _1162;
    if (!_1130)
    {
        int _1168 = ~_1128;
        int _1170 = _1168 + 1;
        _1166 = _1170;
    }
    int _1172 = _1166;
    bool _1174 = uint(_1116) >= 2u;
    float _1176 = float(_802);
    float _1178 = float(_1164);
    float _1180 = fma(_1034, _1008, _1126);
    int _1182 = abs(_1172);
    int _1184 = _1174 ? 0 : 1;
    float _1186 = _1178 * _1176;
    bool _1188 = _1116 != 3;
    float _1190 = fma(_1094, _960, _1180);
    int _1192 = ~_1182;
    int _1194 = _1192 + 1;
    int _1196 = _1194 + 1;
    int _1198 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1200 = _1198 != 0;
    float _1202 = float(_1134);
    int _1204 = _1196 * as_type<int>(_1076);
    float _1206 = float(_1112);
    bool _1208 = !_1132;
    int _1210 = _1208 ? 0 : (-1);
    bool _1212 = !_1200;
    int _1214 = _1212 ? 0 : 1;
    float _1216 = _1202 * _1206;
    bool _1218 = !_1118;
    int _1220 = _1218 ? 0 : 1;
    float _1222 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1224 = _888 + _1222;
    int _1226 = ~_1184;
    int _1228 = _1226 + 1;
    int _1230 = _1228 + 1;
    float _1232 = _1216 * (-2.0);
    bool _1234 = _1116 != 3;
    float _1236 = _1224 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1238 = _1230;
    if (_1188)
    {
        int _1240 = ~_1184;
        int _1242 = _1240 + 1;
        _1238 = _1242;
    }
    int _1244 = _1238;
    float _1246 = fma(_770, _1232, _770);
    float _1248 = in.m_70.x;
    float _1250 = in.m_70.y;
    float _1252 = in.m_70.z;
    int _1254 = abs(_1214);
    float _1256 = _862 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1258 = abs(_1220);
    float _1260 = _900 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1262 = !_1234;
    int _1264 = _1262 ? 0 : (-1);
    float _1266 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1268 = _1256 + _1266;
    int _1270 = ~_1050;
    int _1272 = _1270 + _1210;
    int _1274 = _1272 + 1;
    int _1276 = abs(_1264);
    int _1278 = abs(_1244);
    float _1280 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1282 = _1260 + _1280;
    int _1284 = ~_1258;
    int _1286 = _1284 + 1;
    int _1288 = _1286 + 1;
    float _1290 = fma(_1268, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1236);
    int _1292 = ~_1278;
    int _1294 = _1292 + 1;
    int _1296 = _1294 + 1;
    int _1298 = _329 * _1274;
    int _1300 = _1298 + _546;
    int _1302 = _1288 * as_type<int>(_1068);
    int _1304 = _1302 + _1204;
    int _1306 = ~_1276;
    int _1308 = _1306 + 1;
    int _1310 = _1308 + 1;
    float _1312 = fma(_1282, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1290);
    int _1314 = _1296 * as_type<int>(_1144);
    int _1316 = _1314 + _1304;
    float _1318 = _1186 * (-2.0);
    float _1320 = _502 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1322 = ~_1254;
    int _1324 = _1322 + 1;
    int _1326 = _1324 + 1;
    int _1328 = _1310 * as_type<int>(_1152);
    int _1330 = _1328 + _1316;
    float _1332 = _1224 * _1224;
    float _1334 = fma(_916, (*spvDescriptorSet0.vp_c9)._m0[135].x, _1190);
    float _1336 = fma(_1232, _1248, _1248);
    bool _1338 = _1312 >= 0.0;
    float _1340 = fma(_1268, _1268, _1332);
    int _1342 = _1330 * _1326;
    bool _1344 = !_450;
    int _1346 = _1344 ? _1300 : (-1);
    float _1348 = fma(_836, _1318, _836);
    float _1350 = fma(_1282, _1282, _1340);
    float _1352 = fma(_1318, _1250, _1250);
    int _1354 = _1346 * _1254;
    int _1356 = _1354 + _1342;
    float _1358 = _323 + (-0.5);
    float _1360 = rsqrt(_1350);
    float _1362 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    if (_1338)
    {
        _846 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1364 = _846;
    float _1366 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1368 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1370 = fma(_1358, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1336);
    float _1372 = _1362 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1374 = _1366 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1376 = _1368 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1378 = _1334 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _1380 = as_type<int>(_1364);
    if (_1338)
    {
        float _1382 = _1364 * 5.0;
        _1380 = as_type<int>(_1382);
    }
    int _1384 = _1380;
    float _1386 = float(_1356);
    float _1388 = _1320 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    bool _1390 = !_874;
    int _1392 = _1390 ? 0 : 1;
    out.m_72.x = _1374;
    out.m_72.y = _1372;
    out.m_72.z = _1376;
    out.m_72.w = _1378;
    float _1394 = fma(_1246, _750, _1370);
    float _1396 = _1388 * _1360;
    float _1398 = _325 + (-0.5);
    if (_1338)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4908 = as_type<float>(_1384);
        out.gl_Position.z = _4908;
    }
    int _1400 = abs(_1392);
    float _1402 = _1268 * _1396;
    float _1404 = _1224 * _1396;
    out.m_74.x = _1386;
    float _1406 = _1404;
    if (_1338)
    {
        out.m_57.x = 0.0;
    }
    if (_1338)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1408 = -_1404;
    float _1410 = _888 + _1408;
    float _1412 = _1282 * _1396;
    float _1414 = -_1402;
    float _1416 = _1256 + _1414;
    float _1418 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1420 = _1410 + _1418;
    float _1422 = -_1412;
    float _1424 = _1260 + _1422;
    float _1426 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1428 = _1416 + _1426;
    float _1430 = float(_852);
    float _1432 = _1420 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1434 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1436 = _1424 + _1434;
    float _1438 = float(_1400);
    float _1440 = -_1404;
    float _1442 = _1224 + _1440;
    float _1444 = fma(_1428, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1432);
    float _1446 = fma(_1398, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1352);
    float _1448 = -_1402;
    float _1450 = _1268 + _1448;
    float _1452 = _1442 * _1442;
    float _1454 = fma(_1436, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1444);
    float _1456 = _696 + _323;
    float _1458 = _1438 * _1430;
    float _1460 = fma(_1348, _750, _1446);
    float _1462 = fma(_1450, _1450, _1452);
    bool _1464 = _1454 >= 0.0;
    float _1466 = _1456 + (-1.0);
    float _1468 = _1458 * (-2.0);
    float _1470 = -_1412;
    float _1472 = _1282 + _1470;
    float _1474 = _696 + (-0.5);
    float _1476 = fma(_1466, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1478 = fma(_1468, _1252, _1252);
    float _1480 = _1394 * 0.15915493667125701904296875;
    float _1482 = _1460 * 0.15915493667125701904296875;
    float _1484 = fma(_1472, _1472, _1462);
    float _1486 = fma(_1476, _1468, _1476);
    float _1488 = fma(_1474, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1478);
    float _1490 = _1480 * 6.283185482025146484375;
    float _1492 = sin(_1490);
    float _1494 = _1476;
    int _1496 = as_type<int>(_1478);
    float _1498 = _1420;
    float _1500 = _1428;
    if (_1464)
    {
        _1494 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1502 = _1494;
    float _1504 = fma(_1486, _750, _1488);
    if (_1464)
    {
        out.m_57.x = 0.0;
    }
    if (_1464)
    {
        float _1506 = _1502 * 5.0;
        _1496 = as_type<int>(_1506);
    }
    int _1508 = _1496;
    float _1510 = _1504 * 0.15915493667125701904296875;
    float _1512 = _1480 * 6.283185482025146484375;
    float _1514 = cos(_1512);
    float _1516 = _1510;
    if (_1464)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5100 = as_type<float>(_1508);
        out.gl_Position.z = _5100;
    }
    float _1518 = _1482 * 6.283185482025146484375;
    float _1520 = sin(_1518);
    float _1522 = sqrt(_1484);
    float _1524 = _1482 * 6.283185482025146484375;
    float _1526 = cos(_1524);
    if (_1464)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1528 = _1510 * 6.283185482025146484375;
    float _1530 = cos(_1528);
    float _1532 = _293 * _432;
    float _1534 = _1360 * _1522;
    float _1536 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _183);
    float _1538 = _1514 * _1520;
    float _1540 = _1532 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1542 = _1320 * _1534;
    float _1544 = _1514 * _1526;
    float _1546 = _1510 * 6.283185482025146484375;
    float _1548 = sin(_1546);
    float _1550 = _1540 * _1534;
    float _1552 = _1492 * _1526;
    float _1554 = _1536 * _1550;
    float _1556 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _179);
    float _1558 = _1492 * _1520;
    float _1560 = _1514 * _1530;
    float _1562 = _1526 * _1530;
    float _1564 = _1556 * _1542;
    float _1566 = _1492 * _1530;
    float _1568 = _1560 * _1554;
    float _1570 = _1520 * _1530;
    float _1572 = _1534 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1574 = _1572 * 0.5;
    float _1576 = fma(_1548, _1544, _1558);
    float _1578 = -_1552;
    float _1580 = fma(_1548, _1538, _1578);
    float _1582 = -_1554;
    float _1584 = _1548 * _1582;
    float _1586 = -_1538;
    float _1588 = fma(_1548, _1552, _1586);
    float _1590 = fma(_1576, _1564, _1568);
    float _1592 = _1566 * _1554;
    float _1594 = fma(_1562, _1564, _1584);
    float _1596 = fma(_1548, _1558, _1544);
    float _1598 = fma(_1580, _1574, _1590);
    float _1600 = fma(_1588, _1564, _1592);
    float _1602 = fma(_1570, _1574, _1594);
    float _1604 = _1598 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1606 = _1598 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1608 = fma(_1596, _1574, _1600);
    float _1610 = fma(_1602, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1604);
    float _1612 = fma(_1602, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1606);
    float _1614 = fma(_1608, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1610);
    float _1616 = fma(_1608, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1612);
    float _1618 = _1614 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1620 = _1616 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1622 = _1598 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1624 = _1256 + _1618;
    float _1626 = _1260 + _1620;
    float _1628 = fma(_1602, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1622);
    float _1630 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1632 = _1624 + _1630;
    float _1634 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1636 = _1626 + _1634;
    float _1638 = fma(_1608, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1628);
    float _1640 = _1632 * _1632;
    float _1642 = _1636 * _1636;
    float _1644 = _1638 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1646 = _1640 + _1642;
    float _1648 = _888 + _1644;
    float _1650 = sqrt(_1646);
    bool _1652 = _1650 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1654 = _1620;
    float _1656 = _1626;
    float _1658 = _1640;
    float _1660 = _1642;
    if (!_1652)
    {
        _1654 = _1624;
    }
    float _1662 = _1654;
    float _1664 = _1662;
    if (!_1652)
    {
        _1516 = _1648;
    }
    float _1666 = _1516;
    bool _1668 = !_1652;
    float _1670 = _1666;
    if (!_1668)
    {
        float _1672 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1674 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1676 = _1650 + _1674;
        float _1678 = rsqrt(_1646);
        float _1680 = _1676 * _1672;
        float _1682 = _1648 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1684 = _1680 * 0.15915493667125701904296875;
        float _1686 = _1684 * 6.283185482025146484375;
        float _1688 = sin(_1686);
        float _1690 = _1684 * 6.283185482025146484375;
        float _1692 = cos(_1690);
        float _1694 = fma(_1688, _1682, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1696 = _1678 * _1694;
        float _1698 = _1692 + (-1.0);
        float _1700 = fma(_1632, _1696, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1702 = fma(_1636, _1696, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1704 = _1698 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1706 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1708 = _1700 + _1706;
        float _1710 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1712 = _1702 + _1710;
        float _1714 = fma(_1648, _1692, _1704);
        float _1716 = _1708 * _1708;
        float _1718 = _1712 * _1712;
        _1664 = _1700;
        _1656 = _1702;
        _1670 = _1714;
        _1658 = _1716;
        _1660 = _1718;
    }
    float _1720 = _1664;
    float _1722 = _1656;
    float _1724 = _1670;
    float _1726 = _1658;
    float _1728 = _1660;
    float _1730 = fma(_1720, 6.2500002968590706586837768554688e-05, 0.5);
    float _1732 = fma(_1722, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _5448 = float2(_1730, _1732);
    float3 _1736 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_5448, float2(0.0), isnan(_5448)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_5448, float2(0.0), isnan(_5448)), level(0.0)).xyz;
    float _1738 = _1736.x;
    float _1740 = _1736.y;
    float _1742 = _1736.z;
    float _1744 = _1576 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1746 = _1576 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1748 = _1576 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1750 = _1560 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1752 = _1560 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1754 = _1560 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1756 = fma(_1562, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1744);
    float _1758 = fma(_1562, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1746);
    float _1760 = fma(_1562, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1748);
    float _1762 = -_1548;
    float _1764 = fma(_1762, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1750);
    float _1766 = -_1548;
    float _1768 = fma(_1766, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1752);
    float _1770 = -_1548;
    float _1772 = fma(_1770, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1754);
    float _1774 = _1580 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1776 = _1580 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1778 = _1580 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1780 = fma(_1588, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1756);
    float _1782 = fma(_1588, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1758);
    float _1784 = fma(_1588, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1760);
    float _1786 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1788 = _1724 + _1786;
    float _1790 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1774);
    float _1792 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1776);
    float _1794 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1778);
    float _1796 = fma(_1788, _1788, _1726);
    float _1798 = fma(_1566, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1764);
    float _1800 = fma(_1566, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1768);
    float _1802 = _183 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1804 = fma(_1566, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1772);
    float _1806 = _1796 + _1728;
    float _1808 = _179 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1810 = _1802 * _1798;
    float _1812 = _1802 * _1800;
    float _1814 = _1802 * _1804;
    float _1816 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1790);
    float _1818 = sqrt(_1806);
    float _1820 = fma(_1808, _1780, _1810);
    float _1822 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1792);
    float _1824 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1794);
    float _1826 = fma(_1808, _1782, _1812);
    float _1828 = fma(_1808, _1784, _1814);
    float _1830 = _1816 + _1820;
    float _1832 = _1822 + _1826;
    float _1834 = _1824 + _1828;
    out.m_76.x = _1830;
    out.m_76.y = _1832;
    out.m_76.z = _1834;
    bool _1836 = _1818 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1838 = isnan(_1818);
    bool _1840 = _1836 || _1838;
    bool _1842 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1844 = _1840 || _1842;
    float _1846 = _1808;
    if (!_1844)
    {
        _1846 = 1.0;
    }
    float _1848 = _1846;
    out.m_78.x = _1738;
    out.m_78.y = _1740;
    out.m_78.z = _1742;
    bool _1850 = !_1844;
    float _1852 = _1848;
    if (!_1850)
    {
        bool _1854 = _1818 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1856 = isnan(_1818);
        bool _1858 = _1854 || _1856;
        bool _1860 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1862 = _1858 || _1860;
        if (!_1862)
        {
            float _1864 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1866 = _1818 + _1864;
            float _1868 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1870 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1868;
            float _1872 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1874 = _1872 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1876 = 1.0 / _1870;
            float _1878 = _1866 * _1876;
            float _1880 = fma(_1878, _1874, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1852 = _1880;
            _1882 = true;
        }
        else
        {
            bool _1884 = _1818 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1886 = isnan(_1818);
            bool _1888 = _1884 || _1886;
            bool _1890 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1892 = _1888 || _1890;
            if (!_1892)
            {
                float _1894 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1896 = _1818 + _1894;
                float _1898 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1900 = _1898 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1902 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1904 = _1902 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1906 = 1.0 / _1900;
                float _1908 = _1896 * _1906;
                float _1910 = fma(_1908, _1904, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1852 = _1910;
                _1882 = true;
            }
            else
            {
                _1852 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1882 = false;
    float _1912 = _1852;
    float _1914 = _1410 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1916 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1918 = _1724 + _1916;
    float _1920 = fma(_1416, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1914);
    float _1922 = _1410 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1924 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1926 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1928 = _1924 || _1926;
    bool _1930 = isnan(0.5);
    bool _1932 = _1928 || _1930;
    float _1934 = fma(_1918, _1912, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1936 = fma(_1424, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1920);
    bool _1938 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1940 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1942 = _1938 || _1940;
    bool _1944 = isnan(0.5);
    bool _1946 = _1942 || _1944;
    float _1948 = _1936 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1950 = fma(_1416, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1922);
    float _1952 = -_1404;
    float _1954 = _1952 + _1934;
    float _1956 = 1.0 / _1948;
    float _1958 = fma(_1424, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1950);
    float _1960 = _1958 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1962 = _1960 + _1948;
    float _1964 = _1962 * _1956;
    float _1966 = _1964 * 0.5;
    float _1968 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1970 = _1720 + _1968;
    float _1972 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1974 = fma(_1966, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1972);
    float _1976 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1978 = _1722 + _1976;
    float _1980 = fma(_1970, _1912, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1982 = 1.0 / _1974;
    float _1984 = fma(_1978, _1912, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1986 = -_1402;
    float _1988 = _1986 + _1980;
    float _1990 = _1912;
    float _1992 = _1954;
    float _1994 = _1988;
    if (_1946)
    {
        _1990 = 1.0;
    }
    float _1996 = _1990;
    float _1998 = -_1412;
    float _2000 = _1998 + _1984;
    float _2002 = _2000;
    float _2004 = _1996;
    if (!_1932)
    {
        float _2006 = _1420 * _1420;
        float _2008 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2010 = -_1260;
        float _2012 = _2010 + _1984;
        float _2014 = -_888;
        float _2016 = _2014 + _1934;
        float _2018 = fma(_1428, _1428, _2006);
        float _2020 = -_1256;
        float _2022 = _2020 + _1980;
        float _2024 = fma(_1436, _1436, _2018);
        float _2026 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2028 = sqrt(_2024);
        float _2030 = 1.0 / _1534;
        float _2032 = _2026 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2034 = precise::min(_2028, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2036 = _2034 * _2008;
        float _2038 = _2036 * _2030;
        float _2040 = _2032 * _2038;
        float _2042 = _2012 * _2038;
        float _2044 = fma(_2016, _2040, _1410);
        float _2046 = fma(_2022, _2040, _1416);
        float _2048 = fma(_2032, _2042, _1424);
        _1992 = _2044;
        _1994 = _2046;
        _2002 = _2048;
        _1498 = _2028;
    }
    float _2050 = _1992;
    float _2052 = _1994;
    float _2054 = _2002;
    float _2056 = _1498;
    float _2058 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2060 = _1982 * _2058;
    float _2062 = _2056;
    if (!_1946)
    {
        float _2064 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2066 = _2064 * 0.15915493667125701904296875;
        float _2068 = _2066 * 6.283185482025146484375;
        float _2070 = cos(_2068);
        float _2072 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2074 = _2072 * 0.15915493667125701904296875;
        float _2076 = _2066 * 6.283185482025146484375;
        float _2078 = sin(_2076);
        float _2080 = 1.0 / _2070;
        float _2082 = _2074 * 6.283185482025146484375;
        float _2084 = cos(_2082);
        float _2086 = _2078 * _2080;
        float _2088 = _2074 * 6.283185482025146484375;
        float _2090 = sin(_2088);
        float _2092 = _2084 * _2086;
        float _2094 = 1.0 / _2092;
        float _2096 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2098 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2096;
        float _2100 = 1.0 / _2098;
        float _2102 = _2090 * _2094;
        float _2104 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2106 = fma(_2060, _2102, _2104);
        float _2108 = _2106 * _2100;
        float _2110 = precise::clamp(_2108, 0.0, 1.0);
        _2062 = _2074;
        _2004 = _2110;
    }
    float _2112 = _2062;
    float _2114 = _2004;
    float _2116 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2118 = _2050 + _2116;
    float _2120 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2122 = _2052 + _2120;
    float _2124 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2126 = _2054 + _2124;
    float _2128 = _2118 * _2118;
    float _2130 = fma(_2122, _2122, _2128);
    float _2132 = fma(_2126, _2126, _2130);
    float _2134 = rsqrt(_2132);
    float _2136 = _2134 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2138 = _2122 * _2136;
    float _2140 = _2126 * _2136;
    float _2142 = _2138 * _2138;
    float _2144 = _2140 * _2140;
    float _2146 = _2142 + _2144;
    float _2148 = sqrt(_2146);
    bool _2150 = _2148 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2152 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2154 = _2148 + _2152;
    float _2156 = _2134;
    float _2158 = _2154;
    float _2160 = _2118;
    if (_2150)
    {
        float _2162 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2156 = _2162;
    }
    float _2164 = _2156;
    float _2166 = _2164;
    if (_2150)
    {
        float _2168 = _2154 * _2164;
        _2158 = _2168;
    }
    float _2170 = _2158;
    if (_2150)
    {
        float _2172 = rsqrt(_2146);
        _2166 = _2172;
    }
    float _2174 = _2166;
    float _2176 = _2174;
    if (_2150)
    {
        float _2178 = _2170 * 0.15915493667125701904296875;
        _1500 = _2178;
    }
    float _2180 = _1500;
    float _2182 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2184 = _2126;
    float _2186 = _2180;
    if (_2150)
    {
        float _2188 = _2180 * 6.283185482025146484375;
        float _2190 = sin(_2188);
        _2184 = _2190;
    }
    float _2192 = _2184;
    float _2194 = precise::max(0.0, _2182);
    float _2196 = _2112;
    if (_2150)
    {
        float _2198 = _2180 * 6.283185482025146484375;
        float _2200 = cos(_2198);
        _2196 = _2200;
    }
    float _2202 = _2196;
    float _2204 = -_2136;
    float _2206 = -_2194;
    float _2208 = fma(_2118, _2204, _2206);
    float _2210 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_2150)
    {
        float _2212 = _2208 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2160 = _2212;
    }
    float _2214 = _2160;
    float _2216 = fma(_1416, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2218 = _2192;
    float _2220 = _2214;
    if (_2150)
    {
        float _2222 = fma(_2192, _2214, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2218 = _2222;
    }
    float _2224 = _2218;
    float _2226 = _2224;
    if (!_2150)
    {
        _2186 = _2138;
    }
    float _2228 = _2186;
    float _2230 = sqrt(_2132);
    float _2232 = _2228;
    if (_2150)
    {
        float _2234 = _2174 * _2224;
        _1406 = _2234;
    }
    float _2236 = _1406;
    if (!_2150)
    {
        _2176 = _2208;
    }
    float _2238 = _2176;
    float _2240 = _2238;
    float _2242 = _2202;
    if (_2150)
    {
        float _2244 = _2202 + (-1.0);
        _2220 = _2244;
    }
    float _2246 = _2220;
    float _2248 = _2246;
    if (_2150)
    {
        float _2250 = _2138 * _2236;
        _2232 = _2250;
    }
    float _2252 = _2232;
    if (!_2150)
    {
        _2226 = _2142;
    }
    float _2254 = _2226;
    float _2256 = _2254;
    if (_2150)
    {
        float _2258 = _2246 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2210 = _2258;
    }
    float _2260 = _2210;
    if (!_2150)
    {
        _2248 = _2140;
    }
    float _2262 = _2248;
    float _2264 = _2262;
    if (_2150)
    {
        float _2266 = _2140 * _2236;
        _2264 = _2266;
    }
    float _2268 = _2264;
    if (_2150)
    {
        float _2270 = _2252 * _2252;
        _2256 = _2270;
    }
    float _2272 = _2256;
    if (_2150)
    {
        float _2274 = fma(_2208, _2202, _2260);
        _2240 = _2274;
    }
    float _2276 = _2240;
    if (!_2150)
    {
        _2242 = _2144;
    }
    float _2278 = _2242;
    float _2280 = _2278;
    if (_2150)
    {
        float _2282 = _2268 * _2268;
        _2280 = _2282;
    }
    float _2284 = _2280;
    float _2286 = fma(_2276, _2276, _2272);
    float _2288 = _2050 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2290 = floor(_2216);
    float _2292 = _2286 + _2284;
    float _2294 = fma(_2052, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2288);
    float _2296 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2298 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2300 = fma(_2230, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2298);
    float _2302 = precise::clamp(_2300, 0.0, 1.0);
    float _2304 = fma(_2054, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2294);
    float _2306 = rsqrt(_2292);
    float _2308 = fma(_1424, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2310 = _2304 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2312 = -_2302;
    float _2314 = _2312 + 1.0;
    float _2316 = _2050 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2318 = _2310 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2320 = floor(_2308);
    float _2322 = _2050 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2324 = -_2318;
    float _2326 = fma(_2324, _2296, 1.0);
    float _2328 = _2050 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2330 = -_2290;
    float _2332 = _2216 + _2330;
    float _2334 = fma(_2052, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2322);
    float _2336 = _2306 * _2252;
    float _2338 = _2306 * _2276;
    float _2340 = _2306 * _2268;
    float _2342 = fma(_2052, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2328);
    float _2344 = fma(_2054, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2334);
    float _2346 = abs(_2314);
    float _2348 = log2(_2346);
    float _2350 = _2336 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2352 = fma(_2054, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2342);
    float _2354 = _2344 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2356 = fma(_2052, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2316);
    float _2358 = -_2350;
    float _2360 = fma(_2338, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2358);
    float _2362 = _2352 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2364 = _2354 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2366 = fma(_2054, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2356);
    float _2368 = log2(_2326);
    float _2370 = -_2340;
    float _2372 = fma(_2370, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2360);
    float _2374 = fma(_2362, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2364);
    float _2376 = _2354 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2378 = fma(_2372, -0.5, 0.5);
    float _2380 = fma(_2310, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2374);
    float _2382 = _2348 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2384 = fma(_2362, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2376);
    float _2386 = _2366 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2388 = fma(_2372, 0.5, 0.5);
    float _2390 = exp2(_2382);
    float _2392 = fma(_2310, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2384);
    float _2394 = fma(_2386, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2380);
    float _2396 = _2354 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2398 = fma(_2388, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2400 = fma(_2386, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2392);
    float _2402 = _2368 * 0.693147182464599609375;
    float _2404 = 1.0 / _2394;
    float _2406 = -_2320;
    float _2408 = _2308 + _2406;
    float _2410 = fma(_2362, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2396);
    float _2412 = _2338 + 1.0;
    float _2414 = fma(_2388, _2398, -0.212114393711090087890625);
    float _2416 = _2402 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2418 = fma(_2310, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2410);
    float _2420 = sqrt(_2378);
    float _2422 = -_2338;
    float _2424 = fma(_2390, _2412, _2422);
    float _2426 = fma(_2386, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2418);
    float2 _6619 = float2(_2332, _2408);
    float _2428 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6619, float2(0.0), isnan(_6619)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6619, float2(0.0), isnan(_6619)), level(0.0)).x;
    float _2430 = fma(_2388, _2414, 1.570728778839111328125);
    float _2432 = fma(_2424, 0.5, 0.5);
    float _2434 = _2400 * _2404;
    float _2436 = _2426 * _2404;
    float _2438 = fma(_2434, 0.5, 0.5);
    float _2440 = fma(_2436, -0.5, 0.5);
    float _2442 = _2420 * 0.636619746685028076171875;
    float _2444 = -_2430;
    float _2446 = fma(_2442, _2444, 1.0);
    float3 _6652 = float3(_2438, _2440, _2416);
    float _2448 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6652, float3(0.0), isnan(_6652)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6652, float3(0.0), isnan(_6652)), level(0.0)).x;
    float3 _6663 = float3(_2438, _2440, _2416);
    float4 _2451 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6663, float3(0.0), isnan(_6663)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6663, float3(0.0), isnan(_6663)), level(0.0)).xyzw;
    float _2453 = _2451.x;
    float _2455 = _2451.y;
    float _2457 = _2451.z;
    float _2459 = _2451.w;
    float2 _6679 = float2(_2446, _2432);
    float3 _2461 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6679, float2(0.0), isnan(_6679)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6679, float2(0.0), isnan(_6679)), level(0.0)).xyz;
    float _2463 = _2461.x;
    float _2465 = _2461.y;
    float _2467 = _2461.z;
    float _2469 = abs(_2060);
    float _2471 = log2(_2469);
    float _2473 = _2354 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2475 = _2348 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2477 = _2230 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2479 = isnan(_2230);
    bool _2481 = _2477 || _2479;
    bool _2483 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2485 = _2481 || _2483;
    float _2487 = fma(_2362, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2473);
    bool _2489 = _2060 <= 8000.0;
    bool _2491 = isnan(_2060);
    bool _2493 = _2489 || _2491;
    bool _2495 = isnan(8000.0);
    bool _2497 = _2493 || _2495;
    float _2499 = float(_2497);
    float _2501 = exp2(_2475);
    float _2503 = fma(_2310, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2487);
    float _2505 = in.m_80.x;
    float _2507 = _2471 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2509 = fma(_2386, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2503);
    float _2511 = _2394 * 0.5;
    float _2513 = exp2(_2507);
    float _2515 = fma(_2426, -0.5, _2511);
    out.gl_Position.x = _2400;
    out.gl_Position.y = _2426;
    out.gl_Position.z = _2509;
    out.gl_Position.w = _2394;
    float _2517 = -_2501;
    float _2519 = _2517 + 1.0;
    float _2521 = _2519 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2523 = fma(_2513, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2525 = precise::clamp(_2523, 0.0, 1.0);
    float _2527 = _2509 + _2394;
    float _2529 = _2509;
    float _2531 = _2426;
    float _2533 = _2394;
    float _2535 = _2521;
    if (!_2485)
    {
        _2529 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2537 = _2529;
    float _2539 = fma(_2525, -2.0, 3.0);
    float _2541 = _2525 * _2525;
    float _2543 = _2527 * 0.5;
    float _2545 = _2537;
    float _2547 = _2537;
    if (!_2485)
    {
        _2531 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2549 = _2531;
    float _2551 = _2541 * _2539;
    float _2553 = -_2551;
    float _2555 = _2553 + 1.0;
    float _2557 = fma(_2555, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2551);
    float _2559 = _2400 + _2394;
    float _2561 = -_2521;
    float _2563 = _2561 + 1.0;
    float _2565 = _2499 * _2557;
    float _2567 = _2559 * 0.5;
    float _2569 = _2563;
    float _2571 = _2549;
    float _2573 = _2549;
    if (!_2485)
    {
        _2533 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2575 = _2533;
    float _2577 = _2565 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_82.x = _2567;
    out.m_82.y = _2515;
    out.m_82.z = _2543;
    out.m_82.w = _2394;
    float _2579 = -_2428;
    float _2581 = _2579 + 1.0;
    float _2583 = _2581 * _2577;
    float _2585 = precise::clamp(_2583, 0.0, 1.0);
    float _2587 = -_2585;
    float _2589 = fma(_2587, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2591 = _2589 * _2505;
    float _2593 = _2521 * _2448;
    float _2595 = _2459 * _2563;
    float _2597 = _2591;
    float _2599 = _2575;
    float _2601 = _2575;
    if (!_2485)
    {
        _2535 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2603 = _2535;
    float _2605 = _2459 * _2593;
    float _2607 = _2467 * _2593;
    float _2609 = _2603;
    float _2611 = _2603;
    if (!_2485)
    {
        _2569 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2613 = _2569;
    float _2615 = fma(_2463, _2605, _2453);
    float _2617 = fma(_2465, _2605, _2455);
    float _2619 = _2591 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2621 = fma(_2459, _2607, _2457);
    float _2623 = _2114 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2625 = _2613;
    float _2627 = _2613;
    if (!_2485)
    {
        _2597 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2629 = _2597;
    out.m_84.x = _2619;
    out.m_86.x = _2615;
    out.m_86.y = _2617;
    out.m_86.z = _2621;
    out.m_86.w = _2595;
    bool _2631 = !_2485;
    float _2633 = _2629;
    float _2635 = _2629;
    if (!_2631)
    {
        bool _2637 = _2230 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2639 = isnan(_2230);
        bool _2641 = _2637 || _2639;
        bool _2643 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2645 = _2641 || _2643;
        if (!_2645)
        {
            float _2647 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2649 = _2230 + _2647;
            float _2651 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2653 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2651;
            float _2655 = 1.0 / _2653;
            float _2657 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2659 = _2657 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2661 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2663 = _2661 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2665 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2667 = _2665 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2669 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2671 = _2669 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2673 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2675 = _2673 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2677 = _2649 * _2655;
            float _2679 = precise::clamp(_2677, 0.0, 1.0);
            float _2681 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2683 = _2681 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2685 = fma(_2679, _2659, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2687 = fma(_2679, _2683, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2689 = fma(_2679, _2663, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2691 = fma(_2679, _2667, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2693 = fma(_2679, _2671, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2695 = fma(_2679, _2675, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2635 = _2687;
            _2573 = _2693;
            _2611 = _2685;
            _2547 = _2691;
            _2601 = _2689;
            _2627 = _2695;
            _2697 = true;
        }
        else
        {
            bool _2699 = _2230 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2701 = isnan(_2230);
            bool _2703 = _2699 || _2701;
            bool _2705 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2707 = _2703 || _2705;
            if (!_2707)
            {
                _2609 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2709 = _2609;
            _2611 = _2709;
            if (!_2707)
            {
                _2633 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2711 = _2633;
            _2635 = _2711;
            if (!_2707)
            {
                _2599 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2713 = _2599;
            _2601 = _2713;
            if (!_2707)
            {
                _2545 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2715 = _2545;
            _2547 = _2715;
            if (!_2707)
            {
                _2571 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2717 = _2571;
            _2573 = _2717;
            if (!_2707)
            {
                _2625 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2719 = _2625;
            bool _2721 = !_2707;
            _2627 = _2719;
            if (!_2721)
            {
                bool _2723 = _2230 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2725 = isnan(_2230);
                bool _2727 = _2723 || _2725;
                bool _2729 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2731 = _2727 || _2729;
                if (!_2731)
                {
                    float _2733 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2735 = _2230 + _2733;
                    float _2737 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2739 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2737;
                    float _2741 = 1.0 / _2739;
                    float _2743 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2745 = _2743 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2747 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2749 = _2747 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2751 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2753 = _2751 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2755 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2757 = _2755 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2759 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2761 = _2759 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2763 = _2735 * _2741;
                    float _2765 = precise::clamp(_2763, 0.0, 1.0);
                    float _2767 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2769 = _2767 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2771 = fma(_2765, _2745, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2773 = fma(_2765, _2769, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2775 = fma(_2765, _2749, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2777 = fma(_2765, _2753, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2779 = fma(_2765, _2757, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2781 = fma(_2765, _2761, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2635 = _2773;
                    _2573 = _2779;
                    _2611 = _2771;
                    _2547 = _2777;
                    _2601 = _2775;
                    _2627 = _2781;
                    _2697 = true;
                }
                else
                {
                    _2635 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2573 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2611 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2547 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2601 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2627 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2697 = false;
    float _2783 = _2635;
    float _2785 = _2573;
    float _2787 = _2611;
    float _2789 = _2547;
    float _2791 = _2601;
    float _2793 = _2627;
    float _2795 = fma(_1832, -0.5, 0.5);
    float _2797 = precise::clamp(_2795, 0.0, 1.0);
    float _2799 = -_2783;
    float _2801 = _2799 + _2785;
    float _2803 = _2623 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2805 = -_2787;
    float _2807 = _2805 + _2789;
    float _2809 = fma(_2797, _2801, _2783);
    out.m_88.x = 0.0;
    float _2811 = -_2791;
    float _2813 = _2811 + _2793;
    float _2815 = fma(_2797, _2807, _2787);
    float _2817 = _2809 * 0.586610972881317138671875;
    out.m_57.x = _2803;
    bool _2819 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2821 = fma(_2797, _2813, _2791);
    float _2823 = fma(_2815, 0.298911988735198974609375, _2817);
    bool _2825 = _2114 > 0.0;
    bool _2827 = isnan(_2114);
    bool _2829 = _2825 || _2827;
    bool _2831 = isnan(0.0);
    bool _2833 = _2829 || _2831;
    float _2835 = fma(_2821, 0.114477999508380889892578125, _2823);
    float _2837 = -_2835;
    float _2839 = _2815 + _2837;
    float _2841 = -_2835;
    float _2843 = _2809 + _2841;
    float _2845 = -_2835;
    float _2847 = _2821 + _2845;
    float _2849 = fma(_2839, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2835);
    float _2851 = fma(_2843, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2835);
    float _2853 = fma(_2847, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2835);
    bool _2855 = !_2819;
    if (!_2855)
    {
        float _2857 = -_2050;
        float _2859 = _2857 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2861 = -_2052;
        float _2863 = _2861 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2865 = -_2054;
        float _2867 = _2865 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2869 = _2859 * _2859;
        float _2871 = fma(_2863, _2863, _2869);
        float _2873 = fma(_2867, _2867, _2871);
        float _2875 = sqrt(_2873);
        float _2877 = rsqrt(_2873);
        float _2879 = -_2875;
        float _2881 = _2879 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2883 = _2881 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2885 = precise::clamp(_2883, 0.0, 1.0);
        float _2887 = _2863 * _2877;
        float _2889 = _2859 * _2877;
        float _2891 = abs(_2885);
        float _2893 = log2(_2891);
        float _2895 = _2867 * _2877;
        float _2897 = _2887 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2899 = _1832 * _2889;
        float _2901 = -_2889;
        float _2903 = -_2897;
        float _2905 = fma(_2901, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2903);
        float _2907 = fma(_1830, _2887, _2899);
        float _2909 = -_2895;
        float _2911 = fma(_2909, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2905);
        float _2913 = fma(_1834, _2895, _2907);
        float _2915 = precise::clamp(_2913, 0.0, 1.0);
        float _2917 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2919 = _2911 + _2917;
        float _2921 = _2893 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2923 = _2919 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2925 = precise::clamp(_2923, 0.0, 1.0);
        float _2927 = exp2(_2921);
        float _2929 = _2927 * _2925;
        float _2931 = _2915 * _2929;
        float _2933 = _2931 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2935 = _2931 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2937 = _2931 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_88.x = _2933;
        out.m_88.y = _2935;
        out.m_88.z = _2937;
    }
    out.m_90.x = _2849;
    out.m_90.y = _2851;
    out.m_90.z = _2853;
    if (_2833)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_57.x = 0.0;
    float _2939 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2939;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.dm_pad3 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2697 = false;
    bool _1882 = false;
    bool _315 = false;
    bool _205 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _104 = in.m_50.w;
    float _106 = in.m_52.w;
    float _108 = trunc(_104);
    int _111 = int(_108);
    float _113 = -_106;
    float _115 = _113 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_55.y = _115;
    bool _119 = _111 >= 1;
    float _121 = 0.0;
    float _123 = as_type<float>(_111);
    float _125 = _115;
    if (!_119)
    {
        _121 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _127 = _121;
    if (!_119)
    {
        out.m_57.x = 0.0;
    }
    int _129 = 0;
    if (!_119)
    {
        float _131 = _127 * 5.0;
        _129 = as_type<int>(_131);
    }
    int _133 = _129;
    int _135 = _133;
    if (!_119)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3008 = as_type<float>(_133);
        out.gl_Position.z = _3008;
    }
    if (!_119)
    {
        return out;
    }
    bool _137 = _106 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _139 = isnan(_106);
    bool _141 = _137 || _139;
    bool _143 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _145 = _141 || _143;
    float _147 = float(_111);
    bool _149 = _115 >= _147;
    bool _151 = !_145;
    bool _153 = _149 || _151;
    if (_153)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _155 = _123;
    if (_153)
    {
        out.m_57.x = 0.0;
    }
    if (_153)
    {
        float _157 = _155 * 5.0;
        _135 = as_type<int>(_157);
    }
    int _159 = _135;
    if (_153)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3063 = as_type<float>(_159);
        out.gl_Position.z = _3063;
    }
    if (_153)
    {
        return out;
    }
    float _161 = as_type<float>(int(gl_VertexIndex));
    float _163 = 1.0 / _147;
    bool _165 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _167 = _115 * _163;
    int _169 = as_type<int>(_161) & 1;
    bool _171 = _169 != 0;
    int _173 = as_type<int>(_161) & 2;
    bool _175 = _173 != 0;
    bool _177 = !_171;
    float _179 = _177 ? (-0.5) : 0.5;
    bool _181 = !_175;
    float _183 = _181 ? (-0.5) : 0.5;
    bool _185 = !_165;
    float _203;
    if (!_185)
    {
        float _187 = in.m_62.x;
        float _189 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _191 = _187 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _193 = fma(_191, (*spvDescriptorSet0.vp_c9)._m0[12].x, _115);
        float _195 = _193 * _189;
        float _197 = floor(_195);
        float _199 = -_197;
        float _201 = _195 + _199;
        _203 = _201;
        _205 = true;
    }
    else
    {
        _203 = _167;
    }
    _205 = false;
    float _207 = _203;
    float _209 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _211 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _209;
    float _213 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _215 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _217 = _207 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _219 = isnan(_207);
    bool _221 = _217 || _219;
    bool _223 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _225 = _221 || _223;
    float _227 = float(_225);
    float _229 = 1.0 / _211;
    float _231 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _233 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _235 = _213 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _237 = _215 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _239 = _231 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _241 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _243 = _207 + _241;
    float _245 = -_227;
    float _247 = _245 + 1.0;
    out.m_64.x = _235;
    out.m_64.y = _237;
    out.m_64.z = _239;
    out.m_64.w = _233;
    bool _249 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _251 = _243 * _229;
    bool _253 = _207 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _255 = isnan(_207);
    bool _257 = _253 || _255;
    bool _259 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _261 = _257 || _259;
    float _263 = float(_261);
    float _265 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _267 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _265;
    float _269 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _271 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _269;
    float _273 = _263 * _247;
    float _275 = fma(_267, _251, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _277 = fma(_271, _251, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _279 = -_263;
    float _281 = _279 + 1.0;
    float _283 = _275 * _273;
    float _285 = _277 * _273;
    float _287 = fma(_281, (*spvDescriptorSet0.vp_c9)._m0[143].x, _283);
    float _289 = fma(_281, (*spvDescriptorSet0.vp_c9)._m0[143].y, _285);
    float _291 = fma(_227, (*spvDescriptorSet0.vp_c9)._m0[144].x, _287);
    float _293 = fma(_227, (*spvDescriptorSet0.vp_c9)._m0[144].y, _289);
    bool _295 = !_249;
    float _313;
    if (!_295)
    {
        float _297 = in.m_62.x;
        float _299 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _301 = _297 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _303 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[11].w, _115);
        float _305 = _303 * _299;
        float _307 = floor(_305);
        float _309 = -_307;
        float _311 = _305 + _309;
        _313 = _311;
        _315 = true;
    }
    else
    {
        _313 = _167;
    }
    _315 = false;
    float _317 = _313;
    float _319 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _321 = int(_319);
    float _323 = in.m_62.x;
    float _325 = in.m_62.y;
    float _327 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _329 = int(_327);
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _333 = _331 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _335 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _337 = float(_321);
    float _339 = 1.0 / _333;
    float _341 = float(uint(_329));
    float _343 = 1.0 / _337;
    int _345 = ~_329;
    int _347 = _345 + 1;
    float _349 = _325 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _351 = ~_329;
    int _353 = _351 + 1;
    int _355 = ~_329;
    int _357 = _355 + 1;
    float _359 = 1.0 / _341;
    float _361 = _343 * _115;
    float _363 = trunc(_361);
    int _365 = int(_363);
    int _367 = as_type<int>(_359) + (-2);
    float _369 = float(uint(_365));
    float _371 = float(_365);
    float _373 = as_type<float>(_367) * _369;
    float _375 = trunc(_373);
    float _377 = precise::max(_375, 0.0);
    uint _380 = uint(_377);
    int _382 = _347 * int(_380);
    int _384 = _382 + _365;
    float _386 = float(uint(_384));
    float _388 = as_type<float>(_367) * _386;
    int _390 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _392 = _390 != 0;
    float _394 = trunc(_388);
    float _396 = precise::max(_394, 0.0);
    uint _398 = uint(_396);
    bool _400 = !_392;
    float _402 = _400 ? 7.345489978790283203125 : 1.0;
    float _404 = _402 * _323;
    float _406 = floor(_404);
    int _408 = int(_380) + int(_398);
    float _410 = float(_329);
    int _412 = _353 * _408;
    int _414 = _412 + _365;
    bool _416 = _371 >= _410;
    bool _418 = isnan(_371);
    bool _420 = _416 || _418;
    bool _422 = isnan(_410);
    bool _424 = _420 || _422;
    float _426 = float(_424);
    float _428 = _410 * _115;
    float _430 = in.m_66.x;
    float _432 = in.m_66.y;
    bool _434 = uint(_414) >= uint(_329);
    float _436 = trunc(_426);
    int _438 = int(_436);
    float _440 = -_406;
    float _442 = _404 + _440;
    bool _444 = !_434;
    int _446 = _444 ? 0 : (-1);
    float _448 = _428 * _163;
    bool _450 = _329 == 0;
    float _452 = _442 * _410;
    int _454 = ~_408;
    int _456 = _454 + _446;
    int _458 = _456 + 1;
    int _460 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _462 = _460 != 0;
    int _464 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _466 = _464 != 0;
    int _468 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _470 = _468 != 0;
    float _472 = trunc(_448);
    int _474 = int(_472);
    int _476 = _329 * _458;
    int _478 = _476 + _365;
    bool _480 = !_466;
    int _482 = _480 ? 0 : 1;
    int _484 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _486 = _484 != 0;
    int _488 = ~_438;
    int _490 = _488 + 1;
    int _492 = _490 + 1;
    float _494 = trunc(_452);
    int _496 = int(_494);
    bool _498 = !_450;
    int _500 = _498 ? _478 : (-1);
    float _502 = _291 * _430;
    int _504 = _329 + (-1);
    bool _506 = !_462;
    int _508 = _506 ? 0 : 1;
    int _510 = _500 * _492;
    int _512 = abs(_482);
    float _514 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _516 = log2(_514);
    bool _518 = !_486;
    int _520 = _518 ? 0 : 1;
    int _522 = _438 * _504;
    int _524 = _522 + _510;
    int _526 = abs(_508);
    int _528 = abs(_520);
    int _530 = _524 * _512;
    int _532 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _534 = _532 != 0;
    int _536 = _474 * _526;
    int _538 = _536 + _530;
    bool _540 = !_470;
    int _542 = _540 ? 0 : 1;
    int _544 = _496 * _528;
    int _546 = _544 + _365;
    float _548 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _550 = _548 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _552 = in.m_50.x;
    float _554 = in.m_50.y;
    float _556 = in.m_50.z;
    bool _558 = !_534;
    int _560 = _558 ? 0 : 1;
    float _562 = _516 * _115;
    int _564 = abs(_542);
    float _566 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _568 = abs(_560);
    float _570 = 1.0 / _550;
    int _572 = _546 * _564;
    int _574 = _572 + _538;
    float _576 = _323 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _578 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _580 = isnan(0.0);
    bool _582 = _578 || _580;
    bool _584 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _586 = _582 || _584;
    int _588 = _496 * _568;
    int _590 = _588 + _574;
    float _592 = _323 * 2.0;
    float _594 = exp2(_562);
    float _596 = fma(_349, -2.0, _566);
    float _598 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _600 = _598 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _602 = float(uint(_590));
    float _604 = -_335;
    float _606 = fma(_576, 2.0, _604);
    float _608 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[76].y, _596);
    float _610 = as_type<float>(_367) * _602;
    float _612 = 1.0 / _600;
    float _614 = _554 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _616 = _554 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _618 = _554 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _620 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _622 = isnan(1.0);
    bool _624 = _620 || _622;
    bool _626 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _628 = _624 || _626;
    float _630 = fma(_552, (*spvDescriptorSet0.vp_c10)._m0[4].x, _614);
    float _632 = fma(_552, (*spvDescriptorSet0.vp_c10)._m0[5].x, _616);
    float _634 = fma(_552, (*spvDescriptorSet0.vp_c10)._m0[6].x, _618);
    float _636 = floor(_592);
    float _638 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _640 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _638;
    float _642 = -_594;
    float _644 = _642 + 1.0;
    float _646 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _648 = 1.0 + _646;
    float _650 = _640 * _339;
    float _652 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _654 = _652 + (*spvDescriptorSet0.vp_c9)._m0[135].w;
    int _656 = ~_329;
    int _658 = _656 + 1;
    float _660 = trunc(_610);
    float _662 = precise::max(_660, 0.0);
    uint _664 = uint(_662);
    float _666 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _668 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _666;
    float _670 = _586 ? _644 : 0.0;
    float _672 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _674 = _672 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _676 = _668 * _612;
    float _678 = _325 * 2.0;
    float _680 = _674 * _570;
    bool _682 = _636 > 0.0;
    float _684 = 1.0 / _648;
    bool _686 = _636 >= 0.0;
    bool _688 = isnan(_636);
    bool _690 = _686 || _688;
    bool _692 = isnan(0.0);
    bool _694 = _690 || _692;
    float _696 = in.m_62.z;
    float _698 = -_115;
    float _700 = fma(_698, (*spvDescriptorSet0.vp_c9)._m0[76].x, _606);
    float _702 = -(*spvDescriptorSet0.vp_c9)._m0[134].x;
    float _704 = _702 + (*spvDescriptorSet0.vp_c9)._m0[135].x;
    int _706 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _708 = _706 != 0;
    int _710 = _658 * int(_664);
    int _712 = _710 + _590;
    float _714 = 1.0 / _654;
    float _716 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _718 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _720 = _718 != 0;
    float _722 = float(uint(_712));
    float _724 = fma(_323, (*spvDescriptorSet0.vp_c9)._m0[78].z, _716);
    float _726 = _325 + _323;
    float _728 = floor(_678);
    float _730 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _732 = as_type<float>(_367) * _722;
    float _734 = _726 + (-1.0);
    float _736 = fma(_325, (*spvDescriptorSet0.vp_c9)._m0[78].w, _730);
    float _738 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[77].z, _724);
    float _740 = trunc(_732);
    float _742 = precise::max(_740, 0.0);
    uint _744 = uint(_742);
    float _746 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[77].w, _736);
    if (_628)
    {
        float _748 = _670 * _684;
        _125 = _748;
    }
    float _750 = _125;
    bool _752 = _323 > 0.5;
    float _754 = _704 * _714;
    float _756 = -_738;
    float _758 = _756 + 1.0;
    int _760 = _694 ? 0 : 1;
    float _762 = -_746;
    float _764 = _762 + 1.0;
    float _766 = -_179;
    int _768 = _752 ? as_type<int>(_766) : as_type<int>(_179);
    float _770 = fma(_734, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _772 = _728 > 0.0;
    float _774 = _696 * 2.0;
    bool _776 = _728 >= 0.0;
    bool _778 = isnan(_728);
    bool _780 = _776 || _778;
    bool _782 = isnan(0.0);
    bool _784 = _780 || _782;
    float _786 = float(uint(_546));
    float _788 = floor(_774);
    int _790 = ~_760;
    int _792 = _790 + 1;
    int _794 = _792 + 1;
    int _796 = _794;
    if (!_682)
    {
        int _798 = ~_760;
        int _800 = _798 + 1;
        _796 = _800;
    }
    int _802 = _796;
    float _804 = as_type<float>(_367) * _786;
    int _806 = int(_664) + int(_744);
    float _808 = _325 + _696;
    int _810 = ~_329;
    int _812 = _810 + 1;
    bool _814 = _325 > 0.5;
    float _816 = trunc(_804);
    float _818 = precise::max(_816, 0.0);
    uint _820 = uint(_818);
    int _822 = _784 ? 0 : 1;
    int _824 = _812 * _806;
    int _826 = _824 + _590;
    float _828 = _808 + (-1.0);
    float _830 = -_183;
    int _832 = _814 ? as_type<int>(_830) : as_type<int>(_183);
    bool _834 = uint(_826) >= uint(_329);
    float _836 = fma(_828, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _838 = ~_822;
    int _840 = _838 + 1;
    int _842 = _840 + 1;
    int _844 = _842;
    float _846 = _836;
    if (!_772)
    {
        int _848 = ~_822;
        int _850 = _848 + 1;
        _844 = _850;
    }
    int _852 = _844;
    bool _854 = !_708;
    float _856 = _854 ? _179 : as_type<float>(_768);
    bool _858 = !_720;
    float _860 = _858 ? _183 : as_type<float>(_832);
    float _862 = fma(_556, (*spvDescriptorSet0.vp_c10)._m0[4].z, _630);
    int _864 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _866 = _864 != 0;
    int _868 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _870 = _868 != 0;
    int _872 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _874 = _872 != 0;
    float _876 = fma(_556, (*spvDescriptorSet0.vp_c10)._m0[5].z, _632);
    bool _878 = !_834;
    int _880 = _878 ? 0 : (-1);
    int _882 = _357 * int(_820);
    int _884 = _882 + _546;
    bool _886 = _788 > 0.0;
    float _888 = _876 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _890 = _788 >= 0.0;
    bool _892 = isnan(_788);
    bool _894 = _890 || _892;
    bool _896 = isnan(0.0);
    bool _898 = _894 || _896;
    float _900 = fma(_556, (*spvDescriptorSet0.vp_c10)._m0[6].z, _634);
    float _902 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _904 = _317 + _902;
    bool _906 = _317 >= (*spvDescriptorSet0.vp_c9)._m0[135].w;
    bool _908 = isnan(_317);
    bool _910 = _906 || _908;
    bool _912 = isnan((*spvDescriptorSet0.vp_c9)._m0[135].w);
    bool _914 = _910 || _912;
    float _916 = float(_914);
    int _918 = ~_806;
    int _920 = _918 + _880;
    int _922 = _920 + 1;
    float _924 = fma(_650, _904, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _926 = _317 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _928 = isnan(_317);
    bool _930 = _926 || _928;
    bool _932 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _934 = _930 || _932;
    float _936 = float(_934);
    float _938 = -_916;
    float _940 = _938 + 1.0;
    float _942 = float(uint(_884));
    int _944 = _329 * _922;
    int _946 = _944 + _590;
    bool _948 = _317 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _950 = isnan(_317);
    bool _952 = _948 || _950;
    bool _954 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _956 = _952 || _954;
    float _958 = float(_956);
    float _960 = _936 * _940;
    bool _962 = _317 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _964 = isnan(_317);
    bool _966 = _962 || _964;
    bool _968 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _970 = _966 || _968;
    float _972 = float(_970);
    float _974 = as_type<float>(_367) * _942;
    bool _976 = !_450;
    int _978 = _976 ? _946 : (-1);
    float _980 = -_936;
    float _982 = _980 + 1.0;
    bool _984 = _317 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _986 = isnan(_317);
    bool _988 = _984 || _986;
    bool _990 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _992 = _988 || _990;
    float _994 = float(_992);
    int _996 = _978 >> 31;
    float _998 = trunc(_974);
    float _1000 = precise::max(_998, 0.0);
    uint _1002 = uint(_1000);
    int _1004 = _978 & 3;
    bool _1006 = _1004 != 0;
    float _1008 = _994 * _982;
    float _1010 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1012 = _317 + _1010;
    int _1014 = _996 & 3;
    float _1016 = -_994;
    float _1018 = _1016 + 1.0;
    float _1020 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1022 = _317 + _1020;
    float _1024 = fma(_680, _1012, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    int _1026 = _978 + _1014;
    float _1028 = _958 * _1018;
    float _1030 = -_958;
    float _1032 = _1030 + 1.0;
    float _1034 = fma(_676, _1022, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    int _1036 = _1026 >> 2;
    float _1038 = _856 + 0.5;
    float _1040 = _972 * _1032;
    float _1042 = _860 + (-0.5);
    int _1044 = _1036 << 4;
    int _1046 = _1044 + 368;
    float _1048 = fma(_1038, (*spvDescriptorSet0.vp_c9)._m0[80].x, _700);
    int _1050 = int(_820) + int(_1002);
    float _1052 = -_1042;
    float _1054 = -_608;
    float _1056 = fma(_1052, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1054);
    int _1058 = ~_329;
    int _1060 = _1058 + 1;
    uint _1062 = uint(int(uint(_1046) >> uint(2)));
    uint _1064 = uint(int(uint(int(_1062)) >> uint(2)));
    int _1066 = int(_1062) & 3;
    float _1068 = (*spvDescriptorSet0.vp_c9)._m0[int(_1064)][_1066];
    int _1070 = int(_1062) + 1;
    uint _1072 = uint(int(uint(_1070) >> uint(2)));
    int _1074 = _1070 & 3;
    float _1076 = (*spvDescriptorSet0.vp_c9)._m0[int(_1072)][_1074];
    float _1078 = -_758;
    float _1080 = fma(_856, _1078, _1048);
    float _1082 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1084 = _317 + _1082;
    int _1086 = _898 ? 0 : 1;
    float _1088 = _924 * _1040;
    float _1090 = -_972;
    float _1092 = _1090 + 1.0;
    float _1094 = fma(_754, _1084, (*spvDescriptorSet0.vp_c9)._m0[134].x);
    int _1096 = ~_1086;
    int _1098 = _1096 + 1;
    int _1100 = _1098 + 1;
    int _1102 = _1060 * _1050;
    int _1104 = _1102 + _546;
    int _1106 = _1100;
    if (!_886)
    {
        int _1108 = ~_1086;
        int _1110 = _1108 + 1;
        _1106 = _1110;
    }
    int _1112 = _1106;
    float _1114 = fma(_1092, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1088);
    int _1116 = _978 & 3;
    bool _1118 = _1116 != 0;
    float _1120 = fma(_860, _764, _1056);
    bool _1122 = !_866;
    int _1124 = _1122 ? 0 : 1;
    float _1126 = fma(_1024, _1028, _1114);
    int _1128 = _1006 ? 0 : 1;
    bool _1130 = uint(_1116) > 1u;
    out.m_68.x = _1080;
    out.m_68.y = _1120;
    bool _1132 = uint(_1104) >= uint(_329);
    int _1134 = abs(_1124);
    int _1136 = _1046 + 8;
    uint _1138 = uint(int(uint(_1136) >> uint(2)));
    uint _1140 = uint(int(uint(int(_1138)) >> uint(2)));
    int _1142 = int(_1138) & 3;
    float _1144 = (*spvDescriptorSet0.vp_c9)._m0[int(_1140)][_1142];
    int _1146 = int(_1138) + 1;
    uint _1148 = uint(int(uint(_1146) >> uint(2)));
    int _1150 = _1146 & 3;
    float _1152 = (*spvDescriptorSet0.vp_c9)._m0[int(_1148)][_1150];
    bool _1154 = !_870;
    int _1156 = _1154 ? 0 : 1;
    int _1158 = ~_1128;
    int _1160 = _1158 + 1;
    int _1162 = _1160 + 1;
    int _1164 = abs(_1156);
    int _1166 = _1162;
    if (!_1130)
    {
        int _1168 = ~_1128;
        int _1170 = _1168 + 1;
        _1166 = _1170;
    }
    int _1172 = _1166;
    bool _1174 = uint(_1116) >= 2u;
    float _1176 = float(_802);
    float _1178 = float(_1164);
    float _1180 = fma(_1034, _1008, _1126);
    int _1182 = abs(_1172);
    int _1184 = _1174 ? 0 : 1;
    float _1186 = _1178 * _1176;
    bool _1188 = _1116 != 3;
    float _1190 = fma(_1094, _960, _1180);
    int _1192 = ~_1182;
    int _1194 = _1192 + 1;
    int _1196 = _1194 + 1;
    int _1198 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1200 = _1198 != 0;
    float _1202 = float(_1134);
    int _1204 = _1196 * as_type<int>(_1076);
    float _1206 = float(_1112);
    bool _1208 = !_1132;
    int _1210 = _1208 ? 0 : (-1);
    bool _1212 = !_1200;
    int _1214 = _1212 ? 0 : 1;
    float _1216 = _1202 * _1206;
    bool _1218 = !_1118;
    int _1220 = _1218 ? 0 : 1;
    float _1222 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1224 = _888 + _1222;
    int _1226 = ~_1184;
    int _1228 = _1226 + 1;
    int _1230 = _1228 + 1;
    float _1232 = _1216 * (-2.0);
    bool _1234 = _1116 != 3;
    float _1236 = _1224 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1238 = _1230;
    if (_1188)
    {
        int _1240 = ~_1184;
        int _1242 = _1240 + 1;
        _1238 = _1242;
    }
    int _1244 = _1238;
    float _1246 = fma(_770, _1232, _770);
    float _1248 = in.m_70.x;
    float _1250 = in.m_70.y;
    float _1252 = in.m_70.z;
    int _1254 = abs(_1214);
    float _1256 = _862 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1258 = abs(_1220);
    float _1260 = _900 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1262 = !_1234;
    int _1264 = _1262 ? 0 : (-1);
    float _1266 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1268 = _1256 + _1266;
    int _1270 = ~_1050;
    int _1272 = _1270 + _1210;
    int _1274 = _1272 + 1;
    int _1276 = abs(_1264);
    int _1278 = abs(_1244);
    float _1280 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1282 = _1260 + _1280;
    int _1284 = ~_1258;
    int _1286 = _1284 + 1;
    int _1288 = _1286 + 1;
    float _1290 = fma(_1268, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1236);
    int _1292 = ~_1278;
    int _1294 = _1292 + 1;
    int _1296 = _1294 + 1;
    int _1298 = _329 * _1274;
    int _1300 = _1298 + _546;
    int _1302 = _1288 * as_type<int>(_1068);
    int _1304 = _1302 + _1204;
    int _1306 = ~_1276;
    int _1308 = _1306 + 1;
    int _1310 = _1308 + 1;
    float _1312 = fma(_1282, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1290);
    int _1314 = _1296 * as_type<int>(_1144);
    int _1316 = _1314 + _1304;
    float _1318 = _1186 * (-2.0);
    float _1320 = _502 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1322 = ~_1254;
    int _1324 = _1322 + 1;
    int _1326 = _1324 + 1;
    int _1328 = _1310 * as_type<int>(_1152);
    int _1330 = _1328 + _1316;
    float _1332 = _1224 * _1224;
    float _1334 = fma(_916, (*spvDescriptorSet0.vp_c9)._m0[135].x, _1190);
    float _1336 = fma(_1232, _1248, _1248);
    bool _1338 = _1312 >= 0.0;
    float _1340 = fma(_1268, _1268, _1332);
    int _1342 = _1330 * _1326;
    bool _1344 = !_450;
    int _1346 = _1344 ? _1300 : (-1);
    float _1348 = fma(_836, _1318, _836);
    float _1350 = fma(_1282, _1282, _1340);
    float _1352 = fma(_1318, _1250, _1250);
    int _1354 = _1346 * _1254;
    int _1356 = _1354 + _1342;
    float _1358 = _323 + (-0.5);
    float _1360 = rsqrt(_1350);
    float _1362 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    if (_1338)
    {
        _846 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1364 = _846;
    float _1366 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1368 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1370 = fma(_1358, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1336);
    float _1372 = _1362 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1374 = _1366 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1376 = _1368 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1378 = _1334 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _1380 = as_type<int>(_1364);
    if (_1338)
    {
        float _1382 = _1364 * 5.0;
        _1380 = as_type<int>(_1382);
    }
    int _1384 = _1380;
    float _1386 = float(_1356);
    float _1388 = _1320 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    bool _1390 = !_874;
    int _1392 = _1390 ? 0 : 1;
    out.m_72.x = _1374;
    out.m_72.y = _1372;
    out.m_72.z = _1376;
    out.m_72.w = _1378;
    float _1394 = fma(_1246, _750, _1370);
    float _1396 = _1388 * _1360;
    float _1398 = _325 + (-0.5);
    if (_1338)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4908 = as_type<float>(_1384);
        out.gl_Position.z = _4908;
    }
    int _1400 = abs(_1392);
    float _1402 = _1268 * _1396;
    float _1404 = _1224 * _1396;
    out.m_74.x = _1386;
    float _1406 = _1404;
    if (_1338)
    {
        out.m_57.x = 0.0;
    }
    if (_1338)
    {
        return out;
    }
    float _1408 = -_1404;
    float _1410 = _888 + _1408;
    float _1412 = _1282 * _1396;
    float _1414 = -_1402;
    float _1416 = _1256 + _1414;
    float _1418 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1420 = _1410 + _1418;
    float _1422 = -_1412;
    float _1424 = _1260 + _1422;
    float _1426 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1428 = _1416 + _1426;
    float _1430 = float(_852);
    float _1432 = _1420 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1434 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1436 = _1424 + _1434;
    float _1438 = float(_1400);
    float _1440 = -_1404;
    float _1442 = _1224 + _1440;
    float _1444 = fma(_1428, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1432);
    float _1446 = fma(_1398, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1352);
    float _1448 = -_1402;
    float _1450 = _1268 + _1448;
    float _1452 = _1442 * _1442;
    float _1454 = fma(_1436, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1444);
    float _1456 = _696 + _323;
    float _1458 = _1438 * _1430;
    float _1460 = fma(_1348, _750, _1446);
    float _1462 = fma(_1450, _1450, _1452);
    bool _1464 = _1454 >= 0.0;
    float _1466 = _1456 + (-1.0);
    float _1468 = _1458 * (-2.0);
    float _1470 = -_1412;
    float _1472 = _1282 + _1470;
    float _1474 = _696 + (-0.5);
    float _1476 = fma(_1466, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1478 = fma(_1468, _1252, _1252);
    float _1480 = _1394 * 0.15915493667125701904296875;
    float _1482 = _1460 * 0.15915493667125701904296875;
    float _1484 = fma(_1472, _1472, _1462);
    float _1486 = fma(_1476, _1468, _1476);
    float _1488 = fma(_1474, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1478);
    float _1490 = _1480 * 6.283185482025146484375;
    float _1492 = sin(_1490);
    float _1494 = _1476;
    int _1496 = as_type<int>(_1478);
    float _1498 = _1420;
    float _1500 = _1428;
    if (_1464)
    {
        _1494 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1502 = _1494;
    float _1504 = fma(_1486, _750, _1488);
    if (_1464)
    {
        out.m_57.x = 0.0;
    }
    if (_1464)
    {
        float _1506 = _1502 * 5.0;
        _1496 = as_type<int>(_1506);
    }
    int _1508 = _1496;
    float _1510 = _1504 * 0.15915493667125701904296875;
    float _1512 = _1480 * 6.283185482025146484375;
    float _1514 = cos(_1512);
    float _1516 = _1510;
    if (_1464)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5100 = as_type<float>(_1508);
        out.gl_Position.z = _5100;
    }
    float _1518 = _1482 * 6.283185482025146484375;
    float _1520 = sin(_1518);
    float _1522 = sqrt(_1484);
    float _1524 = _1482 * 6.283185482025146484375;
    float _1526 = cos(_1524);
    if (_1464)
    {
        return out;
    }
    float _1528 = _1510 * 6.283185482025146484375;
    float _1530 = cos(_1528);
    float _1532 = _293 * _432;
    float _1534 = _1360 * _1522;
    float _1536 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _183);
    float _1538 = _1514 * _1520;
    float _1540 = _1532 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1542 = _1320 * _1534;
    float _1544 = _1514 * _1526;
    float _1546 = _1510 * 6.283185482025146484375;
    float _1548 = sin(_1546);
    float _1550 = _1540 * _1534;
    float _1552 = _1492 * _1526;
    float _1554 = _1536 * _1550;
    float _1556 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _179);
    float _1558 = _1492 * _1520;
    float _1560 = _1514 * _1530;
    float _1562 = _1526 * _1530;
    float _1564 = _1556 * _1542;
    float _1566 = _1492 * _1530;
    float _1568 = _1560 * _1554;
    float _1570 = _1520 * _1530;
    float _1572 = _1534 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1574 = _1572 * 0.5;
    float _1576 = fma(_1548, _1544, _1558);
    float _1578 = -_1552;
    float _1580 = fma(_1548, _1538, _1578);
    float _1582 = -_1554;
    float _1584 = _1548 * _1582;
    float _1586 = -_1538;
    float _1588 = fma(_1548, _1552, _1586);
    float _1590 = fma(_1576, _1564, _1568);
    float _1592 = _1566 * _1554;
    float _1594 = fma(_1562, _1564, _1584);
    float _1596 = fma(_1548, _1558, _1544);
    float _1598 = fma(_1580, _1574, _1590);
    float _1600 = fma(_1588, _1564, _1592);
    float _1602 = fma(_1570, _1574, _1594);
    float _1604 = _1598 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1606 = _1598 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1608 = fma(_1596, _1574, _1600);
    float _1610 = fma(_1602, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1604);
    float _1612 = fma(_1602, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1606);
    float _1614 = fma(_1608, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1610);
    float _1616 = fma(_1608, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1612);
    float _1618 = _1614 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1620 = _1616 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1622 = _1598 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1624 = _1256 + _1618;
    float _1626 = _1260 + _1620;
    float _1628 = fma(_1602, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1622);
    float _1630 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1632 = _1624 + _1630;
    float _1634 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1636 = _1626 + _1634;
    float _1638 = fma(_1608, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1628);
    float _1640 = _1632 * _1632;
    float _1642 = _1636 * _1636;
    float _1644 = _1638 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1646 = _1640 + _1642;
    float _1648 = _888 + _1644;
    float _1650 = sqrt(_1646);
    bool _1652 = _1650 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1654 = _1620;
    float _1656 = _1626;
    float _1658 = _1640;
    float _1660 = _1642;
    if (!_1652)
    {
        _1654 = _1624;
    }
    float _1662 = _1654;
    float _1664 = _1662;
    if (!_1652)
    {
        _1516 = _1648;
    }
    float _1666 = _1516;
    bool _1668 = !_1652;
    float _1670 = _1666;
    if (!_1668)
    {
        float _1672 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1674 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1676 = _1650 + _1674;
        float _1678 = rsqrt(_1646);
        float _1680 = _1676 * _1672;
        float _1682 = _1648 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1684 = _1680 * 0.15915493667125701904296875;
        float _1686 = _1684 * 6.283185482025146484375;
        float _1688 = sin(_1686);
        float _1690 = _1684 * 6.283185482025146484375;
        float _1692 = cos(_1690);
        float _1694 = fma(_1688, _1682, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1696 = _1678 * _1694;
        float _1698 = _1692 + (-1.0);
        float _1700 = fma(_1632, _1696, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1702 = fma(_1636, _1696, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1704 = _1698 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1706 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1708 = _1700 + _1706;
        float _1710 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1712 = _1702 + _1710;
        float _1714 = fma(_1648, _1692, _1704);
        float _1716 = _1708 * _1708;
        float _1718 = _1712 * _1712;
        _1664 = _1700;
        _1656 = _1702;
        _1670 = _1714;
        _1658 = _1716;
        _1660 = _1718;
    }
    float _1720 = _1664;
    float _1722 = _1656;
    float _1724 = _1670;
    float _1726 = _1658;
    float _1728 = _1660;
    float _1730 = fma(_1720, 6.2500002968590706586837768554688e-05, 0.5);
    float _1732 = fma(_1722, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _5448 = float2(_1730, _1732);
    float3 _1736 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_5448, float2(0.0), isnan(_5448)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_5448, float2(0.0), isnan(_5448)), level(0.0)).xyz;
    float _1738 = _1736.x;
    float _1740 = _1736.y;
    float _1742 = _1736.z;
    float _1744 = _1576 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1746 = _1576 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1748 = _1576 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1750 = _1560 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1752 = _1560 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1754 = _1560 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1756 = fma(_1562, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1744);
    float _1758 = fma(_1562, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1746);
    float _1760 = fma(_1562, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1748);
    float _1762 = -_1548;
    float _1764 = fma(_1762, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1750);
    float _1766 = -_1548;
    float _1768 = fma(_1766, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1752);
    float _1770 = -_1548;
    float _1772 = fma(_1770, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1754);
    float _1774 = _1580 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1776 = _1580 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1778 = _1580 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1780 = fma(_1588, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1756);
    float _1782 = fma(_1588, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1758);
    float _1784 = fma(_1588, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1760);
    float _1786 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1788 = _1724 + _1786;
    float _1790 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1774);
    float _1792 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1776);
    float _1794 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1778);
    float _1796 = fma(_1788, _1788, _1726);
    float _1798 = fma(_1566, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1764);
    float _1800 = fma(_1566, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1768);
    float _1802 = _183 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1804 = fma(_1566, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1772);
    float _1806 = _1796 + _1728;
    float _1808 = _179 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1810 = _1802 * _1798;
    float _1812 = _1802 * _1800;
    float _1814 = _1802 * _1804;
    float _1816 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1790);
    float _1818 = sqrt(_1806);
    float _1820 = fma(_1808, _1780, _1810);
    float _1822 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1792);
    float _1824 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1794);
    float _1826 = fma(_1808, _1782, _1812);
    float _1828 = fma(_1808, _1784, _1814);
    float _1830 = _1816 + _1820;
    float _1832 = _1822 + _1826;
    float _1834 = _1824 + _1828;
    out.m_76.x = _1830;
    out.m_76.y = _1832;
    out.m_76.z = _1834;
    bool _1836 = _1818 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1838 = isnan(_1818);
    bool _1840 = _1836 || _1838;
    bool _1842 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1844 = _1840 || _1842;
    float _1846 = _1808;
    if (!_1844)
    {
        _1846 = 1.0;
    }
    float _1848 = _1846;
    out.m_78.x = _1738;
    out.m_78.y = _1740;
    out.m_78.z = _1742;
    bool _1850 = !_1844;
    float _1852 = _1848;
    if (!_1850)
    {
        bool _1854 = _1818 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1856 = isnan(_1818);
        bool _1858 = _1854 || _1856;
        bool _1860 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1862 = _1858 || _1860;
        if (!_1862)
        {
            float _1864 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1866 = _1818 + _1864;
            float _1868 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1870 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1868;
            float _1872 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1874 = _1872 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1876 = 1.0 / _1870;
            float _1878 = _1866 * _1876;
            float _1880 = fma(_1878, _1874, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1852 = _1880;
            _1882 = true;
        }
        else
        {
            bool _1884 = _1818 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1886 = isnan(_1818);
            bool _1888 = _1884 || _1886;
            bool _1890 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1892 = _1888 || _1890;
            if (!_1892)
            {
                float _1894 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1896 = _1818 + _1894;
                float _1898 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1900 = _1898 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1902 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1904 = _1902 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1906 = 1.0 / _1900;
                float _1908 = _1896 * _1906;
                float _1910 = fma(_1908, _1904, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1852 = _1910;
                _1882 = true;
            }
            else
            {
                _1852 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1882 = false;
    float _1912 = _1852;
    float _1914 = _1410 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1916 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1918 = _1724 + _1916;
    float _1920 = fma(_1416, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1914);
    float _1922 = _1410 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1924 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1926 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1928 = _1924 || _1926;
    bool _1930 = isnan(0.5);
    bool _1932 = _1928 || _1930;
    float _1934 = fma(_1918, _1912, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1936 = fma(_1424, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1920);
    bool _1938 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1940 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1942 = _1938 || _1940;
    bool _1944 = isnan(0.5);
    bool _1946 = _1942 || _1944;
    float _1948 = _1936 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1950 = fma(_1416, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1922);
    float _1952 = -_1404;
    float _1954 = _1952 + _1934;
    float _1956 = 1.0 / _1948;
    float _1958 = fma(_1424, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1950);
    float _1960 = _1958 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1962 = _1960 + _1948;
    float _1964 = _1962 * _1956;
    float _1966 = _1964 * 0.5;
    float _1968 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1970 = _1720 + _1968;
    float _1972 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1974 = fma(_1966, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1972);
    float _1976 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1978 = _1722 + _1976;
    float _1980 = fma(_1970, _1912, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1982 = 1.0 / _1974;
    float _1984 = fma(_1978, _1912, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1986 = -_1402;
    float _1988 = _1986 + _1980;
    float _1990 = _1912;
    float _1992 = _1954;
    float _1994 = _1988;
    if (_1946)
    {
        _1990 = 1.0;
    }
    float _1996 = _1990;
    float _1998 = -_1412;
    float _2000 = _1998 + _1984;
    float _2002 = _2000;
    float _2004 = _1996;
    if (!_1932)
    {
        float _2006 = _1420 * _1420;
        float _2008 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2010 = -_1260;
        float _2012 = _2010 + _1984;
        float _2014 = -_888;
        float _2016 = _2014 + _1934;
        float _2018 = fma(_1428, _1428, _2006);
        float _2020 = -_1256;
        float _2022 = _2020 + _1980;
        float _2024 = fma(_1436, _1436, _2018);
        float _2026 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2028 = sqrt(_2024);
        float _2030 = 1.0 / _1534;
        float _2032 = _2026 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2034 = precise::min(_2028, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2036 = _2034 * _2008;
        float _2038 = _2036 * _2030;
        float _2040 = _2032 * _2038;
        float _2042 = _2012 * _2038;
        float _2044 = fma(_2016, _2040, _1410);
        float _2046 = fma(_2022, _2040, _1416);
        float _2048 = fma(_2032, _2042, _1424);
        _1992 = _2044;
        _1994 = _2046;
        _2002 = _2048;
        _1498 = _2028;
    }
    float _2050 = _1992;
    float _2052 = _1994;
    float _2054 = _2002;
    float _2056 = _1498;
    float _2058 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2060 = _1982 * _2058;
    float _2062 = _2056;
    if (!_1946)
    {
        float _2064 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2066 = _2064 * 0.15915493667125701904296875;
        float _2068 = _2066 * 6.283185482025146484375;
        float _2070 = cos(_2068);
        float _2072 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2074 = _2072 * 0.15915493667125701904296875;
        float _2076 = _2066 * 6.283185482025146484375;
        float _2078 = sin(_2076);
        float _2080 = 1.0 / _2070;
        float _2082 = _2074 * 6.283185482025146484375;
        float _2084 = cos(_2082);
        float _2086 = _2078 * _2080;
        float _2088 = _2074 * 6.283185482025146484375;
        float _2090 = sin(_2088);
        float _2092 = _2084 * _2086;
        float _2094 = 1.0 / _2092;
        float _2096 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2098 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2096;
        float _2100 = 1.0 / _2098;
        float _2102 = _2090 * _2094;
        float _2104 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2106 = fma(_2060, _2102, _2104);
        float _2108 = _2106 * _2100;
        float _2110 = precise::clamp(_2108, 0.0, 1.0);
        _2062 = _2074;
        _2004 = _2110;
    }
    float _2112 = _2062;
    float _2114 = _2004;
    float _2116 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2118 = _2050 + _2116;
    float _2120 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2122 = _2052 + _2120;
    float _2124 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2126 = _2054 + _2124;
    float _2128 = _2118 * _2118;
    float _2130 = fma(_2122, _2122, _2128);
    float _2132 = fma(_2126, _2126, _2130);
    float _2134 = rsqrt(_2132);
    float _2136 = _2134 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2138 = _2122 * _2136;
    float _2140 = _2126 * _2136;
    float _2142 = _2138 * _2138;
    float _2144 = _2140 * _2140;
    float _2146 = _2142 + _2144;
    float _2148 = sqrt(_2146);
    bool _2150 = _2148 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2152 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2154 = _2148 + _2152;
    float _2156 = _2134;
    float _2158 = _2154;
    float _2160 = _2118;
    if (_2150)
    {
        float _2162 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2156 = _2162;
    }
    float _2164 = _2156;
    float _2166 = _2164;
    if (_2150)
    {
        float _2168 = _2154 * _2164;
        _2158 = _2168;
    }
    float _2170 = _2158;
    if (_2150)
    {
        float _2172 = rsqrt(_2146);
        _2166 = _2172;
    }
    float _2174 = _2166;
    float _2176 = _2174;
    if (_2150)
    {
        float _2178 = _2170 * 0.15915493667125701904296875;
        _1500 = _2178;
    }
    float _2180 = _1500;
    float _2182 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2184 = _2126;
    float _2186 = _2180;
    if (_2150)
    {
        float _2188 = _2180 * 6.283185482025146484375;
        float _2190 = sin(_2188);
        _2184 = _2190;
    }
    float _2192 = _2184;
    float _2194 = precise::max(0.0, _2182);
    float _2196 = _2112;
    if (_2150)
    {
        float _2198 = _2180 * 6.283185482025146484375;
        float _2200 = cos(_2198);
        _2196 = _2200;
    }
    float _2202 = _2196;
    float _2204 = -_2136;
    float _2206 = -_2194;
    float _2208 = fma(_2118, _2204, _2206);
    float _2210 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_2150)
    {
        float _2212 = _2208 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2160 = _2212;
    }
    float _2214 = _2160;
    float _2216 = fma(_1416, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2218 = _2192;
    float _2220 = _2214;
    if (_2150)
    {
        float _2222 = fma(_2192, _2214, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2218 = _2222;
    }
    float _2224 = _2218;
    float _2226 = _2224;
    if (!_2150)
    {
        _2186 = _2138;
    }
    float _2228 = _2186;
    float _2230 = sqrt(_2132);
    float _2232 = _2228;
    if (_2150)
    {
        float _2234 = _2174 * _2224;
        _1406 = _2234;
    }
    float _2236 = _1406;
    if (!_2150)
    {
        _2176 = _2208;
    }
    float _2238 = _2176;
    float _2240 = _2238;
    float _2242 = _2202;
    if (_2150)
    {
        float _2244 = _2202 + (-1.0);
        _2220 = _2244;
    }
    float _2246 = _2220;
    float _2248 = _2246;
    if (_2150)
    {
        float _2250 = _2138 * _2236;
        _2232 = _2250;
    }
    float _2252 = _2232;
    if (!_2150)
    {
        _2226 = _2142;
    }
    float _2254 = _2226;
    float _2256 = _2254;
    if (_2150)
    {
        float _2258 = _2246 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2210 = _2258;
    }
    float _2260 = _2210;
    if (!_2150)
    {
        _2248 = _2140;
    }
    float _2262 = _2248;
    float _2264 = _2262;
    if (_2150)
    {
        float _2266 = _2140 * _2236;
        _2264 = _2266;
    }
    float _2268 = _2264;
    if (_2150)
    {
        float _2270 = _2252 * _2252;
        _2256 = _2270;
    }
    float _2272 = _2256;
    if (_2150)
    {
        float _2274 = fma(_2208, _2202, _2260);
        _2240 = _2274;
    }
    float _2276 = _2240;
    if (!_2150)
    {
        _2242 = _2144;
    }
    float _2278 = _2242;
    float _2280 = _2278;
    if (_2150)
    {
        float _2282 = _2268 * _2268;
        _2280 = _2282;
    }
    float _2284 = _2280;
    float _2286 = fma(_2276, _2276, _2272);
    float _2288 = _2050 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2290 = floor(_2216);
    float _2292 = _2286 + _2284;
    float _2294 = fma(_2052, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2288);
    float _2296 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2298 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2300 = fma(_2230, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2298);
    float _2302 = precise::clamp(_2300, 0.0, 1.0);
    float _2304 = fma(_2054, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2294);
    float _2306 = rsqrt(_2292);
    float _2308 = fma(_1424, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2310 = _2304 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2312 = -_2302;
    float _2314 = _2312 + 1.0;
    float _2316 = _2050 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2318 = _2310 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2320 = floor(_2308);
    float _2322 = _2050 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2324 = -_2318;
    float _2326 = fma(_2324, _2296, 1.0);
    float _2328 = _2050 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2330 = -_2290;
    float _2332 = _2216 + _2330;
    float _2334 = fma(_2052, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2322);
    float _2336 = _2306 * _2252;
    float _2338 = _2306 * _2276;
    float _2340 = _2306 * _2268;
    float _2342 = fma(_2052, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2328);
    float _2344 = fma(_2054, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2334);
    float _2346 = abs(_2314);
    float _2348 = log2(_2346);
    float _2350 = _2336 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2352 = fma(_2054, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2342);
    float _2354 = _2344 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2356 = fma(_2052, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2316);
    float _2358 = -_2350;
    float _2360 = fma(_2338, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2358);
    float _2362 = _2352 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2364 = _2354 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2366 = fma(_2054, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2356);
    float _2368 = log2(_2326);
    float _2370 = -_2340;
    float _2372 = fma(_2370, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2360);
    float _2374 = fma(_2362, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2364);
    float _2376 = _2354 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2378 = fma(_2372, -0.5, 0.5);
    float _2380 = fma(_2310, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2374);
    float _2382 = _2348 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2384 = fma(_2362, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2376);
    float _2386 = _2366 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2388 = fma(_2372, 0.5, 0.5);
    float _2390 = exp2(_2382);
    float _2392 = fma(_2310, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2384);
    float _2394 = fma(_2386, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2380);
    float _2396 = _2354 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2398 = fma(_2388, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2400 = fma(_2386, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2392);
    float _2402 = _2368 * 0.693147182464599609375;
    float _2404 = 1.0 / _2394;
    float _2406 = -_2320;
    float _2408 = _2308 + _2406;
    float _2410 = fma(_2362, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2396);
    float _2412 = _2338 + 1.0;
    float _2414 = fma(_2388, _2398, -0.212114393711090087890625);
    float _2416 = _2402 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2418 = fma(_2310, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2410);
    float _2420 = sqrt(_2378);
    float _2422 = -_2338;
    float _2424 = fma(_2390, _2412, _2422);
    float _2426 = fma(_2386, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2418);
    float2 _6619 = float2(_2332, _2408);
    float _2428 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6619, float2(0.0), isnan(_6619)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6619, float2(0.0), isnan(_6619)), level(0.0)).x;
    float _2430 = fma(_2388, _2414, 1.570728778839111328125);
    float _2432 = fma(_2424, 0.5, 0.5);
    float _2434 = _2400 * _2404;
    float _2436 = _2426 * _2404;
    float _2438 = fma(_2434, 0.5, 0.5);
    float _2440 = fma(_2436, -0.5, 0.5);
    float _2442 = _2420 * 0.636619746685028076171875;
    float _2444 = -_2430;
    float _2446 = fma(_2442, _2444, 1.0);
    float3 _6652 = float3(_2438, _2440, _2416);
    float _2448 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6652, float3(0.0), isnan(_6652)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6652, float3(0.0), isnan(_6652)), level(0.0)).x;
    float3 _6663 = float3(_2438, _2440, _2416);
    float4 _2451 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6663, float3(0.0), isnan(_6663)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6663, float3(0.0), isnan(_6663)), level(0.0)).xyzw;
    float _2453 = _2451.x;
    float _2455 = _2451.y;
    float _2457 = _2451.z;
    float _2459 = _2451.w;
    float2 _6679 = float2(_2446, _2432);
    float3 _2461 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6679, float2(0.0), isnan(_6679)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6679, float2(0.0), isnan(_6679)), level(0.0)).xyz;
    float _2463 = _2461.x;
    float _2465 = _2461.y;
    float _2467 = _2461.z;
    float _2469 = abs(_2060);
    float _2471 = log2(_2469);
    float _2473 = _2354 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2475 = _2348 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2477 = _2230 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2479 = isnan(_2230);
    bool _2481 = _2477 || _2479;
    bool _2483 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2485 = _2481 || _2483;
    float _2487 = fma(_2362, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2473);
    bool _2489 = _2060 <= 8000.0;
    bool _2491 = isnan(_2060);
    bool _2493 = _2489 || _2491;
    bool _2495 = isnan(8000.0);
    bool _2497 = _2493 || _2495;
    float _2499 = float(_2497);
    float _2501 = exp2(_2475);
    float _2503 = fma(_2310, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2487);
    float _2505 = in.m_80.x;
    float _2507 = _2471 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2509 = fma(_2386, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2503);
    float _2511 = _2394 * 0.5;
    float _2513 = exp2(_2507);
    float _2515 = fma(_2426, -0.5, _2511);
    out.gl_Position.x = _2400;
    out.gl_Position.y = _2426;
    out.gl_Position.z = _2509;
    out.gl_Position.w = _2394;
    float _2517 = -_2501;
    float _2519 = _2517 + 1.0;
    float _2521 = _2519 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2523 = fma(_2513, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2525 = precise::clamp(_2523, 0.0, 1.0);
    float _2527 = _2509 + _2394;
    float _2529 = _2509;
    float _2531 = _2426;
    float _2533 = _2394;
    float _2535 = _2521;
    if (!_2485)
    {
        _2529 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2537 = _2529;
    float _2539 = fma(_2525, -2.0, 3.0);
    float _2541 = _2525 * _2525;
    float _2543 = _2527 * 0.5;
    float _2545 = _2537;
    float _2547 = _2537;
    if (!_2485)
    {
        _2531 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2549 = _2531;
    float _2551 = _2541 * _2539;
    float _2553 = -_2551;
    float _2555 = _2553 + 1.0;
    float _2557 = fma(_2555, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2551);
    float _2559 = _2400 + _2394;
    float _2561 = -_2521;
    float _2563 = _2561 + 1.0;
    float _2565 = _2499 * _2557;
    float _2567 = _2559 * 0.5;
    float _2569 = _2563;
    float _2571 = _2549;
    float _2573 = _2549;
    if (!_2485)
    {
        _2533 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2575 = _2533;
    float _2577 = _2565 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_82.x = _2567;
    out.m_82.y = _2515;
    out.m_82.z = _2543;
    out.m_82.w = _2394;
    float _2579 = -_2428;
    float _2581 = _2579 + 1.0;
    float _2583 = _2581 * _2577;
    float _2585 = precise::clamp(_2583, 0.0, 1.0);
    float _2587 = -_2585;
    float _2589 = fma(_2587, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2591 = _2589 * _2505;
    float _2593 = _2521 * _2448;
    float _2595 = _2459 * _2563;
    float _2597 = _2591;
    float _2599 = _2575;
    float _2601 = _2575;
    if (!_2485)
    {
        _2535 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2603 = _2535;
    float _2605 = _2459 * _2593;
    float _2607 = _2467 * _2593;
    float _2609 = _2603;
    float _2611 = _2603;
    if (!_2485)
    {
        _2569 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2613 = _2569;
    float _2615 = fma(_2463, _2605, _2453);
    float _2617 = fma(_2465, _2605, _2455);
    float _2619 = _2591 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2621 = fma(_2459, _2607, _2457);
    float _2623 = _2114 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2625 = _2613;
    float _2627 = _2613;
    if (!_2485)
    {
        _2597 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2629 = _2597;
    out.m_84.x = _2619;
    out.m_86.x = _2615;
    out.m_86.y = _2617;
    out.m_86.z = _2621;
    out.m_86.w = _2595;
    bool _2631 = !_2485;
    float _2633 = _2629;
    float _2635 = _2629;
    if (!_2631)
    {
        bool _2637 = _2230 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2639 = isnan(_2230);
        bool _2641 = _2637 || _2639;
        bool _2643 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2645 = _2641 || _2643;
        if (!_2645)
        {
            float _2647 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2649 = _2230 + _2647;
            float _2651 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2653 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2651;
            float _2655 = 1.0 / _2653;
            float _2657 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2659 = _2657 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2661 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2663 = _2661 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2665 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2667 = _2665 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2669 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2671 = _2669 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2673 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2675 = _2673 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2677 = _2649 * _2655;
            float _2679 = precise::clamp(_2677, 0.0, 1.0);
            float _2681 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2683 = _2681 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2685 = fma(_2679, _2659, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2687 = fma(_2679, _2683, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2689 = fma(_2679, _2663, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2691 = fma(_2679, _2667, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2693 = fma(_2679, _2671, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2695 = fma(_2679, _2675, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2635 = _2687;
            _2573 = _2693;
            _2611 = _2685;
            _2547 = _2691;
            _2601 = _2689;
            _2627 = _2695;
            _2697 = true;
        }
        else
        {
            bool _2699 = _2230 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2701 = isnan(_2230);
            bool _2703 = _2699 || _2701;
            bool _2705 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2707 = _2703 || _2705;
            if (!_2707)
            {
                _2609 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2709 = _2609;
            _2611 = _2709;
            if (!_2707)
            {
                _2633 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2711 = _2633;
            _2635 = _2711;
            if (!_2707)
            {
                _2599 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2713 = _2599;
            _2601 = _2713;
            if (!_2707)
            {
                _2545 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2715 = _2545;
            _2547 = _2715;
            if (!_2707)
            {
                _2571 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2717 = _2571;
            _2573 = _2717;
            if (!_2707)
            {
                _2625 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2719 = _2625;
            bool _2721 = !_2707;
            _2627 = _2719;
            if (!_2721)
            {
                bool _2723 = _2230 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2725 = isnan(_2230);
                bool _2727 = _2723 || _2725;
                bool _2729 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2731 = _2727 || _2729;
                if (!_2731)
                {
                    float _2733 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2735 = _2230 + _2733;
                    float _2737 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2739 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2737;
                    float _2741 = 1.0 / _2739;
                    float _2743 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2745 = _2743 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2747 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2749 = _2747 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2751 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2753 = _2751 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2755 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2757 = _2755 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2759 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2761 = _2759 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2763 = _2735 * _2741;
                    float _2765 = precise::clamp(_2763, 0.0, 1.0);
                    float _2767 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2769 = _2767 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2771 = fma(_2765, _2745, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2773 = fma(_2765, _2769, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2775 = fma(_2765, _2749, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2777 = fma(_2765, _2753, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2779 = fma(_2765, _2757, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2781 = fma(_2765, _2761, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2635 = _2773;
                    _2573 = _2779;
                    _2611 = _2771;
                    _2547 = _2777;
                    _2601 = _2775;
                    _2627 = _2781;
                    _2697 = true;
                }
                else
                {
                    _2635 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2573 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2611 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2547 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2601 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2627 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2697 = false;
    float _2783 = _2635;
    float _2785 = _2573;
    float _2787 = _2611;
    float _2789 = _2547;
    float _2791 = _2601;
    float _2793 = _2627;
    float _2795 = fma(_1832, -0.5, 0.5);
    float _2797 = precise::clamp(_2795, 0.0, 1.0);
    float _2799 = -_2783;
    float _2801 = _2799 + _2785;
    float _2803 = _2623 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2805 = -_2787;
    float _2807 = _2805 + _2789;
    float _2809 = fma(_2797, _2801, _2783);
    out.m_88.x = 0.0;
    float _2811 = -_2791;
    float _2813 = _2811 + _2793;
    float _2815 = fma(_2797, _2807, _2787);
    float _2817 = _2809 * 0.586610972881317138671875;
    out.m_57.x = _2803;
    bool _2819 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2821 = fma(_2797, _2813, _2791);
    float _2823 = fma(_2815, 0.298911988735198974609375, _2817);
    bool _2825 = _2114 > 0.0;
    bool _2827 = isnan(_2114);
    bool _2829 = _2825 || _2827;
    bool _2831 = isnan(0.0);
    bool _2833 = _2829 || _2831;
    float _2835 = fma(_2821, 0.114477999508380889892578125, _2823);
    float _2837 = -_2835;
    float _2839 = _2815 + _2837;
    float _2841 = -_2835;
    float _2843 = _2809 + _2841;
    float _2845 = -_2835;
    float _2847 = _2821 + _2845;
    float _2849 = fma(_2839, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2835);
    float _2851 = fma(_2843, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2835);
    float _2853 = fma(_2847, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2835);
    bool _2855 = !_2819;
    if (!_2855)
    {
        float _2857 = -_2050;
        float _2859 = _2857 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2861 = -_2052;
        float _2863 = _2861 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2865 = -_2054;
        float _2867 = _2865 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2869 = _2859 * _2859;
        float _2871 = fma(_2863, _2863, _2869);
        float _2873 = fma(_2867, _2867, _2871);
        float _2875 = sqrt(_2873);
        float _2877 = rsqrt(_2873);
        float _2879 = -_2875;
        float _2881 = _2879 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2883 = _2881 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2885 = precise::clamp(_2883, 0.0, 1.0);
        float _2887 = _2863 * _2877;
        float _2889 = _2859 * _2877;
        float _2891 = abs(_2885);
        float _2893 = log2(_2891);
        float _2895 = _2867 * _2877;
        float _2897 = _2887 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2899 = _1832 * _2889;
        float _2901 = -_2889;
        float _2903 = -_2897;
        float _2905 = fma(_2901, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2903);
        float _2907 = fma(_1830, _2887, _2899);
        float _2909 = -_2895;
        float _2911 = fma(_2909, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2905);
        float _2913 = fma(_1834, _2895, _2907);
        float _2915 = precise::clamp(_2913, 0.0, 1.0);
        float _2917 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2919 = _2911 + _2917;
        float _2921 = _2893 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2923 = _2919 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2925 = precise::clamp(_2923, 0.0, 1.0);
        float _2927 = exp2(_2921);
        float _2929 = _2927 * _2925;
        float _2931 = _2915 * _2929;
        float _2933 = _2931 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2935 = _2931 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2937 = _2931 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_88.x = _2933;
        out.m_88.y = _2935;
        out.m_88.z = _2937;
    }
    out.m_90.x = _2849;
    out.m_90.y = _2851;
    out.m_90.z = _2853;
    if (_2833)
    {
        return out;
    }
    out.m_57.x = 0.0;
    float _2939 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2939;
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
    out.dm_pad3 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2697 = false;
    bool _1882 = false;
    bool _315 = false;
    bool _205 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _104 = in.m_50.w;
    float _106 = in.m_52.w;
    float _108 = trunc(_104);
    int _111 = int(_108);
    float _113 = -_106;
    float _115 = _113 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_55.y = _115;
    bool _119 = _111 >= 1;
    float _121 = 0.0;
    float _123 = as_type<float>(_111);
    float _125 = _115;
    if (!_119)
    {
        _121 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _127 = _121;
    if (!_119)
    {
        out.m_57.x = 0.0;
    }
    int _129 = 0;
    if (!_119)
    {
        float _131 = _127 * 5.0;
        _129 = as_type<int>(_131);
    }
    int _133 = _129;
    int _135 = _133;
    if (!_119)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3008 = as_type<float>(_133);
        out.gl_Position.z = _3008;
    }
    if (!_119)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.dm_pad3.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.dm_pad3.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.dm_pad3.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.dm_pad3.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _137 = _106 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _139 = isnan(_106);
    bool _141 = _137 || _139;
    bool _143 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _145 = _141 || _143;
    float _147 = float(_111);
    bool _149 = _115 >= _147;
    bool _151 = !_145;
    bool _153 = _149 || _151;
    if (_153)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _155 = _123;
    if (_153)
    {
        out.m_57.x = 0.0;
    }
    if (_153)
    {
        float _157 = _155 * 5.0;
        _135 = as_type<int>(_157);
    }
    int _159 = _135;
    if (_153)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3063 = as_type<float>(_159);
        out.gl_Position.z = _3063;
    }
    if (_153)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.dm_pad3.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.dm_pad3.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.dm_pad3.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.dm_pad3.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _161 = as_type<float>(int(gl_VertexIndex));
    float _163 = 1.0 / _147;
    bool _165 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _167 = _115 * _163;
    int _169 = as_type<int>(_161) & 1;
    bool _171 = _169 != 0;
    int _173 = as_type<int>(_161) & 2;
    bool _175 = _173 != 0;
    bool _177 = !_171;
    float _179 = _177 ? (-0.5) : 0.5;
    bool _181 = !_175;
    float _183 = _181 ? (-0.5) : 0.5;
    bool _185 = !_165;
    float _203;
    if (!_185)
    {
        float _187 = in.m_62.x;
        float _189 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _191 = _187 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _193 = fma(_191, (*spvDescriptorSet0.vp_c9)._m0[12].x, _115);
        float _195 = _193 * _189;
        float _197 = floor(_195);
        float _199 = -_197;
        float _201 = _195 + _199;
        _203 = _201;
        _205 = true;
    }
    else
    {
        _203 = _167;
    }
    _205 = false;
    float _207 = _203;
    float _209 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _211 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _209;
    float _213 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _215 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _217 = _207 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _219 = isnan(_207);
    bool _221 = _217 || _219;
    bool _223 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _225 = _221 || _223;
    float _227 = float(_225);
    float _229 = 1.0 / _211;
    float _231 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _233 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _235 = _213 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _237 = _215 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _239 = _231 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _241 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _243 = _207 + _241;
    float _245 = -_227;
    float _247 = _245 + 1.0;
    out.m_64.x = _235;
    out.m_64.y = _237;
    out.m_64.z = _239;
    out.m_64.w = _233;
    bool _249 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _251 = _243 * _229;
    bool _253 = _207 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _255 = isnan(_207);
    bool _257 = _253 || _255;
    bool _259 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _261 = _257 || _259;
    float _263 = float(_261);
    float _265 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _267 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _265;
    float _269 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _271 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _269;
    float _273 = _263 * _247;
    float _275 = fma(_267, _251, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _277 = fma(_271, _251, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _279 = -_263;
    float _281 = _279 + 1.0;
    float _283 = _275 * _273;
    float _285 = _277 * _273;
    float _287 = fma(_281, (*spvDescriptorSet0.vp_c9)._m0[143].x, _283);
    float _289 = fma(_281, (*spvDescriptorSet0.vp_c9)._m0[143].y, _285);
    float _291 = fma(_227, (*spvDescriptorSet0.vp_c9)._m0[144].x, _287);
    float _293 = fma(_227, (*spvDescriptorSet0.vp_c9)._m0[144].y, _289);
    bool _295 = !_249;
    float _313;
    if (!_295)
    {
        float _297 = in.m_62.x;
        float _299 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _301 = _297 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _303 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[11].w, _115);
        float _305 = _303 * _299;
        float _307 = floor(_305);
        float _309 = -_307;
        float _311 = _305 + _309;
        _313 = _311;
        _315 = true;
    }
    else
    {
        _313 = _167;
    }
    _315 = false;
    float _317 = _313;
    float _319 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _321 = int(_319);
    float _323 = in.m_62.x;
    float _325 = in.m_62.y;
    float _327 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _329 = int(_327);
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _333 = _331 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _335 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _337 = float(_321);
    float _339 = 1.0 / _333;
    float _341 = float(uint(_329));
    float _343 = 1.0 / _337;
    int _345 = ~_329;
    int _347 = _345 + 1;
    float _349 = _325 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _351 = ~_329;
    int _353 = _351 + 1;
    int _355 = ~_329;
    int _357 = _355 + 1;
    float _359 = 1.0 / _341;
    float _361 = _343 * _115;
    float _363 = trunc(_361);
    int _365 = int(_363);
    int _367 = as_type<int>(_359) + (-2);
    float _369 = float(uint(_365));
    float _371 = float(_365);
    float _373 = as_type<float>(_367) * _369;
    float _375 = trunc(_373);
    float _377 = precise::max(_375, 0.0);
    uint _380 = uint(_377);
    int _382 = _347 * int(_380);
    int _384 = _382 + _365;
    float _386 = float(uint(_384));
    float _388 = as_type<float>(_367) * _386;
    int _390 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _392 = _390 != 0;
    float _394 = trunc(_388);
    float _396 = precise::max(_394, 0.0);
    uint _398 = uint(_396);
    bool _400 = !_392;
    float _402 = _400 ? 7.345489978790283203125 : 1.0;
    float _404 = _402 * _323;
    float _406 = floor(_404);
    int _408 = int(_380) + int(_398);
    float _410 = float(_329);
    int _412 = _353 * _408;
    int _414 = _412 + _365;
    bool _416 = _371 >= _410;
    bool _418 = isnan(_371);
    bool _420 = _416 || _418;
    bool _422 = isnan(_410);
    bool _424 = _420 || _422;
    float _426 = float(_424);
    float _428 = _410 * _115;
    float _430 = in.m_66.x;
    float _432 = in.m_66.y;
    bool _434 = uint(_414) >= uint(_329);
    float _436 = trunc(_426);
    int _438 = int(_436);
    float _440 = -_406;
    float _442 = _404 + _440;
    bool _444 = !_434;
    int _446 = _444 ? 0 : (-1);
    float _448 = _428 * _163;
    bool _450 = _329 == 0;
    float _452 = _442 * _410;
    int _454 = ~_408;
    int _456 = _454 + _446;
    int _458 = _456 + 1;
    int _460 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _462 = _460 != 0;
    int _464 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _466 = _464 != 0;
    int _468 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _470 = _468 != 0;
    float _472 = trunc(_448);
    int _474 = int(_472);
    int _476 = _329 * _458;
    int _478 = _476 + _365;
    bool _480 = !_466;
    int _482 = _480 ? 0 : 1;
    int _484 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _486 = _484 != 0;
    int _488 = ~_438;
    int _490 = _488 + 1;
    int _492 = _490 + 1;
    float _494 = trunc(_452);
    int _496 = int(_494);
    bool _498 = !_450;
    int _500 = _498 ? _478 : (-1);
    float _502 = _291 * _430;
    int _504 = _329 + (-1);
    bool _506 = !_462;
    int _508 = _506 ? 0 : 1;
    int _510 = _500 * _492;
    int _512 = abs(_482);
    float _514 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _516 = log2(_514);
    bool _518 = !_486;
    int _520 = _518 ? 0 : 1;
    int _522 = _438 * _504;
    int _524 = _522 + _510;
    int _526 = abs(_508);
    int _528 = abs(_520);
    int _530 = _524 * _512;
    int _532 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _534 = _532 != 0;
    int _536 = _474 * _526;
    int _538 = _536 + _530;
    bool _540 = !_470;
    int _542 = _540 ? 0 : 1;
    int _544 = _496 * _528;
    int _546 = _544 + _365;
    float _548 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _550 = _548 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _552 = in.m_50.x;
    float _554 = in.m_50.y;
    float _556 = in.m_50.z;
    bool _558 = !_534;
    int _560 = _558 ? 0 : 1;
    float _562 = _516 * _115;
    int _564 = abs(_542);
    float _566 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _568 = abs(_560);
    float _570 = 1.0 / _550;
    int _572 = _546 * _564;
    int _574 = _572 + _538;
    float _576 = _323 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _578 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _580 = isnan(0.0);
    bool _582 = _578 || _580;
    bool _584 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _586 = _582 || _584;
    int _588 = _496 * _568;
    int _590 = _588 + _574;
    float _592 = _323 * 2.0;
    float _594 = exp2(_562);
    float _596 = fma(_349, -2.0, _566);
    float _598 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _600 = _598 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _602 = float(uint(_590));
    float _604 = -_335;
    float _606 = fma(_576, 2.0, _604);
    float _608 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[76].y, _596);
    float _610 = as_type<float>(_367) * _602;
    float _612 = 1.0 / _600;
    float _614 = _554 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _616 = _554 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _618 = _554 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _620 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _622 = isnan(1.0);
    bool _624 = _620 || _622;
    bool _626 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _628 = _624 || _626;
    float _630 = fma(_552, (*spvDescriptorSet0.vp_c10)._m0[4].x, _614);
    float _632 = fma(_552, (*spvDescriptorSet0.vp_c10)._m0[5].x, _616);
    float _634 = fma(_552, (*spvDescriptorSet0.vp_c10)._m0[6].x, _618);
    float _636 = floor(_592);
    float _638 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _640 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _638;
    float _642 = -_594;
    float _644 = _642 + 1.0;
    float _646 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _648 = 1.0 + _646;
    float _650 = _640 * _339;
    float _652 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _654 = _652 + (*spvDescriptorSet0.vp_c9)._m0[135].w;
    int _656 = ~_329;
    int _658 = _656 + 1;
    float _660 = trunc(_610);
    float _662 = precise::max(_660, 0.0);
    uint _664 = uint(_662);
    float _666 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _668 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _666;
    float _670 = _586 ? _644 : 0.0;
    float _672 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _674 = _672 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _676 = _668 * _612;
    float _678 = _325 * 2.0;
    float _680 = _674 * _570;
    bool _682 = _636 > 0.0;
    float _684 = 1.0 / _648;
    bool _686 = _636 >= 0.0;
    bool _688 = isnan(_636);
    bool _690 = _686 || _688;
    bool _692 = isnan(0.0);
    bool _694 = _690 || _692;
    float _696 = in.m_62.z;
    float _698 = -_115;
    float _700 = fma(_698, (*spvDescriptorSet0.vp_c9)._m0[76].x, _606);
    float _702 = -(*spvDescriptorSet0.vp_c9)._m0[134].x;
    float _704 = _702 + (*spvDescriptorSet0.vp_c9)._m0[135].x;
    int _706 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _708 = _706 != 0;
    int _710 = _658 * int(_664);
    int _712 = _710 + _590;
    float _714 = 1.0 / _654;
    float _716 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _718 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _720 = _718 != 0;
    float _722 = float(uint(_712));
    float _724 = fma(_323, (*spvDescriptorSet0.vp_c9)._m0[78].z, _716);
    float _726 = _325 + _323;
    float _728 = floor(_678);
    float _730 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _732 = as_type<float>(_367) * _722;
    float _734 = _726 + (-1.0);
    float _736 = fma(_325, (*spvDescriptorSet0.vp_c9)._m0[78].w, _730);
    float _738 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[77].z, _724);
    float _740 = trunc(_732);
    float _742 = precise::max(_740, 0.0);
    uint _744 = uint(_742);
    float _746 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[77].w, _736);
    if (_628)
    {
        float _748 = _670 * _684;
        _125 = _748;
    }
    float _750 = _125;
    bool _752 = _323 > 0.5;
    float _754 = _704 * _714;
    float _756 = -_738;
    float _758 = _756 + 1.0;
    int _760 = _694 ? 0 : 1;
    float _762 = -_746;
    float _764 = _762 + 1.0;
    float _766 = -_179;
    int _768 = _752 ? as_type<int>(_766) : as_type<int>(_179);
    float _770 = fma(_734, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _772 = _728 > 0.0;
    float _774 = _696 * 2.0;
    bool _776 = _728 >= 0.0;
    bool _778 = isnan(_728);
    bool _780 = _776 || _778;
    bool _782 = isnan(0.0);
    bool _784 = _780 || _782;
    float _786 = float(uint(_546));
    float _788 = floor(_774);
    int _790 = ~_760;
    int _792 = _790 + 1;
    int _794 = _792 + 1;
    int _796 = _794;
    if (!_682)
    {
        int _798 = ~_760;
        int _800 = _798 + 1;
        _796 = _800;
    }
    int _802 = _796;
    float _804 = as_type<float>(_367) * _786;
    int _806 = int(_664) + int(_744);
    float _808 = _325 + _696;
    int _810 = ~_329;
    int _812 = _810 + 1;
    bool _814 = _325 > 0.5;
    float _816 = trunc(_804);
    float _818 = precise::max(_816, 0.0);
    uint _820 = uint(_818);
    int _822 = _784 ? 0 : 1;
    int _824 = _812 * _806;
    int _826 = _824 + _590;
    float _828 = _808 + (-1.0);
    float _830 = -_183;
    int _832 = _814 ? as_type<int>(_830) : as_type<int>(_183);
    bool _834 = uint(_826) >= uint(_329);
    float _836 = fma(_828, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _838 = ~_822;
    int _840 = _838 + 1;
    int _842 = _840 + 1;
    int _844 = _842;
    float _846 = _836;
    if (!_772)
    {
        int _848 = ~_822;
        int _850 = _848 + 1;
        _844 = _850;
    }
    int _852 = _844;
    bool _854 = !_708;
    float _856 = _854 ? _179 : as_type<float>(_768);
    bool _858 = !_720;
    float _860 = _858 ? _183 : as_type<float>(_832);
    float _862 = fma(_556, (*spvDescriptorSet0.vp_c10)._m0[4].z, _630);
    int _864 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _866 = _864 != 0;
    int _868 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _870 = _868 != 0;
    int _872 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _874 = _872 != 0;
    float _876 = fma(_556, (*spvDescriptorSet0.vp_c10)._m0[5].z, _632);
    bool _878 = !_834;
    int _880 = _878 ? 0 : (-1);
    int _882 = _357 * int(_820);
    int _884 = _882 + _546;
    bool _886 = _788 > 0.0;
    float _888 = _876 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _890 = _788 >= 0.0;
    bool _892 = isnan(_788);
    bool _894 = _890 || _892;
    bool _896 = isnan(0.0);
    bool _898 = _894 || _896;
    float _900 = fma(_556, (*spvDescriptorSet0.vp_c10)._m0[6].z, _634);
    float _902 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _904 = _317 + _902;
    bool _906 = _317 >= (*spvDescriptorSet0.vp_c9)._m0[135].w;
    bool _908 = isnan(_317);
    bool _910 = _906 || _908;
    bool _912 = isnan((*spvDescriptorSet0.vp_c9)._m0[135].w);
    bool _914 = _910 || _912;
    float _916 = float(_914);
    int _918 = ~_806;
    int _920 = _918 + _880;
    int _922 = _920 + 1;
    float _924 = fma(_650, _904, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _926 = _317 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _928 = isnan(_317);
    bool _930 = _926 || _928;
    bool _932 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _934 = _930 || _932;
    float _936 = float(_934);
    float _938 = -_916;
    float _940 = _938 + 1.0;
    float _942 = float(uint(_884));
    int _944 = _329 * _922;
    int _946 = _944 + _590;
    bool _948 = _317 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _950 = isnan(_317);
    bool _952 = _948 || _950;
    bool _954 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _956 = _952 || _954;
    float _958 = float(_956);
    float _960 = _936 * _940;
    bool _962 = _317 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _964 = isnan(_317);
    bool _966 = _962 || _964;
    bool _968 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _970 = _966 || _968;
    float _972 = float(_970);
    float _974 = as_type<float>(_367) * _942;
    bool _976 = !_450;
    int _978 = _976 ? _946 : (-1);
    float _980 = -_936;
    float _982 = _980 + 1.0;
    bool _984 = _317 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _986 = isnan(_317);
    bool _988 = _984 || _986;
    bool _990 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _992 = _988 || _990;
    float _994 = float(_992);
    int _996 = _978 >> 31;
    float _998 = trunc(_974);
    float _1000 = precise::max(_998, 0.0);
    uint _1002 = uint(_1000);
    int _1004 = _978 & 3;
    bool _1006 = _1004 != 0;
    float _1008 = _994 * _982;
    float _1010 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1012 = _317 + _1010;
    int _1014 = _996 & 3;
    float _1016 = -_994;
    float _1018 = _1016 + 1.0;
    float _1020 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1022 = _317 + _1020;
    float _1024 = fma(_680, _1012, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    int _1026 = _978 + _1014;
    float _1028 = _958 * _1018;
    float _1030 = -_958;
    float _1032 = _1030 + 1.0;
    float _1034 = fma(_676, _1022, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    int _1036 = _1026 >> 2;
    float _1038 = _856 + 0.5;
    float _1040 = _972 * _1032;
    float _1042 = _860 + (-0.5);
    int _1044 = _1036 << 4;
    int _1046 = _1044 + 368;
    float _1048 = fma(_1038, (*spvDescriptorSet0.vp_c9)._m0[80].x, _700);
    int _1050 = int(_820) + int(_1002);
    float _1052 = -_1042;
    float _1054 = -_608;
    float _1056 = fma(_1052, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1054);
    int _1058 = ~_329;
    int _1060 = _1058 + 1;
    uint _1062 = uint(int(uint(_1046) >> uint(2)));
    uint _1064 = uint(int(uint(int(_1062)) >> uint(2)));
    int _1066 = int(_1062) & 3;
    float _1068 = (*spvDescriptorSet0.vp_c9)._m0[int(_1064)][_1066];
    int _1070 = int(_1062) + 1;
    uint _1072 = uint(int(uint(_1070) >> uint(2)));
    int _1074 = _1070 & 3;
    float _1076 = (*spvDescriptorSet0.vp_c9)._m0[int(_1072)][_1074];
    float _1078 = -_758;
    float _1080 = fma(_856, _1078, _1048);
    float _1082 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1084 = _317 + _1082;
    int _1086 = _898 ? 0 : 1;
    float _1088 = _924 * _1040;
    float _1090 = -_972;
    float _1092 = _1090 + 1.0;
    float _1094 = fma(_754, _1084, (*spvDescriptorSet0.vp_c9)._m0[134].x);
    int _1096 = ~_1086;
    int _1098 = _1096 + 1;
    int _1100 = _1098 + 1;
    int _1102 = _1060 * _1050;
    int _1104 = _1102 + _546;
    int _1106 = _1100;
    if (!_886)
    {
        int _1108 = ~_1086;
        int _1110 = _1108 + 1;
        _1106 = _1110;
    }
    int _1112 = _1106;
    float _1114 = fma(_1092, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1088);
    int _1116 = _978 & 3;
    bool _1118 = _1116 != 0;
    float _1120 = fma(_860, _764, _1056);
    bool _1122 = !_866;
    int _1124 = _1122 ? 0 : 1;
    float _1126 = fma(_1024, _1028, _1114);
    int _1128 = _1006 ? 0 : 1;
    bool _1130 = uint(_1116) > 1u;
    out.m_68.x = _1080;
    out.m_68.y = _1120;
    bool _1132 = uint(_1104) >= uint(_329);
    int _1134 = abs(_1124);
    int _1136 = _1046 + 8;
    uint _1138 = uint(int(uint(_1136) >> uint(2)));
    uint _1140 = uint(int(uint(int(_1138)) >> uint(2)));
    int _1142 = int(_1138) & 3;
    float _1144 = (*spvDescriptorSet0.vp_c9)._m0[int(_1140)][_1142];
    int _1146 = int(_1138) + 1;
    uint _1148 = uint(int(uint(_1146) >> uint(2)));
    int _1150 = _1146 & 3;
    float _1152 = (*spvDescriptorSet0.vp_c9)._m0[int(_1148)][_1150];
    bool _1154 = !_870;
    int _1156 = _1154 ? 0 : 1;
    int _1158 = ~_1128;
    int _1160 = _1158 + 1;
    int _1162 = _1160 + 1;
    int _1164 = abs(_1156);
    int _1166 = _1162;
    if (!_1130)
    {
        int _1168 = ~_1128;
        int _1170 = _1168 + 1;
        _1166 = _1170;
    }
    int _1172 = _1166;
    bool _1174 = uint(_1116) >= 2u;
    float _1176 = float(_802);
    float _1178 = float(_1164);
    float _1180 = fma(_1034, _1008, _1126);
    int _1182 = abs(_1172);
    int _1184 = _1174 ? 0 : 1;
    float _1186 = _1178 * _1176;
    bool _1188 = _1116 != 3;
    float _1190 = fma(_1094, _960, _1180);
    int _1192 = ~_1182;
    int _1194 = _1192 + 1;
    int _1196 = _1194 + 1;
    int _1198 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1200 = _1198 != 0;
    float _1202 = float(_1134);
    int _1204 = _1196 * as_type<int>(_1076);
    float _1206 = float(_1112);
    bool _1208 = !_1132;
    int _1210 = _1208 ? 0 : (-1);
    bool _1212 = !_1200;
    int _1214 = _1212 ? 0 : 1;
    float _1216 = _1202 * _1206;
    bool _1218 = !_1118;
    int _1220 = _1218 ? 0 : 1;
    float _1222 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1224 = _888 + _1222;
    int _1226 = ~_1184;
    int _1228 = _1226 + 1;
    int _1230 = _1228 + 1;
    float _1232 = _1216 * (-2.0);
    bool _1234 = _1116 != 3;
    float _1236 = _1224 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1238 = _1230;
    if (_1188)
    {
        int _1240 = ~_1184;
        int _1242 = _1240 + 1;
        _1238 = _1242;
    }
    int _1244 = _1238;
    float _1246 = fma(_770, _1232, _770);
    float _1248 = in.m_70.x;
    float _1250 = in.m_70.y;
    float _1252 = in.m_70.z;
    int _1254 = abs(_1214);
    float _1256 = _862 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1258 = abs(_1220);
    float _1260 = _900 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1262 = !_1234;
    int _1264 = _1262 ? 0 : (-1);
    float _1266 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1268 = _1256 + _1266;
    int _1270 = ~_1050;
    int _1272 = _1270 + _1210;
    int _1274 = _1272 + 1;
    int _1276 = abs(_1264);
    int _1278 = abs(_1244);
    float _1280 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1282 = _1260 + _1280;
    int _1284 = ~_1258;
    int _1286 = _1284 + 1;
    int _1288 = _1286 + 1;
    float _1290 = fma(_1268, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1236);
    int _1292 = ~_1278;
    int _1294 = _1292 + 1;
    int _1296 = _1294 + 1;
    int _1298 = _329 * _1274;
    int _1300 = _1298 + _546;
    int _1302 = _1288 * as_type<int>(_1068);
    int _1304 = _1302 + _1204;
    int _1306 = ~_1276;
    int _1308 = _1306 + 1;
    int _1310 = _1308 + 1;
    float _1312 = fma(_1282, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1290);
    int _1314 = _1296 * as_type<int>(_1144);
    int _1316 = _1314 + _1304;
    float _1318 = _1186 * (-2.0);
    float _1320 = _502 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1322 = ~_1254;
    int _1324 = _1322 + 1;
    int _1326 = _1324 + 1;
    int _1328 = _1310 * as_type<int>(_1152);
    int _1330 = _1328 + _1316;
    float _1332 = _1224 * _1224;
    float _1334 = fma(_916, (*spvDescriptorSet0.vp_c9)._m0[135].x, _1190);
    float _1336 = fma(_1232, _1248, _1248);
    bool _1338 = _1312 >= 0.0;
    float _1340 = fma(_1268, _1268, _1332);
    int _1342 = _1330 * _1326;
    bool _1344 = !_450;
    int _1346 = _1344 ? _1300 : (-1);
    float _1348 = fma(_836, _1318, _836);
    float _1350 = fma(_1282, _1282, _1340);
    float _1352 = fma(_1318, _1250, _1250);
    int _1354 = _1346 * _1254;
    int _1356 = _1354 + _1342;
    float _1358 = _323 + (-0.5);
    float _1360 = rsqrt(_1350);
    float _1362 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    if (_1338)
    {
        _846 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1364 = _846;
    float _1366 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1368 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1370 = fma(_1358, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1336);
    float _1372 = _1362 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1374 = _1366 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1376 = _1368 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1378 = _1334 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _1380 = as_type<int>(_1364);
    if (_1338)
    {
        float _1382 = _1364 * 5.0;
        _1380 = as_type<int>(_1382);
    }
    int _1384 = _1380;
    float _1386 = float(_1356);
    float _1388 = _1320 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    bool _1390 = !_874;
    int _1392 = _1390 ? 0 : 1;
    out.m_72.x = _1374;
    out.m_72.y = _1372;
    out.m_72.z = _1376;
    out.m_72.w = _1378;
    float _1394 = fma(_1246, _750, _1370);
    float _1396 = _1388 * _1360;
    float _1398 = _325 + (-0.5);
    if (_1338)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4908 = as_type<float>(_1384);
        out.gl_Position.z = _4908;
    }
    int _1400 = abs(_1392);
    float _1402 = _1268 * _1396;
    float _1404 = _1224 * _1396;
    out.m_74.x = _1386;
    float _1406 = _1404;
    if (_1338)
    {
        out.m_57.x = 0.0;
    }
    if (_1338)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.dm_pad3.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.dm_pad3.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.dm_pad3.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.dm_pad3.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1408 = -_1404;
    float _1410 = _888 + _1408;
    float _1412 = _1282 * _1396;
    float _1414 = -_1402;
    float _1416 = _1256 + _1414;
    float _1418 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1420 = _1410 + _1418;
    float _1422 = -_1412;
    float _1424 = _1260 + _1422;
    float _1426 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1428 = _1416 + _1426;
    float _1430 = float(_852);
    float _1432 = _1420 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1434 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1436 = _1424 + _1434;
    float _1438 = float(_1400);
    float _1440 = -_1404;
    float _1442 = _1224 + _1440;
    float _1444 = fma(_1428, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1432);
    float _1446 = fma(_1398, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1352);
    float _1448 = -_1402;
    float _1450 = _1268 + _1448;
    float _1452 = _1442 * _1442;
    float _1454 = fma(_1436, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1444);
    float _1456 = _696 + _323;
    float _1458 = _1438 * _1430;
    float _1460 = fma(_1348, _750, _1446);
    float _1462 = fma(_1450, _1450, _1452);
    bool _1464 = _1454 >= 0.0;
    float _1466 = _1456 + (-1.0);
    float _1468 = _1458 * (-2.0);
    float _1470 = -_1412;
    float _1472 = _1282 + _1470;
    float _1474 = _696 + (-0.5);
    float _1476 = fma(_1466, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1478 = fma(_1468, _1252, _1252);
    float _1480 = _1394 * 0.15915493667125701904296875;
    float _1482 = _1460 * 0.15915493667125701904296875;
    float _1484 = fma(_1472, _1472, _1462);
    float _1486 = fma(_1476, _1468, _1476);
    float _1488 = fma(_1474, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1478);
    float _1490 = _1480 * 6.283185482025146484375;
    float _1492 = sin(_1490);
    float _1494 = _1476;
    int _1496 = as_type<int>(_1478);
    float _1498 = _1420;
    float _1500 = _1428;
    if (_1464)
    {
        _1494 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1502 = _1494;
    float _1504 = fma(_1486, _750, _1488);
    if (_1464)
    {
        out.m_57.x = 0.0;
    }
    if (_1464)
    {
        float _1506 = _1502 * 5.0;
        _1496 = as_type<int>(_1506);
    }
    int _1508 = _1496;
    float _1510 = _1504 * 0.15915493667125701904296875;
    float _1512 = _1480 * 6.283185482025146484375;
    float _1514 = cos(_1512);
    float _1516 = _1510;
    if (_1464)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5100 = as_type<float>(_1508);
        out.gl_Position.z = _5100;
    }
    float _1518 = _1482 * 6.283185482025146484375;
    float _1520 = sin(_1518);
    float _1522 = sqrt(_1484);
    float _1524 = _1482 * 6.283185482025146484375;
    float _1526 = cos(_1524);
    if (_1464)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.dm_pad3.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.dm_pad3.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.dm_pad3.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.dm_pad3.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1528 = _1510 * 6.283185482025146484375;
    float _1530 = cos(_1528);
    float _1532 = _293 * _432;
    float _1534 = _1360 * _1522;
    float _1536 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _183);
    float _1538 = _1514 * _1520;
    float _1540 = _1532 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1542 = _1320 * _1534;
    float _1544 = _1514 * _1526;
    float _1546 = _1510 * 6.283185482025146484375;
    float _1548 = sin(_1546);
    float _1550 = _1540 * _1534;
    float _1552 = _1492 * _1526;
    float _1554 = _1536 * _1550;
    float _1556 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _179);
    float _1558 = _1492 * _1520;
    float _1560 = _1514 * _1530;
    float _1562 = _1526 * _1530;
    float _1564 = _1556 * _1542;
    float _1566 = _1492 * _1530;
    float _1568 = _1560 * _1554;
    float _1570 = _1520 * _1530;
    float _1572 = _1534 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1574 = _1572 * 0.5;
    float _1576 = fma(_1548, _1544, _1558);
    float _1578 = -_1552;
    float _1580 = fma(_1548, _1538, _1578);
    float _1582 = -_1554;
    float _1584 = _1548 * _1582;
    float _1586 = -_1538;
    float _1588 = fma(_1548, _1552, _1586);
    float _1590 = fma(_1576, _1564, _1568);
    float _1592 = _1566 * _1554;
    float _1594 = fma(_1562, _1564, _1584);
    float _1596 = fma(_1548, _1558, _1544);
    float _1598 = fma(_1580, _1574, _1590);
    float _1600 = fma(_1588, _1564, _1592);
    float _1602 = fma(_1570, _1574, _1594);
    float _1604 = _1598 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1606 = _1598 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1608 = fma(_1596, _1574, _1600);
    float _1610 = fma(_1602, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1604);
    float _1612 = fma(_1602, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1606);
    float _1614 = fma(_1608, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1610);
    float _1616 = fma(_1608, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1612);
    float _1618 = _1614 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1620 = _1616 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1622 = _1598 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1624 = _1256 + _1618;
    float _1626 = _1260 + _1620;
    float _1628 = fma(_1602, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1622);
    float _1630 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1632 = _1624 + _1630;
    float _1634 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1636 = _1626 + _1634;
    float _1638 = fma(_1608, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1628);
    float _1640 = _1632 * _1632;
    float _1642 = _1636 * _1636;
    float _1644 = _1638 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1646 = _1640 + _1642;
    float _1648 = _888 + _1644;
    float _1650 = sqrt(_1646);
    bool _1652 = _1650 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1654 = _1620;
    float _1656 = _1626;
    float _1658 = _1640;
    float _1660 = _1642;
    if (!_1652)
    {
        _1654 = _1624;
    }
    float _1662 = _1654;
    float _1664 = _1662;
    if (!_1652)
    {
        _1516 = _1648;
    }
    float _1666 = _1516;
    bool _1668 = !_1652;
    float _1670 = _1666;
    if (!_1668)
    {
        float _1672 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1674 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1676 = _1650 + _1674;
        float _1678 = rsqrt(_1646);
        float _1680 = _1676 * _1672;
        float _1682 = _1648 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1684 = _1680 * 0.15915493667125701904296875;
        float _1686 = _1684 * 6.283185482025146484375;
        float _1688 = sin(_1686);
        float _1690 = _1684 * 6.283185482025146484375;
        float _1692 = cos(_1690);
        float _1694 = fma(_1688, _1682, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1696 = _1678 * _1694;
        float _1698 = _1692 + (-1.0);
        float _1700 = fma(_1632, _1696, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1702 = fma(_1636, _1696, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1704 = _1698 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1706 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1708 = _1700 + _1706;
        float _1710 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1712 = _1702 + _1710;
        float _1714 = fma(_1648, _1692, _1704);
        float _1716 = _1708 * _1708;
        float _1718 = _1712 * _1712;
        _1664 = _1700;
        _1656 = _1702;
        _1670 = _1714;
        _1658 = _1716;
        _1660 = _1718;
    }
    float _1720 = _1664;
    float _1722 = _1656;
    float _1724 = _1670;
    float _1726 = _1658;
    float _1728 = _1660;
    float _1730 = fma(_1720, 6.2500002968590706586837768554688e-05, 0.5);
    float _1732 = fma(_1722, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _5448 = float2(_1730, _1732);
    float3 _1736 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_5448, float2(0.0), isnan(_5448)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_5448, float2(0.0), isnan(_5448)), level(0.0)).xyz;
    float _1738 = _1736.x;
    float _1740 = _1736.y;
    float _1742 = _1736.z;
    float _1744 = _1576 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1746 = _1576 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1748 = _1576 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1750 = _1560 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1752 = _1560 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1754 = _1560 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1756 = fma(_1562, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1744);
    float _1758 = fma(_1562, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1746);
    float _1760 = fma(_1562, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1748);
    float _1762 = -_1548;
    float _1764 = fma(_1762, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1750);
    float _1766 = -_1548;
    float _1768 = fma(_1766, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1752);
    float _1770 = -_1548;
    float _1772 = fma(_1770, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1754);
    float _1774 = _1580 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1776 = _1580 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1778 = _1580 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1780 = fma(_1588, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1756);
    float _1782 = fma(_1588, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1758);
    float _1784 = fma(_1588, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1760);
    float _1786 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1788 = _1724 + _1786;
    float _1790 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1774);
    float _1792 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1776);
    float _1794 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1778);
    float _1796 = fma(_1788, _1788, _1726);
    float _1798 = fma(_1566, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1764);
    float _1800 = fma(_1566, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1768);
    float _1802 = _183 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1804 = fma(_1566, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1772);
    float _1806 = _1796 + _1728;
    float _1808 = _179 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1810 = _1802 * _1798;
    float _1812 = _1802 * _1800;
    float _1814 = _1802 * _1804;
    float _1816 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1790);
    float _1818 = sqrt(_1806);
    float _1820 = fma(_1808, _1780, _1810);
    float _1822 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1792);
    float _1824 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1794);
    float _1826 = fma(_1808, _1782, _1812);
    float _1828 = fma(_1808, _1784, _1814);
    float _1830 = _1816 + _1820;
    float _1832 = _1822 + _1826;
    float _1834 = _1824 + _1828;
    out.m_76.x = _1830;
    out.m_76.y = _1832;
    out.m_76.z = _1834;
    bool _1836 = _1818 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1838 = isnan(_1818);
    bool _1840 = _1836 || _1838;
    bool _1842 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1844 = _1840 || _1842;
    float _1846 = _1808;
    if (!_1844)
    {
        _1846 = 1.0;
    }
    float _1848 = _1846;
    out.m_78.x = _1738;
    out.m_78.y = _1740;
    out.m_78.z = _1742;
    bool _1850 = !_1844;
    float _1852 = _1848;
    if (!_1850)
    {
        bool _1854 = _1818 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1856 = isnan(_1818);
        bool _1858 = _1854 || _1856;
        bool _1860 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1862 = _1858 || _1860;
        if (!_1862)
        {
            float _1864 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1866 = _1818 + _1864;
            float _1868 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1870 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1868;
            float _1872 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1874 = _1872 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1876 = 1.0 / _1870;
            float _1878 = _1866 * _1876;
            float _1880 = fma(_1878, _1874, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1852 = _1880;
            _1882 = true;
        }
        else
        {
            bool _1884 = _1818 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1886 = isnan(_1818);
            bool _1888 = _1884 || _1886;
            bool _1890 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1892 = _1888 || _1890;
            if (!_1892)
            {
                float _1894 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1896 = _1818 + _1894;
                float _1898 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1900 = _1898 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1902 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1904 = _1902 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1906 = 1.0 / _1900;
                float _1908 = _1896 * _1906;
                float _1910 = fma(_1908, _1904, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1852 = _1910;
                _1882 = true;
            }
            else
            {
                _1852 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1882 = false;
    float _1912 = _1852;
    float _1914 = _1410 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1916 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1918 = _1724 + _1916;
    float _1920 = fma(_1416, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1914);
    float _1922 = _1410 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1924 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1926 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1928 = _1924 || _1926;
    bool _1930 = isnan(0.5);
    bool _1932 = _1928 || _1930;
    float _1934 = fma(_1918, _1912, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1936 = fma(_1424, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1920);
    bool _1938 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1940 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1942 = _1938 || _1940;
    bool _1944 = isnan(0.5);
    bool _1946 = _1942 || _1944;
    float _1948 = _1936 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1950 = fma(_1416, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1922);
    float _1952 = -_1404;
    float _1954 = _1952 + _1934;
    float _1956 = 1.0 / _1948;
    float _1958 = fma(_1424, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1950);
    float _1960 = _1958 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1962 = _1960 + _1948;
    float _1964 = _1962 * _1956;
    float _1966 = _1964 * 0.5;
    float _1968 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1970 = _1720 + _1968;
    float _1972 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1974 = fma(_1966, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1972);
    float _1976 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1978 = _1722 + _1976;
    float _1980 = fma(_1970, _1912, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1982 = 1.0 / _1974;
    float _1984 = fma(_1978, _1912, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1986 = -_1402;
    float _1988 = _1986 + _1980;
    float _1990 = _1912;
    float _1992 = _1954;
    float _1994 = _1988;
    if (_1946)
    {
        _1990 = 1.0;
    }
    float _1996 = _1990;
    float _1998 = -_1412;
    float _2000 = _1998 + _1984;
    float _2002 = _2000;
    float _2004 = _1996;
    if (!_1932)
    {
        float _2006 = _1420 * _1420;
        float _2008 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2010 = -_1260;
        float _2012 = _2010 + _1984;
        float _2014 = -_888;
        float _2016 = _2014 + _1934;
        float _2018 = fma(_1428, _1428, _2006);
        float _2020 = -_1256;
        float _2022 = _2020 + _1980;
        float _2024 = fma(_1436, _1436, _2018);
        float _2026 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2028 = sqrt(_2024);
        float _2030 = 1.0 / _1534;
        float _2032 = _2026 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2034 = precise::min(_2028, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2036 = _2034 * _2008;
        float _2038 = _2036 * _2030;
        float _2040 = _2032 * _2038;
        float _2042 = _2012 * _2038;
        float _2044 = fma(_2016, _2040, _1410);
        float _2046 = fma(_2022, _2040, _1416);
        float _2048 = fma(_2032, _2042, _1424);
        _1992 = _2044;
        _1994 = _2046;
        _2002 = _2048;
        _1498 = _2028;
    }
    float _2050 = _1992;
    float _2052 = _1994;
    float _2054 = _2002;
    float _2056 = _1498;
    float _2058 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2060 = _1982 * _2058;
    float _2062 = _2056;
    if (!_1946)
    {
        float _2064 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2066 = _2064 * 0.15915493667125701904296875;
        float _2068 = _2066 * 6.283185482025146484375;
        float _2070 = cos(_2068);
        float _2072 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2074 = _2072 * 0.15915493667125701904296875;
        float _2076 = _2066 * 6.283185482025146484375;
        float _2078 = sin(_2076);
        float _2080 = 1.0 / _2070;
        float _2082 = _2074 * 6.283185482025146484375;
        float _2084 = cos(_2082);
        float _2086 = _2078 * _2080;
        float _2088 = _2074 * 6.283185482025146484375;
        float _2090 = sin(_2088);
        float _2092 = _2084 * _2086;
        float _2094 = 1.0 / _2092;
        float _2096 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2098 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2096;
        float _2100 = 1.0 / _2098;
        float _2102 = _2090 * _2094;
        float _2104 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2106 = fma(_2060, _2102, _2104);
        float _2108 = _2106 * _2100;
        float _2110 = precise::clamp(_2108, 0.0, 1.0);
        _2062 = _2074;
        _2004 = _2110;
    }
    float _2112 = _2062;
    float _2114 = _2004;
    float _2116 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2118 = _2050 + _2116;
    float _2120 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2122 = _2052 + _2120;
    float _2124 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2126 = _2054 + _2124;
    float _2128 = _2118 * _2118;
    float _2130 = fma(_2122, _2122, _2128);
    float _2132 = fma(_2126, _2126, _2130);
    float _2134 = rsqrt(_2132);
    float _2136 = _2134 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2138 = _2122 * _2136;
    float _2140 = _2126 * _2136;
    float _2142 = _2138 * _2138;
    float _2144 = _2140 * _2140;
    float _2146 = _2142 + _2144;
    float _2148 = sqrt(_2146);
    bool _2150 = _2148 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2152 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2154 = _2148 + _2152;
    float _2156 = _2134;
    float _2158 = _2154;
    float _2160 = _2118;
    if (_2150)
    {
        float _2162 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2156 = _2162;
    }
    float _2164 = _2156;
    float _2166 = _2164;
    if (_2150)
    {
        float _2168 = _2154 * _2164;
        _2158 = _2168;
    }
    float _2170 = _2158;
    if (_2150)
    {
        float _2172 = rsqrt(_2146);
        _2166 = _2172;
    }
    float _2174 = _2166;
    float _2176 = _2174;
    if (_2150)
    {
        float _2178 = _2170 * 0.15915493667125701904296875;
        _1500 = _2178;
    }
    float _2180 = _1500;
    float _2182 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2184 = _2126;
    float _2186 = _2180;
    if (_2150)
    {
        float _2188 = _2180 * 6.283185482025146484375;
        float _2190 = sin(_2188);
        _2184 = _2190;
    }
    float _2192 = _2184;
    float _2194 = precise::max(0.0, _2182);
    float _2196 = _2112;
    if (_2150)
    {
        float _2198 = _2180 * 6.283185482025146484375;
        float _2200 = cos(_2198);
        _2196 = _2200;
    }
    float _2202 = _2196;
    float _2204 = -_2136;
    float _2206 = -_2194;
    float _2208 = fma(_2118, _2204, _2206);
    float _2210 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_2150)
    {
        float _2212 = _2208 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2160 = _2212;
    }
    float _2214 = _2160;
    float _2216 = fma(_1416, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2218 = _2192;
    float _2220 = _2214;
    if (_2150)
    {
        float _2222 = fma(_2192, _2214, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2218 = _2222;
    }
    float _2224 = _2218;
    float _2226 = _2224;
    if (!_2150)
    {
        _2186 = _2138;
    }
    float _2228 = _2186;
    float _2230 = sqrt(_2132);
    float _2232 = _2228;
    if (_2150)
    {
        float _2234 = _2174 * _2224;
        _1406 = _2234;
    }
    float _2236 = _1406;
    if (!_2150)
    {
        _2176 = _2208;
    }
    float _2238 = _2176;
    float _2240 = _2238;
    float _2242 = _2202;
    if (_2150)
    {
        float _2244 = _2202 + (-1.0);
        _2220 = _2244;
    }
    float _2246 = _2220;
    float _2248 = _2246;
    if (_2150)
    {
        float _2250 = _2138 * _2236;
        _2232 = _2250;
    }
    float _2252 = _2232;
    if (!_2150)
    {
        _2226 = _2142;
    }
    float _2254 = _2226;
    float _2256 = _2254;
    if (_2150)
    {
        float _2258 = _2246 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2210 = _2258;
    }
    float _2260 = _2210;
    if (!_2150)
    {
        _2248 = _2140;
    }
    float _2262 = _2248;
    float _2264 = _2262;
    if (_2150)
    {
        float _2266 = _2140 * _2236;
        _2264 = _2266;
    }
    float _2268 = _2264;
    if (_2150)
    {
        float _2270 = _2252 * _2252;
        _2256 = _2270;
    }
    float _2272 = _2256;
    if (_2150)
    {
        float _2274 = fma(_2208, _2202, _2260);
        _2240 = _2274;
    }
    float _2276 = _2240;
    if (!_2150)
    {
        _2242 = _2144;
    }
    float _2278 = _2242;
    float _2280 = _2278;
    if (_2150)
    {
        float _2282 = _2268 * _2268;
        _2280 = _2282;
    }
    float _2284 = _2280;
    float _2286 = fma(_2276, _2276, _2272);
    float _2288 = _2050 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2290 = floor(_2216);
    float _2292 = _2286 + _2284;
    float _2294 = fma(_2052, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2288);
    float _2296 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2298 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2300 = fma(_2230, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2298);
    float _2302 = precise::clamp(_2300, 0.0, 1.0);
    float _2304 = fma(_2054, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2294);
    float _2306 = rsqrt(_2292);
    float _2308 = fma(_1424, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2310 = _2304 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2312 = -_2302;
    float _2314 = _2312 + 1.0;
    float _2316 = _2050 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2318 = _2310 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2320 = floor(_2308);
    float _2322 = _2050 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2324 = -_2318;
    float _2326 = fma(_2324, _2296, 1.0);
    float _2328 = _2050 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2330 = -_2290;
    float _2332 = _2216 + _2330;
    float _2334 = fma(_2052, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2322);
    float _2336 = _2306 * _2252;
    float _2338 = _2306 * _2276;
    float _2340 = _2306 * _2268;
    float _2342 = fma(_2052, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2328);
    float _2344 = fma(_2054, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2334);
    float _2346 = abs(_2314);
    float _2348 = log2(_2346);
    float _2350 = _2336 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2352 = fma(_2054, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2342);
    float _2354 = _2344 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2356 = fma(_2052, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2316);
    float _2358 = -_2350;
    float _2360 = fma(_2338, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2358);
    float _2362 = _2352 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2364 = _2354 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2366 = fma(_2054, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2356);
    float _2368 = log2(_2326);
    float _2370 = -_2340;
    float _2372 = fma(_2370, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2360);
    float _2374 = fma(_2362, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2364);
    float _2376 = _2354 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2378 = fma(_2372, -0.5, 0.5);
    float _2380 = fma(_2310, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2374);
    float _2382 = _2348 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2384 = fma(_2362, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2376);
    float _2386 = _2366 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2388 = fma(_2372, 0.5, 0.5);
    float _2390 = exp2(_2382);
    float _2392 = fma(_2310, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2384);
    float _2394 = fma(_2386, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2380);
    float _2396 = _2354 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2398 = fma(_2388, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2400 = fma(_2386, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2392);
    float _2402 = _2368 * 0.693147182464599609375;
    float _2404 = 1.0 / _2394;
    float _2406 = -_2320;
    float _2408 = _2308 + _2406;
    float _2410 = fma(_2362, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2396);
    float _2412 = _2338 + 1.0;
    float _2414 = fma(_2388, _2398, -0.212114393711090087890625);
    float _2416 = _2402 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2418 = fma(_2310, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2410);
    float _2420 = sqrt(_2378);
    float _2422 = -_2338;
    float _2424 = fma(_2390, _2412, _2422);
    float _2426 = fma(_2386, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2418);
    float2 _6619 = float2(_2332, _2408);
    float _2428 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6619, float2(0.0), isnan(_6619)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6619, float2(0.0), isnan(_6619)), level(0.0)).x;
    float _2430 = fma(_2388, _2414, 1.570728778839111328125);
    float _2432 = fma(_2424, 0.5, 0.5);
    float _2434 = _2400 * _2404;
    float _2436 = _2426 * _2404;
    float _2438 = fma(_2434, 0.5, 0.5);
    float _2440 = fma(_2436, -0.5, 0.5);
    float _2442 = _2420 * 0.636619746685028076171875;
    float _2444 = -_2430;
    float _2446 = fma(_2442, _2444, 1.0);
    float3 _6652 = float3(_2438, _2440, _2416);
    float _2448 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6652, float3(0.0), isnan(_6652)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6652, float3(0.0), isnan(_6652)), level(0.0)).x;
    float3 _6663 = float3(_2438, _2440, _2416);
    float4 _2451 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6663, float3(0.0), isnan(_6663)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6663, float3(0.0), isnan(_6663)), level(0.0)).xyzw;
    float _2453 = _2451.x;
    float _2455 = _2451.y;
    float _2457 = _2451.z;
    float _2459 = _2451.w;
    float2 _6679 = float2(_2446, _2432);
    float3 _2461 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6679, float2(0.0), isnan(_6679)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6679, float2(0.0), isnan(_6679)), level(0.0)).xyz;
    float _2463 = _2461.x;
    float _2465 = _2461.y;
    float _2467 = _2461.z;
    float _2469 = abs(_2060);
    float _2471 = log2(_2469);
    float _2473 = _2354 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2475 = _2348 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2477 = _2230 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2479 = isnan(_2230);
    bool _2481 = _2477 || _2479;
    bool _2483 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2485 = _2481 || _2483;
    float _2487 = fma(_2362, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2473);
    bool _2489 = _2060 <= 8000.0;
    bool _2491 = isnan(_2060);
    bool _2493 = _2489 || _2491;
    bool _2495 = isnan(8000.0);
    bool _2497 = _2493 || _2495;
    float _2499 = float(_2497);
    float _2501 = exp2(_2475);
    float _2503 = fma(_2310, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2487);
    float _2505 = in.m_80.x;
    float _2507 = _2471 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2509 = fma(_2386, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2503);
    float _2511 = _2394 * 0.5;
    float _2513 = exp2(_2507);
    float _2515 = fma(_2426, -0.5, _2511);
    out.gl_Position.x = _2400;
    out.gl_Position.y = _2426;
    out.gl_Position.z = _2509;
    out.gl_Position.w = _2394;
    float _2517 = -_2501;
    float _2519 = _2517 + 1.0;
    float _2521 = _2519 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2523 = fma(_2513, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2525 = precise::clamp(_2523, 0.0, 1.0);
    float _2527 = _2509 + _2394;
    float _2529 = _2509;
    float _2531 = _2426;
    float _2533 = _2394;
    float _2535 = _2521;
    if (!_2485)
    {
        _2529 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2537 = _2529;
    float _2539 = fma(_2525, -2.0, 3.0);
    float _2541 = _2525 * _2525;
    float _2543 = _2527 * 0.5;
    float _2545 = _2537;
    float _2547 = _2537;
    if (!_2485)
    {
        _2531 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2549 = _2531;
    float _2551 = _2541 * _2539;
    float _2553 = -_2551;
    float _2555 = _2553 + 1.0;
    float _2557 = fma(_2555, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2551);
    float _2559 = _2400 + _2394;
    float _2561 = -_2521;
    float _2563 = _2561 + 1.0;
    float _2565 = _2499 * _2557;
    float _2567 = _2559 * 0.5;
    float _2569 = _2563;
    float _2571 = _2549;
    float _2573 = _2549;
    if (!_2485)
    {
        _2533 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2575 = _2533;
    float _2577 = _2565 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_82.x = _2567;
    out.m_82.y = _2515;
    out.m_82.z = _2543;
    out.m_82.w = _2394;
    float _2579 = -_2428;
    float _2581 = _2579 + 1.0;
    float _2583 = _2581 * _2577;
    float _2585 = precise::clamp(_2583, 0.0, 1.0);
    float _2587 = -_2585;
    float _2589 = fma(_2587, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2591 = _2589 * _2505;
    float _2593 = _2521 * _2448;
    float _2595 = _2459 * _2563;
    float _2597 = _2591;
    float _2599 = _2575;
    float _2601 = _2575;
    if (!_2485)
    {
        _2535 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2603 = _2535;
    float _2605 = _2459 * _2593;
    float _2607 = _2467 * _2593;
    float _2609 = _2603;
    float _2611 = _2603;
    if (!_2485)
    {
        _2569 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2613 = _2569;
    float _2615 = fma(_2463, _2605, _2453);
    float _2617 = fma(_2465, _2605, _2455);
    float _2619 = _2591 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2621 = fma(_2459, _2607, _2457);
    float _2623 = _2114 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2625 = _2613;
    float _2627 = _2613;
    if (!_2485)
    {
        _2597 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2629 = _2597;
    out.m_84.x = _2619;
    out.m_86.x = _2615;
    out.m_86.y = _2617;
    out.m_86.z = _2621;
    out.m_86.w = _2595;
    bool _2631 = !_2485;
    float _2633 = _2629;
    float _2635 = _2629;
    if (!_2631)
    {
        bool _2637 = _2230 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2639 = isnan(_2230);
        bool _2641 = _2637 || _2639;
        bool _2643 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2645 = _2641 || _2643;
        if (!_2645)
        {
            float _2647 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2649 = _2230 + _2647;
            float _2651 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2653 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2651;
            float _2655 = 1.0 / _2653;
            float _2657 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2659 = _2657 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2661 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2663 = _2661 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2665 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2667 = _2665 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2669 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2671 = _2669 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2673 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2675 = _2673 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2677 = _2649 * _2655;
            float _2679 = precise::clamp(_2677, 0.0, 1.0);
            float _2681 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2683 = _2681 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2685 = fma(_2679, _2659, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2687 = fma(_2679, _2683, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2689 = fma(_2679, _2663, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2691 = fma(_2679, _2667, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2693 = fma(_2679, _2671, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2695 = fma(_2679, _2675, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2635 = _2687;
            _2573 = _2693;
            _2611 = _2685;
            _2547 = _2691;
            _2601 = _2689;
            _2627 = _2695;
            _2697 = true;
        }
        else
        {
            bool _2699 = _2230 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2701 = isnan(_2230);
            bool _2703 = _2699 || _2701;
            bool _2705 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2707 = _2703 || _2705;
            if (!_2707)
            {
                _2609 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2709 = _2609;
            _2611 = _2709;
            if (!_2707)
            {
                _2633 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2711 = _2633;
            _2635 = _2711;
            if (!_2707)
            {
                _2599 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2713 = _2599;
            _2601 = _2713;
            if (!_2707)
            {
                _2545 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2715 = _2545;
            _2547 = _2715;
            if (!_2707)
            {
                _2571 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2717 = _2571;
            _2573 = _2717;
            if (!_2707)
            {
                _2625 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2719 = _2625;
            bool _2721 = !_2707;
            _2627 = _2719;
            if (!_2721)
            {
                bool _2723 = _2230 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2725 = isnan(_2230);
                bool _2727 = _2723 || _2725;
                bool _2729 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2731 = _2727 || _2729;
                if (!_2731)
                {
                    float _2733 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2735 = _2230 + _2733;
                    float _2737 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2739 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2737;
                    float _2741 = 1.0 / _2739;
                    float _2743 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2745 = _2743 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2747 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2749 = _2747 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2751 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2753 = _2751 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2755 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2757 = _2755 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2759 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2761 = _2759 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2763 = _2735 * _2741;
                    float _2765 = precise::clamp(_2763, 0.0, 1.0);
                    float _2767 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2769 = _2767 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2771 = fma(_2765, _2745, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2773 = fma(_2765, _2769, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2775 = fma(_2765, _2749, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2777 = fma(_2765, _2753, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2779 = fma(_2765, _2757, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2781 = fma(_2765, _2761, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2635 = _2773;
                    _2573 = _2779;
                    _2611 = _2771;
                    _2547 = _2777;
                    _2601 = _2775;
                    _2627 = _2781;
                    _2697 = true;
                }
                else
                {
                    _2635 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2573 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2611 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2547 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2601 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2627 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2697 = false;
    float _2783 = _2635;
    float _2785 = _2573;
    float _2787 = _2611;
    float _2789 = _2547;
    float _2791 = _2601;
    float _2793 = _2627;
    float _2795 = fma(_1832, -0.5, 0.5);
    float _2797 = precise::clamp(_2795, 0.0, 1.0);
    float _2799 = -_2783;
    float _2801 = _2799 + _2785;
    float _2803 = _2623 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2805 = -_2787;
    float _2807 = _2805 + _2789;
    float _2809 = fma(_2797, _2801, _2783);
    out.m_88.x = 0.0;
    float _2811 = -_2791;
    float _2813 = _2811 + _2793;
    float _2815 = fma(_2797, _2807, _2787);
    float _2817 = _2809 * 0.586610972881317138671875;
    out.m_57.x = _2803;
    bool _2819 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2821 = fma(_2797, _2813, _2791);
    float _2823 = fma(_2815, 0.298911988735198974609375, _2817);
    bool _2825 = _2114 > 0.0;
    bool _2827 = isnan(_2114);
    bool _2829 = _2825 || _2827;
    bool _2831 = isnan(0.0);
    bool _2833 = _2829 || _2831;
    float _2835 = fma(_2821, 0.114477999508380889892578125, _2823);
    float _2837 = -_2835;
    float _2839 = _2815 + _2837;
    float _2841 = -_2835;
    float _2843 = _2809 + _2841;
    float _2845 = -_2835;
    float _2847 = _2821 + _2845;
    float _2849 = fma(_2839, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2835);
    float _2851 = fma(_2843, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2835);
    float _2853 = fma(_2847, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2835);
    bool _2855 = !_2819;
    if (!_2855)
    {
        float _2857 = -_2050;
        float _2859 = _2857 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2861 = -_2052;
        float _2863 = _2861 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2865 = -_2054;
        float _2867 = _2865 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2869 = _2859 * _2859;
        float _2871 = fma(_2863, _2863, _2869);
        float _2873 = fma(_2867, _2867, _2871);
        float _2875 = sqrt(_2873);
        float _2877 = rsqrt(_2873);
        float _2879 = -_2875;
        float _2881 = _2879 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2883 = _2881 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2885 = precise::clamp(_2883, 0.0, 1.0);
        float _2887 = _2863 * _2877;
        float _2889 = _2859 * _2877;
        float _2891 = abs(_2885);
        float _2893 = log2(_2891);
        float _2895 = _2867 * _2877;
        float _2897 = _2887 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2899 = _1832 * _2889;
        float _2901 = -_2889;
        float _2903 = -_2897;
        float _2905 = fma(_2901, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2903);
        float _2907 = fma(_1830, _2887, _2899);
        float _2909 = -_2895;
        float _2911 = fma(_2909, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2905);
        float _2913 = fma(_1834, _2895, _2907);
        float _2915 = precise::clamp(_2913, 0.0, 1.0);
        float _2917 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2919 = _2911 + _2917;
        float _2921 = _2893 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2923 = _2919 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2925 = precise::clamp(_2923, 0.0, 1.0);
        float _2927 = exp2(_2921);
        float _2929 = _2927 * _2925;
        float _2931 = _2915 * _2929;
        float _2933 = _2931 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2935 = _2931 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2937 = _2931 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_88.x = _2933;
        out.m_88.y = _2935;
        out.m_88.z = _2937;
    }
    out.m_90.x = _2849;
    out.m_90.y = _2851;
    out.m_90.z = _2853;
    if (_2833)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.dm_pad3.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.dm_pad3.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.dm_pad3.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.dm_pad3.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_57.x = 0.0;
    float _2939 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2939;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.dm_pad3.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.dm_pad3.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.dm_pad3.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.dm_pad3.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}


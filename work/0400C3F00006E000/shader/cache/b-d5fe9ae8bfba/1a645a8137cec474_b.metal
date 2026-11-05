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
    constant _16* vp_c12 [[id(3)]];
    constant _16* vp_c15 [[id(4)]];
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
    float4 m_76 [[user(locn0)]];
    float4 m_70 [[user(locn1)]];
    float4 m_55 [[user(locn2)]];
    float4 m_92 [[user(locn3)]];
    float4 m_53 [[user(locn4)]];
    float4 m_72 [[user(locn5)]];
    float4 m_82 [[user(locn6)]];
    float4 m_78 [[user(locn7)]];
    float4 m_84 [[user(locn8)]];
    float4 m_90 [[user(locn9)]];
    float4 m_86 [[user(locn10)]];
    float4 m_88 [[user(locn11)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_80 [[attribute(0)]];
    float4 m_68 [[attribute(1)]];
    float4 m_62 [[attribute(2)]];
    float4 m_66 [[attribute(3)]];
    float4 m_74 [[attribute(4)]];
    float4 m_48 [[attribute(5)]];
    float4 m_50 [[attribute(6)]];
    float4 m_60 [[attribute(7)]];
    float4 m_64 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3005 = false;
    bool _1558 = false;
    bool _1554 = false;
    bool _209 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _106 = in.m_48.w;
    float _108 = in.m_50.w;
    float _110 = trunc(_106);
    int _113 = int(_110);
    float _115 = -_108;
    float _117 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.y = _117;
    bool _121 = _113 >= 1;
    float _123 = 0.0;
    float _125 = _108;
    float _127 = _117;
    if (!_121)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _129 = _123;
    if (!_121)
    {
        out.m_55.x = 0.0;
    }
    int _131 = 0;
    if (!_121)
    {
        float _133 = _129 * 5.0;
        _131 = as_type<int>(_133);
    }
    int _135 = _131;
    int _137 = _135;
    if (!_121)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3321 = as_type<float>(_135);
        out.gl_Position.z = _3321;
    }
    if (!_121)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _139 = _108 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _141 = isnan(_108);
    bool _143 = _139 || _141;
    bool _145 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _147 = _143 || _145;
    float _149 = float(_113);
    bool _151 = _117 >= _149;
    bool _153 = !_147;
    bool _155 = _151 || _153;
    if (_155)
    {
        _125 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _157 = _125;
    if (_155)
    {
        out.m_55.x = 0.0;
    }
    if (_155)
    {
        float _159 = _157 * 5.0;
        _137 = as_type<int>(_159);
    }
    int _161 = _137;
    if (_155)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3376 = as_type<float>(_161);
        out.gl_Position.z = _3376;
    }
    if (_155)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _163 = as_type<float>(int(gl_VertexIndex));
    float _165 = 1.0 / _149;
    bool _167 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _169 = _117 * _165;
    int _171 = as_type<int>(_163) & 1;
    bool _173 = _171 != 0;
    int _175 = as_type<int>(_163) & 2;
    bool _177 = _175 != 0;
    bool _179 = !_173;
    float _181 = _179 ? (-0.5) : 0.5;
    bool _183 = !_177;
    float _185 = _183 ? (-0.5) : 0.5;
    bool _187 = !_167;
    float _189 = _169;
    float _207;
    if (!_187)
    {
        float _191 = in.m_60.x;
        float _193 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _195 = _191 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _197 = fma(_195, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _199 = _197 * _193;
        float _201 = floor(_199);
        float _203 = -_201;
        float _205 = _199 + _203;
        _207 = _205;
        _209 = true;
    }
    else
    {
        _207 = _169;
    }
    _209 = false;
    float _211 = _207;
    float _213 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _215 = _211 + _213;
    bool _217 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _219 = isnan(_211);
    bool _221 = _217 || _219;
    bool _223 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _225 = _221 || _223;
    float _227 = float(_225);
    float _229 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _231 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _229;
    float _233 = -_227;
    float _235 = _233 + 1.0;
    bool _237 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _239 = isnan(_211);
    bool _241 = _237 || _239;
    bool _243 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _245 = _241 || _243;
    float _247 = float(_245);
    float _249 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _251 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _249;
    bool _253 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _255 = 1.0 / _231;
    float _257 = _247 * _235;
    float _259 = -_247;
    float _261 = _259 + 1.0;
    float _263 = _215 * _255;
    float _265 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _267 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _265;
    float _269 = fma(_251, _263, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _271 = fma(_267, _263, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _273 = _269 * _257;
    float _275 = _271 * _257;
    float _277 = fma(_261, (*spvDescriptorSet0.vp_c9)._m0[143].x, _273);
    float _279 = fma(_261, (*spvDescriptorSet0.vp_c9)._m0[143].y, _275);
    float _281 = fma(_227, (*spvDescriptorSet0.vp_c9)._m0[144].x, _277);
    float _283 = fma(_227, (*spvDescriptorSet0.vp_c9)._m0[144].y, _279);
    bool _285 = !_253;
    if (!_285)
    {
        float _287 = in.m_60.x;
        float _289 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _291 = _287 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _293 = fma(_291, (*spvDescriptorSet0.vp_c9)._m0[11].y, _117);
        float _295 = _293 * _289;
        float _297 = floor(_295);
        float _299 = -_297;
        float _301 = _295 + _299;
        _189 = _301;
    }
    float _303 = _189;
    float _305 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _307 = int(_305);
    float _309 = in.m_48.x;
    float _311 = in.m_48.y;
    float _313 = in.m_48.z;
    float _315 = in.m_62.x;
    float _317 = in.m_62.y;
    float _319 = in.m_62.z;
    float _321 = in.m_62.w;
    int _323 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _325 = _323 != 0;
    float _327 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _329 = int(_327);
    float _331 = in.m_64.x;
    float _333 = in.m_64.y;
    int _335 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _337 = _335 != 0;
    int _339 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _341 = _339 != 0;
    int _343 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _345 = _343 != 0;
    float _347 = in.m_66.x;
    float _349 = in.m_66.y;
    float _351 = in.m_66.z;
    float _353 = in.m_66.w;
    float _355 = float(_307);
    float _357 = in.m_60.x;
    float _359 = in.m_60.y;
    bool _361 = !_341;
    int _363 = _361 ? 0 : 1;
    int _365 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _367 = _365 != 0;
    float _369 = in.m_68.x;
    float _371 = in.m_68.y;
    float _373 = in.m_68.z;
    float _375 = in.m_68.w;
    float _377 = 1.0 / _355;
    int _379 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _381 = _379 != 0;
    float _383 = float(uint(_329));
    int _385 = ~_329;
    int _387 = _385 + 1;
    int _389 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _391 = _389 != 0;
    float _393 = 1.0 / _383;
    float _395 = _283 * _333;
    float _397 = _311 * _349;
    float _399 = _377 * _117;
    float _401 = _311 * _317;
    float _403 = _281 * _331;
    float _405 = fma(_309, _347, _397);
    float _407 = fma(_309, _315, _401);
    float _409 = trunc(_399);
    int _411 = int(_409);
    float _413 = _311 * _371;
    int _415 = as_type<int>(_393) + (-2);
    float _417 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _419 = fma(_309, _369, _413);
    float _421 = in.m_60.z;
    float _423 = fma(_313, _373, _419);
    float _425 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _427 = _425 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _429 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _431 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _433 = _431 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _435 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _437 = float(uint(_411));
    float _439 = 1.0 / _427;
    int _441 = ~_329;
    int _443 = _441 + 1;
    float _445 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _447 = as_type<float>(_415) * _437;
    float _449 = _359 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _451 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _453 = _435 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _455 = 1.0 / _433;
    float _457 = fma(_449, -2.0, _429);
    float _459 = _357 * 2.0;
    float _461 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _463 = _417 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _465 = _445 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _467 = -_451;
    float _469 = fma(_459, (*spvDescriptorSet0.vp_c9)._m0[77].x, _467);
    float _471 = trunc(_447);
    float _473 = precise::max(_471, 0.0);
    uint _476 = uint(_473);
    float _478 = fma(_313, _319, _407);
    out.m_70.x = _453;
    out.m_70.y = _463;
    out.m_70.z = _465;
    out.m_70.w = _461;
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _482 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _480;
    float _484 = float(_329);
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _488 = _486 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _490 = _403 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _492 = _478 + _321;
    float _494 = floor(_459);
    float _496 = _488 * _439;
    float _498 = _482 * _455;
    float _500 = _421 * 2.0;
    float _502 = _423 + _375;
    int _504 = _329 + (-1);
    float _506 = -_117;
    float _508 = fma(_506, (*spvDescriptorSet0.vp_c9)._m0[76].x, _469);
    int _510 = _443 * int(_476);
    int _512 = _510 + _411;
    float _514 = fma(_313, _351, _405);
    float _516 = _484 * _117;
    bool _518 = !_345;
    int _520 = _518 ? 0 : 1;
    float _522 = floor(_500);
    float _524 = float(uint(_512));
    float _526 = _516 * _165;
    bool _528 = !_337;
    int _530 = _528 ? 0 : 1;
    float _532 = _514 + _353;
    bool _534 = _494 > 0.0;
    float _536 = as_type<float>(_415) * _524;
    float _538 = _359 + _357;
    bool _540 = _494 >= 0.0;
    bool _542 = isnan(_494);
    bool _544 = _540 || _542;
    bool _546 = isnan(0.0);
    bool _548 = _544 || _546;
    float _550 = trunc(_526);
    int _552 = int(_550);
    float _554 = _538 + (-1.0);
    int _556 = _548 ? 0 : 1;
    float _558 = _492 + (*spvDescriptorSet0.vp_c12)._m0[0].y;
    int _560 = abs(_520);
    float _562 = fma(_554, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _564 = _359 + _421;
    float _566 = trunc(_536);
    float _568 = precise::max(_566, 0.0);
    uint _570 = uint(_568);
    float _572 = _359 * 2.0;
    float _574 = _564 + (-1.0);
    bool _576 = !_325;
    float _578 = _576 ? 7.345489978790283203125 : 1.0;
    float _580 = _502 + (*spvDescriptorSet0.vp_c12)._m0[0].x;
    int _582 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _584 = _582 != 0;
    float _586 = fma(_574, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _588 = floor(_572);
    float _590 = _578 * _357;
    bool _592 = !_367;
    int _594 = _592 ? 0 : 1;
    float _596 = _421 + _357;
    bool _598 = _359 > 0.5;
    float _600 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _602 = _532 + (*spvDescriptorSet0.vp_c12)._m0[0].z;
    float _604 = _421 + (-0.5);
    int _606 = int(_476) + int(_570);
    float _608 = floor(_590);
    bool _610 = !_584;
    int _612 = _610 ? 0 : 1;
    float _614 = fma(_359, (*spvDescriptorSet0.vp_c9)._m0[78].w, _600);
    bool _616 = _357 > 0.5;
    int _618 = _387 * _606;
    int _620 = _618 + _411;
    float _622 = _359 + (-0.5);
    float _624 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].w, _614);
    float _626 = -_181;
    int _628 = _616 ? as_type<int>(_626) : as_type<int>(_181);
    bool _630 = _588 >= 0.0;
    bool _632 = isnan(_588);
    bool _634 = _630 || _632;
    bool _636 = isnan(0.0);
    bool _638 = _634 || _636;
    float _640 = -_624;
    float _642 = _640 + 1.0;
    bool _644 = !_381;
    float _646 = _644 ? _181 : as_type<float>(_628);
    float _648 = -_185;
    int _650 = _598 ? as_type<int>(_648) : as_type<int>(_185);
    bool _652 = uint(_620) >= uint(_329);
    float _654 = -_608;
    float _656 = _590 + _654;
    bool _658 = _588 > 0.0;
    float _660 = _596 + (-1.0);
    bool _662 = !_652;
    int _664 = _662 ? 0 : (-1);
    float _666 = _656 * _484;
    int _668 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _670 = _668 != 0;
    int _672 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _674 = _672 != 0;
    int _676 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _678 = _676 != 0;
    float _680 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _181);
    float _682 = float(_411);
    float _684 = fma(_660, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _686 = ~_556;
    int _688 = _686 + 1;
    int _690 = _688 + 1;
    float _692 = _490 * _680;
    bool _694 = _682 >= _484;
    bool _696 = isnan(_682);
    bool _698 = _694 || _696;
    bool _700 = isnan(_484);
    bool _702 = _698 || _700;
    float _704 = float(_702);
    float _706 = _395 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _708 = _690;
    float _710 = _692;
    if (!_534)
    {
        int _712 = ~_556;
        int _714 = _712 + 1;
        _708 = _714;
    }
    int _716 = _708;
    float _718 = trunc(_666);
    int _720 = int(_718);
    int _722 = _638 ? 0 : 1;
    float _724 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _726 = _303 + _724;
    int _728 = ~_606;
    int _730 = _728 + _664;
    int _732 = _730 + 1;
    float _734 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _185);
    int _736 = ~_722;
    int _738 = _736 + 1;
    int _740 = _738 + 1;
    float _742 = _181 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _744 = _740;
    if (!_658)
    {
        int _746 = ~_722;
        int _748 = _746 + 1;
        _744 = _748;
    }
    int _750 = _744;
    float _752 = trunc(_704);
    int _754 = int(_752);
    bool _756 = _329 == 0;
    float _758 = _706 * _734;
    int _760 = abs(_594);
    int _762 = abs(_530);
    bool _764 = !_391;
    float _766 = _764 ? _185 : as_type<float>(_650);
    float _768 = _185 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _770 = fma(_496, _726, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    int _772 = _329 * _732;
    int _774 = _772 + _411;
    bool _776 = _522 > 0.0;
    int _778 = _720 * _760;
    int _780 = _778 + _411;
    int _782 = abs(_363);
    bool _784 = !_756;
    int _786 = _784 ? _774 : (-1);
    int _788 = ~_754;
    int _790 = _788 + 1;
    int _792 = _790 + 1;
    bool _794 = _303 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _796 = isnan(_303);
    bool _798 = _794 || _796;
    bool _800 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _802 = _798 || _800;
    float _804 = float(_802);
    bool _806 = _522 >= 0.0;
    bool _808 = isnan(_522);
    bool _810 = _806 || _808;
    bool _812 = isnan(0.0);
    bool _814 = _810 || _812;
    int _816 = _786 * _792;
    float _818 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _820 = _303 + _818;
    float _822 = -_804;
    float _824 = _822 + 1.0;
    float _826 = float(_716);
    int _828 = _754 * _504;
    int _830 = _828 + _816;
    bool _832 = _303 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _834 = isnan(_303);
    bool _836 = _832 || _834;
    bool _838 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _840 = _836 || _838;
    float _842 = float(_840);
    float _844 = fma(_498, _820, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _846 = _303 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _848 = isnan(_303);
    bool _850 = _846 || _848;
    bool _852 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _854 = _850 || _852;
    float _856 = float(_854);
    int _858 = _830 * _782;
    float _860 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _862 = log2(_860);
    float _864 = _842 * _824;
    float _866 = -_842;
    float _868 = _866 + 1.0;
    int _870 = abs(_612);
    int _872 = _552 * _762;
    int _874 = _872 + _858;
    float _876 = _856 * _868;
    float _878 = _646 + 0.5;
    float _880 = -_856;
    float _882 = _880 + 1.0;
    int _884 = _780 * _560;
    int _886 = _884 + _874;
    float _888 = _844 * _876;
    float _890 = fma(_878, (*spvDescriptorSet0.vp_c9)._m0[80].x, _508);
    float _892 = _766 + (-0.5);
    int _894 = _720 * _870;
    int _896 = _894 + _886;
    float _898 = fma(_882, (*spvDescriptorSet0.vp_c9)._m0[115].x, _888);
    int _900 = ~_329;
    int _902 = _900 + 1;
    float _904 = _862 * _117;
    float _906 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _908 = fma(_770, _864, _898);
    int _910 = _814 ? 0 : 1;
    float _912 = fma(_357, (*spvDescriptorSet0.vp_c9)._m0[78].z, _906);
    float _914 = float(uint(_896));
    float _916 = exp2(_904);
    float _918 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _920 = 1.0 + _918;
    bool _922 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _924 = isnan(0.0);
    bool _926 = _922 || _924;
    bool _928 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _930 = _926 || _928;
    float _932 = fma(_804, (*spvDescriptorSet0.vp_c9)._m0[117].x, _908);
    float _934 = as_type<float>(_415) * _914;
    float _936 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].z, _912);
    float _938 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[76].y, _457);
    float _940 = float(_750);
    float _942 = trunc(_934);
    float _944 = precise::max(_942, 0.0);
    uint _946 = uint(_944);
    float _948 = -_936;
    float _950 = _948 + 1.0;
    float _952 = -_892;
    float _954 = -_938;
    float _956 = fma(_952, (*spvDescriptorSet0.vp_c9)._m0[80].y, _954);
    float _958 = _357 + (-0.5);
    float _960 = -_950;
    float _962 = fma(_646, _960, _890);
    float _964 = fma(_766, _642, _956);
    float _966 = -_916;
    float _968 = _966 + 1.0;
    bool _970 = !_674;
    int _972 = _970 ? 0 : 1;
    float _974 = 1.0 / _920;
    int _976 = ~_910;
    int _978 = _976 + 1;
    int _980 = _978 + 1;
    out.m_72.x = _962;
    out.m_72.y = _964;
    int _982 = abs(_972);
    int _984 = _980;
    float _986 = _758;
    if (!_776)
    {
        int _988 = ~_910;
        int _990 = _988 + 1;
        _984 = _990;
    }
    int _992 = _984;
    int _994 = _902 * int(_946);
    int _996 = _994 + _896;
    bool _998 = !_670;
    int _1000 = _998 ? 0 : 1;
    float _1002 = float(_982);
    float _1004 = float(uint(_996));
    float _1006 = _558 * (*spvDescriptorSet0.vp_c12)._m0[7].y;
    int _1008 = abs(_1000);
    float _1010 = _1002 * _826;
    float _1012 = _930 ? _968 : 0.0;
    float _1014 = as_type<float>(_415) * _1004;
    bool _1016 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1018 = isnan(1.0);
    bool _1020 = _1016 || _1018;
    bool _1022 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1024 = _1020 || _1022;
    float _1026 = fma(_580, (*spvDescriptorSet0.vp_c12)._m0[6].y, _1006);
    float _1028 = float(_1008);
    bool _1030 = !_678;
    int _1032 = _1030 ? 0 : 1;
    float _1034 = trunc(_1014);
    float _1036 = precise::max(_1034, 0.0);
    uint _1038 = uint(_1036);
    float _1040 = float(_992);
    int _1042 = ~_329;
    int _1044 = _1042 + 1;
    int _1046 = abs(_1032);
    float _1048 = _558 * (*spvDescriptorSet0.vp_c12)._m0[7].x;
    float _1050 = _1028 * _1040;
    float _1052 = _558 * (*spvDescriptorSet0.vp_c12)._m0[7].z;
    if (_1024)
    {
        float _1054 = _1012 * _974;
        _127 = _1054;
    }
    float _1056 = _127;
    float _1058 = fma(_580, (*spvDescriptorSet0.vp_c12)._m0[6].x, _1048);
    float _1060 = fma(_602, (*spvDescriptorSet0.vp_c12)._m0[8].y, _1026);
    float _1062 = fma(_580, (*spvDescriptorSet0.vp_c12)._m0[6].z, _1052);
    float _1064 = fma(_602, (*spvDescriptorSet0.vp_c12)._m0[8].x, _1058);
    float _1066 = fma(_602, (*spvDescriptorSet0.vp_c12)._m0[8].z, _1062);
    int _1068 = int(_946) + int(_1038);
    float _1070 = _1064 + (*spvDescriptorSet0.vp_c12)._m0[9].x;
    float _1072 = in.m_74.x;
    float _1074 = in.m_74.y;
    float _1076 = in.m_74.z;
    float _1078 = float(_1046);
    float _1080 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].x;
    int _1082 = _1044 * _1068;
    int _1084 = _1082 + _896;
    float _1086 = _1060 + (*spvDescriptorSet0.vp_c12)._m0[9].y;
    float _1088 = _1078 * _940;
    float _1090 = _1066 + (*spvDescriptorSet0.vp_c12)._m0[9].z;
    bool _1092 = uint(_1084) >= uint(_329);
    float _1094 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1096 = float(uint(_780));
    float _1098 = _932 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _1100 = !_1092;
    int _1102 = _1100 ? 0 : (-1);
    float _1104 = _1050 * (-2.0);
    float _1106 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1108 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _1110 = ~_1068;
    int _1112 = _1110 + _1102;
    int _1114 = _1112 + 1;
    float _1116 = as_type<float>(_415) * _1096;
    float _1118 = fma(_562, _1104, _562);
    float _1120 = _1106 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1122 = _1094 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1124 = _329 * _1114;
    int _1126 = _1124 + _896;
    float _1128 = _1108 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1130 = fma(_1104, _1072, _1072);
    float _1132 = _1010 * (-2.0);
    float _1134 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].y;
    bool _1136 = !_756;
    int _1138 = _1136 ? _1126 : (-1);
    out.m_76.x = _1120;
    out.m_76.y = _1122;
    out.m_76.z = _1128;
    out.m_76.w = _1098;
    float _1140 = fma(_586, _1132, _586);
    float _1142 = fma(_958, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1130);
    int _1144 = _1138 >> 31;
    int _1146 = _1138 & 3;
    bool _1148 = _1146 != 0;
    float _1150 = trunc(_1116);
    float _1152 = precise::max(_1150, 0.0);
    uint _1154 = uint(_1152);
    float _1156 = fma(_1118, _1056, _1142);
    int _1158 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1160 = _1158 != 0;
    float _1162 = fma(_1132, _1074, _1074);
    int _1164 = _1144 & 3;
    float _1166 = _1070 * _1080;
    int _1168 = ~_329;
    int _1170 = _1168 + 1;
    float _1172 = fma(_622, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1162);
    int _1174 = _1138 + _1164;
    float _1176 = fma(_1166, 0.5, 0.5);
    float _1178 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].z;
    int _1180 = _1170 * int(_1154);
    int _1182 = _1180 + _780;
    int _1184 = _1174 >> 2;
    float _1186 = _1088 * (-2.0);
    float _1188 = fma(_1140, _1056, _1172);
    float _1190 = _1086 * _1134;
    int _1192 = _1184 << 4;
    int _1194 = _1192 + 368;
    float _1196 = fma(_684, _1186, _684);
    float _1198 = float(uint(_1182));
    float _1200 = fma(_1186, _1076, _1076);
    uint _1202 = uint(int(uint(_1194) >> uint(2)));
    uint _1204 = uint(int(uint(int(_1202)) >> uint(2)));
    int _1206 = int(_1202) & 3;
    float _1208 = (*spvDescriptorSet0.vp_c9)._m0[int(_1204)][_1206];
    int _1210 = int(_1202) + 1;
    uint _1212 = uint(int(uint(_1210) >> uint(2)));
    int _1214 = _1210 & 3;
    float _1216 = (*spvDescriptorSet0.vp_c9)._m0[int(_1212)][_1214];
    float _1218 = fma(_1190, 0.5, 0.5);
    float _1220 = _1188 * 0.15915493667125701904296875;
    float _1222 = fma(_604, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1200);
    float _1224 = as_type<float>(_415) * _1198;
    int _1226 = _1138 & 3;
    bool _1228 = _1226 != 0;
    float _1230 = _1090 * _1178;
    int _1232 = _1148 ? 0 : 1;
    int _1234 = _1194 + 8;
    uint _1236 = uint(int(uint(_1234) >> uint(2)));
    uint _1238 = uint(int(uint(int(_1236)) >> uint(2)));
    int _1240 = int(_1236) & 3;
    float _1242 = (*spvDescriptorSet0.vp_c9)._m0[int(_1238)][_1240];
    int _1244 = int(_1236) + 1;
    uint _1246 = uint(int(uint(_1244) >> uint(2)));
    int _1248 = _1244 & 3;
    float _1250 = (*spvDescriptorSet0.vp_c9)._m0[int(_1246)][_1248];
    bool _1252 = uint(_1226) > 1u;
    float _1254 = trunc(_1224);
    float _1256 = precise::max(_1254, 0.0);
    uint _1258 = uint(_1256);
    bool _1260 = _1226 != 3;
    float _1262 = fma(_1196, _1056, _1222);
    int _1264 = ~_1232;
    int _1266 = _1264 + 1;
    int _1268 = _1266 + 1;
    float _1270 = _1156 * 0.15915493667125701904296875;
    bool _1272 = uint(_1226) >= 2u;
    float _1274 = fma(_1230, 0.5, 0.5);
    int _1276 = ~_329;
    int _1278 = _1276 + 1;
    float _1280 = floor(_1218);
    int _1282 = _1272 ? 0 : 1;
    float _1284 = _1262 * 0.15915493667125701904296875;
    int _1286 = _1268;
    if (!_1252)
    {
        int _1288 = ~_1232;
        int _1290 = _1288 + 1;
        _1286 = _1290;
    }
    int _1292 = _1286;
    bool _1294 = _1226 != 3;
    int _1296 = abs(_1292);
    float _1298 = floor(_1176);
    int _1300 = int(_1154) + int(_1258);
    bool _1302 = !_1228;
    int _1304 = _1302 ? 0 : 1;
    int _1306 = ~_1296;
    int _1308 = _1306 + 1;
    int _1310 = _1308 + 1;
    int _1312 = _1278 * _1300;
    int _1314 = _1312 + _780;
    int _1316 = ~_1282;
    int _1318 = _1316 + 1;
    int _1320 = _1318 + 1;
    float _1322 = _1270 * 6.283185482025146484375;
    float _1324 = sin(_1322);
    int _1326 = _1320;
    if (_1260)
    {
        int _1328 = ~_1282;
        int _1330 = _1328 + 1;
        _1326 = _1330;
    }
    int _1332 = _1326;
    float _1334 = -_1280;
    float _1336 = _1218 + _1334;
    int _1338 = abs(_1304);
    int _1340 = abs(_1332);
    int _1342 = ~_1338;
    int _1344 = _1342 + 1;
    int _1346 = _1344 + 1;
    float _1348 = _1270 * 6.283185482025146484375;
    float _1350 = cos(_1348);
    bool _1352 = uint(_1314) >= uint(_329);
    float _1354 = -_1298;
    float _1356 = _1176 + _1354;
    int _1358 = _1310 * as_type<int>(_1216);
    bool _1360 = !_1294;
    int _1362 = _1360 ? 0 : (-1);
    float _1364 = floor(_1274);
    int _1366 = _1346 * as_type<int>(_1208);
    int _1368 = _1366 + _1358;
    int _1370 = abs(_1362);
    bool _1372 = !_1160;
    int _1374 = _1372 ? 0 : 1;
    int _1376 = ~_1340;
    int _1378 = _1376 + 1;
    int _1380 = _1378 + 1;
    float _1382 = _1220 * 6.283185482025146484375;
    float _1384 = sin(_1382);
    bool _1386 = !_1352;
    int _1388 = _1386 ? 0 : (-1);
    int _1390 = abs(_1374);
    int _1392 = _1380 * as_type<int>(_1242);
    int _1394 = _1392 + _1368;
    int _1396 = ~_1370;
    int _1398 = _1396 + 1;
    int _1400 = _1398 + 1;
    float _1402 = fma(_1356, 2.0, -1.0);
    int _1404 = ~_1300;
    int _1406 = _1404 + _1388;
    int _1408 = _1406 + 1;
    float _1410 = _1220 * 6.283185482025146484375;
    float _1412 = cos(_1410);
    float _1414 = -_1364;
    float _1416 = _1274 + _1414;
    int _1418 = _1400 * as_type<int>(_1250);
    int _1420 = _1418 + _1394;
    int _1422 = ~_1390;
    int _1424 = _1422 + 1;
    int _1426 = _1424 + 1;
    int _1428 = _329 * _1408;
    int _1430 = _1428 + _780;
    float _1432 = fma(_1336, 2.0, -1.0);
    bool _1434 = 1.0 != (*spvDescriptorSet0.vp_c12)._m0[10].x;
    bool _1436 = isnan(1.0);
    bool _1438 = _1434 || _1436;
    bool _1440 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].x);
    bool _1442 = _1438 || _1440;
    float _1444 = fma(_1416, 2.0, -1.0);
    float _1446 = _1284 * 6.283185482025146484375;
    float _1448 = cos(_1446);
    int _1450 = _1420 * _1426;
    bool _1452 = !_756;
    int _1454 = _1452 ? _1430 : (-1);
    float _1456 = _1324 * _1384;
    float _1458 = _1350 * _1384;
    int _1460 = _1454 * _1390;
    int _1462 = _1460 + _1450;
    float _1464 = _1284 * 6.283185482025146484375;
    float _1466 = sin(_1464);
    float _1468 = _1350 * _1412;
    float _1470 = _1324 * _1412;
    float _1472 = _1432 * (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _1474 = float(_1462);
    float _1476 = _1472 * (*spvDescriptorSet0.vp_c12)._m0[3].y;
    float _1478 = _1324 * _1448;
    float _1480 = _1412 * _1448;
    float _1482 = _1350 * _1448;
    float _1484 = _1384 * _1448;
    out.m_78.x = _1474;
    float _1486 = fma(_1466, _1468, _1456);
    float _1488 = fma(_1466, _1456, _1468);
    float _1490 = -_1458;
    float _1492 = fma(_1466, _1470, _1490);
    float _1494 = -_1470;
    float _1496 = fma(_1466, _1458, _1494);
    float _1498 = _1472 * (*spvDescriptorSet0.vp_c12)._m0[3].x;
    float _1500 = _1402 * (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _1502 = _1472 * (*spvDescriptorSet0.vp_c12)._m0[3].z;
    float _1504 = fma(_1500, (*spvDescriptorSet0.vp_c12)._m0[2].x, _1498);
    float _1506 = fma(_1500, (*spvDescriptorSet0.vp_c12)._m0[2].z, _1502);
    float _1508 = -_758;
    float _1510 = _1466 * _1508;
    float _1512 = fma(_1500, (*spvDescriptorSet0.vp_c12)._m0[2].y, _1476);
    float _1514 = _1482 * _758;
    float _1516 = _1444 * (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _1518 = fma(_1480, _692, _1510);
    float _1520 = _1478 * _758;
    float _1522 = fma(_1486, _692, _1514);
    float _1524 = fma(_1516, (*spvDescriptorSet0.vp_c12)._m0[4].x, _1504);
    float _1526 = fma(_1516, (*spvDescriptorSet0.vp_c12)._m0[4].y, _1512);
    float _1528 = fma(_1516, (*spvDescriptorSet0.vp_c12)._m0[4].z, _1506);
    float _1530 = fma(_1492, _692, _1520);
    float _1532 = _1524 + (*spvDescriptorSet0.vp_c12)._m0[5].x;
    float _1534 = _1526 + (*spvDescriptorSet0.vp_c12)._m0[5].y;
    float _1536 = _1528 + (*spvDescriptorSet0.vp_c12)._m0[5].z;
    float _1538 = _1336;
    float _1540 = _1336;
    float _1542 = _1402;
    float _1544 = _1432;
    float _1546 = _1444;
    float _1548 = _1534;
    float _1556;
    if (!_1442)
    {
        bool _1550 = _1534 > (*spvDescriptorSet0.vp_c12)._m0[10].y;
        bool _1552 = !_1550;
        _1554 = _1552;
        if (!_1554)
        {
            _1556 = 0.0;
            _1558 = true;
        }
    }
    if ((!_1558) || _1554)
    {
        bool _1582;
        if (!_1554)
        {
            bool _1560 = _1534 >= (*spvDescriptorSet0.vp_c12)._m0[10].y;
            bool _1562 = isnan(_1534);
            bool _1564 = _1560 || _1562;
            bool _1566 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].y);
            bool _1568 = _1564 || _1566;
            bool _1570 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _1572 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _1574 = !_1568;
            bool _1576 = _1572 && _1574;
            _710 = (*spvDescriptorSet0.vp_c12)._m0[10].x;
            if (_1576)
            {
                _1538 = 0.0;
            }
            float _1578 = _1538;
            bool _1580 = !_1568;
            _1582 = _1580 && _1570;
            _1540 = _1578;
            _1556 = _1578;
        }
        if ((!_1582) || _1554)
        {
            _1554 = false;
            float _1584 = _1540;
            float _1586 = _710;
            bool _1588 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].x;
            bool _1590 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].y;
            bool _1592 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].z;
            float _1594 = _1584;
            float _1596 = _1586;
            if (_1588)
            {
                float _1598 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].x;
                _1594 = _1598;
            }
            float _1600 = _1594;
            if (_1588)
            {
                float _1602 = abs(_1402);
                float _1604 = -_1602;
                float _1606 = _1604 + 1.0;
                _1542 = _1606;
            }
            float _1608 = _1542;
            if (_1590)
            {
                float _1610 = abs(_1432);
                float _1612 = -_1610;
                float _1614 = _1612 + 1.0;
                _1544 = _1614;
            }
            float _1616 = _1544;
            if (!_1588)
            {
                _986 = 1.0;
            }
            float _1618 = _986;
            float _1620 = _1618;
            if (_1592)
            {
                float _1622 = abs(_1444);
                float _1624 = -_1622;
                float _1626 = _1624 + 1.0;
                _1546 = _1626;
            }
            float _1628 = _1546;
            if (!_1590)
            {
                _1596 = 1.0;
            }
            float _1630 = _1596;
            float _1632 = as_type<float>(_329);
            float _1634 = _1630;
            if (_1590)
            {
                float _1636 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].y;
                _1632 = _1636;
            }
            float _1638 = _1632;
            float _1640 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
            if (_1592)
            {
                float _1642 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].z;
                _1640 = _1642;
            }
            float _1644 = _1640;
            float _1646 = _1600;
            if (_1588)
            {
                float _1648 = _1608 * _1600;
                float _1650 = precise::clamp(_1648, 0.0, 1.0);
                _1620 = _1650;
            }
            float _1652 = _1620;
            if (!_1592)
            {
                _1646 = 1.0;
            }
            float _1654 = _1646;
            float _1656 = _1654;
            if (_1590)
            {
                float _1658 = _1616 * _1638;
                float _1660 = precise::clamp(_1658, 0.0, 1.0);
                _1634 = _1660;
            }
            float _1662 = _1634;
            float _1664 = _1652 * _1662;
            if (_1592)
            {
                float _1666 = _1628 * _1644;
                float _1668 = precise::clamp(_1666, 0.0, 1.0);
                _1656 = _1668;
            }
            float _1670 = _1656;
            float _1672 = _1664 * _1670;
            _1556 = _1672;
        }
    }
    _1558 = false;
    float _1674 = _1556;
    float _1676 = -_1534;
    float _1678 = _1676 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1680 = -_1532;
    float _1682 = _1680 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1684 = -_1536;
    float _1686 = _1684 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1688 = _1678 * _1678;
    float _1690 = fma(_1682, _1682, _1688);
    float _1692 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _1694 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1696 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1698 = fma(_1686, _1686, _1690);
    float _1700 = -_1692;
    float _1702 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1700);
    float _1704 = -_1696;
    float _1706 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1704);
    float _1708 = rsqrt(_1698);
    float _1710 = -_1694;
    float _1712 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _1710);
    float _1714 = _1712 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1716 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1718 = -_1714;
    float _1720 = fma(_1702, (*spvDescriptorSet0.vp_c8)._m0[1].y, _1718);
    float _1722 = -_1716;
    float _1724 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _1722);
    float _1726 = _1682 * _1708;
    float _1728 = _1686 * _1708;
    float _1730 = _1678 * _1708;
    float _1732 = _1706 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1734 = _1726 * _1726;
    float _1736 = fma(_1728, _1728, _1734);
    float _1738 = rsqrt(_1736);
    float _1740 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1742 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1744 = -_1740;
    float _1746 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1744);
    float _1748 = _1706 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1750 = -_1742;
    float _1752 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1750);
    float _1754 = -_1732;
    float _1756 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1754);
    float _1758 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1720);
    float _1760 = -_1748;
    float _1762 = fma(_1702, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1760);
    float _1764 = fma(_1724, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1756);
    float _1766 = fma(_1752, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1762);
    float _1768 = _1728 * _1738;
    float _1770 = _1726 * _1738;
    float _1772 = _1766 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1774 = -_1768;
    float _1776 = _1728 * _1774;
    float _1778 = -_1768;
    float _1780 = _1730 * _1778;
    float _1782 = -_1772;
    float _1784 = fma(_1758, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1782);
    float _1786 = -_1776;
    float _1788 = fma(_1726, _1770, _1786);
    float _1790 = _1730 * _1770;
    float _1792 = _1752 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1794 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1784);
    float _1796 = _1788 * _1788;
    float _1798 = fma(_1790, _1790, _1796);
    float _1800 = -_1792;
    float _1802 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1800);
    float _1804 = _1706 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _1806 = fma(_1780, _1780, _1798);
    float _1808 = fma(_1724, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1802);
    float _1810 = -_1804;
    float _1812 = fma(_1702, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1810);
    float _1814 = _1712 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _1816 = -_1808;
    float _1818 = fma(_1816, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1794);
    float _1820 = rsqrt(_1806);
    float _1822 = fma(_1752, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1812);
    float _1824 = _1706 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1826 = -_1814;
    float _1828 = fma(_1702, (*spvDescriptorSet0.vp_c8)._m0[0].y, _1826);
    float _1830 = _1534 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1832 = -_1824;
    float _1834 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1832);
    float _1836 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1828);
    float _1838 = 1.0 / _1818;
    float _1840 = fma(_1532, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1830);
    float _1842 = fma(_1724, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1834);
    float _1844 = fma(_1536, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1840);
    float _1846 = _1788 * _1820;
    float _1848 = precise::clamp(_1846, 0.0, 1.0);
    float _1850 = -_1848;
    float _1852 = _1850 + 1.0;
    float _1854 = fma(_1822, _1838, -1.0);
    float _1856 = _1852 * _1838;
    float _1858 = fma(_1852, _1854, 1.0);
    float _1860 = _1836 * _1856;
    float _1862 = _1842 * _1856;
    float _1864 = _1858 * _1858;
    float _1866 = fma(_1860, _1860, _1864);
    float _1868 = fma(_1862, _1862, _1866);
    float _1870 = rsqrt(_1868);
    float _1872 = _1862 * _1870;
    float _1874 = _1860 * _1870;
    float _1876 = _1858 * _1870;
    float _1878 = -_1872;
    float _1880 = _1726 * _1878;
    float _1882 = _1728 * _1876;
    float _1884 = -_1874;
    float _1886 = -_1880;
    float _1888 = fma(_1728, _1884, _1886);
    float _1890 = -_1874;
    float _1892 = _1730 * _1890;
    float _1894 = -_1872;
    float _1896 = -_1882;
    float _1898 = fma(_1730, _1894, _1896);
    float _1900 = _1888 * _1888;
    float _1902 = -_1892;
    float _1904 = fma(_1726, _1876, _1902);
    float _1906 = fma(_1898, _1898, _1900);
    float _1908 = fma(_1904, _1904, _1906);
    float _1910 = rsqrt(_1908);
    float _1912 = _1898 * _1910;
    float _1914 = _1904 * _1910;
    float _1916 = _1888 * _1910;
    float _1918 = _1728 * _1912;
    float _1920 = _1730 * _1914;
    float _1922 = -_1918;
    float _1924 = fma(_1726, _1914, _1922);
    float _1926 = _1726 * _1916;
    float _1928 = -_1920;
    float _1930 = fma(_1728, _1916, _1928);
    float _1932 = _1924 * _1924;
    float _1934 = -_1926;
    float _1936 = fma(_1730, _1912, _1934);
    float _1938 = fma(_1930, _1930, _1932);
    float _1940 = fma(_1936, _1936, _1938);
    float _1942 = rsqrt(_1940);
    float _1944 = _1936 * _1942;
    float _1946 = _1924 * _1942;
    float _1948 = _1930 * _1942;
    float _1950 = _1726 * _1944;
    float _1952 = _1728 * _1946;
    float _1954 = _1522 * _1944;
    float _1956 = -_1950;
    float _1958 = fma(_1728, _1948, _1956);
    float _1960 = _1730 * _1948;
    float _1962 = -_1952;
    float _1964 = fma(_1730, _1944, _1962);
    float _1966 = _1958 * _1958;
    float _1968 = -_1960;
    float _1970 = fma(_1726, _1946, _1968);
    float _1972 = fma(_1964, _1964, _1966);
    float _1974 = fma(_1970, _1970, _1972);
    float _1976 = rsqrt(_1974);
    float _1978 = _1970 * _1976;
    float _1980 = _1522 * _1948;
    float _1982 = _1964 * _1976;
    float _1984 = _1958 * _1976;
    float _1986 = fma(_1518, _1978, _1954);
    float _1988 = _1522 * _1946;
    float _1990 = fma(_1518, _1982, _1980);
    float _1992 = fma(_1530, _1728, _1986);
    float _1994 = fma(_1518, _1984, _1988);
    float _1996 = fma(_1530, _1726, _1990);
    float _1998 = _1844 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2000 = _1536 + _1992;
    float _2002 = _1534 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2004 = _1532 + _1996;
    float _2006 = 1.0 / _1998;
    float _2008 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2010 = _2000 + _2008;
    float _2012 = fma(_1532, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2002);
    float _2014 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2016 = _2004 + _2014;
    float _2018 = fma(_1530, _1730, _1994);
    float _2020 = _2010 * _2010;
    float _2022 = fma(_1536, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2012);
    float _2024 = _1534 + _2018;
    float _2026 = fma(_2016, _2016, _2020);
    float _2028 = _2022 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _2030 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2032 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2034 = _2030 || _2032;
    bool _2036 = isnan(0.5);
    bool _2038 = _2034 || _2036;
    float _2040 = sqrt(_2026);
    float _2042 = _2028 + _1998;
    bool _2044 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2046 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2048 = _2044 || _2046;
    bool _2050 = isnan(0.5);
    bool _2052 = _2048 || _2050;
    float _2054 = _2042 * _2006;
    float _2056 = _2054 * 0.5;
    float _2058 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2060 = fma(_2056, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2058);
    float _2062 = 1.0 / _2060;
    bool _2064 = _2040 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2066 = _2006;
    float _2068 = _1998;
    float _2070 = _2000;
    float _2072 = _2018;
    float _2074 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _2076 = _2004;
    float _2078 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    if (!_2064)
    {
        _2066 = _2000;
    }
    float _2080 = _2066;
    float _2082 = _2080;
    if (!_2064)
    {
        _2068 = _2004;
    }
    float _2084 = _2068;
    float _2086 = _2084;
    if (!_2064)
    {
        _2070 = _2024;
    }
    float _2088 = _2070;
    bool _2090 = !_2064;
    float _2092 = _2088;
    if (!_2090)
    {
        float _2094 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2096 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2098 = _2040 + _2096;
        float _2100 = _2024 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2102 = rsqrt(_2026);
        float _2104 = _2098 * _2094;
        float _2106 = _2104 * 0.15915493667125701904296875;
        float _2108 = _2106 * 6.283185482025146484375;
        float _2110 = cos(_2108);
        float _2112 = _2106 * 6.283185482025146484375;
        float _2114 = sin(_2112);
        float _2116 = _2110 + (-1.0);
        float _2118 = _2116 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2120 = fma(_2114, _2100, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2122 = fma(_2024, _2110, _2118);
        float _2124 = _2102 * _2120;
        float _2126 = fma(_2016, _2124, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2128 = fma(_2010, _2124, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2092 = _2122;
        _2082 = _2128;
        _2086 = _2126;
        _2072 = _2118;
        _2074 = _2102;
    }
    float _2130 = _2092;
    float _2132 = _2082;
    float _2134 = _2086;
    float _2136 = _2072;
    float _2138 = _2074;
    float _2140 = _2136;
    float _2142 = _2130;
    float _2144 = _2134;
    float _2146 = _2132;
    float _2148 = _2138;
    if (_2052)
    {
        _2076 = 1.0;
    }
    float _2150 = _2076;
    float _2152 = _2150;
    if (!_2038)
    {
        float _2154 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2156 = _1534 + _2154;
        float _2158 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2160 = _1532 + _2158;
        float _2162 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2164 = -_1534;
        float _2166 = _2164 + _2130;
        float _2168 = _2156 * _2156;
        float _2170 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2172 = _1536 + _2170;
        float _2174 = fma(_2160, _2160, _2168);
        float _2176 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2178 = fma(_2172, _2172, _2174);
        float _2180 = sqrt(_2178);
        float _2182 = _2162 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2184 = precise::min(_2180, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2186 = _2184 * _2176;
        float _2188 = -_1536;
        float _2190 = _2188 + _2132;
        float _2192 = _2182 * _2186;
        float _2194 = -_1532;
        float _2196 = _2194 + _2134;
        float _2198 = fma(_2166, _2192, _1534);
        float _2200 = fma(_2196, _2192, _1532);
        float _2202 = fma(_2190, _2192, _1536);
        _2140 = _2166;
        _2142 = _2198;
        _2144 = _2200;
        _2146 = _2202;
    }
    float _2204 = _2140;
    float _2206 = _2142;
    float _2208 = _2144;
    float _2210 = _2146;
    float _2212 = _2204;
    if (_2052)
    {
        _2078 = 1.0;
    }
    float _2214 = _2078;
    float _2216 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2218 = _2062 * _2216;
    float _2220 = _2214;
    if (!_2052)
    {
        float _2222 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2224 = _2222 * 0.15915493667125701904296875;
        float _2226 = _2224 * 6.283185482025146484375;
        float _2228 = cos(_2226);
        float _2230 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2232 = _2230 * 0.15915493667125701904296875;
        float _2234 = _2224 * 6.283185482025146484375;
        float _2236 = sin(_2234);
        float _2238 = 1.0 / _2228;
        float _2240 = _2232 * 6.283185482025146484375;
        float _2242 = cos(_2240);
        float _2244 = _2236 * _2238;
        float _2246 = _2232 * 6.283185482025146484375;
        float _2248 = sin(_2246);
        float _2250 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2252 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2250;
        float _2254 = _2242 * _2244;
        float _2256 = 1.0 / _2254;
        float _2258 = 1.0 / _2252;
        float _2260 = _2248 * _2256;
        float _2262 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2264 = fma(_2218, _2260, _2262);
        float _2266 = _2264 * _2258;
        float _2268 = precise::clamp(_2266, 0.0, 1.0);
        _2212 = _2264;
        _1548 = _2232;
        _2148 = _2224;
        _2152 = _2268;
    }
    float _2270 = _2212;
    float _2272 = _1548;
    float _2274 = _2148;
    float _2276 = _2152;
    float _2278 = _2272;
    float _2280 = _2270;
    float _2282 = _2274;
    if (!_2052)
    {
        float _2284 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2286 = _2284 * 0.15915493667125701904296875;
        float _2288 = _2286 * 6.283185482025146484375;
        float _2290 = cos(_2288);
        float _2292 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2294 = _2292 * 0.15915493667125701904296875;
        float _2296 = _2286 * 6.283185482025146484375;
        float _2298 = sin(_2296);
        float _2300 = 1.0 / _2290;
        float _2302 = _2294 * 6.283185482025146484375;
        float _2304 = cos(_2302);
        float _2306 = _2298 * _2300;
        float _2308 = _2294 * 6.283185482025146484375;
        float _2310 = sin(_2308);
        float _2312 = _2304 * _2306;
        float _2314 = 1.0 / _2312;
        float _2316 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2318 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2316;
        float _2320 = 1.0 / _2318;
        float _2322 = _2310 * _2314;
        float _2324 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2326 = fma(_2218, _2322, _2324);
        float _2328 = _2326 * _2320;
        float _2330 = precise::clamp(_2328, 0.0, 1.0);
        float _2332 = -_2330;
        float _2334 = _2332 + 1.0;
        _2278 = _2298;
        _2280 = _2300;
        _2220 = _2334;
    }
    float _2336 = _2278;
    float _2338 = _2280;
    float _2340 = _2220;
    float _2342 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2344 = _2206 + _2342;
    float _2346 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2348 = _2208 + _2346;
    float _2350 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2352 = _2210 + _2350;
    float _2354 = _2344 * _2344;
    float _2356 = fma(_2348, _2348, _2354);
    float _2358 = fma(_2352, _2352, _2356);
    float _2360 = rsqrt(_2358);
    float _2362 = sqrt(_2358);
    float _2364 = _2360 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2366 = _2348 * _2364;
    float _2368 = _2352 * _2364;
    float _2370 = _2366 * _2366;
    float _2372 = _2368 * _2368;
    float _2374 = _2370 + _2372;
    float _2376 = sqrt(_2374);
    bool _2378 = _2376 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2380 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2382 = _2376 + _2380;
    float _2384 = _2360;
    float _2386 = _2338;
    float _2388 = _2382;
    float _2390 = _2364;
    float _2392 = _2374;
    if (_2378)
    {
        float _2394 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2384 = _2394;
    }
    float _2396 = _2384;
    if (_2378)
    {
        float _2398 = rsqrt(_2374);
        _2386 = _2398;
    }
    float _2400 = _2386;
    float _2402 = _2400;
    if (_2378)
    {
        float _2404 = _2382 * _2396;
        _2388 = _2404;
    }
    float _2406 = _2388;
    if (_2378)
    {
        float _2408 = _2406 * 0.15915493667125701904296875;
        _2282 = _2408;
    }
    float _2410 = _2282;
    float _2412 = _2336;
    if (_2378)
    {
        float _2414 = _2410 * 6.283185482025146484375;
        float _2416 = sin(_2414);
        _2412 = _2416;
    }
    float _2418 = _2412;
    float _2420 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2422 = precise::max(0.0, _2420);
    float _2424 = _2352;
    float _2426 = _2422;
    if (_2378)
    {
        float _2428 = _2410 * 6.283185482025146484375;
        float _2430 = cos(_2428);
        _2424 = _2430;
    }
    float _2432 = _2424;
    float _2434 = -_2364;
    float _2436 = -_2422;
    float _2438 = fma(_2344, _2434, _2436);
    float _2440 = fma(_1532, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2442 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    float _2444 = _2438;
    if (_2378)
    {
        float _2446 = _2438 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2426 = _2446;
    }
    float _2448 = _2426;
    float _2450 = _2206 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2452 = _2418;
    float _2454 = _2448;
    if (_2378)
    {
        float _2456 = fma(_2418, _2448, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2452 = _2456;
    }
    float _2458 = _2452;
    float _2460 = _2458;
    if (!_2378)
    {
        _2454 = _2370;
    }
    float _2462 = _2454;
    float _2464 = fma(_2208, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2450);
    float _2466 = _2462;
    float _2468 = _2432;
    if (_2378)
    {
        float _2470 = _2432 + (-1.0);
        _2442 = _2470;
    }
    float _2472 = _2442;
    if (_2378)
    {
        float _2474 = _2400 * _2458;
        _2390 = _2474;
    }
    float _2476 = _2390;
    if (!_2378)
    {
        _2402 = _2366;
    }
    float _2478 = _2402;
    float _2480 = fma(_2210, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2464);
    float _2482 = _2478;
    if (_2378)
    {
        float _2484 = _2472 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2392 = _2484;
    }
    float _2486 = _2392;
    if (_2378)
    {
        float _2488 = _2366 * _2476;
        _2482 = _2488;
    }
    float _2490 = _2482;
    if (!_2378)
    {
        _2460 = _2368;
    }
    float _2492 = _2460;
    float _2494 = _2492;
    if (_2378)
    {
        float _2496 = _2368 * _2476;
        _2494 = _2496;
    }
    float _2498 = _2494;
    if (_2378)
    {
        float _2500 = fma(_2438, _2432, _2486);
        _2444 = _2500;
    }
    float _2502 = _2444;
    if (_2378)
    {
        float _2504 = _2490 * _2490;
        _2466 = _2504;
    }
    float _2506 = _2466;
    if (!_2378)
    {
        _2468 = _2372;
    }
    float _2508 = _2468;
    float _2510 = _2508;
    if (_2378)
    {
        float _2512 = _2498 * _2498;
        _2510 = _2512;
    }
    float _2514 = _2510;
    float _2516 = fma(_2502, _2502, _2506);
    float _2518 = _2480 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2520 = floor(_2440);
    float _2522 = _2516 + _2514;
    float _2524 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2526 = fma(_2362, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2524);
    float _2528 = precise::clamp(_2526, 0.0, 1.0);
    float _2530 = _2206 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2532 = rsqrt(_2522);
    float _2534 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2536 = _2518 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2538 = -_2528;
    float _2540 = _2538 + 1.0;
    float _2542 = -_2536;
    float _2544 = fma(_2542, _2534, 1.0);
    float _2546 = _2206 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2548 = -_2520;
    float _2550 = _2440 + _2548;
    float _2552 = _2206 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2554 = abs(_2540);
    float _2556 = log2(_2554);
    float _2558 = fma(_1536, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2560 = fma(_2208, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2546);
    float _2562 = fma(_2208, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2552);
    float _2564 = _2532 * _2490;
    float _2566 = fma(_2210, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2562);
    float _2568 = _2532 * _2502;
    float _2570 = fma(_2208, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2530);
    float _2572 = _2564 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2574 = fma(_2210, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2560);
    float _2576 = _2566 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2578 = _2532 * _2498;
    float _2580 = -_2572;
    float _2582 = fma(_2568, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2580);
    float _2584 = _2574 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2586 = _2576 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2588 = fma(_2210, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2570);
    float _2590 = -_2578;
    float _2592 = fma(_2590, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2582);
    float _2594 = floor(_2558);
    float _2596 = fma(_2584, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2586);
    float _2598 = _2556 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2600 = _2588 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2602 = fma(_2592, -0.5, 0.5);
    float _2604 = fma(_2518, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2596);
    float _2606 = _2576 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2608 = fma(_2592, 0.5, 0.5);
    float _2610 = exp2(_2598);
    float _2612 = fma(_2600, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2604);
    float _2614 = fma(_2584, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2606);
    float _2616 = _2568 + 1.0;
    float _2618 = fma(_2518, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2614);
    float _2620 = log2(_2544);
    float _2622 = -_2594;
    float _2624 = _2558 + _2622;
    float _2626 = fma(_2608, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2628 = 1.0 / _2612;
    float _2630 = _2576 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2632 = -_2568;
    float _2634 = fma(_2610, _2616, _2632);
    float _2636 = fma(_2600, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2618);
    float _2638 = fma(_2608, _2626, -0.212114393711090087890625);
    float _2640 = fma(_2584, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2630);
    float _2642 = sqrt(_2602);
    float _2644 = fma(_2518, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2640);
    float2 _7153 = float2(_2550, _2624);
    float _2646 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7153, float2(0.0), isnan(_7153)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7153, float2(0.0), isnan(_7153)), level(0.0)).x;
    float _2648 = _2620 * 0.693147182464599609375;
    float _2650 = fma(_2608, _2638, 1.570728778839111328125);
    float _2652 = fma(_2600, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2644);
    float _2654 = fma(_2634, 0.5, 0.5);
    float _2656 = _2648 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2658 = _2636 * _2628;
    float _2660 = _2652 * _2628;
    float _2662 = fma(_2658, 0.5, 0.5);
    float _2664 = fma(_2660, -0.5, 0.5);
    float _2666 = _2642 * 0.636619746685028076171875;
    float _2668 = -_2650;
    float _2670 = fma(_2666, _2668, 1.0);
    float3 _7200 = float3(_2662, _2664, _2656);
    float _2672 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7200, float3(0.0), isnan(_7200)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7200, float3(0.0), isnan(_7200)), level(0.0)).x;
    float3 _7211 = float3(_2662, _2664, _2656);
    float4 _2675 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7211, float3(0.0), isnan(_7211)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7211, float3(0.0), isnan(_7211)), level(0.0)).xyzw;
    float _2677 = _2675.x;
    float _2679 = _2675.y;
    float _2681 = _2675.z;
    float _2683 = _2675.w;
    float2 _7227 = float2(_2670, _2654);
    float3 _2687 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7227, float2(0.0), isnan(_7227)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7227, float2(0.0), isnan(_7227)), level(0.0)).xyz;
    float _2689 = _2687.x;
    float _2691 = _2687.y;
    float _2693 = _2687.z;
    float _2695 = abs(_2218);
    float _2697 = log2(_2695);
    float _2699 = _1482 * _1944;
    float _2701 = _2576 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2703 = _2362 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2705 = isnan(_2362);
    bool _2707 = _2703 || _2705;
    bool _2709 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2711 = _2707 || _2709;
    float _2713 = -_1466;
    float _2715 = fma(_2713, _1978, _2699);
    float _2717 = fma(_2584, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2701);
    float _2719 = _1482 * _1946;
    bool _2721 = _2218 <= 8000.0;
    bool _2723 = isnan(_2218);
    bool _2725 = _2721 || _2723;
    bool _2727 = isnan(8000.0);
    bool _2729 = _2725 || _2727;
    float _2731 = float(_2729);
    float _2733 = fma(_1478, _1728, _2715);
    float _2735 = fma(_2518, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2717);
    float _2737 = -_1466;
    float _2739 = fma(_2737, _1984, _2719);
    float _2741 = in.m_80.x;
    float _2743 = _2697 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2745 = fma(_1478, _1730, _2739);
    float _2747 = exp2(_2743);
    float _2749 = fma(_2747, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2751 = precise::clamp(_2749, 0.0, 1.0);
    float _2753 = _1486 * _1946;
    float _2755 = _1496 * _1946;
    float _2757 = fma(_2751, -2.0, 3.0);
    float _2759 = _2751 * _2751;
    float _2761 = fma(_1484, _1984, _2755);
    float _2763 = _2759 * _2757;
    float _2765 = fma(_1488, _1730, _2761);
    float _2767 = -_2763;
    float _2769 = _2767 + 1.0;
    float _2771 = fma(_2769, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2763);
    float _2773 = _1482 * _1948;
    float _2775 = _1496 * _1948;
    float _2777 = _1496 * _1944;
    float _2779 = _2731 * _2771;
    float _2781 = -_1466;
    float _2783 = fma(_2781, _1982, _2773);
    float _2785 = _2556 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2787 = _1486 * _1948;
    float _2789 = fma(_1480, _1984, _2753);
    float _2791 = fma(_1478, _1726, _2783);
    float _2793 = _1486 * _1944;
    float _2795 = fma(_1480, _1982, _2787);
    float _2797 = exp2(_2785);
    float _2799 = fma(_1484, _1982, _2775);
    float _2801 = _768 * _2791;
    float _2803 = fma(_1492, _1726, _2795);
    float _2805 = fma(_1492, _1730, _2789);
    float _2807 = _768 * _2745;
    float _2809 = fma(_1480, _1978, _2793);
    float _2811 = fma(_1488, _1726, _2799);
    float _2813 = fma(_742, _2803, _2801);
    float _2815 = fma(_742, _2805, _2807);
    float _2817 = fma(_1492, _1728, _2809);
    float _2819 = _768 * _2733;
    float _2821 = _2811 + _2813;
    float _2823 = fma(_1484, _1978, _2777);
    float _2825 = _2765 + _2815;
    float _2827 = _2779 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2829 = fma(_742, _2817, _2819);
    float _2831 = -_2797;
    float _2833 = _2831 + 1.0;
    float _2835 = fma(_1488, _1728, _2823);
    float _2837 = fma(_2600, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2735);
    float _2839 = _2833 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2841 = _2636 + _2612;
    float _2843 = _2612 * 0.5;
    float _2845 = _2837 + _2612;
    out.gl_Position.x = _2636;
    out.gl_Position.y = _2652;
    out.gl_Position.z = _2837;
    out.gl_Position.w = _2612;
    float _2847 = fma(_2652, -0.5, _2843);
    float _2849 = _2845 * 0.5;
    float _2851 = _2841 * 0.5;
    float _2853 = _2835 + _2829;
    out.m_82.x = _2851;
    out.m_82.y = _2847;
    out.m_82.z = _2849;
    out.m_82.w = _2612;
    out.m_84.x = _2821;
    out.m_84.y = _2825;
    out.m_84.z = _2853;
    float _2855 = _2612;
    float _2857 = _2837;
    if (!_2711)
    {
        _2855 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2859 = _2855;
    float _2861 = _2859;
    float _2863 = _2859;
    if (!_2711)
    {
        _2857 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2865 = _2857;
    float _2867 = -_2646;
    float _2869 = _2867 + 1.0;
    float _2871 = _2869 * _2827;
    float _2873 = precise::clamp(_2871, 0.0, 1.0);
    float _2875 = -_2873;
    float _2877 = fma(_2875, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2879 = _2877 * _2741;
    float _2881 = _2839 * _2672;
    float _2883 = -_2839;
    float _2885 = _2883 + 1.0;
    float _2887 = _2683 * _2881;
    float _2889 = _2693 * _2881;
    float _2891 = _2879 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2893 = _2683 * _2885;
    float _2895 = fma(_2689, _2887, _2677);
    float _2897 = fma(_2691, _2887, _2679);
    float _2899 = fma(_2683, _2889, _2681);
    float _2901 = _2276 * _2340;
    out.m_86.x = _2891;
    float _2903 = _2679;
    float _2905 = _2677;
    float _2907 = _2891;
    float _2909 = _2865;
    float _2911 = _2865;
    if (!_2711)
    {
        _2903 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2913 = _2903;
    float _2915 = _2901 * _1674;
    out.m_88.x = _2895;
    out.m_88.y = _2897;
    out.m_88.z = _2899;
    out.m_88.w = _2893;
    float _2917 = _2915;
    float _2919 = _2913;
    float _2921 = _2913;
    if (!_2711)
    {
        _2905 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2923 = _2905;
    float _2925 = _2915 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2927 = _2923;
    float _2929 = _2923;
    if (!_2711)
    {
        _2917 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2931 = _2917;
    float _2933 = _2931;
    float _2935 = _2931;
    if (!_2711)
    {
        _2907 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2937 = _2907;
    bool _2939 = !_2711;
    float _2941 = _2937;
    float _2943 = _2937;
    if (!_2939)
    {
        bool _2945 = _2362 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2947 = isnan(_2362);
        bool _2949 = _2945 || _2947;
        bool _2951 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2953 = _2949 || _2951;
        if (!_2953)
        {
            float _2955 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2957 = _2362 + _2955;
            float _2959 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2961 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2959;
            float _2963 = 1.0 / _2961;
            float _2965 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2967 = _2965 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2969 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2971 = _2969 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2973 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2975 = _2973 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2977 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2979 = _2977 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2981 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2983 = _2981 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2985 = _2957 * _2963;
            float _2987 = precise::clamp(_2985, 0.0, 1.0);
            float _2989 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2991 = _2989 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2993 = fma(_2987, _2967, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2995 = fma(_2987, _2991, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2997 = fma(_2987, _2971, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2999 = fma(_2987, _2975, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3001 = fma(_2987, _2979, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3003 = fma(_2987, _2983, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2929 = _2995;
            _2935 = _3001;
            _2921 = _2993;
            _2911 = _2999;
            _2863 = _2997;
            _2943 = _3003;
            _3005 = true;
        }
        else
        {
            bool _3007 = _2362 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3009 = isnan(_2362);
            bool _3011 = _3007 || _3009;
            bool _3013 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3015 = _3011 || _3013;
            if (!_3015)
            {
                _2919 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3017 = _2919;
            _2921 = _3017;
            if (!_3015)
            {
                _2927 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3019 = _2927;
            _2929 = _3019;
            if (!_3015)
            {
                _2861 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3021 = _2861;
            _2863 = _3021;
            if (!_3015)
            {
                _2909 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3023 = _2909;
            _2911 = _3023;
            if (!_3015)
            {
                _2933 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3025 = _2933;
            _2935 = _3025;
            if (!_3015)
            {
                _2941 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3027 = _2941;
            bool _3029 = !_3015;
            _2943 = _3027;
            if (!_3029)
            {
                bool _3031 = _2362 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3033 = isnan(_2362);
                bool _3035 = _3031 || _3033;
                bool _3037 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3039 = _3035 || _3037;
                if (!_3039)
                {
                    float _3041 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3043 = _2362 + _3041;
                    float _3045 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3047 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3045;
                    float _3049 = 1.0 / _3047;
                    float _3051 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3053 = _3051 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3055 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3057 = _3055 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3059 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3061 = _3059 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3063 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3065 = _3063 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3067 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3069 = _3067 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3071 = _3043 * _3049;
                    float _3073 = precise::clamp(_3071, 0.0, 1.0);
                    float _3075 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3077 = _3075 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3079 = fma(_3073, _3053, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3081 = fma(_3073, _3077, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3083 = fma(_3073, _3057, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3085 = fma(_3073, _3061, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3087 = fma(_3073, _3065, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3089 = fma(_3073, _3069, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2929 = _3081;
                    _2935 = _3087;
                    _2921 = _3079;
                    _2911 = _3085;
                    _2863 = _3083;
                    _2943 = _3089;
                    _3005 = true;
                }
                else
                {
                    _2929 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2935 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2921 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2911 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2863 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2943 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3005 = false;
    float _3091 = _2929;
    float _3093 = _2935;
    float _3095 = _2921;
    float _3097 = _2911;
    float _3099 = _2863;
    float _3101 = _2943;
    float _3103 = fma(_2825, -0.5, 0.5);
    float _3105 = precise::clamp(_3103, 0.0, 1.0);
    float _3107 = -_3091;
    float _3109 = _3107 + _3093;
    float _3111 = -_3095;
    float _3113 = _3111 + _3097;
    out.m_90.x = 0.0;
    float _3115 = fma(_3105, _3109, _3091);
    float _3117 = -_3099;
    float _3119 = _3117 + _3101;
    float _3121 = fma(_3105, _3113, _3095);
    float _3123 = _3115 * 0.586610972881317138671875;
    bool _3125 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3127 = fma(_3105, _3119, _3099);
    float _3129 = _2925 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3131 = fma(_3121, 0.298911988735198974609375, _3123);
    bool _3133 = _2276 > 0.0;
    bool _3135 = isnan(_2276);
    bool _3137 = _3133 || _3135;
    bool _3139 = isnan(0.0);
    bool _3141 = _3137 || _3139;
    float _3143 = fma(_3127, 0.114477999508380889892578125, _3131);
    out.m_55.x = _3129;
    bool _3145 = _2340 <= 0.0;
    bool _3147 = !_3141;
    bool _3149 = _3145 || _3147;
    float _3151 = -_3143;
    float _3153 = _3121 + _3151;
    float _3155 = -_3143;
    float _3157 = _3115 + _3155;
    float _3159 = -_3143;
    float _3161 = _3127 + _3159;
    float _3163 = fma(_3153, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3143);
    float _3165 = fma(_3157, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3143);
    float _3167 = fma(_3161, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3143);
    bool _3169 = !_3125;
    if (!_3169)
    {
        float _3171 = -_2206;
        float _3173 = _3171 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3175 = -_2208;
        float _3177 = _3175 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3179 = -_2210;
        float _3181 = _3179 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3183 = _3173 * _3173;
        float _3185 = fma(_3177, _3177, _3183);
        float _3187 = fma(_3181, _3181, _3185);
        float _3189 = sqrt(_3187);
        float _3191 = rsqrt(_3187);
        float _3193 = -_3189;
        float _3195 = _3193 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3197 = _3195 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3199 = precise::clamp(_3197, 0.0, 1.0);
        float _3201 = _3177 * _3191;
        float _3203 = _3173 * _3191;
        float _3205 = abs(_3199);
        float _3207 = log2(_3205);
        float _3209 = _3181 * _3191;
        float _3211 = _3201 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3213 = _2825 * _3203;
        float _3215 = -_3203;
        float _3217 = -_3211;
        float _3219 = fma(_3215, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3217);
        float _3221 = fma(_2821, _3201, _3213);
        float _3223 = -_3209;
        float _3225 = fma(_3223, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3219);
        float _3227 = fma(_2853, _3209, _3221);
        float _3229 = precise::clamp(_3227, 0.0, 1.0);
        float _3231 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3233 = _3225 + _3231;
        float _3235 = _3207 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3237 = _3233 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3239 = precise::clamp(_3237, 0.0, 1.0);
        float _3241 = exp2(_3235);
        float _3243 = _3241 * _3239;
        float _3245 = _3229 * _3243;
        float _3247 = _3245 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3249 = _3245 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3251 = _3245 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_90.x = _3247;
        out.m_90.y = _3249;
        out.m_90.z = _3251;
    }
    out.m_92.x = _3163;
    out.m_92.y = _3165;
    out.m_92.z = _3167;
    if (!_3149)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_55.x = 0.0;
    float _3253 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3253;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3005 = false;
    bool _1558 = false;
    bool _1554 = false;
    bool _209 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _106 = in.m_48.w;
    float _108 = in.m_50.w;
    float _110 = trunc(_106);
    int _113 = int(_110);
    float _115 = -_108;
    float _117 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.y = _117;
    bool _121 = _113 >= 1;
    float _123 = 0.0;
    float _125 = _108;
    float _127 = _117;
    if (!_121)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _129 = _123;
    if (!_121)
    {
        out.m_55.x = 0.0;
    }
    int _131 = 0;
    if (!_121)
    {
        float _133 = _129 * 5.0;
        _131 = as_type<int>(_133);
    }
    int _135 = _131;
    int _137 = _135;
    if (!_121)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3321 = as_type<float>(_135);
        out.gl_Position.z = _3321;
    }
    if (!_121)
    {
        return out;
    }
    bool _139 = _108 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _141 = isnan(_108);
    bool _143 = _139 || _141;
    bool _145 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _147 = _143 || _145;
    float _149 = float(_113);
    bool _151 = _117 >= _149;
    bool _153 = !_147;
    bool _155 = _151 || _153;
    if (_155)
    {
        _125 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _157 = _125;
    if (_155)
    {
        out.m_55.x = 0.0;
    }
    if (_155)
    {
        float _159 = _157 * 5.0;
        _137 = as_type<int>(_159);
    }
    int _161 = _137;
    if (_155)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3376 = as_type<float>(_161);
        out.gl_Position.z = _3376;
    }
    if (_155)
    {
        return out;
    }
    float _163 = as_type<float>(int(gl_VertexIndex));
    float _165 = 1.0 / _149;
    bool _167 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _169 = _117 * _165;
    int _171 = as_type<int>(_163) & 1;
    bool _173 = _171 != 0;
    int _175 = as_type<int>(_163) & 2;
    bool _177 = _175 != 0;
    bool _179 = !_173;
    float _181 = _179 ? (-0.5) : 0.5;
    bool _183 = !_177;
    float _185 = _183 ? (-0.5) : 0.5;
    bool _187 = !_167;
    float _189 = _169;
    float _207;
    if (!_187)
    {
        float _191 = in.m_60.x;
        float _193 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _195 = _191 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _197 = fma(_195, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _199 = _197 * _193;
        float _201 = floor(_199);
        float _203 = -_201;
        float _205 = _199 + _203;
        _207 = _205;
        _209 = true;
    }
    else
    {
        _207 = _169;
    }
    _209 = false;
    float _211 = _207;
    float _213 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _215 = _211 + _213;
    bool _217 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _219 = isnan(_211);
    bool _221 = _217 || _219;
    bool _223 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _225 = _221 || _223;
    float _227 = float(_225);
    float _229 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _231 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _229;
    float _233 = -_227;
    float _235 = _233 + 1.0;
    bool _237 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _239 = isnan(_211);
    bool _241 = _237 || _239;
    bool _243 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _245 = _241 || _243;
    float _247 = float(_245);
    float _249 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _251 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _249;
    bool _253 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _255 = 1.0 / _231;
    float _257 = _247 * _235;
    float _259 = -_247;
    float _261 = _259 + 1.0;
    float _263 = _215 * _255;
    float _265 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _267 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _265;
    float _269 = fma(_251, _263, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _271 = fma(_267, _263, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _273 = _269 * _257;
    float _275 = _271 * _257;
    float _277 = fma(_261, (*spvDescriptorSet0.vp_c9)._m0[143].x, _273);
    float _279 = fma(_261, (*spvDescriptorSet0.vp_c9)._m0[143].y, _275);
    float _281 = fma(_227, (*spvDescriptorSet0.vp_c9)._m0[144].x, _277);
    float _283 = fma(_227, (*spvDescriptorSet0.vp_c9)._m0[144].y, _279);
    bool _285 = !_253;
    if (!_285)
    {
        float _287 = in.m_60.x;
        float _289 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _291 = _287 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _293 = fma(_291, (*spvDescriptorSet0.vp_c9)._m0[11].y, _117);
        float _295 = _293 * _289;
        float _297 = floor(_295);
        float _299 = -_297;
        float _301 = _295 + _299;
        _189 = _301;
    }
    float _303 = _189;
    float _305 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _307 = int(_305);
    float _309 = in.m_48.x;
    float _311 = in.m_48.y;
    float _313 = in.m_48.z;
    float _315 = in.m_62.x;
    float _317 = in.m_62.y;
    float _319 = in.m_62.z;
    float _321 = in.m_62.w;
    int _323 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _325 = _323 != 0;
    float _327 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _329 = int(_327);
    float _331 = in.m_64.x;
    float _333 = in.m_64.y;
    int _335 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _337 = _335 != 0;
    int _339 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _341 = _339 != 0;
    int _343 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _345 = _343 != 0;
    float _347 = in.m_66.x;
    float _349 = in.m_66.y;
    float _351 = in.m_66.z;
    float _353 = in.m_66.w;
    float _355 = float(_307);
    float _357 = in.m_60.x;
    float _359 = in.m_60.y;
    bool _361 = !_341;
    int _363 = _361 ? 0 : 1;
    int _365 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _367 = _365 != 0;
    float _369 = in.m_68.x;
    float _371 = in.m_68.y;
    float _373 = in.m_68.z;
    float _375 = in.m_68.w;
    float _377 = 1.0 / _355;
    int _379 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _381 = _379 != 0;
    float _383 = float(uint(_329));
    int _385 = ~_329;
    int _387 = _385 + 1;
    int _389 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _391 = _389 != 0;
    float _393 = 1.0 / _383;
    float _395 = _283 * _333;
    float _397 = _311 * _349;
    float _399 = _377 * _117;
    float _401 = _311 * _317;
    float _403 = _281 * _331;
    float _405 = fma(_309, _347, _397);
    float _407 = fma(_309, _315, _401);
    float _409 = trunc(_399);
    int _411 = int(_409);
    float _413 = _311 * _371;
    int _415 = as_type<int>(_393) + (-2);
    float _417 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _419 = fma(_309, _369, _413);
    float _421 = in.m_60.z;
    float _423 = fma(_313, _373, _419);
    float _425 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _427 = _425 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _429 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _431 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _433 = _431 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _435 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _437 = float(uint(_411));
    float _439 = 1.0 / _427;
    int _441 = ~_329;
    int _443 = _441 + 1;
    float _445 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _447 = as_type<float>(_415) * _437;
    float _449 = _359 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _451 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _453 = _435 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _455 = 1.0 / _433;
    float _457 = fma(_449, -2.0, _429);
    float _459 = _357 * 2.0;
    float _461 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _463 = _417 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _465 = _445 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _467 = -_451;
    float _469 = fma(_459, (*spvDescriptorSet0.vp_c9)._m0[77].x, _467);
    float _471 = trunc(_447);
    float _473 = precise::max(_471, 0.0);
    uint _476 = uint(_473);
    float _478 = fma(_313, _319, _407);
    out.m_70.x = _453;
    out.m_70.y = _463;
    out.m_70.z = _465;
    out.m_70.w = _461;
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _482 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _480;
    float _484 = float(_329);
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _488 = _486 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _490 = _403 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _492 = _478 + _321;
    float _494 = floor(_459);
    float _496 = _488 * _439;
    float _498 = _482 * _455;
    float _500 = _421 * 2.0;
    float _502 = _423 + _375;
    int _504 = _329 + (-1);
    float _506 = -_117;
    float _508 = fma(_506, (*spvDescriptorSet0.vp_c9)._m0[76].x, _469);
    int _510 = _443 * int(_476);
    int _512 = _510 + _411;
    float _514 = fma(_313, _351, _405);
    float _516 = _484 * _117;
    bool _518 = !_345;
    int _520 = _518 ? 0 : 1;
    float _522 = floor(_500);
    float _524 = float(uint(_512));
    float _526 = _516 * _165;
    bool _528 = !_337;
    int _530 = _528 ? 0 : 1;
    float _532 = _514 + _353;
    bool _534 = _494 > 0.0;
    float _536 = as_type<float>(_415) * _524;
    float _538 = _359 + _357;
    bool _540 = _494 >= 0.0;
    bool _542 = isnan(_494);
    bool _544 = _540 || _542;
    bool _546 = isnan(0.0);
    bool _548 = _544 || _546;
    float _550 = trunc(_526);
    int _552 = int(_550);
    float _554 = _538 + (-1.0);
    int _556 = _548 ? 0 : 1;
    float _558 = _492 + (*spvDescriptorSet0.vp_c12)._m0[0].y;
    int _560 = abs(_520);
    float _562 = fma(_554, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _564 = _359 + _421;
    float _566 = trunc(_536);
    float _568 = precise::max(_566, 0.0);
    uint _570 = uint(_568);
    float _572 = _359 * 2.0;
    float _574 = _564 + (-1.0);
    bool _576 = !_325;
    float _578 = _576 ? 7.345489978790283203125 : 1.0;
    float _580 = _502 + (*spvDescriptorSet0.vp_c12)._m0[0].x;
    int _582 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _584 = _582 != 0;
    float _586 = fma(_574, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _588 = floor(_572);
    float _590 = _578 * _357;
    bool _592 = !_367;
    int _594 = _592 ? 0 : 1;
    float _596 = _421 + _357;
    bool _598 = _359 > 0.5;
    float _600 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _602 = _532 + (*spvDescriptorSet0.vp_c12)._m0[0].z;
    float _604 = _421 + (-0.5);
    int _606 = int(_476) + int(_570);
    float _608 = floor(_590);
    bool _610 = !_584;
    int _612 = _610 ? 0 : 1;
    float _614 = fma(_359, (*spvDescriptorSet0.vp_c9)._m0[78].w, _600);
    bool _616 = _357 > 0.5;
    int _618 = _387 * _606;
    int _620 = _618 + _411;
    float _622 = _359 + (-0.5);
    float _624 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].w, _614);
    float _626 = -_181;
    int _628 = _616 ? as_type<int>(_626) : as_type<int>(_181);
    bool _630 = _588 >= 0.0;
    bool _632 = isnan(_588);
    bool _634 = _630 || _632;
    bool _636 = isnan(0.0);
    bool _638 = _634 || _636;
    float _640 = -_624;
    float _642 = _640 + 1.0;
    bool _644 = !_381;
    float _646 = _644 ? _181 : as_type<float>(_628);
    float _648 = -_185;
    int _650 = _598 ? as_type<int>(_648) : as_type<int>(_185);
    bool _652 = uint(_620) >= uint(_329);
    float _654 = -_608;
    float _656 = _590 + _654;
    bool _658 = _588 > 0.0;
    float _660 = _596 + (-1.0);
    bool _662 = !_652;
    int _664 = _662 ? 0 : (-1);
    float _666 = _656 * _484;
    int _668 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _670 = _668 != 0;
    int _672 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _674 = _672 != 0;
    int _676 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _678 = _676 != 0;
    float _680 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _181);
    float _682 = float(_411);
    float _684 = fma(_660, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _686 = ~_556;
    int _688 = _686 + 1;
    int _690 = _688 + 1;
    float _692 = _490 * _680;
    bool _694 = _682 >= _484;
    bool _696 = isnan(_682);
    bool _698 = _694 || _696;
    bool _700 = isnan(_484);
    bool _702 = _698 || _700;
    float _704 = float(_702);
    float _706 = _395 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _708 = _690;
    float _710 = _692;
    if (!_534)
    {
        int _712 = ~_556;
        int _714 = _712 + 1;
        _708 = _714;
    }
    int _716 = _708;
    float _718 = trunc(_666);
    int _720 = int(_718);
    int _722 = _638 ? 0 : 1;
    float _724 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _726 = _303 + _724;
    int _728 = ~_606;
    int _730 = _728 + _664;
    int _732 = _730 + 1;
    float _734 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _185);
    int _736 = ~_722;
    int _738 = _736 + 1;
    int _740 = _738 + 1;
    float _742 = _181 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _744 = _740;
    if (!_658)
    {
        int _746 = ~_722;
        int _748 = _746 + 1;
        _744 = _748;
    }
    int _750 = _744;
    float _752 = trunc(_704);
    int _754 = int(_752);
    bool _756 = _329 == 0;
    float _758 = _706 * _734;
    int _760 = abs(_594);
    int _762 = abs(_530);
    bool _764 = !_391;
    float _766 = _764 ? _185 : as_type<float>(_650);
    float _768 = _185 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _770 = fma(_496, _726, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    int _772 = _329 * _732;
    int _774 = _772 + _411;
    bool _776 = _522 > 0.0;
    int _778 = _720 * _760;
    int _780 = _778 + _411;
    int _782 = abs(_363);
    bool _784 = !_756;
    int _786 = _784 ? _774 : (-1);
    int _788 = ~_754;
    int _790 = _788 + 1;
    int _792 = _790 + 1;
    bool _794 = _303 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _796 = isnan(_303);
    bool _798 = _794 || _796;
    bool _800 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _802 = _798 || _800;
    float _804 = float(_802);
    bool _806 = _522 >= 0.0;
    bool _808 = isnan(_522);
    bool _810 = _806 || _808;
    bool _812 = isnan(0.0);
    bool _814 = _810 || _812;
    int _816 = _786 * _792;
    float _818 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _820 = _303 + _818;
    float _822 = -_804;
    float _824 = _822 + 1.0;
    float _826 = float(_716);
    int _828 = _754 * _504;
    int _830 = _828 + _816;
    bool _832 = _303 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _834 = isnan(_303);
    bool _836 = _832 || _834;
    bool _838 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _840 = _836 || _838;
    float _842 = float(_840);
    float _844 = fma(_498, _820, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _846 = _303 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _848 = isnan(_303);
    bool _850 = _846 || _848;
    bool _852 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _854 = _850 || _852;
    float _856 = float(_854);
    int _858 = _830 * _782;
    float _860 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _862 = log2(_860);
    float _864 = _842 * _824;
    float _866 = -_842;
    float _868 = _866 + 1.0;
    int _870 = abs(_612);
    int _872 = _552 * _762;
    int _874 = _872 + _858;
    float _876 = _856 * _868;
    float _878 = _646 + 0.5;
    float _880 = -_856;
    float _882 = _880 + 1.0;
    int _884 = _780 * _560;
    int _886 = _884 + _874;
    float _888 = _844 * _876;
    float _890 = fma(_878, (*spvDescriptorSet0.vp_c9)._m0[80].x, _508);
    float _892 = _766 + (-0.5);
    int _894 = _720 * _870;
    int _896 = _894 + _886;
    float _898 = fma(_882, (*spvDescriptorSet0.vp_c9)._m0[115].x, _888);
    int _900 = ~_329;
    int _902 = _900 + 1;
    float _904 = _862 * _117;
    float _906 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _908 = fma(_770, _864, _898);
    int _910 = _814 ? 0 : 1;
    float _912 = fma(_357, (*spvDescriptorSet0.vp_c9)._m0[78].z, _906);
    float _914 = float(uint(_896));
    float _916 = exp2(_904);
    float _918 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _920 = 1.0 + _918;
    bool _922 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _924 = isnan(0.0);
    bool _926 = _922 || _924;
    bool _928 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _930 = _926 || _928;
    float _932 = fma(_804, (*spvDescriptorSet0.vp_c9)._m0[117].x, _908);
    float _934 = as_type<float>(_415) * _914;
    float _936 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].z, _912);
    float _938 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[76].y, _457);
    float _940 = float(_750);
    float _942 = trunc(_934);
    float _944 = precise::max(_942, 0.0);
    uint _946 = uint(_944);
    float _948 = -_936;
    float _950 = _948 + 1.0;
    float _952 = -_892;
    float _954 = -_938;
    float _956 = fma(_952, (*spvDescriptorSet0.vp_c9)._m0[80].y, _954);
    float _958 = _357 + (-0.5);
    float _960 = -_950;
    float _962 = fma(_646, _960, _890);
    float _964 = fma(_766, _642, _956);
    float _966 = -_916;
    float _968 = _966 + 1.0;
    bool _970 = !_674;
    int _972 = _970 ? 0 : 1;
    float _974 = 1.0 / _920;
    int _976 = ~_910;
    int _978 = _976 + 1;
    int _980 = _978 + 1;
    out.m_72.x = _962;
    out.m_72.y = _964;
    int _982 = abs(_972);
    int _984 = _980;
    float _986 = _758;
    if (!_776)
    {
        int _988 = ~_910;
        int _990 = _988 + 1;
        _984 = _990;
    }
    int _992 = _984;
    int _994 = _902 * int(_946);
    int _996 = _994 + _896;
    bool _998 = !_670;
    int _1000 = _998 ? 0 : 1;
    float _1002 = float(_982);
    float _1004 = float(uint(_996));
    float _1006 = _558 * (*spvDescriptorSet0.vp_c12)._m0[7].y;
    int _1008 = abs(_1000);
    float _1010 = _1002 * _826;
    float _1012 = _930 ? _968 : 0.0;
    float _1014 = as_type<float>(_415) * _1004;
    bool _1016 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1018 = isnan(1.0);
    bool _1020 = _1016 || _1018;
    bool _1022 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1024 = _1020 || _1022;
    float _1026 = fma(_580, (*spvDescriptorSet0.vp_c12)._m0[6].y, _1006);
    float _1028 = float(_1008);
    bool _1030 = !_678;
    int _1032 = _1030 ? 0 : 1;
    float _1034 = trunc(_1014);
    float _1036 = precise::max(_1034, 0.0);
    uint _1038 = uint(_1036);
    float _1040 = float(_992);
    int _1042 = ~_329;
    int _1044 = _1042 + 1;
    int _1046 = abs(_1032);
    float _1048 = _558 * (*spvDescriptorSet0.vp_c12)._m0[7].x;
    float _1050 = _1028 * _1040;
    float _1052 = _558 * (*spvDescriptorSet0.vp_c12)._m0[7].z;
    if (_1024)
    {
        float _1054 = _1012 * _974;
        _127 = _1054;
    }
    float _1056 = _127;
    float _1058 = fma(_580, (*spvDescriptorSet0.vp_c12)._m0[6].x, _1048);
    float _1060 = fma(_602, (*spvDescriptorSet0.vp_c12)._m0[8].y, _1026);
    float _1062 = fma(_580, (*spvDescriptorSet0.vp_c12)._m0[6].z, _1052);
    float _1064 = fma(_602, (*spvDescriptorSet0.vp_c12)._m0[8].x, _1058);
    float _1066 = fma(_602, (*spvDescriptorSet0.vp_c12)._m0[8].z, _1062);
    int _1068 = int(_946) + int(_1038);
    float _1070 = _1064 + (*spvDescriptorSet0.vp_c12)._m0[9].x;
    float _1072 = in.m_74.x;
    float _1074 = in.m_74.y;
    float _1076 = in.m_74.z;
    float _1078 = float(_1046);
    float _1080 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].x;
    int _1082 = _1044 * _1068;
    int _1084 = _1082 + _896;
    float _1086 = _1060 + (*spvDescriptorSet0.vp_c12)._m0[9].y;
    float _1088 = _1078 * _940;
    float _1090 = _1066 + (*spvDescriptorSet0.vp_c12)._m0[9].z;
    bool _1092 = uint(_1084) >= uint(_329);
    float _1094 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1096 = float(uint(_780));
    float _1098 = _932 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _1100 = !_1092;
    int _1102 = _1100 ? 0 : (-1);
    float _1104 = _1050 * (-2.0);
    float _1106 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1108 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _1110 = ~_1068;
    int _1112 = _1110 + _1102;
    int _1114 = _1112 + 1;
    float _1116 = as_type<float>(_415) * _1096;
    float _1118 = fma(_562, _1104, _562);
    float _1120 = _1106 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1122 = _1094 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1124 = _329 * _1114;
    int _1126 = _1124 + _896;
    float _1128 = _1108 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1130 = fma(_1104, _1072, _1072);
    float _1132 = _1010 * (-2.0);
    float _1134 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].y;
    bool _1136 = !_756;
    int _1138 = _1136 ? _1126 : (-1);
    out.m_76.x = _1120;
    out.m_76.y = _1122;
    out.m_76.z = _1128;
    out.m_76.w = _1098;
    float _1140 = fma(_586, _1132, _586);
    float _1142 = fma(_958, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1130);
    int _1144 = _1138 >> 31;
    int _1146 = _1138 & 3;
    bool _1148 = _1146 != 0;
    float _1150 = trunc(_1116);
    float _1152 = precise::max(_1150, 0.0);
    uint _1154 = uint(_1152);
    float _1156 = fma(_1118, _1056, _1142);
    int _1158 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1160 = _1158 != 0;
    float _1162 = fma(_1132, _1074, _1074);
    int _1164 = _1144 & 3;
    float _1166 = _1070 * _1080;
    int _1168 = ~_329;
    int _1170 = _1168 + 1;
    float _1172 = fma(_622, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1162);
    int _1174 = _1138 + _1164;
    float _1176 = fma(_1166, 0.5, 0.5);
    float _1178 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].z;
    int _1180 = _1170 * int(_1154);
    int _1182 = _1180 + _780;
    int _1184 = _1174 >> 2;
    float _1186 = _1088 * (-2.0);
    float _1188 = fma(_1140, _1056, _1172);
    float _1190 = _1086 * _1134;
    int _1192 = _1184 << 4;
    int _1194 = _1192 + 368;
    float _1196 = fma(_684, _1186, _684);
    float _1198 = float(uint(_1182));
    float _1200 = fma(_1186, _1076, _1076);
    uint _1202 = uint(int(uint(_1194) >> uint(2)));
    uint _1204 = uint(int(uint(int(_1202)) >> uint(2)));
    int _1206 = int(_1202) & 3;
    float _1208 = (*spvDescriptorSet0.vp_c9)._m0[int(_1204)][_1206];
    int _1210 = int(_1202) + 1;
    uint _1212 = uint(int(uint(_1210) >> uint(2)));
    int _1214 = _1210 & 3;
    float _1216 = (*spvDescriptorSet0.vp_c9)._m0[int(_1212)][_1214];
    float _1218 = fma(_1190, 0.5, 0.5);
    float _1220 = _1188 * 0.15915493667125701904296875;
    float _1222 = fma(_604, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1200);
    float _1224 = as_type<float>(_415) * _1198;
    int _1226 = _1138 & 3;
    bool _1228 = _1226 != 0;
    float _1230 = _1090 * _1178;
    int _1232 = _1148 ? 0 : 1;
    int _1234 = _1194 + 8;
    uint _1236 = uint(int(uint(_1234) >> uint(2)));
    uint _1238 = uint(int(uint(int(_1236)) >> uint(2)));
    int _1240 = int(_1236) & 3;
    float _1242 = (*spvDescriptorSet0.vp_c9)._m0[int(_1238)][_1240];
    int _1244 = int(_1236) + 1;
    uint _1246 = uint(int(uint(_1244) >> uint(2)));
    int _1248 = _1244 & 3;
    float _1250 = (*spvDescriptorSet0.vp_c9)._m0[int(_1246)][_1248];
    bool _1252 = uint(_1226) > 1u;
    float _1254 = trunc(_1224);
    float _1256 = precise::max(_1254, 0.0);
    uint _1258 = uint(_1256);
    bool _1260 = _1226 != 3;
    float _1262 = fma(_1196, _1056, _1222);
    int _1264 = ~_1232;
    int _1266 = _1264 + 1;
    int _1268 = _1266 + 1;
    float _1270 = _1156 * 0.15915493667125701904296875;
    bool _1272 = uint(_1226) >= 2u;
    float _1274 = fma(_1230, 0.5, 0.5);
    int _1276 = ~_329;
    int _1278 = _1276 + 1;
    float _1280 = floor(_1218);
    int _1282 = _1272 ? 0 : 1;
    float _1284 = _1262 * 0.15915493667125701904296875;
    int _1286 = _1268;
    if (!_1252)
    {
        int _1288 = ~_1232;
        int _1290 = _1288 + 1;
        _1286 = _1290;
    }
    int _1292 = _1286;
    bool _1294 = _1226 != 3;
    int _1296 = abs(_1292);
    float _1298 = floor(_1176);
    int _1300 = int(_1154) + int(_1258);
    bool _1302 = !_1228;
    int _1304 = _1302 ? 0 : 1;
    int _1306 = ~_1296;
    int _1308 = _1306 + 1;
    int _1310 = _1308 + 1;
    int _1312 = _1278 * _1300;
    int _1314 = _1312 + _780;
    int _1316 = ~_1282;
    int _1318 = _1316 + 1;
    int _1320 = _1318 + 1;
    float _1322 = _1270 * 6.283185482025146484375;
    float _1324 = sin(_1322);
    int _1326 = _1320;
    if (_1260)
    {
        int _1328 = ~_1282;
        int _1330 = _1328 + 1;
        _1326 = _1330;
    }
    int _1332 = _1326;
    float _1334 = -_1280;
    float _1336 = _1218 + _1334;
    int _1338 = abs(_1304);
    int _1340 = abs(_1332);
    int _1342 = ~_1338;
    int _1344 = _1342 + 1;
    int _1346 = _1344 + 1;
    float _1348 = _1270 * 6.283185482025146484375;
    float _1350 = cos(_1348);
    bool _1352 = uint(_1314) >= uint(_329);
    float _1354 = -_1298;
    float _1356 = _1176 + _1354;
    int _1358 = _1310 * as_type<int>(_1216);
    bool _1360 = !_1294;
    int _1362 = _1360 ? 0 : (-1);
    float _1364 = floor(_1274);
    int _1366 = _1346 * as_type<int>(_1208);
    int _1368 = _1366 + _1358;
    int _1370 = abs(_1362);
    bool _1372 = !_1160;
    int _1374 = _1372 ? 0 : 1;
    int _1376 = ~_1340;
    int _1378 = _1376 + 1;
    int _1380 = _1378 + 1;
    float _1382 = _1220 * 6.283185482025146484375;
    float _1384 = sin(_1382);
    bool _1386 = !_1352;
    int _1388 = _1386 ? 0 : (-1);
    int _1390 = abs(_1374);
    int _1392 = _1380 * as_type<int>(_1242);
    int _1394 = _1392 + _1368;
    int _1396 = ~_1370;
    int _1398 = _1396 + 1;
    int _1400 = _1398 + 1;
    float _1402 = fma(_1356, 2.0, -1.0);
    int _1404 = ~_1300;
    int _1406 = _1404 + _1388;
    int _1408 = _1406 + 1;
    float _1410 = _1220 * 6.283185482025146484375;
    float _1412 = cos(_1410);
    float _1414 = -_1364;
    float _1416 = _1274 + _1414;
    int _1418 = _1400 * as_type<int>(_1250);
    int _1420 = _1418 + _1394;
    int _1422 = ~_1390;
    int _1424 = _1422 + 1;
    int _1426 = _1424 + 1;
    int _1428 = _329 * _1408;
    int _1430 = _1428 + _780;
    float _1432 = fma(_1336, 2.0, -1.0);
    bool _1434 = 1.0 != (*spvDescriptorSet0.vp_c12)._m0[10].x;
    bool _1436 = isnan(1.0);
    bool _1438 = _1434 || _1436;
    bool _1440 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].x);
    bool _1442 = _1438 || _1440;
    float _1444 = fma(_1416, 2.0, -1.0);
    float _1446 = _1284 * 6.283185482025146484375;
    float _1448 = cos(_1446);
    int _1450 = _1420 * _1426;
    bool _1452 = !_756;
    int _1454 = _1452 ? _1430 : (-1);
    float _1456 = _1324 * _1384;
    float _1458 = _1350 * _1384;
    int _1460 = _1454 * _1390;
    int _1462 = _1460 + _1450;
    float _1464 = _1284 * 6.283185482025146484375;
    float _1466 = sin(_1464);
    float _1468 = _1350 * _1412;
    float _1470 = _1324 * _1412;
    float _1472 = _1432 * (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _1474 = float(_1462);
    float _1476 = _1472 * (*spvDescriptorSet0.vp_c12)._m0[3].y;
    float _1478 = _1324 * _1448;
    float _1480 = _1412 * _1448;
    float _1482 = _1350 * _1448;
    float _1484 = _1384 * _1448;
    out.m_78.x = _1474;
    float _1486 = fma(_1466, _1468, _1456);
    float _1488 = fma(_1466, _1456, _1468);
    float _1490 = -_1458;
    float _1492 = fma(_1466, _1470, _1490);
    float _1494 = -_1470;
    float _1496 = fma(_1466, _1458, _1494);
    float _1498 = _1472 * (*spvDescriptorSet0.vp_c12)._m0[3].x;
    float _1500 = _1402 * (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _1502 = _1472 * (*spvDescriptorSet0.vp_c12)._m0[3].z;
    float _1504 = fma(_1500, (*spvDescriptorSet0.vp_c12)._m0[2].x, _1498);
    float _1506 = fma(_1500, (*spvDescriptorSet0.vp_c12)._m0[2].z, _1502);
    float _1508 = -_758;
    float _1510 = _1466 * _1508;
    float _1512 = fma(_1500, (*spvDescriptorSet0.vp_c12)._m0[2].y, _1476);
    float _1514 = _1482 * _758;
    float _1516 = _1444 * (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _1518 = fma(_1480, _692, _1510);
    float _1520 = _1478 * _758;
    float _1522 = fma(_1486, _692, _1514);
    float _1524 = fma(_1516, (*spvDescriptorSet0.vp_c12)._m0[4].x, _1504);
    float _1526 = fma(_1516, (*spvDescriptorSet0.vp_c12)._m0[4].y, _1512);
    float _1528 = fma(_1516, (*spvDescriptorSet0.vp_c12)._m0[4].z, _1506);
    float _1530 = fma(_1492, _692, _1520);
    float _1532 = _1524 + (*spvDescriptorSet0.vp_c12)._m0[5].x;
    float _1534 = _1526 + (*spvDescriptorSet0.vp_c12)._m0[5].y;
    float _1536 = _1528 + (*spvDescriptorSet0.vp_c12)._m0[5].z;
    float _1538 = _1336;
    float _1540 = _1336;
    float _1542 = _1402;
    float _1544 = _1432;
    float _1546 = _1444;
    float _1548 = _1534;
    float _1556;
    if (!_1442)
    {
        bool _1550 = _1534 > (*spvDescriptorSet0.vp_c12)._m0[10].y;
        bool _1552 = !_1550;
        _1554 = _1552;
        if (!_1554)
        {
            _1556 = 0.0;
            _1558 = true;
        }
    }
    if ((!_1558) || _1554)
    {
        bool _1582;
        if (!_1554)
        {
            bool _1560 = _1534 >= (*spvDescriptorSet0.vp_c12)._m0[10].y;
            bool _1562 = isnan(_1534);
            bool _1564 = _1560 || _1562;
            bool _1566 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].y);
            bool _1568 = _1564 || _1566;
            bool _1570 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _1572 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _1574 = !_1568;
            bool _1576 = _1572 && _1574;
            _710 = (*spvDescriptorSet0.vp_c12)._m0[10].x;
            if (_1576)
            {
                _1538 = 0.0;
            }
            float _1578 = _1538;
            bool _1580 = !_1568;
            _1582 = _1580 && _1570;
            _1540 = _1578;
            _1556 = _1578;
        }
        if ((!_1582) || _1554)
        {
            _1554 = false;
            float _1584 = _1540;
            float _1586 = _710;
            bool _1588 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].x;
            bool _1590 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].y;
            bool _1592 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].z;
            float _1594 = _1584;
            float _1596 = _1586;
            if (_1588)
            {
                float _1598 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].x;
                _1594 = _1598;
            }
            float _1600 = _1594;
            if (_1588)
            {
                float _1602 = abs(_1402);
                float _1604 = -_1602;
                float _1606 = _1604 + 1.0;
                _1542 = _1606;
            }
            float _1608 = _1542;
            if (_1590)
            {
                float _1610 = abs(_1432);
                float _1612 = -_1610;
                float _1614 = _1612 + 1.0;
                _1544 = _1614;
            }
            float _1616 = _1544;
            if (!_1588)
            {
                _986 = 1.0;
            }
            float _1618 = _986;
            float _1620 = _1618;
            if (_1592)
            {
                float _1622 = abs(_1444);
                float _1624 = -_1622;
                float _1626 = _1624 + 1.0;
                _1546 = _1626;
            }
            float _1628 = _1546;
            if (!_1590)
            {
                _1596 = 1.0;
            }
            float _1630 = _1596;
            float _1632 = as_type<float>(_329);
            float _1634 = _1630;
            if (_1590)
            {
                float _1636 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].y;
                _1632 = _1636;
            }
            float _1638 = _1632;
            float _1640 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
            if (_1592)
            {
                float _1642 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].z;
                _1640 = _1642;
            }
            float _1644 = _1640;
            float _1646 = _1600;
            if (_1588)
            {
                float _1648 = _1608 * _1600;
                float _1650 = precise::clamp(_1648, 0.0, 1.0);
                _1620 = _1650;
            }
            float _1652 = _1620;
            if (!_1592)
            {
                _1646 = 1.0;
            }
            float _1654 = _1646;
            float _1656 = _1654;
            if (_1590)
            {
                float _1658 = _1616 * _1638;
                float _1660 = precise::clamp(_1658, 0.0, 1.0);
                _1634 = _1660;
            }
            float _1662 = _1634;
            float _1664 = _1652 * _1662;
            if (_1592)
            {
                float _1666 = _1628 * _1644;
                float _1668 = precise::clamp(_1666, 0.0, 1.0);
                _1656 = _1668;
            }
            float _1670 = _1656;
            float _1672 = _1664 * _1670;
            _1556 = _1672;
        }
    }
    _1558 = false;
    float _1674 = _1556;
    float _1676 = -_1534;
    float _1678 = _1676 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1680 = -_1532;
    float _1682 = _1680 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1684 = -_1536;
    float _1686 = _1684 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1688 = _1678 * _1678;
    float _1690 = fma(_1682, _1682, _1688);
    float _1692 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _1694 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1696 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1698 = fma(_1686, _1686, _1690);
    float _1700 = -_1692;
    float _1702 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1700);
    float _1704 = -_1696;
    float _1706 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1704);
    float _1708 = rsqrt(_1698);
    float _1710 = -_1694;
    float _1712 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _1710);
    float _1714 = _1712 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1716 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1718 = -_1714;
    float _1720 = fma(_1702, (*spvDescriptorSet0.vp_c8)._m0[1].y, _1718);
    float _1722 = -_1716;
    float _1724 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _1722);
    float _1726 = _1682 * _1708;
    float _1728 = _1686 * _1708;
    float _1730 = _1678 * _1708;
    float _1732 = _1706 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1734 = _1726 * _1726;
    float _1736 = fma(_1728, _1728, _1734);
    float _1738 = rsqrt(_1736);
    float _1740 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1742 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1744 = -_1740;
    float _1746 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1744);
    float _1748 = _1706 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1750 = -_1742;
    float _1752 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1750);
    float _1754 = -_1732;
    float _1756 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1754);
    float _1758 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1720);
    float _1760 = -_1748;
    float _1762 = fma(_1702, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1760);
    float _1764 = fma(_1724, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1756);
    float _1766 = fma(_1752, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1762);
    float _1768 = _1728 * _1738;
    float _1770 = _1726 * _1738;
    float _1772 = _1766 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1774 = -_1768;
    float _1776 = _1728 * _1774;
    float _1778 = -_1768;
    float _1780 = _1730 * _1778;
    float _1782 = -_1772;
    float _1784 = fma(_1758, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1782);
    float _1786 = -_1776;
    float _1788 = fma(_1726, _1770, _1786);
    float _1790 = _1730 * _1770;
    float _1792 = _1752 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1794 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1784);
    float _1796 = _1788 * _1788;
    float _1798 = fma(_1790, _1790, _1796);
    float _1800 = -_1792;
    float _1802 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1800);
    float _1804 = _1706 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _1806 = fma(_1780, _1780, _1798);
    float _1808 = fma(_1724, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1802);
    float _1810 = -_1804;
    float _1812 = fma(_1702, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1810);
    float _1814 = _1712 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _1816 = -_1808;
    float _1818 = fma(_1816, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1794);
    float _1820 = rsqrt(_1806);
    float _1822 = fma(_1752, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1812);
    float _1824 = _1706 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1826 = -_1814;
    float _1828 = fma(_1702, (*spvDescriptorSet0.vp_c8)._m0[0].y, _1826);
    float _1830 = _1534 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1832 = -_1824;
    float _1834 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1832);
    float _1836 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1828);
    float _1838 = 1.0 / _1818;
    float _1840 = fma(_1532, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1830);
    float _1842 = fma(_1724, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1834);
    float _1844 = fma(_1536, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1840);
    float _1846 = _1788 * _1820;
    float _1848 = precise::clamp(_1846, 0.0, 1.0);
    float _1850 = -_1848;
    float _1852 = _1850 + 1.0;
    float _1854 = fma(_1822, _1838, -1.0);
    float _1856 = _1852 * _1838;
    float _1858 = fma(_1852, _1854, 1.0);
    float _1860 = _1836 * _1856;
    float _1862 = _1842 * _1856;
    float _1864 = _1858 * _1858;
    float _1866 = fma(_1860, _1860, _1864);
    float _1868 = fma(_1862, _1862, _1866);
    float _1870 = rsqrt(_1868);
    float _1872 = _1862 * _1870;
    float _1874 = _1860 * _1870;
    float _1876 = _1858 * _1870;
    float _1878 = -_1872;
    float _1880 = _1726 * _1878;
    float _1882 = _1728 * _1876;
    float _1884 = -_1874;
    float _1886 = -_1880;
    float _1888 = fma(_1728, _1884, _1886);
    float _1890 = -_1874;
    float _1892 = _1730 * _1890;
    float _1894 = -_1872;
    float _1896 = -_1882;
    float _1898 = fma(_1730, _1894, _1896);
    float _1900 = _1888 * _1888;
    float _1902 = -_1892;
    float _1904 = fma(_1726, _1876, _1902);
    float _1906 = fma(_1898, _1898, _1900);
    float _1908 = fma(_1904, _1904, _1906);
    float _1910 = rsqrt(_1908);
    float _1912 = _1898 * _1910;
    float _1914 = _1904 * _1910;
    float _1916 = _1888 * _1910;
    float _1918 = _1728 * _1912;
    float _1920 = _1730 * _1914;
    float _1922 = -_1918;
    float _1924 = fma(_1726, _1914, _1922);
    float _1926 = _1726 * _1916;
    float _1928 = -_1920;
    float _1930 = fma(_1728, _1916, _1928);
    float _1932 = _1924 * _1924;
    float _1934 = -_1926;
    float _1936 = fma(_1730, _1912, _1934);
    float _1938 = fma(_1930, _1930, _1932);
    float _1940 = fma(_1936, _1936, _1938);
    float _1942 = rsqrt(_1940);
    float _1944 = _1936 * _1942;
    float _1946 = _1924 * _1942;
    float _1948 = _1930 * _1942;
    float _1950 = _1726 * _1944;
    float _1952 = _1728 * _1946;
    float _1954 = _1522 * _1944;
    float _1956 = -_1950;
    float _1958 = fma(_1728, _1948, _1956);
    float _1960 = _1730 * _1948;
    float _1962 = -_1952;
    float _1964 = fma(_1730, _1944, _1962);
    float _1966 = _1958 * _1958;
    float _1968 = -_1960;
    float _1970 = fma(_1726, _1946, _1968);
    float _1972 = fma(_1964, _1964, _1966);
    float _1974 = fma(_1970, _1970, _1972);
    float _1976 = rsqrt(_1974);
    float _1978 = _1970 * _1976;
    float _1980 = _1522 * _1948;
    float _1982 = _1964 * _1976;
    float _1984 = _1958 * _1976;
    float _1986 = fma(_1518, _1978, _1954);
    float _1988 = _1522 * _1946;
    float _1990 = fma(_1518, _1982, _1980);
    float _1992 = fma(_1530, _1728, _1986);
    float _1994 = fma(_1518, _1984, _1988);
    float _1996 = fma(_1530, _1726, _1990);
    float _1998 = _1844 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2000 = _1536 + _1992;
    float _2002 = _1534 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2004 = _1532 + _1996;
    float _2006 = 1.0 / _1998;
    float _2008 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2010 = _2000 + _2008;
    float _2012 = fma(_1532, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2002);
    float _2014 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2016 = _2004 + _2014;
    float _2018 = fma(_1530, _1730, _1994);
    float _2020 = _2010 * _2010;
    float _2022 = fma(_1536, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2012);
    float _2024 = _1534 + _2018;
    float _2026 = fma(_2016, _2016, _2020);
    float _2028 = _2022 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _2030 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2032 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2034 = _2030 || _2032;
    bool _2036 = isnan(0.5);
    bool _2038 = _2034 || _2036;
    float _2040 = sqrt(_2026);
    float _2042 = _2028 + _1998;
    bool _2044 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2046 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2048 = _2044 || _2046;
    bool _2050 = isnan(0.5);
    bool _2052 = _2048 || _2050;
    float _2054 = _2042 * _2006;
    float _2056 = _2054 * 0.5;
    float _2058 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2060 = fma(_2056, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2058);
    float _2062 = 1.0 / _2060;
    bool _2064 = _2040 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2066 = _2006;
    float _2068 = _1998;
    float _2070 = _2000;
    float _2072 = _2018;
    float _2074 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _2076 = _2004;
    float _2078 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    if (!_2064)
    {
        _2066 = _2000;
    }
    float _2080 = _2066;
    float _2082 = _2080;
    if (!_2064)
    {
        _2068 = _2004;
    }
    float _2084 = _2068;
    float _2086 = _2084;
    if (!_2064)
    {
        _2070 = _2024;
    }
    float _2088 = _2070;
    bool _2090 = !_2064;
    float _2092 = _2088;
    if (!_2090)
    {
        float _2094 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2096 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2098 = _2040 + _2096;
        float _2100 = _2024 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2102 = rsqrt(_2026);
        float _2104 = _2098 * _2094;
        float _2106 = _2104 * 0.15915493667125701904296875;
        float _2108 = _2106 * 6.283185482025146484375;
        float _2110 = cos(_2108);
        float _2112 = _2106 * 6.283185482025146484375;
        float _2114 = sin(_2112);
        float _2116 = _2110 + (-1.0);
        float _2118 = _2116 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2120 = fma(_2114, _2100, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2122 = fma(_2024, _2110, _2118);
        float _2124 = _2102 * _2120;
        float _2126 = fma(_2016, _2124, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2128 = fma(_2010, _2124, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2092 = _2122;
        _2082 = _2128;
        _2086 = _2126;
        _2072 = _2118;
        _2074 = _2102;
    }
    float _2130 = _2092;
    float _2132 = _2082;
    float _2134 = _2086;
    float _2136 = _2072;
    float _2138 = _2074;
    float _2140 = _2136;
    float _2142 = _2130;
    float _2144 = _2134;
    float _2146 = _2132;
    float _2148 = _2138;
    if (_2052)
    {
        _2076 = 1.0;
    }
    float _2150 = _2076;
    float _2152 = _2150;
    if (!_2038)
    {
        float _2154 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2156 = _1534 + _2154;
        float _2158 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2160 = _1532 + _2158;
        float _2162 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2164 = -_1534;
        float _2166 = _2164 + _2130;
        float _2168 = _2156 * _2156;
        float _2170 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2172 = _1536 + _2170;
        float _2174 = fma(_2160, _2160, _2168);
        float _2176 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2178 = fma(_2172, _2172, _2174);
        float _2180 = sqrt(_2178);
        float _2182 = _2162 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2184 = precise::min(_2180, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2186 = _2184 * _2176;
        float _2188 = -_1536;
        float _2190 = _2188 + _2132;
        float _2192 = _2182 * _2186;
        float _2194 = -_1532;
        float _2196 = _2194 + _2134;
        float _2198 = fma(_2166, _2192, _1534);
        float _2200 = fma(_2196, _2192, _1532);
        float _2202 = fma(_2190, _2192, _1536);
        _2140 = _2166;
        _2142 = _2198;
        _2144 = _2200;
        _2146 = _2202;
    }
    float _2204 = _2140;
    float _2206 = _2142;
    float _2208 = _2144;
    float _2210 = _2146;
    float _2212 = _2204;
    if (_2052)
    {
        _2078 = 1.0;
    }
    float _2214 = _2078;
    float _2216 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2218 = _2062 * _2216;
    float _2220 = _2214;
    if (!_2052)
    {
        float _2222 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2224 = _2222 * 0.15915493667125701904296875;
        float _2226 = _2224 * 6.283185482025146484375;
        float _2228 = cos(_2226);
        float _2230 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2232 = _2230 * 0.15915493667125701904296875;
        float _2234 = _2224 * 6.283185482025146484375;
        float _2236 = sin(_2234);
        float _2238 = 1.0 / _2228;
        float _2240 = _2232 * 6.283185482025146484375;
        float _2242 = cos(_2240);
        float _2244 = _2236 * _2238;
        float _2246 = _2232 * 6.283185482025146484375;
        float _2248 = sin(_2246);
        float _2250 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2252 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2250;
        float _2254 = _2242 * _2244;
        float _2256 = 1.0 / _2254;
        float _2258 = 1.0 / _2252;
        float _2260 = _2248 * _2256;
        float _2262 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2264 = fma(_2218, _2260, _2262);
        float _2266 = _2264 * _2258;
        float _2268 = precise::clamp(_2266, 0.0, 1.0);
        _2212 = _2264;
        _1548 = _2232;
        _2148 = _2224;
        _2152 = _2268;
    }
    float _2270 = _2212;
    float _2272 = _1548;
    float _2274 = _2148;
    float _2276 = _2152;
    float _2278 = _2272;
    float _2280 = _2270;
    float _2282 = _2274;
    if (!_2052)
    {
        float _2284 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2286 = _2284 * 0.15915493667125701904296875;
        float _2288 = _2286 * 6.283185482025146484375;
        float _2290 = cos(_2288);
        float _2292 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2294 = _2292 * 0.15915493667125701904296875;
        float _2296 = _2286 * 6.283185482025146484375;
        float _2298 = sin(_2296);
        float _2300 = 1.0 / _2290;
        float _2302 = _2294 * 6.283185482025146484375;
        float _2304 = cos(_2302);
        float _2306 = _2298 * _2300;
        float _2308 = _2294 * 6.283185482025146484375;
        float _2310 = sin(_2308);
        float _2312 = _2304 * _2306;
        float _2314 = 1.0 / _2312;
        float _2316 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2318 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2316;
        float _2320 = 1.0 / _2318;
        float _2322 = _2310 * _2314;
        float _2324 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2326 = fma(_2218, _2322, _2324);
        float _2328 = _2326 * _2320;
        float _2330 = precise::clamp(_2328, 0.0, 1.0);
        float _2332 = -_2330;
        float _2334 = _2332 + 1.0;
        _2278 = _2298;
        _2280 = _2300;
        _2220 = _2334;
    }
    float _2336 = _2278;
    float _2338 = _2280;
    float _2340 = _2220;
    float _2342 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2344 = _2206 + _2342;
    float _2346 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2348 = _2208 + _2346;
    float _2350 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2352 = _2210 + _2350;
    float _2354 = _2344 * _2344;
    float _2356 = fma(_2348, _2348, _2354);
    float _2358 = fma(_2352, _2352, _2356);
    float _2360 = rsqrt(_2358);
    float _2362 = sqrt(_2358);
    float _2364 = _2360 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2366 = _2348 * _2364;
    float _2368 = _2352 * _2364;
    float _2370 = _2366 * _2366;
    float _2372 = _2368 * _2368;
    float _2374 = _2370 + _2372;
    float _2376 = sqrt(_2374);
    bool _2378 = _2376 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2380 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2382 = _2376 + _2380;
    float _2384 = _2360;
    float _2386 = _2338;
    float _2388 = _2382;
    float _2390 = _2364;
    float _2392 = _2374;
    if (_2378)
    {
        float _2394 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2384 = _2394;
    }
    float _2396 = _2384;
    if (_2378)
    {
        float _2398 = rsqrt(_2374);
        _2386 = _2398;
    }
    float _2400 = _2386;
    float _2402 = _2400;
    if (_2378)
    {
        float _2404 = _2382 * _2396;
        _2388 = _2404;
    }
    float _2406 = _2388;
    if (_2378)
    {
        float _2408 = _2406 * 0.15915493667125701904296875;
        _2282 = _2408;
    }
    float _2410 = _2282;
    float _2412 = _2336;
    if (_2378)
    {
        float _2414 = _2410 * 6.283185482025146484375;
        float _2416 = sin(_2414);
        _2412 = _2416;
    }
    float _2418 = _2412;
    float _2420 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2422 = precise::max(0.0, _2420);
    float _2424 = _2352;
    float _2426 = _2422;
    if (_2378)
    {
        float _2428 = _2410 * 6.283185482025146484375;
        float _2430 = cos(_2428);
        _2424 = _2430;
    }
    float _2432 = _2424;
    float _2434 = -_2364;
    float _2436 = -_2422;
    float _2438 = fma(_2344, _2434, _2436);
    float _2440 = fma(_1532, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2442 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    float _2444 = _2438;
    if (_2378)
    {
        float _2446 = _2438 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2426 = _2446;
    }
    float _2448 = _2426;
    float _2450 = _2206 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2452 = _2418;
    float _2454 = _2448;
    if (_2378)
    {
        float _2456 = fma(_2418, _2448, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2452 = _2456;
    }
    float _2458 = _2452;
    float _2460 = _2458;
    if (!_2378)
    {
        _2454 = _2370;
    }
    float _2462 = _2454;
    float _2464 = fma(_2208, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2450);
    float _2466 = _2462;
    float _2468 = _2432;
    if (_2378)
    {
        float _2470 = _2432 + (-1.0);
        _2442 = _2470;
    }
    float _2472 = _2442;
    if (_2378)
    {
        float _2474 = _2400 * _2458;
        _2390 = _2474;
    }
    float _2476 = _2390;
    if (!_2378)
    {
        _2402 = _2366;
    }
    float _2478 = _2402;
    float _2480 = fma(_2210, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2464);
    float _2482 = _2478;
    if (_2378)
    {
        float _2484 = _2472 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2392 = _2484;
    }
    float _2486 = _2392;
    if (_2378)
    {
        float _2488 = _2366 * _2476;
        _2482 = _2488;
    }
    float _2490 = _2482;
    if (!_2378)
    {
        _2460 = _2368;
    }
    float _2492 = _2460;
    float _2494 = _2492;
    if (_2378)
    {
        float _2496 = _2368 * _2476;
        _2494 = _2496;
    }
    float _2498 = _2494;
    if (_2378)
    {
        float _2500 = fma(_2438, _2432, _2486);
        _2444 = _2500;
    }
    float _2502 = _2444;
    if (_2378)
    {
        float _2504 = _2490 * _2490;
        _2466 = _2504;
    }
    float _2506 = _2466;
    if (!_2378)
    {
        _2468 = _2372;
    }
    float _2508 = _2468;
    float _2510 = _2508;
    if (_2378)
    {
        float _2512 = _2498 * _2498;
        _2510 = _2512;
    }
    float _2514 = _2510;
    float _2516 = fma(_2502, _2502, _2506);
    float _2518 = _2480 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2520 = floor(_2440);
    float _2522 = _2516 + _2514;
    float _2524 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2526 = fma(_2362, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2524);
    float _2528 = precise::clamp(_2526, 0.0, 1.0);
    float _2530 = _2206 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2532 = rsqrt(_2522);
    float _2534 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2536 = _2518 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2538 = -_2528;
    float _2540 = _2538 + 1.0;
    float _2542 = -_2536;
    float _2544 = fma(_2542, _2534, 1.0);
    float _2546 = _2206 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2548 = -_2520;
    float _2550 = _2440 + _2548;
    float _2552 = _2206 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2554 = abs(_2540);
    float _2556 = log2(_2554);
    float _2558 = fma(_1536, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2560 = fma(_2208, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2546);
    float _2562 = fma(_2208, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2552);
    float _2564 = _2532 * _2490;
    float _2566 = fma(_2210, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2562);
    float _2568 = _2532 * _2502;
    float _2570 = fma(_2208, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2530);
    float _2572 = _2564 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2574 = fma(_2210, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2560);
    float _2576 = _2566 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2578 = _2532 * _2498;
    float _2580 = -_2572;
    float _2582 = fma(_2568, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2580);
    float _2584 = _2574 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2586 = _2576 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2588 = fma(_2210, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2570);
    float _2590 = -_2578;
    float _2592 = fma(_2590, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2582);
    float _2594 = floor(_2558);
    float _2596 = fma(_2584, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2586);
    float _2598 = _2556 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2600 = _2588 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2602 = fma(_2592, -0.5, 0.5);
    float _2604 = fma(_2518, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2596);
    float _2606 = _2576 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2608 = fma(_2592, 0.5, 0.5);
    float _2610 = exp2(_2598);
    float _2612 = fma(_2600, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2604);
    float _2614 = fma(_2584, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2606);
    float _2616 = _2568 + 1.0;
    float _2618 = fma(_2518, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2614);
    float _2620 = log2(_2544);
    float _2622 = -_2594;
    float _2624 = _2558 + _2622;
    float _2626 = fma(_2608, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2628 = 1.0 / _2612;
    float _2630 = _2576 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2632 = -_2568;
    float _2634 = fma(_2610, _2616, _2632);
    float _2636 = fma(_2600, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2618);
    float _2638 = fma(_2608, _2626, -0.212114393711090087890625);
    float _2640 = fma(_2584, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2630);
    float _2642 = sqrt(_2602);
    float _2644 = fma(_2518, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2640);
    float2 _7153 = float2(_2550, _2624);
    float _2646 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7153, float2(0.0), isnan(_7153)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7153, float2(0.0), isnan(_7153)), level(0.0)).x;
    float _2648 = _2620 * 0.693147182464599609375;
    float _2650 = fma(_2608, _2638, 1.570728778839111328125);
    float _2652 = fma(_2600, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2644);
    float _2654 = fma(_2634, 0.5, 0.5);
    float _2656 = _2648 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2658 = _2636 * _2628;
    float _2660 = _2652 * _2628;
    float _2662 = fma(_2658, 0.5, 0.5);
    float _2664 = fma(_2660, -0.5, 0.5);
    float _2666 = _2642 * 0.636619746685028076171875;
    float _2668 = -_2650;
    float _2670 = fma(_2666, _2668, 1.0);
    float3 _7200 = float3(_2662, _2664, _2656);
    float _2672 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7200, float3(0.0), isnan(_7200)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7200, float3(0.0), isnan(_7200)), level(0.0)).x;
    float3 _7211 = float3(_2662, _2664, _2656);
    float4 _2675 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7211, float3(0.0), isnan(_7211)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7211, float3(0.0), isnan(_7211)), level(0.0)).xyzw;
    float _2677 = _2675.x;
    float _2679 = _2675.y;
    float _2681 = _2675.z;
    float _2683 = _2675.w;
    float2 _7227 = float2(_2670, _2654);
    float3 _2687 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7227, float2(0.0), isnan(_7227)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7227, float2(0.0), isnan(_7227)), level(0.0)).xyz;
    float _2689 = _2687.x;
    float _2691 = _2687.y;
    float _2693 = _2687.z;
    float _2695 = abs(_2218);
    float _2697 = log2(_2695);
    float _2699 = _1482 * _1944;
    float _2701 = _2576 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2703 = _2362 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2705 = isnan(_2362);
    bool _2707 = _2703 || _2705;
    bool _2709 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2711 = _2707 || _2709;
    float _2713 = -_1466;
    float _2715 = fma(_2713, _1978, _2699);
    float _2717 = fma(_2584, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2701);
    float _2719 = _1482 * _1946;
    bool _2721 = _2218 <= 8000.0;
    bool _2723 = isnan(_2218);
    bool _2725 = _2721 || _2723;
    bool _2727 = isnan(8000.0);
    bool _2729 = _2725 || _2727;
    float _2731 = float(_2729);
    float _2733 = fma(_1478, _1728, _2715);
    float _2735 = fma(_2518, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2717);
    float _2737 = -_1466;
    float _2739 = fma(_2737, _1984, _2719);
    float _2741 = in.m_80.x;
    float _2743 = _2697 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2745 = fma(_1478, _1730, _2739);
    float _2747 = exp2(_2743);
    float _2749 = fma(_2747, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2751 = precise::clamp(_2749, 0.0, 1.0);
    float _2753 = _1486 * _1946;
    float _2755 = _1496 * _1946;
    float _2757 = fma(_2751, -2.0, 3.0);
    float _2759 = _2751 * _2751;
    float _2761 = fma(_1484, _1984, _2755);
    float _2763 = _2759 * _2757;
    float _2765 = fma(_1488, _1730, _2761);
    float _2767 = -_2763;
    float _2769 = _2767 + 1.0;
    float _2771 = fma(_2769, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2763);
    float _2773 = _1482 * _1948;
    float _2775 = _1496 * _1948;
    float _2777 = _1496 * _1944;
    float _2779 = _2731 * _2771;
    float _2781 = -_1466;
    float _2783 = fma(_2781, _1982, _2773);
    float _2785 = _2556 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2787 = _1486 * _1948;
    float _2789 = fma(_1480, _1984, _2753);
    float _2791 = fma(_1478, _1726, _2783);
    float _2793 = _1486 * _1944;
    float _2795 = fma(_1480, _1982, _2787);
    float _2797 = exp2(_2785);
    float _2799 = fma(_1484, _1982, _2775);
    float _2801 = _768 * _2791;
    float _2803 = fma(_1492, _1726, _2795);
    float _2805 = fma(_1492, _1730, _2789);
    float _2807 = _768 * _2745;
    float _2809 = fma(_1480, _1978, _2793);
    float _2811 = fma(_1488, _1726, _2799);
    float _2813 = fma(_742, _2803, _2801);
    float _2815 = fma(_742, _2805, _2807);
    float _2817 = fma(_1492, _1728, _2809);
    float _2819 = _768 * _2733;
    float _2821 = _2811 + _2813;
    float _2823 = fma(_1484, _1978, _2777);
    float _2825 = _2765 + _2815;
    float _2827 = _2779 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2829 = fma(_742, _2817, _2819);
    float _2831 = -_2797;
    float _2833 = _2831 + 1.0;
    float _2835 = fma(_1488, _1728, _2823);
    float _2837 = fma(_2600, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2735);
    float _2839 = _2833 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2841 = _2636 + _2612;
    float _2843 = _2612 * 0.5;
    float _2845 = _2837 + _2612;
    out.gl_Position.x = _2636;
    out.gl_Position.y = _2652;
    out.gl_Position.z = _2837;
    out.gl_Position.w = _2612;
    float _2847 = fma(_2652, -0.5, _2843);
    float _2849 = _2845 * 0.5;
    float _2851 = _2841 * 0.5;
    float _2853 = _2835 + _2829;
    out.m_82.x = _2851;
    out.m_82.y = _2847;
    out.m_82.z = _2849;
    out.m_82.w = _2612;
    out.m_84.x = _2821;
    out.m_84.y = _2825;
    out.m_84.z = _2853;
    float _2855 = _2612;
    float _2857 = _2837;
    if (!_2711)
    {
        _2855 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2859 = _2855;
    float _2861 = _2859;
    float _2863 = _2859;
    if (!_2711)
    {
        _2857 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2865 = _2857;
    float _2867 = -_2646;
    float _2869 = _2867 + 1.0;
    float _2871 = _2869 * _2827;
    float _2873 = precise::clamp(_2871, 0.0, 1.0);
    float _2875 = -_2873;
    float _2877 = fma(_2875, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2879 = _2877 * _2741;
    float _2881 = _2839 * _2672;
    float _2883 = -_2839;
    float _2885 = _2883 + 1.0;
    float _2887 = _2683 * _2881;
    float _2889 = _2693 * _2881;
    float _2891 = _2879 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2893 = _2683 * _2885;
    float _2895 = fma(_2689, _2887, _2677);
    float _2897 = fma(_2691, _2887, _2679);
    float _2899 = fma(_2683, _2889, _2681);
    float _2901 = _2276 * _2340;
    out.m_86.x = _2891;
    float _2903 = _2679;
    float _2905 = _2677;
    float _2907 = _2891;
    float _2909 = _2865;
    float _2911 = _2865;
    if (!_2711)
    {
        _2903 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2913 = _2903;
    float _2915 = _2901 * _1674;
    out.m_88.x = _2895;
    out.m_88.y = _2897;
    out.m_88.z = _2899;
    out.m_88.w = _2893;
    float _2917 = _2915;
    float _2919 = _2913;
    float _2921 = _2913;
    if (!_2711)
    {
        _2905 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2923 = _2905;
    float _2925 = _2915 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2927 = _2923;
    float _2929 = _2923;
    if (!_2711)
    {
        _2917 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2931 = _2917;
    float _2933 = _2931;
    float _2935 = _2931;
    if (!_2711)
    {
        _2907 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2937 = _2907;
    bool _2939 = !_2711;
    float _2941 = _2937;
    float _2943 = _2937;
    if (!_2939)
    {
        bool _2945 = _2362 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2947 = isnan(_2362);
        bool _2949 = _2945 || _2947;
        bool _2951 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2953 = _2949 || _2951;
        if (!_2953)
        {
            float _2955 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2957 = _2362 + _2955;
            float _2959 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2961 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2959;
            float _2963 = 1.0 / _2961;
            float _2965 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2967 = _2965 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2969 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2971 = _2969 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2973 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2975 = _2973 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2977 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2979 = _2977 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2981 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2983 = _2981 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2985 = _2957 * _2963;
            float _2987 = precise::clamp(_2985, 0.0, 1.0);
            float _2989 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2991 = _2989 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2993 = fma(_2987, _2967, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2995 = fma(_2987, _2991, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2997 = fma(_2987, _2971, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2999 = fma(_2987, _2975, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3001 = fma(_2987, _2979, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3003 = fma(_2987, _2983, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2929 = _2995;
            _2935 = _3001;
            _2921 = _2993;
            _2911 = _2999;
            _2863 = _2997;
            _2943 = _3003;
            _3005 = true;
        }
        else
        {
            bool _3007 = _2362 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3009 = isnan(_2362);
            bool _3011 = _3007 || _3009;
            bool _3013 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3015 = _3011 || _3013;
            if (!_3015)
            {
                _2919 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3017 = _2919;
            _2921 = _3017;
            if (!_3015)
            {
                _2927 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3019 = _2927;
            _2929 = _3019;
            if (!_3015)
            {
                _2861 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3021 = _2861;
            _2863 = _3021;
            if (!_3015)
            {
                _2909 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3023 = _2909;
            _2911 = _3023;
            if (!_3015)
            {
                _2933 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3025 = _2933;
            _2935 = _3025;
            if (!_3015)
            {
                _2941 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3027 = _2941;
            bool _3029 = !_3015;
            _2943 = _3027;
            if (!_3029)
            {
                bool _3031 = _2362 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3033 = isnan(_2362);
                bool _3035 = _3031 || _3033;
                bool _3037 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3039 = _3035 || _3037;
                if (!_3039)
                {
                    float _3041 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3043 = _2362 + _3041;
                    float _3045 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3047 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3045;
                    float _3049 = 1.0 / _3047;
                    float _3051 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3053 = _3051 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3055 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3057 = _3055 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3059 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3061 = _3059 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3063 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3065 = _3063 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3067 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3069 = _3067 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3071 = _3043 * _3049;
                    float _3073 = precise::clamp(_3071, 0.0, 1.0);
                    float _3075 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3077 = _3075 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3079 = fma(_3073, _3053, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3081 = fma(_3073, _3077, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3083 = fma(_3073, _3057, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3085 = fma(_3073, _3061, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3087 = fma(_3073, _3065, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3089 = fma(_3073, _3069, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2929 = _3081;
                    _2935 = _3087;
                    _2921 = _3079;
                    _2911 = _3085;
                    _2863 = _3083;
                    _2943 = _3089;
                    _3005 = true;
                }
                else
                {
                    _2929 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2935 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2921 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2911 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2863 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2943 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3005 = false;
    float _3091 = _2929;
    float _3093 = _2935;
    float _3095 = _2921;
    float _3097 = _2911;
    float _3099 = _2863;
    float _3101 = _2943;
    float _3103 = fma(_2825, -0.5, 0.5);
    float _3105 = precise::clamp(_3103, 0.0, 1.0);
    float _3107 = -_3091;
    float _3109 = _3107 + _3093;
    float _3111 = -_3095;
    float _3113 = _3111 + _3097;
    out.m_90.x = 0.0;
    float _3115 = fma(_3105, _3109, _3091);
    float _3117 = -_3099;
    float _3119 = _3117 + _3101;
    float _3121 = fma(_3105, _3113, _3095);
    float _3123 = _3115 * 0.586610972881317138671875;
    bool _3125 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3127 = fma(_3105, _3119, _3099);
    float _3129 = _2925 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3131 = fma(_3121, 0.298911988735198974609375, _3123);
    bool _3133 = _2276 > 0.0;
    bool _3135 = isnan(_2276);
    bool _3137 = _3133 || _3135;
    bool _3139 = isnan(0.0);
    bool _3141 = _3137 || _3139;
    float _3143 = fma(_3127, 0.114477999508380889892578125, _3131);
    out.m_55.x = _3129;
    bool _3145 = _2340 <= 0.0;
    bool _3147 = !_3141;
    bool _3149 = _3145 || _3147;
    float _3151 = -_3143;
    float _3153 = _3121 + _3151;
    float _3155 = -_3143;
    float _3157 = _3115 + _3155;
    float _3159 = -_3143;
    float _3161 = _3127 + _3159;
    float _3163 = fma(_3153, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3143);
    float _3165 = fma(_3157, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3143);
    float _3167 = fma(_3161, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3143);
    bool _3169 = !_3125;
    if (!_3169)
    {
        float _3171 = -_2206;
        float _3173 = _3171 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3175 = -_2208;
        float _3177 = _3175 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3179 = -_2210;
        float _3181 = _3179 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3183 = _3173 * _3173;
        float _3185 = fma(_3177, _3177, _3183);
        float _3187 = fma(_3181, _3181, _3185);
        float _3189 = sqrt(_3187);
        float _3191 = rsqrt(_3187);
        float _3193 = -_3189;
        float _3195 = _3193 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3197 = _3195 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3199 = precise::clamp(_3197, 0.0, 1.0);
        float _3201 = _3177 * _3191;
        float _3203 = _3173 * _3191;
        float _3205 = abs(_3199);
        float _3207 = log2(_3205);
        float _3209 = _3181 * _3191;
        float _3211 = _3201 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3213 = _2825 * _3203;
        float _3215 = -_3203;
        float _3217 = -_3211;
        float _3219 = fma(_3215, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3217);
        float _3221 = fma(_2821, _3201, _3213);
        float _3223 = -_3209;
        float _3225 = fma(_3223, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3219);
        float _3227 = fma(_2853, _3209, _3221);
        float _3229 = precise::clamp(_3227, 0.0, 1.0);
        float _3231 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3233 = _3225 + _3231;
        float _3235 = _3207 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3237 = _3233 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3239 = precise::clamp(_3237, 0.0, 1.0);
        float _3241 = exp2(_3235);
        float _3243 = _3241 * _3239;
        float _3245 = _3229 * _3243;
        float _3247 = _3245 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3249 = _3245 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3251 = _3245 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_90.x = _3247;
        out.m_90.y = _3249;
        out.m_90.z = _3251;
    }
    out.m_92.x = _3163;
    out.m_92.y = _3165;
    out.m_92.z = _3167;
    if (!_3149)
    {
        return out;
    }
    out.m_55.x = 0.0;
    float _3253 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3253;
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
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3005 = false;
    bool _1558 = false;
    bool _1554 = false;
    bool _209 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _106 = in.m_48.w;
    float _108 = in.m_50.w;
    float _110 = trunc(_106);
    int _113 = int(_110);
    float _115 = -_108;
    float _117 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.y = _117;
    bool _121 = _113 >= 1;
    float _123 = 0.0;
    float _125 = _108;
    float _127 = _117;
    if (!_121)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _129 = _123;
    if (!_121)
    {
        out.m_55.x = 0.0;
    }
    int _131 = 0;
    if (!_121)
    {
        float _133 = _129 * 5.0;
        _131 = as_type<int>(_133);
    }
    int _135 = _131;
    int _137 = _135;
    if (!_121)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3321 = as_type<float>(_135);
        out.gl_Position.z = _3321;
    }
    if (!_121)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _139 = _108 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _141 = isnan(_108);
    bool _143 = _139 || _141;
    bool _145 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _147 = _143 || _145;
    float _149 = float(_113);
    bool _151 = _117 >= _149;
    bool _153 = !_147;
    bool _155 = _151 || _153;
    if (_155)
    {
        _125 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _157 = _125;
    if (_155)
    {
        out.m_55.x = 0.0;
    }
    if (_155)
    {
        float _159 = _157 * 5.0;
        _137 = as_type<int>(_159);
    }
    int _161 = _137;
    if (_155)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3376 = as_type<float>(_161);
        out.gl_Position.z = _3376;
    }
    if (_155)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _163 = as_type<float>(int(gl_VertexIndex));
    float _165 = 1.0 / _149;
    bool _167 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _169 = _117 * _165;
    int _171 = as_type<int>(_163) & 1;
    bool _173 = _171 != 0;
    int _175 = as_type<int>(_163) & 2;
    bool _177 = _175 != 0;
    bool _179 = !_173;
    float _181 = _179 ? (-0.5) : 0.5;
    bool _183 = !_177;
    float _185 = _183 ? (-0.5) : 0.5;
    bool _187 = !_167;
    float _189 = _169;
    float _207;
    if (!_187)
    {
        float _191 = in.m_60.x;
        float _193 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _195 = _191 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _197 = fma(_195, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _199 = _197 * _193;
        float _201 = floor(_199);
        float _203 = -_201;
        float _205 = _199 + _203;
        _207 = _205;
        _209 = true;
    }
    else
    {
        _207 = _169;
    }
    _209 = false;
    float _211 = _207;
    float _213 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _215 = _211 + _213;
    bool _217 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _219 = isnan(_211);
    bool _221 = _217 || _219;
    bool _223 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _225 = _221 || _223;
    float _227 = float(_225);
    float _229 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _231 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _229;
    float _233 = -_227;
    float _235 = _233 + 1.0;
    bool _237 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _239 = isnan(_211);
    bool _241 = _237 || _239;
    bool _243 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _245 = _241 || _243;
    float _247 = float(_245);
    float _249 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _251 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _249;
    bool _253 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _255 = 1.0 / _231;
    float _257 = _247 * _235;
    float _259 = -_247;
    float _261 = _259 + 1.0;
    float _263 = _215 * _255;
    float _265 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _267 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _265;
    float _269 = fma(_251, _263, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _271 = fma(_267, _263, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _273 = _269 * _257;
    float _275 = _271 * _257;
    float _277 = fma(_261, (*spvDescriptorSet0.vp_c9)._m0[143].x, _273);
    float _279 = fma(_261, (*spvDescriptorSet0.vp_c9)._m0[143].y, _275);
    float _281 = fma(_227, (*spvDescriptorSet0.vp_c9)._m0[144].x, _277);
    float _283 = fma(_227, (*spvDescriptorSet0.vp_c9)._m0[144].y, _279);
    bool _285 = !_253;
    if (!_285)
    {
        float _287 = in.m_60.x;
        float _289 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _291 = _287 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _293 = fma(_291, (*spvDescriptorSet0.vp_c9)._m0[11].y, _117);
        float _295 = _293 * _289;
        float _297 = floor(_295);
        float _299 = -_297;
        float _301 = _295 + _299;
        _189 = _301;
    }
    float _303 = _189;
    float _305 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _307 = int(_305);
    float _309 = in.m_48.x;
    float _311 = in.m_48.y;
    float _313 = in.m_48.z;
    float _315 = in.m_62.x;
    float _317 = in.m_62.y;
    float _319 = in.m_62.z;
    float _321 = in.m_62.w;
    int _323 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _325 = _323 != 0;
    float _327 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _329 = int(_327);
    float _331 = in.m_64.x;
    float _333 = in.m_64.y;
    int _335 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _337 = _335 != 0;
    int _339 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _341 = _339 != 0;
    int _343 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _345 = _343 != 0;
    float _347 = in.m_66.x;
    float _349 = in.m_66.y;
    float _351 = in.m_66.z;
    float _353 = in.m_66.w;
    float _355 = float(_307);
    float _357 = in.m_60.x;
    float _359 = in.m_60.y;
    bool _361 = !_341;
    int _363 = _361 ? 0 : 1;
    int _365 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _367 = _365 != 0;
    float _369 = in.m_68.x;
    float _371 = in.m_68.y;
    float _373 = in.m_68.z;
    float _375 = in.m_68.w;
    float _377 = 1.0 / _355;
    int _379 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _381 = _379 != 0;
    float _383 = float(uint(_329));
    int _385 = ~_329;
    int _387 = _385 + 1;
    int _389 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _391 = _389 != 0;
    float _393 = 1.0 / _383;
    float _395 = _283 * _333;
    float _397 = _311 * _349;
    float _399 = _377 * _117;
    float _401 = _311 * _317;
    float _403 = _281 * _331;
    float _405 = fma(_309, _347, _397);
    float _407 = fma(_309, _315, _401);
    float _409 = trunc(_399);
    int _411 = int(_409);
    float _413 = _311 * _371;
    int _415 = as_type<int>(_393) + (-2);
    float _417 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _419 = fma(_309, _369, _413);
    float _421 = in.m_60.z;
    float _423 = fma(_313, _373, _419);
    float _425 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _427 = _425 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _429 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _431 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _433 = _431 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _435 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _437 = float(uint(_411));
    float _439 = 1.0 / _427;
    int _441 = ~_329;
    int _443 = _441 + 1;
    float _445 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _447 = as_type<float>(_415) * _437;
    float _449 = _359 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _451 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _453 = _435 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _455 = 1.0 / _433;
    float _457 = fma(_449, -2.0, _429);
    float _459 = _357 * 2.0;
    float _461 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _463 = _417 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _465 = _445 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _467 = -_451;
    float _469 = fma(_459, (*spvDescriptorSet0.vp_c9)._m0[77].x, _467);
    float _471 = trunc(_447);
    float _473 = precise::max(_471, 0.0);
    uint _476 = uint(_473);
    float _478 = fma(_313, _319, _407);
    out.m_70.x = _453;
    out.m_70.y = _463;
    out.m_70.z = _465;
    out.m_70.w = _461;
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _482 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _480;
    float _484 = float(_329);
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _488 = _486 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _490 = _403 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _492 = _478 + _321;
    float _494 = floor(_459);
    float _496 = _488 * _439;
    float _498 = _482 * _455;
    float _500 = _421 * 2.0;
    float _502 = _423 + _375;
    int _504 = _329 + (-1);
    float _506 = -_117;
    float _508 = fma(_506, (*spvDescriptorSet0.vp_c9)._m0[76].x, _469);
    int _510 = _443 * int(_476);
    int _512 = _510 + _411;
    float _514 = fma(_313, _351, _405);
    float _516 = _484 * _117;
    bool _518 = !_345;
    int _520 = _518 ? 0 : 1;
    float _522 = floor(_500);
    float _524 = float(uint(_512));
    float _526 = _516 * _165;
    bool _528 = !_337;
    int _530 = _528 ? 0 : 1;
    float _532 = _514 + _353;
    bool _534 = _494 > 0.0;
    float _536 = as_type<float>(_415) * _524;
    float _538 = _359 + _357;
    bool _540 = _494 >= 0.0;
    bool _542 = isnan(_494);
    bool _544 = _540 || _542;
    bool _546 = isnan(0.0);
    bool _548 = _544 || _546;
    float _550 = trunc(_526);
    int _552 = int(_550);
    float _554 = _538 + (-1.0);
    int _556 = _548 ? 0 : 1;
    float _558 = _492 + (*spvDescriptorSet0.vp_c12)._m0[0].y;
    int _560 = abs(_520);
    float _562 = fma(_554, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _564 = _359 + _421;
    float _566 = trunc(_536);
    float _568 = precise::max(_566, 0.0);
    uint _570 = uint(_568);
    float _572 = _359 * 2.0;
    float _574 = _564 + (-1.0);
    bool _576 = !_325;
    float _578 = _576 ? 7.345489978790283203125 : 1.0;
    float _580 = _502 + (*spvDescriptorSet0.vp_c12)._m0[0].x;
    int _582 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _584 = _582 != 0;
    float _586 = fma(_574, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _588 = floor(_572);
    float _590 = _578 * _357;
    bool _592 = !_367;
    int _594 = _592 ? 0 : 1;
    float _596 = _421 + _357;
    bool _598 = _359 > 0.5;
    float _600 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _602 = _532 + (*spvDescriptorSet0.vp_c12)._m0[0].z;
    float _604 = _421 + (-0.5);
    int _606 = int(_476) + int(_570);
    float _608 = floor(_590);
    bool _610 = !_584;
    int _612 = _610 ? 0 : 1;
    float _614 = fma(_359, (*spvDescriptorSet0.vp_c9)._m0[78].w, _600);
    bool _616 = _357 > 0.5;
    int _618 = _387 * _606;
    int _620 = _618 + _411;
    float _622 = _359 + (-0.5);
    float _624 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].w, _614);
    float _626 = -_181;
    int _628 = _616 ? as_type<int>(_626) : as_type<int>(_181);
    bool _630 = _588 >= 0.0;
    bool _632 = isnan(_588);
    bool _634 = _630 || _632;
    bool _636 = isnan(0.0);
    bool _638 = _634 || _636;
    float _640 = -_624;
    float _642 = _640 + 1.0;
    bool _644 = !_381;
    float _646 = _644 ? _181 : as_type<float>(_628);
    float _648 = -_185;
    int _650 = _598 ? as_type<int>(_648) : as_type<int>(_185);
    bool _652 = uint(_620) >= uint(_329);
    float _654 = -_608;
    float _656 = _590 + _654;
    bool _658 = _588 > 0.0;
    float _660 = _596 + (-1.0);
    bool _662 = !_652;
    int _664 = _662 ? 0 : (-1);
    float _666 = _656 * _484;
    int _668 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _670 = _668 != 0;
    int _672 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _674 = _672 != 0;
    int _676 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _678 = _676 != 0;
    float _680 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _181);
    float _682 = float(_411);
    float _684 = fma(_660, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _686 = ~_556;
    int _688 = _686 + 1;
    int _690 = _688 + 1;
    float _692 = _490 * _680;
    bool _694 = _682 >= _484;
    bool _696 = isnan(_682);
    bool _698 = _694 || _696;
    bool _700 = isnan(_484);
    bool _702 = _698 || _700;
    float _704 = float(_702);
    float _706 = _395 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _708 = _690;
    float _710 = _692;
    if (!_534)
    {
        int _712 = ~_556;
        int _714 = _712 + 1;
        _708 = _714;
    }
    int _716 = _708;
    float _718 = trunc(_666);
    int _720 = int(_718);
    int _722 = _638 ? 0 : 1;
    float _724 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _726 = _303 + _724;
    int _728 = ~_606;
    int _730 = _728 + _664;
    int _732 = _730 + 1;
    float _734 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _185);
    int _736 = ~_722;
    int _738 = _736 + 1;
    int _740 = _738 + 1;
    float _742 = _181 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _744 = _740;
    if (!_658)
    {
        int _746 = ~_722;
        int _748 = _746 + 1;
        _744 = _748;
    }
    int _750 = _744;
    float _752 = trunc(_704);
    int _754 = int(_752);
    bool _756 = _329 == 0;
    float _758 = _706 * _734;
    int _760 = abs(_594);
    int _762 = abs(_530);
    bool _764 = !_391;
    float _766 = _764 ? _185 : as_type<float>(_650);
    float _768 = _185 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _770 = fma(_496, _726, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    int _772 = _329 * _732;
    int _774 = _772 + _411;
    bool _776 = _522 > 0.0;
    int _778 = _720 * _760;
    int _780 = _778 + _411;
    int _782 = abs(_363);
    bool _784 = !_756;
    int _786 = _784 ? _774 : (-1);
    int _788 = ~_754;
    int _790 = _788 + 1;
    int _792 = _790 + 1;
    bool _794 = _303 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _796 = isnan(_303);
    bool _798 = _794 || _796;
    bool _800 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _802 = _798 || _800;
    float _804 = float(_802);
    bool _806 = _522 >= 0.0;
    bool _808 = isnan(_522);
    bool _810 = _806 || _808;
    bool _812 = isnan(0.0);
    bool _814 = _810 || _812;
    int _816 = _786 * _792;
    float _818 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _820 = _303 + _818;
    float _822 = -_804;
    float _824 = _822 + 1.0;
    float _826 = float(_716);
    int _828 = _754 * _504;
    int _830 = _828 + _816;
    bool _832 = _303 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _834 = isnan(_303);
    bool _836 = _832 || _834;
    bool _838 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _840 = _836 || _838;
    float _842 = float(_840);
    float _844 = fma(_498, _820, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _846 = _303 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _848 = isnan(_303);
    bool _850 = _846 || _848;
    bool _852 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _854 = _850 || _852;
    float _856 = float(_854);
    int _858 = _830 * _782;
    float _860 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _862 = log2(_860);
    float _864 = _842 * _824;
    float _866 = -_842;
    float _868 = _866 + 1.0;
    int _870 = abs(_612);
    int _872 = _552 * _762;
    int _874 = _872 + _858;
    float _876 = _856 * _868;
    float _878 = _646 + 0.5;
    float _880 = -_856;
    float _882 = _880 + 1.0;
    int _884 = _780 * _560;
    int _886 = _884 + _874;
    float _888 = _844 * _876;
    float _890 = fma(_878, (*spvDescriptorSet0.vp_c9)._m0[80].x, _508);
    float _892 = _766 + (-0.5);
    int _894 = _720 * _870;
    int _896 = _894 + _886;
    float _898 = fma(_882, (*spvDescriptorSet0.vp_c9)._m0[115].x, _888);
    int _900 = ~_329;
    int _902 = _900 + 1;
    float _904 = _862 * _117;
    float _906 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _908 = fma(_770, _864, _898);
    int _910 = _814 ? 0 : 1;
    float _912 = fma(_357, (*spvDescriptorSet0.vp_c9)._m0[78].z, _906);
    float _914 = float(uint(_896));
    float _916 = exp2(_904);
    float _918 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _920 = 1.0 + _918;
    bool _922 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _924 = isnan(0.0);
    bool _926 = _922 || _924;
    bool _928 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _930 = _926 || _928;
    float _932 = fma(_804, (*spvDescriptorSet0.vp_c9)._m0[117].x, _908);
    float _934 = as_type<float>(_415) * _914;
    float _936 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].z, _912);
    float _938 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[76].y, _457);
    float _940 = float(_750);
    float _942 = trunc(_934);
    float _944 = precise::max(_942, 0.0);
    uint _946 = uint(_944);
    float _948 = -_936;
    float _950 = _948 + 1.0;
    float _952 = -_892;
    float _954 = -_938;
    float _956 = fma(_952, (*spvDescriptorSet0.vp_c9)._m0[80].y, _954);
    float _958 = _357 + (-0.5);
    float _960 = -_950;
    float _962 = fma(_646, _960, _890);
    float _964 = fma(_766, _642, _956);
    float _966 = -_916;
    float _968 = _966 + 1.0;
    bool _970 = !_674;
    int _972 = _970 ? 0 : 1;
    float _974 = 1.0 / _920;
    int _976 = ~_910;
    int _978 = _976 + 1;
    int _980 = _978 + 1;
    out.m_72.x = _962;
    out.m_72.y = _964;
    int _982 = abs(_972);
    int _984 = _980;
    float _986 = _758;
    if (!_776)
    {
        int _988 = ~_910;
        int _990 = _988 + 1;
        _984 = _990;
    }
    int _992 = _984;
    int _994 = _902 * int(_946);
    int _996 = _994 + _896;
    bool _998 = !_670;
    int _1000 = _998 ? 0 : 1;
    float _1002 = float(_982);
    float _1004 = float(uint(_996));
    float _1006 = _558 * (*spvDescriptorSet0.vp_c12)._m0[7].y;
    int _1008 = abs(_1000);
    float _1010 = _1002 * _826;
    float _1012 = _930 ? _968 : 0.0;
    float _1014 = as_type<float>(_415) * _1004;
    bool _1016 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1018 = isnan(1.0);
    bool _1020 = _1016 || _1018;
    bool _1022 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1024 = _1020 || _1022;
    float _1026 = fma(_580, (*spvDescriptorSet0.vp_c12)._m0[6].y, _1006);
    float _1028 = float(_1008);
    bool _1030 = !_678;
    int _1032 = _1030 ? 0 : 1;
    float _1034 = trunc(_1014);
    float _1036 = precise::max(_1034, 0.0);
    uint _1038 = uint(_1036);
    float _1040 = float(_992);
    int _1042 = ~_329;
    int _1044 = _1042 + 1;
    int _1046 = abs(_1032);
    float _1048 = _558 * (*spvDescriptorSet0.vp_c12)._m0[7].x;
    float _1050 = _1028 * _1040;
    float _1052 = _558 * (*spvDescriptorSet0.vp_c12)._m0[7].z;
    if (_1024)
    {
        float _1054 = _1012 * _974;
        _127 = _1054;
    }
    float _1056 = _127;
    float _1058 = fma(_580, (*spvDescriptorSet0.vp_c12)._m0[6].x, _1048);
    float _1060 = fma(_602, (*spvDescriptorSet0.vp_c12)._m0[8].y, _1026);
    float _1062 = fma(_580, (*spvDescriptorSet0.vp_c12)._m0[6].z, _1052);
    float _1064 = fma(_602, (*spvDescriptorSet0.vp_c12)._m0[8].x, _1058);
    float _1066 = fma(_602, (*spvDescriptorSet0.vp_c12)._m0[8].z, _1062);
    int _1068 = int(_946) + int(_1038);
    float _1070 = _1064 + (*spvDescriptorSet0.vp_c12)._m0[9].x;
    float _1072 = in.m_74.x;
    float _1074 = in.m_74.y;
    float _1076 = in.m_74.z;
    float _1078 = float(_1046);
    float _1080 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].x;
    int _1082 = _1044 * _1068;
    int _1084 = _1082 + _896;
    float _1086 = _1060 + (*spvDescriptorSet0.vp_c12)._m0[9].y;
    float _1088 = _1078 * _940;
    float _1090 = _1066 + (*spvDescriptorSet0.vp_c12)._m0[9].z;
    bool _1092 = uint(_1084) >= uint(_329);
    float _1094 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1096 = float(uint(_780));
    float _1098 = _932 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _1100 = !_1092;
    int _1102 = _1100 ? 0 : (-1);
    float _1104 = _1050 * (-2.0);
    float _1106 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1108 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _1110 = ~_1068;
    int _1112 = _1110 + _1102;
    int _1114 = _1112 + 1;
    float _1116 = as_type<float>(_415) * _1096;
    float _1118 = fma(_562, _1104, _562);
    float _1120 = _1106 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1122 = _1094 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1124 = _329 * _1114;
    int _1126 = _1124 + _896;
    float _1128 = _1108 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1130 = fma(_1104, _1072, _1072);
    float _1132 = _1010 * (-2.0);
    float _1134 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].y;
    bool _1136 = !_756;
    int _1138 = _1136 ? _1126 : (-1);
    out.m_76.x = _1120;
    out.m_76.y = _1122;
    out.m_76.z = _1128;
    out.m_76.w = _1098;
    float _1140 = fma(_586, _1132, _586);
    float _1142 = fma(_958, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1130);
    int _1144 = _1138 >> 31;
    int _1146 = _1138 & 3;
    bool _1148 = _1146 != 0;
    float _1150 = trunc(_1116);
    float _1152 = precise::max(_1150, 0.0);
    uint _1154 = uint(_1152);
    float _1156 = fma(_1118, _1056, _1142);
    int _1158 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1160 = _1158 != 0;
    float _1162 = fma(_1132, _1074, _1074);
    int _1164 = _1144 & 3;
    float _1166 = _1070 * _1080;
    int _1168 = ~_329;
    int _1170 = _1168 + 1;
    float _1172 = fma(_622, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1162);
    int _1174 = _1138 + _1164;
    float _1176 = fma(_1166, 0.5, 0.5);
    float _1178 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].z;
    int _1180 = _1170 * int(_1154);
    int _1182 = _1180 + _780;
    int _1184 = _1174 >> 2;
    float _1186 = _1088 * (-2.0);
    float _1188 = fma(_1140, _1056, _1172);
    float _1190 = _1086 * _1134;
    int _1192 = _1184 << 4;
    int _1194 = _1192 + 368;
    float _1196 = fma(_684, _1186, _684);
    float _1198 = float(uint(_1182));
    float _1200 = fma(_1186, _1076, _1076);
    uint _1202 = uint(int(uint(_1194) >> uint(2)));
    uint _1204 = uint(int(uint(int(_1202)) >> uint(2)));
    int _1206 = int(_1202) & 3;
    float _1208 = (*spvDescriptorSet0.vp_c9)._m0[int(_1204)][_1206];
    int _1210 = int(_1202) + 1;
    uint _1212 = uint(int(uint(_1210) >> uint(2)));
    int _1214 = _1210 & 3;
    float _1216 = (*spvDescriptorSet0.vp_c9)._m0[int(_1212)][_1214];
    float _1218 = fma(_1190, 0.5, 0.5);
    float _1220 = _1188 * 0.15915493667125701904296875;
    float _1222 = fma(_604, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1200);
    float _1224 = as_type<float>(_415) * _1198;
    int _1226 = _1138 & 3;
    bool _1228 = _1226 != 0;
    float _1230 = _1090 * _1178;
    int _1232 = _1148 ? 0 : 1;
    int _1234 = _1194 + 8;
    uint _1236 = uint(int(uint(_1234) >> uint(2)));
    uint _1238 = uint(int(uint(int(_1236)) >> uint(2)));
    int _1240 = int(_1236) & 3;
    float _1242 = (*spvDescriptorSet0.vp_c9)._m0[int(_1238)][_1240];
    int _1244 = int(_1236) + 1;
    uint _1246 = uint(int(uint(_1244) >> uint(2)));
    int _1248 = _1244 & 3;
    float _1250 = (*spvDescriptorSet0.vp_c9)._m0[int(_1246)][_1248];
    bool _1252 = uint(_1226) > 1u;
    float _1254 = trunc(_1224);
    float _1256 = precise::max(_1254, 0.0);
    uint _1258 = uint(_1256);
    bool _1260 = _1226 != 3;
    float _1262 = fma(_1196, _1056, _1222);
    int _1264 = ~_1232;
    int _1266 = _1264 + 1;
    int _1268 = _1266 + 1;
    float _1270 = _1156 * 0.15915493667125701904296875;
    bool _1272 = uint(_1226) >= 2u;
    float _1274 = fma(_1230, 0.5, 0.5);
    int _1276 = ~_329;
    int _1278 = _1276 + 1;
    float _1280 = floor(_1218);
    int _1282 = _1272 ? 0 : 1;
    float _1284 = _1262 * 0.15915493667125701904296875;
    int _1286 = _1268;
    if (!_1252)
    {
        int _1288 = ~_1232;
        int _1290 = _1288 + 1;
        _1286 = _1290;
    }
    int _1292 = _1286;
    bool _1294 = _1226 != 3;
    int _1296 = abs(_1292);
    float _1298 = floor(_1176);
    int _1300 = int(_1154) + int(_1258);
    bool _1302 = !_1228;
    int _1304 = _1302 ? 0 : 1;
    int _1306 = ~_1296;
    int _1308 = _1306 + 1;
    int _1310 = _1308 + 1;
    int _1312 = _1278 * _1300;
    int _1314 = _1312 + _780;
    int _1316 = ~_1282;
    int _1318 = _1316 + 1;
    int _1320 = _1318 + 1;
    float _1322 = _1270 * 6.283185482025146484375;
    float _1324 = sin(_1322);
    int _1326 = _1320;
    if (_1260)
    {
        int _1328 = ~_1282;
        int _1330 = _1328 + 1;
        _1326 = _1330;
    }
    int _1332 = _1326;
    float _1334 = -_1280;
    float _1336 = _1218 + _1334;
    int _1338 = abs(_1304);
    int _1340 = abs(_1332);
    int _1342 = ~_1338;
    int _1344 = _1342 + 1;
    int _1346 = _1344 + 1;
    float _1348 = _1270 * 6.283185482025146484375;
    float _1350 = cos(_1348);
    bool _1352 = uint(_1314) >= uint(_329);
    float _1354 = -_1298;
    float _1356 = _1176 + _1354;
    int _1358 = _1310 * as_type<int>(_1216);
    bool _1360 = !_1294;
    int _1362 = _1360 ? 0 : (-1);
    float _1364 = floor(_1274);
    int _1366 = _1346 * as_type<int>(_1208);
    int _1368 = _1366 + _1358;
    int _1370 = abs(_1362);
    bool _1372 = !_1160;
    int _1374 = _1372 ? 0 : 1;
    int _1376 = ~_1340;
    int _1378 = _1376 + 1;
    int _1380 = _1378 + 1;
    float _1382 = _1220 * 6.283185482025146484375;
    float _1384 = sin(_1382);
    bool _1386 = !_1352;
    int _1388 = _1386 ? 0 : (-1);
    int _1390 = abs(_1374);
    int _1392 = _1380 * as_type<int>(_1242);
    int _1394 = _1392 + _1368;
    int _1396 = ~_1370;
    int _1398 = _1396 + 1;
    int _1400 = _1398 + 1;
    float _1402 = fma(_1356, 2.0, -1.0);
    int _1404 = ~_1300;
    int _1406 = _1404 + _1388;
    int _1408 = _1406 + 1;
    float _1410 = _1220 * 6.283185482025146484375;
    float _1412 = cos(_1410);
    float _1414 = -_1364;
    float _1416 = _1274 + _1414;
    int _1418 = _1400 * as_type<int>(_1250);
    int _1420 = _1418 + _1394;
    int _1422 = ~_1390;
    int _1424 = _1422 + 1;
    int _1426 = _1424 + 1;
    int _1428 = _329 * _1408;
    int _1430 = _1428 + _780;
    float _1432 = fma(_1336, 2.0, -1.0);
    bool _1434 = 1.0 != (*spvDescriptorSet0.vp_c12)._m0[10].x;
    bool _1436 = isnan(1.0);
    bool _1438 = _1434 || _1436;
    bool _1440 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].x);
    bool _1442 = _1438 || _1440;
    float _1444 = fma(_1416, 2.0, -1.0);
    float _1446 = _1284 * 6.283185482025146484375;
    float _1448 = cos(_1446);
    int _1450 = _1420 * _1426;
    bool _1452 = !_756;
    int _1454 = _1452 ? _1430 : (-1);
    float _1456 = _1324 * _1384;
    float _1458 = _1350 * _1384;
    int _1460 = _1454 * _1390;
    int _1462 = _1460 + _1450;
    float _1464 = _1284 * 6.283185482025146484375;
    float _1466 = sin(_1464);
    float _1468 = _1350 * _1412;
    float _1470 = _1324 * _1412;
    float _1472 = _1432 * (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _1474 = float(_1462);
    float _1476 = _1472 * (*spvDescriptorSet0.vp_c12)._m0[3].y;
    float _1478 = _1324 * _1448;
    float _1480 = _1412 * _1448;
    float _1482 = _1350 * _1448;
    float _1484 = _1384 * _1448;
    out.m_78.x = _1474;
    float _1486 = fma(_1466, _1468, _1456);
    float _1488 = fma(_1466, _1456, _1468);
    float _1490 = -_1458;
    float _1492 = fma(_1466, _1470, _1490);
    float _1494 = -_1470;
    float _1496 = fma(_1466, _1458, _1494);
    float _1498 = _1472 * (*spvDescriptorSet0.vp_c12)._m0[3].x;
    float _1500 = _1402 * (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _1502 = _1472 * (*spvDescriptorSet0.vp_c12)._m0[3].z;
    float _1504 = fma(_1500, (*spvDescriptorSet0.vp_c12)._m0[2].x, _1498);
    float _1506 = fma(_1500, (*spvDescriptorSet0.vp_c12)._m0[2].z, _1502);
    float _1508 = -_758;
    float _1510 = _1466 * _1508;
    float _1512 = fma(_1500, (*spvDescriptorSet0.vp_c12)._m0[2].y, _1476);
    float _1514 = _1482 * _758;
    float _1516 = _1444 * (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _1518 = fma(_1480, _692, _1510);
    float _1520 = _1478 * _758;
    float _1522 = fma(_1486, _692, _1514);
    float _1524 = fma(_1516, (*spvDescriptorSet0.vp_c12)._m0[4].x, _1504);
    float _1526 = fma(_1516, (*spvDescriptorSet0.vp_c12)._m0[4].y, _1512);
    float _1528 = fma(_1516, (*spvDescriptorSet0.vp_c12)._m0[4].z, _1506);
    float _1530 = fma(_1492, _692, _1520);
    float _1532 = _1524 + (*spvDescriptorSet0.vp_c12)._m0[5].x;
    float _1534 = _1526 + (*spvDescriptorSet0.vp_c12)._m0[5].y;
    float _1536 = _1528 + (*spvDescriptorSet0.vp_c12)._m0[5].z;
    float _1538 = _1336;
    float _1540 = _1336;
    float _1542 = _1402;
    float _1544 = _1432;
    float _1546 = _1444;
    float _1548 = _1534;
    float _1556;
    if (!_1442)
    {
        bool _1550 = _1534 > (*spvDescriptorSet0.vp_c12)._m0[10].y;
        bool _1552 = !_1550;
        _1554 = _1552;
        if (!_1554)
        {
            _1556 = 0.0;
            _1558 = true;
        }
    }
    if ((!_1558) || _1554)
    {
        bool _1582;
        if (!_1554)
        {
            bool _1560 = _1534 >= (*spvDescriptorSet0.vp_c12)._m0[10].y;
            bool _1562 = isnan(_1534);
            bool _1564 = _1560 || _1562;
            bool _1566 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].y);
            bool _1568 = _1564 || _1566;
            bool _1570 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _1572 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _1574 = !_1568;
            bool _1576 = _1572 && _1574;
            _710 = (*spvDescriptorSet0.vp_c12)._m0[10].x;
            if (_1576)
            {
                _1538 = 0.0;
            }
            float _1578 = _1538;
            bool _1580 = !_1568;
            _1582 = _1580 && _1570;
            _1540 = _1578;
            _1556 = _1578;
        }
        if ((!_1582) || _1554)
        {
            _1554 = false;
            float _1584 = _1540;
            float _1586 = _710;
            bool _1588 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].x;
            bool _1590 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].y;
            bool _1592 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].z;
            float _1594 = _1584;
            float _1596 = _1586;
            if (_1588)
            {
                float _1598 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].x;
                _1594 = _1598;
            }
            float _1600 = _1594;
            if (_1588)
            {
                float _1602 = abs(_1402);
                float _1604 = -_1602;
                float _1606 = _1604 + 1.0;
                _1542 = _1606;
            }
            float _1608 = _1542;
            if (_1590)
            {
                float _1610 = abs(_1432);
                float _1612 = -_1610;
                float _1614 = _1612 + 1.0;
                _1544 = _1614;
            }
            float _1616 = _1544;
            if (!_1588)
            {
                _986 = 1.0;
            }
            float _1618 = _986;
            float _1620 = _1618;
            if (_1592)
            {
                float _1622 = abs(_1444);
                float _1624 = -_1622;
                float _1626 = _1624 + 1.0;
                _1546 = _1626;
            }
            float _1628 = _1546;
            if (!_1590)
            {
                _1596 = 1.0;
            }
            float _1630 = _1596;
            float _1632 = as_type<float>(_329);
            float _1634 = _1630;
            if (_1590)
            {
                float _1636 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].y;
                _1632 = _1636;
            }
            float _1638 = _1632;
            float _1640 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
            if (_1592)
            {
                float _1642 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].z;
                _1640 = _1642;
            }
            float _1644 = _1640;
            float _1646 = _1600;
            if (_1588)
            {
                float _1648 = _1608 * _1600;
                float _1650 = precise::clamp(_1648, 0.0, 1.0);
                _1620 = _1650;
            }
            float _1652 = _1620;
            if (!_1592)
            {
                _1646 = 1.0;
            }
            float _1654 = _1646;
            float _1656 = _1654;
            if (_1590)
            {
                float _1658 = _1616 * _1638;
                float _1660 = precise::clamp(_1658, 0.0, 1.0);
                _1634 = _1660;
            }
            float _1662 = _1634;
            float _1664 = _1652 * _1662;
            if (_1592)
            {
                float _1666 = _1628 * _1644;
                float _1668 = precise::clamp(_1666, 0.0, 1.0);
                _1656 = _1668;
            }
            float _1670 = _1656;
            float _1672 = _1664 * _1670;
            _1556 = _1672;
        }
    }
    _1558 = false;
    float _1674 = _1556;
    float _1676 = -_1534;
    float _1678 = _1676 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1680 = -_1532;
    float _1682 = _1680 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1684 = -_1536;
    float _1686 = _1684 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1688 = _1678 * _1678;
    float _1690 = fma(_1682, _1682, _1688);
    float _1692 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _1694 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1696 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1698 = fma(_1686, _1686, _1690);
    float _1700 = -_1692;
    float _1702 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1700);
    float _1704 = -_1696;
    float _1706 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1704);
    float _1708 = rsqrt(_1698);
    float _1710 = -_1694;
    float _1712 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _1710);
    float _1714 = _1712 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1716 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1718 = -_1714;
    float _1720 = fma(_1702, (*spvDescriptorSet0.vp_c8)._m0[1].y, _1718);
    float _1722 = -_1716;
    float _1724 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _1722);
    float _1726 = _1682 * _1708;
    float _1728 = _1686 * _1708;
    float _1730 = _1678 * _1708;
    float _1732 = _1706 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1734 = _1726 * _1726;
    float _1736 = fma(_1728, _1728, _1734);
    float _1738 = rsqrt(_1736);
    float _1740 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1742 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1744 = -_1740;
    float _1746 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1744);
    float _1748 = _1706 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1750 = -_1742;
    float _1752 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1750);
    float _1754 = -_1732;
    float _1756 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1754);
    float _1758 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1720);
    float _1760 = -_1748;
    float _1762 = fma(_1702, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1760);
    float _1764 = fma(_1724, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1756);
    float _1766 = fma(_1752, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1762);
    float _1768 = _1728 * _1738;
    float _1770 = _1726 * _1738;
    float _1772 = _1766 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1774 = -_1768;
    float _1776 = _1728 * _1774;
    float _1778 = -_1768;
    float _1780 = _1730 * _1778;
    float _1782 = -_1772;
    float _1784 = fma(_1758, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1782);
    float _1786 = -_1776;
    float _1788 = fma(_1726, _1770, _1786);
    float _1790 = _1730 * _1770;
    float _1792 = _1752 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1794 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1784);
    float _1796 = _1788 * _1788;
    float _1798 = fma(_1790, _1790, _1796);
    float _1800 = -_1792;
    float _1802 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1800);
    float _1804 = _1706 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _1806 = fma(_1780, _1780, _1798);
    float _1808 = fma(_1724, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1802);
    float _1810 = -_1804;
    float _1812 = fma(_1702, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1810);
    float _1814 = _1712 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _1816 = -_1808;
    float _1818 = fma(_1816, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1794);
    float _1820 = rsqrt(_1806);
    float _1822 = fma(_1752, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1812);
    float _1824 = _1706 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1826 = -_1814;
    float _1828 = fma(_1702, (*spvDescriptorSet0.vp_c8)._m0[0].y, _1826);
    float _1830 = _1534 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1832 = -_1824;
    float _1834 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1832);
    float _1836 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1828);
    float _1838 = 1.0 / _1818;
    float _1840 = fma(_1532, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1830);
    float _1842 = fma(_1724, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1834);
    float _1844 = fma(_1536, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1840);
    float _1846 = _1788 * _1820;
    float _1848 = precise::clamp(_1846, 0.0, 1.0);
    float _1850 = -_1848;
    float _1852 = _1850 + 1.0;
    float _1854 = fma(_1822, _1838, -1.0);
    float _1856 = _1852 * _1838;
    float _1858 = fma(_1852, _1854, 1.0);
    float _1860 = _1836 * _1856;
    float _1862 = _1842 * _1856;
    float _1864 = _1858 * _1858;
    float _1866 = fma(_1860, _1860, _1864);
    float _1868 = fma(_1862, _1862, _1866);
    float _1870 = rsqrt(_1868);
    float _1872 = _1862 * _1870;
    float _1874 = _1860 * _1870;
    float _1876 = _1858 * _1870;
    float _1878 = -_1872;
    float _1880 = _1726 * _1878;
    float _1882 = _1728 * _1876;
    float _1884 = -_1874;
    float _1886 = -_1880;
    float _1888 = fma(_1728, _1884, _1886);
    float _1890 = -_1874;
    float _1892 = _1730 * _1890;
    float _1894 = -_1872;
    float _1896 = -_1882;
    float _1898 = fma(_1730, _1894, _1896);
    float _1900 = _1888 * _1888;
    float _1902 = -_1892;
    float _1904 = fma(_1726, _1876, _1902);
    float _1906 = fma(_1898, _1898, _1900);
    float _1908 = fma(_1904, _1904, _1906);
    float _1910 = rsqrt(_1908);
    float _1912 = _1898 * _1910;
    float _1914 = _1904 * _1910;
    float _1916 = _1888 * _1910;
    float _1918 = _1728 * _1912;
    float _1920 = _1730 * _1914;
    float _1922 = -_1918;
    float _1924 = fma(_1726, _1914, _1922);
    float _1926 = _1726 * _1916;
    float _1928 = -_1920;
    float _1930 = fma(_1728, _1916, _1928);
    float _1932 = _1924 * _1924;
    float _1934 = -_1926;
    float _1936 = fma(_1730, _1912, _1934);
    float _1938 = fma(_1930, _1930, _1932);
    float _1940 = fma(_1936, _1936, _1938);
    float _1942 = rsqrt(_1940);
    float _1944 = _1936 * _1942;
    float _1946 = _1924 * _1942;
    float _1948 = _1930 * _1942;
    float _1950 = _1726 * _1944;
    float _1952 = _1728 * _1946;
    float _1954 = _1522 * _1944;
    float _1956 = -_1950;
    float _1958 = fma(_1728, _1948, _1956);
    float _1960 = _1730 * _1948;
    float _1962 = -_1952;
    float _1964 = fma(_1730, _1944, _1962);
    float _1966 = _1958 * _1958;
    float _1968 = -_1960;
    float _1970 = fma(_1726, _1946, _1968);
    float _1972 = fma(_1964, _1964, _1966);
    float _1974 = fma(_1970, _1970, _1972);
    float _1976 = rsqrt(_1974);
    float _1978 = _1970 * _1976;
    float _1980 = _1522 * _1948;
    float _1982 = _1964 * _1976;
    float _1984 = _1958 * _1976;
    float _1986 = fma(_1518, _1978, _1954);
    float _1988 = _1522 * _1946;
    float _1990 = fma(_1518, _1982, _1980);
    float _1992 = fma(_1530, _1728, _1986);
    float _1994 = fma(_1518, _1984, _1988);
    float _1996 = fma(_1530, _1726, _1990);
    float _1998 = _1844 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2000 = _1536 + _1992;
    float _2002 = _1534 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2004 = _1532 + _1996;
    float _2006 = 1.0 / _1998;
    float _2008 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2010 = _2000 + _2008;
    float _2012 = fma(_1532, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2002);
    float _2014 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2016 = _2004 + _2014;
    float _2018 = fma(_1530, _1730, _1994);
    float _2020 = _2010 * _2010;
    float _2022 = fma(_1536, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2012);
    float _2024 = _1534 + _2018;
    float _2026 = fma(_2016, _2016, _2020);
    float _2028 = _2022 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _2030 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2032 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2034 = _2030 || _2032;
    bool _2036 = isnan(0.5);
    bool _2038 = _2034 || _2036;
    float _2040 = sqrt(_2026);
    float _2042 = _2028 + _1998;
    bool _2044 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2046 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2048 = _2044 || _2046;
    bool _2050 = isnan(0.5);
    bool _2052 = _2048 || _2050;
    float _2054 = _2042 * _2006;
    float _2056 = _2054 * 0.5;
    float _2058 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2060 = fma(_2056, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2058);
    float _2062 = 1.0 / _2060;
    bool _2064 = _2040 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2066 = _2006;
    float _2068 = _1998;
    float _2070 = _2000;
    float _2072 = _2018;
    float _2074 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _2076 = _2004;
    float _2078 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    if (!_2064)
    {
        _2066 = _2000;
    }
    float _2080 = _2066;
    float _2082 = _2080;
    if (!_2064)
    {
        _2068 = _2004;
    }
    float _2084 = _2068;
    float _2086 = _2084;
    if (!_2064)
    {
        _2070 = _2024;
    }
    float _2088 = _2070;
    bool _2090 = !_2064;
    float _2092 = _2088;
    if (!_2090)
    {
        float _2094 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2096 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2098 = _2040 + _2096;
        float _2100 = _2024 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2102 = rsqrt(_2026);
        float _2104 = _2098 * _2094;
        float _2106 = _2104 * 0.15915493667125701904296875;
        float _2108 = _2106 * 6.283185482025146484375;
        float _2110 = cos(_2108);
        float _2112 = _2106 * 6.283185482025146484375;
        float _2114 = sin(_2112);
        float _2116 = _2110 + (-1.0);
        float _2118 = _2116 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2120 = fma(_2114, _2100, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2122 = fma(_2024, _2110, _2118);
        float _2124 = _2102 * _2120;
        float _2126 = fma(_2016, _2124, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2128 = fma(_2010, _2124, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2092 = _2122;
        _2082 = _2128;
        _2086 = _2126;
        _2072 = _2118;
        _2074 = _2102;
    }
    float _2130 = _2092;
    float _2132 = _2082;
    float _2134 = _2086;
    float _2136 = _2072;
    float _2138 = _2074;
    float _2140 = _2136;
    float _2142 = _2130;
    float _2144 = _2134;
    float _2146 = _2132;
    float _2148 = _2138;
    if (_2052)
    {
        _2076 = 1.0;
    }
    float _2150 = _2076;
    float _2152 = _2150;
    if (!_2038)
    {
        float _2154 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2156 = _1534 + _2154;
        float _2158 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2160 = _1532 + _2158;
        float _2162 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2164 = -_1534;
        float _2166 = _2164 + _2130;
        float _2168 = _2156 * _2156;
        float _2170 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2172 = _1536 + _2170;
        float _2174 = fma(_2160, _2160, _2168);
        float _2176 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2178 = fma(_2172, _2172, _2174);
        float _2180 = sqrt(_2178);
        float _2182 = _2162 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2184 = precise::min(_2180, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2186 = _2184 * _2176;
        float _2188 = -_1536;
        float _2190 = _2188 + _2132;
        float _2192 = _2182 * _2186;
        float _2194 = -_1532;
        float _2196 = _2194 + _2134;
        float _2198 = fma(_2166, _2192, _1534);
        float _2200 = fma(_2196, _2192, _1532);
        float _2202 = fma(_2190, _2192, _1536);
        _2140 = _2166;
        _2142 = _2198;
        _2144 = _2200;
        _2146 = _2202;
    }
    float _2204 = _2140;
    float _2206 = _2142;
    float _2208 = _2144;
    float _2210 = _2146;
    float _2212 = _2204;
    if (_2052)
    {
        _2078 = 1.0;
    }
    float _2214 = _2078;
    float _2216 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2218 = _2062 * _2216;
    float _2220 = _2214;
    if (!_2052)
    {
        float _2222 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2224 = _2222 * 0.15915493667125701904296875;
        float _2226 = _2224 * 6.283185482025146484375;
        float _2228 = cos(_2226);
        float _2230 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2232 = _2230 * 0.15915493667125701904296875;
        float _2234 = _2224 * 6.283185482025146484375;
        float _2236 = sin(_2234);
        float _2238 = 1.0 / _2228;
        float _2240 = _2232 * 6.283185482025146484375;
        float _2242 = cos(_2240);
        float _2244 = _2236 * _2238;
        float _2246 = _2232 * 6.283185482025146484375;
        float _2248 = sin(_2246);
        float _2250 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2252 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2250;
        float _2254 = _2242 * _2244;
        float _2256 = 1.0 / _2254;
        float _2258 = 1.0 / _2252;
        float _2260 = _2248 * _2256;
        float _2262 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2264 = fma(_2218, _2260, _2262);
        float _2266 = _2264 * _2258;
        float _2268 = precise::clamp(_2266, 0.0, 1.0);
        _2212 = _2264;
        _1548 = _2232;
        _2148 = _2224;
        _2152 = _2268;
    }
    float _2270 = _2212;
    float _2272 = _1548;
    float _2274 = _2148;
    float _2276 = _2152;
    float _2278 = _2272;
    float _2280 = _2270;
    float _2282 = _2274;
    if (!_2052)
    {
        float _2284 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2286 = _2284 * 0.15915493667125701904296875;
        float _2288 = _2286 * 6.283185482025146484375;
        float _2290 = cos(_2288);
        float _2292 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2294 = _2292 * 0.15915493667125701904296875;
        float _2296 = _2286 * 6.283185482025146484375;
        float _2298 = sin(_2296);
        float _2300 = 1.0 / _2290;
        float _2302 = _2294 * 6.283185482025146484375;
        float _2304 = cos(_2302);
        float _2306 = _2298 * _2300;
        float _2308 = _2294 * 6.283185482025146484375;
        float _2310 = sin(_2308);
        float _2312 = _2304 * _2306;
        float _2314 = 1.0 / _2312;
        float _2316 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2318 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2316;
        float _2320 = 1.0 / _2318;
        float _2322 = _2310 * _2314;
        float _2324 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2326 = fma(_2218, _2322, _2324);
        float _2328 = _2326 * _2320;
        float _2330 = precise::clamp(_2328, 0.0, 1.0);
        float _2332 = -_2330;
        float _2334 = _2332 + 1.0;
        _2278 = _2298;
        _2280 = _2300;
        _2220 = _2334;
    }
    float _2336 = _2278;
    float _2338 = _2280;
    float _2340 = _2220;
    float _2342 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2344 = _2206 + _2342;
    float _2346 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2348 = _2208 + _2346;
    float _2350 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2352 = _2210 + _2350;
    float _2354 = _2344 * _2344;
    float _2356 = fma(_2348, _2348, _2354);
    float _2358 = fma(_2352, _2352, _2356);
    float _2360 = rsqrt(_2358);
    float _2362 = sqrt(_2358);
    float _2364 = _2360 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2366 = _2348 * _2364;
    float _2368 = _2352 * _2364;
    float _2370 = _2366 * _2366;
    float _2372 = _2368 * _2368;
    float _2374 = _2370 + _2372;
    float _2376 = sqrt(_2374);
    bool _2378 = _2376 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2380 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2382 = _2376 + _2380;
    float _2384 = _2360;
    float _2386 = _2338;
    float _2388 = _2382;
    float _2390 = _2364;
    float _2392 = _2374;
    if (_2378)
    {
        float _2394 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2384 = _2394;
    }
    float _2396 = _2384;
    if (_2378)
    {
        float _2398 = rsqrt(_2374);
        _2386 = _2398;
    }
    float _2400 = _2386;
    float _2402 = _2400;
    if (_2378)
    {
        float _2404 = _2382 * _2396;
        _2388 = _2404;
    }
    float _2406 = _2388;
    if (_2378)
    {
        float _2408 = _2406 * 0.15915493667125701904296875;
        _2282 = _2408;
    }
    float _2410 = _2282;
    float _2412 = _2336;
    if (_2378)
    {
        float _2414 = _2410 * 6.283185482025146484375;
        float _2416 = sin(_2414);
        _2412 = _2416;
    }
    float _2418 = _2412;
    float _2420 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2422 = precise::max(0.0, _2420);
    float _2424 = _2352;
    float _2426 = _2422;
    if (_2378)
    {
        float _2428 = _2410 * 6.283185482025146484375;
        float _2430 = cos(_2428);
        _2424 = _2430;
    }
    float _2432 = _2424;
    float _2434 = -_2364;
    float _2436 = -_2422;
    float _2438 = fma(_2344, _2434, _2436);
    float _2440 = fma(_1532, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2442 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    float _2444 = _2438;
    if (_2378)
    {
        float _2446 = _2438 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2426 = _2446;
    }
    float _2448 = _2426;
    float _2450 = _2206 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2452 = _2418;
    float _2454 = _2448;
    if (_2378)
    {
        float _2456 = fma(_2418, _2448, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2452 = _2456;
    }
    float _2458 = _2452;
    float _2460 = _2458;
    if (!_2378)
    {
        _2454 = _2370;
    }
    float _2462 = _2454;
    float _2464 = fma(_2208, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2450);
    float _2466 = _2462;
    float _2468 = _2432;
    if (_2378)
    {
        float _2470 = _2432 + (-1.0);
        _2442 = _2470;
    }
    float _2472 = _2442;
    if (_2378)
    {
        float _2474 = _2400 * _2458;
        _2390 = _2474;
    }
    float _2476 = _2390;
    if (!_2378)
    {
        _2402 = _2366;
    }
    float _2478 = _2402;
    float _2480 = fma(_2210, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2464);
    float _2482 = _2478;
    if (_2378)
    {
        float _2484 = _2472 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2392 = _2484;
    }
    float _2486 = _2392;
    if (_2378)
    {
        float _2488 = _2366 * _2476;
        _2482 = _2488;
    }
    float _2490 = _2482;
    if (!_2378)
    {
        _2460 = _2368;
    }
    float _2492 = _2460;
    float _2494 = _2492;
    if (_2378)
    {
        float _2496 = _2368 * _2476;
        _2494 = _2496;
    }
    float _2498 = _2494;
    if (_2378)
    {
        float _2500 = fma(_2438, _2432, _2486);
        _2444 = _2500;
    }
    float _2502 = _2444;
    if (_2378)
    {
        float _2504 = _2490 * _2490;
        _2466 = _2504;
    }
    float _2506 = _2466;
    if (!_2378)
    {
        _2468 = _2372;
    }
    float _2508 = _2468;
    float _2510 = _2508;
    if (_2378)
    {
        float _2512 = _2498 * _2498;
        _2510 = _2512;
    }
    float _2514 = _2510;
    float _2516 = fma(_2502, _2502, _2506);
    float _2518 = _2480 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2520 = floor(_2440);
    float _2522 = _2516 + _2514;
    float _2524 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2526 = fma(_2362, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2524);
    float _2528 = precise::clamp(_2526, 0.0, 1.0);
    float _2530 = _2206 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2532 = rsqrt(_2522);
    float _2534 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2536 = _2518 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2538 = -_2528;
    float _2540 = _2538 + 1.0;
    float _2542 = -_2536;
    float _2544 = fma(_2542, _2534, 1.0);
    float _2546 = _2206 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2548 = -_2520;
    float _2550 = _2440 + _2548;
    float _2552 = _2206 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2554 = abs(_2540);
    float _2556 = log2(_2554);
    float _2558 = fma(_1536, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2560 = fma(_2208, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2546);
    float _2562 = fma(_2208, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2552);
    float _2564 = _2532 * _2490;
    float _2566 = fma(_2210, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2562);
    float _2568 = _2532 * _2502;
    float _2570 = fma(_2208, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2530);
    float _2572 = _2564 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2574 = fma(_2210, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2560);
    float _2576 = _2566 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2578 = _2532 * _2498;
    float _2580 = -_2572;
    float _2582 = fma(_2568, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2580);
    float _2584 = _2574 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2586 = _2576 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2588 = fma(_2210, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2570);
    float _2590 = -_2578;
    float _2592 = fma(_2590, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2582);
    float _2594 = floor(_2558);
    float _2596 = fma(_2584, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2586);
    float _2598 = _2556 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2600 = _2588 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2602 = fma(_2592, -0.5, 0.5);
    float _2604 = fma(_2518, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2596);
    float _2606 = _2576 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2608 = fma(_2592, 0.5, 0.5);
    float _2610 = exp2(_2598);
    float _2612 = fma(_2600, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2604);
    float _2614 = fma(_2584, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2606);
    float _2616 = _2568 + 1.0;
    float _2618 = fma(_2518, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2614);
    float _2620 = log2(_2544);
    float _2622 = -_2594;
    float _2624 = _2558 + _2622;
    float _2626 = fma(_2608, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2628 = 1.0 / _2612;
    float _2630 = _2576 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2632 = -_2568;
    float _2634 = fma(_2610, _2616, _2632);
    float _2636 = fma(_2600, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2618);
    float _2638 = fma(_2608, _2626, -0.212114393711090087890625);
    float _2640 = fma(_2584, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2630);
    float _2642 = sqrt(_2602);
    float _2644 = fma(_2518, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2640);
    float2 _7153 = float2(_2550, _2624);
    float _2646 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7153, float2(0.0), isnan(_7153)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7153, float2(0.0), isnan(_7153)), level(0.0)).x;
    float _2648 = _2620 * 0.693147182464599609375;
    float _2650 = fma(_2608, _2638, 1.570728778839111328125);
    float _2652 = fma(_2600, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2644);
    float _2654 = fma(_2634, 0.5, 0.5);
    float _2656 = _2648 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2658 = _2636 * _2628;
    float _2660 = _2652 * _2628;
    float _2662 = fma(_2658, 0.5, 0.5);
    float _2664 = fma(_2660, -0.5, 0.5);
    float _2666 = _2642 * 0.636619746685028076171875;
    float _2668 = -_2650;
    float _2670 = fma(_2666, _2668, 1.0);
    float3 _7200 = float3(_2662, _2664, _2656);
    float _2672 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7200, float3(0.0), isnan(_7200)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7200, float3(0.0), isnan(_7200)), level(0.0)).x;
    float3 _7211 = float3(_2662, _2664, _2656);
    float4 _2675 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7211, float3(0.0), isnan(_7211)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7211, float3(0.0), isnan(_7211)), level(0.0)).xyzw;
    float _2677 = _2675.x;
    float _2679 = _2675.y;
    float _2681 = _2675.z;
    float _2683 = _2675.w;
    float2 _7227 = float2(_2670, _2654);
    float3 _2687 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7227, float2(0.0), isnan(_7227)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7227, float2(0.0), isnan(_7227)), level(0.0)).xyz;
    float _2689 = _2687.x;
    float _2691 = _2687.y;
    float _2693 = _2687.z;
    float _2695 = abs(_2218);
    float _2697 = log2(_2695);
    float _2699 = _1482 * _1944;
    float _2701 = _2576 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2703 = _2362 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2705 = isnan(_2362);
    bool _2707 = _2703 || _2705;
    bool _2709 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2711 = _2707 || _2709;
    float _2713 = -_1466;
    float _2715 = fma(_2713, _1978, _2699);
    float _2717 = fma(_2584, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2701);
    float _2719 = _1482 * _1946;
    bool _2721 = _2218 <= 8000.0;
    bool _2723 = isnan(_2218);
    bool _2725 = _2721 || _2723;
    bool _2727 = isnan(8000.0);
    bool _2729 = _2725 || _2727;
    float _2731 = float(_2729);
    float _2733 = fma(_1478, _1728, _2715);
    float _2735 = fma(_2518, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2717);
    float _2737 = -_1466;
    float _2739 = fma(_2737, _1984, _2719);
    float _2741 = in.m_80.x;
    float _2743 = _2697 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2745 = fma(_1478, _1730, _2739);
    float _2747 = exp2(_2743);
    float _2749 = fma(_2747, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2751 = precise::clamp(_2749, 0.0, 1.0);
    float _2753 = _1486 * _1946;
    float _2755 = _1496 * _1946;
    float _2757 = fma(_2751, -2.0, 3.0);
    float _2759 = _2751 * _2751;
    float _2761 = fma(_1484, _1984, _2755);
    float _2763 = _2759 * _2757;
    float _2765 = fma(_1488, _1730, _2761);
    float _2767 = -_2763;
    float _2769 = _2767 + 1.0;
    float _2771 = fma(_2769, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2763);
    float _2773 = _1482 * _1948;
    float _2775 = _1496 * _1948;
    float _2777 = _1496 * _1944;
    float _2779 = _2731 * _2771;
    float _2781 = -_1466;
    float _2783 = fma(_2781, _1982, _2773);
    float _2785 = _2556 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2787 = _1486 * _1948;
    float _2789 = fma(_1480, _1984, _2753);
    float _2791 = fma(_1478, _1726, _2783);
    float _2793 = _1486 * _1944;
    float _2795 = fma(_1480, _1982, _2787);
    float _2797 = exp2(_2785);
    float _2799 = fma(_1484, _1982, _2775);
    float _2801 = _768 * _2791;
    float _2803 = fma(_1492, _1726, _2795);
    float _2805 = fma(_1492, _1730, _2789);
    float _2807 = _768 * _2745;
    float _2809 = fma(_1480, _1978, _2793);
    float _2811 = fma(_1488, _1726, _2799);
    float _2813 = fma(_742, _2803, _2801);
    float _2815 = fma(_742, _2805, _2807);
    float _2817 = fma(_1492, _1728, _2809);
    float _2819 = _768 * _2733;
    float _2821 = _2811 + _2813;
    float _2823 = fma(_1484, _1978, _2777);
    float _2825 = _2765 + _2815;
    float _2827 = _2779 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2829 = fma(_742, _2817, _2819);
    float _2831 = -_2797;
    float _2833 = _2831 + 1.0;
    float _2835 = fma(_1488, _1728, _2823);
    float _2837 = fma(_2600, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2735);
    float _2839 = _2833 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2841 = _2636 + _2612;
    float _2843 = _2612 * 0.5;
    float _2845 = _2837 + _2612;
    out.gl_Position.x = _2636;
    out.gl_Position.y = _2652;
    out.gl_Position.z = _2837;
    out.gl_Position.w = _2612;
    float _2847 = fma(_2652, -0.5, _2843);
    float _2849 = _2845 * 0.5;
    float _2851 = _2841 * 0.5;
    float _2853 = _2835 + _2829;
    out.m_82.x = _2851;
    out.m_82.y = _2847;
    out.m_82.z = _2849;
    out.m_82.w = _2612;
    out.m_84.x = _2821;
    out.m_84.y = _2825;
    out.m_84.z = _2853;
    float _2855 = _2612;
    float _2857 = _2837;
    if (!_2711)
    {
        _2855 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2859 = _2855;
    float _2861 = _2859;
    float _2863 = _2859;
    if (!_2711)
    {
        _2857 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2865 = _2857;
    float _2867 = -_2646;
    float _2869 = _2867 + 1.0;
    float _2871 = _2869 * _2827;
    float _2873 = precise::clamp(_2871, 0.0, 1.0);
    float _2875 = -_2873;
    float _2877 = fma(_2875, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2879 = _2877 * _2741;
    float _2881 = _2839 * _2672;
    float _2883 = -_2839;
    float _2885 = _2883 + 1.0;
    float _2887 = _2683 * _2881;
    float _2889 = _2693 * _2881;
    float _2891 = _2879 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2893 = _2683 * _2885;
    float _2895 = fma(_2689, _2887, _2677);
    float _2897 = fma(_2691, _2887, _2679);
    float _2899 = fma(_2683, _2889, _2681);
    float _2901 = _2276 * _2340;
    out.m_86.x = _2891;
    float _2903 = _2679;
    float _2905 = _2677;
    float _2907 = _2891;
    float _2909 = _2865;
    float _2911 = _2865;
    if (!_2711)
    {
        _2903 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2913 = _2903;
    float _2915 = _2901 * _1674;
    out.m_88.x = _2895;
    out.m_88.y = _2897;
    out.m_88.z = _2899;
    out.m_88.w = _2893;
    float _2917 = _2915;
    float _2919 = _2913;
    float _2921 = _2913;
    if (!_2711)
    {
        _2905 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2923 = _2905;
    float _2925 = _2915 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2927 = _2923;
    float _2929 = _2923;
    if (!_2711)
    {
        _2917 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2931 = _2917;
    float _2933 = _2931;
    float _2935 = _2931;
    if (!_2711)
    {
        _2907 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2937 = _2907;
    bool _2939 = !_2711;
    float _2941 = _2937;
    float _2943 = _2937;
    if (!_2939)
    {
        bool _2945 = _2362 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2947 = isnan(_2362);
        bool _2949 = _2945 || _2947;
        bool _2951 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2953 = _2949 || _2951;
        if (!_2953)
        {
            float _2955 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2957 = _2362 + _2955;
            float _2959 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2961 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2959;
            float _2963 = 1.0 / _2961;
            float _2965 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2967 = _2965 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2969 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2971 = _2969 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2973 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2975 = _2973 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2977 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2979 = _2977 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2981 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2983 = _2981 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2985 = _2957 * _2963;
            float _2987 = precise::clamp(_2985, 0.0, 1.0);
            float _2989 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2991 = _2989 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2993 = fma(_2987, _2967, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2995 = fma(_2987, _2991, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2997 = fma(_2987, _2971, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2999 = fma(_2987, _2975, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3001 = fma(_2987, _2979, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3003 = fma(_2987, _2983, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2929 = _2995;
            _2935 = _3001;
            _2921 = _2993;
            _2911 = _2999;
            _2863 = _2997;
            _2943 = _3003;
            _3005 = true;
        }
        else
        {
            bool _3007 = _2362 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3009 = isnan(_2362);
            bool _3011 = _3007 || _3009;
            bool _3013 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3015 = _3011 || _3013;
            if (!_3015)
            {
                _2919 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3017 = _2919;
            _2921 = _3017;
            if (!_3015)
            {
                _2927 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3019 = _2927;
            _2929 = _3019;
            if (!_3015)
            {
                _2861 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3021 = _2861;
            _2863 = _3021;
            if (!_3015)
            {
                _2909 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3023 = _2909;
            _2911 = _3023;
            if (!_3015)
            {
                _2933 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3025 = _2933;
            _2935 = _3025;
            if (!_3015)
            {
                _2941 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3027 = _2941;
            bool _3029 = !_3015;
            _2943 = _3027;
            if (!_3029)
            {
                bool _3031 = _2362 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3033 = isnan(_2362);
                bool _3035 = _3031 || _3033;
                bool _3037 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3039 = _3035 || _3037;
                if (!_3039)
                {
                    float _3041 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3043 = _2362 + _3041;
                    float _3045 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3047 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3045;
                    float _3049 = 1.0 / _3047;
                    float _3051 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3053 = _3051 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3055 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3057 = _3055 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3059 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3061 = _3059 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3063 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3065 = _3063 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3067 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3069 = _3067 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3071 = _3043 * _3049;
                    float _3073 = precise::clamp(_3071, 0.0, 1.0);
                    float _3075 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3077 = _3075 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3079 = fma(_3073, _3053, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3081 = fma(_3073, _3077, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3083 = fma(_3073, _3057, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3085 = fma(_3073, _3061, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3087 = fma(_3073, _3065, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3089 = fma(_3073, _3069, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2929 = _3081;
                    _2935 = _3087;
                    _2921 = _3079;
                    _2911 = _3085;
                    _2863 = _3083;
                    _2943 = _3089;
                    _3005 = true;
                }
                else
                {
                    _2929 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2935 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2921 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2911 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2863 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2943 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3005 = false;
    float _3091 = _2929;
    float _3093 = _2935;
    float _3095 = _2921;
    float _3097 = _2911;
    float _3099 = _2863;
    float _3101 = _2943;
    float _3103 = fma(_2825, -0.5, 0.5);
    float _3105 = precise::clamp(_3103, 0.0, 1.0);
    float _3107 = -_3091;
    float _3109 = _3107 + _3093;
    float _3111 = -_3095;
    float _3113 = _3111 + _3097;
    out.m_90.x = 0.0;
    float _3115 = fma(_3105, _3109, _3091);
    float _3117 = -_3099;
    float _3119 = _3117 + _3101;
    float _3121 = fma(_3105, _3113, _3095);
    float _3123 = _3115 * 0.586610972881317138671875;
    bool _3125 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3127 = fma(_3105, _3119, _3099);
    float _3129 = _2925 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3131 = fma(_3121, 0.298911988735198974609375, _3123);
    bool _3133 = _2276 > 0.0;
    bool _3135 = isnan(_2276);
    bool _3137 = _3133 || _3135;
    bool _3139 = isnan(0.0);
    bool _3141 = _3137 || _3139;
    float _3143 = fma(_3127, 0.114477999508380889892578125, _3131);
    out.m_55.x = _3129;
    bool _3145 = _2340 <= 0.0;
    bool _3147 = !_3141;
    bool _3149 = _3145 || _3147;
    float _3151 = -_3143;
    float _3153 = _3121 + _3151;
    float _3155 = -_3143;
    float _3157 = _3115 + _3155;
    float _3159 = -_3143;
    float _3161 = _3127 + _3159;
    float _3163 = fma(_3153, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3143);
    float _3165 = fma(_3157, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3143);
    float _3167 = fma(_3161, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3143);
    bool _3169 = !_3125;
    if (!_3169)
    {
        float _3171 = -_2206;
        float _3173 = _3171 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3175 = -_2208;
        float _3177 = _3175 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3179 = -_2210;
        float _3181 = _3179 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3183 = _3173 * _3173;
        float _3185 = fma(_3177, _3177, _3183);
        float _3187 = fma(_3181, _3181, _3185);
        float _3189 = sqrt(_3187);
        float _3191 = rsqrt(_3187);
        float _3193 = -_3189;
        float _3195 = _3193 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3197 = _3195 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3199 = precise::clamp(_3197, 0.0, 1.0);
        float _3201 = _3177 * _3191;
        float _3203 = _3173 * _3191;
        float _3205 = abs(_3199);
        float _3207 = log2(_3205);
        float _3209 = _3181 * _3191;
        float _3211 = _3201 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3213 = _2825 * _3203;
        float _3215 = -_3203;
        float _3217 = -_3211;
        float _3219 = fma(_3215, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3217);
        float _3221 = fma(_2821, _3201, _3213);
        float _3223 = -_3209;
        float _3225 = fma(_3223, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3219);
        float _3227 = fma(_2853, _3209, _3221);
        float _3229 = precise::clamp(_3227, 0.0, 1.0);
        float _3231 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3233 = _3225 + _3231;
        float _3235 = _3207 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3237 = _3233 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3239 = precise::clamp(_3237, 0.0, 1.0);
        float _3241 = exp2(_3235);
        float _3243 = _3241 * _3239;
        float _3245 = _3229 * _3243;
        float _3247 = _3245 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3249 = _3245 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3251 = _3245 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_90.x = _3247;
        out.m_90.y = _3249;
        out.m_90.z = _3251;
    }
    out.m_92.x = _3163;
    out.m_92.y = _3165;
    out.m_92.z = _3167;
    if (!_3149)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_55.x = 0.0;
    float _3253 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3253;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}


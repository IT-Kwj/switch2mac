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
    constant _16* vp_c13 [[id(4)]];
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
    float4 m_62 [[user(locn0)]];
    float4 m_70 [[user(locn1)]];
    float4 m_49 [[user(locn2)]];
    float4 m_94 [[user(locn3)]];
    float4 m_53 [[user(locn4)]];
    float4 m_72 [[user(locn5)]];
    float4 m_84 [[user(locn6)]];
    float4 m_74 [[user(locn7)]];
    float4 m_78 [[user(locn8)]];
    float4 m_86 [[user(locn9)]];
    float4 m_80 [[user(locn10)]];
    float4 m_92 [[user(locn11)]];
    float4 m_88 [[user(locn12)]];
    float4 m_90 [[user(locn13)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_82 [[attribute(0)]];
    float4 m_64 [[attribute(1)]];
    float4 m_68 [[attribute(2)]];
    float4 m_66 [[attribute(3)]];
    float4 m_76 [[attribute(4)]];
    float4 m_46 [[attribute(5)]];
    float4 m_51 [[attribute(6)]];
    float4 m_58 [[attribute(7)]];
    float4 m_60 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2821 = false;
    bool _307 = false;
    bool _211 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _108 = in.m_46.w;
    float _110 = trunc(_108);
    int _113 = int(_110);
    bool _117 = _113 >= 1;
    float _119 = 0.0;
    if (!_117)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _121 = _119;
    if (!_117)
    {
        out.m_49.x = 0.0;
    }
    int _123 = 0;
    if (!_117)
    {
        float _125 = _121 * 5.0;
        _123 = as_type<int>(_125);
    }
    int _127 = _123;
    int _129 = _127;
    if (!_117)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3125 = as_type<float>(_127);
        out.gl_Position.z = _3125;
    }
    if (!_117)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _131 = in.m_51.w;
    float _133 = float(_113);
    float _135 = -_131;
    float _137 = _135 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _139 = _131 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _141 = isnan(_131);
    bool _143 = _139 || _141;
    bool _145 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _147 = _143 || _145;
    bool _149 = _137 >= _133;
    bool _151 = !_147;
    bool _153 = _149 || _151;
    float _155 = 1.0 / _133;
    float _157 = _131;
    float _159 = _137;
    if (_153)
    {
        _157 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _161 = _157;
    if (_153)
    {
        out.m_49.x = 0.0;
    }
    float _163 = _137 * _155;
    float _165 = _163;
    if (_153)
    {
        float _167 = _161 * 5.0;
        _129 = as_type<int>(_167);
    }
    int _169 = _129;
    out.m_53.x = _163;
    if (_153)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3198 = as_type<float>(_169);
        out.gl_Position.z = _3198;
    }
    if (_153)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _171 = as_type<float>(int(gl_VertexIndex));
    bool _173 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _175 = as_type<int>(_171) & 1;
    bool _177 = _175 != 0;
    int _179 = as_type<int>(_171) & 2;
    bool _181 = _179 != 0;
    bool _183 = !_177;
    float _185 = _183 ? (-0.5) : 0.5;
    bool _187 = !_181;
    float _189 = _187 ? (-0.5) : 0.5;
    bool _191 = !_173;
    float _209;
    if (!_191)
    {
        float _193 = in.m_58.x;
        float _195 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _197 = _193 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _199 = fma(_197, (*spvDescriptorSet0.vp_c9)._m0[12].x, _137);
        float _201 = _199 * _195;
        float _203 = floor(_201);
        float _205 = -_203;
        float _207 = _201 + _205;
        _209 = _207;
        _211 = true;
    }
    else
    {
        _209 = _163;
    }
    _211 = false;
    float _213 = _209;
    float _215 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _217 = _213 + _215;
    bool _219 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _221 = isnan(_213);
    bool _223 = _219 || _221;
    bool _225 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _227 = _223 || _225;
    float _229 = float(_227);
    float _231 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _233 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _231;
    float _235 = -_229;
    float _237 = _235 + 1.0;
    bool _239 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _241 = isnan(_213);
    bool _243 = _239 || _241;
    bool _245 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _247 = _243 || _245;
    float _249 = float(_247);
    float _251 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _253 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _251;
    bool _255 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _257 = 1.0 / _233;
    float _259 = _249 * _237;
    float _261 = -_249;
    float _263 = _261 + 1.0;
    float _265 = _217 * _257;
    float _267 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _269 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _267;
    float _271 = fma(_253, _265, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _273 = fma(_269, _265, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _275 = _271 * _259;
    float _277 = _273 * _259;
    float _279 = fma(_263, (*spvDescriptorSet0.vp_c9)._m0[143].x, _275);
    float _281 = fma(_263, (*spvDescriptorSet0.vp_c9)._m0[143].y, _277);
    float _283 = fma(_229, (*spvDescriptorSet0.vp_c9)._m0[144].x, _279);
    float _285 = fma(_229, (*spvDescriptorSet0.vp_c9)._m0[144].y, _281);
    bool _287 = !_255;
    float _305;
    if (!_287)
    {
        float _289 = in.m_58.x;
        float _291 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _293 = _289 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _295 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[11].y, _137);
        float _297 = _295 * _291;
        float _299 = floor(_297);
        float _301 = -_299;
        float _303 = _297 + _301;
        _305 = _303;
        _307 = true;
    }
    else
    {
        _305 = _163;
    }
    _307 = false;
    float _309 = _305;
    bool _311 = _309 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _313 = isnan(_309);
    bool _315 = _311 || _313;
    bool _317 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _319 = _315 || _317;
    float _321 = float(_319);
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _325 = _323 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _327 = _309 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _329 = isnan(_309);
    bool _331 = _327 || _329;
    bool _333 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _335 = _331 || _333;
    float _337 = float(_335);
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _341 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _339;
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _345 = _309 + _343;
    float _347 = -_321;
    float _349 = _347 + 1.0;
    bool _351 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _353 = 1.0 / _325;
    float _355 = _337 * _349;
    float _357 = -_337;
    float _359 = _357 + 1.0;
    float _361 = _341 * _353;
    float _363 = fma(_361, _345, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _365 = _363 * _355;
    float _367 = fma(_359, (*spvDescriptorSet0.vp_c9)._m0[115].x, _365);
    float _369 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _371 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _373 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _375 = fma(_321, (*spvDescriptorSet0.vp_c9)._m0[116].x, _367);
    float _377 = _369 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _379 = _371 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _381 = _373 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _383 = _375 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _385 = in.m_60.x;
    float _387 = in.m_60.y;
    out.m_62.x = _377;
    out.m_62.y = _379;
    out.m_62.z = _381;
    out.m_62.w = _383;
    float _389 = _285 * _387;
    float _391 = _283 * _385;
    bool _393 = !_351;
    if (!_393)
    {
        float _395 = in.m_58.x;
        float _397 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _399 = _395 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _401 = fma(_399, (*spvDescriptorSet0.vp_c9)._m0[11].w, _137);
        float _403 = _401 * _397;
        float _405 = floor(_403);
        float _407 = -_405;
        float _409 = _403 + _407;
        _165 = _409;
    }
    float _411 = _165;
    float _413 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _415 = int(_413);
    float _417 = in.m_58.x;
    int _419 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _421 = _419 != 0;
    float _423 = in.m_58.z;
    float _425 = in.m_58.w;
    float _427 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _429 = int(_427);
    int _431 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _433 = _431 != 0;
    float _435 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _437 = float(_415);
    float _439 = 0.0;
    float _441 = _437;
    if (!_421)
    {
        float _443 = in.m_58.y;
        _439 = _443;
    }
    float _445 = _439;
    float _447 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _449 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _451 = 1.0 / _437;
    float _453 = float(uint(_429));
    int _455 = ~_429;
    int _457 = _455 + 1;
    float _459 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _461 = _429 == 0;
    float _463 = 1.0 / _453;
    float _465 = _451 * _137;
    float _467 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _469 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    if (!_421)
    {
        _441 = _445;
    }
    float _471 = _441;
    float _473 = trunc(_465);
    int _475 = int(_473);
    float _477 = fma(_417, (*spvDescriptorSet0.vp_c9)._m0[88].z, _467);
    int _479 = as_type<int>(_463) + (-2);
    int _481 = ~_429;
    int _483 = _481 + 1;
    float _485 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[87].z, _477);
    float _487 = 0.0;
    float _489 = _471;
    if (!_421)
    {
        _487 = _471;
    }
    float _491 = _487;
    float _493 = -_485;
    float _495 = _493 + 1.0;
    float _497 = _491;
    int _499 = as_type<int>(_445);
    if (_421)
    {
        float _501 = in.m_58.x;
        float _503 = in.m_58.y;
        _497 = _501;
        _499 = as_type<int>(_503);
    }
    float _505 = _497;
    int _507 = _499;
    float _509 = float(uint(_475));
    float _511 = as_type<float>(_479) * _509;
    float _513 = trunc(_511);
    float _515 = precise::max(_513, 0.0);
    uint _518 = uint(_515);
    bool _520 = !_421;
    float _522 = _520 ? as_type<float>(_507) : _417;
    float _524 = as_type<float>(_507) * 2.0;
    bool _526 = !_421;
    float _528 = _526 ? 1.2345600128173828125 : 1.0;
    float _530 = fma(as_type<float>(_507), (*spvDescriptorSet0.vp_c9)._m0[88].w, _469);
    int _532 = _483 * int(_518);
    int _534 = _532 + _475;
    float _536 = as_type<float>(_534);
    if (_421)
    {
        _489 = as_type<float>(_507);
    }
    float _538 = _489;
    float _540 = _528 * _522;
    float _542 = float(_429);
    float _544 = floor(_524);
    float _546 = float(uint(_534));
    float _548 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[87].w, _530);
    float _550 = _538;
    if (_421)
    {
        _536 = _417;
    }
    float _552 = _536;
    float _554 = _552;
    if (!_421)
    {
        _554 = _423;
    }
    float _556 = _554;
    float _558 = as_type<float>(_479) * _546;
    float _560 = -_548;
    float _562 = _560 + 1.0;
    float _564 = trunc(_558);
    float _566 = precise::max(_564, 0.0);
    uint _568 = uint(_566);
    int _570 = int(_518) + int(_568);
    float _572 = float(_475);
    float _574 = floor(_540);
    int _576 = _457 * _570;
    int _578 = _576 + _475;
    bool _580 = _572 >= _542;
    bool _582 = isnan(_572);
    bool _584 = _580 || _582;
    bool _586 = isnan(_542);
    bool _588 = _584 || _586;
    float _590 = float(_588);
    bool _592 = uint(_578) >= uint(_429);
    float _594 = trunc(_590);
    int _596 = int(_594);
    bool _598 = !_592;
    int _600 = _598 ? 0 : (-1);
    int _602 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _604 = _602 != 0;
    int _606 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _608 = _606 != 0;
    int _610 = ~_570;
    int _612 = _610 + _600;
    int _614 = _612 + 1;
    float _616 = -_574;
    float _618 = _540 + _616;
    float _620 = _542 * _137;
    int _622 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _624 = _622 != 0;
    int _626 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _628 = _626 != 0;
    int _630 = _429 * _614;
    int _632 = _630 + _475;
    float _634 = _542 * _618;
    float _636 = _620 * _155;
    int _638 = _429 + (-1);
    int _640 = ~_596;
    int _642 = _640 + 1;
    int _644 = _642 + 1;
    bool _646 = !_461;
    int _648 = _646 ? _632 : (-1);
    float _650 = trunc(_634);
    int _652 = int(_650);
    bool _654 = !_433;
    int _656 = _654 ? 0 : 1;
    bool _658 = !_604;
    int _660 = _658 ? 0 : 1;
    int _662 = _648 * _644;
    bool _664 = !_608;
    int _666 = _664 ? 0 : 1;
    float _668 = trunc(_636);
    int _670 = int(_668);
    int _672 = _596 * _638;
    int _674 = _672 + _662;
    int _676 = abs(_666);
    int _678 = abs(_656);
    bool _680 = !_624;
    int _682 = _680 ? 0 : 1;
    int _684 = abs(_660);
    int _686 = _652 * _678;
    int _688 = _686 + _475;
    bool _690 = !_628;
    int _692 = _690 ? 0 : 1;
    int _694 = abs(_682);
    int _696 = _674 * _676;
    int _698 = abs(_692);
    int _700 = _670 * _684;
    int _702 = _700 + _696;
    int _704 = ~_429;
    int _706 = _704 + 1;
    int _708 = _688 * _694;
    int _710 = _708 + _702;
    bool _712 = _425 > 0.5;
    int _714 = _652 * _698;
    int _716 = _714 + _710;
    int _718 = ~_429;
    int _720 = _718 + 1;
    float _722 = float(uint(_688));
    float _724 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _726 = _724 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _728 = float(uint(_716));
    float _730 = as_type<float>(_479) * _728;
    float _732 = 1.0 / _726;
    float _734 = trunc(_730);
    float _736 = precise::max(_734, 0.0);
    uint _738 = uint(_736);
    int _740 = _720 * int(_738);
    int _742 = _740 + _716;
    float _744 = float(uint(_742));
    float _746 = as_type<float>(_479) * _744;
    float _748 = trunc(_746);
    float _750 = precise::max(_748, 0.0);
    uint _752 = uint(_750);
    float _754 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _756 = int(_738) + int(_752);
    float _758 = _505 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _760 = as_type<float>(_752);
    float _762 = _556;
    if (!_421)
    {
        float _764 = in.m_58.z;
        _760 = _764;
    }
    float _766 = _760;
    float _768 = fma(_505, (*spvDescriptorSet0.vp_c9)._m0[83].z, _754);
    int _770 = _706 * _756;
    int _772 = _770 + _716;
    float _774 = -_435;
    float _776 = fma(_758, 2.0, _774);
    float _778 = in.m_46.x;
    float _780 = in.m_46.y;
    float _782 = in.m_46.z;
    float _784 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[82].z, _768);
    bool _786 = uint(_772) >= uint(_429);
    float _788 = -_137;
    float _790 = fma(_788, (*spvDescriptorSet0.vp_c9)._m0[81].x, _776);
    float _792 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _794 = !_786;
    int _796 = _794 ? 0 : (-1);
    int _798 = ~_756;
    int _800 = _798 + _796;
    int _802 = _800 + 1;
    float _804 = _556 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _806 = _417 * 2.0;
    int _808 = _429 * _802;
    int _810 = _808 + _716;
    float _812 = -_447;
    float _814 = fma(_804, 2.0, _812);
    float _816 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _818 = log2(_816);
    float _820 = _766;
    if (!_421)
    {
        _762 = _766;
    }
    float _822 = _762;
    bool _824 = !_461;
    int _826 = _824 ? _810 : (-1);
    float _828 = -_137;
    float _830 = fma(_828, (*spvDescriptorSet0.vp_c9)._m0[86].x, _814);
    float _832 = _822;
    if (_421)
    {
        _820 = _538;
    }
    float _834 = _820;
    float _836 = in.m_64.x;
    float _838 = in.m_64.y;
    float _840 = in.m_64.z;
    float _842 = in.m_64.w;
    int _844 = _826 & 3;
    bool _846 = _844 != 0;
    float _848 = floor(_806);
    int _850 = _826 & 3;
    bool _852 = _850 != 0;
    float _854 = fma(_834, (*spvDescriptorSet0.vp_c9)._m0[83].w, _792);
    int _856 = _846 ? 0 : 1;
    bool _858 = _850 != 3;
    bool _860 = uint(_850) >= 2u;
    float _862 = _818 * _137;
    if (_421)
    {
        _832 = _538;
    }
    float _864 = _832;
    if (!_421)
    {
        _550 = _417;
    }
    float _866 = _550;
    int _868 = _860 ? 0 : 1;
    float _870 = _864 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _872 = -_189;
    int _874 = _712 ? as_type<int>(_872) : as_type<int>(_189);
    float _876 = exp2(_862);
    int _878 = ~_868;
    int _880 = _878 + 1;
    int _882 = _880 + 1;
    float _884 = _866 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    bool _886 = uint(_850) > 1u;
    float _888 = fma(_870, -2.0, _459);
    int _890 = _882;
    if (_858)
    {
        int _892 = ~_868;
        int _894 = _892 + 1;
        _890 = _894;
    }
    int _896 = _890;
    float _898 = fma(_884, -2.0, _449);
    int _900 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _902 = _900 != 0;
    float _904 = _780 * _838;
    bool _906 = _423 > 0.5;
    float _908 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[86].y, _898);
    bool _910 = !_902;
    float _912 = _910 ? _189 : as_type<float>(_874);
    float _914 = fma(_778, _836, _904);
    float _916 = -_185;
    int _918 = _906 ? as_type<int>(_916) : as_type<int>(_185);
    int _920 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _922 = _920 != 0;
    float _924 = -_876;
    float _926 = _924 + 1.0;
    int _928 = ~_856;
    int _930 = _928 + 1;
    int _932 = _930 + 1;
    bool _934 = !_922;
    float _936 = _934 ? _185 : as_type<float>(_918);
    bool _938 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _940 = isnan(1.0);
    bool _942 = _938 || _940;
    bool _944 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _946 = _942 || _944;
    float _948 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _950 = 1.0 + _948;
    bool _952 = _848 > 0.0;
    float _954 = in.m_66.x;
    float _956 = in.m_66.y;
    float _958 = in.m_66.z;
    float _960 = in.m_66.w;
    bool _962 = _848 >= 0.0;
    bool _964 = isnan(_848);
    bool _966 = _962 || _964;
    bool _968 = isnan(0.0);
    bool _970 = _966 || _968;
    float _972 = 1.0 / _950;
    int _974 = _932;
    if (!_886)
    {
        int _976 = ~_856;
        int _978 = _976 + 1;
        _974 = _978;
    }
    int _980 = _974;
    float _982 = in.m_68.x;
    float _984 = in.m_68.y;
    float _986 = in.m_68.z;
    float _988 = in.m_68.w;
    bool _990 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _992 = isnan(0.0);
    bool _994 = _990 || _992;
    bool _996 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _998 = _994 || _996;
    float _1000 = -_189;
    int _1002 = _906 ? as_type<int>(_1000) : as_type<int>(_189);
    float _1004 = _998 ? _926 : 0.0;
    float _1006 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[82].w, _854);
    float _1008 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[81].y, _888);
    int _1010 = _970 ? 0 : 1;
    int _1012 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1014 = _1012 != 0;
    int _1016 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1018 = _1016 != 0;
    int _1020 = ~_1010;
    int _1022 = _1020 + 1;
    int _1024 = _1022 + 1;
    int _1026 = _1024;
    if (_946)
    {
        float _1028 = _1004 * _972;
        _159 = _1028;
    }
    float _1030 = _159;
    bool _1032 = _417 > 0.5;
    if (!_952)
    {
        int _1034 = ~_1010;
        int _1036 = _1034 + 1;
        _1026 = _1036;
    }
    int _1038 = _1026;
    bool _1040 = !_1018;
    float _1042 = _1040 ? _189 : as_type<float>(_1002);
    float _1044 = -_185;
    int _1046 = _1032 ? as_type<int>(_1044) : as_type<int>(_185);
    bool _1048 = _544 >= 0.0;
    bool _1050 = isnan(_544);
    bool _1052 = _1048 || _1050;
    bool _1054 = isnan(0.0);
    bool _1056 = _1052 || _1054;
    int _1058 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1060 = _1058 != 0;
    float _1062 = _780 * _984;
    int _1064 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1066 = _1064 != 0;
    float _1068 = _780 * _956;
    int _1070 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1072 = _1070 != 0;
    float _1074 = _423 * 2.0;
    int _1076 = _1056 ? 0 : 1;
    float _1078 = as_type<float>(_479) * _722;
    float _1080 = floor(_1074);
    bool _1082 = _544 > 0.0;
    float _1084 = fma(_778, _954, _1068);
    float _1086 = fma(_778, _982, _1062);
    float _1088 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1090 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1088;
    float _1092 = fma(_782, _840, _914);
    int _1094 = ~_1076;
    int _1096 = _1094 + 1;
    int _1098 = _1096 + 1;
    float _1100 = fma(_782, _986, _1086);
    float _1102 = trunc(_1078);
    float _1104 = precise::max(_1102, 0.0);
    uint _1106 = uint(_1104);
    float _1108 = _1090 * _732;
    bool _1110 = _411 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1112 = isnan(_411);
    bool _1114 = _1110 || _1112;
    bool _1116 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1118 = _1114 || _1116;
    float _1120 = float(_1118);
    float _1122 = fma(_782, _958, _1084);
    float _1124 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1126 = _411 + _1124;
    bool _1128 = _411 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1130 = isnan(_411);
    bool _1132 = _1128 || _1130;
    bool _1134 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1136 = _1132 || _1134;
    float _1138 = float(_1136);
    float _1140 = _1100 + _988;
    int _1142 = _1098;
    float _1144 = _1140;
    if (!_1082)
    {
        int _1146 = ~_1076;
        int _1148 = _1146 + 1;
        _1142 = _1148;
    }
    int _1150 = _1142;
    float _1152 = -_1120;
    float _1154 = _1152 + 1.0;
    int _1156 = ~_429;
    int _1158 = _1156 + 1;
    float _1160 = fma(_1108, _1126, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _1162 = _1080 >= 0.0;
    bool _1164 = isnan(_1080);
    bool _1166 = _1162 || _1164;
    bool _1168 = isnan(0.0);
    bool _1170 = _1166 || _1168;
    float _1172 = _1138 * _1154;
    float _1174 = _1092 + _842;
    float _1176 = _1122 + _960;
    int _1178 = _1170 ? 0 : 1;
    int _1180 = _1158 * int(_1106);
    int _1182 = _1180 + _688;
    bool _1184 = _1080 > 0.0;
    float _1186 = _1160 * _1172;
    float _1188 = -_1138;
    float _1190 = _1188 + 1.0;
    int _1192 = ~_1178;
    int _1194 = _1192 + 1;
    int _1196 = _1194 + 1;
    float _1198 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1200 = _1140 + _1198;
    float _1202 = float(uint(_1182));
    float _1204 = fma(_1190, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1186);
    int _1206 = _826 >> 31;
    float _1208 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1210 = _1174 + _1208;
    float _1212 = _1200 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1214 = as_type<float>(_479) * _1202;
    int _1216 = _1206 & 3;
    float _1218 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1220 = _1176 + _1218;
    int _1222 = _1196;
    float _1224 = _1174;
    if (!_1184)
    {
        int _1226 = ~_1178;
        int _1228 = _1226 + 1;
        _1222 = _1228;
    }
    int _1230 = _1222;
    float _1232 = fma(_1210, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1212);
    int _1234 = _826 + _1216;
    float _1236 = trunc(_1214);
    float _1238 = precise::max(_1236, 0.0);
    uint _1240 = uint(_1238);
    bool _1242 = as_type<float>(_507) > 0.5;
    float _1244 = fma(_1220, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1232);
    int _1246 = _1234 >> 2;
    float _1248 = fma(_1120, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1204);
    bool _1250 = !_1066;
    float _1252 = _1250 ? _185 : as_type<float>(_1046);
    float _1254 = as_type<float>(_507) + _417;
    int _1256 = _1246 << 4;
    int _1258 = _1256 + 512;
    float _1260 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1262 = -_185;
    int _1264 = _1242 ? as_type<int>(_1262) : as_type<int>(_185);
    float _1266 = _1248 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    uint _1268 = uint(int(uint(_1258) >> uint(2)));
    uint _1270 = uint(int(uint(int(_1268)) >> uint(2)));
    int _1272 = int(_1268) & 3;
    float _1274 = (*spvDescriptorSet0.vp_c9)._m0[int(_1270)][_1272];
    int _1276 = int(_1268) + 1;
    uint _1278 = uint(int(uint(_1276) >> uint(2)));
    int _1280 = _1276 & 3;
    float _1282 = (*spvDescriptorSet0.vp_c9)._m0[int(_1278)][_1280];
    float _1284 = -_189;
    int _1286 = _1242 ? as_type<int>(_1284) : as_type<int>(_189);
    float _1288 = _1254 + (-1.0);
    bool _1290 = _1244 >= 0.0;
    float _1292 = _936 + 0.5;
    int _1294 = int(_1106) + int(_1240);
    float _1296 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1298 = fma(_1292, (*spvDescriptorSet0.vp_c9)._m0[85].x, _790);
    float _1300 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _1302 = ~_429;
    int _1304 = _1302 + 1;
    float _1306 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _1308 = !_1014;
    float _1310 = _1308 ? _185 : as_type<float>(_1264);
    float _1312 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1314 = _1300 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1316 = _1306 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1318 = _1312 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1320 = _1304 * _1294;
    int _1322 = _1320 + _688;
    float _1324 = _1260 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _1326 = !_1072;
    float _1328 = _1326 ? _189 : as_type<float>(_1286);
    float _1330 = fma(_1288, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    out.m_70.x = _1314;
    out.m_70.y = _1316;
    out.m_70.z = _1318;
    out.m_70.w = _1266;
    float _1332 = _1288;
    int _1334 = as_type<int>(_1260);
    if (_1290)
    {
        _1332 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1336 = _1332;
    float _1338 = _1252 + 0.5;
    bool _1340 = uint(_1322) >= uint(_429);
    float _1342 = _912 + (-0.5);
    bool _1344 = _850 != 3;
    if (_1290)
    {
        float _1346 = _1336 * 5.0;
        _1334 = as_type<int>(_1346);
    }
    int _1348 = _1334;
    bool _1350 = !_852;
    int _1352 = _1350 ? 0 : 1;
    float _1354 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1356 = !_1340;
    int _1358 = _1356 ? 0 : (-1);
    float _1360 = -_1328;
    float _1362 = _1360 + 0.5;
    int _1364 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1366 = _1364 != 0;
    int _1368 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1370 = _1368 != 0;
    int _1372 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1374 = _1372 != 0;
    float _1376 = -_1342;
    float _1378 = -_1008;
    float _1380 = fma(_1376, (*spvDescriptorSet0.vp_c9)._m0[85].y, _1378);
    int _1382 = abs(_1352);
    int _1384 = _1258 + 8;
    uint _1386 = uint(int(uint(_1384) >> uint(2)));
    uint _1388 = uint(int(uint(int(_1386)) >> uint(2)));
    int _1390 = int(_1386) & 3;
    float _1392 = (*spvDescriptorSet0.vp_c9)._m0[int(_1388)][_1390];
    int _1394 = int(_1386) + 1;
    uint _1396 = uint(int(uint(_1394) >> uint(2)));
    int _1398 = _1394 & 3;
    float _1400 = (*spvDescriptorSet0.vp_c9)._m0[int(_1396)][_1398];
    float _1402 = _1310 + 0.5;
    float _1404 = _1296 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    if (_1290)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5069 = as_type<float>(_1348);
        out.gl_Position.z = _5069;
    }
    bool _1406 = !_1344;
    int _1408 = _1406 ? 0 : (-1);
    float _1410 = fma(_1324, _1402, _830);
    float _1412 = _1200 * _1200;
    int _1414 = abs(_980);
    float _1416 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1418 = abs(_896);
    float _1420 = fma(_1210, _1210, _1412);
    float _1422 = _1042 + (-0.5);
    int _1424 = ~_1294;
    int _1426 = _1424 + _1358;
    int _1428 = _1426 + 1;
    float _1430 = _1362 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1432 = fma(_1220, _1220, _1420);
    float _1434 = -_1404;
    float _1436 = -_908;
    float _1438 = fma(_1434, _1422, _1436);
    int _1440 = ~_1414;
    int _1442 = _1440 + 1;
    int _1444 = _1442 + 1;
    float _1446 = rsqrt(_1432);
    int _1448 = ~_1382;
    int _1450 = _1448 + 1;
    int _1452 = _1450 + 1;
    float _1454 = -_784;
    float _1456 = _1454 + 1.0;
    int _1458 = _429 * _1428;
    int _1460 = _1458 + _688;
    bool _1462 = !_1060;
    int _1464 = _1462 ? 0 : 1;
    int _1466 = _1444 * as_type<int>(_1282);
    float _1468 = -_1456;
    float _1470 = fma(_936, _1468, _1298);
    bool _1472 = _429 == 0;
    float _1474 = -_495;
    float _1476 = fma(_1310, _1474, _1410);
    int _1478 = _1452 * as_type<int>(_1274);
    int _1480 = _1478 + _1466;
    float _1482 = _1338 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1484 = -_1006;
    float _1486 = _1484 + 1.0;
    int _1488 = abs(_1464);
    float _1490 = fma(_1042, _562, _1438);
    float _1492 = _1482 * _1354;
    float _1494 = fma(_912, _1486, _1380);
    int _1496 = abs(_1408);
    float _1498 = _1430 * _1416;
    float _1500 = _1200 * _1446;
    int _1502 = ~_1496;
    int _1504 = _1502 + 1;
    int _1506 = _1504 + 1;
    float _1508 = _1210 * _1446;
    int _1510 = ~_1418;
    int _1512 = _1510 + 1;
    int _1514 = _1512 + 1;
    out.m_72.x = _1492;
    out.m_72.y = _1498;
    out.m_72.z = _1470;
    out.m_72.w = _1494;
    bool _1516 = !_1366;
    int _1518 = _1516 ? 0 : 1;
    float _1520 = -_1500;
    float _1522 = fma(_1520, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1200);
    float _1524 = float(_1230);
    float _1526 = -_1508;
    float _1528 = fma(_1526, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1210);
    float _1530 = float(_1038);
    float _1532 = _1522 * _1522;
    int _1534 = _1514 * as_type<int>(_1392);
    int _1536 = _1534 + _1480;
    out.m_74.x = _1476;
    out.m_74.y = _1490;
    float _1538 = fma(_1528, _1528, _1532);
    int _1540 = _1506 * as_type<int>(_1400);
    int _1542 = _1540 + _1536;
    if (_1290)
    {
        out.m_49.x = 0.0;
    }
    int _1544 = abs(_1518);
    float _1546 = in.m_76.x;
    float _1548 = in.m_76.y;
    float _1550 = in.m_76.z;
    int _1552 = ~_1488;
    int _1554 = _1552 + 1;
    int _1556 = _1554 + 1;
    float _1558 = float(_1544);
    bool _1560 = !_1472;
    int _1562 = _1560 ? _1460 : (-1);
    int _1564 = _1542 * _1556;
    bool _1566 = !_1370;
    int _1568 = _1566 ? 0 : 1;
    float _1570 = _1558 * _1524;
    float _1572 = _1220 * _1446;
    int _1574 = _1562 * _1488;
    int _1576 = _1574 + _1564;
    int _1578 = abs(_1568);
    float _1580 = _1570 * (-2.0);
    float _1582 = _417 + (-0.5);
    float _1584 = -_1572;
    float _1586 = fma(_1584, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1220);
    float _1588 = float(_1576);
    float _1590 = fma(_1330, _1580, _1330);
    float _1592 = float(_1578);
    float _1594 = fma(_1586, _1586, _1538);
    out.m_78.y = _1588;
    float _1596 = _1592 * _1530;
    bool _1598 = !_1374;
    int _1600 = _1598 ? 0 : 1;
    float _1602 = fma(_1580, _1546, _1546);
    float _1604 = fma(_1582, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1602);
    float _1606 = _423 + as_type<float>(_507);
    float _1608 = _1572;
    if (_1290)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1610 = -_1500;
    float _1612 = fma(_1610, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1140);
    float _1614 = -_1508;
    float _1616 = fma(_1614, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1174);
    float _1618 = -_1572;
    float _1620 = fma(_1618, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1176);
    float _1622 = float(_1150);
    float _1624 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1626 = _1612 + _1624;
    float _1628 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1630 = _1616 + _1628;
    float _1632 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1634 = _1620 + _1632;
    float _1636 = _1626 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1638 = abs(_1600);
    float _1640 = _1606 + (-1.0);
    float _1642 = _1596 * (-2.0);
    float _1644 = fma(_1630, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1636);
    float _1646 = float(_1638);
    float _1648 = fma(_1640, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1650 = as_type<float>(_507) + (-0.5);
    float _1652 = fma(_1634, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1644);
    float _1654 = fma(_1642, _1548, _1548);
    float _1656 = _423 + _417;
    float _1658 = _1646 * _1622;
    float _1660 = fma(_1648, _1642, _1648);
    bool _1662 = _1652 >= 0.0;
    float _1664 = fma(_1650, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1654);
    float _1666 = _1656 + (-1.0);
    float _1668 = _1658 * (-2.0);
    float _1670 = fma(_1660, _1030, _1664);
    float _1672 = fma(_1590, _1030, _1604);
    float _1674 = fma(_1666, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1676 = fma(_1668, _1550, _1550);
    float _1678 = _1670 * 0.15915493667125701904296875;
    float _1680 = sqrt(_1594);
    float _1682 = _423 + (-0.5);
    float _1684 = fma(_1674, _1668, _1674);
    float _1686 = _1670;
    if (_1662)
    {
        _1686 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1688 = _1686;
    float _1690 = fma(_1682, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1676);
    float _1692 = _1672 * 0.15915493667125701904296875;
    int _1694 = as_type<int>(_1688);
    if (_1662)
    {
        out.m_49.x = 0.0;
    }
    float _1696 = _1678 * 6.283185482025146484375;
    float _1698 = sin(_1696);
    if (_1662)
    {
        float _1700 = _1688 * 5.0;
        _1694 = as_type<int>(_1700);
    }
    int _1702 = _1694;
    float _1704 = fma(_1684, _1030, _1690);
    if (_1662)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5536 = as_type<float>(_1702);
        out.gl_Position.z = _5536;
    }
    float _1706 = _1678 * 6.283185482025146484375;
    float _1708 = cos(_1706);
    float _1710 = _1692 * 6.283185482025146484375;
    float _1712 = sin(_1710);
    float _1714 = _1692 * 6.283185482025146484375;
    float _1716 = cos(_1714);
    float _1718 = _1704 * 0.15915493667125701904296875;
    if (_1662)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1720 = _1718 * 6.283185482025146484375;
    float _1722 = cos(_1720);
    float _1724 = _1446 * _1680;
    float _1726 = _389 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1728 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _189);
    float _1730 = _391 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1732 = _1716 * _1708;
    float _1734 = _1724 * _1726;
    float _1736 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _185);
    float _1738 = _1718 * 6.283185482025146484375;
    float _1740 = sin(_1738);
    float _1742 = _1724 * _1730;
    float _1744 = _1728 * _1734;
    float _1746 = _1712 * _1698;
    float _1748 = _1716 * _1698;
    float _1750 = _1712 * _1708;
    float _1752 = _1736 * _1742;
    float _1754 = _1716 * _1722;
    float _1756 = _1712 * _1722;
    float _1758 = _1708 * _1722;
    float _1760 = _1698 * _1722;
    float _1762 = _1754 * _1744;
    float _1764 = _1724 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1766 = _1764 * 0.5;
    float _1768 = _1756 * _1744;
    float _1770 = _1612 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1772 = fma(_1740, _1732, _1746);
    float _1774 = -_1744;
    float _1776 = _1740 * _1774;
    float _1778 = -_1750;
    float _1780 = fma(_1740, _1748, _1778);
    float _1782 = -_1748;
    float _1784 = fma(_1740, _1750, _1782);
    float _1786 = fma(_1772, _1752, _1762);
    float _1788 = fma(_1758, _1752, _1776);
    bool _1790 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1792 = isnan(0.5);
    bool _1794 = _1790 || _1792;
    bool _1796 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1798 = _1794 || _1796;
    float _1800 = fma(_1784, _1752, _1768);
    float _1802 = fma(_1780, _1766, _1786);
    float _1804 = fma(_1740, _1746, _1732);
    float _1806 = fma(_1760, _1766, _1788);
    bool _1808 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1810 = isnan(0.5);
    bool _1812 = _1808 || _1810;
    bool _1814 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1816 = _1812 || _1814;
    float _1818 = _1802 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1820 = fma(_1804, _1766, _1800);
    float _1822 = _1802 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1824 = fma(_1806, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1818);
    float _1826 = fma(_1806, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1822);
    float _1828 = fma(_1616, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1770);
    float _1830 = fma(_1820, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1824);
    float _1832 = fma(_1820, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1826);
    float _1834 = fma(_1620, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1828);
    float _1836 = _1830 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1838 = _1832 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1840 = _1834 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1842 = _1176 + _1836;
    float _1844 = _1612 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1846 = _1174 + _1838;
    float _1848 = 1.0 / _1840;
    float _1850 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1852 = _1842 + _1850;
    float _1854 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1856 = _1846 + _1854;
    float _1858 = _1852 * _1852;
    float _1860 = fma(_1856, _1856, _1858);
    float _1862 = fma(_1616, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1844);
    float _1864 = sqrt(_1860);
    float _1866 = fma(_1620, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1862);
    float _1868 = _1866 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1870 = _1868 + _1840;
    float _1872 = _1802 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1874 = _1870 * _1848;
    float _1876 = _1874 * 0.5;
    float _1878 = fma(_1806, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1872);
    bool _1880 = _1864 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1882 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1884 = fma(_1876, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1882);
    float _1886 = fma(_1820, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1878);
    float _1888 = _1886 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1890 = 1.0 / _1884;
    float _1892 = _1140 + _1888;
    float _1894 = _1870;
    float _1896 = _1888;
    float _1898 = _1876;
    if (!_1880)
    {
        _1894 = _1846;
    }
    float _1900 = _1894;
    float _1902 = _1900;
    if (!_1880)
    {
        _1896 = _1842;
    }
    float _1904 = _1896;
    float _1906 = _1904;
    if (!_1880)
    {
        _1898 = _1892;
    }
    float _1908 = _1898;
    bool _1910 = !_1880;
    float _1912 = _1908;
    if (!_1910)
    {
        float _1914 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1916 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1918 = _1864 + _1916;
        float _1920 = _1892 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1922 = _1918 * _1914;
        float _1924 = rsqrt(_1860);
        float _1926 = _1922 * 0.15915493667125701904296875;
        float _1928 = _1926 * 6.283185482025146484375;
        float _1930 = cos(_1928);
        float _1932 = _1926 * 6.283185482025146484375;
        float _1934 = sin(_1932);
        float _1936 = _1930 + (-1.0);
        float _1938 = _1936 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1940 = fma(_1934, _1920, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1942 = fma(_1892, _1930, _1938);
        float _1944 = _1924 * _1940;
        float _1946 = fma(_1856, _1944, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1948 = fma(_1852, _1944, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1906 = _1948;
        _1902 = _1946;
        _1912 = _1942;
    }
    float _1950 = _1906;
    float _1952 = _1902;
    float _1954 = _1912;
    float _1956 = -_1572;
    float _1958 = fma(_1956, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1950);
    float _1960 = -_1508;
    float _1962 = fma(_1960, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1952);
    float _1964 = -_1500;
    float _1966 = fma(_1964, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1954);
    float _1968 = _1966;
    float _1970 = _1962;
    float _1972 = _1958;
    float _1974 = _1950;
    if (_1816)
    {
        _1608 = 1.0;
    }
    float _1976 = _1608;
    float _1978 = _1976;
    if (!_1798)
    {
        float _1980 = _1626 * _1626;
        float _1982 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1984 = -_1176;
        float _1986 = _1984 + _1950;
        float _1988 = fma(_1630, _1630, _1980);
        float _1990 = fma(_1634, _1634, _1988);
        float _1992 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1994 = sqrt(_1990);
        float _1996 = 1.0 / _1724;
        float _1998 = _1992 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2000 = precise::min(_1994, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2002 = _2000 * _1982;
        float _2004 = -_1140;
        float _2006 = _2004 + _1954;
        float _2008 = _2002 * _1996;
        float _2010 = -_1174;
        float _2012 = _2010 + _1952;
        float _2014 = _1998 * _2008;
        float _2016 = _1986 * _2008;
        float _2018 = fma(_2006, _2014, _1612);
        float _2020 = fma(_2012, _2014, _1616);
        float _2022 = fma(_1998, _2016, _1620);
        _1968 = _2018;
        _1970 = _2020;
        _1972 = _2022;
    }
    float _2024 = _1968;
    float _2026 = _1970;
    float _2028 = _1972;
    if (_1816)
    {
        _1974 = 1.0;
    }
    float _2030 = _1974;
    float _2032 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2034 = _1890 * _2032;
    float _2036 = _2030;
    if (!_1816)
    {
        float _2038 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2040 = _2038 * 0.15915493667125701904296875;
        float _2042 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2044 = _2040 * 6.283185482025146484375;
        float _2046 = cos(_2044);
        float _2048 = _2042 * 0.15915493667125701904296875;
        float _2050 = _2040 * 6.283185482025146484375;
        float _2052 = sin(_2050);
        float _2054 = 1.0 / _2046;
        float _2056 = _2048 * 6.283185482025146484375;
        float _2058 = cos(_2056);
        float _2060 = _2052 * _2054;
        float _2062 = _2048 * 6.283185482025146484375;
        float _2064 = sin(_2062);
        float _2066 = _2058 * _2060;
        float _2068 = 1.0 / _2066;
        float _2070 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2072 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2070;
        float _2074 = 1.0 / _2072;
        float _2076 = _2064 * _2068;
        float _2078 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2080 = fma(_2034, _2076, _2078);
        float _2082 = _2080 * _2074;
        float _2084 = precise::clamp(_2082, 0.0, 1.0);
        _1224 = _2048;
        _1144 = _2040;
        _1978 = _2084;
    }
    float _2086 = _1224;
    float _2088 = _1144;
    float _2090 = _1978;
    float _2092 = _2086;
    if (!_1816)
    {
        float _2094 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2096 = _2094 * 0.15915493667125701904296875;
        float _2098 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2100 = _2096 * 6.283185482025146484375;
        float _2102 = cos(_2100);
        float _2104 = _2098 * 0.15915493667125701904296875;
        float _2106 = _2096 * 6.283185482025146484375;
        float _2108 = sin(_2106);
        float _2110 = 1.0 / _2102;
        float _2112 = _2104 * 6.283185482025146484375;
        float _2114 = cos(_2112);
        float _2116 = _2108 * _2110;
        float _2118 = _2104 * 6.283185482025146484375;
        float _2120 = sin(_2118);
        float _2122 = _2114 * _2116;
        float _2124 = 1.0 / _2122;
        float _2126 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2128 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2126;
        float _2130 = 1.0 / _2128;
        float _2132 = _2120 * _2124;
        float _2134 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2136 = fma(_2034, _2132, _2134);
        float _2138 = _2136 * _2130;
        float _2140 = precise::clamp(_2138, 0.0, 1.0);
        float _2142 = -_2140;
        float _2144 = _2142 + 1.0;
        _2092 = _2110;
        _2036 = _2144;
    }
    float _2146 = _2092;
    float _2148 = _2036;
    float _2150 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2152 = _2024 + _2150;
    float _2154 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2156 = _2026 + _2154;
    float _2158 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2160 = _2028 + _2158;
    float _2162 = _2152 * _2152;
    float _2164 = fma(_2156, _2156, _2162);
    float _2166 = fma(_2160, _2160, _2164);
    float _2168 = rsqrt(_2166);
    float _2170 = _2168 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2172 = _2156 * _2170;
    float _2174 = _2160 * _2170;
    float _2176 = _2172 * _2172;
    float _2178 = _2174 * _2174;
    float _2180 = _2176 + _2178;
    float _2182 = sqrt(_2180);
    bool _2184 = _2182 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2186 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2188 = _2182 + _2186;
    float _2190 = _2160;
    float _2192 = _2162;
    float _2194 = _2188;
    float _2196 = _2146;
    float _2198 = _2152;
    float _2200 = _2180;
    if (_2184)
    {
        float _2202 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2190 = _2202;
    }
    float _2204 = _2190;
    if (_2184)
    {
        float _2206 = rsqrt(_2180);
        _2192 = _2206;
    }
    float _2208 = _2192;
    float _2210 = _2208;
    if (_2184)
    {
        float _2212 = _2188 * _2204;
        _2194 = _2212;
    }
    float _2214 = _2194;
    if (_2184)
    {
        float _2216 = _2214 * 0.15915493667125701904296875;
        _2196 = _2216;
    }
    float _2218 = _2196;
    float _2220 = _2168;
    float _2222 = _2218;
    if (_2184)
    {
        float _2224 = _2218 * 6.283185482025146484375;
        float _2226 = sin(_2224);
        _2220 = _2226;
    }
    float _2228 = _2220;
    float _2230 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2232 = precise::max(0.0, _2230);
    float _2234 = _2088;
    float _2236 = _2232;
    if (_2184)
    {
        float _2238 = _2218 * 6.283185482025146484375;
        float _2240 = cos(_2238);
        _2234 = _2240;
    }
    float _2242 = _2234;
    float _2244 = fma(_1616, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2246 = -_2170;
    float _2248 = -_2232;
    float _2250 = fma(_2152, _2246, _2248);
    if (_2184)
    {
        float _2252 = _2250 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2236 = _2252;
    }
    float _2254 = _2236;
    float _2256 = _2254;
    if (!_2184)
    {
        _2222 = _2172;
    }
    float _2258 = _2222;
    float _2260 = sqrt(_2166);
    float _2262 = _2228;
    float _2264 = _2258;
    if (_2184)
    {
        float _2266 = fma(_2228, _2254, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2262 = _2266;
    }
    float _2268 = _2262;
    float _2270 = _2268;
    float _2272 = _2242;
    if (_2184)
    {
        float _2274 = _2242 + (-1.0);
        _2198 = _2274;
    }
    float _2276 = _2198;
    float _2278 = _2276;
    if (_2184)
    {
        float _2280 = _2208 * _2268;
        _2256 = _2280;
    }
    float _2282 = _2256;
    if (!_2184)
    {
        _2210 = _2250;
    }
    float _2284 = _2210;
    float _2286 = _2284;
    if (_2184)
    {
        float _2288 = _2276 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2200 = _2288;
    }
    float _2290 = _2200;
    if (_2184)
    {
        float _2292 = _2172 * _2282;
        _2264 = _2292;
    }
    float _2294 = _2264;
    if (!_2184)
    {
        _2270 = _2176;
    }
    float _2296 = _2270;
    float _2298 = _2024 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2300 = _2296;
    if (!_2184)
    {
        _2278 = _2174;
    }
    float _2302 = _2278;
    float _2304 = _2302;
    if (_2184)
    {
        float _2306 = fma(_2250, _2242, _2290);
        _2286 = _2306;
    }
    float _2308 = _2286;
    if (_2184)
    {
        float _2310 = _2294 * _2294;
        _2300 = _2310;
    }
    float _2312 = _2300;
    if (_2184)
    {
        float _2314 = _2174 * _2282;
        _2304 = _2314;
    }
    float _2316 = _2304;
    if (!_2184)
    {
        _2272 = _2178;
    }
    float _2318 = _2272;
    float _2320 = floor(_2244);
    float _2322 = fma(_2308, _2308, _2312);
    float _2324 = _2318;
    if (_2184)
    {
        float _2326 = _2316 * _2316;
        _2324 = _2326;
    }
    float _2328 = _2324;
    float _2330 = _2024 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2332 = fma(_2026, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2298);
    float _2334 = _2322 + _2328;
    float _2336 = fma(_2026, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2330);
    float _2338 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2340 = fma(_2260, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2338);
    float _2342 = precise::clamp(_2340, 0.0, 1.0);
    float _2344 = rsqrt(_2334);
    float _2346 = fma(_2028, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2336);
    float _2348 = -_2342;
    float _2350 = _2348 + 1.0;
    float _2352 = fma(_2028, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2332);
    float _2354 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2356 = _2346 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2358 = abs(_2350);
    float _2360 = log2(_2358);
    float _2362 = _2356 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2364 = _2024 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2366 = fma(_1620, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2368 = -_2362;
    float _2370 = fma(_2368, _2354, 1.0);
    float _2372 = _2024 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2374 = fma(_2026, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2364);
    float _2376 = _2344 * _2294;
    float _2378 = _2344 * _2308;
    float _2380 = fma(_2026, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2372);
    float _2382 = fma(_2028, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2374);
    float _2384 = _2376 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2386 = _2344 * _2316;
    float _2388 = fma(_2028, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2380);
    float _2390 = _2382 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2392 = -_2384;
    float _2394 = fma(_2378, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2392);
    float _2396 = floor(_2366);
    float _2398 = _2388 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2400 = _2390 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2402 = -_2386;
    float _2404 = fma(_2402, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2394);
    float _2406 = _2360 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2408 = -_2320;
    float _2410 = _2244 + _2408;
    float _2412 = fma(_2398, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2400);
    float _2414 = fma(_2404, -0.5, 0.5);
    float _2416 = log2(_2370);
    float _2418 = _2390 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2420 = fma(_2356, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2412);
    float _2422 = _2390 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2424 = fma(_2398, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2418);
    float _2426 = fma(_2404, 0.5, 0.5);
    float _2428 = _2378 + 1.0;
    float _2430 = exp2(_2406);
    float _2432 = _2352 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2434 = -_2396;
    float _2436 = _2366 + _2434;
    float _2438 = fma(_2398, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2422);
    float _2440 = fma(_2356, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2424);
    float _2442 = fma(_2432, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2420);
    float _2444 = fma(_2426, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2446 = fma(_2356, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2438);
    float _2448 = sqrt(_2414);
    float _2450 = _2416 * 0.693147182464599609375;
    float _2452 = fma(_2426, _2444, -0.212114393711090087890625);
    float _2454 = -_2378;
    float _2456 = fma(_2430, _2428, _2454);
    float _2458 = 1.0 / _2442;
    float _2460 = fma(_2432, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2440);
    float _2462 = fma(_2432, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2446);
    float2 _6738 = float2(_2410, _2436);
    float _2464 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6738, float2(0.0), isnan(_6738)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6738, float2(0.0), isnan(_6738)), level(0.0)).x;
    float _2466 = fma(_2426, _2452, 1.570728778839111328125);
    float _2468 = _2450 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2470 = _2448 * 0.636619746685028076171875;
    float _2472 = -_2466;
    float _2474 = fma(_2470, _2472, 1.0);
    float _2476 = fma(_2456, 0.5, 0.5);
    float _2478 = _2460 * _2458;
    float _2480 = _2462 * _2458;
    float _2482 = fma(_2478, 0.5, 0.5);
    float _2484 = fma(_2480, -0.5, 0.5);
    float3 _6777 = float3(_2482, _2484, _2468);
    float _2486 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6777, float3(0.0), isnan(_6777)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6777, float3(0.0), isnan(_6777)), level(0.0)).x;
    float3 _6788 = float3(_2482, _2484, _2468);
    float4 _2489 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6788, float3(0.0), isnan(_6788)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6788, float3(0.0), isnan(_6788)), level(0.0)).xyzw;
    float _2491 = _2489.x;
    float _2493 = _2489.y;
    float _2495 = _2489.z;
    float _2497 = _2489.w;
    float2 _6804 = float2(_2474, _2476);
    float3 _2501 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6804, float2(0.0), isnan(_6804)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6804, float2(0.0), isnan(_6804)), level(0.0)).xyz;
    float _2503 = _2501.x;
    float _2505 = _2501.y;
    float _2507 = _2501.z;
    float _2509 = abs(_2034);
    float _2511 = log2(_2509);
    float _2513 = _1772 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2515 = _1772 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2517 = _1772 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2519 = fma(_1758, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2513);
    float _2521 = _1754 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2523 = _1780 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2525 = _1780 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2527 = _2390 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2529 = -_1740;
    float _2531 = fma(_2529, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2521);
    out.m_80.x = _2026;
    out.m_80.y = _2024;
    out.m_80.z = _2028;
    bool _2533 = _2260 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2535 = isnan(_2260);
    bool _2537 = _2533 || _2535;
    bool _2539 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2541 = _2537 || _2539;
    float _2543 = _2511 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2545 = fma(_1758, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2515);
    float _2547 = _1754 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2549 = _1754 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2551 = fma(_1758, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2517);
    float _2553 = _1780 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2555 = exp2(_2543);
    float _2557 = -_1740;
    float _2559 = fma(_2557, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2547);
    float _2561 = -_1740;
    float _2563 = fma(_2561, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2549);
    float _2565 = fma(_1784, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2519);
    float _2567 = fma(_1784, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2551);
    float _2569 = fma(_1784, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2545);
    float _2571 = fma(_1760, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2523);
    float _2573 = fma(_1760, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2553);
    float _2575 = fma(_1760, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2525);
    float _2577 = fma(_1756, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2531);
    float _2579 = fma(_1756, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2559);
    float _2581 = fma(_1756, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2563);
    float _2583 = fma(_2398, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2527);
    float _2585 = fma(_1804, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2571);
    float _2587 = fma(_1804, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2573);
    float _2589 = fma(_2555, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2591 = precise::clamp(_2589, 0.0, 1.0);
    float _2593 = fma(_1804, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2575);
    float _2595 = _189 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2597 = fma(_2356, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2583);
    float _2599 = fma(_2591, -2.0, 3.0);
    float _2601 = _2591 * _2591;
    float _2603 = _2595 * _2579;
    float _2605 = in.m_82.x;
    float _2607 = _185 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2609 = _2601 * _2599;
    float _2611 = _2595 * _2577;
    float _2613 = _2595 * _2581;
    float _2615 = fma(_2432, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2597);
    float _2617 = _2360 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2619 = -_2609;
    float _2621 = _2619 + 1.0;
    bool _2623 = _2034 <= 8000.0;
    bool _2625 = isnan(_2034);
    bool _2627 = _2623 || _2625;
    bool _2629 = isnan(8000.0);
    bool _2631 = _2627 || _2629;
    float _2633 = float(_2631);
    float _2635 = fma(_2607, _2565, _2611);
    float _2637 = fma(_2607, _2567, _2613);
    float _2639 = fma(_2621, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2609);
    float _2641 = exp2(_2617);
    float _2643 = fma(_2607, _2569, _2603);
    float _2645 = _2585 + _2635;
    float _2647 = _2633 * _2639;
    float _2649 = _2593 + _2637;
    float _2651 = _2615 + _2442;
    float _2653 = _2460 + _2442;
    float _2655 = _2647 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2657 = _2442 * 0.5;
    float _2659 = _2587 + _2643;
    float _2661 = _2651 * 0.5;
    float _2663 = _2653 * 0.5;
    float _2665 = fma(_2462, -0.5, _2657);
    out.gl_Position.x = _2460;
    out.gl_Position.y = _2462;
    out.gl_Position.z = _2615;
    out.gl_Position.w = _2442;
    float _2667 = -_2641;
    float _2669 = _2667 + 1.0;
    out.m_84.x = _2663;
    out.m_84.y = _2665;
    out.m_84.z = _2661;
    out.m_84.w = _2442;
    float _2671 = _2669 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_86.x = _2645;
    out.m_86.y = _2659;
    out.m_86.z = _2649;
    float _2673 = -_2671;
    float _2675 = _2673 + 1.0;
    float _2677 = _2442;
    float _2679 = _2615;
    float _2681 = _2462;
    if (!_2541)
    {
        _2677 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2683 = _2677;
    float _2685 = _2683;
    float _2687 = _2683;
    if (!_2541)
    {
        _2679 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2689 = _2679;
    float _2691 = _2689;
    float _2693 = _2689;
    if (!_2541)
    {
        _2681 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2695 = _2681;
    float _2697 = -_2464;
    float _2699 = _2697 + 1.0;
    float _2701 = _2699 * _2655;
    float _2703 = precise::clamp(_2701, 0.0, 1.0);
    float _2705 = -_2703;
    float _2707 = fma(_2705, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2709 = _2707 * _2605;
    float _2711 = _2709 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_88.x = _2711;
    float _2713 = _2671 * _2486;
    float _2715 = _2497 * _2675;
    float _2717 = _2090 * _2148;
    float _2719 = _2497 * _2713;
    float _2721 = _2507 * _2713;
    float _2723 = fma(_2503, _2719, _2491);
    float _2725 = fma(_2505, _2719, _2493);
    float _2727 = fma(_2497, _2721, _2495);
    float _2729 = _2717 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2731 = _2493;
    float _2733 = _2491;
    float _2735 = _2717;
    float _2737 = _2695;
    float _2739 = _2695;
    if (!_2541)
    {
        _2731 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2741 = _2731;
    float _2743 = _2741;
    float _2745 = _2741;
    if (!_2541)
    {
        _2733 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2747 = _2733;
    out.m_90.x = _2723;
    out.m_90.y = _2725;
    out.m_90.z = _2727;
    out.m_90.w = _2715;
    float _2749 = _2747;
    float _2751 = _2747;
    if (!_2541)
    {
        _2735 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2753 = _2735;
    bool _2755 = !_2541;
    float _2757 = _2753;
    float _2759 = _2753;
    if (!_2755)
    {
        bool _2761 = _2260 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2763 = isnan(_2260);
        bool _2765 = _2761 || _2763;
        bool _2767 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2769 = _2765 || _2767;
        if (!_2769)
        {
            float _2771 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2773 = _2260 + _2771;
            float _2775 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2777 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2775;
            float _2779 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2781 = _2779 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2783 = 1.0 / _2777;
            float _2785 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2787 = _2785 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2789 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2791 = _2789 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2793 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2795 = _2793 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2797 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2799 = _2797 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2801 = _2773 * _2783;
            float _2803 = precise::clamp(_2801, 0.0, 1.0);
            float _2805 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2807 = _2805 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2809 = fma(_2803, _2781, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2811 = fma(_2803, _2807, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2813 = fma(_2803, _2787, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2815 = fma(_2803, _2791, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2817 = fma(_2803, _2795, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2819 = fma(_2803, _2799, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2751 = _2813;
            _2739 = _2817;
            _2745 = _2809;
            _2693 = _2815;
            _2687 = _2811;
            _2759 = _2819;
            _2821 = true;
        }
        else
        {
            bool _2823 = _2260 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2825 = isnan(_2260);
            bool _2827 = _2823 || _2825;
            bool _2829 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2831 = _2827 || _2829;
            if (!_2831)
            {
                _2743 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2833 = _2743;
            _2745 = _2833;
            if (!_2831)
            {
                _2749 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2835 = _2749;
            _2751 = _2835;
            if (!_2831)
            {
                _2685 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2837 = _2685;
            _2687 = _2837;
            if (!_2831)
            {
                _2691 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2839 = _2691;
            _2693 = _2839;
            if (!_2831)
            {
                _2737 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2841 = _2737;
            _2739 = _2841;
            if (!_2831)
            {
                _2757 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2843 = _2757;
            bool _2845 = !_2831;
            _2759 = _2843;
            if (!_2845)
            {
                bool _2847 = _2260 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2849 = isnan(_2260);
                bool _2851 = _2847 || _2849;
                bool _2853 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2855 = _2851 || _2853;
                if (!_2855)
                {
                    float _2857 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2859 = _2260 + _2857;
                    float _2861 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2863 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2861;
                    float _2865 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2867 = _2865 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2869 = 1.0 / _2863;
                    float _2871 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2873 = _2871 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2875 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2877 = _2875 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2879 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2881 = _2879 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2883 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2885 = _2883 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2887 = _2859 * _2869;
                    float _2889 = precise::clamp(_2887, 0.0, 1.0);
                    float _2891 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2893 = _2891 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2895 = fma(_2889, _2867, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2897 = fma(_2889, _2893, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2899 = fma(_2889, _2873, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2901 = fma(_2889, _2877, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2903 = fma(_2889, _2881, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2905 = fma(_2889, _2885, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2751 = _2899;
                    _2739 = _2903;
                    _2745 = _2895;
                    _2693 = _2901;
                    _2687 = _2897;
                    _2759 = _2905;
                    _2821 = true;
                }
                else
                {
                    _2751 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2739 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2745 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2693 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2687 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2759 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2821 = false;
    float _2907 = _2751;
    float _2909 = _2739;
    float _2911 = _2745;
    float _2913 = _2693;
    float _2915 = _2687;
    float _2917 = _2759;
    float _2919 = _2729 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2921 = fma(_2659, -0.5, 0.5);
    float _2923 = precise::clamp(_2921, 0.0, 1.0);
    float _2925 = -_2907;
    float _2927 = _2925 + _2909;
    float _2929 = -_2911;
    float _2931 = _2929 + _2913;
    out.m_92.x = 0.0;
    float _2933 = fma(_2923, _2927, _2907);
    float _2935 = -_2915;
    float _2937 = _2935 + _2917;
    float _2939 = fma(_2923, _2931, _2911);
    float _2941 = _2933 * 0.586610972881317138671875;
    bool _2943 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2945 = fma(_2923, _2937, _2915);
    out.m_49.x = _2919;
    float _2947 = fma(_2939, 0.298911988735198974609375, _2941);
    bool _2949 = _2090 > 0.0;
    bool _2951 = isnan(_2090);
    bool _2953 = _2949 || _2951;
    bool _2955 = isnan(0.0);
    bool _2957 = _2953 || _2955;
    float _2959 = fma(_2945, 0.114477999508380889892578125, _2947);
    bool _2961 = _2148 <= 0.0;
    bool _2963 = !_2957;
    bool _2965 = _2961 || _2963;
    float _2967 = -_2959;
    float _2969 = _2939 + _2967;
    float _2971 = -_2959;
    float _2973 = _2933 + _2971;
    float _2975 = -_2959;
    float _2977 = _2945 + _2975;
    float _2979 = fma(_2969, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2959);
    float _2981 = fma(_2973, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2959);
    float _2983 = fma(_2977, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2959);
    bool _2985 = !_2943;
    if (!_2985)
    {
        float _2987 = -_2024;
        float _2989 = _2987 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2991 = -_2026;
        float _2993 = _2991 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2995 = -_2028;
        float _2997 = _2995 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2999 = _2989 * _2989;
        float _3001 = fma(_2993, _2993, _2999);
        float _3003 = fma(_2997, _2997, _3001);
        float _3005 = sqrt(_3003);
        float _3007 = rsqrt(_3003);
        float _3009 = -_3005;
        float _3011 = _3009 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3013 = _3011 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3015 = precise::clamp(_3013, 0.0, 1.0);
        float _3017 = _2993 * _3007;
        float _3019 = _2989 * _3007;
        float _3021 = abs(_3015);
        float _3023 = log2(_3021);
        float _3025 = _2997 * _3007;
        float _3027 = _3017 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3029 = _2659 * _3019;
        float _3031 = -_3019;
        float _3033 = -_3027;
        float _3035 = fma(_3031, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3033);
        float _3037 = fma(_2645, _3017, _3029);
        float _3039 = -_3025;
        float _3041 = fma(_3039, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3035);
        float _3043 = fma(_2649, _3025, _3037);
        float _3045 = precise::clamp(_3043, 0.0, 1.0);
        float _3047 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3049 = _3041 + _3047;
        float _3051 = _3023 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3053 = _3049 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3055 = precise::clamp(_3053, 0.0, 1.0);
        float _3057 = exp2(_3051);
        float _3059 = _3057 * _3055;
        float _3061 = _3045 * _3059;
        float _3063 = _3061 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3065 = _3061 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3067 = _3061 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_92.x = _3063;
        out.m_92.y = _3065;
        out.m_92.z = _3067;
    }
    out.m_94.x = _2979;
    out.m_94.y = _2981;
    out.m_94.z = _2983;
    if (!_2965)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3069 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_49.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3069;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2821 = false;
    bool _307 = false;
    bool _211 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _108 = in.m_46.w;
    float _110 = trunc(_108);
    int _113 = int(_110);
    bool _117 = _113 >= 1;
    float _119 = 0.0;
    if (!_117)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _121 = _119;
    if (!_117)
    {
        out.m_49.x = 0.0;
    }
    int _123 = 0;
    if (!_117)
    {
        float _125 = _121 * 5.0;
        _123 = as_type<int>(_125);
    }
    int _127 = _123;
    int _129 = _127;
    if (!_117)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3125 = as_type<float>(_127);
        out.gl_Position.z = _3125;
    }
    if (!_117)
    {
        return out;
    }
    float _131 = in.m_51.w;
    float _133 = float(_113);
    float _135 = -_131;
    float _137 = _135 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _139 = _131 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _141 = isnan(_131);
    bool _143 = _139 || _141;
    bool _145 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _147 = _143 || _145;
    bool _149 = _137 >= _133;
    bool _151 = !_147;
    bool _153 = _149 || _151;
    float _155 = 1.0 / _133;
    float _157 = _131;
    float _159 = _137;
    if (_153)
    {
        _157 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _161 = _157;
    if (_153)
    {
        out.m_49.x = 0.0;
    }
    float _163 = _137 * _155;
    float _165 = _163;
    if (_153)
    {
        float _167 = _161 * 5.0;
        _129 = as_type<int>(_167);
    }
    int _169 = _129;
    out.m_53.x = _163;
    if (_153)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3198 = as_type<float>(_169);
        out.gl_Position.z = _3198;
    }
    if (_153)
    {
        return out;
    }
    float _171 = as_type<float>(int(gl_VertexIndex));
    bool _173 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _175 = as_type<int>(_171) & 1;
    bool _177 = _175 != 0;
    int _179 = as_type<int>(_171) & 2;
    bool _181 = _179 != 0;
    bool _183 = !_177;
    float _185 = _183 ? (-0.5) : 0.5;
    bool _187 = !_181;
    float _189 = _187 ? (-0.5) : 0.5;
    bool _191 = !_173;
    float _209;
    if (!_191)
    {
        float _193 = in.m_58.x;
        float _195 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _197 = _193 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _199 = fma(_197, (*spvDescriptorSet0.vp_c9)._m0[12].x, _137);
        float _201 = _199 * _195;
        float _203 = floor(_201);
        float _205 = -_203;
        float _207 = _201 + _205;
        _209 = _207;
        _211 = true;
    }
    else
    {
        _209 = _163;
    }
    _211 = false;
    float _213 = _209;
    float _215 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _217 = _213 + _215;
    bool _219 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _221 = isnan(_213);
    bool _223 = _219 || _221;
    bool _225 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _227 = _223 || _225;
    float _229 = float(_227);
    float _231 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _233 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _231;
    float _235 = -_229;
    float _237 = _235 + 1.0;
    bool _239 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _241 = isnan(_213);
    bool _243 = _239 || _241;
    bool _245 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _247 = _243 || _245;
    float _249 = float(_247);
    float _251 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _253 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _251;
    bool _255 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _257 = 1.0 / _233;
    float _259 = _249 * _237;
    float _261 = -_249;
    float _263 = _261 + 1.0;
    float _265 = _217 * _257;
    float _267 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _269 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _267;
    float _271 = fma(_253, _265, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _273 = fma(_269, _265, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _275 = _271 * _259;
    float _277 = _273 * _259;
    float _279 = fma(_263, (*spvDescriptorSet0.vp_c9)._m0[143].x, _275);
    float _281 = fma(_263, (*spvDescriptorSet0.vp_c9)._m0[143].y, _277);
    float _283 = fma(_229, (*spvDescriptorSet0.vp_c9)._m0[144].x, _279);
    float _285 = fma(_229, (*spvDescriptorSet0.vp_c9)._m0[144].y, _281);
    bool _287 = !_255;
    float _305;
    if (!_287)
    {
        float _289 = in.m_58.x;
        float _291 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _293 = _289 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _295 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[11].y, _137);
        float _297 = _295 * _291;
        float _299 = floor(_297);
        float _301 = -_299;
        float _303 = _297 + _301;
        _305 = _303;
        _307 = true;
    }
    else
    {
        _305 = _163;
    }
    _307 = false;
    float _309 = _305;
    bool _311 = _309 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _313 = isnan(_309);
    bool _315 = _311 || _313;
    bool _317 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _319 = _315 || _317;
    float _321 = float(_319);
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _325 = _323 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _327 = _309 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _329 = isnan(_309);
    bool _331 = _327 || _329;
    bool _333 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _335 = _331 || _333;
    float _337 = float(_335);
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _341 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _339;
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _345 = _309 + _343;
    float _347 = -_321;
    float _349 = _347 + 1.0;
    bool _351 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _353 = 1.0 / _325;
    float _355 = _337 * _349;
    float _357 = -_337;
    float _359 = _357 + 1.0;
    float _361 = _341 * _353;
    float _363 = fma(_361, _345, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _365 = _363 * _355;
    float _367 = fma(_359, (*spvDescriptorSet0.vp_c9)._m0[115].x, _365);
    float _369 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _371 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _373 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _375 = fma(_321, (*spvDescriptorSet0.vp_c9)._m0[116].x, _367);
    float _377 = _369 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _379 = _371 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _381 = _373 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _383 = _375 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _385 = in.m_60.x;
    float _387 = in.m_60.y;
    out.m_62.x = _377;
    out.m_62.y = _379;
    out.m_62.z = _381;
    out.m_62.w = _383;
    float _389 = _285 * _387;
    float _391 = _283 * _385;
    bool _393 = !_351;
    if (!_393)
    {
        float _395 = in.m_58.x;
        float _397 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _399 = _395 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _401 = fma(_399, (*spvDescriptorSet0.vp_c9)._m0[11].w, _137);
        float _403 = _401 * _397;
        float _405 = floor(_403);
        float _407 = -_405;
        float _409 = _403 + _407;
        _165 = _409;
    }
    float _411 = _165;
    float _413 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _415 = int(_413);
    float _417 = in.m_58.x;
    int _419 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _421 = _419 != 0;
    float _423 = in.m_58.z;
    float _425 = in.m_58.w;
    float _427 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _429 = int(_427);
    int _431 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _433 = _431 != 0;
    float _435 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _437 = float(_415);
    float _439 = 0.0;
    float _441 = _437;
    if (!_421)
    {
        float _443 = in.m_58.y;
        _439 = _443;
    }
    float _445 = _439;
    float _447 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _449 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _451 = 1.0 / _437;
    float _453 = float(uint(_429));
    int _455 = ~_429;
    int _457 = _455 + 1;
    float _459 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _461 = _429 == 0;
    float _463 = 1.0 / _453;
    float _465 = _451 * _137;
    float _467 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _469 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    if (!_421)
    {
        _441 = _445;
    }
    float _471 = _441;
    float _473 = trunc(_465);
    int _475 = int(_473);
    float _477 = fma(_417, (*spvDescriptorSet0.vp_c9)._m0[88].z, _467);
    int _479 = as_type<int>(_463) + (-2);
    int _481 = ~_429;
    int _483 = _481 + 1;
    float _485 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[87].z, _477);
    float _487 = 0.0;
    float _489 = _471;
    if (!_421)
    {
        _487 = _471;
    }
    float _491 = _487;
    float _493 = -_485;
    float _495 = _493 + 1.0;
    float _497 = _491;
    int _499 = as_type<int>(_445);
    if (_421)
    {
        float _501 = in.m_58.x;
        float _503 = in.m_58.y;
        _497 = _501;
        _499 = as_type<int>(_503);
    }
    float _505 = _497;
    int _507 = _499;
    float _509 = float(uint(_475));
    float _511 = as_type<float>(_479) * _509;
    float _513 = trunc(_511);
    float _515 = precise::max(_513, 0.0);
    uint _518 = uint(_515);
    bool _520 = !_421;
    float _522 = _520 ? as_type<float>(_507) : _417;
    float _524 = as_type<float>(_507) * 2.0;
    bool _526 = !_421;
    float _528 = _526 ? 1.2345600128173828125 : 1.0;
    float _530 = fma(as_type<float>(_507), (*spvDescriptorSet0.vp_c9)._m0[88].w, _469);
    int _532 = _483 * int(_518);
    int _534 = _532 + _475;
    float _536 = as_type<float>(_534);
    if (_421)
    {
        _489 = as_type<float>(_507);
    }
    float _538 = _489;
    float _540 = _528 * _522;
    float _542 = float(_429);
    float _544 = floor(_524);
    float _546 = float(uint(_534));
    float _548 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[87].w, _530);
    float _550 = _538;
    if (_421)
    {
        _536 = _417;
    }
    float _552 = _536;
    float _554 = _552;
    if (!_421)
    {
        _554 = _423;
    }
    float _556 = _554;
    float _558 = as_type<float>(_479) * _546;
    float _560 = -_548;
    float _562 = _560 + 1.0;
    float _564 = trunc(_558);
    float _566 = precise::max(_564, 0.0);
    uint _568 = uint(_566);
    int _570 = int(_518) + int(_568);
    float _572 = float(_475);
    float _574 = floor(_540);
    int _576 = _457 * _570;
    int _578 = _576 + _475;
    bool _580 = _572 >= _542;
    bool _582 = isnan(_572);
    bool _584 = _580 || _582;
    bool _586 = isnan(_542);
    bool _588 = _584 || _586;
    float _590 = float(_588);
    bool _592 = uint(_578) >= uint(_429);
    float _594 = trunc(_590);
    int _596 = int(_594);
    bool _598 = !_592;
    int _600 = _598 ? 0 : (-1);
    int _602 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _604 = _602 != 0;
    int _606 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _608 = _606 != 0;
    int _610 = ~_570;
    int _612 = _610 + _600;
    int _614 = _612 + 1;
    float _616 = -_574;
    float _618 = _540 + _616;
    float _620 = _542 * _137;
    int _622 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _624 = _622 != 0;
    int _626 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _628 = _626 != 0;
    int _630 = _429 * _614;
    int _632 = _630 + _475;
    float _634 = _542 * _618;
    float _636 = _620 * _155;
    int _638 = _429 + (-1);
    int _640 = ~_596;
    int _642 = _640 + 1;
    int _644 = _642 + 1;
    bool _646 = !_461;
    int _648 = _646 ? _632 : (-1);
    float _650 = trunc(_634);
    int _652 = int(_650);
    bool _654 = !_433;
    int _656 = _654 ? 0 : 1;
    bool _658 = !_604;
    int _660 = _658 ? 0 : 1;
    int _662 = _648 * _644;
    bool _664 = !_608;
    int _666 = _664 ? 0 : 1;
    float _668 = trunc(_636);
    int _670 = int(_668);
    int _672 = _596 * _638;
    int _674 = _672 + _662;
    int _676 = abs(_666);
    int _678 = abs(_656);
    bool _680 = !_624;
    int _682 = _680 ? 0 : 1;
    int _684 = abs(_660);
    int _686 = _652 * _678;
    int _688 = _686 + _475;
    bool _690 = !_628;
    int _692 = _690 ? 0 : 1;
    int _694 = abs(_682);
    int _696 = _674 * _676;
    int _698 = abs(_692);
    int _700 = _670 * _684;
    int _702 = _700 + _696;
    int _704 = ~_429;
    int _706 = _704 + 1;
    int _708 = _688 * _694;
    int _710 = _708 + _702;
    bool _712 = _425 > 0.5;
    int _714 = _652 * _698;
    int _716 = _714 + _710;
    int _718 = ~_429;
    int _720 = _718 + 1;
    float _722 = float(uint(_688));
    float _724 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _726 = _724 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _728 = float(uint(_716));
    float _730 = as_type<float>(_479) * _728;
    float _732 = 1.0 / _726;
    float _734 = trunc(_730);
    float _736 = precise::max(_734, 0.0);
    uint _738 = uint(_736);
    int _740 = _720 * int(_738);
    int _742 = _740 + _716;
    float _744 = float(uint(_742));
    float _746 = as_type<float>(_479) * _744;
    float _748 = trunc(_746);
    float _750 = precise::max(_748, 0.0);
    uint _752 = uint(_750);
    float _754 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _756 = int(_738) + int(_752);
    float _758 = _505 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _760 = as_type<float>(_752);
    float _762 = _556;
    if (!_421)
    {
        float _764 = in.m_58.z;
        _760 = _764;
    }
    float _766 = _760;
    float _768 = fma(_505, (*spvDescriptorSet0.vp_c9)._m0[83].z, _754);
    int _770 = _706 * _756;
    int _772 = _770 + _716;
    float _774 = -_435;
    float _776 = fma(_758, 2.0, _774);
    float _778 = in.m_46.x;
    float _780 = in.m_46.y;
    float _782 = in.m_46.z;
    float _784 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[82].z, _768);
    bool _786 = uint(_772) >= uint(_429);
    float _788 = -_137;
    float _790 = fma(_788, (*spvDescriptorSet0.vp_c9)._m0[81].x, _776);
    float _792 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _794 = !_786;
    int _796 = _794 ? 0 : (-1);
    int _798 = ~_756;
    int _800 = _798 + _796;
    int _802 = _800 + 1;
    float _804 = _556 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _806 = _417 * 2.0;
    int _808 = _429 * _802;
    int _810 = _808 + _716;
    float _812 = -_447;
    float _814 = fma(_804, 2.0, _812);
    float _816 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _818 = log2(_816);
    float _820 = _766;
    if (!_421)
    {
        _762 = _766;
    }
    float _822 = _762;
    bool _824 = !_461;
    int _826 = _824 ? _810 : (-1);
    float _828 = -_137;
    float _830 = fma(_828, (*spvDescriptorSet0.vp_c9)._m0[86].x, _814);
    float _832 = _822;
    if (_421)
    {
        _820 = _538;
    }
    float _834 = _820;
    float _836 = in.m_64.x;
    float _838 = in.m_64.y;
    float _840 = in.m_64.z;
    float _842 = in.m_64.w;
    int _844 = _826 & 3;
    bool _846 = _844 != 0;
    float _848 = floor(_806);
    int _850 = _826 & 3;
    bool _852 = _850 != 0;
    float _854 = fma(_834, (*spvDescriptorSet0.vp_c9)._m0[83].w, _792);
    int _856 = _846 ? 0 : 1;
    bool _858 = _850 != 3;
    bool _860 = uint(_850) >= 2u;
    float _862 = _818 * _137;
    if (_421)
    {
        _832 = _538;
    }
    float _864 = _832;
    if (!_421)
    {
        _550 = _417;
    }
    float _866 = _550;
    int _868 = _860 ? 0 : 1;
    float _870 = _864 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _872 = -_189;
    int _874 = _712 ? as_type<int>(_872) : as_type<int>(_189);
    float _876 = exp2(_862);
    int _878 = ~_868;
    int _880 = _878 + 1;
    int _882 = _880 + 1;
    float _884 = _866 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    bool _886 = uint(_850) > 1u;
    float _888 = fma(_870, -2.0, _459);
    int _890 = _882;
    if (_858)
    {
        int _892 = ~_868;
        int _894 = _892 + 1;
        _890 = _894;
    }
    int _896 = _890;
    float _898 = fma(_884, -2.0, _449);
    int _900 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _902 = _900 != 0;
    float _904 = _780 * _838;
    bool _906 = _423 > 0.5;
    float _908 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[86].y, _898);
    bool _910 = !_902;
    float _912 = _910 ? _189 : as_type<float>(_874);
    float _914 = fma(_778, _836, _904);
    float _916 = -_185;
    int _918 = _906 ? as_type<int>(_916) : as_type<int>(_185);
    int _920 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _922 = _920 != 0;
    float _924 = -_876;
    float _926 = _924 + 1.0;
    int _928 = ~_856;
    int _930 = _928 + 1;
    int _932 = _930 + 1;
    bool _934 = !_922;
    float _936 = _934 ? _185 : as_type<float>(_918);
    bool _938 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _940 = isnan(1.0);
    bool _942 = _938 || _940;
    bool _944 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _946 = _942 || _944;
    float _948 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _950 = 1.0 + _948;
    bool _952 = _848 > 0.0;
    float _954 = in.m_66.x;
    float _956 = in.m_66.y;
    float _958 = in.m_66.z;
    float _960 = in.m_66.w;
    bool _962 = _848 >= 0.0;
    bool _964 = isnan(_848);
    bool _966 = _962 || _964;
    bool _968 = isnan(0.0);
    bool _970 = _966 || _968;
    float _972 = 1.0 / _950;
    int _974 = _932;
    if (!_886)
    {
        int _976 = ~_856;
        int _978 = _976 + 1;
        _974 = _978;
    }
    int _980 = _974;
    float _982 = in.m_68.x;
    float _984 = in.m_68.y;
    float _986 = in.m_68.z;
    float _988 = in.m_68.w;
    bool _990 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _992 = isnan(0.0);
    bool _994 = _990 || _992;
    bool _996 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _998 = _994 || _996;
    float _1000 = -_189;
    int _1002 = _906 ? as_type<int>(_1000) : as_type<int>(_189);
    float _1004 = _998 ? _926 : 0.0;
    float _1006 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[82].w, _854);
    float _1008 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[81].y, _888);
    int _1010 = _970 ? 0 : 1;
    int _1012 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1014 = _1012 != 0;
    int _1016 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1018 = _1016 != 0;
    int _1020 = ~_1010;
    int _1022 = _1020 + 1;
    int _1024 = _1022 + 1;
    int _1026 = _1024;
    if (_946)
    {
        float _1028 = _1004 * _972;
        _159 = _1028;
    }
    float _1030 = _159;
    bool _1032 = _417 > 0.5;
    if (!_952)
    {
        int _1034 = ~_1010;
        int _1036 = _1034 + 1;
        _1026 = _1036;
    }
    int _1038 = _1026;
    bool _1040 = !_1018;
    float _1042 = _1040 ? _189 : as_type<float>(_1002);
    float _1044 = -_185;
    int _1046 = _1032 ? as_type<int>(_1044) : as_type<int>(_185);
    bool _1048 = _544 >= 0.0;
    bool _1050 = isnan(_544);
    bool _1052 = _1048 || _1050;
    bool _1054 = isnan(0.0);
    bool _1056 = _1052 || _1054;
    int _1058 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1060 = _1058 != 0;
    float _1062 = _780 * _984;
    int _1064 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1066 = _1064 != 0;
    float _1068 = _780 * _956;
    int _1070 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1072 = _1070 != 0;
    float _1074 = _423 * 2.0;
    int _1076 = _1056 ? 0 : 1;
    float _1078 = as_type<float>(_479) * _722;
    float _1080 = floor(_1074);
    bool _1082 = _544 > 0.0;
    float _1084 = fma(_778, _954, _1068);
    float _1086 = fma(_778, _982, _1062);
    float _1088 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1090 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1088;
    float _1092 = fma(_782, _840, _914);
    int _1094 = ~_1076;
    int _1096 = _1094 + 1;
    int _1098 = _1096 + 1;
    float _1100 = fma(_782, _986, _1086);
    float _1102 = trunc(_1078);
    float _1104 = precise::max(_1102, 0.0);
    uint _1106 = uint(_1104);
    float _1108 = _1090 * _732;
    bool _1110 = _411 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1112 = isnan(_411);
    bool _1114 = _1110 || _1112;
    bool _1116 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1118 = _1114 || _1116;
    float _1120 = float(_1118);
    float _1122 = fma(_782, _958, _1084);
    float _1124 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1126 = _411 + _1124;
    bool _1128 = _411 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1130 = isnan(_411);
    bool _1132 = _1128 || _1130;
    bool _1134 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1136 = _1132 || _1134;
    float _1138 = float(_1136);
    float _1140 = _1100 + _988;
    int _1142 = _1098;
    float _1144 = _1140;
    if (!_1082)
    {
        int _1146 = ~_1076;
        int _1148 = _1146 + 1;
        _1142 = _1148;
    }
    int _1150 = _1142;
    float _1152 = -_1120;
    float _1154 = _1152 + 1.0;
    int _1156 = ~_429;
    int _1158 = _1156 + 1;
    float _1160 = fma(_1108, _1126, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _1162 = _1080 >= 0.0;
    bool _1164 = isnan(_1080);
    bool _1166 = _1162 || _1164;
    bool _1168 = isnan(0.0);
    bool _1170 = _1166 || _1168;
    float _1172 = _1138 * _1154;
    float _1174 = _1092 + _842;
    float _1176 = _1122 + _960;
    int _1178 = _1170 ? 0 : 1;
    int _1180 = _1158 * int(_1106);
    int _1182 = _1180 + _688;
    bool _1184 = _1080 > 0.0;
    float _1186 = _1160 * _1172;
    float _1188 = -_1138;
    float _1190 = _1188 + 1.0;
    int _1192 = ~_1178;
    int _1194 = _1192 + 1;
    int _1196 = _1194 + 1;
    float _1198 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1200 = _1140 + _1198;
    float _1202 = float(uint(_1182));
    float _1204 = fma(_1190, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1186);
    int _1206 = _826 >> 31;
    float _1208 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1210 = _1174 + _1208;
    float _1212 = _1200 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1214 = as_type<float>(_479) * _1202;
    int _1216 = _1206 & 3;
    float _1218 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1220 = _1176 + _1218;
    int _1222 = _1196;
    float _1224 = _1174;
    if (!_1184)
    {
        int _1226 = ~_1178;
        int _1228 = _1226 + 1;
        _1222 = _1228;
    }
    int _1230 = _1222;
    float _1232 = fma(_1210, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1212);
    int _1234 = _826 + _1216;
    float _1236 = trunc(_1214);
    float _1238 = precise::max(_1236, 0.0);
    uint _1240 = uint(_1238);
    bool _1242 = as_type<float>(_507) > 0.5;
    float _1244 = fma(_1220, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1232);
    int _1246 = _1234 >> 2;
    float _1248 = fma(_1120, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1204);
    bool _1250 = !_1066;
    float _1252 = _1250 ? _185 : as_type<float>(_1046);
    float _1254 = as_type<float>(_507) + _417;
    int _1256 = _1246 << 4;
    int _1258 = _1256 + 512;
    float _1260 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1262 = -_185;
    int _1264 = _1242 ? as_type<int>(_1262) : as_type<int>(_185);
    float _1266 = _1248 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    uint _1268 = uint(int(uint(_1258) >> uint(2)));
    uint _1270 = uint(int(uint(int(_1268)) >> uint(2)));
    int _1272 = int(_1268) & 3;
    float _1274 = (*spvDescriptorSet0.vp_c9)._m0[int(_1270)][_1272];
    int _1276 = int(_1268) + 1;
    uint _1278 = uint(int(uint(_1276) >> uint(2)));
    int _1280 = _1276 & 3;
    float _1282 = (*spvDescriptorSet0.vp_c9)._m0[int(_1278)][_1280];
    float _1284 = -_189;
    int _1286 = _1242 ? as_type<int>(_1284) : as_type<int>(_189);
    float _1288 = _1254 + (-1.0);
    bool _1290 = _1244 >= 0.0;
    float _1292 = _936 + 0.5;
    int _1294 = int(_1106) + int(_1240);
    float _1296 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1298 = fma(_1292, (*spvDescriptorSet0.vp_c9)._m0[85].x, _790);
    float _1300 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _1302 = ~_429;
    int _1304 = _1302 + 1;
    float _1306 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _1308 = !_1014;
    float _1310 = _1308 ? _185 : as_type<float>(_1264);
    float _1312 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1314 = _1300 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1316 = _1306 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1318 = _1312 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1320 = _1304 * _1294;
    int _1322 = _1320 + _688;
    float _1324 = _1260 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _1326 = !_1072;
    float _1328 = _1326 ? _189 : as_type<float>(_1286);
    float _1330 = fma(_1288, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    out.m_70.x = _1314;
    out.m_70.y = _1316;
    out.m_70.z = _1318;
    out.m_70.w = _1266;
    float _1332 = _1288;
    int _1334 = as_type<int>(_1260);
    if (_1290)
    {
        _1332 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1336 = _1332;
    float _1338 = _1252 + 0.5;
    bool _1340 = uint(_1322) >= uint(_429);
    float _1342 = _912 + (-0.5);
    bool _1344 = _850 != 3;
    if (_1290)
    {
        float _1346 = _1336 * 5.0;
        _1334 = as_type<int>(_1346);
    }
    int _1348 = _1334;
    bool _1350 = !_852;
    int _1352 = _1350 ? 0 : 1;
    float _1354 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1356 = !_1340;
    int _1358 = _1356 ? 0 : (-1);
    float _1360 = -_1328;
    float _1362 = _1360 + 0.5;
    int _1364 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1366 = _1364 != 0;
    int _1368 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1370 = _1368 != 0;
    int _1372 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1374 = _1372 != 0;
    float _1376 = -_1342;
    float _1378 = -_1008;
    float _1380 = fma(_1376, (*spvDescriptorSet0.vp_c9)._m0[85].y, _1378);
    int _1382 = abs(_1352);
    int _1384 = _1258 + 8;
    uint _1386 = uint(int(uint(_1384) >> uint(2)));
    uint _1388 = uint(int(uint(int(_1386)) >> uint(2)));
    int _1390 = int(_1386) & 3;
    float _1392 = (*spvDescriptorSet0.vp_c9)._m0[int(_1388)][_1390];
    int _1394 = int(_1386) + 1;
    uint _1396 = uint(int(uint(_1394) >> uint(2)));
    int _1398 = _1394 & 3;
    float _1400 = (*spvDescriptorSet0.vp_c9)._m0[int(_1396)][_1398];
    float _1402 = _1310 + 0.5;
    float _1404 = _1296 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    if (_1290)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5069 = as_type<float>(_1348);
        out.gl_Position.z = _5069;
    }
    bool _1406 = !_1344;
    int _1408 = _1406 ? 0 : (-1);
    float _1410 = fma(_1324, _1402, _830);
    float _1412 = _1200 * _1200;
    int _1414 = abs(_980);
    float _1416 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1418 = abs(_896);
    float _1420 = fma(_1210, _1210, _1412);
    float _1422 = _1042 + (-0.5);
    int _1424 = ~_1294;
    int _1426 = _1424 + _1358;
    int _1428 = _1426 + 1;
    float _1430 = _1362 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1432 = fma(_1220, _1220, _1420);
    float _1434 = -_1404;
    float _1436 = -_908;
    float _1438 = fma(_1434, _1422, _1436);
    int _1440 = ~_1414;
    int _1442 = _1440 + 1;
    int _1444 = _1442 + 1;
    float _1446 = rsqrt(_1432);
    int _1448 = ~_1382;
    int _1450 = _1448 + 1;
    int _1452 = _1450 + 1;
    float _1454 = -_784;
    float _1456 = _1454 + 1.0;
    int _1458 = _429 * _1428;
    int _1460 = _1458 + _688;
    bool _1462 = !_1060;
    int _1464 = _1462 ? 0 : 1;
    int _1466 = _1444 * as_type<int>(_1282);
    float _1468 = -_1456;
    float _1470 = fma(_936, _1468, _1298);
    bool _1472 = _429 == 0;
    float _1474 = -_495;
    float _1476 = fma(_1310, _1474, _1410);
    int _1478 = _1452 * as_type<int>(_1274);
    int _1480 = _1478 + _1466;
    float _1482 = _1338 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1484 = -_1006;
    float _1486 = _1484 + 1.0;
    int _1488 = abs(_1464);
    float _1490 = fma(_1042, _562, _1438);
    float _1492 = _1482 * _1354;
    float _1494 = fma(_912, _1486, _1380);
    int _1496 = abs(_1408);
    float _1498 = _1430 * _1416;
    float _1500 = _1200 * _1446;
    int _1502 = ~_1496;
    int _1504 = _1502 + 1;
    int _1506 = _1504 + 1;
    float _1508 = _1210 * _1446;
    int _1510 = ~_1418;
    int _1512 = _1510 + 1;
    int _1514 = _1512 + 1;
    out.m_72.x = _1492;
    out.m_72.y = _1498;
    out.m_72.z = _1470;
    out.m_72.w = _1494;
    bool _1516 = !_1366;
    int _1518 = _1516 ? 0 : 1;
    float _1520 = -_1500;
    float _1522 = fma(_1520, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1200);
    float _1524 = float(_1230);
    float _1526 = -_1508;
    float _1528 = fma(_1526, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1210);
    float _1530 = float(_1038);
    float _1532 = _1522 * _1522;
    int _1534 = _1514 * as_type<int>(_1392);
    int _1536 = _1534 + _1480;
    out.m_74.x = _1476;
    out.m_74.y = _1490;
    float _1538 = fma(_1528, _1528, _1532);
    int _1540 = _1506 * as_type<int>(_1400);
    int _1542 = _1540 + _1536;
    if (_1290)
    {
        out.m_49.x = 0.0;
    }
    int _1544 = abs(_1518);
    float _1546 = in.m_76.x;
    float _1548 = in.m_76.y;
    float _1550 = in.m_76.z;
    int _1552 = ~_1488;
    int _1554 = _1552 + 1;
    int _1556 = _1554 + 1;
    float _1558 = float(_1544);
    bool _1560 = !_1472;
    int _1562 = _1560 ? _1460 : (-1);
    int _1564 = _1542 * _1556;
    bool _1566 = !_1370;
    int _1568 = _1566 ? 0 : 1;
    float _1570 = _1558 * _1524;
    float _1572 = _1220 * _1446;
    int _1574 = _1562 * _1488;
    int _1576 = _1574 + _1564;
    int _1578 = abs(_1568);
    float _1580 = _1570 * (-2.0);
    float _1582 = _417 + (-0.5);
    float _1584 = -_1572;
    float _1586 = fma(_1584, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1220);
    float _1588 = float(_1576);
    float _1590 = fma(_1330, _1580, _1330);
    float _1592 = float(_1578);
    float _1594 = fma(_1586, _1586, _1538);
    out.m_78.y = _1588;
    float _1596 = _1592 * _1530;
    bool _1598 = !_1374;
    int _1600 = _1598 ? 0 : 1;
    float _1602 = fma(_1580, _1546, _1546);
    float _1604 = fma(_1582, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1602);
    float _1606 = _423 + as_type<float>(_507);
    float _1608 = _1572;
    if (_1290)
    {
        return out;
    }
    float _1610 = -_1500;
    float _1612 = fma(_1610, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1140);
    float _1614 = -_1508;
    float _1616 = fma(_1614, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1174);
    float _1618 = -_1572;
    float _1620 = fma(_1618, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1176);
    float _1622 = float(_1150);
    float _1624 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1626 = _1612 + _1624;
    float _1628 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1630 = _1616 + _1628;
    float _1632 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1634 = _1620 + _1632;
    float _1636 = _1626 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1638 = abs(_1600);
    float _1640 = _1606 + (-1.0);
    float _1642 = _1596 * (-2.0);
    float _1644 = fma(_1630, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1636);
    float _1646 = float(_1638);
    float _1648 = fma(_1640, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1650 = as_type<float>(_507) + (-0.5);
    float _1652 = fma(_1634, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1644);
    float _1654 = fma(_1642, _1548, _1548);
    float _1656 = _423 + _417;
    float _1658 = _1646 * _1622;
    float _1660 = fma(_1648, _1642, _1648);
    bool _1662 = _1652 >= 0.0;
    float _1664 = fma(_1650, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1654);
    float _1666 = _1656 + (-1.0);
    float _1668 = _1658 * (-2.0);
    float _1670 = fma(_1660, _1030, _1664);
    float _1672 = fma(_1590, _1030, _1604);
    float _1674 = fma(_1666, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1676 = fma(_1668, _1550, _1550);
    float _1678 = _1670 * 0.15915493667125701904296875;
    float _1680 = sqrt(_1594);
    float _1682 = _423 + (-0.5);
    float _1684 = fma(_1674, _1668, _1674);
    float _1686 = _1670;
    if (_1662)
    {
        _1686 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1688 = _1686;
    float _1690 = fma(_1682, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1676);
    float _1692 = _1672 * 0.15915493667125701904296875;
    int _1694 = as_type<int>(_1688);
    if (_1662)
    {
        out.m_49.x = 0.0;
    }
    float _1696 = _1678 * 6.283185482025146484375;
    float _1698 = sin(_1696);
    if (_1662)
    {
        float _1700 = _1688 * 5.0;
        _1694 = as_type<int>(_1700);
    }
    int _1702 = _1694;
    float _1704 = fma(_1684, _1030, _1690);
    if (_1662)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5536 = as_type<float>(_1702);
        out.gl_Position.z = _5536;
    }
    float _1706 = _1678 * 6.283185482025146484375;
    float _1708 = cos(_1706);
    float _1710 = _1692 * 6.283185482025146484375;
    float _1712 = sin(_1710);
    float _1714 = _1692 * 6.283185482025146484375;
    float _1716 = cos(_1714);
    float _1718 = _1704 * 0.15915493667125701904296875;
    if (_1662)
    {
        return out;
    }
    float _1720 = _1718 * 6.283185482025146484375;
    float _1722 = cos(_1720);
    float _1724 = _1446 * _1680;
    float _1726 = _389 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1728 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _189);
    float _1730 = _391 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1732 = _1716 * _1708;
    float _1734 = _1724 * _1726;
    float _1736 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _185);
    float _1738 = _1718 * 6.283185482025146484375;
    float _1740 = sin(_1738);
    float _1742 = _1724 * _1730;
    float _1744 = _1728 * _1734;
    float _1746 = _1712 * _1698;
    float _1748 = _1716 * _1698;
    float _1750 = _1712 * _1708;
    float _1752 = _1736 * _1742;
    float _1754 = _1716 * _1722;
    float _1756 = _1712 * _1722;
    float _1758 = _1708 * _1722;
    float _1760 = _1698 * _1722;
    float _1762 = _1754 * _1744;
    float _1764 = _1724 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1766 = _1764 * 0.5;
    float _1768 = _1756 * _1744;
    float _1770 = _1612 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1772 = fma(_1740, _1732, _1746);
    float _1774 = -_1744;
    float _1776 = _1740 * _1774;
    float _1778 = -_1750;
    float _1780 = fma(_1740, _1748, _1778);
    float _1782 = -_1748;
    float _1784 = fma(_1740, _1750, _1782);
    float _1786 = fma(_1772, _1752, _1762);
    float _1788 = fma(_1758, _1752, _1776);
    bool _1790 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1792 = isnan(0.5);
    bool _1794 = _1790 || _1792;
    bool _1796 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1798 = _1794 || _1796;
    float _1800 = fma(_1784, _1752, _1768);
    float _1802 = fma(_1780, _1766, _1786);
    float _1804 = fma(_1740, _1746, _1732);
    float _1806 = fma(_1760, _1766, _1788);
    bool _1808 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1810 = isnan(0.5);
    bool _1812 = _1808 || _1810;
    bool _1814 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1816 = _1812 || _1814;
    float _1818 = _1802 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1820 = fma(_1804, _1766, _1800);
    float _1822 = _1802 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1824 = fma(_1806, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1818);
    float _1826 = fma(_1806, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1822);
    float _1828 = fma(_1616, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1770);
    float _1830 = fma(_1820, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1824);
    float _1832 = fma(_1820, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1826);
    float _1834 = fma(_1620, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1828);
    float _1836 = _1830 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1838 = _1832 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1840 = _1834 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1842 = _1176 + _1836;
    float _1844 = _1612 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1846 = _1174 + _1838;
    float _1848 = 1.0 / _1840;
    float _1850 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1852 = _1842 + _1850;
    float _1854 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1856 = _1846 + _1854;
    float _1858 = _1852 * _1852;
    float _1860 = fma(_1856, _1856, _1858);
    float _1862 = fma(_1616, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1844);
    float _1864 = sqrt(_1860);
    float _1866 = fma(_1620, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1862);
    float _1868 = _1866 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1870 = _1868 + _1840;
    float _1872 = _1802 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1874 = _1870 * _1848;
    float _1876 = _1874 * 0.5;
    float _1878 = fma(_1806, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1872);
    bool _1880 = _1864 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1882 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1884 = fma(_1876, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1882);
    float _1886 = fma(_1820, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1878);
    float _1888 = _1886 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1890 = 1.0 / _1884;
    float _1892 = _1140 + _1888;
    float _1894 = _1870;
    float _1896 = _1888;
    float _1898 = _1876;
    if (!_1880)
    {
        _1894 = _1846;
    }
    float _1900 = _1894;
    float _1902 = _1900;
    if (!_1880)
    {
        _1896 = _1842;
    }
    float _1904 = _1896;
    float _1906 = _1904;
    if (!_1880)
    {
        _1898 = _1892;
    }
    float _1908 = _1898;
    bool _1910 = !_1880;
    float _1912 = _1908;
    if (!_1910)
    {
        float _1914 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1916 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1918 = _1864 + _1916;
        float _1920 = _1892 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1922 = _1918 * _1914;
        float _1924 = rsqrt(_1860);
        float _1926 = _1922 * 0.15915493667125701904296875;
        float _1928 = _1926 * 6.283185482025146484375;
        float _1930 = cos(_1928);
        float _1932 = _1926 * 6.283185482025146484375;
        float _1934 = sin(_1932);
        float _1936 = _1930 + (-1.0);
        float _1938 = _1936 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1940 = fma(_1934, _1920, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1942 = fma(_1892, _1930, _1938);
        float _1944 = _1924 * _1940;
        float _1946 = fma(_1856, _1944, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1948 = fma(_1852, _1944, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1906 = _1948;
        _1902 = _1946;
        _1912 = _1942;
    }
    float _1950 = _1906;
    float _1952 = _1902;
    float _1954 = _1912;
    float _1956 = -_1572;
    float _1958 = fma(_1956, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1950);
    float _1960 = -_1508;
    float _1962 = fma(_1960, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1952);
    float _1964 = -_1500;
    float _1966 = fma(_1964, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1954);
    float _1968 = _1966;
    float _1970 = _1962;
    float _1972 = _1958;
    float _1974 = _1950;
    if (_1816)
    {
        _1608 = 1.0;
    }
    float _1976 = _1608;
    float _1978 = _1976;
    if (!_1798)
    {
        float _1980 = _1626 * _1626;
        float _1982 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1984 = -_1176;
        float _1986 = _1984 + _1950;
        float _1988 = fma(_1630, _1630, _1980);
        float _1990 = fma(_1634, _1634, _1988);
        float _1992 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1994 = sqrt(_1990);
        float _1996 = 1.0 / _1724;
        float _1998 = _1992 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2000 = precise::min(_1994, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2002 = _2000 * _1982;
        float _2004 = -_1140;
        float _2006 = _2004 + _1954;
        float _2008 = _2002 * _1996;
        float _2010 = -_1174;
        float _2012 = _2010 + _1952;
        float _2014 = _1998 * _2008;
        float _2016 = _1986 * _2008;
        float _2018 = fma(_2006, _2014, _1612);
        float _2020 = fma(_2012, _2014, _1616);
        float _2022 = fma(_1998, _2016, _1620);
        _1968 = _2018;
        _1970 = _2020;
        _1972 = _2022;
    }
    float _2024 = _1968;
    float _2026 = _1970;
    float _2028 = _1972;
    if (_1816)
    {
        _1974 = 1.0;
    }
    float _2030 = _1974;
    float _2032 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2034 = _1890 * _2032;
    float _2036 = _2030;
    if (!_1816)
    {
        float _2038 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2040 = _2038 * 0.15915493667125701904296875;
        float _2042 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2044 = _2040 * 6.283185482025146484375;
        float _2046 = cos(_2044);
        float _2048 = _2042 * 0.15915493667125701904296875;
        float _2050 = _2040 * 6.283185482025146484375;
        float _2052 = sin(_2050);
        float _2054 = 1.0 / _2046;
        float _2056 = _2048 * 6.283185482025146484375;
        float _2058 = cos(_2056);
        float _2060 = _2052 * _2054;
        float _2062 = _2048 * 6.283185482025146484375;
        float _2064 = sin(_2062);
        float _2066 = _2058 * _2060;
        float _2068 = 1.0 / _2066;
        float _2070 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2072 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2070;
        float _2074 = 1.0 / _2072;
        float _2076 = _2064 * _2068;
        float _2078 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2080 = fma(_2034, _2076, _2078);
        float _2082 = _2080 * _2074;
        float _2084 = precise::clamp(_2082, 0.0, 1.0);
        _1224 = _2048;
        _1144 = _2040;
        _1978 = _2084;
    }
    float _2086 = _1224;
    float _2088 = _1144;
    float _2090 = _1978;
    float _2092 = _2086;
    if (!_1816)
    {
        float _2094 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2096 = _2094 * 0.15915493667125701904296875;
        float _2098 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2100 = _2096 * 6.283185482025146484375;
        float _2102 = cos(_2100);
        float _2104 = _2098 * 0.15915493667125701904296875;
        float _2106 = _2096 * 6.283185482025146484375;
        float _2108 = sin(_2106);
        float _2110 = 1.0 / _2102;
        float _2112 = _2104 * 6.283185482025146484375;
        float _2114 = cos(_2112);
        float _2116 = _2108 * _2110;
        float _2118 = _2104 * 6.283185482025146484375;
        float _2120 = sin(_2118);
        float _2122 = _2114 * _2116;
        float _2124 = 1.0 / _2122;
        float _2126 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2128 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2126;
        float _2130 = 1.0 / _2128;
        float _2132 = _2120 * _2124;
        float _2134 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2136 = fma(_2034, _2132, _2134);
        float _2138 = _2136 * _2130;
        float _2140 = precise::clamp(_2138, 0.0, 1.0);
        float _2142 = -_2140;
        float _2144 = _2142 + 1.0;
        _2092 = _2110;
        _2036 = _2144;
    }
    float _2146 = _2092;
    float _2148 = _2036;
    float _2150 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2152 = _2024 + _2150;
    float _2154 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2156 = _2026 + _2154;
    float _2158 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2160 = _2028 + _2158;
    float _2162 = _2152 * _2152;
    float _2164 = fma(_2156, _2156, _2162);
    float _2166 = fma(_2160, _2160, _2164);
    float _2168 = rsqrt(_2166);
    float _2170 = _2168 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2172 = _2156 * _2170;
    float _2174 = _2160 * _2170;
    float _2176 = _2172 * _2172;
    float _2178 = _2174 * _2174;
    float _2180 = _2176 + _2178;
    float _2182 = sqrt(_2180);
    bool _2184 = _2182 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2186 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2188 = _2182 + _2186;
    float _2190 = _2160;
    float _2192 = _2162;
    float _2194 = _2188;
    float _2196 = _2146;
    float _2198 = _2152;
    float _2200 = _2180;
    if (_2184)
    {
        float _2202 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2190 = _2202;
    }
    float _2204 = _2190;
    if (_2184)
    {
        float _2206 = rsqrt(_2180);
        _2192 = _2206;
    }
    float _2208 = _2192;
    float _2210 = _2208;
    if (_2184)
    {
        float _2212 = _2188 * _2204;
        _2194 = _2212;
    }
    float _2214 = _2194;
    if (_2184)
    {
        float _2216 = _2214 * 0.15915493667125701904296875;
        _2196 = _2216;
    }
    float _2218 = _2196;
    float _2220 = _2168;
    float _2222 = _2218;
    if (_2184)
    {
        float _2224 = _2218 * 6.283185482025146484375;
        float _2226 = sin(_2224);
        _2220 = _2226;
    }
    float _2228 = _2220;
    float _2230 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2232 = precise::max(0.0, _2230);
    float _2234 = _2088;
    float _2236 = _2232;
    if (_2184)
    {
        float _2238 = _2218 * 6.283185482025146484375;
        float _2240 = cos(_2238);
        _2234 = _2240;
    }
    float _2242 = _2234;
    float _2244 = fma(_1616, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2246 = -_2170;
    float _2248 = -_2232;
    float _2250 = fma(_2152, _2246, _2248);
    if (_2184)
    {
        float _2252 = _2250 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2236 = _2252;
    }
    float _2254 = _2236;
    float _2256 = _2254;
    if (!_2184)
    {
        _2222 = _2172;
    }
    float _2258 = _2222;
    float _2260 = sqrt(_2166);
    float _2262 = _2228;
    float _2264 = _2258;
    if (_2184)
    {
        float _2266 = fma(_2228, _2254, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2262 = _2266;
    }
    float _2268 = _2262;
    float _2270 = _2268;
    float _2272 = _2242;
    if (_2184)
    {
        float _2274 = _2242 + (-1.0);
        _2198 = _2274;
    }
    float _2276 = _2198;
    float _2278 = _2276;
    if (_2184)
    {
        float _2280 = _2208 * _2268;
        _2256 = _2280;
    }
    float _2282 = _2256;
    if (!_2184)
    {
        _2210 = _2250;
    }
    float _2284 = _2210;
    float _2286 = _2284;
    if (_2184)
    {
        float _2288 = _2276 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2200 = _2288;
    }
    float _2290 = _2200;
    if (_2184)
    {
        float _2292 = _2172 * _2282;
        _2264 = _2292;
    }
    float _2294 = _2264;
    if (!_2184)
    {
        _2270 = _2176;
    }
    float _2296 = _2270;
    float _2298 = _2024 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2300 = _2296;
    if (!_2184)
    {
        _2278 = _2174;
    }
    float _2302 = _2278;
    float _2304 = _2302;
    if (_2184)
    {
        float _2306 = fma(_2250, _2242, _2290);
        _2286 = _2306;
    }
    float _2308 = _2286;
    if (_2184)
    {
        float _2310 = _2294 * _2294;
        _2300 = _2310;
    }
    float _2312 = _2300;
    if (_2184)
    {
        float _2314 = _2174 * _2282;
        _2304 = _2314;
    }
    float _2316 = _2304;
    if (!_2184)
    {
        _2272 = _2178;
    }
    float _2318 = _2272;
    float _2320 = floor(_2244);
    float _2322 = fma(_2308, _2308, _2312);
    float _2324 = _2318;
    if (_2184)
    {
        float _2326 = _2316 * _2316;
        _2324 = _2326;
    }
    float _2328 = _2324;
    float _2330 = _2024 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2332 = fma(_2026, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2298);
    float _2334 = _2322 + _2328;
    float _2336 = fma(_2026, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2330);
    float _2338 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2340 = fma(_2260, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2338);
    float _2342 = precise::clamp(_2340, 0.0, 1.0);
    float _2344 = rsqrt(_2334);
    float _2346 = fma(_2028, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2336);
    float _2348 = -_2342;
    float _2350 = _2348 + 1.0;
    float _2352 = fma(_2028, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2332);
    float _2354 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2356 = _2346 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2358 = abs(_2350);
    float _2360 = log2(_2358);
    float _2362 = _2356 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2364 = _2024 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2366 = fma(_1620, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2368 = -_2362;
    float _2370 = fma(_2368, _2354, 1.0);
    float _2372 = _2024 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2374 = fma(_2026, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2364);
    float _2376 = _2344 * _2294;
    float _2378 = _2344 * _2308;
    float _2380 = fma(_2026, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2372);
    float _2382 = fma(_2028, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2374);
    float _2384 = _2376 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2386 = _2344 * _2316;
    float _2388 = fma(_2028, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2380);
    float _2390 = _2382 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2392 = -_2384;
    float _2394 = fma(_2378, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2392);
    float _2396 = floor(_2366);
    float _2398 = _2388 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2400 = _2390 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2402 = -_2386;
    float _2404 = fma(_2402, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2394);
    float _2406 = _2360 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2408 = -_2320;
    float _2410 = _2244 + _2408;
    float _2412 = fma(_2398, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2400);
    float _2414 = fma(_2404, -0.5, 0.5);
    float _2416 = log2(_2370);
    float _2418 = _2390 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2420 = fma(_2356, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2412);
    float _2422 = _2390 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2424 = fma(_2398, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2418);
    float _2426 = fma(_2404, 0.5, 0.5);
    float _2428 = _2378 + 1.0;
    float _2430 = exp2(_2406);
    float _2432 = _2352 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2434 = -_2396;
    float _2436 = _2366 + _2434;
    float _2438 = fma(_2398, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2422);
    float _2440 = fma(_2356, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2424);
    float _2442 = fma(_2432, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2420);
    float _2444 = fma(_2426, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2446 = fma(_2356, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2438);
    float _2448 = sqrt(_2414);
    float _2450 = _2416 * 0.693147182464599609375;
    float _2452 = fma(_2426, _2444, -0.212114393711090087890625);
    float _2454 = -_2378;
    float _2456 = fma(_2430, _2428, _2454);
    float _2458 = 1.0 / _2442;
    float _2460 = fma(_2432, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2440);
    float _2462 = fma(_2432, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2446);
    float2 _6738 = float2(_2410, _2436);
    float _2464 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6738, float2(0.0), isnan(_6738)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6738, float2(0.0), isnan(_6738)), level(0.0)).x;
    float _2466 = fma(_2426, _2452, 1.570728778839111328125);
    float _2468 = _2450 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2470 = _2448 * 0.636619746685028076171875;
    float _2472 = -_2466;
    float _2474 = fma(_2470, _2472, 1.0);
    float _2476 = fma(_2456, 0.5, 0.5);
    float _2478 = _2460 * _2458;
    float _2480 = _2462 * _2458;
    float _2482 = fma(_2478, 0.5, 0.5);
    float _2484 = fma(_2480, -0.5, 0.5);
    float3 _6777 = float3(_2482, _2484, _2468);
    float _2486 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6777, float3(0.0), isnan(_6777)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6777, float3(0.0), isnan(_6777)), level(0.0)).x;
    float3 _6788 = float3(_2482, _2484, _2468);
    float4 _2489 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6788, float3(0.0), isnan(_6788)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6788, float3(0.0), isnan(_6788)), level(0.0)).xyzw;
    float _2491 = _2489.x;
    float _2493 = _2489.y;
    float _2495 = _2489.z;
    float _2497 = _2489.w;
    float2 _6804 = float2(_2474, _2476);
    float3 _2501 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6804, float2(0.0), isnan(_6804)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6804, float2(0.0), isnan(_6804)), level(0.0)).xyz;
    float _2503 = _2501.x;
    float _2505 = _2501.y;
    float _2507 = _2501.z;
    float _2509 = abs(_2034);
    float _2511 = log2(_2509);
    float _2513 = _1772 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2515 = _1772 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2517 = _1772 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2519 = fma(_1758, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2513);
    float _2521 = _1754 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2523 = _1780 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2525 = _1780 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2527 = _2390 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2529 = -_1740;
    float _2531 = fma(_2529, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2521);
    out.m_80.x = _2026;
    out.m_80.y = _2024;
    out.m_80.z = _2028;
    bool _2533 = _2260 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2535 = isnan(_2260);
    bool _2537 = _2533 || _2535;
    bool _2539 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2541 = _2537 || _2539;
    float _2543 = _2511 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2545 = fma(_1758, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2515);
    float _2547 = _1754 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2549 = _1754 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2551 = fma(_1758, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2517);
    float _2553 = _1780 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2555 = exp2(_2543);
    float _2557 = -_1740;
    float _2559 = fma(_2557, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2547);
    float _2561 = -_1740;
    float _2563 = fma(_2561, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2549);
    float _2565 = fma(_1784, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2519);
    float _2567 = fma(_1784, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2551);
    float _2569 = fma(_1784, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2545);
    float _2571 = fma(_1760, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2523);
    float _2573 = fma(_1760, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2553);
    float _2575 = fma(_1760, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2525);
    float _2577 = fma(_1756, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2531);
    float _2579 = fma(_1756, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2559);
    float _2581 = fma(_1756, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2563);
    float _2583 = fma(_2398, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2527);
    float _2585 = fma(_1804, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2571);
    float _2587 = fma(_1804, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2573);
    float _2589 = fma(_2555, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2591 = precise::clamp(_2589, 0.0, 1.0);
    float _2593 = fma(_1804, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2575);
    float _2595 = _189 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2597 = fma(_2356, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2583);
    float _2599 = fma(_2591, -2.0, 3.0);
    float _2601 = _2591 * _2591;
    float _2603 = _2595 * _2579;
    float _2605 = in.m_82.x;
    float _2607 = _185 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2609 = _2601 * _2599;
    float _2611 = _2595 * _2577;
    float _2613 = _2595 * _2581;
    float _2615 = fma(_2432, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2597);
    float _2617 = _2360 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2619 = -_2609;
    float _2621 = _2619 + 1.0;
    bool _2623 = _2034 <= 8000.0;
    bool _2625 = isnan(_2034);
    bool _2627 = _2623 || _2625;
    bool _2629 = isnan(8000.0);
    bool _2631 = _2627 || _2629;
    float _2633 = float(_2631);
    float _2635 = fma(_2607, _2565, _2611);
    float _2637 = fma(_2607, _2567, _2613);
    float _2639 = fma(_2621, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2609);
    float _2641 = exp2(_2617);
    float _2643 = fma(_2607, _2569, _2603);
    float _2645 = _2585 + _2635;
    float _2647 = _2633 * _2639;
    float _2649 = _2593 + _2637;
    float _2651 = _2615 + _2442;
    float _2653 = _2460 + _2442;
    float _2655 = _2647 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2657 = _2442 * 0.5;
    float _2659 = _2587 + _2643;
    float _2661 = _2651 * 0.5;
    float _2663 = _2653 * 0.5;
    float _2665 = fma(_2462, -0.5, _2657);
    out.gl_Position.x = _2460;
    out.gl_Position.y = _2462;
    out.gl_Position.z = _2615;
    out.gl_Position.w = _2442;
    float _2667 = -_2641;
    float _2669 = _2667 + 1.0;
    out.m_84.x = _2663;
    out.m_84.y = _2665;
    out.m_84.z = _2661;
    out.m_84.w = _2442;
    float _2671 = _2669 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_86.x = _2645;
    out.m_86.y = _2659;
    out.m_86.z = _2649;
    float _2673 = -_2671;
    float _2675 = _2673 + 1.0;
    float _2677 = _2442;
    float _2679 = _2615;
    float _2681 = _2462;
    if (!_2541)
    {
        _2677 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2683 = _2677;
    float _2685 = _2683;
    float _2687 = _2683;
    if (!_2541)
    {
        _2679 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2689 = _2679;
    float _2691 = _2689;
    float _2693 = _2689;
    if (!_2541)
    {
        _2681 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2695 = _2681;
    float _2697 = -_2464;
    float _2699 = _2697 + 1.0;
    float _2701 = _2699 * _2655;
    float _2703 = precise::clamp(_2701, 0.0, 1.0);
    float _2705 = -_2703;
    float _2707 = fma(_2705, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2709 = _2707 * _2605;
    float _2711 = _2709 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_88.x = _2711;
    float _2713 = _2671 * _2486;
    float _2715 = _2497 * _2675;
    float _2717 = _2090 * _2148;
    float _2719 = _2497 * _2713;
    float _2721 = _2507 * _2713;
    float _2723 = fma(_2503, _2719, _2491);
    float _2725 = fma(_2505, _2719, _2493);
    float _2727 = fma(_2497, _2721, _2495);
    float _2729 = _2717 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2731 = _2493;
    float _2733 = _2491;
    float _2735 = _2717;
    float _2737 = _2695;
    float _2739 = _2695;
    if (!_2541)
    {
        _2731 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2741 = _2731;
    float _2743 = _2741;
    float _2745 = _2741;
    if (!_2541)
    {
        _2733 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2747 = _2733;
    out.m_90.x = _2723;
    out.m_90.y = _2725;
    out.m_90.z = _2727;
    out.m_90.w = _2715;
    float _2749 = _2747;
    float _2751 = _2747;
    if (!_2541)
    {
        _2735 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2753 = _2735;
    bool _2755 = !_2541;
    float _2757 = _2753;
    float _2759 = _2753;
    if (!_2755)
    {
        bool _2761 = _2260 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2763 = isnan(_2260);
        bool _2765 = _2761 || _2763;
        bool _2767 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2769 = _2765 || _2767;
        if (!_2769)
        {
            float _2771 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2773 = _2260 + _2771;
            float _2775 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2777 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2775;
            float _2779 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2781 = _2779 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2783 = 1.0 / _2777;
            float _2785 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2787 = _2785 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2789 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2791 = _2789 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2793 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2795 = _2793 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2797 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2799 = _2797 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2801 = _2773 * _2783;
            float _2803 = precise::clamp(_2801, 0.0, 1.0);
            float _2805 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2807 = _2805 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2809 = fma(_2803, _2781, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2811 = fma(_2803, _2807, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2813 = fma(_2803, _2787, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2815 = fma(_2803, _2791, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2817 = fma(_2803, _2795, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2819 = fma(_2803, _2799, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2751 = _2813;
            _2739 = _2817;
            _2745 = _2809;
            _2693 = _2815;
            _2687 = _2811;
            _2759 = _2819;
            _2821 = true;
        }
        else
        {
            bool _2823 = _2260 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2825 = isnan(_2260);
            bool _2827 = _2823 || _2825;
            bool _2829 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2831 = _2827 || _2829;
            if (!_2831)
            {
                _2743 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2833 = _2743;
            _2745 = _2833;
            if (!_2831)
            {
                _2749 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2835 = _2749;
            _2751 = _2835;
            if (!_2831)
            {
                _2685 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2837 = _2685;
            _2687 = _2837;
            if (!_2831)
            {
                _2691 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2839 = _2691;
            _2693 = _2839;
            if (!_2831)
            {
                _2737 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2841 = _2737;
            _2739 = _2841;
            if (!_2831)
            {
                _2757 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2843 = _2757;
            bool _2845 = !_2831;
            _2759 = _2843;
            if (!_2845)
            {
                bool _2847 = _2260 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2849 = isnan(_2260);
                bool _2851 = _2847 || _2849;
                bool _2853 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2855 = _2851 || _2853;
                if (!_2855)
                {
                    float _2857 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2859 = _2260 + _2857;
                    float _2861 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2863 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2861;
                    float _2865 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2867 = _2865 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2869 = 1.0 / _2863;
                    float _2871 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2873 = _2871 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2875 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2877 = _2875 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2879 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2881 = _2879 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2883 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2885 = _2883 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2887 = _2859 * _2869;
                    float _2889 = precise::clamp(_2887, 0.0, 1.0);
                    float _2891 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2893 = _2891 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2895 = fma(_2889, _2867, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2897 = fma(_2889, _2893, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2899 = fma(_2889, _2873, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2901 = fma(_2889, _2877, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2903 = fma(_2889, _2881, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2905 = fma(_2889, _2885, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2751 = _2899;
                    _2739 = _2903;
                    _2745 = _2895;
                    _2693 = _2901;
                    _2687 = _2897;
                    _2759 = _2905;
                    _2821 = true;
                }
                else
                {
                    _2751 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2739 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2745 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2693 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2687 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2759 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2821 = false;
    float _2907 = _2751;
    float _2909 = _2739;
    float _2911 = _2745;
    float _2913 = _2693;
    float _2915 = _2687;
    float _2917 = _2759;
    float _2919 = _2729 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2921 = fma(_2659, -0.5, 0.5);
    float _2923 = precise::clamp(_2921, 0.0, 1.0);
    float _2925 = -_2907;
    float _2927 = _2925 + _2909;
    float _2929 = -_2911;
    float _2931 = _2929 + _2913;
    out.m_92.x = 0.0;
    float _2933 = fma(_2923, _2927, _2907);
    float _2935 = -_2915;
    float _2937 = _2935 + _2917;
    float _2939 = fma(_2923, _2931, _2911);
    float _2941 = _2933 * 0.586610972881317138671875;
    bool _2943 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2945 = fma(_2923, _2937, _2915);
    out.m_49.x = _2919;
    float _2947 = fma(_2939, 0.298911988735198974609375, _2941);
    bool _2949 = _2090 > 0.0;
    bool _2951 = isnan(_2090);
    bool _2953 = _2949 || _2951;
    bool _2955 = isnan(0.0);
    bool _2957 = _2953 || _2955;
    float _2959 = fma(_2945, 0.114477999508380889892578125, _2947);
    bool _2961 = _2148 <= 0.0;
    bool _2963 = !_2957;
    bool _2965 = _2961 || _2963;
    float _2967 = -_2959;
    float _2969 = _2939 + _2967;
    float _2971 = -_2959;
    float _2973 = _2933 + _2971;
    float _2975 = -_2959;
    float _2977 = _2945 + _2975;
    float _2979 = fma(_2969, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2959);
    float _2981 = fma(_2973, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2959);
    float _2983 = fma(_2977, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2959);
    bool _2985 = !_2943;
    if (!_2985)
    {
        float _2987 = -_2024;
        float _2989 = _2987 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2991 = -_2026;
        float _2993 = _2991 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2995 = -_2028;
        float _2997 = _2995 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2999 = _2989 * _2989;
        float _3001 = fma(_2993, _2993, _2999);
        float _3003 = fma(_2997, _2997, _3001);
        float _3005 = sqrt(_3003);
        float _3007 = rsqrt(_3003);
        float _3009 = -_3005;
        float _3011 = _3009 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3013 = _3011 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3015 = precise::clamp(_3013, 0.0, 1.0);
        float _3017 = _2993 * _3007;
        float _3019 = _2989 * _3007;
        float _3021 = abs(_3015);
        float _3023 = log2(_3021);
        float _3025 = _2997 * _3007;
        float _3027 = _3017 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3029 = _2659 * _3019;
        float _3031 = -_3019;
        float _3033 = -_3027;
        float _3035 = fma(_3031, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3033);
        float _3037 = fma(_2645, _3017, _3029);
        float _3039 = -_3025;
        float _3041 = fma(_3039, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3035);
        float _3043 = fma(_2649, _3025, _3037);
        float _3045 = precise::clamp(_3043, 0.0, 1.0);
        float _3047 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3049 = _3041 + _3047;
        float _3051 = _3023 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3053 = _3049 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3055 = precise::clamp(_3053, 0.0, 1.0);
        float _3057 = exp2(_3051);
        float _3059 = _3057 * _3055;
        float _3061 = _3045 * _3059;
        float _3063 = _3061 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3065 = _3061 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3067 = _3061 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_92.x = _3063;
        out.m_92.y = _3065;
        out.m_92.z = _3067;
    }
    out.m_94.x = _2979;
    out.m_94.y = _2981;
    out.m_94.z = _2983;
    if (!_2965)
    {
        return out;
    }
    float _3069 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_49.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3069;
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
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2821 = false;
    bool _307 = false;
    bool _211 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _108 = in.m_46.w;
    float _110 = trunc(_108);
    int _113 = int(_110);
    bool _117 = _113 >= 1;
    float _119 = 0.0;
    if (!_117)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _121 = _119;
    if (!_117)
    {
        out.m_49.x = 0.0;
    }
    int _123 = 0;
    if (!_117)
    {
        float _125 = _121 * 5.0;
        _123 = as_type<int>(_125);
    }
    int _127 = _123;
    int _129 = _127;
    if (!_117)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3125 = as_type<float>(_127);
        out.gl_Position.z = _3125;
    }
    if (!_117)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _131 = in.m_51.w;
    float _133 = float(_113);
    float _135 = -_131;
    float _137 = _135 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _139 = _131 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _141 = isnan(_131);
    bool _143 = _139 || _141;
    bool _145 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _147 = _143 || _145;
    bool _149 = _137 >= _133;
    bool _151 = !_147;
    bool _153 = _149 || _151;
    float _155 = 1.0 / _133;
    float _157 = _131;
    float _159 = _137;
    if (_153)
    {
        _157 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _161 = _157;
    if (_153)
    {
        out.m_49.x = 0.0;
    }
    float _163 = _137 * _155;
    float _165 = _163;
    if (_153)
    {
        float _167 = _161 * 5.0;
        _129 = as_type<int>(_167);
    }
    int _169 = _129;
    out.m_53.x = _163;
    if (_153)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3198 = as_type<float>(_169);
        out.gl_Position.z = _3198;
    }
    if (_153)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _171 = as_type<float>(int(gl_VertexIndex));
    bool _173 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _175 = as_type<int>(_171) & 1;
    bool _177 = _175 != 0;
    int _179 = as_type<int>(_171) & 2;
    bool _181 = _179 != 0;
    bool _183 = !_177;
    float _185 = _183 ? (-0.5) : 0.5;
    bool _187 = !_181;
    float _189 = _187 ? (-0.5) : 0.5;
    bool _191 = !_173;
    float _209;
    if (!_191)
    {
        float _193 = in.m_58.x;
        float _195 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _197 = _193 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _199 = fma(_197, (*spvDescriptorSet0.vp_c9)._m0[12].x, _137);
        float _201 = _199 * _195;
        float _203 = floor(_201);
        float _205 = -_203;
        float _207 = _201 + _205;
        _209 = _207;
        _211 = true;
    }
    else
    {
        _209 = _163;
    }
    _211 = false;
    float _213 = _209;
    float _215 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _217 = _213 + _215;
    bool _219 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _221 = isnan(_213);
    bool _223 = _219 || _221;
    bool _225 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _227 = _223 || _225;
    float _229 = float(_227);
    float _231 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _233 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _231;
    float _235 = -_229;
    float _237 = _235 + 1.0;
    bool _239 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _241 = isnan(_213);
    bool _243 = _239 || _241;
    bool _245 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _247 = _243 || _245;
    float _249 = float(_247);
    float _251 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _253 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _251;
    bool _255 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _257 = 1.0 / _233;
    float _259 = _249 * _237;
    float _261 = -_249;
    float _263 = _261 + 1.0;
    float _265 = _217 * _257;
    float _267 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _269 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _267;
    float _271 = fma(_253, _265, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _273 = fma(_269, _265, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _275 = _271 * _259;
    float _277 = _273 * _259;
    float _279 = fma(_263, (*spvDescriptorSet0.vp_c9)._m0[143].x, _275);
    float _281 = fma(_263, (*spvDescriptorSet0.vp_c9)._m0[143].y, _277);
    float _283 = fma(_229, (*spvDescriptorSet0.vp_c9)._m0[144].x, _279);
    float _285 = fma(_229, (*spvDescriptorSet0.vp_c9)._m0[144].y, _281);
    bool _287 = !_255;
    float _305;
    if (!_287)
    {
        float _289 = in.m_58.x;
        float _291 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _293 = _289 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _295 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[11].y, _137);
        float _297 = _295 * _291;
        float _299 = floor(_297);
        float _301 = -_299;
        float _303 = _297 + _301;
        _305 = _303;
        _307 = true;
    }
    else
    {
        _305 = _163;
    }
    _307 = false;
    float _309 = _305;
    bool _311 = _309 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _313 = isnan(_309);
    bool _315 = _311 || _313;
    bool _317 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _319 = _315 || _317;
    float _321 = float(_319);
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _325 = _323 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _327 = _309 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _329 = isnan(_309);
    bool _331 = _327 || _329;
    bool _333 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _335 = _331 || _333;
    float _337 = float(_335);
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _341 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _339;
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _345 = _309 + _343;
    float _347 = -_321;
    float _349 = _347 + 1.0;
    bool _351 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _353 = 1.0 / _325;
    float _355 = _337 * _349;
    float _357 = -_337;
    float _359 = _357 + 1.0;
    float _361 = _341 * _353;
    float _363 = fma(_361, _345, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _365 = _363 * _355;
    float _367 = fma(_359, (*spvDescriptorSet0.vp_c9)._m0[115].x, _365);
    float _369 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _371 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _373 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _375 = fma(_321, (*spvDescriptorSet0.vp_c9)._m0[116].x, _367);
    float _377 = _369 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _379 = _371 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _381 = _373 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _383 = _375 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _385 = in.m_60.x;
    float _387 = in.m_60.y;
    out.m_62.x = _377;
    out.m_62.y = _379;
    out.m_62.z = _381;
    out.m_62.w = _383;
    float _389 = _285 * _387;
    float _391 = _283 * _385;
    bool _393 = !_351;
    if (!_393)
    {
        float _395 = in.m_58.x;
        float _397 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _399 = _395 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _401 = fma(_399, (*spvDescriptorSet0.vp_c9)._m0[11].w, _137);
        float _403 = _401 * _397;
        float _405 = floor(_403);
        float _407 = -_405;
        float _409 = _403 + _407;
        _165 = _409;
    }
    float _411 = _165;
    float _413 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _415 = int(_413);
    float _417 = in.m_58.x;
    int _419 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _421 = _419 != 0;
    float _423 = in.m_58.z;
    float _425 = in.m_58.w;
    float _427 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _429 = int(_427);
    int _431 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _433 = _431 != 0;
    float _435 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _437 = float(_415);
    float _439 = 0.0;
    float _441 = _437;
    if (!_421)
    {
        float _443 = in.m_58.y;
        _439 = _443;
    }
    float _445 = _439;
    float _447 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _449 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _451 = 1.0 / _437;
    float _453 = float(uint(_429));
    int _455 = ~_429;
    int _457 = _455 + 1;
    float _459 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _461 = _429 == 0;
    float _463 = 1.0 / _453;
    float _465 = _451 * _137;
    float _467 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _469 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    if (!_421)
    {
        _441 = _445;
    }
    float _471 = _441;
    float _473 = trunc(_465);
    int _475 = int(_473);
    float _477 = fma(_417, (*spvDescriptorSet0.vp_c9)._m0[88].z, _467);
    int _479 = as_type<int>(_463) + (-2);
    int _481 = ~_429;
    int _483 = _481 + 1;
    float _485 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[87].z, _477);
    float _487 = 0.0;
    float _489 = _471;
    if (!_421)
    {
        _487 = _471;
    }
    float _491 = _487;
    float _493 = -_485;
    float _495 = _493 + 1.0;
    float _497 = _491;
    int _499 = as_type<int>(_445);
    if (_421)
    {
        float _501 = in.m_58.x;
        float _503 = in.m_58.y;
        _497 = _501;
        _499 = as_type<int>(_503);
    }
    float _505 = _497;
    int _507 = _499;
    float _509 = float(uint(_475));
    float _511 = as_type<float>(_479) * _509;
    float _513 = trunc(_511);
    float _515 = precise::max(_513, 0.0);
    uint _518 = uint(_515);
    bool _520 = !_421;
    float _522 = _520 ? as_type<float>(_507) : _417;
    float _524 = as_type<float>(_507) * 2.0;
    bool _526 = !_421;
    float _528 = _526 ? 1.2345600128173828125 : 1.0;
    float _530 = fma(as_type<float>(_507), (*spvDescriptorSet0.vp_c9)._m0[88].w, _469);
    int _532 = _483 * int(_518);
    int _534 = _532 + _475;
    float _536 = as_type<float>(_534);
    if (_421)
    {
        _489 = as_type<float>(_507);
    }
    float _538 = _489;
    float _540 = _528 * _522;
    float _542 = float(_429);
    float _544 = floor(_524);
    float _546 = float(uint(_534));
    float _548 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[87].w, _530);
    float _550 = _538;
    if (_421)
    {
        _536 = _417;
    }
    float _552 = _536;
    float _554 = _552;
    if (!_421)
    {
        _554 = _423;
    }
    float _556 = _554;
    float _558 = as_type<float>(_479) * _546;
    float _560 = -_548;
    float _562 = _560 + 1.0;
    float _564 = trunc(_558);
    float _566 = precise::max(_564, 0.0);
    uint _568 = uint(_566);
    int _570 = int(_518) + int(_568);
    float _572 = float(_475);
    float _574 = floor(_540);
    int _576 = _457 * _570;
    int _578 = _576 + _475;
    bool _580 = _572 >= _542;
    bool _582 = isnan(_572);
    bool _584 = _580 || _582;
    bool _586 = isnan(_542);
    bool _588 = _584 || _586;
    float _590 = float(_588);
    bool _592 = uint(_578) >= uint(_429);
    float _594 = trunc(_590);
    int _596 = int(_594);
    bool _598 = !_592;
    int _600 = _598 ? 0 : (-1);
    int _602 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _604 = _602 != 0;
    int _606 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _608 = _606 != 0;
    int _610 = ~_570;
    int _612 = _610 + _600;
    int _614 = _612 + 1;
    float _616 = -_574;
    float _618 = _540 + _616;
    float _620 = _542 * _137;
    int _622 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _624 = _622 != 0;
    int _626 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _628 = _626 != 0;
    int _630 = _429 * _614;
    int _632 = _630 + _475;
    float _634 = _542 * _618;
    float _636 = _620 * _155;
    int _638 = _429 + (-1);
    int _640 = ~_596;
    int _642 = _640 + 1;
    int _644 = _642 + 1;
    bool _646 = !_461;
    int _648 = _646 ? _632 : (-1);
    float _650 = trunc(_634);
    int _652 = int(_650);
    bool _654 = !_433;
    int _656 = _654 ? 0 : 1;
    bool _658 = !_604;
    int _660 = _658 ? 0 : 1;
    int _662 = _648 * _644;
    bool _664 = !_608;
    int _666 = _664 ? 0 : 1;
    float _668 = trunc(_636);
    int _670 = int(_668);
    int _672 = _596 * _638;
    int _674 = _672 + _662;
    int _676 = abs(_666);
    int _678 = abs(_656);
    bool _680 = !_624;
    int _682 = _680 ? 0 : 1;
    int _684 = abs(_660);
    int _686 = _652 * _678;
    int _688 = _686 + _475;
    bool _690 = !_628;
    int _692 = _690 ? 0 : 1;
    int _694 = abs(_682);
    int _696 = _674 * _676;
    int _698 = abs(_692);
    int _700 = _670 * _684;
    int _702 = _700 + _696;
    int _704 = ~_429;
    int _706 = _704 + 1;
    int _708 = _688 * _694;
    int _710 = _708 + _702;
    bool _712 = _425 > 0.5;
    int _714 = _652 * _698;
    int _716 = _714 + _710;
    int _718 = ~_429;
    int _720 = _718 + 1;
    float _722 = float(uint(_688));
    float _724 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _726 = _724 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _728 = float(uint(_716));
    float _730 = as_type<float>(_479) * _728;
    float _732 = 1.0 / _726;
    float _734 = trunc(_730);
    float _736 = precise::max(_734, 0.0);
    uint _738 = uint(_736);
    int _740 = _720 * int(_738);
    int _742 = _740 + _716;
    float _744 = float(uint(_742));
    float _746 = as_type<float>(_479) * _744;
    float _748 = trunc(_746);
    float _750 = precise::max(_748, 0.0);
    uint _752 = uint(_750);
    float _754 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _756 = int(_738) + int(_752);
    float _758 = _505 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _760 = as_type<float>(_752);
    float _762 = _556;
    if (!_421)
    {
        float _764 = in.m_58.z;
        _760 = _764;
    }
    float _766 = _760;
    float _768 = fma(_505, (*spvDescriptorSet0.vp_c9)._m0[83].z, _754);
    int _770 = _706 * _756;
    int _772 = _770 + _716;
    float _774 = -_435;
    float _776 = fma(_758, 2.0, _774);
    float _778 = in.m_46.x;
    float _780 = in.m_46.y;
    float _782 = in.m_46.z;
    float _784 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[82].z, _768);
    bool _786 = uint(_772) >= uint(_429);
    float _788 = -_137;
    float _790 = fma(_788, (*spvDescriptorSet0.vp_c9)._m0[81].x, _776);
    float _792 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _794 = !_786;
    int _796 = _794 ? 0 : (-1);
    int _798 = ~_756;
    int _800 = _798 + _796;
    int _802 = _800 + 1;
    float _804 = _556 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _806 = _417 * 2.0;
    int _808 = _429 * _802;
    int _810 = _808 + _716;
    float _812 = -_447;
    float _814 = fma(_804, 2.0, _812);
    float _816 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _818 = log2(_816);
    float _820 = _766;
    if (!_421)
    {
        _762 = _766;
    }
    float _822 = _762;
    bool _824 = !_461;
    int _826 = _824 ? _810 : (-1);
    float _828 = -_137;
    float _830 = fma(_828, (*spvDescriptorSet0.vp_c9)._m0[86].x, _814);
    float _832 = _822;
    if (_421)
    {
        _820 = _538;
    }
    float _834 = _820;
    float _836 = in.m_64.x;
    float _838 = in.m_64.y;
    float _840 = in.m_64.z;
    float _842 = in.m_64.w;
    int _844 = _826 & 3;
    bool _846 = _844 != 0;
    float _848 = floor(_806);
    int _850 = _826 & 3;
    bool _852 = _850 != 0;
    float _854 = fma(_834, (*spvDescriptorSet0.vp_c9)._m0[83].w, _792);
    int _856 = _846 ? 0 : 1;
    bool _858 = _850 != 3;
    bool _860 = uint(_850) >= 2u;
    float _862 = _818 * _137;
    if (_421)
    {
        _832 = _538;
    }
    float _864 = _832;
    if (!_421)
    {
        _550 = _417;
    }
    float _866 = _550;
    int _868 = _860 ? 0 : 1;
    float _870 = _864 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _872 = -_189;
    int _874 = _712 ? as_type<int>(_872) : as_type<int>(_189);
    float _876 = exp2(_862);
    int _878 = ~_868;
    int _880 = _878 + 1;
    int _882 = _880 + 1;
    float _884 = _866 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    bool _886 = uint(_850) > 1u;
    float _888 = fma(_870, -2.0, _459);
    int _890 = _882;
    if (_858)
    {
        int _892 = ~_868;
        int _894 = _892 + 1;
        _890 = _894;
    }
    int _896 = _890;
    float _898 = fma(_884, -2.0, _449);
    int _900 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _902 = _900 != 0;
    float _904 = _780 * _838;
    bool _906 = _423 > 0.5;
    float _908 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[86].y, _898);
    bool _910 = !_902;
    float _912 = _910 ? _189 : as_type<float>(_874);
    float _914 = fma(_778, _836, _904);
    float _916 = -_185;
    int _918 = _906 ? as_type<int>(_916) : as_type<int>(_185);
    int _920 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _922 = _920 != 0;
    float _924 = -_876;
    float _926 = _924 + 1.0;
    int _928 = ~_856;
    int _930 = _928 + 1;
    int _932 = _930 + 1;
    bool _934 = !_922;
    float _936 = _934 ? _185 : as_type<float>(_918);
    bool _938 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _940 = isnan(1.0);
    bool _942 = _938 || _940;
    bool _944 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _946 = _942 || _944;
    float _948 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _950 = 1.0 + _948;
    bool _952 = _848 > 0.0;
    float _954 = in.m_66.x;
    float _956 = in.m_66.y;
    float _958 = in.m_66.z;
    float _960 = in.m_66.w;
    bool _962 = _848 >= 0.0;
    bool _964 = isnan(_848);
    bool _966 = _962 || _964;
    bool _968 = isnan(0.0);
    bool _970 = _966 || _968;
    float _972 = 1.0 / _950;
    int _974 = _932;
    if (!_886)
    {
        int _976 = ~_856;
        int _978 = _976 + 1;
        _974 = _978;
    }
    int _980 = _974;
    float _982 = in.m_68.x;
    float _984 = in.m_68.y;
    float _986 = in.m_68.z;
    float _988 = in.m_68.w;
    bool _990 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _992 = isnan(0.0);
    bool _994 = _990 || _992;
    bool _996 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _998 = _994 || _996;
    float _1000 = -_189;
    int _1002 = _906 ? as_type<int>(_1000) : as_type<int>(_189);
    float _1004 = _998 ? _926 : 0.0;
    float _1006 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[82].w, _854);
    float _1008 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[81].y, _888);
    int _1010 = _970 ? 0 : 1;
    int _1012 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1014 = _1012 != 0;
    int _1016 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1018 = _1016 != 0;
    int _1020 = ~_1010;
    int _1022 = _1020 + 1;
    int _1024 = _1022 + 1;
    int _1026 = _1024;
    if (_946)
    {
        float _1028 = _1004 * _972;
        _159 = _1028;
    }
    float _1030 = _159;
    bool _1032 = _417 > 0.5;
    if (!_952)
    {
        int _1034 = ~_1010;
        int _1036 = _1034 + 1;
        _1026 = _1036;
    }
    int _1038 = _1026;
    bool _1040 = !_1018;
    float _1042 = _1040 ? _189 : as_type<float>(_1002);
    float _1044 = -_185;
    int _1046 = _1032 ? as_type<int>(_1044) : as_type<int>(_185);
    bool _1048 = _544 >= 0.0;
    bool _1050 = isnan(_544);
    bool _1052 = _1048 || _1050;
    bool _1054 = isnan(0.0);
    bool _1056 = _1052 || _1054;
    int _1058 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1060 = _1058 != 0;
    float _1062 = _780 * _984;
    int _1064 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1066 = _1064 != 0;
    float _1068 = _780 * _956;
    int _1070 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1072 = _1070 != 0;
    float _1074 = _423 * 2.0;
    int _1076 = _1056 ? 0 : 1;
    float _1078 = as_type<float>(_479) * _722;
    float _1080 = floor(_1074);
    bool _1082 = _544 > 0.0;
    float _1084 = fma(_778, _954, _1068);
    float _1086 = fma(_778, _982, _1062);
    float _1088 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1090 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1088;
    float _1092 = fma(_782, _840, _914);
    int _1094 = ~_1076;
    int _1096 = _1094 + 1;
    int _1098 = _1096 + 1;
    float _1100 = fma(_782, _986, _1086);
    float _1102 = trunc(_1078);
    float _1104 = precise::max(_1102, 0.0);
    uint _1106 = uint(_1104);
    float _1108 = _1090 * _732;
    bool _1110 = _411 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1112 = isnan(_411);
    bool _1114 = _1110 || _1112;
    bool _1116 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1118 = _1114 || _1116;
    float _1120 = float(_1118);
    float _1122 = fma(_782, _958, _1084);
    float _1124 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1126 = _411 + _1124;
    bool _1128 = _411 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1130 = isnan(_411);
    bool _1132 = _1128 || _1130;
    bool _1134 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1136 = _1132 || _1134;
    float _1138 = float(_1136);
    float _1140 = _1100 + _988;
    int _1142 = _1098;
    float _1144 = _1140;
    if (!_1082)
    {
        int _1146 = ~_1076;
        int _1148 = _1146 + 1;
        _1142 = _1148;
    }
    int _1150 = _1142;
    float _1152 = -_1120;
    float _1154 = _1152 + 1.0;
    int _1156 = ~_429;
    int _1158 = _1156 + 1;
    float _1160 = fma(_1108, _1126, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _1162 = _1080 >= 0.0;
    bool _1164 = isnan(_1080);
    bool _1166 = _1162 || _1164;
    bool _1168 = isnan(0.0);
    bool _1170 = _1166 || _1168;
    float _1172 = _1138 * _1154;
    float _1174 = _1092 + _842;
    float _1176 = _1122 + _960;
    int _1178 = _1170 ? 0 : 1;
    int _1180 = _1158 * int(_1106);
    int _1182 = _1180 + _688;
    bool _1184 = _1080 > 0.0;
    float _1186 = _1160 * _1172;
    float _1188 = -_1138;
    float _1190 = _1188 + 1.0;
    int _1192 = ~_1178;
    int _1194 = _1192 + 1;
    int _1196 = _1194 + 1;
    float _1198 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1200 = _1140 + _1198;
    float _1202 = float(uint(_1182));
    float _1204 = fma(_1190, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1186);
    int _1206 = _826 >> 31;
    float _1208 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1210 = _1174 + _1208;
    float _1212 = _1200 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1214 = as_type<float>(_479) * _1202;
    int _1216 = _1206 & 3;
    float _1218 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1220 = _1176 + _1218;
    int _1222 = _1196;
    float _1224 = _1174;
    if (!_1184)
    {
        int _1226 = ~_1178;
        int _1228 = _1226 + 1;
        _1222 = _1228;
    }
    int _1230 = _1222;
    float _1232 = fma(_1210, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1212);
    int _1234 = _826 + _1216;
    float _1236 = trunc(_1214);
    float _1238 = precise::max(_1236, 0.0);
    uint _1240 = uint(_1238);
    bool _1242 = as_type<float>(_507) > 0.5;
    float _1244 = fma(_1220, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1232);
    int _1246 = _1234 >> 2;
    float _1248 = fma(_1120, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1204);
    bool _1250 = !_1066;
    float _1252 = _1250 ? _185 : as_type<float>(_1046);
    float _1254 = as_type<float>(_507) + _417;
    int _1256 = _1246 << 4;
    int _1258 = _1256 + 512;
    float _1260 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1262 = -_185;
    int _1264 = _1242 ? as_type<int>(_1262) : as_type<int>(_185);
    float _1266 = _1248 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    uint _1268 = uint(int(uint(_1258) >> uint(2)));
    uint _1270 = uint(int(uint(int(_1268)) >> uint(2)));
    int _1272 = int(_1268) & 3;
    float _1274 = (*spvDescriptorSet0.vp_c9)._m0[int(_1270)][_1272];
    int _1276 = int(_1268) + 1;
    uint _1278 = uint(int(uint(_1276) >> uint(2)));
    int _1280 = _1276 & 3;
    float _1282 = (*spvDescriptorSet0.vp_c9)._m0[int(_1278)][_1280];
    float _1284 = -_189;
    int _1286 = _1242 ? as_type<int>(_1284) : as_type<int>(_189);
    float _1288 = _1254 + (-1.0);
    bool _1290 = _1244 >= 0.0;
    float _1292 = _936 + 0.5;
    int _1294 = int(_1106) + int(_1240);
    float _1296 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1298 = fma(_1292, (*spvDescriptorSet0.vp_c9)._m0[85].x, _790);
    float _1300 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _1302 = ~_429;
    int _1304 = _1302 + 1;
    float _1306 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _1308 = !_1014;
    float _1310 = _1308 ? _185 : as_type<float>(_1264);
    float _1312 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1314 = _1300 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1316 = _1306 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1318 = _1312 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1320 = _1304 * _1294;
    int _1322 = _1320 + _688;
    float _1324 = _1260 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _1326 = !_1072;
    float _1328 = _1326 ? _189 : as_type<float>(_1286);
    float _1330 = fma(_1288, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    out.m_70.x = _1314;
    out.m_70.y = _1316;
    out.m_70.z = _1318;
    out.m_70.w = _1266;
    float _1332 = _1288;
    int _1334 = as_type<int>(_1260);
    if (_1290)
    {
        _1332 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1336 = _1332;
    float _1338 = _1252 + 0.5;
    bool _1340 = uint(_1322) >= uint(_429);
    float _1342 = _912 + (-0.5);
    bool _1344 = _850 != 3;
    if (_1290)
    {
        float _1346 = _1336 * 5.0;
        _1334 = as_type<int>(_1346);
    }
    int _1348 = _1334;
    bool _1350 = !_852;
    int _1352 = _1350 ? 0 : 1;
    float _1354 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1356 = !_1340;
    int _1358 = _1356 ? 0 : (-1);
    float _1360 = -_1328;
    float _1362 = _1360 + 0.5;
    int _1364 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1366 = _1364 != 0;
    int _1368 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1370 = _1368 != 0;
    int _1372 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1374 = _1372 != 0;
    float _1376 = -_1342;
    float _1378 = -_1008;
    float _1380 = fma(_1376, (*spvDescriptorSet0.vp_c9)._m0[85].y, _1378);
    int _1382 = abs(_1352);
    int _1384 = _1258 + 8;
    uint _1386 = uint(int(uint(_1384) >> uint(2)));
    uint _1388 = uint(int(uint(int(_1386)) >> uint(2)));
    int _1390 = int(_1386) & 3;
    float _1392 = (*spvDescriptorSet0.vp_c9)._m0[int(_1388)][_1390];
    int _1394 = int(_1386) + 1;
    uint _1396 = uint(int(uint(_1394) >> uint(2)));
    int _1398 = _1394 & 3;
    float _1400 = (*spvDescriptorSet0.vp_c9)._m0[int(_1396)][_1398];
    float _1402 = _1310 + 0.5;
    float _1404 = _1296 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    if (_1290)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5069 = as_type<float>(_1348);
        out.gl_Position.z = _5069;
    }
    bool _1406 = !_1344;
    int _1408 = _1406 ? 0 : (-1);
    float _1410 = fma(_1324, _1402, _830);
    float _1412 = _1200 * _1200;
    int _1414 = abs(_980);
    float _1416 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1418 = abs(_896);
    float _1420 = fma(_1210, _1210, _1412);
    float _1422 = _1042 + (-0.5);
    int _1424 = ~_1294;
    int _1426 = _1424 + _1358;
    int _1428 = _1426 + 1;
    float _1430 = _1362 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1432 = fma(_1220, _1220, _1420);
    float _1434 = -_1404;
    float _1436 = -_908;
    float _1438 = fma(_1434, _1422, _1436);
    int _1440 = ~_1414;
    int _1442 = _1440 + 1;
    int _1444 = _1442 + 1;
    float _1446 = rsqrt(_1432);
    int _1448 = ~_1382;
    int _1450 = _1448 + 1;
    int _1452 = _1450 + 1;
    float _1454 = -_784;
    float _1456 = _1454 + 1.0;
    int _1458 = _429 * _1428;
    int _1460 = _1458 + _688;
    bool _1462 = !_1060;
    int _1464 = _1462 ? 0 : 1;
    int _1466 = _1444 * as_type<int>(_1282);
    float _1468 = -_1456;
    float _1470 = fma(_936, _1468, _1298);
    bool _1472 = _429 == 0;
    float _1474 = -_495;
    float _1476 = fma(_1310, _1474, _1410);
    int _1478 = _1452 * as_type<int>(_1274);
    int _1480 = _1478 + _1466;
    float _1482 = _1338 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1484 = -_1006;
    float _1486 = _1484 + 1.0;
    int _1488 = abs(_1464);
    float _1490 = fma(_1042, _562, _1438);
    float _1492 = _1482 * _1354;
    float _1494 = fma(_912, _1486, _1380);
    int _1496 = abs(_1408);
    float _1498 = _1430 * _1416;
    float _1500 = _1200 * _1446;
    int _1502 = ~_1496;
    int _1504 = _1502 + 1;
    int _1506 = _1504 + 1;
    float _1508 = _1210 * _1446;
    int _1510 = ~_1418;
    int _1512 = _1510 + 1;
    int _1514 = _1512 + 1;
    out.m_72.x = _1492;
    out.m_72.y = _1498;
    out.m_72.z = _1470;
    out.m_72.w = _1494;
    bool _1516 = !_1366;
    int _1518 = _1516 ? 0 : 1;
    float _1520 = -_1500;
    float _1522 = fma(_1520, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1200);
    float _1524 = float(_1230);
    float _1526 = -_1508;
    float _1528 = fma(_1526, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1210);
    float _1530 = float(_1038);
    float _1532 = _1522 * _1522;
    int _1534 = _1514 * as_type<int>(_1392);
    int _1536 = _1534 + _1480;
    out.m_74.x = _1476;
    out.m_74.y = _1490;
    float _1538 = fma(_1528, _1528, _1532);
    int _1540 = _1506 * as_type<int>(_1400);
    int _1542 = _1540 + _1536;
    if (_1290)
    {
        out.m_49.x = 0.0;
    }
    int _1544 = abs(_1518);
    float _1546 = in.m_76.x;
    float _1548 = in.m_76.y;
    float _1550 = in.m_76.z;
    int _1552 = ~_1488;
    int _1554 = _1552 + 1;
    int _1556 = _1554 + 1;
    float _1558 = float(_1544);
    bool _1560 = !_1472;
    int _1562 = _1560 ? _1460 : (-1);
    int _1564 = _1542 * _1556;
    bool _1566 = !_1370;
    int _1568 = _1566 ? 0 : 1;
    float _1570 = _1558 * _1524;
    float _1572 = _1220 * _1446;
    int _1574 = _1562 * _1488;
    int _1576 = _1574 + _1564;
    int _1578 = abs(_1568);
    float _1580 = _1570 * (-2.0);
    float _1582 = _417 + (-0.5);
    float _1584 = -_1572;
    float _1586 = fma(_1584, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1220);
    float _1588 = float(_1576);
    float _1590 = fma(_1330, _1580, _1330);
    float _1592 = float(_1578);
    float _1594 = fma(_1586, _1586, _1538);
    out.m_78.y = _1588;
    float _1596 = _1592 * _1530;
    bool _1598 = !_1374;
    int _1600 = _1598 ? 0 : 1;
    float _1602 = fma(_1580, _1546, _1546);
    float _1604 = fma(_1582, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1602);
    float _1606 = _423 + as_type<float>(_507);
    float _1608 = _1572;
    if (_1290)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1610 = -_1500;
    float _1612 = fma(_1610, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1140);
    float _1614 = -_1508;
    float _1616 = fma(_1614, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1174);
    float _1618 = -_1572;
    float _1620 = fma(_1618, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1176);
    float _1622 = float(_1150);
    float _1624 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1626 = _1612 + _1624;
    float _1628 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1630 = _1616 + _1628;
    float _1632 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1634 = _1620 + _1632;
    float _1636 = _1626 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1638 = abs(_1600);
    float _1640 = _1606 + (-1.0);
    float _1642 = _1596 * (-2.0);
    float _1644 = fma(_1630, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1636);
    float _1646 = float(_1638);
    float _1648 = fma(_1640, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1650 = as_type<float>(_507) + (-0.5);
    float _1652 = fma(_1634, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1644);
    float _1654 = fma(_1642, _1548, _1548);
    float _1656 = _423 + _417;
    float _1658 = _1646 * _1622;
    float _1660 = fma(_1648, _1642, _1648);
    bool _1662 = _1652 >= 0.0;
    float _1664 = fma(_1650, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1654);
    float _1666 = _1656 + (-1.0);
    float _1668 = _1658 * (-2.0);
    float _1670 = fma(_1660, _1030, _1664);
    float _1672 = fma(_1590, _1030, _1604);
    float _1674 = fma(_1666, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1676 = fma(_1668, _1550, _1550);
    float _1678 = _1670 * 0.15915493667125701904296875;
    float _1680 = sqrt(_1594);
    float _1682 = _423 + (-0.5);
    float _1684 = fma(_1674, _1668, _1674);
    float _1686 = _1670;
    if (_1662)
    {
        _1686 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1688 = _1686;
    float _1690 = fma(_1682, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1676);
    float _1692 = _1672 * 0.15915493667125701904296875;
    int _1694 = as_type<int>(_1688);
    if (_1662)
    {
        out.m_49.x = 0.0;
    }
    float _1696 = _1678 * 6.283185482025146484375;
    float _1698 = sin(_1696);
    if (_1662)
    {
        float _1700 = _1688 * 5.0;
        _1694 = as_type<int>(_1700);
    }
    int _1702 = _1694;
    float _1704 = fma(_1684, _1030, _1690);
    if (_1662)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5536 = as_type<float>(_1702);
        out.gl_Position.z = _5536;
    }
    float _1706 = _1678 * 6.283185482025146484375;
    float _1708 = cos(_1706);
    float _1710 = _1692 * 6.283185482025146484375;
    float _1712 = sin(_1710);
    float _1714 = _1692 * 6.283185482025146484375;
    float _1716 = cos(_1714);
    float _1718 = _1704 * 0.15915493667125701904296875;
    if (_1662)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1720 = _1718 * 6.283185482025146484375;
    float _1722 = cos(_1720);
    float _1724 = _1446 * _1680;
    float _1726 = _389 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1728 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _189);
    float _1730 = _391 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1732 = _1716 * _1708;
    float _1734 = _1724 * _1726;
    float _1736 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _185);
    float _1738 = _1718 * 6.283185482025146484375;
    float _1740 = sin(_1738);
    float _1742 = _1724 * _1730;
    float _1744 = _1728 * _1734;
    float _1746 = _1712 * _1698;
    float _1748 = _1716 * _1698;
    float _1750 = _1712 * _1708;
    float _1752 = _1736 * _1742;
    float _1754 = _1716 * _1722;
    float _1756 = _1712 * _1722;
    float _1758 = _1708 * _1722;
    float _1760 = _1698 * _1722;
    float _1762 = _1754 * _1744;
    float _1764 = _1724 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1766 = _1764 * 0.5;
    float _1768 = _1756 * _1744;
    float _1770 = _1612 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1772 = fma(_1740, _1732, _1746);
    float _1774 = -_1744;
    float _1776 = _1740 * _1774;
    float _1778 = -_1750;
    float _1780 = fma(_1740, _1748, _1778);
    float _1782 = -_1748;
    float _1784 = fma(_1740, _1750, _1782);
    float _1786 = fma(_1772, _1752, _1762);
    float _1788 = fma(_1758, _1752, _1776);
    bool _1790 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1792 = isnan(0.5);
    bool _1794 = _1790 || _1792;
    bool _1796 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1798 = _1794 || _1796;
    float _1800 = fma(_1784, _1752, _1768);
    float _1802 = fma(_1780, _1766, _1786);
    float _1804 = fma(_1740, _1746, _1732);
    float _1806 = fma(_1760, _1766, _1788);
    bool _1808 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1810 = isnan(0.5);
    bool _1812 = _1808 || _1810;
    bool _1814 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1816 = _1812 || _1814;
    float _1818 = _1802 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1820 = fma(_1804, _1766, _1800);
    float _1822 = _1802 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1824 = fma(_1806, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1818);
    float _1826 = fma(_1806, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1822);
    float _1828 = fma(_1616, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1770);
    float _1830 = fma(_1820, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1824);
    float _1832 = fma(_1820, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1826);
    float _1834 = fma(_1620, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1828);
    float _1836 = _1830 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1838 = _1832 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1840 = _1834 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1842 = _1176 + _1836;
    float _1844 = _1612 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1846 = _1174 + _1838;
    float _1848 = 1.0 / _1840;
    float _1850 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1852 = _1842 + _1850;
    float _1854 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1856 = _1846 + _1854;
    float _1858 = _1852 * _1852;
    float _1860 = fma(_1856, _1856, _1858);
    float _1862 = fma(_1616, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1844);
    float _1864 = sqrt(_1860);
    float _1866 = fma(_1620, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1862);
    float _1868 = _1866 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1870 = _1868 + _1840;
    float _1872 = _1802 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1874 = _1870 * _1848;
    float _1876 = _1874 * 0.5;
    float _1878 = fma(_1806, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1872);
    bool _1880 = _1864 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1882 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1884 = fma(_1876, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1882);
    float _1886 = fma(_1820, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1878);
    float _1888 = _1886 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1890 = 1.0 / _1884;
    float _1892 = _1140 + _1888;
    float _1894 = _1870;
    float _1896 = _1888;
    float _1898 = _1876;
    if (!_1880)
    {
        _1894 = _1846;
    }
    float _1900 = _1894;
    float _1902 = _1900;
    if (!_1880)
    {
        _1896 = _1842;
    }
    float _1904 = _1896;
    float _1906 = _1904;
    if (!_1880)
    {
        _1898 = _1892;
    }
    float _1908 = _1898;
    bool _1910 = !_1880;
    float _1912 = _1908;
    if (!_1910)
    {
        float _1914 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1916 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1918 = _1864 + _1916;
        float _1920 = _1892 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1922 = _1918 * _1914;
        float _1924 = rsqrt(_1860);
        float _1926 = _1922 * 0.15915493667125701904296875;
        float _1928 = _1926 * 6.283185482025146484375;
        float _1930 = cos(_1928);
        float _1932 = _1926 * 6.283185482025146484375;
        float _1934 = sin(_1932);
        float _1936 = _1930 + (-1.0);
        float _1938 = _1936 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1940 = fma(_1934, _1920, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1942 = fma(_1892, _1930, _1938);
        float _1944 = _1924 * _1940;
        float _1946 = fma(_1856, _1944, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1948 = fma(_1852, _1944, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1906 = _1948;
        _1902 = _1946;
        _1912 = _1942;
    }
    float _1950 = _1906;
    float _1952 = _1902;
    float _1954 = _1912;
    float _1956 = -_1572;
    float _1958 = fma(_1956, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1950);
    float _1960 = -_1508;
    float _1962 = fma(_1960, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1952);
    float _1964 = -_1500;
    float _1966 = fma(_1964, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1954);
    float _1968 = _1966;
    float _1970 = _1962;
    float _1972 = _1958;
    float _1974 = _1950;
    if (_1816)
    {
        _1608 = 1.0;
    }
    float _1976 = _1608;
    float _1978 = _1976;
    if (!_1798)
    {
        float _1980 = _1626 * _1626;
        float _1982 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1984 = -_1176;
        float _1986 = _1984 + _1950;
        float _1988 = fma(_1630, _1630, _1980);
        float _1990 = fma(_1634, _1634, _1988);
        float _1992 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1994 = sqrt(_1990);
        float _1996 = 1.0 / _1724;
        float _1998 = _1992 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2000 = precise::min(_1994, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2002 = _2000 * _1982;
        float _2004 = -_1140;
        float _2006 = _2004 + _1954;
        float _2008 = _2002 * _1996;
        float _2010 = -_1174;
        float _2012 = _2010 + _1952;
        float _2014 = _1998 * _2008;
        float _2016 = _1986 * _2008;
        float _2018 = fma(_2006, _2014, _1612);
        float _2020 = fma(_2012, _2014, _1616);
        float _2022 = fma(_1998, _2016, _1620);
        _1968 = _2018;
        _1970 = _2020;
        _1972 = _2022;
    }
    float _2024 = _1968;
    float _2026 = _1970;
    float _2028 = _1972;
    if (_1816)
    {
        _1974 = 1.0;
    }
    float _2030 = _1974;
    float _2032 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2034 = _1890 * _2032;
    float _2036 = _2030;
    if (!_1816)
    {
        float _2038 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2040 = _2038 * 0.15915493667125701904296875;
        float _2042 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2044 = _2040 * 6.283185482025146484375;
        float _2046 = cos(_2044);
        float _2048 = _2042 * 0.15915493667125701904296875;
        float _2050 = _2040 * 6.283185482025146484375;
        float _2052 = sin(_2050);
        float _2054 = 1.0 / _2046;
        float _2056 = _2048 * 6.283185482025146484375;
        float _2058 = cos(_2056);
        float _2060 = _2052 * _2054;
        float _2062 = _2048 * 6.283185482025146484375;
        float _2064 = sin(_2062);
        float _2066 = _2058 * _2060;
        float _2068 = 1.0 / _2066;
        float _2070 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2072 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2070;
        float _2074 = 1.0 / _2072;
        float _2076 = _2064 * _2068;
        float _2078 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2080 = fma(_2034, _2076, _2078);
        float _2082 = _2080 * _2074;
        float _2084 = precise::clamp(_2082, 0.0, 1.0);
        _1224 = _2048;
        _1144 = _2040;
        _1978 = _2084;
    }
    float _2086 = _1224;
    float _2088 = _1144;
    float _2090 = _1978;
    float _2092 = _2086;
    if (!_1816)
    {
        float _2094 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2096 = _2094 * 0.15915493667125701904296875;
        float _2098 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2100 = _2096 * 6.283185482025146484375;
        float _2102 = cos(_2100);
        float _2104 = _2098 * 0.15915493667125701904296875;
        float _2106 = _2096 * 6.283185482025146484375;
        float _2108 = sin(_2106);
        float _2110 = 1.0 / _2102;
        float _2112 = _2104 * 6.283185482025146484375;
        float _2114 = cos(_2112);
        float _2116 = _2108 * _2110;
        float _2118 = _2104 * 6.283185482025146484375;
        float _2120 = sin(_2118);
        float _2122 = _2114 * _2116;
        float _2124 = 1.0 / _2122;
        float _2126 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2128 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2126;
        float _2130 = 1.0 / _2128;
        float _2132 = _2120 * _2124;
        float _2134 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2136 = fma(_2034, _2132, _2134);
        float _2138 = _2136 * _2130;
        float _2140 = precise::clamp(_2138, 0.0, 1.0);
        float _2142 = -_2140;
        float _2144 = _2142 + 1.0;
        _2092 = _2110;
        _2036 = _2144;
    }
    float _2146 = _2092;
    float _2148 = _2036;
    float _2150 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2152 = _2024 + _2150;
    float _2154 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2156 = _2026 + _2154;
    float _2158 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2160 = _2028 + _2158;
    float _2162 = _2152 * _2152;
    float _2164 = fma(_2156, _2156, _2162);
    float _2166 = fma(_2160, _2160, _2164);
    float _2168 = rsqrt(_2166);
    float _2170 = _2168 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2172 = _2156 * _2170;
    float _2174 = _2160 * _2170;
    float _2176 = _2172 * _2172;
    float _2178 = _2174 * _2174;
    float _2180 = _2176 + _2178;
    float _2182 = sqrt(_2180);
    bool _2184 = _2182 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2186 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2188 = _2182 + _2186;
    float _2190 = _2160;
    float _2192 = _2162;
    float _2194 = _2188;
    float _2196 = _2146;
    float _2198 = _2152;
    float _2200 = _2180;
    if (_2184)
    {
        float _2202 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2190 = _2202;
    }
    float _2204 = _2190;
    if (_2184)
    {
        float _2206 = rsqrt(_2180);
        _2192 = _2206;
    }
    float _2208 = _2192;
    float _2210 = _2208;
    if (_2184)
    {
        float _2212 = _2188 * _2204;
        _2194 = _2212;
    }
    float _2214 = _2194;
    if (_2184)
    {
        float _2216 = _2214 * 0.15915493667125701904296875;
        _2196 = _2216;
    }
    float _2218 = _2196;
    float _2220 = _2168;
    float _2222 = _2218;
    if (_2184)
    {
        float _2224 = _2218 * 6.283185482025146484375;
        float _2226 = sin(_2224);
        _2220 = _2226;
    }
    float _2228 = _2220;
    float _2230 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2232 = precise::max(0.0, _2230);
    float _2234 = _2088;
    float _2236 = _2232;
    if (_2184)
    {
        float _2238 = _2218 * 6.283185482025146484375;
        float _2240 = cos(_2238);
        _2234 = _2240;
    }
    float _2242 = _2234;
    float _2244 = fma(_1616, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2246 = -_2170;
    float _2248 = -_2232;
    float _2250 = fma(_2152, _2246, _2248);
    if (_2184)
    {
        float _2252 = _2250 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2236 = _2252;
    }
    float _2254 = _2236;
    float _2256 = _2254;
    if (!_2184)
    {
        _2222 = _2172;
    }
    float _2258 = _2222;
    float _2260 = sqrt(_2166);
    float _2262 = _2228;
    float _2264 = _2258;
    if (_2184)
    {
        float _2266 = fma(_2228, _2254, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2262 = _2266;
    }
    float _2268 = _2262;
    float _2270 = _2268;
    float _2272 = _2242;
    if (_2184)
    {
        float _2274 = _2242 + (-1.0);
        _2198 = _2274;
    }
    float _2276 = _2198;
    float _2278 = _2276;
    if (_2184)
    {
        float _2280 = _2208 * _2268;
        _2256 = _2280;
    }
    float _2282 = _2256;
    if (!_2184)
    {
        _2210 = _2250;
    }
    float _2284 = _2210;
    float _2286 = _2284;
    if (_2184)
    {
        float _2288 = _2276 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2200 = _2288;
    }
    float _2290 = _2200;
    if (_2184)
    {
        float _2292 = _2172 * _2282;
        _2264 = _2292;
    }
    float _2294 = _2264;
    if (!_2184)
    {
        _2270 = _2176;
    }
    float _2296 = _2270;
    float _2298 = _2024 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2300 = _2296;
    if (!_2184)
    {
        _2278 = _2174;
    }
    float _2302 = _2278;
    float _2304 = _2302;
    if (_2184)
    {
        float _2306 = fma(_2250, _2242, _2290);
        _2286 = _2306;
    }
    float _2308 = _2286;
    if (_2184)
    {
        float _2310 = _2294 * _2294;
        _2300 = _2310;
    }
    float _2312 = _2300;
    if (_2184)
    {
        float _2314 = _2174 * _2282;
        _2304 = _2314;
    }
    float _2316 = _2304;
    if (!_2184)
    {
        _2272 = _2178;
    }
    float _2318 = _2272;
    float _2320 = floor(_2244);
    float _2322 = fma(_2308, _2308, _2312);
    float _2324 = _2318;
    if (_2184)
    {
        float _2326 = _2316 * _2316;
        _2324 = _2326;
    }
    float _2328 = _2324;
    float _2330 = _2024 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2332 = fma(_2026, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2298);
    float _2334 = _2322 + _2328;
    float _2336 = fma(_2026, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2330);
    float _2338 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2340 = fma(_2260, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2338);
    float _2342 = precise::clamp(_2340, 0.0, 1.0);
    float _2344 = rsqrt(_2334);
    float _2346 = fma(_2028, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2336);
    float _2348 = -_2342;
    float _2350 = _2348 + 1.0;
    float _2352 = fma(_2028, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2332);
    float _2354 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2356 = _2346 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2358 = abs(_2350);
    float _2360 = log2(_2358);
    float _2362 = _2356 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2364 = _2024 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2366 = fma(_1620, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2368 = -_2362;
    float _2370 = fma(_2368, _2354, 1.0);
    float _2372 = _2024 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2374 = fma(_2026, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2364);
    float _2376 = _2344 * _2294;
    float _2378 = _2344 * _2308;
    float _2380 = fma(_2026, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2372);
    float _2382 = fma(_2028, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2374);
    float _2384 = _2376 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2386 = _2344 * _2316;
    float _2388 = fma(_2028, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2380);
    float _2390 = _2382 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2392 = -_2384;
    float _2394 = fma(_2378, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2392);
    float _2396 = floor(_2366);
    float _2398 = _2388 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2400 = _2390 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2402 = -_2386;
    float _2404 = fma(_2402, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2394);
    float _2406 = _2360 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2408 = -_2320;
    float _2410 = _2244 + _2408;
    float _2412 = fma(_2398, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2400);
    float _2414 = fma(_2404, -0.5, 0.5);
    float _2416 = log2(_2370);
    float _2418 = _2390 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2420 = fma(_2356, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2412);
    float _2422 = _2390 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2424 = fma(_2398, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2418);
    float _2426 = fma(_2404, 0.5, 0.5);
    float _2428 = _2378 + 1.0;
    float _2430 = exp2(_2406);
    float _2432 = _2352 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2434 = -_2396;
    float _2436 = _2366 + _2434;
    float _2438 = fma(_2398, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2422);
    float _2440 = fma(_2356, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2424);
    float _2442 = fma(_2432, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2420);
    float _2444 = fma(_2426, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2446 = fma(_2356, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2438);
    float _2448 = sqrt(_2414);
    float _2450 = _2416 * 0.693147182464599609375;
    float _2452 = fma(_2426, _2444, -0.212114393711090087890625);
    float _2454 = -_2378;
    float _2456 = fma(_2430, _2428, _2454);
    float _2458 = 1.0 / _2442;
    float _2460 = fma(_2432, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2440);
    float _2462 = fma(_2432, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2446);
    float2 _6738 = float2(_2410, _2436);
    float _2464 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6738, float2(0.0), isnan(_6738)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6738, float2(0.0), isnan(_6738)), level(0.0)).x;
    float _2466 = fma(_2426, _2452, 1.570728778839111328125);
    float _2468 = _2450 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2470 = _2448 * 0.636619746685028076171875;
    float _2472 = -_2466;
    float _2474 = fma(_2470, _2472, 1.0);
    float _2476 = fma(_2456, 0.5, 0.5);
    float _2478 = _2460 * _2458;
    float _2480 = _2462 * _2458;
    float _2482 = fma(_2478, 0.5, 0.5);
    float _2484 = fma(_2480, -0.5, 0.5);
    float3 _6777 = float3(_2482, _2484, _2468);
    float _2486 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6777, float3(0.0), isnan(_6777)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6777, float3(0.0), isnan(_6777)), level(0.0)).x;
    float3 _6788 = float3(_2482, _2484, _2468);
    float4 _2489 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6788, float3(0.0), isnan(_6788)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6788, float3(0.0), isnan(_6788)), level(0.0)).xyzw;
    float _2491 = _2489.x;
    float _2493 = _2489.y;
    float _2495 = _2489.z;
    float _2497 = _2489.w;
    float2 _6804 = float2(_2474, _2476);
    float3 _2501 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6804, float2(0.0), isnan(_6804)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6804, float2(0.0), isnan(_6804)), level(0.0)).xyz;
    float _2503 = _2501.x;
    float _2505 = _2501.y;
    float _2507 = _2501.z;
    float _2509 = abs(_2034);
    float _2511 = log2(_2509);
    float _2513 = _1772 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2515 = _1772 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2517 = _1772 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2519 = fma(_1758, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2513);
    float _2521 = _1754 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2523 = _1780 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2525 = _1780 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2527 = _2390 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2529 = -_1740;
    float _2531 = fma(_2529, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2521);
    out.m_80.x = _2026;
    out.m_80.y = _2024;
    out.m_80.z = _2028;
    bool _2533 = _2260 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2535 = isnan(_2260);
    bool _2537 = _2533 || _2535;
    bool _2539 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2541 = _2537 || _2539;
    float _2543 = _2511 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2545 = fma(_1758, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2515);
    float _2547 = _1754 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2549 = _1754 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2551 = fma(_1758, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2517);
    float _2553 = _1780 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2555 = exp2(_2543);
    float _2557 = -_1740;
    float _2559 = fma(_2557, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2547);
    float _2561 = -_1740;
    float _2563 = fma(_2561, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2549);
    float _2565 = fma(_1784, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2519);
    float _2567 = fma(_1784, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2551);
    float _2569 = fma(_1784, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2545);
    float _2571 = fma(_1760, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2523);
    float _2573 = fma(_1760, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2553);
    float _2575 = fma(_1760, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2525);
    float _2577 = fma(_1756, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2531);
    float _2579 = fma(_1756, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2559);
    float _2581 = fma(_1756, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2563);
    float _2583 = fma(_2398, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2527);
    float _2585 = fma(_1804, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2571);
    float _2587 = fma(_1804, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2573);
    float _2589 = fma(_2555, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2591 = precise::clamp(_2589, 0.0, 1.0);
    float _2593 = fma(_1804, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2575);
    float _2595 = _189 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2597 = fma(_2356, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2583);
    float _2599 = fma(_2591, -2.0, 3.0);
    float _2601 = _2591 * _2591;
    float _2603 = _2595 * _2579;
    float _2605 = in.m_82.x;
    float _2607 = _185 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2609 = _2601 * _2599;
    float _2611 = _2595 * _2577;
    float _2613 = _2595 * _2581;
    float _2615 = fma(_2432, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2597);
    float _2617 = _2360 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2619 = -_2609;
    float _2621 = _2619 + 1.0;
    bool _2623 = _2034 <= 8000.0;
    bool _2625 = isnan(_2034);
    bool _2627 = _2623 || _2625;
    bool _2629 = isnan(8000.0);
    bool _2631 = _2627 || _2629;
    float _2633 = float(_2631);
    float _2635 = fma(_2607, _2565, _2611);
    float _2637 = fma(_2607, _2567, _2613);
    float _2639 = fma(_2621, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2609);
    float _2641 = exp2(_2617);
    float _2643 = fma(_2607, _2569, _2603);
    float _2645 = _2585 + _2635;
    float _2647 = _2633 * _2639;
    float _2649 = _2593 + _2637;
    float _2651 = _2615 + _2442;
    float _2653 = _2460 + _2442;
    float _2655 = _2647 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2657 = _2442 * 0.5;
    float _2659 = _2587 + _2643;
    float _2661 = _2651 * 0.5;
    float _2663 = _2653 * 0.5;
    float _2665 = fma(_2462, -0.5, _2657);
    out.gl_Position.x = _2460;
    out.gl_Position.y = _2462;
    out.gl_Position.z = _2615;
    out.gl_Position.w = _2442;
    float _2667 = -_2641;
    float _2669 = _2667 + 1.0;
    out.m_84.x = _2663;
    out.m_84.y = _2665;
    out.m_84.z = _2661;
    out.m_84.w = _2442;
    float _2671 = _2669 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_86.x = _2645;
    out.m_86.y = _2659;
    out.m_86.z = _2649;
    float _2673 = -_2671;
    float _2675 = _2673 + 1.0;
    float _2677 = _2442;
    float _2679 = _2615;
    float _2681 = _2462;
    if (!_2541)
    {
        _2677 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2683 = _2677;
    float _2685 = _2683;
    float _2687 = _2683;
    if (!_2541)
    {
        _2679 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2689 = _2679;
    float _2691 = _2689;
    float _2693 = _2689;
    if (!_2541)
    {
        _2681 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2695 = _2681;
    float _2697 = -_2464;
    float _2699 = _2697 + 1.0;
    float _2701 = _2699 * _2655;
    float _2703 = precise::clamp(_2701, 0.0, 1.0);
    float _2705 = -_2703;
    float _2707 = fma(_2705, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2709 = _2707 * _2605;
    float _2711 = _2709 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_88.x = _2711;
    float _2713 = _2671 * _2486;
    float _2715 = _2497 * _2675;
    float _2717 = _2090 * _2148;
    float _2719 = _2497 * _2713;
    float _2721 = _2507 * _2713;
    float _2723 = fma(_2503, _2719, _2491);
    float _2725 = fma(_2505, _2719, _2493);
    float _2727 = fma(_2497, _2721, _2495);
    float _2729 = _2717 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2731 = _2493;
    float _2733 = _2491;
    float _2735 = _2717;
    float _2737 = _2695;
    float _2739 = _2695;
    if (!_2541)
    {
        _2731 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2741 = _2731;
    float _2743 = _2741;
    float _2745 = _2741;
    if (!_2541)
    {
        _2733 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2747 = _2733;
    out.m_90.x = _2723;
    out.m_90.y = _2725;
    out.m_90.z = _2727;
    out.m_90.w = _2715;
    float _2749 = _2747;
    float _2751 = _2747;
    if (!_2541)
    {
        _2735 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2753 = _2735;
    bool _2755 = !_2541;
    float _2757 = _2753;
    float _2759 = _2753;
    if (!_2755)
    {
        bool _2761 = _2260 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2763 = isnan(_2260);
        bool _2765 = _2761 || _2763;
        bool _2767 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2769 = _2765 || _2767;
        if (!_2769)
        {
            float _2771 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2773 = _2260 + _2771;
            float _2775 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2777 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2775;
            float _2779 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2781 = _2779 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2783 = 1.0 / _2777;
            float _2785 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2787 = _2785 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2789 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2791 = _2789 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2793 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2795 = _2793 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2797 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2799 = _2797 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2801 = _2773 * _2783;
            float _2803 = precise::clamp(_2801, 0.0, 1.0);
            float _2805 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2807 = _2805 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2809 = fma(_2803, _2781, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2811 = fma(_2803, _2807, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2813 = fma(_2803, _2787, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2815 = fma(_2803, _2791, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2817 = fma(_2803, _2795, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2819 = fma(_2803, _2799, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2751 = _2813;
            _2739 = _2817;
            _2745 = _2809;
            _2693 = _2815;
            _2687 = _2811;
            _2759 = _2819;
            _2821 = true;
        }
        else
        {
            bool _2823 = _2260 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2825 = isnan(_2260);
            bool _2827 = _2823 || _2825;
            bool _2829 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2831 = _2827 || _2829;
            if (!_2831)
            {
                _2743 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2833 = _2743;
            _2745 = _2833;
            if (!_2831)
            {
                _2749 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2835 = _2749;
            _2751 = _2835;
            if (!_2831)
            {
                _2685 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2837 = _2685;
            _2687 = _2837;
            if (!_2831)
            {
                _2691 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2839 = _2691;
            _2693 = _2839;
            if (!_2831)
            {
                _2737 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2841 = _2737;
            _2739 = _2841;
            if (!_2831)
            {
                _2757 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2843 = _2757;
            bool _2845 = !_2831;
            _2759 = _2843;
            if (!_2845)
            {
                bool _2847 = _2260 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2849 = isnan(_2260);
                bool _2851 = _2847 || _2849;
                bool _2853 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2855 = _2851 || _2853;
                if (!_2855)
                {
                    float _2857 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2859 = _2260 + _2857;
                    float _2861 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2863 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2861;
                    float _2865 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2867 = _2865 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2869 = 1.0 / _2863;
                    float _2871 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2873 = _2871 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2875 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2877 = _2875 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2879 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2881 = _2879 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2883 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2885 = _2883 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2887 = _2859 * _2869;
                    float _2889 = precise::clamp(_2887, 0.0, 1.0);
                    float _2891 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2893 = _2891 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2895 = fma(_2889, _2867, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2897 = fma(_2889, _2893, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2899 = fma(_2889, _2873, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2901 = fma(_2889, _2877, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2903 = fma(_2889, _2881, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2905 = fma(_2889, _2885, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2751 = _2899;
                    _2739 = _2903;
                    _2745 = _2895;
                    _2693 = _2901;
                    _2687 = _2897;
                    _2759 = _2905;
                    _2821 = true;
                }
                else
                {
                    _2751 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2739 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2745 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2693 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2687 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2759 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2821 = false;
    float _2907 = _2751;
    float _2909 = _2739;
    float _2911 = _2745;
    float _2913 = _2693;
    float _2915 = _2687;
    float _2917 = _2759;
    float _2919 = _2729 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2921 = fma(_2659, -0.5, 0.5);
    float _2923 = precise::clamp(_2921, 0.0, 1.0);
    float _2925 = -_2907;
    float _2927 = _2925 + _2909;
    float _2929 = -_2911;
    float _2931 = _2929 + _2913;
    out.m_92.x = 0.0;
    float _2933 = fma(_2923, _2927, _2907);
    float _2935 = -_2915;
    float _2937 = _2935 + _2917;
    float _2939 = fma(_2923, _2931, _2911);
    float _2941 = _2933 * 0.586610972881317138671875;
    bool _2943 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2945 = fma(_2923, _2937, _2915);
    out.m_49.x = _2919;
    float _2947 = fma(_2939, 0.298911988735198974609375, _2941);
    bool _2949 = _2090 > 0.0;
    bool _2951 = isnan(_2090);
    bool _2953 = _2949 || _2951;
    bool _2955 = isnan(0.0);
    bool _2957 = _2953 || _2955;
    float _2959 = fma(_2945, 0.114477999508380889892578125, _2947);
    bool _2961 = _2148 <= 0.0;
    bool _2963 = !_2957;
    bool _2965 = _2961 || _2963;
    float _2967 = -_2959;
    float _2969 = _2939 + _2967;
    float _2971 = -_2959;
    float _2973 = _2933 + _2971;
    float _2975 = -_2959;
    float _2977 = _2945 + _2975;
    float _2979 = fma(_2969, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2959);
    float _2981 = fma(_2973, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2959);
    float _2983 = fma(_2977, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2959);
    bool _2985 = !_2943;
    if (!_2985)
    {
        float _2987 = -_2024;
        float _2989 = _2987 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2991 = -_2026;
        float _2993 = _2991 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2995 = -_2028;
        float _2997 = _2995 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2999 = _2989 * _2989;
        float _3001 = fma(_2993, _2993, _2999);
        float _3003 = fma(_2997, _2997, _3001);
        float _3005 = sqrt(_3003);
        float _3007 = rsqrt(_3003);
        float _3009 = -_3005;
        float _3011 = _3009 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3013 = _3011 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3015 = precise::clamp(_3013, 0.0, 1.0);
        float _3017 = _2993 * _3007;
        float _3019 = _2989 * _3007;
        float _3021 = abs(_3015);
        float _3023 = log2(_3021);
        float _3025 = _2997 * _3007;
        float _3027 = _3017 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3029 = _2659 * _3019;
        float _3031 = -_3019;
        float _3033 = -_3027;
        float _3035 = fma(_3031, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3033);
        float _3037 = fma(_2645, _3017, _3029);
        float _3039 = -_3025;
        float _3041 = fma(_3039, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3035);
        float _3043 = fma(_2649, _3025, _3037);
        float _3045 = precise::clamp(_3043, 0.0, 1.0);
        float _3047 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3049 = _3041 + _3047;
        float _3051 = _3023 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3053 = _3049 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3055 = precise::clamp(_3053, 0.0, 1.0);
        float _3057 = exp2(_3051);
        float _3059 = _3057 * _3055;
        float _3061 = _3045 * _3059;
        float _3063 = _3061 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3065 = _3061 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3067 = _3061 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_92.x = _3063;
        out.m_92.y = _3065;
        out.m_92.z = _3067;
    }
    out.m_94.x = _2979;
    out.m_94.y = _2981;
    out.m_94.z = _2983;
    if (!_2965)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3069 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_49.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3069;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}


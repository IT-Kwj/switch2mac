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
    float4 m_66 [[user(locn1)]];
    float4 m_51 [[user(locn2)]];
    float4 m_86 [[user(locn3)]];
    float4 m_72 [[user(locn4)]];
    float4 m_68 [[user(locn5)]];
    float4 m_78 [[user(locn6)]];
    float4 m_74 [[user(locn7)]];
    float4 m_84 [[user(locn8)]];
    float4 m_80 [[user(locn9)]];
    float4 m_82 [[user(locn10)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_76 [[attribute(0)]];
    float4 m_64 [[attribute(1)]];
    float4 m_55 [[attribute(2)]];
    float4 m_48 [[attribute(3)]];
    float4 m_53 [[attribute(4)]];
    float4 m_57 [[attribute(5)]];
    float4 m_62 [[attribute(6)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2402 = false;
    bool _1463 = false;
    bool _323 = false;
    bool _213 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _100 = in.m_48.w;
    float _102 = trunc(_100);
    int _105 = int(_102);
    bool _109 = _105 >= 1;
    float _111 = 0.0;
    if (!_109)
    {
        _111 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _113 = _111;
    float _115 = _113;
    if (!_109)
    {
        out.m_51.x = 0.0;
    }
    int _117 = 0;
    if (!_109)
    {
        float _119 = _113 * 5.0;
        _117 = as_type<int>(_119);
    }
    int _121 = _117;
    int _123 = _121;
    if (!_109)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2707 = as_type<float>(_121);
        out.gl_Position.z = _2707;
    }
    if (!_109)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _125 = in.m_53.w;
    bool _127 = _125 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _129 = isnan(_125);
    bool _131 = _127 || _129;
    bool _133 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _135 = _131 || _133;
    float _137 = -_125;
    float _139 = _137 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _141 = 0.0;
    float _143 = _139;
    if (_135)
    {
        float _145 = float(_105);
        _141 = _145;
    }
    float _147 = _141;
    bool _149 = _139 >= _147;
    bool _151 = !_135;
    bool _153 = _149 || _151;
    if (_153)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _155 = _115;
    if (_153)
    {
        out.m_51.x = 0.0;
    }
    if (_153)
    {
        float _157 = _155 * 5.0;
        _123 = as_type<int>(_157);
    }
    int _159 = _123;
    if (_153)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2776 = as_type<float>(_159);
        out.gl_Position.z = _2776;
    }
    if (_153)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _161 = in.m_55.x;
    float _163 = in.m_55.y;
    float _165 = in.m_55.z;
    bool _167 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _169 = _163 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _171 = _163 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _173 = _163 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _175 = fma(_161, (*spvDescriptorSet0.vp_c10)._m0[4].x, _169);
    float _177 = fma(_161, (*spvDescriptorSet0.vp_c10)._m0[5].x, _171);
    float _179 = fma(_161, (*spvDescriptorSet0.vp_c10)._m0[6].x, _173);
    float _181 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[4].z, _175);
    float _183 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[5].z, _177);
    float _185 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[6].z, _179);
    bool _187 = !_167;
    float _189 = _181;
    float _191 = _183;
    float _193 = _185;
    float _211;
    if (!_187)
    {
        float _195 = in.m_57.x;
        float _197 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _199 = _195 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _201 = fma(_199, (*spvDescriptorSet0.vp_c9)._m0[12].x, _139);
        float _203 = _201 * _197;
        float _205 = floor(_203);
        float _207 = -_205;
        float _209 = _203 + _207;
        _211 = _209;
        _213 = true;
    }
    else
    {
        float _215 = float(_105);
        float _217 = 1.0 / _215;
        float _219 = _139 * _217;
        _211 = _219;
    }
    _213 = false;
    float _221 = _211;
    float _223 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _225 = _221 + _223;
    bool _227 = _221 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _229 = isnan(_221);
    bool _231 = _227 || _229;
    bool _233 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _235 = _231 || _233;
    float _237 = float(_235);
    float _239 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _241 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _239;
    float _243 = -_237;
    float _245 = _243 + 1.0;
    bool _247 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _249 = 1.0 / _241;
    float _251 = _225 * _249;
    bool _253 = _221 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _255 = isnan(_221);
    bool _257 = _253 || _255;
    bool _259 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _261 = _257 || _259;
    float _263 = float(_261);
    float _265 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _267 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _265;
    float _269 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _271 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _269;
    float _273 = _263 * _245;
    float _275 = fma(_267, _251, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _277 = fma(_271, _251, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _279 = -_263;
    float _281 = _279 + 1.0;
    float _283 = _275 * _273;
    float _285 = _277 * _273;
    float _287 = fma(_281, (*spvDescriptorSet0.vp_c9)._m0[143].x, _283);
    float _289 = fma(_281, (*spvDescriptorSet0.vp_c9)._m0[143].y, _285);
    float _291 = fma(_237, (*spvDescriptorSet0.vp_c9)._m0[144].x, _287);
    float _293 = fma(_237, (*spvDescriptorSet0.vp_c9)._m0[144].y, _289);
    bool _295 = !_247;
    float _319;
    float _321;
    if (!_295)
    {
        float _297 = in.m_57.x;
        float _299 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _301 = float(_105);
        float _303 = 1.0 / _301;
        float _305 = _297 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _307 = _139 * _303;
        float _309 = fma(_305, (*spvDescriptorSet0.vp_c9)._m0[11].y, _139);
        float _311 = _309 * _299;
        float _313 = floor(_311);
        float _315 = -_313;
        float _317 = _311 + _315;
        _319 = _307;
        _321 = _317;
        _323 = true;
    }
    else
    {
        float _325 = float(_105);
        float _327 = 1.0 / _325;
        float _329 = _139 * _327;
        _319 = _329;
        _321 = _329;
    }
    _323 = false;
    float _331 = _319;
    float _333 = _321;
    float _335 = in.m_57.x;
    float _337 = in.m_57.y;
    float _339 = in.m_57.z;
    float _341 = in.m_57.w;
    float _343 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _345 = log2(_343);
    float _347 = as_type<float>(int(gl_VertexIndex));
    bool _349 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _351 = isnan(0.0);
    bool _353 = _349 || _351;
    bool _355 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _357 = _353 || _355;
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _361 = 1.0 + _359;
    bool _363 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _365 = isnan(1.0);
    bool _367 = _363 || _365;
    bool _369 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _371 = _367 || _369;
    float _373 = 1.0 / _361;
    float _375 = _345 * _139;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _379 = _377 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _383 = _381 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _387 = _385 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _389 = exp2(_375);
    float _391 = _339 * 2.0;
    float _393 = _335 * 2.0;
    float _395 = _337 * 2.0;
    float _397 = _337 + _339;
    float _399 = _339 + _335;
    float _401 = _335 + (-0.5);
    float _403 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _405 = _403 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _407 = floor(_391);
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _411 = _409 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _413 = _397 + (-1.0);
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _417 = _415 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _419 = floor(_393);
    float _421 = -_389;
    float _423 = _421 + 1.0;
    float _425 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _427 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _425;
    float _429 = _357 ? _423 : 0.0;
    float _431 = floor(_395);
    bool _433 = _407 > 0.0;
    bool _435 = _407 >= 0.0;
    bool _437 = isnan(_407);
    bool _439 = _435 || _437;
    bool _441 = isnan(0.0);
    bool _443 = _439 || _441;
    if (_371)
    {
        float _445 = _429 * _373;
        _143 = _445;
    }
    float _447 = _143;
    float _449 = in.m_62.x;
    float _451 = in.m_62.y;
    int _453 = _443 ? 0 : 1;
    float _455 = 1.0 / _379;
    bool _457 = _419 > 0.0;
    bool _459 = _419 >= 0.0;
    bool _461 = isnan(_419);
    bool _463 = _459 || _461;
    bool _465 = isnan(0.0);
    bool _467 = _463 || _465;
    int _469 = ~_453;
    int _471 = _469 + 1;
    int _473 = _471 + 1;
    int _475 = as_type<int>(_347) & 1;
    bool _477 = _475 != 0;
    int _479 = as_type<int>(_347) & 2;
    bool _481 = _479 != 0;
    float _483 = 1.0 / _383;
    bool _485 = _431 > 0.0;
    int _487 = _467 ? 0 : 1;
    bool _489 = _431 >= 0.0;
    bool _491 = isnan(_431);
    bool _493 = _489 || _491;
    bool _495 = isnan(0.0);
    bool _497 = _493 || _495;
    int _499 = _473;
    if (!_433)
    {
        int _501 = ~_453;
        int _503 = _501 + 1;
        _499 = _503;
    }
    int _505 = _499;
    float _507 = 1.0 / _387;
    int _509 = _497 ? 0 : 1;
    float _511 = _427 * _455;
    float _513 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _515 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _513;
    float _517 = _291 * _449;
    int _519 = ~_509;
    int _521 = _519 + 1;
    int _523 = _521 + 1;
    float _525 = _339 + (-0.5);
    int _527 = _523;
    if (!_485)
    {
        int _529 = ~_509;
        int _531 = _529 + 1;
        _527 = _531;
    }
    int _533 = _527;
    float _535 = 1.0 / _405;
    int _537 = ~_487;
    int _539 = _537 + 1;
    int _541 = _539 + 1;
    float _543 = _293 * _451;
    float _545 = _337 + (-0.5);
    bool _547 = _341 > 0.5;
    float _549 = _515 * _483;
    int _551 = _541;
    if (!_457)
    {
        int _553 = ~_487;
        int _555 = _553 + 1;
        _551 = _555;
    }
    int _557 = _551;
    float _559 = 1.0 / _411;
    bool _561 = !_481;
    float _563 = _561 ? (-0.5) : 0.5;
    float _565 = _543 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _567 = _517 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _569 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _571 = _569 != 0;
    int _573 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _575 = _573 != 0;
    float _577 = 1.0 / _417;
    int _579 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _581 = _579 != 0;
    float _583 = -_563;
    int _585 = _547 ? as_type<int>(_583) : as_type<int>(_563);
    int _587 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _589 = _587 != 0;
    int _591 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _593 = _591 != 0;
    int _595 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _597 = _595 != 0;
    float _599 = in.m_48.x;
    float _601 = in.m_48.y;
    float _603 = in.m_48.z;
    bool _605 = !_477;
    float _607 = _605 ? (-0.5) : 0.5;
    bool _609 = !_589;
    int _611 = _609 ? 0 : 1;
    bool _613 = _339 > 0.5;
    float _615 = _337 + _335;
    bool _617 = _335 > 0.5;
    float _619 = _615 + (-1.0);
    bool _621 = !_593;
    int _623 = _621 ? 0 : 1;
    bool _625 = _337 > 0.5;
    float _627 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _629 = _627 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _631 = !_597;
    int _633 = _631 ? 0 : 1;
    float _635 = float(_533);
    float _637 = 1.0 / _629;
    bool _639 = _331 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _641 = isnan(_331);
    bool _643 = _639 || _641;
    bool _645 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _647 = _643 || _645;
    float _649 = float(_647);
    float _651 = _601 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _653 = _601 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _655 = _601 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _657 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _659 = _657 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    float _661 = fma(_599, (*spvDescriptorSet0.vp_c10)._m0[5].x, _651);
    float _663 = fma(_599, (*spvDescriptorSet0.vp_c10)._m0[4].x, _653);
    float _665 = fma(_599, (*spvDescriptorSet0.vp_c10)._m0[6].x, _655);
    float _667 = 1.0 / _659;
    float _669 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _671 = _669 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _673 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _675 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _673;
    float _677 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _679 = _677 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _681 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _683 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _681;
    float _685 = _671 * _507;
    float _687 = _675 * _535;
    float _689 = _679 * _559;
    float _691 = _683 * _637;
    float _693 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _695 = _693 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _697 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _699 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _697;
    float _701 = _399 + (-1.0);
    float _703 = _695 * _577;
    float _705 = fma(_413, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _707 = _699 * _667;
    float _709 = fma(_619, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _711 = fma(_701, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _713 = fma(_603, (*spvDescriptorSet0.vp_c10)._m0[4].z, _663);
    float _715 = fma(_603, (*spvDescriptorSet0.vp_c10)._m0[5].z, _661);
    float _717 = fma(_603, (*spvDescriptorSet0.vp_c10)._m0[6].z, _665);
    int _719 = abs(_611);
    float _721 = in.m_64.x;
    float _723 = in.m_64.y;
    float _725 = in.m_64.z;
    float _727 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _729 = _333 + _727;
    int _731 = abs(_623);
    float _733 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _735 = _331 + _733;
    float _737 = float(_719);
    float _739 = float(_505);
    float _741 = fma(_511, _729, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    int _743 = abs(_633);
    float _745 = fma(_549, _735, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    float _747 = _737 * _739;
    float _749 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _751 = _331 + _749;
    float _753 = float(_731);
    float _755 = float(_557);
    float _757 = float(_743);
    float _759 = fma(_685, _751, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    float _761 = _747 * (-2.0);
    float _763 = _753 * _755;
    bool _765 = _331 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _767 = isnan(_331);
    bool _769 = _765 || _767;
    bool _771 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _773 = _769 || _771;
    float _775 = float(_773);
    float _777 = -_649;
    float _779 = _777 + 1.0;
    float _781 = fma(_709, _761, _709);
    float _783 = fma(_761, _721, _721);
    float _785 = _757 * _635;
    float _787 = _763 * (-2.0);
    bool _789 = _331 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _791 = isnan(_331);
    bool _793 = _789 || _791;
    bool _795 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _797 = _793 || _795;
    float _799 = float(_797);
    float _801 = _775 * _779;
    float _803 = -_775;
    float _805 = _803 + 1.0;
    float _807 = fma(_401, (*spvDescriptorSet0.vp_c9)._m0[196].x, _783);
    bool _809 = _331 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _811 = isnan(_331);
    bool _813 = _809 || _811;
    bool _815 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _817 = _813 || _815;
    float _819 = float(_817);
    float _821 = fma(_787, _723, _723);
    float _823 = _799 * _805;
    float _825 = fma(_705, _787, _705);
    float _827 = -_799;
    float _829 = _827 + 1.0;
    bool _831 = _331 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _833 = isnan(_331);
    bool _835 = _831 || _833;
    bool _837 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _839 = _835 || _837;
    float _841 = float(_839);
    float _843 = -_819;
    float _845 = _843 + 1.0;
    float _847 = fma(_781, _447, _807);
    float _849 = _785 * (-2.0);
    float _851 = _819 * _829;
    float _853 = _841 * _845;
    float _855 = fma(_545, (*spvDescriptorSet0.vp_c9)._m0[196].y, _821);
    bool _857 = _331 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _859 = isnan(_331);
    bool _861 = _857 || _859;
    bool _863 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _865 = _861 || _863;
    float _867 = float(_865);
    float _869 = fma(_711, _849, _711);
    float _871 = fma(_849, _725, _725);
    float _873 = fma(_825, _447, _855);
    bool _875 = _331 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _877 = isnan(_331);
    bool _879 = _875 || _877;
    bool _881 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _883 = _879 || _881;
    float _885 = float(_883);
    float _887 = -_867;
    float _889 = _887 + 1.0;
    bool _891 = _331 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _893 = isnan(_331);
    bool _895 = _891 || _893;
    bool _897 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _899 = _895 || _897;
    float _901 = float(_899);
    float _903 = fma(_525, (*spvDescriptorSet0.vp_c9)._m0[196].z, _871);
    float _905 = _873 * 0.15915493667125701904296875;
    float _907 = -_885;
    float _909 = _907 + 1.0;
    float _911 = _847 * 0.15915493667125701904296875;
    float _913 = _901 * _889;
    float _915 = fma(_869, _447, _903);
    float _917 = -_841;
    float _919 = _917 + 1.0;
    float _921 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _923 = _331 + _921;
    float _925 = _867 * _909;
    float _927 = _745 * _913;
    float _929 = -_901;
    float _931 = _929 + 1.0;
    float _933 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _935 = _331 + _933;
    float _937 = _915 * 0.15915493667125701904296875;
    float _939 = _885 * _919;
    float _941 = fma(_689, _923, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    float _943 = fma(_931, (*spvDescriptorSet0.vp_c9)._m0[151].x, _927);
    float _945 = _911 * 6.283185482025146484375;
    float _947 = sin(_945);
    float _949 = fma(_687, _935, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _951 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _953 = _331 + _951;
    float _955 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _957 = _331 + _955;
    float _959 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _961 = _331 + _959;
    float _963 = fma(_759, _925, _943);
    float _965 = fma(_691, _953, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    bool _967 = _333 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _969 = isnan(_333);
    bool _971 = _967 || _969;
    bool _973 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _975 = _971 || _973;
    float _977 = float(_975);
    float _979 = _911 * 6.283185482025146484375;
    float _981 = cos(_979);
    float _983 = fma(_949, _939, _963);
    float _985 = fma(_703, _957, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    bool _987 = _333 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _989 = isnan(_333);
    bool _991 = _987 || _989;
    bool _993 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _995 = _991 || _993;
    float _997 = float(_995);
    float _999 = -_977;
    float _1001 = _999 + 1.0;
    float _1003 = fma(_941, _853, _983);
    float _1005 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _563);
    float _1007 = fma(_707, _961, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    float _1009 = _905 * 6.283185482025146484375;
    float _1011 = sin(_1009);
    float _1013 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _607);
    float _1015 = _997 * _1001;
    float _1017 = fma(_965, _851, _1003);
    float _1019 = _565 * _1005;
    float _1021 = _567 * _1013;
    float _1023 = _741 * _1015;
    float _1025 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1027 = _905 * 6.283185482025146484375;
    float _1029 = cos(_1027);
    float _1031 = -_997;
    float _1033 = _1031 + 1.0;
    float _1035 = fma(_985, _823, _1017);
    float _1037 = fma(_1033, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1023);
    float _1039 = _713 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1041 = fma(_1007, _801, _1035);
    float _1043 = _937 * 6.283185482025146484375;
    float _1045 = cos(_1043);
    float _1047 = _947 * _1011;
    float _1049 = _937 * 6.283185482025146484375;
    float _1051 = sin(_1049);
    float _1053 = _981 * _1029;
    float _1055 = _947 * _1029;
    float _1057 = _981 * _1045;
    float _1059 = _947 * _1045;
    float _1061 = _981 * _1011;
    float _1063 = _1029 * _1045;
    float _1065 = _1057 * _1019;
    float _1067 = _1011 * _1045;
    float _1069 = _1059 * _1019;
    float _1071 = _1057 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1073 = fma(_1051, _1053, _1047);
    float _1075 = -_1019;
    float _1077 = _1051 * _1075;
    float _1079 = -_1055;
    float _1081 = fma(_1051, _1061, _1079);
    float _1083 = -_1061;
    float _1085 = fma(_1051, _1055, _1083);
    float _1087 = fma(_1073, _1021, _1065);
    float _1089 = fma(_1063, _1021, _1077);
    float _1091 = fma(_1051, _1047, _1053);
    float _1093 = fma(_1085, _1021, _1069);
    float _1095 = fma(_1081, _1025, _1087);
    float _1097 = fma(_1067, _1025, _1089);
    float _1099 = fma(_977, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1037);
    float _1101 = fma(_1091, _1025, _1093);
    float _1103 = _1095 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1105 = _1095 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1107 = fma(_649, (*spvDescriptorSet0.vp_c9)._m0[158].x, _1041);
    float _1109 = _1057 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1111 = fma(_1097, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1103);
    float _1113 = fma(_1097, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1105);
    float _1115 = -_1051;
    float _1117 = fma(_1115, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1071);
    float _1119 = -_1051;
    float _1121 = fma(_1119, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1109);
    float _1123 = fma(_1101, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1111);
    float _1125 = fma(_1101, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1113);
    float _1127 = _717 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1129 = fma(_1059, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1117);
    float _1131 = _1123 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1133 = _1125 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1135 = _1057 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1137 = _1073 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1139 = _1039 + _1131;
    float _1141 = _1127 + _1133;
    float _1143 = -_1051;
    float _1145 = fma(_1143, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1135);
    float _1147 = fma(_1059, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1121);
    float _1149 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1151 = _1139 + _1149;
    float _1153 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1155 = _1141 + _1153;
    float _1157 = fma(_1059, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1145);
    float _1159 = _1073 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1161 = _1151 * _1151;
    float _1163 = _1155 * _1155;
    float _1165 = _1073 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1167 = fma(_1063, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1159);
    float _1169 = -_563;
    int _1171 = _625 ? as_type<int>(_1169) : as_type<int>(_563);
    float _1173 = _1161 + _1163;
    float _1175 = fma(_1063, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1165);
    bool _1177 = !_581;
    float _1179 = _1177 ? _563 : as_type<float>(_585);
    float _1181 = _1081 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1183 = sqrt(_1173);
    float _1185 = _1081 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1187 = _1081 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1189 = _1095 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1191 = fma(_1063, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1137);
    bool _1193 = !_575;
    float _1195 = _1193 ? _563 : as_type<float>(_1171);
    float _1197 = _563 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1199 = fma(_1097, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1189);
    float _1201 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1203 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1181);
    float _1205 = _1197 * _1147;
    float _1207 = _1197 * _1157;
    float _1209 = _1197 * _1129;
    float _1211 = fma(_1101, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1199);
    float _1213 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1185);
    float _1215 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1187);
    bool _1217 = _1183 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1219 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1221 = _715 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1223 = _1211 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1225 = fma(_1085, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1167);
    float _1227 = fma(_1085, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1191);
    float _1229 = fma(_1085, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1175);
    float _1231 = _1221 + _1223;
    float _1233 = -_607;
    int _1235 = _617 ? as_type<int>(_1233) : as_type<int>(_607);
    float _1237 = -_607;
    int _1239 = _613 ? as_type<int>(_1237) : as_type<int>(_607);
    float _1241 = _1211;
    float _1243 = _1223;
    float _1245 = _1139;
    float _1247 = _1161;
    float _1249 = _1163;
    if (!_1217)
    {
        _1241 = _1139;
    }
    float _1251 = _1241;
    float _1253 = _1251;
    if (!_1217)
    {
        _1243 = _1141;
    }
    float _1255 = _1243;
    float _1257 = _1255;
    if (!_1217)
    {
        _1245 = _1231;
    }
    float _1259 = _1245;
    bool _1261 = !_1217;
    float _1263 = _1259;
    float _1265 = _1219;
    if (!_1261)
    {
        float _1267 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1269 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1271 = _1183 + _1269;
        float _1273 = _1231 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1275 = rsqrt(_1173);
        float _1277 = _1271 * _1267;
        float _1279 = _1277 * 0.15915493667125701904296875;
        float _1281 = _1279 * 6.283185482025146484375;
        float _1283 = sin(_1281);
        float _1285 = _1279 * 6.283185482025146484375;
        float _1287 = cos(_1285);
        float _1289 = fma(_1283, _1273, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1291 = _1275 * _1289;
        float _1293 = fma(_1151, _1291, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1295 = _1287 + (-1.0);
        float _1297 = fma(_1155, _1291, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1299 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1301 = _1293 + _1299;
        float _1303 = _1295 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1305 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1307 = _1297 + _1305;
        float _1309 = _1301 * _1301;
        float _1311 = fma(_1231, _1287, _1303);
        float _1313 = _1307 * _1307;
        _1263 = _1311;
        _1247 = _1309;
        _1249 = _1313;
        _1253 = _1293;
        _1257 = _1297;
    }
    float _1315 = _1263;
    float _1317 = _1247;
    float _1319 = _1249;
    float _1321 = _1253;
    float _1323 = _1257;
    float _1325 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _1327 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1329 = _1327 != 0;
    float _1331 = _607 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _1333 = !_571;
    float _1335 = _1333 ? _607 : as_type<float>(_1235);
    float _1337 = -_1179;
    float _1339 = _1337 + 0.5;
    bool _1341 = !_1329;
    float _1343 = _1341 ? _607 : as_type<float>(_1239);
    float _1345 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1347 = _1315 + _1345;
    float _1349 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1351 = _1335 + 0.5;
    float _1353 = fma(_1347, _1347, _1317);
    float _1355 = _1339 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1357 = -_1195;
    float _1359 = _1357 + 0.5;
    float _1361 = _1353 + _1319;
    float _1363 = _1343 + 0.5;
    float _1365 = _1355 * _1325;
    float _1367 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1203);
    float _1369 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1213);
    float _1371 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1215);
    float _1373 = fma(_1331, _1227, _1205);
    float _1375 = fma(_1331, _1225, _1207);
    float _1377 = sqrt(_1361);
    float _1379 = fma(_1331, _1229, _1209);
    float _1381 = _1351 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1383 = _1359 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1385 = _1363 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1387 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1389 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1391 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1393 = _1381 * _1201;
    float _1395 = _1383 * _1219;
    float _1397 = _1385 * _1349;
    float _1399 = _1367 + _1373;
    float _1401 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1403 = _1387 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1405 = _1389 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1407 = _1391 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1409 = _1099 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1411 = _1369 + _1375;
    float _1413 = _1371 + _1379;
    out.m_66.w = _1401;
    bool _1415 = _1377 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1417 = isnan(_1377);
    bool _1419 = _1415 || _1417;
    bool _1421 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1423 = _1419 || _1421;
    out.m_68.x = _1393;
    out.m_68.y = _1395;
    out.m_68.z = _1397;
    out.m_68.w = _1365;
    out.m_70.x = _1403;
    out.m_70.y = _1405;
    out.m_70.z = _1407;
    out.m_70.w = _1409;
    out.m_72.x = _1107;
    float _1425 = _1365;
    float _1427 = _1401;
    if (!_1423)
    {
        _1265 = 1.0;
    }
    float _1429 = _1265;
    out.m_74.x = _1399;
    out.m_74.y = _1411;
    out.m_74.z = _1413;
    bool _1431 = !_1423;
    float _1433 = _1429;
    if (!_1431)
    {
        bool _1435 = _1377 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1437 = isnan(_1377);
        bool _1439 = _1435 || _1437;
        bool _1441 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1443 = _1439 || _1441;
        if (!_1443)
        {
            float _1445 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1447 = _1377 + _1445;
            float _1449 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1451 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1449;
            float _1453 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1455 = _1453 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1457 = 1.0 / _1451;
            float _1459 = _1447 * _1457;
            float _1461 = fma(_1459, _1455, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1433 = _1461;
            _1425 = _1455;
            _1463 = true;
        }
        else
        {
            bool _1465 = _1377 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1467 = isnan(_1377);
            bool _1469 = _1465 || _1467;
            bool _1471 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1473 = _1469 || _1471;
            if (!_1473)
            {
                float _1475 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1477 = _1377 + _1475;
                float _1479 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1481 = _1479 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1483 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1485 = _1483 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1487 = 1.0 / _1481;
                float _1489 = _1477 * _1487;
                float _1491 = fma(_1489, _1485, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1433 = _1491;
                _1425 = _1485;
                _1463 = true;
            }
            else
            {
                _1433 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1463 = false;
    float _1493 = _1433;
    float _1495 = _1425;
    float _1497 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1499 = _1315 + _1497;
    float _1501 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1503 = _1321 + _1501;
    float _1505 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1507 = _1323 + _1505;
    float _1509 = fma(_1499, _1493, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1511 = fma(_1503, _1493, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1513 = fma(_1507, _1493, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1515 = -_1221;
    float _1517 = _1515 + _1509;
    float _1519 = -_1039;
    float _1521 = _1519 + _1511;
    float _1523 = -_1127;
    float _1525 = _1523 + _1513;
    float _1527 = _1517 * _1517;
    float _1529 = fma(_1521, _1521, _1527);
    float _1531 = fma(_1525, _1525, _1529);
    float _1533 = sqrt(_1531);
    bool _1535 = _1533 > 0.0;
    bool _1537 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1539 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1541 = _1537 || _1539;
    bool _1543 = isnan(0.5);
    bool _1545 = _1541 || _1543;
    float _1547 = _1495;
    float _1549 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _1551 = _1507;
    float _1553 = _1511;
    float _1555 = _1517;
    if (!_1535)
    {
        _1547 = _1511;
    }
    float _1557 = _1547;
    float _1559 = _1557;
    float _1561 = _1557;
    if (!_1535)
    {
        _1549 = _1509;
    }
    float _1563 = _1549;
    float _1565 = _1563;
    if (!_1535)
    {
        _1551 = _1513;
    }
    float _1567 = _1551;
    bool _1569 = !_1535;
    float _1571 = _1567;
    if (!_1569)
    {
        float _1573 = _183 * _183;
        float _1575 = fma(_181, _181, _1573);
        float _1577 = rsqrt(_1531);
        float _1579 = fma(_185, _185, _1575);
        float _1581 = sqrt(_1579);
        float _1583 = _1521 * _1577;
        float _1585 = _1517 * _1577;
        float _1587 = _1525 * _1577;
        bool _1589 = _1581 > 0.0;
        float _1591 = _1577;
        float _1593 = _1581;
        if (!_1589)
        {
            _1559 = _1511;
        }
        float _1595 = _1559;
        _1561 = _1595;
        if (!_1589)
        {
            _1591 = _1509;
        }
        float _1597 = _1591;
        _1565 = _1597;
        if (!_1589)
        {
            _1593 = _1513;
        }
        float _1599 = _1593;
        bool _1601 = !_1589;
        _1571 = _1599;
        if (!_1601)
        {
            float _1603 = rsqrt(_1579);
            float _1605 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1607 = _183 * _1603;
            float _1609 = _181 * _1603;
            float _1611 = _1585 * _1607;
            float _1613 = _185 * _1603;
            float _1615 = fma(_1583, _1609, _1611);
            float _1617 = _1605 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1619 = fma(_1587, _1613, _1615);
            float _1621 = _1619 * _1617;
            float _1623 = fma(_181, _1621, _1511);
            float _1625 = fma(_183, _1621, _1509);
            float _1627 = fma(_185, _1621, _1513);
            _1561 = _1623;
            _1565 = _1625;
            _1571 = _1627;
        }
    }
    float _1629 = _1561;
    float _1631 = _1565;
    float _1633 = _1571;
    if (_1545)
    {
        _189 = _1629;
    }
    float _1635 = _189;
    float _1637 = _1635;
    if (_1545)
    {
        _191 = _1631;
    }
    float _1639 = _191;
    float _1641 = _1639;
    if (_1545)
    {
        _193 = _1633;
    }
    float _1643 = _193;
    float _1645 = _1643;
    if (!_1545)
    {
        float _1647 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1649 = _1221 + _1647;
        float _1651 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1653 = _1039 + _1651;
        float _1655 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1657 = -_1221;
        float _1659 = _1657 + _1631;
        float _1661 = _1649 * _1649;
        float _1663 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1665 = _1127 + _1663;
        float _1667 = -_1127;
        float _1669 = _1667 + _1633;
        float _1671 = fma(_1653, _1653, _1661);
        float _1673 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1675 = fma(_1665, _1665, _1671);
        float _1677 = sqrt(_1675);
        float _1679 = _1655 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1681 = precise::min(_1677, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1683 = _1681 * _1673;
        float _1685 = -_1039;
        float _1687 = _1685 + _1629;
        float _1689 = _1679 * _1683;
        float _1691 = fma(_1687, _1689, _1039);
        float _1693 = fma(_1659, _1689, _1221);
        float _1695 = fma(_1669, _1689, _1127);
        _1641 = _1693;
        _1637 = _1691;
        _1645 = _1695;
    }
    float _1697 = _1641;
    float _1699 = _1637;
    float _1701 = _1645;
    float _1703 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1705 = _1697 + _1703;
    float _1707 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1709 = _1699 + _1707;
    float _1711 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1713 = _1701 + _1711;
    float _1715 = _1705 * _1705;
    float _1717 = fma(_1709, _1709, _1715);
    float _1719 = fma(_1713, _1713, _1717);
    float _1721 = rsqrt(_1719);
    float _1723 = sqrt(_1719);
    float _1725 = _1721 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1727 = _1709 * _1725;
    float _1729 = _1713 * _1725;
    float _1731 = _1727 * _1727;
    float _1733 = _1729 * _1729;
    float _1735 = _1731 + _1733;
    float _1737 = sqrt(_1735);
    bool _1739 = _1737 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1741 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1743 = _1737 + _1741;
    float _1745 = _1721;
    float _1747 = _1743;
    float _1749 = _1705;
    if (_1739)
    {
        float _1751 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1745 = _1751;
    }
    float _1753 = _1745;
    if (_1739)
    {
        float _1755 = rsqrt(_1735);
        _1553 = _1755;
    }
    float _1757 = _1553;
    float _1759 = _1757;
    if (_1739)
    {
        float _1761 = _1743 * _1753;
        _1747 = _1761;
    }
    float _1763 = _1747;
    float _1765 = _1697 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (_1739)
    {
        float _1767 = _1763 * 0.15915493667125701904296875;
        _1555 = _1767;
    }
    float _1769 = _1555;
    float _1771 = _1753;
    if (_1739)
    {
        float _1773 = _1769 * 6.283185482025146484375;
        float _1775 = sin(_1773);
        _1771 = _1775;
    }
    float _1777 = _1771;
    float _1779 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1781 = precise::max(0.0, _1779);
    float _1783 = _1713;
    float _1785 = _1781;
    if (_1739)
    {
        float _1787 = _1769 * 6.283185482025146484375;
        float _1789 = cos(_1787);
        _1783 = _1789;
    }
    float _1791 = _1783;
    float _1793 = -_1725;
    float _1795 = -_1781;
    float _1797 = fma(_1705, _1793, _1795);
    float _1799 = _1797;
    if (_1739)
    {
        float _1801 = _1797 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1785 = _1801;
    }
    float _1803 = _1785;
    float _1805 = _1777;
    float _1807 = _1803;
    if (_1739)
    {
        float _1809 = fma(_1777, _1803, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1805 = _1809;
    }
    float _1811 = _1805;
    float _1813 = _1811;
    if (!_1739)
    {
        _1807 = _1731;
    }
    float _1815 = _1807;
    float _1817 = _1697 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1819 = _1815;
    float _1821 = _1791;
    if (_1739)
    {
        float _1823 = _1791 + (-1.0);
        _1749 = _1823;
    }
    float _1825 = _1749;
    float _1827 = _1825;
    if (_1739)
    {
        float _1829 = _1757 * _1811;
        _1427 = _1829;
    }
    float _1831 = _1427;
    if (!_1739)
    {
        _1759 = _1727;
    }
    float _1833 = _1759;
    float _1835 = _1833;
    if (_1739)
    {
        float _1837 = _1825 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1827 = _1837;
    }
    float _1839 = _1827;
    if (_1739)
    {
        float _1841 = _1727 * _1831;
        _1835 = _1841;
    }
    float _1843 = _1835;
    if (!_1739)
    {
        _1813 = _1729;
    }
    float _1845 = _1813;
    float _1847 = _1845;
    if (_1739)
    {
        float _1849 = _1729 * _1831;
        _1847 = _1849;
    }
    float _1851 = _1847;
    if (_1739)
    {
        float _1853 = fma(_1797, _1791, _1839);
        _1799 = _1853;
    }
    float _1855 = _1799;
    if (_1739)
    {
        float _1857 = _1843 * _1843;
        _1819 = _1857;
    }
    float _1859 = _1819;
    if (!_1739)
    {
        _1821 = _1733;
    }
    float _1861 = _1821;
    float _1863 = _1861;
    if (_1739)
    {
        float _1865 = _1851 * _1851;
        _1863 = _1865;
    }
    float _1867 = _1863;
    float _1869 = fma(_1855, _1855, _1859);
    float _1871 = _1697 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1873 = _1869 + _1867;
    float _1875 = fma(_1699, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1871);
    float _1877 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1879 = fma(_1723, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1877);
    float _1881 = precise::clamp(_1879, 0.0, 1.0);
    float _1883 = rsqrt(_1873);
    float _1885 = fma(_1701, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1875);
    float _1887 = -_1881;
    float _1889 = _1887 + 1.0;
    float _1891 = fma(_1039, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1893 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1895 = _1885 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1897 = abs(_1889);
    float _1899 = log2(_1897);
    float _1901 = _1895 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1903 = fma(_1699, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1765);
    float _1905 = fma(_1127, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1907 = -_1901;
    float _1909 = fma(_1907, _1893, 1.0);
    float _1911 = _1697 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1913 = fma(_1699, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1817);
    float _1915 = _1883 * _1843;
    float _1917 = _1883 * _1855;
    float _1919 = _1883 * _1851;
    float _1921 = fma(_1699, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1911);
    float _1923 = fma(_1701, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1913);
    float _1925 = _1915 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1927 = floor(_1891);
    float _1929 = fma(_1701, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1921);
    float _1931 = _1923 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1933 = -_1925;
    float _1935 = fma(_1917, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1933);
    float _1937 = fma(_1701, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1903);
    float _1939 = _1929 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1941 = _1931 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1943 = _1899 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1945 = floor(_1905);
    float _1947 = -_1919;
    float _1949 = fma(_1947, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1935);
    float _1951 = fma(_1939, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1941);
    float _1953 = fma(_1949, -0.5, 0.5);
    float _1955 = fma(_1895, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1951);
    float _1957 = log2(_1909);
    float _1959 = -_1927;
    float _1961 = _1891 + _1959;
    float _1963 = fma(_1949, 0.5, 0.5);
    float _1965 = exp2(_1943);
    float _1967 = _1937 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1969 = -_1945;
    float _1971 = _1905 + _1969;
    float _1973 = fma(_1963, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1975 = _1917 + 1.0;
    float _1977 = fma(_1967, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1955);
    float _1979 = _1931 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1981 = fma(_1963, _1973, -0.212114393711090087890625);
    float _1983 = sqrt(_1953);
    float _1985 = _1931 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1987 = fma(_1939, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1979);
    float2 _5709 = float2(_1961, _1971);
    float _1989 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5709, float2(0.0), isnan(_5709)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5709, float2(0.0), isnan(_5709)), level(0.0)).x;
    float _1991 = _1957 * 0.693147182464599609375;
    float _1993 = fma(_1939, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1985);
    float _1995 = fma(_1895, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1987);
    float _1997 = fma(_1963, _1981, 1.570728778839111328125);
    float _1999 = 1.0 / _1977;
    float _2001 = fma(_1895, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1993);
    float _2003 = fma(_1967, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1995);
    float _2005 = -_1917;
    float _2007 = fma(_1965, _1975, _2005);
    float _2009 = _1991 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2011 = fma(_1967, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2001);
    float _2013 = fma(_2007, 0.5, 0.5);
    float _2015 = _1983 * 0.636619746685028076171875;
    float _2017 = _2003 * _1999;
    float _2019 = _2011 * _1999;
    float _2021 = -_1997;
    float _2023 = fma(_2015, _2021, 1.0);
    float _2025 = fma(_2017, 0.5, 0.5);
    float _2027 = fma(_2019, -0.5, 0.5);
    float3 _5784 = float3(_2025, _2027, _2009);
    float _2029 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5784, float3(0.0), isnan(_5784)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5784, float3(0.0), isnan(_5784)), level(0.0)).x;
    float3 _5795 = float3(_2025, _2027, _2009);
    float4 _2032 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5795, float3(0.0), isnan(_5795)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5795, float3(0.0), isnan(_5795)), level(0.0)).xyzw;
    float _2034 = _2032.x;
    float _2036 = _2032.y;
    float _2038 = _2032.z;
    float _2040 = _2032.w;
    float2 _5811 = float2(_2023, _2013);
    float3 _2044 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5811, float2(0.0), isnan(_5811)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5811, float2(0.0), isnan(_5811)), level(0.0)).xyz;
    float _2046 = _2044.x;
    float _2048 = _2044.y;
    float _2050 = _2044.z;
    float _2052 = _1221 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2054 = _1221 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2056 = _1931 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2058 = _1723 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2060 = isnan(_1723);
    bool _2062 = _2058 || _2060;
    bool _2064 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2066 = _2062 || _2064;
    float _2068 = fma(_1039, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2052);
    float _2070 = fma(_1039, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2054);
    float _2072 = fma(_1939, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2056);
    float _2074 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2068);
    float _2076 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2070);
    float _2078 = in.m_76.x;
    float _2080 = _2074 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2082 = _2076 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2084 = 1.0 / _2080;
    float _2086 = _2082 + _2080;
    float _2088 = _2086 * _2084;
    float _2090 = _2088 * 0.5;
    float _2092 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2094 = fma(_2090, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2092);
    float _2096 = 1.0 / _2094;
    float _2098 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2100 = _2096 * _2098;
    float _2102 = abs(_2100);
    float _2104 = log2(_2102);
    float _2106 = _2104 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    bool _2108 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2110 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2112 = _2108 || _2110;
    bool _2114 = isnan(0.5);
    bool _2116 = _2112 || _2114;
    float _2118 = exp2(_2106);
    float _2120 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _2122 = _2100;
    float _2124 = _1977;
    if (!_2116)
    {
        _2120 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _2126 = _2120;
    float _2128 = fma(_2118, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2130 = precise::clamp(_2128, 0.0, 1.0);
    float _2132 = _1899 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2134 = _2126;
    if (!_2116)
    {
        float _2136 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2138 = _2126 + _2136;
        _2134 = _2138;
    }
    float _2140 = _2134;
    float _2142 = fma(_1895, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2072);
    float _2144 = fma(_2130, -2.0, 3.0);
    float _2146 = _2130 * _2130;
    float _2148 = 2.0;
    if (!_2116)
    {
        float _2150 = 1.0 / _2140;
        _2148 = _2150;
    }
    float _2152 = _2148;
    float _2154 = fma(_1967, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2142);
    bool _2156 = _2100 <= 8000.0;
    bool _2158 = isnan(_2100);
    bool _2160 = _2156 || _2158;
    bool _2162 = isnan(8000.0);
    bool _2164 = _2160 || _2162;
    float _2166 = float(_2164);
    float _2168 = _2146 * _2144;
    float _2170 = -_2168;
    float _2172 = _2170 + 1.0;
    float _2174 = exp2(_2132);
    out.gl_Position.x = _2003;
    out.gl_Position.y = _2011;
    out.gl_Position.z = _2154;
    out.gl_Position.w = _1977;
    float _2176 = _2154 + _1977;
    float _2178 = fma(_2172, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2168);
    float _2180 = _2172;
    float _2182 = _2168;
    float _2184 = _1977;
    if (!_2116)
    {
        float _2186 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2188 = _2100 + _2186;
        _2180 = _2188;
    }
    float _2190 = _2180;
    float _2192 = _2190;
    if (_2116)
    {
        _2182 = 1.0;
    }
    float _2194 = _2182;
    float _2196 = _2194;
    if (!_2116)
    {
        float _2198 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2200 = _2100 + _2198;
        _2122 = _2200;
    }
    float _2202 = _2122;
    float _2204 = _2166 * _2178;
    float _2206 = _2202;
    if (!_2116)
    {
        float _2208 = _2190 * _2152;
        float _2210 = precise::clamp(_2208, 0.0, 1.0);
        _2196 = _2210;
    }
    float _2212 = _2196;
    float _2214 = _2176 * 0.5;
    float _2216 = _2204 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2218 = _2214;
    if (!_2116)
    {
        _2192 = (*spvDescriptorSet0.vp_c9)._m0[140].w;
    }
    float _2220 = _2192;
    out.m_78.z = _2214;
    out.m_78.w = _1977;
    float _2222 = -_2174;
    float _2224 = _2222 + 1.0;
    float _2226 = _2220;
    if (!_2116)
    {
        float _2228 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2230 = _2220 + _2228;
        _2226 = _2230;
    }
    float _2232 = _2226;
    if (!_2066)
    {
        _2124 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2234 = _2124;
    float _2236 = _2224 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2238 = _2003;
    float _2240 = _2234;
    float _2242 = _2234;
    if (!_2116)
    {
        float _2244 = 1.0 / _2232;
        _2238 = _2244;
    }
    float _2246 = _2238;
    float _2248 = -_2236;
    float _2250 = _2248 + 1.0;
    float _2252 = _2250;
    if (!_2066)
    {
        _2218 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2254 = _2218;
    float _2256 = _2254;
    float _2258 = _2254;
    if (!_2066)
    {
        _2184 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2260 = _2184;
    float _2262 = _2260;
    float _2264 = _2260;
    if (!_2116)
    {
        float _2266 = _2202 * _2246;
        float _2268 = precise::clamp(_2266, 0.0, 1.0);
        _2206 = _2268;
    }
    float _2270 = _2206;
    float _2272 = -_1989;
    float _2274 = _2272 + 1.0;
    float _2276 = _2274 * _2216;
    float _2278 = precise::clamp(_2276, 0.0, 1.0);
    float _2280 = -_2278;
    float _2282 = fma(_2280, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2284 = _2282 * _2078;
    float _2286 = _2284 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_80.x = _2286;
    float _2288 = _2286;
    float _2290 = _2270;
    if (!_2066)
    {
        _2288 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2292 = _2288;
    float _2294 = _2236 * _2029;
    float _2296 = _2040 * _2294;
    float _2298 = _2050 * _2294;
    float _2300 = _2040 * _2250;
    float _2302 = _2292;
    float _2304 = _2292;
    if (_2116)
    {
        _2252 = 1.0;
    }
    float _2306 = _2252;
    float _2308 = fma(_2046, _2296, _2034);
    float _2310 = fma(_2048, _2296, _2036);
    float _2312 = fma(_2040, _2298, _2038);
    float _2314 = _2306;
    if (!_2116)
    {
        float _2316 = -_2270;
        float _2318 = _2316 + 1.0;
        _2314 = _2318;
    }
    float _2320 = _2314;
    if (!_2066)
    {
        _2290 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2322 = _2290;
    out.m_82.x = _2308;
    out.m_82.y = _2310;
    out.m_82.z = _2312;
    out.m_82.w = _2300;
    float _2324 = _2212 * _2320;
    float _2326 = _2324 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2328 = _2324;
    float _2330 = _2322;
    float _2332 = _2322;
    if (!_2066)
    {
        _2328 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2334 = _2328;
    bool _2336 = !_2066;
    float _2338 = _2334;
    float _2340 = _2334;
    if (!_2336)
    {
        bool _2342 = _1723 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2344 = isnan(_1723);
        bool _2346 = _2342 || _2344;
        bool _2348 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2350 = _2346 || _2348;
        if (!_2350)
        {
            float _2352 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2354 = _1723 + _2352;
            float _2356 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2358 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2356;
            float _2360 = 1.0 / _2358;
            float _2362 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2364 = _2362 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2366 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2368 = _2366 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2370 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2372 = _2370 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2374 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2376 = _2374 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2378 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2380 = _2378 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2382 = _2354 * _2360;
            float _2384 = precise::clamp(_2382, 0.0, 1.0);
            float _2386 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2388 = _2386 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2390 = fma(_2384, _2364, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2392 = fma(_2384, _2388, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2394 = fma(_2384, _2368, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2396 = fma(_2384, _2372, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2398 = fma(_2384, _2376, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2400 = fma(_2384, _2380, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2264 = _2392;
            _2304 = _2398;
            _2258 = _2390;
            _2242 = _2396;
            _2332 = _2394;
            _2340 = _2400;
            _2402 = true;
        }
        else
        {
            bool _2404 = _1723 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2406 = isnan(_1723);
            bool _2408 = _2404 || _2406;
            bool _2410 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2412 = _2408 || _2410;
            if (!_2412)
            {
                _2256 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2414 = _2256;
            _2258 = _2414;
            if (!_2412)
            {
                _2262 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2416 = _2262;
            _2264 = _2416;
            if (!_2412)
            {
                _2330 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2418 = _2330;
            _2332 = _2418;
            if (!_2412)
            {
                _2240 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2420 = _2240;
            _2242 = _2420;
            if (!_2412)
            {
                _2302 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2422 = _2302;
            _2304 = _2422;
            if (!_2412)
            {
                _2338 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2424 = _2338;
            bool _2426 = !_2412;
            _2340 = _2424;
            if (!_2426)
            {
                bool _2428 = _1723 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2430 = isnan(_1723);
                bool _2432 = _2428 || _2430;
                bool _2434 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2436 = _2432 || _2434;
                if (!_2436)
                {
                    float _2438 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2440 = _1723 + _2438;
                    float _2442 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2444 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2442;
                    float _2446 = 1.0 / _2444;
                    float _2448 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2450 = _2448 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2452 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2454 = _2452 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2456 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2458 = _2456 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2460 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2462 = _2460 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2464 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2466 = _2464 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2468 = _2440 * _2446;
                    float _2470 = precise::clamp(_2468, 0.0, 1.0);
                    float _2472 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2474 = _2472 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2476 = fma(_2470, _2450, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2478 = fma(_2470, _2474, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2480 = fma(_2470, _2454, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2482 = fma(_2470, _2458, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2484 = fma(_2470, _2462, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2486 = fma(_2470, _2466, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2264 = _2478;
                    _2304 = _2484;
                    _2258 = _2476;
                    _2242 = _2482;
                    _2332 = _2480;
                    _2340 = _2486;
                    _2402 = true;
                }
                else
                {
                    _2264 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2304 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2258 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2242 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2332 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2340 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2402 = false;
    float _2488 = _2264;
    float _2490 = _2304;
    float _2492 = _2258;
    float _2494 = _2242;
    float _2496 = _2332;
    float _2498 = _2340;
    float _2500 = fma(_1411, -0.5, 0.5);
    float _2502 = precise::clamp(_2500, 0.0, 1.0);
    float _2504 = -_2488;
    float _2506 = _2504 + _2490;
    float _2508 = _2326 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2510 = -_2492;
    float _2512 = _2510 + _2494;
    out.m_84.x = 0.0;
    float _2514 = fma(_2502, _2506, _2488);
    float _2516 = fma(_2502, _2512, _2492);
    out.m_51.x = _2508;
    float _2518 = -_2496;
    float _2520 = _2518 + _2498;
    float _2522 = _2514 * 0.586610972881317138671875;
    bool _2524 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2526 = fma(_2502, _2520, _2496);
    float _2528 = fma(_2516, 0.298911988735198974609375, _2522);
    bool _2530 = _2212 > 0.0;
    bool _2532 = isnan(_2212);
    bool _2534 = _2530 || _2532;
    bool _2536 = isnan(0.0);
    bool _2538 = _2534 || _2536;
    float _2540 = fma(_2526, 0.114477999508380889892578125, _2528);
    bool _2542 = _2320 <= 0.0;
    bool _2544 = !_2538;
    bool _2546 = _2542 || _2544;
    float _2548 = -_2540;
    float _2550 = _2516 + _2548;
    float _2552 = -_2540;
    float _2554 = _2514 + _2552;
    float _2556 = -_2540;
    float _2558 = _2526 + _2556;
    float _2560 = fma(_2550, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2540);
    float _2562 = fma(_2554, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2540);
    float _2564 = fma(_2558, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2540);
    bool _2566 = !_2524;
    if (!_2566)
    {
        float _2568 = -_1697;
        float _2570 = _2568 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2572 = -_1699;
        float _2574 = _2572 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2576 = -_1701;
        float _2578 = _2576 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2580 = _2570 * _2570;
        float _2582 = fma(_2574, _2574, _2580);
        float _2584 = fma(_2578, _2578, _2582);
        float _2586 = sqrt(_2584);
        float _2588 = rsqrt(_2584);
        float _2590 = -_2586;
        float _2592 = _2590 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2594 = _2592 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2596 = precise::clamp(_2594, 0.0, 1.0);
        float _2598 = _2574 * _2588;
        float _2600 = _2570 * _2588;
        float _2602 = abs(_2596);
        float _2604 = log2(_2602);
        float _2606 = _2578 * _2588;
        float _2608 = _2598 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2610 = _1411 * _2600;
        float _2612 = -_2600;
        float _2614 = -_2608;
        float _2616 = fma(_2612, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2614);
        float _2618 = fma(_1399, _2598, _2610);
        float _2620 = -_2606;
        float _2622 = fma(_2620, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2616);
        float _2624 = fma(_1413, _2606, _2618);
        float _2626 = precise::clamp(_2624, 0.0, 1.0);
        float _2628 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2630 = _2622 + _2628;
        float _2632 = _2604 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2634 = _2630 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2636 = precise::clamp(_2634, 0.0, 1.0);
        float _2638 = exp2(_2632);
        float _2640 = _2638 * _2636;
        float _2642 = _2626 * _2640;
        float _2644 = _2642 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2646 = _2642 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2648 = _2642 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_84.x = _2644;
        out.m_84.y = _2646;
        out.m_84.z = _2648;
    }
    out.m_86.x = _2560;
    out.m_86.y = _2562;
    out.m_86.z = _2564;
    if (!_2546)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_51.x = 0.0;
    float _2650 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2650;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2402 = false;
    bool _1463 = false;
    bool _323 = false;
    bool _213 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _100 = in.m_48.w;
    float _102 = trunc(_100);
    int _105 = int(_102);
    bool _109 = _105 >= 1;
    float _111 = 0.0;
    if (!_109)
    {
        _111 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _113 = _111;
    float _115 = _113;
    if (!_109)
    {
        out.m_51.x = 0.0;
    }
    int _117 = 0;
    if (!_109)
    {
        float _119 = _113 * 5.0;
        _117 = as_type<int>(_119);
    }
    int _121 = _117;
    int _123 = _121;
    if (!_109)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2707 = as_type<float>(_121);
        out.gl_Position.z = _2707;
    }
    if (!_109)
    {
        return out;
    }
    float _125 = in.m_53.w;
    bool _127 = _125 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _129 = isnan(_125);
    bool _131 = _127 || _129;
    bool _133 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _135 = _131 || _133;
    float _137 = -_125;
    float _139 = _137 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _141 = 0.0;
    float _143 = _139;
    if (_135)
    {
        float _145 = float(_105);
        _141 = _145;
    }
    float _147 = _141;
    bool _149 = _139 >= _147;
    bool _151 = !_135;
    bool _153 = _149 || _151;
    if (_153)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _155 = _115;
    if (_153)
    {
        out.m_51.x = 0.0;
    }
    if (_153)
    {
        float _157 = _155 * 5.0;
        _123 = as_type<int>(_157);
    }
    int _159 = _123;
    if (_153)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2776 = as_type<float>(_159);
        out.gl_Position.z = _2776;
    }
    if (_153)
    {
        return out;
    }
    float _161 = in.m_55.x;
    float _163 = in.m_55.y;
    float _165 = in.m_55.z;
    bool _167 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _169 = _163 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _171 = _163 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _173 = _163 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _175 = fma(_161, (*spvDescriptorSet0.vp_c10)._m0[4].x, _169);
    float _177 = fma(_161, (*spvDescriptorSet0.vp_c10)._m0[5].x, _171);
    float _179 = fma(_161, (*spvDescriptorSet0.vp_c10)._m0[6].x, _173);
    float _181 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[4].z, _175);
    float _183 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[5].z, _177);
    float _185 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[6].z, _179);
    bool _187 = !_167;
    float _189 = _181;
    float _191 = _183;
    float _193 = _185;
    float _211;
    if (!_187)
    {
        float _195 = in.m_57.x;
        float _197 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _199 = _195 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _201 = fma(_199, (*spvDescriptorSet0.vp_c9)._m0[12].x, _139);
        float _203 = _201 * _197;
        float _205 = floor(_203);
        float _207 = -_205;
        float _209 = _203 + _207;
        _211 = _209;
        _213 = true;
    }
    else
    {
        float _215 = float(_105);
        float _217 = 1.0 / _215;
        float _219 = _139 * _217;
        _211 = _219;
    }
    _213 = false;
    float _221 = _211;
    float _223 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _225 = _221 + _223;
    bool _227 = _221 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _229 = isnan(_221);
    bool _231 = _227 || _229;
    bool _233 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _235 = _231 || _233;
    float _237 = float(_235);
    float _239 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _241 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _239;
    float _243 = -_237;
    float _245 = _243 + 1.0;
    bool _247 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _249 = 1.0 / _241;
    float _251 = _225 * _249;
    bool _253 = _221 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _255 = isnan(_221);
    bool _257 = _253 || _255;
    bool _259 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _261 = _257 || _259;
    float _263 = float(_261);
    float _265 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _267 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _265;
    float _269 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _271 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _269;
    float _273 = _263 * _245;
    float _275 = fma(_267, _251, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _277 = fma(_271, _251, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _279 = -_263;
    float _281 = _279 + 1.0;
    float _283 = _275 * _273;
    float _285 = _277 * _273;
    float _287 = fma(_281, (*spvDescriptorSet0.vp_c9)._m0[143].x, _283);
    float _289 = fma(_281, (*spvDescriptorSet0.vp_c9)._m0[143].y, _285);
    float _291 = fma(_237, (*spvDescriptorSet0.vp_c9)._m0[144].x, _287);
    float _293 = fma(_237, (*spvDescriptorSet0.vp_c9)._m0[144].y, _289);
    bool _295 = !_247;
    float _319;
    float _321;
    if (!_295)
    {
        float _297 = in.m_57.x;
        float _299 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _301 = float(_105);
        float _303 = 1.0 / _301;
        float _305 = _297 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _307 = _139 * _303;
        float _309 = fma(_305, (*spvDescriptorSet0.vp_c9)._m0[11].y, _139);
        float _311 = _309 * _299;
        float _313 = floor(_311);
        float _315 = -_313;
        float _317 = _311 + _315;
        _319 = _307;
        _321 = _317;
        _323 = true;
    }
    else
    {
        float _325 = float(_105);
        float _327 = 1.0 / _325;
        float _329 = _139 * _327;
        _319 = _329;
        _321 = _329;
    }
    _323 = false;
    float _331 = _319;
    float _333 = _321;
    float _335 = in.m_57.x;
    float _337 = in.m_57.y;
    float _339 = in.m_57.z;
    float _341 = in.m_57.w;
    float _343 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _345 = log2(_343);
    float _347 = as_type<float>(int(gl_VertexIndex));
    bool _349 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _351 = isnan(0.0);
    bool _353 = _349 || _351;
    bool _355 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _357 = _353 || _355;
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _361 = 1.0 + _359;
    bool _363 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _365 = isnan(1.0);
    bool _367 = _363 || _365;
    bool _369 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _371 = _367 || _369;
    float _373 = 1.0 / _361;
    float _375 = _345 * _139;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _379 = _377 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _383 = _381 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _387 = _385 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _389 = exp2(_375);
    float _391 = _339 * 2.0;
    float _393 = _335 * 2.0;
    float _395 = _337 * 2.0;
    float _397 = _337 + _339;
    float _399 = _339 + _335;
    float _401 = _335 + (-0.5);
    float _403 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _405 = _403 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _407 = floor(_391);
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _411 = _409 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _413 = _397 + (-1.0);
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _417 = _415 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _419 = floor(_393);
    float _421 = -_389;
    float _423 = _421 + 1.0;
    float _425 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _427 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _425;
    float _429 = _357 ? _423 : 0.0;
    float _431 = floor(_395);
    bool _433 = _407 > 0.0;
    bool _435 = _407 >= 0.0;
    bool _437 = isnan(_407);
    bool _439 = _435 || _437;
    bool _441 = isnan(0.0);
    bool _443 = _439 || _441;
    if (_371)
    {
        float _445 = _429 * _373;
        _143 = _445;
    }
    float _447 = _143;
    float _449 = in.m_62.x;
    float _451 = in.m_62.y;
    int _453 = _443 ? 0 : 1;
    float _455 = 1.0 / _379;
    bool _457 = _419 > 0.0;
    bool _459 = _419 >= 0.0;
    bool _461 = isnan(_419);
    bool _463 = _459 || _461;
    bool _465 = isnan(0.0);
    bool _467 = _463 || _465;
    int _469 = ~_453;
    int _471 = _469 + 1;
    int _473 = _471 + 1;
    int _475 = as_type<int>(_347) & 1;
    bool _477 = _475 != 0;
    int _479 = as_type<int>(_347) & 2;
    bool _481 = _479 != 0;
    float _483 = 1.0 / _383;
    bool _485 = _431 > 0.0;
    int _487 = _467 ? 0 : 1;
    bool _489 = _431 >= 0.0;
    bool _491 = isnan(_431);
    bool _493 = _489 || _491;
    bool _495 = isnan(0.0);
    bool _497 = _493 || _495;
    int _499 = _473;
    if (!_433)
    {
        int _501 = ~_453;
        int _503 = _501 + 1;
        _499 = _503;
    }
    int _505 = _499;
    float _507 = 1.0 / _387;
    int _509 = _497 ? 0 : 1;
    float _511 = _427 * _455;
    float _513 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _515 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _513;
    float _517 = _291 * _449;
    int _519 = ~_509;
    int _521 = _519 + 1;
    int _523 = _521 + 1;
    float _525 = _339 + (-0.5);
    int _527 = _523;
    if (!_485)
    {
        int _529 = ~_509;
        int _531 = _529 + 1;
        _527 = _531;
    }
    int _533 = _527;
    float _535 = 1.0 / _405;
    int _537 = ~_487;
    int _539 = _537 + 1;
    int _541 = _539 + 1;
    float _543 = _293 * _451;
    float _545 = _337 + (-0.5);
    bool _547 = _341 > 0.5;
    float _549 = _515 * _483;
    int _551 = _541;
    if (!_457)
    {
        int _553 = ~_487;
        int _555 = _553 + 1;
        _551 = _555;
    }
    int _557 = _551;
    float _559 = 1.0 / _411;
    bool _561 = !_481;
    float _563 = _561 ? (-0.5) : 0.5;
    float _565 = _543 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _567 = _517 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _569 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _571 = _569 != 0;
    int _573 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _575 = _573 != 0;
    float _577 = 1.0 / _417;
    int _579 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _581 = _579 != 0;
    float _583 = -_563;
    int _585 = _547 ? as_type<int>(_583) : as_type<int>(_563);
    int _587 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _589 = _587 != 0;
    int _591 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _593 = _591 != 0;
    int _595 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _597 = _595 != 0;
    float _599 = in.m_48.x;
    float _601 = in.m_48.y;
    float _603 = in.m_48.z;
    bool _605 = !_477;
    float _607 = _605 ? (-0.5) : 0.5;
    bool _609 = !_589;
    int _611 = _609 ? 0 : 1;
    bool _613 = _339 > 0.5;
    float _615 = _337 + _335;
    bool _617 = _335 > 0.5;
    float _619 = _615 + (-1.0);
    bool _621 = !_593;
    int _623 = _621 ? 0 : 1;
    bool _625 = _337 > 0.5;
    float _627 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _629 = _627 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _631 = !_597;
    int _633 = _631 ? 0 : 1;
    float _635 = float(_533);
    float _637 = 1.0 / _629;
    bool _639 = _331 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _641 = isnan(_331);
    bool _643 = _639 || _641;
    bool _645 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _647 = _643 || _645;
    float _649 = float(_647);
    float _651 = _601 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _653 = _601 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _655 = _601 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _657 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _659 = _657 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    float _661 = fma(_599, (*spvDescriptorSet0.vp_c10)._m0[5].x, _651);
    float _663 = fma(_599, (*spvDescriptorSet0.vp_c10)._m0[4].x, _653);
    float _665 = fma(_599, (*spvDescriptorSet0.vp_c10)._m0[6].x, _655);
    float _667 = 1.0 / _659;
    float _669 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _671 = _669 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _673 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _675 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _673;
    float _677 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _679 = _677 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _681 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _683 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _681;
    float _685 = _671 * _507;
    float _687 = _675 * _535;
    float _689 = _679 * _559;
    float _691 = _683 * _637;
    float _693 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _695 = _693 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _697 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _699 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _697;
    float _701 = _399 + (-1.0);
    float _703 = _695 * _577;
    float _705 = fma(_413, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _707 = _699 * _667;
    float _709 = fma(_619, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _711 = fma(_701, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _713 = fma(_603, (*spvDescriptorSet0.vp_c10)._m0[4].z, _663);
    float _715 = fma(_603, (*spvDescriptorSet0.vp_c10)._m0[5].z, _661);
    float _717 = fma(_603, (*spvDescriptorSet0.vp_c10)._m0[6].z, _665);
    int _719 = abs(_611);
    float _721 = in.m_64.x;
    float _723 = in.m_64.y;
    float _725 = in.m_64.z;
    float _727 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _729 = _333 + _727;
    int _731 = abs(_623);
    float _733 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _735 = _331 + _733;
    float _737 = float(_719);
    float _739 = float(_505);
    float _741 = fma(_511, _729, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    int _743 = abs(_633);
    float _745 = fma(_549, _735, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    float _747 = _737 * _739;
    float _749 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _751 = _331 + _749;
    float _753 = float(_731);
    float _755 = float(_557);
    float _757 = float(_743);
    float _759 = fma(_685, _751, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    float _761 = _747 * (-2.0);
    float _763 = _753 * _755;
    bool _765 = _331 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _767 = isnan(_331);
    bool _769 = _765 || _767;
    bool _771 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _773 = _769 || _771;
    float _775 = float(_773);
    float _777 = -_649;
    float _779 = _777 + 1.0;
    float _781 = fma(_709, _761, _709);
    float _783 = fma(_761, _721, _721);
    float _785 = _757 * _635;
    float _787 = _763 * (-2.0);
    bool _789 = _331 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _791 = isnan(_331);
    bool _793 = _789 || _791;
    bool _795 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _797 = _793 || _795;
    float _799 = float(_797);
    float _801 = _775 * _779;
    float _803 = -_775;
    float _805 = _803 + 1.0;
    float _807 = fma(_401, (*spvDescriptorSet0.vp_c9)._m0[196].x, _783);
    bool _809 = _331 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _811 = isnan(_331);
    bool _813 = _809 || _811;
    bool _815 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _817 = _813 || _815;
    float _819 = float(_817);
    float _821 = fma(_787, _723, _723);
    float _823 = _799 * _805;
    float _825 = fma(_705, _787, _705);
    float _827 = -_799;
    float _829 = _827 + 1.0;
    bool _831 = _331 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _833 = isnan(_331);
    bool _835 = _831 || _833;
    bool _837 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _839 = _835 || _837;
    float _841 = float(_839);
    float _843 = -_819;
    float _845 = _843 + 1.0;
    float _847 = fma(_781, _447, _807);
    float _849 = _785 * (-2.0);
    float _851 = _819 * _829;
    float _853 = _841 * _845;
    float _855 = fma(_545, (*spvDescriptorSet0.vp_c9)._m0[196].y, _821);
    bool _857 = _331 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _859 = isnan(_331);
    bool _861 = _857 || _859;
    bool _863 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _865 = _861 || _863;
    float _867 = float(_865);
    float _869 = fma(_711, _849, _711);
    float _871 = fma(_849, _725, _725);
    float _873 = fma(_825, _447, _855);
    bool _875 = _331 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _877 = isnan(_331);
    bool _879 = _875 || _877;
    bool _881 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _883 = _879 || _881;
    float _885 = float(_883);
    float _887 = -_867;
    float _889 = _887 + 1.0;
    bool _891 = _331 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _893 = isnan(_331);
    bool _895 = _891 || _893;
    bool _897 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _899 = _895 || _897;
    float _901 = float(_899);
    float _903 = fma(_525, (*spvDescriptorSet0.vp_c9)._m0[196].z, _871);
    float _905 = _873 * 0.15915493667125701904296875;
    float _907 = -_885;
    float _909 = _907 + 1.0;
    float _911 = _847 * 0.15915493667125701904296875;
    float _913 = _901 * _889;
    float _915 = fma(_869, _447, _903);
    float _917 = -_841;
    float _919 = _917 + 1.0;
    float _921 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _923 = _331 + _921;
    float _925 = _867 * _909;
    float _927 = _745 * _913;
    float _929 = -_901;
    float _931 = _929 + 1.0;
    float _933 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _935 = _331 + _933;
    float _937 = _915 * 0.15915493667125701904296875;
    float _939 = _885 * _919;
    float _941 = fma(_689, _923, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    float _943 = fma(_931, (*spvDescriptorSet0.vp_c9)._m0[151].x, _927);
    float _945 = _911 * 6.283185482025146484375;
    float _947 = sin(_945);
    float _949 = fma(_687, _935, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _951 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _953 = _331 + _951;
    float _955 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _957 = _331 + _955;
    float _959 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _961 = _331 + _959;
    float _963 = fma(_759, _925, _943);
    float _965 = fma(_691, _953, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    bool _967 = _333 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _969 = isnan(_333);
    bool _971 = _967 || _969;
    bool _973 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _975 = _971 || _973;
    float _977 = float(_975);
    float _979 = _911 * 6.283185482025146484375;
    float _981 = cos(_979);
    float _983 = fma(_949, _939, _963);
    float _985 = fma(_703, _957, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    bool _987 = _333 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _989 = isnan(_333);
    bool _991 = _987 || _989;
    bool _993 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _995 = _991 || _993;
    float _997 = float(_995);
    float _999 = -_977;
    float _1001 = _999 + 1.0;
    float _1003 = fma(_941, _853, _983);
    float _1005 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _563);
    float _1007 = fma(_707, _961, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    float _1009 = _905 * 6.283185482025146484375;
    float _1011 = sin(_1009);
    float _1013 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _607);
    float _1015 = _997 * _1001;
    float _1017 = fma(_965, _851, _1003);
    float _1019 = _565 * _1005;
    float _1021 = _567 * _1013;
    float _1023 = _741 * _1015;
    float _1025 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1027 = _905 * 6.283185482025146484375;
    float _1029 = cos(_1027);
    float _1031 = -_997;
    float _1033 = _1031 + 1.0;
    float _1035 = fma(_985, _823, _1017);
    float _1037 = fma(_1033, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1023);
    float _1039 = _713 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1041 = fma(_1007, _801, _1035);
    float _1043 = _937 * 6.283185482025146484375;
    float _1045 = cos(_1043);
    float _1047 = _947 * _1011;
    float _1049 = _937 * 6.283185482025146484375;
    float _1051 = sin(_1049);
    float _1053 = _981 * _1029;
    float _1055 = _947 * _1029;
    float _1057 = _981 * _1045;
    float _1059 = _947 * _1045;
    float _1061 = _981 * _1011;
    float _1063 = _1029 * _1045;
    float _1065 = _1057 * _1019;
    float _1067 = _1011 * _1045;
    float _1069 = _1059 * _1019;
    float _1071 = _1057 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1073 = fma(_1051, _1053, _1047);
    float _1075 = -_1019;
    float _1077 = _1051 * _1075;
    float _1079 = -_1055;
    float _1081 = fma(_1051, _1061, _1079);
    float _1083 = -_1061;
    float _1085 = fma(_1051, _1055, _1083);
    float _1087 = fma(_1073, _1021, _1065);
    float _1089 = fma(_1063, _1021, _1077);
    float _1091 = fma(_1051, _1047, _1053);
    float _1093 = fma(_1085, _1021, _1069);
    float _1095 = fma(_1081, _1025, _1087);
    float _1097 = fma(_1067, _1025, _1089);
    float _1099 = fma(_977, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1037);
    float _1101 = fma(_1091, _1025, _1093);
    float _1103 = _1095 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1105 = _1095 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1107 = fma(_649, (*spvDescriptorSet0.vp_c9)._m0[158].x, _1041);
    float _1109 = _1057 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1111 = fma(_1097, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1103);
    float _1113 = fma(_1097, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1105);
    float _1115 = -_1051;
    float _1117 = fma(_1115, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1071);
    float _1119 = -_1051;
    float _1121 = fma(_1119, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1109);
    float _1123 = fma(_1101, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1111);
    float _1125 = fma(_1101, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1113);
    float _1127 = _717 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1129 = fma(_1059, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1117);
    float _1131 = _1123 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1133 = _1125 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1135 = _1057 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1137 = _1073 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1139 = _1039 + _1131;
    float _1141 = _1127 + _1133;
    float _1143 = -_1051;
    float _1145 = fma(_1143, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1135);
    float _1147 = fma(_1059, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1121);
    float _1149 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1151 = _1139 + _1149;
    float _1153 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1155 = _1141 + _1153;
    float _1157 = fma(_1059, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1145);
    float _1159 = _1073 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1161 = _1151 * _1151;
    float _1163 = _1155 * _1155;
    float _1165 = _1073 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1167 = fma(_1063, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1159);
    float _1169 = -_563;
    int _1171 = _625 ? as_type<int>(_1169) : as_type<int>(_563);
    float _1173 = _1161 + _1163;
    float _1175 = fma(_1063, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1165);
    bool _1177 = !_581;
    float _1179 = _1177 ? _563 : as_type<float>(_585);
    float _1181 = _1081 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1183 = sqrt(_1173);
    float _1185 = _1081 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1187 = _1081 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1189 = _1095 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1191 = fma(_1063, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1137);
    bool _1193 = !_575;
    float _1195 = _1193 ? _563 : as_type<float>(_1171);
    float _1197 = _563 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1199 = fma(_1097, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1189);
    float _1201 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1203 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1181);
    float _1205 = _1197 * _1147;
    float _1207 = _1197 * _1157;
    float _1209 = _1197 * _1129;
    float _1211 = fma(_1101, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1199);
    float _1213 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1185);
    float _1215 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1187);
    bool _1217 = _1183 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1219 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1221 = _715 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1223 = _1211 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1225 = fma(_1085, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1167);
    float _1227 = fma(_1085, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1191);
    float _1229 = fma(_1085, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1175);
    float _1231 = _1221 + _1223;
    float _1233 = -_607;
    int _1235 = _617 ? as_type<int>(_1233) : as_type<int>(_607);
    float _1237 = -_607;
    int _1239 = _613 ? as_type<int>(_1237) : as_type<int>(_607);
    float _1241 = _1211;
    float _1243 = _1223;
    float _1245 = _1139;
    float _1247 = _1161;
    float _1249 = _1163;
    if (!_1217)
    {
        _1241 = _1139;
    }
    float _1251 = _1241;
    float _1253 = _1251;
    if (!_1217)
    {
        _1243 = _1141;
    }
    float _1255 = _1243;
    float _1257 = _1255;
    if (!_1217)
    {
        _1245 = _1231;
    }
    float _1259 = _1245;
    bool _1261 = !_1217;
    float _1263 = _1259;
    float _1265 = _1219;
    if (!_1261)
    {
        float _1267 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1269 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1271 = _1183 + _1269;
        float _1273 = _1231 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1275 = rsqrt(_1173);
        float _1277 = _1271 * _1267;
        float _1279 = _1277 * 0.15915493667125701904296875;
        float _1281 = _1279 * 6.283185482025146484375;
        float _1283 = sin(_1281);
        float _1285 = _1279 * 6.283185482025146484375;
        float _1287 = cos(_1285);
        float _1289 = fma(_1283, _1273, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1291 = _1275 * _1289;
        float _1293 = fma(_1151, _1291, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1295 = _1287 + (-1.0);
        float _1297 = fma(_1155, _1291, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1299 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1301 = _1293 + _1299;
        float _1303 = _1295 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1305 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1307 = _1297 + _1305;
        float _1309 = _1301 * _1301;
        float _1311 = fma(_1231, _1287, _1303);
        float _1313 = _1307 * _1307;
        _1263 = _1311;
        _1247 = _1309;
        _1249 = _1313;
        _1253 = _1293;
        _1257 = _1297;
    }
    float _1315 = _1263;
    float _1317 = _1247;
    float _1319 = _1249;
    float _1321 = _1253;
    float _1323 = _1257;
    float _1325 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _1327 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1329 = _1327 != 0;
    float _1331 = _607 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _1333 = !_571;
    float _1335 = _1333 ? _607 : as_type<float>(_1235);
    float _1337 = -_1179;
    float _1339 = _1337 + 0.5;
    bool _1341 = !_1329;
    float _1343 = _1341 ? _607 : as_type<float>(_1239);
    float _1345 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1347 = _1315 + _1345;
    float _1349 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1351 = _1335 + 0.5;
    float _1353 = fma(_1347, _1347, _1317);
    float _1355 = _1339 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1357 = -_1195;
    float _1359 = _1357 + 0.5;
    float _1361 = _1353 + _1319;
    float _1363 = _1343 + 0.5;
    float _1365 = _1355 * _1325;
    float _1367 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1203);
    float _1369 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1213);
    float _1371 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1215);
    float _1373 = fma(_1331, _1227, _1205);
    float _1375 = fma(_1331, _1225, _1207);
    float _1377 = sqrt(_1361);
    float _1379 = fma(_1331, _1229, _1209);
    float _1381 = _1351 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1383 = _1359 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1385 = _1363 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1387 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1389 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1391 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1393 = _1381 * _1201;
    float _1395 = _1383 * _1219;
    float _1397 = _1385 * _1349;
    float _1399 = _1367 + _1373;
    float _1401 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1403 = _1387 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1405 = _1389 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1407 = _1391 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1409 = _1099 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1411 = _1369 + _1375;
    float _1413 = _1371 + _1379;
    out.m_66.w = _1401;
    bool _1415 = _1377 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1417 = isnan(_1377);
    bool _1419 = _1415 || _1417;
    bool _1421 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1423 = _1419 || _1421;
    out.m_68.x = _1393;
    out.m_68.y = _1395;
    out.m_68.z = _1397;
    out.m_68.w = _1365;
    out.m_70.x = _1403;
    out.m_70.y = _1405;
    out.m_70.z = _1407;
    out.m_70.w = _1409;
    out.m_72.x = _1107;
    float _1425 = _1365;
    float _1427 = _1401;
    if (!_1423)
    {
        _1265 = 1.0;
    }
    float _1429 = _1265;
    out.m_74.x = _1399;
    out.m_74.y = _1411;
    out.m_74.z = _1413;
    bool _1431 = !_1423;
    float _1433 = _1429;
    if (!_1431)
    {
        bool _1435 = _1377 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1437 = isnan(_1377);
        bool _1439 = _1435 || _1437;
        bool _1441 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1443 = _1439 || _1441;
        if (!_1443)
        {
            float _1445 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1447 = _1377 + _1445;
            float _1449 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1451 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1449;
            float _1453 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1455 = _1453 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1457 = 1.0 / _1451;
            float _1459 = _1447 * _1457;
            float _1461 = fma(_1459, _1455, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1433 = _1461;
            _1425 = _1455;
            _1463 = true;
        }
        else
        {
            bool _1465 = _1377 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1467 = isnan(_1377);
            bool _1469 = _1465 || _1467;
            bool _1471 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1473 = _1469 || _1471;
            if (!_1473)
            {
                float _1475 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1477 = _1377 + _1475;
                float _1479 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1481 = _1479 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1483 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1485 = _1483 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1487 = 1.0 / _1481;
                float _1489 = _1477 * _1487;
                float _1491 = fma(_1489, _1485, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1433 = _1491;
                _1425 = _1485;
                _1463 = true;
            }
            else
            {
                _1433 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1463 = false;
    float _1493 = _1433;
    float _1495 = _1425;
    float _1497 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1499 = _1315 + _1497;
    float _1501 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1503 = _1321 + _1501;
    float _1505 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1507 = _1323 + _1505;
    float _1509 = fma(_1499, _1493, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1511 = fma(_1503, _1493, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1513 = fma(_1507, _1493, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1515 = -_1221;
    float _1517 = _1515 + _1509;
    float _1519 = -_1039;
    float _1521 = _1519 + _1511;
    float _1523 = -_1127;
    float _1525 = _1523 + _1513;
    float _1527 = _1517 * _1517;
    float _1529 = fma(_1521, _1521, _1527);
    float _1531 = fma(_1525, _1525, _1529);
    float _1533 = sqrt(_1531);
    bool _1535 = _1533 > 0.0;
    bool _1537 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1539 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1541 = _1537 || _1539;
    bool _1543 = isnan(0.5);
    bool _1545 = _1541 || _1543;
    float _1547 = _1495;
    float _1549 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _1551 = _1507;
    float _1553 = _1511;
    float _1555 = _1517;
    if (!_1535)
    {
        _1547 = _1511;
    }
    float _1557 = _1547;
    float _1559 = _1557;
    float _1561 = _1557;
    if (!_1535)
    {
        _1549 = _1509;
    }
    float _1563 = _1549;
    float _1565 = _1563;
    if (!_1535)
    {
        _1551 = _1513;
    }
    float _1567 = _1551;
    bool _1569 = !_1535;
    float _1571 = _1567;
    if (!_1569)
    {
        float _1573 = _183 * _183;
        float _1575 = fma(_181, _181, _1573);
        float _1577 = rsqrt(_1531);
        float _1579 = fma(_185, _185, _1575);
        float _1581 = sqrt(_1579);
        float _1583 = _1521 * _1577;
        float _1585 = _1517 * _1577;
        float _1587 = _1525 * _1577;
        bool _1589 = _1581 > 0.0;
        float _1591 = _1577;
        float _1593 = _1581;
        if (!_1589)
        {
            _1559 = _1511;
        }
        float _1595 = _1559;
        _1561 = _1595;
        if (!_1589)
        {
            _1591 = _1509;
        }
        float _1597 = _1591;
        _1565 = _1597;
        if (!_1589)
        {
            _1593 = _1513;
        }
        float _1599 = _1593;
        bool _1601 = !_1589;
        _1571 = _1599;
        if (!_1601)
        {
            float _1603 = rsqrt(_1579);
            float _1605 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1607 = _183 * _1603;
            float _1609 = _181 * _1603;
            float _1611 = _1585 * _1607;
            float _1613 = _185 * _1603;
            float _1615 = fma(_1583, _1609, _1611);
            float _1617 = _1605 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1619 = fma(_1587, _1613, _1615);
            float _1621 = _1619 * _1617;
            float _1623 = fma(_181, _1621, _1511);
            float _1625 = fma(_183, _1621, _1509);
            float _1627 = fma(_185, _1621, _1513);
            _1561 = _1623;
            _1565 = _1625;
            _1571 = _1627;
        }
    }
    float _1629 = _1561;
    float _1631 = _1565;
    float _1633 = _1571;
    if (_1545)
    {
        _189 = _1629;
    }
    float _1635 = _189;
    float _1637 = _1635;
    if (_1545)
    {
        _191 = _1631;
    }
    float _1639 = _191;
    float _1641 = _1639;
    if (_1545)
    {
        _193 = _1633;
    }
    float _1643 = _193;
    float _1645 = _1643;
    if (!_1545)
    {
        float _1647 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1649 = _1221 + _1647;
        float _1651 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1653 = _1039 + _1651;
        float _1655 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1657 = -_1221;
        float _1659 = _1657 + _1631;
        float _1661 = _1649 * _1649;
        float _1663 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1665 = _1127 + _1663;
        float _1667 = -_1127;
        float _1669 = _1667 + _1633;
        float _1671 = fma(_1653, _1653, _1661);
        float _1673 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1675 = fma(_1665, _1665, _1671);
        float _1677 = sqrt(_1675);
        float _1679 = _1655 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1681 = precise::min(_1677, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1683 = _1681 * _1673;
        float _1685 = -_1039;
        float _1687 = _1685 + _1629;
        float _1689 = _1679 * _1683;
        float _1691 = fma(_1687, _1689, _1039);
        float _1693 = fma(_1659, _1689, _1221);
        float _1695 = fma(_1669, _1689, _1127);
        _1641 = _1693;
        _1637 = _1691;
        _1645 = _1695;
    }
    float _1697 = _1641;
    float _1699 = _1637;
    float _1701 = _1645;
    float _1703 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1705 = _1697 + _1703;
    float _1707 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1709 = _1699 + _1707;
    float _1711 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1713 = _1701 + _1711;
    float _1715 = _1705 * _1705;
    float _1717 = fma(_1709, _1709, _1715);
    float _1719 = fma(_1713, _1713, _1717);
    float _1721 = rsqrt(_1719);
    float _1723 = sqrt(_1719);
    float _1725 = _1721 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1727 = _1709 * _1725;
    float _1729 = _1713 * _1725;
    float _1731 = _1727 * _1727;
    float _1733 = _1729 * _1729;
    float _1735 = _1731 + _1733;
    float _1737 = sqrt(_1735);
    bool _1739 = _1737 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1741 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1743 = _1737 + _1741;
    float _1745 = _1721;
    float _1747 = _1743;
    float _1749 = _1705;
    if (_1739)
    {
        float _1751 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1745 = _1751;
    }
    float _1753 = _1745;
    if (_1739)
    {
        float _1755 = rsqrt(_1735);
        _1553 = _1755;
    }
    float _1757 = _1553;
    float _1759 = _1757;
    if (_1739)
    {
        float _1761 = _1743 * _1753;
        _1747 = _1761;
    }
    float _1763 = _1747;
    float _1765 = _1697 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (_1739)
    {
        float _1767 = _1763 * 0.15915493667125701904296875;
        _1555 = _1767;
    }
    float _1769 = _1555;
    float _1771 = _1753;
    if (_1739)
    {
        float _1773 = _1769 * 6.283185482025146484375;
        float _1775 = sin(_1773);
        _1771 = _1775;
    }
    float _1777 = _1771;
    float _1779 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1781 = precise::max(0.0, _1779);
    float _1783 = _1713;
    float _1785 = _1781;
    if (_1739)
    {
        float _1787 = _1769 * 6.283185482025146484375;
        float _1789 = cos(_1787);
        _1783 = _1789;
    }
    float _1791 = _1783;
    float _1793 = -_1725;
    float _1795 = -_1781;
    float _1797 = fma(_1705, _1793, _1795);
    float _1799 = _1797;
    if (_1739)
    {
        float _1801 = _1797 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1785 = _1801;
    }
    float _1803 = _1785;
    float _1805 = _1777;
    float _1807 = _1803;
    if (_1739)
    {
        float _1809 = fma(_1777, _1803, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1805 = _1809;
    }
    float _1811 = _1805;
    float _1813 = _1811;
    if (!_1739)
    {
        _1807 = _1731;
    }
    float _1815 = _1807;
    float _1817 = _1697 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1819 = _1815;
    float _1821 = _1791;
    if (_1739)
    {
        float _1823 = _1791 + (-1.0);
        _1749 = _1823;
    }
    float _1825 = _1749;
    float _1827 = _1825;
    if (_1739)
    {
        float _1829 = _1757 * _1811;
        _1427 = _1829;
    }
    float _1831 = _1427;
    if (!_1739)
    {
        _1759 = _1727;
    }
    float _1833 = _1759;
    float _1835 = _1833;
    if (_1739)
    {
        float _1837 = _1825 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1827 = _1837;
    }
    float _1839 = _1827;
    if (_1739)
    {
        float _1841 = _1727 * _1831;
        _1835 = _1841;
    }
    float _1843 = _1835;
    if (!_1739)
    {
        _1813 = _1729;
    }
    float _1845 = _1813;
    float _1847 = _1845;
    if (_1739)
    {
        float _1849 = _1729 * _1831;
        _1847 = _1849;
    }
    float _1851 = _1847;
    if (_1739)
    {
        float _1853 = fma(_1797, _1791, _1839);
        _1799 = _1853;
    }
    float _1855 = _1799;
    if (_1739)
    {
        float _1857 = _1843 * _1843;
        _1819 = _1857;
    }
    float _1859 = _1819;
    if (!_1739)
    {
        _1821 = _1733;
    }
    float _1861 = _1821;
    float _1863 = _1861;
    if (_1739)
    {
        float _1865 = _1851 * _1851;
        _1863 = _1865;
    }
    float _1867 = _1863;
    float _1869 = fma(_1855, _1855, _1859);
    float _1871 = _1697 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1873 = _1869 + _1867;
    float _1875 = fma(_1699, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1871);
    float _1877 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1879 = fma(_1723, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1877);
    float _1881 = precise::clamp(_1879, 0.0, 1.0);
    float _1883 = rsqrt(_1873);
    float _1885 = fma(_1701, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1875);
    float _1887 = -_1881;
    float _1889 = _1887 + 1.0;
    float _1891 = fma(_1039, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1893 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1895 = _1885 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1897 = abs(_1889);
    float _1899 = log2(_1897);
    float _1901 = _1895 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1903 = fma(_1699, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1765);
    float _1905 = fma(_1127, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1907 = -_1901;
    float _1909 = fma(_1907, _1893, 1.0);
    float _1911 = _1697 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1913 = fma(_1699, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1817);
    float _1915 = _1883 * _1843;
    float _1917 = _1883 * _1855;
    float _1919 = _1883 * _1851;
    float _1921 = fma(_1699, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1911);
    float _1923 = fma(_1701, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1913);
    float _1925 = _1915 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1927 = floor(_1891);
    float _1929 = fma(_1701, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1921);
    float _1931 = _1923 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1933 = -_1925;
    float _1935 = fma(_1917, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1933);
    float _1937 = fma(_1701, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1903);
    float _1939 = _1929 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1941 = _1931 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1943 = _1899 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1945 = floor(_1905);
    float _1947 = -_1919;
    float _1949 = fma(_1947, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1935);
    float _1951 = fma(_1939, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1941);
    float _1953 = fma(_1949, -0.5, 0.5);
    float _1955 = fma(_1895, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1951);
    float _1957 = log2(_1909);
    float _1959 = -_1927;
    float _1961 = _1891 + _1959;
    float _1963 = fma(_1949, 0.5, 0.5);
    float _1965 = exp2(_1943);
    float _1967 = _1937 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1969 = -_1945;
    float _1971 = _1905 + _1969;
    float _1973 = fma(_1963, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1975 = _1917 + 1.0;
    float _1977 = fma(_1967, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1955);
    float _1979 = _1931 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1981 = fma(_1963, _1973, -0.212114393711090087890625);
    float _1983 = sqrt(_1953);
    float _1985 = _1931 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1987 = fma(_1939, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1979);
    float2 _5709 = float2(_1961, _1971);
    float _1989 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5709, float2(0.0), isnan(_5709)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5709, float2(0.0), isnan(_5709)), level(0.0)).x;
    float _1991 = _1957 * 0.693147182464599609375;
    float _1993 = fma(_1939, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1985);
    float _1995 = fma(_1895, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1987);
    float _1997 = fma(_1963, _1981, 1.570728778839111328125);
    float _1999 = 1.0 / _1977;
    float _2001 = fma(_1895, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1993);
    float _2003 = fma(_1967, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1995);
    float _2005 = -_1917;
    float _2007 = fma(_1965, _1975, _2005);
    float _2009 = _1991 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2011 = fma(_1967, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2001);
    float _2013 = fma(_2007, 0.5, 0.5);
    float _2015 = _1983 * 0.636619746685028076171875;
    float _2017 = _2003 * _1999;
    float _2019 = _2011 * _1999;
    float _2021 = -_1997;
    float _2023 = fma(_2015, _2021, 1.0);
    float _2025 = fma(_2017, 0.5, 0.5);
    float _2027 = fma(_2019, -0.5, 0.5);
    float3 _5784 = float3(_2025, _2027, _2009);
    float _2029 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5784, float3(0.0), isnan(_5784)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5784, float3(0.0), isnan(_5784)), level(0.0)).x;
    float3 _5795 = float3(_2025, _2027, _2009);
    float4 _2032 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5795, float3(0.0), isnan(_5795)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5795, float3(0.0), isnan(_5795)), level(0.0)).xyzw;
    float _2034 = _2032.x;
    float _2036 = _2032.y;
    float _2038 = _2032.z;
    float _2040 = _2032.w;
    float2 _5811 = float2(_2023, _2013);
    float3 _2044 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5811, float2(0.0), isnan(_5811)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5811, float2(0.0), isnan(_5811)), level(0.0)).xyz;
    float _2046 = _2044.x;
    float _2048 = _2044.y;
    float _2050 = _2044.z;
    float _2052 = _1221 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2054 = _1221 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2056 = _1931 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2058 = _1723 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2060 = isnan(_1723);
    bool _2062 = _2058 || _2060;
    bool _2064 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2066 = _2062 || _2064;
    float _2068 = fma(_1039, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2052);
    float _2070 = fma(_1039, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2054);
    float _2072 = fma(_1939, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2056);
    float _2074 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2068);
    float _2076 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2070);
    float _2078 = in.m_76.x;
    float _2080 = _2074 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2082 = _2076 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2084 = 1.0 / _2080;
    float _2086 = _2082 + _2080;
    float _2088 = _2086 * _2084;
    float _2090 = _2088 * 0.5;
    float _2092 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2094 = fma(_2090, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2092);
    float _2096 = 1.0 / _2094;
    float _2098 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2100 = _2096 * _2098;
    float _2102 = abs(_2100);
    float _2104 = log2(_2102);
    float _2106 = _2104 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    bool _2108 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2110 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2112 = _2108 || _2110;
    bool _2114 = isnan(0.5);
    bool _2116 = _2112 || _2114;
    float _2118 = exp2(_2106);
    float _2120 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _2122 = _2100;
    float _2124 = _1977;
    if (!_2116)
    {
        _2120 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _2126 = _2120;
    float _2128 = fma(_2118, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2130 = precise::clamp(_2128, 0.0, 1.0);
    float _2132 = _1899 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2134 = _2126;
    if (!_2116)
    {
        float _2136 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2138 = _2126 + _2136;
        _2134 = _2138;
    }
    float _2140 = _2134;
    float _2142 = fma(_1895, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2072);
    float _2144 = fma(_2130, -2.0, 3.0);
    float _2146 = _2130 * _2130;
    float _2148 = 2.0;
    if (!_2116)
    {
        float _2150 = 1.0 / _2140;
        _2148 = _2150;
    }
    float _2152 = _2148;
    float _2154 = fma(_1967, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2142);
    bool _2156 = _2100 <= 8000.0;
    bool _2158 = isnan(_2100);
    bool _2160 = _2156 || _2158;
    bool _2162 = isnan(8000.0);
    bool _2164 = _2160 || _2162;
    float _2166 = float(_2164);
    float _2168 = _2146 * _2144;
    float _2170 = -_2168;
    float _2172 = _2170 + 1.0;
    float _2174 = exp2(_2132);
    out.gl_Position.x = _2003;
    out.gl_Position.y = _2011;
    out.gl_Position.z = _2154;
    out.gl_Position.w = _1977;
    float _2176 = _2154 + _1977;
    float _2178 = fma(_2172, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2168);
    float _2180 = _2172;
    float _2182 = _2168;
    float _2184 = _1977;
    if (!_2116)
    {
        float _2186 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2188 = _2100 + _2186;
        _2180 = _2188;
    }
    float _2190 = _2180;
    float _2192 = _2190;
    if (_2116)
    {
        _2182 = 1.0;
    }
    float _2194 = _2182;
    float _2196 = _2194;
    if (!_2116)
    {
        float _2198 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2200 = _2100 + _2198;
        _2122 = _2200;
    }
    float _2202 = _2122;
    float _2204 = _2166 * _2178;
    float _2206 = _2202;
    if (!_2116)
    {
        float _2208 = _2190 * _2152;
        float _2210 = precise::clamp(_2208, 0.0, 1.0);
        _2196 = _2210;
    }
    float _2212 = _2196;
    float _2214 = _2176 * 0.5;
    float _2216 = _2204 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2218 = _2214;
    if (!_2116)
    {
        _2192 = (*spvDescriptorSet0.vp_c9)._m0[140].w;
    }
    float _2220 = _2192;
    out.m_78.z = _2214;
    out.m_78.w = _1977;
    float _2222 = -_2174;
    float _2224 = _2222 + 1.0;
    float _2226 = _2220;
    if (!_2116)
    {
        float _2228 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2230 = _2220 + _2228;
        _2226 = _2230;
    }
    float _2232 = _2226;
    if (!_2066)
    {
        _2124 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2234 = _2124;
    float _2236 = _2224 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2238 = _2003;
    float _2240 = _2234;
    float _2242 = _2234;
    if (!_2116)
    {
        float _2244 = 1.0 / _2232;
        _2238 = _2244;
    }
    float _2246 = _2238;
    float _2248 = -_2236;
    float _2250 = _2248 + 1.0;
    float _2252 = _2250;
    if (!_2066)
    {
        _2218 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2254 = _2218;
    float _2256 = _2254;
    float _2258 = _2254;
    if (!_2066)
    {
        _2184 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2260 = _2184;
    float _2262 = _2260;
    float _2264 = _2260;
    if (!_2116)
    {
        float _2266 = _2202 * _2246;
        float _2268 = precise::clamp(_2266, 0.0, 1.0);
        _2206 = _2268;
    }
    float _2270 = _2206;
    float _2272 = -_1989;
    float _2274 = _2272 + 1.0;
    float _2276 = _2274 * _2216;
    float _2278 = precise::clamp(_2276, 0.0, 1.0);
    float _2280 = -_2278;
    float _2282 = fma(_2280, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2284 = _2282 * _2078;
    float _2286 = _2284 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_80.x = _2286;
    float _2288 = _2286;
    float _2290 = _2270;
    if (!_2066)
    {
        _2288 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2292 = _2288;
    float _2294 = _2236 * _2029;
    float _2296 = _2040 * _2294;
    float _2298 = _2050 * _2294;
    float _2300 = _2040 * _2250;
    float _2302 = _2292;
    float _2304 = _2292;
    if (_2116)
    {
        _2252 = 1.0;
    }
    float _2306 = _2252;
    float _2308 = fma(_2046, _2296, _2034);
    float _2310 = fma(_2048, _2296, _2036);
    float _2312 = fma(_2040, _2298, _2038);
    float _2314 = _2306;
    if (!_2116)
    {
        float _2316 = -_2270;
        float _2318 = _2316 + 1.0;
        _2314 = _2318;
    }
    float _2320 = _2314;
    if (!_2066)
    {
        _2290 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2322 = _2290;
    out.m_82.x = _2308;
    out.m_82.y = _2310;
    out.m_82.z = _2312;
    out.m_82.w = _2300;
    float _2324 = _2212 * _2320;
    float _2326 = _2324 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2328 = _2324;
    float _2330 = _2322;
    float _2332 = _2322;
    if (!_2066)
    {
        _2328 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2334 = _2328;
    bool _2336 = !_2066;
    float _2338 = _2334;
    float _2340 = _2334;
    if (!_2336)
    {
        bool _2342 = _1723 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2344 = isnan(_1723);
        bool _2346 = _2342 || _2344;
        bool _2348 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2350 = _2346 || _2348;
        if (!_2350)
        {
            float _2352 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2354 = _1723 + _2352;
            float _2356 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2358 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2356;
            float _2360 = 1.0 / _2358;
            float _2362 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2364 = _2362 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2366 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2368 = _2366 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2370 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2372 = _2370 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2374 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2376 = _2374 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2378 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2380 = _2378 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2382 = _2354 * _2360;
            float _2384 = precise::clamp(_2382, 0.0, 1.0);
            float _2386 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2388 = _2386 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2390 = fma(_2384, _2364, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2392 = fma(_2384, _2388, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2394 = fma(_2384, _2368, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2396 = fma(_2384, _2372, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2398 = fma(_2384, _2376, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2400 = fma(_2384, _2380, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2264 = _2392;
            _2304 = _2398;
            _2258 = _2390;
            _2242 = _2396;
            _2332 = _2394;
            _2340 = _2400;
            _2402 = true;
        }
        else
        {
            bool _2404 = _1723 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2406 = isnan(_1723);
            bool _2408 = _2404 || _2406;
            bool _2410 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2412 = _2408 || _2410;
            if (!_2412)
            {
                _2256 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2414 = _2256;
            _2258 = _2414;
            if (!_2412)
            {
                _2262 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2416 = _2262;
            _2264 = _2416;
            if (!_2412)
            {
                _2330 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2418 = _2330;
            _2332 = _2418;
            if (!_2412)
            {
                _2240 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2420 = _2240;
            _2242 = _2420;
            if (!_2412)
            {
                _2302 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2422 = _2302;
            _2304 = _2422;
            if (!_2412)
            {
                _2338 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2424 = _2338;
            bool _2426 = !_2412;
            _2340 = _2424;
            if (!_2426)
            {
                bool _2428 = _1723 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2430 = isnan(_1723);
                bool _2432 = _2428 || _2430;
                bool _2434 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2436 = _2432 || _2434;
                if (!_2436)
                {
                    float _2438 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2440 = _1723 + _2438;
                    float _2442 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2444 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2442;
                    float _2446 = 1.0 / _2444;
                    float _2448 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2450 = _2448 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2452 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2454 = _2452 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2456 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2458 = _2456 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2460 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2462 = _2460 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2464 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2466 = _2464 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2468 = _2440 * _2446;
                    float _2470 = precise::clamp(_2468, 0.0, 1.0);
                    float _2472 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2474 = _2472 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2476 = fma(_2470, _2450, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2478 = fma(_2470, _2474, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2480 = fma(_2470, _2454, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2482 = fma(_2470, _2458, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2484 = fma(_2470, _2462, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2486 = fma(_2470, _2466, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2264 = _2478;
                    _2304 = _2484;
                    _2258 = _2476;
                    _2242 = _2482;
                    _2332 = _2480;
                    _2340 = _2486;
                    _2402 = true;
                }
                else
                {
                    _2264 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2304 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2258 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2242 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2332 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2340 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2402 = false;
    float _2488 = _2264;
    float _2490 = _2304;
    float _2492 = _2258;
    float _2494 = _2242;
    float _2496 = _2332;
    float _2498 = _2340;
    float _2500 = fma(_1411, -0.5, 0.5);
    float _2502 = precise::clamp(_2500, 0.0, 1.0);
    float _2504 = -_2488;
    float _2506 = _2504 + _2490;
    float _2508 = _2326 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2510 = -_2492;
    float _2512 = _2510 + _2494;
    out.m_84.x = 0.0;
    float _2514 = fma(_2502, _2506, _2488);
    float _2516 = fma(_2502, _2512, _2492);
    out.m_51.x = _2508;
    float _2518 = -_2496;
    float _2520 = _2518 + _2498;
    float _2522 = _2514 * 0.586610972881317138671875;
    bool _2524 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2526 = fma(_2502, _2520, _2496);
    float _2528 = fma(_2516, 0.298911988735198974609375, _2522);
    bool _2530 = _2212 > 0.0;
    bool _2532 = isnan(_2212);
    bool _2534 = _2530 || _2532;
    bool _2536 = isnan(0.0);
    bool _2538 = _2534 || _2536;
    float _2540 = fma(_2526, 0.114477999508380889892578125, _2528);
    bool _2542 = _2320 <= 0.0;
    bool _2544 = !_2538;
    bool _2546 = _2542 || _2544;
    float _2548 = -_2540;
    float _2550 = _2516 + _2548;
    float _2552 = -_2540;
    float _2554 = _2514 + _2552;
    float _2556 = -_2540;
    float _2558 = _2526 + _2556;
    float _2560 = fma(_2550, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2540);
    float _2562 = fma(_2554, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2540);
    float _2564 = fma(_2558, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2540);
    bool _2566 = !_2524;
    if (!_2566)
    {
        float _2568 = -_1697;
        float _2570 = _2568 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2572 = -_1699;
        float _2574 = _2572 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2576 = -_1701;
        float _2578 = _2576 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2580 = _2570 * _2570;
        float _2582 = fma(_2574, _2574, _2580);
        float _2584 = fma(_2578, _2578, _2582);
        float _2586 = sqrt(_2584);
        float _2588 = rsqrt(_2584);
        float _2590 = -_2586;
        float _2592 = _2590 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2594 = _2592 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2596 = precise::clamp(_2594, 0.0, 1.0);
        float _2598 = _2574 * _2588;
        float _2600 = _2570 * _2588;
        float _2602 = abs(_2596);
        float _2604 = log2(_2602);
        float _2606 = _2578 * _2588;
        float _2608 = _2598 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2610 = _1411 * _2600;
        float _2612 = -_2600;
        float _2614 = -_2608;
        float _2616 = fma(_2612, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2614);
        float _2618 = fma(_1399, _2598, _2610);
        float _2620 = -_2606;
        float _2622 = fma(_2620, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2616);
        float _2624 = fma(_1413, _2606, _2618);
        float _2626 = precise::clamp(_2624, 0.0, 1.0);
        float _2628 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2630 = _2622 + _2628;
        float _2632 = _2604 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2634 = _2630 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2636 = precise::clamp(_2634, 0.0, 1.0);
        float _2638 = exp2(_2632);
        float _2640 = _2638 * _2636;
        float _2642 = _2626 * _2640;
        float _2644 = _2642 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2646 = _2642 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2648 = _2642 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_84.x = _2644;
        out.m_84.y = _2646;
        out.m_84.z = _2648;
    }
    out.m_86.x = _2560;
    out.m_86.y = _2562;
    out.m_86.z = _2564;
    if (!_2546)
    {
        return out;
    }
    out.m_51.x = 0.0;
    float _2650 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2650;
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
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2402 = false;
    bool _1463 = false;
    bool _323 = false;
    bool _213 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _100 = in.m_48.w;
    float _102 = trunc(_100);
    int _105 = int(_102);
    bool _109 = _105 >= 1;
    float _111 = 0.0;
    if (!_109)
    {
        _111 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _113 = _111;
    float _115 = _113;
    if (!_109)
    {
        out.m_51.x = 0.0;
    }
    int _117 = 0;
    if (!_109)
    {
        float _119 = _113 * 5.0;
        _117 = as_type<int>(_119);
    }
    int _121 = _117;
    int _123 = _121;
    if (!_109)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2707 = as_type<float>(_121);
        out.gl_Position.z = _2707;
    }
    if (!_109)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _125 = in.m_53.w;
    bool _127 = _125 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _129 = isnan(_125);
    bool _131 = _127 || _129;
    bool _133 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _135 = _131 || _133;
    float _137 = -_125;
    float _139 = _137 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _141 = 0.0;
    float _143 = _139;
    if (_135)
    {
        float _145 = float(_105);
        _141 = _145;
    }
    float _147 = _141;
    bool _149 = _139 >= _147;
    bool _151 = !_135;
    bool _153 = _149 || _151;
    if (_153)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _155 = _115;
    if (_153)
    {
        out.m_51.x = 0.0;
    }
    if (_153)
    {
        float _157 = _155 * 5.0;
        _123 = as_type<int>(_157);
    }
    int _159 = _123;
    if (_153)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2776 = as_type<float>(_159);
        out.gl_Position.z = _2776;
    }
    if (_153)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _161 = in.m_55.x;
    float _163 = in.m_55.y;
    float _165 = in.m_55.z;
    bool _167 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _169 = _163 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _171 = _163 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _173 = _163 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _175 = fma(_161, (*spvDescriptorSet0.vp_c10)._m0[4].x, _169);
    float _177 = fma(_161, (*spvDescriptorSet0.vp_c10)._m0[5].x, _171);
    float _179 = fma(_161, (*spvDescriptorSet0.vp_c10)._m0[6].x, _173);
    float _181 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[4].z, _175);
    float _183 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[5].z, _177);
    float _185 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[6].z, _179);
    bool _187 = !_167;
    float _189 = _181;
    float _191 = _183;
    float _193 = _185;
    float _211;
    if (!_187)
    {
        float _195 = in.m_57.x;
        float _197 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _199 = _195 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _201 = fma(_199, (*spvDescriptorSet0.vp_c9)._m0[12].x, _139);
        float _203 = _201 * _197;
        float _205 = floor(_203);
        float _207 = -_205;
        float _209 = _203 + _207;
        _211 = _209;
        _213 = true;
    }
    else
    {
        float _215 = float(_105);
        float _217 = 1.0 / _215;
        float _219 = _139 * _217;
        _211 = _219;
    }
    _213 = false;
    float _221 = _211;
    float _223 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _225 = _221 + _223;
    bool _227 = _221 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _229 = isnan(_221);
    bool _231 = _227 || _229;
    bool _233 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _235 = _231 || _233;
    float _237 = float(_235);
    float _239 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _241 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _239;
    float _243 = -_237;
    float _245 = _243 + 1.0;
    bool _247 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _249 = 1.0 / _241;
    float _251 = _225 * _249;
    bool _253 = _221 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _255 = isnan(_221);
    bool _257 = _253 || _255;
    bool _259 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _261 = _257 || _259;
    float _263 = float(_261);
    float _265 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _267 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _265;
    float _269 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _271 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _269;
    float _273 = _263 * _245;
    float _275 = fma(_267, _251, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _277 = fma(_271, _251, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _279 = -_263;
    float _281 = _279 + 1.0;
    float _283 = _275 * _273;
    float _285 = _277 * _273;
    float _287 = fma(_281, (*spvDescriptorSet0.vp_c9)._m0[143].x, _283);
    float _289 = fma(_281, (*spvDescriptorSet0.vp_c9)._m0[143].y, _285);
    float _291 = fma(_237, (*spvDescriptorSet0.vp_c9)._m0[144].x, _287);
    float _293 = fma(_237, (*spvDescriptorSet0.vp_c9)._m0[144].y, _289);
    bool _295 = !_247;
    float _319;
    float _321;
    if (!_295)
    {
        float _297 = in.m_57.x;
        float _299 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _301 = float(_105);
        float _303 = 1.0 / _301;
        float _305 = _297 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _307 = _139 * _303;
        float _309 = fma(_305, (*spvDescriptorSet0.vp_c9)._m0[11].y, _139);
        float _311 = _309 * _299;
        float _313 = floor(_311);
        float _315 = -_313;
        float _317 = _311 + _315;
        _319 = _307;
        _321 = _317;
        _323 = true;
    }
    else
    {
        float _325 = float(_105);
        float _327 = 1.0 / _325;
        float _329 = _139 * _327;
        _319 = _329;
        _321 = _329;
    }
    _323 = false;
    float _331 = _319;
    float _333 = _321;
    float _335 = in.m_57.x;
    float _337 = in.m_57.y;
    float _339 = in.m_57.z;
    float _341 = in.m_57.w;
    float _343 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _345 = log2(_343);
    float _347 = as_type<float>(int(gl_VertexIndex));
    bool _349 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _351 = isnan(0.0);
    bool _353 = _349 || _351;
    bool _355 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _357 = _353 || _355;
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _361 = 1.0 + _359;
    bool _363 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _365 = isnan(1.0);
    bool _367 = _363 || _365;
    bool _369 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _371 = _367 || _369;
    float _373 = 1.0 / _361;
    float _375 = _345 * _139;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _379 = _377 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _383 = _381 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _387 = _385 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _389 = exp2(_375);
    float _391 = _339 * 2.0;
    float _393 = _335 * 2.0;
    float _395 = _337 * 2.0;
    float _397 = _337 + _339;
    float _399 = _339 + _335;
    float _401 = _335 + (-0.5);
    float _403 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _405 = _403 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _407 = floor(_391);
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _411 = _409 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _413 = _397 + (-1.0);
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _417 = _415 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _419 = floor(_393);
    float _421 = -_389;
    float _423 = _421 + 1.0;
    float _425 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _427 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _425;
    float _429 = _357 ? _423 : 0.0;
    float _431 = floor(_395);
    bool _433 = _407 > 0.0;
    bool _435 = _407 >= 0.0;
    bool _437 = isnan(_407);
    bool _439 = _435 || _437;
    bool _441 = isnan(0.0);
    bool _443 = _439 || _441;
    if (_371)
    {
        float _445 = _429 * _373;
        _143 = _445;
    }
    float _447 = _143;
    float _449 = in.m_62.x;
    float _451 = in.m_62.y;
    int _453 = _443 ? 0 : 1;
    float _455 = 1.0 / _379;
    bool _457 = _419 > 0.0;
    bool _459 = _419 >= 0.0;
    bool _461 = isnan(_419);
    bool _463 = _459 || _461;
    bool _465 = isnan(0.0);
    bool _467 = _463 || _465;
    int _469 = ~_453;
    int _471 = _469 + 1;
    int _473 = _471 + 1;
    int _475 = as_type<int>(_347) & 1;
    bool _477 = _475 != 0;
    int _479 = as_type<int>(_347) & 2;
    bool _481 = _479 != 0;
    float _483 = 1.0 / _383;
    bool _485 = _431 > 0.0;
    int _487 = _467 ? 0 : 1;
    bool _489 = _431 >= 0.0;
    bool _491 = isnan(_431);
    bool _493 = _489 || _491;
    bool _495 = isnan(0.0);
    bool _497 = _493 || _495;
    int _499 = _473;
    if (!_433)
    {
        int _501 = ~_453;
        int _503 = _501 + 1;
        _499 = _503;
    }
    int _505 = _499;
    float _507 = 1.0 / _387;
    int _509 = _497 ? 0 : 1;
    float _511 = _427 * _455;
    float _513 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _515 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _513;
    float _517 = _291 * _449;
    int _519 = ~_509;
    int _521 = _519 + 1;
    int _523 = _521 + 1;
    float _525 = _339 + (-0.5);
    int _527 = _523;
    if (!_485)
    {
        int _529 = ~_509;
        int _531 = _529 + 1;
        _527 = _531;
    }
    int _533 = _527;
    float _535 = 1.0 / _405;
    int _537 = ~_487;
    int _539 = _537 + 1;
    int _541 = _539 + 1;
    float _543 = _293 * _451;
    float _545 = _337 + (-0.5);
    bool _547 = _341 > 0.5;
    float _549 = _515 * _483;
    int _551 = _541;
    if (!_457)
    {
        int _553 = ~_487;
        int _555 = _553 + 1;
        _551 = _555;
    }
    int _557 = _551;
    float _559 = 1.0 / _411;
    bool _561 = !_481;
    float _563 = _561 ? (-0.5) : 0.5;
    float _565 = _543 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _567 = _517 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _569 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _571 = _569 != 0;
    int _573 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _575 = _573 != 0;
    float _577 = 1.0 / _417;
    int _579 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _581 = _579 != 0;
    float _583 = -_563;
    int _585 = _547 ? as_type<int>(_583) : as_type<int>(_563);
    int _587 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _589 = _587 != 0;
    int _591 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _593 = _591 != 0;
    int _595 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _597 = _595 != 0;
    float _599 = in.m_48.x;
    float _601 = in.m_48.y;
    float _603 = in.m_48.z;
    bool _605 = !_477;
    float _607 = _605 ? (-0.5) : 0.5;
    bool _609 = !_589;
    int _611 = _609 ? 0 : 1;
    bool _613 = _339 > 0.5;
    float _615 = _337 + _335;
    bool _617 = _335 > 0.5;
    float _619 = _615 + (-1.0);
    bool _621 = !_593;
    int _623 = _621 ? 0 : 1;
    bool _625 = _337 > 0.5;
    float _627 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _629 = _627 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _631 = !_597;
    int _633 = _631 ? 0 : 1;
    float _635 = float(_533);
    float _637 = 1.0 / _629;
    bool _639 = _331 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _641 = isnan(_331);
    bool _643 = _639 || _641;
    bool _645 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _647 = _643 || _645;
    float _649 = float(_647);
    float _651 = _601 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _653 = _601 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _655 = _601 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _657 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _659 = _657 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    float _661 = fma(_599, (*spvDescriptorSet0.vp_c10)._m0[5].x, _651);
    float _663 = fma(_599, (*spvDescriptorSet0.vp_c10)._m0[4].x, _653);
    float _665 = fma(_599, (*spvDescriptorSet0.vp_c10)._m0[6].x, _655);
    float _667 = 1.0 / _659;
    float _669 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _671 = _669 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _673 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _675 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _673;
    float _677 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _679 = _677 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _681 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _683 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _681;
    float _685 = _671 * _507;
    float _687 = _675 * _535;
    float _689 = _679 * _559;
    float _691 = _683 * _637;
    float _693 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _695 = _693 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _697 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _699 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _697;
    float _701 = _399 + (-1.0);
    float _703 = _695 * _577;
    float _705 = fma(_413, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _707 = _699 * _667;
    float _709 = fma(_619, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _711 = fma(_701, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _713 = fma(_603, (*spvDescriptorSet0.vp_c10)._m0[4].z, _663);
    float _715 = fma(_603, (*spvDescriptorSet0.vp_c10)._m0[5].z, _661);
    float _717 = fma(_603, (*spvDescriptorSet0.vp_c10)._m0[6].z, _665);
    int _719 = abs(_611);
    float _721 = in.m_64.x;
    float _723 = in.m_64.y;
    float _725 = in.m_64.z;
    float _727 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _729 = _333 + _727;
    int _731 = abs(_623);
    float _733 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _735 = _331 + _733;
    float _737 = float(_719);
    float _739 = float(_505);
    float _741 = fma(_511, _729, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    int _743 = abs(_633);
    float _745 = fma(_549, _735, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    float _747 = _737 * _739;
    float _749 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _751 = _331 + _749;
    float _753 = float(_731);
    float _755 = float(_557);
    float _757 = float(_743);
    float _759 = fma(_685, _751, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    float _761 = _747 * (-2.0);
    float _763 = _753 * _755;
    bool _765 = _331 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _767 = isnan(_331);
    bool _769 = _765 || _767;
    bool _771 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _773 = _769 || _771;
    float _775 = float(_773);
    float _777 = -_649;
    float _779 = _777 + 1.0;
    float _781 = fma(_709, _761, _709);
    float _783 = fma(_761, _721, _721);
    float _785 = _757 * _635;
    float _787 = _763 * (-2.0);
    bool _789 = _331 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _791 = isnan(_331);
    bool _793 = _789 || _791;
    bool _795 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _797 = _793 || _795;
    float _799 = float(_797);
    float _801 = _775 * _779;
    float _803 = -_775;
    float _805 = _803 + 1.0;
    float _807 = fma(_401, (*spvDescriptorSet0.vp_c9)._m0[196].x, _783);
    bool _809 = _331 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _811 = isnan(_331);
    bool _813 = _809 || _811;
    bool _815 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _817 = _813 || _815;
    float _819 = float(_817);
    float _821 = fma(_787, _723, _723);
    float _823 = _799 * _805;
    float _825 = fma(_705, _787, _705);
    float _827 = -_799;
    float _829 = _827 + 1.0;
    bool _831 = _331 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _833 = isnan(_331);
    bool _835 = _831 || _833;
    bool _837 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _839 = _835 || _837;
    float _841 = float(_839);
    float _843 = -_819;
    float _845 = _843 + 1.0;
    float _847 = fma(_781, _447, _807);
    float _849 = _785 * (-2.0);
    float _851 = _819 * _829;
    float _853 = _841 * _845;
    float _855 = fma(_545, (*spvDescriptorSet0.vp_c9)._m0[196].y, _821);
    bool _857 = _331 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _859 = isnan(_331);
    bool _861 = _857 || _859;
    bool _863 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _865 = _861 || _863;
    float _867 = float(_865);
    float _869 = fma(_711, _849, _711);
    float _871 = fma(_849, _725, _725);
    float _873 = fma(_825, _447, _855);
    bool _875 = _331 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _877 = isnan(_331);
    bool _879 = _875 || _877;
    bool _881 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _883 = _879 || _881;
    float _885 = float(_883);
    float _887 = -_867;
    float _889 = _887 + 1.0;
    bool _891 = _331 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _893 = isnan(_331);
    bool _895 = _891 || _893;
    bool _897 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _899 = _895 || _897;
    float _901 = float(_899);
    float _903 = fma(_525, (*spvDescriptorSet0.vp_c9)._m0[196].z, _871);
    float _905 = _873 * 0.15915493667125701904296875;
    float _907 = -_885;
    float _909 = _907 + 1.0;
    float _911 = _847 * 0.15915493667125701904296875;
    float _913 = _901 * _889;
    float _915 = fma(_869, _447, _903);
    float _917 = -_841;
    float _919 = _917 + 1.0;
    float _921 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _923 = _331 + _921;
    float _925 = _867 * _909;
    float _927 = _745 * _913;
    float _929 = -_901;
    float _931 = _929 + 1.0;
    float _933 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _935 = _331 + _933;
    float _937 = _915 * 0.15915493667125701904296875;
    float _939 = _885 * _919;
    float _941 = fma(_689, _923, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    float _943 = fma(_931, (*spvDescriptorSet0.vp_c9)._m0[151].x, _927);
    float _945 = _911 * 6.283185482025146484375;
    float _947 = sin(_945);
    float _949 = fma(_687, _935, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _951 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _953 = _331 + _951;
    float _955 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _957 = _331 + _955;
    float _959 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _961 = _331 + _959;
    float _963 = fma(_759, _925, _943);
    float _965 = fma(_691, _953, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    bool _967 = _333 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _969 = isnan(_333);
    bool _971 = _967 || _969;
    bool _973 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _975 = _971 || _973;
    float _977 = float(_975);
    float _979 = _911 * 6.283185482025146484375;
    float _981 = cos(_979);
    float _983 = fma(_949, _939, _963);
    float _985 = fma(_703, _957, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    bool _987 = _333 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _989 = isnan(_333);
    bool _991 = _987 || _989;
    bool _993 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _995 = _991 || _993;
    float _997 = float(_995);
    float _999 = -_977;
    float _1001 = _999 + 1.0;
    float _1003 = fma(_941, _853, _983);
    float _1005 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _563);
    float _1007 = fma(_707, _961, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    float _1009 = _905 * 6.283185482025146484375;
    float _1011 = sin(_1009);
    float _1013 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _607);
    float _1015 = _997 * _1001;
    float _1017 = fma(_965, _851, _1003);
    float _1019 = _565 * _1005;
    float _1021 = _567 * _1013;
    float _1023 = _741 * _1015;
    float _1025 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1027 = _905 * 6.283185482025146484375;
    float _1029 = cos(_1027);
    float _1031 = -_997;
    float _1033 = _1031 + 1.0;
    float _1035 = fma(_985, _823, _1017);
    float _1037 = fma(_1033, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1023);
    float _1039 = _713 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1041 = fma(_1007, _801, _1035);
    float _1043 = _937 * 6.283185482025146484375;
    float _1045 = cos(_1043);
    float _1047 = _947 * _1011;
    float _1049 = _937 * 6.283185482025146484375;
    float _1051 = sin(_1049);
    float _1053 = _981 * _1029;
    float _1055 = _947 * _1029;
    float _1057 = _981 * _1045;
    float _1059 = _947 * _1045;
    float _1061 = _981 * _1011;
    float _1063 = _1029 * _1045;
    float _1065 = _1057 * _1019;
    float _1067 = _1011 * _1045;
    float _1069 = _1059 * _1019;
    float _1071 = _1057 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1073 = fma(_1051, _1053, _1047);
    float _1075 = -_1019;
    float _1077 = _1051 * _1075;
    float _1079 = -_1055;
    float _1081 = fma(_1051, _1061, _1079);
    float _1083 = -_1061;
    float _1085 = fma(_1051, _1055, _1083);
    float _1087 = fma(_1073, _1021, _1065);
    float _1089 = fma(_1063, _1021, _1077);
    float _1091 = fma(_1051, _1047, _1053);
    float _1093 = fma(_1085, _1021, _1069);
    float _1095 = fma(_1081, _1025, _1087);
    float _1097 = fma(_1067, _1025, _1089);
    float _1099 = fma(_977, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1037);
    float _1101 = fma(_1091, _1025, _1093);
    float _1103 = _1095 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1105 = _1095 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1107 = fma(_649, (*spvDescriptorSet0.vp_c9)._m0[158].x, _1041);
    float _1109 = _1057 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1111 = fma(_1097, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1103);
    float _1113 = fma(_1097, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1105);
    float _1115 = -_1051;
    float _1117 = fma(_1115, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1071);
    float _1119 = -_1051;
    float _1121 = fma(_1119, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1109);
    float _1123 = fma(_1101, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1111);
    float _1125 = fma(_1101, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1113);
    float _1127 = _717 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1129 = fma(_1059, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1117);
    float _1131 = _1123 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1133 = _1125 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1135 = _1057 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1137 = _1073 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1139 = _1039 + _1131;
    float _1141 = _1127 + _1133;
    float _1143 = -_1051;
    float _1145 = fma(_1143, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1135);
    float _1147 = fma(_1059, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1121);
    float _1149 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1151 = _1139 + _1149;
    float _1153 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1155 = _1141 + _1153;
    float _1157 = fma(_1059, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1145);
    float _1159 = _1073 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1161 = _1151 * _1151;
    float _1163 = _1155 * _1155;
    float _1165 = _1073 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1167 = fma(_1063, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1159);
    float _1169 = -_563;
    int _1171 = _625 ? as_type<int>(_1169) : as_type<int>(_563);
    float _1173 = _1161 + _1163;
    float _1175 = fma(_1063, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1165);
    bool _1177 = !_581;
    float _1179 = _1177 ? _563 : as_type<float>(_585);
    float _1181 = _1081 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1183 = sqrt(_1173);
    float _1185 = _1081 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1187 = _1081 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1189 = _1095 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1191 = fma(_1063, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1137);
    bool _1193 = !_575;
    float _1195 = _1193 ? _563 : as_type<float>(_1171);
    float _1197 = _563 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1199 = fma(_1097, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1189);
    float _1201 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1203 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1181);
    float _1205 = _1197 * _1147;
    float _1207 = _1197 * _1157;
    float _1209 = _1197 * _1129;
    float _1211 = fma(_1101, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1199);
    float _1213 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1185);
    float _1215 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1187);
    bool _1217 = _1183 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1219 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1221 = _715 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1223 = _1211 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1225 = fma(_1085, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1167);
    float _1227 = fma(_1085, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1191);
    float _1229 = fma(_1085, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1175);
    float _1231 = _1221 + _1223;
    float _1233 = -_607;
    int _1235 = _617 ? as_type<int>(_1233) : as_type<int>(_607);
    float _1237 = -_607;
    int _1239 = _613 ? as_type<int>(_1237) : as_type<int>(_607);
    float _1241 = _1211;
    float _1243 = _1223;
    float _1245 = _1139;
    float _1247 = _1161;
    float _1249 = _1163;
    if (!_1217)
    {
        _1241 = _1139;
    }
    float _1251 = _1241;
    float _1253 = _1251;
    if (!_1217)
    {
        _1243 = _1141;
    }
    float _1255 = _1243;
    float _1257 = _1255;
    if (!_1217)
    {
        _1245 = _1231;
    }
    float _1259 = _1245;
    bool _1261 = !_1217;
    float _1263 = _1259;
    float _1265 = _1219;
    if (!_1261)
    {
        float _1267 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1269 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1271 = _1183 + _1269;
        float _1273 = _1231 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1275 = rsqrt(_1173);
        float _1277 = _1271 * _1267;
        float _1279 = _1277 * 0.15915493667125701904296875;
        float _1281 = _1279 * 6.283185482025146484375;
        float _1283 = sin(_1281);
        float _1285 = _1279 * 6.283185482025146484375;
        float _1287 = cos(_1285);
        float _1289 = fma(_1283, _1273, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1291 = _1275 * _1289;
        float _1293 = fma(_1151, _1291, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1295 = _1287 + (-1.0);
        float _1297 = fma(_1155, _1291, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1299 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1301 = _1293 + _1299;
        float _1303 = _1295 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1305 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1307 = _1297 + _1305;
        float _1309 = _1301 * _1301;
        float _1311 = fma(_1231, _1287, _1303);
        float _1313 = _1307 * _1307;
        _1263 = _1311;
        _1247 = _1309;
        _1249 = _1313;
        _1253 = _1293;
        _1257 = _1297;
    }
    float _1315 = _1263;
    float _1317 = _1247;
    float _1319 = _1249;
    float _1321 = _1253;
    float _1323 = _1257;
    float _1325 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _1327 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1329 = _1327 != 0;
    float _1331 = _607 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _1333 = !_571;
    float _1335 = _1333 ? _607 : as_type<float>(_1235);
    float _1337 = -_1179;
    float _1339 = _1337 + 0.5;
    bool _1341 = !_1329;
    float _1343 = _1341 ? _607 : as_type<float>(_1239);
    float _1345 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1347 = _1315 + _1345;
    float _1349 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1351 = _1335 + 0.5;
    float _1353 = fma(_1347, _1347, _1317);
    float _1355 = _1339 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1357 = -_1195;
    float _1359 = _1357 + 0.5;
    float _1361 = _1353 + _1319;
    float _1363 = _1343 + 0.5;
    float _1365 = _1355 * _1325;
    float _1367 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1203);
    float _1369 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1213);
    float _1371 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1215);
    float _1373 = fma(_1331, _1227, _1205);
    float _1375 = fma(_1331, _1225, _1207);
    float _1377 = sqrt(_1361);
    float _1379 = fma(_1331, _1229, _1209);
    float _1381 = _1351 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1383 = _1359 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1385 = _1363 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1387 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1389 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1391 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1393 = _1381 * _1201;
    float _1395 = _1383 * _1219;
    float _1397 = _1385 * _1349;
    float _1399 = _1367 + _1373;
    float _1401 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1403 = _1387 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1405 = _1389 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1407 = _1391 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1409 = _1099 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1411 = _1369 + _1375;
    float _1413 = _1371 + _1379;
    out.m_66.w = _1401;
    bool _1415 = _1377 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1417 = isnan(_1377);
    bool _1419 = _1415 || _1417;
    bool _1421 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1423 = _1419 || _1421;
    out.m_68.x = _1393;
    out.m_68.y = _1395;
    out.m_68.z = _1397;
    out.m_68.w = _1365;
    out.m_70.x = _1403;
    out.m_70.y = _1405;
    out.m_70.z = _1407;
    out.m_70.w = _1409;
    out.m_72.x = _1107;
    float _1425 = _1365;
    float _1427 = _1401;
    if (!_1423)
    {
        _1265 = 1.0;
    }
    float _1429 = _1265;
    out.m_74.x = _1399;
    out.m_74.y = _1411;
    out.m_74.z = _1413;
    bool _1431 = !_1423;
    float _1433 = _1429;
    if (!_1431)
    {
        bool _1435 = _1377 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1437 = isnan(_1377);
        bool _1439 = _1435 || _1437;
        bool _1441 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1443 = _1439 || _1441;
        if (!_1443)
        {
            float _1445 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1447 = _1377 + _1445;
            float _1449 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1451 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1449;
            float _1453 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1455 = _1453 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1457 = 1.0 / _1451;
            float _1459 = _1447 * _1457;
            float _1461 = fma(_1459, _1455, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1433 = _1461;
            _1425 = _1455;
            _1463 = true;
        }
        else
        {
            bool _1465 = _1377 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1467 = isnan(_1377);
            bool _1469 = _1465 || _1467;
            bool _1471 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1473 = _1469 || _1471;
            if (!_1473)
            {
                float _1475 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1477 = _1377 + _1475;
                float _1479 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1481 = _1479 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1483 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1485 = _1483 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1487 = 1.0 / _1481;
                float _1489 = _1477 * _1487;
                float _1491 = fma(_1489, _1485, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1433 = _1491;
                _1425 = _1485;
                _1463 = true;
            }
            else
            {
                _1433 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1463 = false;
    float _1493 = _1433;
    float _1495 = _1425;
    float _1497 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1499 = _1315 + _1497;
    float _1501 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1503 = _1321 + _1501;
    float _1505 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1507 = _1323 + _1505;
    float _1509 = fma(_1499, _1493, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1511 = fma(_1503, _1493, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1513 = fma(_1507, _1493, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1515 = -_1221;
    float _1517 = _1515 + _1509;
    float _1519 = -_1039;
    float _1521 = _1519 + _1511;
    float _1523 = -_1127;
    float _1525 = _1523 + _1513;
    float _1527 = _1517 * _1517;
    float _1529 = fma(_1521, _1521, _1527);
    float _1531 = fma(_1525, _1525, _1529);
    float _1533 = sqrt(_1531);
    bool _1535 = _1533 > 0.0;
    bool _1537 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1539 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1541 = _1537 || _1539;
    bool _1543 = isnan(0.5);
    bool _1545 = _1541 || _1543;
    float _1547 = _1495;
    float _1549 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _1551 = _1507;
    float _1553 = _1511;
    float _1555 = _1517;
    if (!_1535)
    {
        _1547 = _1511;
    }
    float _1557 = _1547;
    float _1559 = _1557;
    float _1561 = _1557;
    if (!_1535)
    {
        _1549 = _1509;
    }
    float _1563 = _1549;
    float _1565 = _1563;
    if (!_1535)
    {
        _1551 = _1513;
    }
    float _1567 = _1551;
    bool _1569 = !_1535;
    float _1571 = _1567;
    if (!_1569)
    {
        float _1573 = _183 * _183;
        float _1575 = fma(_181, _181, _1573);
        float _1577 = rsqrt(_1531);
        float _1579 = fma(_185, _185, _1575);
        float _1581 = sqrt(_1579);
        float _1583 = _1521 * _1577;
        float _1585 = _1517 * _1577;
        float _1587 = _1525 * _1577;
        bool _1589 = _1581 > 0.0;
        float _1591 = _1577;
        float _1593 = _1581;
        if (!_1589)
        {
            _1559 = _1511;
        }
        float _1595 = _1559;
        _1561 = _1595;
        if (!_1589)
        {
            _1591 = _1509;
        }
        float _1597 = _1591;
        _1565 = _1597;
        if (!_1589)
        {
            _1593 = _1513;
        }
        float _1599 = _1593;
        bool _1601 = !_1589;
        _1571 = _1599;
        if (!_1601)
        {
            float _1603 = rsqrt(_1579);
            float _1605 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1607 = _183 * _1603;
            float _1609 = _181 * _1603;
            float _1611 = _1585 * _1607;
            float _1613 = _185 * _1603;
            float _1615 = fma(_1583, _1609, _1611);
            float _1617 = _1605 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1619 = fma(_1587, _1613, _1615);
            float _1621 = _1619 * _1617;
            float _1623 = fma(_181, _1621, _1511);
            float _1625 = fma(_183, _1621, _1509);
            float _1627 = fma(_185, _1621, _1513);
            _1561 = _1623;
            _1565 = _1625;
            _1571 = _1627;
        }
    }
    float _1629 = _1561;
    float _1631 = _1565;
    float _1633 = _1571;
    if (_1545)
    {
        _189 = _1629;
    }
    float _1635 = _189;
    float _1637 = _1635;
    if (_1545)
    {
        _191 = _1631;
    }
    float _1639 = _191;
    float _1641 = _1639;
    if (_1545)
    {
        _193 = _1633;
    }
    float _1643 = _193;
    float _1645 = _1643;
    if (!_1545)
    {
        float _1647 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1649 = _1221 + _1647;
        float _1651 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1653 = _1039 + _1651;
        float _1655 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1657 = -_1221;
        float _1659 = _1657 + _1631;
        float _1661 = _1649 * _1649;
        float _1663 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1665 = _1127 + _1663;
        float _1667 = -_1127;
        float _1669 = _1667 + _1633;
        float _1671 = fma(_1653, _1653, _1661);
        float _1673 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1675 = fma(_1665, _1665, _1671);
        float _1677 = sqrt(_1675);
        float _1679 = _1655 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1681 = precise::min(_1677, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1683 = _1681 * _1673;
        float _1685 = -_1039;
        float _1687 = _1685 + _1629;
        float _1689 = _1679 * _1683;
        float _1691 = fma(_1687, _1689, _1039);
        float _1693 = fma(_1659, _1689, _1221);
        float _1695 = fma(_1669, _1689, _1127);
        _1641 = _1693;
        _1637 = _1691;
        _1645 = _1695;
    }
    float _1697 = _1641;
    float _1699 = _1637;
    float _1701 = _1645;
    float _1703 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1705 = _1697 + _1703;
    float _1707 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1709 = _1699 + _1707;
    float _1711 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1713 = _1701 + _1711;
    float _1715 = _1705 * _1705;
    float _1717 = fma(_1709, _1709, _1715);
    float _1719 = fma(_1713, _1713, _1717);
    float _1721 = rsqrt(_1719);
    float _1723 = sqrt(_1719);
    float _1725 = _1721 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1727 = _1709 * _1725;
    float _1729 = _1713 * _1725;
    float _1731 = _1727 * _1727;
    float _1733 = _1729 * _1729;
    float _1735 = _1731 + _1733;
    float _1737 = sqrt(_1735);
    bool _1739 = _1737 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1741 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1743 = _1737 + _1741;
    float _1745 = _1721;
    float _1747 = _1743;
    float _1749 = _1705;
    if (_1739)
    {
        float _1751 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1745 = _1751;
    }
    float _1753 = _1745;
    if (_1739)
    {
        float _1755 = rsqrt(_1735);
        _1553 = _1755;
    }
    float _1757 = _1553;
    float _1759 = _1757;
    if (_1739)
    {
        float _1761 = _1743 * _1753;
        _1747 = _1761;
    }
    float _1763 = _1747;
    float _1765 = _1697 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (_1739)
    {
        float _1767 = _1763 * 0.15915493667125701904296875;
        _1555 = _1767;
    }
    float _1769 = _1555;
    float _1771 = _1753;
    if (_1739)
    {
        float _1773 = _1769 * 6.283185482025146484375;
        float _1775 = sin(_1773);
        _1771 = _1775;
    }
    float _1777 = _1771;
    float _1779 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1781 = precise::max(0.0, _1779);
    float _1783 = _1713;
    float _1785 = _1781;
    if (_1739)
    {
        float _1787 = _1769 * 6.283185482025146484375;
        float _1789 = cos(_1787);
        _1783 = _1789;
    }
    float _1791 = _1783;
    float _1793 = -_1725;
    float _1795 = -_1781;
    float _1797 = fma(_1705, _1793, _1795);
    float _1799 = _1797;
    if (_1739)
    {
        float _1801 = _1797 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1785 = _1801;
    }
    float _1803 = _1785;
    float _1805 = _1777;
    float _1807 = _1803;
    if (_1739)
    {
        float _1809 = fma(_1777, _1803, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1805 = _1809;
    }
    float _1811 = _1805;
    float _1813 = _1811;
    if (!_1739)
    {
        _1807 = _1731;
    }
    float _1815 = _1807;
    float _1817 = _1697 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1819 = _1815;
    float _1821 = _1791;
    if (_1739)
    {
        float _1823 = _1791 + (-1.0);
        _1749 = _1823;
    }
    float _1825 = _1749;
    float _1827 = _1825;
    if (_1739)
    {
        float _1829 = _1757 * _1811;
        _1427 = _1829;
    }
    float _1831 = _1427;
    if (!_1739)
    {
        _1759 = _1727;
    }
    float _1833 = _1759;
    float _1835 = _1833;
    if (_1739)
    {
        float _1837 = _1825 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1827 = _1837;
    }
    float _1839 = _1827;
    if (_1739)
    {
        float _1841 = _1727 * _1831;
        _1835 = _1841;
    }
    float _1843 = _1835;
    if (!_1739)
    {
        _1813 = _1729;
    }
    float _1845 = _1813;
    float _1847 = _1845;
    if (_1739)
    {
        float _1849 = _1729 * _1831;
        _1847 = _1849;
    }
    float _1851 = _1847;
    if (_1739)
    {
        float _1853 = fma(_1797, _1791, _1839);
        _1799 = _1853;
    }
    float _1855 = _1799;
    if (_1739)
    {
        float _1857 = _1843 * _1843;
        _1819 = _1857;
    }
    float _1859 = _1819;
    if (!_1739)
    {
        _1821 = _1733;
    }
    float _1861 = _1821;
    float _1863 = _1861;
    if (_1739)
    {
        float _1865 = _1851 * _1851;
        _1863 = _1865;
    }
    float _1867 = _1863;
    float _1869 = fma(_1855, _1855, _1859);
    float _1871 = _1697 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1873 = _1869 + _1867;
    float _1875 = fma(_1699, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1871);
    float _1877 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1879 = fma(_1723, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1877);
    float _1881 = precise::clamp(_1879, 0.0, 1.0);
    float _1883 = rsqrt(_1873);
    float _1885 = fma(_1701, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1875);
    float _1887 = -_1881;
    float _1889 = _1887 + 1.0;
    float _1891 = fma(_1039, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1893 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1895 = _1885 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1897 = abs(_1889);
    float _1899 = log2(_1897);
    float _1901 = _1895 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1903 = fma(_1699, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1765);
    float _1905 = fma(_1127, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1907 = -_1901;
    float _1909 = fma(_1907, _1893, 1.0);
    float _1911 = _1697 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1913 = fma(_1699, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1817);
    float _1915 = _1883 * _1843;
    float _1917 = _1883 * _1855;
    float _1919 = _1883 * _1851;
    float _1921 = fma(_1699, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1911);
    float _1923 = fma(_1701, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1913);
    float _1925 = _1915 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1927 = floor(_1891);
    float _1929 = fma(_1701, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1921);
    float _1931 = _1923 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1933 = -_1925;
    float _1935 = fma(_1917, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1933);
    float _1937 = fma(_1701, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1903);
    float _1939 = _1929 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1941 = _1931 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1943 = _1899 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1945 = floor(_1905);
    float _1947 = -_1919;
    float _1949 = fma(_1947, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1935);
    float _1951 = fma(_1939, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1941);
    float _1953 = fma(_1949, -0.5, 0.5);
    float _1955 = fma(_1895, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1951);
    float _1957 = log2(_1909);
    float _1959 = -_1927;
    float _1961 = _1891 + _1959;
    float _1963 = fma(_1949, 0.5, 0.5);
    float _1965 = exp2(_1943);
    float _1967 = _1937 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1969 = -_1945;
    float _1971 = _1905 + _1969;
    float _1973 = fma(_1963, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1975 = _1917 + 1.0;
    float _1977 = fma(_1967, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1955);
    float _1979 = _1931 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1981 = fma(_1963, _1973, -0.212114393711090087890625);
    float _1983 = sqrt(_1953);
    float _1985 = _1931 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1987 = fma(_1939, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1979);
    float2 _5709 = float2(_1961, _1971);
    float _1989 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5709, float2(0.0), isnan(_5709)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5709, float2(0.0), isnan(_5709)), level(0.0)).x;
    float _1991 = _1957 * 0.693147182464599609375;
    float _1993 = fma(_1939, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1985);
    float _1995 = fma(_1895, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1987);
    float _1997 = fma(_1963, _1981, 1.570728778839111328125);
    float _1999 = 1.0 / _1977;
    float _2001 = fma(_1895, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1993);
    float _2003 = fma(_1967, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1995);
    float _2005 = -_1917;
    float _2007 = fma(_1965, _1975, _2005);
    float _2009 = _1991 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2011 = fma(_1967, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2001);
    float _2013 = fma(_2007, 0.5, 0.5);
    float _2015 = _1983 * 0.636619746685028076171875;
    float _2017 = _2003 * _1999;
    float _2019 = _2011 * _1999;
    float _2021 = -_1997;
    float _2023 = fma(_2015, _2021, 1.0);
    float _2025 = fma(_2017, 0.5, 0.5);
    float _2027 = fma(_2019, -0.5, 0.5);
    float3 _5784 = float3(_2025, _2027, _2009);
    float _2029 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5784, float3(0.0), isnan(_5784)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5784, float3(0.0), isnan(_5784)), level(0.0)).x;
    float3 _5795 = float3(_2025, _2027, _2009);
    float4 _2032 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5795, float3(0.0), isnan(_5795)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5795, float3(0.0), isnan(_5795)), level(0.0)).xyzw;
    float _2034 = _2032.x;
    float _2036 = _2032.y;
    float _2038 = _2032.z;
    float _2040 = _2032.w;
    float2 _5811 = float2(_2023, _2013);
    float3 _2044 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5811, float2(0.0), isnan(_5811)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5811, float2(0.0), isnan(_5811)), level(0.0)).xyz;
    float _2046 = _2044.x;
    float _2048 = _2044.y;
    float _2050 = _2044.z;
    float _2052 = _1221 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2054 = _1221 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2056 = _1931 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2058 = _1723 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2060 = isnan(_1723);
    bool _2062 = _2058 || _2060;
    bool _2064 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2066 = _2062 || _2064;
    float _2068 = fma(_1039, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2052);
    float _2070 = fma(_1039, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2054);
    float _2072 = fma(_1939, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2056);
    float _2074 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2068);
    float _2076 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2070);
    float _2078 = in.m_76.x;
    float _2080 = _2074 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2082 = _2076 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2084 = 1.0 / _2080;
    float _2086 = _2082 + _2080;
    float _2088 = _2086 * _2084;
    float _2090 = _2088 * 0.5;
    float _2092 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2094 = fma(_2090, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2092);
    float _2096 = 1.0 / _2094;
    float _2098 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2100 = _2096 * _2098;
    float _2102 = abs(_2100);
    float _2104 = log2(_2102);
    float _2106 = _2104 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    bool _2108 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2110 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2112 = _2108 || _2110;
    bool _2114 = isnan(0.5);
    bool _2116 = _2112 || _2114;
    float _2118 = exp2(_2106);
    float _2120 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _2122 = _2100;
    float _2124 = _1977;
    if (!_2116)
    {
        _2120 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _2126 = _2120;
    float _2128 = fma(_2118, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2130 = precise::clamp(_2128, 0.0, 1.0);
    float _2132 = _1899 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2134 = _2126;
    if (!_2116)
    {
        float _2136 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2138 = _2126 + _2136;
        _2134 = _2138;
    }
    float _2140 = _2134;
    float _2142 = fma(_1895, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2072);
    float _2144 = fma(_2130, -2.0, 3.0);
    float _2146 = _2130 * _2130;
    float _2148 = 2.0;
    if (!_2116)
    {
        float _2150 = 1.0 / _2140;
        _2148 = _2150;
    }
    float _2152 = _2148;
    float _2154 = fma(_1967, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2142);
    bool _2156 = _2100 <= 8000.0;
    bool _2158 = isnan(_2100);
    bool _2160 = _2156 || _2158;
    bool _2162 = isnan(8000.0);
    bool _2164 = _2160 || _2162;
    float _2166 = float(_2164);
    float _2168 = _2146 * _2144;
    float _2170 = -_2168;
    float _2172 = _2170 + 1.0;
    float _2174 = exp2(_2132);
    out.gl_Position.x = _2003;
    out.gl_Position.y = _2011;
    out.gl_Position.z = _2154;
    out.gl_Position.w = _1977;
    float _2176 = _2154 + _1977;
    float _2178 = fma(_2172, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2168);
    float _2180 = _2172;
    float _2182 = _2168;
    float _2184 = _1977;
    if (!_2116)
    {
        float _2186 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2188 = _2100 + _2186;
        _2180 = _2188;
    }
    float _2190 = _2180;
    float _2192 = _2190;
    if (_2116)
    {
        _2182 = 1.0;
    }
    float _2194 = _2182;
    float _2196 = _2194;
    if (!_2116)
    {
        float _2198 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2200 = _2100 + _2198;
        _2122 = _2200;
    }
    float _2202 = _2122;
    float _2204 = _2166 * _2178;
    float _2206 = _2202;
    if (!_2116)
    {
        float _2208 = _2190 * _2152;
        float _2210 = precise::clamp(_2208, 0.0, 1.0);
        _2196 = _2210;
    }
    float _2212 = _2196;
    float _2214 = _2176 * 0.5;
    float _2216 = _2204 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2218 = _2214;
    if (!_2116)
    {
        _2192 = (*spvDescriptorSet0.vp_c9)._m0[140].w;
    }
    float _2220 = _2192;
    out.m_78.z = _2214;
    out.m_78.w = _1977;
    float _2222 = -_2174;
    float _2224 = _2222 + 1.0;
    float _2226 = _2220;
    if (!_2116)
    {
        float _2228 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2230 = _2220 + _2228;
        _2226 = _2230;
    }
    float _2232 = _2226;
    if (!_2066)
    {
        _2124 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2234 = _2124;
    float _2236 = _2224 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2238 = _2003;
    float _2240 = _2234;
    float _2242 = _2234;
    if (!_2116)
    {
        float _2244 = 1.0 / _2232;
        _2238 = _2244;
    }
    float _2246 = _2238;
    float _2248 = -_2236;
    float _2250 = _2248 + 1.0;
    float _2252 = _2250;
    if (!_2066)
    {
        _2218 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2254 = _2218;
    float _2256 = _2254;
    float _2258 = _2254;
    if (!_2066)
    {
        _2184 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2260 = _2184;
    float _2262 = _2260;
    float _2264 = _2260;
    if (!_2116)
    {
        float _2266 = _2202 * _2246;
        float _2268 = precise::clamp(_2266, 0.0, 1.0);
        _2206 = _2268;
    }
    float _2270 = _2206;
    float _2272 = -_1989;
    float _2274 = _2272 + 1.0;
    float _2276 = _2274 * _2216;
    float _2278 = precise::clamp(_2276, 0.0, 1.0);
    float _2280 = -_2278;
    float _2282 = fma(_2280, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2284 = _2282 * _2078;
    float _2286 = _2284 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_80.x = _2286;
    float _2288 = _2286;
    float _2290 = _2270;
    if (!_2066)
    {
        _2288 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2292 = _2288;
    float _2294 = _2236 * _2029;
    float _2296 = _2040 * _2294;
    float _2298 = _2050 * _2294;
    float _2300 = _2040 * _2250;
    float _2302 = _2292;
    float _2304 = _2292;
    if (_2116)
    {
        _2252 = 1.0;
    }
    float _2306 = _2252;
    float _2308 = fma(_2046, _2296, _2034);
    float _2310 = fma(_2048, _2296, _2036);
    float _2312 = fma(_2040, _2298, _2038);
    float _2314 = _2306;
    if (!_2116)
    {
        float _2316 = -_2270;
        float _2318 = _2316 + 1.0;
        _2314 = _2318;
    }
    float _2320 = _2314;
    if (!_2066)
    {
        _2290 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2322 = _2290;
    out.m_82.x = _2308;
    out.m_82.y = _2310;
    out.m_82.z = _2312;
    out.m_82.w = _2300;
    float _2324 = _2212 * _2320;
    float _2326 = _2324 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2328 = _2324;
    float _2330 = _2322;
    float _2332 = _2322;
    if (!_2066)
    {
        _2328 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2334 = _2328;
    bool _2336 = !_2066;
    float _2338 = _2334;
    float _2340 = _2334;
    if (!_2336)
    {
        bool _2342 = _1723 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2344 = isnan(_1723);
        bool _2346 = _2342 || _2344;
        bool _2348 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2350 = _2346 || _2348;
        if (!_2350)
        {
            float _2352 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2354 = _1723 + _2352;
            float _2356 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2358 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2356;
            float _2360 = 1.0 / _2358;
            float _2362 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2364 = _2362 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2366 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2368 = _2366 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2370 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2372 = _2370 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2374 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2376 = _2374 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2378 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2380 = _2378 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2382 = _2354 * _2360;
            float _2384 = precise::clamp(_2382, 0.0, 1.0);
            float _2386 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2388 = _2386 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2390 = fma(_2384, _2364, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2392 = fma(_2384, _2388, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2394 = fma(_2384, _2368, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2396 = fma(_2384, _2372, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2398 = fma(_2384, _2376, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2400 = fma(_2384, _2380, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2264 = _2392;
            _2304 = _2398;
            _2258 = _2390;
            _2242 = _2396;
            _2332 = _2394;
            _2340 = _2400;
            _2402 = true;
        }
        else
        {
            bool _2404 = _1723 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2406 = isnan(_1723);
            bool _2408 = _2404 || _2406;
            bool _2410 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2412 = _2408 || _2410;
            if (!_2412)
            {
                _2256 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2414 = _2256;
            _2258 = _2414;
            if (!_2412)
            {
                _2262 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2416 = _2262;
            _2264 = _2416;
            if (!_2412)
            {
                _2330 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2418 = _2330;
            _2332 = _2418;
            if (!_2412)
            {
                _2240 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2420 = _2240;
            _2242 = _2420;
            if (!_2412)
            {
                _2302 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2422 = _2302;
            _2304 = _2422;
            if (!_2412)
            {
                _2338 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2424 = _2338;
            bool _2426 = !_2412;
            _2340 = _2424;
            if (!_2426)
            {
                bool _2428 = _1723 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2430 = isnan(_1723);
                bool _2432 = _2428 || _2430;
                bool _2434 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2436 = _2432 || _2434;
                if (!_2436)
                {
                    float _2438 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2440 = _1723 + _2438;
                    float _2442 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2444 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2442;
                    float _2446 = 1.0 / _2444;
                    float _2448 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2450 = _2448 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2452 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2454 = _2452 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2456 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2458 = _2456 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2460 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2462 = _2460 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2464 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2466 = _2464 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2468 = _2440 * _2446;
                    float _2470 = precise::clamp(_2468, 0.0, 1.0);
                    float _2472 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2474 = _2472 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2476 = fma(_2470, _2450, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2478 = fma(_2470, _2474, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2480 = fma(_2470, _2454, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2482 = fma(_2470, _2458, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2484 = fma(_2470, _2462, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2486 = fma(_2470, _2466, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2264 = _2478;
                    _2304 = _2484;
                    _2258 = _2476;
                    _2242 = _2482;
                    _2332 = _2480;
                    _2340 = _2486;
                    _2402 = true;
                }
                else
                {
                    _2264 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2304 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2258 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2242 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2332 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2340 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2402 = false;
    float _2488 = _2264;
    float _2490 = _2304;
    float _2492 = _2258;
    float _2494 = _2242;
    float _2496 = _2332;
    float _2498 = _2340;
    float _2500 = fma(_1411, -0.5, 0.5);
    float _2502 = precise::clamp(_2500, 0.0, 1.0);
    float _2504 = -_2488;
    float _2506 = _2504 + _2490;
    float _2508 = _2326 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2510 = -_2492;
    float _2512 = _2510 + _2494;
    out.m_84.x = 0.0;
    float _2514 = fma(_2502, _2506, _2488);
    float _2516 = fma(_2502, _2512, _2492);
    out.m_51.x = _2508;
    float _2518 = -_2496;
    float _2520 = _2518 + _2498;
    float _2522 = _2514 * 0.586610972881317138671875;
    bool _2524 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2526 = fma(_2502, _2520, _2496);
    float _2528 = fma(_2516, 0.298911988735198974609375, _2522);
    bool _2530 = _2212 > 0.0;
    bool _2532 = isnan(_2212);
    bool _2534 = _2530 || _2532;
    bool _2536 = isnan(0.0);
    bool _2538 = _2534 || _2536;
    float _2540 = fma(_2526, 0.114477999508380889892578125, _2528);
    bool _2542 = _2320 <= 0.0;
    bool _2544 = !_2538;
    bool _2546 = _2542 || _2544;
    float _2548 = -_2540;
    float _2550 = _2516 + _2548;
    float _2552 = -_2540;
    float _2554 = _2514 + _2552;
    float _2556 = -_2540;
    float _2558 = _2526 + _2556;
    float _2560 = fma(_2550, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2540);
    float _2562 = fma(_2554, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2540);
    float _2564 = fma(_2558, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2540);
    bool _2566 = !_2524;
    if (!_2566)
    {
        float _2568 = -_1697;
        float _2570 = _2568 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2572 = -_1699;
        float _2574 = _2572 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2576 = -_1701;
        float _2578 = _2576 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2580 = _2570 * _2570;
        float _2582 = fma(_2574, _2574, _2580);
        float _2584 = fma(_2578, _2578, _2582);
        float _2586 = sqrt(_2584);
        float _2588 = rsqrt(_2584);
        float _2590 = -_2586;
        float _2592 = _2590 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2594 = _2592 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2596 = precise::clamp(_2594, 0.0, 1.0);
        float _2598 = _2574 * _2588;
        float _2600 = _2570 * _2588;
        float _2602 = abs(_2596);
        float _2604 = log2(_2602);
        float _2606 = _2578 * _2588;
        float _2608 = _2598 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2610 = _1411 * _2600;
        float _2612 = -_2600;
        float _2614 = -_2608;
        float _2616 = fma(_2612, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2614);
        float _2618 = fma(_1399, _2598, _2610);
        float _2620 = -_2606;
        float _2622 = fma(_2620, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2616);
        float _2624 = fma(_1413, _2606, _2618);
        float _2626 = precise::clamp(_2624, 0.0, 1.0);
        float _2628 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2630 = _2622 + _2628;
        float _2632 = _2604 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2634 = _2630 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2636 = precise::clamp(_2634, 0.0, 1.0);
        float _2638 = exp2(_2632);
        float _2640 = _2638 * _2636;
        float _2642 = _2626 * _2640;
        float _2644 = _2642 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2646 = _2642 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2648 = _2642 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_84.x = _2644;
        out.m_84.y = _2646;
        out.m_84.z = _2648;
    }
    out.m_86.x = _2560;
    out.m_86.y = _2562;
    out.m_86.z = _2564;
    if (!_2546)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_51.x = 0.0;
    float _2650 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2650;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}


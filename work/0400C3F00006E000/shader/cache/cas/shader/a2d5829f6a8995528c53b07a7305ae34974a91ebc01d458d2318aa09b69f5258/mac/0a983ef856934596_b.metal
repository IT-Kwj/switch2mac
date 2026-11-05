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
    texture2d<float> vp_t_tcb_28 [[id(6)]];
    sampler vp_t_tcb_28Smplr [[id(7)]];
    texture2d<float> vp_t_tcb_24 [[id(8)]];
    sampler vp_t_tcb_24Smplr [[id(9)]];
    texture3d<float> vp_t_tcb_32 [[id(10)]];
    sampler vp_t_tcb_32Smplr [[id(11)]];
    texture3d<float> vp_t_tcb_30 [[id(12)]];
    sampler vp_t_tcb_30Smplr [[id(13)]];
    texture2d<float> vp_t_tcb_1C [[id(14)]];
    sampler vp_t_tcb_1CSmplr [[id(15)]];
    sampler vp_t_tcb_28Smplr_w [[id(16)]];
    sampler vp_t_tcb_24Smplr_w [[id(17)]];
    sampler vp_t_tcb_32Smplr_w [[id(18)]];
    sampler vp_t_tcb_30Smplr_w [[id(19)]];
    sampler vp_t_tcb_1CSmplr_w [[id(20)]];
    constant dm_border_t* dm_border [[id(21)]];
};

struct main0_out
{
    float4 m_74 [[user(locn0)]];
    float4 m_76 [[user(locn1)]];
    float4 m_82 [[user(locn2)]];
    float4 m_86 [[user(locn3)]];
    float4 m_94 [[user(locn4)]];
    float4 m_51 [[user(locn5)]];
    float4 m_80 [[user(locn6)]];
    float4 m_84 [[user(locn7)]];
    float4 m_72 [[user(locn8)]];
    float4 m_78 [[user(locn9)]];
    float4 m_92 [[user(locn10)]];
    float4 m_90 [[user(locn11)]];
    float4 m_88 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_66 [[attribute(0)]];
    float4 m_57 [[attribute(1)]];
    float4 m_55 [[attribute(2)]];
    float4 m_59 [[attribute(3)]];
    float4 m_68 [[attribute(4)]];
    float4 m_48 [[attribute(5)]];
    float4 m_53 [[attribute(6)]];
    float4 m_64 [[attribute(7)]];
    float4 m_70 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3639 = false;
    bool _365 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _108 = in.m_48.w;
    float _110 = trunc(_108);
    int _113 = int(_110);
    bool _117 = _113 >= 1;
    float _119 = 0.0;
    if (!_117)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _121 = _119;
    float _123 = _121;
    if (!_117)
    {
        out.m_51.x = 0.0;
    }
    int _125 = 0;
    if (!_117)
    {
        float _127 = _121 * 5.0;
        _125 = as_type<int>(_127);
    }
    int _129 = _125;
    int _131 = _129;
    if (!_117)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3924 = as_type<float>(_129);
        out.gl_Position.z = _3924;
    }
    if (!_117)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _133 = in.m_53.w;
    bool _135 = _133 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _137 = isnan(_133);
    bool _139 = _135 || _137;
    bool _141 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _143 = _139 || _141;
    float _145 = -_133;
    float _147 = _145 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _149 = _147;
    if (_143)
    {
        float _151 = float(_113);
        _123 = _151;
    }
    float _153 = _123;
    bool _155 = _147 >= _153;
    bool _157 = !_143;
    bool _159 = _155 || _157;
    float _161 = _153;
    if (_159)
    {
        _161 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _163 = _161;
    if (_159)
    {
        out.m_51.x = 0.0;
    }
    if (_159)
    {
        float _165 = _163 * 5.0;
        _131 = as_type<int>(_165);
    }
    int _167 = _131;
    if (_159)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3994 = as_type<float>(_167);
        out.gl_Position.z = _3994;
    }
    if (_159)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _169 = in.m_55.x;
    float _171 = in.m_55.y;
    float _173 = in.m_55.z;
    float _175 = in.m_57.x;
    float _177 = in.m_57.y;
    float _179 = in.m_57.z;
    float _181 = in.m_59.x;
    float _183 = in.m_59.y;
    float _185 = in.m_59.z;
    float _187 = as_type<float>(int(gl_VertexIndex));
    float _189 = _169 * _169;
    float _191 = _171 * _171;
    float _193 = _173 * _173;
    float _195 = fma(_175, _175, _189);
    float _197 = fma(_177, _177, _191);
    float _199 = fma(_179, _179, _193);
    float _201 = fma(_181, _181, _195);
    float _203 = fma(_183, _183, _197);
    float _205 = fma(_185, _185, _199);
    float _207 = sqrt(_201);
    float _209 = sqrt(_203);
    bool _211 = _207 > 0.0;
    float _213 = sqrt(_205);
    bool _215 = _209 > 0.0;
    float _217 = _201;
    if (_211)
    {
        float _219 = rsqrt(_201);
        _217 = _219;
    }
    float _221 = _217;
    float _223 = 0.0;
    float _225 = 0.0;
    if (!_211)
    {
        _223 = 0.0;
        _225 = 0.0;
    }
    float _227 = _223;
    float _229 = _225;
    float _231 = 0.0;
    float _233 = _229;
    float _235 = _227;
    if (!_211)
    {
        _231 = 0.0;
    }
    float _237 = _231;
    bool _239 = _213 > 0.0;
    float _241 = _213;
    float _243 = _237;
    if (_215)
    {
        float _245 = rsqrt(_203);
        _241 = _245;
    }
    float _247 = _241;
    int _249 = as_type<int>(_187) & 1;
    bool _251 = _249 != 0;
    int _253 = as_type<int>(_187) & 2;
    bool _255 = _253 != 0;
    float _257 = 0.0;
    if (!_215)
    {
        _257 = 0.0;
    }
    float _259 = _257;
    float _261 = 0.0;
    float _263 = _259;
    if (!_215)
    {
        _261 = 0.0;
    }
    float _265 = _261;
    float _267 = 0.0;
    float _269 = _265;
    if (!_215)
    {
        _267 = 0.0;
    }
    float _271 = _267;
    float _273 = _271;
    if (_211)
    {
        float _275 = _221 * _169;
        _233 = _275;
    }
    float _277 = _233;
    if (_211)
    {
        float _279 = _221 * _175;
        _243 = _279;
    }
    float _281 = _243;
    float _283 = _209;
    if (_239)
    {
        float _285 = rsqrt(_205);
        _283 = _285;
    }
    float _287 = _283;
    if (_211)
    {
        float _289 = _221 * _181;
        _235 = _289;
    }
    float _291 = _235;
    bool _293 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _295 = 0.0;
    if (!_239)
    {
        _295 = 0.0;
    }
    float _297 = _295;
    float _299 = 0.0;
    float _301 = _297;
    if (!_239)
    {
        _299 = 0.0;
    }
    float _303 = _299;
    float _305 = _303;
    if (_215)
    {
        float _307 = _247 * _171;
        _263 = _307;
    }
    float _309 = _263;
    float _311 = 0.0;
    if (!_239)
    {
        _311 = 0.0;
    }
    float _313 = _311;
    float _315 = _313;
    if (_215)
    {
        float _317 = _247 * _177;
        _269 = _317;
    }
    float _319 = _269;
    if (_215)
    {
        float _321 = _247 * _183;
        _273 = _321;
    }
    float _323 = _273;
    bool _325 = !_251;
    float _327 = _325 ? (-0.5) : 0.5;
    bool _329 = !_255;
    float _331 = _329 ? (-0.5) : 0.5;
    if (_239)
    {
        float _333 = _287 * _173;
        _301 = _333;
    }
    float _335 = _301;
    if (_239)
    {
        float _337 = _287 * _179;
        _305 = _337;
    }
    float _339 = _305;
    if (_239)
    {
        float _341 = _287 * _185;
        _315 = _341;
    }
    float _343 = _315;
    bool _345 = !_293;
    float _363;
    if (!_345)
    {
        float _347 = in.m_64.x;
        float _349 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _351 = _347 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _353 = fma(_351, (*spvDescriptorSet0.vp_c9)._m0[12].x, _147);
        float _355 = _353 * _349;
        float _357 = floor(_355);
        float _359 = -_357;
        float _361 = _355 + _359;
        _363 = _361;
        _365 = true;
    }
    else
    {
        float _367 = float(_113);
        float _369 = 1.0 / _367;
        float _371 = _147 * _369;
        _363 = _371;
    }
    _365 = false;
    float _373 = _363;
    float _375 = in.m_48.x;
    float _377 = in.m_48.y;
    float _379 = in.m_48.z;
    float _381 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _383 = log2(_381);
    float _385 = in.m_66.y;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _389 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _387;
    float _391 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _393 = _391 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _395 = in.m_64.x;
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _399 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _397;
    float _401 = 1.0 / _389;
    float _403 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _405 = _403 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _407 = in.m_64.y;
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _411 = _373 + _409;
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _415 = _373 + _413;
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _419 = _373 + _417;
    float _421 = in.m_64.z;
    bool _423 = _373 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _425 = isnan(_373);
    bool _427 = _423 || _425;
    bool _429 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _431 = _427 || _429;
    float _433 = float(_431);
    float _435 = 1.0 / _399;
    float _437 = _383 * _147;
    float _439 = in.m_57.w;
    float _441 = _177 * _377;
    float _443 = _183 * _377;
    float _445 = 1.0 / _393;
    float _447 = _377 + _385;
    float _449 = fma(_175, _375, _441);
    float _451 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _453 = _395 * 2.0;
    int _455 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _457 = _455 != 0;
    float _459 = fma(_181, _375, _443);
    float _461 = 1.0 / _405;
    float _463 = _407 * 2.0;
    float _465 = _395 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _467 = fma(_185, _379, _459);
    float _469 = fma(_179, _379, _449);
    float _471 = -_451;
    float _473 = fma(_465, 2.0, _471);
    float _475 = floor(_453);
    float _477 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _479 = _407 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _481 = as_type<int>(_451);
    float _483 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    if (_457)
    {
        _481 = 0;
    }
    int _485 = _481;
    float _487 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _489 = _373 + _487;
    int _491 = _485;
    if (!_457)
    {
        _491 = 1;
    }
    int _493 = _491;
    float _495 = fma(_479, -2.0, _477);
    float _497 = floor(_463);
    bool _499 = _493 != 1;
    float _501 = _489 * _401;
    float _503 = float(_113);
    float _505 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _507 = _421 * 2.0;
    float _509 = _411 * _445;
    float _511 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _513 = int(_511);
    bool _515 = _475 > 0.0;
    float _517 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _519 = _475 >= 0.0;
    bool _521 = isnan(_475);
    bool _523 = _519 || _521;
    bool _525 = isnan(0.0);
    bool _527 = _523 || _525;
    float _529 = -_147;
    float _531 = fma(_529, (*spvDescriptorSet0.vp_c9)._m0[76].x, _473);
    float _533 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[76].y, _495);
    float _535 = as_type<float>(_493);
    if (!_499)
    {
        _535 = _407;
    }
    float _537 = _535;
    float _539 = _415 * _435;
    float _541 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _543 = int(_541);
    bool _545 = _497 > 0.0;
    float _547 = in.m_59.w;
    float _549 = _537;
    if (_499)
    {
        _549 = _395;
    }
    float _551 = _549;
    float _553 = _419 * _461;
    bool _555 = _497 >= 0.0;
    bool _557 = isnan(_497);
    bool _559 = _555 || _557;
    bool _561 = isnan(0.0);
    bool _563 = _559 || _561;
    float _565 = _469 + _439;
    int _567 = _527 ? 0 : 1;
    float _569 = fma(_551, (*spvDescriptorSet0.vp_c9)._m0[83].z, _505);
    int _571 = _563 ? 0 : 1;
    float _573 = 1.0 / _503;
    float _575 = float(_513);
    float _577 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].z, _569);
    float _579 = as_type<float>(_513);
    float _581 = _551;
    if (!_499)
    {
        _579 = _407;
    }
    float _583 = _579;
    float _585 = _583;
    if (_499)
    {
        _585 = _395;
    }
    float _587 = _585;
    int _589 = ~_567;
    int _591 = _589 + 1;
    int _593 = _591 + 1;
    float _595 = 1.0 / _575;
    int _597 = ~_571;
    int _599 = _597 + 1;
    int _601 = _599 + 1;
    float _603 = _587 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _605 = float(_543);
    int _607 = _593;
    int _609 = _601;
    float _611 = as_type<float>(_543);
    if (!_515)
    {
        int _613 = ~_567;
        int _615 = _613 + 1;
        _607 = _615;
    }
    int _617 = _607;
    if (!_545)
    {
        int _619 = ~_571;
        int _621 = _619 + 1;
        _609 = _621;
    }
    int _623 = _609;
    float _625 = exp2(_437);
    if (!_499)
    {
        _611 = _421;
    }
    float _627 = _611;
    float _629 = _573 * _147;
    float _631 = _467 + _547;
    float _633 = _627;
    if (_499)
    {
        _633 = _407;
    }
    float _635 = _633;
    float _637 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    if (!_499)
    {
        _581 = _421;
    }
    float _639 = _581;
    float _641 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _643 = _639;
    if (_499)
    {
        _643 = _407;
    }
    float _645 = _643;
    float _647 = _635 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _649 = 1.0 / _605;
    float _651 = -_637;
    float _653 = fma(_603, 2.0, _651);
    float _655 = fma(_645, (*spvDescriptorSet0.vp_c9)._m0[83].w, _517);
    float _657 = fma(_647, -2.0, _641);
    float _659 = -_625;
    float _661 = _659 + 1.0;
    float _663 = -_147;
    float _665 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[81].x, _653);
    float _667 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _669 = 1.0 + _667;
    bool _671 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _673 = isnan(0.0);
    bool _675 = _671 || _673;
    bool _677 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _679 = _675 || _677;
    float _681 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _683 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _685 = 1.0 / _669;
    int _687 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _689 = _687 != 0;
    int _691 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _693 = _691 != 0;
    int _695 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _697 = _695 != 0;
    float _699 = fma(_407, (*spvDescriptorSet0.vp_c9)._m0[78].w, _681);
    bool _701 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _703 = isnan(1.0);
    bool _705 = _701 || _703;
    bool _707 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _709 = _705 || _707;
    float _711 = fma(_395, (*spvDescriptorSet0.vp_c9)._m0[78].z, _683);
    float _713 = _679 ? _661 : 0.0;
    float _715 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].w, _699);
    float _717 = _395 + _407;
    float _719 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].z, _711);
    float _721 = _395 + _421;
    float _723 = floor(_507);
    float _725 = _649 * _147;
    float _727 = _595 * _147;
    float _729 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].w, _655);
    float _731 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[81].y, _657);
    float _733 = _717 + (-1.0);
    if (_709)
    {
        float _735 = _713 * _685;
        _149 = _735;
    }
    float _737 = _149;
    float _739 = _721 + (-1.0);
    int _741 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _743 = _741 != 0;
    int _745 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _747 = _745 != 0;
    int _749 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _751 = _749 != 0;
    int _753 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _755 = _753 != 0;
    float _757 = fma(_733, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _759 = _421 + _407;
    float _761 = fma(_739, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _763 = !_693;
    int _765 = _763 ? 0 : 1;
    float _767 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].y;
    bool _769 = !_689;
    int _771 = _769 ? 0 : 1;
    float _773 = _759 + (-1.0);
    bool _775 = !_697;
    int _777 = _775 ? 0 : 1;
    int _779 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _781 = _779 != 0;
    int _783 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _785 = _783 != 0;
    int _787 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _789 = _787 != 0;
    float _791 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _793 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _791;
    bool _795 = !_747;
    int _797 = _795 ? 0 : 1;
    float _799 = fma(_773, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _801 = !_743;
    int _803 = _801 ? 0 : 1;
    float _805 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _807 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _805;
    int _809 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 65536;
    bool _811 = _809 != 0;
    int _813 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 131072;
    bool _815 = _813 != 0;
    float _817 = fma(_793, _501, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _819 = !_781;
    int _821 = _819 ? 0 : 1;
    float _823 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _825 = _823 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _827 = _723 >= 0.0;
    bool _829 = isnan(_723);
    bool _831 = _827 || _829;
    bool _833 = isnan(0.0);
    bool _835 = _831 || _833;
    float _837 = fma(_807, _501, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _839 = _373 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _841 = isnan(_373);
    bool _843 = _839 || _841;
    bool _845 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _847 = _843 || _845;
    float _849 = float(_847);
    float _851 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _853 = _851 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    int _855 = _835 ? 0 : 1;
    bool _857 = _723 > 0.0;
    float _859 = -_849;
    float _861 = _859 + 1.0;
    bool _863 = _373 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _865 = isnan(_373);
    bool _867 = _863 || _865;
    bool _869 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _871 = _867 || _869;
    float _873 = float(_871);
    float _875 = fma(_853, _509, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _877 = _373 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _879 = isnan(_373);
    bool _881 = _877 || _879;
    bool _883 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _885 = _881 || _883;
    float _887 = float(_885);
    float _889 = fma(_825, _509, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _891 = _373 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _893 = isnan(_373);
    bool _895 = _891 || _893;
    bool _897 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _899 = _895 || _897;
    float _901 = float(_899);
    float _903 = -_873;
    float _905 = _903 + 1.0;
    float _907 = _887 * _861;
    float _909 = -_887;
    float _911 = _909 + 1.0;
    float _913 = _737 + (*spvDescriptorSet0.vp_c9)._m0[202].y;
    float _915 = _901 * _905;
    float _917 = -_901;
    float _919 = _917 + 1.0;
    float _921 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _923 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _921;
    int _925 = ~_855;
    int _927 = _925 + 1;
    int _929 = _927 + 1;
    float _931 = _849 * _919;
    int _933 = _929;
    if (!_857)
    {
        int _935 = ~_855;
        int _937 = _935 + 1;
        _933 = _937;
    }
    int _939 = _933;
    float _941 = _913 * _767;
    int _943 = abs(_821);
    float _945 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _947 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _945;
    bool _949 = !_785;
    int _951 = _949 ? 0 : 1;
    float _953 = in.m_68.x;
    float _955 = in.m_68.y;
    float _957 = in.m_68.z;
    float _959 = fma(_923, _539, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _961 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _963 = _447 + _961;
    int _965 = abs(_951);
    float _967 = fma(_947, _539, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    bool _969 = !_789;
    int _971 = _969 ? 0 : 1;
    float _973 = fma(_395, (*spvDescriptorSet0.vp_c9)._m0[203].y, _941);
    float _975 = float(_943);
    float _977 = _963 * _963;
    float _979 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _981 = _565 + _979;
    float _983 = float(_939);
    float _985 = _973 + 0.25;
    int _987 = abs(_971);
    float _989 = _433 * _911;
    float _991 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _993 = _631 + _991;
    float _995 = fma(_981, _981, _977);
    float _997 = _975 * _983;
    float _999 = floor(_985);
    float _1001 = fma(_993, _993, _995);
    float _1003 = _837 * _989;
    float _1005 = _817 * _989;
    float _1007 = float(_617);
    float _1009 = _997 * (-2.0);
    float _1011 = float(_965);
    float _1013 = floor(_973);
    float _1015 = float(_623);
    float _1017 = _395 + (-0.5);
    float _1019 = float(_987);
    float _1021 = _1011 * _1007;
    float _1023 = fma(_1009, _953, _953);
    float _1025 = fma(_757, _1009, _757);
    int _1027 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 32768;
    bool _1029 = _1027 != 0;
    float _1031 = rsqrt(_1001);
    float _1033 = _1019 * _1015;
    float _1035 = _973 * 6.283185482025146484375;
    float _1037 = -_999;
    float _1039 = _985 + _1037;
    float _1041 = fma(_1017, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1023);
    bool _1043 = !_811;
    int _1045 = _1043 ? 0 : 1;
    float _1047 = _1035 * 0.15915493667125701904296875;
    float _1049 = _1021 * (-2.0);
    float _1051 = -_1013;
    float _1053 = _973 + _1051;
    bool _1055 = _1039 > 0.5;
    float _1057 = fma(_1025, _737, _1041);
    float _1059 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _1061 = _1059 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _1063 = _1047 * 6.283185482025146484375;
    float _1065 = sin(_1063);
    bool _1067 = _1053 >= 0.5;
    bool _1069 = isnan(_1053);
    bool _1071 = _1067 || _1069;
    bool _1073 = isnan(0.5);
    bool _1075 = _1071 || _1073;
    int _1077 = abs(_1045);
    float _1079 = _963 * _1031;
    bool _1081 = !_1029;
    int _1083 = _1081 ? 0 : 1;
    float _1085 = _981 * _1031;
    float _1087 = fma(_1061, _553, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _1089 = -_1079;
    float _1091 = fma(_1089, (*spvDescriptorSet0.vp_c9)._m0[18].w, _963);
    bool _1093 = !_1075;
    float _1095 = _1093 ? 0.5 : (-0.5);
    float _1097 = _1039;
    float _1099 = _1085;
    if (_1055)
    {
        float _1101 = -_1039;
        float _1103 = _1101 + 1.0;
        _1097 = _1103;
    }
    float _1105 = _1097;
    int _1107 = abs(_1083);
    float _1109 = _1091 * _1091;
    float _1111 = float(_1077);
    float _1113 = -_1085;
    float _1115 = fma(_1113, (*spvDescriptorSet0.vp_c9)._m0[18].w, _981);
    float _1117 = _1095 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    float _1119 = _1117 * 2.0;
    float _1121 = _1065 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    bool _1123 = !_815;
    int _1125 = _1123 ? 0 : 1;
    float _1127 = _1111 * _1119;
    float _1129 = float(_1107);
    float _1131 = fma(_1105, 4.0, -1.0);
    int _1133 = abs(_1125);
    float _1135 = _993 * _1031;
    float _1137 = fma(_1115, _1115, _1109);
    float _1139 = fma(_1129, _1121, _1127);
    float _1141 = float(_1133);
    float _1143 = _1131 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    float _1145 = -_1135;
    float _1147 = fma(_1145, (*spvDescriptorSet0.vp_c9)._m0[18].w, _993);
    float _1149 = _1033 * (-2.0);
    float _1151 = _421 + (-0.5);
    float _1153 = fma(_1141, _1143, _1139);
    float _1155 = fma(_1147, _1147, _1137);
    float _1157 = fma(_761, _1149, _761);
    float _1159 = fma(_1149, _957, _957);
    float _1161 = fma(_1153, 3.1415927410125732421875, _955);
    float _1163 = fma(_799, _1049, _799);
    float _1165 = _1057 * 0.15915493667125701904296875;
    float _1167 = fma(_1151, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1159);
    float _1169 = _407 + (-0.5);
    float _1171 = fma(_1161, _1049, _1161);
    float _1173 = -_433;
    float _1175 = _1173 + 1.0;
    float _1177 = fma(_1157, _737, _1167);
    float _1179 = sqrt(_1155);
    float _1181 = fma(_1169, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1171);
    float _1183 = fma(_1175, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1003);
    float _1185 = in.m_70.x;
    float _1187 = in.m_70.y;
    float _1189 = fma(_1175, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1005);
    float _1191 = fma(_1163, _737, _1181);
    float _1193 = fma(_875, _907, _1183);
    float _1195 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _1197 = _1195 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _1199 = fma(_889, _907, _1189);
    float _1201 = _1177 * 0.15915493667125701904296875;
    float _1203 = fma(_959, _931, _1193);
    float _1205 = fma(_1197, _553, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _1207 = fma(_967, _931, _1199);
    float _1209 = _1191 * 0.15915493667125701904296875;
    float _1211 = _1165 * 6.283185482025146484375;
    float _1213 = sin(_1211);
    float _1215 = fma(_1205, _915, _1203);
    float _1217 = fma(_1087, _915, _1207);
    float _1219 = _1031 * _1179;
    float _1221 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _331);
    float _1223 = fma(_873, (*spvDescriptorSet0.vp_c9)._m0[147].x, _1215);
    float _1225 = fma(_873, (*spvDescriptorSet0.vp_c9)._m0[147].y, _1217);
    float _1227 = _1219 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1229 = _1227 * 0.5;
    float _1231 = _1165 * 6.283185482025146484375;
    float _1233 = cos(_1231);
    float _1235 = _1223 * _1185;
    float _1237 = _1225 * _1187;
    float _1239 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _327);
    float _1241 = _1201 * 6.283185482025146484375;
    float _1243 = cos(_1241);
    float _1245 = _1235 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1247 = _1237 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1249 = _1245 * _1219;
    float _1251 = _1247 * _1219;
    float _1253 = _1209 * 6.283185482025146484375;
    float _1255 = sin(_1253);
    float _1257 = _1249 * _1239;
    float _1259 = _1251 * _1221;
    float _1261 = _1209 * 6.283185482025146484375;
    float _1263 = cos(_1261);
    float _1265 = _1233 * _1243;
    float _1267 = _1213 * _1243;
    float _1269 = _1265 * _1229;
    float _1271 = _1201 * 6.283185482025146484375;
    float _1273 = sin(_1271);
    float _1275 = _1213 * _1255;
    float _1277 = _1233 * _1255;
    float _1279 = _1233 * _1263;
    float _1281 = _1213 * _1263;
    float _1283 = _1263 * _1243;
    float _1285 = _1255 * _1243;
    float _1287 = _1267 * _1229;
    float _1289 = fma(_1273, _1279, _1275);
    float _1291 = _1273 * _1229;
    float _1293 = -_1281;
    float _1295 = fma(_1273, _1277, _1293);
    float _1297 = -_1277;
    float _1299 = fma(_1273, _1281, _1297);
    float _1301 = fma(_1289, _1257, _1269);
    float _1303 = -_1291;
    float _1305 = fma(_1283, _1257, _1303);
    float _1307 = fma(_1273, _1275, _1279);
    float _1309 = fma(_1299, _1257, _1287);
    float _1311 = -_1259;
    float _1313 = fma(_1295, _1311, _1301);
    float _1315 = -_1259;
    float _1317 = fma(_1285, _1315, _1305);
    bool _1319 = !_751;
    int _1321 = _1319 ? 0 : 1;
    float _1323 = -_1259;
    float _1325 = fma(_1307, _1323, _1309);
    float _1327 = _1313 * _323;
    float _1329 = _1313 * _319;
    float _1331 = _1313 * _309;
    float _1333 = fma(_1317, _291, _1327);
    float _1335 = fma(_1317, _281, _1329);
    float _1337 = fma(_1317, _277, _1331);
    float _1339 = fma(_1325, _343, _1333);
    float _1341 = fma(_1325, _339, _1335);
    float _1343 = fma(_1325, _335, _1337);
    float _1345 = _631 + _1339;
    float _1347 = _565 + _1341;
    float _1349 = _447 + _1343;
    bool _1351 = !_755;
    int _1353 = _1351 ? 0 : 1;
    float _1355 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1357 = _1345 + _1355;
    float _1359 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1361 = _1347 + _1359;
    float _1363 = _1357 * _1357;
    float _1365 = fma(_1361, _1361, _1363);
    float _1367 = sqrt(_1365);
    bool _1369 = _1367 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1371 = _1337;
    float _1373 = _1343;
    float _1375 = _1363;
    if (!_1369)
    {
        _1371 = _1347;
    }
    float _1377 = _1371;
    float _1379 = _1377;
    if (!_1369)
    {
        _1373 = _1345;
    }
    float _1381 = _1373;
    float _1383 = _1381;
    if (!_1369)
    {
        _1375 = _1349;
    }
    float _1385 = _1375;
    bool _1387 = !_1369;
    float _1389 = _1385;
    if (!_1387)
    {
        float _1391 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1393 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1395 = _1367 + _1393;
        float _1397 = rsqrt(_1365);
        float _1399 = _1395 * _1391;
        float _1401 = _1349 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1403 = _1399 * 0.15915493667125701904296875;
        float _1405 = _1403 * 6.283185482025146484375;
        float _1407 = cos(_1405);
        float _1409 = _1403 * 6.283185482025146484375;
        float _1411 = sin(_1409);
        float _1413 = _1407 + (-1.0);
        float _1415 = _1413 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1417 = fma(_1411, _1401, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1419 = fma(_1349, _1407, _1415);
        float _1421 = _1397 * _1417;
        float _1423 = fma(_1361, _1421, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1425 = fma(_1357, _1421, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1383 = _1425;
        _1379 = _1423;
        _1389 = _1419;
    }
    float _1427 = _1383;
    float _1429 = _1379;
    float _1431 = _1389;
    float _1433 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _1435 = _1427 + _1433;
    float _1437 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _1439 = _1429 + _1437;
    float _1441 = fma(_1435, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _1443 = fma(_1439, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _5903 = float2(_1443, _1441);
    float _1445 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_5903, float2(0.0), isnan(_5903)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_5903, float2(0.0), isnan(_5903)), level(0.0)).x;
    float _1447 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1449 = int(_1447);
    int _1451 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1453 = _1451 != 0;
    float _1455 = -_1135;
    float _1457 = fma(_1455, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1427);
    int _1459 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1461 = _1459 != 0;
    float _1463 = -_1135;
    float _1465 = fma(_1463, (*spvDescriptorSet0.vp_c9)._m0[18].w, _631);
    float _1467 = -_1085;
    float _1469 = fma(_1467, (*spvDescriptorSet0.vp_c9)._m0[18].w, _565);
    int _1471 = abs(_1321);
    float _1473 = trunc(_725);
    int _1475 = int(_1473);
    int _1477 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1479 = _1477 != 0;
    int _1481 = abs(_1353);
    if (_1453)
    {
        _483 = 1.0;
    }
    float _1483 = _483;
    float _1485 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1487 = int(_1485);
    float _1489 = float(uint(_1449));
    float _1491 = trunc(_727);
    int _1493 = int(_1491);
    float _1495 = float(uint(_1475));
    int _1497 = ~_1449;
    int _1499 = _1497 + 1;
    float _1501 = _1483;
    if (!_1453)
    {
        _1501 = 7.345489978790283203125;
    }
    float _1503 = _1501;
    float _1505 = 1.0 / _1489;
    float _1507 = float(uint(_1487));
    int _1509 = ~_1487;
    int _1511 = _1509 + 1;
    float _1513 = 1.0 / _1507;
    float _1515 = float(uint(_1493));
    int _1517 = as_type<int>(_1505) + (-2);
    float _1519 = as_type<float>(_1517) * _1495;
    int _1521 = as_type<int>(_1513) + (-2);
    float _1523 = trunc(_1519);
    float _1525 = precise::max(_1523, 0.0);
    uint _1528 = uint(_1525);
    float _1530 = _1503 * _395;
    float _1532 = float(_1475);
    float _1534 = as_type<float>(_1521) * _1515;
    float _1536 = trunc(_1534);
    float _1538 = precise::max(_1536, 0.0);
    uint _1540 = uint(_1538);
    int _1542 = _1499 * int(_1528);
    int _1544 = _1542 + _1475;
    float _1546 = floor(_1530);
    float _1548 = float(uint(_1544));
    int _1550 = _1511 * int(_1540);
    int _1552 = _1550 + _1493;
    float _1554 = as_type<float>(_1517) * _1548;
    float _1556 = float(_1449);
    float _1558 = float(uint(_1552));
    float _1560 = trunc(_1554);
    float _1562 = precise::max(_1560, 0.0);
    uint _1564 = uint(_1562);
    bool _1566 = _1532 >= _1556;
    bool _1568 = isnan(_1532);
    bool _1570 = _1566 || _1568;
    bool _1572 = isnan(_1556);
    bool _1574 = _1570 || _1572;
    float _1576 = float(_1574);
    float _1578 = -_1546;
    float _1580 = _1530 + _1578;
    float _1582 = as_type<float>(_1521) * _1558;
    float _1584 = float(_1487);
    float _1586 = trunc(_1576);
    int _1588 = int(_1586);
    int _1590 = ~_1449;
    int _1592 = _1590 + 1;
    int _1594 = int(_1528) + int(_1564);
    float _1596 = trunc(_1582);
    float _1598 = precise::max(_1596, 0.0);
    uint _1600 = uint(_1598);
    float _1602 = as_type<float>(_1564);
    float _1604 = as_type<float>(_1528);
    if (_1453)
    {
        _1602 = _395;
    }
    float _1606 = _1602;
    float _1608 = _1606;
    if (_1453)
    {
        _1604 = 1.0;
    }
    float _1610 = _1604;
    int _1612 = _1592 * _1594;
    int _1614 = _1612 + _1475;
    float _1616 = _1610;
    if (!_1453)
    {
        _1608 = _407;
    }
    float _1618 = _1608;
    if (!_1453)
    {
        _1616 = 1.2345600128173828125;
    }
    float _1620 = _1616;
    bool _1622 = uint(_1614) >= uint(_1449);
    float _1624 = _1618 * _1620;
    bool _1626 = !_1622;
    int _1628 = _1626 ? 0 : (-1);
    float _1630 = _1580 * _1556;
    bool _1632 = _1449 == 0;
    float _1634 = floor(_1624);
    int _1636 = ~_1594;
    int _1638 = _1636 + _1628;
    int _1640 = _1638 + 1;
    float _1642 = _1556 * _629;
    int _1644 = ~_1588;
    int _1646 = _1644 + 1;
    int _1648 = _1646 + 1;
    float _1650 = _1584 * _629;
    int _1652 = ~_1487;
    int _1654 = _1652 + 1;
    int _1656 = _1449 * _1640;
    int _1658 = _1656 + _1475;
    int _1660 = int(_1540) + int(_1600);
    float _1662 = trunc(_1630);
    int _1664 = int(_1662);
    int _1666 = abs(_765);
    bool _1668 = !_1632;
    int _1670 = _1668 ? _1658 : (-1);
    int _1672 = _1654 * _1660;
    int _1674 = _1672 + _1493;
    float _1676 = float(_1493);
    float _1678 = -_1634;
    float _1680 = _1624 + _1678;
    bool _1682 = !_1479;
    int _1684 = _1682 ? 0 : 1;
    int _1686 = _1670 * _1648;
    float _1688 = trunc(_1642);
    int _1690 = int(_1688);
    int _1692 = _1449 + (-1);
    float _1694 = _1680 * _1584;
    int _1696 = abs(_1684);
    bool _1698 = _1676 >= _1584;
    bool _1700 = isnan(_1676);
    bool _1702 = _1698 || _1700;
    bool _1704 = isnan(_1584);
    bool _1706 = _1702 || _1704;
    float _1708 = float(_1706);
    int _1710 = _1588 * _1692;
    int _1712 = _1710 + _1686;
    bool _1714 = uint(_1674) >= uint(_1487);
    int _1716 = _1664 * _1696;
    int _1718 = _1716 + _1475;
    bool _1720 = !_1461;
    int _1722 = _1720 ? 0 : 1;
    int _1724 = _1712 * _1666;
    float _1726 = trunc(_1708);
    int _1728 = int(_1726);
    int _1730 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1732 = _1730 != 0;
    int _1734 = abs(_771);
    int _1736 = abs(_777);
    bool _1738 = !_1714;
    int _1740 = _1738 ? 0 : (-1);
    int _1742 = _1690 * _1734;
    int _1744 = _1742 + _1724;
    int _1746 = abs(_1722);
    float _1748 = trunc(_1694);
    int _1750 = int(_1748);
    bool _1752 = !_1732;
    int _1754 = _1752 ? 0 : 1;
    int _1756 = ~_1660;
    int _1758 = _1756 + _1740;
    int _1760 = _1758 + 1;
    int _1762 = abs(_1754);
    int _1764 = _1718 * _1736;
    int _1766 = _1764 + _1744;
    int _1768 = _1487 * _1760;
    int _1770 = _1768 + _1493;
    bool _1772 = _1487 == 0;
    float _1774 = trunc(_1650);
    int _1776 = int(_1774);
    int _1778 = ~_1728;
    int _1780 = _1778 + 1;
    int _1782 = _1780 + 1;
    int _1784 = _1664 * _1746;
    int _1786 = _1784 + _1766;
    bool _1788 = !_1772;
    int _1790 = _1788 ? _1770 : (-1);
    int _1792 = _1750 * _1762;
    int _1794 = _1792 + _1493;
    int _1796 = _1487 + (-1);
    int _1798 = abs(_797);
    int _1800 = _1790 * _1782;
    float _1802 = float(uint(_1786));
    int _1804 = _1728 * _1796;
    int _1806 = _1804 + _1800;
    int _1808 = abs(_803);
    float _1810 = as_type<float>(_1517) * _1802;
    float _1812 = float(uint(_1794));
    int _1814 = _1806 * _1798;
    float _1816 = trunc(_1810);
    float _1818 = precise::max(_1816, 0.0);
    uint _1820 = uint(_1818);
    float _1822 = as_type<float>(_1521) * _1812;
    int _1824 = _1776 * _1808;
    int _1826 = _1824 + _1814;
    int _1828 = ~_1487;
    int _1830 = _1828 + 1;
    int _1832 = _1794 * _1471;
    int _1834 = _1832 + _1826;
    int _1836 = ~_1449;
    int _1838 = _1836 + 1;
    float _1840 = trunc(_1822);
    float _1842 = precise::max(_1840, 0.0);
    uint _1844 = uint(_1842);
    float _1846 = float(uint(_1718));
    int _1848 = _1750 * _1481;
    int _1850 = _1848 + _1834;
    int _1852 = ~_1487;
    int _1854 = _1852 + 1;
    int _1856 = ~_1449;
    int _1858 = _1856 + 1;
    int _1860 = _1838 * int(_1820);
    int _1862 = _1860 + _1786;
    float _1864 = float(uint(_1850));
    float _1866 = as_type<float>(_1517) * _1846;
    float _1868 = float(uint(_1862));
    float _1870 = as_type<float>(_1521) * _1864;
    float _1872 = trunc(_1866);
    float _1874 = precise::max(_1872, 0.0);
    uint _1876 = uint(_1874);
    float _1878 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1880 = as_type<float>(_1517) * _1868;
    float _1882 = trunc(_1870);
    float _1884 = precise::max(_1882, 0.0);
    uint _1886 = uint(_1884);
    int _1888 = ~_1449;
    int _1890 = _1888 + 1;
    float _1892 = trunc(_1880);
    float _1894 = precise::max(_1892, 0.0);
    uint _1896 = uint(_1894);
    int _1898 = _1890 * int(_1876);
    int _1900 = _1898 + _1718;
    float _1902 = float(uint(_1900));
    int _1904 = _1854 * int(_1886);
    int _1906 = _1904 + _1850;
    int _1908 = int(_1820) + int(_1896);
    float _1910 = float(uint(_1906));
    float _1912 = as_type<float>(_1521) * _1910;
    int _1914 = _1858 * _1908;
    int _1916 = _1914 + _1786;
    bool _1918 = uint(_1916) >= uint(_1449);
    float _1920 = trunc(_1912);
    float _1922 = precise::max(_1920, 0.0);
    uint _1924 = uint(_1922);
    int _1926 = _1830 * int(_1844);
    int _1928 = _1926 + _1794;
    bool _1930 = !_1918;
    int _1932 = _1930 ? 0 : (-1);
    float _1934 = float(uint(_1928));
    int _1936 = ~_1908;
    int _1938 = _1936 + _1932;
    int _1940 = _1938 + 1;
    float _1942 = as_type<float>(_1517) * _1902;
    float _1944 = -_1085;
    float _1946 = fma(_1944, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1429);
    float _1948 = as_type<float>(_1521) * _1934;
    int _1950 = _1449 * _1940;
    int _1952 = _1950 + _1786;
    float _1954 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1956 = _1946 + _1954;
    int _1958 = int(_1886) + int(_1924);
    float _1960 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1962 = _1457 + _1960;
    float _1964 = fma(_1445, 100.0, _1431);
    float _1966 = -_1079;
    float _1968 = fma(_1966, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1964);
    float _1970 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1972 = _1968 + _1970;
    float _1974 = _1972 * _1972;
    float _1976 = fma(_1956, _1956, _1974);
    float _1978 = fma(_1962, _1962, _1976);
    float _1980 = rsqrt(_1978);
    float _1982 = sqrt(_1978);
    float _1984 = _1980 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1986 = _1956 * _1984;
    float _1988 = _1962 * _1984;
    float _1990 = _1986 * _1986;
    float _1992 = _1988 * _1988;
    float _1994 = _1990 + _1992;
    float _1996 = sqrt(_1994);
    bool _1998 = _1996 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2000 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2002 = _1996 + _2000;
    float _2004 = _1980;
    float _2006 = _1994;
    float _2008 = _2002;
    float _2010 = as_type<float>(_1928);
    float _2012 = as_type<float>(_1728);
    float _2014 = _1984;
    float _2016 = _1986;
    if (_1998)
    {
        float _2018 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2004 = _2018;
    }
    float _2020 = _2004;
    if (_1998)
    {
        float _2022 = rsqrt(_1994);
        _2006 = _2022;
    }
    float _2024 = _2006;
    float _2026 = _2024;
    if (_1998)
    {
        float _2028 = _2002 * _2020;
        _2008 = _2028;
    }
    float _2030 = _2008;
    if (_1998)
    {
        float _2032 = _2030 * 0.15915493667125701904296875;
        _1099 = _2032;
    }
    float _2034 = _1099;
    float _2036 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2038 = (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2040 = _2034;
    if (_1998)
    {
        float _2042 = _2034 * 6.283185482025146484375;
        float _2044 = sin(_2042);
        _2038 = _2044;
    }
    float _2046 = _2038;
    float _2048 = precise::max(0.0, _2036);
    float _2050 = _1962;
    if (_1998)
    {
        float _2052 = _2034 * 6.283185482025146484375;
        float _2054 = cos(_2052);
        _2050 = _2054;
    }
    float _2056 = _2050;
    float _2058 = -_1984;
    float _2060 = -_2048;
    float _2062 = fma(_1972, _2058, _2060);
    float _2064 = _2062;
    if (_1998)
    {
        float _2066 = _2062 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2010 = _2066;
    }
    float _2068 = _2010;
    float _2070 = fma(_1469, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2072 = _2068;
    if (_1998)
    {
        float _2074 = fma(_2046, _2068, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2072 = _2074;
    }
    float _2076 = _2072;
    float _2078 = _2076;
    if (!_1998)
    {
        _2040 = _1986;
    }
    float _2080 = _2040;
    float _2082 = floor(_2070);
    float _2084 = _2080;
    if (_1998)
    {
        float _2086 = _2024 * _2076;
        _2012 = _2086;
    }
    float _2088 = _2012;
    if (!_1998)
    {
        _2026 = _1988;
    }
    float _2090 = _2026;
    float _2092 = _2090;
    if (_1998)
    {
        float _2094 = _2056 + (-1.0);
        _2014 = _2094;
    }
    float _2096 = _2014;
    float _2098 = _2096;
    if (_1998)
    {
        float _2100 = _1986 * _2088;
        _2084 = _2100;
    }
    float _2102 = _2084;
    if (!_1998)
    {
        _2078 = _1990;
    }
    float _2104 = _2078;
    float _2106 = _2104;
    if (_1998)
    {
        float _2108 = _1988 * _2088;
        _2092 = _2108;
    }
    float _2110 = _2092;
    if (_1998)
    {
        float _2112 = _2096 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2098 = _2112;
    }
    float _2114 = _2098;
    if (_1998)
    {
        float _2116 = _2102 * _2102;
        _2106 = _2116;
    }
    float _2118 = _2106;
    if (!_1998)
    {
        _2016 = _1992;
    }
    float _2120 = _2016;
    float _2122 = _2120;
    if (_1998)
    {
        float _2124 = _2110 * _2110;
        _2122 = _2124;
    }
    float _2126 = _2122;
    if (_1998)
    {
        float _2128 = fma(_2062, _2056, _2114);
        _2064 = _2128;
    }
    float _2130 = _2064;
    float _2132 = _1968 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2134 = -_2082;
    float _2136 = _2070 + _2134;
    float _2138 = fma(_2130, _2130, _2118);
    float _2140 = fma(_1465, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2142 = _2138 + _2126;
    float _2144 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2146 = fma(_1982, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2144);
    float _2148 = precise::clamp(_2146, 0.0, 1.0);
    float _2150 = fma(_1946, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2132);
    float _2152 = _1968 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2154 = rsqrt(_2142);
    float _2156 = -_2148;
    float _2158 = _2156 + 1.0;
    float _2160 = fma(_1457, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2150);
    float _2162 = _1968 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2164 = fma(_1946, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2152);
    float _2166 = _2160 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2168 = fma(_1946, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2162);
    float _2170 = abs(_2158);
    float _2172 = log2(_2170);
    float _2174 = fma(_1457, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2164);
    float _2176 = _2166 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2178 = fma(_1457, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2168);
    float _2180 = _1968 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2182 = _2174 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2184 = -_2176;
    float _2186 = fma(_2184, _1878, 1.0);
    float _2188 = _2178 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2190 = _2154 * _2102;
    float _2192 = _2182 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2194 = _2154 * _2130;
    float _2196 = _2154 * _2110;
    float _2198 = _2190 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2200 = fma(_2188, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2192);
    float _2202 = fma(_1946, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2180);
    float _2204 = floor(_2140);
    float _2206 = _2172 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2208 = -_2198;
    float _2210 = fma(_2194, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2208);
    float _2212 = fma(_1457, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2202);
    float _2214 = fma(_2166, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2200);
    float _2216 = _2182 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2218 = -_2196;
    float _2220 = fma(_2218, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2210);
    float _2222 = _2212 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2224 = exp2(_2206);
    float _2226 = fma(_2220, -0.5, 0.5);
    float _2228 = fma(_2220, 0.5, 0.5);
    float _2230 = fma(_2222, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2214);
    float _2232 = _2194 + 1.0;
    float _2234 = _2182 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2236 = fma(_2228, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2238 = 1.0 / _2230;
    float _2240 = -_2204;
    float _2242 = _2140 + _2240;
    float _2244 = fma(_2188, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2234);
    float _2246 = fma(_2166, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2244);
    float _2248 = log2(_2186);
    float _2250 = -_2194;
    float _2252 = fma(_2224, _2232, _2250);
    float _2254 = fma(_2228, _2236, -0.212114393711090087890625);
    float _2256 = fma(_2188, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2216);
    int _2258 = ~_1487;
    int _2260 = _2258 + 1;
    float _2262 = fma(_2228, _2254, 1.570728778839111328125);
    float _2264 = fma(_2166, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2256);
    float _2266 = sqrt(_2226);
    float _2268 = fma(_2222, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2264);
    float _2270 = _2268 * _2238;
    float _2272 = trunc(_1942);
    float _2274 = precise::max(_2272, 0.0);
    uint _2276 = uint(_2274);
    float _2278 = _2248 * 0.693147182464599609375;
    float2 _7139 = float2(_2136, _2242);
    float _2280 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7139, float2(0.0), isnan(_7139)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7139, float2(0.0), isnan(_7139)), level(0.0)).x;
    float _2282 = _2278 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2284 = _2266 * 0.636619746685028076171875;
    float _2286 = fma(_2222, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2246);
    float _2288 = trunc(_1948);
    float _2290 = precise::max(_2288, 0.0);
    uint _2292 = uint(_2290);
    float _2294 = fma(_2270, 0.5, 0.5);
    float _2296 = -_2262;
    float _2298 = fma(_2284, _2296, 1.0);
    float _2300 = _2286 * _2238;
    int _2302 = _2260 * _1958;
    int _2304 = _2302 + _1850;
    float _2306 = fma(_2300, -0.5, 0.5);
    float _2308 = fma(_2252, 0.5, 0.5);
    float3 _7186 = float3(_2294, _2306, _2282);
    float _2310 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7186, float3(0.0), isnan(_7186)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7186, float3(0.0), isnan(_7186)), level(0.0)).x;
    float3 _7197 = float3(_2294, _2306, _2282);
    float4 _2313 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7197, float3(0.0), isnan(_7197)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7197, float3(0.0), isnan(_7197)), level(0.0)).xyzw;
    float _2315 = _2313.x;
    float _2317 = _2313.y;
    float _2319 = _2313.z;
    float _2321 = _2313.w;
    float2 _7213 = float2(_2298, _2308);
    float3 _2325 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7213, float2(0.0), isnan(_7213)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7213, float2(0.0), isnan(_7213)), level(0.0)).xyz;
    float _2327 = _2325.x;
    float _2329 = _2325.y;
    float _2331 = _2325.z;
    bool _2333 = uint(_2304) >= uint(_1487);
    float _2335 = fma(_1445, 100.0, _447);
    bool _2337 = !_1632;
    int _2339 = _2337 ? _1952 : (-1);
    float _2341 = _2172 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2343 = !_2333;
    int _2345 = _2343 ? 0 : (-1);
    float _2347 = -_1079;
    float _2349 = fma(_2347, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2335);
    bool _2351 = _407 > 0.5;
    float _2353 = -_715;
    float _2355 = _2353 + 1.0;
    int _2357 = ~_1958;
    int _2359 = _2357 + _2345;
    int _2361 = _2359 + 1;
    float _2363 = _2349 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    int _2365 = _2339 & 3;
    bool _2367 = _2365 != 0;
    float _2369 = -_729;
    float _2371 = _2369 + 1.0;
    int _2373 = _2339 >> 31;
    int _2375 = _1487 * _2361;
    int _2377 = _2375 + _1850;
    bool _2379 = uint(_2365) > 1u;
    float _2381 = exp2(_2341);
    int _2383 = int(_1876) + int(_2276);
    float _2385 = _2182 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2387 = ~_1449;
    int _2389 = _2387 + 1;
    out.m_72.x = _1946;
    out.m_72.y = _1968;
    out.m_72.z = _1457;
    int _2391 = _2339 & 3;
    bool _2393 = _2391 != 0;
    float _2395 = fma(_2188, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2385);
    int _2397 = _2373 & 3;
    int _2399 = _2389 * _2383;
    int _2401 = _2399 + _1718;
    bool _2403 = !_1772;
    int _2405 = _2403 ? _2377 : (-1);
    int _2407 = _2393 ? 0 : 1;
    bool _2409 = _2365 != 3;
    bool _2411 = uint(_2365) >= 2u;
    float _2413 = -_2381;
    float _2415 = _2413 + 1.0;
    int _2417 = _2339 + _2397;
    int _2419 = _2405 >> 31;
    float _2421 = _2415 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _2423 = _2411 ? 0 : 1;
    int _2425 = ~_2407;
    int _2427 = _2425 + 1;
    int _2429 = _2427 + 1;
    bool _2431 = uint(_2401) >= uint(_1449);
    int _2433 = _2429;
    float _2435 = _2230;
    float _2437 = _2286;
    float _2439 = _2268;
    if (!_2379)
    {
        int _2441 = ~_2407;
        int _2443 = _2441 + 1;
        _2433 = _2443;
    }
    int _2445 = _2433;
    int _2447 = _2419 & 3;
    float _2449 = in.m_64.w;
    int _2451 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2453 = _2451 != 0;
    bool _2455 = !_2431;
    int _2457 = _2455 ? 0 : (-1);
    int _2459 = _2405 + _2447;
    bool _2461 = !_2453;
    int _2463 = _2461 ? 0 : 1;
    int _2465 = _2405 & 3;
    bool _2467 = _2465 != 0;
    int _2469 = _2405 & 3;
    bool _2471 = _2469 != 0;
    int _2473 = ~_2423;
    int _2475 = _2473 + 1;
    int _2477 = _2475 + 1;
    int _2479 = _2477;
    if (_2409)
    {
        int _2481 = ~_2423;
        int _2483 = _2481 + 1;
        _2479 = _2483;
    }
    int _2485 = _2479;
    int _2487 = _2459 >> 2;
    int _2489 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2491 = _2489 != 0;
    bool _2493 = !_2367;
    int _2495 = _2493 ? 0 : 1;
    bool _2497 = uint(_2469) >= 2u;
    int _2499 = int(_1844) + int(_2292);
    int _2501 = ~_1487;
    int _2503 = _2501 + 1;
    int _2505 = _2487 << 4;
    int _2507 = _2505 + 512;
    bool _2509 = !_2491;
    int _2511 = _2509 ? 0 : 1;
    int _2513 = _2503 * _2499;
    int _2515 = _2513 + _1794;
    bool _2517 = uint(_2469) > 1u;
    int _2519 = _2417 >> 2;
    int _2521 = _2497 ? 0 : 1;
    bool _2523 = _2365 != 3;
    uint _2525 = uint(int(uint(_2507) >> uint(2)));
    uint _2527 = uint(int(uint(int(_2525)) >> uint(2)));
    int _2529 = int(_2525) & 3;
    float _2531 = (*spvDescriptorSet0.vp_c9)._m0[int(_2527)][_2529];
    int _2533 = int(_2525) + 1;
    uint _2535 = uint(int(uint(_2533) >> uint(2)));
    int _2537 = _2533 & 3;
    float _2539 = (*spvDescriptorSet0.vp_c9)._m0[int(_2535)][_2537];
    int _2541 = _2519 << 4;
    int _2543 = _2541 + 368;
    bool _2545 = !_2471;
    int _2547 = _2545 ? 0 : 1;
    bool _2549 = _2469 != 3;
    int _2551 = _2467 ? 0 : 1;
    bool _2553 = uint(_2515) >= uint(_1487);
    uint _2555 = uint(int(uint(_2543) >> uint(2)));
    uint _2557 = uint(int(uint(int(_2555)) >> uint(2)));
    int _2559 = int(_2555) & 3;
    float _2561 = (*spvDescriptorSet0.vp_c9)._m0[int(_2557)][_2559];
    int _2563 = int(_2555) + 1;
    uint _2565 = uint(int(uint(_2563) >> uint(2)));
    int _2567 = _2563 & 3;
    float _2569 = (*spvDescriptorSet0.vp_c9)._m0[int(_2565)][_2567];
    int _2571 = ~_2551;
    int _2573 = _2571 + 1;
    int _2575 = _2573 + 1;
    int _2577 = _2575;
    if (!_2517)
    {
        int _2579 = ~_2551;
        int _2581 = _2579 + 1;
        _2577 = _2581;
    }
    int _2583 = _2577;
    bool _2585 = _2469 != 3;
    int _2587 = ~_2521;
    int _2589 = _2587 + 1;
    int _2591 = _2589 + 1;
    bool _2593 = !_2553;
    int _2595 = _2593 ? 0 : (-1);
    int _2597 = _2591;
    if (_2549)
    {
        int _2599 = ~_2521;
        int _2601 = _2599 + 1;
        _2597 = _2601;
    }
    int _2603 = _2597;
    bool _2605 = !_2523;
    int _2607 = _2605 ? 0 : (-1);
    bool _2609 = !_2585;
    int _2611 = _2609 ? 0 : (-1);
    int _2613 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2615 = _2613 != 0;
    int _2617 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2619 = _2617 != 0;
    int _2621 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2623 = _2621 != 0;
    int _2625 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2627 = _2625 != 0;
    float _2629 = -_331;
    int _2631 = _2351 ? as_type<int>(_2629) : as_type<int>(_331);
    float _2633 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    bool _2635 = _2449 > 0.5;
    int _2637 = _2543 + 8;
    uint _2639 = uint(int(uint(_2637) >> uint(2)));
    uint _2641 = uint(int(uint(int(_2639)) >> uint(2)));
    int _2643 = int(_2639) & 3;
    float _2645 = (*spvDescriptorSet0.vp_c9)._m0[int(_2641)][_2643];
    int _2647 = int(_2639) + 1;
    uint _2649 = uint(int(uint(_2647) >> uint(2)));
    int _2651 = _2647 & 3;
    float _2653 = (*spvDescriptorSet0.vp_c9)._m0[int(_2649)][_2651];
    float _2655 = _2633 * _395;
    float _2657 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _2659 = abs(_2445);
    float _2661 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _2663 = ~_2383;
    int _2665 = _2663 + _2457;
    int _2667 = _2665 + 1;
    int _2669 = _2507 + 8;
    uint _2671 = uint(int(uint(_2669) >> uint(2)));
    uint _2673 = uint(int(uint(int(_2671)) >> uint(2)));
    int _2675 = int(_2671) & 3;
    float _2677 = (*spvDescriptorSet0.vp_c9)._m0[int(_2673)][_2675];
    int _2679 = int(_2671) + 1;
    uint _2681 = uint(int(uint(_2679) >> uint(2)));
    int _2683 = _2679 & 3;
    float _2685 = (*spvDescriptorSet0.vp_c9)._m0[int(_2681)][_2683];
    float _2687 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2689 = trunc(_2655);
    int _2691 = int(_2689);
    int _2693 = _1449 * _2667;
    int _2695 = _2693 + _1718;
    float _2697 = _2687 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2699 = abs(_2583);
    float _2701 = _2657 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2703 = !_2619;
    float _2705 = _2703 ? _331 : as_type<float>(_2631);
    float _2707 = _2661 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2709 = _395 > 0.5;
    float _2711 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _2713 = ~_2699;
    int _2715 = _2713 + 1;
    int _2717 = _2715 + 1;
    int _2719 = abs(_2495);
    int _2721 = _2717 * as_type<int>(_2539);
    float _2723 = -_331;
    int _2725 = _2635 ? as_type<int>(_2723) : as_type<int>(_331);
    out.m_74.x = _2701;
    out.m_74.y = _2697;
    out.m_74.z = _2707;
    out.m_74.w = _2711;
    bool _2727 = _421 > 0.5;
    int _2729 = ~_2659;
    int _2731 = _2729 + 1;
    int _2733 = _2731 + 1;
    int _2735 = abs(_2547);
    int _2737 = _2733 * as_type<int>(_2569);
    int _2739 = ~_2719;
    int _2741 = _2739 + 1;
    int _2743 = _2741 + 1;
    int _2745 = _2691 << 4;
    int _2747 = _2745 + 1968;
    int _2749 = abs(_2485);
    int _2751 = _2743 * as_type<int>(_2561);
    int _2753 = _2751 + _2737;
    int _2755 = ~_2735;
    int _2757 = _2755 + 1;
    int _2759 = _2757 + 1;
    uint _2761 = uint(int(uint(_2747) >> uint(2)));
    uint _2763 = uint(int(uint(int(_2761)) >> uint(2)));
    int _2765 = int(_2761) & 3;
    float _2767 = (*spvDescriptorSet0.vp_c9)._m0[int(_2763)][_2765];
    int _2769 = int(_2761) + 1;
    uint _2771 = uint(int(uint(_2769) >> uint(2)));
    int _2773 = _2769 & 3;
    float _2775 = (*spvDescriptorSet0.vp_c9)._m0[int(_2771)][_2773];
    float _2777 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2779 = int(_2777);
    int _2781 = abs(_2603);
    int _2783 = _2759 * as_type<int>(_2531);
    int _2785 = _2783 + _2721;
    int _2787 = ~_2749;
    int _2789 = _2787 + 1;
    int _2791 = _2789 + 1;
    int _2793 = abs(_2611);
    int _2795 = _2747 + 8;
    uint _2797 = uint(int(uint(_2795) >> uint(2)));
    uint _2799 = uint(int(uint(int(_2797)) >> uint(2)));
    int _2801 = int(_2797) & 3;
    float _2803 = (*spvDescriptorSet0.vp_c9)._m0[int(_2799)][_2801];
    int _2805 = abs(_2607);
    float _2807 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2809 = int(_2807);
    int _2811 = _2791 * as_type<int>(_2645);
    int _2813 = _2811 + _2753;
    float _2815 = _327 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2817 = ~_2781;
    int _2819 = _2817 + 1;
    int _2821 = _2819 + 1;
    int _2823 = ~_2499;
    int _2825 = _2823 + _2595;
    int _2827 = _2825 + 1;
    int _2829 = ~_2805;
    int _2831 = _2829 + 1;
    int _2833 = _2831 + 1;
    int _2835 = _2821 * as_type<int>(_2677);
    int _2837 = _2835 + _2785;
    int _2839 = ~_2793;
    int _2841 = _2839 + 1;
    int _2843 = _2841 + 1;
    int _2845 = _1487 * _2827;
    int _2847 = _2845 + _1794;
    int _2849 = abs(_2463);
    int _2851 = _2833 * as_type<int>(_2653);
    int _2853 = _2851 + _2813;
    float _2855 = float(uint(_2779));
    int _2857 = _2843 * as_type<int>(_2685);
    int _2859 = _2857 + _2837;
    float _2861 = float(uint(_2809));
    float _2863 = 1.0 / _2855;
    int _2865 = abs(_2511);
    int _2867 = ~_2849;
    int _2869 = _2867 + 1;
    int _2871 = _2869 + 1;
    int _2873 = ~_2865;
    int _2875 = _2873 + 1;
    int _2877 = _2875 + 1;
    int _2879 = abs(_2779);
    float _2881 = 1.0 / _2861;
    int _2883 = _2853 * _2871;
    bool _2885 = !_1632;
    int _2887 = _2885 ? _2695 : (-1);
    int _2889 = _2859 * _2877;
    bool _2891 = !_1772;
    int _2893 = _2891 ? _2847 : (-1);
    int _2895 = abs(_2809);
    int _2897 = _2887 * _2849;
    int _2899 = _2897 + _2883;
    float _2901 = float(uint(_2879));
    int _2903 = _2893 * _2865;
    int _2905 = _2903 + _2889;
    float _2907 = _2767 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _2909 = as_type<int>(_2863) + (-2);
    float _2911 = _2775 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2913 = 1.0 / _2901;
    float _2915 = float(uint(_2895));
    float _2917 = _2907 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2919 = as_type<int>(_2881) + (-2);
    float _2921 = _2911 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2923 = float(uint(_2905));
    float _2925 = _2803 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2927 = float(uint(_2899));
    float _2929 = 1.0 / _2915;
    bool _2931 = !_2627;
    float _2933 = _2931 ? _331 : as_type<float>(_2725);
    float _2935 = _331 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2937 = -_327;
    int _2939 = _2727 ? as_type<int>(_2937) : as_type<int>(_327);
    float _2941 = as_type<float>(_2909) * _2927;
    float _2943 = _2925 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2945 = fma(_2935, _2935, 1.0);
    bool _2947 = !_2623;
    float _2949 = _2947 ? _327 : as_type<float>(_2939);
    float _2951 = as_type<float>(_2919) * _2923;
    float _2953 = trunc(_2941);
    float _2955 = precise::max(_2953, 0.0);
    uint _2957 = uint(_2955);
    int _2959 = abs(_2899);
    out.m_76.x = _2917;
    out.m_76.y = _2921;
    out.m_76.z = _2943;
    float _2961 = -_327;
    int _2963 = _2709 ? as_type<int>(_2961) : as_type<int>(_327);
    float _2965 = float(uint(_2959));
    bool _2967 = !_2615;
    float _2969 = _2967 ? _327 : as_type<float>(_2963);
    float _2971 = trunc(_2951);
    float _2973 = precise::max(_2971, 0.0);
    uint _2975 = uint(_2973);
    int _2977 = abs(_2905);
    int _2979 = ~_2809;
    int _2981 = _2979 + 1;
    int _2983 = ~_2779;
    int _2985 = _2983 + 1;
    int _2987 = as_type<int>(_2913) + (-2);
    float _2989 = rsqrt(_2945);
    int _2991 = as_type<int>(_2929) + (-2);
    float _2993 = -_1273;
    float _2995 = fma(_1283, _2815, _2993);
    float _2997 = float(uint(_2977));
    float _2999 = as_type<float>(_2987) * _2965;
    int _3001 = _2985 * int(_2957);
    int _3003 = _3001 + _2899;
    float _3005 = -_2935;
    float _3007 = fma(_1285, _3005, _2995);
    int _3009 = _2981 * int(_2975);
    int _3011 = _3009 + _2905;
    int _3013 = ~_2895;
    int _3015 = _3013 + 1;
    float _3017 = trunc(_2999);
    float _3019 = precise::max(_3017, 0.0);
    uint _3021 = uint(_3019);
    float _3023 = float(uint(_3011));
    float _3025 = -_2280;
    float _3027 = _3025 + 1.0;
    float _3029 = _2935 * _2989;
    float _3031 = -_2989;
    float _3033 = _1285 * _3031;
    float _3035 = as_type<float>(_2991) * _2997;
    float _3037 = float(uint(_3003));
    float _3039 = as_type<float>(_2919) * _3023;
    float _3041 = fma(_1273, _3029, _3033);
    float _3043 = trunc(_3035);
    float _3045 = precise::max(_3043, 0.0);
    uint _3047 = uint(_3045);
    int _3049 = ~_2879;
    int _3051 = _3049 + 1;
    float _3053 = as_type<float>(_2909) * _3037;
    float _3055 = fma(_1289, _2815, _1265);
    float _3057 = fma(_1299, _2815, _1267);
    float _3059 = trunc(_3053);
    float _3061 = precise::max(_3059, 0.0);
    uint _3063 = uint(_3061);
    float _3065 = -_2989;
    float _3067 = _1307 * _3065;
    int _3069 = _3051 * int(_3021);
    int _3071 = _3069 + _2959;
    float _3073 = -_2935;
    float _3075 = fma(_1295, _3073, _3055);
    float _3077 = -_2989;
    float _3079 = _1295 * _3077;
    float _3081 = -_2935;
    float _3083 = fma(_1307, _3081, _3057);
    float _3085 = -_3029;
    float _3087 = fma(_1267, _3085, _3067);
    float _3089 = float(uint(_3071));
    int _3091 = _3015 * int(_3047);
    int _3093 = _3091 + _2977;
    float _3095 = -_3029;
    float _3097 = fma(_1265, _3095, _3079);
    float _3099 = trunc(_3039);
    float _3101 = precise::max(_3099, 0.0);
    uint _3103 = uint(_3101);
    float _3105 = _1289 * _319;
    float _3107 = as_type<float>(_2987) * _3089;
    float _3109 = float(uint(_3093));
    float _3111 = _1289 * _309;
    float _3113 = _1289 * _323;
    float _3115 = fma(_1283, _281, _3105);
    float _3117 = _3097 * _319;
    float _3119 = trunc(_3107);
    float _3121 = precise::max(_3119, 0.0);
    uint _3123 = uint(_3121);
    float _3125 = as_type<float>(_2991) * _3109;
    float _3127 = fma(_1283, _277, _3111);
    float _3129 = fma(_1283, _291, _3113);
    float _3131 = fma(_1299, _339, _3115);
    float _3133 = _3075 * _323;
    float _3135 = fma(_1299, _335, _3127);
    float _3137 = fma(_1299, _343, _3129);
    float _3139 = trunc(_3125);
    float _3141 = precise::max(_3139, 0.0);
    uint _3143 = uint(_3141);
    float _3145 = _3075 * _319;
    int _3147 = ~_2809;
    int _3149 = _3147 + 1;
    float _3151 = _3075 * _309;
    float _3153 = _3097 * _309;
    float _3155 = _3097 * _323;
    out.m_78.x = _3131;
    out.m_78.y = _3135;
    out.m_78.z = _3137;
    int _3157 = int(_2957) + int(_3063);
    float _3159 = _2421 * _2310;
    int _3161 = ~_2879;
    int _3163 = _3161 + 1;
    float _3165 = fma(_3007, _277, _3151);
    int _3167 = int(_3021) + int(_3123);
    float _3169 = -_2421;
    float _3171 = _3169 + 1.0;
    int _3173 = ~_2779;
    int _3175 = _3173 + 1;
    int _3177 = int(_2975) + int(_3103);
    int _3179 = _3163 * _3167;
    int _3181 = _3179 + _2959;
    int _3183 = int(_3047) + int(_3143);
    int _3185 = _3175 * _3157;
    int _3187 = _3185 + _2899;
    float _3189 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _3191 = ~_2895;
    int _3193 = _3191 + 1;
    float _3195 = fma(_3041, _277, _3153);
    bool _3197 = uint(_3187) >= uint(_2779);
    int _3199 = _3149 * _3177;
    int _3201 = _3199 + _2905;
    bool _3203 = uint(_3181) >= uint(_2879);
    int _3205 = _3193 * _3183;
    int _3207 = _3205 + _2977;
    bool _3209 = !_3197;
    int _3211 = _3209 ? 0 : (-1);
    float _3213 = fma(_3041, _281, _3117);
    bool _3215 = uint(_3201) >= uint(_2809);
    float _3217 = fma(_3041, _291, _3155);
    int _3219 = ~_3157;
    int _3221 = _3219 + _3211;
    int _3223 = _3221 + 1;
    float _3225 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _3227 = !_3215;
    int _3229 = _3227 ? 0 : (-1);
    bool _3231 = uint(_3207) >= uint(_2895);
    int _3233 = ~_3177;
    int _3235 = _3233 + _3229;
    int _3237 = _3235 + 1;
    int _3239 = _2899 ^ _2779;
    int _3241 = _2905 ^ _2809;
    int _3243 = _2809 * _3237;
    int _3245 = _3243 + _2905;
    bool _3247 = _2779 == 0;
    bool _3249 = _2779 == 0;
    int _3251 = _2779 * _3223;
    int _3253 = _3251 + _2899;
    bool _3255 = !_3203;
    int _3257 = _3255 ? 0 : (-1);
    float _3259 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _3261 = !_3231;
    int _3263 = _3261 ? 0 : (-1);
    uint _3265 = uint(int(uint(_3239) >> uint(31)));
    uint _3267 = uint(int(uint(_3241) >> uint(31)));
    int _3269 = ~_3257;
    int _3271 = _3167 + _3269;
    int _3273 = _3271 + 1;
    int _3275 = ~_3263;
    int _3277 = _3183 + _3275;
    int _3279 = _3277 + 1;
    int _3281 = ~int(_3265);
    int _3283 = _3281 + 1;
    int _3285 = ~int(_3267);
    int _3287 = _3285 + 1;
    float _3289 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _3291 = _3273 ^ _3283;
    float _3293 = _3259 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _3295 = _3279 ^ _3287;
    int _3297 = ~_3283;
    int _3299 = _3297 + _3291;
    int _3301 = _3299 + 1;
    float _3303 = _3189 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _3305 = _2809 == 0;
    int _3307 = ~_3287;
    int _3309 = _3307 + _3295;
    int _3311 = _3309 + 1;
    bool _3313 = _2809 == 0;
    float _3315 = _3225 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _3317 = !_3247;
    int _3319 = _3317 ? _3253 : (-1);
    bool _3321 = !_3249;
    int _3323 = _3321 ? _3301 : (-1);
    float _3325 = _3289 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _3327 = !_3305;
    int _3329 = _3327 ? _3311 : (-1);
    float _3331 = _2331 * _3159;
    float _3333 = float(_3319);
    float _3335 = fma(_3083, _335, _3165);
    float _3337 = float(_3323);
    float _3339 = float(_3329);
    float _3341 = fma(_3303, _3333, _531);
    bool _3343 = !_3313;
    int _3345 = _3343 ? _3245 : (-1);
    float _3347 = -_533;
    float _3349 = fma(_3315, _3337, _3347);
    float _3351 = _2969 + 0.5;
    float _3353 = -_731;
    float _3355 = fma(_3325, _3339, _3353);
    float _3357 = _2705 + (-0.5);
    float _3359 = float(_3345);
    float _3361 = fma(_3303, _3351, _3341);
    float _3363 = fma(_3087, _339, _3213);
    float _3365 = -_3315;
    float _3367 = fma(_3365, _3357, _3349);
    float _3369 = -_719;
    float _3371 = _3369 + 1.0;
    float _3373 = fma(_3293, _3359, _665);
    float _3375 = _2949 + 0.5;
    float _3377 = fma(_3087, _335, _3195);
    float _3379 = -_3371;
    float _3381 = fma(_2969, _3379, _3361);
    float _3383 = fma(_3007, _281, _3145);
    float _3385 = fma(_3293, _3375, _3373);
    float _3387 = -_577;
    float _3389 = _3387 + 1.0;
    float _3391 = fma(_3087, _343, _3217);
    float _3393 = fma(_3083, _339, _3383);
    float _3395 = fma(_1469, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2363);
    float _3397 = _2349 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3399 = _2933 + (-0.5);
    out.m_80.x = _3363;
    out.m_80.y = _3377;
    out.m_80.z = _3391;
    float _3401 = fma(_1465, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3395);
    float _3403 = fma(_1469, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3397);
    float _3405 = -_3325;
    float _3407 = fma(_3405, _3399, _3355);
    float _3409 = -_3389;
    float _3411 = fma(_2949, _3409, _3385);
    float _3413 = fma(_2705, _2355, _3367);
    float _3415 = fma(_1465, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3403);
    float _3417 = fma(_2933, _2371, _3407);
    float _3419 = in.m_66.x;
    float _3421 = fma(_3007, _291, _3133);
    float _3423 = _3415 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3425 = _2321 * _3171;
    float _3427 = _3401 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    out.m_82.x = _3381;
    out.m_82.y = _3413;
    out.m_82.z = _3411;
    out.m_82.w = _3417;
    float _3429 = 1.0 / _3427;
    float _3431 = _3423 + _3427;
    float _3433 = fma(_3083, _343, _3421);
    bool _3435 = _1982 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3437 = isnan(_1982);
    bool _3439 = _3435 || _3437;
    bool _3441 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3443 = _3439 || _3441;
    out.m_84.x = _3393;
    out.m_84.y = _3335;
    out.m_84.z = _3433;
    float _3445 = _2230 * 0.5;
    float _3447 = _3431 * _3429;
    float _3449 = _3447 * 0.5;
    float _3451 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3453 = fma(_3449, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3451);
    float _3455 = 1.0 / _3453;
    float _3457 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3459 = _3455 * _3457;
    float _3461 = abs(_3459);
    float _3463 = log2(_3461);
    bool _3465 = _3459 <= 8000.0;
    bool _3467 = isnan(_3459);
    bool _3469 = _3465 || _3467;
    bool _3471 = isnan(8000.0);
    bool _3473 = _3469 || _3471;
    float _3475 = float(_3473);
    float _3477 = fma(_2286, -0.5, _3445);
    float _3479 = _3463 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3481 = exp2(_3479);
    float _3483 = fma(_3481, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3485 = precise::clamp(_3483, 0.0, 1.0);
    float _3487 = _2268 + _2230;
    float _3489 = fma(_3485, -2.0, 3.0);
    float _3491 = _3485 * _3485;
    float _3493 = _3491 * _3489;
    float _3495 = fma(_2166, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2395);
    float _3497 = -_3493;
    float _3499 = _3497 + 1.0;
    float _3501 = fma(_2222, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3495);
    float _3503 = fma(_3499, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3493);
    float _3505 = _3487 * 0.5;
    float _3507 = _2321 * _3159;
    float _3509 = _3501 + _2230;
    float _3511 = _3475 * _3503;
    float _3513 = fma(_2327, _3507, _2315);
    float _3515 = fma(_2329, _3507, _2317);
    float _3517 = _3511 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3519 = _3509 * 0.5;
    out.gl_Position.x = _2268;
    out.gl_Position.y = _2286;
    out.gl_Position.z = _3501;
    out.gl_Position.w = _2230;
    float _3521 = _3507;
    float _3523 = _3501;
    float _3525 = _3505;
    if (!_3443)
    {
        _3521 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3527 = _3521;
    float _3529 = _3027 * _3517;
    float _3531 = precise::clamp(_3529, 0.0, 1.0);
    out.m_86.x = _3505;
    out.m_86.y = _3477;
    out.m_86.z = _3519;
    out.m_86.w = _2230;
    float _3533 = -_3531;
    float _3535 = fma(_3533, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3537 = _3535 * _3419;
    float _3539 = fma(_2321, _3331, _2319);
    float _3541 = _3537 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3543 = _3527;
    float _3545 = _3527;
    if (!_3443)
    {
        _2435 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3547 = _2435;
    out.m_88.x = _3513;
    out.m_88.y = _3515;
    out.m_88.z = _3539;
    out.m_88.w = _3425;
    float _3549 = _3547;
    float _3551 = _3547;
    if (!_3443)
    {
        _3523 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3553 = _3523;
    float _3555 = _3553;
    float _3557 = _3553;
    if (!_3443)
    {
        _3525 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3559 = _3525;
    out.m_90.x = _3541;
    float _3561 = _3559;
    float _3563 = _3559;
    if (!_3443)
    {
        _2437 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3565 = _2437;
    float _3567 = _3565;
    float _3569 = _3565;
    if (!_3443)
    {
        _2439 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3571 = _2439;
    bool _3573 = !_3443;
    float _3575 = _3571;
    float _3577 = _3571;
    if (!_3573)
    {
        bool _3579 = _1982 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3581 = isnan(_1982);
        bool _3583 = _3579 || _3581;
        bool _3585 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3587 = _3583 || _3585;
        if (!_3587)
        {
            float _3589 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3591 = _1982 + _3589;
            float _3593 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3595 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3593;
            float _3597 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3599 = _3597 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3601 = 1.0 / _3595;
            float _3603 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3605 = _3603 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3607 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3609 = _3607 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3611 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3613 = _3611 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3615 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3617 = _3615 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3619 = _3591 * _3601;
            float _3621 = precise::clamp(_3619, 0.0, 1.0);
            float _3623 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3625 = _3623 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3627 = fma(_3621, _3599, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3629 = fma(_3621, _3625, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3631 = fma(_3621, _3605, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3633 = fma(_3621, _3609, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3635 = fma(_3621, _3613, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3637 = fma(_3621, _3617, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3551 = _3631;
            _3577 = _3635;
            _3563 = _3627;
            _3569 = _3633;
            _3557 = _3629;
            _3545 = _3637;
            _3639 = true;
        }
        else
        {
            bool _3641 = _1982 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3643 = isnan(_1982);
            bool _3645 = _3641 || _3643;
            bool _3647 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3649 = _3645 || _3647;
            if (!_3649)
            {
                _3561 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3651 = _3561;
            _3563 = _3651;
            if (!_3649)
            {
                _3549 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3653 = _3549;
            _3551 = _3653;
            if (!_3649)
            {
                _3555 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3655 = _3555;
            _3557 = _3655;
            if (!_3649)
            {
                _3567 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3657 = _3567;
            _3569 = _3657;
            if (!_3649)
            {
                _3575 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3659 = _3575;
            _3577 = _3659;
            if (!_3649)
            {
                _3543 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3661 = _3543;
            bool _3663 = !_3649;
            _3545 = _3661;
            if (!_3663)
            {
                bool _3665 = _1982 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3667 = isnan(_1982);
                bool _3669 = _3665 || _3667;
                bool _3671 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3673 = _3669 || _3671;
                if (!_3673)
                {
                    float _3675 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3677 = _1982 + _3675;
                    float _3679 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3681 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3679;
                    float _3683 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3685 = _3683 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3687 = 1.0 / _3681;
                    float _3689 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3691 = _3689 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3693 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3695 = _3693 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3697 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3699 = _3697 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3701 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3703 = _3701 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3705 = _3677 * _3687;
                    float _3707 = precise::clamp(_3705, 0.0, 1.0);
                    float _3709 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3711 = _3709 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3713 = fma(_3707, _3685, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3715 = fma(_3707, _3711, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3717 = fma(_3707, _3691, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3719 = fma(_3707, _3695, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3721 = fma(_3707, _3699, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3723 = fma(_3707, _3703, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3551 = _3717;
                    _3577 = _3721;
                    _3563 = _3713;
                    _3569 = _3719;
                    _3557 = _3715;
                    _3545 = _3723;
                    _3639 = true;
                }
                else
                {
                    _3551 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3577 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3563 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3569 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3557 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3545 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3639 = false;
    float _3725 = _3551;
    float _3727 = _3577;
    float _3729 = _3563;
    float _3731 = _3569;
    float _3733 = _3557;
    float _3735 = _3545;
    float _3737 = fma(_3335, -0.5, 0.5);
    float _3739 = precise::clamp(_3737, 0.0, 1.0);
    float _3741 = -_3725;
    float _3743 = _3741 + _3727;
    float _3745 = -_3729;
    float _3747 = _3745 + _3731;
    float _3749 = -_3733;
    float _3751 = _3749 + _3735;
    bool _3753 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3755 = fma(_3739, _3743, _3725);
    float _3757 = fma(_3739, _3747, _3729);
    float _3759 = fma(_3739, _3751, _3733);
    float _3761 = _3755 * 0.586610972881317138671875;
    out.m_92.x = 0.0;
    float _3763 = fma(_3757, 0.298911988735198974609375, _3761);
    float _3765 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3767 = fma(_3759, 0.114477999508380889892578125, _3763);
    out.m_51.x = _3765;
    float _3769 = -_3767;
    float _3771 = _3757 + _3769;
    float _3773 = -_3767;
    float _3775 = _3755 + _3773;
    float _3777 = -_3767;
    float _3779 = _3759 + _3777;
    float _3781 = fma(_3771, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3767);
    float _3783 = fma(_3775, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3767);
    float _3785 = fma(_3779, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3767);
    out.m_94.x = _3781;
    out.m_94.y = _3783;
    out.m_94.z = _3785;
    if (!_3753)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3787 = -_1968;
    float _3789 = _3787 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3791 = -_1946;
    float _3793 = _3791 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3795 = -_1457;
    float _3797 = _3795 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3799 = _3789 * _3789;
    float _3801 = fma(_3793, _3793, _3799);
    float _3803 = fma(_3797, _3797, _3801);
    float _3805 = sqrt(_3803);
    float _3807 = rsqrt(_3803);
    float _3809 = -_3805;
    float _3811 = _3809 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3813 = _3811 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3815 = precise::clamp(_3813, 0.0, 1.0);
    float _3817 = _3793 * _3807;
    float _3819 = _3789 * _3807;
    float _3821 = abs(_3815);
    float _3823 = log2(_3821);
    float _3825 = _3797 * _3807;
    float _3827 = _3817 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3829 = _3335 * _3819;
    float _3831 = -_3819;
    float _3833 = -_3827;
    float _3835 = fma(_3831, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3833);
    float _3837 = fma(_3393, _3817, _3829);
    float _3839 = -_3825;
    float _3841 = fma(_3839, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3835);
    float _3843 = fma(_3433, _3825, _3837);
    float _3845 = precise::clamp(_3843, 0.0, 1.0);
    float _3847 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3849 = _3841 + _3847;
    float _3851 = _3823 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3853 = _3849 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3855 = precise::clamp(_3853, 0.0, 1.0);
    float _3857 = exp2(_3851);
    float _3859 = _3857 * _3855;
    float _3861 = _3845 * _3859;
    float _3863 = _3861 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3865 = _3861 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3867 = _3861 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_92.x = _3863;
    out.m_92.y = _3865;
    out.m_92.z = _3867;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3639 = false;
    bool _365 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _108 = in.m_48.w;
    float _110 = trunc(_108);
    int _113 = int(_110);
    bool _117 = _113 >= 1;
    float _119 = 0.0;
    if (!_117)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _121 = _119;
    float _123 = _121;
    if (!_117)
    {
        out.m_51.x = 0.0;
    }
    int _125 = 0;
    if (!_117)
    {
        float _127 = _121 * 5.0;
        _125 = as_type<int>(_127);
    }
    int _129 = _125;
    int _131 = _129;
    if (!_117)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3924 = as_type<float>(_129);
        out.gl_Position.z = _3924;
    }
    if (!_117)
    {
        return out;
    }
    float _133 = in.m_53.w;
    bool _135 = _133 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _137 = isnan(_133);
    bool _139 = _135 || _137;
    bool _141 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _143 = _139 || _141;
    float _145 = -_133;
    float _147 = _145 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _149 = _147;
    if (_143)
    {
        float _151 = float(_113);
        _123 = _151;
    }
    float _153 = _123;
    bool _155 = _147 >= _153;
    bool _157 = !_143;
    bool _159 = _155 || _157;
    float _161 = _153;
    if (_159)
    {
        _161 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _163 = _161;
    if (_159)
    {
        out.m_51.x = 0.0;
    }
    if (_159)
    {
        float _165 = _163 * 5.0;
        _131 = as_type<int>(_165);
    }
    int _167 = _131;
    if (_159)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3994 = as_type<float>(_167);
        out.gl_Position.z = _3994;
    }
    if (_159)
    {
        return out;
    }
    float _169 = in.m_55.x;
    float _171 = in.m_55.y;
    float _173 = in.m_55.z;
    float _175 = in.m_57.x;
    float _177 = in.m_57.y;
    float _179 = in.m_57.z;
    float _181 = in.m_59.x;
    float _183 = in.m_59.y;
    float _185 = in.m_59.z;
    float _187 = as_type<float>(int(gl_VertexIndex));
    float _189 = _169 * _169;
    float _191 = _171 * _171;
    float _193 = _173 * _173;
    float _195 = fma(_175, _175, _189);
    float _197 = fma(_177, _177, _191);
    float _199 = fma(_179, _179, _193);
    float _201 = fma(_181, _181, _195);
    float _203 = fma(_183, _183, _197);
    float _205 = fma(_185, _185, _199);
    float _207 = sqrt(_201);
    float _209 = sqrt(_203);
    bool _211 = _207 > 0.0;
    float _213 = sqrt(_205);
    bool _215 = _209 > 0.0;
    float _217 = _201;
    if (_211)
    {
        float _219 = rsqrt(_201);
        _217 = _219;
    }
    float _221 = _217;
    float _223 = 0.0;
    float _225 = 0.0;
    if (!_211)
    {
        _223 = 0.0;
        _225 = 0.0;
    }
    float _227 = _223;
    float _229 = _225;
    float _231 = 0.0;
    float _233 = _229;
    float _235 = _227;
    if (!_211)
    {
        _231 = 0.0;
    }
    float _237 = _231;
    bool _239 = _213 > 0.0;
    float _241 = _213;
    float _243 = _237;
    if (_215)
    {
        float _245 = rsqrt(_203);
        _241 = _245;
    }
    float _247 = _241;
    int _249 = as_type<int>(_187) & 1;
    bool _251 = _249 != 0;
    int _253 = as_type<int>(_187) & 2;
    bool _255 = _253 != 0;
    float _257 = 0.0;
    if (!_215)
    {
        _257 = 0.0;
    }
    float _259 = _257;
    float _261 = 0.0;
    float _263 = _259;
    if (!_215)
    {
        _261 = 0.0;
    }
    float _265 = _261;
    float _267 = 0.0;
    float _269 = _265;
    if (!_215)
    {
        _267 = 0.0;
    }
    float _271 = _267;
    float _273 = _271;
    if (_211)
    {
        float _275 = _221 * _169;
        _233 = _275;
    }
    float _277 = _233;
    if (_211)
    {
        float _279 = _221 * _175;
        _243 = _279;
    }
    float _281 = _243;
    float _283 = _209;
    if (_239)
    {
        float _285 = rsqrt(_205);
        _283 = _285;
    }
    float _287 = _283;
    if (_211)
    {
        float _289 = _221 * _181;
        _235 = _289;
    }
    float _291 = _235;
    bool _293 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _295 = 0.0;
    if (!_239)
    {
        _295 = 0.0;
    }
    float _297 = _295;
    float _299 = 0.0;
    float _301 = _297;
    if (!_239)
    {
        _299 = 0.0;
    }
    float _303 = _299;
    float _305 = _303;
    if (_215)
    {
        float _307 = _247 * _171;
        _263 = _307;
    }
    float _309 = _263;
    float _311 = 0.0;
    if (!_239)
    {
        _311 = 0.0;
    }
    float _313 = _311;
    float _315 = _313;
    if (_215)
    {
        float _317 = _247 * _177;
        _269 = _317;
    }
    float _319 = _269;
    if (_215)
    {
        float _321 = _247 * _183;
        _273 = _321;
    }
    float _323 = _273;
    bool _325 = !_251;
    float _327 = _325 ? (-0.5) : 0.5;
    bool _329 = !_255;
    float _331 = _329 ? (-0.5) : 0.5;
    if (_239)
    {
        float _333 = _287 * _173;
        _301 = _333;
    }
    float _335 = _301;
    if (_239)
    {
        float _337 = _287 * _179;
        _305 = _337;
    }
    float _339 = _305;
    if (_239)
    {
        float _341 = _287 * _185;
        _315 = _341;
    }
    float _343 = _315;
    bool _345 = !_293;
    float _363;
    if (!_345)
    {
        float _347 = in.m_64.x;
        float _349 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _351 = _347 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _353 = fma(_351, (*spvDescriptorSet0.vp_c9)._m0[12].x, _147);
        float _355 = _353 * _349;
        float _357 = floor(_355);
        float _359 = -_357;
        float _361 = _355 + _359;
        _363 = _361;
        _365 = true;
    }
    else
    {
        float _367 = float(_113);
        float _369 = 1.0 / _367;
        float _371 = _147 * _369;
        _363 = _371;
    }
    _365 = false;
    float _373 = _363;
    float _375 = in.m_48.x;
    float _377 = in.m_48.y;
    float _379 = in.m_48.z;
    float _381 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _383 = log2(_381);
    float _385 = in.m_66.y;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _389 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _387;
    float _391 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _393 = _391 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _395 = in.m_64.x;
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _399 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _397;
    float _401 = 1.0 / _389;
    float _403 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _405 = _403 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _407 = in.m_64.y;
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _411 = _373 + _409;
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _415 = _373 + _413;
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _419 = _373 + _417;
    float _421 = in.m_64.z;
    bool _423 = _373 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _425 = isnan(_373);
    bool _427 = _423 || _425;
    bool _429 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _431 = _427 || _429;
    float _433 = float(_431);
    float _435 = 1.0 / _399;
    float _437 = _383 * _147;
    float _439 = in.m_57.w;
    float _441 = _177 * _377;
    float _443 = _183 * _377;
    float _445 = 1.0 / _393;
    float _447 = _377 + _385;
    float _449 = fma(_175, _375, _441);
    float _451 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _453 = _395 * 2.0;
    int _455 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _457 = _455 != 0;
    float _459 = fma(_181, _375, _443);
    float _461 = 1.0 / _405;
    float _463 = _407 * 2.0;
    float _465 = _395 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _467 = fma(_185, _379, _459);
    float _469 = fma(_179, _379, _449);
    float _471 = -_451;
    float _473 = fma(_465, 2.0, _471);
    float _475 = floor(_453);
    float _477 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _479 = _407 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _481 = as_type<int>(_451);
    float _483 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    if (_457)
    {
        _481 = 0;
    }
    int _485 = _481;
    float _487 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _489 = _373 + _487;
    int _491 = _485;
    if (!_457)
    {
        _491 = 1;
    }
    int _493 = _491;
    float _495 = fma(_479, -2.0, _477);
    float _497 = floor(_463);
    bool _499 = _493 != 1;
    float _501 = _489 * _401;
    float _503 = float(_113);
    float _505 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _507 = _421 * 2.0;
    float _509 = _411 * _445;
    float _511 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _513 = int(_511);
    bool _515 = _475 > 0.0;
    float _517 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _519 = _475 >= 0.0;
    bool _521 = isnan(_475);
    bool _523 = _519 || _521;
    bool _525 = isnan(0.0);
    bool _527 = _523 || _525;
    float _529 = -_147;
    float _531 = fma(_529, (*spvDescriptorSet0.vp_c9)._m0[76].x, _473);
    float _533 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[76].y, _495);
    float _535 = as_type<float>(_493);
    if (!_499)
    {
        _535 = _407;
    }
    float _537 = _535;
    float _539 = _415 * _435;
    float _541 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _543 = int(_541);
    bool _545 = _497 > 0.0;
    float _547 = in.m_59.w;
    float _549 = _537;
    if (_499)
    {
        _549 = _395;
    }
    float _551 = _549;
    float _553 = _419 * _461;
    bool _555 = _497 >= 0.0;
    bool _557 = isnan(_497);
    bool _559 = _555 || _557;
    bool _561 = isnan(0.0);
    bool _563 = _559 || _561;
    float _565 = _469 + _439;
    int _567 = _527 ? 0 : 1;
    float _569 = fma(_551, (*spvDescriptorSet0.vp_c9)._m0[83].z, _505);
    int _571 = _563 ? 0 : 1;
    float _573 = 1.0 / _503;
    float _575 = float(_513);
    float _577 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].z, _569);
    float _579 = as_type<float>(_513);
    float _581 = _551;
    if (!_499)
    {
        _579 = _407;
    }
    float _583 = _579;
    float _585 = _583;
    if (_499)
    {
        _585 = _395;
    }
    float _587 = _585;
    int _589 = ~_567;
    int _591 = _589 + 1;
    int _593 = _591 + 1;
    float _595 = 1.0 / _575;
    int _597 = ~_571;
    int _599 = _597 + 1;
    int _601 = _599 + 1;
    float _603 = _587 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _605 = float(_543);
    int _607 = _593;
    int _609 = _601;
    float _611 = as_type<float>(_543);
    if (!_515)
    {
        int _613 = ~_567;
        int _615 = _613 + 1;
        _607 = _615;
    }
    int _617 = _607;
    if (!_545)
    {
        int _619 = ~_571;
        int _621 = _619 + 1;
        _609 = _621;
    }
    int _623 = _609;
    float _625 = exp2(_437);
    if (!_499)
    {
        _611 = _421;
    }
    float _627 = _611;
    float _629 = _573 * _147;
    float _631 = _467 + _547;
    float _633 = _627;
    if (_499)
    {
        _633 = _407;
    }
    float _635 = _633;
    float _637 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    if (!_499)
    {
        _581 = _421;
    }
    float _639 = _581;
    float _641 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _643 = _639;
    if (_499)
    {
        _643 = _407;
    }
    float _645 = _643;
    float _647 = _635 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _649 = 1.0 / _605;
    float _651 = -_637;
    float _653 = fma(_603, 2.0, _651);
    float _655 = fma(_645, (*spvDescriptorSet0.vp_c9)._m0[83].w, _517);
    float _657 = fma(_647, -2.0, _641);
    float _659 = -_625;
    float _661 = _659 + 1.0;
    float _663 = -_147;
    float _665 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[81].x, _653);
    float _667 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _669 = 1.0 + _667;
    bool _671 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _673 = isnan(0.0);
    bool _675 = _671 || _673;
    bool _677 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _679 = _675 || _677;
    float _681 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _683 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _685 = 1.0 / _669;
    int _687 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _689 = _687 != 0;
    int _691 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _693 = _691 != 0;
    int _695 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _697 = _695 != 0;
    float _699 = fma(_407, (*spvDescriptorSet0.vp_c9)._m0[78].w, _681);
    bool _701 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _703 = isnan(1.0);
    bool _705 = _701 || _703;
    bool _707 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _709 = _705 || _707;
    float _711 = fma(_395, (*spvDescriptorSet0.vp_c9)._m0[78].z, _683);
    float _713 = _679 ? _661 : 0.0;
    float _715 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].w, _699);
    float _717 = _395 + _407;
    float _719 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].z, _711);
    float _721 = _395 + _421;
    float _723 = floor(_507);
    float _725 = _649 * _147;
    float _727 = _595 * _147;
    float _729 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].w, _655);
    float _731 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[81].y, _657);
    float _733 = _717 + (-1.0);
    if (_709)
    {
        float _735 = _713 * _685;
        _149 = _735;
    }
    float _737 = _149;
    float _739 = _721 + (-1.0);
    int _741 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _743 = _741 != 0;
    int _745 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _747 = _745 != 0;
    int _749 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _751 = _749 != 0;
    int _753 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _755 = _753 != 0;
    float _757 = fma(_733, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _759 = _421 + _407;
    float _761 = fma(_739, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _763 = !_693;
    int _765 = _763 ? 0 : 1;
    float _767 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].y;
    bool _769 = !_689;
    int _771 = _769 ? 0 : 1;
    float _773 = _759 + (-1.0);
    bool _775 = !_697;
    int _777 = _775 ? 0 : 1;
    int _779 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _781 = _779 != 0;
    int _783 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _785 = _783 != 0;
    int _787 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _789 = _787 != 0;
    float _791 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _793 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _791;
    bool _795 = !_747;
    int _797 = _795 ? 0 : 1;
    float _799 = fma(_773, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _801 = !_743;
    int _803 = _801 ? 0 : 1;
    float _805 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _807 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _805;
    int _809 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 65536;
    bool _811 = _809 != 0;
    int _813 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 131072;
    bool _815 = _813 != 0;
    float _817 = fma(_793, _501, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _819 = !_781;
    int _821 = _819 ? 0 : 1;
    float _823 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _825 = _823 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _827 = _723 >= 0.0;
    bool _829 = isnan(_723);
    bool _831 = _827 || _829;
    bool _833 = isnan(0.0);
    bool _835 = _831 || _833;
    float _837 = fma(_807, _501, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _839 = _373 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _841 = isnan(_373);
    bool _843 = _839 || _841;
    bool _845 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _847 = _843 || _845;
    float _849 = float(_847);
    float _851 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _853 = _851 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    int _855 = _835 ? 0 : 1;
    bool _857 = _723 > 0.0;
    float _859 = -_849;
    float _861 = _859 + 1.0;
    bool _863 = _373 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _865 = isnan(_373);
    bool _867 = _863 || _865;
    bool _869 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _871 = _867 || _869;
    float _873 = float(_871);
    float _875 = fma(_853, _509, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _877 = _373 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _879 = isnan(_373);
    bool _881 = _877 || _879;
    bool _883 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _885 = _881 || _883;
    float _887 = float(_885);
    float _889 = fma(_825, _509, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _891 = _373 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _893 = isnan(_373);
    bool _895 = _891 || _893;
    bool _897 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _899 = _895 || _897;
    float _901 = float(_899);
    float _903 = -_873;
    float _905 = _903 + 1.0;
    float _907 = _887 * _861;
    float _909 = -_887;
    float _911 = _909 + 1.0;
    float _913 = _737 + (*spvDescriptorSet0.vp_c9)._m0[202].y;
    float _915 = _901 * _905;
    float _917 = -_901;
    float _919 = _917 + 1.0;
    float _921 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _923 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _921;
    int _925 = ~_855;
    int _927 = _925 + 1;
    int _929 = _927 + 1;
    float _931 = _849 * _919;
    int _933 = _929;
    if (!_857)
    {
        int _935 = ~_855;
        int _937 = _935 + 1;
        _933 = _937;
    }
    int _939 = _933;
    float _941 = _913 * _767;
    int _943 = abs(_821);
    float _945 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _947 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _945;
    bool _949 = !_785;
    int _951 = _949 ? 0 : 1;
    float _953 = in.m_68.x;
    float _955 = in.m_68.y;
    float _957 = in.m_68.z;
    float _959 = fma(_923, _539, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _961 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _963 = _447 + _961;
    int _965 = abs(_951);
    float _967 = fma(_947, _539, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    bool _969 = !_789;
    int _971 = _969 ? 0 : 1;
    float _973 = fma(_395, (*spvDescriptorSet0.vp_c9)._m0[203].y, _941);
    float _975 = float(_943);
    float _977 = _963 * _963;
    float _979 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _981 = _565 + _979;
    float _983 = float(_939);
    float _985 = _973 + 0.25;
    int _987 = abs(_971);
    float _989 = _433 * _911;
    float _991 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _993 = _631 + _991;
    float _995 = fma(_981, _981, _977);
    float _997 = _975 * _983;
    float _999 = floor(_985);
    float _1001 = fma(_993, _993, _995);
    float _1003 = _837 * _989;
    float _1005 = _817 * _989;
    float _1007 = float(_617);
    float _1009 = _997 * (-2.0);
    float _1011 = float(_965);
    float _1013 = floor(_973);
    float _1015 = float(_623);
    float _1017 = _395 + (-0.5);
    float _1019 = float(_987);
    float _1021 = _1011 * _1007;
    float _1023 = fma(_1009, _953, _953);
    float _1025 = fma(_757, _1009, _757);
    int _1027 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 32768;
    bool _1029 = _1027 != 0;
    float _1031 = rsqrt(_1001);
    float _1033 = _1019 * _1015;
    float _1035 = _973 * 6.283185482025146484375;
    float _1037 = -_999;
    float _1039 = _985 + _1037;
    float _1041 = fma(_1017, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1023);
    bool _1043 = !_811;
    int _1045 = _1043 ? 0 : 1;
    float _1047 = _1035 * 0.15915493667125701904296875;
    float _1049 = _1021 * (-2.0);
    float _1051 = -_1013;
    float _1053 = _973 + _1051;
    bool _1055 = _1039 > 0.5;
    float _1057 = fma(_1025, _737, _1041);
    float _1059 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _1061 = _1059 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _1063 = _1047 * 6.283185482025146484375;
    float _1065 = sin(_1063);
    bool _1067 = _1053 >= 0.5;
    bool _1069 = isnan(_1053);
    bool _1071 = _1067 || _1069;
    bool _1073 = isnan(0.5);
    bool _1075 = _1071 || _1073;
    int _1077 = abs(_1045);
    float _1079 = _963 * _1031;
    bool _1081 = !_1029;
    int _1083 = _1081 ? 0 : 1;
    float _1085 = _981 * _1031;
    float _1087 = fma(_1061, _553, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _1089 = -_1079;
    float _1091 = fma(_1089, (*spvDescriptorSet0.vp_c9)._m0[18].w, _963);
    bool _1093 = !_1075;
    float _1095 = _1093 ? 0.5 : (-0.5);
    float _1097 = _1039;
    float _1099 = _1085;
    if (_1055)
    {
        float _1101 = -_1039;
        float _1103 = _1101 + 1.0;
        _1097 = _1103;
    }
    float _1105 = _1097;
    int _1107 = abs(_1083);
    float _1109 = _1091 * _1091;
    float _1111 = float(_1077);
    float _1113 = -_1085;
    float _1115 = fma(_1113, (*spvDescriptorSet0.vp_c9)._m0[18].w, _981);
    float _1117 = _1095 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    float _1119 = _1117 * 2.0;
    float _1121 = _1065 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    bool _1123 = !_815;
    int _1125 = _1123 ? 0 : 1;
    float _1127 = _1111 * _1119;
    float _1129 = float(_1107);
    float _1131 = fma(_1105, 4.0, -1.0);
    int _1133 = abs(_1125);
    float _1135 = _993 * _1031;
    float _1137 = fma(_1115, _1115, _1109);
    float _1139 = fma(_1129, _1121, _1127);
    float _1141 = float(_1133);
    float _1143 = _1131 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    float _1145 = -_1135;
    float _1147 = fma(_1145, (*spvDescriptorSet0.vp_c9)._m0[18].w, _993);
    float _1149 = _1033 * (-2.0);
    float _1151 = _421 + (-0.5);
    float _1153 = fma(_1141, _1143, _1139);
    float _1155 = fma(_1147, _1147, _1137);
    float _1157 = fma(_761, _1149, _761);
    float _1159 = fma(_1149, _957, _957);
    float _1161 = fma(_1153, 3.1415927410125732421875, _955);
    float _1163 = fma(_799, _1049, _799);
    float _1165 = _1057 * 0.15915493667125701904296875;
    float _1167 = fma(_1151, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1159);
    float _1169 = _407 + (-0.5);
    float _1171 = fma(_1161, _1049, _1161);
    float _1173 = -_433;
    float _1175 = _1173 + 1.0;
    float _1177 = fma(_1157, _737, _1167);
    float _1179 = sqrt(_1155);
    float _1181 = fma(_1169, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1171);
    float _1183 = fma(_1175, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1003);
    float _1185 = in.m_70.x;
    float _1187 = in.m_70.y;
    float _1189 = fma(_1175, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1005);
    float _1191 = fma(_1163, _737, _1181);
    float _1193 = fma(_875, _907, _1183);
    float _1195 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _1197 = _1195 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _1199 = fma(_889, _907, _1189);
    float _1201 = _1177 * 0.15915493667125701904296875;
    float _1203 = fma(_959, _931, _1193);
    float _1205 = fma(_1197, _553, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _1207 = fma(_967, _931, _1199);
    float _1209 = _1191 * 0.15915493667125701904296875;
    float _1211 = _1165 * 6.283185482025146484375;
    float _1213 = sin(_1211);
    float _1215 = fma(_1205, _915, _1203);
    float _1217 = fma(_1087, _915, _1207);
    float _1219 = _1031 * _1179;
    float _1221 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _331);
    float _1223 = fma(_873, (*spvDescriptorSet0.vp_c9)._m0[147].x, _1215);
    float _1225 = fma(_873, (*spvDescriptorSet0.vp_c9)._m0[147].y, _1217);
    float _1227 = _1219 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1229 = _1227 * 0.5;
    float _1231 = _1165 * 6.283185482025146484375;
    float _1233 = cos(_1231);
    float _1235 = _1223 * _1185;
    float _1237 = _1225 * _1187;
    float _1239 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _327);
    float _1241 = _1201 * 6.283185482025146484375;
    float _1243 = cos(_1241);
    float _1245 = _1235 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1247 = _1237 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1249 = _1245 * _1219;
    float _1251 = _1247 * _1219;
    float _1253 = _1209 * 6.283185482025146484375;
    float _1255 = sin(_1253);
    float _1257 = _1249 * _1239;
    float _1259 = _1251 * _1221;
    float _1261 = _1209 * 6.283185482025146484375;
    float _1263 = cos(_1261);
    float _1265 = _1233 * _1243;
    float _1267 = _1213 * _1243;
    float _1269 = _1265 * _1229;
    float _1271 = _1201 * 6.283185482025146484375;
    float _1273 = sin(_1271);
    float _1275 = _1213 * _1255;
    float _1277 = _1233 * _1255;
    float _1279 = _1233 * _1263;
    float _1281 = _1213 * _1263;
    float _1283 = _1263 * _1243;
    float _1285 = _1255 * _1243;
    float _1287 = _1267 * _1229;
    float _1289 = fma(_1273, _1279, _1275);
    float _1291 = _1273 * _1229;
    float _1293 = -_1281;
    float _1295 = fma(_1273, _1277, _1293);
    float _1297 = -_1277;
    float _1299 = fma(_1273, _1281, _1297);
    float _1301 = fma(_1289, _1257, _1269);
    float _1303 = -_1291;
    float _1305 = fma(_1283, _1257, _1303);
    float _1307 = fma(_1273, _1275, _1279);
    float _1309 = fma(_1299, _1257, _1287);
    float _1311 = -_1259;
    float _1313 = fma(_1295, _1311, _1301);
    float _1315 = -_1259;
    float _1317 = fma(_1285, _1315, _1305);
    bool _1319 = !_751;
    int _1321 = _1319 ? 0 : 1;
    float _1323 = -_1259;
    float _1325 = fma(_1307, _1323, _1309);
    float _1327 = _1313 * _323;
    float _1329 = _1313 * _319;
    float _1331 = _1313 * _309;
    float _1333 = fma(_1317, _291, _1327);
    float _1335 = fma(_1317, _281, _1329);
    float _1337 = fma(_1317, _277, _1331);
    float _1339 = fma(_1325, _343, _1333);
    float _1341 = fma(_1325, _339, _1335);
    float _1343 = fma(_1325, _335, _1337);
    float _1345 = _631 + _1339;
    float _1347 = _565 + _1341;
    float _1349 = _447 + _1343;
    bool _1351 = !_755;
    int _1353 = _1351 ? 0 : 1;
    float _1355 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1357 = _1345 + _1355;
    float _1359 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1361 = _1347 + _1359;
    float _1363 = _1357 * _1357;
    float _1365 = fma(_1361, _1361, _1363);
    float _1367 = sqrt(_1365);
    bool _1369 = _1367 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1371 = _1337;
    float _1373 = _1343;
    float _1375 = _1363;
    if (!_1369)
    {
        _1371 = _1347;
    }
    float _1377 = _1371;
    float _1379 = _1377;
    if (!_1369)
    {
        _1373 = _1345;
    }
    float _1381 = _1373;
    float _1383 = _1381;
    if (!_1369)
    {
        _1375 = _1349;
    }
    float _1385 = _1375;
    bool _1387 = !_1369;
    float _1389 = _1385;
    if (!_1387)
    {
        float _1391 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1393 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1395 = _1367 + _1393;
        float _1397 = rsqrt(_1365);
        float _1399 = _1395 * _1391;
        float _1401 = _1349 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1403 = _1399 * 0.15915493667125701904296875;
        float _1405 = _1403 * 6.283185482025146484375;
        float _1407 = cos(_1405);
        float _1409 = _1403 * 6.283185482025146484375;
        float _1411 = sin(_1409);
        float _1413 = _1407 + (-1.0);
        float _1415 = _1413 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1417 = fma(_1411, _1401, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1419 = fma(_1349, _1407, _1415);
        float _1421 = _1397 * _1417;
        float _1423 = fma(_1361, _1421, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1425 = fma(_1357, _1421, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1383 = _1425;
        _1379 = _1423;
        _1389 = _1419;
    }
    float _1427 = _1383;
    float _1429 = _1379;
    float _1431 = _1389;
    float _1433 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _1435 = _1427 + _1433;
    float _1437 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _1439 = _1429 + _1437;
    float _1441 = fma(_1435, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _1443 = fma(_1439, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _5903 = float2(_1443, _1441);
    float _1445 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_5903, float2(0.0), isnan(_5903)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_5903, float2(0.0), isnan(_5903)), level(0.0)).x;
    float _1447 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1449 = int(_1447);
    int _1451 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1453 = _1451 != 0;
    float _1455 = -_1135;
    float _1457 = fma(_1455, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1427);
    int _1459 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1461 = _1459 != 0;
    float _1463 = -_1135;
    float _1465 = fma(_1463, (*spvDescriptorSet0.vp_c9)._m0[18].w, _631);
    float _1467 = -_1085;
    float _1469 = fma(_1467, (*spvDescriptorSet0.vp_c9)._m0[18].w, _565);
    int _1471 = abs(_1321);
    float _1473 = trunc(_725);
    int _1475 = int(_1473);
    int _1477 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1479 = _1477 != 0;
    int _1481 = abs(_1353);
    if (_1453)
    {
        _483 = 1.0;
    }
    float _1483 = _483;
    float _1485 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1487 = int(_1485);
    float _1489 = float(uint(_1449));
    float _1491 = trunc(_727);
    int _1493 = int(_1491);
    float _1495 = float(uint(_1475));
    int _1497 = ~_1449;
    int _1499 = _1497 + 1;
    float _1501 = _1483;
    if (!_1453)
    {
        _1501 = 7.345489978790283203125;
    }
    float _1503 = _1501;
    float _1505 = 1.0 / _1489;
    float _1507 = float(uint(_1487));
    int _1509 = ~_1487;
    int _1511 = _1509 + 1;
    float _1513 = 1.0 / _1507;
    float _1515 = float(uint(_1493));
    int _1517 = as_type<int>(_1505) + (-2);
    float _1519 = as_type<float>(_1517) * _1495;
    int _1521 = as_type<int>(_1513) + (-2);
    float _1523 = trunc(_1519);
    float _1525 = precise::max(_1523, 0.0);
    uint _1528 = uint(_1525);
    float _1530 = _1503 * _395;
    float _1532 = float(_1475);
    float _1534 = as_type<float>(_1521) * _1515;
    float _1536 = trunc(_1534);
    float _1538 = precise::max(_1536, 0.0);
    uint _1540 = uint(_1538);
    int _1542 = _1499 * int(_1528);
    int _1544 = _1542 + _1475;
    float _1546 = floor(_1530);
    float _1548 = float(uint(_1544));
    int _1550 = _1511 * int(_1540);
    int _1552 = _1550 + _1493;
    float _1554 = as_type<float>(_1517) * _1548;
    float _1556 = float(_1449);
    float _1558 = float(uint(_1552));
    float _1560 = trunc(_1554);
    float _1562 = precise::max(_1560, 0.0);
    uint _1564 = uint(_1562);
    bool _1566 = _1532 >= _1556;
    bool _1568 = isnan(_1532);
    bool _1570 = _1566 || _1568;
    bool _1572 = isnan(_1556);
    bool _1574 = _1570 || _1572;
    float _1576 = float(_1574);
    float _1578 = -_1546;
    float _1580 = _1530 + _1578;
    float _1582 = as_type<float>(_1521) * _1558;
    float _1584 = float(_1487);
    float _1586 = trunc(_1576);
    int _1588 = int(_1586);
    int _1590 = ~_1449;
    int _1592 = _1590 + 1;
    int _1594 = int(_1528) + int(_1564);
    float _1596 = trunc(_1582);
    float _1598 = precise::max(_1596, 0.0);
    uint _1600 = uint(_1598);
    float _1602 = as_type<float>(_1564);
    float _1604 = as_type<float>(_1528);
    if (_1453)
    {
        _1602 = _395;
    }
    float _1606 = _1602;
    float _1608 = _1606;
    if (_1453)
    {
        _1604 = 1.0;
    }
    float _1610 = _1604;
    int _1612 = _1592 * _1594;
    int _1614 = _1612 + _1475;
    float _1616 = _1610;
    if (!_1453)
    {
        _1608 = _407;
    }
    float _1618 = _1608;
    if (!_1453)
    {
        _1616 = 1.2345600128173828125;
    }
    float _1620 = _1616;
    bool _1622 = uint(_1614) >= uint(_1449);
    float _1624 = _1618 * _1620;
    bool _1626 = !_1622;
    int _1628 = _1626 ? 0 : (-1);
    float _1630 = _1580 * _1556;
    bool _1632 = _1449 == 0;
    float _1634 = floor(_1624);
    int _1636 = ~_1594;
    int _1638 = _1636 + _1628;
    int _1640 = _1638 + 1;
    float _1642 = _1556 * _629;
    int _1644 = ~_1588;
    int _1646 = _1644 + 1;
    int _1648 = _1646 + 1;
    float _1650 = _1584 * _629;
    int _1652 = ~_1487;
    int _1654 = _1652 + 1;
    int _1656 = _1449 * _1640;
    int _1658 = _1656 + _1475;
    int _1660 = int(_1540) + int(_1600);
    float _1662 = trunc(_1630);
    int _1664 = int(_1662);
    int _1666 = abs(_765);
    bool _1668 = !_1632;
    int _1670 = _1668 ? _1658 : (-1);
    int _1672 = _1654 * _1660;
    int _1674 = _1672 + _1493;
    float _1676 = float(_1493);
    float _1678 = -_1634;
    float _1680 = _1624 + _1678;
    bool _1682 = !_1479;
    int _1684 = _1682 ? 0 : 1;
    int _1686 = _1670 * _1648;
    float _1688 = trunc(_1642);
    int _1690 = int(_1688);
    int _1692 = _1449 + (-1);
    float _1694 = _1680 * _1584;
    int _1696 = abs(_1684);
    bool _1698 = _1676 >= _1584;
    bool _1700 = isnan(_1676);
    bool _1702 = _1698 || _1700;
    bool _1704 = isnan(_1584);
    bool _1706 = _1702 || _1704;
    float _1708 = float(_1706);
    int _1710 = _1588 * _1692;
    int _1712 = _1710 + _1686;
    bool _1714 = uint(_1674) >= uint(_1487);
    int _1716 = _1664 * _1696;
    int _1718 = _1716 + _1475;
    bool _1720 = !_1461;
    int _1722 = _1720 ? 0 : 1;
    int _1724 = _1712 * _1666;
    float _1726 = trunc(_1708);
    int _1728 = int(_1726);
    int _1730 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1732 = _1730 != 0;
    int _1734 = abs(_771);
    int _1736 = abs(_777);
    bool _1738 = !_1714;
    int _1740 = _1738 ? 0 : (-1);
    int _1742 = _1690 * _1734;
    int _1744 = _1742 + _1724;
    int _1746 = abs(_1722);
    float _1748 = trunc(_1694);
    int _1750 = int(_1748);
    bool _1752 = !_1732;
    int _1754 = _1752 ? 0 : 1;
    int _1756 = ~_1660;
    int _1758 = _1756 + _1740;
    int _1760 = _1758 + 1;
    int _1762 = abs(_1754);
    int _1764 = _1718 * _1736;
    int _1766 = _1764 + _1744;
    int _1768 = _1487 * _1760;
    int _1770 = _1768 + _1493;
    bool _1772 = _1487 == 0;
    float _1774 = trunc(_1650);
    int _1776 = int(_1774);
    int _1778 = ~_1728;
    int _1780 = _1778 + 1;
    int _1782 = _1780 + 1;
    int _1784 = _1664 * _1746;
    int _1786 = _1784 + _1766;
    bool _1788 = !_1772;
    int _1790 = _1788 ? _1770 : (-1);
    int _1792 = _1750 * _1762;
    int _1794 = _1792 + _1493;
    int _1796 = _1487 + (-1);
    int _1798 = abs(_797);
    int _1800 = _1790 * _1782;
    float _1802 = float(uint(_1786));
    int _1804 = _1728 * _1796;
    int _1806 = _1804 + _1800;
    int _1808 = abs(_803);
    float _1810 = as_type<float>(_1517) * _1802;
    float _1812 = float(uint(_1794));
    int _1814 = _1806 * _1798;
    float _1816 = trunc(_1810);
    float _1818 = precise::max(_1816, 0.0);
    uint _1820 = uint(_1818);
    float _1822 = as_type<float>(_1521) * _1812;
    int _1824 = _1776 * _1808;
    int _1826 = _1824 + _1814;
    int _1828 = ~_1487;
    int _1830 = _1828 + 1;
    int _1832 = _1794 * _1471;
    int _1834 = _1832 + _1826;
    int _1836 = ~_1449;
    int _1838 = _1836 + 1;
    float _1840 = trunc(_1822);
    float _1842 = precise::max(_1840, 0.0);
    uint _1844 = uint(_1842);
    float _1846 = float(uint(_1718));
    int _1848 = _1750 * _1481;
    int _1850 = _1848 + _1834;
    int _1852 = ~_1487;
    int _1854 = _1852 + 1;
    int _1856 = ~_1449;
    int _1858 = _1856 + 1;
    int _1860 = _1838 * int(_1820);
    int _1862 = _1860 + _1786;
    float _1864 = float(uint(_1850));
    float _1866 = as_type<float>(_1517) * _1846;
    float _1868 = float(uint(_1862));
    float _1870 = as_type<float>(_1521) * _1864;
    float _1872 = trunc(_1866);
    float _1874 = precise::max(_1872, 0.0);
    uint _1876 = uint(_1874);
    float _1878 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1880 = as_type<float>(_1517) * _1868;
    float _1882 = trunc(_1870);
    float _1884 = precise::max(_1882, 0.0);
    uint _1886 = uint(_1884);
    int _1888 = ~_1449;
    int _1890 = _1888 + 1;
    float _1892 = trunc(_1880);
    float _1894 = precise::max(_1892, 0.0);
    uint _1896 = uint(_1894);
    int _1898 = _1890 * int(_1876);
    int _1900 = _1898 + _1718;
    float _1902 = float(uint(_1900));
    int _1904 = _1854 * int(_1886);
    int _1906 = _1904 + _1850;
    int _1908 = int(_1820) + int(_1896);
    float _1910 = float(uint(_1906));
    float _1912 = as_type<float>(_1521) * _1910;
    int _1914 = _1858 * _1908;
    int _1916 = _1914 + _1786;
    bool _1918 = uint(_1916) >= uint(_1449);
    float _1920 = trunc(_1912);
    float _1922 = precise::max(_1920, 0.0);
    uint _1924 = uint(_1922);
    int _1926 = _1830 * int(_1844);
    int _1928 = _1926 + _1794;
    bool _1930 = !_1918;
    int _1932 = _1930 ? 0 : (-1);
    float _1934 = float(uint(_1928));
    int _1936 = ~_1908;
    int _1938 = _1936 + _1932;
    int _1940 = _1938 + 1;
    float _1942 = as_type<float>(_1517) * _1902;
    float _1944 = -_1085;
    float _1946 = fma(_1944, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1429);
    float _1948 = as_type<float>(_1521) * _1934;
    int _1950 = _1449 * _1940;
    int _1952 = _1950 + _1786;
    float _1954 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1956 = _1946 + _1954;
    int _1958 = int(_1886) + int(_1924);
    float _1960 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1962 = _1457 + _1960;
    float _1964 = fma(_1445, 100.0, _1431);
    float _1966 = -_1079;
    float _1968 = fma(_1966, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1964);
    float _1970 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1972 = _1968 + _1970;
    float _1974 = _1972 * _1972;
    float _1976 = fma(_1956, _1956, _1974);
    float _1978 = fma(_1962, _1962, _1976);
    float _1980 = rsqrt(_1978);
    float _1982 = sqrt(_1978);
    float _1984 = _1980 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1986 = _1956 * _1984;
    float _1988 = _1962 * _1984;
    float _1990 = _1986 * _1986;
    float _1992 = _1988 * _1988;
    float _1994 = _1990 + _1992;
    float _1996 = sqrt(_1994);
    bool _1998 = _1996 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2000 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2002 = _1996 + _2000;
    float _2004 = _1980;
    float _2006 = _1994;
    float _2008 = _2002;
    float _2010 = as_type<float>(_1928);
    float _2012 = as_type<float>(_1728);
    float _2014 = _1984;
    float _2016 = _1986;
    if (_1998)
    {
        float _2018 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2004 = _2018;
    }
    float _2020 = _2004;
    if (_1998)
    {
        float _2022 = rsqrt(_1994);
        _2006 = _2022;
    }
    float _2024 = _2006;
    float _2026 = _2024;
    if (_1998)
    {
        float _2028 = _2002 * _2020;
        _2008 = _2028;
    }
    float _2030 = _2008;
    if (_1998)
    {
        float _2032 = _2030 * 0.15915493667125701904296875;
        _1099 = _2032;
    }
    float _2034 = _1099;
    float _2036 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2038 = (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2040 = _2034;
    if (_1998)
    {
        float _2042 = _2034 * 6.283185482025146484375;
        float _2044 = sin(_2042);
        _2038 = _2044;
    }
    float _2046 = _2038;
    float _2048 = precise::max(0.0, _2036);
    float _2050 = _1962;
    if (_1998)
    {
        float _2052 = _2034 * 6.283185482025146484375;
        float _2054 = cos(_2052);
        _2050 = _2054;
    }
    float _2056 = _2050;
    float _2058 = -_1984;
    float _2060 = -_2048;
    float _2062 = fma(_1972, _2058, _2060);
    float _2064 = _2062;
    if (_1998)
    {
        float _2066 = _2062 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2010 = _2066;
    }
    float _2068 = _2010;
    float _2070 = fma(_1469, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2072 = _2068;
    if (_1998)
    {
        float _2074 = fma(_2046, _2068, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2072 = _2074;
    }
    float _2076 = _2072;
    float _2078 = _2076;
    if (!_1998)
    {
        _2040 = _1986;
    }
    float _2080 = _2040;
    float _2082 = floor(_2070);
    float _2084 = _2080;
    if (_1998)
    {
        float _2086 = _2024 * _2076;
        _2012 = _2086;
    }
    float _2088 = _2012;
    if (!_1998)
    {
        _2026 = _1988;
    }
    float _2090 = _2026;
    float _2092 = _2090;
    if (_1998)
    {
        float _2094 = _2056 + (-1.0);
        _2014 = _2094;
    }
    float _2096 = _2014;
    float _2098 = _2096;
    if (_1998)
    {
        float _2100 = _1986 * _2088;
        _2084 = _2100;
    }
    float _2102 = _2084;
    if (!_1998)
    {
        _2078 = _1990;
    }
    float _2104 = _2078;
    float _2106 = _2104;
    if (_1998)
    {
        float _2108 = _1988 * _2088;
        _2092 = _2108;
    }
    float _2110 = _2092;
    if (_1998)
    {
        float _2112 = _2096 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2098 = _2112;
    }
    float _2114 = _2098;
    if (_1998)
    {
        float _2116 = _2102 * _2102;
        _2106 = _2116;
    }
    float _2118 = _2106;
    if (!_1998)
    {
        _2016 = _1992;
    }
    float _2120 = _2016;
    float _2122 = _2120;
    if (_1998)
    {
        float _2124 = _2110 * _2110;
        _2122 = _2124;
    }
    float _2126 = _2122;
    if (_1998)
    {
        float _2128 = fma(_2062, _2056, _2114);
        _2064 = _2128;
    }
    float _2130 = _2064;
    float _2132 = _1968 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2134 = -_2082;
    float _2136 = _2070 + _2134;
    float _2138 = fma(_2130, _2130, _2118);
    float _2140 = fma(_1465, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2142 = _2138 + _2126;
    float _2144 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2146 = fma(_1982, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2144);
    float _2148 = precise::clamp(_2146, 0.0, 1.0);
    float _2150 = fma(_1946, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2132);
    float _2152 = _1968 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2154 = rsqrt(_2142);
    float _2156 = -_2148;
    float _2158 = _2156 + 1.0;
    float _2160 = fma(_1457, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2150);
    float _2162 = _1968 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2164 = fma(_1946, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2152);
    float _2166 = _2160 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2168 = fma(_1946, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2162);
    float _2170 = abs(_2158);
    float _2172 = log2(_2170);
    float _2174 = fma(_1457, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2164);
    float _2176 = _2166 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2178 = fma(_1457, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2168);
    float _2180 = _1968 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2182 = _2174 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2184 = -_2176;
    float _2186 = fma(_2184, _1878, 1.0);
    float _2188 = _2178 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2190 = _2154 * _2102;
    float _2192 = _2182 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2194 = _2154 * _2130;
    float _2196 = _2154 * _2110;
    float _2198 = _2190 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2200 = fma(_2188, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2192);
    float _2202 = fma(_1946, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2180);
    float _2204 = floor(_2140);
    float _2206 = _2172 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2208 = -_2198;
    float _2210 = fma(_2194, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2208);
    float _2212 = fma(_1457, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2202);
    float _2214 = fma(_2166, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2200);
    float _2216 = _2182 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2218 = -_2196;
    float _2220 = fma(_2218, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2210);
    float _2222 = _2212 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2224 = exp2(_2206);
    float _2226 = fma(_2220, -0.5, 0.5);
    float _2228 = fma(_2220, 0.5, 0.5);
    float _2230 = fma(_2222, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2214);
    float _2232 = _2194 + 1.0;
    float _2234 = _2182 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2236 = fma(_2228, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2238 = 1.0 / _2230;
    float _2240 = -_2204;
    float _2242 = _2140 + _2240;
    float _2244 = fma(_2188, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2234);
    float _2246 = fma(_2166, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2244);
    float _2248 = log2(_2186);
    float _2250 = -_2194;
    float _2252 = fma(_2224, _2232, _2250);
    float _2254 = fma(_2228, _2236, -0.212114393711090087890625);
    float _2256 = fma(_2188, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2216);
    int _2258 = ~_1487;
    int _2260 = _2258 + 1;
    float _2262 = fma(_2228, _2254, 1.570728778839111328125);
    float _2264 = fma(_2166, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2256);
    float _2266 = sqrt(_2226);
    float _2268 = fma(_2222, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2264);
    float _2270 = _2268 * _2238;
    float _2272 = trunc(_1942);
    float _2274 = precise::max(_2272, 0.0);
    uint _2276 = uint(_2274);
    float _2278 = _2248 * 0.693147182464599609375;
    float2 _7139 = float2(_2136, _2242);
    float _2280 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7139, float2(0.0), isnan(_7139)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7139, float2(0.0), isnan(_7139)), level(0.0)).x;
    float _2282 = _2278 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2284 = _2266 * 0.636619746685028076171875;
    float _2286 = fma(_2222, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2246);
    float _2288 = trunc(_1948);
    float _2290 = precise::max(_2288, 0.0);
    uint _2292 = uint(_2290);
    float _2294 = fma(_2270, 0.5, 0.5);
    float _2296 = -_2262;
    float _2298 = fma(_2284, _2296, 1.0);
    float _2300 = _2286 * _2238;
    int _2302 = _2260 * _1958;
    int _2304 = _2302 + _1850;
    float _2306 = fma(_2300, -0.5, 0.5);
    float _2308 = fma(_2252, 0.5, 0.5);
    float3 _7186 = float3(_2294, _2306, _2282);
    float _2310 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7186, float3(0.0), isnan(_7186)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7186, float3(0.0), isnan(_7186)), level(0.0)).x;
    float3 _7197 = float3(_2294, _2306, _2282);
    float4 _2313 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7197, float3(0.0), isnan(_7197)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7197, float3(0.0), isnan(_7197)), level(0.0)).xyzw;
    float _2315 = _2313.x;
    float _2317 = _2313.y;
    float _2319 = _2313.z;
    float _2321 = _2313.w;
    float2 _7213 = float2(_2298, _2308);
    float3 _2325 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7213, float2(0.0), isnan(_7213)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7213, float2(0.0), isnan(_7213)), level(0.0)).xyz;
    float _2327 = _2325.x;
    float _2329 = _2325.y;
    float _2331 = _2325.z;
    bool _2333 = uint(_2304) >= uint(_1487);
    float _2335 = fma(_1445, 100.0, _447);
    bool _2337 = !_1632;
    int _2339 = _2337 ? _1952 : (-1);
    float _2341 = _2172 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2343 = !_2333;
    int _2345 = _2343 ? 0 : (-1);
    float _2347 = -_1079;
    float _2349 = fma(_2347, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2335);
    bool _2351 = _407 > 0.5;
    float _2353 = -_715;
    float _2355 = _2353 + 1.0;
    int _2357 = ~_1958;
    int _2359 = _2357 + _2345;
    int _2361 = _2359 + 1;
    float _2363 = _2349 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    int _2365 = _2339 & 3;
    bool _2367 = _2365 != 0;
    float _2369 = -_729;
    float _2371 = _2369 + 1.0;
    int _2373 = _2339 >> 31;
    int _2375 = _1487 * _2361;
    int _2377 = _2375 + _1850;
    bool _2379 = uint(_2365) > 1u;
    float _2381 = exp2(_2341);
    int _2383 = int(_1876) + int(_2276);
    float _2385 = _2182 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2387 = ~_1449;
    int _2389 = _2387 + 1;
    out.m_72.x = _1946;
    out.m_72.y = _1968;
    out.m_72.z = _1457;
    int _2391 = _2339 & 3;
    bool _2393 = _2391 != 0;
    float _2395 = fma(_2188, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2385);
    int _2397 = _2373 & 3;
    int _2399 = _2389 * _2383;
    int _2401 = _2399 + _1718;
    bool _2403 = !_1772;
    int _2405 = _2403 ? _2377 : (-1);
    int _2407 = _2393 ? 0 : 1;
    bool _2409 = _2365 != 3;
    bool _2411 = uint(_2365) >= 2u;
    float _2413 = -_2381;
    float _2415 = _2413 + 1.0;
    int _2417 = _2339 + _2397;
    int _2419 = _2405 >> 31;
    float _2421 = _2415 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _2423 = _2411 ? 0 : 1;
    int _2425 = ~_2407;
    int _2427 = _2425 + 1;
    int _2429 = _2427 + 1;
    bool _2431 = uint(_2401) >= uint(_1449);
    int _2433 = _2429;
    float _2435 = _2230;
    float _2437 = _2286;
    float _2439 = _2268;
    if (!_2379)
    {
        int _2441 = ~_2407;
        int _2443 = _2441 + 1;
        _2433 = _2443;
    }
    int _2445 = _2433;
    int _2447 = _2419 & 3;
    float _2449 = in.m_64.w;
    int _2451 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2453 = _2451 != 0;
    bool _2455 = !_2431;
    int _2457 = _2455 ? 0 : (-1);
    int _2459 = _2405 + _2447;
    bool _2461 = !_2453;
    int _2463 = _2461 ? 0 : 1;
    int _2465 = _2405 & 3;
    bool _2467 = _2465 != 0;
    int _2469 = _2405 & 3;
    bool _2471 = _2469 != 0;
    int _2473 = ~_2423;
    int _2475 = _2473 + 1;
    int _2477 = _2475 + 1;
    int _2479 = _2477;
    if (_2409)
    {
        int _2481 = ~_2423;
        int _2483 = _2481 + 1;
        _2479 = _2483;
    }
    int _2485 = _2479;
    int _2487 = _2459 >> 2;
    int _2489 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2491 = _2489 != 0;
    bool _2493 = !_2367;
    int _2495 = _2493 ? 0 : 1;
    bool _2497 = uint(_2469) >= 2u;
    int _2499 = int(_1844) + int(_2292);
    int _2501 = ~_1487;
    int _2503 = _2501 + 1;
    int _2505 = _2487 << 4;
    int _2507 = _2505 + 512;
    bool _2509 = !_2491;
    int _2511 = _2509 ? 0 : 1;
    int _2513 = _2503 * _2499;
    int _2515 = _2513 + _1794;
    bool _2517 = uint(_2469) > 1u;
    int _2519 = _2417 >> 2;
    int _2521 = _2497 ? 0 : 1;
    bool _2523 = _2365 != 3;
    uint _2525 = uint(int(uint(_2507) >> uint(2)));
    uint _2527 = uint(int(uint(int(_2525)) >> uint(2)));
    int _2529 = int(_2525) & 3;
    float _2531 = (*spvDescriptorSet0.vp_c9)._m0[int(_2527)][_2529];
    int _2533 = int(_2525) + 1;
    uint _2535 = uint(int(uint(_2533) >> uint(2)));
    int _2537 = _2533 & 3;
    float _2539 = (*spvDescriptorSet0.vp_c9)._m0[int(_2535)][_2537];
    int _2541 = _2519 << 4;
    int _2543 = _2541 + 368;
    bool _2545 = !_2471;
    int _2547 = _2545 ? 0 : 1;
    bool _2549 = _2469 != 3;
    int _2551 = _2467 ? 0 : 1;
    bool _2553 = uint(_2515) >= uint(_1487);
    uint _2555 = uint(int(uint(_2543) >> uint(2)));
    uint _2557 = uint(int(uint(int(_2555)) >> uint(2)));
    int _2559 = int(_2555) & 3;
    float _2561 = (*spvDescriptorSet0.vp_c9)._m0[int(_2557)][_2559];
    int _2563 = int(_2555) + 1;
    uint _2565 = uint(int(uint(_2563) >> uint(2)));
    int _2567 = _2563 & 3;
    float _2569 = (*spvDescriptorSet0.vp_c9)._m0[int(_2565)][_2567];
    int _2571 = ~_2551;
    int _2573 = _2571 + 1;
    int _2575 = _2573 + 1;
    int _2577 = _2575;
    if (!_2517)
    {
        int _2579 = ~_2551;
        int _2581 = _2579 + 1;
        _2577 = _2581;
    }
    int _2583 = _2577;
    bool _2585 = _2469 != 3;
    int _2587 = ~_2521;
    int _2589 = _2587 + 1;
    int _2591 = _2589 + 1;
    bool _2593 = !_2553;
    int _2595 = _2593 ? 0 : (-1);
    int _2597 = _2591;
    if (_2549)
    {
        int _2599 = ~_2521;
        int _2601 = _2599 + 1;
        _2597 = _2601;
    }
    int _2603 = _2597;
    bool _2605 = !_2523;
    int _2607 = _2605 ? 0 : (-1);
    bool _2609 = !_2585;
    int _2611 = _2609 ? 0 : (-1);
    int _2613 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2615 = _2613 != 0;
    int _2617 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2619 = _2617 != 0;
    int _2621 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2623 = _2621 != 0;
    int _2625 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2627 = _2625 != 0;
    float _2629 = -_331;
    int _2631 = _2351 ? as_type<int>(_2629) : as_type<int>(_331);
    float _2633 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    bool _2635 = _2449 > 0.5;
    int _2637 = _2543 + 8;
    uint _2639 = uint(int(uint(_2637) >> uint(2)));
    uint _2641 = uint(int(uint(int(_2639)) >> uint(2)));
    int _2643 = int(_2639) & 3;
    float _2645 = (*spvDescriptorSet0.vp_c9)._m0[int(_2641)][_2643];
    int _2647 = int(_2639) + 1;
    uint _2649 = uint(int(uint(_2647) >> uint(2)));
    int _2651 = _2647 & 3;
    float _2653 = (*spvDescriptorSet0.vp_c9)._m0[int(_2649)][_2651];
    float _2655 = _2633 * _395;
    float _2657 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _2659 = abs(_2445);
    float _2661 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _2663 = ~_2383;
    int _2665 = _2663 + _2457;
    int _2667 = _2665 + 1;
    int _2669 = _2507 + 8;
    uint _2671 = uint(int(uint(_2669) >> uint(2)));
    uint _2673 = uint(int(uint(int(_2671)) >> uint(2)));
    int _2675 = int(_2671) & 3;
    float _2677 = (*spvDescriptorSet0.vp_c9)._m0[int(_2673)][_2675];
    int _2679 = int(_2671) + 1;
    uint _2681 = uint(int(uint(_2679) >> uint(2)));
    int _2683 = _2679 & 3;
    float _2685 = (*spvDescriptorSet0.vp_c9)._m0[int(_2681)][_2683];
    float _2687 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2689 = trunc(_2655);
    int _2691 = int(_2689);
    int _2693 = _1449 * _2667;
    int _2695 = _2693 + _1718;
    float _2697 = _2687 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2699 = abs(_2583);
    float _2701 = _2657 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2703 = !_2619;
    float _2705 = _2703 ? _331 : as_type<float>(_2631);
    float _2707 = _2661 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2709 = _395 > 0.5;
    float _2711 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _2713 = ~_2699;
    int _2715 = _2713 + 1;
    int _2717 = _2715 + 1;
    int _2719 = abs(_2495);
    int _2721 = _2717 * as_type<int>(_2539);
    float _2723 = -_331;
    int _2725 = _2635 ? as_type<int>(_2723) : as_type<int>(_331);
    out.m_74.x = _2701;
    out.m_74.y = _2697;
    out.m_74.z = _2707;
    out.m_74.w = _2711;
    bool _2727 = _421 > 0.5;
    int _2729 = ~_2659;
    int _2731 = _2729 + 1;
    int _2733 = _2731 + 1;
    int _2735 = abs(_2547);
    int _2737 = _2733 * as_type<int>(_2569);
    int _2739 = ~_2719;
    int _2741 = _2739 + 1;
    int _2743 = _2741 + 1;
    int _2745 = _2691 << 4;
    int _2747 = _2745 + 1968;
    int _2749 = abs(_2485);
    int _2751 = _2743 * as_type<int>(_2561);
    int _2753 = _2751 + _2737;
    int _2755 = ~_2735;
    int _2757 = _2755 + 1;
    int _2759 = _2757 + 1;
    uint _2761 = uint(int(uint(_2747) >> uint(2)));
    uint _2763 = uint(int(uint(int(_2761)) >> uint(2)));
    int _2765 = int(_2761) & 3;
    float _2767 = (*spvDescriptorSet0.vp_c9)._m0[int(_2763)][_2765];
    int _2769 = int(_2761) + 1;
    uint _2771 = uint(int(uint(_2769) >> uint(2)));
    int _2773 = _2769 & 3;
    float _2775 = (*spvDescriptorSet0.vp_c9)._m0[int(_2771)][_2773];
    float _2777 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2779 = int(_2777);
    int _2781 = abs(_2603);
    int _2783 = _2759 * as_type<int>(_2531);
    int _2785 = _2783 + _2721;
    int _2787 = ~_2749;
    int _2789 = _2787 + 1;
    int _2791 = _2789 + 1;
    int _2793 = abs(_2611);
    int _2795 = _2747 + 8;
    uint _2797 = uint(int(uint(_2795) >> uint(2)));
    uint _2799 = uint(int(uint(int(_2797)) >> uint(2)));
    int _2801 = int(_2797) & 3;
    float _2803 = (*spvDescriptorSet0.vp_c9)._m0[int(_2799)][_2801];
    int _2805 = abs(_2607);
    float _2807 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2809 = int(_2807);
    int _2811 = _2791 * as_type<int>(_2645);
    int _2813 = _2811 + _2753;
    float _2815 = _327 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2817 = ~_2781;
    int _2819 = _2817 + 1;
    int _2821 = _2819 + 1;
    int _2823 = ~_2499;
    int _2825 = _2823 + _2595;
    int _2827 = _2825 + 1;
    int _2829 = ~_2805;
    int _2831 = _2829 + 1;
    int _2833 = _2831 + 1;
    int _2835 = _2821 * as_type<int>(_2677);
    int _2837 = _2835 + _2785;
    int _2839 = ~_2793;
    int _2841 = _2839 + 1;
    int _2843 = _2841 + 1;
    int _2845 = _1487 * _2827;
    int _2847 = _2845 + _1794;
    int _2849 = abs(_2463);
    int _2851 = _2833 * as_type<int>(_2653);
    int _2853 = _2851 + _2813;
    float _2855 = float(uint(_2779));
    int _2857 = _2843 * as_type<int>(_2685);
    int _2859 = _2857 + _2837;
    float _2861 = float(uint(_2809));
    float _2863 = 1.0 / _2855;
    int _2865 = abs(_2511);
    int _2867 = ~_2849;
    int _2869 = _2867 + 1;
    int _2871 = _2869 + 1;
    int _2873 = ~_2865;
    int _2875 = _2873 + 1;
    int _2877 = _2875 + 1;
    int _2879 = abs(_2779);
    float _2881 = 1.0 / _2861;
    int _2883 = _2853 * _2871;
    bool _2885 = !_1632;
    int _2887 = _2885 ? _2695 : (-1);
    int _2889 = _2859 * _2877;
    bool _2891 = !_1772;
    int _2893 = _2891 ? _2847 : (-1);
    int _2895 = abs(_2809);
    int _2897 = _2887 * _2849;
    int _2899 = _2897 + _2883;
    float _2901 = float(uint(_2879));
    int _2903 = _2893 * _2865;
    int _2905 = _2903 + _2889;
    float _2907 = _2767 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _2909 = as_type<int>(_2863) + (-2);
    float _2911 = _2775 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2913 = 1.0 / _2901;
    float _2915 = float(uint(_2895));
    float _2917 = _2907 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2919 = as_type<int>(_2881) + (-2);
    float _2921 = _2911 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2923 = float(uint(_2905));
    float _2925 = _2803 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2927 = float(uint(_2899));
    float _2929 = 1.0 / _2915;
    bool _2931 = !_2627;
    float _2933 = _2931 ? _331 : as_type<float>(_2725);
    float _2935 = _331 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2937 = -_327;
    int _2939 = _2727 ? as_type<int>(_2937) : as_type<int>(_327);
    float _2941 = as_type<float>(_2909) * _2927;
    float _2943 = _2925 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2945 = fma(_2935, _2935, 1.0);
    bool _2947 = !_2623;
    float _2949 = _2947 ? _327 : as_type<float>(_2939);
    float _2951 = as_type<float>(_2919) * _2923;
    float _2953 = trunc(_2941);
    float _2955 = precise::max(_2953, 0.0);
    uint _2957 = uint(_2955);
    int _2959 = abs(_2899);
    out.m_76.x = _2917;
    out.m_76.y = _2921;
    out.m_76.z = _2943;
    float _2961 = -_327;
    int _2963 = _2709 ? as_type<int>(_2961) : as_type<int>(_327);
    float _2965 = float(uint(_2959));
    bool _2967 = !_2615;
    float _2969 = _2967 ? _327 : as_type<float>(_2963);
    float _2971 = trunc(_2951);
    float _2973 = precise::max(_2971, 0.0);
    uint _2975 = uint(_2973);
    int _2977 = abs(_2905);
    int _2979 = ~_2809;
    int _2981 = _2979 + 1;
    int _2983 = ~_2779;
    int _2985 = _2983 + 1;
    int _2987 = as_type<int>(_2913) + (-2);
    float _2989 = rsqrt(_2945);
    int _2991 = as_type<int>(_2929) + (-2);
    float _2993 = -_1273;
    float _2995 = fma(_1283, _2815, _2993);
    float _2997 = float(uint(_2977));
    float _2999 = as_type<float>(_2987) * _2965;
    int _3001 = _2985 * int(_2957);
    int _3003 = _3001 + _2899;
    float _3005 = -_2935;
    float _3007 = fma(_1285, _3005, _2995);
    int _3009 = _2981 * int(_2975);
    int _3011 = _3009 + _2905;
    int _3013 = ~_2895;
    int _3015 = _3013 + 1;
    float _3017 = trunc(_2999);
    float _3019 = precise::max(_3017, 0.0);
    uint _3021 = uint(_3019);
    float _3023 = float(uint(_3011));
    float _3025 = -_2280;
    float _3027 = _3025 + 1.0;
    float _3029 = _2935 * _2989;
    float _3031 = -_2989;
    float _3033 = _1285 * _3031;
    float _3035 = as_type<float>(_2991) * _2997;
    float _3037 = float(uint(_3003));
    float _3039 = as_type<float>(_2919) * _3023;
    float _3041 = fma(_1273, _3029, _3033);
    float _3043 = trunc(_3035);
    float _3045 = precise::max(_3043, 0.0);
    uint _3047 = uint(_3045);
    int _3049 = ~_2879;
    int _3051 = _3049 + 1;
    float _3053 = as_type<float>(_2909) * _3037;
    float _3055 = fma(_1289, _2815, _1265);
    float _3057 = fma(_1299, _2815, _1267);
    float _3059 = trunc(_3053);
    float _3061 = precise::max(_3059, 0.0);
    uint _3063 = uint(_3061);
    float _3065 = -_2989;
    float _3067 = _1307 * _3065;
    int _3069 = _3051 * int(_3021);
    int _3071 = _3069 + _2959;
    float _3073 = -_2935;
    float _3075 = fma(_1295, _3073, _3055);
    float _3077 = -_2989;
    float _3079 = _1295 * _3077;
    float _3081 = -_2935;
    float _3083 = fma(_1307, _3081, _3057);
    float _3085 = -_3029;
    float _3087 = fma(_1267, _3085, _3067);
    float _3089 = float(uint(_3071));
    int _3091 = _3015 * int(_3047);
    int _3093 = _3091 + _2977;
    float _3095 = -_3029;
    float _3097 = fma(_1265, _3095, _3079);
    float _3099 = trunc(_3039);
    float _3101 = precise::max(_3099, 0.0);
    uint _3103 = uint(_3101);
    float _3105 = _1289 * _319;
    float _3107 = as_type<float>(_2987) * _3089;
    float _3109 = float(uint(_3093));
    float _3111 = _1289 * _309;
    float _3113 = _1289 * _323;
    float _3115 = fma(_1283, _281, _3105);
    float _3117 = _3097 * _319;
    float _3119 = trunc(_3107);
    float _3121 = precise::max(_3119, 0.0);
    uint _3123 = uint(_3121);
    float _3125 = as_type<float>(_2991) * _3109;
    float _3127 = fma(_1283, _277, _3111);
    float _3129 = fma(_1283, _291, _3113);
    float _3131 = fma(_1299, _339, _3115);
    float _3133 = _3075 * _323;
    float _3135 = fma(_1299, _335, _3127);
    float _3137 = fma(_1299, _343, _3129);
    float _3139 = trunc(_3125);
    float _3141 = precise::max(_3139, 0.0);
    uint _3143 = uint(_3141);
    float _3145 = _3075 * _319;
    int _3147 = ~_2809;
    int _3149 = _3147 + 1;
    float _3151 = _3075 * _309;
    float _3153 = _3097 * _309;
    float _3155 = _3097 * _323;
    out.m_78.x = _3131;
    out.m_78.y = _3135;
    out.m_78.z = _3137;
    int _3157 = int(_2957) + int(_3063);
    float _3159 = _2421 * _2310;
    int _3161 = ~_2879;
    int _3163 = _3161 + 1;
    float _3165 = fma(_3007, _277, _3151);
    int _3167 = int(_3021) + int(_3123);
    float _3169 = -_2421;
    float _3171 = _3169 + 1.0;
    int _3173 = ~_2779;
    int _3175 = _3173 + 1;
    int _3177 = int(_2975) + int(_3103);
    int _3179 = _3163 * _3167;
    int _3181 = _3179 + _2959;
    int _3183 = int(_3047) + int(_3143);
    int _3185 = _3175 * _3157;
    int _3187 = _3185 + _2899;
    float _3189 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _3191 = ~_2895;
    int _3193 = _3191 + 1;
    float _3195 = fma(_3041, _277, _3153);
    bool _3197 = uint(_3187) >= uint(_2779);
    int _3199 = _3149 * _3177;
    int _3201 = _3199 + _2905;
    bool _3203 = uint(_3181) >= uint(_2879);
    int _3205 = _3193 * _3183;
    int _3207 = _3205 + _2977;
    bool _3209 = !_3197;
    int _3211 = _3209 ? 0 : (-1);
    float _3213 = fma(_3041, _281, _3117);
    bool _3215 = uint(_3201) >= uint(_2809);
    float _3217 = fma(_3041, _291, _3155);
    int _3219 = ~_3157;
    int _3221 = _3219 + _3211;
    int _3223 = _3221 + 1;
    float _3225 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _3227 = !_3215;
    int _3229 = _3227 ? 0 : (-1);
    bool _3231 = uint(_3207) >= uint(_2895);
    int _3233 = ~_3177;
    int _3235 = _3233 + _3229;
    int _3237 = _3235 + 1;
    int _3239 = _2899 ^ _2779;
    int _3241 = _2905 ^ _2809;
    int _3243 = _2809 * _3237;
    int _3245 = _3243 + _2905;
    bool _3247 = _2779 == 0;
    bool _3249 = _2779 == 0;
    int _3251 = _2779 * _3223;
    int _3253 = _3251 + _2899;
    bool _3255 = !_3203;
    int _3257 = _3255 ? 0 : (-1);
    float _3259 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _3261 = !_3231;
    int _3263 = _3261 ? 0 : (-1);
    uint _3265 = uint(int(uint(_3239) >> uint(31)));
    uint _3267 = uint(int(uint(_3241) >> uint(31)));
    int _3269 = ~_3257;
    int _3271 = _3167 + _3269;
    int _3273 = _3271 + 1;
    int _3275 = ~_3263;
    int _3277 = _3183 + _3275;
    int _3279 = _3277 + 1;
    int _3281 = ~int(_3265);
    int _3283 = _3281 + 1;
    int _3285 = ~int(_3267);
    int _3287 = _3285 + 1;
    float _3289 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _3291 = _3273 ^ _3283;
    float _3293 = _3259 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _3295 = _3279 ^ _3287;
    int _3297 = ~_3283;
    int _3299 = _3297 + _3291;
    int _3301 = _3299 + 1;
    float _3303 = _3189 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _3305 = _2809 == 0;
    int _3307 = ~_3287;
    int _3309 = _3307 + _3295;
    int _3311 = _3309 + 1;
    bool _3313 = _2809 == 0;
    float _3315 = _3225 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _3317 = !_3247;
    int _3319 = _3317 ? _3253 : (-1);
    bool _3321 = !_3249;
    int _3323 = _3321 ? _3301 : (-1);
    float _3325 = _3289 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _3327 = !_3305;
    int _3329 = _3327 ? _3311 : (-1);
    float _3331 = _2331 * _3159;
    float _3333 = float(_3319);
    float _3335 = fma(_3083, _335, _3165);
    float _3337 = float(_3323);
    float _3339 = float(_3329);
    float _3341 = fma(_3303, _3333, _531);
    bool _3343 = !_3313;
    int _3345 = _3343 ? _3245 : (-1);
    float _3347 = -_533;
    float _3349 = fma(_3315, _3337, _3347);
    float _3351 = _2969 + 0.5;
    float _3353 = -_731;
    float _3355 = fma(_3325, _3339, _3353);
    float _3357 = _2705 + (-0.5);
    float _3359 = float(_3345);
    float _3361 = fma(_3303, _3351, _3341);
    float _3363 = fma(_3087, _339, _3213);
    float _3365 = -_3315;
    float _3367 = fma(_3365, _3357, _3349);
    float _3369 = -_719;
    float _3371 = _3369 + 1.0;
    float _3373 = fma(_3293, _3359, _665);
    float _3375 = _2949 + 0.5;
    float _3377 = fma(_3087, _335, _3195);
    float _3379 = -_3371;
    float _3381 = fma(_2969, _3379, _3361);
    float _3383 = fma(_3007, _281, _3145);
    float _3385 = fma(_3293, _3375, _3373);
    float _3387 = -_577;
    float _3389 = _3387 + 1.0;
    float _3391 = fma(_3087, _343, _3217);
    float _3393 = fma(_3083, _339, _3383);
    float _3395 = fma(_1469, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2363);
    float _3397 = _2349 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3399 = _2933 + (-0.5);
    out.m_80.x = _3363;
    out.m_80.y = _3377;
    out.m_80.z = _3391;
    float _3401 = fma(_1465, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3395);
    float _3403 = fma(_1469, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3397);
    float _3405 = -_3325;
    float _3407 = fma(_3405, _3399, _3355);
    float _3409 = -_3389;
    float _3411 = fma(_2949, _3409, _3385);
    float _3413 = fma(_2705, _2355, _3367);
    float _3415 = fma(_1465, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3403);
    float _3417 = fma(_2933, _2371, _3407);
    float _3419 = in.m_66.x;
    float _3421 = fma(_3007, _291, _3133);
    float _3423 = _3415 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3425 = _2321 * _3171;
    float _3427 = _3401 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    out.m_82.x = _3381;
    out.m_82.y = _3413;
    out.m_82.z = _3411;
    out.m_82.w = _3417;
    float _3429 = 1.0 / _3427;
    float _3431 = _3423 + _3427;
    float _3433 = fma(_3083, _343, _3421);
    bool _3435 = _1982 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3437 = isnan(_1982);
    bool _3439 = _3435 || _3437;
    bool _3441 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3443 = _3439 || _3441;
    out.m_84.x = _3393;
    out.m_84.y = _3335;
    out.m_84.z = _3433;
    float _3445 = _2230 * 0.5;
    float _3447 = _3431 * _3429;
    float _3449 = _3447 * 0.5;
    float _3451 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3453 = fma(_3449, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3451);
    float _3455 = 1.0 / _3453;
    float _3457 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3459 = _3455 * _3457;
    float _3461 = abs(_3459);
    float _3463 = log2(_3461);
    bool _3465 = _3459 <= 8000.0;
    bool _3467 = isnan(_3459);
    bool _3469 = _3465 || _3467;
    bool _3471 = isnan(8000.0);
    bool _3473 = _3469 || _3471;
    float _3475 = float(_3473);
    float _3477 = fma(_2286, -0.5, _3445);
    float _3479 = _3463 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3481 = exp2(_3479);
    float _3483 = fma(_3481, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3485 = precise::clamp(_3483, 0.0, 1.0);
    float _3487 = _2268 + _2230;
    float _3489 = fma(_3485, -2.0, 3.0);
    float _3491 = _3485 * _3485;
    float _3493 = _3491 * _3489;
    float _3495 = fma(_2166, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2395);
    float _3497 = -_3493;
    float _3499 = _3497 + 1.0;
    float _3501 = fma(_2222, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3495);
    float _3503 = fma(_3499, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3493);
    float _3505 = _3487 * 0.5;
    float _3507 = _2321 * _3159;
    float _3509 = _3501 + _2230;
    float _3511 = _3475 * _3503;
    float _3513 = fma(_2327, _3507, _2315);
    float _3515 = fma(_2329, _3507, _2317);
    float _3517 = _3511 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3519 = _3509 * 0.5;
    out.gl_Position.x = _2268;
    out.gl_Position.y = _2286;
    out.gl_Position.z = _3501;
    out.gl_Position.w = _2230;
    float _3521 = _3507;
    float _3523 = _3501;
    float _3525 = _3505;
    if (!_3443)
    {
        _3521 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3527 = _3521;
    float _3529 = _3027 * _3517;
    float _3531 = precise::clamp(_3529, 0.0, 1.0);
    out.m_86.x = _3505;
    out.m_86.y = _3477;
    out.m_86.z = _3519;
    out.m_86.w = _2230;
    float _3533 = -_3531;
    float _3535 = fma(_3533, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3537 = _3535 * _3419;
    float _3539 = fma(_2321, _3331, _2319);
    float _3541 = _3537 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3543 = _3527;
    float _3545 = _3527;
    if (!_3443)
    {
        _2435 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3547 = _2435;
    out.m_88.x = _3513;
    out.m_88.y = _3515;
    out.m_88.z = _3539;
    out.m_88.w = _3425;
    float _3549 = _3547;
    float _3551 = _3547;
    if (!_3443)
    {
        _3523 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3553 = _3523;
    float _3555 = _3553;
    float _3557 = _3553;
    if (!_3443)
    {
        _3525 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3559 = _3525;
    out.m_90.x = _3541;
    float _3561 = _3559;
    float _3563 = _3559;
    if (!_3443)
    {
        _2437 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3565 = _2437;
    float _3567 = _3565;
    float _3569 = _3565;
    if (!_3443)
    {
        _2439 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3571 = _2439;
    bool _3573 = !_3443;
    float _3575 = _3571;
    float _3577 = _3571;
    if (!_3573)
    {
        bool _3579 = _1982 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3581 = isnan(_1982);
        bool _3583 = _3579 || _3581;
        bool _3585 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3587 = _3583 || _3585;
        if (!_3587)
        {
            float _3589 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3591 = _1982 + _3589;
            float _3593 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3595 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3593;
            float _3597 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3599 = _3597 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3601 = 1.0 / _3595;
            float _3603 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3605 = _3603 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3607 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3609 = _3607 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3611 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3613 = _3611 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3615 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3617 = _3615 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3619 = _3591 * _3601;
            float _3621 = precise::clamp(_3619, 0.0, 1.0);
            float _3623 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3625 = _3623 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3627 = fma(_3621, _3599, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3629 = fma(_3621, _3625, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3631 = fma(_3621, _3605, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3633 = fma(_3621, _3609, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3635 = fma(_3621, _3613, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3637 = fma(_3621, _3617, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3551 = _3631;
            _3577 = _3635;
            _3563 = _3627;
            _3569 = _3633;
            _3557 = _3629;
            _3545 = _3637;
            _3639 = true;
        }
        else
        {
            bool _3641 = _1982 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3643 = isnan(_1982);
            bool _3645 = _3641 || _3643;
            bool _3647 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3649 = _3645 || _3647;
            if (!_3649)
            {
                _3561 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3651 = _3561;
            _3563 = _3651;
            if (!_3649)
            {
                _3549 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3653 = _3549;
            _3551 = _3653;
            if (!_3649)
            {
                _3555 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3655 = _3555;
            _3557 = _3655;
            if (!_3649)
            {
                _3567 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3657 = _3567;
            _3569 = _3657;
            if (!_3649)
            {
                _3575 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3659 = _3575;
            _3577 = _3659;
            if (!_3649)
            {
                _3543 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3661 = _3543;
            bool _3663 = !_3649;
            _3545 = _3661;
            if (!_3663)
            {
                bool _3665 = _1982 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3667 = isnan(_1982);
                bool _3669 = _3665 || _3667;
                bool _3671 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3673 = _3669 || _3671;
                if (!_3673)
                {
                    float _3675 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3677 = _1982 + _3675;
                    float _3679 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3681 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3679;
                    float _3683 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3685 = _3683 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3687 = 1.0 / _3681;
                    float _3689 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3691 = _3689 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3693 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3695 = _3693 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3697 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3699 = _3697 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3701 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3703 = _3701 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3705 = _3677 * _3687;
                    float _3707 = precise::clamp(_3705, 0.0, 1.0);
                    float _3709 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3711 = _3709 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3713 = fma(_3707, _3685, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3715 = fma(_3707, _3711, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3717 = fma(_3707, _3691, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3719 = fma(_3707, _3695, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3721 = fma(_3707, _3699, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3723 = fma(_3707, _3703, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3551 = _3717;
                    _3577 = _3721;
                    _3563 = _3713;
                    _3569 = _3719;
                    _3557 = _3715;
                    _3545 = _3723;
                    _3639 = true;
                }
                else
                {
                    _3551 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3577 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3563 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3569 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3557 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3545 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3639 = false;
    float _3725 = _3551;
    float _3727 = _3577;
    float _3729 = _3563;
    float _3731 = _3569;
    float _3733 = _3557;
    float _3735 = _3545;
    float _3737 = fma(_3335, -0.5, 0.5);
    float _3739 = precise::clamp(_3737, 0.0, 1.0);
    float _3741 = -_3725;
    float _3743 = _3741 + _3727;
    float _3745 = -_3729;
    float _3747 = _3745 + _3731;
    float _3749 = -_3733;
    float _3751 = _3749 + _3735;
    bool _3753 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3755 = fma(_3739, _3743, _3725);
    float _3757 = fma(_3739, _3747, _3729);
    float _3759 = fma(_3739, _3751, _3733);
    float _3761 = _3755 * 0.586610972881317138671875;
    out.m_92.x = 0.0;
    float _3763 = fma(_3757, 0.298911988735198974609375, _3761);
    float _3765 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3767 = fma(_3759, 0.114477999508380889892578125, _3763);
    out.m_51.x = _3765;
    float _3769 = -_3767;
    float _3771 = _3757 + _3769;
    float _3773 = -_3767;
    float _3775 = _3755 + _3773;
    float _3777 = -_3767;
    float _3779 = _3759 + _3777;
    float _3781 = fma(_3771, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3767);
    float _3783 = fma(_3775, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3767);
    float _3785 = fma(_3779, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3767);
    out.m_94.x = _3781;
    out.m_94.y = _3783;
    out.m_94.z = _3785;
    if (!_3753)
    {
        return out;
    }
    float _3787 = -_1968;
    float _3789 = _3787 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3791 = -_1946;
    float _3793 = _3791 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3795 = -_1457;
    float _3797 = _3795 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3799 = _3789 * _3789;
    float _3801 = fma(_3793, _3793, _3799);
    float _3803 = fma(_3797, _3797, _3801);
    float _3805 = sqrt(_3803);
    float _3807 = rsqrt(_3803);
    float _3809 = -_3805;
    float _3811 = _3809 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3813 = _3811 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3815 = precise::clamp(_3813, 0.0, 1.0);
    float _3817 = _3793 * _3807;
    float _3819 = _3789 * _3807;
    float _3821 = abs(_3815);
    float _3823 = log2(_3821);
    float _3825 = _3797 * _3807;
    float _3827 = _3817 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3829 = _3335 * _3819;
    float _3831 = -_3819;
    float _3833 = -_3827;
    float _3835 = fma(_3831, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3833);
    float _3837 = fma(_3393, _3817, _3829);
    float _3839 = -_3825;
    float _3841 = fma(_3839, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3835);
    float _3843 = fma(_3433, _3825, _3837);
    float _3845 = precise::clamp(_3843, 0.0, 1.0);
    float _3847 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3849 = _3841 + _3847;
    float _3851 = _3823 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3853 = _3849 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3855 = precise::clamp(_3853, 0.0, 1.0);
    float _3857 = exp2(_3851);
    float _3859 = _3857 * _3855;
    float _3861 = _3845 * _3859;
    float _3863 = _3861 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3865 = _3861 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3867 = _3861 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_92.x = _3863;
    out.m_92.y = _3865;
    out.m_92.z = _3867;
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
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3639 = false;
    bool _365 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _108 = in.m_48.w;
    float _110 = trunc(_108);
    int _113 = int(_110);
    bool _117 = _113 >= 1;
    float _119 = 0.0;
    if (!_117)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _121 = _119;
    float _123 = _121;
    if (!_117)
    {
        out.m_51.x = 0.0;
    }
    int _125 = 0;
    if (!_117)
    {
        float _127 = _121 * 5.0;
        _125 = as_type<int>(_127);
    }
    int _129 = _125;
    int _131 = _129;
    if (!_117)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3924 = as_type<float>(_129);
        out.gl_Position.z = _3924;
    }
    if (!_117)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _133 = in.m_53.w;
    bool _135 = _133 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _137 = isnan(_133);
    bool _139 = _135 || _137;
    bool _141 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _143 = _139 || _141;
    float _145 = -_133;
    float _147 = _145 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _149 = _147;
    if (_143)
    {
        float _151 = float(_113);
        _123 = _151;
    }
    float _153 = _123;
    bool _155 = _147 >= _153;
    bool _157 = !_143;
    bool _159 = _155 || _157;
    float _161 = _153;
    if (_159)
    {
        _161 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _163 = _161;
    if (_159)
    {
        out.m_51.x = 0.0;
    }
    if (_159)
    {
        float _165 = _163 * 5.0;
        _131 = as_type<int>(_165);
    }
    int _167 = _131;
    if (_159)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3994 = as_type<float>(_167);
        out.gl_Position.z = _3994;
    }
    if (_159)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _169 = in.m_55.x;
    float _171 = in.m_55.y;
    float _173 = in.m_55.z;
    float _175 = in.m_57.x;
    float _177 = in.m_57.y;
    float _179 = in.m_57.z;
    float _181 = in.m_59.x;
    float _183 = in.m_59.y;
    float _185 = in.m_59.z;
    float _187 = as_type<float>(int(gl_VertexIndex));
    float _189 = _169 * _169;
    float _191 = _171 * _171;
    float _193 = _173 * _173;
    float _195 = fma(_175, _175, _189);
    float _197 = fma(_177, _177, _191);
    float _199 = fma(_179, _179, _193);
    float _201 = fma(_181, _181, _195);
    float _203 = fma(_183, _183, _197);
    float _205 = fma(_185, _185, _199);
    float _207 = sqrt(_201);
    float _209 = sqrt(_203);
    bool _211 = _207 > 0.0;
    float _213 = sqrt(_205);
    bool _215 = _209 > 0.0;
    float _217 = _201;
    if (_211)
    {
        float _219 = rsqrt(_201);
        _217 = _219;
    }
    float _221 = _217;
    float _223 = 0.0;
    float _225 = 0.0;
    if (!_211)
    {
        _223 = 0.0;
        _225 = 0.0;
    }
    float _227 = _223;
    float _229 = _225;
    float _231 = 0.0;
    float _233 = _229;
    float _235 = _227;
    if (!_211)
    {
        _231 = 0.0;
    }
    float _237 = _231;
    bool _239 = _213 > 0.0;
    float _241 = _213;
    float _243 = _237;
    if (_215)
    {
        float _245 = rsqrt(_203);
        _241 = _245;
    }
    float _247 = _241;
    int _249 = as_type<int>(_187) & 1;
    bool _251 = _249 != 0;
    int _253 = as_type<int>(_187) & 2;
    bool _255 = _253 != 0;
    float _257 = 0.0;
    if (!_215)
    {
        _257 = 0.0;
    }
    float _259 = _257;
    float _261 = 0.0;
    float _263 = _259;
    if (!_215)
    {
        _261 = 0.0;
    }
    float _265 = _261;
    float _267 = 0.0;
    float _269 = _265;
    if (!_215)
    {
        _267 = 0.0;
    }
    float _271 = _267;
    float _273 = _271;
    if (_211)
    {
        float _275 = _221 * _169;
        _233 = _275;
    }
    float _277 = _233;
    if (_211)
    {
        float _279 = _221 * _175;
        _243 = _279;
    }
    float _281 = _243;
    float _283 = _209;
    if (_239)
    {
        float _285 = rsqrt(_205);
        _283 = _285;
    }
    float _287 = _283;
    if (_211)
    {
        float _289 = _221 * _181;
        _235 = _289;
    }
    float _291 = _235;
    bool _293 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _295 = 0.0;
    if (!_239)
    {
        _295 = 0.0;
    }
    float _297 = _295;
    float _299 = 0.0;
    float _301 = _297;
    if (!_239)
    {
        _299 = 0.0;
    }
    float _303 = _299;
    float _305 = _303;
    if (_215)
    {
        float _307 = _247 * _171;
        _263 = _307;
    }
    float _309 = _263;
    float _311 = 0.0;
    if (!_239)
    {
        _311 = 0.0;
    }
    float _313 = _311;
    float _315 = _313;
    if (_215)
    {
        float _317 = _247 * _177;
        _269 = _317;
    }
    float _319 = _269;
    if (_215)
    {
        float _321 = _247 * _183;
        _273 = _321;
    }
    float _323 = _273;
    bool _325 = !_251;
    float _327 = _325 ? (-0.5) : 0.5;
    bool _329 = !_255;
    float _331 = _329 ? (-0.5) : 0.5;
    if (_239)
    {
        float _333 = _287 * _173;
        _301 = _333;
    }
    float _335 = _301;
    if (_239)
    {
        float _337 = _287 * _179;
        _305 = _337;
    }
    float _339 = _305;
    if (_239)
    {
        float _341 = _287 * _185;
        _315 = _341;
    }
    float _343 = _315;
    bool _345 = !_293;
    float _363;
    if (!_345)
    {
        float _347 = in.m_64.x;
        float _349 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _351 = _347 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _353 = fma(_351, (*spvDescriptorSet0.vp_c9)._m0[12].x, _147);
        float _355 = _353 * _349;
        float _357 = floor(_355);
        float _359 = -_357;
        float _361 = _355 + _359;
        _363 = _361;
        _365 = true;
    }
    else
    {
        float _367 = float(_113);
        float _369 = 1.0 / _367;
        float _371 = _147 * _369;
        _363 = _371;
    }
    _365 = false;
    float _373 = _363;
    float _375 = in.m_48.x;
    float _377 = in.m_48.y;
    float _379 = in.m_48.z;
    float _381 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _383 = log2(_381);
    float _385 = in.m_66.y;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _389 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _387;
    float _391 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _393 = _391 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _395 = in.m_64.x;
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _399 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _397;
    float _401 = 1.0 / _389;
    float _403 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _405 = _403 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _407 = in.m_64.y;
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _411 = _373 + _409;
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _415 = _373 + _413;
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _419 = _373 + _417;
    float _421 = in.m_64.z;
    bool _423 = _373 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _425 = isnan(_373);
    bool _427 = _423 || _425;
    bool _429 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _431 = _427 || _429;
    float _433 = float(_431);
    float _435 = 1.0 / _399;
    float _437 = _383 * _147;
    float _439 = in.m_57.w;
    float _441 = _177 * _377;
    float _443 = _183 * _377;
    float _445 = 1.0 / _393;
    float _447 = _377 + _385;
    float _449 = fma(_175, _375, _441);
    float _451 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _453 = _395 * 2.0;
    int _455 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _457 = _455 != 0;
    float _459 = fma(_181, _375, _443);
    float _461 = 1.0 / _405;
    float _463 = _407 * 2.0;
    float _465 = _395 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _467 = fma(_185, _379, _459);
    float _469 = fma(_179, _379, _449);
    float _471 = -_451;
    float _473 = fma(_465, 2.0, _471);
    float _475 = floor(_453);
    float _477 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _479 = _407 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _481 = as_type<int>(_451);
    float _483 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    if (_457)
    {
        _481 = 0;
    }
    int _485 = _481;
    float _487 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _489 = _373 + _487;
    int _491 = _485;
    if (!_457)
    {
        _491 = 1;
    }
    int _493 = _491;
    float _495 = fma(_479, -2.0, _477);
    float _497 = floor(_463);
    bool _499 = _493 != 1;
    float _501 = _489 * _401;
    float _503 = float(_113);
    float _505 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _507 = _421 * 2.0;
    float _509 = _411 * _445;
    float _511 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _513 = int(_511);
    bool _515 = _475 > 0.0;
    float _517 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _519 = _475 >= 0.0;
    bool _521 = isnan(_475);
    bool _523 = _519 || _521;
    bool _525 = isnan(0.0);
    bool _527 = _523 || _525;
    float _529 = -_147;
    float _531 = fma(_529, (*spvDescriptorSet0.vp_c9)._m0[76].x, _473);
    float _533 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[76].y, _495);
    float _535 = as_type<float>(_493);
    if (!_499)
    {
        _535 = _407;
    }
    float _537 = _535;
    float _539 = _415 * _435;
    float _541 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _543 = int(_541);
    bool _545 = _497 > 0.0;
    float _547 = in.m_59.w;
    float _549 = _537;
    if (_499)
    {
        _549 = _395;
    }
    float _551 = _549;
    float _553 = _419 * _461;
    bool _555 = _497 >= 0.0;
    bool _557 = isnan(_497);
    bool _559 = _555 || _557;
    bool _561 = isnan(0.0);
    bool _563 = _559 || _561;
    float _565 = _469 + _439;
    int _567 = _527 ? 0 : 1;
    float _569 = fma(_551, (*spvDescriptorSet0.vp_c9)._m0[83].z, _505);
    int _571 = _563 ? 0 : 1;
    float _573 = 1.0 / _503;
    float _575 = float(_513);
    float _577 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].z, _569);
    float _579 = as_type<float>(_513);
    float _581 = _551;
    if (!_499)
    {
        _579 = _407;
    }
    float _583 = _579;
    float _585 = _583;
    if (_499)
    {
        _585 = _395;
    }
    float _587 = _585;
    int _589 = ~_567;
    int _591 = _589 + 1;
    int _593 = _591 + 1;
    float _595 = 1.0 / _575;
    int _597 = ~_571;
    int _599 = _597 + 1;
    int _601 = _599 + 1;
    float _603 = _587 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _605 = float(_543);
    int _607 = _593;
    int _609 = _601;
    float _611 = as_type<float>(_543);
    if (!_515)
    {
        int _613 = ~_567;
        int _615 = _613 + 1;
        _607 = _615;
    }
    int _617 = _607;
    if (!_545)
    {
        int _619 = ~_571;
        int _621 = _619 + 1;
        _609 = _621;
    }
    int _623 = _609;
    float _625 = exp2(_437);
    if (!_499)
    {
        _611 = _421;
    }
    float _627 = _611;
    float _629 = _573 * _147;
    float _631 = _467 + _547;
    float _633 = _627;
    if (_499)
    {
        _633 = _407;
    }
    float _635 = _633;
    float _637 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    if (!_499)
    {
        _581 = _421;
    }
    float _639 = _581;
    float _641 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _643 = _639;
    if (_499)
    {
        _643 = _407;
    }
    float _645 = _643;
    float _647 = _635 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _649 = 1.0 / _605;
    float _651 = -_637;
    float _653 = fma(_603, 2.0, _651);
    float _655 = fma(_645, (*spvDescriptorSet0.vp_c9)._m0[83].w, _517);
    float _657 = fma(_647, -2.0, _641);
    float _659 = -_625;
    float _661 = _659 + 1.0;
    float _663 = -_147;
    float _665 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[81].x, _653);
    float _667 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _669 = 1.0 + _667;
    bool _671 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _673 = isnan(0.0);
    bool _675 = _671 || _673;
    bool _677 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _679 = _675 || _677;
    float _681 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _683 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _685 = 1.0 / _669;
    int _687 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _689 = _687 != 0;
    int _691 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _693 = _691 != 0;
    int _695 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _697 = _695 != 0;
    float _699 = fma(_407, (*spvDescriptorSet0.vp_c9)._m0[78].w, _681);
    bool _701 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _703 = isnan(1.0);
    bool _705 = _701 || _703;
    bool _707 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _709 = _705 || _707;
    float _711 = fma(_395, (*spvDescriptorSet0.vp_c9)._m0[78].z, _683);
    float _713 = _679 ? _661 : 0.0;
    float _715 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].w, _699);
    float _717 = _395 + _407;
    float _719 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].z, _711);
    float _721 = _395 + _421;
    float _723 = floor(_507);
    float _725 = _649 * _147;
    float _727 = _595 * _147;
    float _729 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].w, _655);
    float _731 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[81].y, _657);
    float _733 = _717 + (-1.0);
    if (_709)
    {
        float _735 = _713 * _685;
        _149 = _735;
    }
    float _737 = _149;
    float _739 = _721 + (-1.0);
    int _741 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _743 = _741 != 0;
    int _745 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _747 = _745 != 0;
    int _749 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _751 = _749 != 0;
    int _753 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _755 = _753 != 0;
    float _757 = fma(_733, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _759 = _421 + _407;
    float _761 = fma(_739, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _763 = !_693;
    int _765 = _763 ? 0 : 1;
    float _767 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].y;
    bool _769 = !_689;
    int _771 = _769 ? 0 : 1;
    float _773 = _759 + (-1.0);
    bool _775 = !_697;
    int _777 = _775 ? 0 : 1;
    int _779 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _781 = _779 != 0;
    int _783 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _785 = _783 != 0;
    int _787 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _789 = _787 != 0;
    float _791 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _793 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _791;
    bool _795 = !_747;
    int _797 = _795 ? 0 : 1;
    float _799 = fma(_773, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _801 = !_743;
    int _803 = _801 ? 0 : 1;
    float _805 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _807 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _805;
    int _809 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 65536;
    bool _811 = _809 != 0;
    int _813 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 131072;
    bool _815 = _813 != 0;
    float _817 = fma(_793, _501, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _819 = !_781;
    int _821 = _819 ? 0 : 1;
    float _823 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _825 = _823 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _827 = _723 >= 0.0;
    bool _829 = isnan(_723);
    bool _831 = _827 || _829;
    bool _833 = isnan(0.0);
    bool _835 = _831 || _833;
    float _837 = fma(_807, _501, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _839 = _373 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _841 = isnan(_373);
    bool _843 = _839 || _841;
    bool _845 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _847 = _843 || _845;
    float _849 = float(_847);
    float _851 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _853 = _851 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    int _855 = _835 ? 0 : 1;
    bool _857 = _723 > 0.0;
    float _859 = -_849;
    float _861 = _859 + 1.0;
    bool _863 = _373 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _865 = isnan(_373);
    bool _867 = _863 || _865;
    bool _869 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _871 = _867 || _869;
    float _873 = float(_871);
    float _875 = fma(_853, _509, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _877 = _373 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _879 = isnan(_373);
    bool _881 = _877 || _879;
    bool _883 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _885 = _881 || _883;
    float _887 = float(_885);
    float _889 = fma(_825, _509, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _891 = _373 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _893 = isnan(_373);
    bool _895 = _891 || _893;
    bool _897 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _899 = _895 || _897;
    float _901 = float(_899);
    float _903 = -_873;
    float _905 = _903 + 1.0;
    float _907 = _887 * _861;
    float _909 = -_887;
    float _911 = _909 + 1.0;
    float _913 = _737 + (*spvDescriptorSet0.vp_c9)._m0[202].y;
    float _915 = _901 * _905;
    float _917 = -_901;
    float _919 = _917 + 1.0;
    float _921 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _923 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _921;
    int _925 = ~_855;
    int _927 = _925 + 1;
    int _929 = _927 + 1;
    float _931 = _849 * _919;
    int _933 = _929;
    if (!_857)
    {
        int _935 = ~_855;
        int _937 = _935 + 1;
        _933 = _937;
    }
    int _939 = _933;
    float _941 = _913 * _767;
    int _943 = abs(_821);
    float _945 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _947 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _945;
    bool _949 = !_785;
    int _951 = _949 ? 0 : 1;
    float _953 = in.m_68.x;
    float _955 = in.m_68.y;
    float _957 = in.m_68.z;
    float _959 = fma(_923, _539, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _961 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _963 = _447 + _961;
    int _965 = abs(_951);
    float _967 = fma(_947, _539, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    bool _969 = !_789;
    int _971 = _969 ? 0 : 1;
    float _973 = fma(_395, (*spvDescriptorSet0.vp_c9)._m0[203].y, _941);
    float _975 = float(_943);
    float _977 = _963 * _963;
    float _979 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _981 = _565 + _979;
    float _983 = float(_939);
    float _985 = _973 + 0.25;
    int _987 = abs(_971);
    float _989 = _433 * _911;
    float _991 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _993 = _631 + _991;
    float _995 = fma(_981, _981, _977);
    float _997 = _975 * _983;
    float _999 = floor(_985);
    float _1001 = fma(_993, _993, _995);
    float _1003 = _837 * _989;
    float _1005 = _817 * _989;
    float _1007 = float(_617);
    float _1009 = _997 * (-2.0);
    float _1011 = float(_965);
    float _1013 = floor(_973);
    float _1015 = float(_623);
    float _1017 = _395 + (-0.5);
    float _1019 = float(_987);
    float _1021 = _1011 * _1007;
    float _1023 = fma(_1009, _953, _953);
    float _1025 = fma(_757, _1009, _757);
    int _1027 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 32768;
    bool _1029 = _1027 != 0;
    float _1031 = rsqrt(_1001);
    float _1033 = _1019 * _1015;
    float _1035 = _973 * 6.283185482025146484375;
    float _1037 = -_999;
    float _1039 = _985 + _1037;
    float _1041 = fma(_1017, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1023);
    bool _1043 = !_811;
    int _1045 = _1043 ? 0 : 1;
    float _1047 = _1035 * 0.15915493667125701904296875;
    float _1049 = _1021 * (-2.0);
    float _1051 = -_1013;
    float _1053 = _973 + _1051;
    bool _1055 = _1039 > 0.5;
    float _1057 = fma(_1025, _737, _1041);
    float _1059 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _1061 = _1059 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _1063 = _1047 * 6.283185482025146484375;
    float _1065 = sin(_1063);
    bool _1067 = _1053 >= 0.5;
    bool _1069 = isnan(_1053);
    bool _1071 = _1067 || _1069;
    bool _1073 = isnan(0.5);
    bool _1075 = _1071 || _1073;
    int _1077 = abs(_1045);
    float _1079 = _963 * _1031;
    bool _1081 = !_1029;
    int _1083 = _1081 ? 0 : 1;
    float _1085 = _981 * _1031;
    float _1087 = fma(_1061, _553, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _1089 = -_1079;
    float _1091 = fma(_1089, (*spvDescriptorSet0.vp_c9)._m0[18].w, _963);
    bool _1093 = !_1075;
    float _1095 = _1093 ? 0.5 : (-0.5);
    float _1097 = _1039;
    float _1099 = _1085;
    if (_1055)
    {
        float _1101 = -_1039;
        float _1103 = _1101 + 1.0;
        _1097 = _1103;
    }
    float _1105 = _1097;
    int _1107 = abs(_1083);
    float _1109 = _1091 * _1091;
    float _1111 = float(_1077);
    float _1113 = -_1085;
    float _1115 = fma(_1113, (*spvDescriptorSet0.vp_c9)._m0[18].w, _981);
    float _1117 = _1095 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    float _1119 = _1117 * 2.0;
    float _1121 = _1065 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    bool _1123 = !_815;
    int _1125 = _1123 ? 0 : 1;
    float _1127 = _1111 * _1119;
    float _1129 = float(_1107);
    float _1131 = fma(_1105, 4.0, -1.0);
    int _1133 = abs(_1125);
    float _1135 = _993 * _1031;
    float _1137 = fma(_1115, _1115, _1109);
    float _1139 = fma(_1129, _1121, _1127);
    float _1141 = float(_1133);
    float _1143 = _1131 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    float _1145 = -_1135;
    float _1147 = fma(_1145, (*spvDescriptorSet0.vp_c9)._m0[18].w, _993);
    float _1149 = _1033 * (-2.0);
    float _1151 = _421 + (-0.5);
    float _1153 = fma(_1141, _1143, _1139);
    float _1155 = fma(_1147, _1147, _1137);
    float _1157 = fma(_761, _1149, _761);
    float _1159 = fma(_1149, _957, _957);
    float _1161 = fma(_1153, 3.1415927410125732421875, _955);
    float _1163 = fma(_799, _1049, _799);
    float _1165 = _1057 * 0.15915493667125701904296875;
    float _1167 = fma(_1151, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1159);
    float _1169 = _407 + (-0.5);
    float _1171 = fma(_1161, _1049, _1161);
    float _1173 = -_433;
    float _1175 = _1173 + 1.0;
    float _1177 = fma(_1157, _737, _1167);
    float _1179 = sqrt(_1155);
    float _1181 = fma(_1169, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1171);
    float _1183 = fma(_1175, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1003);
    float _1185 = in.m_70.x;
    float _1187 = in.m_70.y;
    float _1189 = fma(_1175, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1005);
    float _1191 = fma(_1163, _737, _1181);
    float _1193 = fma(_875, _907, _1183);
    float _1195 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _1197 = _1195 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _1199 = fma(_889, _907, _1189);
    float _1201 = _1177 * 0.15915493667125701904296875;
    float _1203 = fma(_959, _931, _1193);
    float _1205 = fma(_1197, _553, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _1207 = fma(_967, _931, _1199);
    float _1209 = _1191 * 0.15915493667125701904296875;
    float _1211 = _1165 * 6.283185482025146484375;
    float _1213 = sin(_1211);
    float _1215 = fma(_1205, _915, _1203);
    float _1217 = fma(_1087, _915, _1207);
    float _1219 = _1031 * _1179;
    float _1221 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _331);
    float _1223 = fma(_873, (*spvDescriptorSet0.vp_c9)._m0[147].x, _1215);
    float _1225 = fma(_873, (*spvDescriptorSet0.vp_c9)._m0[147].y, _1217);
    float _1227 = _1219 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1229 = _1227 * 0.5;
    float _1231 = _1165 * 6.283185482025146484375;
    float _1233 = cos(_1231);
    float _1235 = _1223 * _1185;
    float _1237 = _1225 * _1187;
    float _1239 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _327);
    float _1241 = _1201 * 6.283185482025146484375;
    float _1243 = cos(_1241);
    float _1245 = _1235 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1247 = _1237 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1249 = _1245 * _1219;
    float _1251 = _1247 * _1219;
    float _1253 = _1209 * 6.283185482025146484375;
    float _1255 = sin(_1253);
    float _1257 = _1249 * _1239;
    float _1259 = _1251 * _1221;
    float _1261 = _1209 * 6.283185482025146484375;
    float _1263 = cos(_1261);
    float _1265 = _1233 * _1243;
    float _1267 = _1213 * _1243;
    float _1269 = _1265 * _1229;
    float _1271 = _1201 * 6.283185482025146484375;
    float _1273 = sin(_1271);
    float _1275 = _1213 * _1255;
    float _1277 = _1233 * _1255;
    float _1279 = _1233 * _1263;
    float _1281 = _1213 * _1263;
    float _1283 = _1263 * _1243;
    float _1285 = _1255 * _1243;
    float _1287 = _1267 * _1229;
    float _1289 = fma(_1273, _1279, _1275);
    float _1291 = _1273 * _1229;
    float _1293 = -_1281;
    float _1295 = fma(_1273, _1277, _1293);
    float _1297 = -_1277;
    float _1299 = fma(_1273, _1281, _1297);
    float _1301 = fma(_1289, _1257, _1269);
    float _1303 = -_1291;
    float _1305 = fma(_1283, _1257, _1303);
    float _1307 = fma(_1273, _1275, _1279);
    float _1309 = fma(_1299, _1257, _1287);
    float _1311 = -_1259;
    float _1313 = fma(_1295, _1311, _1301);
    float _1315 = -_1259;
    float _1317 = fma(_1285, _1315, _1305);
    bool _1319 = !_751;
    int _1321 = _1319 ? 0 : 1;
    float _1323 = -_1259;
    float _1325 = fma(_1307, _1323, _1309);
    float _1327 = _1313 * _323;
    float _1329 = _1313 * _319;
    float _1331 = _1313 * _309;
    float _1333 = fma(_1317, _291, _1327);
    float _1335 = fma(_1317, _281, _1329);
    float _1337 = fma(_1317, _277, _1331);
    float _1339 = fma(_1325, _343, _1333);
    float _1341 = fma(_1325, _339, _1335);
    float _1343 = fma(_1325, _335, _1337);
    float _1345 = _631 + _1339;
    float _1347 = _565 + _1341;
    float _1349 = _447 + _1343;
    bool _1351 = !_755;
    int _1353 = _1351 ? 0 : 1;
    float _1355 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1357 = _1345 + _1355;
    float _1359 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1361 = _1347 + _1359;
    float _1363 = _1357 * _1357;
    float _1365 = fma(_1361, _1361, _1363);
    float _1367 = sqrt(_1365);
    bool _1369 = _1367 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1371 = _1337;
    float _1373 = _1343;
    float _1375 = _1363;
    if (!_1369)
    {
        _1371 = _1347;
    }
    float _1377 = _1371;
    float _1379 = _1377;
    if (!_1369)
    {
        _1373 = _1345;
    }
    float _1381 = _1373;
    float _1383 = _1381;
    if (!_1369)
    {
        _1375 = _1349;
    }
    float _1385 = _1375;
    bool _1387 = !_1369;
    float _1389 = _1385;
    if (!_1387)
    {
        float _1391 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1393 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1395 = _1367 + _1393;
        float _1397 = rsqrt(_1365);
        float _1399 = _1395 * _1391;
        float _1401 = _1349 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1403 = _1399 * 0.15915493667125701904296875;
        float _1405 = _1403 * 6.283185482025146484375;
        float _1407 = cos(_1405);
        float _1409 = _1403 * 6.283185482025146484375;
        float _1411 = sin(_1409);
        float _1413 = _1407 + (-1.0);
        float _1415 = _1413 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1417 = fma(_1411, _1401, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1419 = fma(_1349, _1407, _1415);
        float _1421 = _1397 * _1417;
        float _1423 = fma(_1361, _1421, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1425 = fma(_1357, _1421, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1383 = _1425;
        _1379 = _1423;
        _1389 = _1419;
    }
    float _1427 = _1383;
    float _1429 = _1379;
    float _1431 = _1389;
    float _1433 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _1435 = _1427 + _1433;
    float _1437 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _1439 = _1429 + _1437;
    float _1441 = fma(_1435, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _1443 = fma(_1439, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _5903 = float2(_1443, _1441);
    float _1445 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_5903, float2(0.0), isnan(_5903)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_5903, float2(0.0), isnan(_5903)), level(0.0)).x;
    float _1447 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1449 = int(_1447);
    int _1451 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1453 = _1451 != 0;
    float _1455 = -_1135;
    float _1457 = fma(_1455, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1427);
    int _1459 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1461 = _1459 != 0;
    float _1463 = -_1135;
    float _1465 = fma(_1463, (*spvDescriptorSet0.vp_c9)._m0[18].w, _631);
    float _1467 = -_1085;
    float _1469 = fma(_1467, (*spvDescriptorSet0.vp_c9)._m0[18].w, _565);
    int _1471 = abs(_1321);
    float _1473 = trunc(_725);
    int _1475 = int(_1473);
    int _1477 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1479 = _1477 != 0;
    int _1481 = abs(_1353);
    if (_1453)
    {
        _483 = 1.0;
    }
    float _1483 = _483;
    float _1485 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1487 = int(_1485);
    float _1489 = float(uint(_1449));
    float _1491 = trunc(_727);
    int _1493 = int(_1491);
    float _1495 = float(uint(_1475));
    int _1497 = ~_1449;
    int _1499 = _1497 + 1;
    float _1501 = _1483;
    if (!_1453)
    {
        _1501 = 7.345489978790283203125;
    }
    float _1503 = _1501;
    float _1505 = 1.0 / _1489;
    float _1507 = float(uint(_1487));
    int _1509 = ~_1487;
    int _1511 = _1509 + 1;
    float _1513 = 1.0 / _1507;
    float _1515 = float(uint(_1493));
    int _1517 = as_type<int>(_1505) + (-2);
    float _1519 = as_type<float>(_1517) * _1495;
    int _1521 = as_type<int>(_1513) + (-2);
    float _1523 = trunc(_1519);
    float _1525 = precise::max(_1523, 0.0);
    uint _1528 = uint(_1525);
    float _1530 = _1503 * _395;
    float _1532 = float(_1475);
    float _1534 = as_type<float>(_1521) * _1515;
    float _1536 = trunc(_1534);
    float _1538 = precise::max(_1536, 0.0);
    uint _1540 = uint(_1538);
    int _1542 = _1499 * int(_1528);
    int _1544 = _1542 + _1475;
    float _1546 = floor(_1530);
    float _1548 = float(uint(_1544));
    int _1550 = _1511 * int(_1540);
    int _1552 = _1550 + _1493;
    float _1554 = as_type<float>(_1517) * _1548;
    float _1556 = float(_1449);
    float _1558 = float(uint(_1552));
    float _1560 = trunc(_1554);
    float _1562 = precise::max(_1560, 0.0);
    uint _1564 = uint(_1562);
    bool _1566 = _1532 >= _1556;
    bool _1568 = isnan(_1532);
    bool _1570 = _1566 || _1568;
    bool _1572 = isnan(_1556);
    bool _1574 = _1570 || _1572;
    float _1576 = float(_1574);
    float _1578 = -_1546;
    float _1580 = _1530 + _1578;
    float _1582 = as_type<float>(_1521) * _1558;
    float _1584 = float(_1487);
    float _1586 = trunc(_1576);
    int _1588 = int(_1586);
    int _1590 = ~_1449;
    int _1592 = _1590 + 1;
    int _1594 = int(_1528) + int(_1564);
    float _1596 = trunc(_1582);
    float _1598 = precise::max(_1596, 0.0);
    uint _1600 = uint(_1598);
    float _1602 = as_type<float>(_1564);
    float _1604 = as_type<float>(_1528);
    if (_1453)
    {
        _1602 = _395;
    }
    float _1606 = _1602;
    float _1608 = _1606;
    if (_1453)
    {
        _1604 = 1.0;
    }
    float _1610 = _1604;
    int _1612 = _1592 * _1594;
    int _1614 = _1612 + _1475;
    float _1616 = _1610;
    if (!_1453)
    {
        _1608 = _407;
    }
    float _1618 = _1608;
    if (!_1453)
    {
        _1616 = 1.2345600128173828125;
    }
    float _1620 = _1616;
    bool _1622 = uint(_1614) >= uint(_1449);
    float _1624 = _1618 * _1620;
    bool _1626 = !_1622;
    int _1628 = _1626 ? 0 : (-1);
    float _1630 = _1580 * _1556;
    bool _1632 = _1449 == 0;
    float _1634 = floor(_1624);
    int _1636 = ~_1594;
    int _1638 = _1636 + _1628;
    int _1640 = _1638 + 1;
    float _1642 = _1556 * _629;
    int _1644 = ~_1588;
    int _1646 = _1644 + 1;
    int _1648 = _1646 + 1;
    float _1650 = _1584 * _629;
    int _1652 = ~_1487;
    int _1654 = _1652 + 1;
    int _1656 = _1449 * _1640;
    int _1658 = _1656 + _1475;
    int _1660 = int(_1540) + int(_1600);
    float _1662 = trunc(_1630);
    int _1664 = int(_1662);
    int _1666 = abs(_765);
    bool _1668 = !_1632;
    int _1670 = _1668 ? _1658 : (-1);
    int _1672 = _1654 * _1660;
    int _1674 = _1672 + _1493;
    float _1676 = float(_1493);
    float _1678 = -_1634;
    float _1680 = _1624 + _1678;
    bool _1682 = !_1479;
    int _1684 = _1682 ? 0 : 1;
    int _1686 = _1670 * _1648;
    float _1688 = trunc(_1642);
    int _1690 = int(_1688);
    int _1692 = _1449 + (-1);
    float _1694 = _1680 * _1584;
    int _1696 = abs(_1684);
    bool _1698 = _1676 >= _1584;
    bool _1700 = isnan(_1676);
    bool _1702 = _1698 || _1700;
    bool _1704 = isnan(_1584);
    bool _1706 = _1702 || _1704;
    float _1708 = float(_1706);
    int _1710 = _1588 * _1692;
    int _1712 = _1710 + _1686;
    bool _1714 = uint(_1674) >= uint(_1487);
    int _1716 = _1664 * _1696;
    int _1718 = _1716 + _1475;
    bool _1720 = !_1461;
    int _1722 = _1720 ? 0 : 1;
    int _1724 = _1712 * _1666;
    float _1726 = trunc(_1708);
    int _1728 = int(_1726);
    int _1730 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1732 = _1730 != 0;
    int _1734 = abs(_771);
    int _1736 = abs(_777);
    bool _1738 = !_1714;
    int _1740 = _1738 ? 0 : (-1);
    int _1742 = _1690 * _1734;
    int _1744 = _1742 + _1724;
    int _1746 = abs(_1722);
    float _1748 = trunc(_1694);
    int _1750 = int(_1748);
    bool _1752 = !_1732;
    int _1754 = _1752 ? 0 : 1;
    int _1756 = ~_1660;
    int _1758 = _1756 + _1740;
    int _1760 = _1758 + 1;
    int _1762 = abs(_1754);
    int _1764 = _1718 * _1736;
    int _1766 = _1764 + _1744;
    int _1768 = _1487 * _1760;
    int _1770 = _1768 + _1493;
    bool _1772 = _1487 == 0;
    float _1774 = trunc(_1650);
    int _1776 = int(_1774);
    int _1778 = ~_1728;
    int _1780 = _1778 + 1;
    int _1782 = _1780 + 1;
    int _1784 = _1664 * _1746;
    int _1786 = _1784 + _1766;
    bool _1788 = !_1772;
    int _1790 = _1788 ? _1770 : (-1);
    int _1792 = _1750 * _1762;
    int _1794 = _1792 + _1493;
    int _1796 = _1487 + (-1);
    int _1798 = abs(_797);
    int _1800 = _1790 * _1782;
    float _1802 = float(uint(_1786));
    int _1804 = _1728 * _1796;
    int _1806 = _1804 + _1800;
    int _1808 = abs(_803);
    float _1810 = as_type<float>(_1517) * _1802;
    float _1812 = float(uint(_1794));
    int _1814 = _1806 * _1798;
    float _1816 = trunc(_1810);
    float _1818 = precise::max(_1816, 0.0);
    uint _1820 = uint(_1818);
    float _1822 = as_type<float>(_1521) * _1812;
    int _1824 = _1776 * _1808;
    int _1826 = _1824 + _1814;
    int _1828 = ~_1487;
    int _1830 = _1828 + 1;
    int _1832 = _1794 * _1471;
    int _1834 = _1832 + _1826;
    int _1836 = ~_1449;
    int _1838 = _1836 + 1;
    float _1840 = trunc(_1822);
    float _1842 = precise::max(_1840, 0.0);
    uint _1844 = uint(_1842);
    float _1846 = float(uint(_1718));
    int _1848 = _1750 * _1481;
    int _1850 = _1848 + _1834;
    int _1852 = ~_1487;
    int _1854 = _1852 + 1;
    int _1856 = ~_1449;
    int _1858 = _1856 + 1;
    int _1860 = _1838 * int(_1820);
    int _1862 = _1860 + _1786;
    float _1864 = float(uint(_1850));
    float _1866 = as_type<float>(_1517) * _1846;
    float _1868 = float(uint(_1862));
    float _1870 = as_type<float>(_1521) * _1864;
    float _1872 = trunc(_1866);
    float _1874 = precise::max(_1872, 0.0);
    uint _1876 = uint(_1874);
    float _1878 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1880 = as_type<float>(_1517) * _1868;
    float _1882 = trunc(_1870);
    float _1884 = precise::max(_1882, 0.0);
    uint _1886 = uint(_1884);
    int _1888 = ~_1449;
    int _1890 = _1888 + 1;
    float _1892 = trunc(_1880);
    float _1894 = precise::max(_1892, 0.0);
    uint _1896 = uint(_1894);
    int _1898 = _1890 * int(_1876);
    int _1900 = _1898 + _1718;
    float _1902 = float(uint(_1900));
    int _1904 = _1854 * int(_1886);
    int _1906 = _1904 + _1850;
    int _1908 = int(_1820) + int(_1896);
    float _1910 = float(uint(_1906));
    float _1912 = as_type<float>(_1521) * _1910;
    int _1914 = _1858 * _1908;
    int _1916 = _1914 + _1786;
    bool _1918 = uint(_1916) >= uint(_1449);
    float _1920 = trunc(_1912);
    float _1922 = precise::max(_1920, 0.0);
    uint _1924 = uint(_1922);
    int _1926 = _1830 * int(_1844);
    int _1928 = _1926 + _1794;
    bool _1930 = !_1918;
    int _1932 = _1930 ? 0 : (-1);
    float _1934 = float(uint(_1928));
    int _1936 = ~_1908;
    int _1938 = _1936 + _1932;
    int _1940 = _1938 + 1;
    float _1942 = as_type<float>(_1517) * _1902;
    float _1944 = -_1085;
    float _1946 = fma(_1944, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1429);
    float _1948 = as_type<float>(_1521) * _1934;
    int _1950 = _1449 * _1940;
    int _1952 = _1950 + _1786;
    float _1954 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1956 = _1946 + _1954;
    int _1958 = int(_1886) + int(_1924);
    float _1960 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1962 = _1457 + _1960;
    float _1964 = fma(_1445, 100.0, _1431);
    float _1966 = -_1079;
    float _1968 = fma(_1966, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1964);
    float _1970 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1972 = _1968 + _1970;
    float _1974 = _1972 * _1972;
    float _1976 = fma(_1956, _1956, _1974);
    float _1978 = fma(_1962, _1962, _1976);
    float _1980 = rsqrt(_1978);
    float _1982 = sqrt(_1978);
    float _1984 = _1980 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1986 = _1956 * _1984;
    float _1988 = _1962 * _1984;
    float _1990 = _1986 * _1986;
    float _1992 = _1988 * _1988;
    float _1994 = _1990 + _1992;
    float _1996 = sqrt(_1994);
    bool _1998 = _1996 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2000 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2002 = _1996 + _2000;
    float _2004 = _1980;
    float _2006 = _1994;
    float _2008 = _2002;
    float _2010 = as_type<float>(_1928);
    float _2012 = as_type<float>(_1728);
    float _2014 = _1984;
    float _2016 = _1986;
    if (_1998)
    {
        float _2018 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2004 = _2018;
    }
    float _2020 = _2004;
    if (_1998)
    {
        float _2022 = rsqrt(_1994);
        _2006 = _2022;
    }
    float _2024 = _2006;
    float _2026 = _2024;
    if (_1998)
    {
        float _2028 = _2002 * _2020;
        _2008 = _2028;
    }
    float _2030 = _2008;
    if (_1998)
    {
        float _2032 = _2030 * 0.15915493667125701904296875;
        _1099 = _2032;
    }
    float _2034 = _1099;
    float _2036 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2038 = (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2040 = _2034;
    if (_1998)
    {
        float _2042 = _2034 * 6.283185482025146484375;
        float _2044 = sin(_2042);
        _2038 = _2044;
    }
    float _2046 = _2038;
    float _2048 = precise::max(0.0, _2036);
    float _2050 = _1962;
    if (_1998)
    {
        float _2052 = _2034 * 6.283185482025146484375;
        float _2054 = cos(_2052);
        _2050 = _2054;
    }
    float _2056 = _2050;
    float _2058 = -_1984;
    float _2060 = -_2048;
    float _2062 = fma(_1972, _2058, _2060);
    float _2064 = _2062;
    if (_1998)
    {
        float _2066 = _2062 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2010 = _2066;
    }
    float _2068 = _2010;
    float _2070 = fma(_1469, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2072 = _2068;
    if (_1998)
    {
        float _2074 = fma(_2046, _2068, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2072 = _2074;
    }
    float _2076 = _2072;
    float _2078 = _2076;
    if (!_1998)
    {
        _2040 = _1986;
    }
    float _2080 = _2040;
    float _2082 = floor(_2070);
    float _2084 = _2080;
    if (_1998)
    {
        float _2086 = _2024 * _2076;
        _2012 = _2086;
    }
    float _2088 = _2012;
    if (!_1998)
    {
        _2026 = _1988;
    }
    float _2090 = _2026;
    float _2092 = _2090;
    if (_1998)
    {
        float _2094 = _2056 + (-1.0);
        _2014 = _2094;
    }
    float _2096 = _2014;
    float _2098 = _2096;
    if (_1998)
    {
        float _2100 = _1986 * _2088;
        _2084 = _2100;
    }
    float _2102 = _2084;
    if (!_1998)
    {
        _2078 = _1990;
    }
    float _2104 = _2078;
    float _2106 = _2104;
    if (_1998)
    {
        float _2108 = _1988 * _2088;
        _2092 = _2108;
    }
    float _2110 = _2092;
    if (_1998)
    {
        float _2112 = _2096 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2098 = _2112;
    }
    float _2114 = _2098;
    if (_1998)
    {
        float _2116 = _2102 * _2102;
        _2106 = _2116;
    }
    float _2118 = _2106;
    if (!_1998)
    {
        _2016 = _1992;
    }
    float _2120 = _2016;
    float _2122 = _2120;
    if (_1998)
    {
        float _2124 = _2110 * _2110;
        _2122 = _2124;
    }
    float _2126 = _2122;
    if (_1998)
    {
        float _2128 = fma(_2062, _2056, _2114);
        _2064 = _2128;
    }
    float _2130 = _2064;
    float _2132 = _1968 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2134 = -_2082;
    float _2136 = _2070 + _2134;
    float _2138 = fma(_2130, _2130, _2118);
    float _2140 = fma(_1465, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2142 = _2138 + _2126;
    float _2144 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2146 = fma(_1982, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2144);
    float _2148 = precise::clamp(_2146, 0.0, 1.0);
    float _2150 = fma(_1946, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2132);
    float _2152 = _1968 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2154 = rsqrt(_2142);
    float _2156 = -_2148;
    float _2158 = _2156 + 1.0;
    float _2160 = fma(_1457, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2150);
    float _2162 = _1968 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2164 = fma(_1946, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2152);
    float _2166 = _2160 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2168 = fma(_1946, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2162);
    float _2170 = abs(_2158);
    float _2172 = log2(_2170);
    float _2174 = fma(_1457, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2164);
    float _2176 = _2166 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2178 = fma(_1457, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2168);
    float _2180 = _1968 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2182 = _2174 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2184 = -_2176;
    float _2186 = fma(_2184, _1878, 1.0);
    float _2188 = _2178 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2190 = _2154 * _2102;
    float _2192 = _2182 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2194 = _2154 * _2130;
    float _2196 = _2154 * _2110;
    float _2198 = _2190 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2200 = fma(_2188, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2192);
    float _2202 = fma(_1946, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2180);
    float _2204 = floor(_2140);
    float _2206 = _2172 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2208 = -_2198;
    float _2210 = fma(_2194, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2208);
    float _2212 = fma(_1457, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2202);
    float _2214 = fma(_2166, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2200);
    float _2216 = _2182 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2218 = -_2196;
    float _2220 = fma(_2218, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2210);
    float _2222 = _2212 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2224 = exp2(_2206);
    float _2226 = fma(_2220, -0.5, 0.5);
    float _2228 = fma(_2220, 0.5, 0.5);
    float _2230 = fma(_2222, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2214);
    float _2232 = _2194 + 1.0;
    float _2234 = _2182 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2236 = fma(_2228, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2238 = 1.0 / _2230;
    float _2240 = -_2204;
    float _2242 = _2140 + _2240;
    float _2244 = fma(_2188, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2234);
    float _2246 = fma(_2166, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2244);
    float _2248 = log2(_2186);
    float _2250 = -_2194;
    float _2252 = fma(_2224, _2232, _2250);
    float _2254 = fma(_2228, _2236, -0.212114393711090087890625);
    float _2256 = fma(_2188, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2216);
    int _2258 = ~_1487;
    int _2260 = _2258 + 1;
    float _2262 = fma(_2228, _2254, 1.570728778839111328125);
    float _2264 = fma(_2166, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2256);
    float _2266 = sqrt(_2226);
    float _2268 = fma(_2222, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2264);
    float _2270 = _2268 * _2238;
    float _2272 = trunc(_1942);
    float _2274 = precise::max(_2272, 0.0);
    uint _2276 = uint(_2274);
    float _2278 = _2248 * 0.693147182464599609375;
    float2 _7139 = float2(_2136, _2242);
    float _2280 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7139, float2(0.0), isnan(_7139)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7139, float2(0.0), isnan(_7139)), level(0.0)).x;
    float _2282 = _2278 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2284 = _2266 * 0.636619746685028076171875;
    float _2286 = fma(_2222, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2246);
    float _2288 = trunc(_1948);
    float _2290 = precise::max(_2288, 0.0);
    uint _2292 = uint(_2290);
    float _2294 = fma(_2270, 0.5, 0.5);
    float _2296 = -_2262;
    float _2298 = fma(_2284, _2296, 1.0);
    float _2300 = _2286 * _2238;
    int _2302 = _2260 * _1958;
    int _2304 = _2302 + _1850;
    float _2306 = fma(_2300, -0.5, 0.5);
    float _2308 = fma(_2252, 0.5, 0.5);
    float3 _7186 = float3(_2294, _2306, _2282);
    float _2310 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7186, float3(0.0), isnan(_7186)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7186, float3(0.0), isnan(_7186)), level(0.0)).x;
    float3 _7197 = float3(_2294, _2306, _2282);
    float4 _2313 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7197, float3(0.0), isnan(_7197)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7197, float3(0.0), isnan(_7197)), level(0.0)).xyzw;
    float _2315 = _2313.x;
    float _2317 = _2313.y;
    float _2319 = _2313.z;
    float _2321 = _2313.w;
    float2 _7213 = float2(_2298, _2308);
    float3 _2325 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7213, float2(0.0), isnan(_7213)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7213, float2(0.0), isnan(_7213)), level(0.0)).xyz;
    float _2327 = _2325.x;
    float _2329 = _2325.y;
    float _2331 = _2325.z;
    bool _2333 = uint(_2304) >= uint(_1487);
    float _2335 = fma(_1445, 100.0, _447);
    bool _2337 = !_1632;
    int _2339 = _2337 ? _1952 : (-1);
    float _2341 = _2172 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2343 = !_2333;
    int _2345 = _2343 ? 0 : (-1);
    float _2347 = -_1079;
    float _2349 = fma(_2347, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2335);
    bool _2351 = _407 > 0.5;
    float _2353 = -_715;
    float _2355 = _2353 + 1.0;
    int _2357 = ~_1958;
    int _2359 = _2357 + _2345;
    int _2361 = _2359 + 1;
    float _2363 = _2349 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    int _2365 = _2339 & 3;
    bool _2367 = _2365 != 0;
    float _2369 = -_729;
    float _2371 = _2369 + 1.0;
    int _2373 = _2339 >> 31;
    int _2375 = _1487 * _2361;
    int _2377 = _2375 + _1850;
    bool _2379 = uint(_2365) > 1u;
    float _2381 = exp2(_2341);
    int _2383 = int(_1876) + int(_2276);
    float _2385 = _2182 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2387 = ~_1449;
    int _2389 = _2387 + 1;
    out.m_72.x = _1946;
    out.m_72.y = _1968;
    out.m_72.z = _1457;
    int _2391 = _2339 & 3;
    bool _2393 = _2391 != 0;
    float _2395 = fma(_2188, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2385);
    int _2397 = _2373 & 3;
    int _2399 = _2389 * _2383;
    int _2401 = _2399 + _1718;
    bool _2403 = !_1772;
    int _2405 = _2403 ? _2377 : (-1);
    int _2407 = _2393 ? 0 : 1;
    bool _2409 = _2365 != 3;
    bool _2411 = uint(_2365) >= 2u;
    float _2413 = -_2381;
    float _2415 = _2413 + 1.0;
    int _2417 = _2339 + _2397;
    int _2419 = _2405 >> 31;
    float _2421 = _2415 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _2423 = _2411 ? 0 : 1;
    int _2425 = ~_2407;
    int _2427 = _2425 + 1;
    int _2429 = _2427 + 1;
    bool _2431 = uint(_2401) >= uint(_1449);
    int _2433 = _2429;
    float _2435 = _2230;
    float _2437 = _2286;
    float _2439 = _2268;
    if (!_2379)
    {
        int _2441 = ~_2407;
        int _2443 = _2441 + 1;
        _2433 = _2443;
    }
    int _2445 = _2433;
    int _2447 = _2419 & 3;
    float _2449 = in.m_64.w;
    int _2451 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2453 = _2451 != 0;
    bool _2455 = !_2431;
    int _2457 = _2455 ? 0 : (-1);
    int _2459 = _2405 + _2447;
    bool _2461 = !_2453;
    int _2463 = _2461 ? 0 : 1;
    int _2465 = _2405 & 3;
    bool _2467 = _2465 != 0;
    int _2469 = _2405 & 3;
    bool _2471 = _2469 != 0;
    int _2473 = ~_2423;
    int _2475 = _2473 + 1;
    int _2477 = _2475 + 1;
    int _2479 = _2477;
    if (_2409)
    {
        int _2481 = ~_2423;
        int _2483 = _2481 + 1;
        _2479 = _2483;
    }
    int _2485 = _2479;
    int _2487 = _2459 >> 2;
    int _2489 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2491 = _2489 != 0;
    bool _2493 = !_2367;
    int _2495 = _2493 ? 0 : 1;
    bool _2497 = uint(_2469) >= 2u;
    int _2499 = int(_1844) + int(_2292);
    int _2501 = ~_1487;
    int _2503 = _2501 + 1;
    int _2505 = _2487 << 4;
    int _2507 = _2505 + 512;
    bool _2509 = !_2491;
    int _2511 = _2509 ? 0 : 1;
    int _2513 = _2503 * _2499;
    int _2515 = _2513 + _1794;
    bool _2517 = uint(_2469) > 1u;
    int _2519 = _2417 >> 2;
    int _2521 = _2497 ? 0 : 1;
    bool _2523 = _2365 != 3;
    uint _2525 = uint(int(uint(_2507) >> uint(2)));
    uint _2527 = uint(int(uint(int(_2525)) >> uint(2)));
    int _2529 = int(_2525) & 3;
    float _2531 = (*spvDescriptorSet0.vp_c9)._m0[int(_2527)][_2529];
    int _2533 = int(_2525) + 1;
    uint _2535 = uint(int(uint(_2533) >> uint(2)));
    int _2537 = _2533 & 3;
    float _2539 = (*spvDescriptorSet0.vp_c9)._m0[int(_2535)][_2537];
    int _2541 = _2519 << 4;
    int _2543 = _2541 + 368;
    bool _2545 = !_2471;
    int _2547 = _2545 ? 0 : 1;
    bool _2549 = _2469 != 3;
    int _2551 = _2467 ? 0 : 1;
    bool _2553 = uint(_2515) >= uint(_1487);
    uint _2555 = uint(int(uint(_2543) >> uint(2)));
    uint _2557 = uint(int(uint(int(_2555)) >> uint(2)));
    int _2559 = int(_2555) & 3;
    float _2561 = (*spvDescriptorSet0.vp_c9)._m0[int(_2557)][_2559];
    int _2563 = int(_2555) + 1;
    uint _2565 = uint(int(uint(_2563) >> uint(2)));
    int _2567 = _2563 & 3;
    float _2569 = (*spvDescriptorSet0.vp_c9)._m0[int(_2565)][_2567];
    int _2571 = ~_2551;
    int _2573 = _2571 + 1;
    int _2575 = _2573 + 1;
    int _2577 = _2575;
    if (!_2517)
    {
        int _2579 = ~_2551;
        int _2581 = _2579 + 1;
        _2577 = _2581;
    }
    int _2583 = _2577;
    bool _2585 = _2469 != 3;
    int _2587 = ~_2521;
    int _2589 = _2587 + 1;
    int _2591 = _2589 + 1;
    bool _2593 = !_2553;
    int _2595 = _2593 ? 0 : (-1);
    int _2597 = _2591;
    if (_2549)
    {
        int _2599 = ~_2521;
        int _2601 = _2599 + 1;
        _2597 = _2601;
    }
    int _2603 = _2597;
    bool _2605 = !_2523;
    int _2607 = _2605 ? 0 : (-1);
    bool _2609 = !_2585;
    int _2611 = _2609 ? 0 : (-1);
    int _2613 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2615 = _2613 != 0;
    int _2617 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2619 = _2617 != 0;
    int _2621 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2623 = _2621 != 0;
    int _2625 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2627 = _2625 != 0;
    float _2629 = -_331;
    int _2631 = _2351 ? as_type<int>(_2629) : as_type<int>(_331);
    float _2633 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    bool _2635 = _2449 > 0.5;
    int _2637 = _2543 + 8;
    uint _2639 = uint(int(uint(_2637) >> uint(2)));
    uint _2641 = uint(int(uint(int(_2639)) >> uint(2)));
    int _2643 = int(_2639) & 3;
    float _2645 = (*spvDescriptorSet0.vp_c9)._m0[int(_2641)][_2643];
    int _2647 = int(_2639) + 1;
    uint _2649 = uint(int(uint(_2647) >> uint(2)));
    int _2651 = _2647 & 3;
    float _2653 = (*spvDescriptorSet0.vp_c9)._m0[int(_2649)][_2651];
    float _2655 = _2633 * _395;
    float _2657 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _2659 = abs(_2445);
    float _2661 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _2663 = ~_2383;
    int _2665 = _2663 + _2457;
    int _2667 = _2665 + 1;
    int _2669 = _2507 + 8;
    uint _2671 = uint(int(uint(_2669) >> uint(2)));
    uint _2673 = uint(int(uint(int(_2671)) >> uint(2)));
    int _2675 = int(_2671) & 3;
    float _2677 = (*spvDescriptorSet0.vp_c9)._m0[int(_2673)][_2675];
    int _2679 = int(_2671) + 1;
    uint _2681 = uint(int(uint(_2679) >> uint(2)));
    int _2683 = _2679 & 3;
    float _2685 = (*spvDescriptorSet0.vp_c9)._m0[int(_2681)][_2683];
    float _2687 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2689 = trunc(_2655);
    int _2691 = int(_2689);
    int _2693 = _1449 * _2667;
    int _2695 = _2693 + _1718;
    float _2697 = _2687 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2699 = abs(_2583);
    float _2701 = _2657 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2703 = !_2619;
    float _2705 = _2703 ? _331 : as_type<float>(_2631);
    float _2707 = _2661 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2709 = _395 > 0.5;
    float _2711 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _2713 = ~_2699;
    int _2715 = _2713 + 1;
    int _2717 = _2715 + 1;
    int _2719 = abs(_2495);
    int _2721 = _2717 * as_type<int>(_2539);
    float _2723 = -_331;
    int _2725 = _2635 ? as_type<int>(_2723) : as_type<int>(_331);
    out.m_74.x = _2701;
    out.m_74.y = _2697;
    out.m_74.z = _2707;
    out.m_74.w = _2711;
    bool _2727 = _421 > 0.5;
    int _2729 = ~_2659;
    int _2731 = _2729 + 1;
    int _2733 = _2731 + 1;
    int _2735 = abs(_2547);
    int _2737 = _2733 * as_type<int>(_2569);
    int _2739 = ~_2719;
    int _2741 = _2739 + 1;
    int _2743 = _2741 + 1;
    int _2745 = _2691 << 4;
    int _2747 = _2745 + 1968;
    int _2749 = abs(_2485);
    int _2751 = _2743 * as_type<int>(_2561);
    int _2753 = _2751 + _2737;
    int _2755 = ~_2735;
    int _2757 = _2755 + 1;
    int _2759 = _2757 + 1;
    uint _2761 = uint(int(uint(_2747) >> uint(2)));
    uint _2763 = uint(int(uint(int(_2761)) >> uint(2)));
    int _2765 = int(_2761) & 3;
    float _2767 = (*spvDescriptorSet0.vp_c9)._m0[int(_2763)][_2765];
    int _2769 = int(_2761) + 1;
    uint _2771 = uint(int(uint(_2769) >> uint(2)));
    int _2773 = _2769 & 3;
    float _2775 = (*spvDescriptorSet0.vp_c9)._m0[int(_2771)][_2773];
    float _2777 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2779 = int(_2777);
    int _2781 = abs(_2603);
    int _2783 = _2759 * as_type<int>(_2531);
    int _2785 = _2783 + _2721;
    int _2787 = ~_2749;
    int _2789 = _2787 + 1;
    int _2791 = _2789 + 1;
    int _2793 = abs(_2611);
    int _2795 = _2747 + 8;
    uint _2797 = uint(int(uint(_2795) >> uint(2)));
    uint _2799 = uint(int(uint(int(_2797)) >> uint(2)));
    int _2801 = int(_2797) & 3;
    float _2803 = (*spvDescriptorSet0.vp_c9)._m0[int(_2799)][_2801];
    int _2805 = abs(_2607);
    float _2807 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2809 = int(_2807);
    int _2811 = _2791 * as_type<int>(_2645);
    int _2813 = _2811 + _2753;
    float _2815 = _327 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2817 = ~_2781;
    int _2819 = _2817 + 1;
    int _2821 = _2819 + 1;
    int _2823 = ~_2499;
    int _2825 = _2823 + _2595;
    int _2827 = _2825 + 1;
    int _2829 = ~_2805;
    int _2831 = _2829 + 1;
    int _2833 = _2831 + 1;
    int _2835 = _2821 * as_type<int>(_2677);
    int _2837 = _2835 + _2785;
    int _2839 = ~_2793;
    int _2841 = _2839 + 1;
    int _2843 = _2841 + 1;
    int _2845 = _1487 * _2827;
    int _2847 = _2845 + _1794;
    int _2849 = abs(_2463);
    int _2851 = _2833 * as_type<int>(_2653);
    int _2853 = _2851 + _2813;
    float _2855 = float(uint(_2779));
    int _2857 = _2843 * as_type<int>(_2685);
    int _2859 = _2857 + _2837;
    float _2861 = float(uint(_2809));
    float _2863 = 1.0 / _2855;
    int _2865 = abs(_2511);
    int _2867 = ~_2849;
    int _2869 = _2867 + 1;
    int _2871 = _2869 + 1;
    int _2873 = ~_2865;
    int _2875 = _2873 + 1;
    int _2877 = _2875 + 1;
    int _2879 = abs(_2779);
    float _2881 = 1.0 / _2861;
    int _2883 = _2853 * _2871;
    bool _2885 = !_1632;
    int _2887 = _2885 ? _2695 : (-1);
    int _2889 = _2859 * _2877;
    bool _2891 = !_1772;
    int _2893 = _2891 ? _2847 : (-1);
    int _2895 = abs(_2809);
    int _2897 = _2887 * _2849;
    int _2899 = _2897 + _2883;
    float _2901 = float(uint(_2879));
    int _2903 = _2893 * _2865;
    int _2905 = _2903 + _2889;
    float _2907 = _2767 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _2909 = as_type<int>(_2863) + (-2);
    float _2911 = _2775 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2913 = 1.0 / _2901;
    float _2915 = float(uint(_2895));
    float _2917 = _2907 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2919 = as_type<int>(_2881) + (-2);
    float _2921 = _2911 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2923 = float(uint(_2905));
    float _2925 = _2803 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2927 = float(uint(_2899));
    float _2929 = 1.0 / _2915;
    bool _2931 = !_2627;
    float _2933 = _2931 ? _331 : as_type<float>(_2725);
    float _2935 = _331 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2937 = -_327;
    int _2939 = _2727 ? as_type<int>(_2937) : as_type<int>(_327);
    float _2941 = as_type<float>(_2909) * _2927;
    float _2943 = _2925 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2945 = fma(_2935, _2935, 1.0);
    bool _2947 = !_2623;
    float _2949 = _2947 ? _327 : as_type<float>(_2939);
    float _2951 = as_type<float>(_2919) * _2923;
    float _2953 = trunc(_2941);
    float _2955 = precise::max(_2953, 0.0);
    uint _2957 = uint(_2955);
    int _2959 = abs(_2899);
    out.m_76.x = _2917;
    out.m_76.y = _2921;
    out.m_76.z = _2943;
    float _2961 = -_327;
    int _2963 = _2709 ? as_type<int>(_2961) : as_type<int>(_327);
    float _2965 = float(uint(_2959));
    bool _2967 = !_2615;
    float _2969 = _2967 ? _327 : as_type<float>(_2963);
    float _2971 = trunc(_2951);
    float _2973 = precise::max(_2971, 0.0);
    uint _2975 = uint(_2973);
    int _2977 = abs(_2905);
    int _2979 = ~_2809;
    int _2981 = _2979 + 1;
    int _2983 = ~_2779;
    int _2985 = _2983 + 1;
    int _2987 = as_type<int>(_2913) + (-2);
    float _2989 = rsqrt(_2945);
    int _2991 = as_type<int>(_2929) + (-2);
    float _2993 = -_1273;
    float _2995 = fma(_1283, _2815, _2993);
    float _2997 = float(uint(_2977));
    float _2999 = as_type<float>(_2987) * _2965;
    int _3001 = _2985 * int(_2957);
    int _3003 = _3001 + _2899;
    float _3005 = -_2935;
    float _3007 = fma(_1285, _3005, _2995);
    int _3009 = _2981 * int(_2975);
    int _3011 = _3009 + _2905;
    int _3013 = ~_2895;
    int _3015 = _3013 + 1;
    float _3017 = trunc(_2999);
    float _3019 = precise::max(_3017, 0.0);
    uint _3021 = uint(_3019);
    float _3023 = float(uint(_3011));
    float _3025 = -_2280;
    float _3027 = _3025 + 1.0;
    float _3029 = _2935 * _2989;
    float _3031 = -_2989;
    float _3033 = _1285 * _3031;
    float _3035 = as_type<float>(_2991) * _2997;
    float _3037 = float(uint(_3003));
    float _3039 = as_type<float>(_2919) * _3023;
    float _3041 = fma(_1273, _3029, _3033);
    float _3043 = trunc(_3035);
    float _3045 = precise::max(_3043, 0.0);
    uint _3047 = uint(_3045);
    int _3049 = ~_2879;
    int _3051 = _3049 + 1;
    float _3053 = as_type<float>(_2909) * _3037;
    float _3055 = fma(_1289, _2815, _1265);
    float _3057 = fma(_1299, _2815, _1267);
    float _3059 = trunc(_3053);
    float _3061 = precise::max(_3059, 0.0);
    uint _3063 = uint(_3061);
    float _3065 = -_2989;
    float _3067 = _1307 * _3065;
    int _3069 = _3051 * int(_3021);
    int _3071 = _3069 + _2959;
    float _3073 = -_2935;
    float _3075 = fma(_1295, _3073, _3055);
    float _3077 = -_2989;
    float _3079 = _1295 * _3077;
    float _3081 = -_2935;
    float _3083 = fma(_1307, _3081, _3057);
    float _3085 = -_3029;
    float _3087 = fma(_1267, _3085, _3067);
    float _3089 = float(uint(_3071));
    int _3091 = _3015 * int(_3047);
    int _3093 = _3091 + _2977;
    float _3095 = -_3029;
    float _3097 = fma(_1265, _3095, _3079);
    float _3099 = trunc(_3039);
    float _3101 = precise::max(_3099, 0.0);
    uint _3103 = uint(_3101);
    float _3105 = _1289 * _319;
    float _3107 = as_type<float>(_2987) * _3089;
    float _3109 = float(uint(_3093));
    float _3111 = _1289 * _309;
    float _3113 = _1289 * _323;
    float _3115 = fma(_1283, _281, _3105);
    float _3117 = _3097 * _319;
    float _3119 = trunc(_3107);
    float _3121 = precise::max(_3119, 0.0);
    uint _3123 = uint(_3121);
    float _3125 = as_type<float>(_2991) * _3109;
    float _3127 = fma(_1283, _277, _3111);
    float _3129 = fma(_1283, _291, _3113);
    float _3131 = fma(_1299, _339, _3115);
    float _3133 = _3075 * _323;
    float _3135 = fma(_1299, _335, _3127);
    float _3137 = fma(_1299, _343, _3129);
    float _3139 = trunc(_3125);
    float _3141 = precise::max(_3139, 0.0);
    uint _3143 = uint(_3141);
    float _3145 = _3075 * _319;
    int _3147 = ~_2809;
    int _3149 = _3147 + 1;
    float _3151 = _3075 * _309;
    float _3153 = _3097 * _309;
    float _3155 = _3097 * _323;
    out.m_78.x = _3131;
    out.m_78.y = _3135;
    out.m_78.z = _3137;
    int _3157 = int(_2957) + int(_3063);
    float _3159 = _2421 * _2310;
    int _3161 = ~_2879;
    int _3163 = _3161 + 1;
    float _3165 = fma(_3007, _277, _3151);
    int _3167 = int(_3021) + int(_3123);
    float _3169 = -_2421;
    float _3171 = _3169 + 1.0;
    int _3173 = ~_2779;
    int _3175 = _3173 + 1;
    int _3177 = int(_2975) + int(_3103);
    int _3179 = _3163 * _3167;
    int _3181 = _3179 + _2959;
    int _3183 = int(_3047) + int(_3143);
    int _3185 = _3175 * _3157;
    int _3187 = _3185 + _2899;
    float _3189 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _3191 = ~_2895;
    int _3193 = _3191 + 1;
    float _3195 = fma(_3041, _277, _3153);
    bool _3197 = uint(_3187) >= uint(_2779);
    int _3199 = _3149 * _3177;
    int _3201 = _3199 + _2905;
    bool _3203 = uint(_3181) >= uint(_2879);
    int _3205 = _3193 * _3183;
    int _3207 = _3205 + _2977;
    bool _3209 = !_3197;
    int _3211 = _3209 ? 0 : (-1);
    float _3213 = fma(_3041, _281, _3117);
    bool _3215 = uint(_3201) >= uint(_2809);
    float _3217 = fma(_3041, _291, _3155);
    int _3219 = ~_3157;
    int _3221 = _3219 + _3211;
    int _3223 = _3221 + 1;
    float _3225 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _3227 = !_3215;
    int _3229 = _3227 ? 0 : (-1);
    bool _3231 = uint(_3207) >= uint(_2895);
    int _3233 = ~_3177;
    int _3235 = _3233 + _3229;
    int _3237 = _3235 + 1;
    int _3239 = _2899 ^ _2779;
    int _3241 = _2905 ^ _2809;
    int _3243 = _2809 * _3237;
    int _3245 = _3243 + _2905;
    bool _3247 = _2779 == 0;
    bool _3249 = _2779 == 0;
    int _3251 = _2779 * _3223;
    int _3253 = _3251 + _2899;
    bool _3255 = !_3203;
    int _3257 = _3255 ? 0 : (-1);
    float _3259 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _3261 = !_3231;
    int _3263 = _3261 ? 0 : (-1);
    uint _3265 = uint(int(uint(_3239) >> uint(31)));
    uint _3267 = uint(int(uint(_3241) >> uint(31)));
    int _3269 = ~_3257;
    int _3271 = _3167 + _3269;
    int _3273 = _3271 + 1;
    int _3275 = ~_3263;
    int _3277 = _3183 + _3275;
    int _3279 = _3277 + 1;
    int _3281 = ~int(_3265);
    int _3283 = _3281 + 1;
    int _3285 = ~int(_3267);
    int _3287 = _3285 + 1;
    float _3289 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _3291 = _3273 ^ _3283;
    float _3293 = _3259 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _3295 = _3279 ^ _3287;
    int _3297 = ~_3283;
    int _3299 = _3297 + _3291;
    int _3301 = _3299 + 1;
    float _3303 = _3189 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _3305 = _2809 == 0;
    int _3307 = ~_3287;
    int _3309 = _3307 + _3295;
    int _3311 = _3309 + 1;
    bool _3313 = _2809 == 0;
    float _3315 = _3225 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _3317 = !_3247;
    int _3319 = _3317 ? _3253 : (-1);
    bool _3321 = !_3249;
    int _3323 = _3321 ? _3301 : (-1);
    float _3325 = _3289 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _3327 = !_3305;
    int _3329 = _3327 ? _3311 : (-1);
    float _3331 = _2331 * _3159;
    float _3333 = float(_3319);
    float _3335 = fma(_3083, _335, _3165);
    float _3337 = float(_3323);
    float _3339 = float(_3329);
    float _3341 = fma(_3303, _3333, _531);
    bool _3343 = !_3313;
    int _3345 = _3343 ? _3245 : (-1);
    float _3347 = -_533;
    float _3349 = fma(_3315, _3337, _3347);
    float _3351 = _2969 + 0.5;
    float _3353 = -_731;
    float _3355 = fma(_3325, _3339, _3353);
    float _3357 = _2705 + (-0.5);
    float _3359 = float(_3345);
    float _3361 = fma(_3303, _3351, _3341);
    float _3363 = fma(_3087, _339, _3213);
    float _3365 = -_3315;
    float _3367 = fma(_3365, _3357, _3349);
    float _3369 = -_719;
    float _3371 = _3369 + 1.0;
    float _3373 = fma(_3293, _3359, _665);
    float _3375 = _2949 + 0.5;
    float _3377 = fma(_3087, _335, _3195);
    float _3379 = -_3371;
    float _3381 = fma(_2969, _3379, _3361);
    float _3383 = fma(_3007, _281, _3145);
    float _3385 = fma(_3293, _3375, _3373);
    float _3387 = -_577;
    float _3389 = _3387 + 1.0;
    float _3391 = fma(_3087, _343, _3217);
    float _3393 = fma(_3083, _339, _3383);
    float _3395 = fma(_1469, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2363);
    float _3397 = _2349 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3399 = _2933 + (-0.5);
    out.m_80.x = _3363;
    out.m_80.y = _3377;
    out.m_80.z = _3391;
    float _3401 = fma(_1465, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3395);
    float _3403 = fma(_1469, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3397);
    float _3405 = -_3325;
    float _3407 = fma(_3405, _3399, _3355);
    float _3409 = -_3389;
    float _3411 = fma(_2949, _3409, _3385);
    float _3413 = fma(_2705, _2355, _3367);
    float _3415 = fma(_1465, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3403);
    float _3417 = fma(_2933, _2371, _3407);
    float _3419 = in.m_66.x;
    float _3421 = fma(_3007, _291, _3133);
    float _3423 = _3415 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3425 = _2321 * _3171;
    float _3427 = _3401 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    out.m_82.x = _3381;
    out.m_82.y = _3413;
    out.m_82.z = _3411;
    out.m_82.w = _3417;
    float _3429 = 1.0 / _3427;
    float _3431 = _3423 + _3427;
    float _3433 = fma(_3083, _343, _3421);
    bool _3435 = _1982 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3437 = isnan(_1982);
    bool _3439 = _3435 || _3437;
    bool _3441 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3443 = _3439 || _3441;
    out.m_84.x = _3393;
    out.m_84.y = _3335;
    out.m_84.z = _3433;
    float _3445 = _2230 * 0.5;
    float _3447 = _3431 * _3429;
    float _3449 = _3447 * 0.5;
    float _3451 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3453 = fma(_3449, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3451);
    float _3455 = 1.0 / _3453;
    float _3457 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3459 = _3455 * _3457;
    float _3461 = abs(_3459);
    float _3463 = log2(_3461);
    bool _3465 = _3459 <= 8000.0;
    bool _3467 = isnan(_3459);
    bool _3469 = _3465 || _3467;
    bool _3471 = isnan(8000.0);
    bool _3473 = _3469 || _3471;
    float _3475 = float(_3473);
    float _3477 = fma(_2286, -0.5, _3445);
    float _3479 = _3463 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3481 = exp2(_3479);
    float _3483 = fma(_3481, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3485 = precise::clamp(_3483, 0.0, 1.0);
    float _3487 = _2268 + _2230;
    float _3489 = fma(_3485, -2.0, 3.0);
    float _3491 = _3485 * _3485;
    float _3493 = _3491 * _3489;
    float _3495 = fma(_2166, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2395);
    float _3497 = -_3493;
    float _3499 = _3497 + 1.0;
    float _3501 = fma(_2222, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3495);
    float _3503 = fma(_3499, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3493);
    float _3505 = _3487 * 0.5;
    float _3507 = _2321 * _3159;
    float _3509 = _3501 + _2230;
    float _3511 = _3475 * _3503;
    float _3513 = fma(_2327, _3507, _2315);
    float _3515 = fma(_2329, _3507, _2317);
    float _3517 = _3511 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3519 = _3509 * 0.5;
    out.gl_Position.x = _2268;
    out.gl_Position.y = _2286;
    out.gl_Position.z = _3501;
    out.gl_Position.w = _2230;
    float _3521 = _3507;
    float _3523 = _3501;
    float _3525 = _3505;
    if (!_3443)
    {
        _3521 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3527 = _3521;
    float _3529 = _3027 * _3517;
    float _3531 = precise::clamp(_3529, 0.0, 1.0);
    out.m_86.x = _3505;
    out.m_86.y = _3477;
    out.m_86.z = _3519;
    out.m_86.w = _2230;
    float _3533 = -_3531;
    float _3535 = fma(_3533, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3537 = _3535 * _3419;
    float _3539 = fma(_2321, _3331, _2319);
    float _3541 = _3537 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3543 = _3527;
    float _3545 = _3527;
    if (!_3443)
    {
        _2435 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3547 = _2435;
    out.m_88.x = _3513;
    out.m_88.y = _3515;
    out.m_88.z = _3539;
    out.m_88.w = _3425;
    float _3549 = _3547;
    float _3551 = _3547;
    if (!_3443)
    {
        _3523 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3553 = _3523;
    float _3555 = _3553;
    float _3557 = _3553;
    if (!_3443)
    {
        _3525 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3559 = _3525;
    out.m_90.x = _3541;
    float _3561 = _3559;
    float _3563 = _3559;
    if (!_3443)
    {
        _2437 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3565 = _2437;
    float _3567 = _3565;
    float _3569 = _3565;
    if (!_3443)
    {
        _2439 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3571 = _2439;
    bool _3573 = !_3443;
    float _3575 = _3571;
    float _3577 = _3571;
    if (!_3573)
    {
        bool _3579 = _1982 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3581 = isnan(_1982);
        bool _3583 = _3579 || _3581;
        bool _3585 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3587 = _3583 || _3585;
        if (!_3587)
        {
            float _3589 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3591 = _1982 + _3589;
            float _3593 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3595 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3593;
            float _3597 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3599 = _3597 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3601 = 1.0 / _3595;
            float _3603 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3605 = _3603 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3607 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3609 = _3607 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3611 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3613 = _3611 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3615 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3617 = _3615 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3619 = _3591 * _3601;
            float _3621 = precise::clamp(_3619, 0.0, 1.0);
            float _3623 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3625 = _3623 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3627 = fma(_3621, _3599, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3629 = fma(_3621, _3625, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3631 = fma(_3621, _3605, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3633 = fma(_3621, _3609, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3635 = fma(_3621, _3613, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3637 = fma(_3621, _3617, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3551 = _3631;
            _3577 = _3635;
            _3563 = _3627;
            _3569 = _3633;
            _3557 = _3629;
            _3545 = _3637;
            _3639 = true;
        }
        else
        {
            bool _3641 = _1982 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3643 = isnan(_1982);
            bool _3645 = _3641 || _3643;
            bool _3647 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3649 = _3645 || _3647;
            if (!_3649)
            {
                _3561 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3651 = _3561;
            _3563 = _3651;
            if (!_3649)
            {
                _3549 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3653 = _3549;
            _3551 = _3653;
            if (!_3649)
            {
                _3555 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3655 = _3555;
            _3557 = _3655;
            if (!_3649)
            {
                _3567 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3657 = _3567;
            _3569 = _3657;
            if (!_3649)
            {
                _3575 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3659 = _3575;
            _3577 = _3659;
            if (!_3649)
            {
                _3543 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3661 = _3543;
            bool _3663 = !_3649;
            _3545 = _3661;
            if (!_3663)
            {
                bool _3665 = _1982 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3667 = isnan(_1982);
                bool _3669 = _3665 || _3667;
                bool _3671 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3673 = _3669 || _3671;
                if (!_3673)
                {
                    float _3675 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3677 = _1982 + _3675;
                    float _3679 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3681 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3679;
                    float _3683 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3685 = _3683 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3687 = 1.0 / _3681;
                    float _3689 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3691 = _3689 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3693 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3695 = _3693 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3697 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3699 = _3697 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3701 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3703 = _3701 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3705 = _3677 * _3687;
                    float _3707 = precise::clamp(_3705, 0.0, 1.0);
                    float _3709 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3711 = _3709 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3713 = fma(_3707, _3685, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3715 = fma(_3707, _3711, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3717 = fma(_3707, _3691, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3719 = fma(_3707, _3695, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3721 = fma(_3707, _3699, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3723 = fma(_3707, _3703, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3551 = _3717;
                    _3577 = _3721;
                    _3563 = _3713;
                    _3569 = _3719;
                    _3557 = _3715;
                    _3545 = _3723;
                    _3639 = true;
                }
                else
                {
                    _3551 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3577 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3563 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3569 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3557 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3545 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3639 = false;
    float _3725 = _3551;
    float _3727 = _3577;
    float _3729 = _3563;
    float _3731 = _3569;
    float _3733 = _3557;
    float _3735 = _3545;
    float _3737 = fma(_3335, -0.5, 0.5);
    float _3739 = precise::clamp(_3737, 0.0, 1.0);
    float _3741 = -_3725;
    float _3743 = _3741 + _3727;
    float _3745 = -_3729;
    float _3747 = _3745 + _3731;
    float _3749 = -_3733;
    float _3751 = _3749 + _3735;
    bool _3753 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3755 = fma(_3739, _3743, _3725);
    float _3757 = fma(_3739, _3747, _3729);
    float _3759 = fma(_3739, _3751, _3733);
    float _3761 = _3755 * 0.586610972881317138671875;
    out.m_92.x = 0.0;
    float _3763 = fma(_3757, 0.298911988735198974609375, _3761);
    float _3765 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3767 = fma(_3759, 0.114477999508380889892578125, _3763);
    out.m_51.x = _3765;
    float _3769 = -_3767;
    float _3771 = _3757 + _3769;
    float _3773 = -_3767;
    float _3775 = _3755 + _3773;
    float _3777 = -_3767;
    float _3779 = _3759 + _3777;
    float _3781 = fma(_3771, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3767);
    float _3783 = fma(_3775, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3767);
    float _3785 = fma(_3779, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3767);
    out.m_94.x = _3781;
    out.m_94.y = _3783;
    out.m_94.z = _3785;
    if (!_3753)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3787 = -_1968;
    float _3789 = _3787 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3791 = -_1946;
    float _3793 = _3791 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3795 = -_1457;
    float _3797 = _3795 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3799 = _3789 * _3789;
    float _3801 = fma(_3793, _3793, _3799);
    float _3803 = fma(_3797, _3797, _3801);
    float _3805 = sqrt(_3803);
    float _3807 = rsqrt(_3803);
    float _3809 = -_3805;
    float _3811 = _3809 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3813 = _3811 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3815 = precise::clamp(_3813, 0.0, 1.0);
    float _3817 = _3793 * _3807;
    float _3819 = _3789 * _3807;
    float _3821 = abs(_3815);
    float _3823 = log2(_3821);
    float _3825 = _3797 * _3807;
    float _3827 = _3817 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3829 = _3335 * _3819;
    float _3831 = -_3819;
    float _3833 = -_3827;
    float _3835 = fma(_3831, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3833);
    float _3837 = fma(_3393, _3817, _3829);
    float _3839 = -_3825;
    float _3841 = fma(_3839, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3835);
    float _3843 = fma(_3433, _3825, _3837);
    float _3845 = precise::clamp(_3843, 0.0, 1.0);
    float _3847 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3849 = _3841 + _3847;
    float _3851 = _3823 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3853 = _3849 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3855 = precise::clamp(_3853, 0.0, 1.0);
    float _3857 = exp2(_3851);
    float _3859 = _3857 * _3855;
    float _3861 = _3845 * _3859;
    float _3863 = _3861 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3865 = _3861 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3867 = _3861 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_92.x = _3863;
    out.m_92.y = _3865;
    out.m_92.z = _3867;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}


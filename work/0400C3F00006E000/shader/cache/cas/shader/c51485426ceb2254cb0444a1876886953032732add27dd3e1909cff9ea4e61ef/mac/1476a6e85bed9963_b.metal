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
    constant _16* vp_c13 [[id(5)]];
    texture3d<float> vp_t_tcb_32 [[id(6)]];
    sampler vp_t_tcb_32Smplr [[id(7)]];
    texture2d<float> vp_t_tcb_1C [[id(8)]];
    sampler vp_t_tcb_1CSmplr [[id(9)]];
    sampler vp_t_tcb_32Smplr_w [[id(10)]];
    sampler vp_t_tcb_1CSmplr_w [[id(11)]];
    constant dm_border_t* dm_border [[id(12)]];
};

struct main0_out
{
    float4 m_64 [[user(locn0)]];
    float4 m_66 [[user(locn1)]];
    float4 m_45 [[user(locn2)]];
    float4 m_84 [[user(locn3)]];
    float4 m_49 [[user(locn4)]];
    float4 m_78 [[user(locn5)]];
    float4 m_62 [[user(locn6)]];
    float4 m_68 [[user(locn7)]];
    float4 m_72 [[user(locn8)]];
    float4 m_76 [[user(locn9)]];
    float4 m_60 [[user(locn10)]];
    float4 m_70 [[user(locn11)]];
    float4 m_82 [[user(locn12)]];
    float4 m_80 [[user(locn13)]];
    float4 m_74 [[user(locn14)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_58 [[attribute(1)]];
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_56 [[attribute(4)]];
    float4 m_54 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3282 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _98 = in.m_42.w;
    float _100 = trunc(_98);
    int _103 = int(_100);
    bool _107 = _103 >= 1;
    float _109 = 0.0;
    float _111 = as_type<float>(_103);
    float _113 = 0.0;
    if (!_107)
    {
        _109 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _115 = _109;
    if (!_107)
    {
        out.m_45.x = 0.0;
    }
    int _117 = 0;
    if (!_107)
    {
        float _119 = _115 * 5.0;
        _117 = as_type<int>(_119);
    }
    int _121 = _117;
    if (!_107)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3565 = as_type<float>(_121);
        out.gl_Position.z = _3565;
    }
    if (!_107)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _123 = in.m_47.w;
    float _125 = float(_103);
    float _127 = -_123;
    float _129 = _127 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _131 = _123 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _133 = isnan(_123);
    bool _135 = _131 || _133;
    bool _137 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _139 = _135 || _137;
    bool _141 = _129 >= _125;
    bool _143 = !_139;
    bool _145 = _141 || _143;
    float _147 = 1.0 / _125;
    float _149 = _129;
    if (_145)
    {
        _111 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _151 = _111;
    if (_145)
    {
        out.m_45.x = 0.0;
    }
    float _153 = _129 * _147;
    int _155 = 0;
    float _157 = _153;
    if (_145)
    {
        float _159 = _151 * 5.0;
        _155 = as_type<int>(_159);
    }
    int _161 = _155;
    out.m_49.x = _153;
    if (_145)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3637 = as_type<float>(_161);
        out.gl_Position.z = _3637;
    }
    if (_145)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _163 = as_type<float>(int(gl_VertexIndex));
    float _165 = in.m_54.w;
    bool _167 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _169 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _171 = _167 || _169;
    bool _173 = isnan(1.0);
    bool _175 = _171 || _173;
    float _177 = in.m_47.x;
    float _179 = in.m_47.y;
    float _181 = in.m_47.z;
    float _183 = in.m_42.x;
    float _185 = in.m_42.y;
    float _187 = in.m_42.z;
    int _189 = as_type<int>(_163) & 1;
    bool _191 = _189 != 0;
    int _193 = as_type<int>(_163) & 2;
    bool _195 = _193 != 0;
    float _197 = _129 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _199 = _197;
    if (!_175)
    {
        float _201 = _197 * _197;
        float _203 = _201 * 0.5;
        _113 = _203;
    }
    float _205 = _113;
    bool _207 = !_191;
    float _209 = _207 ? (-0.5) : 0.5;
    bool _211 = !_195;
    float _213 = _211 ? (-0.5) : 0.5;
    float _215 = _205;
    if (!_175)
    {
        float _217 = _205 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _215 = _217;
    }
    float _219 = _215;
    bool _221 = !_175;
    float _223 = _219;
    if (!_221)
    {
        float _225 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _227 = log2(_225);
        float _229 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _231 = _229 + 1.0;
        float _233 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _235 = _197 * _227;
        float _237 = 1.0 / _231;
        float _239 = _233 * 0.693147182464599609375;
        float _241 = exp2(_235);
        float _243 = 1.0 / _239;
        float _245 = _241 + (-1.0);
        float _247 = -_245;
        float _249 = fma(_247, _243, _197);
        float _251 = _249 * _237;
        float _253 = _251 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _223 = _253;
    }
    float _255 = _223;
    bool _257 = !_175;
    if (!_257)
    {
        float _259 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _261 = log2(_259);
        float _263 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _265 = _263 + 1.0;
        float _267 = 1.0 / _265;
        float _269 = _197 * _261;
        float _271 = exp2(_269);
        float _273 = -_271;
        float _275 = _273 + 1.0;
        float _277 = _275 * _267;
        _199 = _277;
    }
    float _279 = _199;
    bool _281 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _283 = _255 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _285 = _255 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _287 = _255 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _289 = fma(_279, _177, _283);
    float _291 = fma(_279, _179, _285);
    float _293 = fma(_279, _181, _287);
    float _295 = fma(_289, _165, _183);
    float _297 = fma(_291, _165, _185);
    float _299 = fma(_293, _165, _187);
    bool _301 = !_281;
    if (!_301)
    {
        float _303 = in.m_56.x;
        float _305 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _307 = _303 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _309 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[12].x, _129);
        float _311 = _309 * _305;
        float _313 = floor(_311);
        float _315 = -_313;
        float _317 = _311 + _315;
        _157 = _317;
    }
    float _319 = _157;
    float _321 = in.m_56.x;
    float _323 = in.m_56.y;
    float _325 = in.m_56.z;
    float _327 = _297 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _331 = _319 + _329;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _335 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _333;
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _339 = _337 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    int _341 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _343 = _341 != 0;
    float _345 = _297 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _347 = 1.0 / _335;
    float _349 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _351 = fma(_295, (*spvDescriptorSet0.vp_c10)._m0[4].x, _327);
    float _353 = fma(_295, (*spvDescriptorSet0.vp_c10)._m0[6].x, _345);
    float _355 = _297 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _359 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _357;
    float _361 = fma(_299, (*spvDescriptorSet0.vp_c10)._m0[4].z, _351);
    float _363 = 1.0 / _339;
    float _365 = fma(_299, (*spvDescriptorSet0.vp_c10)._m0[6].z, _353);
    float _367 = fma(_295, (*spvDescriptorSet0.vp_c10)._m0[5].x, _355);
    float _369 = _361 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _371 = _321 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _373 = _321 * 2.0;
    float _375 = 1.0 / _359;
    float _377 = _323 * 2.0;
    float _379 = -_349;
    float _381 = fma(_371, 2.0, _379);
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _385 = _319 + _383;
    float _387 = _325 + _321;
    float _389 = fma(_299, (*spvDescriptorSet0.vp_c10)._m0[5].z, _367);
    float _391 = _385 * _347;
    float _393 = floor(_373);
    float _395 = _325 * 2.0;
    float _397 = _321 + _323;
    float _399 = _331 * _363;
    float _401 = _387 + (-1.0);
    float _403 = _397 + (-1.0);
    float _405 = _325 + _323;
    float _407 = floor(_395);
    float _409 = fma(_403, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _411 = _405 + (-1.0);
    int _413 = as_type<int>(_405);
    if (_343)
    {
        _413 = 0;
    }
    int _415 = _413;
    float _417 = fma(_401, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _419 = _415;
    if (!_343)
    {
        _419 = 1;
    }
    int _421 = _419;
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _425 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _423;
    float _427 = floor(_377);
    bool _429 = _393 > 0.0;
    float _431 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _433 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _431;
    bool _435 = _421 != 1;
    float _437 = fma(_425, _391, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _439 = fma(_433, _391, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _441 = _393 >= 0.0;
    bool _443 = isnan(_393);
    bool _445 = _441 || _443;
    bool _447 = isnan(0.0);
    bool _449 = _445 || _447;
    float _451 = _323 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _453 = _407 > 0.0;
    float _455 = fma(_411, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _457 = _449 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _459 = _389 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _461 = _407 >= 0.0;
    bool _463 = isnan(_407);
    bool _465 = _461 || _463;
    bool _467 = isnan(0.0);
    bool _469 = _465 || _467;
    float _471 = _365 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _473 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _475 = _459 + _473;
    int _477 = ~as_type<int>(_457);
    int _479 = _477 + 1;
    int _481 = _479 + 1;
    float _483 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _485 = _369 + _483;
    float _487 = _469 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _489 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _491 = _481;
    float _493 = _457;
    float _495 = _487;
    float _497 = _459;
    if (!_429)
    {
        int _499 = ~as_type<int>(_457);
        int _501 = _499 + 1;
        _491 = _501;
    }
    int _503 = _491;
    float _505 = _475 * _475;
    if (!_435)
    {
        _493 = _323;
    }
    float _507 = _493;
    float _509 = _147 * _129;
    bool _511 = _427 > 0.0;
    float _513 = -_129;
    float _515 = fma(_513, (*spvDescriptorSet0.vp_c9)._m0[76].x, _381);
    bool _517 = _427 >= 0.0;
    bool _519 = isnan(_427);
    bool _521 = _517 || _519;
    bool _523 = isnan(0.0);
    bool _525 = _521 || _523;
    float _527 = _507;
    if (_435)
    {
        _527 = _321;
    }
    float _529 = _527;
    float _531 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _533 = int(_531);
    int _535 = ~as_type<int>(_487);
    int _537 = _535 + 1;
    int _539 = _537 + 1;
    float _541 = fma(_529, (*spvDescriptorSet0.vp_c9)._m0[83].z, _489);
    int _543 = _539;
    float _545 = _529;
    if (!_453)
    {
        int _547 = ~as_type<int>(_487);
        int _549 = _547 + 1;
        _543 = _549;
    }
    int _551 = _543;
    int _553 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _555 = _553 != 0;
    int _557 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _559 = _557 != 0;
    int _561 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _563 = _561 != 0;
    float _565 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    if (!_435)
    {
        _495 = _325;
    }
    float _567 = _495;
    float _569 = _567;
    if (_435)
    {
        _569 = _323;
    }
    float _571 = _569;
    if (!_435)
    {
        _545 = _323;
    }
    float _573 = _545;
    float _575 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _577 = _573;
    if (_435)
    {
        _577 = _321;
    }
    float _579 = _577;
    float _581 = fma(_571, (*spvDescriptorSet0.vp_c9)._m0[83].w, _565);
    bool _583 = !_559;
    int _585 = _583 ? 0 : 1;
    float _587 = fma(_451, -2.0, _575);
    bool _589 = !_555;
    int _591 = _589 ? 0 : 1;
    float _593 = _579 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _595 = !_563;
    int _597 = _595 ? 0 : 1;
    float _599 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _601 = log2(_599);
    int _603 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _605 = _603 != 0;
    int _607 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _609 = _607 != 0;
    int _611 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _613 = _611 != 0;
    float _615 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _617 = _319 + _615;
    int _619 = _525 ? 0 : 1;
    float _621 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[76].y, _587);
    float _623 = _617 * _375;
    bool _625 = !_605;
    int _627 = _625 ? 0 : 1;
    int _629 = ~_619;
    int _631 = _629 + 1;
    int _633 = _631 + 1;
    float _635 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _637 = _633;
    float _639 = _593;
    if (!_511)
    {
        int _641 = ~_619;
        int _643 = _641 + 1;
        _637 = _643;
    }
    int _645 = _637;
    float _647 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _649 = int(_647);
    bool _651 = !_613;
    int _653 = _651 ? 0 : 1;
    float _655 = -_635;
    float _657 = fma(_593, 2.0, _655);
    int _659 = abs(_627);
    bool _661 = !_609;
    int _663 = _661 ? 0 : 1;
    float _665 = -_129;
    float _667 = fma(_665, (*spvDescriptorSet0.vp_c9)._m0[81].x, _657);
    if (!_435)
    {
        _639 = _325;
    }
    float _669 = _639;
    int _671 = abs(_653);
    float _673 = float(_659);
    float _675 = float(_551);
    float _677 = _669;
    if (_435)
    {
        _677 = _323;
    }
    float _679 = _677;
    float _681 = _673 * _675;
    int _683 = abs(_663);
    float _685 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _687 = float(_645);
    float _689 = _679 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _691 = float(_671);
    float _693 = _601 * _129;
    float _695 = float(_503);
    float _697 = fma(_689, -2.0, _685);
    float _699 = float(_683);
    float _701 = _691 * _687;
    float _703 = float(_649);
    float _705 = exp2(_693);
    float _707 = float(_533);
    float _709 = _699 * _695;
    float _711 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _713 = _471 + _711;
    float _715 = fma(_485, _485, _505);
    float _717 = 1.0 / _703;
    float _719 = fma(_713, _713, _715);
    float _721 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _723 = 1.0 + _721;
    float _725 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _727 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _729 = isnan(0.0);
    bool _731 = _727 || _729;
    bool _733 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _735 = _731 || _733;
    float _737 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[82].w, _581);
    bool _739 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _741 = isnan(1.0);
    bool _743 = _739 || _741;
    bool _745 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _747 = _743 || _745;
    float _749 = 1.0 / _707;
    float _751 = -_705;
    float _753 = _751 + 1.0;
    float _755 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _757 = fma(_321, (*spvDescriptorSet0.vp_c9)._m0[78].z, _725);
    float _759 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[81].y, _697);
    float _761 = _735 ? _753 : 0.0;
    float _763 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[82].z, _541);
    float _765 = rsqrt(_719);
    float _767 = in.m_58.x;
    float _769 = in.m_58.y;
    float _771 = in.m_58.z;
    float _773 = _681 * (-2.0);
    float _775 = fma(_323, (*spvDescriptorSet0.vp_c9)._m0[78].w, _755);
    float _777 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].z, _757);
    float _779 = _717 * _129;
    float _781 = fma(_409, _773, _409);
    float _783 = 1.0 / _723;
    float _785 = _749 * _129;
    float _787 = _475 * _765;
    float _789 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].w, _775);
    float _791 = -_787;
    float _793 = fma(_791, (*spvDescriptorSet0.vp_c9)._m0[18].w, _475);
    if (_747)
    {
        float _795 = _761 * _783;
        _149 = _795;
    }
    float _797 = _149;
    float _799 = fma(_773, _767, _767);
    float _801 = _709 * (-2.0);
    float _803 = _485 * _765;
    float _805 = _321 + (-0.5);
    float _807 = _793 * _793;
    float _809 = fma(_455, _801, _455);
    float _811 = fma(_801, _769, _769);
    float _813 = -_803;
    float _815 = fma(_813, (*spvDescriptorSet0.vp_c9)._m0[18].w, _485);
    float _817 = _713 * _765;
    bool _819 = _319 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _821 = isnan(_319);
    bool _823 = _819 || _821;
    bool _825 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _827 = _823 || _825;
    float _829 = float(_827);
    float _831 = fma(_805, (*spvDescriptorSet0.vp_c9)._m0[196].x, _799);
    float _833 = _323 + (-0.5);
    bool _835 = _319 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _837 = isnan(_319);
    bool _839 = _835 || _837;
    bool _841 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _843 = _839 || _841;
    float _845 = float(_843);
    float _847 = fma(_815, _815, _807);
    float _849 = -_817;
    float _851 = fma(_849, (*spvDescriptorSet0.vp_c9)._m0[18].w, _713);
    float _853 = -_829;
    float _855 = _853 + 1.0;
    float _857 = fma(_833, (*spvDescriptorSet0.vp_c9)._m0[196].y, _811);
    bool _859 = _319 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _861 = isnan(_319);
    bool _863 = _859 || _861;
    bool _865 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _867 = _863 || _865;
    float _869 = float(_867);
    float _871 = -_845;
    float _873 = _871 + 1.0;
    float _875 = fma(_851, _851, _847);
    float _877 = _845 * _855;
    bool _879 = _319 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _881 = isnan(_319);
    bool _883 = _879 || _881;
    bool _885 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _887 = _883 || _885;
    float _889 = float(_887);
    float _891 = _869 * _873;
    float _893 = -_869;
    float _895 = _893 + 1.0;
    float _897 = fma(_781, _797, _831);
    float _899 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _901 = _899 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _903 = -_889;
    float _905 = _903 + 1.0;
    float _907 = _889 * _895;
    float _909 = _897 * 0.15915493667125701904296875;
    float _911 = fma(_809, _797, _857);
    float _913 = in.m_54.x;
    float _915 = in.m_54.y;
    float _917 = _439 * _907;
    float _919 = fma(_901, _399, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _921 = _701 * (-2.0);
    float _923 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _925 = _923 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _927 = fma(_905, (*spvDescriptorSet0.vp_c9)._m0[143].y, _917);
    float _929 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _931 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _929;
    float _933 = _437 * _907;
    float _935 = fma(_925, _399, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _937 = fma(_919, _891, _927);
    float _939 = fma(_921, _771, _771);
    float _941 = _325 + (-0.5);
    float _943 = fma(_417, _921, _417);
    float _945 = sqrt(_875);
    float _947 = fma(_941, (*spvDescriptorSet0.vp_c9)._m0[196].z, _939);
    float _949 = fma(_931, _623, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _951 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _953 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _951;
    float _955 = fma(_905, (*spvDescriptorSet0.vp_c9)._m0[143].x, _933);
    float _957 = fma(_943, _797, _947);
    float _959 = fma(_949, _877, _937);
    float _961 = _911 * 0.15915493667125701904296875;
    float _963 = fma(_953, _623, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _965 = _957 * 0.15915493667125701904296875;
    float _967 = fma(_935, _891, _955);
    float _969 = fma(_829, (*spvDescriptorSet0.vp_c9)._m0[146].y, _959);
    float _971 = _909 * 6.283185482025146484375;
    float _973 = cos(_971);
    float _975 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _213);
    float _977 = fma(_963, _877, _967);
    float _979 = _969 * _915;
    float _981 = _765 * _945;
    float _983 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _209);
    float _985 = fma(_829, (*spvDescriptorSet0.vp_c9)._m0[146].x, _977);
    float _987 = _979 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _989 = _961 * 6.283185482025146484375;
    float _991 = sin(_989);
    float _993 = _985 * _913;
    float _995 = _987 * _981;
    float _997 = _993 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _999 = _995 * _975;
    float _1001 = _961 * 6.283185482025146484375;
    float _1003 = cos(_1001);
    float _1005 = _997 * _981;
    float _1007 = _1005 * _983;
    float _1009 = _909 * 6.283185482025146484375;
    float _1011 = sin(_1009);
    float _1013 = _973 * _991;
    float _1015 = _965 * 6.283185482025146484375;
    float _1017 = cos(_1015);
    float _1019 = _973 * _1003;
    float _1021 = _965 * 6.283185482025146484375;
    float _1023 = sin(_1021);
    float _1025 = _1011 * _991;
    float _1027 = _1011 * _1003;
    float _1029 = _973 * _1017;
    float _1031 = _1011 * _1017;
    float _1033 = _1003 * _1017;
    float _1035 = _991 * _1017;
    float _1037 = _1029 * _999;
    float _1039 = _981 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1041 = _1039 * 0.5;
    float _1043 = fma(_1023, _1019, _1025);
    float _1045 = -_1027;
    float _1047 = fma(_1023, _1013, _1045);
    float _1049 = -_999;
    float _1051 = _1023 * _1049;
    float _1053 = -_1013;
    float _1055 = fma(_1023, _1027, _1053);
    float _1057 = fma(_1043, _1007, _1037);
    float _1059 = _1031 * _999;
    float _1061 = fma(_1033, _1007, _1051);
    float _1063 = fma(_1023, _1025, _1019);
    float _1065 = fma(_1047, _1041, _1057);
    float _1067 = fma(_1055, _1007, _1059);
    float _1069 = fma(_1035, _1041, _1061);
    float _1071 = _1065 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1073 = fma(_1063, _1041, _1067);
    float _1075 = _1065 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1077 = _1065 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1079 = fma(_1069, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1071);
    float _1081 = fma(_1069, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1075);
    float _1083 = fma(_1069, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1077);
    float _1085 = fma(_1073, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1079);
    float _1087 = fma(_1073, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1081);
    float _1089 = fma(_1073, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1083);
    float _1091 = _471 + _1085;
    float _1093 = _369 + _1087;
    float _1095 = _459 + _1089;
    float _1097 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1099 = _1091 + _1097;
    float _1101 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1103 = _1093 + _1101;
    float _1105 = _1099 * _1099;
    float _1107 = fma(_1103, _1103, _1105);
    float _1109 = sqrt(_1107);
    bool _1111 = _1109 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1113 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1115 = _1113 != 0;
    int _1117 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1119 = _1117 != 0;
    int _1121 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1123 = _1121 != 0;
    int _1125 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1127 = _1125 != 0;
    bool _1129 = !_1119;
    int _1131 = _1129 ? 0 : 1;
    bool _1133 = !_1115;
    int _1135 = _1133 ? 0 : 1;
    bool _1137 = !_1123;
    int _1139 = _1137 ? 0 : 1;
    bool _1141 = !_1127;
    int _1143 = _1141 ? 0 : 1;
    float _1145 = _1089;
    float _1147 = _1083;
    if (!_1111)
    {
        _1145 = _1093;
    }
    float _1149 = _1145;
    float _1151 = _1149;
    if (!_1111)
    {
        _497 = _1091;
    }
    float _1153 = _497;
    float _1155 = _1153;
    if (!_1111)
    {
        _1147 = _1095;
    }
    float _1157 = _1147;
    bool _1159 = !_1111;
    float _1161 = _1157;
    if (!_1159)
    {
        float _1163 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1165 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1167 = _1109 + _1165;
        float _1169 = _1095 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1171 = rsqrt(_1107);
        float _1173 = _1167 * _1163;
        float _1175 = _1173 * 0.15915493667125701904296875;
        float _1177 = _1175 * 6.283185482025146484375;
        float _1179 = sin(_1177);
        float _1181 = _1175 * 6.283185482025146484375;
        float _1183 = cos(_1181);
        float _1185 = fma(_1179, _1169, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1187 = _1171 * _1185;
        float _1189 = _1183 + (-1.0);
        float _1191 = fma(_1103, _1187, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1193 = fma(_1099, _1187, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1195 = _1189 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1197 = fma(_1095, _1183, _1195);
        _1161 = _1197;
        _1151 = _1191;
        _1155 = _1193;
    }
    float _1199 = _1161;
    float _1201 = _1151;
    float _1203 = _1155;
    float _1205 = -_787;
    float _1207 = fma(_1205, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1199);
    float _1209 = -_803;
    float _1211 = fma(_1209, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1201);
    float _1213 = -_817;
    float _1215 = fma(_1213, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1203);
    float _1217 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1219 = _1207 + _1217;
    float _1221 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1223 = _1211 + _1221;
    float _1225 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1227 = _1215 + _1225;
    float _1229 = _1207 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1231 = _1219 * _1219;
    float _1233 = fma(_1223, _1223, _1231);
    float _1235 = fma(_1227, _1227, _1233);
    float _1237 = rsqrt(_1235);
    float _1239 = sqrt(_1235);
    float _1241 = _1237 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1243 = _1223 * _1241;
    float _1245 = _1227 * _1241;
    float _1247 = _1243 * _1243;
    float _1249 = _1245 * _1245;
    float _1251 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1253 = _1247 + _1249;
    float _1255 = precise::max(0.0, _1251);
    float _1257 = sqrt(_1253);
    float _1259 = -_1241;
    float _1261 = -_1255;
    float _1263 = fma(_1219, _1259, _1261);
    bool _1265 = _1257 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1267 = _1219;
    float _1269 = _1251;
    float _1271 = _1255;
    float _1273 = _1247;
    float _1275 = _1249;
    if (!_1265)
    {
        _1267 = _1243;
    }
    float _1277 = _1267;
    float _1279 = _1277;
    if (!_1265)
    {
        _1269 = _1263;
    }
    float _1281 = _1269;
    float _1283 = _1281;
    if (!_1265)
    {
        _1271 = _1245;
    }
    float _1285 = _1271;
    bool _1287 = !_1265;
    float _1289 = _1285;
    if (!_1287)
    {
        float _1291 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1293 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1295 = _1257 + _1293;
        float _1297 = _1263 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1299 = rsqrt(_1253);
        float _1301 = _1295 * _1291;
        float _1303 = _1301 * 0.15915493667125701904296875;
        float _1305 = _1303 * 6.283185482025146484375;
        float _1307 = sin(_1305);
        float _1309 = _1303 * 6.283185482025146484375;
        float _1311 = cos(_1309);
        float _1313 = fma(_1307, _1297, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1315 = _1299 * _1313;
        float _1317 = _1311 + (-1.0);
        float _1319 = _1243 * _1315;
        float _1321 = _1317 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1323 = _1245 * _1315;
        float _1325 = fma(_1263, _1311, _1321);
        float _1327 = _1319 * _1319;
        float _1329 = _1323 * _1323;
        _1283 = _1325;
        _1273 = _1327;
        _1275 = _1329;
        _1279 = _1319;
        _1289 = _1323;
    }
    float _1331 = _1283;
    float _1333 = _1273;
    float _1335 = _1275;
    float _1337 = _1279;
    float _1339 = _1289;
    float _1341 = fma(_1331, _1331, _1333);
    float _1343 = fma(_1211, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1229);
    float _1345 = _1341 + _1335;
    float _1347 = fma(_1215, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1343);
    float _1349 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1351 = fma(_1239, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1349);
    float _1353 = precise::clamp(_1351, 0.0, 1.0);
    float _1355 = rsqrt(_1345);
    float _1357 = _1347 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1359 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1361 = -_1353;
    float _1363 = _1361 + 1.0;
    float _1365 = _1357 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1367 = _1207 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1369 = _1207 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1371 = -_1365;
    float _1373 = fma(_1359, _1371, 1.0);
    float _1375 = _1207 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1377 = abs(_1363);
    float _1379 = log2(_1377);
    float _1381 = fma(_1211, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1367);
    float _1383 = fma(_1211, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1369);
    float _1385 = fma(_1211, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1375);
    float _1387 = _1355 * _1337;
    float _1389 = _1355 * _1331;
    float _1391 = fma(_1215, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1385);
    float _1393 = _1355 * _1339;
    float _1395 = _1387 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1397 = fma(_1215, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1381);
    float _1399 = _1391 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1401 = log2(_1373);
    float _1403 = -_1395;
    float _1405 = fma(_1389, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1403);
    float _1407 = _1397 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1409 = _1399 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1411 = _1379 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1413 = -_1393;
    float _1415 = fma(_1413, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1405);
    float _1417 = fma(_1215, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1383);
    float _1419 = fma(_1407, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1409);
    float _1421 = exp2(_1411);
    float _1423 = fma(_1415, -0.5, 0.5);
    float _1425 = _1417 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1427 = fma(_1357, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1419);
    float _1429 = _1399 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1431 = fma(_1415, 0.5, 0.5);
    float _1433 = fma(_1425, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1427);
    float _1435 = sqrt(_1423);
    float _1437 = _1399 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1439 = fma(_1407, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1429);
    float _1441 = _1389 + 1.0;
    float _1443 = fma(_1431, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1445 = fma(_1407, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1437);
    float _1447 = fma(_1357, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1439);
    float _1449 = 1.0 / _1433;
    float _1451 = fma(_1357, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1445);
    float _1453 = -_1389;
    float _1455 = fma(_1421, _1441, _1453);
    float _1457 = fma(_1431, _1443, -0.212114393711090087890625);
    float _1459 = fma(_1425, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1447);
    float _1461 = fma(_1425, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1451);
    float _1463 = _1401 * 0.693147182464599609375;
    float _1465 = fma(_1431, _1457, 1.570728778839111328125);
    float _1467 = _1435 * 0.636619746685028076171875;
    float _1469 = fma(_1455, 0.5, 0.5);
    float _1471 = _1463 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1473 = -_1465;
    float _1475 = fma(_1467, _1473, 1.0);
    float _1477 = _1459 * _1449;
    float _1479 = _1461 * _1449;
    float _1481 = fma(_1477, 0.5, 0.5);
    float _1483 = fma(_1479, -0.5, 0.5);
    float3 _5725 = float3(_1481, _1483, _1471);
    float _1485 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5725, float3(0.0), isnan(_5725)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5725, float3(0.0), isnan(_5725)), level(0.0)).x;
    float2 _5736 = float2(_1475, _1469);
    float3 _1489 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5736, float2(0.0), isnan(_5736)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5736, float2(0.0), isnan(_5736)), level(0.0)).xyz;
    float _1491 = _1489.x;
    float _1493 = _1489.y;
    float _1495 = _1489.z;
    float _1497 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1499 = int(_1497);
    int _1501 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1503 = _1501 != 0;
    float _1505 = _213 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _1507 = abs(_591);
    float _1509 = _1399 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1511 = abs(_597);
    float _1513 = -_1505;
    float _1515 = _1023 * _1513;
    int _1517 = abs(_1131);
    float _1519 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1521 = int(_1519);
    int _1523 = abs(_1135);
    float _1525 = _1029 * _1505;
    float _1527 = fma(_1407, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1509);
    float _1529 = _1379 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1531 = 0.0;
    float _1533 = _1433;
    if (_1503)
    {
        float _1535 = in.m_56.x;
        _1531 = _1535;
    }
    float _1537 = _1531;
    float _1539 = 0.0;
    if (_1503)
    {
        _1539 = 1.0;
    }
    float _1541 = _1539;
    float _1543 = trunc(_779);
    int _1545 = int(_1543);
    float _1547 = float(uint(_1499));
    float _1549 = _1537;
    float _1551 = _1541;
    if (!_1503)
    {
        float _1553 = in.m_56.y;
        _1549 = _1553;
    }
    float _1555 = _1549;
    if (!_1503)
    {
        _1551 = 7.345489978790283203125;
    }
    float _1557 = _1551;
    float _1559 = fma(_1357, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1527);
    float _1561 = -_777;
    float _1563 = _1561 + 1.0;
    out.m_60.x = _1211;
    out.m_60.y = _1207;
    out.m_60.z = _1215;
    float _1565 = -_789;
    float _1567 = _1565 + 1.0;
    float _1569 = 1.0 / _1547;
    float _1571 = float(uint(_1521));
    float _1573 = _1557 * _321;
    float _1575 = fma(_1425, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1559);
    float _1577 = -_737;
    float _1579 = _1577 + 1.0;
    out.m_62.w = _1433;
    float _1581 = float(uint(_1545));
    float _1583 = 1.0 / _1571;
    out.gl_Position.x = _1459;
    out.gl_Position.y = _1461;
    out.gl_Position.z = _1575;
    out.gl_Position.w = _1433;
    int _1585 = as_type<int>(_1569) + (-2);
    float _1587 = trunc(_785);
    int _1589 = int(_1587);
    float _1591 = as_type<float>(_1585) * _1581;
    float _1593 = _1459 + _1433;
    int _1595 = as_type<int>(_1583) + (-2);
    float _1597 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    int _1599 = ~_1499;
    int _1601 = _1599 + 1;
    float _1603 = _1593 * 0.5;
    int _1605 = ~_1521;
    int _1607 = _1605 + 1;
    float _1609 = float(uint(_1589));
    float _1611 = trunc(_1591);
    float _1613 = precise::max(_1611, 0.0);
    uint _1616 = uint(_1613);
    out.m_62.x = _1603;
    float _1618 = as_type<float>(_1595) * _1609;
    float _1620 = floor(_1573);
    int _1622 = _1601 * int(_1616);
    int _1624 = _1622 + _1545;
    float _1626 = trunc(_1618);
    float _1628 = precise::max(_1626, 0.0);
    uint _1630 = uint(_1628);
    float _1632 = float(uint(_1624));
    float _1634 = -_1620;
    float _1636 = _1573 + _1634;
    float _1638 = exp2(_1529);
    float _1640 = as_type<float>(_1585) * _1632;
    float _1642 = _1632;
    float _1644 = _1603;
    if (_1503)
    {
        _1642 = 1.0;
    }
    float _1646 = _1642;
    float _1648 = _1646;
    if (!_1503)
    {
        _1648 = 1.2345600128173828125;
    }
    float _1650 = _1648;
    float _1652 = trunc(_1640);
    float _1654 = precise::max(_1652, 0.0);
    uint _1656 = uint(_1654);
    int _1658 = _1607 * int(_1630);
    int _1660 = _1658 + _1589;
    float _1662 = _1555 * _1650;
    int _1664 = ~_1499;
    int _1666 = _1664 + 1;
    float _1668 = float(uint(_1660));
    float _1670 = floor(_1662);
    float _1672 = -_1638;
    float _1674 = _1672 + 1.0;
    float _1676 = as_type<float>(_1595) * _1668;
    float _1678 = float(_1499);
    float _1680 = _1674 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _1682 = int(_1616) + int(_1656);
    float _1684 = trunc(_1676);
    float _1686 = precise::max(_1684, 0.0);
    uint _1688 = uint(_1686);
    float _1690 = _1636 * _1678;
    float _1692 = float(_1545);
    int _1694 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1696 = _1694 != 0;
    float _1698 = trunc(_1690);
    int _1700 = int(_1698);
    int _1702 = _1666 * _1682;
    int _1704 = _1702 + _1545;
    bool _1706 = _1692 >= _1678;
    bool _1708 = isnan(_1692);
    bool _1710 = _1706 || _1708;
    bool _1712 = isnan(_1678);
    bool _1714 = _1710 || _1712;
    float _1716 = float(_1714);
    float _1718 = -_1670;
    float _1720 = _1662 + _1718;
    bool _1722 = !_1696;
    int _1724 = _1722 ? 0 : 1;
    bool _1726 = uint(_1704) >= uint(_1499);
    float _1728 = trunc(_1716);
    int _1730 = int(_1728);
    int _1732 = abs(_1724);
    bool _1734 = !_1726;
    int _1736 = _1734 ? 0 : (-1);
    int _1738 = int(_1630) + int(_1688);
    int _1740 = ~_1682;
    int _1742 = _1740 + _1736;
    int _1744 = _1742 + 1;
    int _1746 = ~_1521;
    int _1748 = _1746 + 1;
    int _1750 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1752 = _1750 != 0;
    int _1754 = _1700 * _1732;
    int _1756 = _1754 + _1545;
    bool _1758 = _1499 == 0;
    int _1760 = _1499 * _1744;
    int _1762 = _1760 + _1545;
    float _1764 = _1678 * _509;
    int _1766 = _1748 * _1738;
    int _1768 = _1766 + _1589;
    int _1770 = ~_1730;
    int _1772 = _1770 + 1;
    int _1774 = _1772 + 1;
    bool _1776 = !_1758;
    int _1778 = _1776 ? _1762 : (-1);
    bool _1780 = uint(_1768) >= uint(_1521);
    float _1782 = trunc(_1764);
    int _1784 = int(_1782);
    float _1786 = float(_1521);
    int _1788 = _1778 * _1774;
    float _1790 = float(_1589);
    int _1792 = _1499 + (-1);
    float _1794 = _1786 * _509;
    int _1796 = abs(_585);
    bool _1798 = _1790 >= _1786;
    bool _1800 = isnan(_1790);
    bool _1802 = _1798 || _1800;
    bool _1804 = isnan(_1786);
    bool _1806 = _1802 || _1804;
    float _1808 = float(_1806);
    int _1810 = _1730 * _1792;
    int _1812 = _1810 + _1788;
    float _1814 = trunc(_1794);
    int _1816 = int(_1814);
    bool _1818 = !_1780;
    int _1820 = _1818 ? 0 : (-1);
    int _1822 = _1812 * _1796;
    bool _1824 = !_1752;
    int _1826 = _1824 ? 0 : 1;
    int _1828 = ~_1738;
    int _1830 = _1828 + _1820;
    int _1832 = _1830 + 1;
    float _1834 = trunc(_1808);
    int _1836 = int(_1834);
    int _1838 = _1784 * _1507;
    int _1840 = _1838 + _1822;
    int _1842 = abs(_1826);
    float _1844 = _1720 * _1786;
    int _1846 = _1521 * _1832;
    int _1848 = _1846 + _1589;
    bool _1850 = _1521 == 0;
    int _1852 = _1756 * _1511;
    int _1854 = _1852 + _1840;
    int _1856 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1858 = _1856 != 0;
    bool _1860 = !_1850;
    int _1862 = _1860 ? _1848 : (-1);
    int _1864 = _1700 * _1842;
    int _1866 = _1864 + _1854;
    float _1868 = trunc(_1844);
    int _1870 = int(_1868);
    int _1872 = _1521 + (-1);
    bool _1874 = !_1858;
    int _1876 = _1874 ? 0 : 1;
    int _1878 = ~_1836;
    int _1880 = _1878 + 1;
    int _1882 = _1880 + 1;
    float _1884 = float(uint(_1866));
    int _1886 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1888 = _1886 != 0;
    int _1890 = _1862 * _1882;
    int _1892 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1894 = _1892 != 0;
    float _1896 = as_type<float>(_1585) * _1884;
    int _1898 = _1836 * _1872;
    int _1900 = _1898 + _1890;
    int _1902 = abs(_1876);
    float _1904 = trunc(_1896);
    float _1906 = precise::max(_1904, 0.0);
    uint _1908 = uint(_1906);
    int _1910 = abs(_1139);
    int _1912 = _1900 * _1517;
    int _1914 = ~_1499;
    int _1916 = _1914 + 1;
    int _1918 = _1870 * _1902;
    int _1920 = _1918 + _1589;
    int _1922 = _1816 * _1523;
    int _1924 = _1922 + _1912;
    int _1926 = abs(_1143);
    float _1928 = as_type<float>(_1910);
    if (_1888)
    {
        float _1930 = in.m_56.x;
        _1928 = _1930;
    }
    float _1932 = _1928;
    int _1934 = ~_1499;
    int _1936 = _1934 + 1;
    int _1938 = _1920 * _1910;
    int _1940 = _1938 + _1924;
    int _1942 = _1870 * _1926;
    int _1944 = _1942 + _1940;
    int _1946 = _1916 * int(_1908);
    int _1948 = _1946 + _1866;
    float _1950 = in.m_56.w;
    int _1952 = ~_1521;
    int _1954 = _1952 + 1;
    float _1956 = float(uint(_1944));
    float _1958 = float(uint(_1948));
    float _1960 = as_type<float>(_1585) * _1958;
    float _1962 = as_type<float>(_1595) * _1956;
    float _1964 = float(uint(_1756));
    float _1966 = trunc(_1960);
    float _1968 = precise::max(_1966, 0.0);
    uint _1970 = uint(_1968);
    float _1972 = as_type<float>(_1585) * _1964;
    float _1974 = trunc(_1962);
    float _1976 = precise::max(_1974, 0.0);
    uint _1978 = uint(_1976);
    int _1980 = int(_1908) + int(_1970);
    float _1982 = trunc(_1972);
    float _1984 = precise::max(_1982, 0.0);
    uint _1986 = uint(_1984);
    int _1988 = _1936 * _1980;
    int _1990 = _1988 + _1866;
    int _1992 = _1954 * int(_1978);
    int _1994 = _1992 + _1944;
    bool _1996 = uint(_1990) >= uint(_1499);
    float _1998 = float(uint(_1920));
    float _2000 = float(uint(_1994));
    bool _2002 = !_1996;
    int _2004 = _2002 ? 0 : (-1);
    float _2006 = as_type<float>(_1595) * _1998;
    int _2008 = ~_1499;
    int _2010 = _2008 + 1;
    float _2012 = as_type<float>(_1595) * _2000;
    float _2014 = _1998;
    float _2016 = as_type<float>(_1980);
    float _2018 = as_type<float>(_1978);
    float _2020 = _1950;
    if (_1894)
    {
        float _2022 = _1950 * 3.1415927410125732421875;
        _2014 = _2022;
    }
    float _2024 = _2014;
    int _2026 = ~_1980;
    int _2028 = _2026 + _2004;
    int _2030 = _2028 + 1;
    float _2032 = trunc(_2012);
    float _2034 = precise::max(_2032, 0.0);
    uint _2036 = uint(_2034);
    int _2038 = _2010 * int(_1986);
    int _2040 = _2038 + _1756;
    if (_1894)
    {
        float _2042 = _2024 * 0.15915493667125701904296875;
        _2016 = _2042;
    }
    float _2044 = _2016;
    int _2046 = _1499 * _2030;
    int _2048 = _2046 + _1866;
    float _2050 = float(uint(_2040));
    float _2052 = trunc(_2006);
    float _2054 = precise::max(_2052, 0.0);
    uint _2056 = uint(_2054);
    bool _2058 = !_1758;
    int _2060 = _2058 ? _2048 : (-1);
    int _2062 = ~_1521;
    int _2064 = _2062 + 1;
    float _2066 = as_type<float>(_1585) * _2050;
    int _2068 = _2060 & 3;
    bool _2070 = _2068 != 0;
    int _2072 = _2060 & 3;
    bool _2074 = _2072 != 0;
    float _2076 = as_type<float>(_1866);
    float _2078 = _2044;
    bool _2080 = _2074;
    if (_1894)
    {
        float _2082 = _2044 * 6.283185482025146484375;
        float _2084 = sin(_2082);
        _2076 = _2084;
    }
    float _2086 = _2076;
    int _2088 = int(_1978) + int(_2036);
    if (_1888)
    {
        float _2090 = _1932 * 3.1415927410125732421875;
        _2018 = _2090;
    }
    float _2092 = _2018;
    int _2094 = ~_1521;
    int _2096 = _2094 + 1;
    bool _2098 = uint(_2068) > 1u;
    int _2100 = _2064 * int(_2056);
    int _2102 = _2100 + _1920;
    if (_1888)
    {
        float _2104 = _2092 * 0.15915493667125701904296875;
        _2078 = _2104;
    }
    float _2106 = _2078;
    float _2108 = trunc(_2066);
    float _2110 = precise::max(_2108, 0.0);
    uint _2112 = uint(_2110);
    float _2114 = float(uint(_2102));
    float _2116 = _1680 * _1485;
    float _2118 = _2106;
    float _2120 = _2114;
    if (_1888)
    {
        float _2122 = _2106 * 6.283185482025146484375;
        float _2124 = sin(_2122);
        _2118 = _2124;
    }
    float _2126 = _2118;
    int _2128 = _2074 ? 0 : 1;
    if (_1894)
    {
        bool _2130 = _2086 > 0.5;
        _2080 = _2130;
    }
    bool _2132 = _2080;
    float _2134 = as_type<float>(_1595) * _2114;
    int _2136 = _2096 * _2088;
    int _2138 = _2136 + _1944;
    int _2140 = ~_2128;
    int _2142 = _2140 + 1;
    int _2144 = _2142 + 1;
    int _2146 = _2144;
    if (!_2098)
    {
        int _2148 = ~_2128;
        int _2150 = _2148 + 1;
        _2146 = _2150;
    }
    int _2152 = _2146;
    float _2154 = trunc(_2134);
    float _2156 = precise::max(_2154, 0.0);
    uint _2158 = uint(_2156);
    bool _2160 = uint(_2138) >= uint(_1521);
    if (!_1894)
    {
        _2120 = _209;
    }
    float _2162 = _2120;
    float _2164 = _2162;
    if (_1894)
    {
        float _2166 = -_209;
        float _2168 = _2132 ? _2166 : _209;
        _2164 = _2168;
    }
    float _2170 = _2164;
    bool _2172 = _2068 != 3;
    bool _2174 = !_2160;
    int _2176 = _2174 ? 0 : (-1);
    float _2178 = _2170 + 0.5;
    bool _2180 = uint(_2068) >= 2u;
    int _2182 = ~_2088;
    int _2184 = _2182 + _2176;
    int _2186 = _2184 + 1;
    int _2188 = int(_1986) + int(_2112);
    int _2190 = ~_1499;
    int _2192 = _2190 + 1;
    int _2194 = _1521 * _2186;
    int _2196 = _2194 + _1944;
    int _2198 = _2180 ? 0 : 1;
    bool _2200 = _1950 > 0.5;
    int _2202 = _2192 * _2188;
    int _2204 = _2202 + _1756;
    int _2206 = ~_2198;
    int _2208 = _2206 + 1;
    int _2210 = _2208 + 1;
    float _2212 = -_213;
    int _2214 = _2200 ? as_type<int>(_2212) : as_type<int>(_213);
    int _2216 = _2210;
    bool _2218 = _2180;
    if (_2172)
    {
        int _2220 = ~_2198;
        int _2222 = _2220 + 1;
        _2216 = _2222;
    }
    int _2224 = _2216;
    int _2226 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2228 = _2226 != 0;
    bool _2230 = !_1850;
    int _2232 = _2230 ? _2196 : (-1);
    bool _2234 = uint(_2204) >= uint(_1499);
    bool _2236 = !_2228;
    float _2238 = _2236 ? _213 : as_type<float>(_2214);
    int _2240 = _2232 & 3;
    bool _2242 = _2240 != 0;
    if (_1888)
    {
        bool _2244 = _2126 > 0.5;
        _2218 = _2244;
    }
    bool _2246 = _2218;
    bool _2248 = !_2234;
    int _2250 = _2248 ? 0 : (-1);
    bool _2252 = uint(_2240) > 1u;
    if (!_1888)
    {
        _2020 = _213;
    }
    float _2254 = _2020;
    float _2256 = _2254;
    if (_1888)
    {
        float _2258 = -_213;
        float _2260 = _2246 ? _2258 : _213;
        _2256 = _2260;
    }
    float _2262 = _2256;
    int _2264 = int(_2056) + int(_2158);
    int _2266 = ~_1521;
    int _2268 = _2266 + 1;
    int _2270 = _2232 & 3;
    bool _2272 = _2270 != 0;
    bool _2274 = _2240 != 3;
    int _2276 = _2268 * _2264;
    int _2278 = _2276 + _1920;
    int _2280 = _2272 ? 0 : 1;
    bool _2282 = uint(_2240) >= 2u;
    int _2284 = ~_2280;
    int _2286 = _2284 + 1;
    int _2288 = _2286 + 1;
    int _2290 = _2282 ? 0 : 1;
    bool _2292 = uint(_2278) >= uint(_1521);
    int _2294 = _2288;
    if (!_2252)
    {
        int _2296 = ~_2280;
        int _2298 = _2296 + 1;
        _2294 = _2298;
    }
    int _2300 = _2294;
    bool _2302 = _321 > 0.5;
    int _2304 = ~_2290;
    int _2306 = _2304 + 1;
    int _2308 = _2306 + 1;
    int _2310 = _2308;
    if (_2274)
    {
        int _2312 = ~_2290;
        int _2314 = _2312 + 1;
        _2310 = _2314;
    }
    int _2316 = _2310;
    int _2318 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2320 = _2318 != 0;
    bool _2322 = !_2292;
    int _2324 = _2322 ? 0 : (-1);
    float _2326 = -_209;
    int _2328 = _2302 ? as_type<int>(_2326) : as_type<int>(_209);
    bool _2330 = _323 > 0.5;
    bool _2332 = !_2320;
    float _2334 = _2332 ? _209 : as_type<float>(_2328);
    bool _2336 = _325 > 0.5;
    int _2338 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2340 = _2338 != 0;
    float _2342 = -_213;
    int _2344 = _2330 ? as_type<int>(_2342) : as_type<int>(_213);
    int _2346 = _2060 >> 31;
    int _2348 = _2232 >> 31;
    bool _2350 = !_2340;
    float _2352 = _2350 ? _213 : as_type<float>(_2344);
    float _2354 = -_209;
    int _2356 = _2336 ? as_type<int>(_2354) : as_type<int>(_209);
    int _2358 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2360 = _2358 != 0;
    int _2362 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2364 = _2362 != 0;
    int _2366 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2368 = _2366 != 0;
    int _2370 = _2346 & 3;
    float _2372 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _2374 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _2376 = _2348 & 3;
    float _2378 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _2380 = _2060 + _2370;
    float _2382 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2384 = _2374 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2386 = _2232 + _2376;
    float _2388 = _2378 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2390 = _2380 >> 2;
    float _2392 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _2394 = _2386 >> 2;
    float _2396 = _2382 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2398 = fma(_1505, _1505, 1.0);
    int _2400 = _2394 << 4;
    int _2402 = _2400 + 512;
    out.m_64.x = _2384;
    out.m_64.y = _2388;
    out.m_64.z = _2396;
    out.m_64.w = _2392;
    float _2404 = rsqrt(_2398);
    int _2406 = _2390 << 4;
    int _2408 = _2406 + 368;
    bool _2410 = !_2368;
    float _2412 = _2410 ? _209 : as_type<float>(_2356);
    int _2414 = ~_2188;
    int _2416 = _2414 + _2250;
    int _2418 = _2416 + 1;
    int _2420 = abs(_2300);
    int _2422 = abs(_2224);
    int _2424 = _1499 * _2418;
    int _2426 = _2424 + _1756;
    float _2428 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2430 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2432 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    uint _2434 = uint(int(uint(_2402) >> uint(2)));
    uint _2436 = uint(int(uint(int(_2434)) >> uint(2)));
    int _2438 = int(_2434) & 3;
    float _2440 = (*spvDescriptorSet0.vp_c9)._m0[int(_2436)][_2438];
    int _2442 = int(_2434) + 1;
    uint _2444 = uint(int(uint(_2442) >> uint(2)));
    int _2446 = _2442 & 3;
    float _2448 = (*spvDescriptorSet0.vp_c9)._m0[int(_2444)][_2446];
    float _2450 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2452 = -_2262;
    float _2454 = _2452 + 0.5;
    float _2456 = _2178 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _2458 = _2432 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2460 = _2428 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2462 = _2454 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _2464 = _209 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    uint _2466 = uint(int(uint(_2408) >> uint(2)));
    uint _2468 = uint(int(uint(int(_2466)) >> uint(2)));
    int _2470 = int(_2466) & 3;
    float _2472 = (*spvDescriptorSet0.vp_c9)._m0[int(_2468)][_2470];
    int _2474 = int(_2466) + 1;
    uint _2476 = uint(int(uint(_2474) >> uint(2)));
    int _2478 = _2474 & 3;
    float _2480 = (*spvDescriptorSet0.vp_c9)._m0[int(_2476)][_2478];
    float _2482 = _2456 * _2372;
    float _2484 = _2462 * _1597;
    float _2486 = fma(_1033, _2464, _1515);
    float _2488 = _1505 * _2404;
    float _2490 = _2430 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2492 = ~_2420;
    int _2494 = _2492 + 1;
    int _2496 = _2494 + 1;
    float _2498 = _1035 + _2486;
    int _2500 = _2408 + 8;
    uint _2502 = uint(int(uint(_2500) >> uint(2)));
    uint _2504 = uint(int(uint(int(_2502)) >> uint(2)));
    int _2506 = int(_2502) & 3;
    float _2508 = (*spvDescriptorSet0.vp_c9)._m0[int(_2504)][_2506];
    int _2510 = int(_2502) + 1;
    uint _2512 = uint(int(uint(_2510) >> uint(2)));
    int _2514 = _2510 & 3;
    float _2516 = (*spvDescriptorSet0.vp_c9)._m0[int(_2512)][_2514];
    float _2518 = -_2488;
    float _2520 = _1035 * _2518;
    out.m_66.x = _2458;
    out.m_66.y = _2460;
    out.m_66.z = _2490;
    out.m_66.w = _2450;
    float _2522 = _1031 * _1505;
    int _2524 = ~_2264;
    int _2526 = _2524 + _2324;
    int _2528 = _2526 + 1;
    float _2530 = -_1023;
    float _2532 = fma(_2530, _2404, _2520);
    out.m_68.x = _2482;
    out.m_68.y = _2484;
    int _2534 = _2402 + 8;
    uint _2536 = uint(int(uint(_2534) >> uint(2)));
    uint _2538 = uint(int(uint(int(_2536)) >> uint(2)));
    int _2540 = int(_2536) & 3;
    float _2542 = (*spvDescriptorSet0.vp_c9)._m0[int(_2538)][_2540];
    int _2544 = int(_2536) + 1;
    uint _2546 = uint(int(uint(_2544) >> uint(2)));
    int _2548 = _2544 & 3;
    float _2550 = (*spvDescriptorSet0.vp_c9)._m0[int(_2546)][_2548];
    int _2552 = _1521 * _2528;
    int _2554 = _2552 + _1920;
    int _2556 = abs(_2316);
    int _2558 = ~_2556;
    int _2560 = _2558 + 1;
    int _2562 = _2560 + 1;
    float _2564 = -_2488;
    float _2566 = _1047 * _2564;
    int _2568 = abs(_2152);
    float _2570 = -_2488;
    float _2572 = _1063 * _2570;
    bool _2574 = !_2242;
    int _2576 = _2574 ? 0 : 1;
    float _2578 = fma(_1029, _2404, _2566);
    bool _2580 = !_2070;
    int _2582 = _2580 ? 0 : 1;
    float _2584 = fma(_1031, _2404, _2572);
    bool _2586 = _2068 != 3;
    float _2588 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2590 = int(_2588);
    int _2592 = ~_2568;
    int _2594 = _2592 + 1;
    int _2596 = _2594 + 1;
    float _2598 = fma(_1043, _2464, _1525);
    int _2600 = abs(_2576);
    float _2602 = fma(_1055, _2464, _2522);
    bool _2604 = _2240 != 3;
    float _2606 = _1047 + _2598;
    int _2608 = ~_2600;
    int _2610 = _2608 + 1;
    int _2612 = _2610 + 1;
    int _2614 = _2496 * as_type<int>(_2448);
    int _2616 = abs(_2582);
    float _2618 = _1063 + _2602;
    bool _2620 = !_2586;
    int _2622 = _2620 ? 0 : (-1);
    int _2624 = _2612 * as_type<int>(_2440);
    int _2626 = _2624 + _2614;
    int _2628 = abs(_2622);
    int _2630 = _2596 * as_type<int>(_2480);
    int _2632 = ~_2616;
    int _2634 = _2632 + 1;
    int _2636 = _2634 + 1;
    float _2638 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2640 = int(_2638);
    int _2642 = ~_2590;
    int _2644 = _2642 + 1;
    int _2646 = _2636 * as_type<int>(_2472);
    int _2648 = _2646 + _2630;
    int _2650 = ~_2422;
    int _2652 = _2650 + 1;
    int _2654 = _2652 + 1;
    int _2656 = ~_2628;
    int _2658 = _2656 + 1;
    int _2660 = _2658 + 1;
    bool _2662 = !_2604;
    int _2664 = _2662 ? 0 : (-1);
    int _2666 = _2654 * as_type<int>(_2508);
    int _2668 = _2666 + _2648;
    float _2670 = float(uint(_2590));
    int _2672 = abs(_2664);
    int _2674 = _2660 * as_type<int>(_2516);
    int _2676 = _2674 + _2668;
    bool _2678 = !_2360;
    int _2680 = _2678 ? 0 : 1;
    int _2682 = _2562 * as_type<int>(_2542);
    int _2684 = _2682 + _2626;
    int _2686 = abs(_2590);
    float _2688 = 1.0 / _2670;
    int _2690 = abs(_2680);
    bool _2692 = !_2364;
    int _2694 = _2692 ? 0 : 1;
    int _2696 = ~_2672;
    int _2698 = _2696 + 1;
    int _2700 = _2698 + 1;
    int _2702 = ~_2690;
    int _2704 = _2702 + 1;
    int _2706 = _2704 + 1;
    int _2708 = abs(_2694);
    int _2710 = _2700 * as_type<int>(_2550);
    int _2712 = _2710 + _2684;
    float _2714 = float(uint(_2686));
    int _2716 = _2676 * _2706;
    float _2718 = float(uint(_2640));
    float _2720 = _1043 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    bool _2722 = !_1758;
    int _2724 = _2722 ? _2426 : (-1);
    float _2726 = 1.0 / _2714;
    int _2728 = abs(_2640);
    int _2730 = _2724 * _2690;
    int _2732 = _2730 + _2716;
    int _2734 = ~_2708;
    int _2736 = _2734 + 1;
    int _2738 = _2736 + 1;
    float _2740 = _1043 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    int _2742 = as_type<int>(_2688) + (-2);
    float _2744 = float(uint(_2732));
    float _2746 = 1.0 / _2718;
    int _2748 = _2712 * _2738;
    float _2750 = float(uint(_2728));
    float _2752 = fma(_1033, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2740);
    int _2754 = abs(_2732);
    int _2756 = ~_2640;
    int _2758 = _2756 + 1;
    float _2760 = 1.0 / _2750;
    bool _2762 = !_1850;
    int _2764 = _2762 ? _2554 : (-1);
    int _2766 = ~_2590;
    int _2768 = _2766 + 1;
    bool _2770 = _2640 == 0;
    int _2772 = _2764 * _2708;
    int _2774 = _2772 + _2748;
    float _2776 = as_type<float>(_2742) * _2744;
    int _2778 = as_type<int>(_2726) + (-2);
    float _2780 = _1043 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    int _2782 = as_type<int>(_2746) + (-2);
    float _2784 = fma(_1033, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2720);
    float _2786 = float(uint(_2774));
    float _2788 = trunc(_2776);
    float _2790 = precise::max(_2788, 0.0);
    uint _2792 = uint(_2790);
    float _2794 = fma(_1033, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2780);
    int _2796 = abs(_2774);
    float _2798 = as_type<float>(_2782) * _2786;
    float _2800 = float(uint(_2754));
    float _2802 = fma(_1055, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2752);
    int _2804 = as_type<int>(_2760) + (-2);
    float _2806 = trunc(_2798);
    float _2808 = precise::max(_2806, 0.0);
    uint _2810 = uint(_2808);
    float _2812 = as_type<float>(_2778) * _2800;
    float _2814 = float(uint(_2796));
    float _2816 = fma(_1055, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2794);
    float _2818 = fma(_1055, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2784);
    int _2820 = ~_2728;
    int _2822 = _2820 + 1;
    int _2824 = _2644 * int(_2792);
    int _2826 = _2824 + _2732;
    float _2828 = as_type<float>(_2804) * _2814;
    float _2830 = trunc(_2812);
    float _2832 = precise::max(_2830, 0.0);
    uint _2834 = uint(_2832);
    out.m_70.x = _2816;
    out.m_70.y = _2818;
    out.m_70.z = _2802;
    bool _2836 = _2640 == 0;
    float _2838 = float(uint(_2826));
    int _2840 = ~_2686;
    int _2842 = _2840 + 1;
    float _2844 = trunc(_2828);
    float _2846 = precise::max(_2844, 0.0);
    uint _2848 = uint(_2846);
    int _2850 = _2758 * int(_2810);
    int _2852 = _2850 + _2774;
    float _2854 = as_type<float>(_2742) * _2838;
    float _2856 = _2578 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2858 = float(uint(_2852));
    int _2860 = _2842 * int(_2834);
    int _2862 = _2860 + _2754;
    float _2864 = trunc(_2854);
    float _2866 = precise::max(_2864, 0.0);
    uint _2868 = uint(_2866);
    float _2870 = _2578 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2872 = fma(_2532, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2856);
    float _2874 = as_type<float>(_2782) * _2858;
    float _2876 = float(uint(_2862));
    float _2878 = fma(_2532, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2870);
    int _2880 = _2822 * int(_2848);
    int _2882 = _2880 + _2796;
    float _2884 = trunc(_2874);
    float _2886 = precise::max(_2884, 0.0);
    uint _2888 = uint(_2886);
    float _2890 = _2578 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2892 = as_type<float>(_2778) * _2876;
    float _2894 = fma(_2584, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2872);
    float _2896 = float(uint(_2882));
    float _2898 = fma(_2532, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2890);
    float _2900 = fma(_2584, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2878);
    float _2902 = _2606 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2904 = trunc(_2892);
    float _2906 = precise::max(_2904, 0.0);
    uint _2908 = uint(_2906);
    float _2910 = as_type<float>(_2804) * _2896;
    float _2912 = _2606 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2914 = _2606 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2916 = fma(_2584, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2898);
    int _2918 = ~_2640;
    int _2920 = _2918 + 1;
    float _2922 = fma(_2498, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2912);
    int _2924 = int(_2792) + int(_2868);
    float _2926 = trunc(_2910);
    float _2928 = precise::max(_2926, 0.0);
    uint _2930 = uint(_2928);
    out.m_72.x = _2894;
    out.m_72.y = _2900;
    out.m_72.z = _2916;
    int _2932 = int(_2810) + int(_2888);
    float _2934 = fma(_2498, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2902);
    float _2936 = fma(_2498, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2914);
    int _2938 = int(_2834) + int(_2908);
    float _2940 = fma(_2618, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2934);
    int _2942 = _2920 * _2932;
    int _2944 = _2942 + _2774;
    int _2946 = ~_2686;
    int _2948 = _2946 + 1;
    int _2950 = ~_2728;
    int _2952 = _2950 + 1;
    int _2954 = _2768 * _2924;
    int _2956 = _2954 + _2732;
    bool _2958 = uint(_2944) >= uint(_2640);
    float _2960 = _1433 * 0.5;
    bool _2962 = uint(_2956) >= uint(_2590);
    int _2964 = _2948 * _2938;
    int _2966 = _2964 + _2754;
    int _2968 = int(_2848) + int(_2930);
    float _2970 = fma(_1461, -0.5, _2960);
    float _2972 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2974 = !_2962;
    int _2976 = _2974 ? 0 : (-1);
    bool _2978 = _2590 == 0;
    int _2980 = _2952 * _2968;
    int _2982 = _2980 + _2796;
    bool _2984 = !_2958;
    int _2986 = _2984 ? 0 : (-1);
    float _2988 = _1491 * _2116;
    bool _2990 = uint(_2966) >= uint(_2686);
    float _2992 = _1493 * _2116;
    int _2994 = ~_2924;
    int _2996 = _2994 + _2976;
    int _2998 = _2996 + 1;
    float _3000 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _3002 = _2732 ^ _2590;
    out.m_62.y = _2970;
    int _3004 = ~_2932;
    int _3006 = _3004 + _2986;
    int _3008 = _3006 + 1;
    int _3010 = _2590 * _2998;
    int _3012 = _3010 + _2732;
    bool _3014 = !_2990;
    int _3016 = _3014 ? 0 : (-1);
    float _3018 = _2972 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _3020 = _2590 == 0;
    int _3022 = _2640 * _3008;
    int _3024 = _3022 + _2774;
    bool _3026 = uint(_2982) >= uint(_2728);
    float _3028 = fma(_2618, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2936);
    uint _3030 = uint(int(uint(_3002) >> uint(31)));
    float _3032 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _3034 = _2774 ^ _2640;
    int _3036 = ~_3016;
    int _3038 = _2938 + _3036;
    int _3040 = _3038 + 1;
    float _3042 = _3000 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _3044 = ~int(_3030);
    int _3046 = _3044 + 1;
    bool _3048 = !_3026;
    int _3050 = _3048 ? 0 : (-1);
    float _3052 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    uint _3054 = uint(int(uint(_3034) >> uint(31)));
    int _3056 = _3040 ^ _3046;
    int _3058 = ~_3050;
    int _3060 = _2968 + _3058;
    int _3062 = _3060 + 1;
    int _3064 = ~int(_3054);
    int _3066 = _3064 + 1;
    bool _3068 = !_2978;
    int _3070 = _3068 ? _3012 : (-1);
    int _3072 = ~_3046;
    int _3074 = _3072 + _3056;
    int _3076 = _3074 + 1;
    int _3078 = _3062 ^ _3066;
    bool _3080 = !_2770;
    int _3082 = _3080 ? _3024 : (-1);
    float _3084 = float(_3070);
    int _3086 = ~_3066;
    int _3088 = _3086 + _3078;
    int _3090 = _3088 + 1;
    float _3092 = float(_3082);
    float _3094 = fma(_3018, _3084, _515);
    bool _3096 = !_3020;
    int _3098 = _3096 ? _3076 : (-1);
    float _3100 = _2334 + 0.5;
    bool _3102 = !_2836;
    int _3104 = _3102 ? _3090 : (-1);
    float _3106 = fma(_3042, _3092, _667);
    float _3108 = float(_3098);
    float _3110 = _3032 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _3112 = float(_3104);
    float _3114 = _3052 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _3116 = fma(_3018, _3100, _3094);
    float _3118 = _2412 + 0.5;
    float _3120 = -_1680;
    float _3122 = _3120 + 1.0;
    float _3124 = -_759;
    float _3126 = fma(_3114, _3112, _3124);
    float _3128 = _2238 + (-0.5);
    float _3130 = fma(_3042, _3118, _3106);
    float _3132 = _1495 * _2116;
    float _3134 = -_621;
    float _3136 = fma(_3110, _3108, _3134);
    float _3138 = -_3114;
    float _3140 = fma(_3138, _3128, _3126);
    float _3142 = fma(_2618, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2922);
    bool _3144 = _1239 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3146 = isnan(_1239);
    bool _3148 = _3144 || _3146;
    bool _3150 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3152 = _3148 || _3150;
    out.m_74.x = _2988;
    out.m_74.y = _2992;
    out.m_74.z = _3132;
    out.m_74.w = _3122;
    float _3154 = _2352 + (-0.5);
    float _3156 = -_763;
    float _3158 = _3156 + 1.0;
    float _3160 = -_1563;
    float _3162 = fma(_2334, _3160, _3116);
    out.m_76.x = _3142;
    out.m_76.y = _2940;
    out.m_76.z = _3028;
    float _3164 = -_3110;
    float _3166 = fma(_3164, _3154, _3136);
    float _3168 = -_3158;
    float _3170 = fma(_2412, _3168, _3130);
    float _3172 = fma(_2238, _1579, _3140);
    float _3174 = fma(_2352, _1567, _3166);
    float _3176 = _3110;
    float _3178 = _2970;
    float _3180 = _3174;
    float _3182 = _3162;
    if (!_3152)
    {
        _1533 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3184 = _1533;
    out.m_78.x = _3162;
    out.m_78.y = _3174;
    out.m_78.z = _3170;
    out.m_78.w = _3172;
    float _3186 = _3184;
    float _3188 = _3184;
    if (!_3152)
    {
        _3176 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3190 = _3176;
    float _3192 = _3190;
    float _3194 = _3190;
    if (!_3152)
    {
        _3178 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3196 = _3178;
    float _3198 = _3196;
    float _3200 = _3196;
    if (!_3152)
    {
        _1644 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3202 = _1644;
    float _3204 = _3202;
    float _3206 = _3202;
    if (!_3152)
    {
        _3180 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3208 = _3180;
    float _3210 = _3208;
    float _3212 = _3208;
    if (!_3152)
    {
        _3182 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3214 = _3182;
    bool _3216 = !_3152;
    float _3218 = _3214;
    float _3220 = _3214;
    if (!_3216)
    {
        bool _3222 = _1239 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3224 = isnan(_1239);
        bool _3226 = _3222 || _3224;
        bool _3228 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3230 = _3226 || _3228;
        if (!_3230)
        {
            float _3232 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3234 = _1239 + _3232;
            float _3236 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3238 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3236;
            float _3240 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3242 = _3240 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3244 = 1.0 / _3238;
            float _3246 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3248 = _3246 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3250 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3252 = _3250 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3254 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3256 = _3254 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3258 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3260 = _3258 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3262 = _3234 * _3244;
            float _3264 = precise::clamp(_3262, 0.0, 1.0);
            float _3266 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3268 = _3266 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3270 = fma(_3264, _3242, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3272 = fma(_3264, _3268, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3274 = fma(_3264, _3248, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3276 = fma(_3264, _3252, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3278 = fma(_3264, _3256, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3280 = fma(_3264, _3260, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3220 = _3274;
            _3200 = _3278;
            _3212 = _3270;
            _3194 = _3276;
            _3188 = _3272;
            _3206 = _3280;
            _3282 = true;
        }
        else
        {
            bool _3284 = _1239 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3286 = isnan(_1239);
            bool _3288 = _3284 || _3286;
            bool _3290 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3292 = _3288 || _3290;
            if (!_3292)
            {
                _3210 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3294 = _3210;
            _3212 = _3294;
            if (!_3292)
            {
                _3218 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3296 = _3218;
            _3220 = _3296;
            if (!_3292)
            {
                _3186 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3298 = _3186;
            _3188 = _3298;
            if (!_3292)
            {
                _3192 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3300 = _3192;
            _3194 = _3300;
            if (!_3292)
            {
                _3198 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3302 = _3198;
            _3200 = _3302;
            if (!_3292)
            {
                _3204 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3304 = _3204;
            bool _3306 = !_3292;
            _3206 = _3304;
            if (!_3306)
            {
                bool _3308 = _1239 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3310 = isnan(_1239);
                bool _3312 = _3308 || _3310;
                bool _3314 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3316 = _3312 || _3314;
                if (!_3316)
                {
                    float _3318 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3320 = _1239 + _3318;
                    float _3322 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3324 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3322;
                    float _3326 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3328 = _3326 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3330 = 1.0 / _3324;
                    float _3332 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3334 = _3332 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3336 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3338 = _3336 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3340 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3342 = _3340 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3344 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3346 = _3344 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3348 = _3320 * _3330;
                    float _3350 = precise::clamp(_3348, 0.0, 1.0);
                    float _3352 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3354 = _3352 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3356 = fma(_3350, _3328, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3358 = fma(_3350, _3354, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3360 = fma(_3350, _3334, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3362 = fma(_3350, _3338, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3364 = fma(_3350, _3342, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3366 = fma(_3350, _3346, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3220 = _3360;
                    _3200 = _3364;
                    _3212 = _3356;
                    _3194 = _3362;
                    _3188 = _3358;
                    _3206 = _3366;
                    _3282 = true;
                }
                else
                {
                    _3220 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3200 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3212 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3194 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3188 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3206 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3282 = false;
    float _3368 = _3220;
    float _3370 = _3200;
    float _3372 = _3212;
    float _3374 = _3194;
    float _3376 = _3188;
    float _3378 = _3206;
    float _3380 = fma(_2940, -0.5, 0.5);
    float _3382 = precise::clamp(_3380, 0.0, 1.0);
    float _3384 = -_3368;
    float _3386 = _3384 + _3370;
    float _3388 = -_3372;
    float _3390 = _3388 + _3374;
    float _3392 = -_3376;
    float _3394 = _3392 + _3378;
    bool _3396 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3398 = fma(_3382, _3386, _3368);
    float _3400 = fma(_3382, _3390, _3372);
    float _3402 = fma(_3382, _3394, _3376);
    float _3404 = _3398 * 0.586610972881317138671875;
    out.m_45.x = 1.0;
    float _3406 = fma(_3400, 0.298911988735198974609375, _3404);
    out.m_80.w = (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3408 = fma(_3402, 0.114477999508380889892578125, _3406);
    out.m_82.x = 0.0;
    float _3410 = -_3408;
    float _3412 = _3400 + _3410;
    float _3414 = -_3408;
    float _3416 = _3398 + _3414;
    float _3418 = -_3408;
    float _3420 = _3402 + _3418;
    float _3422 = fma(_3412, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3408);
    float _3424 = fma(_3416, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3408);
    float _3426 = fma(_3420, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3408);
    out.m_84.x = _3422;
    out.m_84.y = _3424;
    out.m_84.z = _3426;
    if (!_3396)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3428 = -_1207;
    float _3430 = _3428 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3432 = -_1211;
    float _3434 = _3432 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3436 = -_1215;
    float _3438 = _3436 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3440 = _3430 * _3430;
    float _3442 = fma(_3434, _3434, _3440);
    float _3444 = fma(_3438, _3438, _3442);
    float _3446 = sqrt(_3444);
    float _3448 = rsqrt(_3444);
    float _3450 = -_3446;
    float _3452 = _3450 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3454 = _3452 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3456 = precise::clamp(_3454, 0.0, 1.0);
    float _3458 = _3434 * _3448;
    float _3460 = _3430 * _3448;
    float _3462 = abs(_3456);
    float _3464 = log2(_3462);
    float _3466 = _3438 * _3448;
    float _3468 = _3458 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3470 = _2940 * _3460;
    float _3472 = -_3460;
    float _3474 = -_3468;
    float _3476 = fma(_3472, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3474);
    float _3478 = fma(_3142, _3458, _3470);
    float _3480 = -_3466;
    float _3482 = fma(_3480, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3476);
    float _3484 = fma(_3028, _3466, _3478);
    float _3486 = precise::clamp(_3484, 0.0, 1.0);
    float _3488 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3490 = _3482 + _3488;
    float _3492 = _3464 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3494 = _3490 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3496 = precise::clamp(_3494, 0.0, 1.0);
    float _3498 = exp2(_3492);
    float _3500 = _3498 * _3496;
    float _3502 = _3486 * _3500;
    float _3504 = _3502 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3506 = _3502 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3508 = _3502 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_82.x = _3504;
    out.m_82.y = _3506;
    out.m_82.z = _3508;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3282 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _98 = in.m_42.w;
    float _100 = trunc(_98);
    int _103 = int(_100);
    bool _107 = _103 >= 1;
    float _109 = 0.0;
    float _111 = as_type<float>(_103);
    float _113 = 0.0;
    if (!_107)
    {
        _109 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _115 = _109;
    if (!_107)
    {
        out.m_45.x = 0.0;
    }
    int _117 = 0;
    if (!_107)
    {
        float _119 = _115 * 5.0;
        _117 = as_type<int>(_119);
    }
    int _121 = _117;
    if (!_107)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3565 = as_type<float>(_121);
        out.gl_Position.z = _3565;
    }
    if (!_107)
    {
        return out;
    }
    float _123 = in.m_47.w;
    float _125 = float(_103);
    float _127 = -_123;
    float _129 = _127 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _131 = _123 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _133 = isnan(_123);
    bool _135 = _131 || _133;
    bool _137 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _139 = _135 || _137;
    bool _141 = _129 >= _125;
    bool _143 = !_139;
    bool _145 = _141 || _143;
    float _147 = 1.0 / _125;
    float _149 = _129;
    if (_145)
    {
        _111 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _151 = _111;
    if (_145)
    {
        out.m_45.x = 0.0;
    }
    float _153 = _129 * _147;
    int _155 = 0;
    float _157 = _153;
    if (_145)
    {
        float _159 = _151 * 5.0;
        _155 = as_type<int>(_159);
    }
    int _161 = _155;
    out.m_49.x = _153;
    if (_145)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3637 = as_type<float>(_161);
        out.gl_Position.z = _3637;
    }
    if (_145)
    {
        return out;
    }
    float _163 = as_type<float>(int(gl_VertexIndex));
    float _165 = in.m_54.w;
    bool _167 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _169 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _171 = _167 || _169;
    bool _173 = isnan(1.0);
    bool _175 = _171 || _173;
    float _177 = in.m_47.x;
    float _179 = in.m_47.y;
    float _181 = in.m_47.z;
    float _183 = in.m_42.x;
    float _185 = in.m_42.y;
    float _187 = in.m_42.z;
    int _189 = as_type<int>(_163) & 1;
    bool _191 = _189 != 0;
    int _193 = as_type<int>(_163) & 2;
    bool _195 = _193 != 0;
    float _197 = _129 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _199 = _197;
    if (!_175)
    {
        float _201 = _197 * _197;
        float _203 = _201 * 0.5;
        _113 = _203;
    }
    float _205 = _113;
    bool _207 = !_191;
    float _209 = _207 ? (-0.5) : 0.5;
    bool _211 = !_195;
    float _213 = _211 ? (-0.5) : 0.5;
    float _215 = _205;
    if (!_175)
    {
        float _217 = _205 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _215 = _217;
    }
    float _219 = _215;
    bool _221 = !_175;
    float _223 = _219;
    if (!_221)
    {
        float _225 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _227 = log2(_225);
        float _229 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _231 = _229 + 1.0;
        float _233 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _235 = _197 * _227;
        float _237 = 1.0 / _231;
        float _239 = _233 * 0.693147182464599609375;
        float _241 = exp2(_235);
        float _243 = 1.0 / _239;
        float _245 = _241 + (-1.0);
        float _247 = -_245;
        float _249 = fma(_247, _243, _197);
        float _251 = _249 * _237;
        float _253 = _251 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _223 = _253;
    }
    float _255 = _223;
    bool _257 = !_175;
    if (!_257)
    {
        float _259 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _261 = log2(_259);
        float _263 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _265 = _263 + 1.0;
        float _267 = 1.0 / _265;
        float _269 = _197 * _261;
        float _271 = exp2(_269);
        float _273 = -_271;
        float _275 = _273 + 1.0;
        float _277 = _275 * _267;
        _199 = _277;
    }
    float _279 = _199;
    bool _281 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _283 = _255 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _285 = _255 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _287 = _255 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _289 = fma(_279, _177, _283);
    float _291 = fma(_279, _179, _285);
    float _293 = fma(_279, _181, _287);
    float _295 = fma(_289, _165, _183);
    float _297 = fma(_291, _165, _185);
    float _299 = fma(_293, _165, _187);
    bool _301 = !_281;
    if (!_301)
    {
        float _303 = in.m_56.x;
        float _305 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _307 = _303 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _309 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[12].x, _129);
        float _311 = _309 * _305;
        float _313 = floor(_311);
        float _315 = -_313;
        float _317 = _311 + _315;
        _157 = _317;
    }
    float _319 = _157;
    float _321 = in.m_56.x;
    float _323 = in.m_56.y;
    float _325 = in.m_56.z;
    float _327 = _297 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _331 = _319 + _329;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _335 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _333;
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _339 = _337 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    int _341 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _343 = _341 != 0;
    float _345 = _297 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _347 = 1.0 / _335;
    float _349 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _351 = fma(_295, (*spvDescriptorSet0.vp_c10)._m0[4].x, _327);
    float _353 = fma(_295, (*spvDescriptorSet0.vp_c10)._m0[6].x, _345);
    float _355 = _297 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _359 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _357;
    float _361 = fma(_299, (*spvDescriptorSet0.vp_c10)._m0[4].z, _351);
    float _363 = 1.0 / _339;
    float _365 = fma(_299, (*spvDescriptorSet0.vp_c10)._m0[6].z, _353);
    float _367 = fma(_295, (*spvDescriptorSet0.vp_c10)._m0[5].x, _355);
    float _369 = _361 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _371 = _321 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _373 = _321 * 2.0;
    float _375 = 1.0 / _359;
    float _377 = _323 * 2.0;
    float _379 = -_349;
    float _381 = fma(_371, 2.0, _379);
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _385 = _319 + _383;
    float _387 = _325 + _321;
    float _389 = fma(_299, (*spvDescriptorSet0.vp_c10)._m0[5].z, _367);
    float _391 = _385 * _347;
    float _393 = floor(_373);
    float _395 = _325 * 2.0;
    float _397 = _321 + _323;
    float _399 = _331 * _363;
    float _401 = _387 + (-1.0);
    float _403 = _397 + (-1.0);
    float _405 = _325 + _323;
    float _407 = floor(_395);
    float _409 = fma(_403, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _411 = _405 + (-1.0);
    int _413 = as_type<int>(_405);
    if (_343)
    {
        _413 = 0;
    }
    int _415 = _413;
    float _417 = fma(_401, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _419 = _415;
    if (!_343)
    {
        _419 = 1;
    }
    int _421 = _419;
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _425 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _423;
    float _427 = floor(_377);
    bool _429 = _393 > 0.0;
    float _431 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _433 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _431;
    bool _435 = _421 != 1;
    float _437 = fma(_425, _391, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _439 = fma(_433, _391, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _441 = _393 >= 0.0;
    bool _443 = isnan(_393);
    bool _445 = _441 || _443;
    bool _447 = isnan(0.0);
    bool _449 = _445 || _447;
    float _451 = _323 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _453 = _407 > 0.0;
    float _455 = fma(_411, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _457 = _449 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _459 = _389 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _461 = _407 >= 0.0;
    bool _463 = isnan(_407);
    bool _465 = _461 || _463;
    bool _467 = isnan(0.0);
    bool _469 = _465 || _467;
    float _471 = _365 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _473 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _475 = _459 + _473;
    int _477 = ~as_type<int>(_457);
    int _479 = _477 + 1;
    int _481 = _479 + 1;
    float _483 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _485 = _369 + _483;
    float _487 = _469 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _489 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _491 = _481;
    float _493 = _457;
    float _495 = _487;
    float _497 = _459;
    if (!_429)
    {
        int _499 = ~as_type<int>(_457);
        int _501 = _499 + 1;
        _491 = _501;
    }
    int _503 = _491;
    float _505 = _475 * _475;
    if (!_435)
    {
        _493 = _323;
    }
    float _507 = _493;
    float _509 = _147 * _129;
    bool _511 = _427 > 0.0;
    float _513 = -_129;
    float _515 = fma(_513, (*spvDescriptorSet0.vp_c9)._m0[76].x, _381);
    bool _517 = _427 >= 0.0;
    bool _519 = isnan(_427);
    bool _521 = _517 || _519;
    bool _523 = isnan(0.0);
    bool _525 = _521 || _523;
    float _527 = _507;
    if (_435)
    {
        _527 = _321;
    }
    float _529 = _527;
    float _531 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _533 = int(_531);
    int _535 = ~as_type<int>(_487);
    int _537 = _535 + 1;
    int _539 = _537 + 1;
    float _541 = fma(_529, (*spvDescriptorSet0.vp_c9)._m0[83].z, _489);
    int _543 = _539;
    float _545 = _529;
    if (!_453)
    {
        int _547 = ~as_type<int>(_487);
        int _549 = _547 + 1;
        _543 = _549;
    }
    int _551 = _543;
    int _553 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _555 = _553 != 0;
    int _557 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _559 = _557 != 0;
    int _561 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _563 = _561 != 0;
    float _565 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    if (!_435)
    {
        _495 = _325;
    }
    float _567 = _495;
    float _569 = _567;
    if (_435)
    {
        _569 = _323;
    }
    float _571 = _569;
    if (!_435)
    {
        _545 = _323;
    }
    float _573 = _545;
    float _575 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _577 = _573;
    if (_435)
    {
        _577 = _321;
    }
    float _579 = _577;
    float _581 = fma(_571, (*spvDescriptorSet0.vp_c9)._m0[83].w, _565);
    bool _583 = !_559;
    int _585 = _583 ? 0 : 1;
    float _587 = fma(_451, -2.0, _575);
    bool _589 = !_555;
    int _591 = _589 ? 0 : 1;
    float _593 = _579 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _595 = !_563;
    int _597 = _595 ? 0 : 1;
    float _599 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _601 = log2(_599);
    int _603 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _605 = _603 != 0;
    int _607 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _609 = _607 != 0;
    int _611 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _613 = _611 != 0;
    float _615 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _617 = _319 + _615;
    int _619 = _525 ? 0 : 1;
    float _621 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[76].y, _587);
    float _623 = _617 * _375;
    bool _625 = !_605;
    int _627 = _625 ? 0 : 1;
    int _629 = ~_619;
    int _631 = _629 + 1;
    int _633 = _631 + 1;
    float _635 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _637 = _633;
    float _639 = _593;
    if (!_511)
    {
        int _641 = ~_619;
        int _643 = _641 + 1;
        _637 = _643;
    }
    int _645 = _637;
    float _647 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _649 = int(_647);
    bool _651 = !_613;
    int _653 = _651 ? 0 : 1;
    float _655 = -_635;
    float _657 = fma(_593, 2.0, _655);
    int _659 = abs(_627);
    bool _661 = !_609;
    int _663 = _661 ? 0 : 1;
    float _665 = -_129;
    float _667 = fma(_665, (*spvDescriptorSet0.vp_c9)._m0[81].x, _657);
    if (!_435)
    {
        _639 = _325;
    }
    float _669 = _639;
    int _671 = abs(_653);
    float _673 = float(_659);
    float _675 = float(_551);
    float _677 = _669;
    if (_435)
    {
        _677 = _323;
    }
    float _679 = _677;
    float _681 = _673 * _675;
    int _683 = abs(_663);
    float _685 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _687 = float(_645);
    float _689 = _679 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _691 = float(_671);
    float _693 = _601 * _129;
    float _695 = float(_503);
    float _697 = fma(_689, -2.0, _685);
    float _699 = float(_683);
    float _701 = _691 * _687;
    float _703 = float(_649);
    float _705 = exp2(_693);
    float _707 = float(_533);
    float _709 = _699 * _695;
    float _711 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _713 = _471 + _711;
    float _715 = fma(_485, _485, _505);
    float _717 = 1.0 / _703;
    float _719 = fma(_713, _713, _715);
    float _721 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _723 = 1.0 + _721;
    float _725 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _727 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _729 = isnan(0.0);
    bool _731 = _727 || _729;
    bool _733 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _735 = _731 || _733;
    float _737 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[82].w, _581);
    bool _739 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _741 = isnan(1.0);
    bool _743 = _739 || _741;
    bool _745 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _747 = _743 || _745;
    float _749 = 1.0 / _707;
    float _751 = -_705;
    float _753 = _751 + 1.0;
    float _755 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _757 = fma(_321, (*spvDescriptorSet0.vp_c9)._m0[78].z, _725);
    float _759 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[81].y, _697);
    float _761 = _735 ? _753 : 0.0;
    float _763 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[82].z, _541);
    float _765 = rsqrt(_719);
    float _767 = in.m_58.x;
    float _769 = in.m_58.y;
    float _771 = in.m_58.z;
    float _773 = _681 * (-2.0);
    float _775 = fma(_323, (*spvDescriptorSet0.vp_c9)._m0[78].w, _755);
    float _777 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].z, _757);
    float _779 = _717 * _129;
    float _781 = fma(_409, _773, _409);
    float _783 = 1.0 / _723;
    float _785 = _749 * _129;
    float _787 = _475 * _765;
    float _789 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].w, _775);
    float _791 = -_787;
    float _793 = fma(_791, (*spvDescriptorSet0.vp_c9)._m0[18].w, _475);
    if (_747)
    {
        float _795 = _761 * _783;
        _149 = _795;
    }
    float _797 = _149;
    float _799 = fma(_773, _767, _767);
    float _801 = _709 * (-2.0);
    float _803 = _485 * _765;
    float _805 = _321 + (-0.5);
    float _807 = _793 * _793;
    float _809 = fma(_455, _801, _455);
    float _811 = fma(_801, _769, _769);
    float _813 = -_803;
    float _815 = fma(_813, (*spvDescriptorSet0.vp_c9)._m0[18].w, _485);
    float _817 = _713 * _765;
    bool _819 = _319 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _821 = isnan(_319);
    bool _823 = _819 || _821;
    bool _825 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _827 = _823 || _825;
    float _829 = float(_827);
    float _831 = fma(_805, (*spvDescriptorSet0.vp_c9)._m0[196].x, _799);
    float _833 = _323 + (-0.5);
    bool _835 = _319 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _837 = isnan(_319);
    bool _839 = _835 || _837;
    bool _841 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _843 = _839 || _841;
    float _845 = float(_843);
    float _847 = fma(_815, _815, _807);
    float _849 = -_817;
    float _851 = fma(_849, (*spvDescriptorSet0.vp_c9)._m0[18].w, _713);
    float _853 = -_829;
    float _855 = _853 + 1.0;
    float _857 = fma(_833, (*spvDescriptorSet0.vp_c9)._m0[196].y, _811);
    bool _859 = _319 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _861 = isnan(_319);
    bool _863 = _859 || _861;
    bool _865 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _867 = _863 || _865;
    float _869 = float(_867);
    float _871 = -_845;
    float _873 = _871 + 1.0;
    float _875 = fma(_851, _851, _847);
    float _877 = _845 * _855;
    bool _879 = _319 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _881 = isnan(_319);
    bool _883 = _879 || _881;
    bool _885 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _887 = _883 || _885;
    float _889 = float(_887);
    float _891 = _869 * _873;
    float _893 = -_869;
    float _895 = _893 + 1.0;
    float _897 = fma(_781, _797, _831);
    float _899 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _901 = _899 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _903 = -_889;
    float _905 = _903 + 1.0;
    float _907 = _889 * _895;
    float _909 = _897 * 0.15915493667125701904296875;
    float _911 = fma(_809, _797, _857);
    float _913 = in.m_54.x;
    float _915 = in.m_54.y;
    float _917 = _439 * _907;
    float _919 = fma(_901, _399, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _921 = _701 * (-2.0);
    float _923 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _925 = _923 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _927 = fma(_905, (*spvDescriptorSet0.vp_c9)._m0[143].y, _917);
    float _929 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _931 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _929;
    float _933 = _437 * _907;
    float _935 = fma(_925, _399, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _937 = fma(_919, _891, _927);
    float _939 = fma(_921, _771, _771);
    float _941 = _325 + (-0.5);
    float _943 = fma(_417, _921, _417);
    float _945 = sqrt(_875);
    float _947 = fma(_941, (*spvDescriptorSet0.vp_c9)._m0[196].z, _939);
    float _949 = fma(_931, _623, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _951 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _953 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _951;
    float _955 = fma(_905, (*spvDescriptorSet0.vp_c9)._m0[143].x, _933);
    float _957 = fma(_943, _797, _947);
    float _959 = fma(_949, _877, _937);
    float _961 = _911 * 0.15915493667125701904296875;
    float _963 = fma(_953, _623, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _965 = _957 * 0.15915493667125701904296875;
    float _967 = fma(_935, _891, _955);
    float _969 = fma(_829, (*spvDescriptorSet0.vp_c9)._m0[146].y, _959);
    float _971 = _909 * 6.283185482025146484375;
    float _973 = cos(_971);
    float _975 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _213);
    float _977 = fma(_963, _877, _967);
    float _979 = _969 * _915;
    float _981 = _765 * _945;
    float _983 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _209);
    float _985 = fma(_829, (*spvDescriptorSet0.vp_c9)._m0[146].x, _977);
    float _987 = _979 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _989 = _961 * 6.283185482025146484375;
    float _991 = sin(_989);
    float _993 = _985 * _913;
    float _995 = _987 * _981;
    float _997 = _993 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _999 = _995 * _975;
    float _1001 = _961 * 6.283185482025146484375;
    float _1003 = cos(_1001);
    float _1005 = _997 * _981;
    float _1007 = _1005 * _983;
    float _1009 = _909 * 6.283185482025146484375;
    float _1011 = sin(_1009);
    float _1013 = _973 * _991;
    float _1015 = _965 * 6.283185482025146484375;
    float _1017 = cos(_1015);
    float _1019 = _973 * _1003;
    float _1021 = _965 * 6.283185482025146484375;
    float _1023 = sin(_1021);
    float _1025 = _1011 * _991;
    float _1027 = _1011 * _1003;
    float _1029 = _973 * _1017;
    float _1031 = _1011 * _1017;
    float _1033 = _1003 * _1017;
    float _1035 = _991 * _1017;
    float _1037 = _1029 * _999;
    float _1039 = _981 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1041 = _1039 * 0.5;
    float _1043 = fma(_1023, _1019, _1025);
    float _1045 = -_1027;
    float _1047 = fma(_1023, _1013, _1045);
    float _1049 = -_999;
    float _1051 = _1023 * _1049;
    float _1053 = -_1013;
    float _1055 = fma(_1023, _1027, _1053);
    float _1057 = fma(_1043, _1007, _1037);
    float _1059 = _1031 * _999;
    float _1061 = fma(_1033, _1007, _1051);
    float _1063 = fma(_1023, _1025, _1019);
    float _1065 = fma(_1047, _1041, _1057);
    float _1067 = fma(_1055, _1007, _1059);
    float _1069 = fma(_1035, _1041, _1061);
    float _1071 = _1065 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1073 = fma(_1063, _1041, _1067);
    float _1075 = _1065 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1077 = _1065 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1079 = fma(_1069, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1071);
    float _1081 = fma(_1069, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1075);
    float _1083 = fma(_1069, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1077);
    float _1085 = fma(_1073, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1079);
    float _1087 = fma(_1073, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1081);
    float _1089 = fma(_1073, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1083);
    float _1091 = _471 + _1085;
    float _1093 = _369 + _1087;
    float _1095 = _459 + _1089;
    float _1097 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1099 = _1091 + _1097;
    float _1101 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1103 = _1093 + _1101;
    float _1105 = _1099 * _1099;
    float _1107 = fma(_1103, _1103, _1105);
    float _1109 = sqrt(_1107);
    bool _1111 = _1109 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1113 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1115 = _1113 != 0;
    int _1117 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1119 = _1117 != 0;
    int _1121 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1123 = _1121 != 0;
    int _1125 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1127 = _1125 != 0;
    bool _1129 = !_1119;
    int _1131 = _1129 ? 0 : 1;
    bool _1133 = !_1115;
    int _1135 = _1133 ? 0 : 1;
    bool _1137 = !_1123;
    int _1139 = _1137 ? 0 : 1;
    bool _1141 = !_1127;
    int _1143 = _1141 ? 0 : 1;
    float _1145 = _1089;
    float _1147 = _1083;
    if (!_1111)
    {
        _1145 = _1093;
    }
    float _1149 = _1145;
    float _1151 = _1149;
    if (!_1111)
    {
        _497 = _1091;
    }
    float _1153 = _497;
    float _1155 = _1153;
    if (!_1111)
    {
        _1147 = _1095;
    }
    float _1157 = _1147;
    bool _1159 = !_1111;
    float _1161 = _1157;
    if (!_1159)
    {
        float _1163 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1165 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1167 = _1109 + _1165;
        float _1169 = _1095 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1171 = rsqrt(_1107);
        float _1173 = _1167 * _1163;
        float _1175 = _1173 * 0.15915493667125701904296875;
        float _1177 = _1175 * 6.283185482025146484375;
        float _1179 = sin(_1177);
        float _1181 = _1175 * 6.283185482025146484375;
        float _1183 = cos(_1181);
        float _1185 = fma(_1179, _1169, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1187 = _1171 * _1185;
        float _1189 = _1183 + (-1.0);
        float _1191 = fma(_1103, _1187, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1193 = fma(_1099, _1187, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1195 = _1189 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1197 = fma(_1095, _1183, _1195);
        _1161 = _1197;
        _1151 = _1191;
        _1155 = _1193;
    }
    float _1199 = _1161;
    float _1201 = _1151;
    float _1203 = _1155;
    float _1205 = -_787;
    float _1207 = fma(_1205, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1199);
    float _1209 = -_803;
    float _1211 = fma(_1209, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1201);
    float _1213 = -_817;
    float _1215 = fma(_1213, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1203);
    float _1217 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1219 = _1207 + _1217;
    float _1221 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1223 = _1211 + _1221;
    float _1225 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1227 = _1215 + _1225;
    float _1229 = _1207 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1231 = _1219 * _1219;
    float _1233 = fma(_1223, _1223, _1231);
    float _1235 = fma(_1227, _1227, _1233);
    float _1237 = rsqrt(_1235);
    float _1239 = sqrt(_1235);
    float _1241 = _1237 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1243 = _1223 * _1241;
    float _1245 = _1227 * _1241;
    float _1247 = _1243 * _1243;
    float _1249 = _1245 * _1245;
    float _1251 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1253 = _1247 + _1249;
    float _1255 = precise::max(0.0, _1251);
    float _1257 = sqrt(_1253);
    float _1259 = -_1241;
    float _1261 = -_1255;
    float _1263 = fma(_1219, _1259, _1261);
    bool _1265 = _1257 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1267 = _1219;
    float _1269 = _1251;
    float _1271 = _1255;
    float _1273 = _1247;
    float _1275 = _1249;
    if (!_1265)
    {
        _1267 = _1243;
    }
    float _1277 = _1267;
    float _1279 = _1277;
    if (!_1265)
    {
        _1269 = _1263;
    }
    float _1281 = _1269;
    float _1283 = _1281;
    if (!_1265)
    {
        _1271 = _1245;
    }
    float _1285 = _1271;
    bool _1287 = !_1265;
    float _1289 = _1285;
    if (!_1287)
    {
        float _1291 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1293 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1295 = _1257 + _1293;
        float _1297 = _1263 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1299 = rsqrt(_1253);
        float _1301 = _1295 * _1291;
        float _1303 = _1301 * 0.15915493667125701904296875;
        float _1305 = _1303 * 6.283185482025146484375;
        float _1307 = sin(_1305);
        float _1309 = _1303 * 6.283185482025146484375;
        float _1311 = cos(_1309);
        float _1313 = fma(_1307, _1297, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1315 = _1299 * _1313;
        float _1317 = _1311 + (-1.0);
        float _1319 = _1243 * _1315;
        float _1321 = _1317 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1323 = _1245 * _1315;
        float _1325 = fma(_1263, _1311, _1321);
        float _1327 = _1319 * _1319;
        float _1329 = _1323 * _1323;
        _1283 = _1325;
        _1273 = _1327;
        _1275 = _1329;
        _1279 = _1319;
        _1289 = _1323;
    }
    float _1331 = _1283;
    float _1333 = _1273;
    float _1335 = _1275;
    float _1337 = _1279;
    float _1339 = _1289;
    float _1341 = fma(_1331, _1331, _1333);
    float _1343 = fma(_1211, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1229);
    float _1345 = _1341 + _1335;
    float _1347 = fma(_1215, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1343);
    float _1349 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1351 = fma(_1239, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1349);
    float _1353 = precise::clamp(_1351, 0.0, 1.0);
    float _1355 = rsqrt(_1345);
    float _1357 = _1347 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1359 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1361 = -_1353;
    float _1363 = _1361 + 1.0;
    float _1365 = _1357 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1367 = _1207 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1369 = _1207 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1371 = -_1365;
    float _1373 = fma(_1359, _1371, 1.0);
    float _1375 = _1207 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1377 = abs(_1363);
    float _1379 = log2(_1377);
    float _1381 = fma(_1211, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1367);
    float _1383 = fma(_1211, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1369);
    float _1385 = fma(_1211, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1375);
    float _1387 = _1355 * _1337;
    float _1389 = _1355 * _1331;
    float _1391 = fma(_1215, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1385);
    float _1393 = _1355 * _1339;
    float _1395 = _1387 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1397 = fma(_1215, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1381);
    float _1399 = _1391 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1401 = log2(_1373);
    float _1403 = -_1395;
    float _1405 = fma(_1389, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1403);
    float _1407 = _1397 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1409 = _1399 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1411 = _1379 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1413 = -_1393;
    float _1415 = fma(_1413, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1405);
    float _1417 = fma(_1215, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1383);
    float _1419 = fma(_1407, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1409);
    float _1421 = exp2(_1411);
    float _1423 = fma(_1415, -0.5, 0.5);
    float _1425 = _1417 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1427 = fma(_1357, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1419);
    float _1429 = _1399 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1431 = fma(_1415, 0.5, 0.5);
    float _1433 = fma(_1425, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1427);
    float _1435 = sqrt(_1423);
    float _1437 = _1399 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1439 = fma(_1407, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1429);
    float _1441 = _1389 + 1.0;
    float _1443 = fma(_1431, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1445 = fma(_1407, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1437);
    float _1447 = fma(_1357, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1439);
    float _1449 = 1.0 / _1433;
    float _1451 = fma(_1357, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1445);
    float _1453 = -_1389;
    float _1455 = fma(_1421, _1441, _1453);
    float _1457 = fma(_1431, _1443, -0.212114393711090087890625);
    float _1459 = fma(_1425, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1447);
    float _1461 = fma(_1425, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1451);
    float _1463 = _1401 * 0.693147182464599609375;
    float _1465 = fma(_1431, _1457, 1.570728778839111328125);
    float _1467 = _1435 * 0.636619746685028076171875;
    float _1469 = fma(_1455, 0.5, 0.5);
    float _1471 = _1463 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1473 = -_1465;
    float _1475 = fma(_1467, _1473, 1.0);
    float _1477 = _1459 * _1449;
    float _1479 = _1461 * _1449;
    float _1481 = fma(_1477, 0.5, 0.5);
    float _1483 = fma(_1479, -0.5, 0.5);
    float3 _5725 = float3(_1481, _1483, _1471);
    float _1485 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5725, float3(0.0), isnan(_5725)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5725, float3(0.0), isnan(_5725)), level(0.0)).x;
    float2 _5736 = float2(_1475, _1469);
    float3 _1489 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5736, float2(0.0), isnan(_5736)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5736, float2(0.0), isnan(_5736)), level(0.0)).xyz;
    float _1491 = _1489.x;
    float _1493 = _1489.y;
    float _1495 = _1489.z;
    float _1497 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1499 = int(_1497);
    int _1501 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1503 = _1501 != 0;
    float _1505 = _213 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _1507 = abs(_591);
    float _1509 = _1399 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1511 = abs(_597);
    float _1513 = -_1505;
    float _1515 = _1023 * _1513;
    int _1517 = abs(_1131);
    float _1519 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1521 = int(_1519);
    int _1523 = abs(_1135);
    float _1525 = _1029 * _1505;
    float _1527 = fma(_1407, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1509);
    float _1529 = _1379 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1531 = 0.0;
    float _1533 = _1433;
    if (_1503)
    {
        float _1535 = in.m_56.x;
        _1531 = _1535;
    }
    float _1537 = _1531;
    float _1539 = 0.0;
    if (_1503)
    {
        _1539 = 1.0;
    }
    float _1541 = _1539;
    float _1543 = trunc(_779);
    int _1545 = int(_1543);
    float _1547 = float(uint(_1499));
    float _1549 = _1537;
    float _1551 = _1541;
    if (!_1503)
    {
        float _1553 = in.m_56.y;
        _1549 = _1553;
    }
    float _1555 = _1549;
    if (!_1503)
    {
        _1551 = 7.345489978790283203125;
    }
    float _1557 = _1551;
    float _1559 = fma(_1357, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1527);
    float _1561 = -_777;
    float _1563 = _1561 + 1.0;
    out.m_60.x = _1211;
    out.m_60.y = _1207;
    out.m_60.z = _1215;
    float _1565 = -_789;
    float _1567 = _1565 + 1.0;
    float _1569 = 1.0 / _1547;
    float _1571 = float(uint(_1521));
    float _1573 = _1557 * _321;
    float _1575 = fma(_1425, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1559);
    float _1577 = -_737;
    float _1579 = _1577 + 1.0;
    out.m_62.w = _1433;
    float _1581 = float(uint(_1545));
    float _1583 = 1.0 / _1571;
    out.gl_Position.x = _1459;
    out.gl_Position.y = _1461;
    out.gl_Position.z = _1575;
    out.gl_Position.w = _1433;
    int _1585 = as_type<int>(_1569) + (-2);
    float _1587 = trunc(_785);
    int _1589 = int(_1587);
    float _1591 = as_type<float>(_1585) * _1581;
    float _1593 = _1459 + _1433;
    int _1595 = as_type<int>(_1583) + (-2);
    float _1597 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    int _1599 = ~_1499;
    int _1601 = _1599 + 1;
    float _1603 = _1593 * 0.5;
    int _1605 = ~_1521;
    int _1607 = _1605 + 1;
    float _1609 = float(uint(_1589));
    float _1611 = trunc(_1591);
    float _1613 = precise::max(_1611, 0.0);
    uint _1616 = uint(_1613);
    out.m_62.x = _1603;
    float _1618 = as_type<float>(_1595) * _1609;
    float _1620 = floor(_1573);
    int _1622 = _1601 * int(_1616);
    int _1624 = _1622 + _1545;
    float _1626 = trunc(_1618);
    float _1628 = precise::max(_1626, 0.0);
    uint _1630 = uint(_1628);
    float _1632 = float(uint(_1624));
    float _1634 = -_1620;
    float _1636 = _1573 + _1634;
    float _1638 = exp2(_1529);
    float _1640 = as_type<float>(_1585) * _1632;
    float _1642 = _1632;
    float _1644 = _1603;
    if (_1503)
    {
        _1642 = 1.0;
    }
    float _1646 = _1642;
    float _1648 = _1646;
    if (!_1503)
    {
        _1648 = 1.2345600128173828125;
    }
    float _1650 = _1648;
    float _1652 = trunc(_1640);
    float _1654 = precise::max(_1652, 0.0);
    uint _1656 = uint(_1654);
    int _1658 = _1607 * int(_1630);
    int _1660 = _1658 + _1589;
    float _1662 = _1555 * _1650;
    int _1664 = ~_1499;
    int _1666 = _1664 + 1;
    float _1668 = float(uint(_1660));
    float _1670 = floor(_1662);
    float _1672 = -_1638;
    float _1674 = _1672 + 1.0;
    float _1676 = as_type<float>(_1595) * _1668;
    float _1678 = float(_1499);
    float _1680 = _1674 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _1682 = int(_1616) + int(_1656);
    float _1684 = trunc(_1676);
    float _1686 = precise::max(_1684, 0.0);
    uint _1688 = uint(_1686);
    float _1690 = _1636 * _1678;
    float _1692 = float(_1545);
    int _1694 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1696 = _1694 != 0;
    float _1698 = trunc(_1690);
    int _1700 = int(_1698);
    int _1702 = _1666 * _1682;
    int _1704 = _1702 + _1545;
    bool _1706 = _1692 >= _1678;
    bool _1708 = isnan(_1692);
    bool _1710 = _1706 || _1708;
    bool _1712 = isnan(_1678);
    bool _1714 = _1710 || _1712;
    float _1716 = float(_1714);
    float _1718 = -_1670;
    float _1720 = _1662 + _1718;
    bool _1722 = !_1696;
    int _1724 = _1722 ? 0 : 1;
    bool _1726 = uint(_1704) >= uint(_1499);
    float _1728 = trunc(_1716);
    int _1730 = int(_1728);
    int _1732 = abs(_1724);
    bool _1734 = !_1726;
    int _1736 = _1734 ? 0 : (-1);
    int _1738 = int(_1630) + int(_1688);
    int _1740 = ~_1682;
    int _1742 = _1740 + _1736;
    int _1744 = _1742 + 1;
    int _1746 = ~_1521;
    int _1748 = _1746 + 1;
    int _1750 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1752 = _1750 != 0;
    int _1754 = _1700 * _1732;
    int _1756 = _1754 + _1545;
    bool _1758 = _1499 == 0;
    int _1760 = _1499 * _1744;
    int _1762 = _1760 + _1545;
    float _1764 = _1678 * _509;
    int _1766 = _1748 * _1738;
    int _1768 = _1766 + _1589;
    int _1770 = ~_1730;
    int _1772 = _1770 + 1;
    int _1774 = _1772 + 1;
    bool _1776 = !_1758;
    int _1778 = _1776 ? _1762 : (-1);
    bool _1780 = uint(_1768) >= uint(_1521);
    float _1782 = trunc(_1764);
    int _1784 = int(_1782);
    float _1786 = float(_1521);
    int _1788 = _1778 * _1774;
    float _1790 = float(_1589);
    int _1792 = _1499 + (-1);
    float _1794 = _1786 * _509;
    int _1796 = abs(_585);
    bool _1798 = _1790 >= _1786;
    bool _1800 = isnan(_1790);
    bool _1802 = _1798 || _1800;
    bool _1804 = isnan(_1786);
    bool _1806 = _1802 || _1804;
    float _1808 = float(_1806);
    int _1810 = _1730 * _1792;
    int _1812 = _1810 + _1788;
    float _1814 = trunc(_1794);
    int _1816 = int(_1814);
    bool _1818 = !_1780;
    int _1820 = _1818 ? 0 : (-1);
    int _1822 = _1812 * _1796;
    bool _1824 = !_1752;
    int _1826 = _1824 ? 0 : 1;
    int _1828 = ~_1738;
    int _1830 = _1828 + _1820;
    int _1832 = _1830 + 1;
    float _1834 = trunc(_1808);
    int _1836 = int(_1834);
    int _1838 = _1784 * _1507;
    int _1840 = _1838 + _1822;
    int _1842 = abs(_1826);
    float _1844 = _1720 * _1786;
    int _1846 = _1521 * _1832;
    int _1848 = _1846 + _1589;
    bool _1850 = _1521 == 0;
    int _1852 = _1756 * _1511;
    int _1854 = _1852 + _1840;
    int _1856 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1858 = _1856 != 0;
    bool _1860 = !_1850;
    int _1862 = _1860 ? _1848 : (-1);
    int _1864 = _1700 * _1842;
    int _1866 = _1864 + _1854;
    float _1868 = trunc(_1844);
    int _1870 = int(_1868);
    int _1872 = _1521 + (-1);
    bool _1874 = !_1858;
    int _1876 = _1874 ? 0 : 1;
    int _1878 = ~_1836;
    int _1880 = _1878 + 1;
    int _1882 = _1880 + 1;
    float _1884 = float(uint(_1866));
    int _1886 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1888 = _1886 != 0;
    int _1890 = _1862 * _1882;
    int _1892 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1894 = _1892 != 0;
    float _1896 = as_type<float>(_1585) * _1884;
    int _1898 = _1836 * _1872;
    int _1900 = _1898 + _1890;
    int _1902 = abs(_1876);
    float _1904 = trunc(_1896);
    float _1906 = precise::max(_1904, 0.0);
    uint _1908 = uint(_1906);
    int _1910 = abs(_1139);
    int _1912 = _1900 * _1517;
    int _1914 = ~_1499;
    int _1916 = _1914 + 1;
    int _1918 = _1870 * _1902;
    int _1920 = _1918 + _1589;
    int _1922 = _1816 * _1523;
    int _1924 = _1922 + _1912;
    int _1926 = abs(_1143);
    float _1928 = as_type<float>(_1910);
    if (_1888)
    {
        float _1930 = in.m_56.x;
        _1928 = _1930;
    }
    float _1932 = _1928;
    int _1934 = ~_1499;
    int _1936 = _1934 + 1;
    int _1938 = _1920 * _1910;
    int _1940 = _1938 + _1924;
    int _1942 = _1870 * _1926;
    int _1944 = _1942 + _1940;
    int _1946 = _1916 * int(_1908);
    int _1948 = _1946 + _1866;
    float _1950 = in.m_56.w;
    int _1952 = ~_1521;
    int _1954 = _1952 + 1;
    float _1956 = float(uint(_1944));
    float _1958 = float(uint(_1948));
    float _1960 = as_type<float>(_1585) * _1958;
    float _1962 = as_type<float>(_1595) * _1956;
    float _1964 = float(uint(_1756));
    float _1966 = trunc(_1960);
    float _1968 = precise::max(_1966, 0.0);
    uint _1970 = uint(_1968);
    float _1972 = as_type<float>(_1585) * _1964;
    float _1974 = trunc(_1962);
    float _1976 = precise::max(_1974, 0.0);
    uint _1978 = uint(_1976);
    int _1980 = int(_1908) + int(_1970);
    float _1982 = trunc(_1972);
    float _1984 = precise::max(_1982, 0.0);
    uint _1986 = uint(_1984);
    int _1988 = _1936 * _1980;
    int _1990 = _1988 + _1866;
    int _1992 = _1954 * int(_1978);
    int _1994 = _1992 + _1944;
    bool _1996 = uint(_1990) >= uint(_1499);
    float _1998 = float(uint(_1920));
    float _2000 = float(uint(_1994));
    bool _2002 = !_1996;
    int _2004 = _2002 ? 0 : (-1);
    float _2006 = as_type<float>(_1595) * _1998;
    int _2008 = ~_1499;
    int _2010 = _2008 + 1;
    float _2012 = as_type<float>(_1595) * _2000;
    float _2014 = _1998;
    float _2016 = as_type<float>(_1980);
    float _2018 = as_type<float>(_1978);
    float _2020 = _1950;
    if (_1894)
    {
        float _2022 = _1950 * 3.1415927410125732421875;
        _2014 = _2022;
    }
    float _2024 = _2014;
    int _2026 = ~_1980;
    int _2028 = _2026 + _2004;
    int _2030 = _2028 + 1;
    float _2032 = trunc(_2012);
    float _2034 = precise::max(_2032, 0.0);
    uint _2036 = uint(_2034);
    int _2038 = _2010 * int(_1986);
    int _2040 = _2038 + _1756;
    if (_1894)
    {
        float _2042 = _2024 * 0.15915493667125701904296875;
        _2016 = _2042;
    }
    float _2044 = _2016;
    int _2046 = _1499 * _2030;
    int _2048 = _2046 + _1866;
    float _2050 = float(uint(_2040));
    float _2052 = trunc(_2006);
    float _2054 = precise::max(_2052, 0.0);
    uint _2056 = uint(_2054);
    bool _2058 = !_1758;
    int _2060 = _2058 ? _2048 : (-1);
    int _2062 = ~_1521;
    int _2064 = _2062 + 1;
    float _2066 = as_type<float>(_1585) * _2050;
    int _2068 = _2060 & 3;
    bool _2070 = _2068 != 0;
    int _2072 = _2060 & 3;
    bool _2074 = _2072 != 0;
    float _2076 = as_type<float>(_1866);
    float _2078 = _2044;
    bool _2080 = _2074;
    if (_1894)
    {
        float _2082 = _2044 * 6.283185482025146484375;
        float _2084 = sin(_2082);
        _2076 = _2084;
    }
    float _2086 = _2076;
    int _2088 = int(_1978) + int(_2036);
    if (_1888)
    {
        float _2090 = _1932 * 3.1415927410125732421875;
        _2018 = _2090;
    }
    float _2092 = _2018;
    int _2094 = ~_1521;
    int _2096 = _2094 + 1;
    bool _2098 = uint(_2068) > 1u;
    int _2100 = _2064 * int(_2056);
    int _2102 = _2100 + _1920;
    if (_1888)
    {
        float _2104 = _2092 * 0.15915493667125701904296875;
        _2078 = _2104;
    }
    float _2106 = _2078;
    float _2108 = trunc(_2066);
    float _2110 = precise::max(_2108, 0.0);
    uint _2112 = uint(_2110);
    float _2114 = float(uint(_2102));
    float _2116 = _1680 * _1485;
    float _2118 = _2106;
    float _2120 = _2114;
    if (_1888)
    {
        float _2122 = _2106 * 6.283185482025146484375;
        float _2124 = sin(_2122);
        _2118 = _2124;
    }
    float _2126 = _2118;
    int _2128 = _2074 ? 0 : 1;
    if (_1894)
    {
        bool _2130 = _2086 > 0.5;
        _2080 = _2130;
    }
    bool _2132 = _2080;
    float _2134 = as_type<float>(_1595) * _2114;
    int _2136 = _2096 * _2088;
    int _2138 = _2136 + _1944;
    int _2140 = ~_2128;
    int _2142 = _2140 + 1;
    int _2144 = _2142 + 1;
    int _2146 = _2144;
    if (!_2098)
    {
        int _2148 = ~_2128;
        int _2150 = _2148 + 1;
        _2146 = _2150;
    }
    int _2152 = _2146;
    float _2154 = trunc(_2134);
    float _2156 = precise::max(_2154, 0.0);
    uint _2158 = uint(_2156);
    bool _2160 = uint(_2138) >= uint(_1521);
    if (!_1894)
    {
        _2120 = _209;
    }
    float _2162 = _2120;
    float _2164 = _2162;
    if (_1894)
    {
        float _2166 = -_209;
        float _2168 = _2132 ? _2166 : _209;
        _2164 = _2168;
    }
    float _2170 = _2164;
    bool _2172 = _2068 != 3;
    bool _2174 = !_2160;
    int _2176 = _2174 ? 0 : (-1);
    float _2178 = _2170 + 0.5;
    bool _2180 = uint(_2068) >= 2u;
    int _2182 = ~_2088;
    int _2184 = _2182 + _2176;
    int _2186 = _2184 + 1;
    int _2188 = int(_1986) + int(_2112);
    int _2190 = ~_1499;
    int _2192 = _2190 + 1;
    int _2194 = _1521 * _2186;
    int _2196 = _2194 + _1944;
    int _2198 = _2180 ? 0 : 1;
    bool _2200 = _1950 > 0.5;
    int _2202 = _2192 * _2188;
    int _2204 = _2202 + _1756;
    int _2206 = ~_2198;
    int _2208 = _2206 + 1;
    int _2210 = _2208 + 1;
    float _2212 = -_213;
    int _2214 = _2200 ? as_type<int>(_2212) : as_type<int>(_213);
    int _2216 = _2210;
    bool _2218 = _2180;
    if (_2172)
    {
        int _2220 = ~_2198;
        int _2222 = _2220 + 1;
        _2216 = _2222;
    }
    int _2224 = _2216;
    int _2226 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2228 = _2226 != 0;
    bool _2230 = !_1850;
    int _2232 = _2230 ? _2196 : (-1);
    bool _2234 = uint(_2204) >= uint(_1499);
    bool _2236 = !_2228;
    float _2238 = _2236 ? _213 : as_type<float>(_2214);
    int _2240 = _2232 & 3;
    bool _2242 = _2240 != 0;
    if (_1888)
    {
        bool _2244 = _2126 > 0.5;
        _2218 = _2244;
    }
    bool _2246 = _2218;
    bool _2248 = !_2234;
    int _2250 = _2248 ? 0 : (-1);
    bool _2252 = uint(_2240) > 1u;
    if (!_1888)
    {
        _2020 = _213;
    }
    float _2254 = _2020;
    float _2256 = _2254;
    if (_1888)
    {
        float _2258 = -_213;
        float _2260 = _2246 ? _2258 : _213;
        _2256 = _2260;
    }
    float _2262 = _2256;
    int _2264 = int(_2056) + int(_2158);
    int _2266 = ~_1521;
    int _2268 = _2266 + 1;
    int _2270 = _2232 & 3;
    bool _2272 = _2270 != 0;
    bool _2274 = _2240 != 3;
    int _2276 = _2268 * _2264;
    int _2278 = _2276 + _1920;
    int _2280 = _2272 ? 0 : 1;
    bool _2282 = uint(_2240) >= 2u;
    int _2284 = ~_2280;
    int _2286 = _2284 + 1;
    int _2288 = _2286 + 1;
    int _2290 = _2282 ? 0 : 1;
    bool _2292 = uint(_2278) >= uint(_1521);
    int _2294 = _2288;
    if (!_2252)
    {
        int _2296 = ~_2280;
        int _2298 = _2296 + 1;
        _2294 = _2298;
    }
    int _2300 = _2294;
    bool _2302 = _321 > 0.5;
    int _2304 = ~_2290;
    int _2306 = _2304 + 1;
    int _2308 = _2306 + 1;
    int _2310 = _2308;
    if (_2274)
    {
        int _2312 = ~_2290;
        int _2314 = _2312 + 1;
        _2310 = _2314;
    }
    int _2316 = _2310;
    int _2318 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2320 = _2318 != 0;
    bool _2322 = !_2292;
    int _2324 = _2322 ? 0 : (-1);
    float _2326 = -_209;
    int _2328 = _2302 ? as_type<int>(_2326) : as_type<int>(_209);
    bool _2330 = _323 > 0.5;
    bool _2332 = !_2320;
    float _2334 = _2332 ? _209 : as_type<float>(_2328);
    bool _2336 = _325 > 0.5;
    int _2338 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2340 = _2338 != 0;
    float _2342 = -_213;
    int _2344 = _2330 ? as_type<int>(_2342) : as_type<int>(_213);
    int _2346 = _2060 >> 31;
    int _2348 = _2232 >> 31;
    bool _2350 = !_2340;
    float _2352 = _2350 ? _213 : as_type<float>(_2344);
    float _2354 = -_209;
    int _2356 = _2336 ? as_type<int>(_2354) : as_type<int>(_209);
    int _2358 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2360 = _2358 != 0;
    int _2362 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2364 = _2362 != 0;
    int _2366 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2368 = _2366 != 0;
    int _2370 = _2346 & 3;
    float _2372 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _2374 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _2376 = _2348 & 3;
    float _2378 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _2380 = _2060 + _2370;
    float _2382 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2384 = _2374 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2386 = _2232 + _2376;
    float _2388 = _2378 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2390 = _2380 >> 2;
    float _2392 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _2394 = _2386 >> 2;
    float _2396 = _2382 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2398 = fma(_1505, _1505, 1.0);
    int _2400 = _2394 << 4;
    int _2402 = _2400 + 512;
    out.m_64.x = _2384;
    out.m_64.y = _2388;
    out.m_64.z = _2396;
    out.m_64.w = _2392;
    float _2404 = rsqrt(_2398);
    int _2406 = _2390 << 4;
    int _2408 = _2406 + 368;
    bool _2410 = !_2368;
    float _2412 = _2410 ? _209 : as_type<float>(_2356);
    int _2414 = ~_2188;
    int _2416 = _2414 + _2250;
    int _2418 = _2416 + 1;
    int _2420 = abs(_2300);
    int _2422 = abs(_2224);
    int _2424 = _1499 * _2418;
    int _2426 = _2424 + _1756;
    float _2428 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2430 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2432 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    uint _2434 = uint(int(uint(_2402) >> uint(2)));
    uint _2436 = uint(int(uint(int(_2434)) >> uint(2)));
    int _2438 = int(_2434) & 3;
    float _2440 = (*spvDescriptorSet0.vp_c9)._m0[int(_2436)][_2438];
    int _2442 = int(_2434) + 1;
    uint _2444 = uint(int(uint(_2442) >> uint(2)));
    int _2446 = _2442 & 3;
    float _2448 = (*spvDescriptorSet0.vp_c9)._m0[int(_2444)][_2446];
    float _2450 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2452 = -_2262;
    float _2454 = _2452 + 0.5;
    float _2456 = _2178 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _2458 = _2432 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2460 = _2428 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2462 = _2454 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _2464 = _209 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    uint _2466 = uint(int(uint(_2408) >> uint(2)));
    uint _2468 = uint(int(uint(int(_2466)) >> uint(2)));
    int _2470 = int(_2466) & 3;
    float _2472 = (*spvDescriptorSet0.vp_c9)._m0[int(_2468)][_2470];
    int _2474 = int(_2466) + 1;
    uint _2476 = uint(int(uint(_2474) >> uint(2)));
    int _2478 = _2474 & 3;
    float _2480 = (*spvDescriptorSet0.vp_c9)._m0[int(_2476)][_2478];
    float _2482 = _2456 * _2372;
    float _2484 = _2462 * _1597;
    float _2486 = fma(_1033, _2464, _1515);
    float _2488 = _1505 * _2404;
    float _2490 = _2430 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2492 = ~_2420;
    int _2494 = _2492 + 1;
    int _2496 = _2494 + 1;
    float _2498 = _1035 + _2486;
    int _2500 = _2408 + 8;
    uint _2502 = uint(int(uint(_2500) >> uint(2)));
    uint _2504 = uint(int(uint(int(_2502)) >> uint(2)));
    int _2506 = int(_2502) & 3;
    float _2508 = (*spvDescriptorSet0.vp_c9)._m0[int(_2504)][_2506];
    int _2510 = int(_2502) + 1;
    uint _2512 = uint(int(uint(_2510) >> uint(2)));
    int _2514 = _2510 & 3;
    float _2516 = (*spvDescriptorSet0.vp_c9)._m0[int(_2512)][_2514];
    float _2518 = -_2488;
    float _2520 = _1035 * _2518;
    out.m_66.x = _2458;
    out.m_66.y = _2460;
    out.m_66.z = _2490;
    out.m_66.w = _2450;
    float _2522 = _1031 * _1505;
    int _2524 = ~_2264;
    int _2526 = _2524 + _2324;
    int _2528 = _2526 + 1;
    float _2530 = -_1023;
    float _2532 = fma(_2530, _2404, _2520);
    out.m_68.x = _2482;
    out.m_68.y = _2484;
    int _2534 = _2402 + 8;
    uint _2536 = uint(int(uint(_2534) >> uint(2)));
    uint _2538 = uint(int(uint(int(_2536)) >> uint(2)));
    int _2540 = int(_2536) & 3;
    float _2542 = (*spvDescriptorSet0.vp_c9)._m0[int(_2538)][_2540];
    int _2544 = int(_2536) + 1;
    uint _2546 = uint(int(uint(_2544) >> uint(2)));
    int _2548 = _2544 & 3;
    float _2550 = (*spvDescriptorSet0.vp_c9)._m0[int(_2546)][_2548];
    int _2552 = _1521 * _2528;
    int _2554 = _2552 + _1920;
    int _2556 = abs(_2316);
    int _2558 = ~_2556;
    int _2560 = _2558 + 1;
    int _2562 = _2560 + 1;
    float _2564 = -_2488;
    float _2566 = _1047 * _2564;
    int _2568 = abs(_2152);
    float _2570 = -_2488;
    float _2572 = _1063 * _2570;
    bool _2574 = !_2242;
    int _2576 = _2574 ? 0 : 1;
    float _2578 = fma(_1029, _2404, _2566);
    bool _2580 = !_2070;
    int _2582 = _2580 ? 0 : 1;
    float _2584 = fma(_1031, _2404, _2572);
    bool _2586 = _2068 != 3;
    float _2588 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2590 = int(_2588);
    int _2592 = ~_2568;
    int _2594 = _2592 + 1;
    int _2596 = _2594 + 1;
    float _2598 = fma(_1043, _2464, _1525);
    int _2600 = abs(_2576);
    float _2602 = fma(_1055, _2464, _2522);
    bool _2604 = _2240 != 3;
    float _2606 = _1047 + _2598;
    int _2608 = ~_2600;
    int _2610 = _2608 + 1;
    int _2612 = _2610 + 1;
    int _2614 = _2496 * as_type<int>(_2448);
    int _2616 = abs(_2582);
    float _2618 = _1063 + _2602;
    bool _2620 = !_2586;
    int _2622 = _2620 ? 0 : (-1);
    int _2624 = _2612 * as_type<int>(_2440);
    int _2626 = _2624 + _2614;
    int _2628 = abs(_2622);
    int _2630 = _2596 * as_type<int>(_2480);
    int _2632 = ~_2616;
    int _2634 = _2632 + 1;
    int _2636 = _2634 + 1;
    float _2638 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2640 = int(_2638);
    int _2642 = ~_2590;
    int _2644 = _2642 + 1;
    int _2646 = _2636 * as_type<int>(_2472);
    int _2648 = _2646 + _2630;
    int _2650 = ~_2422;
    int _2652 = _2650 + 1;
    int _2654 = _2652 + 1;
    int _2656 = ~_2628;
    int _2658 = _2656 + 1;
    int _2660 = _2658 + 1;
    bool _2662 = !_2604;
    int _2664 = _2662 ? 0 : (-1);
    int _2666 = _2654 * as_type<int>(_2508);
    int _2668 = _2666 + _2648;
    float _2670 = float(uint(_2590));
    int _2672 = abs(_2664);
    int _2674 = _2660 * as_type<int>(_2516);
    int _2676 = _2674 + _2668;
    bool _2678 = !_2360;
    int _2680 = _2678 ? 0 : 1;
    int _2682 = _2562 * as_type<int>(_2542);
    int _2684 = _2682 + _2626;
    int _2686 = abs(_2590);
    float _2688 = 1.0 / _2670;
    int _2690 = abs(_2680);
    bool _2692 = !_2364;
    int _2694 = _2692 ? 0 : 1;
    int _2696 = ~_2672;
    int _2698 = _2696 + 1;
    int _2700 = _2698 + 1;
    int _2702 = ~_2690;
    int _2704 = _2702 + 1;
    int _2706 = _2704 + 1;
    int _2708 = abs(_2694);
    int _2710 = _2700 * as_type<int>(_2550);
    int _2712 = _2710 + _2684;
    float _2714 = float(uint(_2686));
    int _2716 = _2676 * _2706;
    float _2718 = float(uint(_2640));
    float _2720 = _1043 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    bool _2722 = !_1758;
    int _2724 = _2722 ? _2426 : (-1);
    float _2726 = 1.0 / _2714;
    int _2728 = abs(_2640);
    int _2730 = _2724 * _2690;
    int _2732 = _2730 + _2716;
    int _2734 = ~_2708;
    int _2736 = _2734 + 1;
    int _2738 = _2736 + 1;
    float _2740 = _1043 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    int _2742 = as_type<int>(_2688) + (-2);
    float _2744 = float(uint(_2732));
    float _2746 = 1.0 / _2718;
    int _2748 = _2712 * _2738;
    float _2750 = float(uint(_2728));
    float _2752 = fma(_1033, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2740);
    int _2754 = abs(_2732);
    int _2756 = ~_2640;
    int _2758 = _2756 + 1;
    float _2760 = 1.0 / _2750;
    bool _2762 = !_1850;
    int _2764 = _2762 ? _2554 : (-1);
    int _2766 = ~_2590;
    int _2768 = _2766 + 1;
    bool _2770 = _2640 == 0;
    int _2772 = _2764 * _2708;
    int _2774 = _2772 + _2748;
    float _2776 = as_type<float>(_2742) * _2744;
    int _2778 = as_type<int>(_2726) + (-2);
    float _2780 = _1043 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    int _2782 = as_type<int>(_2746) + (-2);
    float _2784 = fma(_1033, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2720);
    float _2786 = float(uint(_2774));
    float _2788 = trunc(_2776);
    float _2790 = precise::max(_2788, 0.0);
    uint _2792 = uint(_2790);
    float _2794 = fma(_1033, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2780);
    int _2796 = abs(_2774);
    float _2798 = as_type<float>(_2782) * _2786;
    float _2800 = float(uint(_2754));
    float _2802 = fma(_1055, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2752);
    int _2804 = as_type<int>(_2760) + (-2);
    float _2806 = trunc(_2798);
    float _2808 = precise::max(_2806, 0.0);
    uint _2810 = uint(_2808);
    float _2812 = as_type<float>(_2778) * _2800;
    float _2814 = float(uint(_2796));
    float _2816 = fma(_1055, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2794);
    float _2818 = fma(_1055, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2784);
    int _2820 = ~_2728;
    int _2822 = _2820 + 1;
    int _2824 = _2644 * int(_2792);
    int _2826 = _2824 + _2732;
    float _2828 = as_type<float>(_2804) * _2814;
    float _2830 = trunc(_2812);
    float _2832 = precise::max(_2830, 0.0);
    uint _2834 = uint(_2832);
    out.m_70.x = _2816;
    out.m_70.y = _2818;
    out.m_70.z = _2802;
    bool _2836 = _2640 == 0;
    float _2838 = float(uint(_2826));
    int _2840 = ~_2686;
    int _2842 = _2840 + 1;
    float _2844 = trunc(_2828);
    float _2846 = precise::max(_2844, 0.0);
    uint _2848 = uint(_2846);
    int _2850 = _2758 * int(_2810);
    int _2852 = _2850 + _2774;
    float _2854 = as_type<float>(_2742) * _2838;
    float _2856 = _2578 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2858 = float(uint(_2852));
    int _2860 = _2842 * int(_2834);
    int _2862 = _2860 + _2754;
    float _2864 = trunc(_2854);
    float _2866 = precise::max(_2864, 0.0);
    uint _2868 = uint(_2866);
    float _2870 = _2578 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2872 = fma(_2532, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2856);
    float _2874 = as_type<float>(_2782) * _2858;
    float _2876 = float(uint(_2862));
    float _2878 = fma(_2532, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2870);
    int _2880 = _2822 * int(_2848);
    int _2882 = _2880 + _2796;
    float _2884 = trunc(_2874);
    float _2886 = precise::max(_2884, 0.0);
    uint _2888 = uint(_2886);
    float _2890 = _2578 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2892 = as_type<float>(_2778) * _2876;
    float _2894 = fma(_2584, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2872);
    float _2896 = float(uint(_2882));
    float _2898 = fma(_2532, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2890);
    float _2900 = fma(_2584, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2878);
    float _2902 = _2606 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2904 = trunc(_2892);
    float _2906 = precise::max(_2904, 0.0);
    uint _2908 = uint(_2906);
    float _2910 = as_type<float>(_2804) * _2896;
    float _2912 = _2606 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2914 = _2606 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2916 = fma(_2584, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2898);
    int _2918 = ~_2640;
    int _2920 = _2918 + 1;
    float _2922 = fma(_2498, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2912);
    int _2924 = int(_2792) + int(_2868);
    float _2926 = trunc(_2910);
    float _2928 = precise::max(_2926, 0.0);
    uint _2930 = uint(_2928);
    out.m_72.x = _2894;
    out.m_72.y = _2900;
    out.m_72.z = _2916;
    int _2932 = int(_2810) + int(_2888);
    float _2934 = fma(_2498, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2902);
    float _2936 = fma(_2498, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2914);
    int _2938 = int(_2834) + int(_2908);
    float _2940 = fma(_2618, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2934);
    int _2942 = _2920 * _2932;
    int _2944 = _2942 + _2774;
    int _2946 = ~_2686;
    int _2948 = _2946 + 1;
    int _2950 = ~_2728;
    int _2952 = _2950 + 1;
    int _2954 = _2768 * _2924;
    int _2956 = _2954 + _2732;
    bool _2958 = uint(_2944) >= uint(_2640);
    float _2960 = _1433 * 0.5;
    bool _2962 = uint(_2956) >= uint(_2590);
    int _2964 = _2948 * _2938;
    int _2966 = _2964 + _2754;
    int _2968 = int(_2848) + int(_2930);
    float _2970 = fma(_1461, -0.5, _2960);
    float _2972 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2974 = !_2962;
    int _2976 = _2974 ? 0 : (-1);
    bool _2978 = _2590 == 0;
    int _2980 = _2952 * _2968;
    int _2982 = _2980 + _2796;
    bool _2984 = !_2958;
    int _2986 = _2984 ? 0 : (-1);
    float _2988 = _1491 * _2116;
    bool _2990 = uint(_2966) >= uint(_2686);
    float _2992 = _1493 * _2116;
    int _2994 = ~_2924;
    int _2996 = _2994 + _2976;
    int _2998 = _2996 + 1;
    float _3000 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _3002 = _2732 ^ _2590;
    out.m_62.y = _2970;
    int _3004 = ~_2932;
    int _3006 = _3004 + _2986;
    int _3008 = _3006 + 1;
    int _3010 = _2590 * _2998;
    int _3012 = _3010 + _2732;
    bool _3014 = !_2990;
    int _3016 = _3014 ? 0 : (-1);
    float _3018 = _2972 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _3020 = _2590 == 0;
    int _3022 = _2640 * _3008;
    int _3024 = _3022 + _2774;
    bool _3026 = uint(_2982) >= uint(_2728);
    float _3028 = fma(_2618, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2936);
    uint _3030 = uint(int(uint(_3002) >> uint(31)));
    float _3032 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _3034 = _2774 ^ _2640;
    int _3036 = ~_3016;
    int _3038 = _2938 + _3036;
    int _3040 = _3038 + 1;
    float _3042 = _3000 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _3044 = ~int(_3030);
    int _3046 = _3044 + 1;
    bool _3048 = !_3026;
    int _3050 = _3048 ? 0 : (-1);
    float _3052 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    uint _3054 = uint(int(uint(_3034) >> uint(31)));
    int _3056 = _3040 ^ _3046;
    int _3058 = ~_3050;
    int _3060 = _2968 + _3058;
    int _3062 = _3060 + 1;
    int _3064 = ~int(_3054);
    int _3066 = _3064 + 1;
    bool _3068 = !_2978;
    int _3070 = _3068 ? _3012 : (-1);
    int _3072 = ~_3046;
    int _3074 = _3072 + _3056;
    int _3076 = _3074 + 1;
    int _3078 = _3062 ^ _3066;
    bool _3080 = !_2770;
    int _3082 = _3080 ? _3024 : (-1);
    float _3084 = float(_3070);
    int _3086 = ~_3066;
    int _3088 = _3086 + _3078;
    int _3090 = _3088 + 1;
    float _3092 = float(_3082);
    float _3094 = fma(_3018, _3084, _515);
    bool _3096 = !_3020;
    int _3098 = _3096 ? _3076 : (-1);
    float _3100 = _2334 + 0.5;
    bool _3102 = !_2836;
    int _3104 = _3102 ? _3090 : (-1);
    float _3106 = fma(_3042, _3092, _667);
    float _3108 = float(_3098);
    float _3110 = _3032 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _3112 = float(_3104);
    float _3114 = _3052 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _3116 = fma(_3018, _3100, _3094);
    float _3118 = _2412 + 0.5;
    float _3120 = -_1680;
    float _3122 = _3120 + 1.0;
    float _3124 = -_759;
    float _3126 = fma(_3114, _3112, _3124);
    float _3128 = _2238 + (-0.5);
    float _3130 = fma(_3042, _3118, _3106);
    float _3132 = _1495 * _2116;
    float _3134 = -_621;
    float _3136 = fma(_3110, _3108, _3134);
    float _3138 = -_3114;
    float _3140 = fma(_3138, _3128, _3126);
    float _3142 = fma(_2618, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2922);
    bool _3144 = _1239 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3146 = isnan(_1239);
    bool _3148 = _3144 || _3146;
    bool _3150 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3152 = _3148 || _3150;
    out.m_74.x = _2988;
    out.m_74.y = _2992;
    out.m_74.z = _3132;
    out.m_74.w = _3122;
    float _3154 = _2352 + (-0.5);
    float _3156 = -_763;
    float _3158 = _3156 + 1.0;
    float _3160 = -_1563;
    float _3162 = fma(_2334, _3160, _3116);
    out.m_76.x = _3142;
    out.m_76.y = _2940;
    out.m_76.z = _3028;
    float _3164 = -_3110;
    float _3166 = fma(_3164, _3154, _3136);
    float _3168 = -_3158;
    float _3170 = fma(_2412, _3168, _3130);
    float _3172 = fma(_2238, _1579, _3140);
    float _3174 = fma(_2352, _1567, _3166);
    float _3176 = _3110;
    float _3178 = _2970;
    float _3180 = _3174;
    float _3182 = _3162;
    if (!_3152)
    {
        _1533 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3184 = _1533;
    out.m_78.x = _3162;
    out.m_78.y = _3174;
    out.m_78.z = _3170;
    out.m_78.w = _3172;
    float _3186 = _3184;
    float _3188 = _3184;
    if (!_3152)
    {
        _3176 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3190 = _3176;
    float _3192 = _3190;
    float _3194 = _3190;
    if (!_3152)
    {
        _3178 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3196 = _3178;
    float _3198 = _3196;
    float _3200 = _3196;
    if (!_3152)
    {
        _1644 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3202 = _1644;
    float _3204 = _3202;
    float _3206 = _3202;
    if (!_3152)
    {
        _3180 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3208 = _3180;
    float _3210 = _3208;
    float _3212 = _3208;
    if (!_3152)
    {
        _3182 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3214 = _3182;
    bool _3216 = !_3152;
    float _3218 = _3214;
    float _3220 = _3214;
    if (!_3216)
    {
        bool _3222 = _1239 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3224 = isnan(_1239);
        bool _3226 = _3222 || _3224;
        bool _3228 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3230 = _3226 || _3228;
        if (!_3230)
        {
            float _3232 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3234 = _1239 + _3232;
            float _3236 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3238 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3236;
            float _3240 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3242 = _3240 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3244 = 1.0 / _3238;
            float _3246 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3248 = _3246 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3250 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3252 = _3250 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3254 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3256 = _3254 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3258 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3260 = _3258 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3262 = _3234 * _3244;
            float _3264 = precise::clamp(_3262, 0.0, 1.0);
            float _3266 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3268 = _3266 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3270 = fma(_3264, _3242, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3272 = fma(_3264, _3268, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3274 = fma(_3264, _3248, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3276 = fma(_3264, _3252, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3278 = fma(_3264, _3256, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3280 = fma(_3264, _3260, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3220 = _3274;
            _3200 = _3278;
            _3212 = _3270;
            _3194 = _3276;
            _3188 = _3272;
            _3206 = _3280;
            _3282 = true;
        }
        else
        {
            bool _3284 = _1239 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3286 = isnan(_1239);
            bool _3288 = _3284 || _3286;
            bool _3290 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3292 = _3288 || _3290;
            if (!_3292)
            {
                _3210 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3294 = _3210;
            _3212 = _3294;
            if (!_3292)
            {
                _3218 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3296 = _3218;
            _3220 = _3296;
            if (!_3292)
            {
                _3186 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3298 = _3186;
            _3188 = _3298;
            if (!_3292)
            {
                _3192 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3300 = _3192;
            _3194 = _3300;
            if (!_3292)
            {
                _3198 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3302 = _3198;
            _3200 = _3302;
            if (!_3292)
            {
                _3204 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3304 = _3204;
            bool _3306 = !_3292;
            _3206 = _3304;
            if (!_3306)
            {
                bool _3308 = _1239 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3310 = isnan(_1239);
                bool _3312 = _3308 || _3310;
                bool _3314 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3316 = _3312 || _3314;
                if (!_3316)
                {
                    float _3318 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3320 = _1239 + _3318;
                    float _3322 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3324 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3322;
                    float _3326 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3328 = _3326 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3330 = 1.0 / _3324;
                    float _3332 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3334 = _3332 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3336 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3338 = _3336 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3340 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3342 = _3340 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3344 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3346 = _3344 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3348 = _3320 * _3330;
                    float _3350 = precise::clamp(_3348, 0.0, 1.0);
                    float _3352 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3354 = _3352 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3356 = fma(_3350, _3328, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3358 = fma(_3350, _3354, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3360 = fma(_3350, _3334, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3362 = fma(_3350, _3338, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3364 = fma(_3350, _3342, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3366 = fma(_3350, _3346, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3220 = _3360;
                    _3200 = _3364;
                    _3212 = _3356;
                    _3194 = _3362;
                    _3188 = _3358;
                    _3206 = _3366;
                    _3282 = true;
                }
                else
                {
                    _3220 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3200 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3212 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3194 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3188 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3206 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3282 = false;
    float _3368 = _3220;
    float _3370 = _3200;
    float _3372 = _3212;
    float _3374 = _3194;
    float _3376 = _3188;
    float _3378 = _3206;
    float _3380 = fma(_2940, -0.5, 0.5);
    float _3382 = precise::clamp(_3380, 0.0, 1.0);
    float _3384 = -_3368;
    float _3386 = _3384 + _3370;
    float _3388 = -_3372;
    float _3390 = _3388 + _3374;
    float _3392 = -_3376;
    float _3394 = _3392 + _3378;
    bool _3396 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3398 = fma(_3382, _3386, _3368);
    float _3400 = fma(_3382, _3390, _3372);
    float _3402 = fma(_3382, _3394, _3376);
    float _3404 = _3398 * 0.586610972881317138671875;
    out.m_45.x = 1.0;
    float _3406 = fma(_3400, 0.298911988735198974609375, _3404);
    out.m_80.w = (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3408 = fma(_3402, 0.114477999508380889892578125, _3406);
    out.m_82.x = 0.0;
    float _3410 = -_3408;
    float _3412 = _3400 + _3410;
    float _3414 = -_3408;
    float _3416 = _3398 + _3414;
    float _3418 = -_3408;
    float _3420 = _3402 + _3418;
    float _3422 = fma(_3412, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3408);
    float _3424 = fma(_3416, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3408);
    float _3426 = fma(_3420, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3408);
    out.m_84.x = _3422;
    out.m_84.y = _3424;
    out.m_84.z = _3426;
    if (!_3396)
    {
        return out;
    }
    float _3428 = -_1207;
    float _3430 = _3428 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3432 = -_1211;
    float _3434 = _3432 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3436 = -_1215;
    float _3438 = _3436 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3440 = _3430 * _3430;
    float _3442 = fma(_3434, _3434, _3440);
    float _3444 = fma(_3438, _3438, _3442);
    float _3446 = sqrt(_3444);
    float _3448 = rsqrt(_3444);
    float _3450 = -_3446;
    float _3452 = _3450 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3454 = _3452 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3456 = precise::clamp(_3454, 0.0, 1.0);
    float _3458 = _3434 * _3448;
    float _3460 = _3430 * _3448;
    float _3462 = abs(_3456);
    float _3464 = log2(_3462);
    float _3466 = _3438 * _3448;
    float _3468 = _3458 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3470 = _2940 * _3460;
    float _3472 = -_3460;
    float _3474 = -_3468;
    float _3476 = fma(_3472, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3474);
    float _3478 = fma(_3142, _3458, _3470);
    float _3480 = -_3466;
    float _3482 = fma(_3480, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3476);
    float _3484 = fma(_3028, _3466, _3478);
    float _3486 = precise::clamp(_3484, 0.0, 1.0);
    float _3488 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3490 = _3482 + _3488;
    float _3492 = _3464 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3494 = _3490 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3496 = precise::clamp(_3494, 0.0, 1.0);
    float _3498 = exp2(_3492);
    float _3500 = _3498 * _3496;
    float _3502 = _3486 * _3500;
    float _3504 = _3502 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3506 = _3502 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3508 = _3502 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_82.x = _3504;
    out.m_82.y = _3506;
    out.m_82.z = _3508;
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
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3282 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _98 = in.m_42.w;
    float _100 = trunc(_98);
    int _103 = int(_100);
    bool _107 = _103 >= 1;
    float _109 = 0.0;
    float _111 = as_type<float>(_103);
    float _113 = 0.0;
    if (!_107)
    {
        _109 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _115 = _109;
    if (!_107)
    {
        out.m_45.x = 0.0;
    }
    int _117 = 0;
    if (!_107)
    {
        float _119 = _115 * 5.0;
        _117 = as_type<int>(_119);
    }
    int _121 = _117;
    if (!_107)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3565 = as_type<float>(_121);
        out.gl_Position.z = _3565;
    }
    if (!_107)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _123 = in.m_47.w;
    float _125 = float(_103);
    float _127 = -_123;
    float _129 = _127 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _131 = _123 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _133 = isnan(_123);
    bool _135 = _131 || _133;
    bool _137 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _139 = _135 || _137;
    bool _141 = _129 >= _125;
    bool _143 = !_139;
    bool _145 = _141 || _143;
    float _147 = 1.0 / _125;
    float _149 = _129;
    if (_145)
    {
        _111 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _151 = _111;
    if (_145)
    {
        out.m_45.x = 0.0;
    }
    float _153 = _129 * _147;
    int _155 = 0;
    float _157 = _153;
    if (_145)
    {
        float _159 = _151 * 5.0;
        _155 = as_type<int>(_159);
    }
    int _161 = _155;
    out.m_49.x = _153;
    if (_145)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3637 = as_type<float>(_161);
        out.gl_Position.z = _3637;
    }
    if (_145)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _163 = as_type<float>(int(gl_VertexIndex));
    float _165 = in.m_54.w;
    bool _167 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _169 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _171 = _167 || _169;
    bool _173 = isnan(1.0);
    bool _175 = _171 || _173;
    float _177 = in.m_47.x;
    float _179 = in.m_47.y;
    float _181 = in.m_47.z;
    float _183 = in.m_42.x;
    float _185 = in.m_42.y;
    float _187 = in.m_42.z;
    int _189 = as_type<int>(_163) & 1;
    bool _191 = _189 != 0;
    int _193 = as_type<int>(_163) & 2;
    bool _195 = _193 != 0;
    float _197 = _129 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _199 = _197;
    if (!_175)
    {
        float _201 = _197 * _197;
        float _203 = _201 * 0.5;
        _113 = _203;
    }
    float _205 = _113;
    bool _207 = !_191;
    float _209 = _207 ? (-0.5) : 0.5;
    bool _211 = !_195;
    float _213 = _211 ? (-0.5) : 0.5;
    float _215 = _205;
    if (!_175)
    {
        float _217 = _205 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _215 = _217;
    }
    float _219 = _215;
    bool _221 = !_175;
    float _223 = _219;
    if (!_221)
    {
        float _225 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _227 = log2(_225);
        float _229 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _231 = _229 + 1.0;
        float _233 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _235 = _197 * _227;
        float _237 = 1.0 / _231;
        float _239 = _233 * 0.693147182464599609375;
        float _241 = exp2(_235);
        float _243 = 1.0 / _239;
        float _245 = _241 + (-1.0);
        float _247 = -_245;
        float _249 = fma(_247, _243, _197);
        float _251 = _249 * _237;
        float _253 = _251 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _223 = _253;
    }
    float _255 = _223;
    bool _257 = !_175;
    if (!_257)
    {
        float _259 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _261 = log2(_259);
        float _263 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _265 = _263 + 1.0;
        float _267 = 1.0 / _265;
        float _269 = _197 * _261;
        float _271 = exp2(_269);
        float _273 = -_271;
        float _275 = _273 + 1.0;
        float _277 = _275 * _267;
        _199 = _277;
    }
    float _279 = _199;
    bool _281 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _283 = _255 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _285 = _255 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _287 = _255 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _289 = fma(_279, _177, _283);
    float _291 = fma(_279, _179, _285);
    float _293 = fma(_279, _181, _287);
    float _295 = fma(_289, _165, _183);
    float _297 = fma(_291, _165, _185);
    float _299 = fma(_293, _165, _187);
    bool _301 = !_281;
    if (!_301)
    {
        float _303 = in.m_56.x;
        float _305 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _307 = _303 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _309 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[12].x, _129);
        float _311 = _309 * _305;
        float _313 = floor(_311);
        float _315 = -_313;
        float _317 = _311 + _315;
        _157 = _317;
    }
    float _319 = _157;
    float _321 = in.m_56.x;
    float _323 = in.m_56.y;
    float _325 = in.m_56.z;
    float _327 = _297 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _331 = _319 + _329;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _335 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _333;
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _339 = _337 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    int _341 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _343 = _341 != 0;
    float _345 = _297 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _347 = 1.0 / _335;
    float _349 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _351 = fma(_295, (*spvDescriptorSet0.vp_c10)._m0[4].x, _327);
    float _353 = fma(_295, (*spvDescriptorSet0.vp_c10)._m0[6].x, _345);
    float _355 = _297 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _359 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _357;
    float _361 = fma(_299, (*spvDescriptorSet0.vp_c10)._m0[4].z, _351);
    float _363 = 1.0 / _339;
    float _365 = fma(_299, (*spvDescriptorSet0.vp_c10)._m0[6].z, _353);
    float _367 = fma(_295, (*spvDescriptorSet0.vp_c10)._m0[5].x, _355);
    float _369 = _361 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _371 = _321 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _373 = _321 * 2.0;
    float _375 = 1.0 / _359;
    float _377 = _323 * 2.0;
    float _379 = -_349;
    float _381 = fma(_371, 2.0, _379);
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _385 = _319 + _383;
    float _387 = _325 + _321;
    float _389 = fma(_299, (*spvDescriptorSet0.vp_c10)._m0[5].z, _367);
    float _391 = _385 * _347;
    float _393 = floor(_373);
    float _395 = _325 * 2.0;
    float _397 = _321 + _323;
    float _399 = _331 * _363;
    float _401 = _387 + (-1.0);
    float _403 = _397 + (-1.0);
    float _405 = _325 + _323;
    float _407 = floor(_395);
    float _409 = fma(_403, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _411 = _405 + (-1.0);
    int _413 = as_type<int>(_405);
    if (_343)
    {
        _413 = 0;
    }
    int _415 = _413;
    float _417 = fma(_401, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _419 = _415;
    if (!_343)
    {
        _419 = 1;
    }
    int _421 = _419;
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _425 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _423;
    float _427 = floor(_377);
    bool _429 = _393 > 0.0;
    float _431 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _433 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _431;
    bool _435 = _421 != 1;
    float _437 = fma(_425, _391, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _439 = fma(_433, _391, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _441 = _393 >= 0.0;
    bool _443 = isnan(_393);
    bool _445 = _441 || _443;
    bool _447 = isnan(0.0);
    bool _449 = _445 || _447;
    float _451 = _323 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _453 = _407 > 0.0;
    float _455 = fma(_411, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _457 = _449 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _459 = _389 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _461 = _407 >= 0.0;
    bool _463 = isnan(_407);
    bool _465 = _461 || _463;
    bool _467 = isnan(0.0);
    bool _469 = _465 || _467;
    float _471 = _365 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _473 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _475 = _459 + _473;
    int _477 = ~as_type<int>(_457);
    int _479 = _477 + 1;
    int _481 = _479 + 1;
    float _483 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _485 = _369 + _483;
    float _487 = _469 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _489 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _491 = _481;
    float _493 = _457;
    float _495 = _487;
    float _497 = _459;
    if (!_429)
    {
        int _499 = ~as_type<int>(_457);
        int _501 = _499 + 1;
        _491 = _501;
    }
    int _503 = _491;
    float _505 = _475 * _475;
    if (!_435)
    {
        _493 = _323;
    }
    float _507 = _493;
    float _509 = _147 * _129;
    bool _511 = _427 > 0.0;
    float _513 = -_129;
    float _515 = fma(_513, (*spvDescriptorSet0.vp_c9)._m0[76].x, _381);
    bool _517 = _427 >= 0.0;
    bool _519 = isnan(_427);
    bool _521 = _517 || _519;
    bool _523 = isnan(0.0);
    bool _525 = _521 || _523;
    float _527 = _507;
    if (_435)
    {
        _527 = _321;
    }
    float _529 = _527;
    float _531 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _533 = int(_531);
    int _535 = ~as_type<int>(_487);
    int _537 = _535 + 1;
    int _539 = _537 + 1;
    float _541 = fma(_529, (*spvDescriptorSet0.vp_c9)._m0[83].z, _489);
    int _543 = _539;
    float _545 = _529;
    if (!_453)
    {
        int _547 = ~as_type<int>(_487);
        int _549 = _547 + 1;
        _543 = _549;
    }
    int _551 = _543;
    int _553 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _555 = _553 != 0;
    int _557 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _559 = _557 != 0;
    int _561 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _563 = _561 != 0;
    float _565 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    if (!_435)
    {
        _495 = _325;
    }
    float _567 = _495;
    float _569 = _567;
    if (_435)
    {
        _569 = _323;
    }
    float _571 = _569;
    if (!_435)
    {
        _545 = _323;
    }
    float _573 = _545;
    float _575 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _577 = _573;
    if (_435)
    {
        _577 = _321;
    }
    float _579 = _577;
    float _581 = fma(_571, (*spvDescriptorSet0.vp_c9)._m0[83].w, _565);
    bool _583 = !_559;
    int _585 = _583 ? 0 : 1;
    float _587 = fma(_451, -2.0, _575);
    bool _589 = !_555;
    int _591 = _589 ? 0 : 1;
    float _593 = _579 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _595 = !_563;
    int _597 = _595 ? 0 : 1;
    float _599 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _601 = log2(_599);
    int _603 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _605 = _603 != 0;
    int _607 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _609 = _607 != 0;
    int _611 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _613 = _611 != 0;
    float _615 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _617 = _319 + _615;
    int _619 = _525 ? 0 : 1;
    float _621 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[76].y, _587);
    float _623 = _617 * _375;
    bool _625 = !_605;
    int _627 = _625 ? 0 : 1;
    int _629 = ~_619;
    int _631 = _629 + 1;
    int _633 = _631 + 1;
    float _635 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _637 = _633;
    float _639 = _593;
    if (!_511)
    {
        int _641 = ~_619;
        int _643 = _641 + 1;
        _637 = _643;
    }
    int _645 = _637;
    float _647 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _649 = int(_647);
    bool _651 = !_613;
    int _653 = _651 ? 0 : 1;
    float _655 = -_635;
    float _657 = fma(_593, 2.0, _655);
    int _659 = abs(_627);
    bool _661 = !_609;
    int _663 = _661 ? 0 : 1;
    float _665 = -_129;
    float _667 = fma(_665, (*spvDescriptorSet0.vp_c9)._m0[81].x, _657);
    if (!_435)
    {
        _639 = _325;
    }
    float _669 = _639;
    int _671 = abs(_653);
    float _673 = float(_659);
    float _675 = float(_551);
    float _677 = _669;
    if (_435)
    {
        _677 = _323;
    }
    float _679 = _677;
    float _681 = _673 * _675;
    int _683 = abs(_663);
    float _685 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _687 = float(_645);
    float _689 = _679 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _691 = float(_671);
    float _693 = _601 * _129;
    float _695 = float(_503);
    float _697 = fma(_689, -2.0, _685);
    float _699 = float(_683);
    float _701 = _691 * _687;
    float _703 = float(_649);
    float _705 = exp2(_693);
    float _707 = float(_533);
    float _709 = _699 * _695;
    float _711 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _713 = _471 + _711;
    float _715 = fma(_485, _485, _505);
    float _717 = 1.0 / _703;
    float _719 = fma(_713, _713, _715);
    float _721 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _723 = 1.0 + _721;
    float _725 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _727 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _729 = isnan(0.0);
    bool _731 = _727 || _729;
    bool _733 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _735 = _731 || _733;
    float _737 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[82].w, _581);
    bool _739 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _741 = isnan(1.0);
    bool _743 = _739 || _741;
    bool _745 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _747 = _743 || _745;
    float _749 = 1.0 / _707;
    float _751 = -_705;
    float _753 = _751 + 1.0;
    float _755 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _757 = fma(_321, (*spvDescriptorSet0.vp_c9)._m0[78].z, _725);
    float _759 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[81].y, _697);
    float _761 = _735 ? _753 : 0.0;
    float _763 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[82].z, _541);
    float _765 = rsqrt(_719);
    float _767 = in.m_58.x;
    float _769 = in.m_58.y;
    float _771 = in.m_58.z;
    float _773 = _681 * (-2.0);
    float _775 = fma(_323, (*spvDescriptorSet0.vp_c9)._m0[78].w, _755);
    float _777 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].z, _757);
    float _779 = _717 * _129;
    float _781 = fma(_409, _773, _409);
    float _783 = 1.0 / _723;
    float _785 = _749 * _129;
    float _787 = _475 * _765;
    float _789 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].w, _775);
    float _791 = -_787;
    float _793 = fma(_791, (*spvDescriptorSet0.vp_c9)._m0[18].w, _475);
    if (_747)
    {
        float _795 = _761 * _783;
        _149 = _795;
    }
    float _797 = _149;
    float _799 = fma(_773, _767, _767);
    float _801 = _709 * (-2.0);
    float _803 = _485 * _765;
    float _805 = _321 + (-0.5);
    float _807 = _793 * _793;
    float _809 = fma(_455, _801, _455);
    float _811 = fma(_801, _769, _769);
    float _813 = -_803;
    float _815 = fma(_813, (*spvDescriptorSet0.vp_c9)._m0[18].w, _485);
    float _817 = _713 * _765;
    bool _819 = _319 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _821 = isnan(_319);
    bool _823 = _819 || _821;
    bool _825 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _827 = _823 || _825;
    float _829 = float(_827);
    float _831 = fma(_805, (*spvDescriptorSet0.vp_c9)._m0[196].x, _799);
    float _833 = _323 + (-0.5);
    bool _835 = _319 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _837 = isnan(_319);
    bool _839 = _835 || _837;
    bool _841 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _843 = _839 || _841;
    float _845 = float(_843);
    float _847 = fma(_815, _815, _807);
    float _849 = -_817;
    float _851 = fma(_849, (*spvDescriptorSet0.vp_c9)._m0[18].w, _713);
    float _853 = -_829;
    float _855 = _853 + 1.0;
    float _857 = fma(_833, (*spvDescriptorSet0.vp_c9)._m0[196].y, _811);
    bool _859 = _319 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _861 = isnan(_319);
    bool _863 = _859 || _861;
    bool _865 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _867 = _863 || _865;
    float _869 = float(_867);
    float _871 = -_845;
    float _873 = _871 + 1.0;
    float _875 = fma(_851, _851, _847);
    float _877 = _845 * _855;
    bool _879 = _319 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _881 = isnan(_319);
    bool _883 = _879 || _881;
    bool _885 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _887 = _883 || _885;
    float _889 = float(_887);
    float _891 = _869 * _873;
    float _893 = -_869;
    float _895 = _893 + 1.0;
    float _897 = fma(_781, _797, _831);
    float _899 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _901 = _899 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _903 = -_889;
    float _905 = _903 + 1.0;
    float _907 = _889 * _895;
    float _909 = _897 * 0.15915493667125701904296875;
    float _911 = fma(_809, _797, _857);
    float _913 = in.m_54.x;
    float _915 = in.m_54.y;
    float _917 = _439 * _907;
    float _919 = fma(_901, _399, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _921 = _701 * (-2.0);
    float _923 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _925 = _923 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _927 = fma(_905, (*spvDescriptorSet0.vp_c9)._m0[143].y, _917);
    float _929 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _931 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _929;
    float _933 = _437 * _907;
    float _935 = fma(_925, _399, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _937 = fma(_919, _891, _927);
    float _939 = fma(_921, _771, _771);
    float _941 = _325 + (-0.5);
    float _943 = fma(_417, _921, _417);
    float _945 = sqrt(_875);
    float _947 = fma(_941, (*spvDescriptorSet0.vp_c9)._m0[196].z, _939);
    float _949 = fma(_931, _623, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _951 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _953 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _951;
    float _955 = fma(_905, (*spvDescriptorSet0.vp_c9)._m0[143].x, _933);
    float _957 = fma(_943, _797, _947);
    float _959 = fma(_949, _877, _937);
    float _961 = _911 * 0.15915493667125701904296875;
    float _963 = fma(_953, _623, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _965 = _957 * 0.15915493667125701904296875;
    float _967 = fma(_935, _891, _955);
    float _969 = fma(_829, (*spvDescriptorSet0.vp_c9)._m0[146].y, _959);
    float _971 = _909 * 6.283185482025146484375;
    float _973 = cos(_971);
    float _975 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _213);
    float _977 = fma(_963, _877, _967);
    float _979 = _969 * _915;
    float _981 = _765 * _945;
    float _983 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _209);
    float _985 = fma(_829, (*spvDescriptorSet0.vp_c9)._m0[146].x, _977);
    float _987 = _979 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _989 = _961 * 6.283185482025146484375;
    float _991 = sin(_989);
    float _993 = _985 * _913;
    float _995 = _987 * _981;
    float _997 = _993 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _999 = _995 * _975;
    float _1001 = _961 * 6.283185482025146484375;
    float _1003 = cos(_1001);
    float _1005 = _997 * _981;
    float _1007 = _1005 * _983;
    float _1009 = _909 * 6.283185482025146484375;
    float _1011 = sin(_1009);
    float _1013 = _973 * _991;
    float _1015 = _965 * 6.283185482025146484375;
    float _1017 = cos(_1015);
    float _1019 = _973 * _1003;
    float _1021 = _965 * 6.283185482025146484375;
    float _1023 = sin(_1021);
    float _1025 = _1011 * _991;
    float _1027 = _1011 * _1003;
    float _1029 = _973 * _1017;
    float _1031 = _1011 * _1017;
    float _1033 = _1003 * _1017;
    float _1035 = _991 * _1017;
    float _1037 = _1029 * _999;
    float _1039 = _981 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1041 = _1039 * 0.5;
    float _1043 = fma(_1023, _1019, _1025);
    float _1045 = -_1027;
    float _1047 = fma(_1023, _1013, _1045);
    float _1049 = -_999;
    float _1051 = _1023 * _1049;
    float _1053 = -_1013;
    float _1055 = fma(_1023, _1027, _1053);
    float _1057 = fma(_1043, _1007, _1037);
    float _1059 = _1031 * _999;
    float _1061 = fma(_1033, _1007, _1051);
    float _1063 = fma(_1023, _1025, _1019);
    float _1065 = fma(_1047, _1041, _1057);
    float _1067 = fma(_1055, _1007, _1059);
    float _1069 = fma(_1035, _1041, _1061);
    float _1071 = _1065 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1073 = fma(_1063, _1041, _1067);
    float _1075 = _1065 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1077 = _1065 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1079 = fma(_1069, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1071);
    float _1081 = fma(_1069, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1075);
    float _1083 = fma(_1069, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1077);
    float _1085 = fma(_1073, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1079);
    float _1087 = fma(_1073, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1081);
    float _1089 = fma(_1073, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1083);
    float _1091 = _471 + _1085;
    float _1093 = _369 + _1087;
    float _1095 = _459 + _1089;
    float _1097 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1099 = _1091 + _1097;
    float _1101 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1103 = _1093 + _1101;
    float _1105 = _1099 * _1099;
    float _1107 = fma(_1103, _1103, _1105);
    float _1109 = sqrt(_1107);
    bool _1111 = _1109 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1113 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1115 = _1113 != 0;
    int _1117 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1119 = _1117 != 0;
    int _1121 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1123 = _1121 != 0;
    int _1125 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1127 = _1125 != 0;
    bool _1129 = !_1119;
    int _1131 = _1129 ? 0 : 1;
    bool _1133 = !_1115;
    int _1135 = _1133 ? 0 : 1;
    bool _1137 = !_1123;
    int _1139 = _1137 ? 0 : 1;
    bool _1141 = !_1127;
    int _1143 = _1141 ? 0 : 1;
    float _1145 = _1089;
    float _1147 = _1083;
    if (!_1111)
    {
        _1145 = _1093;
    }
    float _1149 = _1145;
    float _1151 = _1149;
    if (!_1111)
    {
        _497 = _1091;
    }
    float _1153 = _497;
    float _1155 = _1153;
    if (!_1111)
    {
        _1147 = _1095;
    }
    float _1157 = _1147;
    bool _1159 = !_1111;
    float _1161 = _1157;
    if (!_1159)
    {
        float _1163 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1165 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1167 = _1109 + _1165;
        float _1169 = _1095 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1171 = rsqrt(_1107);
        float _1173 = _1167 * _1163;
        float _1175 = _1173 * 0.15915493667125701904296875;
        float _1177 = _1175 * 6.283185482025146484375;
        float _1179 = sin(_1177);
        float _1181 = _1175 * 6.283185482025146484375;
        float _1183 = cos(_1181);
        float _1185 = fma(_1179, _1169, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1187 = _1171 * _1185;
        float _1189 = _1183 + (-1.0);
        float _1191 = fma(_1103, _1187, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1193 = fma(_1099, _1187, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1195 = _1189 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1197 = fma(_1095, _1183, _1195);
        _1161 = _1197;
        _1151 = _1191;
        _1155 = _1193;
    }
    float _1199 = _1161;
    float _1201 = _1151;
    float _1203 = _1155;
    float _1205 = -_787;
    float _1207 = fma(_1205, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1199);
    float _1209 = -_803;
    float _1211 = fma(_1209, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1201);
    float _1213 = -_817;
    float _1215 = fma(_1213, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1203);
    float _1217 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1219 = _1207 + _1217;
    float _1221 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1223 = _1211 + _1221;
    float _1225 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1227 = _1215 + _1225;
    float _1229 = _1207 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1231 = _1219 * _1219;
    float _1233 = fma(_1223, _1223, _1231);
    float _1235 = fma(_1227, _1227, _1233);
    float _1237 = rsqrt(_1235);
    float _1239 = sqrt(_1235);
    float _1241 = _1237 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1243 = _1223 * _1241;
    float _1245 = _1227 * _1241;
    float _1247 = _1243 * _1243;
    float _1249 = _1245 * _1245;
    float _1251 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1253 = _1247 + _1249;
    float _1255 = precise::max(0.0, _1251);
    float _1257 = sqrt(_1253);
    float _1259 = -_1241;
    float _1261 = -_1255;
    float _1263 = fma(_1219, _1259, _1261);
    bool _1265 = _1257 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1267 = _1219;
    float _1269 = _1251;
    float _1271 = _1255;
    float _1273 = _1247;
    float _1275 = _1249;
    if (!_1265)
    {
        _1267 = _1243;
    }
    float _1277 = _1267;
    float _1279 = _1277;
    if (!_1265)
    {
        _1269 = _1263;
    }
    float _1281 = _1269;
    float _1283 = _1281;
    if (!_1265)
    {
        _1271 = _1245;
    }
    float _1285 = _1271;
    bool _1287 = !_1265;
    float _1289 = _1285;
    if (!_1287)
    {
        float _1291 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1293 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1295 = _1257 + _1293;
        float _1297 = _1263 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1299 = rsqrt(_1253);
        float _1301 = _1295 * _1291;
        float _1303 = _1301 * 0.15915493667125701904296875;
        float _1305 = _1303 * 6.283185482025146484375;
        float _1307 = sin(_1305);
        float _1309 = _1303 * 6.283185482025146484375;
        float _1311 = cos(_1309);
        float _1313 = fma(_1307, _1297, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1315 = _1299 * _1313;
        float _1317 = _1311 + (-1.0);
        float _1319 = _1243 * _1315;
        float _1321 = _1317 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1323 = _1245 * _1315;
        float _1325 = fma(_1263, _1311, _1321);
        float _1327 = _1319 * _1319;
        float _1329 = _1323 * _1323;
        _1283 = _1325;
        _1273 = _1327;
        _1275 = _1329;
        _1279 = _1319;
        _1289 = _1323;
    }
    float _1331 = _1283;
    float _1333 = _1273;
    float _1335 = _1275;
    float _1337 = _1279;
    float _1339 = _1289;
    float _1341 = fma(_1331, _1331, _1333);
    float _1343 = fma(_1211, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1229);
    float _1345 = _1341 + _1335;
    float _1347 = fma(_1215, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1343);
    float _1349 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1351 = fma(_1239, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1349);
    float _1353 = precise::clamp(_1351, 0.0, 1.0);
    float _1355 = rsqrt(_1345);
    float _1357 = _1347 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1359 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1361 = -_1353;
    float _1363 = _1361 + 1.0;
    float _1365 = _1357 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1367 = _1207 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1369 = _1207 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1371 = -_1365;
    float _1373 = fma(_1359, _1371, 1.0);
    float _1375 = _1207 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1377 = abs(_1363);
    float _1379 = log2(_1377);
    float _1381 = fma(_1211, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1367);
    float _1383 = fma(_1211, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1369);
    float _1385 = fma(_1211, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1375);
    float _1387 = _1355 * _1337;
    float _1389 = _1355 * _1331;
    float _1391 = fma(_1215, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1385);
    float _1393 = _1355 * _1339;
    float _1395 = _1387 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1397 = fma(_1215, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1381);
    float _1399 = _1391 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1401 = log2(_1373);
    float _1403 = -_1395;
    float _1405 = fma(_1389, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1403);
    float _1407 = _1397 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1409 = _1399 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1411 = _1379 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1413 = -_1393;
    float _1415 = fma(_1413, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1405);
    float _1417 = fma(_1215, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1383);
    float _1419 = fma(_1407, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1409);
    float _1421 = exp2(_1411);
    float _1423 = fma(_1415, -0.5, 0.5);
    float _1425 = _1417 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1427 = fma(_1357, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1419);
    float _1429 = _1399 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1431 = fma(_1415, 0.5, 0.5);
    float _1433 = fma(_1425, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1427);
    float _1435 = sqrt(_1423);
    float _1437 = _1399 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1439 = fma(_1407, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1429);
    float _1441 = _1389 + 1.0;
    float _1443 = fma(_1431, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1445 = fma(_1407, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1437);
    float _1447 = fma(_1357, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1439);
    float _1449 = 1.0 / _1433;
    float _1451 = fma(_1357, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1445);
    float _1453 = -_1389;
    float _1455 = fma(_1421, _1441, _1453);
    float _1457 = fma(_1431, _1443, -0.212114393711090087890625);
    float _1459 = fma(_1425, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1447);
    float _1461 = fma(_1425, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1451);
    float _1463 = _1401 * 0.693147182464599609375;
    float _1465 = fma(_1431, _1457, 1.570728778839111328125);
    float _1467 = _1435 * 0.636619746685028076171875;
    float _1469 = fma(_1455, 0.5, 0.5);
    float _1471 = _1463 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1473 = -_1465;
    float _1475 = fma(_1467, _1473, 1.0);
    float _1477 = _1459 * _1449;
    float _1479 = _1461 * _1449;
    float _1481 = fma(_1477, 0.5, 0.5);
    float _1483 = fma(_1479, -0.5, 0.5);
    float3 _5725 = float3(_1481, _1483, _1471);
    float _1485 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5725, float3(0.0), isnan(_5725)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5725, float3(0.0), isnan(_5725)), level(0.0)).x;
    float2 _5736 = float2(_1475, _1469);
    float3 _1489 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5736, float2(0.0), isnan(_5736)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5736, float2(0.0), isnan(_5736)), level(0.0)).xyz;
    float _1491 = _1489.x;
    float _1493 = _1489.y;
    float _1495 = _1489.z;
    float _1497 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1499 = int(_1497);
    int _1501 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1503 = _1501 != 0;
    float _1505 = _213 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _1507 = abs(_591);
    float _1509 = _1399 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1511 = abs(_597);
    float _1513 = -_1505;
    float _1515 = _1023 * _1513;
    int _1517 = abs(_1131);
    float _1519 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1521 = int(_1519);
    int _1523 = abs(_1135);
    float _1525 = _1029 * _1505;
    float _1527 = fma(_1407, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1509);
    float _1529 = _1379 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1531 = 0.0;
    float _1533 = _1433;
    if (_1503)
    {
        float _1535 = in.m_56.x;
        _1531 = _1535;
    }
    float _1537 = _1531;
    float _1539 = 0.0;
    if (_1503)
    {
        _1539 = 1.0;
    }
    float _1541 = _1539;
    float _1543 = trunc(_779);
    int _1545 = int(_1543);
    float _1547 = float(uint(_1499));
    float _1549 = _1537;
    float _1551 = _1541;
    if (!_1503)
    {
        float _1553 = in.m_56.y;
        _1549 = _1553;
    }
    float _1555 = _1549;
    if (!_1503)
    {
        _1551 = 7.345489978790283203125;
    }
    float _1557 = _1551;
    float _1559 = fma(_1357, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1527);
    float _1561 = -_777;
    float _1563 = _1561 + 1.0;
    out.m_60.x = _1211;
    out.m_60.y = _1207;
    out.m_60.z = _1215;
    float _1565 = -_789;
    float _1567 = _1565 + 1.0;
    float _1569 = 1.0 / _1547;
    float _1571 = float(uint(_1521));
    float _1573 = _1557 * _321;
    float _1575 = fma(_1425, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1559);
    float _1577 = -_737;
    float _1579 = _1577 + 1.0;
    out.m_62.w = _1433;
    float _1581 = float(uint(_1545));
    float _1583 = 1.0 / _1571;
    out.gl_Position.x = _1459;
    out.gl_Position.y = _1461;
    out.gl_Position.z = _1575;
    out.gl_Position.w = _1433;
    int _1585 = as_type<int>(_1569) + (-2);
    float _1587 = trunc(_785);
    int _1589 = int(_1587);
    float _1591 = as_type<float>(_1585) * _1581;
    float _1593 = _1459 + _1433;
    int _1595 = as_type<int>(_1583) + (-2);
    float _1597 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    int _1599 = ~_1499;
    int _1601 = _1599 + 1;
    float _1603 = _1593 * 0.5;
    int _1605 = ~_1521;
    int _1607 = _1605 + 1;
    float _1609 = float(uint(_1589));
    float _1611 = trunc(_1591);
    float _1613 = precise::max(_1611, 0.0);
    uint _1616 = uint(_1613);
    out.m_62.x = _1603;
    float _1618 = as_type<float>(_1595) * _1609;
    float _1620 = floor(_1573);
    int _1622 = _1601 * int(_1616);
    int _1624 = _1622 + _1545;
    float _1626 = trunc(_1618);
    float _1628 = precise::max(_1626, 0.0);
    uint _1630 = uint(_1628);
    float _1632 = float(uint(_1624));
    float _1634 = -_1620;
    float _1636 = _1573 + _1634;
    float _1638 = exp2(_1529);
    float _1640 = as_type<float>(_1585) * _1632;
    float _1642 = _1632;
    float _1644 = _1603;
    if (_1503)
    {
        _1642 = 1.0;
    }
    float _1646 = _1642;
    float _1648 = _1646;
    if (!_1503)
    {
        _1648 = 1.2345600128173828125;
    }
    float _1650 = _1648;
    float _1652 = trunc(_1640);
    float _1654 = precise::max(_1652, 0.0);
    uint _1656 = uint(_1654);
    int _1658 = _1607 * int(_1630);
    int _1660 = _1658 + _1589;
    float _1662 = _1555 * _1650;
    int _1664 = ~_1499;
    int _1666 = _1664 + 1;
    float _1668 = float(uint(_1660));
    float _1670 = floor(_1662);
    float _1672 = -_1638;
    float _1674 = _1672 + 1.0;
    float _1676 = as_type<float>(_1595) * _1668;
    float _1678 = float(_1499);
    float _1680 = _1674 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _1682 = int(_1616) + int(_1656);
    float _1684 = trunc(_1676);
    float _1686 = precise::max(_1684, 0.0);
    uint _1688 = uint(_1686);
    float _1690 = _1636 * _1678;
    float _1692 = float(_1545);
    int _1694 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1696 = _1694 != 0;
    float _1698 = trunc(_1690);
    int _1700 = int(_1698);
    int _1702 = _1666 * _1682;
    int _1704 = _1702 + _1545;
    bool _1706 = _1692 >= _1678;
    bool _1708 = isnan(_1692);
    bool _1710 = _1706 || _1708;
    bool _1712 = isnan(_1678);
    bool _1714 = _1710 || _1712;
    float _1716 = float(_1714);
    float _1718 = -_1670;
    float _1720 = _1662 + _1718;
    bool _1722 = !_1696;
    int _1724 = _1722 ? 0 : 1;
    bool _1726 = uint(_1704) >= uint(_1499);
    float _1728 = trunc(_1716);
    int _1730 = int(_1728);
    int _1732 = abs(_1724);
    bool _1734 = !_1726;
    int _1736 = _1734 ? 0 : (-1);
    int _1738 = int(_1630) + int(_1688);
    int _1740 = ~_1682;
    int _1742 = _1740 + _1736;
    int _1744 = _1742 + 1;
    int _1746 = ~_1521;
    int _1748 = _1746 + 1;
    int _1750 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1752 = _1750 != 0;
    int _1754 = _1700 * _1732;
    int _1756 = _1754 + _1545;
    bool _1758 = _1499 == 0;
    int _1760 = _1499 * _1744;
    int _1762 = _1760 + _1545;
    float _1764 = _1678 * _509;
    int _1766 = _1748 * _1738;
    int _1768 = _1766 + _1589;
    int _1770 = ~_1730;
    int _1772 = _1770 + 1;
    int _1774 = _1772 + 1;
    bool _1776 = !_1758;
    int _1778 = _1776 ? _1762 : (-1);
    bool _1780 = uint(_1768) >= uint(_1521);
    float _1782 = trunc(_1764);
    int _1784 = int(_1782);
    float _1786 = float(_1521);
    int _1788 = _1778 * _1774;
    float _1790 = float(_1589);
    int _1792 = _1499 + (-1);
    float _1794 = _1786 * _509;
    int _1796 = abs(_585);
    bool _1798 = _1790 >= _1786;
    bool _1800 = isnan(_1790);
    bool _1802 = _1798 || _1800;
    bool _1804 = isnan(_1786);
    bool _1806 = _1802 || _1804;
    float _1808 = float(_1806);
    int _1810 = _1730 * _1792;
    int _1812 = _1810 + _1788;
    float _1814 = trunc(_1794);
    int _1816 = int(_1814);
    bool _1818 = !_1780;
    int _1820 = _1818 ? 0 : (-1);
    int _1822 = _1812 * _1796;
    bool _1824 = !_1752;
    int _1826 = _1824 ? 0 : 1;
    int _1828 = ~_1738;
    int _1830 = _1828 + _1820;
    int _1832 = _1830 + 1;
    float _1834 = trunc(_1808);
    int _1836 = int(_1834);
    int _1838 = _1784 * _1507;
    int _1840 = _1838 + _1822;
    int _1842 = abs(_1826);
    float _1844 = _1720 * _1786;
    int _1846 = _1521 * _1832;
    int _1848 = _1846 + _1589;
    bool _1850 = _1521 == 0;
    int _1852 = _1756 * _1511;
    int _1854 = _1852 + _1840;
    int _1856 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1858 = _1856 != 0;
    bool _1860 = !_1850;
    int _1862 = _1860 ? _1848 : (-1);
    int _1864 = _1700 * _1842;
    int _1866 = _1864 + _1854;
    float _1868 = trunc(_1844);
    int _1870 = int(_1868);
    int _1872 = _1521 + (-1);
    bool _1874 = !_1858;
    int _1876 = _1874 ? 0 : 1;
    int _1878 = ~_1836;
    int _1880 = _1878 + 1;
    int _1882 = _1880 + 1;
    float _1884 = float(uint(_1866));
    int _1886 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1888 = _1886 != 0;
    int _1890 = _1862 * _1882;
    int _1892 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1894 = _1892 != 0;
    float _1896 = as_type<float>(_1585) * _1884;
    int _1898 = _1836 * _1872;
    int _1900 = _1898 + _1890;
    int _1902 = abs(_1876);
    float _1904 = trunc(_1896);
    float _1906 = precise::max(_1904, 0.0);
    uint _1908 = uint(_1906);
    int _1910 = abs(_1139);
    int _1912 = _1900 * _1517;
    int _1914 = ~_1499;
    int _1916 = _1914 + 1;
    int _1918 = _1870 * _1902;
    int _1920 = _1918 + _1589;
    int _1922 = _1816 * _1523;
    int _1924 = _1922 + _1912;
    int _1926 = abs(_1143);
    float _1928 = as_type<float>(_1910);
    if (_1888)
    {
        float _1930 = in.m_56.x;
        _1928 = _1930;
    }
    float _1932 = _1928;
    int _1934 = ~_1499;
    int _1936 = _1934 + 1;
    int _1938 = _1920 * _1910;
    int _1940 = _1938 + _1924;
    int _1942 = _1870 * _1926;
    int _1944 = _1942 + _1940;
    int _1946 = _1916 * int(_1908);
    int _1948 = _1946 + _1866;
    float _1950 = in.m_56.w;
    int _1952 = ~_1521;
    int _1954 = _1952 + 1;
    float _1956 = float(uint(_1944));
    float _1958 = float(uint(_1948));
    float _1960 = as_type<float>(_1585) * _1958;
    float _1962 = as_type<float>(_1595) * _1956;
    float _1964 = float(uint(_1756));
    float _1966 = trunc(_1960);
    float _1968 = precise::max(_1966, 0.0);
    uint _1970 = uint(_1968);
    float _1972 = as_type<float>(_1585) * _1964;
    float _1974 = trunc(_1962);
    float _1976 = precise::max(_1974, 0.0);
    uint _1978 = uint(_1976);
    int _1980 = int(_1908) + int(_1970);
    float _1982 = trunc(_1972);
    float _1984 = precise::max(_1982, 0.0);
    uint _1986 = uint(_1984);
    int _1988 = _1936 * _1980;
    int _1990 = _1988 + _1866;
    int _1992 = _1954 * int(_1978);
    int _1994 = _1992 + _1944;
    bool _1996 = uint(_1990) >= uint(_1499);
    float _1998 = float(uint(_1920));
    float _2000 = float(uint(_1994));
    bool _2002 = !_1996;
    int _2004 = _2002 ? 0 : (-1);
    float _2006 = as_type<float>(_1595) * _1998;
    int _2008 = ~_1499;
    int _2010 = _2008 + 1;
    float _2012 = as_type<float>(_1595) * _2000;
    float _2014 = _1998;
    float _2016 = as_type<float>(_1980);
    float _2018 = as_type<float>(_1978);
    float _2020 = _1950;
    if (_1894)
    {
        float _2022 = _1950 * 3.1415927410125732421875;
        _2014 = _2022;
    }
    float _2024 = _2014;
    int _2026 = ~_1980;
    int _2028 = _2026 + _2004;
    int _2030 = _2028 + 1;
    float _2032 = trunc(_2012);
    float _2034 = precise::max(_2032, 0.0);
    uint _2036 = uint(_2034);
    int _2038 = _2010 * int(_1986);
    int _2040 = _2038 + _1756;
    if (_1894)
    {
        float _2042 = _2024 * 0.15915493667125701904296875;
        _2016 = _2042;
    }
    float _2044 = _2016;
    int _2046 = _1499 * _2030;
    int _2048 = _2046 + _1866;
    float _2050 = float(uint(_2040));
    float _2052 = trunc(_2006);
    float _2054 = precise::max(_2052, 0.0);
    uint _2056 = uint(_2054);
    bool _2058 = !_1758;
    int _2060 = _2058 ? _2048 : (-1);
    int _2062 = ~_1521;
    int _2064 = _2062 + 1;
    float _2066 = as_type<float>(_1585) * _2050;
    int _2068 = _2060 & 3;
    bool _2070 = _2068 != 0;
    int _2072 = _2060 & 3;
    bool _2074 = _2072 != 0;
    float _2076 = as_type<float>(_1866);
    float _2078 = _2044;
    bool _2080 = _2074;
    if (_1894)
    {
        float _2082 = _2044 * 6.283185482025146484375;
        float _2084 = sin(_2082);
        _2076 = _2084;
    }
    float _2086 = _2076;
    int _2088 = int(_1978) + int(_2036);
    if (_1888)
    {
        float _2090 = _1932 * 3.1415927410125732421875;
        _2018 = _2090;
    }
    float _2092 = _2018;
    int _2094 = ~_1521;
    int _2096 = _2094 + 1;
    bool _2098 = uint(_2068) > 1u;
    int _2100 = _2064 * int(_2056);
    int _2102 = _2100 + _1920;
    if (_1888)
    {
        float _2104 = _2092 * 0.15915493667125701904296875;
        _2078 = _2104;
    }
    float _2106 = _2078;
    float _2108 = trunc(_2066);
    float _2110 = precise::max(_2108, 0.0);
    uint _2112 = uint(_2110);
    float _2114 = float(uint(_2102));
    float _2116 = _1680 * _1485;
    float _2118 = _2106;
    float _2120 = _2114;
    if (_1888)
    {
        float _2122 = _2106 * 6.283185482025146484375;
        float _2124 = sin(_2122);
        _2118 = _2124;
    }
    float _2126 = _2118;
    int _2128 = _2074 ? 0 : 1;
    if (_1894)
    {
        bool _2130 = _2086 > 0.5;
        _2080 = _2130;
    }
    bool _2132 = _2080;
    float _2134 = as_type<float>(_1595) * _2114;
    int _2136 = _2096 * _2088;
    int _2138 = _2136 + _1944;
    int _2140 = ~_2128;
    int _2142 = _2140 + 1;
    int _2144 = _2142 + 1;
    int _2146 = _2144;
    if (!_2098)
    {
        int _2148 = ~_2128;
        int _2150 = _2148 + 1;
        _2146 = _2150;
    }
    int _2152 = _2146;
    float _2154 = trunc(_2134);
    float _2156 = precise::max(_2154, 0.0);
    uint _2158 = uint(_2156);
    bool _2160 = uint(_2138) >= uint(_1521);
    if (!_1894)
    {
        _2120 = _209;
    }
    float _2162 = _2120;
    float _2164 = _2162;
    if (_1894)
    {
        float _2166 = -_209;
        float _2168 = _2132 ? _2166 : _209;
        _2164 = _2168;
    }
    float _2170 = _2164;
    bool _2172 = _2068 != 3;
    bool _2174 = !_2160;
    int _2176 = _2174 ? 0 : (-1);
    float _2178 = _2170 + 0.5;
    bool _2180 = uint(_2068) >= 2u;
    int _2182 = ~_2088;
    int _2184 = _2182 + _2176;
    int _2186 = _2184 + 1;
    int _2188 = int(_1986) + int(_2112);
    int _2190 = ~_1499;
    int _2192 = _2190 + 1;
    int _2194 = _1521 * _2186;
    int _2196 = _2194 + _1944;
    int _2198 = _2180 ? 0 : 1;
    bool _2200 = _1950 > 0.5;
    int _2202 = _2192 * _2188;
    int _2204 = _2202 + _1756;
    int _2206 = ~_2198;
    int _2208 = _2206 + 1;
    int _2210 = _2208 + 1;
    float _2212 = -_213;
    int _2214 = _2200 ? as_type<int>(_2212) : as_type<int>(_213);
    int _2216 = _2210;
    bool _2218 = _2180;
    if (_2172)
    {
        int _2220 = ~_2198;
        int _2222 = _2220 + 1;
        _2216 = _2222;
    }
    int _2224 = _2216;
    int _2226 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2228 = _2226 != 0;
    bool _2230 = !_1850;
    int _2232 = _2230 ? _2196 : (-1);
    bool _2234 = uint(_2204) >= uint(_1499);
    bool _2236 = !_2228;
    float _2238 = _2236 ? _213 : as_type<float>(_2214);
    int _2240 = _2232 & 3;
    bool _2242 = _2240 != 0;
    if (_1888)
    {
        bool _2244 = _2126 > 0.5;
        _2218 = _2244;
    }
    bool _2246 = _2218;
    bool _2248 = !_2234;
    int _2250 = _2248 ? 0 : (-1);
    bool _2252 = uint(_2240) > 1u;
    if (!_1888)
    {
        _2020 = _213;
    }
    float _2254 = _2020;
    float _2256 = _2254;
    if (_1888)
    {
        float _2258 = -_213;
        float _2260 = _2246 ? _2258 : _213;
        _2256 = _2260;
    }
    float _2262 = _2256;
    int _2264 = int(_2056) + int(_2158);
    int _2266 = ~_1521;
    int _2268 = _2266 + 1;
    int _2270 = _2232 & 3;
    bool _2272 = _2270 != 0;
    bool _2274 = _2240 != 3;
    int _2276 = _2268 * _2264;
    int _2278 = _2276 + _1920;
    int _2280 = _2272 ? 0 : 1;
    bool _2282 = uint(_2240) >= 2u;
    int _2284 = ~_2280;
    int _2286 = _2284 + 1;
    int _2288 = _2286 + 1;
    int _2290 = _2282 ? 0 : 1;
    bool _2292 = uint(_2278) >= uint(_1521);
    int _2294 = _2288;
    if (!_2252)
    {
        int _2296 = ~_2280;
        int _2298 = _2296 + 1;
        _2294 = _2298;
    }
    int _2300 = _2294;
    bool _2302 = _321 > 0.5;
    int _2304 = ~_2290;
    int _2306 = _2304 + 1;
    int _2308 = _2306 + 1;
    int _2310 = _2308;
    if (_2274)
    {
        int _2312 = ~_2290;
        int _2314 = _2312 + 1;
        _2310 = _2314;
    }
    int _2316 = _2310;
    int _2318 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2320 = _2318 != 0;
    bool _2322 = !_2292;
    int _2324 = _2322 ? 0 : (-1);
    float _2326 = -_209;
    int _2328 = _2302 ? as_type<int>(_2326) : as_type<int>(_209);
    bool _2330 = _323 > 0.5;
    bool _2332 = !_2320;
    float _2334 = _2332 ? _209 : as_type<float>(_2328);
    bool _2336 = _325 > 0.5;
    int _2338 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2340 = _2338 != 0;
    float _2342 = -_213;
    int _2344 = _2330 ? as_type<int>(_2342) : as_type<int>(_213);
    int _2346 = _2060 >> 31;
    int _2348 = _2232 >> 31;
    bool _2350 = !_2340;
    float _2352 = _2350 ? _213 : as_type<float>(_2344);
    float _2354 = -_209;
    int _2356 = _2336 ? as_type<int>(_2354) : as_type<int>(_209);
    int _2358 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2360 = _2358 != 0;
    int _2362 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2364 = _2362 != 0;
    int _2366 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2368 = _2366 != 0;
    int _2370 = _2346 & 3;
    float _2372 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _2374 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _2376 = _2348 & 3;
    float _2378 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _2380 = _2060 + _2370;
    float _2382 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2384 = _2374 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2386 = _2232 + _2376;
    float _2388 = _2378 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2390 = _2380 >> 2;
    float _2392 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _2394 = _2386 >> 2;
    float _2396 = _2382 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2398 = fma(_1505, _1505, 1.0);
    int _2400 = _2394 << 4;
    int _2402 = _2400 + 512;
    out.m_64.x = _2384;
    out.m_64.y = _2388;
    out.m_64.z = _2396;
    out.m_64.w = _2392;
    float _2404 = rsqrt(_2398);
    int _2406 = _2390 << 4;
    int _2408 = _2406 + 368;
    bool _2410 = !_2368;
    float _2412 = _2410 ? _209 : as_type<float>(_2356);
    int _2414 = ~_2188;
    int _2416 = _2414 + _2250;
    int _2418 = _2416 + 1;
    int _2420 = abs(_2300);
    int _2422 = abs(_2224);
    int _2424 = _1499 * _2418;
    int _2426 = _2424 + _1756;
    float _2428 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2430 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2432 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    uint _2434 = uint(int(uint(_2402) >> uint(2)));
    uint _2436 = uint(int(uint(int(_2434)) >> uint(2)));
    int _2438 = int(_2434) & 3;
    float _2440 = (*spvDescriptorSet0.vp_c9)._m0[int(_2436)][_2438];
    int _2442 = int(_2434) + 1;
    uint _2444 = uint(int(uint(_2442) >> uint(2)));
    int _2446 = _2442 & 3;
    float _2448 = (*spvDescriptorSet0.vp_c9)._m0[int(_2444)][_2446];
    float _2450 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2452 = -_2262;
    float _2454 = _2452 + 0.5;
    float _2456 = _2178 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _2458 = _2432 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2460 = _2428 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2462 = _2454 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _2464 = _209 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    uint _2466 = uint(int(uint(_2408) >> uint(2)));
    uint _2468 = uint(int(uint(int(_2466)) >> uint(2)));
    int _2470 = int(_2466) & 3;
    float _2472 = (*spvDescriptorSet0.vp_c9)._m0[int(_2468)][_2470];
    int _2474 = int(_2466) + 1;
    uint _2476 = uint(int(uint(_2474) >> uint(2)));
    int _2478 = _2474 & 3;
    float _2480 = (*spvDescriptorSet0.vp_c9)._m0[int(_2476)][_2478];
    float _2482 = _2456 * _2372;
    float _2484 = _2462 * _1597;
    float _2486 = fma(_1033, _2464, _1515);
    float _2488 = _1505 * _2404;
    float _2490 = _2430 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2492 = ~_2420;
    int _2494 = _2492 + 1;
    int _2496 = _2494 + 1;
    float _2498 = _1035 + _2486;
    int _2500 = _2408 + 8;
    uint _2502 = uint(int(uint(_2500) >> uint(2)));
    uint _2504 = uint(int(uint(int(_2502)) >> uint(2)));
    int _2506 = int(_2502) & 3;
    float _2508 = (*spvDescriptorSet0.vp_c9)._m0[int(_2504)][_2506];
    int _2510 = int(_2502) + 1;
    uint _2512 = uint(int(uint(_2510) >> uint(2)));
    int _2514 = _2510 & 3;
    float _2516 = (*spvDescriptorSet0.vp_c9)._m0[int(_2512)][_2514];
    float _2518 = -_2488;
    float _2520 = _1035 * _2518;
    out.m_66.x = _2458;
    out.m_66.y = _2460;
    out.m_66.z = _2490;
    out.m_66.w = _2450;
    float _2522 = _1031 * _1505;
    int _2524 = ~_2264;
    int _2526 = _2524 + _2324;
    int _2528 = _2526 + 1;
    float _2530 = -_1023;
    float _2532 = fma(_2530, _2404, _2520);
    out.m_68.x = _2482;
    out.m_68.y = _2484;
    int _2534 = _2402 + 8;
    uint _2536 = uint(int(uint(_2534) >> uint(2)));
    uint _2538 = uint(int(uint(int(_2536)) >> uint(2)));
    int _2540 = int(_2536) & 3;
    float _2542 = (*spvDescriptorSet0.vp_c9)._m0[int(_2538)][_2540];
    int _2544 = int(_2536) + 1;
    uint _2546 = uint(int(uint(_2544) >> uint(2)));
    int _2548 = _2544 & 3;
    float _2550 = (*spvDescriptorSet0.vp_c9)._m0[int(_2546)][_2548];
    int _2552 = _1521 * _2528;
    int _2554 = _2552 + _1920;
    int _2556 = abs(_2316);
    int _2558 = ~_2556;
    int _2560 = _2558 + 1;
    int _2562 = _2560 + 1;
    float _2564 = -_2488;
    float _2566 = _1047 * _2564;
    int _2568 = abs(_2152);
    float _2570 = -_2488;
    float _2572 = _1063 * _2570;
    bool _2574 = !_2242;
    int _2576 = _2574 ? 0 : 1;
    float _2578 = fma(_1029, _2404, _2566);
    bool _2580 = !_2070;
    int _2582 = _2580 ? 0 : 1;
    float _2584 = fma(_1031, _2404, _2572);
    bool _2586 = _2068 != 3;
    float _2588 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2590 = int(_2588);
    int _2592 = ~_2568;
    int _2594 = _2592 + 1;
    int _2596 = _2594 + 1;
    float _2598 = fma(_1043, _2464, _1525);
    int _2600 = abs(_2576);
    float _2602 = fma(_1055, _2464, _2522);
    bool _2604 = _2240 != 3;
    float _2606 = _1047 + _2598;
    int _2608 = ~_2600;
    int _2610 = _2608 + 1;
    int _2612 = _2610 + 1;
    int _2614 = _2496 * as_type<int>(_2448);
    int _2616 = abs(_2582);
    float _2618 = _1063 + _2602;
    bool _2620 = !_2586;
    int _2622 = _2620 ? 0 : (-1);
    int _2624 = _2612 * as_type<int>(_2440);
    int _2626 = _2624 + _2614;
    int _2628 = abs(_2622);
    int _2630 = _2596 * as_type<int>(_2480);
    int _2632 = ~_2616;
    int _2634 = _2632 + 1;
    int _2636 = _2634 + 1;
    float _2638 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2640 = int(_2638);
    int _2642 = ~_2590;
    int _2644 = _2642 + 1;
    int _2646 = _2636 * as_type<int>(_2472);
    int _2648 = _2646 + _2630;
    int _2650 = ~_2422;
    int _2652 = _2650 + 1;
    int _2654 = _2652 + 1;
    int _2656 = ~_2628;
    int _2658 = _2656 + 1;
    int _2660 = _2658 + 1;
    bool _2662 = !_2604;
    int _2664 = _2662 ? 0 : (-1);
    int _2666 = _2654 * as_type<int>(_2508);
    int _2668 = _2666 + _2648;
    float _2670 = float(uint(_2590));
    int _2672 = abs(_2664);
    int _2674 = _2660 * as_type<int>(_2516);
    int _2676 = _2674 + _2668;
    bool _2678 = !_2360;
    int _2680 = _2678 ? 0 : 1;
    int _2682 = _2562 * as_type<int>(_2542);
    int _2684 = _2682 + _2626;
    int _2686 = abs(_2590);
    float _2688 = 1.0 / _2670;
    int _2690 = abs(_2680);
    bool _2692 = !_2364;
    int _2694 = _2692 ? 0 : 1;
    int _2696 = ~_2672;
    int _2698 = _2696 + 1;
    int _2700 = _2698 + 1;
    int _2702 = ~_2690;
    int _2704 = _2702 + 1;
    int _2706 = _2704 + 1;
    int _2708 = abs(_2694);
    int _2710 = _2700 * as_type<int>(_2550);
    int _2712 = _2710 + _2684;
    float _2714 = float(uint(_2686));
    int _2716 = _2676 * _2706;
    float _2718 = float(uint(_2640));
    float _2720 = _1043 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    bool _2722 = !_1758;
    int _2724 = _2722 ? _2426 : (-1);
    float _2726 = 1.0 / _2714;
    int _2728 = abs(_2640);
    int _2730 = _2724 * _2690;
    int _2732 = _2730 + _2716;
    int _2734 = ~_2708;
    int _2736 = _2734 + 1;
    int _2738 = _2736 + 1;
    float _2740 = _1043 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    int _2742 = as_type<int>(_2688) + (-2);
    float _2744 = float(uint(_2732));
    float _2746 = 1.0 / _2718;
    int _2748 = _2712 * _2738;
    float _2750 = float(uint(_2728));
    float _2752 = fma(_1033, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2740);
    int _2754 = abs(_2732);
    int _2756 = ~_2640;
    int _2758 = _2756 + 1;
    float _2760 = 1.0 / _2750;
    bool _2762 = !_1850;
    int _2764 = _2762 ? _2554 : (-1);
    int _2766 = ~_2590;
    int _2768 = _2766 + 1;
    bool _2770 = _2640 == 0;
    int _2772 = _2764 * _2708;
    int _2774 = _2772 + _2748;
    float _2776 = as_type<float>(_2742) * _2744;
    int _2778 = as_type<int>(_2726) + (-2);
    float _2780 = _1043 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    int _2782 = as_type<int>(_2746) + (-2);
    float _2784 = fma(_1033, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2720);
    float _2786 = float(uint(_2774));
    float _2788 = trunc(_2776);
    float _2790 = precise::max(_2788, 0.0);
    uint _2792 = uint(_2790);
    float _2794 = fma(_1033, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2780);
    int _2796 = abs(_2774);
    float _2798 = as_type<float>(_2782) * _2786;
    float _2800 = float(uint(_2754));
    float _2802 = fma(_1055, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2752);
    int _2804 = as_type<int>(_2760) + (-2);
    float _2806 = trunc(_2798);
    float _2808 = precise::max(_2806, 0.0);
    uint _2810 = uint(_2808);
    float _2812 = as_type<float>(_2778) * _2800;
    float _2814 = float(uint(_2796));
    float _2816 = fma(_1055, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2794);
    float _2818 = fma(_1055, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2784);
    int _2820 = ~_2728;
    int _2822 = _2820 + 1;
    int _2824 = _2644 * int(_2792);
    int _2826 = _2824 + _2732;
    float _2828 = as_type<float>(_2804) * _2814;
    float _2830 = trunc(_2812);
    float _2832 = precise::max(_2830, 0.0);
    uint _2834 = uint(_2832);
    out.m_70.x = _2816;
    out.m_70.y = _2818;
    out.m_70.z = _2802;
    bool _2836 = _2640 == 0;
    float _2838 = float(uint(_2826));
    int _2840 = ~_2686;
    int _2842 = _2840 + 1;
    float _2844 = trunc(_2828);
    float _2846 = precise::max(_2844, 0.0);
    uint _2848 = uint(_2846);
    int _2850 = _2758 * int(_2810);
    int _2852 = _2850 + _2774;
    float _2854 = as_type<float>(_2742) * _2838;
    float _2856 = _2578 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2858 = float(uint(_2852));
    int _2860 = _2842 * int(_2834);
    int _2862 = _2860 + _2754;
    float _2864 = trunc(_2854);
    float _2866 = precise::max(_2864, 0.0);
    uint _2868 = uint(_2866);
    float _2870 = _2578 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2872 = fma(_2532, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2856);
    float _2874 = as_type<float>(_2782) * _2858;
    float _2876 = float(uint(_2862));
    float _2878 = fma(_2532, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2870);
    int _2880 = _2822 * int(_2848);
    int _2882 = _2880 + _2796;
    float _2884 = trunc(_2874);
    float _2886 = precise::max(_2884, 0.0);
    uint _2888 = uint(_2886);
    float _2890 = _2578 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2892 = as_type<float>(_2778) * _2876;
    float _2894 = fma(_2584, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2872);
    float _2896 = float(uint(_2882));
    float _2898 = fma(_2532, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2890);
    float _2900 = fma(_2584, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2878);
    float _2902 = _2606 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2904 = trunc(_2892);
    float _2906 = precise::max(_2904, 0.0);
    uint _2908 = uint(_2906);
    float _2910 = as_type<float>(_2804) * _2896;
    float _2912 = _2606 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2914 = _2606 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2916 = fma(_2584, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2898);
    int _2918 = ~_2640;
    int _2920 = _2918 + 1;
    float _2922 = fma(_2498, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2912);
    int _2924 = int(_2792) + int(_2868);
    float _2926 = trunc(_2910);
    float _2928 = precise::max(_2926, 0.0);
    uint _2930 = uint(_2928);
    out.m_72.x = _2894;
    out.m_72.y = _2900;
    out.m_72.z = _2916;
    int _2932 = int(_2810) + int(_2888);
    float _2934 = fma(_2498, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2902);
    float _2936 = fma(_2498, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2914);
    int _2938 = int(_2834) + int(_2908);
    float _2940 = fma(_2618, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2934);
    int _2942 = _2920 * _2932;
    int _2944 = _2942 + _2774;
    int _2946 = ~_2686;
    int _2948 = _2946 + 1;
    int _2950 = ~_2728;
    int _2952 = _2950 + 1;
    int _2954 = _2768 * _2924;
    int _2956 = _2954 + _2732;
    bool _2958 = uint(_2944) >= uint(_2640);
    float _2960 = _1433 * 0.5;
    bool _2962 = uint(_2956) >= uint(_2590);
    int _2964 = _2948 * _2938;
    int _2966 = _2964 + _2754;
    int _2968 = int(_2848) + int(_2930);
    float _2970 = fma(_1461, -0.5, _2960);
    float _2972 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2974 = !_2962;
    int _2976 = _2974 ? 0 : (-1);
    bool _2978 = _2590 == 0;
    int _2980 = _2952 * _2968;
    int _2982 = _2980 + _2796;
    bool _2984 = !_2958;
    int _2986 = _2984 ? 0 : (-1);
    float _2988 = _1491 * _2116;
    bool _2990 = uint(_2966) >= uint(_2686);
    float _2992 = _1493 * _2116;
    int _2994 = ~_2924;
    int _2996 = _2994 + _2976;
    int _2998 = _2996 + 1;
    float _3000 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _3002 = _2732 ^ _2590;
    out.m_62.y = _2970;
    int _3004 = ~_2932;
    int _3006 = _3004 + _2986;
    int _3008 = _3006 + 1;
    int _3010 = _2590 * _2998;
    int _3012 = _3010 + _2732;
    bool _3014 = !_2990;
    int _3016 = _3014 ? 0 : (-1);
    float _3018 = _2972 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _3020 = _2590 == 0;
    int _3022 = _2640 * _3008;
    int _3024 = _3022 + _2774;
    bool _3026 = uint(_2982) >= uint(_2728);
    float _3028 = fma(_2618, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2936);
    uint _3030 = uint(int(uint(_3002) >> uint(31)));
    float _3032 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _3034 = _2774 ^ _2640;
    int _3036 = ~_3016;
    int _3038 = _2938 + _3036;
    int _3040 = _3038 + 1;
    float _3042 = _3000 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _3044 = ~int(_3030);
    int _3046 = _3044 + 1;
    bool _3048 = !_3026;
    int _3050 = _3048 ? 0 : (-1);
    float _3052 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    uint _3054 = uint(int(uint(_3034) >> uint(31)));
    int _3056 = _3040 ^ _3046;
    int _3058 = ~_3050;
    int _3060 = _2968 + _3058;
    int _3062 = _3060 + 1;
    int _3064 = ~int(_3054);
    int _3066 = _3064 + 1;
    bool _3068 = !_2978;
    int _3070 = _3068 ? _3012 : (-1);
    int _3072 = ~_3046;
    int _3074 = _3072 + _3056;
    int _3076 = _3074 + 1;
    int _3078 = _3062 ^ _3066;
    bool _3080 = !_2770;
    int _3082 = _3080 ? _3024 : (-1);
    float _3084 = float(_3070);
    int _3086 = ~_3066;
    int _3088 = _3086 + _3078;
    int _3090 = _3088 + 1;
    float _3092 = float(_3082);
    float _3094 = fma(_3018, _3084, _515);
    bool _3096 = !_3020;
    int _3098 = _3096 ? _3076 : (-1);
    float _3100 = _2334 + 0.5;
    bool _3102 = !_2836;
    int _3104 = _3102 ? _3090 : (-1);
    float _3106 = fma(_3042, _3092, _667);
    float _3108 = float(_3098);
    float _3110 = _3032 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _3112 = float(_3104);
    float _3114 = _3052 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _3116 = fma(_3018, _3100, _3094);
    float _3118 = _2412 + 0.5;
    float _3120 = -_1680;
    float _3122 = _3120 + 1.0;
    float _3124 = -_759;
    float _3126 = fma(_3114, _3112, _3124);
    float _3128 = _2238 + (-0.5);
    float _3130 = fma(_3042, _3118, _3106);
    float _3132 = _1495 * _2116;
    float _3134 = -_621;
    float _3136 = fma(_3110, _3108, _3134);
    float _3138 = -_3114;
    float _3140 = fma(_3138, _3128, _3126);
    float _3142 = fma(_2618, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2922);
    bool _3144 = _1239 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3146 = isnan(_1239);
    bool _3148 = _3144 || _3146;
    bool _3150 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3152 = _3148 || _3150;
    out.m_74.x = _2988;
    out.m_74.y = _2992;
    out.m_74.z = _3132;
    out.m_74.w = _3122;
    float _3154 = _2352 + (-0.5);
    float _3156 = -_763;
    float _3158 = _3156 + 1.0;
    float _3160 = -_1563;
    float _3162 = fma(_2334, _3160, _3116);
    out.m_76.x = _3142;
    out.m_76.y = _2940;
    out.m_76.z = _3028;
    float _3164 = -_3110;
    float _3166 = fma(_3164, _3154, _3136);
    float _3168 = -_3158;
    float _3170 = fma(_2412, _3168, _3130);
    float _3172 = fma(_2238, _1579, _3140);
    float _3174 = fma(_2352, _1567, _3166);
    float _3176 = _3110;
    float _3178 = _2970;
    float _3180 = _3174;
    float _3182 = _3162;
    if (!_3152)
    {
        _1533 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3184 = _1533;
    out.m_78.x = _3162;
    out.m_78.y = _3174;
    out.m_78.z = _3170;
    out.m_78.w = _3172;
    float _3186 = _3184;
    float _3188 = _3184;
    if (!_3152)
    {
        _3176 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3190 = _3176;
    float _3192 = _3190;
    float _3194 = _3190;
    if (!_3152)
    {
        _3178 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3196 = _3178;
    float _3198 = _3196;
    float _3200 = _3196;
    if (!_3152)
    {
        _1644 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3202 = _1644;
    float _3204 = _3202;
    float _3206 = _3202;
    if (!_3152)
    {
        _3180 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3208 = _3180;
    float _3210 = _3208;
    float _3212 = _3208;
    if (!_3152)
    {
        _3182 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3214 = _3182;
    bool _3216 = !_3152;
    float _3218 = _3214;
    float _3220 = _3214;
    if (!_3216)
    {
        bool _3222 = _1239 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3224 = isnan(_1239);
        bool _3226 = _3222 || _3224;
        bool _3228 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3230 = _3226 || _3228;
        if (!_3230)
        {
            float _3232 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3234 = _1239 + _3232;
            float _3236 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3238 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3236;
            float _3240 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3242 = _3240 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3244 = 1.0 / _3238;
            float _3246 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3248 = _3246 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3250 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3252 = _3250 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3254 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3256 = _3254 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3258 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3260 = _3258 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3262 = _3234 * _3244;
            float _3264 = precise::clamp(_3262, 0.0, 1.0);
            float _3266 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3268 = _3266 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3270 = fma(_3264, _3242, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3272 = fma(_3264, _3268, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3274 = fma(_3264, _3248, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3276 = fma(_3264, _3252, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3278 = fma(_3264, _3256, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3280 = fma(_3264, _3260, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3220 = _3274;
            _3200 = _3278;
            _3212 = _3270;
            _3194 = _3276;
            _3188 = _3272;
            _3206 = _3280;
            _3282 = true;
        }
        else
        {
            bool _3284 = _1239 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3286 = isnan(_1239);
            bool _3288 = _3284 || _3286;
            bool _3290 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3292 = _3288 || _3290;
            if (!_3292)
            {
                _3210 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3294 = _3210;
            _3212 = _3294;
            if (!_3292)
            {
                _3218 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3296 = _3218;
            _3220 = _3296;
            if (!_3292)
            {
                _3186 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3298 = _3186;
            _3188 = _3298;
            if (!_3292)
            {
                _3192 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3300 = _3192;
            _3194 = _3300;
            if (!_3292)
            {
                _3198 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3302 = _3198;
            _3200 = _3302;
            if (!_3292)
            {
                _3204 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3304 = _3204;
            bool _3306 = !_3292;
            _3206 = _3304;
            if (!_3306)
            {
                bool _3308 = _1239 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3310 = isnan(_1239);
                bool _3312 = _3308 || _3310;
                bool _3314 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3316 = _3312 || _3314;
                if (!_3316)
                {
                    float _3318 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3320 = _1239 + _3318;
                    float _3322 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3324 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3322;
                    float _3326 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3328 = _3326 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3330 = 1.0 / _3324;
                    float _3332 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3334 = _3332 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3336 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3338 = _3336 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3340 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3342 = _3340 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3344 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3346 = _3344 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3348 = _3320 * _3330;
                    float _3350 = precise::clamp(_3348, 0.0, 1.0);
                    float _3352 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3354 = _3352 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3356 = fma(_3350, _3328, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3358 = fma(_3350, _3354, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3360 = fma(_3350, _3334, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3362 = fma(_3350, _3338, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3364 = fma(_3350, _3342, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3366 = fma(_3350, _3346, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3220 = _3360;
                    _3200 = _3364;
                    _3212 = _3356;
                    _3194 = _3362;
                    _3188 = _3358;
                    _3206 = _3366;
                    _3282 = true;
                }
                else
                {
                    _3220 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3200 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3212 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3194 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3188 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3206 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3282 = false;
    float _3368 = _3220;
    float _3370 = _3200;
    float _3372 = _3212;
    float _3374 = _3194;
    float _3376 = _3188;
    float _3378 = _3206;
    float _3380 = fma(_2940, -0.5, 0.5);
    float _3382 = precise::clamp(_3380, 0.0, 1.0);
    float _3384 = -_3368;
    float _3386 = _3384 + _3370;
    float _3388 = -_3372;
    float _3390 = _3388 + _3374;
    float _3392 = -_3376;
    float _3394 = _3392 + _3378;
    bool _3396 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3398 = fma(_3382, _3386, _3368);
    float _3400 = fma(_3382, _3390, _3372);
    float _3402 = fma(_3382, _3394, _3376);
    float _3404 = _3398 * 0.586610972881317138671875;
    out.m_45.x = 1.0;
    float _3406 = fma(_3400, 0.298911988735198974609375, _3404);
    out.m_80.w = (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3408 = fma(_3402, 0.114477999508380889892578125, _3406);
    out.m_82.x = 0.0;
    float _3410 = -_3408;
    float _3412 = _3400 + _3410;
    float _3414 = -_3408;
    float _3416 = _3398 + _3414;
    float _3418 = -_3408;
    float _3420 = _3402 + _3418;
    float _3422 = fma(_3412, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3408);
    float _3424 = fma(_3416, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3408);
    float _3426 = fma(_3420, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3408);
    out.m_84.x = _3422;
    out.m_84.y = _3424;
    out.m_84.z = _3426;
    if (!_3396)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3428 = -_1207;
    float _3430 = _3428 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3432 = -_1211;
    float _3434 = _3432 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3436 = -_1215;
    float _3438 = _3436 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3440 = _3430 * _3430;
    float _3442 = fma(_3434, _3434, _3440);
    float _3444 = fma(_3438, _3438, _3442);
    float _3446 = sqrt(_3444);
    float _3448 = rsqrt(_3444);
    float _3450 = -_3446;
    float _3452 = _3450 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3454 = _3452 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3456 = precise::clamp(_3454, 0.0, 1.0);
    float _3458 = _3434 * _3448;
    float _3460 = _3430 * _3448;
    float _3462 = abs(_3456);
    float _3464 = log2(_3462);
    float _3466 = _3438 * _3448;
    float _3468 = _3458 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3470 = _2940 * _3460;
    float _3472 = -_3460;
    float _3474 = -_3468;
    float _3476 = fma(_3472, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3474);
    float _3478 = fma(_3142, _3458, _3470);
    float _3480 = -_3466;
    float _3482 = fma(_3480, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3476);
    float _3484 = fma(_3028, _3466, _3478);
    float _3486 = precise::clamp(_3484, 0.0, 1.0);
    float _3488 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3490 = _3482 + _3488;
    float _3492 = _3464 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3494 = _3490 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3496 = precise::clamp(_3494, 0.0, 1.0);
    float _3498 = exp2(_3492);
    float _3500 = _3498 * _3496;
    float _3502 = _3486 * _3500;
    float _3504 = _3502 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3506 = _3502 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3508 = _3502 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_82.x = _3504;
    out.m_82.y = _3506;
    out.m_82.z = _3508;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}


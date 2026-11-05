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
    float4 m_68 [[user(locn0)]];
    float4 m_72 [[user(locn1)]];
    float4 m_80 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_82 [[user(locn4)]];
    float4 m_74 [[user(locn5)]];
    float4 m_66 [[user(locn6)]];
    float4 m_78 [[user(locn7)]];
    float4 m_76 [[user(locn8)]];
    float4 m_64 [[user(locn9)]];
    float4 m_70 [[user(locn10)]];
    float4 m_84 [[user(locn11)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_58 [[attribute(1)]];
    float4 m_60 [[attribute(2)]];
    float4 m_62 [[attribute(3)]];
    float4 m_56 [[attribute(4)]];
    float4 m_42 [[attribute(5)]];
    float4 m_47 [[attribute(6)]];
    float4 m_54 [[attribute(7)]];
    float4 m_52 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    bool _321 = false;
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
    if (!_107)
    {
        _109 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _113 = _109;
    float _115 = _113;
    if (!_107)
    {
        out.m_45.x = 0.0;
    }
    int _117 = 0;
    if (!_107)
    {
        float _119 = _113 * 5.0;
        _117 = as_type<int>(_119);
    }
    int _121 = _117;
    int _123 = _121;
    if (!_107)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3556 = as_type<float>(_121);
        out.gl_Position.z = _3556;
    }
    if (!_107)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _125 = in.m_47.w;
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
        float _145 = float(_103);
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
        out.m_45.x = 0.0;
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
        float _3625 = as_type<float>(_159);
        out.gl_Position.z = _3625;
    }
    if (_153)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _161 = as_type<float>(int(gl_VertexIndex));
    float _163 = in.m_52.w;
    bool _165 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _167 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _169 = _165 || _167;
    bool _171 = isnan(1.0);
    bool _173 = _169 || _171;
    float _175 = in.m_47.x;
    float _177 = in.m_47.y;
    float _179 = in.m_47.z;
    float _181 = in.m_42.x;
    float _183 = in.m_42.y;
    float _185 = in.m_42.z;
    int _187 = as_type<int>(_161) & 1;
    bool _189 = _187 != 0;
    int _191 = as_type<int>(_161) & 2;
    bool _193 = _191 != 0;
    float _195 = _139 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _197 = 0.0;
    float _199 = _195;
    if (!_173)
    {
        float _201 = _195 * _195;
        float _203 = _201 * 0.5;
        _197 = _203;
    }
    float _205 = _197;
    bool _207 = !_189;
    float _209 = _207 ? (-0.5) : 0.5;
    bool _211 = !_193;
    float _213 = _211 ? (-0.5) : 0.5;
    float _215 = _205;
    if (!_173)
    {
        float _217 = _205 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _215 = _217;
    }
    float _219 = _215;
    bool _221 = !_173;
    float _223 = _219;
    if (!_221)
    {
        float _225 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _227 = log2(_225);
        float _229 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _231 = _229 + 1.0;
        float _233 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _235 = _195 * _227;
        float _237 = 1.0 / _231;
        float _239 = _233 * 0.693147182464599609375;
        float _241 = exp2(_235);
        float _243 = 1.0 / _239;
        float _245 = _241 + (-1.0);
        float _247 = -_245;
        float _249 = fma(_247, _243, _195);
        float _251 = _249 * _237;
        float _253 = _251 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _223 = _253;
    }
    float _255 = _223;
    bool _257 = !_173;
    if (!_257)
    {
        float _259 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _261 = log2(_259);
        float _263 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _265 = _263 + 1.0;
        float _267 = 1.0 / _265;
        float _269 = _195 * _261;
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
    float _289 = fma(_279, _175, _283);
    float _291 = fma(_279, _177, _285);
    float _293 = fma(_279, _179, _287);
    float _295 = fma(_289, _163, _181);
    float _297 = fma(_291, _163, _183);
    float _299 = fma(_293, _163, _185);
    bool _301 = !_281;
    float _319;
    if (!_301)
    {
        float _303 = in.m_54.x;
        float _305 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _307 = _303 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _309 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[12].x, _139);
        float _311 = _309 * _305;
        float _313 = floor(_311);
        float _315 = -_313;
        float _317 = _311 + _315;
        _319 = _317;
        _321 = true;
    }
    else
    {
        float _323 = float(_103);
        float _325 = 1.0 / _323;
        float _327 = _139 * _325;
        _319 = _327;
    }
    _321 = false;
    float _329 = _319;
    float _331 = in.m_54.x;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _335 = _329 + _333;
    float _337 = in.m_54.y;
    float _339 = in.m_54.z;
    float _341 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _343 = _331 * 2.0;
    float _345 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _347 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _349 = _337 > 0.5;
    float _351 = _337 * 2.0;
    float _353 = floor(_343);
    float _355 = _337 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _357 = _339 > 0.5;
    float _359 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _361 = -_209;
    int _363 = _349 ? as_type<int>(_361) : as_type<int>(_209);
    float _365 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _367 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _369 = _367 != 0;
    int _371 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _373 = _371 != 0;
    int _375 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _377 = _375 != 0;
    float _379 = -_213;
    int _381 = _357 ? as_type<int>(_379) : as_type<int>(_213);
    float _383 = floor(_351);
    bool _385 = !_373;
    float _387 = _385 ? _209 : as_type<float>(_363);
    bool _389 = !_377;
    float _391 = _389 ? _213 : as_type<float>(_381);
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _395 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _393;
    int _397 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _399 = _397 != 0;
    int _401 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _403 = _401 != 0;
    int _405 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _407 = _405 != 0;
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _411 = _409 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _413 = _353 > 0.0;
    float _415 = 1.0 / _395;
    int _417 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _419 = _417 != 0;
    float _421 = _331 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _423 = _353 >= 0.0;
    bool _425 = isnan(_353);
    bool _427 = _423 || _425;
    bool _429 = isnan(0.0);
    bool _431 = _427 || _429;
    float _433 = -_341;
    float _435 = fma(_421, 2.0, _433);
    int _437 = _431 ? 0 : 1;
    float _439 = 1.0 / _411;
    float _441 = -_139;
    float _443 = fma(_441, (*spvDescriptorSet0.vp_c9)._m0[76].x, _435);
    int _445 = ~_437;
    int _447 = _445 + 1;
    int _449 = _447 + 1;
    int _451 = _449;
    int _453 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[77].y);
    if (!_413)
    {
        int _455 = ~_437;
        int _457 = _455 + 1;
        _451 = _457;
    }
    int _459 = _451;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _463 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _461;
    float _465 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    if (_419)
    {
        _453 = 0;
    }
    int _467 = _453;
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _471 = _329 + _469;
    bool _473 = _383 >= 0.0;
    bool _475 = isnan(_383);
    bool _477 = _473 || _475;
    bool _479 = isnan(0.0);
    bool _481 = _477 || _479;
    float _483 = 1.0 / _463;
    int _485 = _467;
    if (!_419)
    {
        _485 = 1;
    }
    int _487 = _485;
    float _489 = fma(_355, -2.0, _465);
    bool _491 = _383 > 0.0;
    float _493 = _471 * _439;
    int _495 = _481 ? 0 : 1;
    float _497 = _339 + _337;
    bool _499 = _487 != 1;
    float _501 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _503 = _329 + _501;
    float _505 = _331 + _339;
    int _507 = ~_495;
    int _509 = _507 + 1;
    int _511 = _509 + 1;
    float _513 = _497 + (-1.0);
    bool _515 = !_403;
    int _517 = _515 ? 0 : 1;
    float _519 = _503 * _415;
    bool _521 = !_399;
    int _523 = _521 ? 0 : 1;
    float _525 = _339 * 2.0;
    int _527 = _511;
    int _529 = as_type<int>(_505);
    float _531 = _497;
    if (!_491)
    {
        int _533 = ~_495;
        int _535 = _533 + 1;
        _527 = _535;
    }
    int _537 = _527;
    float _539 = _505 + (-1.0);
    if (_419)
    {
        _529 = 0;
    }
    int _541 = _529;
    float _543 = _335 * _483;
    float _545 = 0.0;
    int _547 = _541;
    if (!_499)
    {
        _545 = _337;
    }
    float _549 = _545;
    float _551 = floor(_525);
    float _553 = _549;
    if (!_419)
    {
        _547 = 2;
    }
    int _555 = _547;
    float _557 = fma(_513, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _559 = !_407;
    int _561 = _559 ? 0 : 1;
    float _563 = _331 + _337;
    float _565 = 0.0;
    float _567 = as_type<float>(_555);
    if (!_499)
    {
        _565 = _549;
    }
    float _569 = _565;
    float _571 = _569;
    if (!_499)
    {
        _531 = _339;
    }
    float _573 = _531;
    float _575 = _563 + (-1.0);
    float _577 = 0.0;
    float _579 = _573;
    if (!_499)
    {
        _577 = _339;
    }
    float _581 = _577;
    float _583 = _581;
    if (_499)
    {
        _571 = _331;
    }
    float _585 = _571;
    float _587 = fma(_575, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    if (_499)
    {
        _553 = _331;
    }
    float _589 = _553;
    float _591 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _593 = int(_591);
    if (_499)
    {
        _579 = _337;
    }
    float _595 = _579;
    float _597 = _585 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_499)
    {
        _583 = _337;
    }
    float _599 = _583;
    float _601 = fma(_589, (*spvDescriptorSet0.vp_c9)._m0[83].z, _365);
    int _603 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _605 = _603 != 0;
    int _607 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _609 = _607 != 0;
    int _611 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _613 = _611 != 0;
    bool _615 = _555 != 2;
    float _617 = fma(_599, (*spvDescriptorSet0.vp_c9)._m0[83].w, _347);
    bool _619 = _551 >= 0.0;
    bool _621 = isnan(_551);
    bool _623 = _619 || _621;
    bool _625 = isnan(0.0);
    bool _627 = _623 || _625;
    bool _629 = !_605;
    int _631 = _629 ? 0 : 1;
    float _633 = fma(_539, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _635 = _627 ? 0 : 1;
    float _637 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _639 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _637;
    bool _641 = _551 > 0.0;
    float _643 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _645 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _643;
    float _647 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _649 = int(_647);
    if (_615)
    {
        _567 = _331;
    }
    float _651 = _567;
    float _653 = fma(_639, _519, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _655 = _651;
    if (!_615)
    {
        _655 = _339;
    }
    float _657 = _655;
    float _659 = fma(_645, _519, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _661 = float(_103);
    float _663 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _665 = _663 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    if (_615)
    {
        _111 = _337;
    }
    float _667 = _111;
    float _669 = _657 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _671 = _667;
    if (!_615)
    {
        _671 = _331;
    }
    float _673 = _671;
    float _675 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _677 = log2(_675);
    bool _679 = !_609;
    int _681 = _679 ? 0 : 1;
    float _683 = -_345;
    float _685 = fma(_669, 2.0, _683);
    int _687 = abs(_631);
    float _689 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _691 = _689 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _693 = float(_459);
    float _695 = _595 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _697 = _673 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _699 = abs(_681);
    float _701 = fma(_665, _493, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _703 = fma(_691, _493, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _705 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _707 = ~_635;
    int _709 = _707 + 1;
    int _711 = _709 + 1;
    float _713 = _677 * _139;
    float _715 = fma(_695, -2.0, _359);
    int _717 = _711;
    if (!_641)
    {
        int _719 = ~_635;
        int _721 = _719 + 1;
        _717 = _721;
    }
    int _723 = _717;
    float _725 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _727 = 1.0 + _725;
    float _729 = float(_593);
    float _731 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _733 = exp2(_713);
    float _735 = float(_699);
    float _737 = fma(_697, -2.0, _705);
    float _739 = float(_649);
    float _741 = -_731;
    float _743 = fma(_597, 2.0, _741);
    float _745 = in.m_56.x;
    float _747 = in.m_56.y;
    float _749 = in.m_56.z;
    float _751 = float(_723);
    float _753 = 1.0 / _661;
    float _755 = float(_687);
    float _757 = _735 * _693;
    float _759 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _761 = _755 * _751;
    float _763 = 1.0 / _729;
    bool _765 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _767 = isnan(1.0);
    bool _769 = _765 || _767;
    bool _771 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _773 = _769 || _771;
    float _775 = fma(_337, (*spvDescriptorSet0.vp_c9)._m0[78].w, _759);
    float _777 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _779 = -_733;
    float _781 = _779 + 1.0;
    bool _783 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _785 = isnan(0.0);
    bool _787 = _783 || _785;
    bool _789 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _791 = _787 || _789;
    float _793 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _795 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _797 = 1.0 / _739;
    bool _799 = _329 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _801 = isnan(_329);
    bool _803 = _799 || _801;
    bool _805 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _807 = _803 || _805;
    float _809 = float(_807);
    float _811 = fma(_331, (*spvDescriptorSet0.vp_c9)._m0[78].z, _777);
    float _813 = fma(_331, (*spvDescriptorSet0.vp_c9)._m0[88].z, _793);
    float _815 = fma(_337, (*spvDescriptorSet0.vp_c9)._m0[88].w, _795);
    float _817 = _791 ? _781 : 0.0;
    float _819 = -_809;
    float _821 = _819 + 1.0;
    bool _823 = _329 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _825 = isnan(_329);
    bool _827 = _823 || _825;
    bool _829 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _831 = _827 || _829;
    float _833 = float(_831);
    float _835 = 1.0 / _727;
    float _837 = -_139;
    float _839 = fma(_837, (*spvDescriptorSet0.vp_c9)._m0[86].x, _685);
    float _841 = _753 * _139;
    float _843 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[77].z, _811);
    float _845 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[76].y, _489);
    float _847 = -_139;
    float _849 = fma(_847, (*spvDescriptorSet0.vp_c9)._m0[81].x, _743);
    float _851 = _763 * _139;
    float _853 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[77].w, _775);
    float _855 = _797 * _139;
    float _857 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[87].z, _813);
    float _859 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[87].w, _815);
    float _861 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[82].z, _601);
    float _863 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[82].w, _617);
    float _865 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[81].y, _715);
    float _867 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[86].y, _737);
    float _869 = _833 * _821;
    float _871 = _855;
    if (_773)
    {
        float _873 = _817 * _835;
        _143 = _873;
    }
    float _875 = _143;
    float _877 = -_833;
    float _879 = _877 + 1.0;
    bool _881 = !_613;
    int _883 = _881 ? 0 : 1;
    float _885 = _761 * (-2.0);
    bool _887 = _329 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _889 = isnan(_329);
    bool _891 = _887 || _889;
    bool _893 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _895 = _891 || _893;
    float _897 = float(_895);
    float _899 = _757 * (-2.0);
    int _901 = abs(_883);
    float _903 = fma(_885, _745, _745);
    float _905 = _331 + (-0.5);
    float _907 = fma(_587, _885, _587);
    float _909 = _897 * _879;
    float _911 = fma(_905, (*spvDescriptorSet0.vp_c9)._m0[196].x, _903);
    bool _913 = _329 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _915 = isnan(_329);
    bool _917 = _913 || _915;
    bool _919 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _921 = _917 || _919;
    float _923 = float(_921);
    float _925 = -_897;
    float _927 = _925 + 1.0;
    float _929 = float(_537);
    float _931 = fma(_907, _875, _911);
    float _933 = float(_901);
    float _935 = _337 + (-0.5);
    float _937 = fma(_899, _747, _747);
    float _939 = _923 * _927;
    float _941 = fma(_557, _899, _557);
    float _943 = _933 * _929;
    float _945 = fma(_935, (*spvDescriptorSet0.vp_c9)._m0[196].y, _937);
    float _947 = _659 * _939;
    float _949 = -_923;
    float _951 = _949 + 1.0;
    float _953 = _653 * _939;
    float _955 = _943 * (-2.0);
    float _957 = fma(_941, _875, _945);
    float _959 = _931 * 0.15915493667125701904296875;
    float _961 = fma(_951, (*spvDescriptorSet0.vp_c9)._m0[143].x, _947);
    float _963 = fma(_951, (*spvDescriptorSet0.vp_c9)._m0[143].y, _953);
    float _965 = fma(_633, _955, _633);
    float _967 = _957 * 0.15915493667125701904296875;
    float _969 = fma(_955, _749, _749);
    float _971 = in.m_52.x;
    float _973 = in.m_52.y;
    float _975 = _339 + (-0.5);
    float _977 = _959 * 6.283185482025146484375;
    float _979 = sin(_977);
    float _981 = in.m_58.x;
    float _983 = in.m_58.y;
    float _985 = in.m_58.z;
    float _987 = fma(_975, (*spvDescriptorSet0.vp_c9)._m0[196].z, _969);
    float _989 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _991 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _989;
    float _993 = fma(_701, _909, _961);
    float _995 = in.m_60.x;
    float _997 = in.m_60.y;
    float _999 = in.m_60.z;
    float _1001 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1003 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _1001;
    float _1005 = fma(_965, _875, _987);
    float _1007 = _959 * 6.283185482025146484375;
    float _1009 = cos(_1007);
    float _1011 = fma(_703, _909, _963);
    float _1013 = in.m_62.x;
    float _1015 = in.m_62.y;
    float _1017 = in.m_62.z;
    float _1019 = _1005 * 0.15915493667125701904296875;
    float _1021 = _967 * 6.283185482025146484375;
    float _1023 = sin(_1021);
    float _1025 = fma(_991, _543, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _1027 = fma(_1003, _543, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _1029 = fma(_1025, _869, _993);
    float _1031 = fma(_1027, _869, _1011);
    float _1033 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _213);
    float _1035 = _967 * 6.283185482025146484375;
    float _1037 = cos(_1035);
    float _1039 = fma(_809, (*spvDescriptorSet0.vp_c9)._m0[146].x, _1029);
    float _1041 = fma(_809, (*spvDescriptorSet0.vp_c9)._m0[146].y, _1031);
    float _1043 = _297 * _983;
    float _1045 = _1039 * _971;
    float _1047 = _1041 * _973;
    float _1049 = _297 * _997;
    float _1051 = _1019 * 6.283185482025146484375;
    float _1053 = cos(_1051);
    float _1055 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _209);
    float _1057 = _1047 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1059 = fma(_295, _981, _1043);
    float _1061 = _1045 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1063 = _979 * _1023;
    float _1065 = _1057 * _1033;
    float _1067 = _297 * _1015;
    float _1069 = _1019 * 6.283185482025146484375;
    float _1071 = sin(_1069);
    float _1073 = _1009 * _1037;
    float _1075 = _1061 * _1055;
    float _1077 = _979 * _1037;
    float _1079 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1081 = fma(_295, _1013, _1067);
    float _1083 = in.m_54.w;
    float _1085 = fma(_299, _985, _1059);
    float _1087 = _1009 * _1053;
    float _1089 = _1009 * _1023;
    float _1091 = _979 * _1053;
    float _1093 = _1037 * _1053;
    float _1095 = _1087 * _1065;
    float _1097 = _1023 * _1053;
    float _1099 = fma(_299, _1017, _1081);
    float _1101 = fma(_295, _995, _1049);
    float _1103 = fma(_1071, _1073, _1063);
    float _1105 = -_1065;
    float _1107 = _1071 * _1105;
    float _1109 = -_1077;
    float _1111 = fma(_1071, _1089, _1109);
    float _1113 = -_1089;
    float _1115 = fma(_1071, _1077, _1113);
    float _1117 = fma(_1103, _1075, _1095);
    float _1119 = _1091 * _1065;
    float _1121 = fma(_1093, _1075, _1107);
    float _1123 = fma(_1071, _1063, _1073);
    float _1125 = fma(_1111, _1079, _1117);
    float _1127 = fma(_1115, _1075, _1119);
    float _1129 = fma(_1097, _1079, _1121);
    float _1131 = _1099 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1133 = _1125 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1135 = fma(_1123, _1079, _1127);
    float _1137 = _1125 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1139 = _1085 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1141 = fma(_1129, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1133);
    float _1143 = fma(_299, _999, _1101);
    float _1145 = fma(_1129, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1137);
    bool _1147 = _1083 > 0.5;
    float _1149 = fma(_1135, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1141);
    float _1151 = _1143 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1153 = fma(_1135, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1145);
    float _1155 = _1125 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1157 = _1149 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1159 = _1151 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1161 = _1153 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1163 = fma(_1129, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1155);
    float _1165 = _1131 + _1157;
    float _1167 = fma(_1139, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1159);
    float _1169 = _1139 + _1161;
    float _1171 = -_213;
    int _1173 = _1147 ? as_type<int>(_1171) : as_type<int>(_213);
    float _1175 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1177 = _1165 + _1175;
    float _1179 = fma(_1131, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1167);
    float _1181 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1183 = _1169 + _1181;
    bool _1185 = !_369;
    float _1187 = _1185 ? _213 : as_type<float>(_1173);
    float _1189 = _1177 * _1177;
    int _1191 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1193 = _1191 != 0;
    int _1195 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1197 = _1195 != 0;
    int _1199 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1201 = _1199 != 0;
    int _1203 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1205 = _1203 != 0;
    float _1207 = _1179 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1209 = fma(_1135, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1163);
    float _1211 = fma(_1183, _1183, _1189);
    float _1213 = _1151 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1215 = 1.0 / _1207;
    bool _1217 = !_1197;
    int _1219 = _1217 ? 0 : 1;
    float _1221 = _1209 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1223 = fma(_1139, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1213);
    bool _1225 = !_1193;
    int _1227 = _1225 ? 0 : 1;
    float _1229 = _1151 + _1221;
    float _1231 = fma(_1131, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1223);
    float _1233 = sqrt(_1211);
    bool _1235 = !_1201;
    int _1237 = _1235 ? 0 : 1;
    float _1239 = _1231 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1241 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1243 = isnan(0.5);
    bool _1245 = _1241 || _1243;
    bool _1247 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1249 = _1245 || _1247;
    bool _1251 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1253 = isnan(0.5);
    bool _1255 = _1251 || _1253;
    bool _1257 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1259 = _1255 || _1257;
    float _1261 = _1239 + _1207;
    bool _1263 = !_1205;
    int _1265 = _1263 ? 0 : 1;
    float _1267 = _1261 * _1215;
    float _1269 = _1267 * 0.5;
    bool _1271 = _1233 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1273 = _1209;
    float _1275 = _1221;
    float _1277 = _1165;
    float _1279 = _1211;
    float _1281 = _1207;
    float _1283 = _1177;
    float _1285 = _1157;
    if (!_1271)
    {
        _1273 = _1169;
    }
    float _1287 = _1273;
    float _1289 = _1287;
    if (!_1271)
    {
        _1275 = _1229;
    }
    float _1291 = _1275;
    bool _1293 = !_1271;
    float _1295 = _1291;
    if (!_1293)
    {
        float _1297 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1299 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1301 = _1233 + _1299;
        float _1303 = _1229 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1305 = rsqrt(_1211);
        float _1307 = _1301 * _1297;
        float _1309 = _1307 * 0.15915493667125701904296875;
        float _1311 = _1309 * 6.283185482025146484375;
        float _1313 = sin(_1311);
        float _1315 = _1309 * 6.283185482025146484375;
        float _1317 = cos(_1315);
        float _1319 = fma(_1313, _1303, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1321 = _1305 * _1319;
        float _1323 = _1317 + (-1.0);
        float _1325 = fma(_1183, _1321, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1327 = fma(_1177, _1321, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1329 = _1323 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1331 = fma(_1229, _1317, _1329);
        _1277 = _1327;
        _1279 = _1305;
        _1289 = _1325;
        _1295 = _1331;
    }
    float _1333 = _1277;
    float _1335 = _1279;
    float _1337 = _1289;
    float _1339 = _1295;
    float _1341 = _1339;
    float _1343 = _1337;
    float _1345 = _1335;
    if (_1259)
    {
        _1281 = 1.0;
    }
    float _1347 = _1281;
    float _1349 = _1347;
    if (_1249)
    {
        _1283 = _1333;
    }
    float _1351 = _1283;
    float _1353 = _1351;
    if (!_1249)
    {
        float _1355 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1357 = _1151 + _1355;
        float _1359 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1361 = _1139 + _1359;
        float _1363 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1365 = -_1139;
        float _1367 = _1365 + _1337;
        float _1369 = _1357 * _1357;
        float _1371 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1373 = _1131 + _1371;
        float _1375 = -_1151;
        float _1377 = _1375 + _1339;
        float _1379 = fma(_1361, _1361, _1369);
        float _1381 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1383 = fma(_1373, _1373, _1379);
        float _1385 = sqrt(_1383);
        float _1387 = _1363 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1389 = precise::min(_1385, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1391 = _1389 * _1381;
        float _1393 = _1387 * _1391;
        float _1395 = -_1131;
        float _1397 = _1395 + _1333;
        float _1399 = fma(_1367, _1393, _1139);
        float _1401 = fma(_1377, _1393, _1151);
        float _1403 = fma(_1397, _1393, _1131);
        _1341 = _1401;
        _1343 = _1399;
        _1353 = _1403;
        _1345 = _1363;
    }
    float _1405 = _1341;
    float _1407 = _1343;
    float _1409 = _1353;
    float _1411 = _1345;
    float _1413 = _1411;
    if (!_1259)
    {
        float _1415 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1417 = _1415 * 0.15915493667125701904296875;
        float _1419 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1421 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1423 = fma(_1269, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1421);
        float _1425 = _1417 * 6.283185482025146484375;
        float _1427 = cos(_1425);
        float _1429 = _1419 * 0.15915493667125701904296875;
        float _1431 = _1417 * 6.283185482025146484375;
        float _1433 = sin(_1431);
        float _1435 = 1.0 / _1427;
        float _1437 = _1429 * 6.283185482025146484375;
        float _1439 = cos(_1437);
        float _1441 = _1433 * _1435;
        float _1443 = _1429 * 6.283185482025146484375;
        float _1445 = sin(_1443);
        float _1447 = _1439 * _1441;
        float _1449 = 1.0 / _1423;
        float _1451 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1453 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1451;
        float _1455 = 1.0 / _1447;
        float _1457 = 1.0 / _1453;
        float _1459 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1461 = _1449 * _1459;
        float _1463 = _1445 * _1455;
        float _1465 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1467 = fma(_1463, _1461, _1465);
        float _1469 = _1467 * _1457;
        float _1471 = precise::clamp(_1469, 0.0, 1.0);
        float _1473 = -_1471;
        float _1475 = _1473 + 1.0;
        _1413 = _1429;
        _1349 = _1475;
    }
    float _1477 = _1413;
    float _1479 = _1349;
    float _1481 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1483 = _1405 + _1481;
    float _1485 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1487 = _1407 + _1485;
    float _1489 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1491 = _1409 + _1489;
    float _1493 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1495 = _1483 * _1483;
    float _1497 = _1405 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1499 = fma(_1487, _1487, _1495);
    float _1501 = fma(_1407, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1497);
    float _1503 = fma(_1491, _1491, _1499);
    float _1505 = fma(_1409, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1501);
    float _1507 = rsqrt(_1503);
    float _1509 = _1505 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1511 = sqrt(_1503);
    float _1513 = _1507 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1515 = _1487 * _1513;
    float _1517 = _1491 * _1513;
    float _1519 = _1515 * _1515;
    float _1521 = _1517 * _1517;
    float _1523 = _1519 + _1521;
    float _1525 = sqrt(_1523);
    bool _1527 = _1525 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1529 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1531 = _1525 + _1529;
    float _1533 = _1507;
    float _1535 = _1523;
    float _1537 = _1531;
    float _1539 = _1477;
    float _1541 = _1483;
    if (_1527)
    {
        float _1543 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1533 = _1543;
    }
    float _1545 = _1533;
    if (_1527)
    {
        float _1547 = rsqrt(_1523);
        _1535 = _1547;
    }
    float _1549 = _1535;
    float _1551 = _1549;
    if (_1527)
    {
        float _1553 = _1531 * _1545;
        _1537 = _1553;
    }
    float _1555 = _1537;
    if (_1527)
    {
        float _1557 = _1555 * 0.15915493667125701904296875;
        _1539 = _1557;
    }
    float _1559 = _1539;
    float _1561 = _1491;
    float _1563 = _1559;
    if (_1527)
    {
        float _1565 = _1559 * 6.283185482025146484375;
        float _1567 = sin(_1565);
        _1561 = _1567;
    }
    float _1569 = _1561;
    float _1571 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1573 = precise::max(0.0, _1571);
    float _1575 = _1545;
    float _1577 = _1573;
    if (_1527)
    {
        float _1579 = _1559 * 6.283185482025146484375;
        float _1581 = cos(_1579);
        _1575 = _1581;
    }
    float _1583 = _1575;
    float _1585 = -_1513;
    float _1587 = -_1573;
    float _1589 = fma(_1483, _1585, _1587);
    if (_1527)
    {
        float _1591 = _1589 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1541 = _1591;
    }
    float _1593 = _1541;
    float _1595 = _1593;
    float _1597 = _1569;
    if (_1527)
    {
        float _1599 = fma(_1569, _1593, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1595 = _1599;
    }
    float _1601 = _1595;
    float _1603 = _1601;
    if (!_1527)
    {
        _1597 = _1515;
    }
    float _1605 = _1597;
    float _1607 = _1605;
    float _1609 = _1583;
    if (_1527)
    {
        float _1611 = _1583 + (-1.0);
        _1577 = _1611;
    }
    float _1613 = _1577;
    float _1615 = _1613;
    if (_1527)
    {
        float _1617 = _1549 * _1601;
        _1285 = _1617;
    }
    float _1619 = _1285;
    if (!_1527)
    {
        _1603 = _1589;
    }
    float _1621 = _1603;
    float _1623 = _1621;
    if (_1527)
    {
        float _1625 = _1613 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1563 = _1625;
    }
    float _1627 = _1563;
    if (_1527)
    {
        float _1629 = _1515 * _1619;
        _1607 = _1629;
    }
    float _1631 = _1607;
    if (!_1527)
    {
        _1615 = _1517;
    }
    float _1633 = _1615;
    float _1635 = _1633;
    if (_1527)
    {
        float _1637 = _1517 * _1619;
        _1635 = _1637;
    }
    float _1639 = _1635;
    if (!_1527)
    {
        _1551 = _1519;
    }
    float _1641 = _1551;
    float _1643 = _1641;
    if (_1527)
    {
        float _1645 = fma(_1589, _1583, _1627);
        _1623 = _1645;
    }
    float _1647 = _1623;
    if (_1527)
    {
        float _1649 = _1631 * _1631;
        _1643 = _1649;
    }
    float _1651 = _1643;
    if (!_1527)
    {
        _1609 = _1521;
    }
    float _1653 = _1609;
    float _1655 = _1653;
    if (_1527)
    {
        float _1657 = _1639 * _1639;
        _1655 = _1657;
    }
    float _1659 = _1655;
    float _1661 = fma(_1647, _1647, _1651);
    float _1663 = _1405 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1665 = _1661 + _1659;
    float _1667 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1669 = fma(_1511, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1667);
    float _1671 = precise::clamp(_1669, 0.0, 1.0);
    float _1673 = fma(_1407, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1663);
    float _1675 = _1405 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1677 = -_1671;
    float _1679 = _1677 + 1.0;
    float _1681 = rsqrt(_1665);
    float _1683 = fma(_1407, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1675);
    float _1685 = fma(_1409, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1673);
    float _1687 = fma(_1409, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1683);
    float _1689 = _1685 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1691 = _1405 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1693 = abs(_1679);
    float _1695 = log2(_1693);
    float _1697 = _1687 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1699 = _1689 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1701 = fma(_1407, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1691);
    float _1703 = _1697 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1705 = -_1699;
    float _1707 = fma(_1705, _1493, 1.0);
    float _1709 = fma(_1409, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1701);
    float _1711 = _1681 * _1631;
    float _1713 = _1681 * _1647;
    float _1715 = _1681 * _1639;
    float _1717 = fma(_1509, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1703);
    float _1719 = _1711 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1721 = _1709 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1723 = log2(_1707);
    float _1725 = fma(_1689, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1717);
    float _1727 = -_1719;
    float _1729 = fma(_1713, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1727);
    float _1731 = _1695 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1733 = _1697 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1735 = fma(_1721, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1725);
    float _1737 = -_1715;
    float _1739 = fma(_1737, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1729);
    float _1741 = _1697 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1743 = fma(_1509, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1733);
    float _1745 = exp2(_1731);
    float _1747 = fma(_1739, -0.5, 0.5);
    float _1749 = fma(_1739, 0.5, 0.5);
    float _1751 = fma(_1509, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1741);
    float _1753 = _1713 + 1.0;
    float _1755 = fma(_1689, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1743);
    float _1757 = fma(_1749, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1759 = fma(_1689, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1751);
    float _1761 = 1.0 / _1735;
    float _1763 = fma(_1749, _1757, -0.212114393711090087890625);
    float _1765 = fma(_1721, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1759);
    float _1767 = fma(_1749, _1763, 1.570728778839111328125);
    float _1769 = sqrt(_1747);
    float _1771 = -_1713;
    float _1773 = fma(_1745, _1753, _1771);
    float _1775 = fma(_1721, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1755);
    float _1777 = _1723 * 0.693147182464599609375;
    float _1779 = _1777 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1781 = _1765 * _1761;
    float _1783 = _1775 * _1761;
    float _1785 = fma(_1781, 0.5, 0.5);
    float _1787 = fma(_1783, -0.5, 0.5);
    float _1789 = _1769 * 0.636619746685028076171875;
    float _1791 = fma(_1773, 0.5, 0.5);
    float _1793 = -_1767;
    float _1795 = fma(_1789, _1793, 1.0);
    float3 _6175 = float3(_1785, _1787, _1779);
    float _1797 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6175, float3(0.0), isnan(_6175)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6175, float3(0.0), isnan(_6175)), level(0.0)).x;
    float3 _6186 = float3(_1785, _1787, _1779);
    float4 _1800 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6186, float3(0.0), isnan(_6186)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6186, float3(0.0), isnan(_6186)), level(0.0)).xyzw;
    float _1802 = _1800.x;
    float _1804 = _1800.y;
    float _1806 = _1800.z;
    float _1808 = _1800.w;
    float2 _6203 = float2(_1795, _1791);
    float3 _1812 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6203, float2(0.0), isnan(_6203)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6203, float2(0.0), isnan(_6203)), level(0.0)).xyz;
    float _1814 = _1812.x;
    float _1816 = _1812.y;
    float _1818 = _1812.z;
    float _1820 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1822 = int(_1820);
    int _1824 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1826 = _1824 != 0;
    float _1828 = -_859;
    float _1830 = _1828 + 1.0;
    int _1832 = abs(_1219);
    float _1834 = -_857;
    float _1836 = _1834 + 1.0;
    int _1838 = abs(_1237);
    out.m_64.x = _1407;
    out.m_64.y = _1405;
    out.m_64.z = _1409;
    int _1840 = abs(_1265);
    float _1842 = trunc(_851);
    int _1844 = int(_1842);
    bool _1846 = _337 > 0.5;
    float _1848 = _1695 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1850 = _339 > 0.5;
    float _1852 = _1697 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1854 = -_863;
    float _1856 = _1854 + 1.0;
    float _1858 = -_843;
    float _1860 = _1858 + 1.0;
    float _1862 = -_853;
    float _1864 = _1862 + 1.0;
    float _1866 = float(uint(_1822));
    float _1868 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1870 = int(_1868);
    int _1872 = ~_1822;
    int _1874 = _1872 + 1;
    bool _1876 = _1822 == 0;
    float _1878 = float(uint(_1844));
    float _1880 = 1.0 / _1866;
    float _1882 = float(uint(_1870));
    float _1884 = trunc(_855);
    int _1886 = int(_1884);
    int _1888 = ~_1822;
    int _1890 = _1888 + 1;
    int _1892 = ~_1870;
    int _1894 = _1892 + 1;
    int _1896 = as_type<int>(_1880) + (-2);
    float _1898 = 1.0 / _1882;
    if (_1826)
    {
        _871 = _331;
    }
    float _1900 = _871;
    float _1902 = _1900;
    if (!_1826)
    {
        _1902 = _337;
    }
    float _1904 = _1902;
    float _1906 = as_type<float>(_1896) * _1878;
    float _1908 = -_213;
    int _1910 = _1846 ? as_type<int>(_1908) : as_type<int>(_213);
    float _1912 = trunc(_1906);
    float _1914 = precise::max(_1912, 0.0);
    uint _1917 = uint(_1914);
    float _1919 = float(uint(_1886));
    int _1921 = as_type<int>(_1898) + (-2);
    float _1923 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1925 = _1906;
    if (_1826)
    {
        _1925 = 1.0;
    }
    float _1927 = _1925;
    float _1929 = _1927;
    if (!_1826)
    {
        _1929 = 1.2345600128173828125;
    }
    float _1931 = _1929;
    float _1933 = as_type<float>(_1921) * _1919;
    int _1935 = ~_1870;
    int _1937 = _1935 + 1;
    int _1939 = _1890 * int(_1917);
    int _1941 = _1939 + _1844;
    float _1943 = _1931 * _1904;
    float _1945 = float(_1844);
    float _1947 = trunc(_1933);
    float _1949 = precise::max(_1947, 0.0);
    uint _1951 = uint(_1949);
    float _1953 = float(uint(_1941));
    float _1955 = as_type<float>(_1941);
    if (_1826)
    {
        _1955 = 1.0;
    }
    float _1957 = _1955;
    float _1959 = _1957;
    if (!_1826)
    {
        _1959 = 7.345489978790283203125;
    }
    float _1961 = _1959;
    float _1963 = as_type<float>(_1896) * _1953;
    float _1965 = floor(_1943);
    int _1967 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1969 = _1967 != 0;
    float _1971 = _1923 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1973 = _1961 * _331;
    float _1975 = trunc(_1963);
    float _1977 = precise::max(_1975, 0.0);
    uint _1979 = uint(_1977);
    int _1981 = _1937 * int(_1951);
    int _1983 = _1981 + _1886;
    float _1985 = float(uint(_1983));
    float _1987 = floor(_1973);
    float _1989 = as_type<float>(_1921) * _1985;
    int _1991 = int(_1917) + int(_1979);
    float _1993 = trunc(_1989);
    float _1995 = precise::max(_1993, 0.0);
    uint _1997 = uint(_1995);
    float _1999 = float(_1822);
    int _2001 = _1874 * _1991;
    int _2003 = _2001 + _1844;
    bool _2005 = _1945 >= _1999;
    bool _2007 = isnan(_1945);
    bool _2009 = _2005 || _2007;
    bool _2011 = isnan(_1999);
    bool _2013 = _2009 || _2011;
    float _2015 = float(_2013);
    float _2017 = -_1987;
    float _2019 = _1973 + _2017;
    float _2021 = -_1965;
    float _2023 = _1943 + _2021;
    bool _2025 = uint(_2003) >= uint(_1822);
    float _2027 = exp2(_1848);
    float _2029 = float(_1870);
    bool _2031 = !_2025;
    int _2033 = _2031 ? 0 : (-1);
    int _2035 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2037 = _2035 != 0;
    int _2039 = ~_1991;
    int _2041 = _2039 + _2033;
    int _2043 = _2041 + 1;
    float _2045 = trunc(_2015);
    int _2047 = int(_2045);
    int _2049 = int(_1951) + int(_1997);
    float _2051 = _2019 * _1999;
    float _2053 = float(_1886);
    int _2055 = _1822 * _2043;
    int _2057 = _2055 + _1844;
    int _2059 = _1822 + (-1);
    int _2061 = _1894 * _2049;
    int _2063 = _2061 + _1886;
    bool _2065 = _2053 >= _2029;
    bool _2067 = isnan(_2053);
    bool _2069 = _2065 || _2067;
    bool _2071 = isnan(_2029);
    bool _2073 = _2069 || _2071;
    float _2075 = float(_2073);
    float _2077 = _1999 * _841;
    bool _2079 = !_1876;
    int _2081 = _2079 ? _2057 : (-1);
    float _2083 = trunc(_2051);
    int _2085 = int(_2083);
    bool _2087 = !_2037;
    int _2089 = _2087 ? 0 : 1;
    float _2091 = _2029 * _841;
    bool _2093 = uint(_2063) >= uint(_1870);
    float _2095 = -_2027;
    float _2097 = _2095 + 1.0;
    int _2099 = abs(_2089);
    int _2101 = ~_2047;
    int _2103 = _2101 + 1;
    int _2105 = _2103 + 1;
    float _2107 = trunc(_2075);
    int _2109 = int(_2107);
    int _2111 = _2081 * _2105;
    bool _2113 = !_2093;
    int _2115 = _2113 ? 0 : (-1);
    bool _2117 = _1870 == 0;
    int _2119 = _2047 * _2059;
    int _2121 = _2119 + _2111;
    int _2123 = abs(_517);
    float _2125 = trunc(_2091);
    int _2127 = int(_2125);
    int _2129 = ~_2049;
    int _2131 = _2129 + _2115;
    int _2133 = _2131 + 1;
    int _2135 = _1870 * _2133;
    int _2137 = _2135 + _1886;
    float _2139 = _2023 * _2029;
    float _2141 = trunc(_2077);
    int _2143 = int(_2141);
    int _2145 = _2085 * _2099;
    int _2147 = _2145 + _1844;
    int _2149 = abs(_561);
    int _2151 = _2121 * _2123;
    int _2153 = ~_2109;
    int _2155 = _2153 + 1;
    int _2157 = _2155 + 1;
    bool _2159 = !_2117;
    int _2161 = _2159 ? _2137 : (-1);
    float _2163 = trunc(_2139);
    int _2165 = int(_2163);
    int _2167 = abs(_523);
    bool _2169 = !_1969;
    int _2171 = _2169 ? 0 : 1;
    int _2173 = _2161 * _2157;
    int _2175 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2177 = _2175 != 0;
    int _2179 = _2143 * _2167;
    int _2181 = _2179 + _2151;
    int _2183 = abs(_2171);
    float _2185 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _2187 = !_2177;
    int _2189 = _2187 ? 0 : 1;
    int _2191 = _2147 * _2149;
    int _2193 = _2191 + _2181;
    int _2195 = _1870 + (-1);
    int _2197 = abs(_2189);
    int _2199 = _2085 * _2183;
    int _2201 = _2199 + _2193;
    int _2203 = abs(_1227);
    int _2205 = _2109 * _2195;
    int _2207 = _2205 + _2173;
    float _2209 = float(uint(_2201));
    int _2211 = _2207 * _1832;
    int _2213 = _2165 * _2197;
    int _2215 = _2213 + _1886;
    float _2217 = float(uint(_2147));
    float _2219 = as_type<float>(_1896) * _2209;
    int _2221 = ~_1822;
    int _2223 = _2221 + 1;
    int _2225 = _2127 * _2203;
    int _2227 = _2225 + _2211;
    int _2229 = ~_1870;
    int _2231 = _2229 + 1;
    float _2233 = trunc(_2219);
    float _2235 = precise::max(_2233, 0.0);
    uint _2237 = uint(_2235);
    int _2239 = ~_1870;
    int _2241 = _2239 + 1;
    int _2243 = _2215 * _1838;
    int _2245 = _2243 + _2227;
    int _2247 = ~_1822;
    int _2249 = _2247 + 1;
    int _2251 = _2165 * _1840;
    int _2253 = _2251 + _2245;
    float _2255 = as_type<float>(_1896) * _2217;
    float _2257 = float(uint(_2253));
    int _2259 = _2223 * int(_2237);
    int _2261 = _2259 + _2201;
    float _2263 = trunc(_2255);
    float _2265 = precise::max(_2263, 0.0);
    uint _2267 = uint(_2265);
    float _2269 = as_type<float>(_1921) * _2257;
    float _2271 = float(uint(_2215));
    float _2273 = float(uint(_2261));
    float _2275 = as_type<float>(_1921) * _2271;
    float _2277 = trunc(_2269);
    float _2279 = precise::max(_2277, 0.0);
    uint _2281 = uint(_2279);
    float _2283 = as_type<float>(_1896) * _2273;
    float _2285 = trunc(_2283);
    float _2287 = precise::max(_2285, 0.0);
    uint _2289 = uint(_2287);
    int _2291 = _2249 * int(_2267);
    int _2293 = _2291 + _2147;
    float _2295 = float(uint(_2293));
    float _2297 = trunc(_2275);
    float _2299 = precise::max(_2297, 0.0);
    uint _2301 = uint(_2299);
    int _2303 = _2231 * int(_2281);
    int _2305 = _2303 + _2253;
    float _2307 = as_type<float>(_1896) * _2295;
    int _2309 = ~_1822;
    int _2311 = _2309 + 1;
    float _2313 = float(uint(_2305));
    float _2315 = trunc(_2307);
    float _2317 = precise::max(_2315, 0.0);
    uint _2319 = uint(_2317);
    int _2321 = int(_2237) + int(_2289);
    float _2323 = as_type<float>(_1921) * _2313;
    int _2325 = _2241 * int(_2301);
    int _2327 = _2325 + _2215;
    float _2329 = trunc(_2323);
    float _2331 = precise::max(_2329, 0.0);
    uint _2333 = uint(_2331);
    int _2335 = _2311 * _2321;
    int _2337 = _2335 + _2201;
    float _2339 = float(uint(_2327));
    bool _2341 = uint(_2337) >= uint(_1822);
    float _2343 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _2345 = as_type<float>(_1921) * _2339;
    bool _2347 = !_2341;
    int _2349 = _2347 ? 0 : (-1);
    int _2351 = ~_1822;
    int _2353 = _2351 + 1;
    float _2355 = _2343 * _331;
    int _2357 = int(_2267) + int(_2319);
    float _2359 = -_213;
    float _2361 = _2359 + 0.5;
    int _2363 = ~_2321;
    int _2365 = _2363 + _2349;
    int _2367 = _2365 + 1;
    float _2369 = trunc(_2345);
    float _2371 = precise::max(_2369, 0.0);
    uint _2373 = uint(_2371);
    float _2375 = _209 + 0.5;
    int _2377 = ~_1870;
    int _2379 = _2377 + 1;
    int _2381 = _1822 * _2367;
    int _2383 = _2381 + _2201;
    int _2385 = int(_2281) + int(_2333);
    int _2387 = _2353 * _2357;
    int _2389 = _2387 + _2147;
    out.m_66.x = _2375;
    out.m_66.y = _2361;
    float _2391 = trunc(_2355);
    int _2393 = int(_2391);
    bool _2395 = !_1876;
    int _2397 = _2395 ? _2383 : (-1);
    int _2399 = _2379 * _2385;
    int _2401 = _2399 + _2253;
    bool _2403 = uint(_2389) >= uint(_1822);
    bool _2405 = uint(_2401) >= uint(_1870);
    int _2407 = _2397 & 3;
    bool _2409 = _2407 != 0;
    bool _2411 = !_2403;
    int _2413 = _2411 ? 0 : (-1);
    bool _2415 = !_2405;
    int _2417 = _2415 ? 0 : (-1);
    bool _2419 = uint(_2407) >= 2u;
    int _2421 = ~_2357;
    int _2423 = _2421 + _2413;
    int _2425 = _2423 + 1;
    int _2427 = _2393 << 4;
    int _2429 = _2427 + 1712;
    int _2431 = ~_2385;
    int _2433 = _2431 + _2417;
    int _2435 = _2433 + 1;
    int _2437 = _1822 * _2425;
    int _2439 = _2437 + _2147;
    int _2441 = _2397 & 3;
    bool _2443 = _2441 != 0;
    uint _2445 = uint(int(uint(_2429) >> uint(2)));
    uint _2447 = uint(int(uint(int(_2445)) >> uint(2)));
    int _2449 = int(_2445) & 3;
    float _2451 = (*spvDescriptorSet0.vp_c9)._m0[int(_2447)][_2449];
    int _2453 = int(_2445) + 1;
    uint _2455 = uint(int(uint(_2453) >> uint(2)));
    int _2457 = _2453 & 3;
    float _2459 = (*spvDescriptorSet0.vp_c9)._m0[int(_2455)][_2457];
    int _2461 = _2419 ? 0 : 1;
    int _2463 = _1870 * _2435;
    int _2465 = _2463 + _2253;
    bool _2467 = _2407 != 3;
    int _2469 = _2443 ? 0 : 1;
    bool _2471 = uint(_2407) > 1u;
    int _2473 = _2429 + 8;
    uint _2475 = uint(int(uint(_2473) >> uint(2)));
    uint _2477 = uint(int(uint(int(_2475)) >> uint(2)));
    int _2479 = int(_2475) & 3;
    float _2481 = (*spvDescriptorSet0.vp_c9)._m0[int(_2477)][_2479];
    int _2483 = _2397 >> 31;
    int _2485 = ~_2461;
    int _2487 = _2485 + 1;
    int _2489 = _2487 + 1;
    int _2491 = _2483 & 3;
    bool _2493 = !_2117;
    int _2495 = _2493 ? _2465 : (-1);
    int _2497 = _2489;
    if (_2467)
    {
        int _2499 = ~_2461;
        int _2501 = _2499 + 1;
        _2497 = _2501;
    }
    int _2503 = _2497;
    int _2505 = _2397 + _2491;
    int _2507 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2509 = _2507 != 0;
    int _2511 = ~_2469;
    int _2513 = _2511 + 1;
    int _2515 = _2513 + 1;
    int _2517 = _2515;
    if (!_2471)
    {
        int _2519 = ~_2469;
        int _2521 = _2519 + 1;
        _2517 = _2521;
    }
    int _2523 = _2517;
    bool _2525 = _2407 != 3;
    bool _2527 = !_2509;
    int _2529 = _2527 ? 0 : 1;
    int _2531 = _2505 >> 2;
    int _2533 = _2495 & 3;
    bool _2535 = _2533 != 0;
    int _2537 = ~_1870;
    int _2539 = _2537 + 1;
    bool _2541 = !_1876;
    int _2543 = _2541 ? _2439 : (-1);
    int _2545 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2547 = _2545 != 0;
    bool _2549 = !_2409;
    int _2551 = _2549 ? 0 : 1;
    int _2553 = _2531 << 4;
    int _2555 = _2553 + 368;
    bool _2557 = uint(_2533) > 1u;
    float _2559 = _2451 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _2561 = !_2547;
    int _2563 = _2561 ? 0 : 1;
    uint _2565 = uint(int(uint(_2555) >> uint(2)));
    uint _2567 = uint(int(uint(int(_2565)) >> uint(2)));
    int _2569 = int(_2565) & 3;
    float _2571 = (*spvDescriptorSet0.vp_c9)._m0[int(_2567)][_2569];
    int _2573 = int(_2565) + 1;
    uint _2575 = uint(int(uint(_2573) >> uint(2)));
    int _2577 = _2573 & 3;
    float _2579 = (*spvDescriptorSet0.vp_c9)._m0[int(_2575)][_2577];
    int _2581 = _2495 & 3;
    bool _2583 = _2581 != 0;
    float _2585 = _2459 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _2587 = !_2525;
    int _2589 = _2587 ? 0 : (-1);
    float _2591 = _2559 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2593 = _2533 != 3;
    float _2595 = _2481 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _2597 = _2583 ? 0 : 1;
    float _2599 = _2585 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2601 = uint(_2533) >= 2u;
    float _2603 = _2595 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2605 = int(_2301) + int(_2373);
    int _2607 = ~_2597;
    int _2609 = _2607 + 1;
    int _2611 = _2609 + 1;
    int _2613 = _2611;
    if (!_2557)
    {
        int _2615 = ~_2597;
        int _2617 = _2615 + 1;
        _2613 = _2617;
    }
    int _2619 = _2613;
    int _2621 = _2601 ? 0 : 1;
    bool _2623 = _2533 != 3;
    int _2625 = _2539 * _2605;
    int _2627 = _2625 + _2215;
    bool _2629 = !_2535;
    int _2631 = _2629 ? 0 : 1;
    int _2633 = ~_2621;
    int _2635 = _2633 + 1;
    int _2637 = _2635 + 1;
    int _2639 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2641 = _2639 != 0;
    int _2643 = _2637;
    if (_2593)
    {
        int _2645 = ~_2621;
        int _2647 = _2645 + 1;
        _2643 = _2647;
    }
    int _2649 = _2643;
    bool _2651 = !_2623;
    int _2653 = _2651 ? 0 : (-1);
    float _2655 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    bool _2657 = uint(_2627) >= uint(_1870);
    int _2659 = _2555 + 8;
    uint _2661 = uint(int(uint(_2659) >> uint(2)));
    uint _2663 = uint(int(uint(int(_2661)) >> uint(2)));
    int _2665 = int(_2661) & 3;
    float _2667 = (*spvDescriptorSet0.vp_c9)._m0[int(_2663)][_2665];
    int _2669 = int(_2661) + 1;
    uint _2671 = uint(int(uint(_2669) >> uint(2)));
    int _2673 = _2669 & 3;
    float _2675 = (*spvDescriptorSet0.vp_c9)._m0[int(_2671)][_2673];
    int _2677 = _2495 >> 31;
    float _2679 = _2655 * _331;
    int _2681 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2683 = _2681 != 0;
    bool _2685 = _331 > 0.5;
    float _2687 = trunc(_2679);
    int _2689 = int(_2687);
    int _2691 = _2677 & 3;
    int _2693 = abs(_2523);
    float _2695 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _2697 = _2495 + _2691;
    float _2699 = _2185 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _2701 = !_2657;
    int _2703 = _2701 ? 0 : (-1);
    float _2705 = _387 + 0.5;
    int _2707 = _2697 >> 2;
    out.m_68.x = _2591;
    out.m_68.y = _2599;
    out.m_68.z = _2603;
    out.m_68.w = _2695;
    int _2709 = ~_2693;
    int _2711 = _2709 + 1;
    int _2713 = _2711 + 1;
    float _2715 = fma(_2699, _2705, _839);
    int _2717 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2719 = _2717 != 0;
    float _2721 = _391 + (-0.5);
    float _2723 = _1087 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2725 = _2713 * as_type<int>(_2579);
    float _2727 = _1103 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2729 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2731 = int(_2729);
    float _2733 = -_1971;
    float _2735 = -_867;
    float _2737 = fma(_2733, _2721, _2735);
    float _2739 = _1087 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2741 = abs(_2589);
    float _2743 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2727);
    int _2745 = ~_2605;
    int _2747 = _2745 + _2703;
    int _2749 = _2747 + 1;
    float _2751 = -_1071;
    float _2753 = fma(_2751, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2739);
    int _2755 = abs(_2551);
    float _2757 = -_1071;
    float _2759 = fma(_2757, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2723);
    int _2761 = _2707 << 4;
    int _2763 = _2761 + 512;
    float _2765 = _1087 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2767 = ~_2755;
    int _2769 = _2767 + 1;
    int _2771 = _2769 + 1;
    float _2773 = _1103 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    uint _2775 = uint(int(uint(_2763) >> uint(2)));
    uint _2777 = uint(int(uint(int(_2775)) >> uint(2)));
    int _2779 = int(_2775) & 3;
    float _2781 = (*spvDescriptorSet0.vp_c9)._m0[int(_2777)][_2779];
    int _2783 = int(_2775) + 1;
    uint _2785 = uint(int(uint(_2783) >> uint(2)));
    int _2787 = _2783 & 3;
    float _2789 = (*spvDescriptorSet0.vp_c9)._m0[int(_2785)][_2787];
    int _2791 = abs(_2619);
    int _2793 = _1870 * _2749;
    int _2795 = _2793 + _2215;
    float _2797 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2773);
    int _2799 = _2771 * as_type<int>(_2571);
    int _2801 = _2799 + _2725;
    int _2803 = abs(_2503);
    float _2805 = _1103 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2807 = float(uint(_2731));
    int _2809 = _2763 + 8;
    uint _2811 = uint(int(uint(_2809) >> uint(2)));
    uint _2813 = uint(int(uint(int(_2811)) >> uint(2)));
    int _2815 = int(_2811) & 3;
    float _2817 = (*spvDescriptorSet0.vp_c9)._m0[int(_2813)][_2815];
    int _2819 = int(_2811) + 1;
    uint _2821 = uint(int(uint(_2819) >> uint(2)));
    int _2823 = _2819 & 3;
    float _2825 = (*spvDescriptorSet0.vp_c9)._m0[int(_2821)][_2823];
    int _2827 = ~_2803;
    int _2829 = _2827 + 1;
    int _2831 = _2829 + 1;
    float _2833 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2805);
    float _2835 = -_1071;
    float _2837 = fma(_2835, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2765);
    int _2839 = abs(_2529);
    int _2841 = _2831 * as_type<int>(_2667);
    int _2843 = _2841 + _2801;
    int _2845 = ~_2741;
    int _2847 = _2845 + 1;
    int _2849 = _2847 + 1;
    float _2851 = _1111 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2853 = ~_2839;
    int _2855 = _2853 + 1;
    int _2857 = _2855 + 1;
    float _2859 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2753);
    int _2861 = abs(_2649);
    int _2863 = _2849 * as_type<int>(_2675);
    int _2865 = _2863 + _2843;
    float _2867 = _1111 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2869 = 1.0 / _2807;
    float _2871 = _1111 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2873 = fma(_1097, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2867);
    float _2875 = fma(_1097, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2851);
    float _2877 = fma(_1097, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2871);
    int _2879 = _2865 * _2857;
    int _2881 = abs(_2631);
    float _2883 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2885 = int(_2883);
    int _2887 = ~_2791;
    int _2889 = _2887 + 1;
    int _2891 = _2889 + 1;
    int _2893 = _2543 * _2839;
    int _2895 = _2893 + _2879;
    int _2897 = ~_2881;
    int _2899 = _2897 + 1;
    int _2901 = _2899 + 1;
    float _2903 = fma(_1123, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2873);
    int _2905 = abs(_2563);
    float _2907 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2759);
    float _2909 = float(uint(_2895));
    float _2911 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2837);
    int _2913 = _2689 << 4;
    int _2915 = _2913 + 1968;
    float _2917 = _209 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _2919 = !_2641;
    float _2921 = _2919 ? _213 : as_type<float>(_1910);
    float _2923 = _213 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2925 = _2915 + 8;
    uint _2927 = uint(int(uint(_2925) >> uint(2)));
    uint _2929 = uint(int(uint(int(_2927)) >> uint(2)));
    int _2931 = int(_2927) & 3;
    float _2933 = (*spvDescriptorSet0.vp_c9)._m0[int(_2929)][_2931];
    float _2935 = -_209;
    int _2937 = _2685 ? as_type<int>(_2935) : as_type<int>(_209);
    float _2939 = float(uint(_2885));
    float _2941 = fma(_2923, _2923, 1.0);
    int _2943 = _2891 * as_type<int>(_2789);
    int _2945 = as_type<int>(_2869) + (-2);
    int _2947 = _2901 * as_type<int>(_2781);
    int _2949 = _2947 + _2943;
    float _2951 = as_type<float>(_2945) * _2909;
    int _2953 = abs(_2653);
    float _2955 = 1.0 / _2939;
    int _2957 = ~_2861;
    int _2959 = _2957 + 1;
    int _2961 = _2959 + 1;
    int _2963 = abs(_2731);
    int _2965 = ~_2953;
    int _2967 = _2965 + 1;
    int _2969 = _2967 + 1;
    int _2971 = _2961 * as_type<int>(_2817);
    int _2973 = _2971 + _2949;
    float _2975 = trunc(_2951);
    float _2977 = precise::max(_2975, 0.0);
    uint _2979 = uint(_2977);
    int _2981 = ~_2905;
    int _2983 = _2981 + 1;
    int _2985 = _2983 + 1;
    int _2987 = _2969 * as_type<int>(_2825);
    int _2989 = _2987 + _2973;
    int _2991 = abs(_2885);
    float _2993 = float(uint(_2963));
    int _2995 = _2989 * _2985;
    bool _2997 = !_2117;
    int _2999 = _2997 ? _2795 : (-1);
    float _3001 = fma(_1123, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2875);
    float _3003 = 1.0 / _2993;
    float _3005 = float(uint(_2991));
    int _3007 = ~_2731;
    int _3009 = _3007 + 1;
    int _3011 = _2999 * _2905;
    int _3013 = _3011 + _2995;
    int _3015 = as_type<int>(_2955) + (-2);
    float _3017 = -_209;
    int _3019 = _1850 ? as_type<int>(_3017) : as_type<int>(_209);
    int _3021 = _3009 * int(_2979);
    int _3023 = _3021 + _2895;
    float _3025 = 1.0 / _3005;
    float _3027 = float(uint(_3013));
    float _3029 = fma(_1123, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2877);
    int _3031 = abs(_2895);
    uint _3033 = uint(int(uint(_2915) >> uint(2)));
    uint _3035 = uint(int(uint(int(_3033)) >> uint(2)));
    int _3037 = int(_3033) & 3;
    float _3039 = (*spvDescriptorSet0.vp_c9)._m0[int(_3035)][_3037];
    int _3041 = int(_3033) + 1;
    uint _3043 = uint(int(uint(_3041) >> uint(2)));
    int _3045 = _3041 & 3;
    float _3047 = (*spvDescriptorSet0.vp_c9)._m0[int(_3043)][_3045];
    float _3049 = float(uint(_3023));
    float _3051 = as_type<float>(_3015) * _3027;
    int _3053 = abs(_3013);
    float _3055 = rsqrt(_2941);
    int _3057 = as_type<int>(_3003) + (-2);
    float _3059 = as_type<float>(_2945) * _3049;
    float _3061 = fma(_1115, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2833);
    float _3063 = fma(_1115, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2797);
    float _3065 = fma(_1115, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2743);
    float _3067 = float(uint(_3031));
    float _3069 = _2923 * _2911;
    float _3071 = trunc(_3051);
    float _3073 = precise::max(_3071, 0.0);
    uint _3075 = uint(_3073);
    int _3077 = as_type<int>(_3025) + (-2);
    float _3079 = as_type<float>(_3057) * _3067;
    float _3081 = float(uint(_3053));
    float _3083 = fma(_2917, _3065, _3069);
    bool _3085 = !_2683;
    float _3087 = _3085 ? _209 : as_type<float>(_3019);
    out.m_70.x = _3061;
    out.m_70.y = _3063;
    out.m_70.z = _3065;
    int _3089 = ~_2885;
    int _3091 = _3089 + 1;
    float _3093 = as_type<float>(_3077) * _3081;
    float _3095 = trunc(_3079);
    float _3097 = precise::max(_3095, 0.0);
    uint _3099 = uint(_3097);
    int _3101 = ~_2963;
    int _3103 = _3101 + 1;
    float _3105 = _2923 * _2859;
    bool _3107 = !_2719;
    float _3109 = _3107 ? _209 : as_type<float>(_2937);
    float _3111 = _2923 * _2907;
    int _3113 = ~_2991;
    int _3115 = _3113 + 1;
    float _3117 = fma(_2917, _3061, _3105);
    int _3119 = _3091 * int(_3075);
    int _3121 = _3119 + _3013;
    float _3123 = trunc(_3093);
    float _3125 = precise::max(_3123, 0.0);
    uint _3127 = uint(_3125);
    float _3129 = fma(_2917, _3063, _3111);
    int _3131 = ~_2963;
    int _3133 = _3131 + 1;
    float _3135 = float(uint(_3121));
    int _3137 = ~_2991;
    int _3139 = _3137 + 1;
    int _3141 = _3103 * int(_3099);
    int _3143 = _3141 + _3031;
    float _3145 = as_type<float>(_3015) * _3135;
    float _3147 = trunc(_3059);
    float _3149 = precise::max(_3147, 0.0);
    uint _3151 = uint(_3149);
    float _3153 = _2923 * _3055;
    float _3155 = float(uint(_3143));
    float _3157 = -_3001;
    float _3159 = _3153 * _3157;
    int _3161 = _3115 * int(_3127);
    int _3163 = _3161 + _3053;
    float _3165 = _3039 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _3167 = as_type<float>(_3057) * _3155;
    float _3169 = fma(_391, _1830, _2737);
    float _3171 = float(uint(_3163));
    float _3173 = _2903 + _3117;
    float _3175 = -_1836;
    float _3177 = fma(_387, _3175, _2715);
    float _3179 = trunc(_3167);
    float _3181 = precise::max(_3179, 0.0);
    uint _3183 = uint(_3181);
    float _3185 = -_2903;
    float _3187 = _3153 * _3185;
    float _3189 = as_type<float>(_3077) * _3171;
    float _3191 = -_3029;
    float _3193 = _3153 * _3191;
    int _3195 = int(_2979) + int(_3151);
    float _3197 = fma(_3055, _2859, _3187);
    float _3199 = _3001 + _3129;
    int _3201 = ~_2731;
    int _3203 = _3201 + 1;
    float _3205 = trunc(_3189);
    float _3207 = precise::max(_3205, 0.0);
    uint _3209 = uint(_3207);
    float _3211 = fma(_3055, _2907, _3159);
    float _3213 = fma(_3055, _2911, _3193);
    float _3215 = _3047 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _3217 = ~_2885;
    int _3219 = _3217 + 1;
    float _3221 = _2933 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _3223 = trunc(_3145);
    float _3225 = precise::max(_3223, 0.0);
    uint _3227 = uint(_3225);
    int _3229 = int(_3099) + int(_3183);
    int _3231 = _3203 * _3195;
    int _3233 = _3231 + _2895;
    float _3235 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _3237 = _3133 * _3229;
    int _3239 = _3237 + _3031;
    bool _3241 = uint(_3233) >= uint(_2731);
    float _3243 = _3165 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _3245 = int(_3127) + int(_3209);
    float _3247 = _3215 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3249 = _3221 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _3251 = uint(_3239) >= uint(_2963);
    float _3253 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _3255 = _3139 * _3245;
    int _3257 = _3255 + _3053;
    bool _3259 = !_3241;
    int _3261 = _3259 ? 0 : (-1);
    out.m_72.x = _3243;
    out.m_72.y = _3247;
    out.m_72.z = _3249;
    out.m_72.w = _3235;
    int _3263 = int(_3075) + int(_3227);
    float _3265 = fma(_1509, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1852);
    bool _3267 = uint(_3257) >= uint(_2991);
    float _3269 = -_861;
    float _3271 = _3269 + 1.0;
    bool _3273 = !_3251;
    int _3275 = _3273 ? 0 : (-1);
    int _3277 = _3219 * _3263;
    int _3279 = _3277 + _3013;
    int _3281 = ~_3195;
    int _3283 = _3281 + _3261;
    int _3285 = _3283 + 1;
    float _3287 = fma(_1689, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3265);
    int _3289 = _2895 ^ _2731;
    float _3291 = _3029 + _3083;
    bool _3293 = uint(_3279) >= uint(_2885);
    int _3295 = _2731 * _3285;
    int _3297 = _3295 + _2895;
    int _3299 = ~_3275;
    int _3301 = _3229 + _3299;
    int _3303 = _3301 + 1;
    float _3305 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    uint _3307 = uint(int(uint(_3289) >> uint(31)));
    out.m_74.x = _3177;
    out.m_74.y = _3169;
    bool _3309 = !_3293;
    int _3311 = _3309 ? 0 : (-1);
    bool _3313 = _2731 == 0;
    out.m_76.x = _3173;
    out.m_76.y = _3199;
    out.m_76.z = _3291;
    int _3315 = ~int(_3307);
    int _3317 = _3315 + 1;
    float _3319 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _3321 = ~_3263;
    int _3323 = _3321 + _3311;
    int _3325 = _3323 + 1;
    out.m_78.x = _3197;
    out.m_78.y = _3211;
    out.m_78.z = _3213;
    int _3327 = _3013 ^ _2885;
    bool _3329 = !_3313;
    int _3331 = _3329 ? _3297 : (-1);
    int _3333 = _2885 * _3325;
    int _3335 = _3333 + _3013;
    bool _3337 = !_3267;
    int _3339 = _3337 ? 0 : (-1);
    float _3341 = _3305 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _3343 = _3303 ^ _3317;
    float _3345 = _3253 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    uint _3347 = uint(int(uint(_3327) >> uint(31)));
    float _3349 = float(_3331);
    bool _3351 = _2885 == 0;
    float _3353 = _3319 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _3355 = _2731 == 0;
    float _3357 = fma(_3341, _3349, _443);
    int _3359 = ~_3317;
    int _3361 = _3359 + _3343;
    int _3363 = _3361 + 1;
    int _3365 = ~_3339;
    int _3367 = _3245 + _3365;
    int _3369 = _3367 + 1;
    int _3371 = ~int(_3347);
    int _3373 = _3371 + 1;
    float _3375 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _3377 = !_3351;
    int _3379 = _3377 ? _3335 : (-1);
    bool _3381 = !_3355;
    int _3383 = _3381 ? _3363 : (-1);
    int _3385 = _3369 ^ _3373;
    float _3387 = float(_3379);
    float _3389 = _3109 + 0.5;
    float _3391 = float(_3383);
    bool _3393 = _2885 == 0;
    float _3395 = fma(_3341, _3389, _3357);
    int _3397 = ~_3373;
    int _3399 = _3397 + _3385;
    int _3401 = _3399 + 1;
    float _3403 = -_845;
    float _3405 = fma(_3353, _3391, _3403);
    float _3407 = fma(_3345, _3387, _849);
    float _3409 = _3087 + 0.5;
    bool _3411 = !_3393;
    int _3413 = _3411 ? _3401 : (-1);
    float _3415 = _3375 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _3417 = _2921 + (-0.5);
    float _3419 = fma(_3345, _3409, _3407);
    float _3421 = float(_3413);
    float _3423 = _1187 + (-0.5);
    float _3425 = -_3353;
    float _3427 = fma(_3425, _3417, _3405);
    float _3429 = -_3271;
    float _3431 = fma(_3087, _3429, _3419);
    float _3433 = _2097 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3435 = -_865;
    float _3437 = fma(_3415, _3421, _3435);
    float _3439 = fma(_1721, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3287);
    float _3441 = _1765 + _1735;
    float _3443 = _1735 * 0.5;
    float _3445 = -_3415;
    float _3447 = fma(_3445, _3423, _3437);
    float _3449 = _3433 * _1797;
    bool _3451 = _1479 > 0.0;
    bool _3453 = isnan(_1479);
    bool _3455 = _3451 || _3453;
    bool _3457 = isnan(0.0);
    bool _3459 = _3455 || _3457;
    float _3461 = _3441 * 0.5;
    float _3463 = fma(_1775, -0.5, _3443);
    float _3465 = fma(_1187, _1856, _3447);
    float _3467 = _3439 + _1735;
    float _3469 = _1479 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3471 = _1808 * _3449;
    float _3473 = _1818 * _3449;
    float _3475 = -_3433;
    float _3477 = _3475 + 1.0;
    float _3479 = -_1860;
    float _3481 = fma(_3109, _3479, _3395);
    out.gl_Position.x = _1765;
    out.gl_Position.y = _1775;
    out.gl_Position.z = _3439;
    out.gl_Position.w = _1735;
    float _3483 = fma(_2921, _1864, _3427);
    float _3485 = _3467 * 0.5;
    float _3487 = _3469 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3489 = fma(_1814, _3471, _1802);
    float _3491 = fma(_1816, _3471, _1804);
    float _3493 = _1808 * _3477;
    float _3495 = fma(_1808, _3473, _1806);
    out.m_80.x = _3461;
    out.m_80.y = _3463;
    out.m_80.z = _3485;
    out.m_80.w = _1735;
    out.m_82.x = _3481;
    out.m_82.y = _3483;
    out.m_82.z = _3431;
    out.m_82.w = _3465;
    out.m_45.x = _3487;
    out.m_84.x = _3489;
    out.m_84.y = _3491;
    out.m_84.z = _3495;
    out.m_84.w = _3493;
    if (_3459)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _3497 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3497;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    bool _321 = false;
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
    if (!_107)
    {
        _109 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _113 = _109;
    float _115 = _113;
    if (!_107)
    {
        out.m_45.x = 0.0;
    }
    int _117 = 0;
    if (!_107)
    {
        float _119 = _113 * 5.0;
        _117 = as_type<int>(_119);
    }
    int _121 = _117;
    int _123 = _121;
    if (!_107)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3556 = as_type<float>(_121);
        out.gl_Position.z = _3556;
    }
    if (!_107)
    {
        return out;
    }
    float _125 = in.m_47.w;
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
        float _145 = float(_103);
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
        out.m_45.x = 0.0;
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
        float _3625 = as_type<float>(_159);
        out.gl_Position.z = _3625;
    }
    if (_153)
    {
        return out;
    }
    float _161 = as_type<float>(int(gl_VertexIndex));
    float _163 = in.m_52.w;
    bool _165 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _167 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _169 = _165 || _167;
    bool _171 = isnan(1.0);
    bool _173 = _169 || _171;
    float _175 = in.m_47.x;
    float _177 = in.m_47.y;
    float _179 = in.m_47.z;
    float _181 = in.m_42.x;
    float _183 = in.m_42.y;
    float _185 = in.m_42.z;
    int _187 = as_type<int>(_161) & 1;
    bool _189 = _187 != 0;
    int _191 = as_type<int>(_161) & 2;
    bool _193 = _191 != 0;
    float _195 = _139 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _197 = 0.0;
    float _199 = _195;
    if (!_173)
    {
        float _201 = _195 * _195;
        float _203 = _201 * 0.5;
        _197 = _203;
    }
    float _205 = _197;
    bool _207 = !_189;
    float _209 = _207 ? (-0.5) : 0.5;
    bool _211 = !_193;
    float _213 = _211 ? (-0.5) : 0.5;
    float _215 = _205;
    if (!_173)
    {
        float _217 = _205 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _215 = _217;
    }
    float _219 = _215;
    bool _221 = !_173;
    float _223 = _219;
    if (!_221)
    {
        float _225 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _227 = log2(_225);
        float _229 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _231 = _229 + 1.0;
        float _233 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _235 = _195 * _227;
        float _237 = 1.0 / _231;
        float _239 = _233 * 0.693147182464599609375;
        float _241 = exp2(_235);
        float _243 = 1.0 / _239;
        float _245 = _241 + (-1.0);
        float _247 = -_245;
        float _249 = fma(_247, _243, _195);
        float _251 = _249 * _237;
        float _253 = _251 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _223 = _253;
    }
    float _255 = _223;
    bool _257 = !_173;
    if (!_257)
    {
        float _259 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _261 = log2(_259);
        float _263 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _265 = _263 + 1.0;
        float _267 = 1.0 / _265;
        float _269 = _195 * _261;
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
    float _289 = fma(_279, _175, _283);
    float _291 = fma(_279, _177, _285);
    float _293 = fma(_279, _179, _287);
    float _295 = fma(_289, _163, _181);
    float _297 = fma(_291, _163, _183);
    float _299 = fma(_293, _163, _185);
    bool _301 = !_281;
    float _319;
    if (!_301)
    {
        float _303 = in.m_54.x;
        float _305 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _307 = _303 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _309 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[12].x, _139);
        float _311 = _309 * _305;
        float _313 = floor(_311);
        float _315 = -_313;
        float _317 = _311 + _315;
        _319 = _317;
        _321 = true;
    }
    else
    {
        float _323 = float(_103);
        float _325 = 1.0 / _323;
        float _327 = _139 * _325;
        _319 = _327;
    }
    _321 = false;
    float _329 = _319;
    float _331 = in.m_54.x;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _335 = _329 + _333;
    float _337 = in.m_54.y;
    float _339 = in.m_54.z;
    float _341 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _343 = _331 * 2.0;
    float _345 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _347 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _349 = _337 > 0.5;
    float _351 = _337 * 2.0;
    float _353 = floor(_343);
    float _355 = _337 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _357 = _339 > 0.5;
    float _359 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _361 = -_209;
    int _363 = _349 ? as_type<int>(_361) : as_type<int>(_209);
    float _365 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _367 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _369 = _367 != 0;
    int _371 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _373 = _371 != 0;
    int _375 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _377 = _375 != 0;
    float _379 = -_213;
    int _381 = _357 ? as_type<int>(_379) : as_type<int>(_213);
    float _383 = floor(_351);
    bool _385 = !_373;
    float _387 = _385 ? _209 : as_type<float>(_363);
    bool _389 = !_377;
    float _391 = _389 ? _213 : as_type<float>(_381);
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _395 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _393;
    int _397 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _399 = _397 != 0;
    int _401 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _403 = _401 != 0;
    int _405 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _407 = _405 != 0;
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _411 = _409 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _413 = _353 > 0.0;
    float _415 = 1.0 / _395;
    int _417 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _419 = _417 != 0;
    float _421 = _331 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _423 = _353 >= 0.0;
    bool _425 = isnan(_353);
    bool _427 = _423 || _425;
    bool _429 = isnan(0.0);
    bool _431 = _427 || _429;
    float _433 = -_341;
    float _435 = fma(_421, 2.0, _433);
    int _437 = _431 ? 0 : 1;
    float _439 = 1.0 / _411;
    float _441 = -_139;
    float _443 = fma(_441, (*spvDescriptorSet0.vp_c9)._m0[76].x, _435);
    int _445 = ~_437;
    int _447 = _445 + 1;
    int _449 = _447 + 1;
    int _451 = _449;
    int _453 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[77].y);
    if (!_413)
    {
        int _455 = ~_437;
        int _457 = _455 + 1;
        _451 = _457;
    }
    int _459 = _451;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _463 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _461;
    float _465 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    if (_419)
    {
        _453 = 0;
    }
    int _467 = _453;
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _471 = _329 + _469;
    bool _473 = _383 >= 0.0;
    bool _475 = isnan(_383);
    bool _477 = _473 || _475;
    bool _479 = isnan(0.0);
    bool _481 = _477 || _479;
    float _483 = 1.0 / _463;
    int _485 = _467;
    if (!_419)
    {
        _485 = 1;
    }
    int _487 = _485;
    float _489 = fma(_355, -2.0, _465);
    bool _491 = _383 > 0.0;
    float _493 = _471 * _439;
    int _495 = _481 ? 0 : 1;
    float _497 = _339 + _337;
    bool _499 = _487 != 1;
    float _501 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _503 = _329 + _501;
    float _505 = _331 + _339;
    int _507 = ~_495;
    int _509 = _507 + 1;
    int _511 = _509 + 1;
    float _513 = _497 + (-1.0);
    bool _515 = !_403;
    int _517 = _515 ? 0 : 1;
    float _519 = _503 * _415;
    bool _521 = !_399;
    int _523 = _521 ? 0 : 1;
    float _525 = _339 * 2.0;
    int _527 = _511;
    int _529 = as_type<int>(_505);
    float _531 = _497;
    if (!_491)
    {
        int _533 = ~_495;
        int _535 = _533 + 1;
        _527 = _535;
    }
    int _537 = _527;
    float _539 = _505 + (-1.0);
    if (_419)
    {
        _529 = 0;
    }
    int _541 = _529;
    float _543 = _335 * _483;
    float _545 = 0.0;
    int _547 = _541;
    if (!_499)
    {
        _545 = _337;
    }
    float _549 = _545;
    float _551 = floor(_525);
    float _553 = _549;
    if (!_419)
    {
        _547 = 2;
    }
    int _555 = _547;
    float _557 = fma(_513, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _559 = !_407;
    int _561 = _559 ? 0 : 1;
    float _563 = _331 + _337;
    float _565 = 0.0;
    float _567 = as_type<float>(_555);
    if (!_499)
    {
        _565 = _549;
    }
    float _569 = _565;
    float _571 = _569;
    if (!_499)
    {
        _531 = _339;
    }
    float _573 = _531;
    float _575 = _563 + (-1.0);
    float _577 = 0.0;
    float _579 = _573;
    if (!_499)
    {
        _577 = _339;
    }
    float _581 = _577;
    float _583 = _581;
    if (_499)
    {
        _571 = _331;
    }
    float _585 = _571;
    float _587 = fma(_575, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    if (_499)
    {
        _553 = _331;
    }
    float _589 = _553;
    float _591 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _593 = int(_591);
    if (_499)
    {
        _579 = _337;
    }
    float _595 = _579;
    float _597 = _585 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_499)
    {
        _583 = _337;
    }
    float _599 = _583;
    float _601 = fma(_589, (*spvDescriptorSet0.vp_c9)._m0[83].z, _365);
    int _603 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _605 = _603 != 0;
    int _607 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _609 = _607 != 0;
    int _611 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _613 = _611 != 0;
    bool _615 = _555 != 2;
    float _617 = fma(_599, (*spvDescriptorSet0.vp_c9)._m0[83].w, _347);
    bool _619 = _551 >= 0.0;
    bool _621 = isnan(_551);
    bool _623 = _619 || _621;
    bool _625 = isnan(0.0);
    bool _627 = _623 || _625;
    bool _629 = !_605;
    int _631 = _629 ? 0 : 1;
    float _633 = fma(_539, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _635 = _627 ? 0 : 1;
    float _637 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _639 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _637;
    bool _641 = _551 > 0.0;
    float _643 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _645 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _643;
    float _647 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _649 = int(_647);
    if (_615)
    {
        _567 = _331;
    }
    float _651 = _567;
    float _653 = fma(_639, _519, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _655 = _651;
    if (!_615)
    {
        _655 = _339;
    }
    float _657 = _655;
    float _659 = fma(_645, _519, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _661 = float(_103);
    float _663 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _665 = _663 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    if (_615)
    {
        _111 = _337;
    }
    float _667 = _111;
    float _669 = _657 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _671 = _667;
    if (!_615)
    {
        _671 = _331;
    }
    float _673 = _671;
    float _675 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _677 = log2(_675);
    bool _679 = !_609;
    int _681 = _679 ? 0 : 1;
    float _683 = -_345;
    float _685 = fma(_669, 2.0, _683);
    int _687 = abs(_631);
    float _689 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _691 = _689 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _693 = float(_459);
    float _695 = _595 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _697 = _673 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _699 = abs(_681);
    float _701 = fma(_665, _493, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _703 = fma(_691, _493, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _705 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _707 = ~_635;
    int _709 = _707 + 1;
    int _711 = _709 + 1;
    float _713 = _677 * _139;
    float _715 = fma(_695, -2.0, _359);
    int _717 = _711;
    if (!_641)
    {
        int _719 = ~_635;
        int _721 = _719 + 1;
        _717 = _721;
    }
    int _723 = _717;
    float _725 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _727 = 1.0 + _725;
    float _729 = float(_593);
    float _731 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _733 = exp2(_713);
    float _735 = float(_699);
    float _737 = fma(_697, -2.0, _705);
    float _739 = float(_649);
    float _741 = -_731;
    float _743 = fma(_597, 2.0, _741);
    float _745 = in.m_56.x;
    float _747 = in.m_56.y;
    float _749 = in.m_56.z;
    float _751 = float(_723);
    float _753 = 1.0 / _661;
    float _755 = float(_687);
    float _757 = _735 * _693;
    float _759 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _761 = _755 * _751;
    float _763 = 1.0 / _729;
    bool _765 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _767 = isnan(1.0);
    bool _769 = _765 || _767;
    bool _771 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _773 = _769 || _771;
    float _775 = fma(_337, (*spvDescriptorSet0.vp_c9)._m0[78].w, _759);
    float _777 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _779 = -_733;
    float _781 = _779 + 1.0;
    bool _783 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _785 = isnan(0.0);
    bool _787 = _783 || _785;
    bool _789 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _791 = _787 || _789;
    float _793 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _795 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _797 = 1.0 / _739;
    bool _799 = _329 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _801 = isnan(_329);
    bool _803 = _799 || _801;
    bool _805 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _807 = _803 || _805;
    float _809 = float(_807);
    float _811 = fma(_331, (*spvDescriptorSet0.vp_c9)._m0[78].z, _777);
    float _813 = fma(_331, (*spvDescriptorSet0.vp_c9)._m0[88].z, _793);
    float _815 = fma(_337, (*spvDescriptorSet0.vp_c9)._m0[88].w, _795);
    float _817 = _791 ? _781 : 0.0;
    float _819 = -_809;
    float _821 = _819 + 1.0;
    bool _823 = _329 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _825 = isnan(_329);
    bool _827 = _823 || _825;
    bool _829 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _831 = _827 || _829;
    float _833 = float(_831);
    float _835 = 1.0 / _727;
    float _837 = -_139;
    float _839 = fma(_837, (*spvDescriptorSet0.vp_c9)._m0[86].x, _685);
    float _841 = _753 * _139;
    float _843 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[77].z, _811);
    float _845 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[76].y, _489);
    float _847 = -_139;
    float _849 = fma(_847, (*spvDescriptorSet0.vp_c9)._m0[81].x, _743);
    float _851 = _763 * _139;
    float _853 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[77].w, _775);
    float _855 = _797 * _139;
    float _857 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[87].z, _813);
    float _859 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[87].w, _815);
    float _861 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[82].z, _601);
    float _863 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[82].w, _617);
    float _865 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[81].y, _715);
    float _867 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[86].y, _737);
    float _869 = _833 * _821;
    float _871 = _855;
    if (_773)
    {
        float _873 = _817 * _835;
        _143 = _873;
    }
    float _875 = _143;
    float _877 = -_833;
    float _879 = _877 + 1.0;
    bool _881 = !_613;
    int _883 = _881 ? 0 : 1;
    float _885 = _761 * (-2.0);
    bool _887 = _329 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _889 = isnan(_329);
    bool _891 = _887 || _889;
    bool _893 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _895 = _891 || _893;
    float _897 = float(_895);
    float _899 = _757 * (-2.0);
    int _901 = abs(_883);
    float _903 = fma(_885, _745, _745);
    float _905 = _331 + (-0.5);
    float _907 = fma(_587, _885, _587);
    float _909 = _897 * _879;
    float _911 = fma(_905, (*spvDescriptorSet0.vp_c9)._m0[196].x, _903);
    bool _913 = _329 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _915 = isnan(_329);
    bool _917 = _913 || _915;
    bool _919 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _921 = _917 || _919;
    float _923 = float(_921);
    float _925 = -_897;
    float _927 = _925 + 1.0;
    float _929 = float(_537);
    float _931 = fma(_907, _875, _911);
    float _933 = float(_901);
    float _935 = _337 + (-0.5);
    float _937 = fma(_899, _747, _747);
    float _939 = _923 * _927;
    float _941 = fma(_557, _899, _557);
    float _943 = _933 * _929;
    float _945 = fma(_935, (*spvDescriptorSet0.vp_c9)._m0[196].y, _937);
    float _947 = _659 * _939;
    float _949 = -_923;
    float _951 = _949 + 1.0;
    float _953 = _653 * _939;
    float _955 = _943 * (-2.0);
    float _957 = fma(_941, _875, _945);
    float _959 = _931 * 0.15915493667125701904296875;
    float _961 = fma(_951, (*spvDescriptorSet0.vp_c9)._m0[143].x, _947);
    float _963 = fma(_951, (*spvDescriptorSet0.vp_c9)._m0[143].y, _953);
    float _965 = fma(_633, _955, _633);
    float _967 = _957 * 0.15915493667125701904296875;
    float _969 = fma(_955, _749, _749);
    float _971 = in.m_52.x;
    float _973 = in.m_52.y;
    float _975 = _339 + (-0.5);
    float _977 = _959 * 6.283185482025146484375;
    float _979 = sin(_977);
    float _981 = in.m_58.x;
    float _983 = in.m_58.y;
    float _985 = in.m_58.z;
    float _987 = fma(_975, (*spvDescriptorSet0.vp_c9)._m0[196].z, _969);
    float _989 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _991 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _989;
    float _993 = fma(_701, _909, _961);
    float _995 = in.m_60.x;
    float _997 = in.m_60.y;
    float _999 = in.m_60.z;
    float _1001 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1003 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _1001;
    float _1005 = fma(_965, _875, _987);
    float _1007 = _959 * 6.283185482025146484375;
    float _1009 = cos(_1007);
    float _1011 = fma(_703, _909, _963);
    float _1013 = in.m_62.x;
    float _1015 = in.m_62.y;
    float _1017 = in.m_62.z;
    float _1019 = _1005 * 0.15915493667125701904296875;
    float _1021 = _967 * 6.283185482025146484375;
    float _1023 = sin(_1021);
    float _1025 = fma(_991, _543, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _1027 = fma(_1003, _543, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _1029 = fma(_1025, _869, _993);
    float _1031 = fma(_1027, _869, _1011);
    float _1033 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _213);
    float _1035 = _967 * 6.283185482025146484375;
    float _1037 = cos(_1035);
    float _1039 = fma(_809, (*spvDescriptorSet0.vp_c9)._m0[146].x, _1029);
    float _1041 = fma(_809, (*spvDescriptorSet0.vp_c9)._m0[146].y, _1031);
    float _1043 = _297 * _983;
    float _1045 = _1039 * _971;
    float _1047 = _1041 * _973;
    float _1049 = _297 * _997;
    float _1051 = _1019 * 6.283185482025146484375;
    float _1053 = cos(_1051);
    float _1055 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _209);
    float _1057 = _1047 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1059 = fma(_295, _981, _1043);
    float _1061 = _1045 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1063 = _979 * _1023;
    float _1065 = _1057 * _1033;
    float _1067 = _297 * _1015;
    float _1069 = _1019 * 6.283185482025146484375;
    float _1071 = sin(_1069);
    float _1073 = _1009 * _1037;
    float _1075 = _1061 * _1055;
    float _1077 = _979 * _1037;
    float _1079 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1081 = fma(_295, _1013, _1067);
    float _1083 = in.m_54.w;
    float _1085 = fma(_299, _985, _1059);
    float _1087 = _1009 * _1053;
    float _1089 = _1009 * _1023;
    float _1091 = _979 * _1053;
    float _1093 = _1037 * _1053;
    float _1095 = _1087 * _1065;
    float _1097 = _1023 * _1053;
    float _1099 = fma(_299, _1017, _1081);
    float _1101 = fma(_295, _995, _1049);
    float _1103 = fma(_1071, _1073, _1063);
    float _1105 = -_1065;
    float _1107 = _1071 * _1105;
    float _1109 = -_1077;
    float _1111 = fma(_1071, _1089, _1109);
    float _1113 = -_1089;
    float _1115 = fma(_1071, _1077, _1113);
    float _1117 = fma(_1103, _1075, _1095);
    float _1119 = _1091 * _1065;
    float _1121 = fma(_1093, _1075, _1107);
    float _1123 = fma(_1071, _1063, _1073);
    float _1125 = fma(_1111, _1079, _1117);
    float _1127 = fma(_1115, _1075, _1119);
    float _1129 = fma(_1097, _1079, _1121);
    float _1131 = _1099 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1133 = _1125 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1135 = fma(_1123, _1079, _1127);
    float _1137 = _1125 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1139 = _1085 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1141 = fma(_1129, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1133);
    float _1143 = fma(_299, _999, _1101);
    float _1145 = fma(_1129, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1137);
    bool _1147 = _1083 > 0.5;
    float _1149 = fma(_1135, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1141);
    float _1151 = _1143 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1153 = fma(_1135, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1145);
    float _1155 = _1125 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1157 = _1149 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1159 = _1151 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1161 = _1153 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1163 = fma(_1129, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1155);
    float _1165 = _1131 + _1157;
    float _1167 = fma(_1139, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1159);
    float _1169 = _1139 + _1161;
    float _1171 = -_213;
    int _1173 = _1147 ? as_type<int>(_1171) : as_type<int>(_213);
    float _1175 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1177 = _1165 + _1175;
    float _1179 = fma(_1131, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1167);
    float _1181 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1183 = _1169 + _1181;
    bool _1185 = !_369;
    float _1187 = _1185 ? _213 : as_type<float>(_1173);
    float _1189 = _1177 * _1177;
    int _1191 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1193 = _1191 != 0;
    int _1195 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1197 = _1195 != 0;
    int _1199 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1201 = _1199 != 0;
    int _1203 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1205 = _1203 != 0;
    float _1207 = _1179 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1209 = fma(_1135, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1163);
    float _1211 = fma(_1183, _1183, _1189);
    float _1213 = _1151 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1215 = 1.0 / _1207;
    bool _1217 = !_1197;
    int _1219 = _1217 ? 0 : 1;
    float _1221 = _1209 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1223 = fma(_1139, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1213);
    bool _1225 = !_1193;
    int _1227 = _1225 ? 0 : 1;
    float _1229 = _1151 + _1221;
    float _1231 = fma(_1131, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1223);
    float _1233 = sqrt(_1211);
    bool _1235 = !_1201;
    int _1237 = _1235 ? 0 : 1;
    float _1239 = _1231 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1241 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1243 = isnan(0.5);
    bool _1245 = _1241 || _1243;
    bool _1247 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1249 = _1245 || _1247;
    bool _1251 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1253 = isnan(0.5);
    bool _1255 = _1251 || _1253;
    bool _1257 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1259 = _1255 || _1257;
    float _1261 = _1239 + _1207;
    bool _1263 = !_1205;
    int _1265 = _1263 ? 0 : 1;
    float _1267 = _1261 * _1215;
    float _1269 = _1267 * 0.5;
    bool _1271 = _1233 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1273 = _1209;
    float _1275 = _1221;
    float _1277 = _1165;
    float _1279 = _1211;
    float _1281 = _1207;
    float _1283 = _1177;
    float _1285 = _1157;
    if (!_1271)
    {
        _1273 = _1169;
    }
    float _1287 = _1273;
    float _1289 = _1287;
    if (!_1271)
    {
        _1275 = _1229;
    }
    float _1291 = _1275;
    bool _1293 = !_1271;
    float _1295 = _1291;
    if (!_1293)
    {
        float _1297 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1299 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1301 = _1233 + _1299;
        float _1303 = _1229 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1305 = rsqrt(_1211);
        float _1307 = _1301 * _1297;
        float _1309 = _1307 * 0.15915493667125701904296875;
        float _1311 = _1309 * 6.283185482025146484375;
        float _1313 = sin(_1311);
        float _1315 = _1309 * 6.283185482025146484375;
        float _1317 = cos(_1315);
        float _1319 = fma(_1313, _1303, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1321 = _1305 * _1319;
        float _1323 = _1317 + (-1.0);
        float _1325 = fma(_1183, _1321, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1327 = fma(_1177, _1321, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1329 = _1323 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1331 = fma(_1229, _1317, _1329);
        _1277 = _1327;
        _1279 = _1305;
        _1289 = _1325;
        _1295 = _1331;
    }
    float _1333 = _1277;
    float _1335 = _1279;
    float _1337 = _1289;
    float _1339 = _1295;
    float _1341 = _1339;
    float _1343 = _1337;
    float _1345 = _1335;
    if (_1259)
    {
        _1281 = 1.0;
    }
    float _1347 = _1281;
    float _1349 = _1347;
    if (_1249)
    {
        _1283 = _1333;
    }
    float _1351 = _1283;
    float _1353 = _1351;
    if (!_1249)
    {
        float _1355 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1357 = _1151 + _1355;
        float _1359 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1361 = _1139 + _1359;
        float _1363 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1365 = -_1139;
        float _1367 = _1365 + _1337;
        float _1369 = _1357 * _1357;
        float _1371 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1373 = _1131 + _1371;
        float _1375 = -_1151;
        float _1377 = _1375 + _1339;
        float _1379 = fma(_1361, _1361, _1369);
        float _1381 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1383 = fma(_1373, _1373, _1379);
        float _1385 = sqrt(_1383);
        float _1387 = _1363 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1389 = precise::min(_1385, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1391 = _1389 * _1381;
        float _1393 = _1387 * _1391;
        float _1395 = -_1131;
        float _1397 = _1395 + _1333;
        float _1399 = fma(_1367, _1393, _1139);
        float _1401 = fma(_1377, _1393, _1151);
        float _1403 = fma(_1397, _1393, _1131);
        _1341 = _1401;
        _1343 = _1399;
        _1353 = _1403;
        _1345 = _1363;
    }
    float _1405 = _1341;
    float _1407 = _1343;
    float _1409 = _1353;
    float _1411 = _1345;
    float _1413 = _1411;
    if (!_1259)
    {
        float _1415 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1417 = _1415 * 0.15915493667125701904296875;
        float _1419 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1421 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1423 = fma(_1269, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1421);
        float _1425 = _1417 * 6.283185482025146484375;
        float _1427 = cos(_1425);
        float _1429 = _1419 * 0.15915493667125701904296875;
        float _1431 = _1417 * 6.283185482025146484375;
        float _1433 = sin(_1431);
        float _1435 = 1.0 / _1427;
        float _1437 = _1429 * 6.283185482025146484375;
        float _1439 = cos(_1437);
        float _1441 = _1433 * _1435;
        float _1443 = _1429 * 6.283185482025146484375;
        float _1445 = sin(_1443);
        float _1447 = _1439 * _1441;
        float _1449 = 1.0 / _1423;
        float _1451 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1453 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1451;
        float _1455 = 1.0 / _1447;
        float _1457 = 1.0 / _1453;
        float _1459 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1461 = _1449 * _1459;
        float _1463 = _1445 * _1455;
        float _1465 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1467 = fma(_1463, _1461, _1465);
        float _1469 = _1467 * _1457;
        float _1471 = precise::clamp(_1469, 0.0, 1.0);
        float _1473 = -_1471;
        float _1475 = _1473 + 1.0;
        _1413 = _1429;
        _1349 = _1475;
    }
    float _1477 = _1413;
    float _1479 = _1349;
    float _1481 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1483 = _1405 + _1481;
    float _1485 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1487 = _1407 + _1485;
    float _1489 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1491 = _1409 + _1489;
    float _1493 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1495 = _1483 * _1483;
    float _1497 = _1405 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1499 = fma(_1487, _1487, _1495);
    float _1501 = fma(_1407, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1497);
    float _1503 = fma(_1491, _1491, _1499);
    float _1505 = fma(_1409, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1501);
    float _1507 = rsqrt(_1503);
    float _1509 = _1505 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1511 = sqrt(_1503);
    float _1513 = _1507 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1515 = _1487 * _1513;
    float _1517 = _1491 * _1513;
    float _1519 = _1515 * _1515;
    float _1521 = _1517 * _1517;
    float _1523 = _1519 + _1521;
    float _1525 = sqrt(_1523);
    bool _1527 = _1525 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1529 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1531 = _1525 + _1529;
    float _1533 = _1507;
    float _1535 = _1523;
    float _1537 = _1531;
    float _1539 = _1477;
    float _1541 = _1483;
    if (_1527)
    {
        float _1543 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1533 = _1543;
    }
    float _1545 = _1533;
    if (_1527)
    {
        float _1547 = rsqrt(_1523);
        _1535 = _1547;
    }
    float _1549 = _1535;
    float _1551 = _1549;
    if (_1527)
    {
        float _1553 = _1531 * _1545;
        _1537 = _1553;
    }
    float _1555 = _1537;
    if (_1527)
    {
        float _1557 = _1555 * 0.15915493667125701904296875;
        _1539 = _1557;
    }
    float _1559 = _1539;
    float _1561 = _1491;
    float _1563 = _1559;
    if (_1527)
    {
        float _1565 = _1559 * 6.283185482025146484375;
        float _1567 = sin(_1565);
        _1561 = _1567;
    }
    float _1569 = _1561;
    float _1571 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1573 = precise::max(0.0, _1571);
    float _1575 = _1545;
    float _1577 = _1573;
    if (_1527)
    {
        float _1579 = _1559 * 6.283185482025146484375;
        float _1581 = cos(_1579);
        _1575 = _1581;
    }
    float _1583 = _1575;
    float _1585 = -_1513;
    float _1587 = -_1573;
    float _1589 = fma(_1483, _1585, _1587);
    if (_1527)
    {
        float _1591 = _1589 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1541 = _1591;
    }
    float _1593 = _1541;
    float _1595 = _1593;
    float _1597 = _1569;
    if (_1527)
    {
        float _1599 = fma(_1569, _1593, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1595 = _1599;
    }
    float _1601 = _1595;
    float _1603 = _1601;
    if (!_1527)
    {
        _1597 = _1515;
    }
    float _1605 = _1597;
    float _1607 = _1605;
    float _1609 = _1583;
    if (_1527)
    {
        float _1611 = _1583 + (-1.0);
        _1577 = _1611;
    }
    float _1613 = _1577;
    float _1615 = _1613;
    if (_1527)
    {
        float _1617 = _1549 * _1601;
        _1285 = _1617;
    }
    float _1619 = _1285;
    if (!_1527)
    {
        _1603 = _1589;
    }
    float _1621 = _1603;
    float _1623 = _1621;
    if (_1527)
    {
        float _1625 = _1613 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1563 = _1625;
    }
    float _1627 = _1563;
    if (_1527)
    {
        float _1629 = _1515 * _1619;
        _1607 = _1629;
    }
    float _1631 = _1607;
    if (!_1527)
    {
        _1615 = _1517;
    }
    float _1633 = _1615;
    float _1635 = _1633;
    if (_1527)
    {
        float _1637 = _1517 * _1619;
        _1635 = _1637;
    }
    float _1639 = _1635;
    if (!_1527)
    {
        _1551 = _1519;
    }
    float _1641 = _1551;
    float _1643 = _1641;
    if (_1527)
    {
        float _1645 = fma(_1589, _1583, _1627);
        _1623 = _1645;
    }
    float _1647 = _1623;
    if (_1527)
    {
        float _1649 = _1631 * _1631;
        _1643 = _1649;
    }
    float _1651 = _1643;
    if (!_1527)
    {
        _1609 = _1521;
    }
    float _1653 = _1609;
    float _1655 = _1653;
    if (_1527)
    {
        float _1657 = _1639 * _1639;
        _1655 = _1657;
    }
    float _1659 = _1655;
    float _1661 = fma(_1647, _1647, _1651);
    float _1663 = _1405 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1665 = _1661 + _1659;
    float _1667 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1669 = fma(_1511, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1667);
    float _1671 = precise::clamp(_1669, 0.0, 1.0);
    float _1673 = fma(_1407, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1663);
    float _1675 = _1405 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1677 = -_1671;
    float _1679 = _1677 + 1.0;
    float _1681 = rsqrt(_1665);
    float _1683 = fma(_1407, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1675);
    float _1685 = fma(_1409, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1673);
    float _1687 = fma(_1409, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1683);
    float _1689 = _1685 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1691 = _1405 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1693 = abs(_1679);
    float _1695 = log2(_1693);
    float _1697 = _1687 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1699 = _1689 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1701 = fma(_1407, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1691);
    float _1703 = _1697 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1705 = -_1699;
    float _1707 = fma(_1705, _1493, 1.0);
    float _1709 = fma(_1409, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1701);
    float _1711 = _1681 * _1631;
    float _1713 = _1681 * _1647;
    float _1715 = _1681 * _1639;
    float _1717 = fma(_1509, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1703);
    float _1719 = _1711 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1721 = _1709 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1723 = log2(_1707);
    float _1725 = fma(_1689, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1717);
    float _1727 = -_1719;
    float _1729 = fma(_1713, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1727);
    float _1731 = _1695 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1733 = _1697 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1735 = fma(_1721, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1725);
    float _1737 = -_1715;
    float _1739 = fma(_1737, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1729);
    float _1741 = _1697 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1743 = fma(_1509, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1733);
    float _1745 = exp2(_1731);
    float _1747 = fma(_1739, -0.5, 0.5);
    float _1749 = fma(_1739, 0.5, 0.5);
    float _1751 = fma(_1509, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1741);
    float _1753 = _1713 + 1.0;
    float _1755 = fma(_1689, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1743);
    float _1757 = fma(_1749, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1759 = fma(_1689, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1751);
    float _1761 = 1.0 / _1735;
    float _1763 = fma(_1749, _1757, -0.212114393711090087890625);
    float _1765 = fma(_1721, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1759);
    float _1767 = fma(_1749, _1763, 1.570728778839111328125);
    float _1769 = sqrt(_1747);
    float _1771 = -_1713;
    float _1773 = fma(_1745, _1753, _1771);
    float _1775 = fma(_1721, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1755);
    float _1777 = _1723 * 0.693147182464599609375;
    float _1779 = _1777 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1781 = _1765 * _1761;
    float _1783 = _1775 * _1761;
    float _1785 = fma(_1781, 0.5, 0.5);
    float _1787 = fma(_1783, -0.5, 0.5);
    float _1789 = _1769 * 0.636619746685028076171875;
    float _1791 = fma(_1773, 0.5, 0.5);
    float _1793 = -_1767;
    float _1795 = fma(_1789, _1793, 1.0);
    float3 _6175 = float3(_1785, _1787, _1779);
    float _1797 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6175, float3(0.0), isnan(_6175)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6175, float3(0.0), isnan(_6175)), level(0.0)).x;
    float3 _6186 = float3(_1785, _1787, _1779);
    float4 _1800 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6186, float3(0.0), isnan(_6186)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6186, float3(0.0), isnan(_6186)), level(0.0)).xyzw;
    float _1802 = _1800.x;
    float _1804 = _1800.y;
    float _1806 = _1800.z;
    float _1808 = _1800.w;
    float2 _6203 = float2(_1795, _1791);
    float3 _1812 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6203, float2(0.0), isnan(_6203)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6203, float2(0.0), isnan(_6203)), level(0.0)).xyz;
    float _1814 = _1812.x;
    float _1816 = _1812.y;
    float _1818 = _1812.z;
    float _1820 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1822 = int(_1820);
    int _1824 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1826 = _1824 != 0;
    float _1828 = -_859;
    float _1830 = _1828 + 1.0;
    int _1832 = abs(_1219);
    float _1834 = -_857;
    float _1836 = _1834 + 1.0;
    int _1838 = abs(_1237);
    out.m_64.x = _1407;
    out.m_64.y = _1405;
    out.m_64.z = _1409;
    int _1840 = abs(_1265);
    float _1842 = trunc(_851);
    int _1844 = int(_1842);
    bool _1846 = _337 > 0.5;
    float _1848 = _1695 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1850 = _339 > 0.5;
    float _1852 = _1697 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1854 = -_863;
    float _1856 = _1854 + 1.0;
    float _1858 = -_843;
    float _1860 = _1858 + 1.0;
    float _1862 = -_853;
    float _1864 = _1862 + 1.0;
    float _1866 = float(uint(_1822));
    float _1868 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1870 = int(_1868);
    int _1872 = ~_1822;
    int _1874 = _1872 + 1;
    bool _1876 = _1822 == 0;
    float _1878 = float(uint(_1844));
    float _1880 = 1.0 / _1866;
    float _1882 = float(uint(_1870));
    float _1884 = trunc(_855);
    int _1886 = int(_1884);
    int _1888 = ~_1822;
    int _1890 = _1888 + 1;
    int _1892 = ~_1870;
    int _1894 = _1892 + 1;
    int _1896 = as_type<int>(_1880) + (-2);
    float _1898 = 1.0 / _1882;
    if (_1826)
    {
        _871 = _331;
    }
    float _1900 = _871;
    float _1902 = _1900;
    if (!_1826)
    {
        _1902 = _337;
    }
    float _1904 = _1902;
    float _1906 = as_type<float>(_1896) * _1878;
    float _1908 = -_213;
    int _1910 = _1846 ? as_type<int>(_1908) : as_type<int>(_213);
    float _1912 = trunc(_1906);
    float _1914 = precise::max(_1912, 0.0);
    uint _1917 = uint(_1914);
    float _1919 = float(uint(_1886));
    int _1921 = as_type<int>(_1898) + (-2);
    float _1923 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1925 = _1906;
    if (_1826)
    {
        _1925 = 1.0;
    }
    float _1927 = _1925;
    float _1929 = _1927;
    if (!_1826)
    {
        _1929 = 1.2345600128173828125;
    }
    float _1931 = _1929;
    float _1933 = as_type<float>(_1921) * _1919;
    int _1935 = ~_1870;
    int _1937 = _1935 + 1;
    int _1939 = _1890 * int(_1917);
    int _1941 = _1939 + _1844;
    float _1943 = _1931 * _1904;
    float _1945 = float(_1844);
    float _1947 = trunc(_1933);
    float _1949 = precise::max(_1947, 0.0);
    uint _1951 = uint(_1949);
    float _1953 = float(uint(_1941));
    float _1955 = as_type<float>(_1941);
    if (_1826)
    {
        _1955 = 1.0;
    }
    float _1957 = _1955;
    float _1959 = _1957;
    if (!_1826)
    {
        _1959 = 7.345489978790283203125;
    }
    float _1961 = _1959;
    float _1963 = as_type<float>(_1896) * _1953;
    float _1965 = floor(_1943);
    int _1967 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1969 = _1967 != 0;
    float _1971 = _1923 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1973 = _1961 * _331;
    float _1975 = trunc(_1963);
    float _1977 = precise::max(_1975, 0.0);
    uint _1979 = uint(_1977);
    int _1981 = _1937 * int(_1951);
    int _1983 = _1981 + _1886;
    float _1985 = float(uint(_1983));
    float _1987 = floor(_1973);
    float _1989 = as_type<float>(_1921) * _1985;
    int _1991 = int(_1917) + int(_1979);
    float _1993 = trunc(_1989);
    float _1995 = precise::max(_1993, 0.0);
    uint _1997 = uint(_1995);
    float _1999 = float(_1822);
    int _2001 = _1874 * _1991;
    int _2003 = _2001 + _1844;
    bool _2005 = _1945 >= _1999;
    bool _2007 = isnan(_1945);
    bool _2009 = _2005 || _2007;
    bool _2011 = isnan(_1999);
    bool _2013 = _2009 || _2011;
    float _2015 = float(_2013);
    float _2017 = -_1987;
    float _2019 = _1973 + _2017;
    float _2021 = -_1965;
    float _2023 = _1943 + _2021;
    bool _2025 = uint(_2003) >= uint(_1822);
    float _2027 = exp2(_1848);
    float _2029 = float(_1870);
    bool _2031 = !_2025;
    int _2033 = _2031 ? 0 : (-1);
    int _2035 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2037 = _2035 != 0;
    int _2039 = ~_1991;
    int _2041 = _2039 + _2033;
    int _2043 = _2041 + 1;
    float _2045 = trunc(_2015);
    int _2047 = int(_2045);
    int _2049 = int(_1951) + int(_1997);
    float _2051 = _2019 * _1999;
    float _2053 = float(_1886);
    int _2055 = _1822 * _2043;
    int _2057 = _2055 + _1844;
    int _2059 = _1822 + (-1);
    int _2061 = _1894 * _2049;
    int _2063 = _2061 + _1886;
    bool _2065 = _2053 >= _2029;
    bool _2067 = isnan(_2053);
    bool _2069 = _2065 || _2067;
    bool _2071 = isnan(_2029);
    bool _2073 = _2069 || _2071;
    float _2075 = float(_2073);
    float _2077 = _1999 * _841;
    bool _2079 = !_1876;
    int _2081 = _2079 ? _2057 : (-1);
    float _2083 = trunc(_2051);
    int _2085 = int(_2083);
    bool _2087 = !_2037;
    int _2089 = _2087 ? 0 : 1;
    float _2091 = _2029 * _841;
    bool _2093 = uint(_2063) >= uint(_1870);
    float _2095 = -_2027;
    float _2097 = _2095 + 1.0;
    int _2099 = abs(_2089);
    int _2101 = ~_2047;
    int _2103 = _2101 + 1;
    int _2105 = _2103 + 1;
    float _2107 = trunc(_2075);
    int _2109 = int(_2107);
    int _2111 = _2081 * _2105;
    bool _2113 = !_2093;
    int _2115 = _2113 ? 0 : (-1);
    bool _2117 = _1870 == 0;
    int _2119 = _2047 * _2059;
    int _2121 = _2119 + _2111;
    int _2123 = abs(_517);
    float _2125 = trunc(_2091);
    int _2127 = int(_2125);
    int _2129 = ~_2049;
    int _2131 = _2129 + _2115;
    int _2133 = _2131 + 1;
    int _2135 = _1870 * _2133;
    int _2137 = _2135 + _1886;
    float _2139 = _2023 * _2029;
    float _2141 = trunc(_2077);
    int _2143 = int(_2141);
    int _2145 = _2085 * _2099;
    int _2147 = _2145 + _1844;
    int _2149 = abs(_561);
    int _2151 = _2121 * _2123;
    int _2153 = ~_2109;
    int _2155 = _2153 + 1;
    int _2157 = _2155 + 1;
    bool _2159 = !_2117;
    int _2161 = _2159 ? _2137 : (-1);
    float _2163 = trunc(_2139);
    int _2165 = int(_2163);
    int _2167 = abs(_523);
    bool _2169 = !_1969;
    int _2171 = _2169 ? 0 : 1;
    int _2173 = _2161 * _2157;
    int _2175 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2177 = _2175 != 0;
    int _2179 = _2143 * _2167;
    int _2181 = _2179 + _2151;
    int _2183 = abs(_2171);
    float _2185 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _2187 = !_2177;
    int _2189 = _2187 ? 0 : 1;
    int _2191 = _2147 * _2149;
    int _2193 = _2191 + _2181;
    int _2195 = _1870 + (-1);
    int _2197 = abs(_2189);
    int _2199 = _2085 * _2183;
    int _2201 = _2199 + _2193;
    int _2203 = abs(_1227);
    int _2205 = _2109 * _2195;
    int _2207 = _2205 + _2173;
    float _2209 = float(uint(_2201));
    int _2211 = _2207 * _1832;
    int _2213 = _2165 * _2197;
    int _2215 = _2213 + _1886;
    float _2217 = float(uint(_2147));
    float _2219 = as_type<float>(_1896) * _2209;
    int _2221 = ~_1822;
    int _2223 = _2221 + 1;
    int _2225 = _2127 * _2203;
    int _2227 = _2225 + _2211;
    int _2229 = ~_1870;
    int _2231 = _2229 + 1;
    float _2233 = trunc(_2219);
    float _2235 = precise::max(_2233, 0.0);
    uint _2237 = uint(_2235);
    int _2239 = ~_1870;
    int _2241 = _2239 + 1;
    int _2243 = _2215 * _1838;
    int _2245 = _2243 + _2227;
    int _2247 = ~_1822;
    int _2249 = _2247 + 1;
    int _2251 = _2165 * _1840;
    int _2253 = _2251 + _2245;
    float _2255 = as_type<float>(_1896) * _2217;
    float _2257 = float(uint(_2253));
    int _2259 = _2223 * int(_2237);
    int _2261 = _2259 + _2201;
    float _2263 = trunc(_2255);
    float _2265 = precise::max(_2263, 0.0);
    uint _2267 = uint(_2265);
    float _2269 = as_type<float>(_1921) * _2257;
    float _2271 = float(uint(_2215));
    float _2273 = float(uint(_2261));
    float _2275 = as_type<float>(_1921) * _2271;
    float _2277 = trunc(_2269);
    float _2279 = precise::max(_2277, 0.0);
    uint _2281 = uint(_2279);
    float _2283 = as_type<float>(_1896) * _2273;
    float _2285 = trunc(_2283);
    float _2287 = precise::max(_2285, 0.0);
    uint _2289 = uint(_2287);
    int _2291 = _2249 * int(_2267);
    int _2293 = _2291 + _2147;
    float _2295 = float(uint(_2293));
    float _2297 = trunc(_2275);
    float _2299 = precise::max(_2297, 0.0);
    uint _2301 = uint(_2299);
    int _2303 = _2231 * int(_2281);
    int _2305 = _2303 + _2253;
    float _2307 = as_type<float>(_1896) * _2295;
    int _2309 = ~_1822;
    int _2311 = _2309 + 1;
    float _2313 = float(uint(_2305));
    float _2315 = trunc(_2307);
    float _2317 = precise::max(_2315, 0.0);
    uint _2319 = uint(_2317);
    int _2321 = int(_2237) + int(_2289);
    float _2323 = as_type<float>(_1921) * _2313;
    int _2325 = _2241 * int(_2301);
    int _2327 = _2325 + _2215;
    float _2329 = trunc(_2323);
    float _2331 = precise::max(_2329, 0.0);
    uint _2333 = uint(_2331);
    int _2335 = _2311 * _2321;
    int _2337 = _2335 + _2201;
    float _2339 = float(uint(_2327));
    bool _2341 = uint(_2337) >= uint(_1822);
    float _2343 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _2345 = as_type<float>(_1921) * _2339;
    bool _2347 = !_2341;
    int _2349 = _2347 ? 0 : (-1);
    int _2351 = ~_1822;
    int _2353 = _2351 + 1;
    float _2355 = _2343 * _331;
    int _2357 = int(_2267) + int(_2319);
    float _2359 = -_213;
    float _2361 = _2359 + 0.5;
    int _2363 = ~_2321;
    int _2365 = _2363 + _2349;
    int _2367 = _2365 + 1;
    float _2369 = trunc(_2345);
    float _2371 = precise::max(_2369, 0.0);
    uint _2373 = uint(_2371);
    float _2375 = _209 + 0.5;
    int _2377 = ~_1870;
    int _2379 = _2377 + 1;
    int _2381 = _1822 * _2367;
    int _2383 = _2381 + _2201;
    int _2385 = int(_2281) + int(_2333);
    int _2387 = _2353 * _2357;
    int _2389 = _2387 + _2147;
    out.m_66.x = _2375;
    out.m_66.y = _2361;
    float _2391 = trunc(_2355);
    int _2393 = int(_2391);
    bool _2395 = !_1876;
    int _2397 = _2395 ? _2383 : (-1);
    int _2399 = _2379 * _2385;
    int _2401 = _2399 + _2253;
    bool _2403 = uint(_2389) >= uint(_1822);
    bool _2405 = uint(_2401) >= uint(_1870);
    int _2407 = _2397 & 3;
    bool _2409 = _2407 != 0;
    bool _2411 = !_2403;
    int _2413 = _2411 ? 0 : (-1);
    bool _2415 = !_2405;
    int _2417 = _2415 ? 0 : (-1);
    bool _2419 = uint(_2407) >= 2u;
    int _2421 = ~_2357;
    int _2423 = _2421 + _2413;
    int _2425 = _2423 + 1;
    int _2427 = _2393 << 4;
    int _2429 = _2427 + 1712;
    int _2431 = ~_2385;
    int _2433 = _2431 + _2417;
    int _2435 = _2433 + 1;
    int _2437 = _1822 * _2425;
    int _2439 = _2437 + _2147;
    int _2441 = _2397 & 3;
    bool _2443 = _2441 != 0;
    uint _2445 = uint(int(uint(_2429) >> uint(2)));
    uint _2447 = uint(int(uint(int(_2445)) >> uint(2)));
    int _2449 = int(_2445) & 3;
    float _2451 = (*spvDescriptorSet0.vp_c9)._m0[int(_2447)][_2449];
    int _2453 = int(_2445) + 1;
    uint _2455 = uint(int(uint(_2453) >> uint(2)));
    int _2457 = _2453 & 3;
    float _2459 = (*spvDescriptorSet0.vp_c9)._m0[int(_2455)][_2457];
    int _2461 = _2419 ? 0 : 1;
    int _2463 = _1870 * _2435;
    int _2465 = _2463 + _2253;
    bool _2467 = _2407 != 3;
    int _2469 = _2443 ? 0 : 1;
    bool _2471 = uint(_2407) > 1u;
    int _2473 = _2429 + 8;
    uint _2475 = uint(int(uint(_2473) >> uint(2)));
    uint _2477 = uint(int(uint(int(_2475)) >> uint(2)));
    int _2479 = int(_2475) & 3;
    float _2481 = (*spvDescriptorSet0.vp_c9)._m0[int(_2477)][_2479];
    int _2483 = _2397 >> 31;
    int _2485 = ~_2461;
    int _2487 = _2485 + 1;
    int _2489 = _2487 + 1;
    int _2491 = _2483 & 3;
    bool _2493 = !_2117;
    int _2495 = _2493 ? _2465 : (-1);
    int _2497 = _2489;
    if (_2467)
    {
        int _2499 = ~_2461;
        int _2501 = _2499 + 1;
        _2497 = _2501;
    }
    int _2503 = _2497;
    int _2505 = _2397 + _2491;
    int _2507 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2509 = _2507 != 0;
    int _2511 = ~_2469;
    int _2513 = _2511 + 1;
    int _2515 = _2513 + 1;
    int _2517 = _2515;
    if (!_2471)
    {
        int _2519 = ~_2469;
        int _2521 = _2519 + 1;
        _2517 = _2521;
    }
    int _2523 = _2517;
    bool _2525 = _2407 != 3;
    bool _2527 = !_2509;
    int _2529 = _2527 ? 0 : 1;
    int _2531 = _2505 >> 2;
    int _2533 = _2495 & 3;
    bool _2535 = _2533 != 0;
    int _2537 = ~_1870;
    int _2539 = _2537 + 1;
    bool _2541 = !_1876;
    int _2543 = _2541 ? _2439 : (-1);
    int _2545 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2547 = _2545 != 0;
    bool _2549 = !_2409;
    int _2551 = _2549 ? 0 : 1;
    int _2553 = _2531 << 4;
    int _2555 = _2553 + 368;
    bool _2557 = uint(_2533) > 1u;
    float _2559 = _2451 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _2561 = !_2547;
    int _2563 = _2561 ? 0 : 1;
    uint _2565 = uint(int(uint(_2555) >> uint(2)));
    uint _2567 = uint(int(uint(int(_2565)) >> uint(2)));
    int _2569 = int(_2565) & 3;
    float _2571 = (*spvDescriptorSet0.vp_c9)._m0[int(_2567)][_2569];
    int _2573 = int(_2565) + 1;
    uint _2575 = uint(int(uint(_2573) >> uint(2)));
    int _2577 = _2573 & 3;
    float _2579 = (*spvDescriptorSet0.vp_c9)._m0[int(_2575)][_2577];
    int _2581 = _2495 & 3;
    bool _2583 = _2581 != 0;
    float _2585 = _2459 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _2587 = !_2525;
    int _2589 = _2587 ? 0 : (-1);
    float _2591 = _2559 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2593 = _2533 != 3;
    float _2595 = _2481 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _2597 = _2583 ? 0 : 1;
    float _2599 = _2585 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2601 = uint(_2533) >= 2u;
    float _2603 = _2595 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2605 = int(_2301) + int(_2373);
    int _2607 = ~_2597;
    int _2609 = _2607 + 1;
    int _2611 = _2609 + 1;
    int _2613 = _2611;
    if (!_2557)
    {
        int _2615 = ~_2597;
        int _2617 = _2615 + 1;
        _2613 = _2617;
    }
    int _2619 = _2613;
    int _2621 = _2601 ? 0 : 1;
    bool _2623 = _2533 != 3;
    int _2625 = _2539 * _2605;
    int _2627 = _2625 + _2215;
    bool _2629 = !_2535;
    int _2631 = _2629 ? 0 : 1;
    int _2633 = ~_2621;
    int _2635 = _2633 + 1;
    int _2637 = _2635 + 1;
    int _2639 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2641 = _2639 != 0;
    int _2643 = _2637;
    if (_2593)
    {
        int _2645 = ~_2621;
        int _2647 = _2645 + 1;
        _2643 = _2647;
    }
    int _2649 = _2643;
    bool _2651 = !_2623;
    int _2653 = _2651 ? 0 : (-1);
    float _2655 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    bool _2657 = uint(_2627) >= uint(_1870);
    int _2659 = _2555 + 8;
    uint _2661 = uint(int(uint(_2659) >> uint(2)));
    uint _2663 = uint(int(uint(int(_2661)) >> uint(2)));
    int _2665 = int(_2661) & 3;
    float _2667 = (*spvDescriptorSet0.vp_c9)._m0[int(_2663)][_2665];
    int _2669 = int(_2661) + 1;
    uint _2671 = uint(int(uint(_2669) >> uint(2)));
    int _2673 = _2669 & 3;
    float _2675 = (*spvDescriptorSet0.vp_c9)._m0[int(_2671)][_2673];
    int _2677 = _2495 >> 31;
    float _2679 = _2655 * _331;
    int _2681 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2683 = _2681 != 0;
    bool _2685 = _331 > 0.5;
    float _2687 = trunc(_2679);
    int _2689 = int(_2687);
    int _2691 = _2677 & 3;
    int _2693 = abs(_2523);
    float _2695 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _2697 = _2495 + _2691;
    float _2699 = _2185 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _2701 = !_2657;
    int _2703 = _2701 ? 0 : (-1);
    float _2705 = _387 + 0.5;
    int _2707 = _2697 >> 2;
    out.m_68.x = _2591;
    out.m_68.y = _2599;
    out.m_68.z = _2603;
    out.m_68.w = _2695;
    int _2709 = ~_2693;
    int _2711 = _2709 + 1;
    int _2713 = _2711 + 1;
    float _2715 = fma(_2699, _2705, _839);
    int _2717 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2719 = _2717 != 0;
    float _2721 = _391 + (-0.5);
    float _2723 = _1087 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2725 = _2713 * as_type<int>(_2579);
    float _2727 = _1103 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2729 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2731 = int(_2729);
    float _2733 = -_1971;
    float _2735 = -_867;
    float _2737 = fma(_2733, _2721, _2735);
    float _2739 = _1087 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2741 = abs(_2589);
    float _2743 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2727);
    int _2745 = ~_2605;
    int _2747 = _2745 + _2703;
    int _2749 = _2747 + 1;
    float _2751 = -_1071;
    float _2753 = fma(_2751, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2739);
    int _2755 = abs(_2551);
    float _2757 = -_1071;
    float _2759 = fma(_2757, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2723);
    int _2761 = _2707 << 4;
    int _2763 = _2761 + 512;
    float _2765 = _1087 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2767 = ~_2755;
    int _2769 = _2767 + 1;
    int _2771 = _2769 + 1;
    float _2773 = _1103 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    uint _2775 = uint(int(uint(_2763) >> uint(2)));
    uint _2777 = uint(int(uint(int(_2775)) >> uint(2)));
    int _2779 = int(_2775) & 3;
    float _2781 = (*spvDescriptorSet0.vp_c9)._m0[int(_2777)][_2779];
    int _2783 = int(_2775) + 1;
    uint _2785 = uint(int(uint(_2783) >> uint(2)));
    int _2787 = _2783 & 3;
    float _2789 = (*spvDescriptorSet0.vp_c9)._m0[int(_2785)][_2787];
    int _2791 = abs(_2619);
    int _2793 = _1870 * _2749;
    int _2795 = _2793 + _2215;
    float _2797 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2773);
    int _2799 = _2771 * as_type<int>(_2571);
    int _2801 = _2799 + _2725;
    int _2803 = abs(_2503);
    float _2805 = _1103 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2807 = float(uint(_2731));
    int _2809 = _2763 + 8;
    uint _2811 = uint(int(uint(_2809) >> uint(2)));
    uint _2813 = uint(int(uint(int(_2811)) >> uint(2)));
    int _2815 = int(_2811) & 3;
    float _2817 = (*spvDescriptorSet0.vp_c9)._m0[int(_2813)][_2815];
    int _2819 = int(_2811) + 1;
    uint _2821 = uint(int(uint(_2819) >> uint(2)));
    int _2823 = _2819 & 3;
    float _2825 = (*spvDescriptorSet0.vp_c9)._m0[int(_2821)][_2823];
    int _2827 = ~_2803;
    int _2829 = _2827 + 1;
    int _2831 = _2829 + 1;
    float _2833 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2805);
    float _2835 = -_1071;
    float _2837 = fma(_2835, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2765);
    int _2839 = abs(_2529);
    int _2841 = _2831 * as_type<int>(_2667);
    int _2843 = _2841 + _2801;
    int _2845 = ~_2741;
    int _2847 = _2845 + 1;
    int _2849 = _2847 + 1;
    float _2851 = _1111 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2853 = ~_2839;
    int _2855 = _2853 + 1;
    int _2857 = _2855 + 1;
    float _2859 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2753);
    int _2861 = abs(_2649);
    int _2863 = _2849 * as_type<int>(_2675);
    int _2865 = _2863 + _2843;
    float _2867 = _1111 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2869 = 1.0 / _2807;
    float _2871 = _1111 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2873 = fma(_1097, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2867);
    float _2875 = fma(_1097, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2851);
    float _2877 = fma(_1097, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2871);
    int _2879 = _2865 * _2857;
    int _2881 = abs(_2631);
    float _2883 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2885 = int(_2883);
    int _2887 = ~_2791;
    int _2889 = _2887 + 1;
    int _2891 = _2889 + 1;
    int _2893 = _2543 * _2839;
    int _2895 = _2893 + _2879;
    int _2897 = ~_2881;
    int _2899 = _2897 + 1;
    int _2901 = _2899 + 1;
    float _2903 = fma(_1123, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2873);
    int _2905 = abs(_2563);
    float _2907 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2759);
    float _2909 = float(uint(_2895));
    float _2911 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2837);
    int _2913 = _2689 << 4;
    int _2915 = _2913 + 1968;
    float _2917 = _209 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _2919 = !_2641;
    float _2921 = _2919 ? _213 : as_type<float>(_1910);
    float _2923 = _213 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2925 = _2915 + 8;
    uint _2927 = uint(int(uint(_2925) >> uint(2)));
    uint _2929 = uint(int(uint(int(_2927)) >> uint(2)));
    int _2931 = int(_2927) & 3;
    float _2933 = (*spvDescriptorSet0.vp_c9)._m0[int(_2929)][_2931];
    float _2935 = -_209;
    int _2937 = _2685 ? as_type<int>(_2935) : as_type<int>(_209);
    float _2939 = float(uint(_2885));
    float _2941 = fma(_2923, _2923, 1.0);
    int _2943 = _2891 * as_type<int>(_2789);
    int _2945 = as_type<int>(_2869) + (-2);
    int _2947 = _2901 * as_type<int>(_2781);
    int _2949 = _2947 + _2943;
    float _2951 = as_type<float>(_2945) * _2909;
    int _2953 = abs(_2653);
    float _2955 = 1.0 / _2939;
    int _2957 = ~_2861;
    int _2959 = _2957 + 1;
    int _2961 = _2959 + 1;
    int _2963 = abs(_2731);
    int _2965 = ~_2953;
    int _2967 = _2965 + 1;
    int _2969 = _2967 + 1;
    int _2971 = _2961 * as_type<int>(_2817);
    int _2973 = _2971 + _2949;
    float _2975 = trunc(_2951);
    float _2977 = precise::max(_2975, 0.0);
    uint _2979 = uint(_2977);
    int _2981 = ~_2905;
    int _2983 = _2981 + 1;
    int _2985 = _2983 + 1;
    int _2987 = _2969 * as_type<int>(_2825);
    int _2989 = _2987 + _2973;
    int _2991 = abs(_2885);
    float _2993 = float(uint(_2963));
    int _2995 = _2989 * _2985;
    bool _2997 = !_2117;
    int _2999 = _2997 ? _2795 : (-1);
    float _3001 = fma(_1123, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2875);
    float _3003 = 1.0 / _2993;
    float _3005 = float(uint(_2991));
    int _3007 = ~_2731;
    int _3009 = _3007 + 1;
    int _3011 = _2999 * _2905;
    int _3013 = _3011 + _2995;
    int _3015 = as_type<int>(_2955) + (-2);
    float _3017 = -_209;
    int _3019 = _1850 ? as_type<int>(_3017) : as_type<int>(_209);
    int _3021 = _3009 * int(_2979);
    int _3023 = _3021 + _2895;
    float _3025 = 1.0 / _3005;
    float _3027 = float(uint(_3013));
    float _3029 = fma(_1123, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2877);
    int _3031 = abs(_2895);
    uint _3033 = uint(int(uint(_2915) >> uint(2)));
    uint _3035 = uint(int(uint(int(_3033)) >> uint(2)));
    int _3037 = int(_3033) & 3;
    float _3039 = (*spvDescriptorSet0.vp_c9)._m0[int(_3035)][_3037];
    int _3041 = int(_3033) + 1;
    uint _3043 = uint(int(uint(_3041) >> uint(2)));
    int _3045 = _3041 & 3;
    float _3047 = (*spvDescriptorSet0.vp_c9)._m0[int(_3043)][_3045];
    float _3049 = float(uint(_3023));
    float _3051 = as_type<float>(_3015) * _3027;
    int _3053 = abs(_3013);
    float _3055 = rsqrt(_2941);
    int _3057 = as_type<int>(_3003) + (-2);
    float _3059 = as_type<float>(_2945) * _3049;
    float _3061 = fma(_1115, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2833);
    float _3063 = fma(_1115, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2797);
    float _3065 = fma(_1115, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2743);
    float _3067 = float(uint(_3031));
    float _3069 = _2923 * _2911;
    float _3071 = trunc(_3051);
    float _3073 = precise::max(_3071, 0.0);
    uint _3075 = uint(_3073);
    int _3077 = as_type<int>(_3025) + (-2);
    float _3079 = as_type<float>(_3057) * _3067;
    float _3081 = float(uint(_3053));
    float _3083 = fma(_2917, _3065, _3069);
    bool _3085 = !_2683;
    float _3087 = _3085 ? _209 : as_type<float>(_3019);
    out.m_70.x = _3061;
    out.m_70.y = _3063;
    out.m_70.z = _3065;
    int _3089 = ~_2885;
    int _3091 = _3089 + 1;
    float _3093 = as_type<float>(_3077) * _3081;
    float _3095 = trunc(_3079);
    float _3097 = precise::max(_3095, 0.0);
    uint _3099 = uint(_3097);
    int _3101 = ~_2963;
    int _3103 = _3101 + 1;
    float _3105 = _2923 * _2859;
    bool _3107 = !_2719;
    float _3109 = _3107 ? _209 : as_type<float>(_2937);
    float _3111 = _2923 * _2907;
    int _3113 = ~_2991;
    int _3115 = _3113 + 1;
    float _3117 = fma(_2917, _3061, _3105);
    int _3119 = _3091 * int(_3075);
    int _3121 = _3119 + _3013;
    float _3123 = trunc(_3093);
    float _3125 = precise::max(_3123, 0.0);
    uint _3127 = uint(_3125);
    float _3129 = fma(_2917, _3063, _3111);
    int _3131 = ~_2963;
    int _3133 = _3131 + 1;
    float _3135 = float(uint(_3121));
    int _3137 = ~_2991;
    int _3139 = _3137 + 1;
    int _3141 = _3103 * int(_3099);
    int _3143 = _3141 + _3031;
    float _3145 = as_type<float>(_3015) * _3135;
    float _3147 = trunc(_3059);
    float _3149 = precise::max(_3147, 0.0);
    uint _3151 = uint(_3149);
    float _3153 = _2923 * _3055;
    float _3155 = float(uint(_3143));
    float _3157 = -_3001;
    float _3159 = _3153 * _3157;
    int _3161 = _3115 * int(_3127);
    int _3163 = _3161 + _3053;
    float _3165 = _3039 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _3167 = as_type<float>(_3057) * _3155;
    float _3169 = fma(_391, _1830, _2737);
    float _3171 = float(uint(_3163));
    float _3173 = _2903 + _3117;
    float _3175 = -_1836;
    float _3177 = fma(_387, _3175, _2715);
    float _3179 = trunc(_3167);
    float _3181 = precise::max(_3179, 0.0);
    uint _3183 = uint(_3181);
    float _3185 = -_2903;
    float _3187 = _3153 * _3185;
    float _3189 = as_type<float>(_3077) * _3171;
    float _3191 = -_3029;
    float _3193 = _3153 * _3191;
    int _3195 = int(_2979) + int(_3151);
    float _3197 = fma(_3055, _2859, _3187);
    float _3199 = _3001 + _3129;
    int _3201 = ~_2731;
    int _3203 = _3201 + 1;
    float _3205 = trunc(_3189);
    float _3207 = precise::max(_3205, 0.0);
    uint _3209 = uint(_3207);
    float _3211 = fma(_3055, _2907, _3159);
    float _3213 = fma(_3055, _2911, _3193);
    float _3215 = _3047 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _3217 = ~_2885;
    int _3219 = _3217 + 1;
    float _3221 = _2933 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _3223 = trunc(_3145);
    float _3225 = precise::max(_3223, 0.0);
    uint _3227 = uint(_3225);
    int _3229 = int(_3099) + int(_3183);
    int _3231 = _3203 * _3195;
    int _3233 = _3231 + _2895;
    float _3235 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _3237 = _3133 * _3229;
    int _3239 = _3237 + _3031;
    bool _3241 = uint(_3233) >= uint(_2731);
    float _3243 = _3165 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _3245 = int(_3127) + int(_3209);
    float _3247 = _3215 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3249 = _3221 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _3251 = uint(_3239) >= uint(_2963);
    float _3253 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _3255 = _3139 * _3245;
    int _3257 = _3255 + _3053;
    bool _3259 = !_3241;
    int _3261 = _3259 ? 0 : (-1);
    out.m_72.x = _3243;
    out.m_72.y = _3247;
    out.m_72.z = _3249;
    out.m_72.w = _3235;
    int _3263 = int(_3075) + int(_3227);
    float _3265 = fma(_1509, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1852);
    bool _3267 = uint(_3257) >= uint(_2991);
    float _3269 = -_861;
    float _3271 = _3269 + 1.0;
    bool _3273 = !_3251;
    int _3275 = _3273 ? 0 : (-1);
    int _3277 = _3219 * _3263;
    int _3279 = _3277 + _3013;
    int _3281 = ~_3195;
    int _3283 = _3281 + _3261;
    int _3285 = _3283 + 1;
    float _3287 = fma(_1689, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3265);
    int _3289 = _2895 ^ _2731;
    float _3291 = _3029 + _3083;
    bool _3293 = uint(_3279) >= uint(_2885);
    int _3295 = _2731 * _3285;
    int _3297 = _3295 + _2895;
    int _3299 = ~_3275;
    int _3301 = _3229 + _3299;
    int _3303 = _3301 + 1;
    float _3305 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    uint _3307 = uint(int(uint(_3289) >> uint(31)));
    out.m_74.x = _3177;
    out.m_74.y = _3169;
    bool _3309 = !_3293;
    int _3311 = _3309 ? 0 : (-1);
    bool _3313 = _2731 == 0;
    out.m_76.x = _3173;
    out.m_76.y = _3199;
    out.m_76.z = _3291;
    int _3315 = ~int(_3307);
    int _3317 = _3315 + 1;
    float _3319 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _3321 = ~_3263;
    int _3323 = _3321 + _3311;
    int _3325 = _3323 + 1;
    out.m_78.x = _3197;
    out.m_78.y = _3211;
    out.m_78.z = _3213;
    int _3327 = _3013 ^ _2885;
    bool _3329 = !_3313;
    int _3331 = _3329 ? _3297 : (-1);
    int _3333 = _2885 * _3325;
    int _3335 = _3333 + _3013;
    bool _3337 = !_3267;
    int _3339 = _3337 ? 0 : (-1);
    float _3341 = _3305 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _3343 = _3303 ^ _3317;
    float _3345 = _3253 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    uint _3347 = uint(int(uint(_3327) >> uint(31)));
    float _3349 = float(_3331);
    bool _3351 = _2885 == 0;
    float _3353 = _3319 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _3355 = _2731 == 0;
    float _3357 = fma(_3341, _3349, _443);
    int _3359 = ~_3317;
    int _3361 = _3359 + _3343;
    int _3363 = _3361 + 1;
    int _3365 = ~_3339;
    int _3367 = _3245 + _3365;
    int _3369 = _3367 + 1;
    int _3371 = ~int(_3347);
    int _3373 = _3371 + 1;
    float _3375 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _3377 = !_3351;
    int _3379 = _3377 ? _3335 : (-1);
    bool _3381 = !_3355;
    int _3383 = _3381 ? _3363 : (-1);
    int _3385 = _3369 ^ _3373;
    float _3387 = float(_3379);
    float _3389 = _3109 + 0.5;
    float _3391 = float(_3383);
    bool _3393 = _2885 == 0;
    float _3395 = fma(_3341, _3389, _3357);
    int _3397 = ~_3373;
    int _3399 = _3397 + _3385;
    int _3401 = _3399 + 1;
    float _3403 = -_845;
    float _3405 = fma(_3353, _3391, _3403);
    float _3407 = fma(_3345, _3387, _849);
    float _3409 = _3087 + 0.5;
    bool _3411 = !_3393;
    int _3413 = _3411 ? _3401 : (-1);
    float _3415 = _3375 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _3417 = _2921 + (-0.5);
    float _3419 = fma(_3345, _3409, _3407);
    float _3421 = float(_3413);
    float _3423 = _1187 + (-0.5);
    float _3425 = -_3353;
    float _3427 = fma(_3425, _3417, _3405);
    float _3429 = -_3271;
    float _3431 = fma(_3087, _3429, _3419);
    float _3433 = _2097 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3435 = -_865;
    float _3437 = fma(_3415, _3421, _3435);
    float _3439 = fma(_1721, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3287);
    float _3441 = _1765 + _1735;
    float _3443 = _1735 * 0.5;
    float _3445 = -_3415;
    float _3447 = fma(_3445, _3423, _3437);
    float _3449 = _3433 * _1797;
    bool _3451 = _1479 > 0.0;
    bool _3453 = isnan(_1479);
    bool _3455 = _3451 || _3453;
    bool _3457 = isnan(0.0);
    bool _3459 = _3455 || _3457;
    float _3461 = _3441 * 0.5;
    float _3463 = fma(_1775, -0.5, _3443);
    float _3465 = fma(_1187, _1856, _3447);
    float _3467 = _3439 + _1735;
    float _3469 = _1479 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3471 = _1808 * _3449;
    float _3473 = _1818 * _3449;
    float _3475 = -_3433;
    float _3477 = _3475 + 1.0;
    float _3479 = -_1860;
    float _3481 = fma(_3109, _3479, _3395);
    out.gl_Position.x = _1765;
    out.gl_Position.y = _1775;
    out.gl_Position.z = _3439;
    out.gl_Position.w = _1735;
    float _3483 = fma(_2921, _1864, _3427);
    float _3485 = _3467 * 0.5;
    float _3487 = _3469 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3489 = fma(_1814, _3471, _1802);
    float _3491 = fma(_1816, _3471, _1804);
    float _3493 = _1808 * _3477;
    float _3495 = fma(_1808, _3473, _1806);
    out.m_80.x = _3461;
    out.m_80.y = _3463;
    out.m_80.z = _3485;
    out.m_80.w = _1735;
    out.m_82.x = _3481;
    out.m_82.y = _3483;
    out.m_82.z = _3431;
    out.m_82.w = _3465;
    out.m_45.x = _3487;
    out.m_84.x = _3489;
    out.m_84.y = _3491;
    out.m_84.z = _3495;
    out.m_84.w = _3493;
    if (_3459)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _3497 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3497;
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
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    bool _321 = false;
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
    if (!_107)
    {
        _109 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _113 = _109;
    float _115 = _113;
    if (!_107)
    {
        out.m_45.x = 0.0;
    }
    int _117 = 0;
    if (!_107)
    {
        float _119 = _113 * 5.0;
        _117 = as_type<int>(_119);
    }
    int _121 = _117;
    int _123 = _121;
    if (!_107)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3556 = as_type<float>(_121);
        out.gl_Position.z = _3556;
    }
    if (!_107)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _125 = in.m_47.w;
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
        float _145 = float(_103);
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
        out.m_45.x = 0.0;
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
        float _3625 = as_type<float>(_159);
        out.gl_Position.z = _3625;
    }
    if (_153)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _161 = as_type<float>(int(gl_VertexIndex));
    float _163 = in.m_52.w;
    bool _165 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _167 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _169 = _165 || _167;
    bool _171 = isnan(1.0);
    bool _173 = _169 || _171;
    float _175 = in.m_47.x;
    float _177 = in.m_47.y;
    float _179 = in.m_47.z;
    float _181 = in.m_42.x;
    float _183 = in.m_42.y;
    float _185 = in.m_42.z;
    int _187 = as_type<int>(_161) & 1;
    bool _189 = _187 != 0;
    int _191 = as_type<int>(_161) & 2;
    bool _193 = _191 != 0;
    float _195 = _139 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _197 = 0.0;
    float _199 = _195;
    if (!_173)
    {
        float _201 = _195 * _195;
        float _203 = _201 * 0.5;
        _197 = _203;
    }
    float _205 = _197;
    bool _207 = !_189;
    float _209 = _207 ? (-0.5) : 0.5;
    bool _211 = !_193;
    float _213 = _211 ? (-0.5) : 0.5;
    float _215 = _205;
    if (!_173)
    {
        float _217 = _205 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _215 = _217;
    }
    float _219 = _215;
    bool _221 = !_173;
    float _223 = _219;
    if (!_221)
    {
        float _225 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _227 = log2(_225);
        float _229 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _231 = _229 + 1.0;
        float _233 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _235 = _195 * _227;
        float _237 = 1.0 / _231;
        float _239 = _233 * 0.693147182464599609375;
        float _241 = exp2(_235);
        float _243 = 1.0 / _239;
        float _245 = _241 + (-1.0);
        float _247 = -_245;
        float _249 = fma(_247, _243, _195);
        float _251 = _249 * _237;
        float _253 = _251 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _223 = _253;
    }
    float _255 = _223;
    bool _257 = !_173;
    if (!_257)
    {
        float _259 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _261 = log2(_259);
        float _263 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _265 = _263 + 1.0;
        float _267 = 1.0 / _265;
        float _269 = _195 * _261;
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
    float _289 = fma(_279, _175, _283);
    float _291 = fma(_279, _177, _285);
    float _293 = fma(_279, _179, _287);
    float _295 = fma(_289, _163, _181);
    float _297 = fma(_291, _163, _183);
    float _299 = fma(_293, _163, _185);
    bool _301 = !_281;
    float _319;
    if (!_301)
    {
        float _303 = in.m_54.x;
        float _305 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _307 = _303 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _309 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[12].x, _139);
        float _311 = _309 * _305;
        float _313 = floor(_311);
        float _315 = -_313;
        float _317 = _311 + _315;
        _319 = _317;
        _321 = true;
    }
    else
    {
        float _323 = float(_103);
        float _325 = 1.0 / _323;
        float _327 = _139 * _325;
        _319 = _327;
    }
    _321 = false;
    float _329 = _319;
    float _331 = in.m_54.x;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _335 = _329 + _333;
    float _337 = in.m_54.y;
    float _339 = in.m_54.z;
    float _341 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _343 = _331 * 2.0;
    float _345 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _347 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _349 = _337 > 0.5;
    float _351 = _337 * 2.0;
    float _353 = floor(_343);
    float _355 = _337 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _357 = _339 > 0.5;
    float _359 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _361 = -_209;
    int _363 = _349 ? as_type<int>(_361) : as_type<int>(_209);
    float _365 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _367 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _369 = _367 != 0;
    int _371 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _373 = _371 != 0;
    int _375 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _377 = _375 != 0;
    float _379 = -_213;
    int _381 = _357 ? as_type<int>(_379) : as_type<int>(_213);
    float _383 = floor(_351);
    bool _385 = !_373;
    float _387 = _385 ? _209 : as_type<float>(_363);
    bool _389 = !_377;
    float _391 = _389 ? _213 : as_type<float>(_381);
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _395 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _393;
    int _397 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _399 = _397 != 0;
    int _401 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _403 = _401 != 0;
    int _405 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _407 = _405 != 0;
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _411 = _409 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _413 = _353 > 0.0;
    float _415 = 1.0 / _395;
    int _417 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _419 = _417 != 0;
    float _421 = _331 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _423 = _353 >= 0.0;
    bool _425 = isnan(_353);
    bool _427 = _423 || _425;
    bool _429 = isnan(0.0);
    bool _431 = _427 || _429;
    float _433 = -_341;
    float _435 = fma(_421, 2.0, _433);
    int _437 = _431 ? 0 : 1;
    float _439 = 1.0 / _411;
    float _441 = -_139;
    float _443 = fma(_441, (*spvDescriptorSet0.vp_c9)._m0[76].x, _435);
    int _445 = ~_437;
    int _447 = _445 + 1;
    int _449 = _447 + 1;
    int _451 = _449;
    int _453 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[77].y);
    if (!_413)
    {
        int _455 = ~_437;
        int _457 = _455 + 1;
        _451 = _457;
    }
    int _459 = _451;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _463 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _461;
    float _465 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    if (_419)
    {
        _453 = 0;
    }
    int _467 = _453;
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _471 = _329 + _469;
    bool _473 = _383 >= 0.0;
    bool _475 = isnan(_383);
    bool _477 = _473 || _475;
    bool _479 = isnan(0.0);
    bool _481 = _477 || _479;
    float _483 = 1.0 / _463;
    int _485 = _467;
    if (!_419)
    {
        _485 = 1;
    }
    int _487 = _485;
    float _489 = fma(_355, -2.0, _465);
    bool _491 = _383 > 0.0;
    float _493 = _471 * _439;
    int _495 = _481 ? 0 : 1;
    float _497 = _339 + _337;
    bool _499 = _487 != 1;
    float _501 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _503 = _329 + _501;
    float _505 = _331 + _339;
    int _507 = ~_495;
    int _509 = _507 + 1;
    int _511 = _509 + 1;
    float _513 = _497 + (-1.0);
    bool _515 = !_403;
    int _517 = _515 ? 0 : 1;
    float _519 = _503 * _415;
    bool _521 = !_399;
    int _523 = _521 ? 0 : 1;
    float _525 = _339 * 2.0;
    int _527 = _511;
    int _529 = as_type<int>(_505);
    float _531 = _497;
    if (!_491)
    {
        int _533 = ~_495;
        int _535 = _533 + 1;
        _527 = _535;
    }
    int _537 = _527;
    float _539 = _505 + (-1.0);
    if (_419)
    {
        _529 = 0;
    }
    int _541 = _529;
    float _543 = _335 * _483;
    float _545 = 0.0;
    int _547 = _541;
    if (!_499)
    {
        _545 = _337;
    }
    float _549 = _545;
    float _551 = floor(_525);
    float _553 = _549;
    if (!_419)
    {
        _547 = 2;
    }
    int _555 = _547;
    float _557 = fma(_513, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _559 = !_407;
    int _561 = _559 ? 0 : 1;
    float _563 = _331 + _337;
    float _565 = 0.0;
    float _567 = as_type<float>(_555);
    if (!_499)
    {
        _565 = _549;
    }
    float _569 = _565;
    float _571 = _569;
    if (!_499)
    {
        _531 = _339;
    }
    float _573 = _531;
    float _575 = _563 + (-1.0);
    float _577 = 0.0;
    float _579 = _573;
    if (!_499)
    {
        _577 = _339;
    }
    float _581 = _577;
    float _583 = _581;
    if (_499)
    {
        _571 = _331;
    }
    float _585 = _571;
    float _587 = fma(_575, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    if (_499)
    {
        _553 = _331;
    }
    float _589 = _553;
    float _591 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _593 = int(_591);
    if (_499)
    {
        _579 = _337;
    }
    float _595 = _579;
    float _597 = _585 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_499)
    {
        _583 = _337;
    }
    float _599 = _583;
    float _601 = fma(_589, (*spvDescriptorSet0.vp_c9)._m0[83].z, _365);
    int _603 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _605 = _603 != 0;
    int _607 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _609 = _607 != 0;
    int _611 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _613 = _611 != 0;
    bool _615 = _555 != 2;
    float _617 = fma(_599, (*spvDescriptorSet0.vp_c9)._m0[83].w, _347);
    bool _619 = _551 >= 0.0;
    bool _621 = isnan(_551);
    bool _623 = _619 || _621;
    bool _625 = isnan(0.0);
    bool _627 = _623 || _625;
    bool _629 = !_605;
    int _631 = _629 ? 0 : 1;
    float _633 = fma(_539, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _635 = _627 ? 0 : 1;
    float _637 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _639 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _637;
    bool _641 = _551 > 0.0;
    float _643 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _645 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _643;
    float _647 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _649 = int(_647);
    if (_615)
    {
        _567 = _331;
    }
    float _651 = _567;
    float _653 = fma(_639, _519, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _655 = _651;
    if (!_615)
    {
        _655 = _339;
    }
    float _657 = _655;
    float _659 = fma(_645, _519, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _661 = float(_103);
    float _663 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _665 = _663 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    if (_615)
    {
        _111 = _337;
    }
    float _667 = _111;
    float _669 = _657 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _671 = _667;
    if (!_615)
    {
        _671 = _331;
    }
    float _673 = _671;
    float _675 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _677 = log2(_675);
    bool _679 = !_609;
    int _681 = _679 ? 0 : 1;
    float _683 = -_345;
    float _685 = fma(_669, 2.0, _683);
    int _687 = abs(_631);
    float _689 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _691 = _689 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _693 = float(_459);
    float _695 = _595 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _697 = _673 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _699 = abs(_681);
    float _701 = fma(_665, _493, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _703 = fma(_691, _493, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _705 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _707 = ~_635;
    int _709 = _707 + 1;
    int _711 = _709 + 1;
    float _713 = _677 * _139;
    float _715 = fma(_695, -2.0, _359);
    int _717 = _711;
    if (!_641)
    {
        int _719 = ~_635;
        int _721 = _719 + 1;
        _717 = _721;
    }
    int _723 = _717;
    float _725 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _727 = 1.0 + _725;
    float _729 = float(_593);
    float _731 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _733 = exp2(_713);
    float _735 = float(_699);
    float _737 = fma(_697, -2.0, _705);
    float _739 = float(_649);
    float _741 = -_731;
    float _743 = fma(_597, 2.0, _741);
    float _745 = in.m_56.x;
    float _747 = in.m_56.y;
    float _749 = in.m_56.z;
    float _751 = float(_723);
    float _753 = 1.0 / _661;
    float _755 = float(_687);
    float _757 = _735 * _693;
    float _759 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _761 = _755 * _751;
    float _763 = 1.0 / _729;
    bool _765 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _767 = isnan(1.0);
    bool _769 = _765 || _767;
    bool _771 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _773 = _769 || _771;
    float _775 = fma(_337, (*spvDescriptorSet0.vp_c9)._m0[78].w, _759);
    float _777 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _779 = -_733;
    float _781 = _779 + 1.0;
    bool _783 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _785 = isnan(0.0);
    bool _787 = _783 || _785;
    bool _789 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _791 = _787 || _789;
    float _793 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _795 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _797 = 1.0 / _739;
    bool _799 = _329 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _801 = isnan(_329);
    bool _803 = _799 || _801;
    bool _805 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _807 = _803 || _805;
    float _809 = float(_807);
    float _811 = fma(_331, (*spvDescriptorSet0.vp_c9)._m0[78].z, _777);
    float _813 = fma(_331, (*spvDescriptorSet0.vp_c9)._m0[88].z, _793);
    float _815 = fma(_337, (*spvDescriptorSet0.vp_c9)._m0[88].w, _795);
    float _817 = _791 ? _781 : 0.0;
    float _819 = -_809;
    float _821 = _819 + 1.0;
    bool _823 = _329 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _825 = isnan(_329);
    bool _827 = _823 || _825;
    bool _829 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _831 = _827 || _829;
    float _833 = float(_831);
    float _835 = 1.0 / _727;
    float _837 = -_139;
    float _839 = fma(_837, (*spvDescriptorSet0.vp_c9)._m0[86].x, _685);
    float _841 = _753 * _139;
    float _843 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[77].z, _811);
    float _845 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[76].y, _489);
    float _847 = -_139;
    float _849 = fma(_847, (*spvDescriptorSet0.vp_c9)._m0[81].x, _743);
    float _851 = _763 * _139;
    float _853 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[77].w, _775);
    float _855 = _797 * _139;
    float _857 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[87].z, _813);
    float _859 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[87].w, _815);
    float _861 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[82].z, _601);
    float _863 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[82].w, _617);
    float _865 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[81].y, _715);
    float _867 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[86].y, _737);
    float _869 = _833 * _821;
    float _871 = _855;
    if (_773)
    {
        float _873 = _817 * _835;
        _143 = _873;
    }
    float _875 = _143;
    float _877 = -_833;
    float _879 = _877 + 1.0;
    bool _881 = !_613;
    int _883 = _881 ? 0 : 1;
    float _885 = _761 * (-2.0);
    bool _887 = _329 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _889 = isnan(_329);
    bool _891 = _887 || _889;
    bool _893 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _895 = _891 || _893;
    float _897 = float(_895);
    float _899 = _757 * (-2.0);
    int _901 = abs(_883);
    float _903 = fma(_885, _745, _745);
    float _905 = _331 + (-0.5);
    float _907 = fma(_587, _885, _587);
    float _909 = _897 * _879;
    float _911 = fma(_905, (*spvDescriptorSet0.vp_c9)._m0[196].x, _903);
    bool _913 = _329 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _915 = isnan(_329);
    bool _917 = _913 || _915;
    bool _919 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _921 = _917 || _919;
    float _923 = float(_921);
    float _925 = -_897;
    float _927 = _925 + 1.0;
    float _929 = float(_537);
    float _931 = fma(_907, _875, _911);
    float _933 = float(_901);
    float _935 = _337 + (-0.5);
    float _937 = fma(_899, _747, _747);
    float _939 = _923 * _927;
    float _941 = fma(_557, _899, _557);
    float _943 = _933 * _929;
    float _945 = fma(_935, (*spvDescriptorSet0.vp_c9)._m0[196].y, _937);
    float _947 = _659 * _939;
    float _949 = -_923;
    float _951 = _949 + 1.0;
    float _953 = _653 * _939;
    float _955 = _943 * (-2.0);
    float _957 = fma(_941, _875, _945);
    float _959 = _931 * 0.15915493667125701904296875;
    float _961 = fma(_951, (*spvDescriptorSet0.vp_c9)._m0[143].x, _947);
    float _963 = fma(_951, (*spvDescriptorSet0.vp_c9)._m0[143].y, _953);
    float _965 = fma(_633, _955, _633);
    float _967 = _957 * 0.15915493667125701904296875;
    float _969 = fma(_955, _749, _749);
    float _971 = in.m_52.x;
    float _973 = in.m_52.y;
    float _975 = _339 + (-0.5);
    float _977 = _959 * 6.283185482025146484375;
    float _979 = sin(_977);
    float _981 = in.m_58.x;
    float _983 = in.m_58.y;
    float _985 = in.m_58.z;
    float _987 = fma(_975, (*spvDescriptorSet0.vp_c9)._m0[196].z, _969);
    float _989 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _991 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _989;
    float _993 = fma(_701, _909, _961);
    float _995 = in.m_60.x;
    float _997 = in.m_60.y;
    float _999 = in.m_60.z;
    float _1001 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1003 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _1001;
    float _1005 = fma(_965, _875, _987);
    float _1007 = _959 * 6.283185482025146484375;
    float _1009 = cos(_1007);
    float _1011 = fma(_703, _909, _963);
    float _1013 = in.m_62.x;
    float _1015 = in.m_62.y;
    float _1017 = in.m_62.z;
    float _1019 = _1005 * 0.15915493667125701904296875;
    float _1021 = _967 * 6.283185482025146484375;
    float _1023 = sin(_1021);
    float _1025 = fma(_991, _543, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _1027 = fma(_1003, _543, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _1029 = fma(_1025, _869, _993);
    float _1031 = fma(_1027, _869, _1011);
    float _1033 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _213);
    float _1035 = _967 * 6.283185482025146484375;
    float _1037 = cos(_1035);
    float _1039 = fma(_809, (*spvDescriptorSet0.vp_c9)._m0[146].x, _1029);
    float _1041 = fma(_809, (*spvDescriptorSet0.vp_c9)._m0[146].y, _1031);
    float _1043 = _297 * _983;
    float _1045 = _1039 * _971;
    float _1047 = _1041 * _973;
    float _1049 = _297 * _997;
    float _1051 = _1019 * 6.283185482025146484375;
    float _1053 = cos(_1051);
    float _1055 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _209);
    float _1057 = _1047 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1059 = fma(_295, _981, _1043);
    float _1061 = _1045 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1063 = _979 * _1023;
    float _1065 = _1057 * _1033;
    float _1067 = _297 * _1015;
    float _1069 = _1019 * 6.283185482025146484375;
    float _1071 = sin(_1069);
    float _1073 = _1009 * _1037;
    float _1075 = _1061 * _1055;
    float _1077 = _979 * _1037;
    float _1079 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1081 = fma(_295, _1013, _1067);
    float _1083 = in.m_54.w;
    float _1085 = fma(_299, _985, _1059);
    float _1087 = _1009 * _1053;
    float _1089 = _1009 * _1023;
    float _1091 = _979 * _1053;
    float _1093 = _1037 * _1053;
    float _1095 = _1087 * _1065;
    float _1097 = _1023 * _1053;
    float _1099 = fma(_299, _1017, _1081);
    float _1101 = fma(_295, _995, _1049);
    float _1103 = fma(_1071, _1073, _1063);
    float _1105 = -_1065;
    float _1107 = _1071 * _1105;
    float _1109 = -_1077;
    float _1111 = fma(_1071, _1089, _1109);
    float _1113 = -_1089;
    float _1115 = fma(_1071, _1077, _1113);
    float _1117 = fma(_1103, _1075, _1095);
    float _1119 = _1091 * _1065;
    float _1121 = fma(_1093, _1075, _1107);
    float _1123 = fma(_1071, _1063, _1073);
    float _1125 = fma(_1111, _1079, _1117);
    float _1127 = fma(_1115, _1075, _1119);
    float _1129 = fma(_1097, _1079, _1121);
    float _1131 = _1099 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1133 = _1125 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1135 = fma(_1123, _1079, _1127);
    float _1137 = _1125 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1139 = _1085 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1141 = fma(_1129, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1133);
    float _1143 = fma(_299, _999, _1101);
    float _1145 = fma(_1129, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1137);
    bool _1147 = _1083 > 0.5;
    float _1149 = fma(_1135, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1141);
    float _1151 = _1143 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1153 = fma(_1135, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1145);
    float _1155 = _1125 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1157 = _1149 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1159 = _1151 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1161 = _1153 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1163 = fma(_1129, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1155);
    float _1165 = _1131 + _1157;
    float _1167 = fma(_1139, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1159);
    float _1169 = _1139 + _1161;
    float _1171 = -_213;
    int _1173 = _1147 ? as_type<int>(_1171) : as_type<int>(_213);
    float _1175 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1177 = _1165 + _1175;
    float _1179 = fma(_1131, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1167);
    float _1181 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1183 = _1169 + _1181;
    bool _1185 = !_369;
    float _1187 = _1185 ? _213 : as_type<float>(_1173);
    float _1189 = _1177 * _1177;
    int _1191 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1193 = _1191 != 0;
    int _1195 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1197 = _1195 != 0;
    int _1199 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1201 = _1199 != 0;
    int _1203 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1205 = _1203 != 0;
    float _1207 = _1179 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1209 = fma(_1135, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1163);
    float _1211 = fma(_1183, _1183, _1189);
    float _1213 = _1151 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1215 = 1.0 / _1207;
    bool _1217 = !_1197;
    int _1219 = _1217 ? 0 : 1;
    float _1221 = _1209 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1223 = fma(_1139, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1213);
    bool _1225 = !_1193;
    int _1227 = _1225 ? 0 : 1;
    float _1229 = _1151 + _1221;
    float _1231 = fma(_1131, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1223);
    float _1233 = sqrt(_1211);
    bool _1235 = !_1201;
    int _1237 = _1235 ? 0 : 1;
    float _1239 = _1231 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1241 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1243 = isnan(0.5);
    bool _1245 = _1241 || _1243;
    bool _1247 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1249 = _1245 || _1247;
    bool _1251 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1253 = isnan(0.5);
    bool _1255 = _1251 || _1253;
    bool _1257 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1259 = _1255 || _1257;
    float _1261 = _1239 + _1207;
    bool _1263 = !_1205;
    int _1265 = _1263 ? 0 : 1;
    float _1267 = _1261 * _1215;
    float _1269 = _1267 * 0.5;
    bool _1271 = _1233 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1273 = _1209;
    float _1275 = _1221;
    float _1277 = _1165;
    float _1279 = _1211;
    float _1281 = _1207;
    float _1283 = _1177;
    float _1285 = _1157;
    if (!_1271)
    {
        _1273 = _1169;
    }
    float _1287 = _1273;
    float _1289 = _1287;
    if (!_1271)
    {
        _1275 = _1229;
    }
    float _1291 = _1275;
    bool _1293 = !_1271;
    float _1295 = _1291;
    if (!_1293)
    {
        float _1297 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1299 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1301 = _1233 + _1299;
        float _1303 = _1229 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1305 = rsqrt(_1211);
        float _1307 = _1301 * _1297;
        float _1309 = _1307 * 0.15915493667125701904296875;
        float _1311 = _1309 * 6.283185482025146484375;
        float _1313 = sin(_1311);
        float _1315 = _1309 * 6.283185482025146484375;
        float _1317 = cos(_1315);
        float _1319 = fma(_1313, _1303, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1321 = _1305 * _1319;
        float _1323 = _1317 + (-1.0);
        float _1325 = fma(_1183, _1321, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1327 = fma(_1177, _1321, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1329 = _1323 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1331 = fma(_1229, _1317, _1329);
        _1277 = _1327;
        _1279 = _1305;
        _1289 = _1325;
        _1295 = _1331;
    }
    float _1333 = _1277;
    float _1335 = _1279;
    float _1337 = _1289;
    float _1339 = _1295;
    float _1341 = _1339;
    float _1343 = _1337;
    float _1345 = _1335;
    if (_1259)
    {
        _1281 = 1.0;
    }
    float _1347 = _1281;
    float _1349 = _1347;
    if (_1249)
    {
        _1283 = _1333;
    }
    float _1351 = _1283;
    float _1353 = _1351;
    if (!_1249)
    {
        float _1355 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1357 = _1151 + _1355;
        float _1359 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1361 = _1139 + _1359;
        float _1363 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1365 = -_1139;
        float _1367 = _1365 + _1337;
        float _1369 = _1357 * _1357;
        float _1371 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1373 = _1131 + _1371;
        float _1375 = -_1151;
        float _1377 = _1375 + _1339;
        float _1379 = fma(_1361, _1361, _1369);
        float _1381 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1383 = fma(_1373, _1373, _1379);
        float _1385 = sqrt(_1383);
        float _1387 = _1363 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1389 = precise::min(_1385, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1391 = _1389 * _1381;
        float _1393 = _1387 * _1391;
        float _1395 = -_1131;
        float _1397 = _1395 + _1333;
        float _1399 = fma(_1367, _1393, _1139);
        float _1401 = fma(_1377, _1393, _1151);
        float _1403 = fma(_1397, _1393, _1131);
        _1341 = _1401;
        _1343 = _1399;
        _1353 = _1403;
        _1345 = _1363;
    }
    float _1405 = _1341;
    float _1407 = _1343;
    float _1409 = _1353;
    float _1411 = _1345;
    float _1413 = _1411;
    if (!_1259)
    {
        float _1415 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1417 = _1415 * 0.15915493667125701904296875;
        float _1419 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1421 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1423 = fma(_1269, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1421);
        float _1425 = _1417 * 6.283185482025146484375;
        float _1427 = cos(_1425);
        float _1429 = _1419 * 0.15915493667125701904296875;
        float _1431 = _1417 * 6.283185482025146484375;
        float _1433 = sin(_1431);
        float _1435 = 1.0 / _1427;
        float _1437 = _1429 * 6.283185482025146484375;
        float _1439 = cos(_1437);
        float _1441 = _1433 * _1435;
        float _1443 = _1429 * 6.283185482025146484375;
        float _1445 = sin(_1443);
        float _1447 = _1439 * _1441;
        float _1449 = 1.0 / _1423;
        float _1451 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1453 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1451;
        float _1455 = 1.0 / _1447;
        float _1457 = 1.0 / _1453;
        float _1459 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1461 = _1449 * _1459;
        float _1463 = _1445 * _1455;
        float _1465 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1467 = fma(_1463, _1461, _1465);
        float _1469 = _1467 * _1457;
        float _1471 = precise::clamp(_1469, 0.0, 1.0);
        float _1473 = -_1471;
        float _1475 = _1473 + 1.0;
        _1413 = _1429;
        _1349 = _1475;
    }
    float _1477 = _1413;
    float _1479 = _1349;
    float _1481 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1483 = _1405 + _1481;
    float _1485 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1487 = _1407 + _1485;
    float _1489 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1491 = _1409 + _1489;
    float _1493 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1495 = _1483 * _1483;
    float _1497 = _1405 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1499 = fma(_1487, _1487, _1495);
    float _1501 = fma(_1407, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1497);
    float _1503 = fma(_1491, _1491, _1499);
    float _1505 = fma(_1409, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1501);
    float _1507 = rsqrt(_1503);
    float _1509 = _1505 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1511 = sqrt(_1503);
    float _1513 = _1507 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1515 = _1487 * _1513;
    float _1517 = _1491 * _1513;
    float _1519 = _1515 * _1515;
    float _1521 = _1517 * _1517;
    float _1523 = _1519 + _1521;
    float _1525 = sqrt(_1523);
    bool _1527 = _1525 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1529 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1531 = _1525 + _1529;
    float _1533 = _1507;
    float _1535 = _1523;
    float _1537 = _1531;
    float _1539 = _1477;
    float _1541 = _1483;
    if (_1527)
    {
        float _1543 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1533 = _1543;
    }
    float _1545 = _1533;
    if (_1527)
    {
        float _1547 = rsqrt(_1523);
        _1535 = _1547;
    }
    float _1549 = _1535;
    float _1551 = _1549;
    if (_1527)
    {
        float _1553 = _1531 * _1545;
        _1537 = _1553;
    }
    float _1555 = _1537;
    if (_1527)
    {
        float _1557 = _1555 * 0.15915493667125701904296875;
        _1539 = _1557;
    }
    float _1559 = _1539;
    float _1561 = _1491;
    float _1563 = _1559;
    if (_1527)
    {
        float _1565 = _1559 * 6.283185482025146484375;
        float _1567 = sin(_1565);
        _1561 = _1567;
    }
    float _1569 = _1561;
    float _1571 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1573 = precise::max(0.0, _1571);
    float _1575 = _1545;
    float _1577 = _1573;
    if (_1527)
    {
        float _1579 = _1559 * 6.283185482025146484375;
        float _1581 = cos(_1579);
        _1575 = _1581;
    }
    float _1583 = _1575;
    float _1585 = -_1513;
    float _1587 = -_1573;
    float _1589 = fma(_1483, _1585, _1587);
    if (_1527)
    {
        float _1591 = _1589 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1541 = _1591;
    }
    float _1593 = _1541;
    float _1595 = _1593;
    float _1597 = _1569;
    if (_1527)
    {
        float _1599 = fma(_1569, _1593, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1595 = _1599;
    }
    float _1601 = _1595;
    float _1603 = _1601;
    if (!_1527)
    {
        _1597 = _1515;
    }
    float _1605 = _1597;
    float _1607 = _1605;
    float _1609 = _1583;
    if (_1527)
    {
        float _1611 = _1583 + (-1.0);
        _1577 = _1611;
    }
    float _1613 = _1577;
    float _1615 = _1613;
    if (_1527)
    {
        float _1617 = _1549 * _1601;
        _1285 = _1617;
    }
    float _1619 = _1285;
    if (!_1527)
    {
        _1603 = _1589;
    }
    float _1621 = _1603;
    float _1623 = _1621;
    if (_1527)
    {
        float _1625 = _1613 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1563 = _1625;
    }
    float _1627 = _1563;
    if (_1527)
    {
        float _1629 = _1515 * _1619;
        _1607 = _1629;
    }
    float _1631 = _1607;
    if (!_1527)
    {
        _1615 = _1517;
    }
    float _1633 = _1615;
    float _1635 = _1633;
    if (_1527)
    {
        float _1637 = _1517 * _1619;
        _1635 = _1637;
    }
    float _1639 = _1635;
    if (!_1527)
    {
        _1551 = _1519;
    }
    float _1641 = _1551;
    float _1643 = _1641;
    if (_1527)
    {
        float _1645 = fma(_1589, _1583, _1627);
        _1623 = _1645;
    }
    float _1647 = _1623;
    if (_1527)
    {
        float _1649 = _1631 * _1631;
        _1643 = _1649;
    }
    float _1651 = _1643;
    if (!_1527)
    {
        _1609 = _1521;
    }
    float _1653 = _1609;
    float _1655 = _1653;
    if (_1527)
    {
        float _1657 = _1639 * _1639;
        _1655 = _1657;
    }
    float _1659 = _1655;
    float _1661 = fma(_1647, _1647, _1651);
    float _1663 = _1405 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1665 = _1661 + _1659;
    float _1667 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1669 = fma(_1511, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1667);
    float _1671 = precise::clamp(_1669, 0.0, 1.0);
    float _1673 = fma(_1407, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1663);
    float _1675 = _1405 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1677 = -_1671;
    float _1679 = _1677 + 1.0;
    float _1681 = rsqrt(_1665);
    float _1683 = fma(_1407, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1675);
    float _1685 = fma(_1409, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1673);
    float _1687 = fma(_1409, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1683);
    float _1689 = _1685 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1691 = _1405 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1693 = abs(_1679);
    float _1695 = log2(_1693);
    float _1697 = _1687 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1699 = _1689 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1701 = fma(_1407, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1691);
    float _1703 = _1697 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1705 = -_1699;
    float _1707 = fma(_1705, _1493, 1.0);
    float _1709 = fma(_1409, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1701);
    float _1711 = _1681 * _1631;
    float _1713 = _1681 * _1647;
    float _1715 = _1681 * _1639;
    float _1717 = fma(_1509, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1703);
    float _1719 = _1711 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1721 = _1709 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1723 = log2(_1707);
    float _1725 = fma(_1689, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1717);
    float _1727 = -_1719;
    float _1729 = fma(_1713, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1727);
    float _1731 = _1695 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1733 = _1697 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1735 = fma(_1721, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1725);
    float _1737 = -_1715;
    float _1739 = fma(_1737, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1729);
    float _1741 = _1697 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1743 = fma(_1509, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1733);
    float _1745 = exp2(_1731);
    float _1747 = fma(_1739, -0.5, 0.5);
    float _1749 = fma(_1739, 0.5, 0.5);
    float _1751 = fma(_1509, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1741);
    float _1753 = _1713 + 1.0;
    float _1755 = fma(_1689, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1743);
    float _1757 = fma(_1749, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1759 = fma(_1689, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1751);
    float _1761 = 1.0 / _1735;
    float _1763 = fma(_1749, _1757, -0.212114393711090087890625);
    float _1765 = fma(_1721, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1759);
    float _1767 = fma(_1749, _1763, 1.570728778839111328125);
    float _1769 = sqrt(_1747);
    float _1771 = -_1713;
    float _1773 = fma(_1745, _1753, _1771);
    float _1775 = fma(_1721, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1755);
    float _1777 = _1723 * 0.693147182464599609375;
    float _1779 = _1777 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1781 = _1765 * _1761;
    float _1783 = _1775 * _1761;
    float _1785 = fma(_1781, 0.5, 0.5);
    float _1787 = fma(_1783, -0.5, 0.5);
    float _1789 = _1769 * 0.636619746685028076171875;
    float _1791 = fma(_1773, 0.5, 0.5);
    float _1793 = -_1767;
    float _1795 = fma(_1789, _1793, 1.0);
    float3 _6175 = float3(_1785, _1787, _1779);
    float _1797 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6175, float3(0.0), isnan(_6175)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6175, float3(0.0), isnan(_6175)), level(0.0)).x;
    float3 _6186 = float3(_1785, _1787, _1779);
    float4 _1800 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6186, float3(0.0), isnan(_6186)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6186, float3(0.0), isnan(_6186)), level(0.0)).xyzw;
    float _1802 = _1800.x;
    float _1804 = _1800.y;
    float _1806 = _1800.z;
    float _1808 = _1800.w;
    float2 _6203 = float2(_1795, _1791);
    float3 _1812 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6203, float2(0.0), isnan(_6203)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6203, float2(0.0), isnan(_6203)), level(0.0)).xyz;
    float _1814 = _1812.x;
    float _1816 = _1812.y;
    float _1818 = _1812.z;
    float _1820 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1822 = int(_1820);
    int _1824 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1826 = _1824 != 0;
    float _1828 = -_859;
    float _1830 = _1828 + 1.0;
    int _1832 = abs(_1219);
    float _1834 = -_857;
    float _1836 = _1834 + 1.0;
    int _1838 = abs(_1237);
    out.m_64.x = _1407;
    out.m_64.y = _1405;
    out.m_64.z = _1409;
    int _1840 = abs(_1265);
    float _1842 = trunc(_851);
    int _1844 = int(_1842);
    bool _1846 = _337 > 0.5;
    float _1848 = _1695 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1850 = _339 > 0.5;
    float _1852 = _1697 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1854 = -_863;
    float _1856 = _1854 + 1.0;
    float _1858 = -_843;
    float _1860 = _1858 + 1.0;
    float _1862 = -_853;
    float _1864 = _1862 + 1.0;
    float _1866 = float(uint(_1822));
    float _1868 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1870 = int(_1868);
    int _1872 = ~_1822;
    int _1874 = _1872 + 1;
    bool _1876 = _1822 == 0;
    float _1878 = float(uint(_1844));
    float _1880 = 1.0 / _1866;
    float _1882 = float(uint(_1870));
    float _1884 = trunc(_855);
    int _1886 = int(_1884);
    int _1888 = ~_1822;
    int _1890 = _1888 + 1;
    int _1892 = ~_1870;
    int _1894 = _1892 + 1;
    int _1896 = as_type<int>(_1880) + (-2);
    float _1898 = 1.0 / _1882;
    if (_1826)
    {
        _871 = _331;
    }
    float _1900 = _871;
    float _1902 = _1900;
    if (!_1826)
    {
        _1902 = _337;
    }
    float _1904 = _1902;
    float _1906 = as_type<float>(_1896) * _1878;
    float _1908 = -_213;
    int _1910 = _1846 ? as_type<int>(_1908) : as_type<int>(_213);
    float _1912 = trunc(_1906);
    float _1914 = precise::max(_1912, 0.0);
    uint _1917 = uint(_1914);
    float _1919 = float(uint(_1886));
    int _1921 = as_type<int>(_1898) + (-2);
    float _1923 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1925 = _1906;
    if (_1826)
    {
        _1925 = 1.0;
    }
    float _1927 = _1925;
    float _1929 = _1927;
    if (!_1826)
    {
        _1929 = 1.2345600128173828125;
    }
    float _1931 = _1929;
    float _1933 = as_type<float>(_1921) * _1919;
    int _1935 = ~_1870;
    int _1937 = _1935 + 1;
    int _1939 = _1890 * int(_1917);
    int _1941 = _1939 + _1844;
    float _1943 = _1931 * _1904;
    float _1945 = float(_1844);
    float _1947 = trunc(_1933);
    float _1949 = precise::max(_1947, 0.0);
    uint _1951 = uint(_1949);
    float _1953 = float(uint(_1941));
    float _1955 = as_type<float>(_1941);
    if (_1826)
    {
        _1955 = 1.0;
    }
    float _1957 = _1955;
    float _1959 = _1957;
    if (!_1826)
    {
        _1959 = 7.345489978790283203125;
    }
    float _1961 = _1959;
    float _1963 = as_type<float>(_1896) * _1953;
    float _1965 = floor(_1943);
    int _1967 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1969 = _1967 != 0;
    float _1971 = _1923 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1973 = _1961 * _331;
    float _1975 = trunc(_1963);
    float _1977 = precise::max(_1975, 0.0);
    uint _1979 = uint(_1977);
    int _1981 = _1937 * int(_1951);
    int _1983 = _1981 + _1886;
    float _1985 = float(uint(_1983));
    float _1987 = floor(_1973);
    float _1989 = as_type<float>(_1921) * _1985;
    int _1991 = int(_1917) + int(_1979);
    float _1993 = trunc(_1989);
    float _1995 = precise::max(_1993, 0.0);
    uint _1997 = uint(_1995);
    float _1999 = float(_1822);
    int _2001 = _1874 * _1991;
    int _2003 = _2001 + _1844;
    bool _2005 = _1945 >= _1999;
    bool _2007 = isnan(_1945);
    bool _2009 = _2005 || _2007;
    bool _2011 = isnan(_1999);
    bool _2013 = _2009 || _2011;
    float _2015 = float(_2013);
    float _2017 = -_1987;
    float _2019 = _1973 + _2017;
    float _2021 = -_1965;
    float _2023 = _1943 + _2021;
    bool _2025 = uint(_2003) >= uint(_1822);
    float _2027 = exp2(_1848);
    float _2029 = float(_1870);
    bool _2031 = !_2025;
    int _2033 = _2031 ? 0 : (-1);
    int _2035 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2037 = _2035 != 0;
    int _2039 = ~_1991;
    int _2041 = _2039 + _2033;
    int _2043 = _2041 + 1;
    float _2045 = trunc(_2015);
    int _2047 = int(_2045);
    int _2049 = int(_1951) + int(_1997);
    float _2051 = _2019 * _1999;
    float _2053 = float(_1886);
    int _2055 = _1822 * _2043;
    int _2057 = _2055 + _1844;
    int _2059 = _1822 + (-1);
    int _2061 = _1894 * _2049;
    int _2063 = _2061 + _1886;
    bool _2065 = _2053 >= _2029;
    bool _2067 = isnan(_2053);
    bool _2069 = _2065 || _2067;
    bool _2071 = isnan(_2029);
    bool _2073 = _2069 || _2071;
    float _2075 = float(_2073);
    float _2077 = _1999 * _841;
    bool _2079 = !_1876;
    int _2081 = _2079 ? _2057 : (-1);
    float _2083 = trunc(_2051);
    int _2085 = int(_2083);
    bool _2087 = !_2037;
    int _2089 = _2087 ? 0 : 1;
    float _2091 = _2029 * _841;
    bool _2093 = uint(_2063) >= uint(_1870);
    float _2095 = -_2027;
    float _2097 = _2095 + 1.0;
    int _2099 = abs(_2089);
    int _2101 = ~_2047;
    int _2103 = _2101 + 1;
    int _2105 = _2103 + 1;
    float _2107 = trunc(_2075);
    int _2109 = int(_2107);
    int _2111 = _2081 * _2105;
    bool _2113 = !_2093;
    int _2115 = _2113 ? 0 : (-1);
    bool _2117 = _1870 == 0;
    int _2119 = _2047 * _2059;
    int _2121 = _2119 + _2111;
    int _2123 = abs(_517);
    float _2125 = trunc(_2091);
    int _2127 = int(_2125);
    int _2129 = ~_2049;
    int _2131 = _2129 + _2115;
    int _2133 = _2131 + 1;
    int _2135 = _1870 * _2133;
    int _2137 = _2135 + _1886;
    float _2139 = _2023 * _2029;
    float _2141 = trunc(_2077);
    int _2143 = int(_2141);
    int _2145 = _2085 * _2099;
    int _2147 = _2145 + _1844;
    int _2149 = abs(_561);
    int _2151 = _2121 * _2123;
    int _2153 = ~_2109;
    int _2155 = _2153 + 1;
    int _2157 = _2155 + 1;
    bool _2159 = !_2117;
    int _2161 = _2159 ? _2137 : (-1);
    float _2163 = trunc(_2139);
    int _2165 = int(_2163);
    int _2167 = abs(_523);
    bool _2169 = !_1969;
    int _2171 = _2169 ? 0 : 1;
    int _2173 = _2161 * _2157;
    int _2175 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2177 = _2175 != 0;
    int _2179 = _2143 * _2167;
    int _2181 = _2179 + _2151;
    int _2183 = abs(_2171);
    float _2185 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _2187 = !_2177;
    int _2189 = _2187 ? 0 : 1;
    int _2191 = _2147 * _2149;
    int _2193 = _2191 + _2181;
    int _2195 = _1870 + (-1);
    int _2197 = abs(_2189);
    int _2199 = _2085 * _2183;
    int _2201 = _2199 + _2193;
    int _2203 = abs(_1227);
    int _2205 = _2109 * _2195;
    int _2207 = _2205 + _2173;
    float _2209 = float(uint(_2201));
    int _2211 = _2207 * _1832;
    int _2213 = _2165 * _2197;
    int _2215 = _2213 + _1886;
    float _2217 = float(uint(_2147));
    float _2219 = as_type<float>(_1896) * _2209;
    int _2221 = ~_1822;
    int _2223 = _2221 + 1;
    int _2225 = _2127 * _2203;
    int _2227 = _2225 + _2211;
    int _2229 = ~_1870;
    int _2231 = _2229 + 1;
    float _2233 = trunc(_2219);
    float _2235 = precise::max(_2233, 0.0);
    uint _2237 = uint(_2235);
    int _2239 = ~_1870;
    int _2241 = _2239 + 1;
    int _2243 = _2215 * _1838;
    int _2245 = _2243 + _2227;
    int _2247 = ~_1822;
    int _2249 = _2247 + 1;
    int _2251 = _2165 * _1840;
    int _2253 = _2251 + _2245;
    float _2255 = as_type<float>(_1896) * _2217;
    float _2257 = float(uint(_2253));
    int _2259 = _2223 * int(_2237);
    int _2261 = _2259 + _2201;
    float _2263 = trunc(_2255);
    float _2265 = precise::max(_2263, 0.0);
    uint _2267 = uint(_2265);
    float _2269 = as_type<float>(_1921) * _2257;
    float _2271 = float(uint(_2215));
    float _2273 = float(uint(_2261));
    float _2275 = as_type<float>(_1921) * _2271;
    float _2277 = trunc(_2269);
    float _2279 = precise::max(_2277, 0.0);
    uint _2281 = uint(_2279);
    float _2283 = as_type<float>(_1896) * _2273;
    float _2285 = trunc(_2283);
    float _2287 = precise::max(_2285, 0.0);
    uint _2289 = uint(_2287);
    int _2291 = _2249 * int(_2267);
    int _2293 = _2291 + _2147;
    float _2295 = float(uint(_2293));
    float _2297 = trunc(_2275);
    float _2299 = precise::max(_2297, 0.0);
    uint _2301 = uint(_2299);
    int _2303 = _2231 * int(_2281);
    int _2305 = _2303 + _2253;
    float _2307 = as_type<float>(_1896) * _2295;
    int _2309 = ~_1822;
    int _2311 = _2309 + 1;
    float _2313 = float(uint(_2305));
    float _2315 = trunc(_2307);
    float _2317 = precise::max(_2315, 0.0);
    uint _2319 = uint(_2317);
    int _2321 = int(_2237) + int(_2289);
    float _2323 = as_type<float>(_1921) * _2313;
    int _2325 = _2241 * int(_2301);
    int _2327 = _2325 + _2215;
    float _2329 = trunc(_2323);
    float _2331 = precise::max(_2329, 0.0);
    uint _2333 = uint(_2331);
    int _2335 = _2311 * _2321;
    int _2337 = _2335 + _2201;
    float _2339 = float(uint(_2327));
    bool _2341 = uint(_2337) >= uint(_1822);
    float _2343 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _2345 = as_type<float>(_1921) * _2339;
    bool _2347 = !_2341;
    int _2349 = _2347 ? 0 : (-1);
    int _2351 = ~_1822;
    int _2353 = _2351 + 1;
    float _2355 = _2343 * _331;
    int _2357 = int(_2267) + int(_2319);
    float _2359 = -_213;
    float _2361 = _2359 + 0.5;
    int _2363 = ~_2321;
    int _2365 = _2363 + _2349;
    int _2367 = _2365 + 1;
    float _2369 = trunc(_2345);
    float _2371 = precise::max(_2369, 0.0);
    uint _2373 = uint(_2371);
    float _2375 = _209 + 0.5;
    int _2377 = ~_1870;
    int _2379 = _2377 + 1;
    int _2381 = _1822 * _2367;
    int _2383 = _2381 + _2201;
    int _2385 = int(_2281) + int(_2333);
    int _2387 = _2353 * _2357;
    int _2389 = _2387 + _2147;
    out.m_66.x = _2375;
    out.m_66.y = _2361;
    float _2391 = trunc(_2355);
    int _2393 = int(_2391);
    bool _2395 = !_1876;
    int _2397 = _2395 ? _2383 : (-1);
    int _2399 = _2379 * _2385;
    int _2401 = _2399 + _2253;
    bool _2403 = uint(_2389) >= uint(_1822);
    bool _2405 = uint(_2401) >= uint(_1870);
    int _2407 = _2397 & 3;
    bool _2409 = _2407 != 0;
    bool _2411 = !_2403;
    int _2413 = _2411 ? 0 : (-1);
    bool _2415 = !_2405;
    int _2417 = _2415 ? 0 : (-1);
    bool _2419 = uint(_2407) >= 2u;
    int _2421 = ~_2357;
    int _2423 = _2421 + _2413;
    int _2425 = _2423 + 1;
    int _2427 = _2393 << 4;
    int _2429 = _2427 + 1712;
    int _2431 = ~_2385;
    int _2433 = _2431 + _2417;
    int _2435 = _2433 + 1;
    int _2437 = _1822 * _2425;
    int _2439 = _2437 + _2147;
    int _2441 = _2397 & 3;
    bool _2443 = _2441 != 0;
    uint _2445 = uint(int(uint(_2429) >> uint(2)));
    uint _2447 = uint(int(uint(int(_2445)) >> uint(2)));
    int _2449 = int(_2445) & 3;
    float _2451 = (*spvDescriptorSet0.vp_c9)._m0[int(_2447)][_2449];
    int _2453 = int(_2445) + 1;
    uint _2455 = uint(int(uint(_2453) >> uint(2)));
    int _2457 = _2453 & 3;
    float _2459 = (*spvDescriptorSet0.vp_c9)._m0[int(_2455)][_2457];
    int _2461 = _2419 ? 0 : 1;
    int _2463 = _1870 * _2435;
    int _2465 = _2463 + _2253;
    bool _2467 = _2407 != 3;
    int _2469 = _2443 ? 0 : 1;
    bool _2471 = uint(_2407) > 1u;
    int _2473 = _2429 + 8;
    uint _2475 = uint(int(uint(_2473) >> uint(2)));
    uint _2477 = uint(int(uint(int(_2475)) >> uint(2)));
    int _2479 = int(_2475) & 3;
    float _2481 = (*spvDescriptorSet0.vp_c9)._m0[int(_2477)][_2479];
    int _2483 = _2397 >> 31;
    int _2485 = ~_2461;
    int _2487 = _2485 + 1;
    int _2489 = _2487 + 1;
    int _2491 = _2483 & 3;
    bool _2493 = !_2117;
    int _2495 = _2493 ? _2465 : (-1);
    int _2497 = _2489;
    if (_2467)
    {
        int _2499 = ~_2461;
        int _2501 = _2499 + 1;
        _2497 = _2501;
    }
    int _2503 = _2497;
    int _2505 = _2397 + _2491;
    int _2507 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2509 = _2507 != 0;
    int _2511 = ~_2469;
    int _2513 = _2511 + 1;
    int _2515 = _2513 + 1;
    int _2517 = _2515;
    if (!_2471)
    {
        int _2519 = ~_2469;
        int _2521 = _2519 + 1;
        _2517 = _2521;
    }
    int _2523 = _2517;
    bool _2525 = _2407 != 3;
    bool _2527 = !_2509;
    int _2529 = _2527 ? 0 : 1;
    int _2531 = _2505 >> 2;
    int _2533 = _2495 & 3;
    bool _2535 = _2533 != 0;
    int _2537 = ~_1870;
    int _2539 = _2537 + 1;
    bool _2541 = !_1876;
    int _2543 = _2541 ? _2439 : (-1);
    int _2545 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2547 = _2545 != 0;
    bool _2549 = !_2409;
    int _2551 = _2549 ? 0 : 1;
    int _2553 = _2531 << 4;
    int _2555 = _2553 + 368;
    bool _2557 = uint(_2533) > 1u;
    float _2559 = _2451 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _2561 = !_2547;
    int _2563 = _2561 ? 0 : 1;
    uint _2565 = uint(int(uint(_2555) >> uint(2)));
    uint _2567 = uint(int(uint(int(_2565)) >> uint(2)));
    int _2569 = int(_2565) & 3;
    float _2571 = (*spvDescriptorSet0.vp_c9)._m0[int(_2567)][_2569];
    int _2573 = int(_2565) + 1;
    uint _2575 = uint(int(uint(_2573) >> uint(2)));
    int _2577 = _2573 & 3;
    float _2579 = (*spvDescriptorSet0.vp_c9)._m0[int(_2575)][_2577];
    int _2581 = _2495 & 3;
    bool _2583 = _2581 != 0;
    float _2585 = _2459 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _2587 = !_2525;
    int _2589 = _2587 ? 0 : (-1);
    float _2591 = _2559 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2593 = _2533 != 3;
    float _2595 = _2481 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _2597 = _2583 ? 0 : 1;
    float _2599 = _2585 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2601 = uint(_2533) >= 2u;
    float _2603 = _2595 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2605 = int(_2301) + int(_2373);
    int _2607 = ~_2597;
    int _2609 = _2607 + 1;
    int _2611 = _2609 + 1;
    int _2613 = _2611;
    if (!_2557)
    {
        int _2615 = ~_2597;
        int _2617 = _2615 + 1;
        _2613 = _2617;
    }
    int _2619 = _2613;
    int _2621 = _2601 ? 0 : 1;
    bool _2623 = _2533 != 3;
    int _2625 = _2539 * _2605;
    int _2627 = _2625 + _2215;
    bool _2629 = !_2535;
    int _2631 = _2629 ? 0 : 1;
    int _2633 = ~_2621;
    int _2635 = _2633 + 1;
    int _2637 = _2635 + 1;
    int _2639 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2641 = _2639 != 0;
    int _2643 = _2637;
    if (_2593)
    {
        int _2645 = ~_2621;
        int _2647 = _2645 + 1;
        _2643 = _2647;
    }
    int _2649 = _2643;
    bool _2651 = !_2623;
    int _2653 = _2651 ? 0 : (-1);
    float _2655 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    bool _2657 = uint(_2627) >= uint(_1870);
    int _2659 = _2555 + 8;
    uint _2661 = uint(int(uint(_2659) >> uint(2)));
    uint _2663 = uint(int(uint(int(_2661)) >> uint(2)));
    int _2665 = int(_2661) & 3;
    float _2667 = (*spvDescriptorSet0.vp_c9)._m0[int(_2663)][_2665];
    int _2669 = int(_2661) + 1;
    uint _2671 = uint(int(uint(_2669) >> uint(2)));
    int _2673 = _2669 & 3;
    float _2675 = (*spvDescriptorSet0.vp_c9)._m0[int(_2671)][_2673];
    int _2677 = _2495 >> 31;
    float _2679 = _2655 * _331;
    int _2681 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2683 = _2681 != 0;
    bool _2685 = _331 > 0.5;
    float _2687 = trunc(_2679);
    int _2689 = int(_2687);
    int _2691 = _2677 & 3;
    int _2693 = abs(_2523);
    float _2695 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _2697 = _2495 + _2691;
    float _2699 = _2185 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _2701 = !_2657;
    int _2703 = _2701 ? 0 : (-1);
    float _2705 = _387 + 0.5;
    int _2707 = _2697 >> 2;
    out.m_68.x = _2591;
    out.m_68.y = _2599;
    out.m_68.z = _2603;
    out.m_68.w = _2695;
    int _2709 = ~_2693;
    int _2711 = _2709 + 1;
    int _2713 = _2711 + 1;
    float _2715 = fma(_2699, _2705, _839);
    int _2717 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2719 = _2717 != 0;
    float _2721 = _391 + (-0.5);
    float _2723 = _1087 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2725 = _2713 * as_type<int>(_2579);
    float _2727 = _1103 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2729 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2731 = int(_2729);
    float _2733 = -_1971;
    float _2735 = -_867;
    float _2737 = fma(_2733, _2721, _2735);
    float _2739 = _1087 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2741 = abs(_2589);
    float _2743 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2727);
    int _2745 = ~_2605;
    int _2747 = _2745 + _2703;
    int _2749 = _2747 + 1;
    float _2751 = -_1071;
    float _2753 = fma(_2751, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2739);
    int _2755 = abs(_2551);
    float _2757 = -_1071;
    float _2759 = fma(_2757, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2723);
    int _2761 = _2707 << 4;
    int _2763 = _2761 + 512;
    float _2765 = _1087 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2767 = ~_2755;
    int _2769 = _2767 + 1;
    int _2771 = _2769 + 1;
    float _2773 = _1103 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    uint _2775 = uint(int(uint(_2763) >> uint(2)));
    uint _2777 = uint(int(uint(int(_2775)) >> uint(2)));
    int _2779 = int(_2775) & 3;
    float _2781 = (*spvDescriptorSet0.vp_c9)._m0[int(_2777)][_2779];
    int _2783 = int(_2775) + 1;
    uint _2785 = uint(int(uint(_2783) >> uint(2)));
    int _2787 = _2783 & 3;
    float _2789 = (*spvDescriptorSet0.vp_c9)._m0[int(_2785)][_2787];
    int _2791 = abs(_2619);
    int _2793 = _1870 * _2749;
    int _2795 = _2793 + _2215;
    float _2797 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2773);
    int _2799 = _2771 * as_type<int>(_2571);
    int _2801 = _2799 + _2725;
    int _2803 = abs(_2503);
    float _2805 = _1103 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2807 = float(uint(_2731));
    int _2809 = _2763 + 8;
    uint _2811 = uint(int(uint(_2809) >> uint(2)));
    uint _2813 = uint(int(uint(int(_2811)) >> uint(2)));
    int _2815 = int(_2811) & 3;
    float _2817 = (*spvDescriptorSet0.vp_c9)._m0[int(_2813)][_2815];
    int _2819 = int(_2811) + 1;
    uint _2821 = uint(int(uint(_2819) >> uint(2)));
    int _2823 = _2819 & 3;
    float _2825 = (*spvDescriptorSet0.vp_c9)._m0[int(_2821)][_2823];
    int _2827 = ~_2803;
    int _2829 = _2827 + 1;
    int _2831 = _2829 + 1;
    float _2833 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2805);
    float _2835 = -_1071;
    float _2837 = fma(_2835, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2765);
    int _2839 = abs(_2529);
    int _2841 = _2831 * as_type<int>(_2667);
    int _2843 = _2841 + _2801;
    int _2845 = ~_2741;
    int _2847 = _2845 + 1;
    int _2849 = _2847 + 1;
    float _2851 = _1111 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2853 = ~_2839;
    int _2855 = _2853 + 1;
    int _2857 = _2855 + 1;
    float _2859 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2753);
    int _2861 = abs(_2649);
    int _2863 = _2849 * as_type<int>(_2675);
    int _2865 = _2863 + _2843;
    float _2867 = _1111 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2869 = 1.0 / _2807;
    float _2871 = _1111 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2873 = fma(_1097, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2867);
    float _2875 = fma(_1097, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2851);
    float _2877 = fma(_1097, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2871);
    int _2879 = _2865 * _2857;
    int _2881 = abs(_2631);
    float _2883 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2885 = int(_2883);
    int _2887 = ~_2791;
    int _2889 = _2887 + 1;
    int _2891 = _2889 + 1;
    int _2893 = _2543 * _2839;
    int _2895 = _2893 + _2879;
    int _2897 = ~_2881;
    int _2899 = _2897 + 1;
    int _2901 = _2899 + 1;
    float _2903 = fma(_1123, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2873);
    int _2905 = abs(_2563);
    float _2907 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2759);
    float _2909 = float(uint(_2895));
    float _2911 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2837);
    int _2913 = _2689 << 4;
    int _2915 = _2913 + 1968;
    float _2917 = _209 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _2919 = !_2641;
    float _2921 = _2919 ? _213 : as_type<float>(_1910);
    float _2923 = _213 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2925 = _2915 + 8;
    uint _2927 = uint(int(uint(_2925) >> uint(2)));
    uint _2929 = uint(int(uint(int(_2927)) >> uint(2)));
    int _2931 = int(_2927) & 3;
    float _2933 = (*spvDescriptorSet0.vp_c9)._m0[int(_2929)][_2931];
    float _2935 = -_209;
    int _2937 = _2685 ? as_type<int>(_2935) : as_type<int>(_209);
    float _2939 = float(uint(_2885));
    float _2941 = fma(_2923, _2923, 1.0);
    int _2943 = _2891 * as_type<int>(_2789);
    int _2945 = as_type<int>(_2869) + (-2);
    int _2947 = _2901 * as_type<int>(_2781);
    int _2949 = _2947 + _2943;
    float _2951 = as_type<float>(_2945) * _2909;
    int _2953 = abs(_2653);
    float _2955 = 1.0 / _2939;
    int _2957 = ~_2861;
    int _2959 = _2957 + 1;
    int _2961 = _2959 + 1;
    int _2963 = abs(_2731);
    int _2965 = ~_2953;
    int _2967 = _2965 + 1;
    int _2969 = _2967 + 1;
    int _2971 = _2961 * as_type<int>(_2817);
    int _2973 = _2971 + _2949;
    float _2975 = trunc(_2951);
    float _2977 = precise::max(_2975, 0.0);
    uint _2979 = uint(_2977);
    int _2981 = ~_2905;
    int _2983 = _2981 + 1;
    int _2985 = _2983 + 1;
    int _2987 = _2969 * as_type<int>(_2825);
    int _2989 = _2987 + _2973;
    int _2991 = abs(_2885);
    float _2993 = float(uint(_2963));
    int _2995 = _2989 * _2985;
    bool _2997 = !_2117;
    int _2999 = _2997 ? _2795 : (-1);
    float _3001 = fma(_1123, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2875);
    float _3003 = 1.0 / _2993;
    float _3005 = float(uint(_2991));
    int _3007 = ~_2731;
    int _3009 = _3007 + 1;
    int _3011 = _2999 * _2905;
    int _3013 = _3011 + _2995;
    int _3015 = as_type<int>(_2955) + (-2);
    float _3017 = -_209;
    int _3019 = _1850 ? as_type<int>(_3017) : as_type<int>(_209);
    int _3021 = _3009 * int(_2979);
    int _3023 = _3021 + _2895;
    float _3025 = 1.0 / _3005;
    float _3027 = float(uint(_3013));
    float _3029 = fma(_1123, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2877);
    int _3031 = abs(_2895);
    uint _3033 = uint(int(uint(_2915) >> uint(2)));
    uint _3035 = uint(int(uint(int(_3033)) >> uint(2)));
    int _3037 = int(_3033) & 3;
    float _3039 = (*spvDescriptorSet0.vp_c9)._m0[int(_3035)][_3037];
    int _3041 = int(_3033) + 1;
    uint _3043 = uint(int(uint(_3041) >> uint(2)));
    int _3045 = _3041 & 3;
    float _3047 = (*spvDescriptorSet0.vp_c9)._m0[int(_3043)][_3045];
    float _3049 = float(uint(_3023));
    float _3051 = as_type<float>(_3015) * _3027;
    int _3053 = abs(_3013);
    float _3055 = rsqrt(_2941);
    int _3057 = as_type<int>(_3003) + (-2);
    float _3059 = as_type<float>(_2945) * _3049;
    float _3061 = fma(_1115, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2833);
    float _3063 = fma(_1115, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2797);
    float _3065 = fma(_1115, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2743);
    float _3067 = float(uint(_3031));
    float _3069 = _2923 * _2911;
    float _3071 = trunc(_3051);
    float _3073 = precise::max(_3071, 0.0);
    uint _3075 = uint(_3073);
    int _3077 = as_type<int>(_3025) + (-2);
    float _3079 = as_type<float>(_3057) * _3067;
    float _3081 = float(uint(_3053));
    float _3083 = fma(_2917, _3065, _3069);
    bool _3085 = !_2683;
    float _3087 = _3085 ? _209 : as_type<float>(_3019);
    out.m_70.x = _3061;
    out.m_70.y = _3063;
    out.m_70.z = _3065;
    int _3089 = ~_2885;
    int _3091 = _3089 + 1;
    float _3093 = as_type<float>(_3077) * _3081;
    float _3095 = trunc(_3079);
    float _3097 = precise::max(_3095, 0.0);
    uint _3099 = uint(_3097);
    int _3101 = ~_2963;
    int _3103 = _3101 + 1;
    float _3105 = _2923 * _2859;
    bool _3107 = !_2719;
    float _3109 = _3107 ? _209 : as_type<float>(_2937);
    float _3111 = _2923 * _2907;
    int _3113 = ~_2991;
    int _3115 = _3113 + 1;
    float _3117 = fma(_2917, _3061, _3105);
    int _3119 = _3091 * int(_3075);
    int _3121 = _3119 + _3013;
    float _3123 = trunc(_3093);
    float _3125 = precise::max(_3123, 0.0);
    uint _3127 = uint(_3125);
    float _3129 = fma(_2917, _3063, _3111);
    int _3131 = ~_2963;
    int _3133 = _3131 + 1;
    float _3135 = float(uint(_3121));
    int _3137 = ~_2991;
    int _3139 = _3137 + 1;
    int _3141 = _3103 * int(_3099);
    int _3143 = _3141 + _3031;
    float _3145 = as_type<float>(_3015) * _3135;
    float _3147 = trunc(_3059);
    float _3149 = precise::max(_3147, 0.0);
    uint _3151 = uint(_3149);
    float _3153 = _2923 * _3055;
    float _3155 = float(uint(_3143));
    float _3157 = -_3001;
    float _3159 = _3153 * _3157;
    int _3161 = _3115 * int(_3127);
    int _3163 = _3161 + _3053;
    float _3165 = _3039 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _3167 = as_type<float>(_3057) * _3155;
    float _3169 = fma(_391, _1830, _2737);
    float _3171 = float(uint(_3163));
    float _3173 = _2903 + _3117;
    float _3175 = -_1836;
    float _3177 = fma(_387, _3175, _2715);
    float _3179 = trunc(_3167);
    float _3181 = precise::max(_3179, 0.0);
    uint _3183 = uint(_3181);
    float _3185 = -_2903;
    float _3187 = _3153 * _3185;
    float _3189 = as_type<float>(_3077) * _3171;
    float _3191 = -_3029;
    float _3193 = _3153 * _3191;
    int _3195 = int(_2979) + int(_3151);
    float _3197 = fma(_3055, _2859, _3187);
    float _3199 = _3001 + _3129;
    int _3201 = ~_2731;
    int _3203 = _3201 + 1;
    float _3205 = trunc(_3189);
    float _3207 = precise::max(_3205, 0.0);
    uint _3209 = uint(_3207);
    float _3211 = fma(_3055, _2907, _3159);
    float _3213 = fma(_3055, _2911, _3193);
    float _3215 = _3047 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _3217 = ~_2885;
    int _3219 = _3217 + 1;
    float _3221 = _2933 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _3223 = trunc(_3145);
    float _3225 = precise::max(_3223, 0.0);
    uint _3227 = uint(_3225);
    int _3229 = int(_3099) + int(_3183);
    int _3231 = _3203 * _3195;
    int _3233 = _3231 + _2895;
    float _3235 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _3237 = _3133 * _3229;
    int _3239 = _3237 + _3031;
    bool _3241 = uint(_3233) >= uint(_2731);
    float _3243 = _3165 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _3245 = int(_3127) + int(_3209);
    float _3247 = _3215 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3249 = _3221 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _3251 = uint(_3239) >= uint(_2963);
    float _3253 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _3255 = _3139 * _3245;
    int _3257 = _3255 + _3053;
    bool _3259 = !_3241;
    int _3261 = _3259 ? 0 : (-1);
    out.m_72.x = _3243;
    out.m_72.y = _3247;
    out.m_72.z = _3249;
    out.m_72.w = _3235;
    int _3263 = int(_3075) + int(_3227);
    float _3265 = fma(_1509, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1852);
    bool _3267 = uint(_3257) >= uint(_2991);
    float _3269 = -_861;
    float _3271 = _3269 + 1.0;
    bool _3273 = !_3251;
    int _3275 = _3273 ? 0 : (-1);
    int _3277 = _3219 * _3263;
    int _3279 = _3277 + _3013;
    int _3281 = ~_3195;
    int _3283 = _3281 + _3261;
    int _3285 = _3283 + 1;
    float _3287 = fma(_1689, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3265);
    int _3289 = _2895 ^ _2731;
    float _3291 = _3029 + _3083;
    bool _3293 = uint(_3279) >= uint(_2885);
    int _3295 = _2731 * _3285;
    int _3297 = _3295 + _2895;
    int _3299 = ~_3275;
    int _3301 = _3229 + _3299;
    int _3303 = _3301 + 1;
    float _3305 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    uint _3307 = uint(int(uint(_3289) >> uint(31)));
    out.m_74.x = _3177;
    out.m_74.y = _3169;
    bool _3309 = !_3293;
    int _3311 = _3309 ? 0 : (-1);
    bool _3313 = _2731 == 0;
    out.m_76.x = _3173;
    out.m_76.y = _3199;
    out.m_76.z = _3291;
    int _3315 = ~int(_3307);
    int _3317 = _3315 + 1;
    float _3319 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _3321 = ~_3263;
    int _3323 = _3321 + _3311;
    int _3325 = _3323 + 1;
    out.m_78.x = _3197;
    out.m_78.y = _3211;
    out.m_78.z = _3213;
    int _3327 = _3013 ^ _2885;
    bool _3329 = !_3313;
    int _3331 = _3329 ? _3297 : (-1);
    int _3333 = _2885 * _3325;
    int _3335 = _3333 + _3013;
    bool _3337 = !_3267;
    int _3339 = _3337 ? 0 : (-1);
    float _3341 = _3305 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _3343 = _3303 ^ _3317;
    float _3345 = _3253 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    uint _3347 = uint(int(uint(_3327) >> uint(31)));
    float _3349 = float(_3331);
    bool _3351 = _2885 == 0;
    float _3353 = _3319 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _3355 = _2731 == 0;
    float _3357 = fma(_3341, _3349, _443);
    int _3359 = ~_3317;
    int _3361 = _3359 + _3343;
    int _3363 = _3361 + 1;
    int _3365 = ~_3339;
    int _3367 = _3245 + _3365;
    int _3369 = _3367 + 1;
    int _3371 = ~int(_3347);
    int _3373 = _3371 + 1;
    float _3375 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _3377 = !_3351;
    int _3379 = _3377 ? _3335 : (-1);
    bool _3381 = !_3355;
    int _3383 = _3381 ? _3363 : (-1);
    int _3385 = _3369 ^ _3373;
    float _3387 = float(_3379);
    float _3389 = _3109 + 0.5;
    float _3391 = float(_3383);
    bool _3393 = _2885 == 0;
    float _3395 = fma(_3341, _3389, _3357);
    int _3397 = ~_3373;
    int _3399 = _3397 + _3385;
    int _3401 = _3399 + 1;
    float _3403 = -_845;
    float _3405 = fma(_3353, _3391, _3403);
    float _3407 = fma(_3345, _3387, _849);
    float _3409 = _3087 + 0.5;
    bool _3411 = !_3393;
    int _3413 = _3411 ? _3401 : (-1);
    float _3415 = _3375 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _3417 = _2921 + (-0.5);
    float _3419 = fma(_3345, _3409, _3407);
    float _3421 = float(_3413);
    float _3423 = _1187 + (-0.5);
    float _3425 = -_3353;
    float _3427 = fma(_3425, _3417, _3405);
    float _3429 = -_3271;
    float _3431 = fma(_3087, _3429, _3419);
    float _3433 = _2097 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3435 = -_865;
    float _3437 = fma(_3415, _3421, _3435);
    float _3439 = fma(_1721, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3287);
    float _3441 = _1765 + _1735;
    float _3443 = _1735 * 0.5;
    float _3445 = -_3415;
    float _3447 = fma(_3445, _3423, _3437);
    float _3449 = _3433 * _1797;
    bool _3451 = _1479 > 0.0;
    bool _3453 = isnan(_1479);
    bool _3455 = _3451 || _3453;
    bool _3457 = isnan(0.0);
    bool _3459 = _3455 || _3457;
    float _3461 = _3441 * 0.5;
    float _3463 = fma(_1775, -0.5, _3443);
    float _3465 = fma(_1187, _1856, _3447);
    float _3467 = _3439 + _1735;
    float _3469 = _1479 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3471 = _1808 * _3449;
    float _3473 = _1818 * _3449;
    float _3475 = -_3433;
    float _3477 = _3475 + 1.0;
    float _3479 = -_1860;
    float _3481 = fma(_3109, _3479, _3395);
    out.gl_Position.x = _1765;
    out.gl_Position.y = _1775;
    out.gl_Position.z = _3439;
    out.gl_Position.w = _1735;
    float _3483 = fma(_2921, _1864, _3427);
    float _3485 = _3467 * 0.5;
    float _3487 = _3469 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3489 = fma(_1814, _3471, _1802);
    float _3491 = fma(_1816, _3471, _1804);
    float _3493 = _1808 * _3477;
    float _3495 = fma(_1808, _3473, _1806);
    out.m_80.x = _3461;
    out.m_80.y = _3463;
    out.m_80.z = _3485;
    out.m_80.w = _1735;
    out.m_82.x = _3481;
    out.m_82.y = _3483;
    out.m_82.z = _3431;
    out.m_82.w = _3465;
    out.m_45.x = _3487;
    out.m_84.x = _3489;
    out.m_84.y = _3491;
    out.m_84.z = _3495;
    out.m_84.w = _3493;
    if (_3459)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _3497 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3497;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}


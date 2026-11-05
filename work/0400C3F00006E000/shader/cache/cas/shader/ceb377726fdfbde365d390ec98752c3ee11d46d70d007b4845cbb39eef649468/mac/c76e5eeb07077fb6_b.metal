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
    constant _16* vp_c7 [[id(4)]];
    constant _16* vp_c13 [[id(5)]];
    texture3d<float> vp_t_tcb_32 [[id(6)]];
    sampler vp_t_tcb_32Smplr [[id(7)]];
    texture3d<float> vp_t_tcb_30 [[id(8)]];
    sampler vp_t_tcb_30Smplr [[id(9)]];
    texture2d<float> vp_t_tcb_1C [[id(10)]];
    sampler vp_t_tcb_1CSmplr [[id(11)]];
    sampler vp_t_tcb_32Smplr_w [[id(12)]];
    sampler vp_t_tcb_30Smplr_w [[id(13)]];
    sampler vp_t_tcb_1CSmplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_60 [[user(locn0)]];
    float4 m_62 [[user(locn1)]];
    float4 m_64 [[user(locn2)]];
    float4 m_66 [[user(locn3)]];
    float4 m_74 [[user(locn4)]];
    float4 m_47 [[user(locn5)]];
    float4 m_68 [[user(locn6)]];
    float4 m_72 [[user(locn7)]];
    float4 m_70 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_53 [[attribute(2)]];
    float4 m_44 [[attribute(3)]];
    float4 m_49 [[attribute(4)]];
    float4 m_51 [[attribute(5)]];
    float4 m_58 [[attribute(6)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1398 = false;
    bool _279 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _88 = in.m_44.w;
    float _90 = trunc(_88);
    int _93 = int(_90);
    bool _97 = _93 >= 1;
    float _99 = 0.0;
    if (!_97)
    {
        _99 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _101 = _99;
    float _103 = _101;
    if (!_97)
    {
        out.m_47.x = 0.0;
    }
    int _105 = 0;
    if (!_97)
    {
        float _107 = _101 * 5.0;
        _105 = as_type<int>(_107);
    }
    int _109 = _105;
    int _111 = _109;
    if (!_97)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1697 = as_type<float>(_109);
        out.gl_Position.z = _1697;
    }
    if (!_97)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _113 = in.m_49.w;
    bool _115 = _113 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _117 = isnan(_113);
    bool _119 = _115 || _117;
    bool _121 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _123 = _119 || _121;
    float _125 = -_113;
    float _127 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_123)
    {
        float _129 = float(_93);
        _103 = _129;
    }
    float _131 = _103;
    bool _133 = _127 >= _131;
    bool _135 = !_123;
    bool _137 = _133 || _135;
    float _139 = _131;
    if (_137)
    {
        _139 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _141 = _139;
    if (_137)
    {
        out.m_47.x = 0.0;
    }
    if (_137)
    {
        float _143 = _141 * 5.0;
        _111 = as_type<int>(_143);
    }
    int _145 = _111;
    if (_137)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1766 = as_type<float>(_145);
        out.gl_Position.z = _1766;
    }
    if (_137)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _147 = in.m_51.x;
    float _149 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _151 = _127 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _153 = in.m_53.x;
    float _155 = in.m_53.y;
    float _157 = in.m_53.z;
    int _159 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _161 = _159 != 0;
    float _163 = _151 * _149;
    float _165 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[20].x, _163);
    float _167 = _165 * 6.283185482025146484375;
    float _169 = floor(_165);
    int _171 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _173 = _171 != 0;
    int _175 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _177 = _175 != 0;
    float _179 = _155 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _181 = _167 * 0.15915493667125701904296875;
    float _183 = _155 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _185 = _155 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _187 = !_173;
    int _189 = _187 ? 0 : 1;
    float _191 = fma(_153, (*spvDescriptorSet0.vp_c10)._m0[4].x, _179);
    float _193 = fma(_153, (*spvDescriptorSet0.vp_c10)._m0[5].x, _183);
    float _195 = _181 * 6.283185482025146484375;
    float _197 = cos(_195);
    float _199 = fma(_153, (*spvDescriptorSet0.vp_c10)._m0[6].x, _185);
    bool _201 = !_161;
    int _203 = _201 ? 0 : 1;
    float _205 = fma(_157, (*spvDescriptorSet0.vp_c10)._m0[4].z, _191);
    bool _207 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _209 = fma(_157, (*spvDescriptorSet0.vp_c10)._m0[5].z, _193);
    int _211 = abs(_203);
    float _213 = -_169;
    float _215 = _165 + _213;
    int _217 = abs(_189);
    bool _219 = !_177;
    int _221 = _219 ? 0 : 1;
    float _223 = float(_217);
    float _225 = -_215;
    float _227 = fma(_225, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _229 = abs(_221);
    float _231 = fma(_197, 0.5, 0.5);
    float _233 = abs(_227);
    float _235 = _223 * _233;
    bool _237 = _215 < 0.5;
    float _239 = float(_237);
    float _241 = -_231;
    float _243 = fma(_241, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _245 = float(_211);
    float _247 = -_239;
    float _249 = fma(_247, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _251 = float(_229);
    float _253 = fma(_157, (*spvDescriptorSet0.vp_c10)._m0[6].z, _199);
    float _255 = fma(_245, _243, _235);
    float _257 = abs(_249);
    float _259 = fma(_251, _257, _255);
    bool _261 = !_207;
    float _277;
    if (!_261)
    {
        float _263 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _265 = _147 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _267 = fma(_265, (*spvDescriptorSet0.vp_c9)._m0[12].x, _127);
        float _269 = _267 * _263;
        float _271 = floor(_269);
        float _273 = -_271;
        float _275 = _269 + _273;
        _277 = _275;
        _279 = true;
    }
    else
    {
        float _281 = float(_93);
        float _283 = 1.0 / _281;
        float _285 = _127 * _283;
        _277 = _285;
    }
    _279 = false;
    float _287 = _277;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _291 = _287 + _289;
    bool _293 = _287 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _295 = isnan(_287);
    bool _297 = _293 || _295;
    bool _299 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _301 = _297 || _299;
    float _303 = float(_301);
    float _305 = as_type<float>(int(gl_VertexIndex));
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _309 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _307;
    float _311 = in.m_58.x;
    float _313 = in.m_58.y;
    float _315 = -_303;
    float _317 = _315 + 1.0;
    float _319 = 1.0 / _309;
    float _321 = _291 * _319;
    bool _323 = _287 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _325 = isnan(_287);
    bool _327 = _323 || _325;
    bool _329 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _331 = _327 || _329;
    float _333 = float(_331);
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _337 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _335;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _341 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _339;
    int _343 = as_type<int>(_305) & 1;
    bool _345 = _343 != 0;
    int _347 = as_type<int>(_305) & 2;
    bool _349 = _347 != 0;
    float _351 = _333 * _317;
    float _353 = fma(_337, _321, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _355 = fma(_341, _321, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _357 = -_333;
    float _359 = _357 + 1.0;
    bool _361 = !_349;
    float _363 = _361 ? (-0.5) : 0.5;
    float _365 = _353 * _351;
    float _367 = _355 * _351;
    bool _369 = !_345;
    float _371 = _369 ? (-0.5) : 0.5;
    float _373 = in.m_44.x;
    float _375 = in.m_44.y;
    float _377 = in.m_44.z;
    float _379 = fma(_359, (*spvDescriptorSet0.vp_c9)._m0[143].y, _367);
    float _381 = fma(_359, (*spvDescriptorSet0.vp_c9)._m0[143].x, _365);
    float _383 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[144].y, _379);
    float _385 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[144].x, _381);
    float _387 = _383 * _313;
    float _389 = _385 * _311;
    float _391 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _371);
    float _393 = _259 * _387;
    float _395 = _259 * _389;
    float _397 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _363);
    float _399 = _393 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _401 = _395 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _403 = _399 * _397;
    float _405 = _401 * _391;
    float _407 = _375 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _409 = _375 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _411 = _403 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _413 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _415 = fma(_373, (*spvDescriptorSet0.vp_c10)._m0[6].x, _407);
    float _417 = _403 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _419 = fma(_405, (*spvDescriptorSet0.vp_c8)._m0[26].x, _411);
    float _421 = fma(_373, (*spvDescriptorSet0.vp_c10)._m0[4].x, _409);
    float _423 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[6].z, _415);
    float _425 = fma(_405, (*spvDescriptorSet0.vp_c8)._m0[24].x, _417);
    float _427 = fma(_413, (*spvDescriptorSet0.vp_c8)._m0[26].z, _419);
    float _429 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[4].z, _421);
    float _431 = _423 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _433 = fma(_413, (*spvDescriptorSet0.vp_c8)._m0[24].z, _425);
    float _435 = _427 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _437 = _429 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _439 = _375 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _441 = _433 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _443 = _431 + _435;
    float _445 = _403 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _447 = fma(_373, (*spvDescriptorSet0.vp_c10)._m0[5].x, _439);
    float _449 = _437 + _441;
    float _451 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _453 = _443 + _451;
    float _455 = fma(_405, (*spvDescriptorSet0.vp_c8)._m0[25].x, _445);
    float _457 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[5].z, _447);
    float _459 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _461 = _449 + _459;
    float _463 = _453 * _453;
    float _465 = fma(_413, (*spvDescriptorSet0.vp_c8)._m0[25].z, _455);
    float _467 = _457 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _469 = fma(_461, _461, _463);
    float _471 = _465 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _473 = sqrt(_469);
    float _475 = _467 + _471;
    bool _477 = _473 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _479 = _471;
    float _481 = _445;
    float _483 = _403;
    float _485 = _431;
    if (!_477)
    {
        _479 = _449;
    }
    float _487 = _479;
    float _489 = _487;
    if (!_477)
    {
        _481 = _443;
    }
    float _491 = _481;
    float _493 = _491;
    if (!_477)
    {
        _483 = _475;
    }
    float _495 = _483;
    bool _497 = !_477;
    float _499 = _495;
    if (!_497)
    {
        float _501 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _503 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _505 = _473 + _503;
        float _507 = rsqrt(_469);
        float _509 = _505 * _501;
        float _511 = _475 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _513 = _509 * 0.15915493667125701904296875;
        float _515 = _513 * 6.283185482025146484375;
        float _517 = cos(_515);
        float _519 = _513 * 6.283185482025146484375;
        float _521 = sin(_519);
        float _523 = _517 + (-1.0);
        float _525 = fma(_521, _511, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _527 = _523 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _529 = _507 * _525;
        float _531 = fma(_475, _517, _527);
        float _533 = fma(_461, _529, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _535 = fma(_453, _529, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _499 = _531;
        _489 = _533;
        _493 = _535;
    }
    float _537 = _499;
    float _539 = _489;
    float _541 = _493;
    float _543 = -_467;
    float _545 = _543 + _537;
    float _547 = -_437;
    float _549 = _547 + _539;
    float _551 = -_431;
    float _553 = _551 + _541;
    float _555 = _467 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _557 = _545 * _545;
    bool _559 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _561 = isnan(0.5);
    bool _563 = _559 || _561;
    bool _565 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _567 = _563 || _565;
    float _569 = fma(_437, (*spvDescriptorSet0.vp_c8)._m0[11].x, _555);
    float _571 = fma(_549, _549, _557);
    bool _573 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _575 = isnan(0.5);
    bool _577 = _573 || _575;
    bool _579 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _581 = _577 || _579;
    float _583 = fma(_431, (*spvDescriptorSet0.vp_c8)._m0[11].z, _569);
    float _585 = fma(_553, _553, _571);
    float _587 = _467 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _589 = _583 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _591 = sqrt(_585);
    float _593 = fma(_437, (*spvDescriptorSet0.vp_c8)._m0[10].x, _587);
    float _595 = fma(_431, (*spvDescriptorSet0.vp_c8)._m0[10].z, _593);
    float _597 = 1.0 / _589;
    float _599 = _595 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _601 = _599 + _589;
    bool _603 = _591 > 0.0;
    float _605 = _601 * _597;
    float _607 = _605 * 0.5;
    bool _609 = !_603;
    float _611 = _539;
    float _613 = _537;
    float _615 = _541;
    float _617 = 0.0;
    if (!_609)
    {
        float _619 = _209 * _209;
        float _621 = fma(_205, _205, _619);
        float _623 = rsqrt(_585);
        float _625 = fma(_253, _253, _621);
        float _627 = sqrt(_625);
        float _629 = _549 * _623;
        float _631 = _545 * _623;
        float _633 = _553 * _623;
        bool _635 = _627 > 0.0;
        bool _637 = !_635;
        _617 = _633;
        if (!_637)
        {
            float _639 = rsqrt(_625);
            float _641 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _643 = _209 * _639;
            float _645 = _205 * _639;
            float _647 = _253 * _639;
            float _649 = _631 * _643;
            float _651 = fma(_629, _645, _649);
            float _653 = _641 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _655 = fma(_633, _647, _651);
            float _657 = _655 * _653;
            float _659 = fma(_205, _657, _539);
            float _661 = fma(_209, _657, _537);
            float _663 = fma(_253, _657, _541);
            _611 = _659;
            _613 = _661;
            _615 = _663;
        }
    }
    float _665 = _611;
    float _667 = _613;
    float _669 = _615;
    float _671 = _617;
    float _673 = _671;
    float _675 = _667;
    float _677 = _665;
    float _679 = _669;
    if (_581)
    {
        _673 = 1.0;
    }
    float _681 = _673;
    float _683 = _681;
    if (!_567)
    {
        float _685 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _687 = _467 + _685;
        float _689 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _691 = _437 + _689;
        float _693 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _695 = -_437;
        float _697 = _695 + _665;
        float _699 = _687 * _687;
        float _701 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _703 = _431 + _701;
        float _705 = -_467;
        float _707 = _705 + _667;
        float _709 = -_431;
        float _711 = _709 + _669;
        float _713 = fma(_691, _691, _699);
        float _715 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _717 = fma(_703, _703, _713);
        float _719 = sqrt(_717);
        float _721 = _693 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _723 = precise::min(_719, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _725 = _723 * _715;
        float _727 = _721 * _725;
        float _729 = fma(_697, _727, _437);
        float _731 = fma(_707, _727, _467);
        float _733 = fma(_711, _727, _431);
        _675 = _731;
        _677 = _729;
        _679 = _733;
    }
    float _735 = _675;
    float _737 = _677;
    float _739 = _679;
    if (!_581)
    {
        float _741 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _743 = _741 * 0.15915493667125701904296875;
        float _745 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _747 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _749 = fma(_607, (*spvDescriptorSet0.vp_c8)._m0[30].w, _747);
        float _751 = _743 * 6.283185482025146484375;
        float _753 = cos(_751);
        float _755 = _745 * 0.15915493667125701904296875;
        float _757 = _743 * 6.283185482025146484375;
        float _759 = sin(_757);
        float _761 = 1.0 / _753;
        float _763 = _755 * 6.283185482025146484375;
        float _765 = cos(_763);
        float _767 = _759 * _761;
        float _769 = _755 * 6.283185482025146484375;
        float _771 = sin(_769);
        float _773 = _765 * _767;
        float _775 = 1.0 / _749;
        float _777 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _779 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _777;
        float _781 = 1.0 / _773;
        float _783 = 1.0 / _779;
        float _785 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _787 = _775 * _785;
        float _789 = _771 * _781;
        float _791 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _793 = fma(_789, _787, _791);
        float _795 = _793 * _783;
        float _797 = precise::clamp(_795, 0.0, 1.0);
        _485 = _781;
        _683 = _797;
    }
    float _799 = _485;
    float _801 = _683;
    float _803 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _805 = _735 + _803;
    float _807 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _809 = _737 + _807;
    float _811 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _813 = _739 + _811;
    float _815 = _805 * _805;
    float _817 = fma(_809, _809, _815);
    float _819 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _821 = fma(_813, _813, _817);
    float _823 = rsqrt(_821);
    float _825 = sqrt(_821);
    float _827 = _823 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _829 = _809 * _827;
    float _831 = _813 * _827;
    float _833 = _829 * _829;
    float _835 = _831 * _831;
    float _837 = _833 + _835;
    float _839 = sqrt(_837);
    bool _841 = _839 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _843 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _845 = _839 + _843;
    float _847 = _823;
    float _849 = _837;
    float _851 = _845;
    float _853 = _799;
    float _855 = _805;
    float _857 = _827;
    float _859 = _829;
    if (_841)
    {
        float _861 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _847 = _861;
    }
    float _863 = _847;
    if (_841)
    {
        float _865 = rsqrt(_837);
        _849 = _865;
    }
    float _867 = _849;
    if (_841)
    {
        float _869 = _845 * _863;
        _851 = _869;
    }
    float _871 = _851;
    if (_841)
    {
        float _873 = _871 * 0.15915493667125701904296875;
        _853 = _873;
    }
    float _875 = _853;
    float _877 = _863;
    float _879 = _875;
    if (_841)
    {
        float _881 = _875 * 6.283185482025146484375;
        float _883 = sin(_881);
        _877 = _883;
    }
    float _885 = _877;
    float _887 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _889 = precise::max(0.0, _887);
    float _891 = _813;
    float _893 = _889;
    if (_841)
    {
        float _895 = _875 * 6.283185482025146484375;
        float _897 = cos(_895);
        _891 = _897;
    }
    float _899 = _891;
    float _901 = -_827;
    float _903 = -_889;
    float _905 = fma(_805, _901, _903);
    if (!_841)
    {
        _855 = _831;
    }
    float _907 = _855;
    float _909 = _907;
    if (_841)
    {
        float _911 = _905 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _893 = _911;
    }
    float _913 = _893;
    float _915 = _885;
    float _917 = _913;
    if (_841)
    {
        float _919 = fma(_885, _913, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _915 = _919;
    }
    float _921 = _915;
    float _923 = _921;
    float _925 = _899;
    if (_841)
    {
        float _927 = _899 + (-1.0);
        _917 = _927;
    }
    float _929 = _917;
    float _931 = _929;
    if (_841)
    {
        float _933 = _867 * _921;
        _857 = _933;
    }
    float _935 = _857;
    if (!_841)
    {
        _923 = _905;
    }
    float _937 = _923;
    float _939 = _735 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _941 = _937;
    if (_841)
    {
        float _943 = _929 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _879 = _943;
    }
    float _945 = _879;
    if (_841)
    {
        float _947 = _829 * _935;
        _859 = _947;
    }
    float _949 = _859;
    if (!_841)
    {
        _931 = _833;
    }
    float _951 = _931;
    float _953 = _951;
    if (_841)
    {
        float _955 = _831 * _935;
        _909 = _955;
    }
    float _957 = _909;
    if (_841)
    {
        float _959 = fma(_905, _899, _945);
        _941 = _959;
    }
    float _961 = _941;
    if (_841)
    {
        float _963 = _949 * _949;
        _953 = _963;
    }
    float _965 = _953;
    if (!_841)
    {
        _925 = _835;
    }
    float _967 = _925;
    float _969 = _967;
    if (_841)
    {
        float _971 = _957 * _957;
        _969 = _971;
    }
    float _973 = _969;
    float _975 = fma(_961, _961, _965);
    float _977 = _735 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _979 = fma(_737, (*spvDescriptorSet0.vp_c8)._m0[3].x, _939);
    float _981 = _975 + _973;
    float _983 = fma(_737, (*spvDescriptorSet0.vp_c8)._m0[2].x, _977);
    float _985 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _987 = fma(_825, (*spvDescriptorSet0.vp_c15)._m0[23].w, _985);
    float _989 = precise::clamp(_987, 0.0, 1.0);
    float _991 = _735 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _993 = fma(_739, (*spvDescriptorSet0.vp_c8)._m0[2].z, _983);
    float _995 = rsqrt(_981);
    float _997 = -_989;
    float _999 = _997 + 1.0;
    float _1001 = _735 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1003 = fma(_737, (*spvDescriptorSet0.vp_c8)._m0[1].x, _991);
    float _1005 = _993 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1007 = fma(_737, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1001);
    float _1009 = fma(_739, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1003);
    float _1011 = abs(_999);
    float _1013 = log2(_1011);
    float _1015 = _1005 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1017 = fma(_739, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1007);
    float _1019 = _1009 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1021 = -_1015;
    float _1023 = fma(_1021, _819, 1.0);
    float _1025 = _1017 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1027 = _1019 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1029 = _995 * _949;
    float _1031 = _995 * _961;
    float _1033 = fma(_739, (*spvDescriptorSet0.vp_c8)._m0[3].z, _979);
    float _1035 = fma(_1025, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1027);
    float _1037 = _1029 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1039 = _995 * _957;
    float _1041 = _1033 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1043 = fma(_1005, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1035);
    float _1045 = -_1037;
    float _1047 = fma(_1031, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1045);
    float _1049 = _1013 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1051 = log2(_1023);
    float _1053 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1043);
    float _1055 = -_1039;
    float _1057 = fma(_1055, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1047);
    float _1059 = _1019 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1061 = _1019 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1063 = fma(_1057, -0.5, 0.5);
    float _1065 = fma(_1025, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1059);
    float _1067 = exp2(_1049);
    float _1069 = fma(_1025, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1061);
    float _1071 = fma(_1057, 0.5, 0.5);
    float _1073 = fma(_1005, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1065);
    float _1075 = _1031 + 1.0;
    float _1077 = fma(_1005, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1069);
    float _1079 = fma(_1071, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1081 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1073);
    float _1083 = 1.0 / _1053;
    float _1085 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1077);
    float _1087 = fma(_1071, _1079, -0.212114393711090087890625);
    float _1089 = _1051 * 0.693147182464599609375;
    float _1091 = fma(_1071, _1087, 1.570728778839111328125);
    float _1093 = _1089 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1095 = sqrt(_1063);
    float _1097 = -_1031;
    float _1099 = fma(_1067, _1075, _1097);
    float _1101 = fma(_1099, 0.5, 0.5);
    float _1103 = _1081 * _1083;
    float _1105 = _1085 * _1083;
    float _1107 = fma(_1103, 0.5, 0.5);
    float _1109 = fma(_1105, -0.5, 0.5);
    float _1111 = _1095 * 0.636619746685028076171875;
    float3 _3307 = float3(_1107, _1109, _1093);
    float _1113 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3307, float3(0.0), isnan(_3307)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3307, float3(0.0), isnan(_3307)), level(0.0)).x;
    float _1115 = -_1091;
    float _1117 = fma(_1111, _1115, 1.0);
    float3 _3323 = float3(_1107, _1109, _1093);
    float4 _1120 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3323, float3(0.0), isnan(_3323)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3323, float3(0.0), isnan(_3323)), level(0.0)).xyzw;
    float _1122 = _1120.x;
    float _1124 = _1120.y;
    float _1126 = _1120.z;
    float _1128 = _1120.w;
    float2 _3340 = float2(_1117, _1101);
    float3 _1132 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3340, float2(0.0), isnan(_3340)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3340, float2(0.0), isnan(_3340)), level(0.0)).xyz;
    float _1134 = _1132.x;
    float _1136 = _1132.y;
    float _1138 = _1132.z;
    float _1140 = in.m_51.y;
    float _1142 = _1013 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1144 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1146 = _147 > 0.5;
    float _1148 = _1019 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1150 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1152 = _1150 != 0;
    int _1154 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1156 = _1154 != 0;
    float _1158 = fma(_1025, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1148);
    float _1160 = exp2(_1142);
    float _1162 = fma(_1005, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1158);
    float _1164 = -_371;
    int _1166 = _1146 ? as_type<int>(_1164) : as_type<int>(_371);
    float _1168 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1170 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1172 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1174 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1176 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _1178 = _1140 > 0.5;
    float _1180 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1182 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1184 = -_363;
    int _1186 = _1178 ? as_type<int>(_1184) : as_type<int>(_363);
    float _1188 = _1168 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1190 = !_1152;
    float _1192 = _1190 ? _371 : as_type<float>(_1166);
    float _1194 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _1196 = !_1156;
    float _1198 = _1196 ? _363 : as_type<float>(_1186);
    float _1200 = _1170 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1202 = -_1160;
    float _1204 = _1202 + 1.0;
    float _1206 = _1194 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1208 = _1192 + 0.5;
    float _1210 = -_1198;
    float _1212 = _1210 + 0.5;
    float _1214 = _1174 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1216 = _1176 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1218 = _1180 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1220 = _363 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1222 = _1204 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_60.x = _1188;
    out.m_60.y = _1206;
    out.m_60.z = _1200;
    out.m_60.w = _1182;
    float _1224 = _1208 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1226 = _371 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1228 = _1220 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    out.m_62.x = _1214;
    out.m_62.y = _1216;
    out.m_62.z = _1218;
    float _1230 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1162);
    bool _1232 = _825 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1234 = isnan(_825);
    bool _1236 = _1232 || _1234;
    bool _1238 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1240 = _1236 || _1238;
    float _1242 = _1212 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1244 = _1224 * _1144;
    float _1246 = _1220 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1248 = _1220 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1250 = _1242 * _1172;
    float _1252 = fma(_1226, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1228);
    float _1254 = fma(_1226, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1246);
    float _1256 = _1230 + _1053;
    float _1258 = fma(_1226, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1248);
    out.m_64.x = _1244;
    out.m_64.y = _1250;
    float _1260 = _1256 * 0.5;
    float _1262 = _1256;
    float _1264 = _1254;
    float _1266 = _1053;
    float _1268 = _1230;
    float _1270 = _1085;
    float _1272 = _1081;
    if (!_1240)
    {
        _1262 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1274 = _1262;
    out.gl_Position.x = _1081;
    out.gl_Position.y = _1085;
    out.gl_Position.z = _1230;
    out.gl_Position.w = _1053;
    float _1276 = _1252 + (*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _1278 = _1254 + (*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _1280 = _1258 + (*spvDescriptorSet0.vp_c8)._m0[26].z;
    out.m_66.z = _1260;
    out.m_66.w = _1053;
    float _1282 = _801 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1284 = _1274;
    float _1286 = _1274;
    if (!_1240)
    {
        _1264 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1288 = _1264;
    out.m_68.x = _1276;
    out.m_68.y = _1278;
    out.m_68.z = _1280;
    float _1290 = _1288;
    float _1292 = _1288;
    if (!_1240)
    {
        _1266 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1294 = _1266;
    float _1296 = _1294;
    float _1298 = _1294;
    if (!_1240)
    {
        _1268 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1300 = _1268;
    float _1302 = _1300;
    float _1304 = _1300;
    if (!_1240)
    {
        _1270 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1306 = _1270;
    float _1308 = _1306;
    float _1310 = _1306;
    if (!_1240)
    {
        _1272 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1312 = _1272;
    float _1314 = _1222 * _1113;
    float _1316 = -_1222;
    float _1318 = _1316 + 1.0;
    float _1320 = _1128 * _1314;
    float _1322 = _1128 * _1318;
    float _1324 = _1138 * _1314;
    float _1326 = fma(_1134, _1320, _1122);
    float _1328 = fma(_1136, _1320, _1124);
    float _1330 = fma(_1128, _1324, _1126);
    out.m_70.x = _1326;
    out.m_70.y = _1328;
    out.m_70.z = _1330;
    out.m_70.w = _1322;
    bool _1332 = !_1240;
    float _1334 = _1312;
    float _1336 = _1312;
    if (!_1332)
    {
        bool _1338 = _825 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1340 = isnan(_825);
        bool _1342 = _1338 || _1340;
        bool _1344 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1346 = _1342 || _1344;
        if (!_1346)
        {
            float _1348 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1350 = _825 + _1348;
            float _1352 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1354 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1352;
            float _1356 = 1.0 / _1354;
            float _1358 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1360 = _1358 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1362 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1364 = _1362 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1366 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1368 = _1366 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1370 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1372 = _1370 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1374 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1376 = _1374 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1378 = _1350 * _1356;
            float _1380 = precise::clamp(_1378, 0.0, 1.0);
            float _1382 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1384 = _1382 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1386 = fma(_1380, _1360, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1388 = fma(_1380, _1384, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1390 = fma(_1380, _1364, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1392 = fma(_1380, _1368, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1394 = fma(_1380, _1372, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1396 = fma(_1380, _1376, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1292 = _1388;
            _1310 = _1394;
            _1286 = _1386;
            _1304 = _1392;
            _1298 = _1390;
            _1336 = _1396;
            _1398 = true;
        }
        else
        {
            bool _1400 = _825 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1402 = isnan(_825);
            bool _1404 = _1400 || _1402;
            bool _1406 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1408 = _1404 || _1406;
            if (!_1408)
            {
                _1284 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1410 = _1284;
            _1286 = _1410;
            if (!_1408)
            {
                _1290 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1412 = _1290;
            _1292 = _1412;
            if (!_1408)
            {
                _1296 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1414 = _1296;
            _1298 = _1414;
            if (!_1408)
            {
                _1302 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1416 = _1302;
            _1304 = _1416;
            if (!_1408)
            {
                _1308 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1418 = _1308;
            _1310 = _1418;
            if (!_1408)
            {
                _1334 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1420 = _1334;
            bool _1422 = !_1408;
            _1336 = _1420;
            if (!_1422)
            {
                bool _1424 = _825 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1426 = isnan(_825);
                bool _1428 = _1424 || _1426;
                bool _1430 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1432 = _1428 || _1430;
                if (!_1432)
                {
                    float _1434 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1436 = _825 + _1434;
                    float _1438 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1440 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1438;
                    float _1442 = 1.0 / _1440;
                    float _1444 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1446 = _1444 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1448 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1450 = _1448 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1452 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1454 = _1452 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1456 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1458 = _1456 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1460 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1462 = _1460 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1464 = _1436 * _1442;
                    float _1466 = precise::clamp(_1464, 0.0, 1.0);
                    float _1468 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1470 = _1468 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1472 = fma(_1466, _1446, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1474 = fma(_1466, _1470, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1476 = fma(_1466, _1450, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1478 = fma(_1466, _1454, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1480 = fma(_1466, _1458, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1482 = fma(_1466, _1462, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1292 = _1474;
                    _1310 = _1480;
                    _1286 = _1472;
                    _1304 = _1478;
                    _1298 = _1476;
                    _1336 = _1482;
                    _1398 = true;
                }
                else
                {
                    _1292 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1310 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1286 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1304 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1298 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1336 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1398 = false;
    float _1484 = _1292;
    float _1486 = _1310;
    float _1488 = _1286;
    float _1490 = _1304;
    float _1492 = _1298;
    float _1494 = _1336;
    float _1496 = fma(_1278, -0.5, 0.5);
    float _1498 = precise::clamp(_1496, 0.0, 1.0);
    float _1500 = -_1484;
    float _1502 = _1500 + _1486;
    float _1504 = _1282 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1506 = -_1488;
    float _1508 = _1506 + _1490;
    float _1510 = fma(_1498, _1502, _1484);
    out.m_72.x = 0.0;
    float _1512 = -_1492;
    float _1514 = _1512 + _1494;
    float _1516 = fma(_1498, _1508, _1488);
    float _1518 = _1510 * 0.586610972881317138671875;
    out.m_47.x = _1504;
    bool _1520 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1522 = fma(_1498, _1514, _1492);
    float _1524 = fma(_1516, 0.298911988735198974609375, _1518);
    bool _1526 = _801 > 0.0;
    bool _1528 = isnan(_801);
    bool _1530 = _1526 || _1528;
    bool _1532 = isnan(0.0);
    bool _1534 = _1530 || _1532;
    float _1536 = fma(_1522, 0.114477999508380889892578125, _1524);
    float _1538 = -_1536;
    float _1540 = _1516 + _1538;
    float _1542 = -_1536;
    float _1544 = _1510 + _1542;
    float _1546 = -_1536;
    float _1548 = _1522 + _1546;
    float _1550 = fma(_1540, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1536);
    float _1552 = fma(_1544, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1536);
    float _1554 = fma(_1548, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1536);
    bool _1556 = !_1520;
    if (!_1556)
    {
        float _1558 = -_735;
        float _1560 = _1558 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _1562 = -_737;
        float _1564 = _1562 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _1566 = -_739;
        float _1568 = _1566 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _1570 = _1560 * _1560;
        float _1572 = fma(_1564, _1564, _1570);
        float _1574 = fma(_1568, _1568, _1572);
        float _1576 = sqrt(_1574);
        float _1578 = rsqrt(_1574);
        float _1580 = -_1576;
        float _1582 = _1580 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _1584 = _1582 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _1586 = precise::clamp(_1584, 0.0, 1.0);
        float _1588 = _1564 * _1578;
        float _1590 = _1560 * _1578;
        float _1592 = abs(_1586);
        float _1594 = log2(_1592);
        float _1596 = _1568 * _1578;
        float _1598 = _1588 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _1600 = _1278 * _1590;
        float _1602 = -_1590;
        float _1604 = -_1598;
        float _1606 = fma(_1602, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1604);
        float _1608 = fma(_1276, _1588, _1600);
        float _1610 = -_1596;
        float _1612 = fma(_1610, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1606);
        float _1614 = fma(_1280, _1596, _1608);
        float _1616 = precise::clamp(_1614, 0.0, 1.0);
        float _1618 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _1620 = _1612 + _1618;
        float _1622 = _1594 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _1624 = _1620 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _1626 = precise::clamp(_1624, 0.0, 1.0);
        float _1628 = exp2(_1622);
        float _1630 = _1628 * _1626;
        float _1632 = _1616 * _1630;
        float _1634 = _1632 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _1636 = _1632 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _1638 = _1632 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_72.x = _1634;
        out.m_72.y = _1636;
        out.m_72.z = _1638;
    }
    out.m_74.x = _1550;
    out.m_74.y = _1552;
    out.m_74.z = _1554;
    if (_1534)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _1640 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1640;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1398 = false;
    bool _279 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _88 = in.m_44.w;
    float _90 = trunc(_88);
    int _93 = int(_90);
    bool _97 = _93 >= 1;
    float _99 = 0.0;
    if (!_97)
    {
        _99 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _101 = _99;
    float _103 = _101;
    if (!_97)
    {
        out.m_47.x = 0.0;
    }
    int _105 = 0;
    if (!_97)
    {
        float _107 = _101 * 5.0;
        _105 = as_type<int>(_107);
    }
    int _109 = _105;
    int _111 = _109;
    if (!_97)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1697 = as_type<float>(_109);
        out.gl_Position.z = _1697;
    }
    if (!_97)
    {
        return out;
    }
    float _113 = in.m_49.w;
    bool _115 = _113 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _117 = isnan(_113);
    bool _119 = _115 || _117;
    bool _121 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _123 = _119 || _121;
    float _125 = -_113;
    float _127 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_123)
    {
        float _129 = float(_93);
        _103 = _129;
    }
    float _131 = _103;
    bool _133 = _127 >= _131;
    bool _135 = !_123;
    bool _137 = _133 || _135;
    float _139 = _131;
    if (_137)
    {
        _139 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _141 = _139;
    if (_137)
    {
        out.m_47.x = 0.0;
    }
    if (_137)
    {
        float _143 = _141 * 5.0;
        _111 = as_type<int>(_143);
    }
    int _145 = _111;
    if (_137)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1766 = as_type<float>(_145);
        out.gl_Position.z = _1766;
    }
    if (_137)
    {
        return out;
    }
    float _147 = in.m_51.x;
    float _149 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _151 = _127 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _153 = in.m_53.x;
    float _155 = in.m_53.y;
    float _157 = in.m_53.z;
    int _159 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _161 = _159 != 0;
    float _163 = _151 * _149;
    float _165 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[20].x, _163);
    float _167 = _165 * 6.283185482025146484375;
    float _169 = floor(_165);
    int _171 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _173 = _171 != 0;
    int _175 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _177 = _175 != 0;
    float _179 = _155 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _181 = _167 * 0.15915493667125701904296875;
    float _183 = _155 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _185 = _155 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _187 = !_173;
    int _189 = _187 ? 0 : 1;
    float _191 = fma(_153, (*spvDescriptorSet0.vp_c10)._m0[4].x, _179);
    float _193 = fma(_153, (*spvDescriptorSet0.vp_c10)._m0[5].x, _183);
    float _195 = _181 * 6.283185482025146484375;
    float _197 = cos(_195);
    float _199 = fma(_153, (*spvDescriptorSet0.vp_c10)._m0[6].x, _185);
    bool _201 = !_161;
    int _203 = _201 ? 0 : 1;
    float _205 = fma(_157, (*spvDescriptorSet0.vp_c10)._m0[4].z, _191);
    bool _207 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _209 = fma(_157, (*spvDescriptorSet0.vp_c10)._m0[5].z, _193);
    int _211 = abs(_203);
    float _213 = -_169;
    float _215 = _165 + _213;
    int _217 = abs(_189);
    bool _219 = !_177;
    int _221 = _219 ? 0 : 1;
    float _223 = float(_217);
    float _225 = -_215;
    float _227 = fma(_225, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _229 = abs(_221);
    float _231 = fma(_197, 0.5, 0.5);
    float _233 = abs(_227);
    float _235 = _223 * _233;
    bool _237 = _215 < 0.5;
    float _239 = float(_237);
    float _241 = -_231;
    float _243 = fma(_241, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _245 = float(_211);
    float _247 = -_239;
    float _249 = fma(_247, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _251 = float(_229);
    float _253 = fma(_157, (*spvDescriptorSet0.vp_c10)._m0[6].z, _199);
    float _255 = fma(_245, _243, _235);
    float _257 = abs(_249);
    float _259 = fma(_251, _257, _255);
    bool _261 = !_207;
    float _277;
    if (!_261)
    {
        float _263 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _265 = _147 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _267 = fma(_265, (*spvDescriptorSet0.vp_c9)._m0[12].x, _127);
        float _269 = _267 * _263;
        float _271 = floor(_269);
        float _273 = -_271;
        float _275 = _269 + _273;
        _277 = _275;
        _279 = true;
    }
    else
    {
        float _281 = float(_93);
        float _283 = 1.0 / _281;
        float _285 = _127 * _283;
        _277 = _285;
    }
    _279 = false;
    float _287 = _277;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _291 = _287 + _289;
    bool _293 = _287 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _295 = isnan(_287);
    bool _297 = _293 || _295;
    bool _299 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _301 = _297 || _299;
    float _303 = float(_301);
    float _305 = as_type<float>(int(gl_VertexIndex));
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _309 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _307;
    float _311 = in.m_58.x;
    float _313 = in.m_58.y;
    float _315 = -_303;
    float _317 = _315 + 1.0;
    float _319 = 1.0 / _309;
    float _321 = _291 * _319;
    bool _323 = _287 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _325 = isnan(_287);
    bool _327 = _323 || _325;
    bool _329 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _331 = _327 || _329;
    float _333 = float(_331);
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _337 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _335;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _341 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _339;
    int _343 = as_type<int>(_305) & 1;
    bool _345 = _343 != 0;
    int _347 = as_type<int>(_305) & 2;
    bool _349 = _347 != 0;
    float _351 = _333 * _317;
    float _353 = fma(_337, _321, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _355 = fma(_341, _321, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _357 = -_333;
    float _359 = _357 + 1.0;
    bool _361 = !_349;
    float _363 = _361 ? (-0.5) : 0.5;
    float _365 = _353 * _351;
    float _367 = _355 * _351;
    bool _369 = !_345;
    float _371 = _369 ? (-0.5) : 0.5;
    float _373 = in.m_44.x;
    float _375 = in.m_44.y;
    float _377 = in.m_44.z;
    float _379 = fma(_359, (*spvDescriptorSet0.vp_c9)._m0[143].y, _367);
    float _381 = fma(_359, (*spvDescriptorSet0.vp_c9)._m0[143].x, _365);
    float _383 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[144].y, _379);
    float _385 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[144].x, _381);
    float _387 = _383 * _313;
    float _389 = _385 * _311;
    float _391 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _371);
    float _393 = _259 * _387;
    float _395 = _259 * _389;
    float _397 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _363);
    float _399 = _393 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _401 = _395 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _403 = _399 * _397;
    float _405 = _401 * _391;
    float _407 = _375 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _409 = _375 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _411 = _403 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _413 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _415 = fma(_373, (*spvDescriptorSet0.vp_c10)._m0[6].x, _407);
    float _417 = _403 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _419 = fma(_405, (*spvDescriptorSet0.vp_c8)._m0[26].x, _411);
    float _421 = fma(_373, (*spvDescriptorSet0.vp_c10)._m0[4].x, _409);
    float _423 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[6].z, _415);
    float _425 = fma(_405, (*spvDescriptorSet0.vp_c8)._m0[24].x, _417);
    float _427 = fma(_413, (*spvDescriptorSet0.vp_c8)._m0[26].z, _419);
    float _429 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[4].z, _421);
    float _431 = _423 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _433 = fma(_413, (*spvDescriptorSet0.vp_c8)._m0[24].z, _425);
    float _435 = _427 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _437 = _429 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _439 = _375 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _441 = _433 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _443 = _431 + _435;
    float _445 = _403 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _447 = fma(_373, (*spvDescriptorSet0.vp_c10)._m0[5].x, _439);
    float _449 = _437 + _441;
    float _451 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _453 = _443 + _451;
    float _455 = fma(_405, (*spvDescriptorSet0.vp_c8)._m0[25].x, _445);
    float _457 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[5].z, _447);
    float _459 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _461 = _449 + _459;
    float _463 = _453 * _453;
    float _465 = fma(_413, (*spvDescriptorSet0.vp_c8)._m0[25].z, _455);
    float _467 = _457 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _469 = fma(_461, _461, _463);
    float _471 = _465 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _473 = sqrt(_469);
    float _475 = _467 + _471;
    bool _477 = _473 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _479 = _471;
    float _481 = _445;
    float _483 = _403;
    float _485 = _431;
    if (!_477)
    {
        _479 = _449;
    }
    float _487 = _479;
    float _489 = _487;
    if (!_477)
    {
        _481 = _443;
    }
    float _491 = _481;
    float _493 = _491;
    if (!_477)
    {
        _483 = _475;
    }
    float _495 = _483;
    bool _497 = !_477;
    float _499 = _495;
    if (!_497)
    {
        float _501 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _503 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _505 = _473 + _503;
        float _507 = rsqrt(_469);
        float _509 = _505 * _501;
        float _511 = _475 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _513 = _509 * 0.15915493667125701904296875;
        float _515 = _513 * 6.283185482025146484375;
        float _517 = cos(_515);
        float _519 = _513 * 6.283185482025146484375;
        float _521 = sin(_519);
        float _523 = _517 + (-1.0);
        float _525 = fma(_521, _511, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _527 = _523 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _529 = _507 * _525;
        float _531 = fma(_475, _517, _527);
        float _533 = fma(_461, _529, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _535 = fma(_453, _529, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _499 = _531;
        _489 = _533;
        _493 = _535;
    }
    float _537 = _499;
    float _539 = _489;
    float _541 = _493;
    float _543 = -_467;
    float _545 = _543 + _537;
    float _547 = -_437;
    float _549 = _547 + _539;
    float _551 = -_431;
    float _553 = _551 + _541;
    float _555 = _467 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _557 = _545 * _545;
    bool _559 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _561 = isnan(0.5);
    bool _563 = _559 || _561;
    bool _565 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _567 = _563 || _565;
    float _569 = fma(_437, (*spvDescriptorSet0.vp_c8)._m0[11].x, _555);
    float _571 = fma(_549, _549, _557);
    bool _573 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _575 = isnan(0.5);
    bool _577 = _573 || _575;
    bool _579 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _581 = _577 || _579;
    float _583 = fma(_431, (*spvDescriptorSet0.vp_c8)._m0[11].z, _569);
    float _585 = fma(_553, _553, _571);
    float _587 = _467 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _589 = _583 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _591 = sqrt(_585);
    float _593 = fma(_437, (*spvDescriptorSet0.vp_c8)._m0[10].x, _587);
    float _595 = fma(_431, (*spvDescriptorSet0.vp_c8)._m0[10].z, _593);
    float _597 = 1.0 / _589;
    float _599 = _595 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _601 = _599 + _589;
    bool _603 = _591 > 0.0;
    float _605 = _601 * _597;
    float _607 = _605 * 0.5;
    bool _609 = !_603;
    float _611 = _539;
    float _613 = _537;
    float _615 = _541;
    float _617 = 0.0;
    if (!_609)
    {
        float _619 = _209 * _209;
        float _621 = fma(_205, _205, _619);
        float _623 = rsqrt(_585);
        float _625 = fma(_253, _253, _621);
        float _627 = sqrt(_625);
        float _629 = _549 * _623;
        float _631 = _545 * _623;
        float _633 = _553 * _623;
        bool _635 = _627 > 0.0;
        bool _637 = !_635;
        _617 = _633;
        if (!_637)
        {
            float _639 = rsqrt(_625);
            float _641 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _643 = _209 * _639;
            float _645 = _205 * _639;
            float _647 = _253 * _639;
            float _649 = _631 * _643;
            float _651 = fma(_629, _645, _649);
            float _653 = _641 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _655 = fma(_633, _647, _651);
            float _657 = _655 * _653;
            float _659 = fma(_205, _657, _539);
            float _661 = fma(_209, _657, _537);
            float _663 = fma(_253, _657, _541);
            _611 = _659;
            _613 = _661;
            _615 = _663;
        }
    }
    float _665 = _611;
    float _667 = _613;
    float _669 = _615;
    float _671 = _617;
    float _673 = _671;
    float _675 = _667;
    float _677 = _665;
    float _679 = _669;
    if (_581)
    {
        _673 = 1.0;
    }
    float _681 = _673;
    float _683 = _681;
    if (!_567)
    {
        float _685 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _687 = _467 + _685;
        float _689 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _691 = _437 + _689;
        float _693 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _695 = -_437;
        float _697 = _695 + _665;
        float _699 = _687 * _687;
        float _701 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _703 = _431 + _701;
        float _705 = -_467;
        float _707 = _705 + _667;
        float _709 = -_431;
        float _711 = _709 + _669;
        float _713 = fma(_691, _691, _699);
        float _715 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _717 = fma(_703, _703, _713);
        float _719 = sqrt(_717);
        float _721 = _693 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _723 = precise::min(_719, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _725 = _723 * _715;
        float _727 = _721 * _725;
        float _729 = fma(_697, _727, _437);
        float _731 = fma(_707, _727, _467);
        float _733 = fma(_711, _727, _431);
        _675 = _731;
        _677 = _729;
        _679 = _733;
    }
    float _735 = _675;
    float _737 = _677;
    float _739 = _679;
    if (!_581)
    {
        float _741 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _743 = _741 * 0.15915493667125701904296875;
        float _745 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _747 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _749 = fma(_607, (*spvDescriptorSet0.vp_c8)._m0[30].w, _747);
        float _751 = _743 * 6.283185482025146484375;
        float _753 = cos(_751);
        float _755 = _745 * 0.15915493667125701904296875;
        float _757 = _743 * 6.283185482025146484375;
        float _759 = sin(_757);
        float _761 = 1.0 / _753;
        float _763 = _755 * 6.283185482025146484375;
        float _765 = cos(_763);
        float _767 = _759 * _761;
        float _769 = _755 * 6.283185482025146484375;
        float _771 = sin(_769);
        float _773 = _765 * _767;
        float _775 = 1.0 / _749;
        float _777 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _779 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _777;
        float _781 = 1.0 / _773;
        float _783 = 1.0 / _779;
        float _785 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _787 = _775 * _785;
        float _789 = _771 * _781;
        float _791 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _793 = fma(_789, _787, _791);
        float _795 = _793 * _783;
        float _797 = precise::clamp(_795, 0.0, 1.0);
        _485 = _781;
        _683 = _797;
    }
    float _799 = _485;
    float _801 = _683;
    float _803 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _805 = _735 + _803;
    float _807 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _809 = _737 + _807;
    float _811 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _813 = _739 + _811;
    float _815 = _805 * _805;
    float _817 = fma(_809, _809, _815);
    float _819 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _821 = fma(_813, _813, _817);
    float _823 = rsqrt(_821);
    float _825 = sqrt(_821);
    float _827 = _823 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _829 = _809 * _827;
    float _831 = _813 * _827;
    float _833 = _829 * _829;
    float _835 = _831 * _831;
    float _837 = _833 + _835;
    float _839 = sqrt(_837);
    bool _841 = _839 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _843 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _845 = _839 + _843;
    float _847 = _823;
    float _849 = _837;
    float _851 = _845;
    float _853 = _799;
    float _855 = _805;
    float _857 = _827;
    float _859 = _829;
    if (_841)
    {
        float _861 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _847 = _861;
    }
    float _863 = _847;
    if (_841)
    {
        float _865 = rsqrt(_837);
        _849 = _865;
    }
    float _867 = _849;
    if (_841)
    {
        float _869 = _845 * _863;
        _851 = _869;
    }
    float _871 = _851;
    if (_841)
    {
        float _873 = _871 * 0.15915493667125701904296875;
        _853 = _873;
    }
    float _875 = _853;
    float _877 = _863;
    float _879 = _875;
    if (_841)
    {
        float _881 = _875 * 6.283185482025146484375;
        float _883 = sin(_881);
        _877 = _883;
    }
    float _885 = _877;
    float _887 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _889 = precise::max(0.0, _887);
    float _891 = _813;
    float _893 = _889;
    if (_841)
    {
        float _895 = _875 * 6.283185482025146484375;
        float _897 = cos(_895);
        _891 = _897;
    }
    float _899 = _891;
    float _901 = -_827;
    float _903 = -_889;
    float _905 = fma(_805, _901, _903);
    if (!_841)
    {
        _855 = _831;
    }
    float _907 = _855;
    float _909 = _907;
    if (_841)
    {
        float _911 = _905 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _893 = _911;
    }
    float _913 = _893;
    float _915 = _885;
    float _917 = _913;
    if (_841)
    {
        float _919 = fma(_885, _913, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _915 = _919;
    }
    float _921 = _915;
    float _923 = _921;
    float _925 = _899;
    if (_841)
    {
        float _927 = _899 + (-1.0);
        _917 = _927;
    }
    float _929 = _917;
    float _931 = _929;
    if (_841)
    {
        float _933 = _867 * _921;
        _857 = _933;
    }
    float _935 = _857;
    if (!_841)
    {
        _923 = _905;
    }
    float _937 = _923;
    float _939 = _735 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _941 = _937;
    if (_841)
    {
        float _943 = _929 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _879 = _943;
    }
    float _945 = _879;
    if (_841)
    {
        float _947 = _829 * _935;
        _859 = _947;
    }
    float _949 = _859;
    if (!_841)
    {
        _931 = _833;
    }
    float _951 = _931;
    float _953 = _951;
    if (_841)
    {
        float _955 = _831 * _935;
        _909 = _955;
    }
    float _957 = _909;
    if (_841)
    {
        float _959 = fma(_905, _899, _945);
        _941 = _959;
    }
    float _961 = _941;
    if (_841)
    {
        float _963 = _949 * _949;
        _953 = _963;
    }
    float _965 = _953;
    if (!_841)
    {
        _925 = _835;
    }
    float _967 = _925;
    float _969 = _967;
    if (_841)
    {
        float _971 = _957 * _957;
        _969 = _971;
    }
    float _973 = _969;
    float _975 = fma(_961, _961, _965);
    float _977 = _735 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _979 = fma(_737, (*spvDescriptorSet0.vp_c8)._m0[3].x, _939);
    float _981 = _975 + _973;
    float _983 = fma(_737, (*spvDescriptorSet0.vp_c8)._m0[2].x, _977);
    float _985 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _987 = fma(_825, (*spvDescriptorSet0.vp_c15)._m0[23].w, _985);
    float _989 = precise::clamp(_987, 0.0, 1.0);
    float _991 = _735 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _993 = fma(_739, (*spvDescriptorSet0.vp_c8)._m0[2].z, _983);
    float _995 = rsqrt(_981);
    float _997 = -_989;
    float _999 = _997 + 1.0;
    float _1001 = _735 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1003 = fma(_737, (*spvDescriptorSet0.vp_c8)._m0[1].x, _991);
    float _1005 = _993 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1007 = fma(_737, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1001);
    float _1009 = fma(_739, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1003);
    float _1011 = abs(_999);
    float _1013 = log2(_1011);
    float _1015 = _1005 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1017 = fma(_739, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1007);
    float _1019 = _1009 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1021 = -_1015;
    float _1023 = fma(_1021, _819, 1.0);
    float _1025 = _1017 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1027 = _1019 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1029 = _995 * _949;
    float _1031 = _995 * _961;
    float _1033 = fma(_739, (*spvDescriptorSet0.vp_c8)._m0[3].z, _979);
    float _1035 = fma(_1025, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1027);
    float _1037 = _1029 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1039 = _995 * _957;
    float _1041 = _1033 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1043 = fma(_1005, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1035);
    float _1045 = -_1037;
    float _1047 = fma(_1031, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1045);
    float _1049 = _1013 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1051 = log2(_1023);
    float _1053 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1043);
    float _1055 = -_1039;
    float _1057 = fma(_1055, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1047);
    float _1059 = _1019 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1061 = _1019 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1063 = fma(_1057, -0.5, 0.5);
    float _1065 = fma(_1025, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1059);
    float _1067 = exp2(_1049);
    float _1069 = fma(_1025, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1061);
    float _1071 = fma(_1057, 0.5, 0.5);
    float _1073 = fma(_1005, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1065);
    float _1075 = _1031 + 1.0;
    float _1077 = fma(_1005, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1069);
    float _1079 = fma(_1071, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1081 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1073);
    float _1083 = 1.0 / _1053;
    float _1085 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1077);
    float _1087 = fma(_1071, _1079, -0.212114393711090087890625);
    float _1089 = _1051 * 0.693147182464599609375;
    float _1091 = fma(_1071, _1087, 1.570728778839111328125);
    float _1093 = _1089 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1095 = sqrt(_1063);
    float _1097 = -_1031;
    float _1099 = fma(_1067, _1075, _1097);
    float _1101 = fma(_1099, 0.5, 0.5);
    float _1103 = _1081 * _1083;
    float _1105 = _1085 * _1083;
    float _1107 = fma(_1103, 0.5, 0.5);
    float _1109 = fma(_1105, -0.5, 0.5);
    float _1111 = _1095 * 0.636619746685028076171875;
    float3 _3307 = float3(_1107, _1109, _1093);
    float _1113 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3307, float3(0.0), isnan(_3307)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3307, float3(0.0), isnan(_3307)), level(0.0)).x;
    float _1115 = -_1091;
    float _1117 = fma(_1111, _1115, 1.0);
    float3 _3323 = float3(_1107, _1109, _1093);
    float4 _1120 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3323, float3(0.0), isnan(_3323)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3323, float3(0.0), isnan(_3323)), level(0.0)).xyzw;
    float _1122 = _1120.x;
    float _1124 = _1120.y;
    float _1126 = _1120.z;
    float _1128 = _1120.w;
    float2 _3340 = float2(_1117, _1101);
    float3 _1132 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3340, float2(0.0), isnan(_3340)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3340, float2(0.0), isnan(_3340)), level(0.0)).xyz;
    float _1134 = _1132.x;
    float _1136 = _1132.y;
    float _1138 = _1132.z;
    float _1140 = in.m_51.y;
    float _1142 = _1013 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1144 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1146 = _147 > 0.5;
    float _1148 = _1019 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1150 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1152 = _1150 != 0;
    int _1154 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1156 = _1154 != 0;
    float _1158 = fma(_1025, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1148);
    float _1160 = exp2(_1142);
    float _1162 = fma(_1005, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1158);
    float _1164 = -_371;
    int _1166 = _1146 ? as_type<int>(_1164) : as_type<int>(_371);
    float _1168 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1170 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1172 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1174 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1176 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _1178 = _1140 > 0.5;
    float _1180 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1182 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1184 = -_363;
    int _1186 = _1178 ? as_type<int>(_1184) : as_type<int>(_363);
    float _1188 = _1168 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1190 = !_1152;
    float _1192 = _1190 ? _371 : as_type<float>(_1166);
    float _1194 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _1196 = !_1156;
    float _1198 = _1196 ? _363 : as_type<float>(_1186);
    float _1200 = _1170 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1202 = -_1160;
    float _1204 = _1202 + 1.0;
    float _1206 = _1194 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1208 = _1192 + 0.5;
    float _1210 = -_1198;
    float _1212 = _1210 + 0.5;
    float _1214 = _1174 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1216 = _1176 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1218 = _1180 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1220 = _363 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1222 = _1204 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_60.x = _1188;
    out.m_60.y = _1206;
    out.m_60.z = _1200;
    out.m_60.w = _1182;
    float _1224 = _1208 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1226 = _371 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1228 = _1220 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    out.m_62.x = _1214;
    out.m_62.y = _1216;
    out.m_62.z = _1218;
    float _1230 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1162);
    bool _1232 = _825 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1234 = isnan(_825);
    bool _1236 = _1232 || _1234;
    bool _1238 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1240 = _1236 || _1238;
    float _1242 = _1212 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1244 = _1224 * _1144;
    float _1246 = _1220 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1248 = _1220 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1250 = _1242 * _1172;
    float _1252 = fma(_1226, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1228);
    float _1254 = fma(_1226, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1246);
    float _1256 = _1230 + _1053;
    float _1258 = fma(_1226, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1248);
    out.m_64.x = _1244;
    out.m_64.y = _1250;
    float _1260 = _1256 * 0.5;
    float _1262 = _1256;
    float _1264 = _1254;
    float _1266 = _1053;
    float _1268 = _1230;
    float _1270 = _1085;
    float _1272 = _1081;
    if (!_1240)
    {
        _1262 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1274 = _1262;
    out.gl_Position.x = _1081;
    out.gl_Position.y = _1085;
    out.gl_Position.z = _1230;
    out.gl_Position.w = _1053;
    float _1276 = _1252 + (*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _1278 = _1254 + (*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _1280 = _1258 + (*spvDescriptorSet0.vp_c8)._m0[26].z;
    out.m_66.z = _1260;
    out.m_66.w = _1053;
    float _1282 = _801 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1284 = _1274;
    float _1286 = _1274;
    if (!_1240)
    {
        _1264 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1288 = _1264;
    out.m_68.x = _1276;
    out.m_68.y = _1278;
    out.m_68.z = _1280;
    float _1290 = _1288;
    float _1292 = _1288;
    if (!_1240)
    {
        _1266 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1294 = _1266;
    float _1296 = _1294;
    float _1298 = _1294;
    if (!_1240)
    {
        _1268 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1300 = _1268;
    float _1302 = _1300;
    float _1304 = _1300;
    if (!_1240)
    {
        _1270 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1306 = _1270;
    float _1308 = _1306;
    float _1310 = _1306;
    if (!_1240)
    {
        _1272 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1312 = _1272;
    float _1314 = _1222 * _1113;
    float _1316 = -_1222;
    float _1318 = _1316 + 1.0;
    float _1320 = _1128 * _1314;
    float _1322 = _1128 * _1318;
    float _1324 = _1138 * _1314;
    float _1326 = fma(_1134, _1320, _1122);
    float _1328 = fma(_1136, _1320, _1124);
    float _1330 = fma(_1128, _1324, _1126);
    out.m_70.x = _1326;
    out.m_70.y = _1328;
    out.m_70.z = _1330;
    out.m_70.w = _1322;
    bool _1332 = !_1240;
    float _1334 = _1312;
    float _1336 = _1312;
    if (!_1332)
    {
        bool _1338 = _825 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1340 = isnan(_825);
        bool _1342 = _1338 || _1340;
        bool _1344 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1346 = _1342 || _1344;
        if (!_1346)
        {
            float _1348 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1350 = _825 + _1348;
            float _1352 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1354 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1352;
            float _1356 = 1.0 / _1354;
            float _1358 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1360 = _1358 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1362 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1364 = _1362 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1366 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1368 = _1366 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1370 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1372 = _1370 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1374 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1376 = _1374 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1378 = _1350 * _1356;
            float _1380 = precise::clamp(_1378, 0.0, 1.0);
            float _1382 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1384 = _1382 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1386 = fma(_1380, _1360, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1388 = fma(_1380, _1384, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1390 = fma(_1380, _1364, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1392 = fma(_1380, _1368, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1394 = fma(_1380, _1372, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1396 = fma(_1380, _1376, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1292 = _1388;
            _1310 = _1394;
            _1286 = _1386;
            _1304 = _1392;
            _1298 = _1390;
            _1336 = _1396;
            _1398 = true;
        }
        else
        {
            bool _1400 = _825 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1402 = isnan(_825);
            bool _1404 = _1400 || _1402;
            bool _1406 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1408 = _1404 || _1406;
            if (!_1408)
            {
                _1284 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1410 = _1284;
            _1286 = _1410;
            if (!_1408)
            {
                _1290 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1412 = _1290;
            _1292 = _1412;
            if (!_1408)
            {
                _1296 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1414 = _1296;
            _1298 = _1414;
            if (!_1408)
            {
                _1302 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1416 = _1302;
            _1304 = _1416;
            if (!_1408)
            {
                _1308 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1418 = _1308;
            _1310 = _1418;
            if (!_1408)
            {
                _1334 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1420 = _1334;
            bool _1422 = !_1408;
            _1336 = _1420;
            if (!_1422)
            {
                bool _1424 = _825 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1426 = isnan(_825);
                bool _1428 = _1424 || _1426;
                bool _1430 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1432 = _1428 || _1430;
                if (!_1432)
                {
                    float _1434 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1436 = _825 + _1434;
                    float _1438 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1440 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1438;
                    float _1442 = 1.0 / _1440;
                    float _1444 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1446 = _1444 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1448 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1450 = _1448 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1452 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1454 = _1452 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1456 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1458 = _1456 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1460 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1462 = _1460 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1464 = _1436 * _1442;
                    float _1466 = precise::clamp(_1464, 0.0, 1.0);
                    float _1468 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1470 = _1468 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1472 = fma(_1466, _1446, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1474 = fma(_1466, _1470, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1476 = fma(_1466, _1450, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1478 = fma(_1466, _1454, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1480 = fma(_1466, _1458, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1482 = fma(_1466, _1462, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1292 = _1474;
                    _1310 = _1480;
                    _1286 = _1472;
                    _1304 = _1478;
                    _1298 = _1476;
                    _1336 = _1482;
                    _1398 = true;
                }
                else
                {
                    _1292 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1310 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1286 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1304 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1298 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1336 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1398 = false;
    float _1484 = _1292;
    float _1486 = _1310;
    float _1488 = _1286;
    float _1490 = _1304;
    float _1492 = _1298;
    float _1494 = _1336;
    float _1496 = fma(_1278, -0.5, 0.5);
    float _1498 = precise::clamp(_1496, 0.0, 1.0);
    float _1500 = -_1484;
    float _1502 = _1500 + _1486;
    float _1504 = _1282 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1506 = -_1488;
    float _1508 = _1506 + _1490;
    float _1510 = fma(_1498, _1502, _1484);
    out.m_72.x = 0.0;
    float _1512 = -_1492;
    float _1514 = _1512 + _1494;
    float _1516 = fma(_1498, _1508, _1488);
    float _1518 = _1510 * 0.586610972881317138671875;
    out.m_47.x = _1504;
    bool _1520 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1522 = fma(_1498, _1514, _1492);
    float _1524 = fma(_1516, 0.298911988735198974609375, _1518);
    bool _1526 = _801 > 0.0;
    bool _1528 = isnan(_801);
    bool _1530 = _1526 || _1528;
    bool _1532 = isnan(0.0);
    bool _1534 = _1530 || _1532;
    float _1536 = fma(_1522, 0.114477999508380889892578125, _1524);
    float _1538 = -_1536;
    float _1540 = _1516 + _1538;
    float _1542 = -_1536;
    float _1544 = _1510 + _1542;
    float _1546 = -_1536;
    float _1548 = _1522 + _1546;
    float _1550 = fma(_1540, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1536);
    float _1552 = fma(_1544, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1536);
    float _1554 = fma(_1548, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1536);
    bool _1556 = !_1520;
    if (!_1556)
    {
        float _1558 = -_735;
        float _1560 = _1558 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _1562 = -_737;
        float _1564 = _1562 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _1566 = -_739;
        float _1568 = _1566 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _1570 = _1560 * _1560;
        float _1572 = fma(_1564, _1564, _1570);
        float _1574 = fma(_1568, _1568, _1572);
        float _1576 = sqrt(_1574);
        float _1578 = rsqrt(_1574);
        float _1580 = -_1576;
        float _1582 = _1580 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _1584 = _1582 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _1586 = precise::clamp(_1584, 0.0, 1.0);
        float _1588 = _1564 * _1578;
        float _1590 = _1560 * _1578;
        float _1592 = abs(_1586);
        float _1594 = log2(_1592);
        float _1596 = _1568 * _1578;
        float _1598 = _1588 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _1600 = _1278 * _1590;
        float _1602 = -_1590;
        float _1604 = -_1598;
        float _1606 = fma(_1602, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1604);
        float _1608 = fma(_1276, _1588, _1600);
        float _1610 = -_1596;
        float _1612 = fma(_1610, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1606);
        float _1614 = fma(_1280, _1596, _1608);
        float _1616 = precise::clamp(_1614, 0.0, 1.0);
        float _1618 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _1620 = _1612 + _1618;
        float _1622 = _1594 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _1624 = _1620 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _1626 = precise::clamp(_1624, 0.0, 1.0);
        float _1628 = exp2(_1622);
        float _1630 = _1628 * _1626;
        float _1632 = _1616 * _1630;
        float _1634 = _1632 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _1636 = _1632 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _1638 = _1632 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_72.x = _1634;
        out.m_72.y = _1636;
        out.m_72.z = _1638;
    }
    out.m_74.x = _1550;
    out.m_74.y = _1552;
    out.m_74.z = _1554;
    if (_1534)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _1640 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1640;
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
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1398 = false;
    bool _279 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _88 = in.m_44.w;
    float _90 = trunc(_88);
    int _93 = int(_90);
    bool _97 = _93 >= 1;
    float _99 = 0.0;
    if (!_97)
    {
        _99 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _101 = _99;
    float _103 = _101;
    if (!_97)
    {
        out.m_47.x = 0.0;
    }
    int _105 = 0;
    if (!_97)
    {
        float _107 = _101 * 5.0;
        _105 = as_type<int>(_107);
    }
    int _109 = _105;
    int _111 = _109;
    if (!_97)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1697 = as_type<float>(_109);
        out.gl_Position.z = _1697;
    }
    if (!_97)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _113 = in.m_49.w;
    bool _115 = _113 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _117 = isnan(_113);
    bool _119 = _115 || _117;
    bool _121 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _123 = _119 || _121;
    float _125 = -_113;
    float _127 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_123)
    {
        float _129 = float(_93);
        _103 = _129;
    }
    float _131 = _103;
    bool _133 = _127 >= _131;
    bool _135 = !_123;
    bool _137 = _133 || _135;
    float _139 = _131;
    if (_137)
    {
        _139 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _141 = _139;
    if (_137)
    {
        out.m_47.x = 0.0;
    }
    if (_137)
    {
        float _143 = _141 * 5.0;
        _111 = as_type<int>(_143);
    }
    int _145 = _111;
    if (_137)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1766 = as_type<float>(_145);
        out.gl_Position.z = _1766;
    }
    if (_137)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _147 = in.m_51.x;
    float _149 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _151 = _127 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _153 = in.m_53.x;
    float _155 = in.m_53.y;
    float _157 = in.m_53.z;
    int _159 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _161 = _159 != 0;
    float _163 = _151 * _149;
    float _165 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[20].x, _163);
    float _167 = _165 * 6.283185482025146484375;
    float _169 = floor(_165);
    int _171 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _173 = _171 != 0;
    int _175 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _177 = _175 != 0;
    float _179 = _155 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _181 = _167 * 0.15915493667125701904296875;
    float _183 = _155 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _185 = _155 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _187 = !_173;
    int _189 = _187 ? 0 : 1;
    float _191 = fma(_153, (*spvDescriptorSet0.vp_c10)._m0[4].x, _179);
    float _193 = fma(_153, (*spvDescriptorSet0.vp_c10)._m0[5].x, _183);
    float _195 = _181 * 6.283185482025146484375;
    float _197 = cos(_195);
    float _199 = fma(_153, (*spvDescriptorSet0.vp_c10)._m0[6].x, _185);
    bool _201 = !_161;
    int _203 = _201 ? 0 : 1;
    float _205 = fma(_157, (*spvDescriptorSet0.vp_c10)._m0[4].z, _191);
    bool _207 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _209 = fma(_157, (*spvDescriptorSet0.vp_c10)._m0[5].z, _193);
    int _211 = abs(_203);
    float _213 = -_169;
    float _215 = _165 + _213;
    int _217 = abs(_189);
    bool _219 = !_177;
    int _221 = _219 ? 0 : 1;
    float _223 = float(_217);
    float _225 = -_215;
    float _227 = fma(_225, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _229 = abs(_221);
    float _231 = fma(_197, 0.5, 0.5);
    float _233 = abs(_227);
    float _235 = _223 * _233;
    bool _237 = _215 < 0.5;
    float _239 = float(_237);
    float _241 = -_231;
    float _243 = fma(_241, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _245 = float(_211);
    float _247 = -_239;
    float _249 = fma(_247, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _251 = float(_229);
    float _253 = fma(_157, (*spvDescriptorSet0.vp_c10)._m0[6].z, _199);
    float _255 = fma(_245, _243, _235);
    float _257 = abs(_249);
    float _259 = fma(_251, _257, _255);
    bool _261 = !_207;
    float _277;
    if (!_261)
    {
        float _263 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _265 = _147 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _267 = fma(_265, (*spvDescriptorSet0.vp_c9)._m0[12].x, _127);
        float _269 = _267 * _263;
        float _271 = floor(_269);
        float _273 = -_271;
        float _275 = _269 + _273;
        _277 = _275;
        _279 = true;
    }
    else
    {
        float _281 = float(_93);
        float _283 = 1.0 / _281;
        float _285 = _127 * _283;
        _277 = _285;
    }
    _279 = false;
    float _287 = _277;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _291 = _287 + _289;
    bool _293 = _287 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _295 = isnan(_287);
    bool _297 = _293 || _295;
    bool _299 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _301 = _297 || _299;
    float _303 = float(_301);
    float _305 = as_type<float>(int(gl_VertexIndex));
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _309 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _307;
    float _311 = in.m_58.x;
    float _313 = in.m_58.y;
    float _315 = -_303;
    float _317 = _315 + 1.0;
    float _319 = 1.0 / _309;
    float _321 = _291 * _319;
    bool _323 = _287 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _325 = isnan(_287);
    bool _327 = _323 || _325;
    bool _329 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _331 = _327 || _329;
    float _333 = float(_331);
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _337 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _335;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _341 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _339;
    int _343 = as_type<int>(_305) & 1;
    bool _345 = _343 != 0;
    int _347 = as_type<int>(_305) & 2;
    bool _349 = _347 != 0;
    float _351 = _333 * _317;
    float _353 = fma(_337, _321, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _355 = fma(_341, _321, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _357 = -_333;
    float _359 = _357 + 1.0;
    bool _361 = !_349;
    float _363 = _361 ? (-0.5) : 0.5;
    float _365 = _353 * _351;
    float _367 = _355 * _351;
    bool _369 = !_345;
    float _371 = _369 ? (-0.5) : 0.5;
    float _373 = in.m_44.x;
    float _375 = in.m_44.y;
    float _377 = in.m_44.z;
    float _379 = fma(_359, (*spvDescriptorSet0.vp_c9)._m0[143].y, _367);
    float _381 = fma(_359, (*spvDescriptorSet0.vp_c9)._m0[143].x, _365);
    float _383 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[144].y, _379);
    float _385 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[144].x, _381);
    float _387 = _383 * _313;
    float _389 = _385 * _311;
    float _391 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _371);
    float _393 = _259 * _387;
    float _395 = _259 * _389;
    float _397 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _363);
    float _399 = _393 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _401 = _395 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _403 = _399 * _397;
    float _405 = _401 * _391;
    float _407 = _375 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _409 = _375 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _411 = _403 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _413 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _415 = fma(_373, (*spvDescriptorSet0.vp_c10)._m0[6].x, _407);
    float _417 = _403 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _419 = fma(_405, (*spvDescriptorSet0.vp_c8)._m0[26].x, _411);
    float _421 = fma(_373, (*spvDescriptorSet0.vp_c10)._m0[4].x, _409);
    float _423 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[6].z, _415);
    float _425 = fma(_405, (*spvDescriptorSet0.vp_c8)._m0[24].x, _417);
    float _427 = fma(_413, (*spvDescriptorSet0.vp_c8)._m0[26].z, _419);
    float _429 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[4].z, _421);
    float _431 = _423 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _433 = fma(_413, (*spvDescriptorSet0.vp_c8)._m0[24].z, _425);
    float _435 = _427 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _437 = _429 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _439 = _375 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _441 = _433 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _443 = _431 + _435;
    float _445 = _403 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _447 = fma(_373, (*spvDescriptorSet0.vp_c10)._m0[5].x, _439);
    float _449 = _437 + _441;
    float _451 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _453 = _443 + _451;
    float _455 = fma(_405, (*spvDescriptorSet0.vp_c8)._m0[25].x, _445);
    float _457 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[5].z, _447);
    float _459 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _461 = _449 + _459;
    float _463 = _453 * _453;
    float _465 = fma(_413, (*spvDescriptorSet0.vp_c8)._m0[25].z, _455);
    float _467 = _457 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _469 = fma(_461, _461, _463);
    float _471 = _465 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _473 = sqrt(_469);
    float _475 = _467 + _471;
    bool _477 = _473 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _479 = _471;
    float _481 = _445;
    float _483 = _403;
    float _485 = _431;
    if (!_477)
    {
        _479 = _449;
    }
    float _487 = _479;
    float _489 = _487;
    if (!_477)
    {
        _481 = _443;
    }
    float _491 = _481;
    float _493 = _491;
    if (!_477)
    {
        _483 = _475;
    }
    float _495 = _483;
    bool _497 = !_477;
    float _499 = _495;
    if (!_497)
    {
        float _501 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _503 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _505 = _473 + _503;
        float _507 = rsqrt(_469);
        float _509 = _505 * _501;
        float _511 = _475 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _513 = _509 * 0.15915493667125701904296875;
        float _515 = _513 * 6.283185482025146484375;
        float _517 = cos(_515);
        float _519 = _513 * 6.283185482025146484375;
        float _521 = sin(_519);
        float _523 = _517 + (-1.0);
        float _525 = fma(_521, _511, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _527 = _523 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _529 = _507 * _525;
        float _531 = fma(_475, _517, _527);
        float _533 = fma(_461, _529, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _535 = fma(_453, _529, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _499 = _531;
        _489 = _533;
        _493 = _535;
    }
    float _537 = _499;
    float _539 = _489;
    float _541 = _493;
    float _543 = -_467;
    float _545 = _543 + _537;
    float _547 = -_437;
    float _549 = _547 + _539;
    float _551 = -_431;
    float _553 = _551 + _541;
    float _555 = _467 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _557 = _545 * _545;
    bool _559 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _561 = isnan(0.5);
    bool _563 = _559 || _561;
    bool _565 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _567 = _563 || _565;
    float _569 = fma(_437, (*spvDescriptorSet0.vp_c8)._m0[11].x, _555);
    float _571 = fma(_549, _549, _557);
    bool _573 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _575 = isnan(0.5);
    bool _577 = _573 || _575;
    bool _579 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _581 = _577 || _579;
    float _583 = fma(_431, (*spvDescriptorSet0.vp_c8)._m0[11].z, _569);
    float _585 = fma(_553, _553, _571);
    float _587 = _467 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _589 = _583 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _591 = sqrt(_585);
    float _593 = fma(_437, (*spvDescriptorSet0.vp_c8)._m0[10].x, _587);
    float _595 = fma(_431, (*spvDescriptorSet0.vp_c8)._m0[10].z, _593);
    float _597 = 1.0 / _589;
    float _599 = _595 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _601 = _599 + _589;
    bool _603 = _591 > 0.0;
    float _605 = _601 * _597;
    float _607 = _605 * 0.5;
    bool _609 = !_603;
    float _611 = _539;
    float _613 = _537;
    float _615 = _541;
    float _617 = 0.0;
    if (!_609)
    {
        float _619 = _209 * _209;
        float _621 = fma(_205, _205, _619);
        float _623 = rsqrt(_585);
        float _625 = fma(_253, _253, _621);
        float _627 = sqrt(_625);
        float _629 = _549 * _623;
        float _631 = _545 * _623;
        float _633 = _553 * _623;
        bool _635 = _627 > 0.0;
        bool _637 = !_635;
        _617 = _633;
        if (!_637)
        {
            float _639 = rsqrt(_625);
            float _641 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _643 = _209 * _639;
            float _645 = _205 * _639;
            float _647 = _253 * _639;
            float _649 = _631 * _643;
            float _651 = fma(_629, _645, _649);
            float _653 = _641 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _655 = fma(_633, _647, _651);
            float _657 = _655 * _653;
            float _659 = fma(_205, _657, _539);
            float _661 = fma(_209, _657, _537);
            float _663 = fma(_253, _657, _541);
            _611 = _659;
            _613 = _661;
            _615 = _663;
        }
    }
    float _665 = _611;
    float _667 = _613;
    float _669 = _615;
    float _671 = _617;
    float _673 = _671;
    float _675 = _667;
    float _677 = _665;
    float _679 = _669;
    if (_581)
    {
        _673 = 1.0;
    }
    float _681 = _673;
    float _683 = _681;
    if (!_567)
    {
        float _685 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _687 = _467 + _685;
        float _689 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _691 = _437 + _689;
        float _693 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _695 = -_437;
        float _697 = _695 + _665;
        float _699 = _687 * _687;
        float _701 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _703 = _431 + _701;
        float _705 = -_467;
        float _707 = _705 + _667;
        float _709 = -_431;
        float _711 = _709 + _669;
        float _713 = fma(_691, _691, _699);
        float _715 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _717 = fma(_703, _703, _713);
        float _719 = sqrt(_717);
        float _721 = _693 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _723 = precise::min(_719, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _725 = _723 * _715;
        float _727 = _721 * _725;
        float _729 = fma(_697, _727, _437);
        float _731 = fma(_707, _727, _467);
        float _733 = fma(_711, _727, _431);
        _675 = _731;
        _677 = _729;
        _679 = _733;
    }
    float _735 = _675;
    float _737 = _677;
    float _739 = _679;
    if (!_581)
    {
        float _741 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _743 = _741 * 0.15915493667125701904296875;
        float _745 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _747 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _749 = fma(_607, (*spvDescriptorSet0.vp_c8)._m0[30].w, _747);
        float _751 = _743 * 6.283185482025146484375;
        float _753 = cos(_751);
        float _755 = _745 * 0.15915493667125701904296875;
        float _757 = _743 * 6.283185482025146484375;
        float _759 = sin(_757);
        float _761 = 1.0 / _753;
        float _763 = _755 * 6.283185482025146484375;
        float _765 = cos(_763);
        float _767 = _759 * _761;
        float _769 = _755 * 6.283185482025146484375;
        float _771 = sin(_769);
        float _773 = _765 * _767;
        float _775 = 1.0 / _749;
        float _777 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _779 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _777;
        float _781 = 1.0 / _773;
        float _783 = 1.0 / _779;
        float _785 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _787 = _775 * _785;
        float _789 = _771 * _781;
        float _791 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _793 = fma(_789, _787, _791);
        float _795 = _793 * _783;
        float _797 = precise::clamp(_795, 0.0, 1.0);
        _485 = _781;
        _683 = _797;
    }
    float _799 = _485;
    float _801 = _683;
    float _803 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _805 = _735 + _803;
    float _807 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _809 = _737 + _807;
    float _811 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _813 = _739 + _811;
    float _815 = _805 * _805;
    float _817 = fma(_809, _809, _815);
    float _819 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _821 = fma(_813, _813, _817);
    float _823 = rsqrt(_821);
    float _825 = sqrt(_821);
    float _827 = _823 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _829 = _809 * _827;
    float _831 = _813 * _827;
    float _833 = _829 * _829;
    float _835 = _831 * _831;
    float _837 = _833 + _835;
    float _839 = sqrt(_837);
    bool _841 = _839 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _843 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _845 = _839 + _843;
    float _847 = _823;
    float _849 = _837;
    float _851 = _845;
    float _853 = _799;
    float _855 = _805;
    float _857 = _827;
    float _859 = _829;
    if (_841)
    {
        float _861 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _847 = _861;
    }
    float _863 = _847;
    if (_841)
    {
        float _865 = rsqrt(_837);
        _849 = _865;
    }
    float _867 = _849;
    if (_841)
    {
        float _869 = _845 * _863;
        _851 = _869;
    }
    float _871 = _851;
    if (_841)
    {
        float _873 = _871 * 0.15915493667125701904296875;
        _853 = _873;
    }
    float _875 = _853;
    float _877 = _863;
    float _879 = _875;
    if (_841)
    {
        float _881 = _875 * 6.283185482025146484375;
        float _883 = sin(_881);
        _877 = _883;
    }
    float _885 = _877;
    float _887 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _889 = precise::max(0.0, _887);
    float _891 = _813;
    float _893 = _889;
    if (_841)
    {
        float _895 = _875 * 6.283185482025146484375;
        float _897 = cos(_895);
        _891 = _897;
    }
    float _899 = _891;
    float _901 = -_827;
    float _903 = -_889;
    float _905 = fma(_805, _901, _903);
    if (!_841)
    {
        _855 = _831;
    }
    float _907 = _855;
    float _909 = _907;
    if (_841)
    {
        float _911 = _905 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _893 = _911;
    }
    float _913 = _893;
    float _915 = _885;
    float _917 = _913;
    if (_841)
    {
        float _919 = fma(_885, _913, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _915 = _919;
    }
    float _921 = _915;
    float _923 = _921;
    float _925 = _899;
    if (_841)
    {
        float _927 = _899 + (-1.0);
        _917 = _927;
    }
    float _929 = _917;
    float _931 = _929;
    if (_841)
    {
        float _933 = _867 * _921;
        _857 = _933;
    }
    float _935 = _857;
    if (!_841)
    {
        _923 = _905;
    }
    float _937 = _923;
    float _939 = _735 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _941 = _937;
    if (_841)
    {
        float _943 = _929 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _879 = _943;
    }
    float _945 = _879;
    if (_841)
    {
        float _947 = _829 * _935;
        _859 = _947;
    }
    float _949 = _859;
    if (!_841)
    {
        _931 = _833;
    }
    float _951 = _931;
    float _953 = _951;
    if (_841)
    {
        float _955 = _831 * _935;
        _909 = _955;
    }
    float _957 = _909;
    if (_841)
    {
        float _959 = fma(_905, _899, _945);
        _941 = _959;
    }
    float _961 = _941;
    if (_841)
    {
        float _963 = _949 * _949;
        _953 = _963;
    }
    float _965 = _953;
    if (!_841)
    {
        _925 = _835;
    }
    float _967 = _925;
    float _969 = _967;
    if (_841)
    {
        float _971 = _957 * _957;
        _969 = _971;
    }
    float _973 = _969;
    float _975 = fma(_961, _961, _965);
    float _977 = _735 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _979 = fma(_737, (*spvDescriptorSet0.vp_c8)._m0[3].x, _939);
    float _981 = _975 + _973;
    float _983 = fma(_737, (*spvDescriptorSet0.vp_c8)._m0[2].x, _977);
    float _985 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _987 = fma(_825, (*spvDescriptorSet0.vp_c15)._m0[23].w, _985);
    float _989 = precise::clamp(_987, 0.0, 1.0);
    float _991 = _735 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _993 = fma(_739, (*spvDescriptorSet0.vp_c8)._m0[2].z, _983);
    float _995 = rsqrt(_981);
    float _997 = -_989;
    float _999 = _997 + 1.0;
    float _1001 = _735 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1003 = fma(_737, (*spvDescriptorSet0.vp_c8)._m0[1].x, _991);
    float _1005 = _993 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1007 = fma(_737, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1001);
    float _1009 = fma(_739, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1003);
    float _1011 = abs(_999);
    float _1013 = log2(_1011);
    float _1015 = _1005 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1017 = fma(_739, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1007);
    float _1019 = _1009 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1021 = -_1015;
    float _1023 = fma(_1021, _819, 1.0);
    float _1025 = _1017 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1027 = _1019 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1029 = _995 * _949;
    float _1031 = _995 * _961;
    float _1033 = fma(_739, (*spvDescriptorSet0.vp_c8)._m0[3].z, _979);
    float _1035 = fma(_1025, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1027);
    float _1037 = _1029 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1039 = _995 * _957;
    float _1041 = _1033 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1043 = fma(_1005, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1035);
    float _1045 = -_1037;
    float _1047 = fma(_1031, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1045);
    float _1049 = _1013 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1051 = log2(_1023);
    float _1053 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1043);
    float _1055 = -_1039;
    float _1057 = fma(_1055, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1047);
    float _1059 = _1019 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1061 = _1019 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1063 = fma(_1057, -0.5, 0.5);
    float _1065 = fma(_1025, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1059);
    float _1067 = exp2(_1049);
    float _1069 = fma(_1025, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1061);
    float _1071 = fma(_1057, 0.5, 0.5);
    float _1073 = fma(_1005, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1065);
    float _1075 = _1031 + 1.0;
    float _1077 = fma(_1005, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1069);
    float _1079 = fma(_1071, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1081 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1073);
    float _1083 = 1.0 / _1053;
    float _1085 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1077);
    float _1087 = fma(_1071, _1079, -0.212114393711090087890625);
    float _1089 = _1051 * 0.693147182464599609375;
    float _1091 = fma(_1071, _1087, 1.570728778839111328125);
    float _1093 = _1089 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1095 = sqrt(_1063);
    float _1097 = -_1031;
    float _1099 = fma(_1067, _1075, _1097);
    float _1101 = fma(_1099, 0.5, 0.5);
    float _1103 = _1081 * _1083;
    float _1105 = _1085 * _1083;
    float _1107 = fma(_1103, 0.5, 0.5);
    float _1109 = fma(_1105, -0.5, 0.5);
    float _1111 = _1095 * 0.636619746685028076171875;
    float3 _3307 = float3(_1107, _1109, _1093);
    float _1113 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3307, float3(0.0), isnan(_3307)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3307, float3(0.0), isnan(_3307)), level(0.0)).x;
    float _1115 = -_1091;
    float _1117 = fma(_1111, _1115, 1.0);
    float3 _3323 = float3(_1107, _1109, _1093);
    float4 _1120 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3323, float3(0.0), isnan(_3323)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3323, float3(0.0), isnan(_3323)), level(0.0)).xyzw;
    float _1122 = _1120.x;
    float _1124 = _1120.y;
    float _1126 = _1120.z;
    float _1128 = _1120.w;
    float2 _3340 = float2(_1117, _1101);
    float3 _1132 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3340, float2(0.0), isnan(_3340)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3340, float2(0.0), isnan(_3340)), level(0.0)).xyz;
    float _1134 = _1132.x;
    float _1136 = _1132.y;
    float _1138 = _1132.z;
    float _1140 = in.m_51.y;
    float _1142 = _1013 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1144 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1146 = _147 > 0.5;
    float _1148 = _1019 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1150 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1152 = _1150 != 0;
    int _1154 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1156 = _1154 != 0;
    float _1158 = fma(_1025, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1148);
    float _1160 = exp2(_1142);
    float _1162 = fma(_1005, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1158);
    float _1164 = -_371;
    int _1166 = _1146 ? as_type<int>(_1164) : as_type<int>(_371);
    float _1168 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1170 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1172 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1174 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1176 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _1178 = _1140 > 0.5;
    float _1180 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1182 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1184 = -_363;
    int _1186 = _1178 ? as_type<int>(_1184) : as_type<int>(_363);
    float _1188 = _1168 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1190 = !_1152;
    float _1192 = _1190 ? _371 : as_type<float>(_1166);
    float _1194 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _1196 = !_1156;
    float _1198 = _1196 ? _363 : as_type<float>(_1186);
    float _1200 = _1170 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1202 = -_1160;
    float _1204 = _1202 + 1.0;
    float _1206 = _1194 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1208 = _1192 + 0.5;
    float _1210 = -_1198;
    float _1212 = _1210 + 0.5;
    float _1214 = _1174 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1216 = _1176 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1218 = _1180 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1220 = _363 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1222 = _1204 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_60.x = _1188;
    out.m_60.y = _1206;
    out.m_60.z = _1200;
    out.m_60.w = _1182;
    float _1224 = _1208 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1226 = _371 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1228 = _1220 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    out.m_62.x = _1214;
    out.m_62.y = _1216;
    out.m_62.z = _1218;
    float _1230 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1162);
    bool _1232 = _825 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1234 = isnan(_825);
    bool _1236 = _1232 || _1234;
    bool _1238 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1240 = _1236 || _1238;
    float _1242 = _1212 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1244 = _1224 * _1144;
    float _1246 = _1220 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1248 = _1220 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1250 = _1242 * _1172;
    float _1252 = fma(_1226, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1228);
    float _1254 = fma(_1226, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1246);
    float _1256 = _1230 + _1053;
    float _1258 = fma(_1226, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1248);
    out.m_64.x = _1244;
    out.m_64.y = _1250;
    float _1260 = _1256 * 0.5;
    float _1262 = _1256;
    float _1264 = _1254;
    float _1266 = _1053;
    float _1268 = _1230;
    float _1270 = _1085;
    float _1272 = _1081;
    if (!_1240)
    {
        _1262 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1274 = _1262;
    out.gl_Position.x = _1081;
    out.gl_Position.y = _1085;
    out.gl_Position.z = _1230;
    out.gl_Position.w = _1053;
    float _1276 = _1252 + (*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _1278 = _1254 + (*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _1280 = _1258 + (*spvDescriptorSet0.vp_c8)._m0[26].z;
    out.m_66.z = _1260;
    out.m_66.w = _1053;
    float _1282 = _801 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1284 = _1274;
    float _1286 = _1274;
    if (!_1240)
    {
        _1264 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1288 = _1264;
    out.m_68.x = _1276;
    out.m_68.y = _1278;
    out.m_68.z = _1280;
    float _1290 = _1288;
    float _1292 = _1288;
    if (!_1240)
    {
        _1266 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1294 = _1266;
    float _1296 = _1294;
    float _1298 = _1294;
    if (!_1240)
    {
        _1268 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1300 = _1268;
    float _1302 = _1300;
    float _1304 = _1300;
    if (!_1240)
    {
        _1270 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1306 = _1270;
    float _1308 = _1306;
    float _1310 = _1306;
    if (!_1240)
    {
        _1272 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1312 = _1272;
    float _1314 = _1222 * _1113;
    float _1316 = -_1222;
    float _1318 = _1316 + 1.0;
    float _1320 = _1128 * _1314;
    float _1322 = _1128 * _1318;
    float _1324 = _1138 * _1314;
    float _1326 = fma(_1134, _1320, _1122);
    float _1328 = fma(_1136, _1320, _1124);
    float _1330 = fma(_1128, _1324, _1126);
    out.m_70.x = _1326;
    out.m_70.y = _1328;
    out.m_70.z = _1330;
    out.m_70.w = _1322;
    bool _1332 = !_1240;
    float _1334 = _1312;
    float _1336 = _1312;
    if (!_1332)
    {
        bool _1338 = _825 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1340 = isnan(_825);
        bool _1342 = _1338 || _1340;
        bool _1344 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1346 = _1342 || _1344;
        if (!_1346)
        {
            float _1348 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1350 = _825 + _1348;
            float _1352 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1354 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1352;
            float _1356 = 1.0 / _1354;
            float _1358 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1360 = _1358 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1362 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1364 = _1362 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1366 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1368 = _1366 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1370 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1372 = _1370 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1374 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1376 = _1374 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1378 = _1350 * _1356;
            float _1380 = precise::clamp(_1378, 0.0, 1.0);
            float _1382 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1384 = _1382 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1386 = fma(_1380, _1360, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1388 = fma(_1380, _1384, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1390 = fma(_1380, _1364, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1392 = fma(_1380, _1368, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1394 = fma(_1380, _1372, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1396 = fma(_1380, _1376, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1292 = _1388;
            _1310 = _1394;
            _1286 = _1386;
            _1304 = _1392;
            _1298 = _1390;
            _1336 = _1396;
            _1398 = true;
        }
        else
        {
            bool _1400 = _825 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1402 = isnan(_825);
            bool _1404 = _1400 || _1402;
            bool _1406 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1408 = _1404 || _1406;
            if (!_1408)
            {
                _1284 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1410 = _1284;
            _1286 = _1410;
            if (!_1408)
            {
                _1290 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1412 = _1290;
            _1292 = _1412;
            if (!_1408)
            {
                _1296 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1414 = _1296;
            _1298 = _1414;
            if (!_1408)
            {
                _1302 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1416 = _1302;
            _1304 = _1416;
            if (!_1408)
            {
                _1308 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1418 = _1308;
            _1310 = _1418;
            if (!_1408)
            {
                _1334 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1420 = _1334;
            bool _1422 = !_1408;
            _1336 = _1420;
            if (!_1422)
            {
                bool _1424 = _825 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1426 = isnan(_825);
                bool _1428 = _1424 || _1426;
                bool _1430 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1432 = _1428 || _1430;
                if (!_1432)
                {
                    float _1434 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1436 = _825 + _1434;
                    float _1438 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1440 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1438;
                    float _1442 = 1.0 / _1440;
                    float _1444 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1446 = _1444 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1448 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1450 = _1448 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1452 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1454 = _1452 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1456 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1458 = _1456 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1460 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1462 = _1460 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1464 = _1436 * _1442;
                    float _1466 = precise::clamp(_1464, 0.0, 1.0);
                    float _1468 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1470 = _1468 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1472 = fma(_1466, _1446, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1474 = fma(_1466, _1470, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1476 = fma(_1466, _1450, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1478 = fma(_1466, _1454, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1480 = fma(_1466, _1458, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1482 = fma(_1466, _1462, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1292 = _1474;
                    _1310 = _1480;
                    _1286 = _1472;
                    _1304 = _1478;
                    _1298 = _1476;
                    _1336 = _1482;
                    _1398 = true;
                }
                else
                {
                    _1292 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1310 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1286 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1304 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1298 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1336 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1398 = false;
    float _1484 = _1292;
    float _1486 = _1310;
    float _1488 = _1286;
    float _1490 = _1304;
    float _1492 = _1298;
    float _1494 = _1336;
    float _1496 = fma(_1278, -0.5, 0.5);
    float _1498 = precise::clamp(_1496, 0.0, 1.0);
    float _1500 = -_1484;
    float _1502 = _1500 + _1486;
    float _1504 = _1282 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1506 = -_1488;
    float _1508 = _1506 + _1490;
    float _1510 = fma(_1498, _1502, _1484);
    out.m_72.x = 0.0;
    float _1512 = -_1492;
    float _1514 = _1512 + _1494;
    float _1516 = fma(_1498, _1508, _1488);
    float _1518 = _1510 * 0.586610972881317138671875;
    out.m_47.x = _1504;
    bool _1520 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1522 = fma(_1498, _1514, _1492);
    float _1524 = fma(_1516, 0.298911988735198974609375, _1518);
    bool _1526 = _801 > 0.0;
    bool _1528 = isnan(_801);
    bool _1530 = _1526 || _1528;
    bool _1532 = isnan(0.0);
    bool _1534 = _1530 || _1532;
    float _1536 = fma(_1522, 0.114477999508380889892578125, _1524);
    float _1538 = -_1536;
    float _1540 = _1516 + _1538;
    float _1542 = -_1536;
    float _1544 = _1510 + _1542;
    float _1546 = -_1536;
    float _1548 = _1522 + _1546;
    float _1550 = fma(_1540, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1536);
    float _1552 = fma(_1544, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1536);
    float _1554 = fma(_1548, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1536);
    bool _1556 = !_1520;
    if (!_1556)
    {
        float _1558 = -_735;
        float _1560 = _1558 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _1562 = -_737;
        float _1564 = _1562 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _1566 = -_739;
        float _1568 = _1566 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _1570 = _1560 * _1560;
        float _1572 = fma(_1564, _1564, _1570);
        float _1574 = fma(_1568, _1568, _1572);
        float _1576 = sqrt(_1574);
        float _1578 = rsqrt(_1574);
        float _1580 = -_1576;
        float _1582 = _1580 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _1584 = _1582 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _1586 = precise::clamp(_1584, 0.0, 1.0);
        float _1588 = _1564 * _1578;
        float _1590 = _1560 * _1578;
        float _1592 = abs(_1586);
        float _1594 = log2(_1592);
        float _1596 = _1568 * _1578;
        float _1598 = _1588 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _1600 = _1278 * _1590;
        float _1602 = -_1590;
        float _1604 = -_1598;
        float _1606 = fma(_1602, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1604);
        float _1608 = fma(_1276, _1588, _1600);
        float _1610 = -_1596;
        float _1612 = fma(_1610, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1606);
        float _1614 = fma(_1280, _1596, _1608);
        float _1616 = precise::clamp(_1614, 0.0, 1.0);
        float _1618 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _1620 = _1612 + _1618;
        float _1622 = _1594 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _1624 = _1620 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _1626 = precise::clamp(_1624, 0.0, 1.0);
        float _1628 = exp2(_1622);
        float _1630 = _1628 * _1626;
        float _1632 = _1616 * _1630;
        float _1634 = _1632 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _1636 = _1632 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _1638 = _1632 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_72.x = _1634;
        out.m_72.y = _1636;
        out.m_72.z = _1638;
    }
    out.m_74.x = _1550;
    out.m_74.y = _1552;
    out.m_74.z = _1554;
    if (_1534)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _1640 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1640;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}


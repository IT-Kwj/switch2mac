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
    constant _16* vp_c13 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
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
    float4 m_70 [[user(locn0)]];
    float4 m_68 [[user(locn1)]];
    float4 m_47 [[user(locn2)]];
    float4 m_72 [[user(locn3)]];
    float4 m_58 [[user(locn4)]];
    float4 m_66 [[user(locn6)]];
    float4 m_74 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_64 [[attribute(0)]];
    float4 m_60 [[attribute(1)]];
    float4 m_56 [[attribute(2)]];
    float4 m_44 [[attribute(3)]];
    float4 m_49 [[attribute(4)]];
    float4 m_51 [[attribute(5)]];
    float4 m_62 [[attribute(6)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1976 = false;
    bool _465 = false;
    bool _299 = false;
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
        float _2141 = as_type<float>(_109);
        out.gl_Position.z = _2141;
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
    float _129 = _127;
    if (_123)
    {
        float _131 = float(_93);
        _103 = _131;
    }
    float _133 = _103;
    bool _135 = _127 >= _133;
    bool _137 = !_123;
    bool _139 = _135 || _137;
    float _141 = _133;
    if (_139)
    {
        _141 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _143 = _141;
    if (_139)
    {
        out.m_47.x = 0.0;
    }
    if (_139)
    {
        float _145 = _143 * 5.0;
        _111 = as_type<int>(_145);
    }
    int _147 = _111;
    if (_139)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2211 = as_type<float>(_147);
        out.gl_Position.z = _2211;
    }
    if (_139)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _149 = in.m_51.x;
    float _151 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _153 = _127 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _155 = as_type<float>(int(gl_VertexIndex));
    float _157 = in.m_56.x;
    float _159 = in.m_56.y;
    float _161 = in.m_56.z;
    float _163 = _153 * _151;
    float _165 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[20].x, _163);
    int _167 = as_type<int>(_155) & 1;
    bool _169 = _167 != 0;
    int _171 = as_type<int>(_155) & 2;
    bool _173 = _171 != 0;
    float _175 = floor(_165);
    int _177 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _179 = _177 != 0;
    float _181 = _165 * 6.283185482025146484375;
    float _183 = _159 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _185 = !_173;
    int _187 = _185 ? (-1090519040) : 1056964608;
    float _189 = _159 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _191 = _181 * 0.15915493667125701904296875;
    int _193 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _195 = _193 != 0;
    int _197 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _199 = _197 != 0;
    float _201 = _159 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _203 = fma(_157, (*spvDescriptorSet0.vp_c10)._m0[4].x, _183);
    float _205 = fma(_157, (*spvDescriptorSet0.vp_c10)._m0[5].x, _189);
    bool _207 = !_169;
    int _209 = _207 ? (-1090519040) : 1056964608;
    float _211 = _191 * 6.283185482025146484375;
    float _213 = cos(_211);
    bool _215 = !_195;
    int _217 = _215 ? 0 : 1;
    float _219 = fma(_157, (*spvDescriptorSet0.vp_c10)._m0[6].x, _201);
    bool _221 = !_179;
    int _223 = _221 ? 0 : 1;
    float _225 = -_175;
    float _227 = _165 + _225;
    int _229 = abs(_217);
    out.m_58.x = as_type<float>(_209);
    out.m_58.y = as_type<float>(_187);
    int _231 = abs(_223);
    float _233 = -_227;
    float _235 = fma(_233, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _237 = fma(_161, (*spvDescriptorSet0.vp_c10)._m0[6].z, _219);
    bool _239 = !_199;
    int _241 = _239 ? 0 : 1;
    float _243 = float(_229);
    bool _245 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _247 = fma(_213, 0.5, 0.5);
    int _249 = abs(_241);
    float _251 = abs(_235);
    float _253 = _243 * _251;
    float _255 = float(_231);
    bool _257 = _227 < 0.5;
    float _259 = float(_257);
    float _261 = -_247;
    float _263 = fma(_261, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _265 = fma(_161, (*spvDescriptorSet0.vp_c10)._m0[4].z, _203);
    float _267 = -_259;
    float _269 = fma(_267, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _271 = float(_249);
    float _273 = fma(_255, _263, _253);
    float _275 = fma(_161, (*spvDescriptorSet0.vp_c10)._m0[5].z, _205);
    float _277 = abs(_269);
    float _279 = fma(_271, _277, _273);
    bool _281 = !_245;
    float _297;
    if (!_281)
    {
        float _283 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _285 = _149 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _287 = fma(_285, (*spvDescriptorSet0.vp_c9)._m0[11].x, _127);
        float _289 = _287 * _283;
        float _291 = floor(_289);
        float _293 = -_291;
        float _295 = _289 + _293;
        _297 = _295;
        _299 = true;
    }
    else
    {
        float _301 = float(_93);
        float _303 = 1.0 / _301;
        float _305 = _127 * _303;
        _297 = _305;
    }
    _299 = false;
    float _307 = _297;
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _311 = _307 + _309;
    bool _313 = _307 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _315 = isnan(_307);
    bool _317 = _313 || _315;
    bool _319 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _321 = _317 || _319;
    float _323 = float(_321);
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _327 = _307 + _325;
    bool _329 = _307 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _331 = isnan(_307);
    bool _333 = _329 || _331;
    bool _335 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _337 = _333 || _335;
    float _339 = float(_337);
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _343 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _341;
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _347 = _345 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _349 = _307 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _351 = isnan(_307);
    bool _353 = _349 || _351;
    bool _355 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _357 = _353 || _355;
    float _359 = float(_357);
    float _361 = -_323;
    float _363 = _361 + 1.0;
    float _365 = 1.0 / _347;
    float _367 = _359 * _363;
    float _369 = -_359;
    float _371 = _369 + 1.0;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _375 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _373;
    bool _377 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _379 = 1.0 / _343;
    float _381 = _339 * _371;
    float _383 = -_339;
    float _385 = _383 + 1.0;
    float _387 = _327 * _365;
    float _389 = _311 * _379;
    float _391 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _393 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _391;
    float _395 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _397 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _395;
    float _399 = fma(_375, _389, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _401 = fma(_393, _389, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _403 = fma(_397, _389, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _405 = _399 * _381;
    float _407 = _401 * _381;
    float _409 = _403 * _381;
    float _411 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _413 = _411 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _417 = _415 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _421 = _419 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _423 = fma(_385, (*spvDescriptorSet0.vp_c9)._m0[107].x, _405);
    float _425 = fma(_413, _387, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _427 = fma(_417, _387, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _429 = fma(_385, (*spvDescriptorSet0.vp_c9)._m0[107].y, _407);
    float _431 = fma(_421, _387, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _433 = fma(_385, (*spvDescriptorSet0.vp_c9)._m0[107].z, _409);
    float _435 = fma(_425, _367, _423);
    float _437 = fma(_427, _367, _429);
    float _439 = fma(_431, _367, _433);
    float _441 = fma(_323, (*spvDescriptorSet0.vp_c9)._m0[109].x, _435);
    float _443 = fma(_323, (*spvDescriptorSet0.vp_c9)._m0[109].y, _437);
    float _445 = fma(_323, (*spvDescriptorSet0.vp_c9)._m0[109].z, _439);
    bool _447 = !_377;
    float _463;
    if (!_447)
    {
        float _449 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _451 = _149 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _453 = fma(_451, (*spvDescriptorSet0.vp_c9)._m0[11].y, _127);
        float _455 = _453 * _449;
        float _457 = floor(_455);
        float _459 = -_457;
        float _461 = _455 + _459;
        _463 = _461;
        _465 = true;
    }
    else
    {
        float _467 = float(_93);
        float _469 = 1.0 / _467;
        float _471 = _127 * _469;
        _463 = _471;
    }
    _465 = false;
    float _473 = _463;
    float _475 = in.m_51.z;
    float _477 = _149 * 2.0;
    float _479 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _481 = log2(_479);
    float _483 = in.m_51.y;
    float _485 = floor(_477);
    float _487 = _475 * 2.0;
    bool _489 = _485 > 0.0;
    float _491 = _483 * 2.0;
    bool _493 = _485 >= 0.0;
    bool _495 = isnan(_485);
    bool _497 = _493 || _495;
    bool _499 = isnan(0.0);
    bool _501 = _497 || _499;
    float _503 = floor(_487);
    float _505 = _483 + _475;
    int _507 = _501 ? 0 : 1;
    float _509 = _505 + (-1.0);
    int _511 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _513 = _511 != 0;
    int _515 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _517 = _515 != 0;
    int _519 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _521 = _519 != 0;
    float _523 = floor(_491);
    int _525 = ~_507;
    int _527 = _525 + 1;
    int _529 = _527 + 1;
    float _531 = fma(_509, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _533 = _529;
    if (!_489)
    {
        int _535 = ~_507;
        int _537 = _535 + 1;
        _533 = _537;
    }
    int _539 = _533;
    bool _541 = !_517;
    int _543 = _541 ? 0 : 1;
    float _545 = _481 * _127;
    bool _547 = _503 > 0.0;
    bool _549 = _503 >= 0.0;
    bool _551 = isnan(_503);
    bool _553 = _549 || _551;
    bool _555 = isnan(0.0);
    bool _557 = _553 || _555;
    float _559 = in.m_60.x;
    float _561 = in.m_60.y;
    float _563 = in.m_60.z;
    float _565 = exp2(_545);
    bool _567 = _523 > 0.0;
    bool _569 = _523 >= 0.0;
    bool _571 = isnan(_523);
    bool _573 = _569 || _571;
    bool _575 = isnan(0.0);
    bool _577 = _573 || _575;
    float _579 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _581 = 1.0 + _579;
    bool _583 = !_513;
    int _585 = _583 ? 0 : 1;
    int _587 = abs(_543);
    float _589 = 1.0 / _581;
    int _591 = _557 ? 0 : 1;
    bool _593 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _595 = isnan(1.0);
    bool _597 = _593 || _595;
    bool _599 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _601 = _597 || _599;
    float _603 = float(_539);
    bool _605 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _607 = isnan(0.0);
    bool _609 = _605 || _607;
    bool _611 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _613 = _609 || _611;
    float _615 = -_565;
    float _617 = _615 + 1.0;
    int _619 = abs(_585);
    float _621 = float(_587);
    int _623 = ~_591;
    int _625 = _623 + 1;
    int _627 = _625 + 1;
    int _629 = _627;
    if (!_547)
    {
        int _631 = ~_591;
        int _633 = _631 + 1;
        _629 = _633;
    }
    int _635 = _629;
    float _637 = _621 * _603;
    int _639 = _577 ? 0 : 1;
    float _641 = _613 ? _617 : 0.0;
    float _643 = _637 * (-2.0);
    bool _645 = !_521;
    int _647 = _645 ? 0 : 1;
    int _649 = ~_639;
    int _651 = _649 + 1;
    int _653 = _651 + 1;
    int _655 = _653;
    if (_601)
    {
        float _657 = _641 * _589;
        _129 = _657;
    }
    float _659 = _129;
    if (!_567)
    {
        int _661 = ~_639;
        int _663 = _661 + 1;
        _655 = _663;
    }
    int _665 = _655;
    float _667 = _483 + (-0.5);
    int _669 = abs(_647);
    float _671 = fma(_643, _561, _561);
    float _673 = float(_619);
    float _675 = fma(_531, _643, _531);
    float _677 = float(_635);
    float _679 = _149 + _483;
    float _681 = fma(_667, (*spvDescriptorSet0.vp_c9)._m0[196].y, _671);
    float _683 = _673 * _677;
    float _685 = _679 + (-1.0);
    float _687 = fma(_675, _659, _681);
    float _689 = _683 * (-2.0);
    float _691 = fma(_685, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _693 = _149 + (-0.5);
    float _695 = float(_669);
    float _697 = fma(_689, _559, _559);
    float _699 = float(_665);
    float _701 = fma(_691, _689, _691);
    float _703 = _149 + _475;
    float _705 = fma(_693, (*spvDescriptorSet0.vp_c9)._m0[196].x, _697);
    float _707 = _695 * _699;
    float _709 = in.m_62.x;
    float _711 = in.m_62.y;
    float _713 = _703 + (-1.0);
    float _715 = _475 + (-0.5);
    float _717 = _707 * (-2.0);
    float _719 = fma(_701, _659, _705);
    float _721 = fma(_713, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _723 = _687 * 0.15915493667125701904296875;
    float _725 = fma(_717, _563, _563);
    float _727 = _719 * 0.15915493667125701904296875;
    float _729 = fma(_721, _717, _721);
    float _731 = _723 * 6.283185482025146484375;
    float _733 = cos(_731);
    float _735 = fma(_715, (*spvDescriptorSet0.vp_c9)._m0[196].z, _725);
    float _737 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, as_type<float>(_187));
    float _739 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, as_type<float>(_209));
    float _741 = fma(_729, _659, _735);
    float _743 = _727 * 6.283185482025146484375;
    float _745 = sin(_743);
    float _747 = _741 * 0.15915493667125701904296875;
    float _749 = _711 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _751 = _747 * 6.283185482025146484375;
    float _753 = cos(_751);
    float _755 = _749 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _757 = _755 * _737;
    float _759 = _723 * 6.283185482025146484375;
    float _761 = sin(_759);
    float _763 = _727 * 6.283185482025146484375;
    float _765 = cos(_763);
    float _767 = _709 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _769 = _733 * _753;
    float _771 = in.m_44.x;
    float _773 = in.m_44.y;
    float _775 = in.m_44.z;
    float _777 = _753 * _757;
    float _779 = _767 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _781 = _747 * 6.283185482025146484375;
    float _783 = sin(_781);
    float _785 = _745 * _761;
    float _787 = _779 * _739;
    float _789 = _745 * _777;
    float _791 = _765 * _761;
    float _793 = _745 * _733;
    float _795 = _765 * _733;
    float _797 = _765 * _777;
    float _799 = _761 * _753;
    float _801 = fma(_783, _795, _785);
    float _803 = -_791;
    float _805 = fma(_783, _793, _803);
    float _807 = -_793;
    float _809 = fma(_783, _791, _807);
    float _811 = -_757;
    float _813 = _783 * _811;
    float _815 = fma(_801, _787, _797);
    float _817 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _819 = fma(_783, _785, _795);
    float _821 = fma(_769, _787, _813);
    float _823 = fma(_805, _787, _789);
    float _825 = fma(_809, _817, _815);
    float _827 = _773 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _829 = fma(_799, _817, _821);
    float _831 = fma(_819, _817, _823);
    float _833 = _825 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _835 = _773 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _837 = fma(_771, (*spvDescriptorSet0.vp_c10)._m0[6].x, _827);
    float _839 = _825 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _841 = fma(_829, (*spvDescriptorSet0.vp_c8)._m0[26].x, _833);
    float _843 = fma(_771, (*spvDescriptorSet0.vp_c10)._m0[4].x, _835);
    float _845 = fma(_775, (*spvDescriptorSet0.vp_c10)._m0[6].z, _837);
    float _847 = fma(_829, (*spvDescriptorSet0.vp_c8)._m0[24].x, _839);
    float _849 = fma(_831, (*spvDescriptorSet0.vp_c8)._m0[26].z, _841);
    float _851 = fma(_775, (*spvDescriptorSet0.vp_c10)._m0[4].z, _843);
    float _853 = _845 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _855 = fma(_831, (*spvDescriptorSet0.vp_c8)._m0[24].z, _847);
    float _857 = _849 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _859 = _851 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _861 = _855 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _863 = _853 + _857;
    float _865 = in.m_64.y;
    float _867 = _859 + _861;
    float _869 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _871 = _863 + _869;
    float _873 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _875 = _867 + _873;
    float _877 = _871 * _871;
    float _879 = fma(_875, _875, _877);
    float _881 = _825 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _883 = sqrt(_879);
    float _885 = fma(_829, (*spvDescriptorSet0.vp_c8)._m0[25].x, _881);
    float _887 = fma(_831, (*spvDescriptorSet0.vp_c8)._m0[25].z, _885);
    float _889 = _887 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _891 = _773 + _865;
    float _893 = _891 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _895 = _891 + _889;
    bool _897 = _883 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _899 = fma(_859, (*spvDescriptorSet0.vp_c8)._m0[11].x, _893);
    float _901 = fma(_853, (*spvDescriptorSet0.vp_c8)._m0[11].z, _899);
    float _903 = _773;
    float _905 = _899;
    float _907 = _879;
    float _909 = _757;
    float _911 = _813;
    if (!_897)
    {
        _903 = _867;
    }
    float _913 = _903;
    float _915 = _913;
    if (!_897)
    {
        _905 = _863;
    }
    float _917 = _905;
    float _919 = 0.0;
    float _921 = _917;
    if (!_897)
    {
        _919 = _895;
    }
    float _923 = _919;
    bool _925 = !_897;
    float _927 = _923;
    if (!_925)
    {
        float _929 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _931 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _933 = _883 + _931;
        float _935 = _895 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _937 = _933 * _929;
        float _939 = rsqrt(_879);
        float _941 = _937 * 0.15915493667125701904296875;
        float _943 = _941 * 6.283185482025146484375;
        float _945 = cos(_943);
        float _947 = _941 * 6.283185482025146484375;
        float _949 = sin(_947);
        float _951 = _945 + (-1.0);
        float _953 = fma(_949, _935, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _955 = _951 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _957 = _939 * _953;
        float _959 = fma(_895, _945, _955);
        float _961 = fma(_875, _957, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _963 = fma(_871, _957, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _927 = _959;
        _915 = _961;
        _921 = _963;
    }
    float _965 = _927;
    float _967 = _915;
    float _969 = _921;
    float _971 = -_891;
    float _973 = _971 + _965;
    float _975 = -_859;
    float _977 = _975 + _967;
    float _979 = _901 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _981 = -_853;
    float _983 = _981 + _969;
    float _985 = _973 * _973;
    float _987 = _891 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _989 = 1.0 / _979;
    float _991 = fma(_977, _977, _985);
    float _993 = fma(_859, (*spvDescriptorSet0.vp_c8)._m0[10].x, _987);
    bool _995 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _997 = isnan(0.5);
    bool _999 = _995 || _997;
    bool _1001 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1003 = _999 || _1001;
    float _1005 = fma(_983, _983, _991);
    float _1007 = fma(_853, (*spvDescriptorSet0.vp_c8)._m0[10].z, _993);
    bool _1009 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1011 = isnan(0.5);
    bool _1013 = _1009 || _1011;
    bool _1015 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1017 = _1013 || _1015;
    float _1019 = sqrt(_1005);
    float _1021 = _1007 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1023 = _1021 + _979;
    float _1025 = _1023 * _989;
    float _1027 = _1025 * 0.5;
    bool _1029 = _1019 > 0.0;
    float _1031 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1033 = fma(_1027, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1031);
    float _1035 = 1.0 / _1033;
    bool _1037 = !_1029;
    float _1039 = _967;
    float _1041 = _965;
    float _1043 = _969;
    float _1045 = _973;
    if (!_1037)
    {
        float _1047 = _275 * _275;
        float _1049 = fma(_265, _265, _1047);
        float _1051 = rsqrt(_1005);
        float _1053 = fma(_237, _237, _1049);
        float _1055 = sqrt(_1053);
        float _1057 = _977 * _1051;
        float _1059 = _973 * _1051;
        float _1061 = _983 * _1051;
        bool _1063 = _1055 > 0.0;
        bool _1065 = !_1063;
        _1045 = _1059;
        if (!_1065)
        {
            float _1067 = rsqrt(_1053);
            float _1069 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1071 = _275 * _1067;
            float _1073 = _265 * _1067;
            float _1075 = _1059 * _1071;
            float _1077 = _237 * _1067;
            float _1079 = fma(_1057, _1073, _1075);
            float _1081 = _1069 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1083 = fma(_1061, _1077, _1079);
            float _1085 = _1083 * _1081;
            float _1087 = fma(_265, _1085, _967);
            float _1089 = fma(_275, _1085, _965);
            float _1091 = fma(_237, _1085, _969);
            _1039 = _1087;
            _1041 = _1089;
            _1043 = _1091;
            _1045 = _1079;
        }
    }
    float _1093 = _1039;
    float _1095 = _1041;
    float _1097 = _1043;
    float _1099 = _1045;
    float _1101 = _1099;
    float _1103 = _1095;
    float _1105 = _1097;
    if (_1017)
    {
        _907 = 1.0;
    }
    float _1107 = _907;
    float _1109 = _1107;
    if (_1003)
    {
        _909 = _1093;
    }
    float _1111 = _909;
    float _1113 = _1111;
    if (!_1003)
    {
        float _1115 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1117 = _891 + _1115;
        float _1119 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1121 = _859 + _1119;
        float _1123 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1125 = -_891;
        float _1127 = _1125 + _1095;
        float _1129 = _1117 * _1117;
        float _1131 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1133 = _853 + _1131;
        float _1135 = -_853;
        float _1137 = _1135 + _1097;
        float _1139 = fma(_1121, _1121, _1129);
        float _1141 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1143 = fma(_1133, _1133, _1139);
        float _1145 = sqrt(_1143);
        float _1147 = _1123 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1149 = precise::min(_1145, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1151 = _1149 * _1141;
        float _1153 = -_859;
        float _1155 = _1153 + _1093;
        float _1157 = _1147 * _1151;
        float _1159 = fma(_1155, _1157, _859);
        float _1161 = fma(_1127, _1157, _891);
        float _1163 = fma(_1137, _1157, _853);
        _1101 = _1151;
        _1103 = _1161;
        _1113 = _1159;
        _1105 = _1163;
    }
    float _1165 = _1101;
    float _1167 = _1103;
    float _1169 = _1113;
    float _1171 = _1105;
    float _1173 = _1165;
    if (_1017)
    {
        _911 = 1.0;
    }
    float _1175 = _911;
    float _1177 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1179 = _1035 * _1177;
    float _1181 = _1175;
    if (!_1017)
    {
        float _1183 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1185 = _1183 * 0.15915493667125701904296875;
        float _1187 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1189 = _1185 * 6.283185482025146484375;
        float _1191 = cos(_1189);
        float _1193 = _1187 * 0.15915493667125701904296875;
        float _1195 = _1185 * 6.283185482025146484375;
        float _1197 = sin(_1195);
        float _1199 = 1.0 / _1191;
        float _1201 = _1193 * 6.283185482025146484375;
        float _1203 = cos(_1201);
        float _1205 = _1197 * _1199;
        float _1207 = _1193 * 6.283185482025146484375;
        float _1209 = sin(_1207);
        float _1211 = _1203 * _1205;
        float _1213 = 1.0 / _1211;
        float _1215 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1217 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1215;
        float _1219 = 1.0 / _1217;
        float _1221 = _1209 * _1213;
        float _1223 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1225 = fma(_1179, _1221, _1223);
        float _1227 = _1225 * _1219;
        float _1229 = precise::clamp(_1227, 0.0, 1.0);
        _1173 = _1213;
        _1109 = _1229;
    }
    float _1231 = _1173;
    float _1233 = _1109;
    float _1235 = _1231;
    if (!_1017)
    {
        float _1237 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1239 = _1237 * 0.15915493667125701904296875;
        float _1241 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1243 = _1239 * 6.283185482025146484375;
        float _1245 = cos(_1243);
        float _1247 = _1241 * 0.15915493667125701904296875;
        float _1249 = _1239 * 6.283185482025146484375;
        float _1251 = sin(_1249);
        float _1253 = 1.0 / _1245;
        float _1255 = _1247 * 6.283185482025146484375;
        float _1257 = cos(_1255);
        float _1259 = _1251 * _1253;
        float _1261 = _1247 * 6.283185482025146484375;
        float _1263 = sin(_1261);
        float _1265 = _1257 * _1259;
        float _1267 = 1.0 / _1265;
        float _1269 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1271 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1269;
        float _1273 = 1.0 / _1271;
        float _1275 = _1263 * _1267;
        float _1277 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1279 = fma(_1179, _1275, _1277);
        float _1281 = _1279 * _1273;
        float _1283 = precise::clamp(_1281, 0.0, 1.0);
        float _1285 = -_1283;
        float _1287 = _1285 + 1.0;
        _1235 = _1265;
        _1181 = _1287;
    }
    float _1289 = _1235;
    float _1291 = _1181;
    float _1293 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1295 = _1167 + _1293;
    float _1297 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1299 = _1169 + _1297;
    float _1301 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1303 = _1171 + _1301;
    float _1305 = _1295 * _1295;
    float _1307 = fma(_1299, _1299, _1305);
    float _1309 = fma(_1303, _1303, _1307);
    float _1311 = rsqrt(_1309);
    float _1313 = sqrt(_1309);
    float _1315 = _1311 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1317 = _1299 * _1315;
    float _1319 = _1303 * _1315;
    float _1321 = _1317 * _1317;
    float _1323 = _1319 * _1319;
    float _1325 = _1321 + _1323;
    float _1327 = sqrt(_1325);
    bool _1329 = _1327 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1331 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1333 = _1327 + _1331;
    float _1335 = _1303;
    float _1337 = _1325;
    float _1339 = _1333;
    float _1341 = _1289;
    float _1343 = _1315;
    if (_1329)
    {
        float _1345 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1335 = _1345;
    }
    float _1347 = _1335;
    if (_1329)
    {
        float _1349 = rsqrt(_1325);
        _1337 = _1349;
    }
    float _1351 = _1337;
    float _1353 = _1351;
    if (_1329)
    {
        float _1355 = _1333 * _1347;
        _1339 = _1355;
    }
    float _1357 = _1339;
    if (_1329)
    {
        float _1359 = _1357 * 0.15915493667125701904296875;
        _1341 = _1359;
    }
    float _1361 = _1341;
    float _1363 = _1347;
    float _1365 = _1361;
    if (_1329)
    {
        float _1367 = _1361 * 6.283185482025146484375;
        float _1369 = sin(_1367);
        _1363 = _1369;
    }
    float _1371 = _1363;
    float _1373 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1375 = precise::max(0.0, _1373);
    float _1377 = _1305;
    float _1379 = _1375;
    if (_1329)
    {
        float _1381 = _1361 * 6.283185482025146484375;
        float _1383 = cos(_1381);
        _1377 = _1383;
    }
    float _1385 = _1377;
    float _1387 = -_1315;
    float _1389 = -_1375;
    float _1391 = fma(_1295, _1387, _1389);
    float _1393 = _1391;
    if (_1329)
    {
        float _1395 = _1391 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1379 = _1395;
    }
    float _1397 = _1379;
    float _1399 = _1371;
    float _1401 = _1397;
    if (_1329)
    {
        float _1403 = fma(_1371, _1397, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1399 = _1403;
    }
    float _1405 = _1399;
    float _1407 = _1405;
    float _1409 = _1385;
    if (_1329)
    {
        float _1411 = _1385 + (-1.0);
        _1401 = _1411;
    }
    float _1413 = _1401;
    float _1415 = _1413;
    if (_1329)
    {
        float _1417 = _1351 * _1405;
        _1343 = _1417;
    }
    float _1419 = _1343;
    if (!_1329)
    {
        _1407 = _1317;
    }
    float _1421 = _1407;
    float _1423 = _1421;
    if (_1329)
    {
        float _1425 = _1413 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1365 = _1425;
    }
    float _1427 = _1365;
    if (_1329)
    {
        float _1429 = _1317 * _1419;
        _1423 = _1429;
    }
    float _1431 = _1423;
    if (!_1329)
    {
        _1415 = _1319;
    }
    float _1433 = _1415;
    float _1435 = _1433;
    if (_1329)
    {
        float _1437 = _1319 * _1419;
        _1435 = _1437;
    }
    float _1439 = _1435;
    if (!_1329)
    {
        _1353 = _1321;
    }
    float _1441 = _1353;
    float _1443 = _1441;
    if (_1329)
    {
        float _1445 = fma(_1391, _1385, _1427);
        _1393 = _1445;
    }
    float _1447 = _1393;
    if (_1329)
    {
        float _1449 = _1431 * _1431;
        _1443 = _1449;
    }
    float _1451 = _1443;
    if (!_1329)
    {
        _1409 = _1323;
    }
    float _1453 = _1409;
    float _1455 = _1453;
    if (_1329)
    {
        float _1457 = _1439 * _1439;
        _1455 = _1457;
    }
    float _1459 = _1455;
    float _1461 = fma(_1447, _1447, _1451);
    float _1463 = _1167 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1465 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1467 = _1461 + _1459;
    float _1469 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1463);
    float _1471 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1473 = fma(_1313, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1471);
    float _1475 = precise::clamp(_1473, 0.0, 1.0);
    float _1477 = _1167 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1479 = _1167 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1481 = fma(_1171, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1469);
    float _1483 = rsqrt(_1467);
    float _1485 = -_1475;
    float _1487 = _1485 + 1.0;
    float _1489 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1477);
    float _1491 = _1481 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1493 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1479);
    float _1495 = _1167 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1497 = fma(_1171, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1489);
    float _1499 = _1491 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1501 = fma(_1171, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1493);
    float _1503 = abs(_1487);
    float _1505 = log2(_1503);
    float _1507 = _1497 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1509 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1495);
    float _1511 = _1501 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1513 = -_1499;
    float _1515 = fma(_1513, _1465, 1.0);
    float _1517 = _1507 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1519 = fma(_1171, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1509);
    float _1521 = _1483 * _1431;
    float _1523 = _1483 * _1447;
    float _1525 = fma(_1511, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1517);
    float _1527 = _1483 * _1439;
    float _1529 = _1521 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1531 = _1519 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1533 = fma(_1491, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1525);
    float _1535 = log2(_1515);
    float _1537 = -_1529;
    float _1539 = fma(_1523, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1537);
    float _1541 = _1505 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1543 = fma(_1531, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1533);
    float _1545 = _1507 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1547 = -_1527;
    float _1549 = fma(_1547, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1539);
    float _1551 = _1507 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1553 = _1523 + 1.0;
    float _1555 = 1.0 / _1543;
    float _1557 = fma(_1549, -0.5, 0.5);
    float _1559 = fma(_1511, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1551);
    float _1561 = fma(_1549, 0.5, 0.5);
    float _1563 = fma(_1511, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1545);
    float _1565 = fma(_1491, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1559);
    float _1567 = fma(_1561, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1569 = exp2(_1541);
    float _1571 = fma(_1491, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1563);
    float _1573 = fma(_1531, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1565);
    float _1575 = fma(_1561, _1567, -0.212114393711090087890625);
    float _1577 = _1535 * 0.693147182464599609375;
    float _1579 = fma(_1531, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1571);
    float _1581 = fma(_1561, _1575, 1.570728778839111328125);
    float _1583 = sqrt(_1557);
    float _1585 = _1573 * _1555;
    float _1587 = _1579 * _1555;
    float _1589 = _1577 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1591 = fma(_1585, 0.5, 0.5);
    float _1593 = fma(_1587, -0.5, 0.5);
    float _1595 = -_1523;
    float _1597 = fma(_1569, _1553, _1595);
    float3 _4430 = float3(_1591, _1593, _1589);
    float _1599 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4430, float3(0.0), isnan(_4430)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4430, float3(0.0), isnan(_4430)), level(0.0)).x;
    float _1601 = _1583 * 0.636619746685028076171875;
    float _1603 = fma(_1597, 0.5, 0.5);
    float _1605 = -_1581;
    float _1607 = fma(_1601, _1605, 1.0);
    float3 _4451 = float3(_1591, _1593, _1589);
    float4 _1610 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4451, float3(0.0), isnan(_4451)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4451, float3(0.0), isnan(_4451)), level(0.0)).xyzw;
    float _1612 = _1610.x;
    float _1614 = _1610.y;
    float _1616 = _1610.z;
    float _1618 = _1610.w;
    float2 _4468 = float2(_1607, _1603);
    float3 _1622 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4468, float2(0.0), isnan(_4468)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4468, float2(0.0), isnan(_4468)), level(0.0)).xyz;
    float _1624 = _1622.x;
    float _1626 = _1622.y;
    float _1628 = _1622.z;
    out.m_66.y = 1.0;
    float _1630 = -_275;
    float _1632 = _1630 + _1167;
    float _1634 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1636 = _1634 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1638 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1640 = _1638 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1642 = -_265;
    float _1644 = _1642 + _1169;
    float _1646 = 1.0 / _1636;
    bool _1648 = _473 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1650 = isnan(_473);
    bool _1652 = _1648 || _1650;
    bool _1654 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1656 = _1652 || _1654;
    float _1658 = float(_1656);
    float _1660 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1662 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1660;
    float _1664 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1666 = _1664 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    bool _1668 = _473 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1670 = isnan(_473);
    bool _1672 = _1668 || _1670;
    bool _1674 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1676 = _1672 || _1674;
    float _1678 = float(_1676);
    float _1680 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1682 = _473 + _1680;
    float _1684 = -_1658;
    float _1686 = _1684 + 1.0;
    float _1688 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1690 = 1.0 / _1640;
    bool _1692 = _473 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1694 = isnan(_473);
    bool _1696 = _1692 || _1694;
    bool _1698 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1700 = _1696 || _1698;
    float _1702 = float(_1700);
    float _1704 = _1505 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1706 = -_237;
    float _1708 = _1706 + _1171;
    float _1710 = _1507 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1712 = -_1702;
    float _1714 = _1712 + 1.0;
    float _1716 = _1662 * _1646;
    float _1718 = _1678 * _1686;
    float _1720 = _1658 * _1714;
    float _1722 = _891 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1724 = fma(_1716, _1682, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1726 = -_1678;
    float _1728 = _1726 + 1.0;
    float _1730 = _1724 * _1718;
    float _1732 = _1666 * _1690;
    float _1734 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1736 = _473 + _1734;
    float _1738 = _891 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1740 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1742 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1744 = fma(_1732, _1736, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1746 = _891 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1748 = fma(_859, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1738);
    float _1750 = fma(_859, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1722);
    float _1752 = fma(_859, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1746);
    float _1754 = _1740 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1756 = _1742 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1758 = _1688 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1760 = fma(_853, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1752);
    float _1762 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1764 = _891 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1766 = fma(_853, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1748);
    float _1768 = fma(_853, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1750);
    float _1770 = _1760 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1772 = fma(_1728, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1730);
    float _1774 = fma(_859, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1764);
    float _1776 = _1766 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1778 = _1768 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1780 = _1770 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    out.m_68.x = _1754;
    out.m_68.y = _1756;
    out.m_68.z = _1758;
    out.m_68.w = _1762;
    float _1782 = fma(_1744, _1720, _1772);
    float _1784 = fma(_853, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1774);
    float _1786 = _1770 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1788 = exp2(_1704);
    float _1790 = _1770 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1792 = _1778 * (*spvDescriptorSet0.vp_c8)._m0[5].z;
    float _1794 = fma(_1776, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1786);
    float _1796 = fma(_1511, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1710);
    float _1798 = fma(_1776, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1790);
    float _1800 = _1778 * (*spvDescriptorSet0.vp_c8)._m0[4].z;
    float _1802 = fma(_1491, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1796);
    float _1804 = _443 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1806 = _441 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1808 = _445 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1810 = _1770 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1812 = _1778 * (*spvDescriptorSet0.vp_c8)._m0[7].z;
    float _1814 = fma(_1776, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1780);
    float _1816 = fma(_1702, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1782);
    float _1818 = fma(_1776, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1810);
    float _1820 = _1784 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1822 = _1812 + _1814;
    float _1824 = _1806 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1826 = _1804 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1828 = _1808 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1830 = fma(_1820, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1822);
    float _1832 = _1632 * (*spvDescriptorSet0.vp_c15)._m0[643].y;
    float _1834 = _1816 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1836 = fma(_1778, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1798);
    float _1838 = -_1788;
    float _1840 = _1838 + 1.0;
    float _1842 = fma(_1644, (*spvDescriptorSet0.vp_c15)._m0[643].x, _1832);
    float _1844 = 1.0 / _1830;
    out.m_70.x = _1824;
    out.m_70.y = _1826;
    out.m_70.z = _1828;
    out.m_70.w = _1834;
    float _1846 = fma(_1820, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1836);
    float _1848 = fma(_1708, (*spvDescriptorSet0.vp_c15)._m0[643].z, _1842);
    float _1850 = fma(_1531, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1802);
    float _1852 = _1840 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1854 = _1800 + _1818;
    float _1856 = _1848 + (*spvDescriptorSet0.vp_c15)._m0[643].w;
    out.gl_Position.x = _1573;
    out.gl_Position.y = _1579;
    out.gl_Position.z = _1850;
    out.gl_Position.w = _1543;
    float _1858 = fma(_1820, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1854);
    float _1860 = 1.0 / _1856;
    float _1862 = _1792 + _1794;
    float _1864 = _1846 * _1844;
    float _1866 = _1858 * _1844;
    float _1868 = fma(_1820, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1862);
    float _1870 = _1632 * (*spvDescriptorSet0.vp_c15)._m0[640].y;
    float _1872 = _1632 * (*spvDescriptorSet0.vp_c15)._m0[641].y;
    bool _1874 = _1864 > 0.0;
    float _1876 = _1868 * _1844;
    float _1878 = fma(_1644, (*spvDescriptorSet0.vp_c15)._m0[640].x, _1870);
    float _1880 = fma(_1644, (*spvDescriptorSet0.vp_c15)._m0[641].x, _1872);
    bool _1882 = _1864 < 1.0;
    bool _1884 = _1882 && _1874;
    float _1886 = fma(_1708, (*spvDescriptorSet0.vp_c15)._m0[640].z, _1878);
    float _1888 = _1850 + _1543;
    float _1890 = fma(_1708, (*spvDescriptorSet0.vp_c15)._m0[641].z, _1880);
    bool _1892 = _1585 > (-1.0);
    bool _1894 = _1892 && _1884;
    float _1896 = _1886 + (*spvDescriptorSet0.vp_c15)._m0[640].w;
    float _1898 = _1888 * 0.5;
    float _1900 = _1233 * _1291;
    bool _1902 = _1587 > (-1.0);
    bool _1904 = _1902 && _1894;
    float _1906 = _1896 * _1860;
    float _1908 = _1890 + (*spvDescriptorSet0.vp_c15)._m0[641].w;
    out.m_72.z = _1898;
    out.m_72.w = _1543;
    bool _1910 = _1585 < 1.0;
    bool _1912 = _1910 && _1904;
    float _1914 = _1908 * _1860;
    bool _1916 = _1587 < 1.0;
    bool _1918 = _1916 && _1912;
    float _1920 = _1852 * _1599;
    float _1922 = -_1852;
    float _1924 = _1922 + 1.0;
    float _1926 = _1618 * _1920;
    float _1928 = _1618 * _1924;
    float _1930 = _1628 * _1920;
    float _1932 = fma(_1624, _1926, _1612);
    float _1934 = fma(_1626, _1926, _1614);
    float _1936 = _1900 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1938 = fma(_1618, _1930, _1616);
    float _1940 = _279 * _1936;
    out.m_74.x = _1932;
    out.m_74.y = _1934;
    out.m_74.z = _1938;
    out.m_74.w = _1928;
    bool _1942 = !_1918;
    float _1974;
    if (!_1942)
    {
        float _1944 = -_1876;
        float _1946 = _1587 + _1944;
        float _1948 = -_1866;
        float _1950 = _1585 + _1948;
        float _1952 = -_1906;
        float _1954 = _1585 + _1952;
        float _1956 = -_1914;
        float _1958 = _1587 + _1956;
        float _1960 = _1946 * _1946;
        float _1962 = fma(_1950, _1950, _1960);
        float _1964 = sqrt(_1962);
        bool _1966 = _1964 > 0.0;
        float _1968 = _1964;
        if (!_1966)
        {
            _1968 = _1940;
        }
        float _1970 = _1968;
        bool _1972 = !_1966;
        _1974 = _1970;
        _1976 = _1972;
        if (!_1976)
        {
            float _1978 = _1958 * _1958;
            float _1980 = fma(_1954, _1954, _1978);
            float _1982 = rsqrt(_1962);
            float _1984 = sqrt(_1980);
            float _1986 = _1950 * _1982;
            float _1988 = _1946 * _1982;
            bool _1990 = _1984 > 0.0;
            float _1992 = _1982;
            if (!_1990)
            {
                _1992 = _1940;
            }
            float _1994 = _1992;
            bool _1996 = !_1990;
            _1974 = _1994;
            _1976 = _1996;
            if (!_1976)
            {
                float _1998 = _779 * _1820;
                float _2000 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
                float _2002 = fma(_1998, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1812);
                float _2004 = fma(_1998, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1792);
                float _2006 = fma(_1998, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1800);
                float _2008 = fma(_1820, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2002);
                float _2010 = fma(_1820, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2004);
                float _2012 = fma(_1820, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2006);
                float _2014 = rsqrt(_1980);
                float _2016 = _2000 * (*spvDescriptorSet0.vp_c13)._m0[0].w;
                float _2018 = 1.0 / _2008;
                float _2020 = _1958 * _2016;
                float _2022 = _1954 * _2016;
                float _2024 = _2020 * _2020;
                float _2026 = fma(_2022, _2022, _2024);
                float _2028 = _1958 * _2014;
                float _2030 = _1954 * _2014;
                float _2032 = _2010 * _2018;
                float _2034 = _2012 * _2018;
                float _2036 = sqrt(_2026);
                float _2038 = _1988 * _2028;
                float _2040 = _2032 * _2032;
                float _2042 = fma(_1986, _2030, _2038);
                float _2044 = fma(_2034, _2034, _2040);
                float _2046 = sqrt(_2044);
                float _2048 = precise::min(0.0, _2042);
                float _2050 = _1543 * _2048;
                float _2052 = fma(_2022, _2050, _1573);
                float _2054 = fma(_2020, _2050, _1579);
                float _2056 = fma(_2036, (*spvDescriptorSet0.vp_c13)._m0[1].x, _2046);
                out.gl_Position.x = _2052;
                out.gl_Position.y = _2054;
                float _2058 = 1.0 / _2056;
                float _2060 = _2046 * _2058;
                out.m_66.y = _2060;
                _1974 = _1940;
                _1976 = true;
            }
        }
    }
    else
    {
        float _2062 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        out.gl_Position.z = _2062;
        _1974 = 0.0;
    }
    _1976 = false;
    float _2064 = _1974;
    bool _2066 = _1233 > 0.0;
    bool _2068 = isnan(_1233);
    bool _2070 = _2066 || _2068;
    bool _2072 = isnan(0.0);
    bool _2074 = _2070 || _2072;
    float _2076 = _2064 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    bool _2078 = _1291 <= 0.0;
    bool _2080 = !_2074;
    bool _2082 = _2078 || _2080;
    out.m_47.x = _2076;
    if (!_2082)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _2084 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2084;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1976 = false;
    bool _465 = false;
    bool _299 = false;
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
        float _2141 = as_type<float>(_109);
        out.gl_Position.z = _2141;
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
    float _129 = _127;
    if (_123)
    {
        float _131 = float(_93);
        _103 = _131;
    }
    float _133 = _103;
    bool _135 = _127 >= _133;
    bool _137 = !_123;
    bool _139 = _135 || _137;
    float _141 = _133;
    if (_139)
    {
        _141 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _143 = _141;
    if (_139)
    {
        out.m_47.x = 0.0;
    }
    if (_139)
    {
        float _145 = _143 * 5.0;
        _111 = as_type<int>(_145);
    }
    int _147 = _111;
    if (_139)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2211 = as_type<float>(_147);
        out.gl_Position.z = _2211;
    }
    if (_139)
    {
        return out;
    }
    float _149 = in.m_51.x;
    float _151 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _153 = _127 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _155 = as_type<float>(int(gl_VertexIndex));
    float _157 = in.m_56.x;
    float _159 = in.m_56.y;
    float _161 = in.m_56.z;
    float _163 = _153 * _151;
    float _165 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[20].x, _163);
    int _167 = as_type<int>(_155) & 1;
    bool _169 = _167 != 0;
    int _171 = as_type<int>(_155) & 2;
    bool _173 = _171 != 0;
    float _175 = floor(_165);
    int _177 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _179 = _177 != 0;
    float _181 = _165 * 6.283185482025146484375;
    float _183 = _159 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _185 = !_173;
    int _187 = _185 ? (-1090519040) : 1056964608;
    float _189 = _159 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _191 = _181 * 0.15915493667125701904296875;
    int _193 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _195 = _193 != 0;
    int _197 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _199 = _197 != 0;
    float _201 = _159 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _203 = fma(_157, (*spvDescriptorSet0.vp_c10)._m0[4].x, _183);
    float _205 = fma(_157, (*spvDescriptorSet0.vp_c10)._m0[5].x, _189);
    bool _207 = !_169;
    int _209 = _207 ? (-1090519040) : 1056964608;
    float _211 = _191 * 6.283185482025146484375;
    float _213 = cos(_211);
    bool _215 = !_195;
    int _217 = _215 ? 0 : 1;
    float _219 = fma(_157, (*spvDescriptorSet0.vp_c10)._m0[6].x, _201);
    bool _221 = !_179;
    int _223 = _221 ? 0 : 1;
    float _225 = -_175;
    float _227 = _165 + _225;
    int _229 = abs(_217);
    out.m_58.x = as_type<float>(_209);
    out.m_58.y = as_type<float>(_187);
    int _231 = abs(_223);
    float _233 = -_227;
    float _235 = fma(_233, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _237 = fma(_161, (*spvDescriptorSet0.vp_c10)._m0[6].z, _219);
    bool _239 = !_199;
    int _241 = _239 ? 0 : 1;
    float _243 = float(_229);
    bool _245 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _247 = fma(_213, 0.5, 0.5);
    int _249 = abs(_241);
    float _251 = abs(_235);
    float _253 = _243 * _251;
    float _255 = float(_231);
    bool _257 = _227 < 0.5;
    float _259 = float(_257);
    float _261 = -_247;
    float _263 = fma(_261, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _265 = fma(_161, (*spvDescriptorSet0.vp_c10)._m0[4].z, _203);
    float _267 = -_259;
    float _269 = fma(_267, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _271 = float(_249);
    float _273 = fma(_255, _263, _253);
    float _275 = fma(_161, (*spvDescriptorSet0.vp_c10)._m0[5].z, _205);
    float _277 = abs(_269);
    float _279 = fma(_271, _277, _273);
    bool _281 = !_245;
    float _297;
    if (!_281)
    {
        float _283 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _285 = _149 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _287 = fma(_285, (*spvDescriptorSet0.vp_c9)._m0[11].x, _127);
        float _289 = _287 * _283;
        float _291 = floor(_289);
        float _293 = -_291;
        float _295 = _289 + _293;
        _297 = _295;
        _299 = true;
    }
    else
    {
        float _301 = float(_93);
        float _303 = 1.0 / _301;
        float _305 = _127 * _303;
        _297 = _305;
    }
    _299 = false;
    float _307 = _297;
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _311 = _307 + _309;
    bool _313 = _307 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _315 = isnan(_307);
    bool _317 = _313 || _315;
    bool _319 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _321 = _317 || _319;
    float _323 = float(_321);
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _327 = _307 + _325;
    bool _329 = _307 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _331 = isnan(_307);
    bool _333 = _329 || _331;
    bool _335 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _337 = _333 || _335;
    float _339 = float(_337);
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _343 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _341;
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _347 = _345 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _349 = _307 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _351 = isnan(_307);
    bool _353 = _349 || _351;
    bool _355 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _357 = _353 || _355;
    float _359 = float(_357);
    float _361 = -_323;
    float _363 = _361 + 1.0;
    float _365 = 1.0 / _347;
    float _367 = _359 * _363;
    float _369 = -_359;
    float _371 = _369 + 1.0;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _375 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _373;
    bool _377 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _379 = 1.0 / _343;
    float _381 = _339 * _371;
    float _383 = -_339;
    float _385 = _383 + 1.0;
    float _387 = _327 * _365;
    float _389 = _311 * _379;
    float _391 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _393 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _391;
    float _395 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _397 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _395;
    float _399 = fma(_375, _389, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _401 = fma(_393, _389, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _403 = fma(_397, _389, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _405 = _399 * _381;
    float _407 = _401 * _381;
    float _409 = _403 * _381;
    float _411 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _413 = _411 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _417 = _415 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _421 = _419 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _423 = fma(_385, (*spvDescriptorSet0.vp_c9)._m0[107].x, _405);
    float _425 = fma(_413, _387, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _427 = fma(_417, _387, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _429 = fma(_385, (*spvDescriptorSet0.vp_c9)._m0[107].y, _407);
    float _431 = fma(_421, _387, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _433 = fma(_385, (*spvDescriptorSet0.vp_c9)._m0[107].z, _409);
    float _435 = fma(_425, _367, _423);
    float _437 = fma(_427, _367, _429);
    float _439 = fma(_431, _367, _433);
    float _441 = fma(_323, (*spvDescriptorSet0.vp_c9)._m0[109].x, _435);
    float _443 = fma(_323, (*spvDescriptorSet0.vp_c9)._m0[109].y, _437);
    float _445 = fma(_323, (*spvDescriptorSet0.vp_c9)._m0[109].z, _439);
    bool _447 = !_377;
    float _463;
    if (!_447)
    {
        float _449 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _451 = _149 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _453 = fma(_451, (*spvDescriptorSet0.vp_c9)._m0[11].y, _127);
        float _455 = _453 * _449;
        float _457 = floor(_455);
        float _459 = -_457;
        float _461 = _455 + _459;
        _463 = _461;
        _465 = true;
    }
    else
    {
        float _467 = float(_93);
        float _469 = 1.0 / _467;
        float _471 = _127 * _469;
        _463 = _471;
    }
    _465 = false;
    float _473 = _463;
    float _475 = in.m_51.z;
    float _477 = _149 * 2.0;
    float _479 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _481 = log2(_479);
    float _483 = in.m_51.y;
    float _485 = floor(_477);
    float _487 = _475 * 2.0;
    bool _489 = _485 > 0.0;
    float _491 = _483 * 2.0;
    bool _493 = _485 >= 0.0;
    bool _495 = isnan(_485);
    bool _497 = _493 || _495;
    bool _499 = isnan(0.0);
    bool _501 = _497 || _499;
    float _503 = floor(_487);
    float _505 = _483 + _475;
    int _507 = _501 ? 0 : 1;
    float _509 = _505 + (-1.0);
    int _511 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _513 = _511 != 0;
    int _515 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _517 = _515 != 0;
    int _519 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _521 = _519 != 0;
    float _523 = floor(_491);
    int _525 = ~_507;
    int _527 = _525 + 1;
    int _529 = _527 + 1;
    float _531 = fma(_509, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _533 = _529;
    if (!_489)
    {
        int _535 = ~_507;
        int _537 = _535 + 1;
        _533 = _537;
    }
    int _539 = _533;
    bool _541 = !_517;
    int _543 = _541 ? 0 : 1;
    float _545 = _481 * _127;
    bool _547 = _503 > 0.0;
    bool _549 = _503 >= 0.0;
    bool _551 = isnan(_503);
    bool _553 = _549 || _551;
    bool _555 = isnan(0.0);
    bool _557 = _553 || _555;
    float _559 = in.m_60.x;
    float _561 = in.m_60.y;
    float _563 = in.m_60.z;
    float _565 = exp2(_545);
    bool _567 = _523 > 0.0;
    bool _569 = _523 >= 0.0;
    bool _571 = isnan(_523);
    bool _573 = _569 || _571;
    bool _575 = isnan(0.0);
    bool _577 = _573 || _575;
    float _579 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _581 = 1.0 + _579;
    bool _583 = !_513;
    int _585 = _583 ? 0 : 1;
    int _587 = abs(_543);
    float _589 = 1.0 / _581;
    int _591 = _557 ? 0 : 1;
    bool _593 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _595 = isnan(1.0);
    bool _597 = _593 || _595;
    bool _599 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _601 = _597 || _599;
    float _603 = float(_539);
    bool _605 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _607 = isnan(0.0);
    bool _609 = _605 || _607;
    bool _611 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _613 = _609 || _611;
    float _615 = -_565;
    float _617 = _615 + 1.0;
    int _619 = abs(_585);
    float _621 = float(_587);
    int _623 = ~_591;
    int _625 = _623 + 1;
    int _627 = _625 + 1;
    int _629 = _627;
    if (!_547)
    {
        int _631 = ~_591;
        int _633 = _631 + 1;
        _629 = _633;
    }
    int _635 = _629;
    float _637 = _621 * _603;
    int _639 = _577 ? 0 : 1;
    float _641 = _613 ? _617 : 0.0;
    float _643 = _637 * (-2.0);
    bool _645 = !_521;
    int _647 = _645 ? 0 : 1;
    int _649 = ~_639;
    int _651 = _649 + 1;
    int _653 = _651 + 1;
    int _655 = _653;
    if (_601)
    {
        float _657 = _641 * _589;
        _129 = _657;
    }
    float _659 = _129;
    if (!_567)
    {
        int _661 = ~_639;
        int _663 = _661 + 1;
        _655 = _663;
    }
    int _665 = _655;
    float _667 = _483 + (-0.5);
    int _669 = abs(_647);
    float _671 = fma(_643, _561, _561);
    float _673 = float(_619);
    float _675 = fma(_531, _643, _531);
    float _677 = float(_635);
    float _679 = _149 + _483;
    float _681 = fma(_667, (*spvDescriptorSet0.vp_c9)._m0[196].y, _671);
    float _683 = _673 * _677;
    float _685 = _679 + (-1.0);
    float _687 = fma(_675, _659, _681);
    float _689 = _683 * (-2.0);
    float _691 = fma(_685, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _693 = _149 + (-0.5);
    float _695 = float(_669);
    float _697 = fma(_689, _559, _559);
    float _699 = float(_665);
    float _701 = fma(_691, _689, _691);
    float _703 = _149 + _475;
    float _705 = fma(_693, (*spvDescriptorSet0.vp_c9)._m0[196].x, _697);
    float _707 = _695 * _699;
    float _709 = in.m_62.x;
    float _711 = in.m_62.y;
    float _713 = _703 + (-1.0);
    float _715 = _475 + (-0.5);
    float _717 = _707 * (-2.0);
    float _719 = fma(_701, _659, _705);
    float _721 = fma(_713, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _723 = _687 * 0.15915493667125701904296875;
    float _725 = fma(_717, _563, _563);
    float _727 = _719 * 0.15915493667125701904296875;
    float _729 = fma(_721, _717, _721);
    float _731 = _723 * 6.283185482025146484375;
    float _733 = cos(_731);
    float _735 = fma(_715, (*spvDescriptorSet0.vp_c9)._m0[196].z, _725);
    float _737 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, as_type<float>(_187));
    float _739 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, as_type<float>(_209));
    float _741 = fma(_729, _659, _735);
    float _743 = _727 * 6.283185482025146484375;
    float _745 = sin(_743);
    float _747 = _741 * 0.15915493667125701904296875;
    float _749 = _711 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _751 = _747 * 6.283185482025146484375;
    float _753 = cos(_751);
    float _755 = _749 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _757 = _755 * _737;
    float _759 = _723 * 6.283185482025146484375;
    float _761 = sin(_759);
    float _763 = _727 * 6.283185482025146484375;
    float _765 = cos(_763);
    float _767 = _709 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _769 = _733 * _753;
    float _771 = in.m_44.x;
    float _773 = in.m_44.y;
    float _775 = in.m_44.z;
    float _777 = _753 * _757;
    float _779 = _767 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _781 = _747 * 6.283185482025146484375;
    float _783 = sin(_781);
    float _785 = _745 * _761;
    float _787 = _779 * _739;
    float _789 = _745 * _777;
    float _791 = _765 * _761;
    float _793 = _745 * _733;
    float _795 = _765 * _733;
    float _797 = _765 * _777;
    float _799 = _761 * _753;
    float _801 = fma(_783, _795, _785);
    float _803 = -_791;
    float _805 = fma(_783, _793, _803);
    float _807 = -_793;
    float _809 = fma(_783, _791, _807);
    float _811 = -_757;
    float _813 = _783 * _811;
    float _815 = fma(_801, _787, _797);
    float _817 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _819 = fma(_783, _785, _795);
    float _821 = fma(_769, _787, _813);
    float _823 = fma(_805, _787, _789);
    float _825 = fma(_809, _817, _815);
    float _827 = _773 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _829 = fma(_799, _817, _821);
    float _831 = fma(_819, _817, _823);
    float _833 = _825 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _835 = _773 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _837 = fma(_771, (*spvDescriptorSet0.vp_c10)._m0[6].x, _827);
    float _839 = _825 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _841 = fma(_829, (*spvDescriptorSet0.vp_c8)._m0[26].x, _833);
    float _843 = fma(_771, (*spvDescriptorSet0.vp_c10)._m0[4].x, _835);
    float _845 = fma(_775, (*spvDescriptorSet0.vp_c10)._m0[6].z, _837);
    float _847 = fma(_829, (*spvDescriptorSet0.vp_c8)._m0[24].x, _839);
    float _849 = fma(_831, (*spvDescriptorSet0.vp_c8)._m0[26].z, _841);
    float _851 = fma(_775, (*spvDescriptorSet0.vp_c10)._m0[4].z, _843);
    float _853 = _845 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _855 = fma(_831, (*spvDescriptorSet0.vp_c8)._m0[24].z, _847);
    float _857 = _849 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _859 = _851 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _861 = _855 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _863 = _853 + _857;
    float _865 = in.m_64.y;
    float _867 = _859 + _861;
    float _869 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _871 = _863 + _869;
    float _873 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _875 = _867 + _873;
    float _877 = _871 * _871;
    float _879 = fma(_875, _875, _877);
    float _881 = _825 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _883 = sqrt(_879);
    float _885 = fma(_829, (*spvDescriptorSet0.vp_c8)._m0[25].x, _881);
    float _887 = fma(_831, (*spvDescriptorSet0.vp_c8)._m0[25].z, _885);
    float _889 = _887 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _891 = _773 + _865;
    float _893 = _891 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _895 = _891 + _889;
    bool _897 = _883 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _899 = fma(_859, (*spvDescriptorSet0.vp_c8)._m0[11].x, _893);
    float _901 = fma(_853, (*spvDescriptorSet0.vp_c8)._m0[11].z, _899);
    float _903 = _773;
    float _905 = _899;
    float _907 = _879;
    float _909 = _757;
    float _911 = _813;
    if (!_897)
    {
        _903 = _867;
    }
    float _913 = _903;
    float _915 = _913;
    if (!_897)
    {
        _905 = _863;
    }
    float _917 = _905;
    float _919 = 0.0;
    float _921 = _917;
    if (!_897)
    {
        _919 = _895;
    }
    float _923 = _919;
    bool _925 = !_897;
    float _927 = _923;
    if (!_925)
    {
        float _929 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _931 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _933 = _883 + _931;
        float _935 = _895 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _937 = _933 * _929;
        float _939 = rsqrt(_879);
        float _941 = _937 * 0.15915493667125701904296875;
        float _943 = _941 * 6.283185482025146484375;
        float _945 = cos(_943);
        float _947 = _941 * 6.283185482025146484375;
        float _949 = sin(_947);
        float _951 = _945 + (-1.0);
        float _953 = fma(_949, _935, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _955 = _951 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _957 = _939 * _953;
        float _959 = fma(_895, _945, _955);
        float _961 = fma(_875, _957, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _963 = fma(_871, _957, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _927 = _959;
        _915 = _961;
        _921 = _963;
    }
    float _965 = _927;
    float _967 = _915;
    float _969 = _921;
    float _971 = -_891;
    float _973 = _971 + _965;
    float _975 = -_859;
    float _977 = _975 + _967;
    float _979 = _901 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _981 = -_853;
    float _983 = _981 + _969;
    float _985 = _973 * _973;
    float _987 = _891 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _989 = 1.0 / _979;
    float _991 = fma(_977, _977, _985);
    float _993 = fma(_859, (*spvDescriptorSet0.vp_c8)._m0[10].x, _987);
    bool _995 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _997 = isnan(0.5);
    bool _999 = _995 || _997;
    bool _1001 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1003 = _999 || _1001;
    float _1005 = fma(_983, _983, _991);
    float _1007 = fma(_853, (*spvDescriptorSet0.vp_c8)._m0[10].z, _993);
    bool _1009 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1011 = isnan(0.5);
    bool _1013 = _1009 || _1011;
    bool _1015 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1017 = _1013 || _1015;
    float _1019 = sqrt(_1005);
    float _1021 = _1007 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1023 = _1021 + _979;
    float _1025 = _1023 * _989;
    float _1027 = _1025 * 0.5;
    bool _1029 = _1019 > 0.0;
    float _1031 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1033 = fma(_1027, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1031);
    float _1035 = 1.0 / _1033;
    bool _1037 = !_1029;
    float _1039 = _967;
    float _1041 = _965;
    float _1043 = _969;
    float _1045 = _973;
    if (!_1037)
    {
        float _1047 = _275 * _275;
        float _1049 = fma(_265, _265, _1047);
        float _1051 = rsqrt(_1005);
        float _1053 = fma(_237, _237, _1049);
        float _1055 = sqrt(_1053);
        float _1057 = _977 * _1051;
        float _1059 = _973 * _1051;
        float _1061 = _983 * _1051;
        bool _1063 = _1055 > 0.0;
        bool _1065 = !_1063;
        _1045 = _1059;
        if (!_1065)
        {
            float _1067 = rsqrt(_1053);
            float _1069 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1071 = _275 * _1067;
            float _1073 = _265 * _1067;
            float _1075 = _1059 * _1071;
            float _1077 = _237 * _1067;
            float _1079 = fma(_1057, _1073, _1075);
            float _1081 = _1069 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1083 = fma(_1061, _1077, _1079);
            float _1085 = _1083 * _1081;
            float _1087 = fma(_265, _1085, _967);
            float _1089 = fma(_275, _1085, _965);
            float _1091 = fma(_237, _1085, _969);
            _1039 = _1087;
            _1041 = _1089;
            _1043 = _1091;
            _1045 = _1079;
        }
    }
    float _1093 = _1039;
    float _1095 = _1041;
    float _1097 = _1043;
    float _1099 = _1045;
    float _1101 = _1099;
    float _1103 = _1095;
    float _1105 = _1097;
    if (_1017)
    {
        _907 = 1.0;
    }
    float _1107 = _907;
    float _1109 = _1107;
    if (_1003)
    {
        _909 = _1093;
    }
    float _1111 = _909;
    float _1113 = _1111;
    if (!_1003)
    {
        float _1115 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1117 = _891 + _1115;
        float _1119 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1121 = _859 + _1119;
        float _1123 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1125 = -_891;
        float _1127 = _1125 + _1095;
        float _1129 = _1117 * _1117;
        float _1131 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1133 = _853 + _1131;
        float _1135 = -_853;
        float _1137 = _1135 + _1097;
        float _1139 = fma(_1121, _1121, _1129);
        float _1141 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1143 = fma(_1133, _1133, _1139);
        float _1145 = sqrt(_1143);
        float _1147 = _1123 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1149 = precise::min(_1145, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1151 = _1149 * _1141;
        float _1153 = -_859;
        float _1155 = _1153 + _1093;
        float _1157 = _1147 * _1151;
        float _1159 = fma(_1155, _1157, _859);
        float _1161 = fma(_1127, _1157, _891);
        float _1163 = fma(_1137, _1157, _853);
        _1101 = _1151;
        _1103 = _1161;
        _1113 = _1159;
        _1105 = _1163;
    }
    float _1165 = _1101;
    float _1167 = _1103;
    float _1169 = _1113;
    float _1171 = _1105;
    float _1173 = _1165;
    if (_1017)
    {
        _911 = 1.0;
    }
    float _1175 = _911;
    float _1177 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1179 = _1035 * _1177;
    float _1181 = _1175;
    if (!_1017)
    {
        float _1183 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1185 = _1183 * 0.15915493667125701904296875;
        float _1187 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1189 = _1185 * 6.283185482025146484375;
        float _1191 = cos(_1189);
        float _1193 = _1187 * 0.15915493667125701904296875;
        float _1195 = _1185 * 6.283185482025146484375;
        float _1197 = sin(_1195);
        float _1199 = 1.0 / _1191;
        float _1201 = _1193 * 6.283185482025146484375;
        float _1203 = cos(_1201);
        float _1205 = _1197 * _1199;
        float _1207 = _1193 * 6.283185482025146484375;
        float _1209 = sin(_1207);
        float _1211 = _1203 * _1205;
        float _1213 = 1.0 / _1211;
        float _1215 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1217 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1215;
        float _1219 = 1.0 / _1217;
        float _1221 = _1209 * _1213;
        float _1223 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1225 = fma(_1179, _1221, _1223);
        float _1227 = _1225 * _1219;
        float _1229 = precise::clamp(_1227, 0.0, 1.0);
        _1173 = _1213;
        _1109 = _1229;
    }
    float _1231 = _1173;
    float _1233 = _1109;
    float _1235 = _1231;
    if (!_1017)
    {
        float _1237 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1239 = _1237 * 0.15915493667125701904296875;
        float _1241 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1243 = _1239 * 6.283185482025146484375;
        float _1245 = cos(_1243);
        float _1247 = _1241 * 0.15915493667125701904296875;
        float _1249 = _1239 * 6.283185482025146484375;
        float _1251 = sin(_1249);
        float _1253 = 1.0 / _1245;
        float _1255 = _1247 * 6.283185482025146484375;
        float _1257 = cos(_1255);
        float _1259 = _1251 * _1253;
        float _1261 = _1247 * 6.283185482025146484375;
        float _1263 = sin(_1261);
        float _1265 = _1257 * _1259;
        float _1267 = 1.0 / _1265;
        float _1269 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1271 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1269;
        float _1273 = 1.0 / _1271;
        float _1275 = _1263 * _1267;
        float _1277 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1279 = fma(_1179, _1275, _1277);
        float _1281 = _1279 * _1273;
        float _1283 = precise::clamp(_1281, 0.0, 1.0);
        float _1285 = -_1283;
        float _1287 = _1285 + 1.0;
        _1235 = _1265;
        _1181 = _1287;
    }
    float _1289 = _1235;
    float _1291 = _1181;
    float _1293 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1295 = _1167 + _1293;
    float _1297 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1299 = _1169 + _1297;
    float _1301 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1303 = _1171 + _1301;
    float _1305 = _1295 * _1295;
    float _1307 = fma(_1299, _1299, _1305);
    float _1309 = fma(_1303, _1303, _1307);
    float _1311 = rsqrt(_1309);
    float _1313 = sqrt(_1309);
    float _1315 = _1311 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1317 = _1299 * _1315;
    float _1319 = _1303 * _1315;
    float _1321 = _1317 * _1317;
    float _1323 = _1319 * _1319;
    float _1325 = _1321 + _1323;
    float _1327 = sqrt(_1325);
    bool _1329 = _1327 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1331 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1333 = _1327 + _1331;
    float _1335 = _1303;
    float _1337 = _1325;
    float _1339 = _1333;
    float _1341 = _1289;
    float _1343 = _1315;
    if (_1329)
    {
        float _1345 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1335 = _1345;
    }
    float _1347 = _1335;
    if (_1329)
    {
        float _1349 = rsqrt(_1325);
        _1337 = _1349;
    }
    float _1351 = _1337;
    float _1353 = _1351;
    if (_1329)
    {
        float _1355 = _1333 * _1347;
        _1339 = _1355;
    }
    float _1357 = _1339;
    if (_1329)
    {
        float _1359 = _1357 * 0.15915493667125701904296875;
        _1341 = _1359;
    }
    float _1361 = _1341;
    float _1363 = _1347;
    float _1365 = _1361;
    if (_1329)
    {
        float _1367 = _1361 * 6.283185482025146484375;
        float _1369 = sin(_1367);
        _1363 = _1369;
    }
    float _1371 = _1363;
    float _1373 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1375 = precise::max(0.0, _1373);
    float _1377 = _1305;
    float _1379 = _1375;
    if (_1329)
    {
        float _1381 = _1361 * 6.283185482025146484375;
        float _1383 = cos(_1381);
        _1377 = _1383;
    }
    float _1385 = _1377;
    float _1387 = -_1315;
    float _1389 = -_1375;
    float _1391 = fma(_1295, _1387, _1389);
    float _1393 = _1391;
    if (_1329)
    {
        float _1395 = _1391 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1379 = _1395;
    }
    float _1397 = _1379;
    float _1399 = _1371;
    float _1401 = _1397;
    if (_1329)
    {
        float _1403 = fma(_1371, _1397, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1399 = _1403;
    }
    float _1405 = _1399;
    float _1407 = _1405;
    float _1409 = _1385;
    if (_1329)
    {
        float _1411 = _1385 + (-1.0);
        _1401 = _1411;
    }
    float _1413 = _1401;
    float _1415 = _1413;
    if (_1329)
    {
        float _1417 = _1351 * _1405;
        _1343 = _1417;
    }
    float _1419 = _1343;
    if (!_1329)
    {
        _1407 = _1317;
    }
    float _1421 = _1407;
    float _1423 = _1421;
    if (_1329)
    {
        float _1425 = _1413 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1365 = _1425;
    }
    float _1427 = _1365;
    if (_1329)
    {
        float _1429 = _1317 * _1419;
        _1423 = _1429;
    }
    float _1431 = _1423;
    if (!_1329)
    {
        _1415 = _1319;
    }
    float _1433 = _1415;
    float _1435 = _1433;
    if (_1329)
    {
        float _1437 = _1319 * _1419;
        _1435 = _1437;
    }
    float _1439 = _1435;
    if (!_1329)
    {
        _1353 = _1321;
    }
    float _1441 = _1353;
    float _1443 = _1441;
    if (_1329)
    {
        float _1445 = fma(_1391, _1385, _1427);
        _1393 = _1445;
    }
    float _1447 = _1393;
    if (_1329)
    {
        float _1449 = _1431 * _1431;
        _1443 = _1449;
    }
    float _1451 = _1443;
    if (!_1329)
    {
        _1409 = _1323;
    }
    float _1453 = _1409;
    float _1455 = _1453;
    if (_1329)
    {
        float _1457 = _1439 * _1439;
        _1455 = _1457;
    }
    float _1459 = _1455;
    float _1461 = fma(_1447, _1447, _1451);
    float _1463 = _1167 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1465 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1467 = _1461 + _1459;
    float _1469 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1463);
    float _1471 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1473 = fma(_1313, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1471);
    float _1475 = precise::clamp(_1473, 0.0, 1.0);
    float _1477 = _1167 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1479 = _1167 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1481 = fma(_1171, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1469);
    float _1483 = rsqrt(_1467);
    float _1485 = -_1475;
    float _1487 = _1485 + 1.0;
    float _1489 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1477);
    float _1491 = _1481 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1493 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1479);
    float _1495 = _1167 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1497 = fma(_1171, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1489);
    float _1499 = _1491 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1501 = fma(_1171, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1493);
    float _1503 = abs(_1487);
    float _1505 = log2(_1503);
    float _1507 = _1497 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1509 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1495);
    float _1511 = _1501 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1513 = -_1499;
    float _1515 = fma(_1513, _1465, 1.0);
    float _1517 = _1507 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1519 = fma(_1171, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1509);
    float _1521 = _1483 * _1431;
    float _1523 = _1483 * _1447;
    float _1525 = fma(_1511, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1517);
    float _1527 = _1483 * _1439;
    float _1529 = _1521 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1531 = _1519 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1533 = fma(_1491, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1525);
    float _1535 = log2(_1515);
    float _1537 = -_1529;
    float _1539 = fma(_1523, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1537);
    float _1541 = _1505 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1543 = fma(_1531, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1533);
    float _1545 = _1507 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1547 = -_1527;
    float _1549 = fma(_1547, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1539);
    float _1551 = _1507 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1553 = _1523 + 1.0;
    float _1555 = 1.0 / _1543;
    float _1557 = fma(_1549, -0.5, 0.5);
    float _1559 = fma(_1511, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1551);
    float _1561 = fma(_1549, 0.5, 0.5);
    float _1563 = fma(_1511, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1545);
    float _1565 = fma(_1491, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1559);
    float _1567 = fma(_1561, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1569 = exp2(_1541);
    float _1571 = fma(_1491, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1563);
    float _1573 = fma(_1531, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1565);
    float _1575 = fma(_1561, _1567, -0.212114393711090087890625);
    float _1577 = _1535 * 0.693147182464599609375;
    float _1579 = fma(_1531, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1571);
    float _1581 = fma(_1561, _1575, 1.570728778839111328125);
    float _1583 = sqrt(_1557);
    float _1585 = _1573 * _1555;
    float _1587 = _1579 * _1555;
    float _1589 = _1577 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1591 = fma(_1585, 0.5, 0.5);
    float _1593 = fma(_1587, -0.5, 0.5);
    float _1595 = -_1523;
    float _1597 = fma(_1569, _1553, _1595);
    float3 _4430 = float3(_1591, _1593, _1589);
    float _1599 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4430, float3(0.0), isnan(_4430)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4430, float3(0.0), isnan(_4430)), level(0.0)).x;
    float _1601 = _1583 * 0.636619746685028076171875;
    float _1603 = fma(_1597, 0.5, 0.5);
    float _1605 = -_1581;
    float _1607 = fma(_1601, _1605, 1.0);
    float3 _4451 = float3(_1591, _1593, _1589);
    float4 _1610 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4451, float3(0.0), isnan(_4451)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4451, float3(0.0), isnan(_4451)), level(0.0)).xyzw;
    float _1612 = _1610.x;
    float _1614 = _1610.y;
    float _1616 = _1610.z;
    float _1618 = _1610.w;
    float2 _4468 = float2(_1607, _1603);
    float3 _1622 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4468, float2(0.0), isnan(_4468)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4468, float2(0.0), isnan(_4468)), level(0.0)).xyz;
    float _1624 = _1622.x;
    float _1626 = _1622.y;
    float _1628 = _1622.z;
    out.m_66.y = 1.0;
    float _1630 = -_275;
    float _1632 = _1630 + _1167;
    float _1634 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1636 = _1634 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1638 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1640 = _1638 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1642 = -_265;
    float _1644 = _1642 + _1169;
    float _1646 = 1.0 / _1636;
    bool _1648 = _473 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1650 = isnan(_473);
    bool _1652 = _1648 || _1650;
    bool _1654 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1656 = _1652 || _1654;
    float _1658 = float(_1656);
    float _1660 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1662 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1660;
    float _1664 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1666 = _1664 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    bool _1668 = _473 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1670 = isnan(_473);
    bool _1672 = _1668 || _1670;
    bool _1674 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1676 = _1672 || _1674;
    float _1678 = float(_1676);
    float _1680 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1682 = _473 + _1680;
    float _1684 = -_1658;
    float _1686 = _1684 + 1.0;
    float _1688 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1690 = 1.0 / _1640;
    bool _1692 = _473 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1694 = isnan(_473);
    bool _1696 = _1692 || _1694;
    bool _1698 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1700 = _1696 || _1698;
    float _1702 = float(_1700);
    float _1704 = _1505 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1706 = -_237;
    float _1708 = _1706 + _1171;
    float _1710 = _1507 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1712 = -_1702;
    float _1714 = _1712 + 1.0;
    float _1716 = _1662 * _1646;
    float _1718 = _1678 * _1686;
    float _1720 = _1658 * _1714;
    float _1722 = _891 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1724 = fma(_1716, _1682, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1726 = -_1678;
    float _1728 = _1726 + 1.0;
    float _1730 = _1724 * _1718;
    float _1732 = _1666 * _1690;
    float _1734 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1736 = _473 + _1734;
    float _1738 = _891 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1740 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1742 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1744 = fma(_1732, _1736, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1746 = _891 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1748 = fma(_859, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1738);
    float _1750 = fma(_859, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1722);
    float _1752 = fma(_859, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1746);
    float _1754 = _1740 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1756 = _1742 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1758 = _1688 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1760 = fma(_853, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1752);
    float _1762 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1764 = _891 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1766 = fma(_853, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1748);
    float _1768 = fma(_853, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1750);
    float _1770 = _1760 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1772 = fma(_1728, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1730);
    float _1774 = fma(_859, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1764);
    float _1776 = _1766 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1778 = _1768 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1780 = _1770 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    out.m_68.x = _1754;
    out.m_68.y = _1756;
    out.m_68.z = _1758;
    out.m_68.w = _1762;
    float _1782 = fma(_1744, _1720, _1772);
    float _1784 = fma(_853, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1774);
    float _1786 = _1770 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1788 = exp2(_1704);
    float _1790 = _1770 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1792 = _1778 * (*spvDescriptorSet0.vp_c8)._m0[5].z;
    float _1794 = fma(_1776, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1786);
    float _1796 = fma(_1511, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1710);
    float _1798 = fma(_1776, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1790);
    float _1800 = _1778 * (*spvDescriptorSet0.vp_c8)._m0[4].z;
    float _1802 = fma(_1491, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1796);
    float _1804 = _443 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1806 = _441 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1808 = _445 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1810 = _1770 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1812 = _1778 * (*spvDescriptorSet0.vp_c8)._m0[7].z;
    float _1814 = fma(_1776, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1780);
    float _1816 = fma(_1702, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1782);
    float _1818 = fma(_1776, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1810);
    float _1820 = _1784 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1822 = _1812 + _1814;
    float _1824 = _1806 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1826 = _1804 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1828 = _1808 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1830 = fma(_1820, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1822);
    float _1832 = _1632 * (*spvDescriptorSet0.vp_c15)._m0[643].y;
    float _1834 = _1816 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1836 = fma(_1778, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1798);
    float _1838 = -_1788;
    float _1840 = _1838 + 1.0;
    float _1842 = fma(_1644, (*spvDescriptorSet0.vp_c15)._m0[643].x, _1832);
    float _1844 = 1.0 / _1830;
    out.m_70.x = _1824;
    out.m_70.y = _1826;
    out.m_70.z = _1828;
    out.m_70.w = _1834;
    float _1846 = fma(_1820, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1836);
    float _1848 = fma(_1708, (*spvDescriptorSet0.vp_c15)._m0[643].z, _1842);
    float _1850 = fma(_1531, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1802);
    float _1852 = _1840 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1854 = _1800 + _1818;
    float _1856 = _1848 + (*spvDescriptorSet0.vp_c15)._m0[643].w;
    out.gl_Position.x = _1573;
    out.gl_Position.y = _1579;
    out.gl_Position.z = _1850;
    out.gl_Position.w = _1543;
    float _1858 = fma(_1820, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1854);
    float _1860 = 1.0 / _1856;
    float _1862 = _1792 + _1794;
    float _1864 = _1846 * _1844;
    float _1866 = _1858 * _1844;
    float _1868 = fma(_1820, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1862);
    float _1870 = _1632 * (*spvDescriptorSet0.vp_c15)._m0[640].y;
    float _1872 = _1632 * (*spvDescriptorSet0.vp_c15)._m0[641].y;
    bool _1874 = _1864 > 0.0;
    float _1876 = _1868 * _1844;
    float _1878 = fma(_1644, (*spvDescriptorSet0.vp_c15)._m0[640].x, _1870);
    float _1880 = fma(_1644, (*spvDescriptorSet0.vp_c15)._m0[641].x, _1872);
    bool _1882 = _1864 < 1.0;
    bool _1884 = _1882 && _1874;
    float _1886 = fma(_1708, (*spvDescriptorSet0.vp_c15)._m0[640].z, _1878);
    float _1888 = _1850 + _1543;
    float _1890 = fma(_1708, (*spvDescriptorSet0.vp_c15)._m0[641].z, _1880);
    bool _1892 = _1585 > (-1.0);
    bool _1894 = _1892 && _1884;
    float _1896 = _1886 + (*spvDescriptorSet0.vp_c15)._m0[640].w;
    float _1898 = _1888 * 0.5;
    float _1900 = _1233 * _1291;
    bool _1902 = _1587 > (-1.0);
    bool _1904 = _1902 && _1894;
    float _1906 = _1896 * _1860;
    float _1908 = _1890 + (*spvDescriptorSet0.vp_c15)._m0[641].w;
    out.m_72.z = _1898;
    out.m_72.w = _1543;
    bool _1910 = _1585 < 1.0;
    bool _1912 = _1910 && _1904;
    float _1914 = _1908 * _1860;
    bool _1916 = _1587 < 1.0;
    bool _1918 = _1916 && _1912;
    float _1920 = _1852 * _1599;
    float _1922 = -_1852;
    float _1924 = _1922 + 1.0;
    float _1926 = _1618 * _1920;
    float _1928 = _1618 * _1924;
    float _1930 = _1628 * _1920;
    float _1932 = fma(_1624, _1926, _1612);
    float _1934 = fma(_1626, _1926, _1614);
    float _1936 = _1900 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1938 = fma(_1618, _1930, _1616);
    float _1940 = _279 * _1936;
    out.m_74.x = _1932;
    out.m_74.y = _1934;
    out.m_74.z = _1938;
    out.m_74.w = _1928;
    bool _1942 = !_1918;
    float _1974;
    if (!_1942)
    {
        float _1944 = -_1876;
        float _1946 = _1587 + _1944;
        float _1948 = -_1866;
        float _1950 = _1585 + _1948;
        float _1952 = -_1906;
        float _1954 = _1585 + _1952;
        float _1956 = -_1914;
        float _1958 = _1587 + _1956;
        float _1960 = _1946 * _1946;
        float _1962 = fma(_1950, _1950, _1960);
        float _1964 = sqrt(_1962);
        bool _1966 = _1964 > 0.0;
        float _1968 = _1964;
        if (!_1966)
        {
            _1968 = _1940;
        }
        float _1970 = _1968;
        bool _1972 = !_1966;
        _1974 = _1970;
        _1976 = _1972;
        if (!_1976)
        {
            float _1978 = _1958 * _1958;
            float _1980 = fma(_1954, _1954, _1978);
            float _1982 = rsqrt(_1962);
            float _1984 = sqrt(_1980);
            float _1986 = _1950 * _1982;
            float _1988 = _1946 * _1982;
            bool _1990 = _1984 > 0.0;
            float _1992 = _1982;
            if (!_1990)
            {
                _1992 = _1940;
            }
            float _1994 = _1992;
            bool _1996 = !_1990;
            _1974 = _1994;
            _1976 = _1996;
            if (!_1976)
            {
                float _1998 = _779 * _1820;
                float _2000 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
                float _2002 = fma(_1998, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1812);
                float _2004 = fma(_1998, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1792);
                float _2006 = fma(_1998, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1800);
                float _2008 = fma(_1820, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2002);
                float _2010 = fma(_1820, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2004);
                float _2012 = fma(_1820, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2006);
                float _2014 = rsqrt(_1980);
                float _2016 = _2000 * (*spvDescriptorSet0.vp_c13)._m0[0].w;
                float _2018 = 1.0 / _2008;
                float _2020 = _1958 * _2016;
                float _2022 = _1954 * _2016;
                float _2024 = _2020 * _2020;
                float _2026 = fma(_2022, _2022, _2024);
                float _2028 = _1958 * _2014;
                float _2030 = _1954 * _2014;
                float _2032 = _2010 * _2018;
                float _2034 = _2012 * _2018;
                float _2036 = sqrt(_2026);
                float _2038 = _1988 * _2028;
                float _2040 = _2032 * _2032;
                float _2042 = fma(_1986, _2030, _2038);
                float _2044 = fma(_2034, _2034, _2040);
                float _2046 = sqrt(_2044);
                float _2048 = precise::min(0.0, _2042);
                float _2050 = _1543 * _2048;
                float _2052 = fma(_2022, _2050, _1573);
                float _2054 = fma(_2020, _2050, _1579);
                float _2056 = fma(_2036, (*spvDescriptorSet0.vp_c13)._m0[1].x, _2046);
                out.gl_Position.x = _2052;
                out.gl_Position.y = _2054;
                float _2058 = 1.0 / _2056;
                float _2060 = _2046 * _2058;
                out.m_66.y = _2060;
                _1974 = _1940;
                _1976 = true;
            }
        }
    }
    else
    {
        float _2062 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        out.gl_Position.z = _2062;
        _1974 = 0.0;
    }
    _1976 = false;
    float _2064 = _1974;
    bool _2066 = _1233 > 0.0;
    bool _2068 = isnan(_1233);
    bool _2070 = _2066 || _2068;
    bool _2072 = isnan(0.0);
    bool _2074 = _2070 || _2072;
    float _2076 = _2064 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    bool _2078 = _1291 <= 0.0;
    bool _2080 = !_2074;
    bool _2082 = _2078 || _2080;
    out.m_47.x = _2076;
    if (!_2082)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _2084 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2084;
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
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1976 = false;
    bool _465 = false;
    bool _299 = false;
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
        float _2141 = as_type<float>(_109);
        out.gl_Position.z = _2141;
    }
    if (!_97)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _113 = in.m_49.w;
    bool _115 = _113 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _117 = isnan(_113);
    bool _119 = _115 || _117;
    bool _121 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _123 = _119 || _121;
    float _125 = -_113;
    float _127 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _129 = _127;
    if (_123)
    {
        float _131 = float(_93);
        _103 = _131;
    }
    float _133 = _103;
    bool _135 = _127 >= _133;
    bool _137 = !_123;
    bool _139 = _135 || _137;
    float _141 = _133;
    if (_139)
    {
        _141 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _143 = _141;
    if (_139)
    {
        out.m_47.x = 0.0;
    }
    if (_139)
    {
        float _145 = _143 * 5.0;
        _111 = as_type<int>(_145);
    }
    int _147 = _111;
    if (_139)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2211 = as_type<float>(_147);
        out.gl_Position.z = _2211;
    }
    if (_139)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _149 = in.m_51.x;
    float _151 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _153 = _127 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _155 = as_type<float>(int(gl_VertexIndex));
    float _157 = in.m_56.x;
    float _159 = in.m_56.y;
    float _161 = in.m_56.z;
    float _163 = _153 * _151;
    float _165 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[20].x, _163);
    int _167 = as_type<int>(_155) & 1;
    bool _169 = _167 != 0;
    int _171 = as_type<int>(_155) & 2;
    bool _173 = _171 != 0;
    float _175 = floor(_165);
    int _177 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _179 = _177 != 0;
    float _181 = _165 * 6.283185482025146484375;
    float _183 = _159 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _185 = !_173;
    int _187 = _185 ? (-1090519040) : 1056964608;
    float _189 = _159 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _191 = _181 * 0.15915493667125701904296875;
    int _193 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _195 = _193 != 0;
    int _197 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _199 = _197 != 0;
    float _201 = _159 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _203 = fma(_157, (*spvDescriptorSet0.vp_c10)._m0[4].x, _183);
    float _205 = fma(_157, (*spvDescriptorSet0.vp_c10)._m0[5].x, _189);
    bool _207 = !_169;
    int _209 = _207 ? (-1090519040) : 1056964608;
    float _211 = _191 * 6.283185482025146484375;
    float _213 = cos(_211);
    bool _215 = !_195;
    int _217 = _215 ? 0 : 1;
    float _219 = fma(_157, (*spvDescriptorSet0.vp_c10)._m0[6].x, _201);
    bool _221 = !_179;
    int _223 = _221 ? 0 : 1;
    float _225 = -_175;
    float _227 = _165 + _225;
    int _229 = abs(_217);
    out.m_58.x = as_type<float>(_209);
    out.m_58.y = as_type<float>(_187);
    int _231 = abs(_223);
    float _233 = -_227;
    float _235 = fma(_233, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _237 = fma(_161, (*spvDescriptorSet0.vp_c10)._m0[6].z, _219);
    bool _239 = !_199;
    int _241 = _239 ? 0 : 1;
    float _243 = float(_229);
    bool _245 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _247 = fma(_213, 0.5, 0.5);
    int _249 = abs(_241);
    float _251 = abs(_235);
    float _253 = _243 * _251;
    float _255 = float(_231);
    bool _257 = _227 < 0.5;
    float _259 = float(_257);
    float _261 = -_247;
    float _263 = fma(_261, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _265 = fma(_161, (*spvDescriptorSet0.vp_c10)._m0[4].z, _203);
    float _267 = -_259;
    float _269 = fma(_267, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _271 = float(_249);
    float _273 = fma(_255, _263, _253);
    float _275 = fma(_161, (*spvDescriptorSet0.vp_c10)._m0[5].z, _205);
    float _277 = abs(_269);
    float _279 = fma(_271, _277, _273);
    bool _281 = !_245;
    float _297;
    if (!_281)
    {
        float _283 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _285 = _149 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _287 = fma(_285, (*spvDescriptorSet0.vp_c9)._m0[11].x, _127);
        float _289 = _287 * _283;
        float _291 = floor(_289);
        float _293 = -_291;
        float _295 = _289 + _293;
        _297 = _295;
        _299 = true;
    }
    else
    {
        float _301 = float(_93);
        float _303 = 1.0 / _301;
        float _305 = _127 * _303;
        _297 = _305;
    }
    _299 = false;
    float _307 = _297;
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _311 = _307 + _309;
    bool _313 = _307 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _315 = isnan(_307);
    bool _317 = _313 || _315;
    bool _319 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _321 = _317 || _319;
    float _323 = float(_321);
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _327 = _307 + _325;
    bool _329 = _307 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _331 = isnan(_307);
    bool _333 = _329 || _331;
    bool _335 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _337 = _333 || _335;
    float _339 = float(_337);
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _343 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _341;
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _347 = _345 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _349 = _307 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _351 = isnan(_307);
    bool _353 = _349 || _351;
    bool _355 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _357 = _353 || _355;
    float _359 = float(_357);
    float _361 = -_323;
    float _363 = _361 + 1.0;
    float _365 = 1.0 / _347;
    float _367 = _359 * _363;
    float _369 = -_359;
    float _371 = _369 + 1.0;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _375 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _373;
    bool _377 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _379 = 1.0 / _343;
    float _381 = _339 * _371;
    float _383 = -_339;
    float _385 = _383 + 1.0;
    float _387 = _327 * _365;
    float _389 = _311 * _379;
    float _391 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _393 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _391;
    float _395 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _397 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _395;
    float _399 = fma(_375, _389, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _401 = fma(_393, _389, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _403 = fma(_397, _389, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _405 = _399 * _381;
    float _407 = _401 * _381;
    float _409 = _403 * _381;
    float _411 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _413 = _411 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _417 = _415 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _421 = _419 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _423 = fma(_385, (*spvDescriptorSet0.vp_c9)._m0[107].x, _405);
    float _425 = fma(_413, _387, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _427 = fma(_417, _387, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _429 = fma(_385, (*spvDescriptorSet0.vp_c9)._m0[107].y, _407);
    float _431 = fma(_421, _387, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _433 = fma(_385, (*spvDescriptorSet0.vp_c9)._m0[107].z, _409);
    float _435 = fma(_425, _367, _423);
    float _437 = fma(_427, _367, _429);
    float _439 = fma(_431, _367, _433);
    float _441 = fma(_323, (*spvDescriptorSet0.vp_c9)._m0[109].x, _435);
    float _443 = fma(_323, (*spvDescriptorSet0.vp_c9)._m0[109].y, _437);
    float _445 = fma(_323, (*spvDescriptorSet0.vp_c9)._m0[109].z, _439);
    bool _447 = !_377;
    float _463;
    if (!_447)
    {
        float _449 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _451 = _149 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _453 = fma(_451, (*spvDescriptorSet0.vp_c9)._m0[11].y, _127);
        float _455 = _453 * _449;
        float _457 = floor(_455);
        float _459 = -_457;
        float _461 = _455 + _459;
        _463 = _461;
        _465 = true;
    }
    else
    {
        float _467 = float(_93);
        float _469 = 1.0 / _467;
        float _471 = _127 * _469;
        _463 = _471;
    }
    _465 = false;
    float _473 = _463;
    float _475 = in.m_51.z;
    float _477 = _149 * 2.0;
    float _479 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _481 = log2(_479);
    float _483 = in.m_51.y;
    float _485 = floor(_477);
    float _487 = _475 * 2.0;
    bool _489 = _485 > 0.0;
    float _491 = _483 * 2.0;
    bool _493 = _485 >= 0.0;
    bool _495 = isnan(_485);
    bool _497 = _493 || _495;
    bool _499 = isnan(0.0);
    bool _501 = _497 || _499;
    float _503 = floor(_487);
    float _505 = _483 + _475;
    int _507 = _501 ? 0 : 1;
    float _509 = _505 + (-1.0);
    int _511 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _513 = _511 != 0;
    int _515 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _517 = _515 != 0;
    int _519 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _521 = _519 != 0;
    float _523 = floor(_491);
    int _525 = ~_507;
    int _527 = _525 + 1;
    int _529 = _527 + 1;
    float _531 = fma(_509, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _533 = _529;
    if (!_489)
    {
        int _535 = ~_507;
        int _537 = _535 + 1;
        _533 = _537;
    }
    int _539 = _533;
    bool _541 = !_517;
    int _543 = _541 ? 0 : 1;
    float _545 = _481 * _127;
    bool _547 = _503 > 0.0;
    bool _549 = _503 >= 0.0;
    bool _551 = isnan(_503);
    bool _553 = _549 || _551;
    bool _555 = isnan(0.0);
    bool _557 = _553 || _555;
    float _559 = in.m_60.x;
    float _561 = in.m_60.y;
    float _563 = in.m_60.z;
    float _565 = exp2(_545);
    bool _567 = _523 > 0.0;
    bool _569 = _523 >= 0.0;
    bool _571 = isnan(_523);
    bool _573 = _569 || _571;
    bool _575 = isnan(0.0);
    bool _577 = _573 || _575;
    float _579 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _581 = 1.0 + _579;
    bool _583 = !_513;
    int _585 = _583 ? 0 : 1;
    int _587 = abs(_543);
    float _589 = 1.0 / _581;
    int _591 = _557 ? 0 : 1;
    bool _593 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _595 = isnan(1.0);
    bool _597 = _593 || _595;
    bool _599 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _601 = _597 || _599;
    float _603 = float(_539);
    bool _605 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _607 = isnan(0.0);
    bool _609 = _605 || _607;
    bool _611 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _613 = _609 || _611;
    float _615 = -_565;
    float _617 = _615 + 1.0;
    int _619 = abs(_585);
    float _621 = float(_587);
    int _623 = ~_591;
    int _625 = _623 + 1;
    int _627 = _625 + 1;
    int _629 = _627;
    if (!_547)
    {
        int _631 = ~_591;
        int _633 = _631 + 1;
        _629 = _633;
    }
    int _635 = _629;
    float _637 = _621 * _603;
    int _639 = _577 ? 0 : 1;
    float _641 = _613 ? _617 : 0.0;
    float _643 = _637 * (-2.0);
    bool _645 = !_521;
    int _647 = _645 ? 0 : 1;
    int _649 = ~_639;
    int _651 = _649 + 1;
    int _653 = _651 + 1;
    int _655 = _653;
    if (_601)
    {
        float _657 = _641 * _589;
        _129 = _657;
    }
    float _659 = _129;
    if (!_567)
    {
        int _661 = ~_639;
        int _663 = _661 + 1;
        _655 = _663;
    }
    int _665 = _655;
    float _667 = _483 + (-0.5);
    int _669 = abs(_647);
    float _671 = fma(_643, _561, _561);
    float _673 = float(_619);
    float _675 = fma(_531, _643, _531);
    float _677 = float(_635);
    float _679 = _149 + _483;
    float _681 = fma(_667, (*spvDescriptorSet0.vp_c9)._m0[196].y, _671);
    float _683 = _673 * _677;
    float _685 = _679 + (-1.0);
    float _687 = fma(_675, _659, _681);
    float _689 = _683 * (-2.0);
    float _691 = fma(_685, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _693 = _149 + (-0.5);
    float _695 = float(_669);
    float _697 = fma(_689, _559, _559);
    float _699 = float(_665);
    float _701 = fma(_691, _689, _691);
    float _703 = _149 + _475;
    float _705 = fma(_693, (*spvDescriptorSet0.vp_c9)._m0[196].x, _697);
    float _707 = _695 * _699;
    float _709 = in.m_62.x;
    float _711 = in.m_62.y;
    float _713 = _703 + (-1.0);
    float _715 = _475 + (-0.5);
    float _717 = _707 * (-2.0);
    float _719 = fma(_701, _659, _705);
    float _721 = fma(_713, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _723 = _687 * 0.15915493667125701904296875;
    float _725 = fma(_717, _563, _563);
    float _727 = _719 * 0.15915493667125701904296875;
    float _729 = fma(_721, _717, _721);
    float _731 = _723 * 6.283185482025146484375;
    float _733 = cos(_731);
    float _735 = fma(_715, (*spvDescriptorSet0.vp_c9)._m0[196].z, _725);
    float _737 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, as_type<float>(_187));
    float _739 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, as_type<float>(_209));
    float _741 = fma(_729, _659, _735);
    float _743 = _727 * 6.283185482025146484375;
    float _745 = sin(_743);
    float _747 = _741 * 0.15915493667125701904296875;
    float _749 = _711 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _751 = _747 * 6.283185482025146484375;
    float _753 = cos(_751);
    float _755 = _749 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _757 = _755 * _737;
    float _759 = _723 * 6.283185482025146484375;
    float _761 = sin(_759);
    float _763 = _727 * 6.283185482025146484375;
    float _765 = cos(_763);
    float _767 = _709 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _769 = _733 * _753;
    float _771 = in.m_44.x;
    float _773 = in.m_44.y;
    float _775 = in.m_44.z;
    float _777 = _753 * _757;
    float _779 = _767 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _781 = _747 * 6.283185482025146484375;
    float _783 = sin(_781);
    float _785 = _745 * _761;
    float _787 = _779 * _739;
    float _789 = _745 * _777;
    float _791 = _765 * _761;
    float _793 = _745 * _733;
    float _795 = _765 * _733;
    float _797 = _765 * _777;
    float _799 = _761 * _753;
    float _801 = fma(_783, _795, _785);
    float _803 = -_791;
    float _805 = fma(_783, _793, _803);
    float _807 = -_793;
    float _809 = fma(_783, _791, _807);
    float _811 = -_757;
    float _813 = _783 * _811;
    float _815 = fma(_801, _787, _797);
    float _817 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _819 = fma(_783, _785, _795);
    float _821 = fma(_769, _787, _813);
    float _823 = fma(_805, _787, _789);
    float _825 = fma(_809, _817, _815);
    float _827 = _773 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _829 = fma(_799, _817, _821);
    float _831 = fma(_819, _817, _823);
    float _833 = _825 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _835 = _773 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _837 = fma(_771, (*spvDescriptorSet0.vp_c10)._m0[6].x, _827);
    float _839 = _825 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _841 = fma(_829, (*spvDescriptorSet0.vp_c8)._m0[26].x, _833);
    float _843 = fma(_771, (*spvDescriptorSet0.vp_c10)._m0[4].x, _835);
    float _845 = fma(_775, (*spvDescriptorSet0.vp_c10)._m0[6].z, _837);
    float _847 = fma(_829, (*spvDescriptorSet0.vp_c8)._m0[24].x, _839);
    float _849 = fma(_831, (*spvDescriptorSet0.vp_c8)._m0[26].z, _841);
    float _851 = fma(_775, (*spvDescriptorSet0.vp_c10)._m0[4].z, _843);
    float _853 = _845 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _855 = fma(_831, (*spvDescriptorSet0.vp_c8)._m0[24].z, _847);
    float _857 = _849 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _859 = _851 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _861 = _855 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _863 = _853 + _857;
    float _865 = in.m_64.y;
    float _867 = _859 + _861;
    float _869 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _871 = _863 + _869;
    float _873 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _875 = _867 + _873;
    float _877 = _871 * _871;
    float _879 = fma(_875, _875, _877);
    float _881 = _825 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _883 = sqrt(_879);
    float _885 = fma(_829, (*spvDescriptorSet0.vp_c8)._m0[25].x, _881);
    float _887 = fma(_831, (*spvDescriptorSet0.vp_c8)._m0[25].z, _885);
    float _889 = _887 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _891 = _773 + _865;
    float _893 = _891 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _895 = _891 + _889;
    bool _897 = _883 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _899 = fma(_859, (*spvDescriptorSet0.vp_c8)._m0[11].x, _893);
    float _901 = fma(_853, (*spvDescriptorSet0.vp_c8)._m0[11].z, _899);
    float _903 = _773;
    float _905 = _899;
    float _907 = _879;
    float _909 = _757;
    float _911 = _813;
    if (!_897)
    {
        _903 = _867;
    }
    float _913 = _903;
    float _915 = _913;
    if (!_897)
    {
        _905 = _863;
    }
    float _917 = _905;
    float _919 = 0.0;
    float _921 = _917;
    if (!_897)
    {
        _919 = _895;
    }
    float _923 = _919;
    bool _925 = !_897;
    float _927 = _923;
    if (!_925)
    {
        float _929 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _931 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _933 = _883 + _931;
        float _935 = _895 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _937 = _933 * _929;
        float _939 = rsqrt(_879);
        float _941 = _937 * 0.15915493667125701904296875;
        float _943 = _941 * 6.283185482025146484375;
        float _945 = cos(_943);
        float _947 = _941 * 6.283185482025146484375;
        float _949 = sin(_947);
        float _951 = _945 + (-1.0);
        float _953 = fma(_949, _935, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _955 = _951 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _957 = _939 * _953;
        float _959 = fma(_895, _945, _955);
        float _961 = fma(_875, _957, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _963 = fma(_871, _957, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _927 = _959;
        _915 = _961;
        _921 = _963;
    }
    float _965 = _927;
    float _967 = _915;
    float _969 = _921;
    float _971 = -_891;
    float _973 = _971 + _965;
    float _975 = -_859;
    float _977 = _975 + _967;
    float _979 = _901 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _981 = -_853;
    float _983 = _981 + _969;
    float _985 = _973 * _973;
    float _987 = _891 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _989 = 1.0 / _979;
    float _991 = fma(_977, _977, _985);
    float _993 = fma(_859, (*spvDescriptorSet0.vp_c8)._m0[10].x, _987);
    bool _995 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _997 = isnan(0.5);
    bool _999 = _995 || _997;
    bool _1001 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1003 = _999 || _1001;
    float _1005 = fma(_983, _983, _991);
    float _1007 = fma(_853, (*spvDescriptorSet0.vp_c8)._m0[10].z, _993);
    bool _1009 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1011 = isnan(0.5);
    bool _1013 = _1009 || _1011;
    bool _1015 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1017 = _1013 || _1015;
    float _1019 = sqrt(_1005);
    float _1021 = _1007 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1023 = _1021 + _979;
    float _1025 = _1023 * _989;
    float _1027 = _1025 * 0.5;
    bool _1029 = _1019 > 0.0;
    float _1031 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1033 = fma(_1027, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1031);
    float _1035 = 1.0 / _1033;
    bool _1037 = !_1029;
    float _1039 = _967;
    float _1041 = _965;
    float _1043 = _969;
    float _1045 = _973;
    if (!_1037)
    {
        float _1047 = _275 * _275;
        float _1049 = fma(_265, _265, _1047);
        float _1051 = rsqrt(_1005);
        float _1053 = fma(_237, _237, _1049);
        float _1055 = sqrt(_1053);
        float _1057 = _977 * _1051;
        float _1059 = _973 * _1051;
        float _1061 = _983 * _1051;
        bool _1063 = _1055 > 0.0;
        bool _1065 = !_1063;
        _1045 = _1059;
        if (!_1065)
        {
            float _1067 = rsqrt(_1053);
            float _1069 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1071 = _275 * _1067;
            float _1073 = _265 * _1067;
            float _1075 = _1059 * _1071;
            float _1077 = _237 * _1067;
            float _1079 = fma(_1057, _1073, _1075);
            float _1081 = _1069 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1083 = fma(_1061, _1077, _1079);
            float _1085 = _1083 * _1081;
            float _1087 = fma(_265, _1085, _967);
            float _1089 = fma(_275, _1085, _965);
            float _1091 = fma(_237, _1085, _969);
            _1039 = _1087;
            _1041 = _1089;
            _1043 = _1091;
            _1045 = _1079;
        }
    }
    float _1093 = _1039;
    float _1095 = _1041;
    float _1097 = _1043;
    float _1099 = _1045;
    float _1101 = _1099;
    float _1103 = _1095;
    float _1105 = _1097;
    if (_1017)
    {
        _907 = 1.0;
    }
    float _1107 = _907;
    float _1109 = _1107;
    if (_1003)
    {
        _909 = _1093;
    }
    float _1111 = _909;
    float _1113 = _1111;
    if (!_1003)
    {
        float _1115 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1117 = _891 + _1115;
        float _1119 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1121 = _859 + _1119;
        float _1123 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1125 = -_891;
        float _1127 = _1125 + _1095;
        float _1129 = _1117 * _1117;
        float _1131 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1133 = _853 + _1131;
        float _1135 = -_853;
        float _1137 = _1135 + _1097;
        float _1139 = fma(_1121, _1121, _1129);
        float _1141 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1143 = fma(_1133, _1133, _1139);
        float _1145 = sqrt(_1143);
        float _1147 = _1123 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1149 = precise::min(_1145, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1151 = _1149 * _1141;
        float _1153 = -_859;
        float _1155 = _1153 + _1093;
        float _1157 = _1147 * _1151;
        float _1159 = fma(_1155, _1157, _859);
        float _1161 = fma(_1127, _1157, _891);
        float _1163 = fma(_1137, _1157, _853);
        _1101 = _1151;
        _1103 = _1161;
        _1113 = _1159;
        _1105 = _1163;
    }
    float _1165 = _1101;
    float _1167 = _1103;
    float _1169 = _1113;
    float _1171 = _1105;
    float _1173 = _1165;
    if (_1017)
    {
        _911 = 1.0;
    }
    float _1175 = _911;
    float _1177 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1179 = _1035 * _1177;
    float _1181 = _1175;
    if (!_1017)
    {
        float _1183 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1185 = _1183 * 0.15915493667125701904296875;
        float _1187 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1189 = _1185 * 6.283185482025146484375;
        float _1191 = cos(_1189);
        float _1193 = _1187 * 0.15915493667125701904296875;
        float _1195 = _1185 * 6.283185482025146484375;
        float _1197 = sin(_1195);
        float _1199 = 1.0 / _1191;
        float _1201 = _1193 * 6.283185482025146484375;
        float _1203 = cos(_1201);
        float _1205 = _1197 * _1199;
        float _1207 = _1193 * 6.283185482025146484375;
        float _1209 = sin(_1207);
        float _1211 = _1203 * _1205;
        float _1213 = 1.0 / _1211;
        float _1215 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1217 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1215;
        float _1219 = 1.0 / _1217;
        float _1221 = _1209 * _1213;
        float _1223 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1225 = fma(_1179, _1221, _1223);
        float _1227 = _1225 * _1219;
        float _1229 = precise::clamp(_1227, 0.0, 1.0);
        _1173 = _1213;
        _1109 = _1229;
    }
    float _1231 = _1173;
    float _1233 = _1109;
    float _1235 = _1231;
    if (!_1017)
    {
        float _1237 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1239 = _1237 * 0.15915493667125701904296875;
        float _1241 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1243 = _1239 * 6.283185482025146484375;
        float _1245 = cos(_1243);
        float _1247 = _1241 * 0.15915493667125701904296875;
        float _1249 = _1239 * 6.283185482025146484375;
        float _1251 = sin(_1249);
        float _1253 = 1.0 / _1245;
        float _1255 = _1247 * 6.283185482025146484375;
        float _1257 = cos(_1255);
        float _1259 = _1251 * _1253;
        float _1261 = _1247 * 6.283185482025146484375;
        float _1263 = sin(_1261);
        float _1265 = _1257 * _1259;
        float _1267 = 1.0 / _1265;
        float _1269 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1271 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1269;
        float _1273 = 1.0 / _1271;
        float _1275 = _1263 * _1267;
        float _1277 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1279 = fma(_1179, _1275, _1277);
        float _1281 = _1279 * _1273;
        float _1283 = precise::clamp(_1281, 0.0, 1.0);
        float _1285 = -_1283;
        float _1287 = _1285 + 1.0;
        _1235 = _1265;
        _1181 = _1287;
    }
    float _1289 = _1235;
    float _1291 = _1181;
    float _1293 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1295 = _1167 + _1293;
    float _1297 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1299 = _1169 + _1297;
    float _1301 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1303 = _1171 + _1301;
    float _1305 = _1295 * _1295;
    float _1307 = fma(_1299, _1299, _1305);
    float _1309 = fma(_1303, _1303, _1307);
    float _1311 = rsqrt(_1309);
    float _1313 = sqrt(_1309);
    float _1315 = _1311 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1317 = _1299 * _1315;
    float _1319 = _1303 * _1315;
    float _1321 = _1317 * _1317;
    float _1323 = _1319 * _1319;
    float _1325 = _1321 + _1323;
    float _1327 = sqrt(_1325);
    bool _1329 = _1327 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1331 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1333 = _1327 + _1331;
    float _1335 = _1303;
    float _1337 = _1325;
    float _1339 = _1333;
    float _1341 = _1289;
    float _1343 = _1315;
    if (_1329)
    {
        float _1345 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1335 = _1345;
    }
    float _1347 = _1335;
    if (_1329)
    {
        float _1349 = rsqrt(_1325);
        _1337 = _1349;
    }
    float _1351 = _1337;
    float _1353 = _1351;
    if (_1329)
    {
        float _1355 = _1333 * _1347;
        _1339 = _1355;
    }
    float _1357 = _1339;
    if (_1329)
    {
        float _1359 = _1357 * 0.15915493667125701904296875;
        _1341 = _1359;
    }
    float _1361 = _1341;
    float _1363 = _1347;
    float _1365 = _1361;
    if (_1329)
    {
        float _1367 = _1361 * 6.283185482025146484375;
        float _1369 = sin(_1367);
        _1363 = _1369;
    }
    float _1371 = _1363;
    float _1373 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1375 = precise::max(0.0, _1373);
    float _1377 = _1305;
    float _1379 = _1375;
    if (_1329)
    {
        float _1381 = _1361 * 6.283185482025146484375;
        float _1383 = cos(_1381);
        _1377 = _1383;
    }
    float _1385 = _1377;
    float _1387 = -_1315;
    float _1389 = -_1375;
    float _1391 = fma(_1295, _1387, _1389);
    float _1393 = _1391;
    if (_1329)
    {
        float _1395 = _1391 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1379 = _1395;
    }
    float _1397 = _1379;
    float _1399 = _1371;
    float _1401 = _1397;
    if (_1329)
    {
        float _1403 = fma(_1371, _1397, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1399 = _1403;
    }
    float _1405 = _1399;
    float _1407 = _1405;
    float _1409 = _1385;
    if (_1329)
    {
        float _1411 = _1385 + (-1.0);
        _1401 = _1411;
    }
    float _1413 = _1401;
    float _1415 = _1413;
    if (_1329)
    {
        float _1417 = _1351 * _1405;
        _1343 = _1417;
    }
    float _1419 = _1343;
    if (!_1329)
    {
        _1407 = _1317;
    }
    float _1421 = _1407;
    float _1423 = _1421;
    if (_1329)
    {
        float _1425 = _1413 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1365 = _1425;
    }
    float _1427 = _1365;
    if (_1329)
    {
        float _1429 = _1317 * _1419;
        _1423 = _1429;
    }
    float _1431 = _1423;
    if (!_1329)
    {
        _1415 = _1319;
    }
    float _1433 = _1415;
    float _1435 = _1433;
    if (_1329)
    {
        float _1437 = _1319 * _1419;
        _1435 = _1437;
    }
    float _1439 = _1435;
    if (!_1329)
    {
        _1353 = _1321;
    }
    float _1441 = _1353;
    float _1443 = _1441;
    if (_1329)
    {
        float _1445 = fma(_1391, _1385, _1427);
        _1393 = _1445;
    }
    float _1447 = _1393;
    if (_1329)
    {
        float _1449 = _1431 * _1431;
        _1443 = _1449;
    }
    float _1451 = _1443;
    if (!_1329)
    {
        _1409 = _1323;
    }
    float _1453 = _1409;
    float _1455 = _1453;
    if (_1329)
    {
        float _1457 = _1439 * _1439;
        _1455 = _1457;
    }
    float _1459 = _1455;
    float _1461 = fma(_1447, _1447, _1451);
    float _1463 = _1167 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1465 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1467 = _1461 + _1459;
    float _1469 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1463);
    float _1471 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1473 = fma(_1313, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1471);
    float _1475 = precise::clamp(_1473, 0.0, 1.0);
    float _1477 = _1167 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1479 = _1167 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1481 = fma(_1171, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1469);
    float _1483 = rsqrt(_1467);
    float _1485 = -_1475;
    float _1487 = _1485 + 1.0;
    float _1489 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1477);
    float _1491 = _1481 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1493 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1479);
    float _1495 = _1167 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1497 = fma(_1171, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1489);
    float _1499 = _1491 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1501 = fma(_1171, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1493);
    float _1503 = abs(_1487);
    float _1505 = log2(_1503);
    float _1507 = _1497 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1509 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1495);
    float _1511 = _1501 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1513 = -_1499;
    float _1515 = fma(_1513, _1465, 1.0);
    float _1517 = _1507 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1519 = fma(_1171, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1509);
    float _1521 = _1483 * _1431;
    float _1523 = _1483 * _1447;
    float _1525 = fma(_1511, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1517);
    float _1527 = _1483 * _1439;
    float _1529 = _1521 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1531 = _1519 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1533 = fma(_1491, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1525);
    float _1535 = log2(_1515);
    float _1537 = -_1529;
    float _1539 = fma(_1523, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1537);
    float _1541 = _1505 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1543 = fma(_1531, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1533);
    float _1545 = _1507 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1547 = -_1527;
    float _1549 = fma(_1547, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1539);
    float _1551 = _1507 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1553 = _1523 + 1.0;
    float _1555 = 1.0 / _1543;
    float _1557 = fma(_1549, -0.5, 0.5);
    float _1559 = fma(_1511, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1551);
    float _1561 = fma(_1549, 0.5, 0.5);
    float _1563 = fma(_1511, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1545);
    float _1565 = fma(_1491, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1559);
    float _1567 = fma(_1561, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1569 = exp2(_1541);
    float _1571 = fma(_1491, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1563);
    float _1573 = fma(_1531, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1565);
    float _1575 = fma(_1561, _1567, -0.212114393711090087890625);
    float _1577 = _1535 * 0.693147182464599609375;
    float _1579 = fma(_1531, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1571);
    float _1581 = fma(_1561, _1575, 1.570728778839111328125);
    float _1583 = sqrt(_1557);
    float _1585 = _1573 * _1555;
    float _1587 = _1579 * _1555;
    float _1589 = _1577 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1591 = fma(_1585, 0.5, 0.5);
    float _1593 = fma(_1587, -0.5, 0.5);
    float _1595 = -_1523;
    float _1597 = fma(_1569, _1553, _1595);
    float3 _4430 = float3(_1591, _1593, _1589);
    float _1599 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4430, float3(0.0), isnan(_4430)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4430, float3(0.0), isnan(_4430)), level(0.0)).x;
    float _1601 = _1583 * 0.636619746685028076171875;
    float _1603 = fma(_1597, 0.5, 0.5);
    float _1605 = -_1581;
    float _1607 = fma(_1601, _1605, 1.0);
    float3 _4451 = float3(_1591, _1593, _1589);
    float4 _1610 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4451, float3(0.0), isnan(_4451)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4451, float3(0.0), isnan(_4451)), level(0.0)).xyzw;
    float _1612 = _1610.x;
    float _1614 = _1610.y;
    float _1616 = _1610.z;
    float _1618 = _1610.w;
    float2 _4468 = float2(_1607, _1603);
    float3 _1622 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4468, float2(0.0), isnan(_4468)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4468, float2(0.0), isnan(_4468)), level(0.0)).xyz;
    float _1624 = _1622.x;
    float _1626 = _1622.y;
    float _1628 = _1622.z;
    out.m_66.y = 1.0;
    float _1630 = -_275;
    float _1632 = _1630 + _1167;
    float _1634 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1636 = _1634 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1638 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1640 = _1638 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1642 = -_265;
    float _1644 = _1642 + _1169;
    float _1646 = 1.0 / _1636;
    bool _1648 = _473 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1650 = isnan(_473);
    bool _1652 = _1648 || _1650;
    bool _1654 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1656 = _1652 || _1654;
    float _1658 = float(_1656);
    float _1660 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1662 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1660;
    float _1664 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1666 = _1664 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    bool _1668 = _473 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1670 = isnan(_473);
    bool _1672 = _1668 || _1670;
    bool _1674 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1676 = _1672 || _1674;
    float _1678 = float(_1676);
    float _1680 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1682 = _473 + _1680;
    float _1684 = -_1658;
    float _1686 = _1684 + 1.0;
    float _1688 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1690 = 1.0 / _1640;
    bool _1692 = _473 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1694 = isnan(_473);
    bool _1696 = _1692 || _1694;
    bool _1698 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1700 = _1696 || _1698;
    float _1702 = float(_1700);
    float _1704 = _1505 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1706 = -_237;
    float _1708 = _1706 + _1171;
    float _1710 = _1507 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1712 = -_1702;
    float _1714 = _1712 + 1.0;
    float _1716 = _1662 * _1646;
    float _1718 = _1678 * _1686;
    float _1720 = _1658 * _1714;
    float _1722 = _891 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1724 = fma(_1716, _1682, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1726 = -_1678;
    float _1728 = _1726 + 1.0;
    float _1730 = _1724 * _1718;
    float _1732 = _1666 * _1690;
    float _1734 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1736 = _473 + _1734;
    float _1738 = _891 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1740 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1742 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1744 = fma(_1732, _1736, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1746 = _891 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1748 = fma(_859, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1738);
    float _1750 = fma(_859, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1722);
    float _1752 = fma(_859, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1746);
    float _1754 = _1740 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1756 = _1742 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1758 = _1688 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1760 = fma(_853, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1752);
    float _1762 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1764 = _891 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1766 = fma(_853, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1748);
    float _1768 = fma(_853, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1750);
    float _1770 = _1760 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1772 = fma(_1728, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1730);
    float _1774 = fma(_859, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1764);
    float _1776 = _1766 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1778 = _1768 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1780 = _1770 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    out.m_68.x = _1754;
    out.m_68.y = _1756;
    out.m_68.z = _1758;
    out.m_68.w = _1762;
    float _1782 = fma(_1744, _1720, _1772);
    float _1784 = fma(_853, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1774);
    float _1786 = _1770 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1788 = exp2(_1704);
    float _1790 = _1770 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1792 = _1778 * (*spvDescriptorSet0.vp_c8)._m0[5].z;
    float _1794 = fma(_1776, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1786);
    float _1796 = fma(_1511, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1710);
    float _1798 = fma(_1776, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1790);
    float _1800 = _1778 * (*spvDescriptorSet0.vp_c8)._m0[4].z;
    float _1802 = fma(_1491, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1796);
    float _1804 = _443 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1806 = _441 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1808 = _445 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1810 = _1770 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1812 = _1778 * (*spvDescriptorSet0.vp_c8)._m0[7].z;
    float _1814 = fma(_1776, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1780);
    float _1816 = fma(_1702, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1782);
    float _1818 = fma(_1776, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1810);
    float _1820 = _1784 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1822 = _1812 + _1814;
    float _1824 = _1806 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1826 = _1804 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1828 = _1808 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1830 = fma(_1820, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1822);
    float _1832 = _1632 * (*spvDescriptorSet0.vp_c15)._m0[643].y;
    float _1834 = _1816 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1836 = fma(_1778, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1798);
    float _1838 = -_1788;
    float _1840 = _1838 + 1.0;
    float _1842 = fma(_1644, (*spvDescriptorSet0.vp_c15)._m0[643].x, _1832);
    float _1844 = 1.0 / _1830;
    out.m_70.x = _1824;
    out.m_70.y = _1826;
    out.m_70.z = _1828;
    out.m_70.w = _1834;
    float _1846 = fma(_1820, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1836);
    float _1848 = fma(_1708, (*spvDescriptorSet0.vp_c15)._m0[643].z, _1842);
    float _1850 = fma(_1531, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1802);
    float _1852 = _1840 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1854 = _1800 + _1818;
    float _1856 = _1848 + (*spvDescriptorSet0.vp_c15)._m0[643].w;
    out.gl_Position.x = _1573;
    out.gl_Position.y = _1579;
    out.gl_Position.z = _1850;
    out.gl_Position.w = _1543;
    float _1858 = fma(_1820, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1854);
    float _1860 = 1.0 / _1856;
    float _1862 = _1792 + _1794;
    float _1864 = _1846 * _1844;
    float _1866 = _1858 * _1844;
    float _1868 = fma(_1820, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1862);
    float _1870 = _1632 * (*spvDescriptorSet0.vp_c15)._m0[640].y;
    float _1872 = _1632 * (*spvDescriptorSet0.vp_c15)._m0[641].y;
    bool _1874 = _1864 > 0.0;
    float _1876 = _1868 * _1844;
    float _1878 = fma(_1644, (*spvDescriptorSet0.vp_c15)._m0[640].x, _1870);
    float _1880 = fma(_1644, (*spvDescriptorSet0.vp_c15)._m0[641].x, _1872);
    bool _1882 = _1864 < 1.0;
    bool _1884 = _1882 && _1874;
    float _1886 = fma(_1708, (*spvDescriptorSet0.vp_c15)._m0[640].z, _1878);
    float _1888 = _1850 + _1543;
    float _1890 = fma(_1708, (*spvDescriptorSet0.vp_c15)._m0[641].z, _1880);
    bool _1892 = _1585 > (-1.0);
    bool _1894 = _1892 && _1884;
    float _1896 = _1886 + (*spvDescriptorSet0.vp_c15)._m0[640].w;
    float _1898 = _1888 * 0.5;
    float _1900 = _1233 * _1291;
    bool _1902 = _1587 > (-1.0);
    bool _1904 = _1902 && _1894;
    float _1906 = _1896 * _1860;
    float _1908 = _1890 + (*spvDescriptorSet0.vp_c15)._m0[641].w;
    out.m_72.z = _1898;
    out.m_72.w = _1543;
    bool _1910 = _1585 < 1.0;
    bool _1912 = _1910 && _1904;
    float _1914 = _1908 * _1860;
    bool _1916 = _1587 < 1.0;
    bool _1918 = _1916 && _1912;
    float _1920 = _1852 * _1599;
    float _1922 = -_1852;
    float _1924 = _1922 + 1.0;
    float _1926 = _1618 * _1920;
    float _1928 = _1618 * _1924;
    float _1930 = _1628 * _1920;
    float _1932 = fma(_1624, _1926, _1612);
    float _1934 = fma(_1626, _1926, _1614);
    float _1936 = _1900 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1938 = fma(_1618, _1930, _1616);
    float _1940 = _279 * _1936;
    out.m_74.x = _1932;
    out.m_74.y = _1934;
    out.m_74.z = _1938;
    out.m_74.w = _1928;
    bool _1942 = !_1918;
    float _1974;
    if (!_1942)
    {
        float _1944 = -_1876;
        float _1946 = _1587 + _1944;
        float _1948 = -_1866;
        float _1950 = _1585 + _1948;
        float _1952 = -_1906;
        float _1954 = _1585 + _1952;
        float _1956 = -_1914;
        float _1958 = _1587 + _1956;
        float _1960 = _1946 * _1946;
        float _1962 = fma(_1950, _1950, _1960);
        float _1964 = sqrt(_1962);
        bool _1966 = _1964 > 0.0;
        float _1968 = _1964;
        if (!_1966)
        {
            _1968 = _1940;
        }
        float _1970 = _1968;
        bool _1972 = !_1966;
        _1974 = _1970;
        _1976 = _1972;
        if (!_1976)
        {
            float _1978 = _1958 * _1958;
            float _1980 = fma(_1954, _1954, _1978);
            float _1982 = rsqrt(_1962);
            float _1984 = sqrt(_1980);
            float _1986 = _1950 * _1982;
            float _1988 = _1946 * _1982;
            bool _1990 = _1984 > 0.0;
            float _1992 = _1982;
            if (!_1990)
            {
                _1992 = _1940;
            }
            float _1994 = _1992;
            bool _1996 = !_1990;
            _1974 = _1994;
            _1976 = _1996;
            if (!_1976)
            {
                float _1998 = _779 * _1820;
                float _2000 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
                float _2002 = fma(_1998, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1812);
                float _2004 = fma(_1998, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1792);
                float _2006 = fma(_1998, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1800);
                float _2008 = fma(_1820, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2002);
                float _2010 = fma(_1820, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2004);
                float _2012 = fma(_1820, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2006);
                float _2014 = rsqrt(_1980);
                float _2016 = _2000 * (*spvDescriptorSet0.vp_c13)._m0[0].w;
                float _2018 = 1.0 / _2008;
                float _2020 = _1958 * _2016;
                float _2022 = _1954 * _2016;
                float _2024 = _2020 * _2020;
                float _2026 = fma(_2022, _2022, _2024);
                float _2028 = _1958 * _2014;
                float _2030 = _1954 * _2014;
                float _2032 = _2010 * _2018;
                float _2034 = _2012 * _2018;
                float _2036 = sqrt(_2026);
                float _2038 = _1988 * _2028;
                float _2040 = _2032 * _2032;
                float _2042 = fma(_1986, _2030, _2038);
                float _2044 = fma(_2034, _2034, _2040);
                float _2046 = sqrt(_2044);
                float _2048 = precise::min(0.0, _2042);
                float _2050 = _1543 * _2048;
                float _2052 = fma(_2022, _2050, _1573);
                float _2054 = fma(_2020, _2050, _1579);
                float _2056 = fma(_2036, (*spvDescriptorSet0.vp_c13)._m0[1].x, _2046);
                out.gl_Position.x = _2052;
                out.gl_Position.y = _2054;
                float _2058 = 1.0 / _2056;
                float _2060 = _2046 * _2058;
                out.m_66.y = _2060;
                _1974 = _1940;
                _1976 = true;
            }
        }
    }
    else
    {
        float _2062 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        out.gl_Position.z = _2062;
        _1974 = 0.0;
    }
    _1976 = false;
    float _2064 = _1974;
    bool _2066 = _1233 > 0.0;
    bool _2068 = isnan(_1233);
    bool _2070 = _2066 || _2068;
    bool _2072 = isnan(0.0);
    bool _2074 = _2070 || _2072;
    float _2076 = _2064 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    bool _2078 = _1291 <= 0.0;
    bool _2080 = !_2074;
    bool _2082 = _2078 || _2080;
    out.m_47.x = _2076;
    if (!_2082)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _2084 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2084;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}


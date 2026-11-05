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
    constant _16* vp_c13 [[id(3)]];
    constant _16* vp_c15 [[id(4)]];
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
    float4 m_64 [[user(locn0)]];
    float4 m_60 [[user(locn1)]];
    float4 m_62 [[user(locn2)]];
    float4 m_66 [[user(locn3)]];
    float4 m_70 [[user(locn4)]];
    float4 m_72 [[user(locn5)]];
    float4 m_80 [[user(locn6)]];
    float4 m_84 [[user(locn7)]];
    float4 m_74 [[user(locn8)]];
    float4 m_49 [[user(locn9)]];
    float4 m_68 [[user(locn10)]];
    float4 m_78 [[user(locn11)]];
    float4 m_51 [[user(locn12)]];
    float4 m_82 [[user(locn13)]];
    float4 m_76 [[user(locn14)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_44 [[attribute(2)]];
    float4 m_46 [[attribute(3)]];
    float4 m_53 [[attribute(4)]];
    float4 m_58 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3071 = false;
    bool _677 = false;
    bool _575 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _98 = in.m_44.w;
    float _100 = in.m_46.w;
    float _102 = trunc(_98);
    int _105 = int(_102);
    float _107 = -_100;
    float _109 = _107 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_49.y = _109;
    bool _113 = _105 >= 1;
    float _115 = 0.0;
    float _117 = _100;
    float _119 = _109;
    if (!_113)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _121 = _115;
    if (!_113)
    {
        out.m_51.x = 0.0;
    }
    int _123 = 0;
    if (!_113)
    {
        float _125 = _121 * 5.0;
        _123 = as_type<int>(_125);
    }
    int _127 = _123;
    int _129 = _127;
    if (!_113)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3387 = as_type<float>(_127);
        out.gl_Position.z = _3387;
    }
    if (!_113)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _131 = _100 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _133 = isnan(_100);
    bool _135 = _131 || _133;
    bool _137 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _139 = _135 || _137;
    float _141 = float(_105);
    bool _143 = _109 >= _141;
    bool _145 = !_139;
    bool _147 = _143 || _145;
    if (_147)
    {
        _117 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _149 = _117;
    if (_147)
    {
        out.m_51.x = 0.0;
    }
    if (_147)
    {
        float _151 = _149 * 5.0;
        _129 = as_type<int>(_151);
    }
    int _153 = _129;
    if (_147)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3442 = as_type<float>(_153);
        out.gl_Position.z = _3442;
    }
    if (_147)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _155 = in.m_53.x;
    float _157 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _159 = _109 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _161 = as_type<float>(int(gl_VertexIndex));
    bool _163 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _165 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _167 = _163 || _165;
    bool _169 = isnan(1.0);
    bool _171 = _167 || _169;
    float _173 = _159 * _157;
    float _175 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[20].x, _173);
    float _177 = in.m_46.x;
    float _179 = in.m_46.y;
    float _181 = in.m_46.z;
    float _183 = floor(_175);
    float _185 = _175 * 6.283185482025146484375;
    int _187 = as_type<int>(_161) & 1;
    bool _189 = _187 != 0;
    int _191 = as_type<int>(_161) & 2;
    bool _193 = _191 != 0;
    float _195 = _109 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    int _197 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _199 = _197 != 0;
    float _201 = _185 * 0.15915493667125701904296875;
    bool _203 = !_189;
    float _205 = _203 ? (-0.5) : 0.5;
    float _207 = _201 * 6.283185482025146484375;
    float _209 = cos(_207);
    bool _211 = !_193;
    float _213 = _211 ? (-0.5) : 0.5;
    float _215 = -_183;
    float _217 = _175 + _215;
    float _219 = _183;
    float _221 = _195;
    if (!_171)
    {
        float _223 = _195 * _195;
        float _225 = _223 * 0.5;
        _219 = _225;
    }
    float _227 = _219;
    float _229 = _227;
    if (!_171)
    {
        float _231 = _227 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _229 = _231;
    }
    float _233 = _229;
    bool _235 = !_171;
    float _237 = _233;
    if (!_235)
    {
        float _239 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _241 = log2(_239);
        float _243 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _245 = _243 + 1.0;
        float _247 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _249 = _195 * _241;
        float _251 = 1.0 / _245;
        float _253 = _247 * 0.693147182464599609375;
        float _255 = exp2(_249);
        float _257 = 1.0 / _253;
        float _259 = _255 + (-1.0);
        float _261 = -_259;
        float _263 = fma(_261, _257, _195);
        float _265 = _263 * _251;
        float _267 = _265 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _237 = _267;
    }
    float _269 = _237;
    bool _271 = !_171;
    if (!_271)
    {
        float _273 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _275 = log2(_273);
        float _277 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _279 = _277 + 1.0;
        float _281 = 1.0 / _279;
        float _283 = _195 * _275;
        float _285 = exp2(_283);
        float _287 = -_285;
        float _289 = _287 + 1.0;
        float _291 = _289 * _281;
        _221 = _291;
    }
    float _293 = _221;
    float _295 = _269 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _297 = in.m_58.w;
    float _299 = _269 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _301 = _295 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _303 = in.m_44.x;
    float _305 = in.m_44.y;
    float _307 = in.m_44.z;
    float _309 = _295 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _311 = _295 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _313 = fma(_299, (*spvDescriptorSet0.vp_c10)._m0[8].x, _301);
    bool _315 = _217 < 0.5;
    float _317 = float(_315);
    float _319 = fma(_299, (*spvDescriptorSet0.vp_c10)._m0[8].y, _309);
    float _321 = fma(_299, (*spvDescriptorSet0.vp_c10)._m0[8].z, _311);
    float _323 = _269 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _325 = fma(_209, 0.5, 0.5);
    float _327 = -_217;
    float _329 = fma(_327, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _331 = -_317;
    float _333 = fma(_331, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _335 = fma(_323, (*spvDescriptorSet0.vp_c10)._m0[10].x, _313);
    float _337 = fma(_323, (*spvDescriptorSet0.vp_c10)._m0[10].y, _319);
    float _339 = fma(_323, (*spvDescriptorSet0.vp_c10)._m0[10].z, _321);
    float _341 = _321;
    float _343 = _339;
    if (!_171)
    {
        float _345 = _109 * _109;
        float _347 = _345 * 0.5;
        _341 = _347;
    }
    float _349 = _341;
    float _351 = fma(_293, _177, _335);
    float _353 = fma(_293, _179, _337);
    float _355 = -_325;
    float _357 = fma(_355, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _359 = fma(_293, _181, _339);
    float _361 = _349;
    if (!_171)
    {
        float _363 = _349 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _361 = _363;
    }
    float _365 = _361;
    bool _367 = !_171;
    float _369 = _365;
    if (!_367)
    {
        float _371 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _373 = log2(_371);
        float _375 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _377 = _109 * _373;
        float _379 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _381 = _379 + 1.0;
        float _383 = 1.0 / _381;
        float _385 = _375 * 0.693147182464599609375;
        float _387 = exp2(_377);
        float _389 = 1.0 / _385;
        float _391 = _387 + (-1.0);
        float _393 = -_391;
        float _395 = fma(_393, _389, _109);
        float _397 = _395 * _383;
        float _399 = _397 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _369 = _399;
        _343 = _387;
    }
    float _401 = _369;
    float _403 = _343;
    float _405 = _401 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _407 = fma(_351, _297, _303);
    float _409 = fma(_353, _297, _305);
    float _411 = _403;
    if (!_171)
    {
        _411 = _109;
    }
    float _413 = _411;
    bool _415 = !_171;
    float _417 = _413;
    if (!_415)
    {
        float _419 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _421 = log2(_419);
        float _423 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _425 = _423 + 1.0;
        float _427 = 1.0 / _425;
        float _429 = _109 * _421;
        float _431 = exp2(_429);
        float _433 = -_431;
        float _435 = _433 + 1.0;
        float _437 = _435 * _427;
        _417 = _437;
    }
    float _439 = _417;
    int _441 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _443 = _441 != 0;
    int _445 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _447 = _445 != 0;
    float _449 = fma(_359, _297, _307);
    float _451 = _401 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _453 = _405 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _455 = _405 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    bool _457 = !_443;
    int _459 = _457 ? 0 : 1;
    float _461 = _405 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _463 = fma(_451, (*spvDescriptorSet0.vp_c10)._m0[8].x, _453);
    float _465 = _401 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    int _467 = abs(_459);
    float _469 = fma(_451, (*spvDescriptorSet0.vp_c10)._m0[8].y, _455);
    float _471 = fma(_451, (*spvDescriptorSet0.vp_c10)._m0[8].z, _461);
    float _473 = fma(_465, (*spvDescriptorSet0.vp_c10)._m0[10].x, _463);
    bool _475 = !_199;
    int _477 = _475 ? 0 : 1;
    float _479 = fma(_465, (*spvDescriptorSet0.vp_c10)._m0[10].y, _469);
    float _481 = fma(_465, (*spvDescriptorSet0.vp_c10)._m0[10].z, _471);
    float _483 = float(_467);
    float _485 = fma(_439, _177, _473);
    float _487 = fma(_439, _179, _479);
    float _489 = fma(_439, _181, _481);
    bool _491 = !_447;
    int _493 = _491 ? 0 : 1;
    float _495 = abs(_329);
    float _497 = _483 * _495;
    bool _499 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _501 = 1.0 / _141;
    float _503 = -_487;
    float _505 = _353 + _503;
    int _507 = abs(_477);
    float _509 = -_489;
    float _511 = _359 + _509;
    int _513 = abs(_493);
    float _515 = _505 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _517 = _505 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _519 = _505 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _521 = float(_507);
    float _523 = -_485;
    float _525 = _351 + _523;
    float _527 = fma(_525, (*spvDescriptorSet0.vp_c10)._m0[5].x, _517);
    float _529 = float(_513);
    float _531 = fma(_525, (*spvDescriptorSet0.vp_c10)._m0[4].x, _515);
    float _533 = fma(_525, (*spvDescriptorSet0.vp_c10)._m0[6].x, _519);
    float _535 = fma(_521, _357, _497);
    float _537 = fma(_511, (*spvDescriptorSet0.vp_c10)._m0[5].z, _527);
    float _539 = fma(_511, (*spvDescriptorSet0.vp_c10)._m0[4].z, _531);
    float _541 = fma(_511, (*spvDescriptorSet0.vp_c10)._m0[6].z, _533);
    float _543 = abs(_333);
    float _545 = fma(_529, _543, _535);
    float _547 = _109 * _501;
    bool _549 = !_499;
    float _551 = _537;
    float _553 = _539;
    float _555 = _541;
    float _557 = _541;
    float _573;
    if (!_549)
    {
        float _559 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _561 = _155 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _563 = fma(_561, (*spvDescriptorSet0.vp_c9)._m0[12].x, _109);
        float _565 = _563 * _559;
        float _567 = floor(_565);
        float _569 = -_567;
        float _571 = _565 + _569;
        _573 = _571;
        _575 = true;
    }
    else
    {
        _573 = _547;
    }
    _575 = false;
    float _577 = _573;
    float _579 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _581 = _577 + _579;
    float _583 = in.m_58.x;
    float _585 = in.m_58.y;
    bool _587 = _577 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _589 = isnan(_577);
    bool _591 = _587 || _589;
    bool _593 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _595 = _591 || _593;
    float _597 = float(_595);
    float _599 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _601 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _599;
    bool _603 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _605 = 1.0 / _601;
    float _607 = -_597;
    float _609 = _607 + 1.0;
    float _611 = _581 * _605;
    bool _613 = _577 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _615 = isnan(_577);
    bool _617 = _613 || _615;
    bool _619 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _621 = _617 || _619;
    float _623 = float(_621);
    float _625 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _627 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _625;
    float _629 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _631 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _629;
    float _633 = _623 * _609;
    float _635 = fma(_627, _611, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _637 = fma(_631, _611, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _639 = -_623;
    float _641 = _639 + 1.0;
    float _643 = _635 * _633;
    float _645 = _637 * _633;
    float _647 = fma(_641, (*spvDescriptorSet0.vp_c9)._m0[143].x, _643);
    float _649 = fma(_641, (*spvDescriptorSet0.vp_c9)._m0[143].y, _645);
    float _651 = fma(_597, (*spvDescriptorSet0.vp_c9)._m0[144].x, _647);
    float _653 = fma(_597, (*spvDescriptorSet0.vp_c9)._m0[144].y, _649);
    float _655 = _651 * _583;
    float _657 = _653 * _585;
    bool _659 = !_603;
    float _675;
    if (!_659)
    {
        float _661 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _663 = _155 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _665 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[11].y, _109);
        float _667 = _665 * _661;
        float _669 = floor(_667);
        float _671 = -_669;
        float _673 = _667 + _671;
        _675 = _673;
        _677 = true;
    }
    else
    {
        _675 = _547;
    }
    _677 = false;
    float _679 = _675;
    float _681 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _683 = int(_681);
    float _685 = in.m_53.z;
    float _687 = _655 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _689 = _657 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _691 = _409 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _693 = _205 * _687;
    float _695 = _213 * _689;
    float _697 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _699 = int(_697);
    float _701 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _703 = fma(_407, (*spvDescriptorSet0.vp_c10)._m0[6].x, _691);
    float _705 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _707 = _705 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _709 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _711 = float(_683);
    float _713 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _715 = _713 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _717 = 1.0 / _707;
    float _719 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _721 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _723 = _547 + _721;
    float _725 = float(uint(_699));
    float _727 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _729 = _727 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    int _731 = ~_699;
    int _733 = _731 + 1;
    float _735 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _737 = _735 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _739 = 1.0 / _711;
    int _741 = ~_699;
    int _743 = _741 + 1;
    float _745 = 1.0 / _725;
    float _747 = in.m_53.y;
    float _749 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _751 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _749;
    float _753 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _755 = _753 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _757 = _755 * _717;
    float _759 = _109 * _739;
    float _761 = 1.0 / _715;
    float _763 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _765 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _763;
    float _767 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _769 = _767 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _771 = _679 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _773 = isnan(_679);
    bool _775 = _771 || _773;
    bool _777 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _779 = _775 || _777;
    float _781 = float(_779);
    int _783 = as_type<int>(_745) + (-2);
    float _785 = trunc(_759);
    int _787 = int(_785);
    float _789 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _791 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _789;
    bool _793 = _547 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _795 = isnan(_547);
    bool _797 = _793 || _795;
    bool _799 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _801 = _797 || _799;
    float _803 = float(_801);
    float _805 = -_781;
    float _807 = _805 + 1.0;
    int _809 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _811 = _809 != 0;
    float _813 = fma(_747, (*spvDescriptorSet0.vp_c9)._m0[78].w, _719);
    float _815 = 1.0 / _729;
    float _817 = _765 * _761;
    bool _819 = !_811;
    float _821 = _819 ? 1.2345600128173828125 : 1.0;
    float _823 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _825 = _823 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _827 = float(uint(_787));
    float _829 = 1.0 / _737;
    float _831 = 0.0;
    float _833 = _693;
    float _835 = _695;
    float _837 = _685;
    if (!_811)
    {
        _831 = _685;
    }
    float _839 = _831;
    float _841 = _839;
    if (_811)
    {
        _841 = _747;
    }
    float _843 = _841;
    float _845 = as_type<float>(_783) * _827;
    float _847 = _825 * _815;
    float _849 = trunc(_845);
    float _851 = precise::max(_849, 0.0);
    uint _854 = uint(_851);
    float _856 = 1.0 / _769;
    bool _858 = !_811;
    float _860 = _858 ? _747 : _155;
    float _862 = _821 * _860;
    int _864 = _733 * int(_854);
    int _866 = _864 + _787;
    float _868 = floor(_862);
    float _870 = float(uint(_866));
    float _872 = as_type<float>(_783) * _870;
    float _874 = float(_699);
    float _876 = trunc(_872);
    float _878 = precise::max(_876, 0.0);
    uint _880 = uint(_878);
    float _882 = -_868;
    float _884 = _862 + _882;
    int _886 = int(_854) + int(_880);
    float _888 = float(_787);
    int _890 = _743 * _886;
    int _892 = _890 + _787;
    bool _894 = _888 >= _874;
    bool _896 = isnan(_888);
    bool _898 = _894 || _896;
    bool _900 = isnan(_874);
    bool _902 = _898 || _900;
    float _904 = float(_902);
    float _906 = _884 * _874;
    bool _908 = uint(_892) >= uint(_699);
    float _910 = trunc(_906);
    int _912 = int(_910);
    bool _914 = !_908;
    int _916 = _914 ? 0 : (-1);
    int _918 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _920 = _918 != 0;
    int _922 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _924 = _922 != 0;
    int _926 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _928 = _926 != 0;
    int _930 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _932 = _930 != 0;
    float _934 = _109 * _874;
    int _936 = ~_886;
    int _938 = _936 + _916;
    int _940 = _938 + 1;
    float _942 = trunc(_904);
    int _944 = int(_942);
    bool _946 = _699 == 0;
    float _948 = _934 * _501;
    int _950 = _699 + (-1);
    int _952 = _699 * _940;
    int _954 = _952 + _787;
    bool _956 = !_924;
    int _958 = _956 ? 0 : 1;
    int _960 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _962 = _960 != 0;
    float _964 = trunc(_948);
    int _966 = int(_964);
    bool _968 = !_946;
    int _970 = _968 ? _954 : (-1);
    bool _972 = !_962;
    int _974 = _972 ? 0 : 1;
    int _976 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _978 = _976 != 0;
    int _980 = abs(_974);
    int _982 = ~_944;
    int _984 = _982 + 1;
    int _986 = _984 + 1;
    int _988 = _912 * _980;
    int _990 = _988 + _787;
    float _992 = fma(_449, (*spvDescriptorSet0.vp_c10)._m0[6].z, _703);
    int _994 = _970 * _986;
    int _996 = _944 * _950;
    int _998 = _996 + _994;
    bool _1000 = !_920;
    int _1002 = _1000 ? 0 : 1;
    float _1004 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1006 = _1004 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _1008 = abs(_958);
    float _1010 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1012 = _1010 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _1014 = !_928;
    int _1016 = _1014 ? 0 : 1;
    float _1018 = _992 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1020 = abs(_1002);
    int _1022 = _998 * _1008;
    int _1024 = abs(_1016);
    float _1026 = 1.0 / _1006;
    float _1028 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1030 = _1018 + _1028;
    bool _1032 = !_932;
    int _1034 = _1032 ? 0 : 1;
    int _1036 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1038 = _1036 != 0;
    int _1040 = _966 * _1020;
    int _1042 = _1040 + _1022;
    int _1044 = abs(_1034);
    float _1046 = 1.0 / _1012;
    int _1048 = ~_699;
    int _1050 = _1048 + 1;
    int _1052 = _990 * _1024;
    int _1054 = _1052 + _1042;
    bool _1056 = _155 > 0.5;
    bool _1058 = _747 > 0.5;
    int _1060 = _912 * _1044;
    int _1062 = _1060 + _1054;
    float _1064 = as_type<float>(_1008);
    float _1066 = as_type<float>(_990);
    if (_978)
    {
        float _1068 = -_693;
        float _1070 = _1056 ? _1068 : _693;
        _833 = _1070;
    }
    float _1072 = _833;
    float _1074 = _409 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _1076 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1078 = _1076 != 0;
    float _1080 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1082 = float(uint(_1062));
    float _1084 = fma(_407, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1074);
    if (_1038)
    {
        float _1086 = -_695;
        float _1088 = _1058 ? _1086 : _695;
        _835 = _1088;
    }
    float _1090 = _835;
    float _1092 = _751 * _1026;
    int _1094 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1096 = _1094 != 0;
    float _1098 = as_type<float>(_783) * _1082;
    int _1100 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1102 = _1100 != 0;
    float _1104 = _409 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1106 = _155 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1108 = trunc(_1098);
    float _1110 = precise::max(_1108, 0.0);
    uint _1112 = uint(_1110);
    float _1114 = fma(_449, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1084);
    float _1116 = fma(_407, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1104);
    float _1118 = -_701;
    float _1120 = fma(_1106, 2.0, _1118);
    float _1122 = _747 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1124 = _213 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    if (!_811)
    {
        _1064 = _747;
    }
    float _1126 = _1064;
    float _1128 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1130 = in.m_53.w;
    float _1132 = fma(_1122, -2.0, _709);
    float _1134 = _1124 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1136 = fma(_449, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1116);
    float _1138 = _1126;
    if (_811)
    {
        _1138 = _155;
    }
    float _1140 = _1138;
    float _1142 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1128);
    int _1144 = _1050 * int(_1112);
    int _1146 = _1144 + _1062;
    float _1148 = _1124 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1150 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1152 = _1150 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1154 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1156 = float(uint(_1146));
    float _1158 = _1114 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1160 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1162 = _1136 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1164 = as_type<float>(_783) * _1156;
    float _1166 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1168 = _1158 + _1166;
    float _1170 = 1.0 / _1152;
    float _1172 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1174 = _1172 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1176 = _1160 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1178 = _1168 * _1168;
    float _1180 = _1140 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1182 = trunc(_1164);
    float _1184 = precise::max(_1182, 0.0);
    uint _1186 = uint(_1184);
    float _1188 = 1.0 / _1174;
    int _1190 = int(_1112) + int(_1186);
    int _1192 = ~_699;
    int _1194 = _1192 + 1;
    int _1196 = _1194 * _1190;
    int _1198 = _1196 + _1062;
    float _1200 = _791 * _1188;
    bool _1202 = _547 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _1204 = isnan(_547);
    bool _1206 = _1202 || _1204;
    bool _1208 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _1210 = _1206 || _1208;
    float _1212 = float(_1210);
    bool _1214 = uint(_1198) >= uint(_699);
    float _1216 = _205 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _1218 = !_1214;
    int _1220 = _1218 ? 0 : (-1);
    float _1222 = fma(_1216, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1148);
    bool _1224 = _685 > 0.5;
    if (_811)
    {
        _837 = _747;
    }
    float _1226 = _837;
    float _1228 = _1124 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _1230 = _1130 > 0.5;
    float _1232 = fma(_1216, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1134);
    float _1234 = fma(_1216, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1228);
    float _1236 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1238 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1240 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1242 = _1236 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1244 = _1238 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_60.x = _1242;
    out.m_60.y = _1244;
    out.m_60.z = _1176;
    out.m_60.w = _1240;
    float _1246 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1248 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _1246;
    float _1250 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _1252 = _1250 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1254 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1256 = _1254 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    float _1258 = fma(_109, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1132);
    float _1260 = _1248 * _1046;
    float _1262 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1264 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _1262;
    float _1266 = _1252 * _1170;
    float _1268 = 1.0 / _1256;
    float _1270 = _1080 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1272 = _1264 * _829;
    float _1274 = _1072 + 0.5;
    float _1276 = _1154 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1278 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1280 = _547 + _1278;
    float _1282 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _1284 = _1282 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1286 = -_109;
    float _1288 = fma(_1286, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1120);
    float _1290 = _1090 + (-0.5);
    float _1292 = fma(_847, _1280, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    float _1294 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1296 = _547 + _1294;
    float _1298 = fma(_1270, _1274, _1288);
    float _1300 = -_1276;
    float _1302 = -_1258;
    float _1304 = fma(_1300, _1290, _1302);
    float _1306 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1308 = _679 + _1306;
    float _1310 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1312 = _679 + _1310;
    float _1314 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1316 = _547 + _1314;
    float _1318 = fma(_1260, _1296, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _1320 = fma(_757, _1308, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1322 = fma(_1200, _1312, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1324 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1326 = _547 + _1324;
    float _1328 = fma(_817, _1316, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    float _1330 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1332 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _1330;
    float _1334 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1336 = _547 + _1334;
    float _1338 = fma(_1266, _1326, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    float _1340 = _1284 * _856;
    float _1342 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1344 = _679 + _1342;
    bool _1346 = _547 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _1348 = isnan(_547);
    bool _1350 = _1346 || _1348;
    bool _1352 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _1354 = _1350 || _1352;
    float _1356 = float(_1354);
    float _1358 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1360 = _547 + _1358;
    float _1362 = fma(_1272, _1336, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    float _1364 = fma(_1092, _1344, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1366 = _547 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _1368 = isnan(_547);
    bool _1370 = _1366 || _1368;
    bool _1372 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _1374 = _1370 || _1372;
    float _1376 = float(_1374);
    float _1378 = fma(_1340, _1360, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _1380 = -_1356;
    float _1382 = _1380 + 1.0;
    bool _1384 = _547 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1386 = isnan(_547);
    bool _1388 = _1384 || _1386;
    bool _1390 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _1392 = _1388 || _1390;
    float _1394 = float(_1392);
    float _1396 = _1332 * _1268;
    bool _1398 = _679 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1400 = isnan(_679);
    bool _1402 = _1398 || _1400;
    bool _1404 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1406 = _1402 || _1404;
    float _1408 = float(_1406);
    bool _1410 = _679 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1412 = isnan(_679);
    bool _1414 = _1410 || _1412;
    bool _1416 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1418 = _1414 || _1416;
    float _1420 = float(_1418);
    float _1422 = -_1394;
    float _1424 = _1422 + 1.0;
    bool _1426 = _679 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1428 = isnan(_679);
    bool _1430 = _1426 || _1428;
    bool _1432 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1434 = _1430 || _1432;
    float _1436 = float(_1434);
    float _1438 = _1376 * _1382;
    float _1440 = -_1376;
    float _1442 = _1440 + 1.0;
    bool _1444 = _547 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1446 = isnan(_547);
    bool _1448 = _1444 || _1446;
    bool _1450 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _1452 = _1448 || _1450;
    float _1454 = float(_1452);
    float _1456 = fma(_1396, _723, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    float _1458 = -_1436;
    float _1460 = _1458 + 1.0;
    float _1462 = _1394 * _1442;
    bool _1464 = _547 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _1466 = isnan(_547);
    bool _1468 = _1464 || _1466;
    bool _1470 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _1472 = _1468 || _1470;
    float _1474 = float(_1472);
    float _1476 = _1454 * _1424;
    float _1478 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1480 = _1162 + _1478;
    float _1482 = -_1454;
    float _1484 = _1482 + 1.0;
    bool _1486 = _547 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _1488 = isnan(_547);
    bool _1490 = _1486 || _1488;
    bool _1492 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _1494 = _1490 || _1492;
    float _1496 = float(_1494);
    float _1498 = -_1474;
    float _1500 = _1498 + 1.0;
    float _1502 = fma(_1480, _1480, _1178);
    float _1504 = _1474 * _1484;
    float _1506 = _1420 * _1460;
    float _1508 = -_1420;
    float _1510 = _1508 + 1.0;
    float _1512 = fma(_1030, _1030, _1502);
    float _1514 = _803 * _1500;
    float _1516 = -_803;
    float _1518 = _1516 + 1.0;
    float _1520 = _781 * _1510;
    float _1522 = sqrt(_1512);
    float _1524 = _1408 * _807;
    float _1526 = _1212 * _1518;
    float _1528 = -_1212;
    float _1530 = _1528 + 1.0;
    float _1532 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1534 = _1364 * _1524;
    float _1536 = _1496 * _1530;
    float _1538 = fma(_843, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1532);
    float _1540 = rsqrt(_1512);
    float _1542 = _687 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _1544 = _1328 * _1536;
    float _1546 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1548 = float(uint(_990));
    float _1550 = _1522 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _1552 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1554 = as_type<float>(_783) * _1548;
    float _1556 = _1226 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1558 = precise::min(_1542, _1550);
    float _1560 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1562 = -_1552;
    float _1564 = fma(_1180, 2.0, _1562);
    float _1566 = trunc(_1554);
    float _1568 = precise::max(_1566, 0.0);
    uint _1570 = uint(_1568);
    float _1572 = _1540 * _1558;
    float _1574 = fma(_1140, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1560);
    float _1576 = _1168 * _1572;
    float _1578 = _1480 * _1572;
    float _1580 = -_1576;
    float _1582 = _1168 + _1580;
    float _1584 = -_1578;
    float _1586 = _1480 + _1584;
    float _1588 = fma(_1556, -2.0, _1546);
    int _1590 = ~_699;
    int _1592 = _1590 + 1;
    float _1594 = _1582 * _1582;
    float _1596 = -_1408;
    float _1598 = _1596 + 1.0;
    float _1600 = _1030 * _1572;
    float _1602 = fma(_1586, _1586, _1594);
    float _1604 = -_1496;
    float _1606 = _1604 + 1.0;
    float _1608 = -_1600;
    float _1610 = _1030 + _1608;
    int _1612 = ~_1190;
    int _1614 = _1612 + _1220;
    int _1616 = _1614 + 1;
    float _1618 = fma(_1598, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1534);
    float _1620 = fma(_1606, (*spvDescriptorSet0.vp_c9)._m0[151].x, _1544);
    int _1622 = _1592 * int(_1570);
    int _1624 = _1622 + _990;
    float _1626 = fma(_1610, _1610, _1602);
    float _1628 = -_205;
    int _1630 = _1224 ? as_type<int>(_1628) : as_type<int>(_205);
    float _1632 = fma(_1292, _1526, _1620);
    int _1634 = _699 * _1616;
    int _1636 = _1634 + _1062;
    float _1638 = sqrt(_1626);
    float _1640 = float(uint(_1624));
    float _1642 = fma(_1320, _1520, _1618);
    bool _1644 = !_1096;
    float _1646 = _1644 ? _205 : as_type<float>(_1630);
    float _1648 = fma(_1318, _1514, _1632);
    float _1650 = -_213;
    int _1652 = _1230 ? as_type<int>(_1650) : as_type<int>(_213);
    float _1654 = as_type<float>(_783) * _1640;
    bool _1656 = !_946;
    int _1658 = _1656 ? _1636 : (-1);
    float _1660 = -_109;
    float _1662 = fma(_1660, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1564);
    bool _1664 = !_1102;
    float _1666 = _1664 ? _213 : as_type<float>(_1652);
    float _1668 = _1646 + 0.5;
    int _1670 = _1658 >> 31;
    float _1672 = trunc(_1654);
    float _1674 = precise::max(_1672, 0.0);
    uint _1676 = uint(_1674);
    float _1678 = fma(_109, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1588);
    float _1680 = fma(_1668, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1662);
    int _1682 = _1670 & 3;
    float _1684 = fma(_1338, _1504, _1648);
    float _1686 = fma(_1322, _1506, _1642);
    float _1688 = _1540 * _1638;
    int _1690 = _1658 + _1682;
    float _1692 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _213);
    float _1694 = fma(_1362, _1476, _1684);
    float _1696 = _689 * _1688;
    int _1698 = _1690 >> 2;
    float _1700 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _205);
    float _1702 = _687 * _1688;
    float _1704 = _1696 * _1692;
    int _1706 = _1698 << 4;
    int _1708 = _1706 + 512;
    float _1710 = _1666 + (-0.5);
    float _1712 = _1702 * _1700;
    float _1714 = _1704 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    uint _1716 = uint(int(uint(_1708) >> uint(2)));
    uint _1718 = uint(int(uint(int(_1716)) >> uint(2)));
    int _1720 = int(_1716) & 3;
    float _1722 = (*spvDescriptorSet0.vp_c9)._m0[int(_1718)][_1720];
    int _1724 = int(_1716) + 1;
    uint _1726 = uint(int(uint(_1724) >> uint(2)));
    int _1728 = _1724 & 3;
    float _1730 = (*spvDescriptorSet0.vp_c9)._m0[int(_1726)][_1728];
    float _1732 = _1704 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1734 = -_1710;
    float _1736 = -_1678;
    float _1738 = fma(_1734, (*spvDescriptorSet0.vp_c9)._m0[85].y, _1736);
    float _1740 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1714);
    int _1742 = int(_1570) + int(_1676);
    float _1744 = _1688 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1746 = _1744 * 0.5;
    int _1748 = ~_699;
    int _1750 = _1748 + 1;
    float _1752 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1732);
    float _1754 = fma(_1436, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1686);
    float _1756 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1740);
    float _1758 = fma(_1378, _1462, _1694);
    float _1760 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1752);
    int _1762 = _1750 * _1742;
    int _1764 = _1762 + _990;
    int _1766 = _1708 + 8;
    uint _1768 = uint(int(uint(_1766) >> uint(2)));
    uint _1770 = uint(int(uint(int(_1768)) >> uint(2)));
    int _1772 = int(_1768) & 3;
    float _1774 = (*spvDescriptorSet0.vp_c9)._m0[int(_1770)][_1772];
    int _1776 = int(_1768) + 1;
    uint _1778 = uint(int(uint(_1776) >> uint(2)));
    int _1780 = _1776 & 3;
    float _1782 = (*spvDescriptorSet0.vp_c9)._m0[int(_1778)][_1780];
    int _1784 = _1658 & 3;
    bool _1786 = _1784 != 0;
    float _1788 = _1760 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1790 = _1756 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    bool _1792 = uint(_1764) >= uint(_699);
    float _1794 = _1704 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _1796 = uint(_1784) > 1u;
    float _1798 = _1018 + _1788;
    int _1800 = _1658 & 3;
    bool _1802 = _1800 != 0;
    float _1804 = _1162 + _1790;
    bool _1806 = !_1792;
    int _1808 = _1806 ? 0 : (-1);
    float _1810 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1812 = _1798 + _1810;
    int _1814 = _1802 ? 0 : 1;
    float _1816 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1818 = _1804 + _1816;
    int _1820 = ~_1742;
    int _1822 = _1820 + _1808;
    int _1824 = _1822 + 1;
    float _1826 = _1812 * _1812;
    int _1828 = ~_1814;
    int _1830 = _1828 + 1;
    int _1832 = _1830 + 1;
    bool _1834 = _1784 != 3;
    int _1836 = _699 * _1824;
    int _1838 = _1836 + _990;
    int _1840 = _1832;
    float _1842 = _1804;
    if (!_1796)
    {
        int _1844 = ~_1814;
        int _1846 = _1844 + 1;
        _1840 = _1846;
    }
    int _1848 = _1840;
    float _1850 = fma(_1818, _1818, _1826);
    bool _1852 = uint(_1784) >= 2u;
    float _1854 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1794);
    int _1856 = abs(_1848);
    float _1858 = sqrt(_1850);
    int _1860 = _1852 ? 0 : 1;
    float _1862 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1854);
    bool _1864 = !_1786;
    int _1866 = _1864 ? 0 : 1;
    bool _1868 = _1784 != 3;
    int _1870 = ~_1860;
    int _1872 = _1870 + 1;
    int _1874 = _1872 + 1;
    int _1876 = _1874;
    if (_1834)
    {
        int _1878 = ~_1860;
        int _1880 = _1878 + 1;
        _1876 = _1880;
    }
    int _1882 = _1876;
    int _1884 = ~_1856;
    int _1886 = _1884 + 1;
    int _1888 = _1886 + 1;
    bool _1890 = !_1868;
    int _1892 = _1890 ? 0 : (-1);
    int _1894 = abs(_1866);
    int _1896 = _1888 * as_type<int>(_1730);
    int _1898 = abs(_1882);
    int _1900 = abs(_1892);
    int _1902 = ~_1894;
    int _1904 = _1902 + 1;
    int _1906 = _1904 + 1;
    bool _1908 = !_1078;
    int _1910 = _1908 ? 0 : 1;
    int _1912 = _1906 * as_type<int>(_1722);
    int _1914 = _1912 + _1896;
    bool _1916 = _1858 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1918 = ~_1898;
    int _1920 = _1918 + 1;
    int _1922 = _1920 + 1;
    int _1924 = abs(_1910);
    float _1926 = _1862 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _1928 = ~_1900;
    int _1930 = _1928 + 1;
    int _1932 = _1930 + 1;
    int _1934 = _1922 * as_type<int>(_1774);
    int _1936 = _1934 + _1914;
    float _1938 = _1158 + _1926;
    int _1940 = _1932 * as_type<int>(_1782);
    int _1942 = _1940 + _1936;
    int _1944 = ~_1924;
    int _1946 = _1944 + 1;
    int _1948 = _1946 + 1;
    float _1950 = _1782;
    if (!_1916)
    {
        _1066 = _1798;
    }
    float _1952 = _1066;
    float _1954 = _1952;
    if (!_1916)
    {
        _1950 = _1938;
    }
    float _1956 = _1950;
    bool _1958 = !_1916;
    float _1960 = _1956;
    if (!_1958)
    {
        float _1962 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1964 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1966 = _1858 + _1964;
        float _1968 = _1938 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1970 = rsqrt(_1850);
        float _1972 = _1966 * _1962;
        float _1974 = _1972 * 0.15915493667125701904296875;
        float _1976 = _1974 * 6.283185482025146484375;
        float _1978 = cos(_1976);
        float _1980 = _1974 * 6.283185482025146484375;
        float _1982 = sin(_1980);
        float _1984 = _1978 + (-1.0);
        float _1986 = _1984 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1988 = fma(_1982, _1968, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1990 = fma(_1938, _1978, _1986);
        float _1992 = _1970 * _1988;
        float _1994 = fma(_1818, _1992, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1996 = fma(_1812, _1992, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1960 = _1990;
        _1842 = _1994;
        _1954 = _1996;
    }
    float _1998 = _1960;
    float _2000 = _1842;
    float _2002 = _1954;
    float _2004 = fma(_109, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1142);
    float _2006 = fma(_109, (*spvDescriptorSet0.vp_c9)._m0[77].w, _813);
    int _2008 = _1942 * _1948;
    float _2010 = fma(_109, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1574);
    float _2012 = -_2004;
    float _2014 = _2012 + 1.0;
    float _2016 = -_2006;
    float _2018 = _2016 + 1.0;
    float _2020 = fma(_109, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1538);
    float _2022 = -_2010;
    float _2024 = _2022 + 1.0;
    float _2026 = -_2014;
    float _2028 = fma(_2026, _1072, _1298);
    float _2030 = fma(_2018, _1090, _1304);
    float _2032 = -_1158;
    float _2034 = _2032 + _1998;
    float _2036 = -_2020;
    float _2038 = _2036 + 1.0;
    float _2040 = -_1162;
    float _2042 = _2040 + _2000;
    float _2044 = _2034 * _2034;
    float _2046 = -_2024;
    float _2048 = fma(_1646, _2046, _1680);
    float _2050 = fma(_1666, _2038, _1738);
    float _2052 = -_1018;
    float _2054 = _2052 + _2002;
    float _2056 = fma(_2042, _2042, _2044);
    float _2058 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _2060 = !_946;
    int _2062 = _2060 ? _1838 : (-1);
    float _2064 = fma(_1456, _1438, _1758);
    float _2066 = fma(_2054, _2054, _2056);
    float _2068 = _2058 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2070 = sqrt(_2066);
    int _2072 = _2062 * _1924;
    int _2074 = _2072 + _2008;
    float _2076 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2078 = _1754 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2080 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2082 = fma(_1356, (*spvDescriptorSet0.vp_c9)._m0[158].x, _2064);
    float _2084 = _2076 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2086 = _1232 + (*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _2088 = _2080 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2090 = _1222 + (*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _2092 = float(_2074);
    float _2094 = _1234 + (*spvDescriptorSet0.vp_c8)._m0[26].z;
    out.m_62.w = _1558;
    float _2096 = -_1578;
    float _2098 = _1162 + _2096;
    float _2100 = -_1600;
    float _2102 = _1018 + _2100;
    out.m_64.x = _2084;
    out.m_64.y = _2088;
    out.m_64.z = _2068;
    out.m_64.w = _2078;
    bool _2104 = _2070 > 0.0;
    out.m_66.x = _2082;
    out.m_68.x = _1702;
    out.m_70.y = _2092;
    out.m_72.x = _2086;
    out.m_72.y = _2090;
    out.m_72.z = _2094;
    out.m_74.x = _2028;
    out.m_74.y = _2030;
    out.m_74.z = _2048;
    out.m_74.w = _2050;
    float _2106 = -_1576;
    float _2108 = _2106 + _1998;
    float _2110 = -_1578;
    float _2112 = _2110 + _2000;
    float _2114 = -_1600;
    float _2116 = _2114 + _2002;
    float _2118 = -_1576;
    float _2120 = _1158 + _2118;
    bool _2122 = !_2104;
    float _2124 = _2088;
    float _2126 = _2084;
    float _2128 = _2108;
    float _2130 = _2112;
    float _2132 = _2116;
    float _2134 = _2088;
    float _2136 = _2068;
    float _2138 = _2084;
    if (!_2122)
    {
        bool _2140 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2142 = _2050;
        if (_2140)
        {
            float _2144 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2142 = _2144;
        }
        float _2146 = _2142;
        float _2148 = _2146;
        if (_2140)
        {
            float _2150 = _539 * _2146;
            _2124 = _2150;
        }
        float _2152 = _2124;
        float _2154 = _2152;
        if (_2140)
        {
            float _2156 = _537 * _2146;
            _2126 = _2156;
        }
        float _2158 = _2126;
        float _2160 = _2158;
        if (_2140)
        {
            float _2162 = _541 * _2146;
            _2148 = _2162;
        }
        float _2164 = _2148;
        float _2166 = _2164;
        if (!_2140)
        {
            float _2168 = _109 + 1.0;
            if (!_171)
            {
                float _2170 = _2168 * _2168;
                float _2172 = _2170 * 0.5;
                _119 = _2172;
            }
            float _2174 = _119;
            float _2176 = _2174;
            if (!_171)
            {
                float _2178 = _2174 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2176 = _2178;
            }
            float _2180 = _2176;
            bool _2182 = !_171;
            float _2184 = _2180;
            if (!_2182)
            {
                float _2186 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2188 = log2(_2186);
                float _2190 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2192 = _2190 + 1.0;
                float _2194 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2196 = _2188 * _2168;
                float _2198 = 1.0 / _2192;
                float _2200 = _2194 * 0.693147182464599609375;
                float _2202 = exp2(_2196);
                float _2204 = 1.0 / _2200;
                float _2206 = _2202 + (-1.0);
                float _2208 = -_2206;
                float _2210 = fma(_2208, _2204, _2168);
                float _2212 = _2210 * _2198;
                float _2214 = _2212 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2184 = _2214;
            }
            float _2216 = _2184;
            float _2218 = _2216 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _2220 = _2216 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _2222 = _2216 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _2224 = _2218 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
            float _2226 = _2218 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
            float _2228 = _2218 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
            float _2230 = fma(_2220, (*spvDescriptorSet0.vp_c10)._m0[8].y, _2224);
            float _2232 = fma(_2220, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2226);
            float _2234 = _2226;
            if (!_171)
            {
                _2234 = _2168;
            }
            float _2236 = _2234;
            float _2238 = fma(_2222, (*spvDescriptorSet0.vp_c10)._m0[10].y, _2230);
            bool _2240 = !_171;
            float _2242 = _2236;
            if (!_2240)
            {
                float _2244 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2246 = log2(_2244);
                float _2248 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2250 = _2248 + 1.0;
                float _2252 = 1.0 / _2250;
                float _2254 = _2246 * _2168;
                float _2256 = exp2(_2254);
                float _2258 = -_2256;
                float _2260 = _2258 + 1.0;
                float _2262 = _2260 * _2252;
                _2242 = _2262;
            }
            float _2264 = _2242;
            float _2266 = fma(_2220, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2228);
            float _2268 = fma(_2222, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2232);
            float _2270 = fma(_2264, _179, _2238);
            float _2272 = fma(_2222, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2266);
            float _2274 = fma(_2264, _177, _2268);
            float _2276 = -_487;
            float _2278 = _2276 + _2270;
            float _2280 = fma(_2264, _181, _2272);
            float _2282 = -_485;
            float _2284 = _2282 + _2274;
            float _2286 = _2278 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _2288 = _2278 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _2290 = _2278 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _2292 = -_489;
            float _2294 = _2292 + _2280;
            float _2296 = fma(_2284, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2286);
            float _2298 = fma(_2284, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2288);
            float _2300 = fma(_2284, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2290);
            float _2302 = fma(_2294, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2296);
            float _2304 = fma(_2294, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2298);
            float _2306 = fma(_2294, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2300);
            _551 = _2304;
            _553 = _2302;
            _555 = _2306;
            _2154 = _2302;
            _2160 = _2304;
            _2166 = _2306;
        }
        float _2308 = _551;
        float _2310 = _553;
        float _2312 = _555;
        float _2314 = _2154;
        float _2316 = _2160;
        float _2318 = _2166;
        float _2320 = _2308 * _2308;
        float _2322 = rsqrt(_2066);
        float _2324 = fma(_2310, _2310, _2320);
        float _2326 = fma(_2312, _2312, _2324);
        float _2328 = sqrt(_2326);
        float _2330 = _2042 * _2322;
        float _2332 = _2034 * _2322;
        float _2334 = _2054 * _2322;
        bool _2336 = _2328 > 0.0;
        bool _2338 = !_2336;
        _2134 = _2314;
        _2136 = _2330;
        _2138 = _2316;
        _557 = _2312;
        if (!_2338)
        {
            float _2340 = rsqrt(_2326);
            float _2342 = _2340 * _2308;
            float _2344 = _2340 * _2310;
            float _2346 = _2340 * _2312;
            float _2348 = _2332 * _2342;
            float _2350 = fma(_2330, _2344, _2348);
            float _2352 = fma(_2334, _2346, _2350);
            float _2354 = _2352 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2356 = fma(_2314, _2354, _2112);
            float _2358 = fma(_2316, _2354, _2108);
            float _2360 = fma(_2318, _2354, _2116);
            _2128 = _2358;
            _2130 = _2356;
            _2132 = _2360;
        }
    }
    float _2362 = _2128;
    float _2364 = _2130;
    float _2366 = _2132;
    float _2368 = _2134;
    float _2370 = _2136;
    float _2372 = _2138;
    float _2374 = _557;
    float _2376 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2378 = _2362 + _2376;
    float _2380 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2382 = _2364 + _2380;
    float _2384 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2386 = _2366 + _2384;
    float _2388 = _2378 * _2378;
    float _2390 = fma(_2382, _2382, _2388);
    float _2392 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2394 = fma(_2386, _2386, _2390);
    float _2396 = rsqrt(_2394);
    float _2398 = sqrt(_2394);
    float _2400 = _2396 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2402 = _2382 * _2400;
    float _2404 = _2386 * _2400;
    float _2406 = _2402 * _2402;
    float _2408 = _2404 * _2404;
    float _2410 = _2406 + _2408;
    float _2412 = sqrt(_2410);
    bool _2414 = _2412 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2416 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2418 = _2412 + _2416;
    float _2420 = _2368;
    float _2422 = _2418;
    float _2424 = _2370;
    float _2426 = _2378;
    float _2428 = _2374;
    float _2430 = _2402;
    if (_2414)
    {
        float _2432 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2420 = _2432;
    }
    float _2434 = _2420;
    float _2436 = _2434;
    if (_2414)
    {
        float _2438 = _2418 * _2434;
        _2422 = _2438;
    }
    float _2440 = _2422;
    if (_2414)
    {
        float _2442 = rsqrt(_2410);
        _2436 = _2442;
    }
    float _2444 = _2436;
    float _2446 = _2444;
    if (_2414)
    {
        float _2448 = _2440 * 0.15915493667125701904296875;
        _2424 = _2448;
    }
    float _2450 = _2424;
    float _2452 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2454 = _2386;
    if (_2414)
    {
        float _2456 = _2450 * 6.283185482025146484375;
        float _2458 = sin(_2456);
        _2454 = _2458;
    }
    float _2460 = _2454;
    float _2462 = _2362 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2464 = precise::max(0.0, _2452);
    float _2466 = _2372;
    float _2468 = _2464;
    if (_2414)
    {
        float _2470 = _2450 * 6.283185482025146484375;
        float _2472 = cos(_2470);
        _2466 = _2472;
    }
    float _2474 = _2466;
    float _2476 = -_2400;
    float _2478 = -_2464;
    float _2480 = fma(_2378, _2476, _2478);
    float _2482 = fma(_2364, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2462);
    if (_2414)
    {
        float _2484 = _2480 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2426 = _2484;
    }
    float _2486 = _2426;
    float _2488 = fma(_2366, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2482);
    float _2490 = _2460;
    float _2492 = _2486;
    if (_2414)
    {
        float _2494 = fma(_2460, _2486, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2490 = _2494;
    }
    float _2496 = _2490;
    float _2498 = _2496;
    if (!_2414)
    {
        _2492 = _2480;
    }
    float _2500 = _2492;
    float _2502 = _2488 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2504 = _2500;
    if (_2414)
    {
        float _2506 = _2444 * _2496;
        _2428 = _2506;
    }
    float _2508 = _2428;
    if (!_2414)
    {
        _2498 = _2406;
    }
    float _2510 = _2498;
    float _2512 = _2362 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2514 = _2510;
    float _2516 = _2474;
    if (_2414)
    {
        float _2518 = _2474 + (-1.0);
        _2468 = _2518;
    }
    float _2520 = _2468;
    float _2522 = _2520;
    if (_2414)
    {
        float _2524 = _2402 * _2508;
        _2430 = _2524;
    }
    float _2526 = _2430;
    float _2528 = fma(_2364, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2512);
    if (_2414)
    {
        float _2530 = _2520 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2446 = _2530;
    }
    float _2532 = _2446;
    if (!_2414)
    {
        _2522 = _2404;
    }
    float _2534 = _2522;
    float _2536 = _2534;
    if (_2414)
    {
        float _2538 = _2404 * _2508;
        _2536 = _2538;
    }
    float _2540 = _2536;
    if (_2414)
    {
        float _2542 = _2526 * _2526;
        _2514 = _2542;
    }
    float _2544 = _2514;
    if (_2414)
    {
        float _2546 = fma(_2480, _2474, _2532);
        _2504 = _2546;
    }
    float _2548 = _2504;
    if (!_2414)
    {
        _2516 = _2408;
    }
    float _2550 = _2516;
    float _2552 = _2550;
    if (_2414)
    {
        float _2554 = _2540 * _2540;
        _2552 = _2554;
    }
    float _2556 = _2552;
    float _2558 = _2362 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2560 = fma(_2548, _2548, _2544);
    float _2562 = fma(_2366, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2528);
    float _2564 = fma(_2364, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2558);
    float _2566 = _2560 + _2556;
    float _2568 = _2362 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2570 = fma(_2366, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2564);
    float _2572 = _2562 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2574 = rsqrt(_2566);
    float _2576 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2578 = fma(_2398, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2576);
    float _2580 = precise::clamp(_2578, 0.0, 1.0);
    float _2582 = fma(_2364, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2568);
    float _2584 = _2570 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2586 = -_2580;
    float _2588 = _2586 + 1.0;
    float _2590 = fma(_2366, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2582);
    float _2592 = _2572 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2594 = _2590 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2596 = abs(_2588);
    float _2598 = log2(_2596);
    float _2600 = -_2592;
    float _2602 = fma(_2600, _2392, 1.0);
    float _2604 = _2594 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2606 = _2574 * _2526;
    float _2608 = _2574 * _2548;
    float _2610 = _2574 * _2540;
    float _2612 = fma(_2584, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2604);
    float _2614 = _2606 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2616 = _2594 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2618 = log2(_2602);
    float _2620 = fma(_2572, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2612);
    float _2622 = -_2614;
    float _2624 = fma(_2608, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2622);
    float _2626 = fma(_2584, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2616);
    float _2628 = _2598 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2630 = -_2610;
    float _2632 = fma(_2630, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2624);
    float _2634 = fma(_2502, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2620);
    float _2636 = _2594 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2638 = exp2(_2628);
    float _2640 = fma(_2632, -0.5, 0.5);
    float _2642 = fma(_2632, 0.5, 0.5);
    float _2644 = fma(_2584, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2636);
    float _2646 = _2608 + 1.0;
    float _2648 = fma(_2572, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2626);
    float _2650 = fma(_2642, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2652 = fma(_2572, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2644);
    float _2654 = 1.0 / _2634;
    float _2656 = _2618 * 0.693147182464599609375;
    float _2658 = fma(_2642, _2650, -0.212114393711090087890625);
    float _2660 = _2656 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2662 = fma(_2642, _2658, 1.570728778839111328125);
    float _2664 = sqrt(_2640);
    float _2666 = -_2608;
    float _2668 = fma(_2638, _2646, _2666);
    float _2670 = fma(_2502, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2648);
    float _2672 = fma(_2502, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2652);
    float _2674 = fma(_2668, 0.5, 0.5);
    float _2676 = _2670 * _2654;
    float _2678 = _2672 * _2654;
    float _2680 = fma(_2676, 0.5, 0.5);
    float _2682 = fma(_2678, -0.5, 0.5);
    float _2684 = _2664 * 0.636619746685028076171875;
    float _2686 = -_2662;
    float _2688 = fma(_2684, _2686, 1.0);
    float3 _7410 = float3(_2680, _2682, _2660);
    float _2690 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7410, float3(0.0), isnan(_7410)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7410, float3(0.0), isnan(_7410)), level(0.0)).x;
    float3 _7421 = float3(_2680, _2682, _2660);
    float4 _2693 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7421, float3(0.0), isnan(_7421)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7421, float3(0.0), isnan(_7421)), level(0.0)).xyzw;
    float _2695 = _2693.x;
    float _2697 = _2693.y;
    float _2699 = _2693.z;
    float _2701 = _2693.w;
    float2 _7438 = float2(_2688, _2674);
    float3 _2705 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7438, float2(0.0), isnan(_7438)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7438, float2(0.0), isnan(_7438)), level(0.0)).xyz;
    float _2707 = _2705.x;
    float _2709 = _2705.y;
    float _2711 = _2705.z;
    float _2713 = _2120 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2715 = _2594 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2717 = _2598 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_76.x = _2098;
    out.m_76.y = _2120;
    out.m_76.z = _2102;
    float _2719 = fma(_2098, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2713);
    float _2721 = fma(_2584, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2715);
    float _2723 = _2634 * 0.5;
    bool _2725 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2727 = isnan(0.5);
    bool _2729 = _2725 || _2727;
    bool _2731 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2733 = _2729 || _2731;
    float _2735 = fma(_2102, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2719);
    float _2737 = _2120 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2739 = fma(_2572, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2721);
    float _2741 = _2735 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2743 = fma(_2098, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2737);
    float _2745 = fma(_2502, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2739);
    float _2747 = _2670 + _2634;
    float _2749 = 1.0 / _2741;
    float _2751 = fma(_2102, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2743);
    float _2753 = _2747 * 0.5;
    out.gl_Position.x = _2670;
    out.gl_Position.y = _2672;
    out.gl_Position.z = _2745;
    out.gl_Position.w = _2634;
    float _2755 = _2751 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2757 = exp2(_2717);
    float _2759 = _2755 + _2741;
    float _2761 = _2745 + _2634;
    float _2763 = _2761 * 0.5;
    float _2765 = _2759 * _2749;
    float _2767 = _2765 * 0.5;
    float _2769 = fma(_2672, -0.5, _2723);
    float _2771 = _2723;
    float _2773 = _2672;
    float _2775 = _2745;
    float _2777 = _2634;
    if (_2733)
    {
        _2771 = 1.0;
    }
    float _2779 = _2771;
    float _2781 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2783 = fma(_2767, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2781);
    out.m_78.x = _2753;
    out.m_78.y = _2769;
    out.m_78.z = _2763;
    out.m_78.w = _2634;
    float _2785 = -_2757;
    float _2787 = _2785 + 1.0;
    float _2789 = _2757;
    float _2791 = _2779;
    if (_2733)
    {
        _2789 = 1.0;
    }
    float _2793 = _2789;
    float _2795 = 1.0 / _2783;
    float _2797 = _2787 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2799 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2801 = _2795 * _2799;
    float _2803 = _2793;
    float _2805 = _2697;
    float _2807 = _2695;
    if (!_2733)
    {
        float _2809 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2811 = _2809 * 0.15915493667125701904296875;
        float _2813 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2815 = _2811 * 6.283185482025146484375;
        float _2817 = cos(_2815);
        float _2819 = _2813 * 0.15915493667125701904296875;
        float _2821 = _2811 * 6.283185482025146484375;
        float _2823 = sin(_2821);
        float _2825 = 1.0 / _2817;
        float _2827 = _2819 * 6.283185482025146484375;
        float _2829 = cos(_2827);
        float _2831 = _2823 * _2825;
        float _2833 = _2819 * 6.283185482025146484375;
        float _2835 = sin(_2833);
        float _2837 = _2829 * _2831;
        float _2839 = 1.0 / _2837;
        float _2841 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2843 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2841;
        float _2845 = 1.0 / _2843;
        float _2847 = _2835 * _2839;
        float _2849 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2851 = fma(_2801, _2847, _2849);
        float _2853 = _2851 * _2845;
        float _2855 = precise::clamp(_2853, 0.0, 1.0);
        _2773 = _2839;
        _2791 = _2855;
        _2775 = _2843;
        _2777 = _2825;
    }
    float _2857 = _2773;
    float _2859 = _2791;
    float _2861 = _2775;
    float _2863 = _2777;
    float _2865 = _2857;
    float _2867 = _2861;
    float _2869 = _2863;
    if (!_2733)
    {
        float _2871 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2873 = _2871 * 0.15915493667125701904296875;
        float _2875 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2877 = _2873 * 6.283185482025146484375;
        float _2879 = cos(_2877);
        float _2881 = _2875 * 0.15915493667125701904296875;
        float _2883 = _2873 * 6.283185482025146484375;
        float _2885 = sin(_2883);
        float _2887 = 1.0 / _2879;
        float _2889 = _2881 * 6.283185482025146484375;
        float _2891 = cos(_2889);
        float _2893 = _2885 * _2887;
        float _2895 = _2881 * 6.283185482025146484375;
        float _2897 = sin(_2895);
        float _2899 = _2891 * _2893;
        float _2901 = 1.0 / _2899;
        float _2903 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2905 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2903;
        float _2907 = 1.0 / _2905;
        float _2909 = _2897 * _2901;
        float _2911 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2913 = fma(_2801, _2909, _2911);
        float _2915 = _2913 * _2907;
        float _2917 = precise::clamp(_2915, 0.0, 1.0);
        float _2919 = -_2917;
        float _2921 = _2919 + 1.0;
        _2803 = _2921;
        _2865 = _2907;
        _2867 = _2881;
        _2869 = _2873;
    }
    float _2923 = _2803;
    float _2925 = _2865;
    float _2927 = _2867;
    float _2929 = _2869;
    float _2931 = _2797 * _2690;
    float _2933 = -_2797;
    float _2935 = _2933 + 1.0;
    out.m_80.x = _2364;
    out.m_80.y = _2362;
    out.m_80.z = _2366;
    bool _2937 = _2398 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2939 = isnan(_2398);
    bool _2941 = _2937 || _2939;
    bool _2943 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2945 = _2941 || _2943;
    float _2947 = _2701 * _2931;
    float _2949 = _2711 * _2931;
    float _2951 = _2701 * _2935;
    float _2953 = _2859 * _2923;
    float _2955 = fma(_2707, _2947, _2695);
    float _2957 = fma(_2709, _2947, _2697);
    float _2959 = fma(_2701, _2949, _2699);
    float _2961 = _2953 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_82.x = _2955;
    out.m_82.y = _2957;
    out.m_82.z = _2959;
    out.m_82.w = _2951;
    float _2963 = _545 * _2961;
    float _2965 = _2929;
    float _2967 = _2927;
    float _2969 = _2925;
    float _2971 = _2961;
    if (!_2945)
    {
        _2805 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2973 = _2805;
    float _2975 = _2973;
    float _2977 = _2973;
    if (!_2945)
    {
        _2807 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2979 = _2807;
    float _2981 = _2979;
    float _2983 = _2979;
    if (!_2945)
    {
        _2965 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2985 = _2965;
    float _2987 = _2985;
    float _2989 = _2985;
    if (!_2945)
    {
        _2967 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2991 = _2967;
    float _2993 = _2991;
    float _2995 = _2991;
    if (!_2945)
    {
        _2969 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2997 = _2969;
    float _2999 = _2997;
    float _3001 = _2997;
    if (!_2945)
    {
        _2971 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3003 = _2971;
    bool _3005 = !_2945;
    float _3007 = _3003;
    float _3009 = _3003;
    if (!_3005)
    {
        bool _3011 = _2398 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3013 = isnan(_2398);
        bool _3015 = _3011 || _3013;
        bool _3017 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3019 = _3015 || _3017;
        if (!_3019)
        {
            float _3021 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3023 = _2398 + _3021;
            float _3025 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3027 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3025;
            float _3029 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3031 = _3029 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3033 = 1.0 / _3027;
            float _3035 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3037 = _3035 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3039 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3041 = _3039 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3043 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3045 = _3043 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3047 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3049 = _3047 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3051 = _3023 * _3033;
            float _3053 = precise::clamp(_3051, 0.0, 1.0);
            float _3055 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3057 = _3055 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3059 = fma(_3053, _3031, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3061 = fma(_3053, _3057, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3063 = fma(_3053, _3037, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3065 = fma(_3053, _3041, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3067 = fma(_3053, _3045, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3069 = fma(_3053, _3049, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2983 = _3063;
            _3001 = _3067;
            _2977 = _3059;
            _2995 = _3065;
            _2989 = _3061;
            _3009 = _3069;
            _3071 = true;
        }
        else
        {
            bool _3073 = _2398 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3075 = isnan(_2398);
            bool _3077 = _3073 || _3075;
            bool _3079 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3081 = _3077 || _3079;
            if (!_3081)
            {
                _2975 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3083 = _2975;
            _2977 = _3083;
            if (!_3081)
            {
                _2981 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3085 = _2981;
            _2983 = _3085;
            if (!_3081)
            {
                _2987 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3087 = _2987;
            _2989 = _3087;
            if (!_3081)
            {
                _2993 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3089 = _2993;
            _2995 = _3089;
            if (!_3081)
            {
                _2999 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3091 = _2999;
            _3001 = _3091;
            if (!_3081)
            {
                _3007 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3093 = _3007;
            bool _3095 = !_3081;
            _3009 = _3093;
            if (!_3095)
            {
                bool _3097 = _2398 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3099 = isnan(_2398);
                bool _3101 = _3097 || _3099;
                bool _3103 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3105 = _3101 || _3103;
                if (!_3105)
                {
                    float _3107 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3109 = _2398 + _3107;
                    float _3111 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3113 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3111;
                    float _3115 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3117 = _3115 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3119 = 1.0 / _3113;
                    float _3121 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3123 = _3121 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3125 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3127 = _3125 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3129 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3131 = _3129 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3133 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3135 = _3133 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3137 = _3109 * _3119;
                    float _3139 = precise::clamp(_3137, 0.0, 1.0);
                    float _3141 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3143 = _3141 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3145 = fma(_3139, _3117, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3147 = fma(_3139, _3143, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3149 = fma(_3139, _3123, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3151 = fma(_3139, _3127, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3153 = fma(_3139, _3131, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3155 = fma(_3139, _3135, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2983 = _3149;
                    _3001 = _3153;
                    _2977 = _3145;
                    _2995 = _3151;
                    _2989 = _3147;
                    _3009 = _3155;
                    _3071 = true;
                }
                else
                {
                    _2983 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3001 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2977 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2995 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2989 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3009 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3071 = false;
    float _3157 = _2983;
    float _3159 = _3001;
    float _3161 = _2977;
    float _3163 = _2995;
    float _3165 = _2989;
    float _3167 = _3009;
    float _3169 = fma(_2090, -0.5, 0.5);
    float _3171 = precise::clamp(_3169, 0.0, 1.0);
    float _3173 = -_3157;
    float _3175 = _3173 + _3159;
    float _3177 = -_3161;
    float _3179 = _3177 + _3163;
    out.m_84.x = 0.0;
    float _3181 = fma(_3171, _3175, _3157);
    float _3183 = -_3165;
    float _3185 = _3183 + _3167;
    float _3187 = fma(_3171, _3179, _3161);
    float _3189 = _3181 * 0.586610972881317138671875;
    bool _3191 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3193 = fma(_3171, _3185, _3165);
    float _3195 = _2963 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3197 = fma(_3187, 0.298911988735198974609375, _3189);
    bool _3199 = _2859 > 0.0;
    bool _3201 = isnan(_2859);
    bool _3203 = _3199 || _3201;
    bool _3205 = isnan(0.0);
    bool _3207 = _3203 || _3205;
    float _3209 = fma(_3193, 0.114477999508380889892578125, _3197);
    out.m_51.x = _3195;
    bool _3211 = _2923 <= 0.0;
    bool _3213 = !_3207;
    bool _3215 = _3211 || _3213;
    float _3217 = -_3209;
    float _3219 = _3187 + _3217;
    float _3221 = -_3209;
    float _3223 = _3181 + _3221;
    float _3225 = -_3209;
    float _3227 = _3193 + _3225;
    float _3229 = fma(_3219, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3209);
    float _3231 = fma(_3223, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3209);
    float _3233 = fma(_3227, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3209);
    bool _3235 = !_3191;
    if (!_3235)
    {
        float _3237 = -_2362;
        float _3239 = _3237 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3241 = -_2364;
        float _3243 = _3241 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3245 = -_2366;
        float _3247 = _3245 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3249 = _3239 * _3239;
        float _3251 = fma(_3243, _3243, _3249);
        float _3253 = fma(_3247, _3247, _3251);
        float _3255 = sqrt(_3253);
        float _3257 = rsqrt(_3253);
        float _3259 = -_3255;
        float _3261 = _3259 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3263 = _3261 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3265 = precise::clamp(_3263, 0.0, 1.0);
        float _3267 = _3243 * _3257;
        float _3269 = _3239 * _3257;
        float _3271 = abs(_3265);
        float _3273 = log2(_3271);
        float _3275 = _3247 * _3257;
        float _3277 = _3267 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3279 = _2090 * _3269;
        float _3281 = -_3269;
        float _3283 = -_3277;
        float _3285 = fma(_3281, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3283);
        float _3287 = fma(_2086, _3267, _3279);
        float _3289 = -_3275;
        float _3291 = fma(_3289, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3285);
        float _3293 = fma(_2094, _3275, _3287);
        float _3295 = precise::clamp(_3293, 0.0, 1.0);
        float _3297 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3299 = _3291 + _3297;
        float _3301 = _3273 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3303 = _3299 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3305 = precise::clamp(_3303, 0.0, 1.0);
        float _3307 = exp2(_3301);
        float _3309 = _3307 * _3305;
        float _3311 = _3295 * _3309;
        float _3313 = _3311 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3315 = _3311 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3317 = _3311 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_84.x = _3313;
        out.m_84.y = _3315;
        out.m_84.z = _3317;
    }
    out.m_62.x = _3229;
    out.m_62.y = _3231;
    out.m_62.z = _3233;
    if (!_3215)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_51.x = 0.0;
    float _3319 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3319;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3071 = false;
    bool _677 = false;
    bool _575 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _98 = in.m_44.w;
    float _100 = in.m_46.w;
    float _102 = trunc(_98);
    int _105 = int(_102);
    float _107 = -_100;
    float _109 = _107 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_49.y = _109;
    bool _113 = _105 >= 1;
    float _115 = 0.0;
    float _117 = _100;
    float _119 = _109;
    if (!_113)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _121 = _115;
    if (!_113)
    {
        out.m_51.x = 0.0;
    }
    int _123 = 0;
    if (!_113)
    {
        float _125 = _121 * 5.0;
        _123 = as_type<int>(_125);
    }
    int _127 = _123;
    int _129 = _127;
    if (!_113)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3387 = as_type<float>(_127);
        out.gl_Position.z = _3387;
    }
    if (!_113)
    {
        return out;
    }
    bool _131 = _100 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _133 = isnan(_100);
    bool _135 = _131 || _133;
    bool _137 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _139 = _135 || _137;
    float _141 = float(_105);
    bool _143 = _109 >= _141;
    bool _145 = !_139;
    bool _147 = _143 || _145;
    if (_147)
    {
        _117 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _149 = _117;
    if (_147)
    {
        out.m_51.x = 0.0;
    }
    if (_147)
    {
        float _151 = _149 * 5.0;
        _129 = as_type<int>(_151);
    }
    int _153 = _129;
    if (_147)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3442 = as_type<float>(_153);
        out.gl_Position.z = _3442;
    }
    if (_147)
    {
        return out;
    }
    float _155 = in.m_53.x;
    float _157 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _159 = _109 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _161 = as_type<float>(int(gl_VertexIndex));
    bool _163 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _165 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _167 = _163 || _165;
    bool _169 = isnan(1.0);
    bool _171 = _167 || _169;
    float _173 = _159 * _157;
    float _175 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[20].x, _173);
    float _177 = in.m_46.x;
    float _179 = in.m_46.y;
    float _181 = in.m_46.z;
    float _183 = floor(_175);
    float _185 = _175 * 6.283185482025146484375;
    int _187 = as_type<int>(_161) & 1;
    bool _189 = _187 != 0;
    int _191 = as_type<int>(_161) & 2;
    bool _193 = _191 != 0;
    float _195 = _109 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    int _197 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _199 = _197 != 0;
    float _201 = _185 * 0.15915493667125701904296875;
    bool _203 = !_189;
    float _205 = _203 ? (-0.5) : 0.5;
    float _207 = _201 * 6.283185482025146484375;
    float _209 = cos(_207);
    bool _211 = !_193;
    float _213 = _211 ? (-0.5) : 0.5;
    float _215 = -_183;
    float _217 = _175 + _215;
    float _219 = _183;
    float _221 = _195;
    if (!_171)
    {
        float _223 = _195 * _195;
        float _225 = _223 * 0.5;
        _219 = _225;
    }
    float _227 = _219;
    float _229 = _227;
    if (!_171)
    {
        float _231 = _227 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _229 = _231;
    }
    float _233 = _229;
    bool _235 = !_171;
    float _237 = _233;
    if (!_235)
    {
        float _239 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _241 = log2(_239);
        float _243 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _245 = _243 + 1.0;
        float _247 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _249 = _195 * _241;
        float _251 = 1.0 / _245;
        float _253 = _247 * 0.693147182464599609375;
        float _255 = exp2(_249);
        float _257 = 1.0 / _253;
        float _259 = _255 + (-1.0);
        float _261 = -_259;
        float _263 = fma(_261, _257, _195);
        float _265 = _263 * _251;
        float _267 = _265 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _237 = _267;
    }
    float _269 = _237;
    bool _271 = !_171;
    if (!_271)
    {
        float _273 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _275 = log2(_273);
        float _277 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _279 = _277 + 1.0;
        float _281 = 1.0 / _279;
        float _283 = _195 * _275;
        float _285 = exp2(_283);
        float _287 = -_285;
        float _289 = _287 + 1.0;
        float _291 = _289 * _281;
        _221 = _291;
    }
    float _293 = _221;
    float _295 = _269 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _297 = in.m_58.w;
    float _299 = _269 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _301 = _295 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _303 = in.m_44.x;
    float _305 = in.m_44.y;
    float _307 = in.m_44.z;
    float _309 = _295 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _311 = _295 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _313 = fma(_299, (*spvDescriptorSet0.vp_c10)._m0[8].x, _301);
    bool _315 = _217 < 0.5;
    float _317 = float(_315);
    float _319 = fma(_299, (*spvDescriptorSet0.vp_c10)._m0[8].y, _309);
    float _321 = fma(_299, (*spvDescriptorSet0.vp_c10)._m0[8].z, _311);
    float _323 = _269 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _325 = fma(_209, 0.5, 0.5);
    float _327 = -_217;
    float _329 = fma(_327, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _331 = -_317;
    float _333 = fma(_331, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _335 = fma(_323, (*spvDescriptorSet0.vp_c10)._m0[10].x, _313);
    float _337 = fma(_323, (*spvDescriptorSet0.vp_c10)._m0[10].y, _319);
    float _339 = fma(_323, (*spvDescriptorSet0.vp_c10)._m0[10].z, _321);
    float _341 = _321;
    float _343 = _339;
    if (!_171)
    {
        float _345 = _109 * _109;
        float _347 = _345 * 0.5;
        _341 = _347;
    }
    float _349 = _341;
    float _351 = fma(_293, _177, _335);
    float _353 = fma(_293, _179, _337);
    float _355 = -_325;
    float _357 = fma(_355, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _359 = fma(_293, _181, _339);
    float _361 = _349;
    if (!_171)
    {
        float _363 = _349 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _361 = _363;
    }
    float _365 = _361;
    bool _367 = !_171;
    float _369 = _365;
    if (!_367)
    {
        float _371 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _373 = log2(_371);
        float _375 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _377 = _109 * _373;
        float _379 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _381 = _379 + 1.0;
        float _383 = 1.0 / _381;
        float _385 = _375 * 0.693147182464599609375;
        float _387 = exp2(_377);
        float _389 = 1.0 / _385;
        float _391 = _387 + (-1.0);
        float _393 = -_391;
        float _395 = fma(_393, _389, _109);
        float _397 = _395 * _383;
        float _399 = _397 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _369 = _399;
        _343 = _387;
    }
    float _401 = _369;
    float _403 = _343;
    float _405 = _401 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _407 = fma(_351, _297, _303);
    float _409 = fma(_353, _297, _305);
    float _411 = _403;
    if (!_171)
    {
        _411 = _109;
    }
    float _413 = _411;
    bool _415 = !_171;
    float _417 = _413;
    if (!_415)
    {
        float _419 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _421 = log2(_419);
        float _423 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _425 = _423 + 1.0;
        float _427 = 1.0 / _425;
        float _429 = _109 * _421;
        float _431 = exp2(_429);
        float _433 = -_431;
        float _435 = _433 + 1.0;
        float _437 = _435 * _427;
        _417 = _437;
    }
    float _439 = _417;
    int _441 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _443 = _441 != 0;
    int _445 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _447 = _445 != 0;
    float _449 = fma(_359, _297, _307);
    float _451 = _401 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _453 = _405 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _455 = _405 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    bool _457 = !_443;
    int _459 = _457 ? 0 : 1;
    float _461 = _405 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _463 = fma(_451, (*spvDescriptorSet0.vp_c10)._m0[8].x, _453);
    float _465 = _401 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    int _467 = abs(_459);
    float _469 = fma(_451, (*spvDescriptorSet0.vp_c10)._m0[8].y, _455);
    float _471 = fma(_451, (*spvDescriptorSet0.vp_c10)._m0[8].z, _461);
    float _473 = fma(_465, (*spvDescriptorSet0.vp_c10)._m0[10].x, _463);
    bool _475 = !_199;
    int _477 = _475 ? 0 : 1;
    float _479 = fma(_465, (*spvDescriptorSet0.vp_c10)._m0[10].y, _469);
    float _481 = fma(_465, (*spvDescriptorSet0.vp_c10)._m0[10].z, _471);
    float _483 = float(_467);
    float _485 = fma(_439, _177, _473);
    float _487 = fma(_439, _179, _479);
    float _489 = fma(_439, _181, _481);
    bool _491 = !_447;
    int _493 = _491 ? 0 : 1;
    float _495 = abs(_329);
    float _497 = _483 * _495;
    bool _499 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _501 = 1.0 / _141;
    float _503 = -_487;
    float _505 = _353 + _503;
    int _507 = abs(_477);
    float _509 = -_489;
    float _511 = _359 + _509;
    int _513 = abs(_493);
    float _515 = _505 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _517 = _505 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _519 = _505 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _521 = float(_507);
    float _523 = -_485;
    float _525 = _351 + _523;
    float _527 = fma(_525, (*spvDescriptorSet0.vp_c10)._m0[5].x, _517);
    float _529 = float(_513);
    float _531 = fma(_525, (*spvDescriptorSet0.vp_c10)._m0[4].x, _515);
    float _533 = fma(_525, (*spvDescriptorSet0.vp_c10)._m0[6].x, _519);
    float _535 = fma(_521, _357, _497);
    float _537 = fma(_511, (*spvDescriptorSet0.vp_c10)._m0[5].z, _527);
    float _539 = fma(_511, (*spvDescriptorSet0.vp_c10)._m0[4].z, _531);
    float _541 = fma(_511, (*spvDescriptorSet0.vp_c10)._m0[6].z, _533);
    float _543 = abs(_333);
    float _545 = fma(_529, _543, _535);
    float _547 = _109 * _501;
    bool _549 = !_499;
    float _551 = _537;
    float _553 = _539;
    float _555 = _541;
    float _557 = _541;
    float _573;
    if (!_549)
    {
        float _559 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _561 = _155 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _563 = fma(_561, (*spvDescriptorSet0.vp_c9)._m0[12].x, _109);
        float _565 = _563 * _559;
        float _567 = floor(_565);
        float _569 = -_567;
        float _571 = _565 + _569;
        _573 = _571;
        _575 = true;
    }
    else
    {
        _573 = _547;
    }
    _575 = false;
    float _577 = _573;
    float _579 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _581 = _577 + _579;
    float _583 = in.m_58.x;
    float _585 = in.m_58.y;
    bool _587 = _577 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _589 = isnan(_577);
    bool _591 = _587 || _589;
    bool _593 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _595 = _591 || _593;
    float _597 = float(_595);
    float _599 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _601 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _599;
    bool _603 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _605 = 1.0 / _601;
    float _607 = -_597;
    float _609 = _607 + 1.0;
    float _611 = _581 * _605;
    bool _613 = _577 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _615 = isnan(_577);
    bool _617 = _613 || _615;
    bool _619 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _621 = _617 || _619;
    float _623 = float(_621);
    float _625 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _627 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _625;
    float _629 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _631 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _629;
    float _633 = _623 * _609;
    float _635 = fma(_627, _611, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _637 = fma(_631, _611, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _639 = -_623;
    float _641 = _639 + 1.0;
    float _643 = _635 * _633;
    float _645 = _637 * _633;
    float _647 = fma(_641, (*spvDescriptorSet0.vp_c9)._m0[143].x, _643);
    float _649 = fma(_641, (*spvDescriptorSet0.vp_c9)._m0[143].y, _645);
    float _651 = fma(_597, (*spvDescriptorSet0.vp_c9)._m0[144].x, _647);
    float _653 = fma(_597, (*spvDescriptorSet0.vp_c9)._m0[144].y, _649);
    float _655 = _651 * _583;
    float _657 = _653 * _585;
    bool _659 = !_603;
    float _675;
    if (!_659)
    {
        float _661 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _663 = _155 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _665 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[11].y, _109);
        float _667 = _665 * _661;
        float _669 = floor(_667);
        float _671 = -_669;
        float _673 = _667 + _671;
        _675 = _673;
        _677 = true;
    }
    else
    {
        _675 = _547;
    }
    _677 = false;
    float _679 = _675;
    float _681 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _683 = int(_681);
    float _685 = in.m_53.z;
    float _687 = _655 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _689 = _657 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _691 = _409 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _693 = _205 * _687;
    float _695 = _213 * _689;
    float _697 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _699 = int(_697);
    float _701 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _703 = fma(_407, (*spvDescriptorSet0.vp_c10)._m0[6].x, _691);
    float _705 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _707 = _705 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _709 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _711 = float(_683);
    float _713 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _715 = _713 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _717 = 1.0 / _707;
    float _719 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _721 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _723 = _547 + _721;
    float _725 = float(uint(_699));
    float _727 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _729 = _727 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    int _731 = ~_699;
    int _733 = _731 + 1;
    float _735 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _737 = _735 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _739 = 1.0 / _711;
    int _741 = ~_699;
    int _743 = _741 + 1;
    float _745 = 1.0 / _725;
    float _747 = in.m_53.y;
    float _749 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _751 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _749;
    float _753 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _755 = _753 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _757 = _755 * _717;
    float _759 = _109 * _739;
    float _761 = 1.0 / _715;
    float _763 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _765 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _763;
    float _767 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _769 = _767 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _771 = _679 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _773 = isnan(_679);
    bool _775 = _771 || _773;
    bool _777 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _779 = _775 || _777;
    float _781 = float(_779);
    int _783 = as_type<int>(_745) + (-2);
    float _785 = trunc(_759);
    int _787 = int(_785);
    float _789 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _791 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _789;
    bool _793 = _547 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _795 = isnan(_547);
    bool _797 = _793 || _795;
    bool _799 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _801 = _797 || _799;
    float _803 = float(_801);
    float _805 = -_781;
    float _807 = _805 + 1.0;
    int _809 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _811 = _809 != 0;
    float _813 = fma(_747, (*spvDescriptorSet0.vp_c9)._m0[78].w, _719);
    float _815 = 1.0 / _729;
    float _817 = _765 * _761;
    bool _819 = !_811;
    float _821 = _819 ? 1.2345600128173828125 : 1.0;
    float _823 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _825 = _823 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _827 = float(uint(_787));
    float _829 = 1.0 / _737;
    float _831 = 0.0;
    float _833 = _693;
    float _835 = _695;
    float _837 = _685;
    if (!_811)
    {
        _831 = _685;
    }
    float _839 = _831;
    float _841 = _839;
    if (_811)
    {
        _841 = _747;
    }
    float _843 = _841;
    float _845 = as_type<float>(_783) * _827;
    float _847 = _825 * _815;
    float _849 = trunc(_845);
    float _851 = precise::max(_849, 0.0);
    uint _854 = uint(_851);
    float _856 = 1.0 / _769;
    bool _858 = !_811;
    float _860 = _858 ? _747 : _155;
    float _862 = _821 * _860;
    int _864 = _733 * int(_854);
    int _866 = _864 + _787;
    float _868 = floor(_862);
    float _870 = float(uint(_866));
    float _872 = as_type<float>(_783) * _870;
    float _874 = float(_699);
    float _876 = trunc(_872);
    float _878 = precise::max(_876, 0.0);
    uint _880 = uint(_878);
    float _882 = -_868;
    float _884 = _862 + _882;
    int _886 = int(_854) + int(_880);
    float _888 = float(_787);
    int _890 = _743 * _886;
    int _892 = _890 + _787;
    bool _894 = _888 >= _874;
    bool _896 = isnan(_888);
    bool _898 = _894 || _896;
    bool _900 = isnan(_874);
    bool _902 = _898 || _900;
    float _904 = float(_902);
    float _906 = _884 * _874;
    bool _908 = uint(_892) >= uint(_699);
    float _910 = trunc(_906);
    int _912 = int(_910);
    bool _914 = !_908;
    int _916 = _914 ? 0 : (-1);
    int _918 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _920 = _918 != 0;
    int _922 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _924 = _922 != 0;
    int _926 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _928 = _926 != 0;
    int _930 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _932 = _930 != 0;
    float _934 = _109 * _874;
    int _936 = ~_886;
    int _938 = _936 + _916;
    int _940 = _938 + 1;
    float _942 = trunc(_904);
    int _944 = int(_942);
    bool _946 = _699 == 0;
    float _948 = _934 * _501;
    int _950 = _699 + (-1);
    int _952 = _699 * _940;
    int _954 = _952 + _787;
    bool _956 = !_924;
    int _958 = _956 ? 0 : 1;
    int _960 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _962 = _960 != 0;
    float _964 = trunc(_948);
    int _966 = int(_964);
    bool _968 = !_946;
    int _970 = _968 ? _954 : (-1);
    bool _972 = !_962;
    int _974 = _972 ? 0 : 1;
    int _976 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _978 = _976 != 0;
    int _980 = abs(_974);
    int _982 = ~_944;
    int _984 = _982 + 1;
    int _986 = _984 + 1;
    int _988 = _912 * _980;
    int _990 = _988 + _787;
    float _992 = fma(_449, (*spvDescriptorSet0.vp_c10)._m0[6].z, _703);
    int _994 = _970 * _986;
    int _996 = _944 * _950;
    int _998 = _996 + _994;
    bool _1000 = !_920;
    int _1002 = _1000 ? 0 : 1;
    float _1004 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1006 = _1004 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _1008 = abs(_958);
    float _1010 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1012 = _1010 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _1014 = !_928;
    int _1016 = _1014 ? 0 : 1;
    float _1018 = _992 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1020 = abs(_1002);
    int _1022 = _998 * _1008;
    int _1024 = abs(_1016);
    float _1026 = 1.0 / _1006;
    float _1028 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1030 = _1018 + _1028;
    bool _1032 = !_932;
    int _1034 = _1032 ? 0 : 1;
    int _1036 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1038 = _1036 != 0;
    int _1040 = _966 * _1020;
    int _1042 = _1040 + _1022;
    int _1044 = abs(_1034);
    float _1046 = 1.0 / _1012;
    int _1048 = ~_699;
    int _1050 = _1048 + 1;
    int _1052 = _990 * _1024;
    int _1054 = _1052 + _1042;
    bool _1056 = _155 > 0.5;
    bool _1058 = _747 > 0.5;
    int _1060 = _912 * _1044;
    int _1062 = _1060 + _1054;
    float _1064 = as_type<float>(_1008);
    float _1066 = as_type<float>(_990);
    if (_978)
    {
        float _1068 = -_693;
        float _1070 = _1056 ? _1068 : _693;
        _833 = _1070;
    }
    float _1072 = _833;
    float _1074 = _409 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _1076 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1078 = _1076 != 0;
    float _1080 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1082 = float(uint(_1062));
    float _1084 = fma(_407, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1074);
    if (_1038)
    {
        float _1086 = -_695;
        float _1088 = _1058 ? _1086 : _695;
        _835 = _1088;
    }
    float _1090 = _835;
    float _1092 = _751 * _1026;
    int _1094 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1096 = _1094 != 0;
    float _1098 = as_type<float>(_783) * _1082;
    int _1100 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1102 = _1100 != 0;
    float _1104 = _409 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1106 = _155 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1108 = trunc(_1098);
    float _1110 = precise::max(_1108, 0.0);
    uint _1112 = uint(_1110);
    float _1114 = fma(_449, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1084);
    float _1116 = fma(_407, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1104);
    float _1118 = -_701;
    float _1120 = fma(_1106, 2.0, _1118);
    float _1122 = _747 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1124 = _213 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    if (!_811)
    {
        _1064 = _747;
    }
    float _1126 = _1064;
    float _1128 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1130 = in.m_53.w;
    float _1132 = fma(_1122, -2.0, _709);
    float _1134 = _1124 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1136 = fma(_449, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1116);
    float _1138 = _1126;
    if (_811)
    {
        _1138 = _155;
    }
    float _1140 = _1138;
    float _1142 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1128);
    int _1144 = _1050 * int(_1112);
    int _1146 = _1144 + _1062;
    float _1148 = _1124 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1150 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1152 = _1150 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1154 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1156 = float(uint(_1146));
    float _1158 = _1114 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1160 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1162 = _1136 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1164 = as_type<float>(_783) * _1156;
    float _1166 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1168 = _1158 + _1166;
    float _1170 = 1.0 / _1152;
    float _1172 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1174 = _1172 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1176 = _1160 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1178 = _1168 * _1168;
    float _1180 = _1140 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1182 = trunc(_1164);
    float _1184 = precise::max(_1182, 0.0);
    uint _1186 = uint(_1184);
    float _1188 = 1.0 / _1174;
    int _1190 = int(_1112) + int(_1186);
    int _1192 = ~_699;
    int _1194 = _1192 + 1;
    int _1196 = _1194 * _1190;
    int _1198 = _1196 + _1062;
    float _1200 = _791 * _1188;
    bool _1202 = _547 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _1204 = isnan(_547);
    bool _1206 = _1202 || _1204;
    bool _1208 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _1210 = _1206 || _1208;
    float _1212 = float(_1210);
    bool _1214 = uint(_1198) >= uint(_699);
    float _1216 = _205 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _1218 = !_1214;
    int _1220 = _1218 ? 0 : (-1);
    float _1222 = fma(_1216, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1148);
    bool _1224 = _685 > 0.5;
    if (_811)
    {
        _837 = _747;
    }
    float _1226 = _837;
    float _1228 = _1124 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _1230 = _1130 > 0.5;
    float _1232 = fma(_1216, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1134);
    float _1234 = fma(_1216, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1228);
    float _1236 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1238 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1240 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1242 = _1236 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1244 = _1238 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_60.x = _1242;
    out.m_60.y = _1244;
    out.m_60.z = _1176;
    out.m_60.w = _1240;
    float _1246 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1248 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _1246;
    float _1250 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _1252 = _1250 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1254 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1256 = _1254 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    float _1258 = fma(_109, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1132);
    float _1260 = _1248 * _1046;
    float _1262 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1264 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _1262;
    float _1266 = _1252 * _1170;
    float _1268 = 1.0 / _1256;
    float _1270 = _1080 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1272 = _1264 * _829;
    float _1274 = _1072 + 0.5;
    float _1276 = _1154 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1278 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1280 = _547 + _1278;
    float _1282 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _1284 = _1282 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1286 = -_109;
    float _1288 = fma(_1286, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1120);
    float _1290 = _1090 + (-0.5);
    float _1292 = fma(_847, _1280, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    float _1294 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1296 = _547 + _1294;
    float _1298 = fma(_1270, _1274, _1288);
    float _1300 = -_1276;
    float _1302 = -_1258;
    float _1304 = fma(_1300, _1290, _1302);
    float _1306 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1308 = _679 + _1306;
    float _1310 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1312 = _679 + _1310;
    float _1314 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1316 = _547 + _1314;
    float _1318 = fma(_1260, _1296, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _1320 = fma(_757, _1308, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1322 = fma(_1200, _1312, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1324 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1326 = _547 + _1324;
    float _1328 = fma(_817, _1316, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    float _1330 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1332 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _1330;
    float _1334 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1336 = _547 + _1334;
    float _1338 = fma(_1266, _1326, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    float _1340 = _1284 * _856;
    float _1342 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1344 = _679 + _1342;
    bool _1346 = _547 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _1348 = isnan(_547);
    bool _1350 = _1346 || _1348;
    bool _1352 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _1354 = _1350 || _1352;
    float _1356 = float(_1354);
    float _1358 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1360 = _547 + _1358;
    float _1362 = fma(_1272, _1336, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    float _1364 = fma(_1092, _1344, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1366 = _547 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _1368 = isnan(_547);
    bool _1370 = _1366 || _1368;
    bool _1372 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _1374 = _1370 || _1372;
    float _1376 = float(_1374);
    float _1378 = fma(_1340, _1360, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _1380 = -_1356;
    float _1382 = _1380 + 1.0;
    bool _1384 = _547 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1386 = isnan(_547);
    bool _1388 = _1384 || _1386;
    bool _1390 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _1392 = _1388 || _1390;
    float _1394 = float(_1392);
    float _1396 = _1332 * _1268;
    bool _1398 = _679 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1400 = isnan(_679);
    bool _1402 = _1398 || _1400;
    bool _1404 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1406 = _1402 || _1404;
    float _1408 = float(_1406);
    bool _1410 = _679 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1412 = isnan(_679);
    bool _1414 = _1410 || _1412;
    bool _1416 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1418 = _1414 || _1416;
    float _1420 = float(_1418);
    float _1422 = -_1394;
    float _1424 = _1422 + 1.0;
    bool _1426 = _679 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1428 = isnan(_679);
    bool _1430 = _1426 || _1428;
    bool _1432 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1434 = _1430 || _1432;
    float _1436 = float(_1434);
    float _1438 = _1376 * _1382;
    float _1440 = -_1376;
    float _1442 = _1440 + 1.0;
    bool _1444 = _547 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1446 = isnan(_547);
    bool _1448 = _1444 || _1446;
    bool _1450 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _1452 = _1448 || _1450;
    float _1454 = float(_1452);
    float _1456 = fma(_1396, _723, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    float _1458 = -_1436;
    float _1460 = _1458 + 1.0;
    float _1462 = _1394 * _1442;
    bool _1464 = _547 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _1466 = isnan(_547);
    bool _1468 = _1464 || _1466;
    bool _1470 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _1472 = _1468 || _1470;
    float _1474 = float(_1472);
    float _1476 = _1454 * _1424;
    float _1478 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1480 = _1162 + _1478;
    float _1482 = -_1454;
    float _1484 = _1482 + 1.0;
    bool _1486 = _547 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _1488 = isnan(_547);
    bool _1490 = _1486 || _1488;
    bool _1492 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _1494 = _1490 || _1492;
    float _1496 = float(_1494);
    float _1498 = -_1474;
    float _1500 = _1498 + 1.0;
    float _1502 = fma(_1480, _1480, _1178);
    float _1504 = _1474 * _1484;
    float _1506 = _1420 * _1460;
    float _1508 = -_1420;
    float _1510 = _1508 + 1.0;
    float _1512 = fma(_1030, _1030, _1502);
    float _1514 = _803 * _1500;
    float _1516 = -_803;
    float _1518 = _1516 + 1.0;
    float _1520 = _781 * _1510;
    float _1522 = sqrt(_1512);
    float _1524 = _1408 * _807;
    float _1526 = _1212 * _1518;
    float _1528 = -_1212;
    float _1530 = _1528 + 1.0;
    float _1532 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1534 = _1364 * _1524;
    float _1536 = _1496 * _1530;
    float _1538 = fma(_843, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1532);
    float _1540 = rsqrt(_1512);
    float _1542 = _687 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _1544 = _1328 * _1536;
    float _1546 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1548 = float(uint(_990));
    float _1550 = _1522 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _1552 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1554 = as_type<float>(_783) * _1548;
    float _1556 = _1226 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1558 = precise::min(_1542, _1550);
    float _1560 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1562 = -_1552;
    float _1564 = fma(_1180, 2.0, _1562);
    float _1566 = trunc(_1554);
    float _1568 = precise::max(_1566, 0.0);
    uint _1570 = uint(_1568);
    float _1572 = _1540 * _1558;
    float _1574 = fma(_1140, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1560);
    float _1576 = _1168 * _1572;
    float _1578 = _1480 * _1572;
    float _1580 = -_1576;
    float _1582 = _1168 + _1580;
    float _1584 = -_1578;
    float _1586 = _1480 + _1584;
    float _1588 = fma(_1556, -2.0, _1546);
    int _1590 = ~_699;
    int _1592 = _1590 + 1;
    float _1594 = _1582 * _1582;
    float _1596 = -_1408;
    float _1598 = _1596 + 1.0;
    float _1600 = _1030 * _1572;
    float _1602 = fma(_1586, _1586, _1594);
    float _1604 = -_1496;
    float _1606 = _1604 + 1.0;
    float _1608 = -_1600;
    float _1610 = _1030 + _1608;
    int _1612 = ~_1190;
    int _1614 = _1612 + _1220;
    int _1616 = _1614 + 1;
    float _1618 = fma(_1598, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1534);
    float _1620 = fma(_1606, (*spvDescriptorSet0.vp_c9)._m0[151].x, _1544);
    int _1622 = _1592 * int(_1570);
    int _1624 = _1622 + _990;
    float _1626 = fma(_1610, _1610, _1602);
    float _1628 = -_205;
    int _1630 = _1224 ? as_type<int>(_1628) : as_type<int>(_205);
    float _1632 = fma(_1292, _1526, _1620);
    int _1634 = _699 * _1616;
    int _1636 = _1634 + _1062;
    float _1638 = sqrt(_1626);
    float _1640 = float(uint(_1624));
    float _1642 = fma(_1320, _1520, _1618);
    bool _1644 = !_1096;
    float _1646 = _1644 ? _205 : as_type<float>(_1630);
    float _1648 = fma(_1318, _1514, _1632);
    float _1650 = -_213;
    int _1652 = _1230 ? as_type<int>(_1650) : as_type<int>(_213);
    float _1654 = as_type<float>(_783) * _1640;
    bool _1656 = !_946;
    int _1658 = _1656 ? _1636 : (-1);
    float _1660 = -_109;
    float _1662 = fma(_1660, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1564);
    bool _1664 = !_1102;
    float _1666 = _1664 ? _213 : as_type<float>(_1652);
    float _1668 = _1646 + 0.5;
    int _1670 = _1658 >> 31;
    float _1672 = trunc(_1654);
    float _1674 = precise::max(_1672, 0.0);
    uint _1676 = uint(_1674);
    float _1678 = fma(_109, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1588);
    float _1680 = fma(_1668, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1662);
    int _1682 = _1670 & 3;
    float _1684 = fma(_1338, _1504, _1648);
    float _1686 = fma(_1322, _1506, _1642);
    float _1688 = _1540 * _1638;
    int _1690 = _1658 + _1682;
    float _1692 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _213);
    float _1694 = fma(_1362, _1476, _1684);
    float _1696 = _689 * _1688;
    int _1698 = _1690 >> 2;
    float _1700 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _205);
    float _1702 = _687 * _1688;
    float _1704 = _1696 * _1692;
    int _1706 = _1698 << 4;
    int _1708 = _1706 + 512;
    float _1710 = _1666 + (-0.5);
    float _1712 = _1702 * _1700;
    float _1714 = _1704 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    uint _1716 = uint(int(uint(_1708) >> uint(2)));
    uint _1718 = uint(int(uint(int(_1716)) >> uint(2)));
    int _1720 = int(_1716) & 3;
    float _1722 = (*spvDescriptorSet0.vp_c9)._m0[int(_1718)][_1720];
    int _1724 = int(_1716) + 1;
    uint _1726 = uint(int(uint(_1724) >> uint(2)));
    int _1728 = _1724 & 3;
    float _1730 = (*spvDescriptorSet0.vp_c9)._m0[int(_1726)][_1728];
    float _1732 = _1704 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1734 = -_1710;
    float _1736 = -_1678;
    float _1738 = fma(_1734, (*spvDescriptorSet0.vp_c9)._m0[85].y, _1736);
    float _1740 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1714);
    int _1742 = int(_1570) + int(_1676);
    float _1744 = _1688 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1746 = _1744 * 0.5;
    int _1748 = ~_699;
    int _1750 = _1748 + 1;
    float _1752 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1732);
    float _1754 = fma(_1436, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1686);
    float _1756 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1740);
    float _1758 = fma(_1378, _1462, _1694);
    float _1760 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1752);
    int _1762 = _1750 * _1742;
    int _1764 = _1762 + _990;
    int _1766 = _1708 + 8;
    uint _1768 = uint(int(uint(_1766) >> uint(2)));
    uint _1770 = uint(int(uint(int(_1768)) >> uint(2)));
    int _1772 = int(_1768) & 3;
    float _1774 = (*spvDescriptorSet0.vp_c9)._m0[int(_1770)][_1772];
    int _1776 = int(_1768) + 1;
    uint _1778 = uint(int(uint(_1776) >> uint(2)));
    int _1780 = _1776 & 3;
    float _1782 = (*spvDescriptorSet0.vp_c9)._m0[int(_1778)][_1780];
    int _1784 = _1658 & 3;
    bool _1786 = _1784 != 0;
    float _1788 = _1760 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1790 = _1756 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    bool _1792 = uint(_1764) >= uint(_699);
    float _1794 = _1704 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _1796 = uint(_1784) > 1u;
    float _1798 = _1018 + _1788;
    int _1800 = _1658 & 3;
    bool _1802 = _1800 != 0;
    float _1804 = _1162 + _1790;
    bool _1806 = !_1792;
    int _1808 = _1806 ? 0 : (-1);
    float _1810 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1812 = _1798 + _1810;
    int _1814 = _1802 ? 0 : 1;
    float _1816 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1818 = _1804 + _1816;
    int _1820 = ~_1742;
    int _1822 = _1820 + _1808;
    int _1824 = _1822 + 1;
    float _1826 = _1812 * _1812;
    int _1828 = ~_1814;
    int _1830 = _1828 + 1;
    int _1832 = _1830 + 1;
    bool _1834 = _1784 != 3;
    int _1836 = _699 * _1824;
    int _1838 = _1836 + _990;
    int _1840 = _1832;
    float _1842 = _1804;
    if (!_1796)
    {
        int _1844 = ~_1814;
        int _1846 = _1844 + 1;
        _1840 = _1846;
    }
    int _1848 = _1840;
    float _1850 = fma(_1818, _1818, _1826);
    bool _1852 = uint(_1784) >= 2u;
    float _1854 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1794);
    int _1856 = abs(_1848);
    float _1858 = sqrt(_1850);
    int _1860 = _1852 ? 0 : 1;
    float _1862 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1854);
    bool _1864 = !_1786;
    int _1866 = _1864 ? 0 : 1;
    bool _1868 = _1784 != 3;
    int _1870 = ~_1860;
    int _1872 = _1870 + 1;
    int _1874 = _1872 + 1;
    int _1876 = _1874;
    if (_1834)
    {
        int _1878 = ~_1860;
        int _1880 = _1878 + 1;
        _1876 = _1880;
    }
    int _1882 = _1876;
    int _1884 = ~_1856;
    int _1886 = _1884 + 1;
    int _1888 = _1886 + 1;
    bool _1890 = !_1868;
    int _1892 = _1890 ? 0 : (-1);
    int _1894 = abs(_1866);
    int _1896 = _1888 * as_type<int>(_1730);
    int _1898 = abs(_1882);
    int _1900 = abs(_1892);
    int _1902 = ~_1894;
    int _1904 = _1902 + 1;
    int _1906 = _1904 + 1;
    bool _1908 = !_1078;
    int _1910 = _1908 ? 0 : 1;
    int _1912 = _1906 * as_type<int>(_1722);
    int _1914 = _1912 + _1896;
    bool _1916 = _1858 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1918 = ~_1898;
    int _1920 = _1918 + 1;
    int _1922 = _1920 + 1;
    int _1924 = abs(_1910);
    float _1926 = _1862 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _1928 = ~_1900;
    int _1930 = _1928 + 1;
    int _1932 = _1930 + 1;
    int _1934 = _1922 * as_type<int>(_1774);
    int _1936 = _1934 + _1914;
    float _1938 = _1158 + _1926;
    int _1940 = _1932 * as_type<int>(_1782);
    int _1942 = _1940 + _1936;
    int _1944 = ~_1924;
    int _1946 = _1944 + 1;
    int _1948 = _1946 + 1;
    float _1950 = _1782;
    if (!_1916)
    {
        _1066 = _1798;
    }
    float _1952 = _1066;
    float _1954 = _1952;
    if (!_1916)
    {
        _1950 = _1938;
    }
    float _1956 = _1950;
    bool _1958 = !_1916;
    float _1960 = _1956;
    if (!_1958)
    {
        float _1962 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1964 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1966 = _1858 + _1964;
        float _1968 = _1938 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1970 = rsqrt(_1850);
        float _1972 = _1966 * _1962;
        float _1974 = _1972 * 0.15915493667125701904296875;
        float _1976 = _1974 * 6.283185482025146484375;
        float _1978 = cos(_1976);
        float _1980 = _1974 * 6.283185482025146484375;
        float _1982 = sin(_1980);
        float _1984 = _1978 + (-1.0);
        float _1986 = _1984 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1988 = fma(_1982, _1968, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1990 = fma(_1938, _1978, _1986);
        float _1992 = _1970 * _1988;
        float _1994 = fma(_1818, _1992, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1996 = fma(_1812, _1992, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1960 = _1990;
        _1842 = _1994;
        _1954 = _1996;
    }
    float _1998 = _1960;
    float _2000 = _1842;
    float _2002 = _1954;
    float _2004 = fma(_109, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1142);
    float _2006 = fma(_109, (*spvDescriptorSet0.vp_c9)._m0[77].w, _813);
    int _2008 = _1942 * _1948;
    float _2010 = fma(_109, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1574);
    float _2012 = -_2004;
    float _2014 = _2012 + 1.0;
    float _2016 = -_2006;
    float _2018 = _2016 + 1.0;
    float _2020 = fma(_109, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1538);
    float _2022 = -_2010;
    float _2024 = _2022 + 1.0;
    float _2026 = -_2014;
    float _2028 = fma(_2026, _1072, _1298);
    float _2030 = fma(_2018, _1090, _1304);
    float _2032 = -_1158;
    float _2034 = _2032 + _1998;
    float _2036 = -_2020;
    float _2038 = _2036 + 1.0;
    float _2040 = -_1162;
    float _2042 = _2040 + _2000;
    float _2044 = _2034 * _2034;
    float _2046 = -_2024;
    float _2048 = fma(_1646, _2046, _1680);
    float _2050 = fma(_1666, _2038, _1738);
    float _2052 = -_1018;
    float _2054 = _2052 + _2002;
    float _2056 = fma(_2042, _2042, _2044);
    float _2058 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _2060 = !_946;
    int _2062 = _2060 ? _1838 : (-1);
    float _2064 = fma(_1456, _1438, _1758);
    float _2066 = fma(_2054, _2054, _2056);
    float _2068 = _2058 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2070 = sqrt(_2066);
    int _2072 = _2062 * _1924;
    int _2074 = _2072 + _2008;
    float _2076 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2078 = _1754 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2080 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2082 = fma(_1356, (*spvDescriptorSet0.vp_c9)._m0[158].x, _2064);
    float _2084 = _2076 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2086 = _1232 + (*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _2088 = _2080 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2090 = _1222 + (*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _2092 = float(_2074);
    float _2094 = _1234 + (*spvDescriptorSet0.vp_c8)._m0[26].z;
    out.m_62.w = _1558;
    float _2096 = -_1578;
    float _2098 = _1162 + _2096;
    float _2100 = -_1600;
    float _2102 = _1018 + _2100;
    out.m_64.x = _2084;
    out.m_64.y = _2088;
    out.m_64.z = _2068;
    out.m_64.w = _2078;
    bool _2104 = _2070 > 0.0;
    out.m_66.x = _2082;
    out.m_68.x = _1702;
    out.m_70.y = _2092;
    out.m_72.x = _2086;
    out.m_72.y = _2090;
    out.m_72.z = _2094;
    out.m_74.x = _2028;
    out.m_74.y = _2030;
    out.m_74.z = _2048;
    out.m_74.w = _2050;
    float _2106 = -_1576;
    float _2108 = _2106 + _1998;
    float _2110 = -_1578;
    float _2112 = _2110 + _2000;
    float _2114 = -_1600;
    float _2116 = _2114 + _2002;
    float _2118 = -_1576;
    float _2120 = _1158 + _2118;
    bool _2122 = !_2104;
    float _2124 = _2088;
    float _2126 = _2084;
    float _2128 = _2108;
    float _2130 = _2112;
    float _2132 = _2116;
    float _2134 = _2088;
    float _2136 = _2068;
    float _2138 = _2084;
    if (!_2122)
    {
        bool _2140 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2142 = _2050;
        if (_2140)
        {
            float _2144 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2142 = _2144;
        }
        float _2146 = _2142;
        float _2148 = _2146;
        if (_2140)
        {
            float _2150 = _539 * _2146;
            _2124 = _2150;
        }
        float _2152 = _2124;
        float _2154 = _2152;
        if (_2140)
        {
            float _2156 = _537 * _2146;
            _2126 = _2156;
        }
        float _2158 = _2126;
        float _2160 = _2158;
        if (_2140)
        {
            float _2162 = _541 * _2146;
            _2148 = _2162;
        }
        float _2164 = _2148;
        float _2166 = _2164;
        if (!_2140)
        {
            float _2168 = _109 + 1.0;
            if (!_171)
            {
                float _2170 = _2168 * _2168;
                float _2172 = _2170 * 0.5;
                _119 = _2172;
            }
            float _2174 = _119;
            float _2176 = _2174;
            if (!_171)
            {
                float _2178 = _2174 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2176 = _2178;
            }
            float _2180 = _2176;
            bool _2182 = !_171;
            float _2184 = _2180;
            if (!_2182)
            {
                float _2186 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2188 = log2(_2186);
                float _2190 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2192 = _2190 + 1.0;
                float _2194 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2196 = _2188 * _2168;
                float _2198 = 1.0 / _2192;
                float _2200 = _2194 * 0.693147182464599609375;
                float _2202 = exp2(_2196);
                float _2204 = 1.0 / _2200;
                float _2206 = _2202 + (-1.0);
                float _2208 = -_2206;
                float _2210 = fma(_2208, _2204, _2168);
                float _2212 = _2210 * _2198;
                float _2214 = _2212 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2184 = _2214;
            }
            float _2216 = _2184;
            float _2218 = _2216 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _2220 = _2216 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _2222 = _2216 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _2224 = _2218 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
            float _2226 = _2218 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
            float _2228 = _2218 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
            float _2230 = fma(_2220, (*spvDescriptorSet0.vp_c10)._m0[8].y, _2224);
            float _2232 = fma(_2220, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2226);
            float _2234 = _2226;
            if (!_171)
            {
                _2234 = _2168;
            }
            float _2236 = _2234;
            float _2238 = fma(_2222, (*spvDescriptorSet0.vp_c10)._m0[10].y, _2230);
            bool _2240 = !_171;
            float _2242 = _2236;
            if (!_2240)
            {
                float _2244 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2246 = log2(_2244);
                float _2248 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2250 = _2248 + 1.0;
                float _2252 = 1.0 / _2250;
                float _2254 = _2246 * _2168;
                float _2256 = exp2(_2254);
                float _2258 = -_2256;
                float _2260 = _2258 + 1.0;
                float _2262 = _2260 * _2252;
                _2242 = _2262;
            }
            float _2264 = _2242;
            float _2266 = fma(_2220, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2228);
            float _2268 = fma(_2222, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2232);
            float _2270 = fma(_2264, _179, _2238);
            float _2272 = fma(_2222, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2266);
            float _2274 = fma(_2264, _177, _2268);
            float _2276 = -_487;
            float _2278 = _2276 + _2270;
            float _2280 = fma(_2264, _181, _2272);
            float _2282 = -_485;
            float _2284 = _2282 + _2274;
            float _2286 = _2278 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _2288 = _2278 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _2290 = _2278 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _2292 = -_489;
            float _2294 = _2292 + _2280;
            float _2296 = fma(_2284, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2286);
            float _2298 = fma(_2284, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2288);
            float _2300 = fma(_2284, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2290);
            float _2302 = fma(_2294, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2296);
            float _2304 = fma(_2294, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2298);
            float _2306 = fma(_2294, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2300);
            _551 = _2304;
            _553 = _2302;
            _555 = _2306;
            _2154 = _2302;
            _2160 = _2304;
            _2166 = _2306;
        }
        float _2308 = _551;
        float _2310 = _553;
        float _2312 = _555;
        float _2314 = _2154;
        float _2316 = _2160;
        float _2318 = _2166;
        float _2320 = _2308 * _2308;
        float _2322 = rsqrt(_2066);
        float _2324 = fma(_2310, _2310, _2320);
        float _2326 = fma(_2312, _2312, _2324);
        float _2328 = sqrt(_2326);
        float _2330 = _2042 * _2322;
        float _2332 = _2034 * _2322;
        float _2334 = _2054 * _2322;
        bool _2336 = _2328 > 0.0;
        bool _2338 = !_2336;
        _2134 = _2314;
        _2136 = _2330;
        _2138 = _2316;
        _557 = _2312;
        if (!_2338)
        {
            float _2340 = rsqrt(_2326);
            float _2342 = _2340 * _2308;
            float _2344 = _2340 * _2310;
            float _2346 = _2340 * _2312;
            float _2348 = _2332 * _2342;
            float _2350 = fma(_2330, _2344, _2348);
            float _2352 = fma(_2334, _2346, _2350);
            float _2354 = _2352 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2356 = fma(_2314, _2354, _2112);
            float _2358 = fma(_2316, _2354, _2108);
            float _2360 = fma(_2318, _2354, _2116);
            _2128 = _2358;
            _2130 = _2356;
            _2132 = _2360;
        }
    }
    float _2362 = _2128;
    float _2364 = _2130;
    float _2366 = _2132;
    float _2368 = _2134;
    float _2370 = _2136;
    float _2372 = _2138;
    float _2374 = _557;
    float _2376 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2378 = _2362 + _2376;
    float _2380 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2382 = _2364 + _2380;
    float _2384 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2386 = _2366 + _2384;
    float _2388 = _2378 * _2378;
    float _2390 = fma(_2382, _2382, _2388);
    float _2392 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2394 = fma(_2386, _2386, _2390);
    float _2396 = rsqrt(_2394);
    float _2398 = sqrt(_2394);
    float _2400 = _2396 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2402 = _2382 * _2400;
    float _2404 = _2386 * _2400;
    float _2406 = _2402 * _2402;
    float _2408 = _2404 * _2404;
    float _2410 = _2406 + _2408;
    float _2412 = sqrt(_2410);
    bool _2414 = _2412 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2416 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2418 = _2412 + _2416;
    float _2420 = _2368;
    float _2422 = _2418;
    float _2424 = _2370;
    float _2426 = _2378;
    float _2428 = _2374;
    float _2430 = _2402;
    if (_2414)
    {
        float _2432 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2420 = _2432;
    }
    float _2434 = _2420;
    float _2436 = _2434;
    if (_2414)
    {
        float _2438 = _2418 * _2434;
        _2422 = _2438;
    }
    float _2440 = _2422;
    if (_2414)
    {
        float _2442 = rsqrt(_2410);
        _2436 = _2442;
    }
    float _2444 = _2436;
    float _2446 = _2444;
    if (_2414)
    {
        float _2448 = _2440 * 0.15915493667125701904296875;
        _2424 = _2448;
    }
    float _2450 = _2424;
    float _2452 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2454 = _2386;
    if (_2414)
    {
        float _2456 = _2450 * 6.283185482025146484375;
        float _2458 = sin(_2456);
        _2454 = _2458;
    }
    float _2460 = _2454;
    float _2462 = _2362 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2464 = precise::max(0.0, _2452);
    float _2466 = _2372;
    float _2468 = _2464;
    if (_2414)
    {
        float _2470 = _2450 * 6.283185482025146484375;
        float _2472 = cos(_2470);
        _2466 = _2472;
    }
    float _2474 = _2466;
    float _2476 = -_2400;
    float _2478 = -_2464;
    float _2480 = fma(_2378, _2476, _2478);
    float _2482 = fma(_2364, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2462);
    if (_2414)
    {
        float _2484 = _2480 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2426 = _2484;
    }
    float _2486 = _2426;
    float _2488 = fma(_2366, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2482);
    float _2490 = _2460;
    float _2492 = _2486;
    if (_2414)
    {
        float _2494 = fma(_2460, _2486, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2490 = _2494;
    }
    float _2496 = _2490;
    float _2498 = _2496;
    if (!_2414)
    {
        _2492 = _2480;
    }
    float _2500 = _2492;
    float _2502 = _2488 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2504 = _2500;
    if (_2414)
    {
        float _2506 = _2444 * _2496;
        _2428 = _2506;
    }
    float _2508 = _2428;
    if (!_2414)
    {
        _2498 = _2406;
    }
    float _2510 = _2498;
    float _2512 = _2362 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2514 = _2510;
    float _2516 = _2474;
    if (_2414)
    {
        float _2518 = _2474 + (-1.0);
        _2468 = _2518;
    }
    float _2520 = _2468;
    float _2522 = _2520;
    if (_2414)
    {
        float _2524 = _2402 * _2508;
        _2430 = _2524;
    }
    float _2526 = _2430;
    float _2528 = fma(_2364, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2512);
    if (_2414)
    {
        float _2530 = _2520 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2446 = _2530;
    }
    float _2532 = _2446;
    if (!_2414)
    {
        _2522 = _2404;
    }
    float _2534 = _2522;
    float _2536 = _2534;
    if (_2414)
    {
        float _2538 = _2404 * _2508;
        _2536 = _2538;
    }
    float _2540 = _2536;
    if (_2414)
    {
        float _2542 = _2526 * _2526;
        _2514 = _2542;
    }
    float _2544 = _2514;
    if (_2414)
    {
        float _2546 = fma(_2480, _2474, _2532);
        _2504 = _2546;
    }
    float _2548 = _2504;
    if (!_2414)
    {
        _2516 = _2408;
    }
    float _2550 = _2516;
    float _2552 = _2550;
    if (_2414)
    {
        float _2554 = _2540 * _2540;
        _2552 = _2554;
    }
    float _2556 = _2552;
    float _2558 = _2362 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2560 = fma(_2548, _2548, _2544);
    float _2562 = fma(_2366, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2528);
    float _2564 = fma(_2364, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2558);
    float _2566 = _2560 + _2556;
    float _2568 = _2362 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2570 = fma(_2366, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2564);
    float _2572 = _2562 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2574 = rsqrt(_2566);
    float _2576 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2578 = fma(_2398, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2576);
    float _2580 = precise::clamp(_2578, 0.0, 1.0);
    float _2582 = fma(_2364, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2568);
    float _2584 = _2570 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2586 = -_2580;
    float _2588 = _2586 + 1.0;
    float _2590 = fma(_2366, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2582);
    float _2592 = _2572 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2594 = _2590 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2596 = abs(_2588);
    float _2598 = log2(_2596);
    float _2600 = -_2592;
    float _2602 = fma(_2600, _2392, 1.0);
    float _2604 = _2594 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2606 = _2574 * _2526;
    float _2608 = _2574 * _2548;
    float _2610 = _2574 * _2540;
    float _2612 = fma(_2584, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2604);
    float _2614 = _2606 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2616 = _2594 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2618 = log2(_2602);
    float _2620 = fma(_2572, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2612);
    float _2622 = -_2614;
    float _2624 = fma(_2608, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2622);
    float _2626 = fma(_2584, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2616);
    float _2628 = _2598 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2630 = -_2610;
    float _2632 = fma(_2630, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2624);
    float _2634 = fma(_2502, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2620);
    float _2636 = _2594 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2638 = exp2(_2628);
    float _2640 = fma(_2632, -0.5, 0.5);
    float _2642 = fma(_2632, 0.5, 0.5);
    float _2644 = fma(_2584, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2636);
    float _2646 = _2608 + 1.0;
    float _2648 = fma(_2572, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2626);
    float _2650 = fma(_2642, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2652 = fma(_2572, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2644);
    float _2654 = 1.0 / _2634;
    float _2656 = _2618 * 0.693147182464599609375;
    float _2658 = fma(_2642, _2650, -0.212114393711090087890625);
    float _2660 = _2656 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2662 = fma(_2642, _2658, 1.570728778839111328125);
    float _2664 = sqrt(_2640);
    float _2666 = -_2608;
    float _2668 = fma(_2638, _2646, _2666);
    float _2670 = fma(_2502, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2648);
    float _2672 = fma(_2502, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2652);
    float _2674 = fma(_2668, 0.5, 0.5);
    float _2676 = _2670 * _2654;
    float _2678 = _2672 * _2654;
    float _2680 = fma(_2676, 0.5, 0.5);
    float _2682 = fma(_2678, -0.5, 0.5);
    float _2684 = _2664 * 0.636619746685028076171875;
    float _2686 = -_2662;
    float _2688 = fma(_2684, _2686, 1.0);
    float3 _7410 = float3(_2680, _2682, _2660);
    float _2690 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7410, float3(0.0), isnan(_7410)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7410, float3(0.0), isnan(_7410)), level(0.0)).x;
    float3 _7421 = float3(_2680, _2682, _2660);
    float4 _2693 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7421, float3(0.0), isnan(_7421)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7421, float3(0.0), isnan(_7421)), level(0.0)).xyzw;
    float _2695 = _2693.x;
    float _2697 = _2693.y;
    float _2699 = _2693.z;
    float _2701 = _2693.w;
    float2 _7438 = float2(_2688, _2674);
    float3 _2705 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7438, float2(0.0), isnan(_7438)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7438, float2(0.0), isnan(_7438)), level(0.0)).xyz;
    float _2707 = _2705.x;
    float _2709 = _2705.y;
    float _2711 = _2705.z;
    float _2713 = _2120 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2715 = _2594 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2717 = _2598 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_76.x = _2098;
    out.m_76.y = _2120;
    out.m_76.z = _2102;
    float _2719 = fma(_2098, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2713);
    float _2721 = fma(_2584, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2715);
    float _2723 = _2634 * 0.5;
    bool _2725 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2727 = isnan(0.5);
    bool _2729 = _2725 || _2727;
    bool _2731 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2733 = _2729 || _2731;
    float _2735 = fma(_2102, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2719);
    float _2737 = _2120 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2739 = fma(_2572, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2721);
    float _2741 = _2735 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2743 = fma(_2098, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2737);
    float _2745 = fma(_2502, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2739);
    float _2747 = _2670 + _2634;
    float _2749 = 1.0 / _2741;
    float _2751 = fma(_2102, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2743);
    float _2753 = _2747 * 0.5;
    out.gl_Position.x = _2670;
    out.gl_Position.y = _2672;
    out.gl_Position.z = _2745;
    out.gl_Position.w = _2634;
    float _2755 = _2751 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2757 = exp2(_2717);
    float _2759 = _2755 + _2741;
    float _2761 = _2745 + _2634;
    float _2763 = _2761 * 0.5;
    float _2765 = _2759 * _2749;
    float _2767 = _2765 * 0.5;
    float _2769 = fma(_2672, -0.5, _2723);
    float _2771 = _2723;
    float _2773 = _2672;
    float _2775 = _2745;
    float _2777 = _2634;
    if (_2733)
    {
        _2771 = 1.0;
    }
    float _2779 = _2771;
    float _2781 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2783 = fma(_2767, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2781);
    out.m_78.x = _2753;
    out.m_78.y = _2769;
    out.m_78.z = _2763;
    out.m_78.w = _2634;
    float _2785 = -_2757;
    float _2787 = _2785 + 1.0;
    float _2789 = _2757;
    float _2791 = _2779;
    if (_2733)
    {
        _2789 = 1.0;
    }
    float _2793 = _2789;
    float _2795 = 1.0 / _2783;
    float _2797 = _2787 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2799 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2801 = _2795 * _2799;
    float _2803 = _2793;
    float _2805 = _2697;
    float _2807 = _2695;
    if (!_2733)
    {
        float _2809 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2811 = _2809 * 0.15915493667125701904296875;
        float _2813 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2815 = _2811 * 6.283185482025146484375;
        float _2817 = cos(_2815);
        float _2819 = _2813 * 0.15915493667125701904296875;
        float _2821 = _2811 * 6.283185482025146484375;
        float _2823 = sin(_2821);
        float _2825 = 1.0 / _2817;
        float _2827 = _2819 * 6.283185482025146484375;
        float _2829 = cos(_2827);
        float _2831 = _2823 * _2825;
        float _2833 = _2819 * 6.283185482025146484375;
        float _2835 = sin(_2833);
        float _2837 = _2829 * _2831;
        float _2839 = 1.0 / _2837;
        float _2841 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2843 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2841;
        float _2845 = 1.0 / _2843;
        float _2847 = _2835 * _2839;
        float _2849 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2851 = fma(_2801, _2847, _2849);
        float _2853 = _2851 * _2845;
        float _2855 = precise::clamp(_2853, 0.0, 1.0);
        _2773 = _2839;
        _2791 = _2855;
        _2775 = _2843;
        _2777 = _2825;
    }
    float _2857 = _2773;
    float _2859 = _2791;
    float _2861 = _2775;
    float _2863 = _2777;
    float _2865 = _2857;
    float _2867 = _2861;
    float _2869 = _2863;
    if (!_2733)
    {
        float _2871 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2873 = _2871 * 0.15915493667125701904296875;
        float _2875 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2877 = _2873 * 6.283185482025146484375;
        float _2879 = cos(_2877);
        float _2881 = _2875 * 0.15915493667125701904296875;
        float _2883 = _2873 * 6.283185482025146484375;
        float _2885 = sin(_2883);
        float _2887 = 1.0 / _2879;
        float _2889 = _2881 * 6.283185482025146484375;
        float _2891 = cos(_2889);
        float _2893 = _2885 * _2887;
        float _2895 = _2881 * 6.283185482025146484375;
        float _2897 = sin(_2895);
        float _2899 = _2891 * _2893;
        float _2901 = 1.0 / _2899;
        float _2903 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2905 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2903;
        float _2907 = 1.0 / _2905;
        float _2909 = _2897 * _2901;
        float _2911 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2913 = fma(_2801, _2909, _2911);
        float _2915 = _2913 * _2907;
        float _2917 = precise::clamp(_2915, 0.0, 1.0);
        float _2919 = -_2917;
        float _2921 = _2919 + 1.0;
        _2803 = _2921;
        _2865 = _2907;
        _2867 = _2881;
        _2869 = _2873;
    }
    float _2923 = _2803;
    float _2925 = _2865;
    float _2927 = _2867;
    float _2929 = _2869;
    float _2931 = _2797 * _2690;
    float _2933 = -_2797;
    float _2935 = _2933 + 1.0;
    out.m_80.x = _2364;
    out.m_80.y = _2362;
    out.m_80.z = _2366;
    bool _2937 = _2398 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2939 = isnan(_2398);
    bool _2941 = _2937 || _2939;
    bool _2943 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2945 = _2941 || _2943;
    float _2947 = _2701 * _2931;
    float _2949 = _2711 * _2931;
    float _2951 = _2701 * _2935;
    float _2953 = _2859 * _2923;
    float _2955 = fma(_2707, _2947, _2695);
    float _2957 = fma(_2709, _2947, _2697);
    float _2959 = fma(_2701, _2949, _2699);
    float _2961 = _2953 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_82.x = _2955;
    out.m_82.y = _2957;
    out.m_82.z = _2959;
    out.m_82.w = _2951;
    float _2963 = _545 * _2961;
    float _2965 = _2929;
    float _2967 = _2927;
    float _2969 = _2925;
    float _2971 = _2961;
    if (!_2945)
    {
        _2805 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2973 = _2805;
    float _2975 = _2973;
    float _2977 = _2973;
    if (!_2945)
    {
        _2807 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2979 = _2807;
    float _2981 = _2979;
    float _2983 = _2979;
    if (!_2945)
    {
        _2965 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2985 = _2965;
    float _2987 = _2985;
    float _2989 = _2985;
    if (!_2945)
    {
        _2967 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2991 = _2967;
    float _2993 = _2991;
    float _2995 = _2991;
    if (!_2945)
    {
        _2969 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2997 = _2969;
    float _2999 = _2997;
    float _3001 = _2997;
    if (!_2945)
    {
        _2971 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3003 = _2971;
    bool _3005 = !_2945;
    float _3007 = _3003;
    float _3009 = _3003;
    if (!_3005)
    {
        bool _3011 = _2398 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3013 = isnan(_2398);
        bool _3015 = _3011 || _3013;
        bool _3017 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3019 = _3015 || _3017;
        if (!_3019)
        {
            float _3021 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3023 = _2398 + _3021;
            float _3025 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3027 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3025;
            float _3029 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3031 = _3029 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3033 = 1.0 / _3027;
            float _3035 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3037 = _3035 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3039 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3041 = _3039 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3043 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3045 = _3043 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3047 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3049 = _3047 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3051 = _3023 * _3033;
            float _3053 = precise::clamp(_3051, 0.0, 1.0);
            float _3055 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3057 = _3055 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3059 = fma(_3053, _3031, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3061 = fma(_3053, _3057, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3063 = fma(_3053, _3037, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3065 = fma(_3053, _3041, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3067 = fma(_3053, _3045, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3069 = fma(_3053, _3049, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2983 = _3063;
            _3001 = _3067;
            _2977 = _3059;
            _2995 = _3065;
            _2989 = _3061;
            _3009 = _3069;
            _3071 = true;
        }
        else
        {
            bool _3073 = _2398 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3075 = isnan(_2398);
            bool _3077 = _3073 || _3075;
            bool _3079 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3081 = _3077 || _3079;
            if (!_3081)
            {
                _2975 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3083 = _2975;
            _2977 = _3083;
            if (!_3081)
            {
                _2981 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3085 = _2981;
            _2983 = _3085;
            if (!_3081)
            {
                _2987 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3087 = _2987;
            _2989 = _3087;
            if (!_3081)
            {
                _2993 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3089 = _2993;
            _2995 = _3089;
            if (!_3081)
            {
                _2999 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3091 = _2999;
            _3001 = _3091;
            if (!_3081)
            {
                _3007 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3093 = _3007;
            bool _3095 = !_3081;
            _3009 = _3093;
            if (!_3095)
            {
                bool _3097 = _2398 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3099 = isnan(_2398);
                bool _3101 = _3097 || _3099;
                bool _3103 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3105 = _3101 || _3103;
                if (!_3105)
                {
                    float _3107 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3109 = _2398 + _3107;
                    float _3111 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3113 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3111;
                    float _3115 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3117 = _3115 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3119 = 1.0 / _3113;
                    float _3121 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3123 = _3121 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3125 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3127 = _3125 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3129 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3131 = _3129 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3133 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3135 = _3133 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3137 = _3109 * _3119;
                    float _3139 = precise::clamp(_3137, 0.0, 1.0);
                    float _3141 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3143 = _3141 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3145 = fma(_3139, _3117, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3147 = fma(_3139, _3143, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3149 = fma(_3139, _3123, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3151 = fma(_3139, _3127, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3153 = fma(_3139, _3131, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3155 = fma(_3139, _3135, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2983 = _3149;
                    _3001 = _3153;
                    _2977 = _3145;
                    _2995 = _3151;
                    _2989 = _3147;
                    _3009 = _3155;
                    _3071 = true;
                }
                else
                {
                    _2983 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3001 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2977 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2995 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2989 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3009 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3071 = false;
    float _3157 = _2983;
    float _3159 = _3001;
    float _3161 = _2977;
    float _3163 = _2995;
    float _3165 = _2989;
    float _3167 = _3009;
    float _3169 = fma(_2090, -0.5, 0.5);
    float _3171 = precise::clamp(_3169, 0.0, 1.0);
    float _3173 = -_3157;
    float _3175 = _3173 + _3159;
    float _3177 = -_3161;
    float _3179 = _3177 + _3163;
    out.m_84.x = 0.0;
    float _3181 = fma(_3171, _3175, _3157);
    float _3183 = -_3165;
    float _3185 = _3183 + _3167;
    float _3187 = fma(_3171, _3179, _3161);
    float _3189 = _3181 * 0.586610972881317138671875;
    bool _3191 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3193 = fma(_3171, _3185, _3165);
    float _3195 = _2963 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3197 = fma(_3187, 0.298911988735198974609375, _3189);
    bool _3199 = _2859 > 0.0;
    bool _3201 = isnan(_2859);
    bool _3203 = _3199 || _3201;
    bool _3205 = isnan(0.0);
    bool _3207 = _3203 || _3205;
    float _3209 = fma(_3193, 0.114477999508380889892578125, _3197);
    out.m_51.x = _3195;
    bool _3211 = _2923 <= 0.0;
    bool _3213 = !_3207;
    bool _3215 = _3211 || _3213;
    float _3217 = -_3209;
    float _3219 = _3187 + _3217;
    float _3221 = -_3209;
    float _3223 = _3181 + _3221;
    float _3225 = -_3209;
    float _3227 = _3193 + _3225;
    float _3229 = fma(_3219, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3209);
    float _3231 = fma(_3223, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3209);
    float _3233 = fma(_3227, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3209);
    bool _3235 = !_3191;
    if (!_3235)
    {
        float _3237 = -_2362;
        float _3239 = _3237 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3241 = -_2364;
        float _3243 = _3241 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3245 = -_2366;
        float _3247 = _3245 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3249 = _3239 * _3239;
        float _3251 = fma(_3243, _3243, _3249);
        float _3253 = fma(_3247, _3247, _3251);
        float _3255 = sqrt(_3253);
        float _3257 = rsqrt(_3253);
        float _3259 = -_3255;
        float _3261 = _3259 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3263 = _3261 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3265 = precise::clamp(_3263, 0.0, 1.0);
        float _3267 = _3243 * _3257;
        float _3269 = _3239 * _3257;
        float _3271 = abs(_3265);
        float _3273 = log2(_3271);
        float _3275 = _3247 * _3257;
        float _3277 = _3267 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3279 = _2090 * _3269;
        float _3281 = -_3269;
        float _3283 = -_3277;
        float _3285 = fma(_3281, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3283);
        float _3287 = fma(_2086, _3267, _3279);
        float _3289 = -_3275;
        float _3291 = fma(_3289, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3285);
        float _3293 = fma(_2094, _3275, _3287);
        float _3295 = precise::clamp(_3293, 0.0, 1.0);
        float _3297 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3299 = _3291 + _3297;
        float _3301 = _3273 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3303 = _3299 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3305 = precise::clamp(_3303, 0.0, 1.0);
        float _3307 = exp2(_3301);
        float _3309 = _3307 * _3305;
        float _3311 = _3295 * _3309;
        float _3313 = _3311 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3315 = _3311 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3317 = _3311 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_84.x = _3313;
        out.m_84.y = _3315;
        out.m_84.z = _3317;
    }
    out.m_62.x = _3229;
    out.m_62.y = _3231;
    out.m_62.z = _3233;
    if (!_3215)
    {
        return out;
    }
    out.m_51.x = 0.0;
    float _3319 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3319;
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
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3071 = false;
    bool _677 = false;
    bool _575 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _98 = in.m_44.w;
    float _100 = in.m_46.w;
    float _102 = trunc(_98);
    int _105 = int(_102);
    float _107 = -_100;
    float _109 = _107 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_49.y = _109;
    bool _113 = _105 >= 1;
    float _115 = 0.0;
    float _117 = _100;
    float _119 = _109;
    if (!_113)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _121 = _115;
    if (!_113)
    {
        out.m_51.x = 0.0;
    }
    int _123 = 0;
    if (!_113)
    {
        float _125 = _121 * 5.0;
        _123 = as_type<int>(_125);
    }
    int _127 = _123;
    int _129 = _127;
    if (!_113)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3387 = as_type<float>(_127);
        out.gl_Position.z = _3387;
    }
    if (!_113)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _131 = _100 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _133 = isnan(_100);
    bool _135 = _131 || _133;
    bool _137 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _139 = _135 || _137;
    float _141 = float(_105);
    bool _143 = _109 >= _141;
    bool _145 = !_139;
    bool _147 = _143 || _145;
    if (_147)
    {
        _117 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _149 = _117;
    if (_147)
    {
        out.m_51.x = 0.0;
    }
    if (_147)
    {
        float _151 = _149 * 5.0;
        _129 = as_type<int>(_151);
    }
    int _153 = _129;
    if (_147)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3442 = as_type<float>(_153);
        out.gl_Position.z = _3442;
    }
    if (_147)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _155 = in.m_53.x;
    float _157 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _159 = _109 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _161 = as_type<float>(int(gl_VertexIndex));
    bool _163 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _165 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _167 = _163 || _165;
    bool _169 = isnan(1.0);
    bool _171 = _167 || _169;
    float _173 = _159 * _157;
    float _175 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[20].x, _173);
    float _177 = in.m_46.x;
    float _179 = in.m_46.y;
    float _181 = in.m_46.z;
    float _183 = floor(_175);
    float _185 = _175 * 6.283185482025146484375;
    int _187 = as_type<int>(_161) & 1;
    bool _189 = _187 != 0;
    int _191 = as_type<int>(_161) & 2;
    bool _193 = _191 != 0;
    float _195 = _109 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    int _197 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _199 = _197 != 0;
    float _201 = _185 * 0.15915493667125701904296875;
    bool _203 = !_189;
    float _205 = _203 ? (-0.5) : 0.5;
    float _207 = _201 * 6.283185482025146484375;
    float _209 = cos(_207);
    bool _211 = !_193;
    float _213 = _211 ? (-0.5) : 0.5;
    float _215 = -_183;
    float _217 = _175 + _215;
    float _219 = _183;
    float _221 = _195;
    if (!_171)
    {
        float _223 = _195 * _195;
        float _225 = _223 * 0.5;
        _219 = _225;
    }
    float _227 = _219;
    float _229 = _227;
    if (!_171)
    {
        float _231 = _227 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _229 = _231;
    }
    float _233 = _229;
    bool _235 = !_171;
    float _237 = _233;
    if (!_235)
    {
        float _239 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _241 = log2(_239);
        float _243 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _245 = _243 + 1.0;
        float _247 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _249 = _195 * _241;
        float _251 = 1.0 / _245;
        float _253 = _247 * 0.693147182464599609375;
        float _255 = exp2(_249);
        float _257 = 1.0 / _253;
        float _259 = _255 + (-1.0);
        float _261 = -_259;
        float _263 = fma(_261, _257, _195);
        float _265 = _263 * _251;
        float _267 = _265 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _237 = _267;
    }
    float _269 = _237;
    bool _271 = !_171;
    if (!_271)
    {
        float _273 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _275 = log2(_273);
        float _277 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _279 = _277 + 1.0;
        float _281 = 1.0 / _279;
        float _283 = _195 * _275;
        float _285 = exp2(_283);
        float _287 = -_285;
        float _289 = _287 + 1.0;
        float _291 = _289 * _281;
        _221 = _291;
    }
    float _293 = _221;
    float _295 = _269 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _297 = in.m_58.w;
    float _299 = _269 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _301 = _295 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _303 = in.m_44.x;
    float _305 = in.m_44.y;
    float _307 = in.m_44.z;
    float _309 = _295 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _311 = _295 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _313 = fma(_299, (*spvDescriptorSet0.vp_c10)._m0[8].x, _301);
    bool _315 = _217 < 0.5;
    float _317 = float(_315);
    float _319 = fma(_299, (*spvDescriptorSet0.vp_c10)._m0[8].y, _309);
    float _321 = fma(_299, (*spvDescriptorSet0.vp_c10)._m0[8].z, _311);
    float _323 = _269 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _325 = fma(_209, 0.5, 0.5);
    float _327 = -_217;
    float _329 = fma(_327, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _331 = -_317;
    float _333 = fma(_331, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _335 = fma(_323, (*spvDescriptorSet0.vp_c10)._m0[10].x, _313);
    float _337 = fma(_323, (*spvDescriptorSet0.vp_c10)._m0[10].y, _319);
    float _339 = fma(_323, (*spvDescriptorSet0.vp_c10)._m0[10].z, _321);
    float _341 = _321;
    float _343 = _339;
    if (!_171)
    {
        float _345 = _109 * _109;
        float _347 = _345 * 0.5;
        _341 = _347;
    }
    float _349 = _341;
    float _351 = fma(_293, _177, _335);
    float _353 = fma(_293, _179, _337);
    float _355 = -_325;
    float _357 = fma(_355, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _359 = fma(_293, _181, _339);
    float _361 = _349;
    if (!_171)
    {
        float _363 = _349 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _361 = _363;
    }
    float _365 = _361;
    bool _367 = !_171;
    float _369 = _365;
    if (!_367)
    {
        float _371 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _373 = log2(_371);
        float _375 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _377 = _109 * _373;
        float _379 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _381 = _379 + 1.0;
        float _383 = 1.0 / _381;
        float _385 = _375 * 0.693147182464599609375;
        float _387 = exp2(_377);
        float _389 = 1.0 / _385;
        float _391 = _387 + (-1.0);
        float _393 = -_391;
        float _395 = fma(_393, _389, _109);
        float _397 = _395 * _383;
        float _399 = _397 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _369 = _399;
        _343 = _387;
    }
    float _401 = _369;
    float _403 = _343;
    float _405 = _401 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _407 = fma(_351, _297, _303);
    float _409 = fma(_353, _297, _305);
    float _411 = _403;
    if (!_171)
    {
        _411 = _109;
    }
    float _413 = _411;
    bool _415 = !_171;
    float _417 = _413;
    if (!_415)
    {
        float _419 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _421 = log2(_419);
        float _423 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _425 = _423 + 1.0;
        float _427 = 1.0 / _425;
        float _429 = _109 * _421;
        float _431 = exp2(_429);
        float _433 = -_431;
        float _435 = _433 + 1.0;
        float _437 = _435 * _427;
        _417 = _437;
    }
    float _439 = _417;
    int _441 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _443 = _441 != 0;
    int _445 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _447 = _445 != 0;
    float _449 = fma(_359, _297, _307);
    float _451 = _401 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _453 = _405 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _455 = _405 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    bool _457 = !_443;
    int _459 = _457 ? 0 : 1;
    float _461 = _405 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _463 = fma(_451, (*spvDescriptorSet0.vp_c10)._m0[8].x, _453);
    float _465 = _401 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    int _467 = abs(_459);
    float _469 = fma(_451, (*spvDescriptorSet0.vp_c10)._m0[8].y, _455);
    float _471 = fma(_451, (*spvDescriptorSet0.vp_c10)._m0[8].z, _461);
    float _473 = fma(_465, (*spvDescriptorSet0.vp_c10)._m0[10].x, _463);
    bool _475 = !_199;
    int _477 = _475 ? 0 : 1;
    float _479 = fma(_465, (*spvDescriptorSet0.vp_c10)._m0[10].y, _469);
    float _481 = fma(_465, (*spvDescriptorSet0.vp_c10)._m0[10].z, _471);
    float _483 = float(_467);
    float _485 = fma(_439, _177, _473);
    float _487 = fma(_439, _179, _479);
    float _489 = fma(_439, _181, _481);
    bool _491 = !_447;
    int _493 = _491 ? 0 : 1;
    float _495 = abs(_329);
    float _497 = _483 * _495;
    bool _499 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _501 = 1.0 / _141;
    float _503 = -_487;
    float _505 = _353 + _503;
    int _507 = abs(_477);
    float _509 = -_489;
    float _511 = _359 + _509;
    int _513 = abs(_493);
    float _515 = _505 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _517 = _505 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _519 = _505 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _521 = float(_507);
    float _523 = -_485;
    float _525 = _351 + _523;
    float _527 = fma(_525, (*spvDescriptorSet0.vp_c10)._m0[5].x, _517);
    float _529 = float(_513);
    float _531 = fma(_525, (*spvDescriptorSet0.vp_c10)._m0[4].x, _515);
    float _533 = fma(_525, (*spvDescriptorSet0.vp_c10)._m0[6].x, _519);
    float _535 = fma(_521, _357, _497);
    float _537 = fma(_511, (*spvDescriptorSet0.vp_c10)._m0[5].z, _527);
    float _539 = fma(_511, (*spvDescriptorSet0.vp_c10)._m0[4].z, _531);
    float _541 = fma(_511, (*spvDescriptorSet0.vp_c10)._m0[6].z, _533);
    float _543 = abs(_333);
    float _545 = fma(_529, _543, _535);
    float _547 = _109 * _501;
    bool _549 = !_499;
    float _551 = _537;
    float _553 = _539;
    float _555 = _541;
    float _557 = _541;
    float _573;
    if (!_549)
    {
        float _559 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _561 = _155 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _563 = fma(_561, (*spvDescriptorSet0.vp_c9)._m0[12].x, _109);
        float _565 = _563 * _559;
        float _567 = floor(_565);
        float _569 = -_567;
        float _571 = _565 + _569;
        _573 = _571;
        _575 = true;
    }
    else
    {
        _573 = _547;
    }
    _575 = false;
    float _577 = _573;
    float _579 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _581 = _577 + _579;
    float _583 = in.m_58.x;
    float _585 = in.m_58.y;
    bool _587 = _577 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _589 = isnan(_577);
    bool _591 = _587 || _589;
    bool _593 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _595 = _591 || _593;
    float _597 = float(_595);
    float _599 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _601 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _599;
    bool _603 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _605 = 1.0 / _601;
    float _607 = -_597;
    float _609 = _607 + 1.0;
    float _611 = _581 * _605;
    bool _613 = _577 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _615 = isnan(_577);
    bool _617 = _613 || _615;
    bool _619 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _621 = _617 || _619;
    float _623 = float(_621);
    float _625 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _627 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _625;
    float _629 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _631 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _629;
    float _633 = _623 * _609;
    float _635 = fma(_627, _611, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _637 = fma(_631, _611, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _639 = -_623;
    float _641 = _639 + 1.0;
    float _643 = _635 * _633;
    float _645 = _637 * _633;
    float _647 = fma(_641, (*spvDescriptorSet0.vp_c9)._m0[143].x, _643);
    float _649 = fma(_641, (*spvDescriptorSet0.vp_c9)._m0[143].y, _645);
    float _651 = fma(_597, (*spvDescriptorSet0.vp_c9)._m0[144].x, _647);
    float _653 = fma(_597, (*spvDescriptorSet0.vp_c9)._m0[144].y, _649);
    float _655 = _651 * _583;
    float _657 = _653 * _585;
    bool _659 = !_603;
    float _675;
    if (!_659)
    {
        float _661 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _663 = _155 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _665 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[11].y, _109);
        float _667 = _665 * _661;
        float _669 = floor(_667);
        float _671 = -_669;
        float _673 = _667 + _671;
        _675 = _673;
        _677 = true;
    }
    else
    {
        _675 = _547;
    }
    _677 = false;
    float _679 = _675;
    float _681 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _683 = int(_681);
    float _685 = in.m_53.z;
    float _687 = _655 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _689 = _657 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _691 = _409 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _693 = _205 * _687;
    float _695 = _213 * _689;
    float _697 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _699 = int(_697);
    float _701 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _703 = fma(_407, (*spvDescriptorSet0.vp_c10)._m0[6].x, _691);
    float _705 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _707 = _705 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _709 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _711 = float(_683);
    float _713 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _715 = _713 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _717 = 1.0 / _707;
    float _719 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _721 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _723 = _547 + _721;
    float _725 = float(uint(_699));
    float _727 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _729 = _727 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    int _731 = ~_699;
    int _733 = _731 + 1;
    float _735 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _737 = _735 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _739 = 1.0 / _711;
    int _741 = ~_699;
    int _743 = _741 + 1;
    float _745 = 1.0 / _725;
    float _747 = in.m_53.y;
    float _749 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _751 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _749;
    float _753 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _755 = _753 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _757 = _755 * _717;
    float _759 = _109 * _739;
    float _761 = 1.0 / _715;
    float _763 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _765 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _763;
    float _767 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _769 = _767 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _771 = _679 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _773 = isnan(_679);
    bool _775 = _771 || _773;
    bool _777 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _779 = _775 || _777;
    float _781 = float(_779);
    int _783 = as_type<int>(_745) + (-2);
    float _785 = trunc(_759);
    int _787 = int(_785);
    float _789 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _791 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _789;
    bool _793 = _547 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _795 = isnan(_547);
    bool _797 = _793 || _795;
    bool _799 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _801 = _797 || _799;
    float _803 = float(_801);
    float _805 = -_781;
    float _807 = _805 + 1.0;
    int _809 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _811 = _809 != 0;
    float _813 = fma(_747, (*spvDescriptorSet0.vp_c9)._m0[78].w, _719);
    float _815 = 1.0 / _729;
    float _817 = _765 * _761;
    bool _819 = !_811;
    float _821 = _819 ? 1.2345600128173828125 : 1.0;
    float _823 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _825 = _823 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _827 = float(uint(_787));
    float _829 = 1.0 / _737;
    float _831 = 0.0;
    float _833 = _693;
    float _835 = _695;
    float _837 = _685;
    if (!_811)
    {
        _831 = _685;
    }
    float _839 = _831;
    float _841 = _839;
    if (_811)
    {
        _841 = _747;
    }
    float _843 = _841;
    float _845 = as_type<float>(_783) * _827;
    float _847 = _825 * _815;
    float _849 = trunc(_845);
    float _851 = precise::max(_849, 0.0);
    uint _854 = uint(_851);
    float _856 = 1.0 / _769;
    bool _858 = !_811;
    float _860 = _858 ? _747 : _155;
    float _862 = _821 * _860;
    int _864 = _733 * int(_854);
    int _866 = _864 + _787;
    float _868 = floor(_862);
    float _870 = float(uint(_866));
    float _872 = as_type<float>(_783) * _870;
    float _874 = float(_699);
    float _876 = trunc(_872);
    float _878 = precise::max(_876, 0.0);
    uint _880 = uint(_878);
    float _882 = -_868;
    float _884 = _862 + _882;
    int _886 = int(_854) + int(_880);
    float _888 = float(_787);
    int _890 = _743 * _886;
    int _892 = _890 + _787;
    bool _894 = _888 >= _874;
    bool _896 = isnan(_888);
    bool _898 = _894 || _896;
    bool _900 = isnan(_874);
    bool _902 = _898 || _900;
    float _904 = float(_902);
    float _906 = _884 * _874;
    bool _908 = uint(_892) >= uint(_699);
    float _910 = trunc(_906);
    int _912 = int(_910);
    bool _914 = !_908;
    int _916 = _914 ? 0 : (-1);
    int _918 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _920 = _918 != 0;
    int _922 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _924 = _922 != 0;
    int _926 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _928 = _926 != 0;
    int _930 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _932 = _930 != 0;
    float _934 = _109 * _874;
    int _936 = ~_886;
    int _938 = _936 + _916;
    int _940 = _938 + 1;
    float _942 = trunc(_904);
    int _944 = int(_942);
    bool _946 = _699 == 0;
    float _948 = _934 * _501;
    int _950 = _699 + (-1);
    int _952 = _699 * _940;
    int _954 = _952 + _787;
    bool _956 = !_924;
    int _958 = _956 ? 0 : 1;
    int _960 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _962 = _960 != 0;
    float _964 = trunc(_948);
    int _966 = int(_964);
    bool _968 = !_946;
    int _970 = _968 ? _954 : (-1);
    bool _972 = !_962;
    int _974 = _972 ? 0 : 1;
    int _976 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _978 = _976 != 0;
    int _980 = abs(_974);
    int _982 = ~_944;
    int _984 = _982 + 1;
    int _986 = _984 + 1;
    int _988 = _912 * _980;
    int _990 = _988 + _787;
    float _992 = fma(_449, (*spvDescriptorSet0.vp_c10)._m0[6].z, _703);
    int _994 = _970 * _986;
    int _996 = _944 * _950;
    int _998 = _996 + _994;
    bool _1000 = !_920;
    int _1002 = _1000 ? 0 : 1;
    float _1004 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1006 = _1004 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _1008 = abs(_958);
    float _1010 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1012 = _1010 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _1014 = !_928;
    int _1016 = _1014 ? 0 : 1;
    float _1018 = _992 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1020 = abs(_1002);
    int _1022 = _998 * _1008;
    int _1024 = abs(_1016);
    float _1026 = 1.0 / _1006;
    float _1028 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1030 = _1018 + _1028;
    bool _1032 = !_932;
    int _1034 = _1032 ? 0 : 1;
    int _1036 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1038 = _1036 != 0;
    int _1040 = _966 * _1020;
    int _1042 = _1040 + _1022;
    int _1044 = abs(_1034);
    float _1046 = 1.0 / _1012;
    int _1048 = ~_699;
    int _1050 = _1048 + 1;
    int _1052 = _990 * _1024;
    int _1054 = _1052 + _1042;
    bool _1056 = _155 > 0.5;
    bool _1058 = _747 > 0.5;
    int _1060 = _912 * _1044;
    int _1062 = _1060 + _1054;
    float _1064 = as_type<float>(_1008);
    float _1066 = as_type<float>(_990);
    if (_978)
    {
        float _1068 = -_693;
        float _1070 = _1056 ? _1068 : _693;
        _833 = _1070;
    }
    float _1072 = _833;
    float _1074 = _409 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _1076 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1078 = _1076 != 0;
    float _1080 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1082 = float(uint(_1062));
    float _1084 = fma(_407, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1074);
    if (_1038)
    {
        float _1086 = -_695;
        float _1088 = _1058 ? _1086 : _695;
        _835 = _1088;
    }
    float _1090 = _835;
    float _1092 = _751 * _1026;
    int _1094 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1096 = _1094 != 0;
    float _1098 = as_type<float>(_783) * _1082;
    int _1100 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1102 = _1100 != 0;
    float _1104 = _409 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1106 = _155 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1108 = trunc(_1098);
    float _1110 = precise::max(_1108, 0.0);
    uint _1112 = uint(_1110);
    float _1114 = fma(_449, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1084);
    float _1116 = fma(_407, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1104);
    float _1118 = -_701;
    float _1120 = fma(_1106, 2.0, _1118);
    float _1122 = _747 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1124 = _213 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    if (!_811)
    {
        _1064 = _747;
    }
    float _1126 = _1064;
    float _1128 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1130 = in.m_53.w;
    float _1132 = fma(_1122, -2.0, _709);
    float _1134 = _1124 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1136 = fma(_449, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1116);
    float _1138 = _1126;
    if (_811)
    {
        _1138 = _155;
    }
    float _1140 = _1138;
    float _1142 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1128);
    int _1144 = _1050 * int(_1112);
    int _1146 = _1144 + _1062;
    float _1148 = _1124 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1150 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1152 = _1150 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1154 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1156 = float(uint(_1146));
    float _1158 = _1114 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1160 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1162 = _1136 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1164 = as_type<float>(_783) * _1156;
    float _1166 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1168 = _1158 + _1166;
    float _1170 = 1.0 / _1152;
    float _1172 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1174 = _1172 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1176 = _1160 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1178 = _1168 * _1168;
    float _1180 = _1140 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1182 = trunc(_1164);
    float _1184 = precise::max(_1182, 0.0);
    uint _1186 = uint(_1184);
    float _1188 = 1.0 / _1174;
    int _1190 = int(_1112) + int(_1186);
    int _1192 = ~_699;
    int _1194 = _1192 + 1;
    int _1196 = _1194 * _1190;
    int _1198 = _1196 + _1062;
    float _1200 = _791 * _1188;
    bool _1202 = _547 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _1204 = isnan(_547);
    bool _1206 = _1202 || _1204;
    bool _1208 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _1210 = _1206 || _1208;
    float _1212 = float(_1210);
    bool _1214 = uint(_1198) >= uint(_699);
    float _1216 = _205 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _1218 = !_1214;
    int _1220 = _1218 ? 0 : (-1);
    float _1222 = fma(_1216, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1148);
    bool _1224 = _685 > 0.5;
    if (_811)
    {
        _837 = _747;
    }
    float _1226 = _837;
    float _1228 = _1124 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _1230 = _1130 > 0.5;
    float _1232 = fma(_1216, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1134);
    float _1234 = fma(_1216, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1228);
    float _1236 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1238 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1240 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1242 = _1236 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1244 = _1238 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_60.x = _1242;
    out.m_60.y = _1244;
    out.m_60.z = _1176;
    out.m_60.w = _1240;
    float _1246 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1248 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _1246;
    float _1250 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _1252 = _1250 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1254 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1256 = _1254 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    float _1258 = fma(_109, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1132);
    float _1260 = _1248 * _1046;
    float _1262 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1264 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _1262;
    float _1266 = _1252 * _1170;
    float _1268 = 1.0 / _1256;
    float _1270 = _1080 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1272 = _1264 * _829;
    float _1274 = _1072 + 0.5;
    float _1276 = _1154 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1278 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1280 = _547 + _1278;
    float _1282 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _1284 = _1282 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1286 = -_109;
    float _1288 = fma(_1286, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1120);
    float _1290 = _1090 + (-0.5);
    float _1292 = fma(_847, _1280, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    float _1294 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1296 = _547 + _1294;
    float _1298 = fma(_1270, _1274, _1288);
    float _1300 = -_1276;
    float _1302 = -_1258;
    float _1304 = fma(_1300, _1290, _1302);
    float _1306 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1308 = _679 + _1306;
    float _1310 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1312 = _679 + _1310;
    float _1314 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1316 = _547 + _1314;
    float _1318 = fma(_1260, _1296, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _1320 = fma(_757, _1308, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1322 = fma(_1200, _1312, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1324 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1326 = _547 + _1324;
    float _1328 = fma(_817, _1316, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    float _1330 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1332 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _1330;
    float _1334 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1336 = _547 + _1334;
    float _1338 = fma(_1266, _1326, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    float _1340 = _1284 * _856;
    float _1342 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1344 = _679 + _1342;
    bool _1346 = _547 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _1348 = isnan(_547);
    bool _1350 = _1346 || _1348;
    bool _1352 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _1354 = _1350 || _1352;
    float _1356 = float(_1354);
    float _1358 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1360 = _547 + _1358;
    float _1362 = fma(_1272, _1336, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    float _1364 = fma(_1092, _1344, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1366 = _547 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _1368 = isnan(_547);
    bool _1370 = _1366 || _1368;
    bool _1372 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _1374 = _1370 || _1372;
    float _1376 = float(_1374);
    float _1378 = fma(_1340, _1360, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _1380 = -_1356;
    float _1382 = _1380 + 1.0;
    bool _1384 = _547 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1386 = isnan(_547);
    bool _1388 = _1384 || _1386;
    bool _1390 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _1392 = _1388 || _1390;
    float _1394 = float(_1392);
    float _1396 = _1332 * _1268;
    bool _1398 = _679 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1400 = isnan(_679);
    bool _1402 = _1398 || _1400;
    bool _1404 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1406 = _1402 || _1404;
    float _1408 = float(_1406);
    bool _1410 = _679 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1412 = isnan(_679);
    bool _1414 = _1410 || _1412;
    bool _1416 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1418 = _1414 || _1416;
    float _1420 = float(_1418);
    float _1422 = -_1394;
    float _1424 = _1422 + 1.0;
    bool _1426 = _679 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1428 = isnan(_679);
    bool _1430 = _1426 || _1428;
    bool _1432 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1434 = _1430 || _1432;
    float _1436 = float(_1434);
    float _1438 = _1376 * _1382;
    float _1440 = -_1376;
    float _1442 = _1440 + 1.0;
    bool _1444 = _547 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1446 = isnan(_547);
    bool _1448 = _1444 || _1446;
    bool _1450 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _1452 = _1448 || _1450;
    float _1454 = float(_1452);
    float _1456 = fma(_1396, _723, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    float _1458 = -_1436;
    float _1460 = _1458 + 1.0;
    float _1462 = _1394 * _1442;
    bool _1464 = _547 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _1466 = isnan(_547);
    bool _1468 = _1464 || _1466;
    bool _1470 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _1472 = _1468 || _1470;
    float _1474 = float(_1472);
    float _1476 = _1454 * _1424;
    float _1478 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1480 = _1162 + _1478;
    float _1482 = -_1454;
    float _1484 = _1482 + 1.0;
    bool _1486 = _547 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _1488 = isnan(_547);
    bool _1490 = _1486 || _1488;
    bool _1492 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _1494 = _1490 || _1492;
    float _1496 = float(_1494);
    float _1498 = -_1474;
    float _1500 = _1498 + 1.0;
    float _1502 = fma(_1480, _1480, _1178);
    float _1504 = _1474 * _1484;
    float _1506 = _1420 * _1460;
    float _1508 = -_1420;
    float _1510 = _1508 + 1.0;
    float _1512 = fma(_1030, _1030, _1502);
    float _1514 = _803 * _1500;
    float _1516 = -_803;
    float _1518 = _1516 + 1.0;
    float _1520 = _781 * _1510;
    float _1522 = sqrt(_1512);
    float _1524 = _1408 * _807;
    float _1526 = _1212 * _1518;
    float _1528 = -_1212;
    float _1530 = _1528 + 1.0;
    float _1532 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1534 = _1364 * _1524;
    float _1536 = _1496 * _1530;
    float _1538 = fma(_843, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1532);
    float _1540 = rsqrt(_1512);
    float _1542 = _687 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _1544 = _1328 * _1536;
    float _1546 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1548 = float(uint(_990));
    float _1550 = _1522 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _1552 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1554 = as_type<float>(_783) * _1548;
    float _1556 = _1226 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1558 = precise::min(_1542, _1550);
    float _1560 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1562 = -_1552;
    float _1564 = fma(_1180, 2.0, _1562);
    float _1566 = trunc(_1554);
    float _1568 = precise::max(_1566, 0.0);
    uint _1570 = uint(_1568);
    float _1572 = _1540 * _1558;
    float _1574 = fma(_1140, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1560);
    float _1576 = _1168 * _1572;
    float _1578 = _1480 * _1572;
    float _1580 = -_1576;
    float _1582 = _1168 + _1580;
    float _1584 = -_1578;
    float _1586 = _1480 + _1584;
    float _1588 = fma(_1556, -2.0, _1546);
    int _1590 = ~_699;
    int _1592 = _1590 + 1;
    float _1594 = _1582 * _1582;
    float _1596 = -_1408;
    float _1598 = _1596 + 1.0;
    float _1600 = _1030 * _1572;
    float _1602 = fma(_1586, _1586, _1594);
    float _1604 = -_1496;
    float _1606 = _1604 + 1.0;
    float _1608 = -_1600;
    float _1610 = _1030 + _1608;
    int _1612 = ~_1190;
    int _1614 = _1612 + _1220;
    int _1616 = _1614 + 1;
    float _1618 = fma(_1598, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1534);
    float _1620 = fma(_1606, (*spvDescriptorSet0.vp_c9)._m0[151].x, _1544);
    int _1622 = _1592 * int(_1570);
    int _1624 = _1622 + _990;
    float _1626 = fma(_1610, _1610, _1602);
    float _1628 = -_205;
    int _1630 = _1224 ? as_type<int>(_1628) : as_type<int>(_205);
    float _1632 = fma(_1292, _1526, _1620);
    int _1634 = _699 * _1616;
    int _1636 = _1634 + _1062;
    float _1638 = sqrt(_1626);
    float _1640 = float(uint(_1624));
    float _1642 = fma(_1320, _1520, _1618);
    bool _1644 = !_1096;
    float _1646 = _1644 ? _205 : as_type<float>(_1630);
    float _1648 = fma(_1318, _1514, _1632);
    float _1650 = -_213;
    int _1652 = _1230 ? as_type<int>(_1650) : as_type<int>(_213);
    float _1654 = as_type<float>(_783) * _1640;
    bool _1656 = !_946;
    int _1658 = _1656 ? _1636 : (-1);
    float _1660 = -_109;
    float _1662 = fma(_1660, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1564);
    bool _1664 = !_1102;
    float _1666 = _1664 ? _213 : as_type<float>(_1652);
    float _1668 = _1646 + 0.5;
    int _1670 = _1658 >> 31;
    float _1672 = trunc(_1654);
    float _1674 = precise::max(_1672, 0.0);
    uint _1676 = uint(_1674);
    float _1678 = fma(_109, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1588);
    float _1680 = fma(_1668, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1662);
    int _1682 = _1670 & 3;
    float _1684 = fma(_1338, _1504, _1648);
    float _1686 = fma(_1322, _1506, _1642);
    float _1688 = _1540 * _1638;
    int _1690 = _1658 + _1682;
    float _1692 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _213);
    float _1694 = fma(_1362, _1476, _1684);
    float _1696 = _689 * _1688;
    int _1698 = _1690 >> 2;
    float _1700 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _205);
    float _1702 = _687 * _1688;
    float _1704 = _1696 * _1692;
    int _1706 = _1698 << 4;
    int _1708 = _1706 + 512;
    float _1710 = _1666 + (-0.5);
    float _1712 = _1702 * _1700;
    float _1714 = _1704 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    uint _1716 = uint(int(uint(_1708) >> uint(2)));
    uint _1718 = uint(int(uint(int(_1716)) >> uint(2)));
    int _1720 = int(_1716) & 3;
    float _1722 = (*spvDescriptorSet0.vp_c9)._m0[int(_1718)][_1720];
    int _1724 = int(_1716) + 1;
    uint _1726 = uint(int(uint(_1724) >> uint(2)));
    int _1728 = _1724 & 3;
    float _1730 = (*spvDescriptorSet0.vp_c9)._m0[int(_1726)][_1728];
    float _1732 = _1704 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1734 = -_1710;
    float _1736 = -_1678;
    float _1738 = fma(_1734, (*spvDescriptorSet0.vp_c9)._m0[85].y, _1736);
    float _1740 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1714);
    int _1742 = int(_1570) + int(_1676);
    float _1744 = _1688 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1746 = _1744 * 0.5;
    int _1748 = ~_699;
    int _1750 = _1748 + 1;
    float _1752 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1732);
    float _1754 = fma(_1436, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1686);
    float _1756 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1740);
    float _1758 = fma(_1378, _1462, _1694);
    float _1760 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1752);
    int _1762 = _1750 * _1742;
    int _1764 = _1762 + _990;
    int _1766 = _1708 + 8;
    uint _1768 = uint(int(uint(_1766) >> uint(2)));
    uint _1770 = uint(int(uint(int(_1768)) >> uint(2)));
    int _1772 = int(_1768) & 3;
    float _1774 = (*spvDescriptorSet0.vp_c9)._m0[int(_1770)][_1772];
    int _1776 = int(_1768) + 1;
    uint _1778 = uint(int(uint(_1776) >> uint(2)));
    int _1780 = _1776 & 3;
    float _1782 = (*spvDescriptorSet0.vp_c9)._m0[int(_1778)][_1780];
    int _1784 = _1658 & 3;
    bool _1786 = _1784 != 0;
    float _1788 = _1760 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1790 = _1756 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    bool _1792 = uint(_1764) >= uint(_699);
    float _1794 = _1704 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _1796 = uint(_1784) > 1u;
    float _1798 = _1018 + _1788;
    int _1800 = _1658 & 3;
    bool _1802 = _1800 != 0;
    float _1804 = _1162 + _1790;
    bool _1806 = !_1792;
    int _1808 = _1806 ? 0 : (-1);
    float _1810 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1812 = _1798 + _1810;
    int _1814 = _1802 ? 0 : 1;
    float _1816 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1818 = _1804 + _1816;
    int _1820 = ~_1742;
    int _1822 = _1820 + _1808;
    int _1824 = _1822 + 1;
    float _1826 = _1812 * _1812;
    int _1828 = ~_1814;
    int _1830 = _1828 + 1;
    int _1832 = _1830 + 1;
    bool _1834 = _1784 != 3;
    int _1836 = _699 * _1824;
    int _1838 = _1836 + _990;
    int _1840 = _1832;
    float _1842 = _1804;
    if (!_1796)
    {
        int _1844 = ~_1814;
        int _1846 = _1844 + 1;
        _1840 = _1846;
    }
    int _1848 = _1840;
    float _1850 = fma(_1818, _1818, _1826);
    bool _1852 = uint(_1784) >= 2u;
    float _1854 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1794);
    int _1856 = abs(_1848);
    float _1858 = sqrt(_1850);
    int _1860 = _1852 ? 0 : 1;
    float _1862 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1854);
    bool _1864 = !_1786;
    int _1866 = _1864 ? 0 : 1;
    bool _1868 = _1784 != 3;
    int _1870 = ~_1860;
    int _1872 = _1870 + 1;
    int _1874 = _1872 + 1;
    int _1876 = _1874;
    if (_1834)
    {
        int _1878 = ~_1860;
        int _1880 = _1878 + 1;
        _1876 = _1880;
    }
    int _1882 = _1876;
    int _1884 = ~_1856;
    int _1886 = _1884 + 1;
    int _1888 = _1886 + 1;
    bool _1890 = !_1868;
    int _1892 = _1890 ? 0 : (-1);
    int _1894 = abs(_1866);
    int _1896 = _1888 * as_type<int>(_1730);
    int _1898 = abs(_1882);
    int _1900 = abs(_1892);
    int _1902 = ~_1894;
    int _1904 = _1902 + 1;
    int _1906 = _1904 + 1;
    bool _1908 = !_1078;
    int _1910 = _1908 ? 0 : 1;
    int _1912 = _1906 * as_type<int>(_1722);
    int _1914 = _1912 + _1896;
    bool _1916 = _1858 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1918 = ~_1898;
    int _1920 = _1918 + 1;
    int _1922 = _1920 + 1;
    int _1924 = abs(_1910);
    float _1926 = _1862 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _1928 = ~_1900;
    int _1930 = _1928 + 1;
    int _1932 = _1930 + 1;
    int _1934 = _1922 * as_type<int>(_1774);
    int _1936 = _1934 + _1914;
    float _1938 = _1158 + _1926;
    int _1940 = _1932 * as_type<int>(_1782);
    int _1942 = _1940 + _1936;
    int _1944 = ~_1924;
    int _1946 = _1944 + 1;
    int _1948 = _1946 + 1;
    float _1950 = _1782;
    if (!_1916)
    {
        _1066 = _1798;
    }
    float _1952 = _1066;
    float _1954 = _1952;
    if (!_1916)
    {
        _1950 = _1938;
    }
    float _1956 = _1950;
    bool _1958 = !_1916;
    float _1960 = _1956;
    if (!_1958)
    {
        float _1962 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1964 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1966 = _1858 + _1964;
        float _1968 = _1938 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1970 = rsqrt(_1850);
        float _1972 = _1966 * _1962;
        float _1974 = _1972 * 0.15915493667125701904296875;
        float _1976 = _1974 * 6.283185482025146484375;
        float _1978 = cos(_1976);
        float _1980 = _1974 * 6.283185482025146484375;
        float _1982 = sin(_1980);
        float _1984 = _1978 + (-1.0);
        float _1986 = _1984 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1988 = fma(_1982, _1968, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1990 = fma(_1938, _1978, _1986);
        float _1992 = _1970 * _1988;
        float _1994 = fma(_1818, _1992, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1996 = fma(_1812, _1992, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1960 = _1990;
        _1842 = _1994;
        _1954 = _1996;
    }
    float _1998 = _1960;
    float _2000 = _1842;
    float _2002 = _1954;
    float _2004 = fma(_109, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1142);
    float _2006 = fma(_109, (*spvDescriptorSet0.vp_c9)._m0[77].w, _813);
    int _2008 = _1942 * _1948;
    float _2010 = fma(_109, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1574);
    float _2012 = -_2004;
    float _2014 = _2012 + 1.0;
    float _2016 = -_2006;
    float _2018 = _2016 + 1.0;
    float _2020 = fma(_109, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1538);
    float _2022 = -_2010;
    float _2024 = _2022 + 1.0;
    float _2026 = -_2014;
    float _2028 = fma(_2026, _1072, _1298);
    float _2030 = fma(_2018, _1090, _1304);
    float _2032 = -_1158;
    float _2034 = _2032 + _1998;
    float _2036 = -_2020;
    float _2038 = _2036 + 1.0;
    float _2040 = -_1162;
    float _2042 = _2040 + _2000;
    float _2044 = _2034 * _2034;
    float _2046 = -_2024;
    float _2048 = fma(_1646, _2046, _1680);
    float _2050 = fma(_1666, _2038, _1738);
    float _2052 = -_1018;
    float _2054 = _2052 + _2002;
    float _2056 = fma(_2042, _2042, _2044);
    float _2058 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _2060 = !_946;
    int _2062 = _2060 ? _1838 : (-1);
    float _2064 = fma(_1456, _1438, _1758);
    float _2066 = fma(_2054, _2054, _2056);
    float _2068 = _2058 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2070 = sqrt(_2066);
    int _2072 = _2062 * _1924;
    int _2074 = _2072 + _2008;
    float _2076 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2078 = _1754 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2080 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2082 = fma(_1356, (*spvDescriptorSet0.vp_c9)._m0[158].x, _2064);
    float _2084 = _2076 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2086 = _1232 + (*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _2088 = _2080 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2090 = _1222 + (*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _2092 = float(_2074);
    float _2094 = _1234 + (*spvDescriptorSet0.vp_c8)._m0[26].z;
    out.m_62.w = _1558;
    float _2096 = -_1578;
    float _2098 = _1162 + _2096;
    float _2100 = -_1600;
    float _2102 = _1018 + _2100;
    out.m_64.x = _2084;
    out.m_64.y = _2088;
    out.m_64.z = _2068;
    out.m_64.w = _2078;
    bool _2104 = _2070 > 0.0;
    out.m_66.x = _2082;
    out.m_68.x = _1702;
    out.m_70.y = _2092;
    out.m_72.x = _2086;
    out.m_72.y = _2090;
    out.m_72.z = _2094;
    out.m_74.x = _2028;
    out.m_74.y = _2030;
    out.m_74.z = _2048;
    out.m_74.w = _2050;
    float _2106 = -_1576;
    float _2108 = _2106 + _1998;
    float _2110 = -_1578;
    float _2112 = _2110 + _2000;
    float _2114 = -_1600;
    float _2116 = _2114 + _2002;
    float _2118 = -_1576;
    float _2120 = _1158 + _2118;
    bool _2122 = !_2104;
    float _2124 = _2088;
    float _2126 = _2084;
    float _2128 = _2108;
    float _2130 = _2112;
    float _2132 = _2116;
    float _2134 = _2088;
    float _2136 = _2068;
    float _2138 = _2084;
    if (!_2122)
    {
        bool _2140 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2142 = _2050;
        if (_2140)
        {
            float _2144 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2142 = _2144;
        }
        float _2146 = _2142;
        float _2148 = _2146;
        if (_2140)
        {
            float _2150 = _539 * _2146;
            _2124 = _2150;
        }
        float _2152 = _2124;
        float _2154 = _2152;
        if (_2140)
        {
            float _2156 = _537 * _2146;
            _2126 = _2156;
        }
        float _2158 = _2126;
        float _2160 = _2158;
        if (_2140)
        {
            float _2162 = _541 * _2146;
            _2148 = _2162;
        }
        float _2164 = _2148;
        float _2166 = _2164;
        if (!_2140)
        {
            float _2168 = _109 + 1.0;
            if (!_171)
            {
                float _2170 = _2168 * _2168;
                float _2172 = _2170 * 0.5;
                _119 = _2172;
            }
            float _2174 = _119;
            float _2176 = _2174;
            if (!_171)
            {
                float _2178 = _2174 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2176 = _2178;
            }
            float _2180 = _2176;
            bool _2182 = !_171;
            float _2184 = _2180;
            if (!_2182)
            {
                float _2186 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2188 = log2(_2186);
                float _2190 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2192 = _2190 + 1.0;
                float _2194 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2196 = _2188 * _2168;
                float _2198 = 1.0 / _2192;
                float _2200 = _2194 * 0.693147182464599609375;
                float _2202 = exp2(_2196);
                float _2204 = 1.0 / _2200;
                float _2206 = _2202 + (-1.0);
                float _2208 = -_2206;
                float _2210 = fma(_2208, _2204, _2168);
                float _2212 = _2210 * _2198;
                float _2214 = _2212 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2184 = _2214;
            }
            float _2216 = _2184;
            float _2218 = _2216 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _2220 = _2216 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _2222 = _2216 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _2224 = _2218 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
            float _2226 = _2218 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
            float _2228 = _2218 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
            float _2230 = fma(_2220, (*spvDescriptorSet0.vp_c10)._m0[8].y, _2224);
            float _2232 = fma(_2220, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2226);
            float _2234 = _2226;
            if (!_171)
            {
                _2234 = _2168;
            }
            float _2236 = _2234;
            float _2238 = fma(_2222, (*spvDescriptorSet0.vp_c10)._m0[10].y, _2230);
            bool _2240 = !_171;
            float _2242 = _2236;
            if (!_2240)
            {
                float _2244 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2246 = log2(_2244);
                float _2248 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2250 = _2248 + 1.0;
                float _2252 = 1.0 / _2250;
                float _2254 = _2246 * _2168;
                float _2256 = exp2(_2254);
                float _2258 = -_2256;
                float _2260 = _2258 + 1.0;
                float _2262 = _2260 * _2252;
                _2242 = _2262;
            }
            float _2264 = _2242;
            float _2266 = fma(_2220, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2228);
            float _2268 = fma(_2222, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2232);
            float _2270 = fma(_2264, _179, _2238);
            float _2272 = fma(_2222, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2266);
            float _2274 = fma(_2264, _177, _2268);
            float _2276 = -_487;
            float _2278 = _2276 + _2270;
            float _2280 = fma(_2264, _181, _2272);
            float _2282 = -_485;
            float _2284 = _2282 + _2274;
            float _2286 = _2278 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _2288 = _2278 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _2290 = _2278 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _2292 = -_489;
            float _2294 = _2292 + _2280;
            float _2296 = fma(_2284, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2286);
            float _2298 = fma(_2284, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2288);
            float _2300 = fma(_2284, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2290);
            float _2302 = fma(_2294, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2296);
            float _2304 = fma(_2294, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2298);
            float _2306 = fma(_2294, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2300);
            _551 = _2304;
            _553 = _2302;
            _555 = _2306;
            _2154 = _2302;
            _2160 = _2304;
            _2166 = _2306;
        }
        float _2308 = _551;
        float _2310 = _553;
        float _2312 = _555;
        float _2314 = _2154;
        float _2316 = _2160;
        float _2318 = _2166;
        float _2320 = _2308 * _2308;
        float _2322 = rsqrt(_2066);
        float _2324 = fma(_2310, _2310, _2320);
        float _2326 = fma(_2312, _2312, _2324);
        float _2328 = sqrt(_2326);
        float _2330 = _2042 * _2322;
        float _2332 = _2034 * _2322;
        float _2334 = _2054 * _2322;
        bool _2336 = _2328 > 0.0;
        bool _2338 = !_2336;
        _2134 = _2314;
        _2136 = _2330;
        _2138 = _2316;
        _557 = _2312;
        if (!_2338)
        {
            float _2340 = rsqrt(_2326);
            float _2342 = _2340 * _2308;
            float _2344 = _2340 * _2310;
            float _2346 = _2340 * _2312;
            float _2348 = _2332 * _2342;
            float _2350 = fma(_2330, _2344, _2348);
            float _2352 = fma(_2334, _2346, _2350);
            float _2354 = _2352 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2356 = fma(_2314, _2354, _2112);
            float _2358 = fma(_2316, _2354, _2108);
            float _2360 = fma(_2318, _2354, _2116);
            _2128 = _2358;
            _2130 = _2356;
            _2132 = _2360;
        }
    }
    float _2362 = _2128;
    float _2364 = _2130;
    float _2366 = _2132;
    float _2368 = _2134;
    float _2370 = _2136;
    float _2372 = _2138;
    float _2374 = _557;
    float _2376 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2378 = _2362 + _2376;
    float _2380 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2382 = _2364 + _2380;
    float _2384 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2386 = _2366 + _2384;
    float _2388 = _2378 * _2378;
    float _2390 = fma(_2382, _2382, _2388);
    float _2392 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2394 = fma(_2386, _2386, _2390);
    float _2396 = rsqrt(_2394);
    float _2398 = sqrt(_2394);
    float _2400 = _2396 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2402 = _2382 * _2400;
    float _2404 = _2386 * _2400;
    float _2406 = _2402 * _2402;
    float _2408 = _2404 * _2404;
    float _2410 = _2406 + _2408;
    float _2412 = sqrt(_2410);
    bool _2414 = _2412 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2416 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2418 = _2412 + _2416;
    float _2420 = _2368;
    float _2422 = _2418;
    float _2424 = _2370;
    float _2426 = _2378;
    float _2428 = _2374;
    float _2430 = _2402;
    if (_2414)
    {
        float _2432 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2420 = _2432;
    }
    float _2434 = _2420;
    float _2436 = _2434;
    if (_2414)
    {
        float _2438 = _2418 * _2434;
        _2422 = _2438;
    }
    float _2440 = _2422;
    if (_2414)
    {
        float _2442 = rsqrt(_2410);
        _2436 = _2442;
    }
    float _2444 = _2436;
    float _2446 = _2444;
    if (_2414)
    {
        float _2448 = _2440 * 0.15915493667125701904296875;
        _2424 = _2448;
    }
    float _2450 = _2424;
    float _2452 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2454 = _2386;
    if (_2414)
    {
        float _2456 = _2450 * 6.283185482025146484375;
        float _2458 = sin(_2456);
        _2454 = _2458;
    }
    float _2460 = _2454;
    float _2462 = _2362 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2464 = precise::max(0.0, _2452);
    float _2466 = _2372;
    float _2468 = _2464;
    if (_2414)
    {
        float _2470 = _2450 * 6.283185482025146484375;
        float _2472 = cos(_2470);
        _2466 = _2472;
    }
    float _2474 = _2466;
    float _2476 = -_2400;
    float _2478 = -_2464;
    float _2480 = fma(_2378, _2476, _2478);
    float _2482 = fma(_2364, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2462);
    if (_2414)
    {
        float _2484 = _2480 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2426 = _2484;
    }
    float _2486 = _2426;
    float _2488 = fma(_2366, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2482);
    float _2490 = _2460;
    float _2492 = _2486;
    if (_2414)
    {
        float _2494 = fma(_2460, _2486, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2490 = _2494;
    }
    float _2496 = _2490;
    float _2498 = _2496;
    if (!_2414)
    {
        _2492 = _2480;
    }
    float _2500 = _2492;
    float _2502 = _2488 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2504 = _2500;
    if (_2414)
    {
        float _2506 = _2444 * _2496;
        _2428 = _2506;
    }
    float _2508 = _2428;
    if (!_2414)
    {
        _2498 = _2406;
    }
    float _2510 = _2498;
    float _2512 = _2362 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2514 = _2510;
    float _2516 = _2474;
    if (_2414)
    {
        float _2518 = _2474 + (-1.0);
        _2468 = _2518;
    }
    float _2520 = _2468;
    float _2522 = _2520;
    if (_2414)
    {
        float _2524 = _2402 * _2508;
        _2430 = _2524;
    }
    float _2526 = _2430;
    float _2528 = fma(_2364, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2512);
    if (_2414)
    {
        float _2530 = _2520 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2446 = _2530;
    }
    float _2532 = _2446;
    if (!_2414)
    {
        _2522 = _2404;
    }
    float _2534 = _2522;
    float _2536 = _2534;
    if (_2414)
    {
        float _2538 = _2404 * _2508;
        _2536 = _2538;
    }
    float _2540 = _2536;
    if (_2414)
    {
        float _2542 = _2526 * _2526;
        _2514 = _2542;
    }
    float _2544 = _2514;
    if (_2414)
    {
        float _2546 = fma(_2480, _2474, _2532);
        _2504 = _2546;
    }
    float _2548 = _2504;
    if (!_2414)
    {
        _2516 = _2408;
    }
    float _2550 = _2516;
    float _2552 = _2550;
    if (_2414)
    {
        float _2554 = _2540 * _2540;
        _2552 = _2554;
    }
    float _2556 = _2552;
    float _2558 = _2362 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2560 = fma(_2548, _2548, _2544);
    float _2562 = fma(_2366, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2528);
    float _2564 = fma(_2364, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2558);
    float _2566 = _2560 + _2556;
    float _2568 = _2362 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2570 = fma(_2366, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2564);
    float _2572 = _2562 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2574 = rsqrt(_2566);
    float _2576 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2578 = fma(_2398, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2576);
    float _2580 = precise::clamp(_2578, 0.0, 1.0);
    float _2582 = fma(_2364, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2568);
    float _2584 = _2570 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2586 = -_2580;
    float _2588 = _2586 + 1.0;
    float _2590 = fma(_2366, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2582);
    float _2592 = _2572 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2594 = _2590 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2596 = abs(_2588);
    float _2598 = log2(_2596);
    float _2600 = -_2592;
    float _2602 = fma(_2600, _2392, 1.0);
    float _2604 = _2594 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2606 = _2574 * _2526;
    float _2608 = _2574 * _2548;
    float _2610 = _2574 * _2540;
    float _2612 = fma(_2584, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2604);
    float _2614 = _2606 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2616 = _2594 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2618 = log2(_2602);
    float _2620 = fma(_2572, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2612);
    float _2622 = -_2614;
    float _2624 = fma(_2608, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2622);
    float _2626 = fma(_2584, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2616);
    float _2628 = _2598 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2630 = -_2610;
    float _2632 = fma(_2630, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2624);
    float _2634 = fma(_2502, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2620);
    float _2636 = _2594 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2638 = exp2(_2628);
    float _2640 = fma(_2632, -0.5, 0.5);
    float _2642 = fma(_2632, 0.5, 0.5);
    float _2644 = fma(_2584, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2636);
    float _2646 = _2608 + 1.0;
    float _2648 = fma(_2572, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2626);
    float _2650 = fma(_2642, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2652 = fma(_2572, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2644);
    float _2654 = 1.0 / _2634;
    float _2656 = _2618 * 0.693147182464599609375;
    float _2658 = fma(_2642, _2650, -0.212114393711090087890625);
    float _2660 = _2656 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2662 = fma(_2642, _2658, 1.570728778839111328125);
    float _2664 = sqrt(_2640);
    float _2666 = -_2608;
    float _2668 = fma(_2638, _2646, _2666);
    float _2670 = fma(_2502, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2648);
    float _2672 = fma(_2502, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2652);
    float _2674 = fma(_2668, 0.5, 0.5);
    float _2676 = _2670 * _2654;
    float _2678 = _2672 * _2654;
    float _2680 = fma(_2676, 0.5, 0.5);
    float _2682 = fma(_2678, -0.5, 0.5);
    float _2684 = _2664 * 0.636619746685028076171875;
    float _2686 = -_2662;
    float _2688 = fma(_2684, _2686, 1.0);
    float3 _7410 = float3(_2680, _2682, _2660);
    float _2690 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7410, float3(0.0), isnan(_7410)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7410, float3(0.0), isnan(_7410)), level(0.0)).x;
    float3 _7421 = float3(_2680, _2682, _2660);
    float4 _2693 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7421, float3(0.0), isnan(_7421)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7421, float3(0.0), isnan(_7421)), level(0.0)).xyzw;
    float _2695 = _2693.x;
    float _2697 = _2693.y;
    float _2699 = _2693.z;
    float _2701 = _2693.w;
    float2 _7438 = float2(_2688, _2674);
    float3 _2705 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7438, float2(0.0), isnan(_7438)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7438, float2(0.0), isnan(_7438)), level(0.0)).xyz;
    float _2707 = _2705.x;
    float _2709 = _2705.y;
    float _2711 = _2705.z;
    float _2713 = _2120 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2715 = _2594 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2717 = _2598 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_76.x = _2098;
    out.m_76.y = _2120;
    out.m_76.z = _2102;
    float _2719 = fma(_2098, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2713);
    float _2721 = fma(_2584, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2715);
    float _2723 = _2634 * 0.5;
    bool _2725 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2727 = isnan(0.5);
    bool _2729 = _2725 || _2727;
    bool _2731 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2733 = _2729 || _2731;
    float _2735 = fma(_2102, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2719);
    float _2737 = _2120 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2739 = fma(_2572, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2721);
    float _2741 = _2735 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2743 = fma(_2098, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2737);
    float _2745 = fma(_2502, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2739);
    float _2747 = _2670 + _2634;
    float _2749 = 1.0 / _2741;
    float _2751 = fma(_2102, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2743);
    float _2753 = _2747 * 0.5;
    out.gl_Position.x = _2670;
    out.gl_Position.y = _2672;
    out.gl_Position.z = _2745;
    out.gl_Position.w = _2634;
    float _2755 = _2751 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2757 = exp2(_2717);
    float _2759 = _2755 + _2741;
    float _2761 = _2745 + _2634;
    float _2763 = _2761 * 0.5;
    float _2765 = _2759 * _2749;
    float _2767 = _2765 * 0.5;
    float _2769 = fma(_2672, -0.5, _2723);
    float _2771 = _2723;
    float _2773 = _2672;
    float _2775 = _2745;
    float _2777 = _2634;
    if (_2733)
    {
        _2771 = 1.0;
    }
    float _2779 = _2771;
    float _2781 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2783 = fma(_2767, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2781);
    out.m_78.x = _2753;
    out.m_78.y = _2769;
    out.m_78.z = _2763;
    out.m_78.w = _2634;
    float _2785 = -_2757;
    float _2787 = _2785 + 1.0;
    float _2789 = _2757;
    float _2791 = _2779;
    if (_2733)
    {
        _2789 = 1.0;
    }
    float _2793 = _2789;
    float _2795 = 1.0 / _2783;
    float _2797 = _2787 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2799 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2801 = _2795 * _2799;
    float _2803 = _2793;
    float _2805 = _2697;
    float _2807 = _2695;
    if (!_2733)
    {
        float _2809 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2811 = _2809 * 0.15915493667125701904296875;
        float _2813 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2815 = _2811 * 6.283185482025146484375;
        float _2817 = cos(_2815);
        float _2819 = _2813 * 0.15915493667125701904296875;
        float _2821 = _2811 * 6.283185482025146484375;
        float _2823 = sin(_2821);
        float _2825 = 1.0 / _2817;
        float _2827 = _2819 * 6.283185482025146484375;
        float _2829 = cos(_2827);
        float _2831 = _2823 * _2825;
        float _2833 = _2819 * 6.283185482025146484375;
        float _2835 = sin(_2833);
        float _2837 = _2829 * _2831;
        float _2839 = 1.0 / _2837;
        float _2841 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2843 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2841;
        float _2845 = 1.0 / _2843;
        float _2847 = _2835 * _2839;
        float _2849 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2851 = fma(_2801, _2847, _2849);
        float _2853 = _2851 * _2845;
        float _2855 = precise::clamp(_2853, 0.0, 1.0);
        _2773 = _2839;
        _2791 = _2855;
        _2775 = _2843;
        _2777 = _2825;
    }
    float _2857 = _2773;
    float _2859 = _2791;
    float _2861 = _2775;
    float _2863 = _2777;
    float _2865 = _2857;
    float _2867 = _2861;
    float _2869 = _2863;
    if (!_2733)
    {
        float _2871 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2873 = _2871 * 0.15915493667125701904296875;
        float _2875 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2877 = _2873 * 6.283185482025146484375;
        float _2879 = cos(_2877);
        float _2881 = _2875 * 0.15915493667125701904296875;
        float _2883 = _2873 * 6.283185482025146484375;
        float _2885 = sin(_2883);
        float _2887 = 1.0 / _2879;
        float _2889 = _2881 * 6.283185482025146484375;
        float _2891 = cos(_2889);
        float _2893 = _2885 * _2887;
        float _2895 = _2881 * 6.283185482025146484375;
        float _2897 = sin(_2895);
        float _2899 = _2891 * _2893;
        float _2901 = 1.0 / _2899;
        float _2903 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2905 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2903;
        float _2907 = 1.0 / _2905;
        float _2909 = _2897 * _2901;
        float _2911 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2913 = fma(_2801, _2909, _2911);
        float _2915 = _2913 * _2907;
        float _2917 = precise::clamp(_2915, 0.0, 1.0);
        float _2919 = -_2917;
        float _2921 = _2919 + 1.0;
        _2803 = _2921;
        _2865 = _2907;
        _2867 = _2881;
        _2869 = _2873;
    }
    float _2923 = _2803;
    float _2925 = _2865;
    float _2927 = _2867;
    float _2929 = _2869;
    float _2931 = _2797 * _2690;
    float _2933 = -_2797;
    float _2935 = _2933 + 1.0;
    out.m_80.x = _2364;
    out.m_80.y = _2362;
    out.m_80.z = _2366;
    bool _2937 = _2398 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2939 = isnan(_2398);
    bool _2941 = _2937 || _2939;
    bool _2943 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2945 = _2941 || _2943;
    float _2947 = _2701 * _2931;
    float _2949 = _2711 * _2931;
    float _2951 = _2701 * _2935;
    float _2953 = _2859 * _2923;
    float _2955 = fma(_2707, _2947, _2695);
    float _2957 = fma(_2709, _2947, _2697);
    float _2959 = fma(_2701, _2949, _2699);
    float _2961 = _2953 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_82.x = _2955;
    out.m_82.y = _2957;
    out.m_82.z = _2959;
    out.m_82.w = _2951;
    float _2963 = _545 * _2961;
    float _2965 = _2929;
    float _2967 = _2927;
    float _2969 = _2925;
    float _2971 = _2961;
    if (!_2945)
    {
        _2805 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2973 = _2805;
    float _2975 = _2973;
    float _2977 = _2973;
    if (!_2945)
    {
        _2807 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2979 = _2807;
    float _2981 = _2979;
    float _2983 = _2979;
    if (!_2945)
    {
        _2965 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2985 = _2965;
    float _2987 = _2985;
    float _2989 = _2985;
    if (!_2945)
    {
        _2967 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2991 = _2967;
    float _2993 = _2991;
    float _2995 = _2991;
    if (!_2945)
    {
        _2969 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2997 = _2969;
    float _2999 = _2997;
    float _3001 = _2997;
    if (!_2945)
    {
        _2971 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3003 = _2971;
    bool _3005 = !_2945;
    float _3007 = _3003;
    float _3009 = _3003;
    if (!_3005)
    {
        bool _3011 = _2398 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3013 = isnan(_2398);
        bool _3015 = _3011 || _3013;
        bool _3017 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3019 = _3015 || _3017;
        if (!_3019)
        {
            float _3021 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3023 = _2398 + _3021;
            float _3025 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3027 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3025;
            float _3029 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3031 = _3029 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3033 = 1.0 / _3027;
            float _3035 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3037 = _3035 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3039 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3041 = _3039 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3043 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3045 = _3043 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3047 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3049 = _3047 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3051 = _3023 * _3033;
            float _3053 = precise::clamp(_3051, 0.0, 1.0);
            float _3055 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3057 = _3055 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3059 = fma(_3053, _3031, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3061 = fma(_3053, _3057, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3063 = fma(_3053, _3037, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3065 = fma(_3053, _3041, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3067 = fma(_3053, _3045, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3069 = fma(_3053, _3049, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2983 = _3063;
            _3001 = _3067;
            _2977 = _3059;
            _2995 = _3065;
            _2989 = _3061;
            _3009 = _3069;
            _3071 = true;
        }
        else
        {
            bool _3073 = _2398 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3075 = isnan(_2398);
            bool _3077 = _3073 || _3075;
            bool _3079 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3081 = _3077 || _3079;
            if (!_3081)
            {
                _2975 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3083 = _2975;
            _2977 = _3083;
            if (!_3081)
            {
                _2981 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3085 = _2981;
            _2983 = _3085;
            if (!_3081)
            {
                _2987 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3087 = _2987;
            _2989 = _3087;
            if (!_3081)
            {
                _2993 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3089 = _2993;
            _2995 = _3089;
            if (!_3081)
            {
                _2999 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3091 = _2999;
            _3001 = _3091;
            if (!_3081)
            {
                _3007 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3093 = _3007;
            bool _3095 = !_3081;
            _3009 = _3093;
            if (!_3095)
            {
                bool _3097 = _2398 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3099 = isnan(_2398);
                bool _3101 = _3097 || _3099;
                bool _3103 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3105 = _3101 || _3103;
                if (!_3105)
                {
                    float _3107 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3109 = _2398 + _3107;
                    float _3111 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3113 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3111;
                    float _3115 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3117 = _3115 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3119 = 1.0 / _3113;
                    float _3121 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3123 = _3121 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3125 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3127 = _3125 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3129 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3131 = _3129 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3133 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3135 = _3133 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3137 = _3109 * _3119;
                    float _3139 = precise::clamp(_3137, 0.0, 1.0);
                    float _3141 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3143 = _3141 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3145 = fma(_3139, _3117, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3147 = fma(_3139, _3143, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3149 = fma(_3139, _3123, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3151 = fma(_3139, _3127, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3153 = fma(_3139, _3131, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3155 = fma(_3139, _3135, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2983 = _3149;
                    _3001 = _3153;
                    _2977 = _3145;
                    _2995 = _3151;
                    _2989 = _3147;
                    _3009 = _3155;
                    _3071 = true;
                }
                else
                {
                    _2983 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3001 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2977 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2995 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2989 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3009 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3071 = false;
    float _3157 = _2983;
    float _3159 = _3001;
    float _3161 = _2977;
    float _3163 = _2995;
    float _3165 = _2989;
    float _3167 = _3009;
    float _3169 = fma(_2090, -0.5, 0.5);
    float _3171 = precise::clamp(_3169, 0.0, 1.0);
    float _3173 = -_3157;
    float _3175 = _3173 + _3159;
    float _3177 = -_3161;
    float _3179 = _3177 + _3163;
    out.m_84.x = 0.0;
    float _3181 = fma(_3171, _3175, _3157);
    float _3183 = -_3165;
    float _3185 = _3183 + _3167;
    float _3187 = fma(_3171, _3179, _3161);
    float _3189 = _3181 * 0.586610972881317138671875;
    bool _3191 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3193 = fma(_3171, _3185, _3165);
    float _3195 = _2963 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3197 = fma(_3187, 0.298911988735198974609375, _3189);
    bool _3199 = _2859 > 0.0;
    bool _3201 = isnan(_2859);
    bool _3203 = _3199 || _3201;
    bool _3205 = isnan(0.0);
    bool _3207 = _3203 || _3205;
    float _3209 = fma(_3193, 0.114477999508380889892578125, _3197);
    out.m_51.x = _3195;
    bool _3211 = _2923 <= 0.0;
    bool _3213 = !_3207;
    bool _3215 = _3211 || _3213;
    float _3217 = -_3209;
    float _3219 = _3187 + _3217;
    float _3221 = -_3209;
    float _3223 = _3181 + _3221;
    float _3225 = -_3209;
    float _3227 = _3193 + _3225;
    float _3229 = fma(_3219, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3209);
    float _3231 = fma(_3223, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3209);
    float _3233 = fma(_3227, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3209);
    bool _3235 = !_3191;
    if (!_3235)
    {
        float _3237 = -_2362;
        float _3239 = _3237 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3241 = -_2364;
        float _3243 = _3241 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3245 = -_2366;
        float _3247 = _3245 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3249 = _3239 * _3239;
        float _3251 = fma(_3243, _3243, _3249);
        float _3253 = fma(_3247, _3247, _3251);
        float _3255 = sqrt(_3253);
        float _3257 = rsqrt(_3253);
        float _3259 = -_3255;
        float _3261 = _3259 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3263 = _3261 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3265 = precise::clamp(_3263, 0.0, 1.0);
        float _3267 = _3243 * _3257;
        float _3269 = _3239 * _3257;
        float _3271 = abs(_3265);
        float _3273 = log2(_3271);
        float _3275 = _3247 * _3257;
        float _3277 = _3267 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3279 = _2090 * _3269;
        float _3281 = -_3269;
        float _3283 = -_3277;
        float _3285 = fma(_3281, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3283);
        float _3287 = fma(_2086, _3267, _3279);
        float _3289 = -_3275;
        float _3291 = fma(_3289, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3285);
        float _3293 = fma(_2094, _3275, _3287);
        float _3295 = precise::clamp(_3293, 0.0, 1.0);
        float _3297 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3299 = _3291 + _3297;
        float _3301 = _3273 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3303 = _3299 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3305 = precise::clamp(_3303, 0.0, 1.0);
        float _3307 = exp2(_3301);
        float _3309 = _3307 * _3305;
        float _3311 = _3295 * _3309;
        float _3313 = _3311 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3315 = _3311 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3317 = _3311 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_84.x = _3313;
        out.m_84.y = _3315;
        out.m_84.z = _3317;
    }
    out.m_62.x = _3229;
    out.m_62.y = _3231;
    out.m_62.z = _3233;
    if (!_3215)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_51.x = 0.0;
    float _3319 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3319;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}


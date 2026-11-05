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
    float4 m_62 [[user(locn0)]];
    float4 m_64 [[user(locn1)]];
    float4 m_68 [[user(locn2)]];
    float4 m_80 [[user(locn3)]];
    float4 m_88 [[user(locn4)]];
    float4 m_51 [[user(locn5)]];
    float4 m_70 [[user(locn6)]];
    float4 m_74 [[user(locn7)]];
    float4 m_76 [[user(locn8)]];
    float4 m_72 [[user(locn9)]];
    float4 m_86 [[user(locn10)]];
    float4 m_82 [[user(locn11)]];
    float4 m_84 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_78 [[attribute(0)]];
    float4 m_66 [[attribute(1)]];
    float4 m_48 [[attribute(2)]];
    float4 m_53 [[attribute(3)]];
    float4 m_58 [[attribute(4)]];
    float4 m_60 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4801 = false;
    bool _4072 = false;
    bool _701 = false;
    bool _597 = false;
    bool _203 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _102 = in.m_48.w;
    float _104 = trunc(_102);
    int _107 = int(_104);
    bool _111 = _107 >= 1;
    float _113 = 0.0;
    if (!_111)
    {
        _113 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _115 = _113;
    float _117 = _115;
    if (!_111)
    {
        out.m_51.x = 0.0;
    }
    int _119 = 0;
    if (!_111)
    {
        float _121 = _115 * 5.0;
        _119 = as_type<int>(_121);
    }
    int _123 = _119;
    int _125 = _123;
    if (!_111)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5086 = as_type<float>(_123);
        out.gl_Position.z = _5086;
    }
    if (!_111)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _127 = in.m_53.w;
    bool _129 = _127 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _131 = isnan(_127);
    bool _133 = _129 || _131;
    bool _135 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _137 = _133 || _135;
    float _139 = -_127;
    float _141 = _139 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _143 = 0.0;
    float _145 = _141;
    if (_137)
    {
        float _147 = float(_107);
        _143 = _147;
    }
    float _149 = _143;
    bool _151 = _141 >= _149;
    bool _153 = !_137;
    bool _155 = _151 || _153;
    if (_155)
    {
        _117 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _157 = _117;
    if (_155)
    {
        out.m_51.x = 0.0;
    }
    if (_155)
    {
        float _159 = _157 * 5.0;
        _125 = as_type<int>(_159);
    }
    int _161 = _125;
    if (_155)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5155 = as_type<float>(_161);
        out.gl_Position.z = _5155;
    }
    if (_155)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _163 = as_type<float>(int(gl_VertexIndex));
    bool _165 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _167 = as_type<int>(_163) & 1;
    bool _169 = _167 != 0;
    int _171 = as_type<int>(_163) & 2;
    bool _173 = _171 != 0;
    bool _175 = !_169;
    float _177 = _175 ? (-0.5) : 0.5;
    bool _179 = !_173;
    float _181 = _179 ? (-0.5) : 0.5;
    bool _183 = !_165;
    float _201;
    if (!_183)
    {
        float _185 = in.m_58.x;
        float _187 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _189 = _185 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _191 = fma(_189, (*spvDescriptorSet0.vp_c9)._m0[12].x, _141);
        float _193 = _191 * _187;
        float _195 = floor(_193);
        float _197 = -_195;
        float _199 = _193 + _197;
        _201 = _199;
        _203 = true;
    }
    else
    {
        float _205 = float(_107);
        float _207 = 1.0 / _205;
        float _209 = _141 * _207;
        _201 = _209;
    }
    _203 = false;
    float _211 = _201;
    float _213 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _215 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _213;
    float _217 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _219 = _217 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _221 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _223 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _221;
    float _225 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _227 = _225 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _229 = 1.0 / _215;
    float _231 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _233 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _231;
    float _235 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _237 = _235 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _239 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _241 = isnan(_211);
    bool _243 = _239 || _241;
    bool _245 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _247 = _243 || _245;
    float _249 = float(_247);
    float _251 = 1.0 / _219;
    float _253 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _255 = _211 + _253;
    float _257 = -_249;
    float _259 = _257 + 1.0;
    float _261 = 1.0 / _223;
    float _263 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _265 = _211 + _263;
    float _267 = _255 * _229;
    bool _269 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[150].w;
    bool _271 = isnan(_211);
    bool _273 = _269 || _271;
    bool _275 = isnan((*spvDescriptorSet0.vp_c9)._m0[150].w);
    bool _277 = _273 || _275;
    float _279 = float(_277);
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _283 = _211 + _281;
    bool _285 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _287 = 1.0 / _227;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _291 = (*spvDescriptorSet0.vp_c9)._m0[150].w + _289;
    float _293 = _265 * _251;
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _297 = _211 + _295;
    float _299 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _301 = _211 + _299;
    bool _303 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _305 = isnan(_211);
    bool _307 = _303 || _305;
    bool _309 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _311 = _307 || _309;
    float _313 = float(_311);
    float _315 = 1.0 / _233;
    float _317 = _297 * _261;
    float _319 = -_279;
    float _321 = _319 + 1.0;
    float _323 = -_313;
    float _325 = _323 + 1.0;
    float _327 = _313 * _321;
    bool _329 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _331 = isnan(_211);
    bool _333 = _329 || _331;
    bool _335 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _337 = _333 || _335;
    float _339 = float(_337);
    float _341 = 1.0 / _291;
    float _343 = _301 * _287;
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _347 = _211 + _345;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _351 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _349;
    float _353 = -_339;
    float _355 = _353 + 1.0;
    float _357 = fma(_351, _267, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _359 = 1.0 / _237;
    float _361 = _283 * _315;
    bool _363 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _365 = isnan(_211);
    bool _367 = _363 || _365;
    bool _369 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _371 = _367 || _369;
    float _373 = float(_371);
    float _375 = _347 * _341;
    float _377 = _373 * _325;
    float _379 = -_373;
    float _381 = _379 + 1.0;
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _385 = _211 + _383;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _389 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _387;
    float _391 = _339 * _381;
    float _393 = _249 * _355;
    float _395 = _385 * _359;
    bool _397 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _399 = isnan(_211);
    bool _401 = _397 || _399;
    bool _403 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _405 = _401 || _403;
    float _407 = float(_405);
    float _409 = fma(_389, _267, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _411 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _413 = isnan(_211);
    bool _415 = _411 || _413;
    bool _417 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _419 = _415 || _417;
    float _421 = float(_419);
    bool _423 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _425 = isnan(_211);
    bool _427 = _423 || _425;
    bool _429 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _431 = _427 || _429;
    float _433 = float(_431);
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _437 = _435 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _439 = -_407;
    float _441 = _439 + 1.0;
    float _443 = _421 * _259;
    float _445 = -_421;
    float _447 = _445 + 1.0;
    float _449 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _451 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _449;
    float _453 = _433 * _441;
    float _455 = fma(_437, _293, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _457 = _407 * _447;
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _461 = _459 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _465 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _463;
    float _467 = _409 * _453;
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _471 = _469 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _473 = -_433;
    float _475 = _473 + 1.0;
    float _477 = fma(_461, _293, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _479 = fma(_465, _317, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _481 = fma(_451, _317, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _483 = _357 * _453;
    float _485 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _487 = _485 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _489 = fma(_471, _343, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _491 = fma(_475, (*spvDescriptorSet0.vp_c9)._m0[143].x, _467);
    float _493 = fma(_475, (*spvDescriptorSet0.vp_c9)._m0[143].y, _483);
    float _495 = fma(_487, _343, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _497 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _499 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _497;
    float _501 = fma(_455, _457, _491);
    float _503 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _505 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _503;
    float _507 = fma(_477, _457, _493);
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _511 = _509 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _513 = fma(_479, _443, _501);
    float _515 = fma(_499, _361, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _517 = fma(_505, _361, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _521 = _519 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _523 = fma(_481, _443, _507);
    float _525 = in.m_60.x;
    float _527 = in.m_60.y;
    float _529 = fma(_511, _395, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _531 = fma(_521, _395, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _533 = fma(_489, _393, _513);
    float _535 = fma(_495, _393, _523);
    float _537 = -(*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _539 = (*spvDescriptorSet0.vp_c9)._m0[150].x + _537;
    float _541 = -(*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _543 = (*spvDescriptorSet0.vp_c9)._m0[150].y + _541;
    float _545 = fma(_515, _391, _533);
    float _547 = fma(_517, _391, _535);
    float _549 = fma(_539, _375, (*spvDescriptorSet0.vp_c9)._m0[149].x);
    float _551 = fma(_543, _375, (*spvDescriptorSet0.vp_c9)._m0[149].y);
    float _553 = fma(_529, _377, _545);
    float _555 = fma(_531, _377, _547);
    float _557 = fma(_549, _327, _553);
    float _559 = fma(_551, _327, _555);
    float _561 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[150].x, _557);
    float _563 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[150].y, _559);
    float _565 = _561 * _525;
    float _567 = _563 * _527;
    bool _569 = !_285;
    float _571 = _547;
    int _573 = as_type<int>(_507);
    int _575 = as_type<int>(_457);
    float _577 = _545;
    float _595;
    if (!_569)
    {
        float _579 = in.m_58.x;
        float _581 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _583 = _579 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _585 = fma(_583, (*spvDescriptorSet0.vp_c9)._m0[11].y, _141);
        float _587 = _585 * _581;
        float _589 = floor(_587);
        float _591 = -_589;
        float _593 = _587 + _591;
        _595 = _593;
        _597 = true;
    }
    else
    {
        float _599 = float(_107);
        float _601 = 1.0 / _599;
        float _603 = _141 * _601;
        _595 = _603;
    }
    _597 = false;
    float _605 = _595;
    bool _607 = _605 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _609 = isnan(_605);
    bool _611 = _607 || _609;
    bool _613 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _615 = _611 || _613;
    float _617 = float(_615);
    float _619 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _621 = _619 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _623 = _605 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _625 = isnan(_605);
    bool _627 = _623 || _625;
    bool _629 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _631 = _627 || _629;
    float _633 = float(_631);
    float _635 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _637 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _635;
    float _639 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _641 = _605 + _639;
    float _643 = -_617;
    float _645 = _643 + 1.0;
    bool _647 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _649 = 1.0 / _621;
    float _651 = _633 * _645;
    float _653 = -_633;
    float _655 = _653 + 1.0;
    float _657 = _637 * _649;
    float _659 = fma(_657, _641, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _661 = _659 * _651;
    float _663 = fma(_655, (*spvDescriptorSet0.vp_c9)._m0[115].x, _661);
    float _665 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _667 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _669 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _671 = fma(_617, (*spvDescriptorSet0.vp_c9)._m0[116].x, _663);
    float _673 = _665 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _675 = _667 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _677 = _669 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _679 = _671 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_62.x = _673;
    out.m_62.y = _675;
    out.m_62.z = _677;
    out.m_62.w = _679;
    bool _681 = !_647;
    float _699;
    if (!_681)
    {
        float _683 = in.m_58.x;
        float _685 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _687 = _683 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _689 = fma(_687, (*spvDescriptorSet0.vp_c9)._m0[11].w, _141);
        float _691 = _689 * _685;
        float _693 = floor(_691);
        float _695 = -_693;
        float _697 = _691 + _695;
        _699 = _697;
        _701 = true;
    }
    else
    {
        float _703 = float(_107);
        float _705 = 1.0 / _703;
        float _707 = _141 * _705;
        _699 = _707;
    }
    _701 = false;
    float _709 = _699;
    float _711 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _713 = int(_711);
    float _715 = float(_107);
    float _717 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _719 = int(_717);
    float _721 = float(_713);
    float _723 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _725 = int(_723);
    float _727 = float(uint(_719));
    float _729 = 1.0 / _721;
    int _731 = ~_719;
    int _733 = _731 + 1;
    int _735 = ~_719;
    int _737 = _735 + 1;
    float _739 = 1.0 / _727;
    float _741 = float(uint(_725));
    float _743 = _729 * _141;
    float _745 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _747 = int(_745);
    int _749 = as_type<int>(_739) + (-2);
    float _751 = trunc(_743);
    int _753 = int(_751);
    float _755 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _757 = int(_755);
    float _759 = float(_747);
    float _761 = float(uint(_753));
    float _763 = 1.0 / _741;
    float _765 = as_type<float>(_749) * _761;
    float _767 = float(_757);
    float _769 = trunc(_765);
    float _771 = precise::max(_769, 0.0);
    uint _774 = uint(_771);
    int _776 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _778 = _776 != 0;
    float _780 = 1.0 / _767;
    float _782 = float(_719);
    int _784 = _733 * int(_774);
    int _786 = _784 + _753;
    float _788 = float(_753);
    float _790 = _557;
    float _792 = as_type<float>(_774);
    if (_778)
    {
        float _794 = in.m_58.x;
        _790 = _794;
    }
    float _796 = _790;
    float _798 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _800 = int(_798);
    if (_778)
    {
        _571 = 1.0;
    }
    float _802 = _571;
    float _804 = _802;
    if (_778)
    {
        _573 = 0;
        _575 = 0;
    }
    int _806 = _573;
    int _808 = _575;
    float _810 = float(uint(_786));
    bool _812 = _788 >= _782;
    bool _814 = isnan(_788);
    bool _816 = _812 || _814;
    bool _818 = isnan(_782);
    bool _820 = _816 || _818;
    float _822 = float(_820);
    int _824 = _806;
    int _826 = _808;
    if (_778)
    {
        _577 = 1.0;
    }
    float _828 = _577;
    float _830 = as_type<float>(_749) * _810;
    float _832 = 1.0 / _715;
    float _834 = in.m_58.x;
    float _836 = in.m_58.y;
    float _838 = in.m_58.z;
    float _840 = in.m_58.w;
    float _842 = trunc(_830);
    float _844 = precise::max(_842, 0.0);
    uint _846 = uint(_844);
    float _848 = 1.0 / _759;
    float _850 = trunc(_822);
    int _852 = int(_850);
    int _854 = int(_774) + int(_846);
    float _856 = as_type<float>(_846);
    float _858 = _828;
    if (_778)
    {
        _856 = 1.0;
    }
    float _860 = _856;
    float _862 = _860;
    float _864 = _796;
    if (_778)
    {
        _792 = _796;
    }
    float _866 = _792;
    float _868 = _866;
    if (!_778)
    {
        float _870 = in.m_58.y;
        float _872 = in.m_58.z;
        _862 = 7.345489978790283203125;
        _858 = 5.839270114898681640625;
        _868 = _872;
        _804 = 1.2345600128173828125;
        _864 = _870;
        _824 = 1;
        _826 = 2;
    }
    float _874 = _862;
    float _876 = _858;
    float _878 = _868;
    float _880 = _804;
    float _882 = _864;
    int _884 = _824;
    int _886 = _826;
    int _888 = _737 * _854;
    int _890 = _888 + _753;
    float _892 = _874 * _834;
    float _894 = _780 * _141;
    bool _896 = _719 == 0;
    float _898 = _848 * _141;
    bool _900 = uint(_890) >= uint(_719);
    float _902 = floor(_892);
    float _904 = float(uint(_800));
    float _906 = _832 * _141;
    bool _908 = !_900;
    int _910 = _908 ? 0 : (-1);
    float _912 = _876 * _878;
    bool _914 = _836 > 0.5;
    float _916 = _834 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _918 = ~_854;
    int _920 = _918 + _910;
    int _922 = _920 + 1;
    float _924 = trunc(_894);
    int _926 = int(_924);
    int _928 = _719 + (-1);
    int _930 = _719 * _922;
    int _932 = _930 + _753;
    int _934 = ~_852;
    int _936 = _934 + 1;
    int _938 = _936 + 1;
    int _940 = ~_725;
    int _942 = _940 + 1;
    float _944 = -_902;
    float _946 = _892 + _944;
    bool _948 = !_896;
    int _950 = _948 ? _932 : (-1);
    float _952 = 1.0 / _904;
    float _954 = _946 * _782;
    int _956 = as_type<int>(_763) + (-2);
    int _958 = _950 * _938;
    int _960 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _962 = _960 != 0;
    float _964 = _782 * _906;
    float _966 = float(uint(_926));
    float _968 = trunc(_898);
    int _970 = int(_968);
    bool _972 = _838 > 0.5;
    int _974 = _852 * _928;
    int _976 = _974 + _958;
    float _978 = -_177;
    int _980 = _914 ? as_type<int>(_978) : as_type<int>(_177);
    int _982 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _984 = _982 != 0;
    int _986 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _988 = _986 != 0;
    int _990 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _992 = _990 != 0;
    float _994 = -_181;
    int _996 = _972 ? as_type<int>(_994) : as_type<int>(_181);
    float _998 = trunc(_954);
    int _1000 = int(_998);
    float _1002 = as_type<float>(_956) * _966;
    bool _1004 = !_962;
    int _1006 = _1004 ? 0 : 1;
    int _1008 = as_type<int>(_952) + (-2);
    int _1010 = abs(_1006);
    float _1012 = trunc(_1002);
    float _1014 = precise::max(_1012, 0.0);
    uint _1016 = uint(_1014);
    bool _1018 = !_988;
    float _1020 = _1018 ? _177 : as_type<float>(_980);
    bool _1022 = !_992;
    float _1024 = _1022 ? _181 : as_type<float>(_996);
    int _1026 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1028 = _1026 != 0;
    int _1030 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1032 = _1030 != 0;
    int _1034 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1036 = _1034 != 0;
    float _1038 = trunc(_964);
    int _1040 = int(_1038);
    float _1042 = float(uint(_970));
    int _1044 = _1000 * _1010;
    int _1046 = _1044 + _753;
    int _1048 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1050 = _1048 != 0;
    bool _1052 = !_1032;
    int _1054 = _1052 ? 0 : 1;
    float _1056 = as_type<float>(_1008) * _1042;
    bool _1058 = !_1028;
    int _1060 = _1058 ? 0 : 1;
    int _1062 = _942 * int(_1016);
    int _1064 = _1062 + _926;
    int _1066 = abs(_1054);
    bool _1068 = !_1036;
    int _1070 = _1068 ? 0 : 1;
    float _1072 = trunc(_1056);
    float _1074 = precise::max(_1072, 0.0);
    uint _1076 = uint(_1074);
    int _1078 = abs(_1060);
    int _1080 = _976 * _1066;
    bool _1082 = !_1050;
    int _1084 = _1082 ? 0 : 1;
    int _1086 = abs(_1070);
    float _1088 = float(uint(_1064));
    int _1090 = abs(_1084);
    int _1092 = _1040 * _1078;
    int _1094 = _1092 + _1080;
    float _1096 = as_type<float>(_956) * _1088;
    float _1098 = _880 * _882;
    float _1100 = float(_725);
    int _1102 = _1046 * _1086;
    int _1104 = _1102 + _1094;
    float _1106 = trunc(_1096);
    float _1108 = precise::max(_1106, 0.0);
    uint _1110 = uint(_1108);
    int _1112 = ~_725;
    int _1114 = _1112 + 1;
    int _1116 = _1000 * _1090;
    int _1118 = _1116 + _1104;
    int _1120 = ~_800;
    int _1122 = _1120 + 1;
    float _1124 = float(_926);
    float _1126 = float(uint(_1118));
    float _1128 = floor(_1098);
    bool _1130 = _840 > 0.5;
    bool _1132 = _1124 >= _1100;
    bool _1134 = isnan(_1124);
    bool _1136 = _1132 || _1134;
    bool _1138 = isnan(_1100);
    bool _1140 = _1136 || _1138;
    float _1142 = float(_1140);
    float _1144 = as_type<float>(_749) * _1126;
    float _1146 = -_181;
    int _1148 = _1130 ? as_type<int>(_1146) : as_type<int>(_181);
    int _1150 = int(_1016) + int(_1110);
    float _1152 = trunc(_1144);
    float _1154 = precise::max(_1152, 0.0);
    uint _1156 = uint(_1154);
    int _1158 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1160 = _1158 != 0;
    int _1162 = _1114 * _1150;
    int _1164 = _1162 + _926;
    int _1166 = _1122 * int(_1076);
    int _1168 = _1166 + _970;
    float _1170 = -_1128;
    float _1172 = _1098 + _1170;
    bool _1174 = uint(_1164) >= uint(_725);
    float _1176 = trunc(_1142);
    int _1178 = int(_1176);
    float _1180 = float(uint(_1168));
    float _1182 = _1172 * _1100;
    int _1184 = ~_719;
    int _1186 = _1184 + 1;
    float _1188 = _1100 * _906;
    bool _1190 = !_984;
    float _1192 = _1190 ? _181 : as_type<float>(_1148);
    float _1194 = as_type<float>(_1008) * _1180;
    bool _1196 = !_1174;
    int _1198 = _1196 ? 0 : (-1);
    float _1200 = floor(_912);
    bool _1202 = !_1160;
    int _1204 = _1202 ? 0 : 1;
    int _1206 = _1186 * int(_1156);
    int _1208 = _1206 + _1118;
    int _1210 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1212 = _1210 != 0;
    int _1214 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1216 = _1214 != 0;
    int _1218 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1220 = _1218 != 0;
    int _1222 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1224 = _1222 != 0;
    int _1226 = ~_1150;
    int _1228 = _1226 + _1198;
    int _1230 = _1228 + 1;
    float _1232 = float(uint(_1208));
    float _1234 = trunc(_1194);
    float _1236 = precise::max(_1234, 0.0);
    uint _1238 = uint(_1236);
    bool _1240 = !_1216;
    int _1242 = _1240 ? 0 : 1;
    int _1244 = _725 * _1230;
    int _1246 = _1244 + _926;
    bool _1248 = _725 == 0;
    float _1250 = as_type<float>(_749) * _1232;
    int _1252 = ~_1178;
    int _1254 = _1252 + 1;
    int _1256 = _1254 + 1;
    bool _1258 = !_1248;
    int _1260 = _1258 ? _1246 : (-1);
    float _1262 = trunc(_1250);
    float _1264 = precise::max(_1262, 0.0);
    uint _1266 = uint(_1264);
    float _1268 = -_1200;
    float _1270 = _912 + _1268;
    int _1272 = ~_800;
    int _1274 = _1272 + 1;
    int _1276 = _1260 * _1256;
    int _1278 = _725 + (-1);
    int _1280 = abs(_1204);
    float _1282 = trunc(_1188);
    int _1284 = int(_1282);
    int _1286 = int(_1076) + int(_1238);
    int _1288 = _1178 * _1278;
    int _1290 = _1288 + _1276;
    int _1292 = abs(_1242);
    bool _1294 = !_1212;
    int _1296 = _1294 ? 0 : 1;
    float _1298 = trunc(_1182);
    int _1300 = int(_1298);
    int _1302 = int(_1156) + int(_1266);
    int _1304 = _1290 * _1292;
    int _1306 = abs(_1296);
    int _1308 = _1274 * _1286;
    int _1310 = _1308 + _970;
    bool _1312 = !_1220;
    int _1314 = _1312 ? 0 : 1;
    bool _1316 = uint(_1310) >= uint(_800);
    int _1318 = ~_719;
    int _1320 = _1318 + 1;
    int _1322 = _1284 * _1306;
    int _1324 = _1322 + _1304;
    float _1326 = float(uint(_1046));
    float _1328 = float(_800);
    int _1330 = _1300 * _1280;
    int _1332 = _1330 + _926;
    int _1334 = abs(_1314);
    float _1336 = as_type<float>(_749) * _1326;
    bool _1338 = !_1224;
    int _1340 = _1338 ? 0 : 1;
    int _1342 = _1320 * _1302;
    int _1344 = _1342 + _1118;
    float _1346 = float(_970);
    int _1348 = abs(_1340);
    int _1350 = _1332 * _1334;
    int _1352 = _1350 + _1324;
    bool _1354 = _1346 >= _1328;
    bool _1356 = isnan(_1346);
    bool _1358 = _1354 || _1356;
    bool _1360 = isnan(_1328);
    bool _1362 = _1358 || _1360;
    float _1364 = float(_1362);
    float _1366 = trunc(_1336);
    float _1368 = precise::max(_1366, 0.0);
    uint _1370 = uint(_1368);
    bool _1372 = uint(_1344) >= uint(_719);
    bool _1374 = !_1316;
    int _1376 = _1374 ? 0 : (-1);
    int _1378 = _1300 * _1348;
    int _1380 = _1378 + _1352;
    int _1382 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1384 = _1382 != 0;
    int _1386 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1388 = _1386 != 0;
    int _1390 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1392 = _1390 != 0;
    float _1394 = trunc(_1364);
    int _1396 = int(_1394);
    int _1398 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1400 = _1398 != 0;
    float _1402 = _1270 * _1328;
    int _1404 = ~_1286;
    int _1406 = _1404 + _1376;
    int _1408 = _1406 + 1;
    float _1410 = _1328 * _906;
    bool _1412 = !_1400;
    int _1414 = _1412 ? 0 : 1;
    float _1416 = float(uint(_1380));
    float _1418 = trunc(_1402);
    int _1420 = int(_1418);
    int _1422 = ~_719;
    int _1424 = _1422 + 1;
    int _1426 = _800 * _1408;
    int _1428 = _1426 + _970;
    int _1430 = abs(_1414);
    float _1432 = as_type<float>(_956) * _1416;
    bool _1434 = _800 == 0;
    int _1436 = _1424 * int(_1370);
    int _1438 = _1436 + _1046;
    bool _1440 = !_1388;
    int _1442 = _1440 ? 0 : 1;
    float _1444 = trunc(_1410);
    int _1446 = int(_1444);
    int _1448 = ~_1396;
    int _1450 = _1448 + 1;
    int _1452 = _1450 + 1;
    bool _1454 = !_1434;
    int _1456 = _1454 ? _1428 : (-1);
    float _1458 = float(uint(_1438));
    int _1460 = _800 + (-1);
    float _1462 = trunc(_1432);
    float _1464 = precise::max(_1462, 0.0);
    uint _1466 = uint(_1464);
    int _1468 = _1456 * _1452;
    bool _1470 = !_1372;
    int _1472 = _1470 ? 0 : (-1);
    int _1474 = _1420 * _1430;
    int _1476 = _1474 + _970;
    float _1478 = as_type<float>(_749) * _1458;
    int _1480 = ~_725;
    int _1482 = _1480 + 1;
    int _1484 = _1396 * _1460;
    int _1486 = _1484 + _1468;
    int _1488 = abs(_1442);
    int _1490 = ~_1302;
    int _1492 = _1490 + _1472;
    int _1494 = _1492 + 1;
    int _1496 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1498 = _1496 != 0;
    int _1500 = _1486 * _1488;
    int _1502 = _719 * _1494;
    int _1504 = _1502 + _1118;
    bool _1506 = !_1498;
    int _1508 = _1506 ? 0 : 1;
    bool _1510 = !_1384;
    int _1512 = _1510 ? 0 : 1;
    int _1514 = _1482 * int(_1466);
    int _1516 = _1514 + _1380;
    bool _1518 = _719 == 0;
    int _1520 = abs(_1508);
    int _1522 = abs(_1512);
    bool _1524 = !_1392;
    int _1526 = _1524 ? 0 : 1;
    bool _1528 = !_1518;
    int _1530 = _1528 ? _1504 : (-1);
    int _1532 = _1446 * _1522;
    int _1534 = _1532 + _1500;
    float _1536 = float(uint(_1516));
    int _1538 = abs(_1526);
    float _1540 = trunc(_1478);
    float _1542 = precise::max(_1540, 0.0);
    uint _1544 = uint(_1542);
    int _1546 = _1530 & 3;
    bool _1548 = _1546 != 0;
    float _1550 = as_type<float>(_956) * _1536;
    int _1552 = _1530 & 3;
    bool _1554 = _1552 != 0;
    int _1556 = _1476 * _1538;
    int _1558 = _1556 + _1534;
    int _1560 = _1548 ? 0 : 1;
    bool _1562 = uint(_1552) > 1u;
    float _1564 = trunc(_1550);
    float _1566 = precise::max(_1564, 0.0);
    uint _1568 = uint(_1566);
    int _1570 = _1420 * _1520;
    int _1572 = _1570 + _1558;
    int _1574 = ~_719;
    int _1576 = _1574 + 1;
    int _1578 = ~_1560;
    int _1580 = _1578 + 1;
    int _1582 = _1580 + 1;
    float _1584 = float(uint(_1572));
    int _1586 = int(_1370) + int(_1544);
    int _1588 = _1582;
    if (!_1562)
    {
        int _1590 = ~_1560;
        int _1592 = _1590 + 1;
        _1588 = _1592;
    }
    int _1594 = _1588;
    float _1596 = as_type<float>(_1008) * _1584;
    bool _1598 = uint(_1552) >= 2u;
    int _1600 = _1576 * _1586;
    int _1602 = _1600 + _1046;
    int _1604 = int(_1466) + int(_1568);
    int _1606 = ~_725;
    int _1608 = _1606 + 1;
    float _1610 = trunc(_1596);
    float _1612 = precise::max(_1610, 0.0);
    uint _1614 = uint(_1612);
    float _1616 = float(uint(_1332));
    int _1618 = _1598 ? 0 : 1;
    int _1620 = _1608 * _1604;
    int _1622 = _1620 + _1380;
    bool _1624 = uint(_1602) >= uint(_719);
    float _1626 = as_type<float>(_956) * _1616;
    int _1628 = ~_800;
    int _1630 = _1628 + 1;
    bool _1632 = !_1624;
    int _1634 = _1632 ? 0 : (-1);
    float _1636 = trunc(_1626);
    float _1638 = precise::max(_1636, 0.0);
    uint _1640 = uint(_1638);
    bool _1642 = uint(_1622) >= uint(_725);
    int _1644 = ~_725;
    int _1646 = _1644 + 1;
    bool _1648 = !_1642;
    int _1650 = _1648 ? 0 : (-1);
    int _1652 = _1630 * int(_1614);
    int _1654 = _1652 + _1572;
    bool _1656 = _1552 != 3;
    int _1658 = ~_1586;
    int _1660 = _1658 + _1634;
    int _1662 = _1660 + 1;
    float _1664 = float(uint(_1654));
    int _1666 = ~_1604;
    int _1668 = _1666 + _1650;
    int _1670 = _1668 + 1;
    int _1672 = _719 * _1662;
    int _1674 = _1672 + _1046;
    float _1676 = as_type<float>(_1008) * _1664;
    int _1678 = ~_1618;
    int _1680 = _1678 + 1;
    int _1682 = _1680 + 1;
    int _1684 = _725 * _1670;
    int _1686 = _1684 + _1380;
    bool _1688 = !_1518;
    int _1690 = _1688 ? _1674 : (-1);
    float _1692 = trunc(_1676);
    float _1694 = precise::max(_1692, 0.0);
    uint _1696 = uint(_1694);
    int _1698 = _1682;
    if (_1656)
    {
        int _1700 = ~_1618;
        int _1702 = _1700 + 1;
        _1698 = _1702;
    }
    int _1704 = _1698;
    int _1706 = _1646 * int(_1640);
    int _1708 = _1706 + _1332;
    int _1710 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1712 = _1710 != 0;
    bool _1714 = !_1248;
    int _1716 = _1714 ? _1686 : (-1);
    float _1718 = float(uint(_1708));
    bool _1720 = !_1712;
    int _1722 = _1720 ? 0 : 1;
    int _1724 = _1716 & 3;
    bool _1726 = _1724 != 0;
    float _1728 = as_type<float>(_956) * _1718;
    int _1730 = _1716 & 3;
    bool _1732 = _1730 != 0;
    int _1734 = _1726 ? 0 : 1;
    float _1736 = trunc(_1728);
    float _1738 = precise::max(_1736, 0.0);
    uint _1740 = uint(_1738);
    bool _1742 = uint(_1730) > 1u;
    int _1744 = ~_800;
    int _1746 = _1744 + 1;
    int _1748 = int(_1614) + int(_1696);
    int _1750 = ~_1734;
    int _1752 = _1750 + 1;
    int _1754 = _1752 + 1;
    float _1756 = float(uint(_1476));
    int _1758 = _1746 * _1748;
    int _1760 = _1758 + _1572;
    bool _1762 = !_1554;
    int _1764 = _1762 ? 0 : 1;
    bool _1766 = _1730 != 3;
    float _1768 = as_type<float>(_1008) * _1756;
    int _1770 = _1754;
    if (!_1742)
    {
        int _1772 = ~_1734;
        int _1774 = _1772 + 1;
        _1770 = _1774;
    }
    int _1776 = _1770;
    int _1778 = ~_725;
    int _1780 = _1778 + 1;
    float _1782 = trunc(_1768);
    float _1784 = precise::max(_1782, 0.0);
    uint _1786 = uint(_1784);
    bool _1788 = uint(_1760) >= uint(_800);
    int _1790 = int(_1640) + int(_1740);
    bool _1792 = !_1788;
    int _1794 = _1792 ? 0 : (-1);
    bool _1796 = uint(_1730) >= 2u;
    int _1798 = _1780 * _1790;
    int _1800 = _1798 + _1332;
    int _1802 = ~_1748;
    int _1804 = _1802 + _1794;
    int _1806 = _1804 + 1;
    bool _1808 = !_1732;
    int _1810 = _1808 ? 0 : 1;
    int _1812 = _1796 ? 0 : 1;
    int _1814 = _800 * _1806;
    int _1816 = _1814 + _1572;
    bool _1818 = _1552 != 3;
    bool _1820 = uint(_1800) >= uint(_725);
    int _1822 = ~_800;
    int _1824 = _1822 + 1;
    int _1826 = ~_1812;
    int _1828 = _1826 + 1;
    int _1830 = _1828 + 1;
    bool _1832 = !_1818;
    int _1834 = _1832 ? 0 : (-1);
    int _1836 = _1830;
    if (_1766)
    {
        int _1838 = ~_1812;
        int _1840 = _1838 + 1;
        _1836 = _1840;
    }
    int _1842 = _1836;
    int _1844 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1846 = _1844 != 0;
    bool _1848 = !_1434;
    int _1850 = _1848 ? _1816 : (-1);
    int _1852 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _1854 = _1852 != 0;
    int _1856 = _1824 * int(_1786);
    int _1858 = _1856 + _1476;
    bool _1860 = !_1846;
    int _1862 = _1860 ? 0 : 1;
    int _1864 = _1850 & 3;
    bool _1866 = _1864 != 0;
    bool _1868 = !_1820;
    int _1870 = _1868 ? 0 : (-1);
    bool _1872 = _1730 != 3;
    bool _1874 = !_1854;
    int _1876 = _1874 ? 0 : 1;
    bool _1878 = uint(_1864) > 1u;
    float _1880 = float(uint(_1858));
    bool _1882 = !_1872;
    int _1884 = _1882 ? 0 : (-1);
    int _1886 = _1850 & 3;
    bool _1888 = _1886 != 0;
    float _1890 = as_type<float>(_1008) * _1880;
    int _1892 = _1888 ? 0 : 1;
    float _1894 = trunc(_1890);
    float _1896 = precise::max(_1894, 0.0);
    uint _1898 = uint(_1896);
    bool _1900 = uint(_1864) >= 2u;
    bool _1902 = !_1866;
    int _1904 = _1902 ? 0 : 1;
    int _1906 = ~_1892;
    int _1908 = _1906 + 1;
    int _1910 = _1908 + 1;
    int _1912 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1914 = _1912 != 0;
    int _1916 = _1910;
    if (!_1878)
    {
        int _1918 = ~_1892;
        int _1920 = _1918 + 1;
        _1916 = _1920;
    }
    int _1922 = _1916;
    int _1924 = _1900 ? 0 : 1;
    bool _1926 = _1864 != 3;
    int _1928 = _1530 >> 31;
    bool _1930 = _1864 != 3;
    int _1932 = _1928 & 3;
    int _1934 = _1850 >> 31;
    bool _1936 = !_1930;
    int _1938 = _1936 ? 0 : (-1);
    int _1940 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1942 = _1940 != 0;
    int _1944 = _1716 >> 31;
    int _1946 = _1530 + _1932;
    int _1948 = _1934 & 3;
    int _1950 = _1944 & 3;
    int _1952 = ~_1924;
    int _1954 = _1952 + 1;
    int _1956 = _1954 + 1;
    int _1958 = _1850 + _1948;
    int _1960 = _1956;
    if (_1926)
    {
        int _1962 = ~_1924;
        int _1964 = _1962 + 1;
        _1960 = _1964;
    }
    int _1966 = _1960;
    float _1968 = in.m_48.x;
    float _1970 = in.m_48.y;
    float _1972 = in.m_48.z;
    int _1974 = _1946 >> 2;
    int _1976 = _1716 + _1950;
    int _1978 = _1974 << 4;
    int _1980 = _1978 + 368;
    int _1982 = int(_1786) + int(_1898);
    int _1984 = _1976 >> 2;
    int _1986 = _1958 >> 2;
    int _1988 = ~_800;
    int _1990 = _1988 + 1;
    uint _1992 = uint(int(uint(_1980) >> uint(2)));
    uint _1994 = uint(int(uint(int(_1992)) >> uint(2)));
    int _1996 = int(_1992) & 3;
    float _1998 = (*spvDescriptorSet0.vp_c9)._m0[int(_1994)][_1996];
    int _2000 = int(_1992) + 1;
    uint _2002 = uint(int(uint(_2000) >> uint(2)));
    int _2004 = _2000 & 3;
    float _2006 = (*spvDescriptorSet0.vp_c9)._m0[int(_2002)][_2004];
    int _2008 = _1984 << 4;
    int _2010 = _2008 + 512;
    int _2012 = _1990 * _1982;
    int _2014 = _2012 + _1476;
    int _2016 = _1986 << 4;
    int _2018 = _2016 + 656;
    int _2020 = ~_1790;
    int _2022 = _2020 + _1870;
    int _2024 = _2022 + 1;
    uint _2026 = uint(int(uint(_2010) >> uint(2)));
    uint _2028 = uint(int(uint(int(_2026)) >> uint(2)));
    int _2030 = int(_2026) & 3;
    float _2032 = (*spvDescriptorSet0.vp_c9)._m0[int(_2028)][_2030];
    int _2034 = int(_2026) + 1;
    uint _2036 = uint(int(uint(_2034) >> uint(2)));
    int _2038 = _2034 & 3;
    float _2040 = (*spvDescriptorSet0.vp_c9)._m0[int(_2036)][_2038];
    float _2042 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _2044 = uint(_2014) >= uint(_800);
    float _2046 = _1970 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _2048 = _1970 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _2050 = -_2042;
    float _2052 = fma(_916, 2.0, _2050);
    bool _2054 = !_2044;
    int _2056 = _2054 ? 0 : (-1);
    float _2058 = _1970 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    int _2060 = _1980 + 8;
    uint _2062 = uint(int(uint(_2060) >> uint(2)));
    uint _2064 = uint(int(uint(int(_2062)) >> uint(2)));
    int _2066 = int(_2062) & 3;
    float _2068 = (*spvDescriptorSet0.vp_c9)._m0[int(_2064)][_2066];
    int _2070 = int(_2062) + 1;
    uint _2072 = uint(int(uint(_2070) >> uint(2)));
    int _2074 = _2070 & 3;
    float _2076 = (*spvDescriptorSet0.vp_c9)._m0[int(_2072)][_2074];
    int _2078 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2080 = _2078 != 0;
    float _2082 = _1970 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _2084 = fma(_1968, (*spvDescriptorSet0.vp_c10)._m0[14].y, _2046);
    float _2086 = fma(_1968, (*spvDescriptorSet0.vp_c10)._m0[14].z, _2048);
    float _2088 = fma(_1968, (*spvDescriptorSet0.vp_c10)._m0[14].w, _2058);
    float _2090 = fma(_1968, (*spvDescriptorSet0.vp_c10)._m0[14].x, _2082);
    int _2092 = abs(_1594);
    uint _2094 = uint(int(uint(_2018) >> uint(2)));
    uint _2096 = uint(int(uint(int(_2094)) >> uint(2)));
    int _2098 = int(_2094) & 3;
    float _2100 = (*spvDescriptorSet0.vp_c9)._m0[int(_2096)][_2098];
    int _2102 = int(_2094) + 1;
    uint _2104 = uint(int(uint(_2102) >> uint(2)));
    int _2106 = _2102 & 3;
    float _2108 = (*spvDescriptorSet0.vp_c9)._m0[int(_2104)][_2106];
    int _2110 = _725 * _2024;
    int _2112 = _2110 + _1332;
    int _2114 = abs(_1922);
    float _2116 = _836 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2118 = fma(_1972, (*spvDescriptorSet0.vp_c10)._m0[16].x, _2090);
    float _2120 = fma(_1972, (*spvDescriptorSet0.vp_c10)._m0[16].y, _2084);
    int _2122 = _2010 + 8;
    uint _2124 = uint(int(uint(_2122) >> uint(2)));
    uint _2126 = uint(int(uint(int(_2124)) >> uint(2)));
    int _2128 = int(_2124) & 3;
    float _2130 = (*spvDescriptorSet0.vp_c9)._m0[int(_2126)][_2128];
    int _2132 = int(_2124) + 1;
    uint _2134 = uint(int(uint(_2132) >> uint(2)));
    int _2136 = _2132 & 3;
    float _2138 = (*spvDescriptorSet0.vp_c9)._m0[int(_2134)][_2136];
    int _2140 = abs(_1776);
    float _2142 = _2118 + (*spvDescriptorSet0.vp_c10)._m0[17].x;
    int _2144 = ~_2092;
    int _2146 = _2144 + 1;
    int _2148 = _2146 + 1;
    float _2150 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2152 = fma(_1972, (*spvDescriptorSet0.vp_c10)._m0[16].z, _2086);
    int _2154 = abs(_1764);
    int _2156 = _2018 + 8;
    uint _2158 = uint(int(uint(_2156) >> uint(2)));
    uint _2160 = uint(int(uint(int(_2158)) >> uint(2)));
    int _2162 = int(_2158) & 3;
    float _2164 = (*spvDescriptorSet0.vp_c9)._m0[int(_2160)][_2162];
    int _2166 = int(_2158) + 1;
    uint _2168 = uint(int(uint(_2166) >> uint(2)));
    int _2170 = _2166 & 3;
    float _2172 = (*spvDescriptorSet0.vp_c9)._m0[int(_2168)][_2170];
    int _2174 = ~_2140;
    int _2176 = _2174 + 1;
    int _2178 = _2176 + 1;
    float _2180 = fma(_2116, -2.0, _2150);
    int _2182 = abs(_1810);
    float _2184 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2186 = int(_2184);
    int _2188 = ~_2154;
    int _2190 = _2188 + 1;
    int _2192 = _2190 + 1;
    float _2194 = fma(_1972, (*spvDescriptorSet0.vp_c10)._m0[16].w, _2088);
    int _2196 = ~_1982;
    int _2198 = _2196 + _2056;
    int _2200 = _2198 + 1;
    int _2202 = _2148 * as_type<int>(_2006);
    int _2204 = abs(_1904);
    float _2206 = _2120 + (*spvDescriptorSet0.vp_c10)._m0[17].y;
    int _2208 = abs(_1704);
    int _2210 = _2192 * as_type<int>(_1998);
    int _2212 = _2210 + _2202;
    int _2214 = _800 * _2200;
    int _2216 = _2214 + _1476;
    int _2218 = abs(_1842);
    int _2220 = _2178 * as_type<int>(_2040);
    int _2222 = ~_2182;
    int _2224 = _2222 + 1;
    int _2226 = _2224 + 1;
    float _2228 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2230 = int(_2228);
    int _2232 = ~_2208;
    int _2234 = _2232 + 1;
    int _2236 = _2234 + 1;
    float _2238 = _2194 + (*spvDescriptorSet0.vp_c10)._m0[17].w;
    int _2240 = ~_2114;
    int _2242 = _2240 + 1;
    int _2244 = _2242 + 1;
    int _2246 = _2226 * as_type<int>(_2032);
    int _2248 = _2246 + _2220;
    int _2250 = _2236 * as_type<int>(_2068);
    int _2252 = _2250 + _2212;
    int _2254 = ~_2218;
    int _2256 = _2254 + 1;
    int _2258 = _2256 + 1;
    float _2260 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _2262 = int(_2260);
    int _2264 = ~_2204;
    int _2266 = _2264 + 1;
    int _2268 = _2266 + 1;
    float _2270 = -_141;
    float _2272 = fma(_2270, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2052);
    int _2274 = abs(_1966);
    int _2276 = abs(_1938);
    int _2278 = _2244 * as_type<int>(_2108);
    int _2280 = ~_2274;
    int _2282 = _2280 + 1;
    int _2284 = _2282 + 1;
    float _2286 = float(uint(_2186));
    int _2288 = _2268 * as_type<int>(_2100);
    int _2290 = _2288 + _2278;
    int _2292 = abs(_1834);
    int _2294 = abs(_1722);
    int _2296 = _2258 * as_type<int>(_2130);
    int _2298 = _2296 + _2248;
    int _2300 = abs(_1884);
    float _2302 = 1.0 / _2286;
    int _2304 = ~_2292;
    int _2306 = _2304 + 1;
    int _2308 = _2306 + 1;
    int _2310 = ~_2300;
    int _2312 = _2310 + 1;
    int _2314 = _2312 + 1;
    float _2316 = float(uint(_2230));
    int _2318 = _2284 * as_type<int>(_2164);
    int _2320 = _2318 + _2290;
    int _2322 = ~_2276;
    int _2324 = _2322 + 1;
    int _2326 = _2324 + 1;
    int _2328 = _2314 * as_type<int>(_2138);
    int _2330 = _2328 + _2298;
    int _2332 = abs(_2186);
    int _2334 = _2308 * as_type<int>(_2076);
    int _2336 = _2334 + _2252;
    int _2338 = abs(_1876);
    int _2340 = _2326 * as_type<int>(_2172);
    int _2342 = _2340 + _2320;
    int _2344 = ~_2294;
    int _2346 = _2344 + 1;
    int _2348 = _2346 + 1;
    float _2350 = 1.0 / _2316;
    float _2352 = _834 * 2.0;
    int _2354 = abs(_1862);
    int _2356 = _2336 * _2348;
    int _2358 = ~_2338;
    int _2360 = _2358 + 1;
    int _2362 = _2360 + 1;
    float _2364 = float(uint(_2262));
    int _2366 = _1690 * _2294;
    int _2368 = _2366 + _2356;
    int _2370 = ~_2354;
    int _2372 = _2370 + 1;
    int _2374 = _2372 + 1;
    int _2376 = _2342 * _2362;
    float _2378 = float(uint(_2332));
    float _2380 = floor(_2352);
    bool _2382 = !_1248;
    int _2384 = _2382 ? _2112 : (-1);
    int _2386 = _2330 * _2374;
    int _2388 = as_type<int>(_2302) + (-2);
    int _2390 = abs(_2262);
    int _2392 = _2384 * _2354;
    int _2394 = _2392 + _2386;
    float _2396 = float(uint(_2368));
    float _2398 = 1.0 / _2364;
    float _2400 = as_type<float>(_2388) * _2396;
    bool _2402 = !_1434;
    int _2404 = _2402 ? _2216 : (-1);
    float _2406 = (*spvDescriptorSet0.vp_c10)._m0[19].y * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    int _2408 = as_type<int>(_2350) + (-2);
    float _2410 = 1.0 / _2378;
    float _2412 = float(uint(_2394));
    int _2414 = _2404 * _2338;
    int _2416 = _2414 + _2376;
    int _2418 = abs(_2230);
    float _2420 = as_type<float>(_2408) * _2412;
    float _2422 = float(uint(_2390));
    float _2424 = fma((*spvDescriptorSet0.vp_c10)._m0[19].x, (*spvDescriptorSet0.vp_c10)._m0[19].x, _2406);
    float _2426 = float(uint(_2418));
    float _2428 = trunc(_2400);
    float _2430 = precise::max(_2428, 0.0);
    uint _2432 = uint(_2430);
    int _2434 = abs(_2368);
    int _2436 = as_type<int>(_2398) + (-2);
    float _2438 = float(uint(_2416));
    int _2440 = as_type<int>(_2410) + (-2);
    float _2442 = 1.0 / _2422;
    float _2444 = float(uint(_2434));
    float _2446 = as_type<float>(_2436) * _2438;
    int _2448 = ~_2230;
    int _2450 = _2448 + 1;
    int _2452 = abs(_2394);
    float _2454 = as_type<float>(_2440) * _2444;
    int _2456 = abs(_2416);
    float _2458 = trunc(_2420);
    float _2460 = precise::max(_2458, 0.0);
    uint _2462 = uint(_2460);
    int _2464 = ~_2186;
    int _2466 = _2464 + 1;
    float _2468 = float(uint(_2456));
    float _2470 = float(uint(_2452));
    int _2472 = _2466 * int(_2432);
    int _2474 = _2472 + _2368;
    float _2476 = 1.0 / _2426;
    int _2478 = as_type<int>(_2442) + (-2);
    float _2480 = (*spvDescriptorSet0.vp_c10)._m0[20].y * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    float _2482 = float(uint(_2474));
    float _2484 = as_type<float>(_2478) * _2468;
    int _2486 = ~_2262;
    int _2488 = _2486 + 1;
    float _2490 = trunc(_2446);
    float _2492 = precise::max(_2490, 0.0);
    uint _2494 = uint(_2492);
    int _2496 = _2450 * int(_2462);
    int _2498 = _2496 + _2394;
    float _2500 = fma((*spvDescriptorSet0.vp_c10)._m0[20].x, (*spvDescriptorSet0.vp_c10)._m0[20].x, _2480);
    float _2502 = as_type<float>(_2388) * _2482;
    float _2504 = _834 + _836;
    float _2506 = float(uint(_2498));
    float _2508 = trunc(_2454);
    float _2510 = precise::max(_2508, 0.0);
    uint _2512 = uint(_2510);
    int _2514 = as_type<int>(_2476) + (-2);
    float _2516 = _2504 + (-1.0);
    int _2518 = ~_2332;
    int _2520 = _2518 + 1;
    float _2522 = as_type<float>(_2408) * _2506;
    bool _2524 = _2380 > 0.0;
    float _2526 = as_type<float>(_2514) * _2470;
    bool _2528 = _2380 >= 0.0;
    bool _2530 = isnan(_2380);
    bool _2532 = _2528 || _2530;
    bool _2534 = isnan(0.0);
    bool _2536 = _2532 || _2534;
    int _2538 = _2488 * int(_2494);
    int _2540 = _2538 + _2416;
    float _2542 = trunc(_2502);
    float _2544 = precise::max(_2542, 0.0);
    uint _2546 = uint(_2544);
    bool _2548 = _836 > 0.5;
    float _2550 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2552 = _2550 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2554 = float(uint(_2540));
    int _2556 = _2520 * int(_2512);
    int _2558 = _2556 + _2434;
    float _2560 = trunc(_2526);
    float _2562 = precise::max(_2560, 0.0);
    uint _2564 = uint(_2562);
    float _2566 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2568 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2566;
    float _2570 = as_type<float>(_2436) * _2554;
    float _2572 = _836 + _838;
    float _2574 = float(uint(_2558));
    int _2576 = ~_2418;
    int _2578 = _2576 + 1;
    float _2580 = _2572 + (-1.0);
    float _2582 = trunc(_2484);
    float _2584 = precise::max(_2582, 0.0);
    uint _2586 = uint(_2584);
    float _2588 = as_type<float>(_2440) * _2574;
    bool _2590 = _838 > 0.5;
    float _2592 = fma(_2580, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2594 = trunc(_2522);
    float _2596 = precise::max(_2594, 0.0);
    uint _2598 = uint(_2596);
    int _2600 = _2578 * int(_2564);
    int _2602 = _2600 + _2452;
    int _2604 = ~_2390;
    int _2606 = _2604 + 1;
    float _2608 = (*spvDescriptorSet0.vp_c10)._m0[18].y * (*spvDescriptorSet0.vp_c10)._m0[18].y;
    float _2610 = -_181;
    int _2612 = _2548 ? as_type<int>(_2610) : as_type<int>(_181);
    bool _2614 = _884 != 1;
    float _2616 = fma((*spvDescriptorSet0.vp_c10)._m0[18].x, (*spvDescriptorSet0.vp_c10)._m0[18].x, _2608);
    float _2618 = trunc(_2588);
    float _2620 = precise::max(_2618, 0.0);
    uint _2622 = uint(_2620);
    float _2624 = float(uint(_2602));
    int _2626 = _2606 * int(_2586);
    int _2628 = _2626 + _2456;
    int _2630 = int(_2432) + int(_2546);
    float _2632 = _836 * 2.0;
    int _2634 = ~_2186;
    int _2636 = _2634 + 1;
    float _2638 = as_type<float>(_2514) * _2624;
    float _2640 = float(uint(_2628));
    float _2642 = trunc(_2570);
    float _2644 = precise::max(_2642, 0.0);
    uint _2646 = uint(_2644);
    int _2648 = int(_2462) + int(_2598);
    int _2650 = _2636 * _2630;
    int _2652 = _2650 + _2368;
    bool _2654 = !_1914;
    float _2656 = _2654 ? _181 : as_type<float>(_2612);
    float _2658 = as_type<float>(_2478) * _2640;
    int _2660 = ~_2332;
    int _2662 = _2660 + 1;
    bool _2664 = uint(_2652) >= uint(_2186);
    float _2666 = 1.0 / _2552;
    int _2668 = int(_2512) + int(_2622);
    int _2670 = ~_2262;
    int _2672 = _2670 + 1;
    int _2674 = _2662 * _2668;
    int _2676 = _2674 + _2434;
    float _2678 = -_177;
    int _2680 = _2590 ? as_type<int>(_2678) : as_type<int>(_177);
    float _2682 = trunc(_2638);
    float _2684 = precise::max(_2682, 0.0);
    uint _2686 = uint(_2684);
    int _2688 = int(_2494) + int(_2646);
    float _2690 = fma(_2516, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _2692 = !_2664;
    int _2694 = _2692 ? 0 : (-1);
    bool _2696 = uint(_2676) >= uint(_2332);
    int _2698 = _2672 * _2688;
    int _2700 = _2698 + _2416;
    int _2702 = ~_2630;
    int _2704 = _2702 + _2694;
    int _2706 = _2704 + 1;
    float _2708 = floor(_2632);
    float _2710 = _2568 * _2666;
    int _2712 = ~_2230;
    int _2714 = _2712 + 1;
    int _2716 = _2186 * _2706;
    int _2718 = _2716 + _2368;
    bool _2720 = !_1942;
    float _2722 = _2720 ? _177 : as_type<float>(_2680);
    int _2724 = _2714 * _2648;
    int _2726 = _2724 + _2394;
    float _2728 = trunc(_2658);
    float _2730 = precise::max(_2728, 0.0);
    uint _2732 = uint(_2730);
    bool _2734 = !_2696;
    int _2736 = _2734 ? 0 : (-1);
    int _2738 = int(_2564) + int(_2686);
    bool _2740 = _834 > 0.5;
    bool _2742 = _2186 == 0;
    int _2744 = ~_2418;
    int _2746 = _2744 + 1;
    bool _2748 = uint(_2726) >= uint(_2230);
    float _2750 = -_177;
    float _2752 = _2740 ? _2750 : _177;
    bool _2754 = !_2742;
    int _2756 = _2754 ? _2718 : (-1);
    bool _2758 = _2708 > 0.0;
    bool _2760 = _2708 >= 0.0;
    bool _2762 = isnan(_2708);
    bool _2764 = _2760 || _2762;
    bool _2766 = isnan(0.0);
    bool _2768 = _2764 || _2766;
    int _2770 = _2746 * _2738;
    int _2772 = _2770 + _2452;
    bool _2774 = !_2748;
    int _2776 = _2774 ? 0 : (-1);
    int _2778 = int(_2586) + int(_2732);
    int _2780 = ~_2390;
    int _2782 = _2780 + 1;
    bool _2784 = uint(_2700) >= uint(_2262);
    int _2786 = ~_2648;
    int _2788 = _2786 + _2776;
    int _2790 = _2788 + 1;
    int _2792 = _2782 * _2778;
    int _2794 = _2792 + _2456;
    bool _2796 = !_2080;
    float _2798 = _2796 ? _177 : _2752;
    bool _2800 = uint(_2772) >= uint(_2418);
    int _2802 = _2230 * _2790;
    int _2804 = _2802 + _2394;
    bool _2806 = !_2784;
    int _2808 = _2806 ? 0 : (-1);
    bool _2810 = !_2800;
    int _2812 = _2810 ? 0 : (-1);
    bool _2814 = _2230 == 0;
    float _2816 = as_type<float>(_2790);
    float _2818 = as_type<float>(_2648);
    float _2820 = as_type<float>(_2390);
    float _2822 = _2752;
    float _2824 = _2424;
    float _2826 = as_type<float>(_2186);
    if (!_2614)
    {
        _2816 = _836;
    }
    float _2828 = _2816;
    int _2830 = ~_2688;
    int _2832 = _2830 + _2808;
    int _2834 = _2832 + 1;
    bool _2836 = !_2814;
    int _2838 = _2836 ? _2804 : (-1);
    bool _2840 = uint(_2794) >= uint(_2390);
    float _2842 = _838 * 2.0;
    bool _2844 = _886 != 2;
    int _2846 = _2262 * _2834;
    int _2848 = _2846 + _2416;
    float _2850 = _2828;
    if (!_2614)
    {
        _2818 = _2828;
    }
    float _2852 = _2818;
    float _2854 = _2852;
    if (!_2614)
    {
        _2820 = _838;
    }
    float _2856 = _2820;
    float _2858 = floor(_2842);
    float _2860 = _2856;
    if (!_2614)
    {
        _2822 = _838;
    }
    float _2862 = _2822;
    float _2864 = _2862;
    if (_2614)
    {
        _2854 = _834;
    }
    float _2866 = _2854;
    if (_2614)
    {
        _2850 = _834;
    }
    float _2868 = _2850;
    if (_2614)
    {
        _2860 = _836;
    }
    float _2870 = _2860;
    float _2872 = _2866 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_2614)
    {
        _2864 = _836;
    }
    float _2874 = _2864;
    bool _2876 = _2262 == 0;
    int _2878 = _2368 ^ _2186;
    bool _2880 = !_2876;
    int _2882 = _2880 ? _2848 : (-1);
    bool _2884 = _2230 == 0;
    int _2886 = _2394 ^ _2230;
    uint _2888 = uint(int(uint(_2878) >> uint(31)));
    uint _2890 = uint(int(uint(_2886) >> uint(31)));
    int _2892 = ~_2736;
    int _2894 = _2668 + _2892;
    int _2896 = _2894 + 1;
    int _2898 = ~int(_2888);
    int _2900 = _2898 + 1;
    int _2902 = ~_2812;
    int _2904 = _2738 + _2902;
    int _2906 = _2904 + 1;
    int _2908 = ~int(_2890);
    int _2910 = _2908 + 1;
    int _2912 = _2896 ^ _2900;
    int _2914 = _2906 ^ _2910;
    float _2916 = fma((*spvDescriptorSet0.vp_c10)._m0[18].z, (*spvDescriptorSet0.vp_c10)._m0[18].z, _2616);
    bool _2918 = !_2840;
    int _2920 = _2918 ? 0 : (-1);
    bool _2922 = _2186 == 0;
    float _2924 = fma((*spvDescriptorSet0.vp_c10)._m0[19].z, (*spvDescriptorSet0.vp_c10)._m0[19].z, _2424);
    int _2926 = ~_2900;
    int _2928 = _2926 + _2912;
    int _2930 = _2928 + 1;
    float _2932 = sqrt(_2916);
    int _2934 = ~_2910;
    int _2936 = _2934 + _2914;
    int _2938 = _2936 + 1;
    float _2940 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2942 = _709 + _2940;
    if (_2844)
    {
        _2824 = _834;
    }
    float _2944 = _2824;
    float _2946 = _2944;
    if (_2844)
    {
        _2826 = _836;
    }
    float _2948 = _2826;
    float _2950 = fma(_2710, _2942, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _2952 = sqrt(_2924);
    float _2954 = _2948;
    if (!_2844)
    {
        _2946 = _838;
    }
    float _2956 = _2946;
    if (!_2844)
    {
        _2954 = _834;
    }
    float _2958 = _2954;
    float _2960 = fma((*spvDescriptorSet0.vp_c10)._m0[20].z, (*spvDescriptorSet0.vp_c10)._m0[20].z, _2500);
    bool _2962 = !_2922;
    int _2964 = _2962 ? _2930 : (-1);
    bool _2966 = !_2884;
    int _2968 = _2966 ? _2938 : (-1);
    float _2970 = _2932 * _2142;
    int _2972 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2974 = _2972 != 0;
    int _2976 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2978 = _2976 != 0;
    int _2980 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2982 = _2980 != 0;
    float _2984 = _2958 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    bool _2986 = _709 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2988 = isnan(_709);
    bool _2990 = _2986 || _2988;
    bool _2992 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2994 = _2990 || _2992;
    float _2996 = float(_2994);
    bool _2998 = _709 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _3000 = isnan(_709);
    bool _3002 = _2998 || _3000;
    bool _3004 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _3006 = _3002 || _3004;
    float _3008 = float(_3006);
    bool _3010 = !_2974;
    int _3012 = _3010 ? 0 : 1;
    float _3014 = -_2996;
    float _3016 = _3014 + 1.0;
    bool _3018 = _2858 >= 0.0;
    bool _3020 = isnan(_2858);
    bool _3022 = _3018 || _3020;
    bool _3024 = isnan(0.0);
    bool _3026 = _3022 || _3024;
    float _3028 = sqrt(_2960);
    float _3030 = _2952 * _2206;
    int _3032 = _3026 ? 0 : 1;
    bool _3034 = _2858 > 0.0;
    float _3036 = _3008 * _3016;
    float _3038 = -_3008;
    float _3040 = _3038 + 1.0;
    float _3042 = _2152 + (*spvDescriptorSet0.vp_c10)._m0[17].z;
    float _3044 = _2950 * _3036;
    float _3046 = _3030 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _3048 = ~_3032;
    int _3050 = _3048 + 1;
    int _3052 = _3050 + 1;
    float _3054 = fma(_3040, (*spvDescriptorSet0.vp_c9)._m0[131].x, _3044);
    float _3056 = _3028 * _3042;
    int _3058 = _2416 ^ _2262;
    float _3060 = _3030 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _3062 = _3052;
    if (!_3034)
    {
        int _3064 = ~_3032;
        int _3066 = _3064 + 1;
        _3062 = _3066;
    }
    int _3068 = _3062;
    float _3070 = fma(_2996, (*spvDescriptorSet0.vp_c9)._m0[132].x, _3054);
    float _3072 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _3074 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _3076 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _3078 = _3070 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _3080 = _3072 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3082 = _3074 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3084 = _3076 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3086 = fma(_2970, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3046);
    uint _3088 = uint(int(uint(_3058) >> uint(31)));
    float _3090 = fma(_2970, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3060);
    out.m_64.x = _3080;
    out.m_64.y = _3082;
    out.m_64.z = _3084;
    out.m_64.w = _3078;
    float _3092 = fma(_3056, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3086);
    int _3094 = ~int(_3088);
    int _3096 = _3094 + 1;
    float _3098 = _3030 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3100 = fma(_3056, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3090);
    float _3102 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _3104 = fma(_2238, (*spvDescriptorSet0.vp_c8)._m0[25].w, _3092);
    float _3106 = _2956 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _3108 = fma(_2970, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3098);
    float _3110 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _3112 = abs(_3012);
    float _3114 = -_3102;
    float _3116 = fma(_3106, 2.0, _3114);
    bool _3118 = _2262 == 0;
    float _3120 = fma(_3056, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3108);
    float _3122 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _3124 = _2870 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _3126 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _3128 = fma(_2868, (*spvDescriptorSet0.vp_c9)._m0[83].z, _3122);
    int _3130 = ~_2920;
    int _3132 = _2778 + _3130;
    int _3134 = _3132 + 1;
    float _3136 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _3138 = -_141;
    float _3140 = fma(_3138, (*spvDescriptorSet0.vp_c9)._m0[86].x, _3116);
    int _3142 = _3134 ^ _3096;
    float _3144 = fma(_2874, (*spvDescriptorSet0.vp_c9)._m0[83].w, _3136);
    float _3146 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _3148 = ~_3096;
    int _3150 = _3148 + _3142;
    int _3152 = _3150 + 1;
    float _3154 = _3104 + (*spvDescriptorSet0.vp_c10)._m0[21].y;
    float _3156 = float(_3068);
    float _3158 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _3160 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _3162 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _3164 = float(_3112);
    float _3166 = fma(_2984, -2.0, _3158);
    float _3168 = -_3160;
    float _3170 = fma(_2872, 2.0, _3168);
    float _3172 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _3174 = float(_2756);
    float _3176 = _3110 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _3178 = float(_2882);
    float _3180 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _3182 = float(_2838);
    float _3184 = _3126 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _3186 = -_141;
    float _3188 = fma(_3186, (*spvDescriptorSet0.vp_c9)._m0[81].x, _3170);
    float _3190 = fma(_3124, -2.0, _3172);
    float _3192 = fma(_3176, _3174, _2272);
    float _3194 = float(_2968);
    float _3196 = fma(_3184, _3182, _3188);
    float _3198 = _3162 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _3200 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _3202 = float(_2964);
    float _3204 = _2722 + 0.5;
    float _3206 = fma(_3198, _3178, _3140);
    float _3208 = _3146 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _3210 = _2798 + 0.5;
    float _3212 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2180);
    float _3214 = fma(_3184, _3204, _3196);
    float _3216 = fma(_3176, _3210, _3192);
    float _3218 = -_3212;
    float _3220 = fma(_3208, _3202, _3218);
    float _3222 = _3180 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _3224 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[81].y, _3190);
    bool _3226 = !_3118;
    int _3228 = _3226 ? _3152 : (-1);
    float _3230 = _1020 + 0.5;
    float _3232 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[86].y, _3166);
    float _3234 = -_3224;
    float _3236 = fma(_3222, _3194, _3234);
    float _3238 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _3240 = float(_3228);
    float _3242 = _3200 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _3244 = fma(_834, (*spvDescriptorSet0.vp_c9)._m0[78].z, _3238);
    float _3246 = fma(_3198, _3230, _3206);
    float _3248 = -_3232;
    float _3250 = fma(_3242, _3240, _3248);
    float _3252 = fma(_2238, (*spvDescriptorSet0.vp_c8)._m0[24].w, _3100);
    float _3254 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _3256 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[77].z, _3244);
    float _3258 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[82].z, _3128);
    float _3260 = fma(_2238, (*spvDescriptorSet0.vp_c8)._m0[26].w, _3120);
    float _3262 = fma(_836, (*spvDescriptorSet0.vp_c9)._m0[78].w, _3254);
    float _3264 = -_3256;
    float _3266 = _3264 + 1.0;
    float _3268 = _3252 + (*spvDescriptorSet0.vp_c10)._m0[21].x;
    float _3270 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3272 = _3154 + _3270;
    float _3274 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[77].w, _3262);
    float _3276 = -_3266;
    float _3278 = fma(_2798, _3276, _3216);
    float _3280 = _2656 + (-0.5);
    float _3282 = -_3258;
    float _3284 = _3282 + 1.0;
    float _3286 = _3260 + (*spvDescriptorSet0.vp_c10)._m0[21].z;
    float _3288 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3290 = _3268 + _3288;
    float _3292 = _3272 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3294 = -_3208;
    float _3296 = fma(_3294, _3280, _3220);
    float _3298 = -_3274;
    float _3300 = _3298 + 1.0;
    float _3302 = -_3284;
    float _3304 = fma(_2722, _3302, _3214);
    float _3306 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _3308 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _3310 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3312 = _3286 + _3310;
    float _3314 = fma(_3290, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3292);
    float _3316 = fma(_2656, _3300, _3296);
    float _3318 = _1192 + (-0.5);
    float _3320 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _3322 = log2(_3320);
    float _3324 = fma(_834, (*spvDescriptorSet0.vp_c9)._m0[88].z, _3306);
    float _3326 = fma(_836, (*spvDescriptorSet0.vp_c9)._m0[88].w, _3308);
    float _3328 = fma(_3312, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3314);
    float _3330 = -_3222;
    float _3332 = fma(_3330, _3318, _3236);
    float _3334 = _3272 * _3272;
    float _3336 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[87].z, _3324);
    float _3338 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[87].w, _3326);
    float _3340 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[82].w, _3144);
    float _3342 = _1024 + (-0.5);
    bool _3344 = _3328 >= 0.0;
    float _3346 = fma(_3290, _3290, _3334);
    float _3348 = -_3336;
    float _3350 = _3348 + 1.0;
    float _3352 = -_3340;
    float _3354 = _3352 + 1.0;
    float _3356 = -_3338;
    float _3358 = _3356 + 1.0;
    float _3360 = -_3242;
    float _3362 = fma(_3360, _3342, _3250);
    float _3364 = fma(_3312, _3312, _3346);
    float _3366 = -_3350;
    float _3368 = fma(_1020, _3366, _3246);
    float _3370 = fma(_1192, _3354, _3332);
    float _3372 = fma(_1024, _3358, _3362);
    float _3374 = in.m_66.x;
    float _3376 = in.m_66.y;
    float _3378 = in.m_66.z;
    float _3380 = _3322 * _141;
    bool _3382 = !_2978;
    int _3384 = _3382 ? 0 : 1;
    float _3386 = rsqrt(_3364);
    bool _3388 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3390 = isnan(1.0);
    bool _3392 = _3388 || _3390;
    bool _3394 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3396 = _3392 || _3394;
    float _3398 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _3400 = 1.0 + _3398;
    float _3402 = _3342;
    int _3404 = as_type<int>(_3336);
    float _3406 = _3268;
    if (_3344)
    {
        _3402 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3408 = _3402;
    out.m_68.x = _3278;
    out.m_68.y = _3316;
    out.m_68.z = _3304;
    out.m_68.w = _3370;
    float _3410 = _3164 * _3156;
    float _3412 = exp2(_3380);
    if (_3344)
    {
        float _3414 = _3408 * 5.0;
        _3404 = as_type<int>(_3414);
    }
    int _3416 = _3404;
    out.m_70.x = _3368;
    out.m_70.y = _3372;
    bool _3418 = !_2982;
    int _3420 = _3418 ? 0 : 1;
    bool _3422 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3424 = isnan(0.0);
    bool _3426 = _3422 || _3424;
    bool _3428 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3430 = _3426 || _3428;
    if (_3344)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9899 = as_type<float>(_3416);
        out.gl_Position.z = _9899;
    }
    float _3432 = 1.0 / _3400;
    float _3434 = _3272 * _3386;
    if (_3344)
    {
        out.m_51.x = 0.0;
    }
    float _3436 = _3290 * _3386;
    if (_3344)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3438 = -_3434;
    float _3440 = fma(_3438, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3154);
    float _3442 = _3312 * _3386;
    float _3444 = -_3436;
    float _3446 = fma(_3444, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3268);
    float _3448 = -_3412;
    float _3450 = _3448 + 1.0;
    float _3452 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3454 = _3440 + _3452;
    float _3456 = -_3442;
    float _3458 = fma(_3456, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3286);
    float _3460 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3462 = _3446 + _3460;
    int _3464 = _2536 ? 0 : 1;
    float _3466 = _3454 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3468 = _3430 ? _3450 : 0.0;
    float _3470 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3472 = _3458 + _3470;
    int _3474 = ~_3464;
    int _3476 = _3474 + 1;
    int _3478 = _3476 + 1;
    float _3480 = fma(_3462, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3466);
    float _3482 = _3410 * (-2.0);
    int _3484 = _3478;
    if (!_2524)
    {
        int _3486 = ~_3464;
        int _3488 = _3486 + 1;
        _3484 = _3488;
    }
    int _3490 = _3484;
    float _3492 = -_3434;
    float _3494 = fma(_3492, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3272);
    float _3496 = fma(_3472, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3480);
    int _3498 = abs(_3384);
    if (_3396)
    {
        float _3500 = _3468 * _3432;
        _145 = _3500;
    }
    float _3502 = _145;
    float _3504 = fma(_2690, _3482, _2690);
    float _3506 = fma(_3482, _3374, _3374);
    float _3508 = _834 + (-0.5);
    float _3510 = float(_3490);
    float _3512 = -_3436;
    float _3514 = fma(_3512, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3290);
    float _3516 = float(_3498);
    float _3518 = _3494 * _3494;
    bool _3520 = _3496 >= 0.0;
    float _3522 = fma(_3508, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3506);
    float _3524 = -_3442;
    float _3526 = fma(_3524, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3312);
    float _3528 = fma(_3514, _3514, _3518);
    float _3530 = _3516 * _3510;
    int _3532 = _2768 ? 0 : 1;
    float _3534 = fma(_3504, _3502, _3522);
    float _3536 = fma(_3526, _3526, _3528);
    float _3538 = _3530 * (-2.0);
    int _3540 = ~_3532;
    int _3542 = _3540 + 1;
    int _3544 = _3542 + 1;
    float _3546 = _3534 * 0.15915493667125701904296875;
    int _3548 = _3544;
    float _3550 = _3510;
    if (!_2758)
    {
        int _3552 = ~_3532;
        int _3554 = _3552 + 1;
        _3548 = _3554;
    }
    int _3556 = _3548;
    float _3558 = fma(_2592, _3538, _2592);
    if (_3520)
    {
        _3550 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3560 = _3550;
    float _3562 = fma(_3538, _3376, _3376);
    float _3564 = sqrt(_3536);
    int _3566 = as_type<int>(_3560);
    if (_3520)
    {
        out.m_51.x = 0.0;
    }
    if (_3520)
    {
        float _3568 = _3560 * 5.0;
        _3566 = as_type<int>(_3568);
    }
    int _3570 = _3566;
    float _3572 = _836 + (-0.5);
    int _3574 = abs(_3420);
    float _3576 = _3546 * 6.283185482025146484375;
    float _3578 = sin(_3576);
    if (_3520)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _10141 = as_type<float>(_3570);
        out.gl_Position.z = _10141;
    }
    if (_3520)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3580 = -_3154;
    float _3582 = _3580 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3584 = -_3268;
    float _3586 = _3584 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3588 = float(_3556);
    float _3590 = -_3286;
    float _3592 = _3590 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3594 = _3582 * _3582;
    float _3596 = float(_3574);
    float _3598 = fma(_3572, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3562);
    float _3600 = _834 + _838;
    float _3602 = fma(_3586, _3586, _3594);
    float _3604 = _3596 * _3588;
    float _3606 = fma(_3558, _3502, _3598);
    float _3608 = fma(_3592, _3592, _3602);
    float _3610 = _3600 + (-1.0);
    float _3612 = _3604 * (-2.0);
    float _3614 = _3606 * 0.15915493667125701904296875;
    float _3616 = _838 + (-0.5);
    float _3618 = fma(_3610, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3620 = rsqrt(_3608);
    float _3622 = fma(_3612, _3378, _3378);
    float _3624 = _567 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3626 = fma(_3618, _3612, _3618);
    float _3628 = _565 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _3630 = fma(_3616, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3622);
    float _3632 = _3546 * 6.283185482025146484375;
    float _3634 = cos(_3632);
    float _3636 = fma(_3626, _3502, _3630);
    float _3638 = _3636 * 0.15915493667125701904296875;
    float _3640 = _3586 * _3620;
    float _3642 = _3592 * _3620;
    float _3644 = _3582 * _3620;
    float _3646 = _3614 * 6.283185482025146484375;
    float _3648 = sin(_3646);
    float _3650 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _3652 = _3640 * _3650;
    float _3654 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3656 = _3642 * _3654;
    float _3658 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _3660 = -_3652;
    float _3662 = fma(_3642, _3658, _3660);
    float _3664 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _3666 = _3644 * _3664;
    float _3668 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _3670 = -_3656;
    float _3672 = fma(_3644, _3668, _3670);
    float _3674 = _3614 * 6.283185482025146484375;
    float _3676 = cos(_3674);
    float _3678 = _3662 * _3662;
    float _3680 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3682 = -_3666;
    float _3684 = fma(_3640, _3680, _3682);
    float _3686 = _3386 * _3564;
    float _3688 = fma(_3672, _3672, _3678);
    float _3690 = _3686 * _3628;
    float _3692 = _3638 * 6.283185482025146484375;
    float _3694 = cos(_3692);
    float _3696 = fma(_3684, _3684, _3688);
    float _3698 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _181);
    float _3700 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _177);
    float _3702 = _3578 * _3648;
    float _3704 = _3634 * _3648;
    float _3706 = _3686 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _3708 = _3706 * 0.5;
    float _3710 = _3700 * _3690;
    float _3712 = _3638 * 6.283185482025146484375;
    float _3714 = sin(_3712);
    float _3716 = _3634 * _3676;
    float _3718 = _3578 * _3676;
    float _3720 = _181 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3722 = rsqrt(_3696);
    float _3724 = _3634 * _3694;
    float _3726 = _3578 * _3694;
    float _3728 = _3648 * _3694;
    float _3730 = fma(_3714, _3716, _3702);
    float _3732 = _3686 * _3624;
    float _3734 = fma(_3714, _3702, _3716);
    float _3736 = _3676 * _3694;
    float _3738 = -_3704;
    float _3740 = fma(_3714, _3718, _3738);
    float _3742 = _3698 * _3732;
    float _3744 = -_3718;
    float _3746 = fma(_3714, _3704, _3744);
    float _3748 = _3672 * _3722;
    float _3750 = _3662 * _3722;
    float _3752 = _3724 * _3742;
    float _3754 = _3684 * _3722;
    float _3756 = -_3742;
    float _3758 = _3714 * _3756;
    float _3760 = _3642 * _3750;
    float _3762 = fma(_3730, _3710, _3752);
    float _3764 = _3644 * _3748;
    float _3766 = _3726 * _3742;
    float _3768 = fma(_3736, _3710, _3758);
    float _3770 = fma(_3746, _3708, _3762);
    float _3772 = -_3760;
    float _3774 = fma(_3644, _3754, _3772);
    float _3776 = -_3764;
    float _3778 = fma(_3640, _3750, _3776);
    float _3780 = fma(_3740, _3710, _3766);
    float _3782 = fma(_3728, _3708, _3768);
    float _3784 = _3774 * _3770;
    float _3786 = _3778 * _3770;
    float _3788 = fma(_3734, _3708, _3780);
    float _3790 = _3730 * _3774;
    float _3792 = fma(_3748, _3782, _3784);
    float _3794 = fma(_3754, _3782, _3786);
    float _3796 = _3730 * _3778;
    float _3798 = _3724 * _3774;
    float _3800 = fma(_3640, _3788, _3792);
    float _3802 = fma(_3642, _3788, _3794);
    float _3804 = _3640 * _3754;
    float _3806 = _3724 * _3778;
    float _3808 = _3268 + _3800;
    float _3810 = _3286 + _3802;
    float _3812 = -_3804;
    float _3814 = fma(_3642, _3748, _3812);
    float _3816 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3818 = _3808 + _3816;
    float _3820 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3822 = _3810 + _3820;
    float _3824 = _3730 * _3814;
    float _3826 = _3724 * _3814;
    float _3828 = _3818 * _3818;
    float _3830 = _3822 * _3822;
    float _3832 = _3746 * _3814;
    float _3834 = _3814 * _3770;
    float _3836 = fma(_3736, _3748, _3790);
    float _3838 = _3828 + _3830;
    float _3840 = _3746 * _3774;
    float _3842 = fma(_3720, _3720, 1.0);
    float _3844 = _3746 * _3778;
    float _3846 = sqrt(_3838);
    float _3848 = fma(_3736, _3750, _3824);
    float _3850 = fma(_3736, _3754, _3796);
    float _3852 = fma(_3750, _3782, _3834);
    float _3854 = -_3714;
    float _3856 = fma(_3854, _3748, _3798);
    float _3858 = -_3714;
    float _3860 = fma(_3858, _3750, _3826);
    float _3862 = -_3714;
    float _3864 = fma(_3862, _3754, _3806);
    float _3866 = fma(_3644, _3788, _3852);
    float _3868 = rsqrt(_3842);
    float _3870 = fma(_3728, _3748, _3840);
    float _3872 = fma(_3728, _3750, _3832);
    float _3874 = _3154 + _3866;
    float _3876 = fma(_3728, _3754, _3844);
    bool _3878 = _3846 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3880 = _3840;
    float _3882 = _3828;
    float _3884 = _3830;
    float _3886 = _3808;
    float _3888 = _3810;
    if (!_3878)
    {
        _3880 = _3874;
    }
    float _3890 = _3880;
    bool _3892 = !_3878;
    float _3894 = _3890;
    if (!_3892)
    {
        float _3896 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3898 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3900 = _3846 + _3898;
        float _3902 = rsqrt(_3838);
        float _3904 = _3900 * _3896;
        float _3906 = _3874 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3908 = _3904 * 0.15915493667125701904296875;
        float _3910 = _3908 * 6.283185482025146484375;
        float _3912 = sin(_3910);
        float _3914 = _3908 * 6.283185482025146484375;
        float _3916 = cos(_3914);
        float _3918 = fma(_3912, _3906, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3920 = _3902 * _3918;
        float _3922 = _3916 + (-1.0);
        float _3924 = fma(_3818, _3920, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3926 = fma(_3822, _3920, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _3928 = _3922 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3930 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _3932 = _3924 + _3930;
        float _3934 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _3936 = _3926 + _3934;
        float _3938 = fma(_3874, _3916, _3928);
        float _3940 = _3932 * _3932;
        float _3942 = _3936 * _3936;
        _3894 = _3938;
        _3882 = _3940;
        _3884 = _3942;
        _3886 = _3924;
        _3888 = _3926;
    }
    float _3944 = _3894;
    float _3946 = _3882;
    float _3948 = _3884;
    float _3950 = _3886;
    float _3952 = _3888;
    float _3954 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _3956 = _3944 + _3954;
    float _3958 = fma(_3726, _3640, _3856);
    float _3960 = fma(_3726, _3644, _3860);
    float _3962 = fma(_3726, _3642, _3864);
    float _3964 = fma(_3956, _3956, _3946);
    float _3966 = fma(_3734, _3640, _3870);
    float _3968 = fma(_3734, _3644, _3872);
    float _3970 = fma(_3734, _3642, _3876);
    float _3972 = _3964 + _3948;
    float _3974 = _3720 * _3868;
    float _3976 = fma(_3740, _3640, _3836);
    float _3978 = _177 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3980 = _3720 * _3958;
    float _3982 = _3720 * _3960;
    float _3984 = fma(_3740, _3644, _3848);
    float _3986 = fma(_3740, _3642, _3850);
    float _3988 = _3720 * _3962;
    float _3990 = -_3966;
    float _3992 = _3974 * _3990;
    float _3994 = -_3968;
    float _3996 = _3974 * _3994;
    float _3998 = -_3970;
    float _4000 = _3974 * _3998;
    float _4002 = sqrt(_3972);
    float _4004 = fma(_3978, _3976, _3980);
    float _4006 = fma(_3978, _3984, _3982);
    float _4008 = fma(_3978, _3986, _3988);
    float _4010 = fma(_3868, _3958, _3992);
    float _4012 = fma(_3868, _3960, _3996);
    float _4014 = fma(_3868, _3962, _4000);
    float _4016 = _3966 + _4004;
    float _4018 = _3968 + _4006;
    float _4020 = _3970 + _4008;
    out.m_72.x = _3976;
    out.m_72.y = _3984;
    out.m_72.z = _3986;
    out.m_74.x = _4010;
    out.m_74.y = _4012;
    out.m_74.z = _4014;
    bool _4022 = _4002 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _4024 = isnan(_4002);
    bool _4026 = _4022 || _4024;
    bool _4028 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _4030 = _4026 || _4028;
    out.m_76.x = _4016;
    out.m_76.y = _4018;
    out.m_76.z = _4020;
    float _4032 = _4006;
    float _4034 = _3982;
    float _4036 = _4008;
    if (!_4030)
    {
        _4032 = 1.0;
    }
    float _4038 = _4032;
    bool _4040 = !_4030;
    float _4042 = _4038;
    if (!_4040)
    {
        bool _4044 = _4002 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _4046 = isnan(_4002);
        bool _4048 = _4044 || _4046;
        bool _4050 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _4052 = _4048 || _4050;
        if (!_4052)
        {
            float _4054 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4056 = _4002 + _4054;
            float _4058 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4060 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _4058;
            float _4062 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _4064 = _4062 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _4066 = 1.0 / _4060;
            float _4068 = _4056 * _4066;
            float _4070 = fma(_4068, _4064, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _4042 = _4070;
            _4072 = true;
        }
        else
        {
            bool _4074 = _4002 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _4076 = isnan(_4002);
            bool _4078 = _4074 || _4076;
            bool _4080 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _4082 = _4078 || _4080;
            if (!_4082)
            {
                float _4084 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4086 = _4002 + _4084;
                float _4088 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4090 = _4088 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _4092 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _4094 = _4092 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _4096 = 1.0 / _4090;
                float _4098 = _4086 * _4096;
                float _4100 = fma(_4098, _4094, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _4042 = _4100;
                _4072 = true;
            }
            else
            {
                _4042 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _4072 = false;
    float _4102 = _4042;
    float _4104 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _4106 = _3950 + _4104;
    float _4108 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _4110 = _3952 + _4108;
    bool _4112 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _4114 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _4116 = _4112 || _4114;
    bool _4118 = isnan(0.5);
    bool _4120 = _4116 || _4118;
    float _4122 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _4124 = _3944 + _4122;
    float _4126 = fma(_4106, _4102, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _4128 = fma(_4110, _4102, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _4130 = fma(_4124, _4102, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _4132 = -_3436;
    float _4134 = fma(_4132, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4126);
    float _4136 = -_3442;
    float _4138 = fma(_4136, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4128);
    float _4140 = -_3434;
    float _4142 = fma(_4140, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4130);
    float _4144 = _4142;
    float _4146 = _4134;
    float _4148 = _4138;
    if (!_4120)
    {
        float _4150 = _3454 * _3454;
        float _4152 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _4154 = -_3286;
        float _4156 = _4154 + _4128;
        float _4158 = -_3268;
        float _4160 = _4158 + _4126;
        float _4162 = fma(_3462, _3462, _4150);
        float _4164 = -_3154;
        float _4166 = _4164 + _4130;
        float _4168 = fma(_3472, _3472, _4162);
        float _4170 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _4172 = sqrt(_4168);
        float _4174 = 1.0 / _3686;
        float _4176 = _4170 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _4178 = precise::min(_4172, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _4180 = _4178 * _4152;
        float _4182 = _4180 * _4174;
        float _4184 = _4176 * _4182;
        float _4186 = _4156 * _4182;
        float _4188 = fma(_4160, _4184, _3446);
        float _4190 = fma(_4166, _4184, _3440);
        float _4192 = fma(_4176, _4186, _3458);
        _4144 = _4190;
        _4146 = _4188;
        _4148 = _4192;
    }
    float _4194 = _4144;
    float _4196 = _4146;
    float _4198 = _4148;
    float _4200 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4202 = _4194 + _4200;
    float _4204 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4206 = _4196 + _4204;
    float _4208 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4210 = _4198 + _4208;
    float _4212 = _4202 * _4202;
    float _4214 = fma(_4206, _4206, _4212);
    float _4216 = fma(_4210, _4210, _4214);
    float _4218 = rsqrt(_4216);
    float _4220 = sqrt(_4216);
    float _4222 = _4218 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4224 = _4206 * _4222;
    float _4226 = _4210 * _4222;
    float _4228 = _4224 * _4224;
    float _4230 = _4226 * _4226;
    float _4232 = _4228 + _4230;
    float _4234 = sqrt(_4232);
    bool _4236 = _4234 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4238 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4240 = _4234 + _4238;
    float _4242 = _4218;
    float _4244 = _4240;
    float _4246 = _4202;
    if (_4236)
    {
        float _4248 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4242 = _4248;
    }
    float _4250 = _4242;
    if (_4236)
    {
        float _4252 = rsqrt(_4232);
        _4034 = _4252;
    }
    float _4254 = _4034;
    float _4256 = _4254;
    if (_4236)
    {
        float _4258 = _4240 * _4250;
        _4244 = _4258;
    }
    float _4260 = _4244;
    if (_4236)
    {
        float _4262 = _4260 * 0.15915493667125701904296875;
        _3406 = _4262;
    }
    float _4264 = _3406;
    float _4266 = _4250;
    if (_4236)
    {
        float _4268 = _4264 * 6.283185482025146484375;
        float _4270 = sin(_4268);
        _4266 = _4270;
    }
    float _4272 = _4266;
    float _4274 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4276 = precise::max(0.0, _4274);
    float _4278 = _4210;
    float _4280 = _4276;
    if (_4236)
    {
        float _4282 = _4264 * 6.283185482025146484375;
        float _4284 = cos(_4282);
        _4278 = _4284;
    }
    float _4286 = _4278;
    float _4288 = -_4222;
    float _4290 = -_4276;
    float _4292 = fma(_4202, _4288, _4290);
    float _4294 = _4292;
    if (_4236)
    {
        float _4296 = _4292 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4280 = _4296;
    }
    float _4298 = _4280;
    float _4300 = _4272;
    float _4302 = _4298;
    if (_4236)
    {
        float _4304 = fma(_4272, _4298, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4300 = _4304;
    }
    float _4306 = _4300;
    float _4308 = _4306;
    if (!_4236)
    {
        _4302 = _4228;
    }
    float _4310 = _4302;
    float _4312 = _4310;
    float _4314 = _4286;
    if (_4236)
    {
        float _4316 = _4286 + (-1.0);
        _4246 = _4316;
    }
    float _4318 = _4246;
    float _4320 = _4318;
    if (_4236)
    {
        float _4322 = _4254 * _4306;
        _4036 = _4322;
    }
    float _4324 = _4036;
    if (!_4236)
    {
        _4256 = _4224;
    }
    float _4326 = _4256;
    float _4328 = _4326;
    if (_4236)
    {
        float _4330 = _4318 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4320 = _4330;
    }
    float _4332 = _4320;
    if (_4236)
    {
        float _4334 = _4224 * _4324;
        _4328 = _4334;
    }
    float _4336 = _4328;
    if (!_4236)
    {
        _4308 = _4226;
    }
    float _4338 = _4308;
    float _4340 = _4338;
    if (_4236)
    {
        float _4342 = _4226 * _4324;
        _4340 = _4342;
    }
    float _4344 = _4340;
    if (_4236)
    {
        float _4346 = fma(_4292, _4286, _4332);
        _4294 = _4346;
    }
    float _4348 = _4294;
    if (_4236)
    {
        float _4350 = _4336 * _4336;
        _4312 = _4350;
    }
    float _4352 = _4312;
    if (!_4236)
    {
        _4314 = _4230;
    }
    float _4354 = _4314;
    float _4356 = _4354;
    if (_4236)
    {
        float _4358 = _4344 * _4344;
        _4356 = _4358;
    }
    float _4360 = _4356;
    float _4362 = fma(_4348, _4348, _4352);
    float _4364 = _4194 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4366 = _4194 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4368 = _4362 + _4360;
    float _4370 = fma(_4196, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4364);
    float _4372 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4374 = fma(_4220, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4372);
    float _4376 = precise::clamp(_4374, 0.0, 1.0);
    float _4378 = rsqrt(_4368);
    float _4380 = fma(_4198, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4370);
    float _4382 = -_4376;
    float _4384 = _4382 + 1.0;
    float _4386 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4388 = _4380 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4390 = fma(_3446, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _4392 = fma(_4196, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4366);
    float _4394 = abs(_4384);
    float _4396 = log2(_4394);
    float _4398 = _4388 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4400 = _4194 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4402 = fma(_3458, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4404 = -_4398;
    float _4406 = fma(_4404, _4386, 1.0);
    float _4408 = _4194 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4410 = fma(_4196, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4400);
    float _4412 = _4378 * _4336;
    float _4414 = _4378 * _4348;
    float _4416 = fma(_4196, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4408);
    float _4418 = fma(_4198, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4410);
    float _4420 = _4378 * _4344;
    float _4422 = _4412 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4424 = fma(_4198, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4416);
    float _4426 = _4418 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4428 = floor(_4390);
    float _4430 = -_4422;
    float _4432 = fma(_4414, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4430);
    float _4434 = _4424 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4436 = _4426 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4438 = _4396 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4440 = -_4420;
    float _4442 = fma(_4440, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4432);
    float _4444 = fma(_4198, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4392);
    float _4446 = fma(_4434, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4436);
    float _4448 = floor(_4402);
    float _4450 = fma(_4442, -0.5, 0.5);
    float _4452 = _4444 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4454 = fma(_4388, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4446);
    float _4456 = _4426 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4458 = fma(_4442, 0.5, 0.5);
    float _4460 = fma(_4452, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4454);
    float _4462 = exp2(_4438);
    float _4464 = -_4428;
    float _4466 = _4390 + _4464;
    float _4468 = fma(_4434, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4456);
    float _4470 = _4414 + 1.0;
    float _4472 = fma(_4388, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4468);
    float _4474 = log2(_4406);
    float _4476 = _4426 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4478 = -_4448;
    float _4480 = _4402 + _4478;
    float _4482 = fma(_4458, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4484 = fma(_4452, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4472);
    float _4486 = fma(_4434, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4476);
    float _4488 = fma(_4458, _4482, -0.212114393711090087890625);
    float _4490 = 1.0 / _4460;
    float _4492 = fma(_4388, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4486);
    float _4494 = -_4414;
    float _4496 = fma(_4462, _4470, _4494);
    float _4498 = sqrt(_4450);
    float _4500 = fma(_4452, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4492);
    float _4502 = _4474 * 0.693147182464599609375;
    float2 _11649 = float2(_4466, _4480);
    float _4504 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_11649, float2(0.0), isnan(_11649)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_11649, float2(0.0), isnan(_11649)), level(0.0)).x;
    float _4506 = fma(_4458, _4488, 1.570728778839111328125);
    float _4508 = fma(_4496, 0.5, 0.5);
    float _4510 = _4502 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4512 = _4484 * _4490;
    float _4514 = _4500 * _4490;
    float _4516 = fma(_4512, 0.5, 0.5);
    float _4518 = fma(_4514, -0.5, 0.5);
    float _4520 = _4498 * 0.636619746685028076171875;
    float3 _11683 = float3(_4516, _4518, _4510);
    float _4522 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_11683, float3(0.0), isnan(_11683)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_11683, float3(0.0), isnan(_11683)), level(0.0)).x;
    float3 _11694 = float3(_4516, _4518, _4510);
    float4 _4525 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_11694, float3(0.0), isnan(_11694)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_11694, float3(0.0), isnan(_11694)), level(0.0)).xyzw;
    float _4527 = _4525.x;
    float _4529 = _4525.y;
    float _4531 = _4525.z;
    float _4533 = _4525.w;
    float _4535 = -_4506;
    float _4537 = fma(_4520, _4535, 1.0);
    float2 _11715 = float2(_4537, _4508);
    float3 _4541 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_11715, float2(0.0), isnan(_11715)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_11715, float2(0.0), isnan(_11715)), level(0.0)).xyz;
    float _4543 = _4541.x;
    float _4545 = _4541.y;
    float _4547 = _4541.z;
    float _4549 = _3440 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4551 = _3440 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _4553 = _4426 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _4555 = _4220 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4557 = isnan(_4220);
    bool _4559 = _4555 || _4557;
    bool _4561 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4563 = _4559 || _4561;
    float _4565 = fma(_3446, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4549);
    float _4567 = fma(_3446, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4551);
    float _4569 = fma(_4434, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4553);
    float _4571 = fma(_3458, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4565);
    float _4573 = fma(_3458, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4567);
    float _4575 = _4396 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4577 = _4571 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4579 = _4573 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4581 = fma(_4388, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4569);
    float _4583 = 1.0 / _4577;
    float _4585 = _4579 + _4577;
    float _4587 = fma(_4452, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4581);
    float _4589 = _4587 + _4460;
    float _4591 = exp2(_4575);
    out.gl_Position.x = _4484;
    out.gl_Position.y = _4500;
    out.gl_Position.z = _4587;
    out.gl_Position.w = _4460;
    float _4593 = _4589 * 0.5;
    float _4595 = _4585 * _4583;
    float _4597 = _4595 * 0.5;
    float _4599 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _4601 = fma(_4597, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4599);
    float _4603 = _4587;
    float _4605 = _4500;
    float _4607 = _4484;
    float _4609 = _4460;
    if (!_4563)
    {
        _4603 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4611 = _4603;
    float _4613 = -_4591;
    float _4615 = _4613 + 1.0;
    float _4617 = _4611;
    float _4619 = _4611;
    if (!_4563)
    {
        _4605 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _4621 = _4605;
    float _4623 = 1.0 / _4601;
    float _4625 = _4621;
    float _4627 = _4621;
    if (!_4563)
    {
        _4607 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4629 = _4607;
    float _4631 = _4615 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _4633 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4635 = _4623 * _4633;
    float _4637 = abs(_4635);
    float _4639 = log2(_4637);
    bool _4641 = _4635 <= 8000.0;
    bool _4643 = isnan(_4635);
    bool _4645 = _4641 || _4643;
    bool _4647 = isnan(8000.0);
    bool _4649 = _4645 || _4647;
    float _4651 = float(_4649);
    float _4653 = _4639 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _4655 = exp2(_4653);
    float _4657 = fma(_4655, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4659 = precise::clamp(_4657, 0.0, 1.0);
    float _4661 = fma(_4659, -2.0, 3.0);
    float _4663 = _4659 * _4659;
    float _4665 = in.m_78.x;
    float _4667 = _4663 * _4661;
    float _4669 = -_4667;
    float _4671 = _4669 + 1.0;
    float _4673 = fma(_4671, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4667);
    float _4675 = _4629;
    float _4677 = _4629;
    if (!_4563)
    {
        _4609 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4679 = _4609;
    float _4681 = _4651 * _4673;
    out.m_80.z = _4593;
    out.m_80.w = _4460;
    float _4683 = _4681 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _4685 = -_4504;
    float _4687 = _4685 + 1.0;
    float _4689 = _4687 * _4683;
    float _4691 = precise::clamp(_4689, 0.0, 1.0);
    float _4693 = -_4691;
    float _4695 = fma(_4693, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4697 = _4695 * _4665;
    float _4699 = _4631 * _4522;
    float _4701 = -_4631;
    float _4703 = _4701 + 1.0;
    float _4705 = _4697 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _4707 = _4533 * _4699;
    float _4709 = _4533 * _4703;
    out.m_82.x = _4705;
    float _4711 = _4547 * _4699;
    float _4713 = fma(_4543, _4707, _4527);
    float _4715 = fma(_4545, _4707, _4529);
    float _4717 = _4707;
    float _4719 = _4527;
    float _4721 = _4679;
    float _4723 = _4679;
    if (!_4563)
    {
        _4717 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4725 = _4717;
    float _4727 = fma(_4533, _4711, _4531);
    float _4729 = _4725;
    float _4731 = _4725;
    if (!_4563)
    {
        _4719 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4733 = _4719;
    out.m_84.x = _4713;
    out.m_84.y = _4715;
    out.m_84.z = _4727;
    out.m_84.w = _4709;
    bool _4735 = !_4563;
    float _4737 = _4733;
    float _4739 = _4733;
    if (!_4735)
    {
        bool _4741 = _4220 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4743 = isnan(_4220);
        bool _4745 = _4741 || _4743;
        bool _4747 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4749 = _4745 || _4747;
        if (!_4749)
        {
            float _4751 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4753 = _4220 + _4751;
            float _4755 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4757 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4755;
            float _4759 = 1.0 / _4757;
            float _4761 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4763 = _4761 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4765 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4767 = _4765 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4769 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _4771 = _4769 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4773 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4775 = _4773 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4777 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4779 = _4777 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4781 = _4753 * _4759;
            float _4783 = precise::clamp(_4781, 0.0, 1.0);
            float _4785 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4787 = _4785 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4789 = fma(_4783, _4763, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4791 = fma(_4783, _4787, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4793 = fma(_4783, _4767, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4795 = fma(_4783, _4771, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4797 = fma(_4783, _4775, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4799 = fma(_4783, _4779, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _4739 = _4791;
            _4627 = _4797;
            _4731 = _4789;
            _4619 = _4795;
            _4723 = _4793;
            _4677 = _4799;
            _4801 = true;
        }
        else
        {
            bool _4803 = _4220 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4805 = isnan(_4220);
            bool _4807 = _4803 || _4805;
            bool _4809 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4811 = _4807 || _4809;
            if (!_4811)
            {
                _4729 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4813 = _4729;
            _4731 = _4813;
            if (!_4811)
            {
                _4737 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4815 = _4737;
            _4739 = _4815;
            if (!_4811)
            {
                _4721 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4817 = _4721;
            _4723 = _4817;
            if (!_4811)
            {
                _4617 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4819 = _4617;
            _4619 = _4819;
            if (!_4811)
            {
                _4625 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4821 = _4625;
            _4627 = _4821;
            if (!_4811)
            {
                _4675 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4823 = _4675;
            bool _4825 = !_4811;
            _4677 = _4823;
            if (!_4825)
            {
                bool _4827 = _4220 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4829 = isnan(_4220);
                bool _4831 = _4827 || _4829;
                bool _4833 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4835 = _4831 || _4833;
                if (!_4835)
                {
                    float _4837 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4839 = _4220 + _4837;
                    float _4841 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4843 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4841;
                    float _4845 = 1.0 / _4843;
                    float _4847 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4849 = _4847 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4851 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4853 = _4851 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4855 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4857 = _4855 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4859 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4861 = _4859 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4863 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4865 = _4863 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4867 = _4839 * _4845;
                    float _4869 = precise::clamp(_4867, 0.0, 1.0);
                    float _4871 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4873 = _4871 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4875 = fma(_4869, _4849, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4877 = fma(_4869, _4873, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4879 = fma(_4869, _4853, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4881 = fma(_4869, _4857, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4883 = fma(_4869, _4861, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4885 = fma(_4869, _4865, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _4739 = _4877;
                    _4627 = _4883;
                    _4731 = _4875;
                    _4619 = _4881;
                    _4723 = _4879;
                    _4677 = _4885;
                    _4801 = true;
                }
                else
                {
                    _4739 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4627 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _4731 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4619 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4723 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4677 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4801 = false;
    float _4887 = _4739;
    float _4889 = _4627;
    float _4891 = _4731;
    float _4893 = _4619;
    float _4895 = _4723;
    float _4897 = _4677;
    float _4899 = fma(_4018, -0.5, 0.5);
    float _4901 = precise::clamp(_4899, 0.0, 1.0);
    float _4903 = -_4887;
    float _4905 = _4903 + _4889;
    float _4907 = -_4891;
    float _4909 = _4907 + _4893;
    float _4911 = -_4895;
    float _4913 = _4911 + _4897;
    bool _4915 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4917 = fma(_4901, _4905, _4887);
    float _4919 = fma(_4901, _4909, _4891);
    float _4921 = fma(_4901, _4913, _4895);
    float _4923 = _4917 * 0.586610972881317138671875;
    out.m_86.x = 0.0;
    float _4925 = fma(_4919, 0.298911988735198974609375, _4923);
    float _4927 = fma(_4921, 0.114477999508380889892578125, _4925);
    float _4929 = -_4927;
    float _4931 = _4919 + _4929;
    float _4933 = -_4927;
    float _4935 = _4917 + _4933;
    float _4937 = -_4927;
    float _4939 = _4921 + _4937;
    float _4941 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4943 = fma(_4931, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4927);
    float _4945 = fma(_4935, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4927);
    float _4947 = fma(_4939, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4927);
    out.m_51.x = _4941;
    out.m_88.x = _4943;
    out.m_88.y = _4945;
    out.m_88.z = _4947;
    if (!_4915)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _4949 = -_4194;
    float _4951 = _4949 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _4953 = -_4196;
    float _4955 = _4953 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _4957 = -_4198;
    float _4959 = _4957 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _4961 = _4951 * _4951;
    float _4963 = fma(_4955, _4955, _4961);
    float _4965 = fma(_4959, _4959, _4963);
    float _4967 = sqrt(_4965);
    float _4969 = rsqrt(_4965);
    float _4971 = -_4967;
    float _4973 = _4971 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4975 = _4973 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _4977 = precise::clamp(_4975, 0.0, 1.0);
    float _4979 = _4955 * _4969;
    float _4981 = _4951 * _4969;
    float _4983 = abs(_4977);
    float _4985 = log2(_4983);
    float _4987 = _4959 * _4969;
    float _4989 = _4979 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _4991 = _4018 * _4981;
    float _4993 = -_4981;
    float _4995 = -_4989;
    float _4997 = fma(_4993, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4995);
    float _4999 = fma(_4016, _4979, _4991);
    float _5001 = -_4987;
    float _5003 = fma(_5001, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4997);
    float _5005 = fma(_4020, _4987, _4999);
    float _5007 = precise::clamp(_5005, 0.0, 1.0);
    float _5009 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _5011 = _5003 + _5009;
    float _5013 = _4985 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _5015 = _5011 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _5017 = precise::clamp(_5015, 0.0, 1.0);
    float _5019 = exp2(_5013);
    float _5021 = _5019 * _5017;
    float _5023 = _5007 * _5021;
    float _5025 = _5023 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _5027 = _5023 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _5029 = _5023 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_86.x = _5025;
    out.m_86.y = _5027;
    out.m_86.z = _5029;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4801 = false;
    bool _4072 = false;
    bool _701 = false;
    bool _597 = false;
    bool _203 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _102 = in.m_48.w;
    float _104 = trunc(_102);
    int _107 = int(_104);
    bool _111 = _107 >= 1;
    float _113 = 0.0;
    if (!_111)
    {
        _113 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _115 = _113;
    float _117 = _115;
    if (!_111)
    {
        out.m_51.x = 0.0;
    }
    int _119 = 0;
    if (!_111)
    {
        float _121 = _115 * 5.0;
        _119 = as_type<int>(_121);
    }
    int _123 = _119;
    int _125 = _123;
    if (!_111)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5086 = as_type<float>(_123);
        out.gl_Position.z = _5086;
    }
    if (!_111)
    {
        return out;
    }
    float _127 = in.m_53.w;
    bool _129 = _127 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _131 = isnan(_127);
    bool _133 = _129 || _131;
    bool _135 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _137 = _133 || _135;
    float _139 = -_127;
    float _141 = _139 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _143 = 0.0;
    float _145 = _141;
    if (_137)
    {
        float _147 = float(_107);
        _143 = _147;
    }
    float _149 = _143;
    bool _151 = _141 >= _149;
    bool _153 = !_137;
    bool _155 = _151 || _153;
    if (_155)
    {
        _117 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _157 = _117;
    if (_155)
    {
        out.m_51.x = 0.0;
    }
    if (_155)
    {
        float _159 = _157 * 5.0;
        _125 = as_type<int>(_159);
    }
    int _161 = _125;
    if (_155)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5155 = as_type<float>(_161);
        out.gl_Position.z = _5155;
    }
    if (_155)
    {
        return out;
    }
    float _163 = as_type<float>(int(gl_VertexIndex));
    bool _165 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _167 = as_type<int>(_163) & 1;
    bool _169 = _167 != 0;
    int _171 = as_type<int>(_163) & 2;
    bool _173 = _171 != 0;
    bool _175 = !_169;
    float _177 = _175 ? (-0.5) : 0.5;
    bool _179 = !_173;
    float _181 = _179 ? (-0.5) : 0.5;
    bool _183 = !_165;
    float _201;
    if (!_183)
    {
        float _185 = in.m_58.x;
        float _187 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _189 = _185 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _191 = fma(_189, (*spvDescriptorSet0.vp_c9)._m0[12].x, _141);
        float _193 = _191 * _187;
        float _195 = floor(_193);
        float _197 = -_195;
        float _199 = _193 + _197;
        _201 = _199;
        _203 = true;
    }
    else
    {
        float _205 = float(_107);
        float _207 = 1.0 / _205;
        float _209 = _141 * _207;
        _201 = _209;
    }
    _203 = false;
    float _211 = _201;
    float _213 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _215 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _213;
    float _217 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _219 = _217 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _221 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _223 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _221;
    float _225 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _227 = _225 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _229 = 1.0 / _215;
    float _231 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _233 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _231;
    float _235 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _237 = _235 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _239 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _241 = isnan(_211);
    bool _243 = _239 || _241;
    bool _245 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _247 = _243 || _245;
    float _249 = float(_247);
    float _251 = 1.0 / _219;
    float _253 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _255 = _211 + _253;
    float _257 = -_249;
    float _259 = _257 + 1.0;
    float _261 = 1.0 / _223;
    float _263 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _265 = _211 + _263;
    float _267 = _255 * _229;
    bool _269 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[150].w;
    bool _271 = isnan(_211);
    bool _273 = _269 || _271;
    bool _275 = isnan((*spvDescriptorSet0.vp_c9)._m0[150].w);
    bool _277 = _273 || _275;
    float _279 = float(_277);
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _283 = _211 + _281;
    bool _285 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _287 = 1.0 / _227;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _291 = (*spvDescriptorSet0.vp_c9)._m0[150].w + _289;
    float _293 = _265 * _251;
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _297 = _211 + _295;
    float _299 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _301 = _211 + _299;
    bool _303 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _305 = isnan(_211);
    bool _307 = _303 || _305;
    bool _309 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _311 = _307 || _309;
    float _313 = float(_311);
    float _315 = 1.0 / _233;
    float _317 = _297 * _261;
    float _319 = -_279;
    float _321 = _319 + 1.0;
    float _323 = -_313;
    float _325 = _323 + 1.0;
    float _327 = _313 * _321;
    bool _329 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _331 = isnan(_211);
    bool _333 = _329 || _331;
    bool _335 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _337 = _333 || _335;
    float _339 = float(_337);
    float _341 = 1.0 / _291;
    float _343 = _301 * _287;
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _347 = _211 + _345;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _351 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _349;
    float _353 = -_339;
    float _355 = _353 + 1.0;
    float _357 = fma(_351, _267, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _359 = 1.0 / _237;
    float _361 = _283 * _315;
    bool _363 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _365 = isnan(_211);
    bool _367 = _363 || _365;
    bool _369 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _371 = _367 || _369;
    float _373 = float(_371);
    float _375 = _347 * _341;
    float _377 = _373 * _325;
    float _379 = -_373;
    float _381 = _379 + 1.0;
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _385 = _211 + _383;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _389 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _387;
    float _391 = _339 * _381;
    float _393 = _249 * _355;
    float _395 = _385 * _359;
    bool _397 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _399 = isnan(_211);
    bool _401 = _397 || _399;
    bool _403 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _405 = _401 || _403;
    float _407 = float(_405);
    float _409 = fma(_389, _267, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _411 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _413 = isnan(_211);
    bool _415 = _411 || _413;
    bool _417 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _419 = _415 || _417;
    float _421 = float(_419);
    bool _423 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _425 = isnan(_211);
    bool _427 = _423 || _425;
    bool _429 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _431 = _427 || _429;
    float _433 = float(_431);
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _437 = _435 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _439 = -_407;
    float _441 = _439 + 1.0;
    float _443 = _421 * _259;
    float _445 = -_421;
    float _447 = _445 + 1.0;
    float _449 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _451 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _449;
    float _453 = _433 * _441;
    float _455 = fma(_437, _293, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _457 = _407 * _447;
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _461 = _459 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _465 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _463;
    float _467 = _409 * _453;
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _471 = _469 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _473 = -_433;
    float _475 = _473 + 1.0;
    float _477 = fma(_461, _293, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _479 = fma(_465, _317, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _481 = fma(_451, _317, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _483 = _357 * _453;
    float _485 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _487 = _485 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _489 = fma(_471, _343, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _491 = fma(_475, (*spvDescriptorSet0.vp_c9)._m0[143].x, _467);
    float _493 = fma(_475, (*spvDescriptorSet0.vp_c9)._m0[143].y, _483);
    float _495 = fma(_487, _343, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _497 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _499 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _497;
    float _501 = fma(_455, _457, _491);
    float _503 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _505 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _503;
    float _507 = fma(_477, _457, _493);
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _511 = _509 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _513 = fma(_479, _443, _501);
    float _515 = fma(_499, _361, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _517 = fma(_505, _361, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _521 = _519 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _523 = fma(_481, _443, _507);
    float _525 = in.m_60.x;
    float _527 = in.m_60.y;
    float _529 = fma(_511, _395, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _531 = fma(_521, _395, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _533 = fma(_489, _393, _513);
    float _535 = fma(_495, _393, _523);
    float _537 = -(*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _539 = (*spvDescriptorSet0.vp_c9)._m0[150].x + _537;
    float _541 = -(*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _543 = (*spvDescriptorSet0.vp_c9)._m0[150].y + _541;
    float _545 = fma(_515, _391, _533);
    float _547 = fma(_517, _391, _535);
    float _549 = fma(_539, _375, (*spvDescriptorSet0.vp_c9)._m0[149].x);
    float _551 = fma(_543, _375, (*spvDescriptorSet0.vp_c9)._m0[149].y);
    float _553 = fma(_529, _377, _545);
    float _555 = fma(_531, _377, _547);
    float _557 = fma(_549, _327, _553);
    float _559 = fma(_551, _327, _555);
    float _561 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[150].x, _557);
    float _563 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[150].y, _559);
    float _565 = _561 * _525;
    float _567 = _563 * _527;
    bool _569 = !_285;
    float _571 = _547;
    int _573 = as_type<int>(_507);
    int _575 = as_type<int>(_457);
    float _577 = _545;
    float _595;
    if (!_569)
    {
        float _579 = in.m_58.x;
        float _581 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _583 = _579 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _585 = fma(_583, (*spvDescriptorSet0.vp_c9)._m0[11].y, _141);
        float _587 = _585 * _581;
        float _589 = floor(_587);
        float _591 = -_589;
        float _593 = _587 + _591;
        _595 = _593;
        _597 = true;
    }
    else
    {
        float _599 = float(_107);
        float _601 = 1.0 / _599;
        float _603 = _141 * _601;
        _595 = _603;
    }
    _597 = false;
    float _605 = _595;
    bool _607 = _605 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _609 = isnan(_605);
    bool _611 = _607 || _609;
    bool _613 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _615 = _611 || _613;
    float _617 = float(_615);
    float _619 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _621 = _619 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _623 = _605 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _625 = isnan(_605);
    bool _627 = _623 || _625;
    bool _629 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _631 = _627 || _629;
    float _633 = float(_631);
    float _635 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _637 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _635;
    float _639 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _641 = _605 + _639;
    float _643 = -_617;
    float _645 = _643 + 1.0;
    bool _647 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _649 = 1.0 / _621;
    float _651 = _633 * _645;
    float _653 = -_633;
    float _655 = _653 + 1.0;
    float _657 = _637 * _649;
    float _659 = fma(_657, _641, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _661 = _659 * _651;
    float _663 = fma(_655, (*spvDescriptorSet0.vp_c9)._m0[115].x, _661);
    float _665 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _667 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _669 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _671 = fma(_617, (*spvDescriptorSet0.vp_c9)._m0[116].x, _663);
    float _673 = _665 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _675 = _667 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _677 = _669 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _679 = _671 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_62.x = _673;
    out.m_62.y = _675;
    out.m_62.z = _677;
    out.m_62.w = _679;
    bool _681 = !_647;
    float _699;
    if (!_681)
    {
        float _683 = in.m_58.x;
        float _685 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _687 = _683 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _689 = fma(_687, (*spvDescriptorSet0.vp_c9)._m0[11].w, _141);
        float _691 = _689 * _685;
        float _693 = floor(_691);
        float _695 = -_693;
        float _697 = _691 + _695;
        _699 = _697;
        _701 = true;
    }
    else
    {
        float _703 = float(_107);
        float _705 = 1.0 / _703;
        float _707 = _141 * _705;
        _699 = _707;
    }
    _701 = false;
    float _709 = _699;
    float _711 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _713 = int(_711);
    float _715 = float(_107);
    float _717 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _719 = int(_717);
    float _721 = float(_713);
    float _723 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _725 = int(_723);
    float _727 = float(uint(_719));
    float _729 = 1.0 / _721;
    int _731 = ~_719;
    int _733 = _731 + 1;
    int _735 = ~_719;
    int _737 = _735 + 1;
    float _739 = 1.0 / _727;
    float _741 = float(uint(_725));
    float _743 = _729 * _141;
    float _745 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _747 = int(_745);
    int _749 = as_type<int>(_739) + (-2);
    float _751 = trunc(_743);
    int _753 = int(_751);
    float _755 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _757 = int(_755);
    float _759 = float(_747);
    float _761 = float(uint(_753));
    float _763 = 1.0 / _741;
    float _765 = as_type<float>(_749) * _761;
    float _767 = float(_757);
    float _769 = trunc(_765);
    float _771 = precise::max(_769, 0.0);
    uint _774 = uint(_771);
    int _776 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _778 = _776 != 0;
    float _780 = 1.0 / _767;
    float _782 = float(_719);
    int _784 = _733 * int(_774);
    int _786 = _784 + _753;
    float _788 = float(_753);
    float _790 = _557;
    float _792 = as_type<float>(_774);
    if (_778)
    {
        float _794 = in.m_58.x;
        _790 = _794;
    }
    float _796 = _790;
    float _798 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _800 = int(_798);
    if (_778)
    {
        _571 = 1.0;
    }
    float _802 = _571;
    float _804 = _802;
    if (_778)
    {
        _573 = 0;
        _575 = 0;
    }
    int _806 = _573;
    int _808 = _575;
    float _810 = float(uint(_786));
    bool _812 = _788 >= _782;
    bool _814 = isnan(_788);
    bool _816 = _812 || _814;
    bool _818 = isnan(_782);
    bool _820 = _816 || _818;
    float _822 = float(_820);
    int _824 = _806;
    int _826 = _808;
    if (_778)
    {
        _577 = 1.0;
    }
    float _828 = _577;
    float _830 = as_type<float>(_749) * _810;
    float _832 = 1.0 / _715;
    float _834 = in.m_58.x;
    float _836 = in.m_58.y;
    float _838 = in.m_58.z;
    float _840 = in.m_58.w;
    float _842 = trunc(_830);
    float _844 = precise::max(_842, 0.0);
    uint _846 = uint(_844);
    float _848 = 1.0 / _759;
    float _850 = trunc(_822);
    int _852 = int(_850);
    int _854 = int(_774) + int(_846);
    float _856 = as_type<float>(_846);
    float _858 = _828;
    if (_778)
    {
        _856 = 1.0;
    }
    float _860 = _856;
    float _862 = _860;
    float _864 = _796;
    if (_778)
    {
        _792 = _796;
    }
    float _866 = _792;
    float _868 = _866;
    if (!_778)
    {
        float _870 = in.m_58.y;
        float _872 = in.m_58.z;
        _862 = 7.345489978790283203125;
        _858 = 5.839270114898681640625;
        _868 = _872;
        _804 = 1.2345600128173828125;
        _864 = _870;
        _824 = 1;
        _826 = 2;
    }
    float _874 = _862;
    float _876 = _858;
    float _878 = _868;
    float _880 = _804;
    float _882 = _864;
    int _884 = _824;
    int _886 = _826;
    int _888 = _737 * _854;
    int _890 = _888 + _753;
    float _892 = _874 * _834;
    float _894 = _780 * _141;
    bool _896 = _719 == 0;
    float _898 = _848 * _141;
    bool _900 = uint(_890) >= uint(_719);
    float _902 = floor(_892);
    float _904 = float(uint(_800));
    float _906 = _832 * _141;
    bool _908 = !_900;
    int _910 = _908 ? 0 : (-1);
    float _912 = _876 * _878;
    bool _914 = _836 > 0.5;
    float _916 = _834 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _918 = ~_854;
    int _920 = _918 + _910;
    int _922 = _920 + 1;
    float _924 = trunc(_894);
    int _926 = int(_924);
    int _928 = _719 + (-1);
    int _930 = _719 * _922;
    int _932 = _930 + _753;
    int _934 = ~_852;
    int _936 = _934 + 1;
    int _938 = _936 + 1;
    int _940 = ~_725;
    int _942 = _940 + 1;
    float _944 = -_902;
    float _946 = _892 + _944;
    bool _948 = !_896;
    int _950 = _948 ? _932 : (-1);
    float _952 = 1.0 / _904;
    float _954 = _946 * _782;
    int _956 = as_type<int>(_763) + (-2);
    int _958 = _950 * _938;
    int _960 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _962 = _960 != 0;
    float _964 = _782 * _906;
    float _966 = float(uint(_926));
    float _968 = trunc(_898);
    int _970 = int(_968);
    bool _972 = _838 > 0.5;
    int _974 = _852 * _928;
    int _976 = _974 + _958;
    float _978 = -_177;
    int _980 = _914 ? as_type<int>(_978) : as_type<int>(_177);
    int _982 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _984 = _982 != 0;
    int _986 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _988 = _986 != 0;
    int _990 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _992 = _990 != 0;
    float _994 = -_181;
    int _996 = _972 ? as_type<int>(_994) : as_type<int>(_181);
    float _998 = trunc(_954);
    int _1000 = int(_998);
    float _1002 = as_type<float>(_956) * _966;
    bool _1004 = !_962;
    int _1006 = _1004 ? 0 : 1;
    int _1008 = as_type<int>(_952) + (-2);
    int _1010 = abs(_1006);
    float _1012 = trunc(_1002);
    float _1014 = precise::max(_1012, 0.0);
    uint _1016 = uint(_1014);
    bool _1018 = !_988;
    float _1020 = _1018 ? _177 : as_type<float>(_980);
    bool _1022 = !_992;
    float _1024 = _1022 ? _181 : as_type<float>(_996);
    int _1026 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1028 = _1026 != 0;
    int _1030 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1032 = _1030 != 0;
    int _1034 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1036 = _1034 != 0;
    float _1038 = trunc(_964);
    int _1040 = int(_1038);
    float _1042 = float(uint(_970));
    int _1044 = _1000 * _1010;
    int _1046 = _1044 + _753;
    int _1048 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1050 = _1048 != 0;
    bool _1052 = !_1032;
    int _1054 = _1052 ? 0 : 1;
    float _1056 = as_type<float>(_1008) * _1042;
    bool _1058 = !_1028;
    int _1060 = _1058 ? 0 : 1;
    int _1062 = _942 * int(_1016);
    int _1064 = _1062 + _926;
    int _1066 = abs(_1054);
    bool _1068 = !_1036;
    int _1070 = _1068 ? 0 : 1;
    float _1072 = trunc(_1056);
    float _1074 = precise::max(_1072, 0.0);
    uint _1076 = uint(_1074);
    int _1078 = abs(_1060);
    int _1080 = _976 * _1066;
    bool _1082 = !_1050;
    int _1084 = _1082 ? 0 : 1;
    int _1086 = abs(_1070);
    float _1088 = float(uint(_1064));
    int _1090 = abs(_1084);
    int _1092 = _1040 * _1078;
    int _1094 = _1092 + _1080;
    float _1096 = as_type<float>(_956) * _1088;
    float _1098 = _880 * _882;
    float _1100 = float(_725);
    int _1102 = _1046 * _1086;
    int _1104 = _1102 + _1094;
    float _1106 = trunc(_1096);
    float _1108 = precise::max(_1106, 0.0);
    uint _1110 = uint(_1108);
    int _1112 = ~_725;
    int _1114 = _1112 + 1;
    int _1116 = _1000 * _1090;
    int _1118 = _1116 + _1104;
    int _1120 = ~_800;
    int _1122 = _1120 + 1;
    float _1124 = float(_926);
    float _1126 = float(uint(_1118));
    float _1128 = floor(_1098);
    bool _1130 = _840 > 0.5;
    bool _1132 = _1124 >= _1100;
    bool _1134 = isnan(_1124);
    bool _1136 = _1132 || _1134;
    bool _1138 = isnan(_1100);
    bool _1140 = _1136 || _1138;
    float _1142 = float(_1140);
    float _1144 = as_type<float>(_749) * _1126;
    float _1146 = -_181;
    int _1148 = _1130 ? as_type<int>(_1146) : as_type<int>(_181);
    int _1150 = int(_1016) + int(_1110);
    float _1152 = trunc(_1144);
    float _1154 = precise::max(_1152, 0.0);
    uint _1156 = uint(_1154);
    int _1158 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1160 = _1158 != 0;
    int _1162 = _1114 * _1150;
    int _1164 = _1162 + _926;
    int _1166 = _1122 * int(_1076);
    int _1168 = _1166 + _970;
    float _1170 = -_1128;
    float _1172 = _1098 + _1170;
    bool _1174 = uint(_1164) >= uint(_725);
    float _1176 = trunc(_1142);
    int _1178 = int(_1176);
    float _1180 = float(uint(_1168));
    float _1182 = _1172 * _1100;
    int _1184 = ~_719;
    int _1186 = _1184 + 1;
    float _1188 = _1100 * _906;
    bool _1190 = !_984;
    float _1192 = _1190 ? _181 : as_type<float>(_1148);
    float _1194 = as_type<float>(_1008) * _1180;
    bool _1196 = !_1174;
    int _1198 = _1196 ? 0 : (-1);
    float _1200 = floor(_912);
    bool _1202 = !_1160;
    int _1204 = _1202 ? 0 : 1;
    int _1206 = _1186 * int(_1156);
    int _1208 = _1206 + _1118;
    int _1210 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1212 = _1210 != 0;
    int _1214 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1216 = _1214 != 0;
    int _1218 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1220 = _1218 != 0;
    int _1222 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1224 = _1222 != 0;
    int _1226 = ~_1150;
    int _1228 = _1226 + _1198;
    int _1230 = _1228 + 1;
    float _1232 = float(uint(_1208));
    float _1234 = trunc(_1194);
    float _1236 = precise::max(_1234, 0.0);
    uint _1238 = uint(_1236);
    bool _1240 = !_1216;
    int _1242 = _1240 ? 0 : 1;
    int _1244 = _725 * _1230;
    int _1246 = _1244 + _926;
    bool _1248 = _725 == 0;
    float _1250 = as_type<float>(_749) * _1232;
    int _1252 = ~_1178;
    int _1254 = _1252 + 1;
    int _1256 = _1254 + 1;
    bool _1258 = !_1248;
    int _1260 = _1258 ? _1246 : (-1);
    float _1262 = trunc(_1250);
    float _1264 = precise::max(_1262, 0.0);
    uint _1266 = uint(_1264);
    float _1268 = -_1200;
    float _1270 = _912 + _1268;
    int _1272 = ~_800;
    int _1274 = _1272 + 1;
    int _1276 = _1260 * _1256;
    int _1278 = _725 + (-1);
    int _1280 = abs(_1204);
    float _1282 = trunc(_1188);
    int _1284 = int(_1282);
    int _1286 = int(_1076) + int(_1238);
    int _1288 = _1178 * _1278;
    int _1290 = _1288 + _1276;
    int _1292 = abs(_1242);
    bool _1294 = !_1212;
    int _1296 = _1294 ? 0 : 1;
    float _1298 = trunc(_1182);
    int _1300 = int(_1298);
    int _1302 = int(_1156) + int(_1266);
    int _1304 = _1290 * _1292;
    int _1306 = abs(_1296);
    int _1308 = _1274 * _1286;
    int _1310 = _1308 + _970;
    bool _1312 = !_1220;
    int _1314 = _1312 ? 0 : 1;
    bool _1316 = uint(_1310) >= uint(_800);
    int _1318 = ~_719;
    int _1320 = _1318 + 1;
    int _1322 = _1284 * _1306;
    int _1324 = _1322 + _1304;
    float _1326 = float(uint(_1046));
    float _1328 = float(_800);
    int _1330 = _1300 * _1280;
    int _1332 = _1330 + _926;
    int _1334 = abs(_1314);
    float _1336 = as_type<float>(_749) * _1326;
    bool _1338 = !_1224;
    int _1340 = _1338 ? 0 : 1;
    int _1342 = _1320 * _1302;
    int _1344 = _1342 + _1118;
    float _1346 = float(_970);
    int _1348 = abs(_1340);
    int _1350 = _1332 * _1334;
    int _1352 = _1350 + _1324;
    bool _1354 = _1346 >= _1328;
    bool _1356 = isnan(_1346);
    bool _1358 = _1354 || _1356;
    bool _1360 = isnan(_1328);
    bool _1362 = _1358 || _1360;
    float _1364 = float(_1362);
    float _1366 = trunc(_1336);
    float _1368 = precise::max(_1366, 0.0);
    uint _1370 = uint(_1368);
    bool _1372 = uint(_1344) >= uint(_719);
    bool _1374 = !_1316;
    int _1376 = _1374 ? 0 : (-1);
    int _1378 = _1300 * _1348;
    int _1380 = _1378 + _1352;
    int _1382 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1384 = _1382 != 0;
    int _1386 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1388 = _1386 != 0;
    int _1390 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1392 = _1390 != 0;
    float _1394 = trunc(_1364);
    int _1396 = int(_1394);
    int _1398 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1400 = _1398 != 0;
    float _1402 = _1270 * _1328;
    int _1404 = ~_1286;
    int _1406 = _1404 + _1376;
    int _1408 = _1406 + 1;
    float _1410 = _1328 * _906;
    bool _1412 = !_1400;
    int _1414 = _1412 ? 0 : 1;
    float _1416 = float(uint(_1380));
    float _1418 = trunc(_1402);
    int _1420 = int(_1418);
    int _1422 = ~_719;
    int _1424 = _1422 + 1;
    int _1426 = _800 * _1408;
    int _1428 = _1426 + _970;
    int _1430 = abs(_1414);
    float _1432 = as_type<float>(_956) * _1416;
    bool _1434 = _800 == 0;
    int _1436 = _1424 * int(_1370);
    int _1438 = _1436 + _1046;
    bool _1440 = !_1388;
    int _1442 = _1440 ? 0 : 1;
    float _1444 = trunc(_1410);
    int _1446 = int(_1444);
    int _1448 = ~_1396;
    int _1450 = _1448 + 1;
    int _1452 = _1450 + 1;
    bool _1454 = !_1434;
    int _1456 = _1454 ? _1428 : (-1);
    float _1458 = float(uint(_1438));
    int _1460 = _800 + (-1);
    float _1462 = trunc(_1432);
    float _1464 = precise::max(_1462, 0.0);
    uint _1466 = uint(_1464);
    int _1468 = _1456 * _1452;
    bool _1470 = !_1372;
    int _1472 = _1470 ? 0 : (-1);
    int _1474 = _1420 * _1430;
    int _1476 = _1474 + _970;
    float _1478 = as_type<float>(_749) * _1458;
    int _1480 = ~_725;
    int _1482 = _1480 + 1;
    int _1484 = _1396 * _1460;
    int _1486 = _1484 + _1468;
    int _1488 = abs(_1442);
    int _1490 = ~_1302;
    int _1492 = _1490 + _1472;
    int _1494 = _1492 + 1;
    int _1496 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1498 = _1496 != 0;
    int _1500 = _1486 * _1488;
    int _1502 = _719 * _1494;
    int _1504 = _1502 + _1118;
    bool _1506 = !_1498;
    int _1508 = _1506 ? 0 : 1;
    bool _1510 = !_1384;
    int _1512 = _1510 ? 0 : 1;
    int _1514 = _1482 * int(_1466);
    int _1516 = _1514 + _1380;
    bool _1518 = _719 == 0;
    int _1520 = abs(_1508);
    int _1522 = abs(_1512);
    bool _1524 = !_1392;
    int _1526 = _1524 ? 0 : 1;
    bool _1528 = !_1518;
    int _1530 = _1528 ? _1504 : (-1);
    int _1532 = _1446 * _1522;
    int _1534 = _1532 + _1500;
    float _1536 = float(uint(_1516));
    int _1538 = abs(_1526);
    float _1540 = trunc(_1478);
    float _1542 = precise::max(_1540, 0.0);
    uint _1544 = uint(_1542);
    int _1546 = _1530 & 3;
    bool _1548 = _1546 != 0;
    float _1550 = as_type<float>(_956) * _1536;
    int _1552 = _1530 & 3;
    bool _1554 = _1552 != 0;
    int _1556 = _1476 * _1538;
    int _1558 = _1556 + _1534;
    int _1560 = _1548 ? 0 : 1;
    bool _1562 = uint(_1552) > 1u;
    float _1564 = trunc(_1550);
    float _1566 = precise::max(_1564, 0.0);
    uint _1568 = uint(_1566);
    int _1570 = _1420 * _1520;
    int _1572 = _1570 + _1558;
    int _1574 = ~_719;
    int _1576 = _1574 + 1;
    int _1578 = ~_1560;
    int _1580 = _1578 + 1;
    int _1582 = _1580 + 1;
    float _1584 = float(uint(_1572));
    int _1586 = int(_1370) + int(_1544);
    int _1588 = _1582;
    if (!_1562)
    {
        int _1590 = ~_1560;
        int _1592 = _1590 + 1;
        _1588 = _1592;
    }
    int _1594 = _1588;
    float _1596 = as_type<float>(_1008) * _1584;
    bool _1598 = uint(_1552) >= 2u;
    int _1600 = _1576 * _1586;
    int _1602 = _1600 + _1046;
    int _1604 = int(_1466) + int(_1568);
    int _1606 = ~_725;
    int _1608 = _1606 + 1;
    float _1610 = trunc(_1596);
    float _1612 = precise::max(_1610, 0.0);
    uint _1614 = uint(_1612);
    float _1616 = float(uint(_1332));
    int _1618 = _1598 ? 0 : 1;
    int _1620 = _1608 * _1604;
    int _1622 = _1620 + _1380;
    bool _1624 = uint(_1602) >= uint(_719);
    float _1626 = as_type<float>(_956) * _1616;
    int _1628 = ~_800;
    int _1630 = _1628 + 1;
    bool _1632 = !_1624;
    int _1634 = _1632 ? 0 : (-1);
    float _1636 = trunc(_1626);
    float _1638 = precise::max(_1636, 0.0);
    uint _1640 = uint(_1638);
    bool _1642 = uint(_1622) >= uint(_725);
    int _1644 = ~_725;
    int _1646 = _1644 + 1;
    bool _1648 = !_1642;
    int _1650 = _1648 ? 0 : (-1);
    int _1652 = _1630 * int(_1614);
    int _1654 = _1652 + _1572;
    bool _1656 = _1552 != 3;
    int _1658 = ~_1586;
    int _1660 = _1658 + _1634;
    int _1662 = _1660 + 1;
    float _1664 = float(uint(_1654));
    int _1666 = ~_1604;
    int _1668 = _1666 + _1650;
    int _1670 = _1668 + 1;
    int _1672 = _719 * _1662;
    int _1674 = _1672 + _1046;
    float _1676 = as_type<float>(_1008) * _1664;
    int _1678 = ~_1618;
    int _1680 = _1678 + 1;
    int _1682 = _1680 + 1;
    int _1684 = _725 * _1670;
    int _1686 = _1684 + _1380;
    bool _1688 = !_1518;
    int _1690 = _1688 ? _1674 : (-1);
    float _1692 = trunc(_1676);
    float _1694 = precise::max(_1692, 0.0);
    uint _1696 = uint(_1694);
    int _1698 = _1682;
    if (_1656)
    {
        int _1700 = ~_1618;
        int _1702 = _1700 + 1;
        _1698 = _1702;
    }
    int _1704 = _1698;
    int _1706 = _1646 * int(_1640);
    int _1708 = _1706 + _1332;
    int _1710 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1712 = _1710 != 0;
    bool _1714 = !_1248;
    int _1716 = _1714 ? _1686 : (-1);
    float _1718 = float(uint(_1708));
    bool _1720 = !_1712;
    int _1722 = _1720 ? 0 : 1;
    int _1724 = _1716 & 3;
    bool _1726 = _1724 != 0;
    float _1728 = as_type<float>(_956) * _1718;
    int _1730 = _1716 & 3;
    bool _1732 = _1730 != 0;
    int _1734 = _1726 ? 0 : 1;
    float _1736 = trunc(_1728);
    float _1738 = precise::max(_1736, 0.0);
    uint _1740 = uint(_1738);
    bool _1742 = uint(_1730) > 1u;
    int _1744 = ~_800;
    int _1746 = _1744 + 1;
    int _1748 = int(_1614) + int(_1696);
    int _1750 = ~_1734;
    int _1752 = _1750 + 1;
    int _1754 = _1752 + 1;
    float _1756 = float(uint(_1476));
    int _1758 = _1746 * _1748;
    int _1760 = _1758 + _1572;
    bool _1762 = !_1554;
    int _1764 = _1762 ? 0 : 1;
    bool _1766 = _1730 != 3;
    float _1768 = as_type<float>(_1008) * _1756;
    int _1770 = _1754;
    if (!_1742)
    {
        int _1772 = ~_1734;
        int _1774 = _1772 + 1;
        _1770 = _1774;
    }
    int _1776 = _1770;
    int _1778 = ~_725;
    int _1780 = _1778 + 1;
    float _1782 = trunc(_1768);
    float _1784 = precise::max(_1782, 0.0);
    uint _1786 = uint(_1784);
    bool _1788 = uint(_1760) >= uint(_800);
    int _1790 = int(_1640) + int(_1740);
    bool _1792 = !_1788;
    int _1794 = _1792 ? 0 : (-1);
    bool _1796 = uint(_1730) >= 2u;
    int _1798 = _1780 * _1790;
    int _1800 = _1798 + _1332;
    int _1802 = ~_1748;
    int _1804 = _1802 + _1794;
    int _1806 = _1804 + 1;
    bool _1808 = !_1732;
    int _1810 = _1808 ? 0 : 1;
    int _1812 = _1796 ? 0 : 1;
    int _1814 = _800 * _1806;
    int _1816 = _1814 + _1572;
    bool _1818 = _1552 != 3;
    bool _1820 = uint(_1800) >= uint(_725);
    int _1822 = ~_800;
    int _1824 = _1822 + 1;
    int _1826 = ~_1812;
    int _1828 = _1826 + 1;
    int _1830 = _1828 + 1;
    bool _1832 = !_1818;
    int _1834 = _1832 ? 0 : (-1);
    int _1836 = _1830;
    if (_1766)
    {
        int _1838 = ~_1812;
        int _1840 = _1838 + 1;
        _1836 = _1840;
    }
    int _1842 = _1836;
    int _1844 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1846 = _1844 != 0;
    bool _1848 = !_1434;
    int _1850 = _1848 ? _1816 : (-1);
    int _1852 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _1854 = _1852 != 0;
    int _1856 = _1824 * int(_1786);
    int _1858 = _1856 + _1476;
    bool _1860 = !_1846;
    int _1862 = _1860 ? 0 : 1;
    int _1864 = _1850 & 3;
    bool _1866 = _1864 != 0;
    bool _1868 = !_1820;
    int _1870 = _1868 ? 0 : (-1);
    bool _1872 = _1730 != 3;
    bool _1874 = !_1854;
    int _1876 = _1874 ? 0 : 1;
    bool _1878 = uint(_1864) > 1u;
    float _1880 = float(uint(_1858));
    bool _1882 = !_1872;
    int _1884 = _1882 ? 0 : (-1);
    int _1886 = _1850 & 3;
    bool _1888 = _1886 != 0;
    float _1890 = as_type<float>(_1008) * _1880;
    int _1892 = _1888 ? 0 : 1;
    float _1894 = trunc(_1890);
    float _1896 = precise::max(_1894, 0.0);
    uint _1898 = uint(_1896);
    bool _1900 = uint(_1864) >= 2u;
    bool _1902 = !_1866;
    int _1904 = _1902 ? 0 : 1;
    int _1906 = ~_1892;
    int _1908 = _1906 + 1;
    int _1910 = _1908 + 1;
    int _1912 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1914 = _1912 != 0;
    int _1916 = _1910;
    if (!_1878)
    {
        int _1918 = ~_1892;
        int _1920 = _1918 + 1;
        _1916 = _1920;
    }
    int _1922 = _1916;
    int _1924 = _1900 ? 0 : 1;
    bool _1926 = _1864 != 3;
    int _1928 = _1530 >> 31;
    bool _1930 = _1864 != 3;
    int _1932 = _1928 & 3;
    int _1934 = _1850 >> 31;
    bool _1936 = !_1930;
    int _1938 = _1936 ? 0 : (-1);
    int _1940 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1942 = _1940 != 0;
    int _1944 = _1716 >> 31;
    int _1946 = _1530 + _1932;
    int _1948 = _1934 & 3;
    int _1950 = _1944 & 3;
    int _1952 = ~_1924;
    int _1954 = _1952 + 1;
    int _1956 = _1954 + 1;
    int _1958 = _1850 + _1948;
    int _1960 = _1956;
    if (_1926)
    {
        int _1962 = ~_1924;
        int _1964 = _1962 + 1;
        _1960 = _1964;
    }
    int _1966 = _1960;
    float _1968 = in.m_48.x;
    float _1970 = in.m_48.y;
    float _1972 = in.m_48.z;
    int _1974 = _1946 >> 2;
    int _1976 = _1716 + _1950;
    int _1978 = _1974 << 4;
    int _1980 = _1978 + 368;
    int _1982 = int(_1786) + int(_1898);
    int _1984 = _1976 >> 2;
    int _1986 = _1958 >> 2;
    int _1988 = ~_800;
    int _1990 = _1988 + 1;
    uint _1992 = uint(int(uint(_1980) >> uint(2)));
    uint _1994 = uint(int(uint(int(_1992)) >> uint(2)));
    int _1996 = int(_1992) & 3;
    float _1998 = (*spvDescriptorSet0.vp_c9)._m0[int(_1994)][_1996];
    int _2000 = int(_1992) + 1;
    uint _2002 = uint(int(uint(_2000) >> uint(2)));
    int _2004 = _2000 & 3;
    float _2006 = (*spvDescriptorSet0.vp_c9)._m0[int(_2002)][_2004];
    int _2008 = _1984 << 4;
    int _2010 = _2008 + 512;
    int _2012 = _1990 * _1982;
    int _2014 = _2012 + _1476;
    int _2016 = _1986 << 4;
    int _2018 = _2016 + 656;
    int _2020 = ~_1790;
    int _2022 = _2020 + _1870;
    int _2024 = _2022 + 1;
    uint _2026 = uint(int(uint(_2010) >> uint(2)));
    uint _2028 = uint(int(uint(int(_2026)) >> uint(2)));
    int _2030 = int(_2026) & 3;
    float _2032 = (*spvDescriptorSet0.vp_c9)._m0[int(_2028)][_2030];
    int _2034 = int(_2026) + 1;
    uint _2036 = uint(int(uint(_2034) >> uint(2)));
    int _2038 = _2034 & 3;
    float _2040 = (*spvDescriptorSet0.vp_c9)._m0[int(_2036)][_2038];
    float _2042 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _2044 = uint(_2014) >= uint(_800);
    float _2046 = _1970 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _2048 = _1970 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _2050 = -_2042;
    float _2052 = fma(_916, 2.0, _2050);
    bool _2054 = !_2044;
    int _2056 = _2054 ? 0 : (-1);
    float _2058 = _1970 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    int _2060 = _1980 + 8;
    uint _2062 = uint(int(uint(_2060) >> uint(2)));
    uint _2064 = uint(int(uint(int(_2062)) >> uint(2)));
    int _2066 = int(_2062) & 3;
    float _2068 = (*spvDescriptorSet0.vp_c9)._m0[int(_2064)][_2066];
    int _2070 = int(_2062) + 1;
    uint _2072 = uint(int(uint(_2070) >> uint(2)));
    int _2074 = _2070 & 3;
    float _2076 = (*spvDescriptorSet0.vp_c9)._m0[int(_2072)][_2074];
    int _2078 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2080 = _2078 != 0;
    float _2082 = _1970 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _2084 = fma(_1968, (*spvDescriptorSet0.vp_c10)._m0[14].y, _2046);
    float _2086 = fma(_1968, (*spvDescriptorSet0.vp_c10)._m0[14].z, _2048);
    float _2088 = fma(_1968, (*spvDescriptorSet0.vp_c10)._m0[14].w, _2058);
    float _2090 = fma(_1968, (*spvDescriptorSet0.vp_c10)._m0[14].x, _2082);
    int _2092 = abs(_1594);
    uint _2094 = uint(int(uint(_2018) >> uint(2)));
    uint _2096 = uint(int(uint(int(_2094)) >> uint(2)));
    int _2098 = int(_2094) & 3;
    float _2100 = (*spvDescriptorSet0.vp_c9)._m0[int(_2096)][_2098];
    int _2102 = int(_2094) + 1;
    uint _2104 = uint(int(uint(_2102) >> uint(2)));
    int _2106 = _2102 & 3;
    float _2108 = (*spvDescriptorSet0.vp_c9)._m0[int(_2104)][_2106];
    int _2110 = _725 * _2024;
    int _2112 = _2110 + _1332;
    int _2114 = abs(_1922);
    float _2116 = _836 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2118 = fma(_1972, (*spvDescriptorSet0.vp_c10)._m0[16].x, _2090);
    float _2120 = fma(_1972, (*spvDescriptorSet0.vp_c10)._m0[16].y, _2084);
    int _2122 = _2010 + 8;
    uint _2124 = uint(int(uint(_2122) >> uint(2)));
    uint _2126 = uint(int(uint(int(_2124)) >> uint(2)));
    int _2128 = int(_2124) & 3;
    float _2130 = (*spvDescriptorSet0.vp_c9)._m0[int(_2126)][_2128];
    int _2132 = int(_2124) + 1;
    uint _2134 = uint(int(uint(_2132) >> uint(2)));
    int _2136 = _2132 & 3;
    float _2138 = (*spvDescriptorSet0.vp_c9)._m0[int(_2134)][_2136];
    int _2140 = abs(_1776);
    float _2142 = _2118 + (*spvDescriptorSet0.vp_c10)._m0[17].x;
    int _2144 = ~_2092;
    int _2146 = _2144 + 1;
    int _2148 = _2146 + 1;
    float _2150 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2152 = fma(_1972, (*spvDescriptorSet0.vp_c10)._m0[16].z, _2086);
    int _2154 = abs(_1764);
    int _2156 = _2018 + 8;
    uint _2158 = uint(int(uint(_2156) >> uint(2)));
    uint _2160 = uint(int(uint(int(_2158)) >> uint(2)));
    int _2162 = int(_2158) & 3;
    float _2164 = (*spvDescriptorSet0.vp_c9)._m0[int(_2160)][_2162];
    int _2166 = int(_2158) + 1;
    uint _2168 = uint(int(uint(_2166) >> uint(2)));
    int _2170 = _2166 & 3;
    float _2172 = (*spvDescriptorSet0.vp_c9)._m0[int(_2168)][_2170];
    int _2174 = ~_2140;
    int _2176 = _2174 + 1;
    int _2178 = _2176 + 1;
    float _2180 = fma(_2116, -2.0, _2150);
    int _2182 = abs(_1810);
    float _2184 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2186 = int(_2184);
    int _2188 = ~_2154;
    int _2190 = _2188 + 1;
    int _2192 = _2190 + 1;
    float _2194 = fma(_1972, (*spvDescriptorSet0.vp_c10)._m0[16].w, _2088);
    int _2196 = ~_1982;
    int _2198 = _2196 + _2056;
    int _2200 = _2198 + 1;
    int _2202 = _2148 * as_type<int>(_2006);
    int _2204 = abs(_1904);
    float _2206 = _2120 + (*spvDescriptorSet0.vp_c10)._m0[17].y;
    int _2208 = abs(_1704);
    int _2210 = _2192 * as_type<int>(_1998);
    int _2212 = _2210 + _2202;
    int _2214 = _800 * _2200;
    int _2216 = _2214 + _1476;
    int _2218 = abs(_1842);
    int _2220 = _2178 * as_type<int>(_2040);
    int _2222 = ~_2182;
    int _2224 = _2222 + 1;
    int _2226 = _2224 + 1;
    float _2228 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2230 = int(_2228);
    int _2232 = ~_2208;
    int _2234 = _2232 + 1;
    int _2236 = _2234 + 1;
    float _2238 = _2194 + (*spvDescriptorSet0.vp_c10)._m0[17].w;
    int _2240 = ~_2114;
    int _2242 = _2240 + 1;
    int _2244 = _2242 + 1;
    int _2246 = _2226 * as_type<int>(_2032);
    int _2248 = _2246 + _2220;
    int _2250 = _2236 * as_type<int>(_2068);
    int _2252 = _2250 + _2212;
    int _2254 = ~_2218;
    int _2256 = _2254 + 1;
    int _2258 = _2256 + 1;
    float _2260 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _2262 = int(_2260);
    int _2264 = ~_2204;
    int _2266 = _2264 + 1;
    int _2268 = _2266 + 1;
    float _2270 = -_141;
    float _2272 = fma(_2270, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2052);
    int _2274 = abs(_1966);
    int _2276 = abs(_1938);
    int _2278 = _2244 * as_type<int>(_2108);
    int _2280 = ~_2274;
    int _2282 = _2280 + 1;
    int _2284 = _2282 + 1;
    float _2286 = float(uint(_2186));
    int _2288 = _2268 * as_type<int>(_2100);
    int _2290 = _2288 + _2278;
    int _2292 = abs(_1834);
    int _2294 = abs(_1722);
    int _2296 = _2258 * as_type<int>(_2130);
    int _2298 = _2296 + _2248;
    int _2300 = abs(_1884);
    float _2302 = 1.0 / _2286;
    int _2304 = ~_2292;
    int _2306 = _2304 + 1;
    int _2308 = _2306 + 1;
    int _2310 = ~_2300;
    int _2312 = _2310 + 1;
    int _2314 = _2312 + 1;
    float _2316 = float(uint(_2230));
    int _2318 = _2284 * as_type<int>(_2164);
    int _2320 = _2318 + _2290;
    int _2322 = ~_2276;
    int _2324 = _2322 + 1;
    int _2326 = _2324 + 1;
    int _2328 = _2314 * as_type<int>(_2138);
    int _2330 = _2328 + _2298;
    int _2332 = abs(_2186);
    int _2334 = _2308 * as_type<int>(_2076);
    int _2336 = _2334 + _2252;
    int _2338 = abs(_1876);
    int _2340 = _2326 * as_type<int>(_2172);
    int _2342 = _2340 + _2320;
    int _2344 = ~_2294;
    int _2346 = _2344 + 1;
    int _2348 = _2346 + 1;
    float _2350 = 1.0 / _2316;
    float _2352 = _834 * 2.0;
    int _2354 = abs(_1862);
    int _2356 = _2336 * _2348;
    int _2358 = ~_2338;
    int _2360 = _2358 + 1;
    int _2362 = _2360 + 1;
    float _2364 = float(uint(_2262));
    int _2366 = _1690 * _2294;
    int _2368 = _2366 + _2356;
    int _2370 = ~_2354;
    int _2372 = _2370 + 1;
    int _2374 = _2372 + 1;
    int _2376 = _2342 * _2362;
    float _2378 = float(uint(_2332));
    float _2380 = floor(_2352);
    bool _2382 = !_1248;
    int _2384 = _2382 ? _2112 : (-1);
    int _2386 = _2330 * _2374;
    int _2388 = as_type<int>(_2302) + (-2);
    int _2390 = abs(_2262);
    int _2392 = _2384 * _2354;
    int _2394 = _2392 + _2386;
    float _2396 = float(uint(_2368));
    float _2398 = 1.0 / _2364;
    float _2400 = as_type<float>(_2388) * _2396;
    bool _2402 = !_1434;
    int _2404 = _2402 ? _2216 : (-1);
    float _2406 = (*spvDescriptorSet0.vp_c10)._m0[19].y * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    int _2408 = as_type<int>(_2350) + (-2);
    float _2410 = 1.0 / _2378;
    float _2412 = float(uint(_2394));
    int _2414 = _2404 * _2338;
    int _2416 = _2414 + _2376;
    int _2418 = abs(_2230);
    float _2420 = as_type<float>(_2408) * _2412;
    float _2422 = float(uint(_2390));
    float _2424 = fma((*spvDescriptorSet0.vp_c10)._m0[19].x, (*spvDescriptorSet0.vp_c10)._m0[19].x, _2406);
    float _2426 = float(uint(_2418));
    float _2428 = trunc(_2400);
    float _2430 = precise::max(_2428, 0.0);
    uint _2432 = uint(_2430);
    int _2434 = abs(_2368);
    int _2436 = as_type<int>(_2398) + (-2);
    float _2438 = float(uint(_2416));
    int _2440 = as_type<int>(_2410) + (-2);
    float _2442 = 1.0 / _2422;
    float _2444 = float(uint(_2434));
    float _2446 = as_type<float>(_2436) * _2438;
    int _2448 = ~_2230;
    int _2450 = _2448 + 1;
    int _2452 = abs(_2394);
    float _2454 = as_type<float>(_2440) * _2444;
    int _2456 = abs(_2416);
    float _2458 = trunc(_2420);
    float _2460 = precise::max(_2458, 0.0);
    uint _2462 = uint(_2460);
    int _2464 = ~_2186;
    int _2466 = _2464 + 1;
    float _2468 = float(uint(_2456));
    float _2470 = float(uint(_2452));
    int _2472 = _2466 * int(_2432);
    int _2474 = _2472 + _2368;
    float _2476 = 1.0 / _2426;
    int _2478 = as_type<int>(_2442) + (-2);
    float _2480 = (*spvDescriptorSet0.vp_c10)._m0[20].y * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    float _2482 = float(uint(_2474));
    float _2484 = as_type<float>(_2478) * _2468;
    int _2486 = ~_2262;
    int _2488 = _2486 + 1;
    float _2490 = trunc(_2446);
    float _2492 = precise::max(_2490, 0.0);
    uint _2494 = uint(_2492);
    int _2496 = _2450 * int(_2462);
    int _2498 = _2496 + _2394;
    float _2500 = fma((*spvDescriptorSet0.vp_c10)._m0[20].x, (*spvDescriptorSet0.vp_c10)._m0[20].x, _2480);
    float _2502 = as_type<float>(_2388) * _2482;
    float _2504 = _834 + _836;
    float _2506 = float(uint(_2498));
    float _2508 = trunc(_2454);
    float _2510 = precise::max(_2508, 0.0);
    uint _2512 = uint(_2510);
    int _2514 = as_type<int>(_2476) + (-2);
    float _2516 = _2504 + (-1.0);
    int _2518 = ~_2332;
    int _2520 = _2518 + 1;
    float _2522 = as_type<float>(_2408) * _2506;
    bool _2524 = _2380 > 0.0;
    float _2526 = as_type<float>(_2514) * _2470;
    bool _2528 = _2380 >= 0.0;
    bool _2530 = isnan(_2380);
    bool _2532 = _2528 || _2530;
    bool _2534 = isnan(0.0);
    bool _2536 = _2532 || _2534;
    int _2538 = _2488 * int(_2494);
    int _2540 = _2538 + _2416;
    float _2542 = trunc(_2502);
    float _2544 = precise::max(_2542, 0.0);
    uint _2546 = uint(_2544);
    bool _2548 = _836 > 0.5;
    float _2550 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2552 = _2550 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2554 = float(uint(_2540));
    int _2556 = _2520 * int(_2512);
    int _2558 = _2556 + _2434;
    float _2560 = trunc(_2526);
    float _2562 = precise::max(_2560, 0.0);
    uint _2564 = uint(_2562);
    float _2566 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2568 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2566;
    float _2570 = as_type<float>(_2436) * _2554;
    float _2572 = _836 + _838;
    float _2574 = float(uint(_2558));
    int _2576 = ~_2418;
    int _2578 = _2576 + 1;
    float _2580 = _2572 + (-1.0);
    float _2582 = trunc(_2484);
    float _2584 = precise::max(_2582, 0.0);
    uint _2586 = uint(_2584);
    float _2588 = as_type<float>(_2440) * _2574;
    bool _2590 = _838 > 0.5;
    float _2592 = fma(_2580, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2594 = trunc(_2522);
    float _2596 = precise::max(_2594, 0.0);
    uint _2598 = uint(_2596);
    int _2600 = _2578 * int(_2564);
    int _2602 = _2600 + _2452;
    int _2604 = ~_2390;
    int _2606 = _2604 + 1;
    float _2608 = (*spvDescriptorSet0.vp_c10)._m0[18].y * (*spvDescriptorSet0.vp_c10)._m0[18].y;
    float _2610 = -_181;
    int _2612 = _2548 ? as_type<int>(_2610) : as_type<int>(_181);
    bool _2614 = _884 != 1;
    float _2616 = fma((*spvDescriptorSet0.vp_c10)._m0[18].x, (*spvDescriptorSet0.vp_c10)._m0[18].x, _2608);
    float _2618 = trunc(_2588);
    float _2620 = precise::max(_2618, 0.0);
    uint _2622 = uint(_2620);
    float _2624 = float(uint(_2602));
    int _2626 = _2606 * int(_2586);
    int _2628 = _2626 + _2456;
    int _2630 = int(_2432) + int(_2546);
    float _2632 = _836 * 2.0;
    int _2634 = ~_2186;
    int _2636 = _2634 + 1;
    float _2638 = as_type<float>(_2514) * _2624;
    float _2640 = float(uint(_2628));
    float _2642 = trunc(_2570);
    float _2644 = precise::max(_2642, 0.0);
    uint _2646 = uint(_2644);
    int _2648 = int(_2462) + int(_2598);
    int _2650 = _2636 * _2630;
    int _2652 = _2650 + _2368;
    bool _2654 = !_1914;
    float _2656 = _2654 ? _181 : as_type<float>(_2612);
    float _2658 = as_type<float>(_2478) * _2640;
    int _2660 = ~_2332;
    int _2662 = _2660 + 1;
    bool _2664 = uint(_2652) >= uint(_2186);
    float _2666 = 1.0 / _2552;
    int _2668 = int(_2512) + int(_2622);
    int _2670 = ~_2262;
    int _2672 = _2670 + 1;
    int _2674 = _2662 * _2668;
    int _2676 = _2674 + _2434;
    float _2678 = -_177;
    int _2680 = _2590 ? as_type<int>(_2678) : as_type<int>(_177);
    float _2682 = trunc(_2638);
    float _2684 = precise::max(_2682, 0.0);
    uint _2686 = uint(_2684);
    int _2688 = int(_2494) + int(_2646);
    float _2690 = fma(_2516, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _2692 = !_2664;
    int _2694 = _2692 ? 0 : (-1);
    bool _2696 = uint(_2676) >= uint(_2332);
    int _2698 = _2672 * _2688;
    int _2700 = _2698 + _2416;
    int _2702 = ~_2630;
    int _2704 = _2702 + _2694;
    int _2706 = _2704 + 1;
    float _2708 = floor(_2632);
    float _2710 = _2568 * _2666;
    int _2712 = ~_2230;
    int _2714 = _2712 + 1;
    int _2716 = _2186 * _2706;
    int _2718 = _2716 + _2368;
    bool _2720 = !_1942;
    float _2722 = _2720 ? _177 : as_type<float>(_2680);
    int _2724 = _2714 * _2648;
    int _2726 = _2724 + _2394;
    float _2728 = trunc(_2658);
    float _2730 = precise::max(_2728, 0.0);
    uint _2732 = uint(_2730);
    bool _2734 = !_2696;
    int _2736 = _2734 ? 0 : (-1);
    int _2738 = int(_2564) + int(_2686);
    bool _2740 = _834 > 0.5;
    bool _2742 = _2186 == 0;
    int _2744 = ~_2418;
    int _2746 = _2744 + 1;
    bool _2748 = uint(_2726) >= uint(_2230);
    float _2750 = -_177;
    float _2752 = _2740 ? _2750 : _177;
    bool _2754 = !_2742;
    int _2756 = _2754 ? _2718 : (-1);
    bool _2758 = _2708 > 0.0;
    bool _2760 = _2708 >= 0.0;
    bool _2762 = isnan(_2708);
    bool _2764 = _2760 || _2762;
    bool _2766 = isnan(0.0);
    bool _2768 = _2764 || _2766;
    int _2770 = _2746 * _2738;
    int _2772 = _2770 + _2452;
    bool _2774 = !_2748;
    int _2776 = _2774 ? 0 : (-1);
    int _2778 = int(_2586) + int(_2732);
    int _2780 = ~_2390;
    int _2782 = _2780 + 1;
    bool _2784 = uint(_2700) >= uint(_2262);
    int _2786 = ~_2648;
    int _2788 = _2786 + _2776;
    int _2790 = _2788 + 1;
    int _2792 = _2782 * _2778;
    int _2794 = _2792 + _2456;
    bool _2796 = !_2080;
    float _2798 = _2796 ? _177 : _2752;
    bool _2800 = uint(_2772) >= uint(_2418);
    int _2802 = _2230 * _2790;
    int _2804 = _2802 + _2394;
    bool _2806 = !_2784;
    int _2808 = _2806 ? 0 : (-1);
    bool _2810 = !_2800;
    int _2812 = _2810 ? 0 : (-1);
    bool _2814 = _2230 == 0;
    float _2816 = as_type<float>(_2790);
    float _2818 = as_type<float>(_2648);
    float _2820 = as_type<float>(_2390);
    float _2822 = _2752;
    float _2824 = _2424;
    float _2826 = as_type<float>(_2186);
    if (!_2614)
    {
        _2816 = _836;
    }
    float _2828 = _2816;
    int _2830 = ~_2688;
    int _2832 = _2830 + _2808;
    int _2834 = _2832 + 1;
    bool _2836 = !_2814;
    int _2838 = _2836 ? _2804 : (-1);
    bool _2840 = uint(_2794) >= uint(_2390);
    float _2842 = _838 * 2.0;
    bool _2844 = _886 != 2;
    int _2846 = _2262 * _2834;
    int _2848 = _2846 + _2416;
    float _2850 = _2828;
    if (!_2614)
    {
        _2818 = _2828;
    }
    float _2852 = _2818;
    float _2854 = _2852;
    if (!_2614)
    {
        _2820 = _838;
    }
    float _2856 = _2820;
    float _2858 = floor(_2842);
    float _2860 = _2856;
    if (!_2614)
    {
        _2822 = _838;
    }
    float _2862 = _2822;
    float _2864 = _2862;
    if (_2614)
    {
        _2854 = _834;
    }
    float _2866 = _2854;
    if (_2614)
    {
        _2850 = _834;
    }
    float _2868 = _2850;
    if (_2614)
    {
        _2860 = _836;
    }
    float _2870 = _2860;
    float _2872 = _2866 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_2614)
    {
        _2864 = _836;
    }
    float _2874 = _2864;
    bool _2876 = _2262 == 0;
    int _2878 = _2368 ^ _2186;
    bool _2880 = !_2876;
    int _2882 = _2880 ? _2848 : (-1);
    bool _2884 = _2230 == 0;
    int _2886 = _2394 ^ _2230;
    uint _2888 = uint(int(uint(_2878) >> uint(31)));
    uint _2890 = uint(int(uint(_2886) >> uint(31)));
    int _2892 = ~_2736;
    int _2894 = _2668 + _2892;
    int _2896 = _2894 + 1;
    int _2898 = ~int(_2888);
    int _2900 = _2898 + 1;
    int _2902 = ~_2812;
    int _2904 = _2738 + _2902;
    int _2906 = _2904 + 1;
    int _2908 = ~int(_2890);
    int _2910 = _2908 + 1;
    int _2912 = _2896 ^ _2900;
    int _2914 = _2906 ^ _2910;
    float _2916 = fma((*spvDescriptorSet0.vp_c10)._m0[18].z, (*spvDescriptorSet0.vp_c10)._m0[18].z, _2616);
    bool _2918 = !_2840;
    int _2920 = _2918 ? 0 : (-1);
    bool _2922 = _2186 == 0;
    float _2924 = fma((*spvDescriptorSet0.vp_c10)._m0[19].z, (*spvDescriptorSet0.vp_c10)._m0[19].z, _2424);
    int _2926 = ~_2900;
    int _2928 = _2926 + _2912;
    int _2930 = _2928 + 1;
    float _2932 = sqrt(_2916);
    int _2934 = ~_2910;
    int _2936 = _2934 + _2914;
    int _2938 = _2936 + 1;
    float _2940 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2942 = _709 + _2940;
    if (_2844)
    {
        _2824 = _834;
    }
    float _2944 = _2824;
    float _2946 = _2944;
    if (_2844)
    {
        _2826 = _836;
    }
    float _2948 = _2826;
    float _2950 = fma(_2710, _2942, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _2952 = sqrt(_2924);
    float _2954 = _2948;
    if (!_2844)
    {
        _2946 = _838;
    }
    float _2956 = _2946;
    if (!_2844)
    {
        _2954 = _834;
    }
    float _2958 = _2954;
    float _2960 = fma((*spvDescriptorSet0.vp_c10)._m0[20].z, (*spvDescriptorSet0.vp_c10)._m0[20].z, _2500);
    bool _2962 = !_2922;
    int _2964 = _2962 ? _2930 : (-1);
    bool _2966 = !_2884;
    int _2968 = _2966 ? _2938 : (-1);
    float _2970 = _2932 * _2142;
    int _2972 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2974 = _2972 != 0;
    int _2976 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2978 = _2976 != 0;
    int _2980 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2982 = _2980 != 0;
    float _2984 = _2958 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    bool _2986 = _709 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2988 = isnan(_709);
    bool _2990 = _2986 || _2988;
    bool _2992 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2994 = _2990 || _2992;
    float _2996 = float(_2994);
    bool _2998 = _709 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _3000 = isnan(_709);
    bool _3002 = _2998 || _3000;
    bool _3004 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _3006 = _3002 || _3004;
    float _3008 = float(_3006);
    bool _3010 = !_2974;
    int _3012 = _3010 ? 0 : 1;
    float _3014 = -_2996;
    float _3016 = _3014 + 1.0;
    bool _3018 = _2858 >= 0.0;
    bool _3020 = isnan(_2858);
    bool _3022 = _3018 || _3020;
    bool _3024 = isnan(0.0);
    bool _3026 = _3022 || _3024;
    float _3028 = sqrt(_2960);
    float _3030 = _2952 * _2206;
    int _3032 = _3026 ? 0 : 1;
    bool _3034 = _2858 > 0.0;
    float _3036 = _3008 * _3016;
    float _3038 = -_3008;
    float _3040 = _3038 + 1.0;
    float _3042 = _2152 + (*spvDescriptorSet0.vp_c10)._m0[17].z;
    float _3044 = _2950 * _3036;
    float _3046 = _3030 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _3048 = ~_3032;
    int _3050 = _3048 + 1;
    int _3052 = _3050 + 1;
    float _3054 = fma(_3040, (*spvDescriptorSet0.vp_c9)._m0[131].x, _3044);
    float _3056 = _3028 * _3042;
    int _3058 = _2416 ^ _2262;
    float _3060 = _3030 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _3062 = _3052;
    if (!_3034)
    {
        int _3064 = ~_3032;
        int _3066 = _3064 + 1;
        _3062 = _3066;
    }
    int _3068 = _3062;
    float _3070 = fma(_2996, (*spvDescriptorSet0.vp_c9)._m0[132].x, _3054);
    float _3072 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _3074 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _3076 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _3078 = _3070 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _3080 = _3072 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3082 = _3074 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3084 = _3076 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3086 = fma(_2970, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3046);
    uint _3088 = uint(int(uint(_3058) >> uint(31)));
    float _3090 = fma(_2970, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3060);
    out.m_64.x = _3080;
    out.m_64.y = _3082;
    out.m_64.z = _3084;
    out.m_64.w = _3078;
    float _3092 = fma(_3056, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3086);
    int _3094 = ~int(_3088);
    int _3096 = _3094 + 1;
    float _3098 = _3030 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3100 = fma(_3056, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3090);
    float _3102 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _3104 = fma(_2238, (*spvDescriptorSet0.vp_c8)._m0[25].w, _3092);
    float _3106 = _2956 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _3108 = fma(_2970, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3098);
    float _3110 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _3112 = abs(_3012);
    float _3114 = -_3102;
    float _3116 = fma(_3106, 2.0, _3114);
    bool _3118 = _2262 == 0;
    float _3120 = fma(_3056, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3108);
    float _3122 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _3124 = _2870 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _3126 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _3128 = fma(_2868, (*spvDescriptorSet0.vp_c9)._m0[83].z, _3122);
    int _3130 = ~_2920;
    int _3132 = _2778 + _3130;
    int _3134 = _3132 + 1;
    float _3136 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _3138 = -_141;
    float _3140 = fma(_3138, (*spvDescriptorSet0.vp_c9)._m0[86].x, _3116);
    int _3142 = _3134 ^ _3096;
    float _3144 = fma(_2874, (*spvDescriptorSet0.vp_c9)._m0[83].w, _3136);
    float _3146 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _3148 = ~_3096;
    int _3150 = _3148 + _3142;
    int _3152 = _3150 + 1;
    float _3154 = _3104 + (*spvDescriptorSet0.vp_c10)._m0[21].y;
    float _3156 = float(_3068);
    float _3158 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _3160 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _3162 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _3164 = float(_3112);
    float _3166 = fma(_2984, -2.0, _3158);
    float _3168 = -_3160;
    float _3170 = fma(_2872, 2.0, _3168);
    float _3172 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _3174 = float(_2756);
    float _3176 = _3110 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _3178 = float(_2882);
    float _3180 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _3182 = float(_2838);
    float _3184 = _3126 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _3186 = -_141;
    float _3188 = fma(_3186, (*spvDescriptorSet0.vp_c9)._m0[81].x, _3170);
    float _3190 = fma(_3124, -2.0, _3172);
    float _3192 = fma(_3176, _3174, _2272);
    float _3194 = float(_2968);
    float _3196 = fma(_3184, _3182, _3188);
    float _3198 = _3162 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _3200 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _3202 = float(_2964);
    float _3204 = _2722 + 0.5;
    float _3206 = fma(_3198, _3178, _3140);
    float _3208 = _3146 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _3210 = _2798 + 0.5;
    float _3212 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2180);
    float _3214 = fma(_3184, _3204, _3196);
    float _3216 = fma(_3176, _3210, _3192);
    float _3218 = -_3212;
    float _3220 = fma(_3208, _3202, _3218);
    float _3222 = _3180 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _3224 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[81].y, _3190);
    bool _3226 = !_3118;
    int _3228 = _3226 ? _3152 : (-1);
    float _3230 = _1020 + 0.5;
    float _3232 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[86].y, _3166);
    float _3234 = -_3224;
    float _3236 = fma(_3222, _3194, _3234);
    float _3238 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _3240 = float(_3228);
    float _3242 = _3200 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _3244 = fma(_834, (*spvDescriptorSet0.vp_c9)._m0[78].z, _3238);
    float _3246 = fma(_3198, _3230, _3206);
    float _3248 = -_3232;
    float _3250 = fma(_3242, _3240, _3248);
    float _3252 = fma(_2238, (*spvDescriptorSet0.vp_c8)._m0[24].w, _3100);
    float _3254 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _3256 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[77].z, _3244);
    float _3258 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[82].z, _3128);
    float _3260 = fma(_2238, (*spvDescriptorSet0.vp_c8)._m0[26].w, _3120);
    float _3262 = fma(_836, (*spvDescriptorSet0.vp_c9)._m0[78].w, _3254);
    float _3264 = -_3256;
    float _3266 = _3264 + 1.0;
    float _3268 = _3252 + (*spvDescriptorSet0.vp_c10)._m0[21].x;
    float _3270 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3272 = _3154 + _3270;
    float _3274 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[77].w, _3262);
    float _3276 = -_3266;
    float _3278 = fma(_2798, _3276, _3216);
    float _3280 = _2656 + (-0.5);
    float _3282 = -_3258;
    float _3284 = _3282 + 1.0;
    float _3286 = _3260 + (*spvDescriptorSet0.vp_c10)._m0[21].z;
    float _3288 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3290 = _3268 + _3288;
    float _3292 = _3272 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3294 = -_3208;
    float _3296 = fma(_3294, _3280, _3220);
    float _3298 = -_3274;
    float _3300 = _3298 + 1.0;
    float _3302 = -_3284;
    float _3304 = fma(_2722, _3302, _3214);
    float _3306 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _3308 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _3310 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3312 = _3286 + _3310;
    float _3314 = fma(_3290, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3292);
    float _3316 = fma(_2656, _3300, _3296);
    float _3318 = _1192 + (-0.5);
    float _3320 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _3322 = log2(_3320);
    float _3324 = fma(_834, (*spvDescriptorSet0.vp_c9)._m0[88].z, _3306);
    float _3326 = fma(_836, (*spvDescriptorSet0.vp_c9)._m0[88].w, _3308);
    float _3328 = fma(_3312, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3314);
    float _3330 = -_3222;
    float _3332 = fma(_3330, _3318, _3236);
    float _3334 = _3272 * _3272;
    float _3336 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[87].z, _3324);
    float _3338 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[87].w, _3326);
    float _3340 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[82].w, _3144);
    float _3342 = _1024 + (-0.5);
    bool _3344 = _3328 >= 0.0;
    float _3346 = fma(_3290, _3290, _3334);
    float _3348 = -_3336;
    float _3350 = _3348 + 1.0;
    float _3352 = -_3340;
    float _3354 = _3352 + 1.0;
    float _3356 = -_3338;
    float _3358 = _3356 + 1.0;
    float _3360 = -_3242;
    float _3362 = fma(_3360, _3342, _3250);
    float _3364 = fma(_3312, _3312, _3346);
    float _3366 = -_3350;
    float _3368 = fma(_1020, _3366, _3246);
    float _3370 = fma(_1192, _3354, _3332);
    float _3372 = fma(_1024, _3358, _3362);
    float _3374 = in.m_66.x;
    float _3376 = in.m_66.y;
    float _3378 = in.m_66.z;
    float _3380 = _3322 * _141;
    bool _3382 = !_2978;
    int _3384 = _3382 ? 0 : 1;
    float _3386 = rsqrt(_3364);
    bool _3388 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3390 = isnan(1.0);
    bool _3392 = _3388 || _3390;
    bool _3394 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3396 = _3392 || _3394;
    float _3398 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _3400 = 1.0 + _3398;
    float _3402 = _3342;
    int _3404 = as_type<int>(_3336);
    float _3406 = _3268;
    if (_3344)
    {
        _3402 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3408 = _3402;
    out.m_68.x = _3278;
    out.m_68.y = _3316;
    out.m_68.z = _3304;
    out.m_68.w = _3370;
    float _3410 = _3164 * _3156;
    float _3412 = exp2(_3380);
    if (_3344)
    {
        float _3414 = _3408 * 5.0;
        _3404 = as_type<int>(_3414);
    }
    int _3416 = _3404;
    out.m_70.x = _3368;
    out.m_70.y = _3372;
    bool _3418 = !_2982;
    int _3420 = _3418 ? 0 : 1;
    bool _3422 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3424 = isnan(0.0);
    bool _3426 = _3422 || _3424;
    bool _3428 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3430 = _3426 || _3428;
    if (_3344)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9899 = as_type<float>(_3416);
        out.gl_Position.z = _9899;
    }
    float _3432 = 1.0 / _3400;
    float _3434 = _3272 * _3386;
    if (_3344)
    {
        out.m_51.x = 0.0;
    }
    float _3436 = _3290 * _3386;
    if (_3344)
    {
        return out;
    }
    float _3438 = -_3434;
    float _3440 = fma(_3438, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3154);
    float _3442 = _3312 * _3386;
    float _3444 = -_3436;
    float _3446 = fma(_3444, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3268);
    float _3448 = -_3412;
    float _3450 = _3448 + 1.0;
    float _3452 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3454 = _3440 + _3452;
    float _3456 = -_3442;
    float _3458 = fma(_3456, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3286);
    float _3460 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3462 = _3446 + _3460;
    int _3464 = _2536 ? 0 : 1;
    float _3466 = _3454 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3468 = _3430 ? _3450 : 0.0;
    float _3470 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3472 = _3458 + _3470;
    int _3474 = ~_3464;
    int _3476 = _3474 + 1;
    int _3478 = _3476 + 1;
    float _3480 = fma(_3462, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3466);
    float _3482 = _3410 * (-2.0);
    int _3484 = _3478;
    if (!_2524)
    {
        int _3486 = ~_3464;
        int _3488 = _3486 + 1;
        _3484 = _3488;
    }
    int _3490 = _3484;
    float _3492 = -_3434;
    float _3494 = fma(_3492, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3272);
    float _3496 = fma(_3472, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3480);
    int _3498 = abs(_3384);
    if (_3396)
    {
        float _3500 = _3468 * _3432;
        _145 = _3500;
    }
    float _3502 = _145;
    float _3504 = fma(_2690, _3482, _2690);
    float _3506 = fma(_3482, _3374, _3374);
    float _3508 = _834 + (-0.5);
    float _3510 = float(_3490);
    float _3512 = -_3436;
    float _3514 = fma(_3512, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3290);
    float _3516 = float(_3498);
    float _3518 = _3494 * _3494;
    bool _3520 = _3496 >= 0.0;
    float _3522 = fma(_3508, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3506);
    float _3524 = -_3442;
    float _3526 = fma(_3524, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3312);
    float _3528 = fma(_3514, _3514, _3518);
    float _3530 = _3516 * _3510;
    int _3532 = _2768 ? 0 : 1;
    float _3534 = fma(_3504, _3502, _3522);
    float _3536 = fma(_3526, _3526, _3528);
    float _3538 = _3530 * (-2.0);
    int _3540 = ~_3532;
    int _3542 = _3540 + 1;
    int _3544 = _3542 + 1;
    float _3546 = _3534 * 0.15915493667125701904296875;
    int _3548 = _3544;
    float _3550 = _3510;
    if (!_2758)
    {
        int _3552 = ~_3532;
        int _3554 = _3552 + 1;
        _3548 = _3554;
    }
    int _3556 = _3548;
    float _3558 = fma(_2592, _3538, _2592);
    if (_3520)
    {
        _3550 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3560 = _3550;
    float _3562 = fma(_3538, _3376, _3376);
    float _3564 = sqrt(_3536);
    int _3566 = as_type<int>(_3560);
    if (_3520)
    {
        out.m_51.x = 0.0;
    }
    if (_3520)
    {
        float _3568 = _3560 * 5.0;
        _3566 = as_type<int>(_3568);
    }
    int _3570 = _3566;
    float _3572 = _836 + (-0.5);
    int _3574 = abs(_3420);
    float _3576 = _3546 * 6.283185482025146484375;
    float _3578 = sin(_3576);
    if (_3520)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _10141 = as_type<float>(_3570);
        out.gl_Position.z = _10141;
    }
    if (_3520)
    {
        return out;
    }
    float _3580 = -_3154;
    float _3582 = _3580 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3584 = -_3268;
    float _3586 = _3584 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3588 = float(_3556);
    float _3590 = -_3286;
    float _3592 = _3590 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3594 = _3582 * _3582;
    float _3596 = float(_3574);
    float _3598 = fma(_3572, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3562);
    float _3600 = _834 + _838;
    float _3602 = fma(_3586, _3586, _3594);
    float _3604 = _3596 * _3588;
    float _3606 = fma(_3558, _3502, _3598);
    float _3608 = fma(_3592, _3592, _3602);
    float _3610 = _3600 + (-1.0);
    float _3612 = _3604 * (-2.0);
    float _3614 = _3606 * 0.15915493667125701904296875;
    float _3616 = _838 + (-0.5);
    float _3618 = fma(_3610, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3620 = rsqrt(_3608);
    float _3622 = fma(_3612, _3378, _3378);
    float _3624 = _567 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3626 = fma(_3618, _3612, _3618);
    float _3628 = _565 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _3630 = fma(_3616, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3622);
    float _3632 = _3546 * 6.283185482025146484375;
    float _3634 = cos(_3632);
    float _3636 = fma(_3626, _3502, _3630);
    float _3638 = _3636 * 0.15915493667125701904296875;
    float _3640 = _3586 * _3620;
    float _3642 = _3592 * _3620;
    float _3644 = _3582 * _3620;
    float _3646 = _3614 * 6.283185482025146484375;
    float _3648 = sin(_3646);
    float _3650 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _3652 = _3640 * _3650;
    float _3654 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3656 = _3642 * _3654;
    float _3658 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _3660 = -_3652;
    float _3662 = fma(_3642, _3658, _3660);
    float _3664 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _3666 = _3644 * _3664;
    float _3668 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _3670 = -_3656;
    float _3672 = fma(_3644, _3668, _3670);
    float _3674 = _3614 * 6.283185482025146484375;
    float _3676 = cos(_3674);
    float _3678 = _3662 * _3662;
    float _3680 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3682 = -_3666;
    float _3684 = fma(_3640, _3680, _3682);
    float _3686 = _3386 * _3564;
    float _3688 = fma(_3672, _3672, _3678);
    float _3690 = _3686 * _3628;
    float _3692 = _3638 * 6.283185482025146484375;
    float _3694 = cos(_3692);
    float _3696 = fma(_3684, _3684, _3688);
    float _3698 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _181);
    float _3700 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _177);
    float _3702 = _3578 * _3648;
    float _3704 = _3634 * _3648;
    float _3706 = _3686 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _3708 = _3706 * 0.5;
    float _3710 = _3700 * _3690;
    float _3712 = _3638 * 6.283185482025146484375;
    float _3714 = sin(_3712);
    float _3716 = _3634 * _3676;
    float _3718 = _3578 * _3676;
    float _3720 = _181 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3722 = rsqrt(_3696);
    float _3724 = _3634 * _3694;
    float _3726 = _3578 * _3694;
    float _3728 = _3648 * _3694;
    float _3730 = fma(_3714, _3716, _3702);
    float _3732 = _3686 * _3624;
    float _3734 = fma(_3714, _3702, _3716);
    float _3736 = _3676 * _3694;
    float _3738 = -_3704;
    float _3740 = fma(_3714, _3718, _3738);
    float _3742 = _3698 * _3732;
    float _3744 = -_3718;
    float _3746 = fma(_3714, _3704, _3744);
    float _3748 = _3672 * _3722;
    float _3750 = _3662 * _3722;
    float _3752 = _3724 * _3742;
    float _3754 = _3684 * _3722;
    float _3756 = -_3742;
    float _3758 = _3714 * _3756;
    float _3760 = _3642 * _3750;
    float _3762 = fma(_3730, _3710, _3752);
    float _3764 = _3644 * _3748;
    float _3766 = _3726 * _3742;
    float _3768 = fma(_3736, _3710, _3758);
    float _3770 = fma(_3746, _3708, _3762);
    float _3772 = -_3760;
    float _3774 = fma(_3644, _3754, _3772);
    float _3776 = -_3764;
    float _3778 = fma(_3640, _3750, _3776);
    float _3780 = fma(_3740, _3710, _3766);
    float _3782 = fma(_3728, _3708, _3768);
    float _3784 = _3774 * _3770;
    float _3786 = _3778 * _3770;
    float _3788 = fma(_3734, _3708, _3780);
    float _3790 = _3730 * _3774;
    float _3792 = fma(_3748, _3782, _3784);
    float _3794 = fma(_3754, _3782, _3786);
    float _3796 = _3730 * _3778;
    float _3798 = _3724 * _3774;
    float _3800 = fma(_3640, _3788, _3792);
    float _3802 = fma(_3642, _3788, _3794);
    float _3804 = _3640 * _3754;
    float _3806 = _3724 * _3778;
    float _3808 = _3268 + _3800;
    float _3810 = _3286 + _3802;
    float _3812 = -_3804;
    float _3814 = fma(_3642, _3748, _3812);
    float _3816 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3818 = _3808 + _3816;
    float _3820 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3822 = _3810 + _3820;
    float _3824 = _3730 * _3814;
    float _3826 = _3724 * _3814;
    float _3828 = _3818 * _3818;
    float _3830 = _3822 * _3822;
    float _3832 = _3746 * _3814;
    float _3834 = _3814 * _3770;
    float _3836 = fma(_3736, _3748, _3790);
    float _3838 = _3828 + _3830;
    float _3840 = _3746 * _3774;
    float _3842 = fma(_3720, _3720, 1.0);
    float _3844 = _3746 * _3778;
    float _3846 = sqrt(_3838);
    float _3848 = fma(_3736, _3750, _3824);
    float _3850 = fma(_3736, _3754, _3796);
    float _3852 = fma(_3750, _3782, _3834);
    float _3854 = -_3714;
    float _3856 = fma(_3854, _3748, _3798);
    float _3858 = -_3714;
    float _3860 = fma(_3858, _3750, _3826);
    float _3862 = -_3714;
    float _3864 = fma(_3862, _3754, _3806);
    float _3866 = fma(_3644, _3788, _3852);
    float _3868 = rsqrt(_3842);
    float _3870 = fma(_3728, _3748, _3840);
    float _3872 = fma(_3728, _3750, _3832);
    float _3874 = _3154 + _3866;
    float _3876 = fma(_3728, _3754, _3844);
    bool _3878 = _3846 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3880 = _3840;
    float _3882 = _3828;
    float _3884 = _3830;
    float _3886 = _3808;
    float _3888 = _3810;
    if (!_3878)
    {
        _3880 = _3874;
    }
    float _3890 = _3880;
    bool _3892 = !_3878;
    float _3894 = _3890;
    if (!_3892)
    {
        float _3896 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3898 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3900 = _3846 + _3898;
        float _3902 = rsqrt(_3838);
        float _3904 = _3900 * _3896;
        float _3906 = _3874 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3908 = _3904 * 0.15915493667125701904296875;
        float _3910 = _3908 * 6.283185482025146484375;
        float _3912 = sin(_3910);
        float _3914 = _3908 * 6.283185482025146484375;
        float _3916 = cos(_3914);
        float _3918 = fma(_3912, _3906, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3920 = _3902 * _3918;
        float _3922 = _3916 + (-1.0);
        float _3924 = fma(_3818, _3920, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3926 = fma(_3822, _3920, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _3928 = _3922 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3930 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _3932 = _3924 + _3930;
        float _3934 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _3936 = _3926 + _3934;
        float _3938 = fma(_3874, _3916, _3928);
        float _3940 = _3932 * _3932;
        float _3942 = _3936 * _3936;
        _3894 = _3938;
        _3882 = _3940;
        _3884 = _3942;
        _3886 = _3924;
        _3888 = _3926;
    }
    float _3944 = _3894;
    float _3946 = _3882;
    float _3948 = _3884;
    float _3950 = _3886;
    float _3952 = _3888;
    float _3954 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _3956 = _3944 + _3954;
    float _3958 = fma(_3726, _3640, _3856);
    float _3960 = fma(_3726, _3644, _3860);
    float _3962 = fma(_3726, _3642, _3864);
    float _3964 = fma(_3956, _3956, _3946);
    float _3966 = fma(_3734, _3640, _3870);
    float _3968 = fma(_3734, _3644, _3872);
    float _3970 = fma(_3734, _3642, _3876);
    float _3972 = _3964 + _3948;
    float _3974 = _3720 * _3868;
    float _3976 = fma(_3740, _3640, _3836);
    float _3978 = _177 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3980 = _3720 * _3958;
    float _3982 = _3720 * _3960;
    float _3984 = fma(_3740, _3644, _3848);
    float _3986 = fma(_3740, _3642, _3850);
    float _3988 = _3720 * _3962;
    float _3990 = -_3966;
    float _3992 = _3974 * _3990;
    float _3994 = -_3968;
    float _3996 = _3974 * _3994;
    float _3998 = -_3970;
    float _4000 = _3974 * _3998;
    float _4002 = sqrt(_3972);
    float _4004 = fma(_3978, _3976, _3980);
    float _4006 = fma(_3978, _3984, _3982);
    float _4008 = fma(_3978, _3986, _3988);
    float _4010 = fma(_3868, _3958, _3992);
    float _4012 = fma(_3868, _3960, _3996);
    float _4014 = fma(_3868, _3962, _4000);
    float _4016 = _3966 + _4004;
    float _4018 = _3968 + _4006;
    float _4020 = _3970 + _4008;
    out.m_72.x = _3976;
    out.m_72.y = _3984;
    out.m_72.z = _3986;
    out.m_74.x = _4010;
    out.m_74.y = _4012;
    out.m_74.z = _4014;
    bool _4022 = _4002 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _4024 = isnan(_4002);
    bool _4026 = _4022 || _4024;
    bool _4028 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _4030 = _4026 || _4028;
    out.m_76.x = _4016;
    out.m_76.y = _4018;
    out.m_76.z = _4020;
    float _4032 = _4006;
    float _4034 = _3982;
    float _4036 = _4008;
    if (!_4030)
    {
        _4032 = 1.0;
    }
    float _4038 = _4032;
    bool _4040 = !_4030;
    float _4042 = _4038;
    if (!_4040)
    {
        bool _4044 = _4002 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _4046 = isnan(_4002);
        bool _4048 = _4044 || _4046;
        bool _4050 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _4052 = _4048 || _4050;
        if (!_4052)
        {
            float _4054 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4056 = _4002 + _4054;
            float _4058 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4060 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _4058;
            float _4062 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _4064 = _4062 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _4066 = 1.0 / _4060;
            float _4068 = _4056 * _4066;
            float _4070 = fma(_4068, _4064, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _4042 = _4070;
            _4072 = true;
        }
        else
        {
            bool _4074 = _4002 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _4076 = isnan(_4002);
            bool _4078 = _4074 || _4076;
            bool _4080 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _4082 = _4078 || _4080;
            if (!_4082)
            {
                float _4084 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4086 = _4002 + _4084;
                float _4088 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4090 = _4088 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _4092 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _4094 = _4092 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _4096 = 1.0 / _4090;
                float _4098 = _4086 * _4096;
                float _4100 = fma(_4098, _4094, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _4042 = _4100;
                _4072 = true;
            }
            else
            {
                _4042 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _4072 = false;
    float _4102 = _4042;
    float _4104 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _4106 = _3950 + _4104;
    float _4108 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _4110 = _3952 + _4108;
    bool _4112 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _4114 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _4116 = _4112 || _4114;
    bool _4118 = isnan(0.5);
    bool _4120 = _4116 || _4118;
    float _4122 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _4124 = _3944 + _4122;
    float _4126 = fma(_4106, _4102, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _4128 = fma(_4110, _4102, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _4130 = fma(_4124, _4102, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _4132 = -_3436;
    float _4134 = fma(_4132, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4126);
    float _4136 = -_3442;
    float _4138 = fma(_4136, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4128);
    float _4140 = -_3434;
    float _4142 = fma(_4140, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4130);
    float _4144 = _4142;
    float _4146 = _4134;
    float _4148 = _4138;
    if (!_4120)
    {
        float _4150 = _3454 * _3454;
        float _4152 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _4154 = -_3286;
        float _4156 = _4154 + _4128;
        float _4158 = -_3268;
        float _4160 = _4158 + _4126;
        float _4162 = fma(_3462, _3462, _4150);
        float _4164 = -_3154;
        float _4166 = _4164 + _4130;
        float _4168 = fma(_3472, _3472, _4162);
        float _4170 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _4172 = sqrt(_4168);
        float _4174 = 1.0 / _3686;
        float _4176 = _4170 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _4178 = precise::min(_4172, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _4180 = _4178 * _4152;
        float _4182 = _4180 * _4174;
        float _4184 = _4176 * _4182;
        float _4186 = _4156 * _4182;
        float _4188 = fma(_4160, _4184, _3446);
        float _4190 = fma(_4166, _4184, _3440);
        float _4192 = fma(_4176, _4186, _3458);
        _4144 = _4190;
        _4146 = _4188;
        _4148 = _4192;
    }
    float _4194 = _4144;
    float _4196 = _4146;
    float _4198 = _4148;
    float _4200 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4202 = _4194 + _4200;
    float _4204 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4206 = _4196 + _4204;
    float _4208 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4210 = _4198 + _4208;
    float _4212 = _4202 * _4202;
    float _4214 = fma(_4206, _4206, _4212);
    float _4216 = fma(_4210, _4210, _4214);
    float _4218 = rsqrt(_4216);
    float _4220 = sqrt(_4216);
    float _4222 = _4218 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4224 = _4206 * _4222;
    float _4226 = _4210 * _4222;
    float _4228 = _4224 * _4224;
    float _4230 = _4226 * _4226;
    float _4232 = _4228 + _4230;
    float _4234 = sqrt(_4232);
    bool _4236 = _4234 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4238 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4240 = _4234 + _4238;
    float _4242 = _4218;
    float _4244 = _4240;
    float _4246 = _4202;
    if (_4236)
    {
        float _4248 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4242 = _4248;
    }
    float _4250 = _4242;
    if (_4236)
    {
        float _4252 = rsqrt(_4232);
        _4034 = _4252;
    }
    float _4254 = _4034;
    float _4256 = _4254;
    if (_4236)
    {
        float _4258 = _4240 * _4250;
        _4244 = _4258;
    }
    float _4260 = _4244;
    if (_4236)
    {
        float _4262 = _4260 * 0.15915493667125701904296875;
        _3406 = _4262;
    }
    float _4264 = _3406;
    float _4266 = _4250;
    if (_4236)
    {
        float _4268 = _4264 * 6.283185482025146484375;
        float _4270 = sin(_4268);
        _4266 = _4270;
    }
    float _4272 = _4266;
    float _4274 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4276 = precise::max(0.0, _4274);
    float _4278 = _4210;
    float _4280 = _4276;
    if (_4236)
    {
        float _4282 = _4264 * 6.283185482025146484375;
        float _4284 = cos(_4282);
        _4278 = _4284;
    }
    float _4286 = _4278;
    float _4288 = -_4222;
    float _4290 = -_4276;
    float _4292 = fma(_4202, _4288, _4290);
    float _4294 = _4292;
    if (_4236)
    {
        float _4296 = _4292 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4280 = _4296;
    }
    float _4298 = _4280;
    float _4300 = _4272;
    float _4302 = _4298;
    if (_4236)
    {
        float _4304 = fma(_4272, _4298, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4300 = _4304;
    }
    float _4306 = _4300;
    float _4308 = _4306;
    if (!_4236)
    {
        _4302 = _4228;
    }
    float _4310 = _4302;
    float _4312 = _4310;
    float _4314 = _4286;
    if (_4236)
    {
        float _4316 = _4286 + (-1.0);
        _4246 = _4316;
    }
    float _4318 = _4246;
    float _4320 = _4318;
    if (_4236)
    {
        float _4322 = _4254 * _4306;
        _4036 = _4322;
    }
    float _4324 = _4036;
    if (!_4236)
    {
        _4256 = _4224;
    }
    float _4326 = _4256;
    float _4328 = _4326;
    if (_4236)
    {
        float _4330 = _4318 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4320 = _4330;
    }
    float _4332 = _4320;
    if (_4236)
    {
        float _4334 = _4224 * _4324;
        _4328 = _4334;
    }
    float _4336 = _4328;
    if (!_4236)
    {
        _4308 = _4226;
    }
    float _4338 = _4308;
    float _4340 = _4338;
    if (_4236)
    {
        float _4342 = _4226 * _4324;
        _4340 = _4342;
    }
    float _4344 = _4340;
    if (_4236)
    {
        float _4346 = fma(_4292, _4286, _4332);
        _4294 = _4346;
    }
    float _4348 = _4294;
    if (_4236)
    {
        float _4350 = _4336 * _4336;
        _4312 = _4350;
    }
    float _4352 = _4312;
    if (!_4236)
    {
        _4314 = _4230;
    }
    float _4354 = _4314;
    float _4356 = _4354;
    if (_4236)
    {
        float _4358 = _4344 * _4344;
        _4356 = _4358;
    }
    float _4360 = _4356;
    float _4362 = fma(_4348, _4348, _4352);
    float _4364 = _4194 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4366 = _4194 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4368 = _4362 + _4360;
    float _4370 = fma(_4196, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4364);
    float _4372 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4374 = fma(_4220, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4372);
    float _4376 = precise::clamp(_4374, 0.0, 1.0);
    float _4378 = rsqrt(_4368);
    float _4380 = fma(_4198, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4370);
    float _4382 = -_4376;
    float _4384 = _4382 + 1.0;
    float _4386 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4388 = _4380 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4390 = fma(_3446, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _4392 = fma(_4196, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4366);
    float _4394 = abs(_4384);
    float _4396 = log2(_4394);
    float _4398 = _4388 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4400 = _4194 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4402 = fma(_3458, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4404 = -_4398;
    float _4406 = fma(_4404, _4386, 1.0);
    float _4408 = _4194 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4410 = fma(_4196, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4400);
    float _4412 = _4378 * _4336;
    float _4414 = _4378 * _4348;
    float _4416 = fma(_4196, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4408);
    float _4418 = fma(_4198, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4410);
    float _4420 = _4378 * _4344;
    float _4422 = _4412 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4424 = fma(_4198, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4416);
    float _4426 = _4418 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4428 = floor(_4390);
    float _4430 = -_4422;
    float _4432 = fma(_4414, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4430);
    float _4434 = _4424 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4436 = _4426 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4438 = _4396 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4440 = -_4420;
    float _4442 = fma(_4440, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4432);
    float _4444 = fma(_4198, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4392);
    float _4446 = fma(_4434, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4436);
    float _4448 = floor(_4402);
    float _4450 = fma(_4442, -0.5, 0.5);
    float _4452 = _4444 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4454 = fma(_4388, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4446);
    float _4456 = _4426 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4458 = fma(_4442, 0.5, 0.5);
    float _4460 = fma(_4452, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4454);
    float _4462 = exp2(_4438);
    float _4464 = -_4428;
    float _4466 = _4390 + _4464;
    float _4468 = fma(_4434, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4456);
    float _4470 = _4414 + 1.0;
    float _4472 = fma(_4388, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4468);
    float _4474 = log2(_4406);
    float _4476 = _4426 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4478 = -_4448;
    float _4480 = _4402 + _4478;
    float _4482 = fma(_4458, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4484 = fma(_4452, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4472);
    float _4486 = fma(_4434, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4476);
    float _4488 = fma(_4458, _4482, -0.212114393711090087890625);
    float _4490 = 1.0 / _4460;
    float _4492 = fma(_4388, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4486);
    float _4494 = -_4414;
    float _4496 = fma(_4462, _4470, _4494);
    float _4498 = sqrt(_4450);
    float _4500 = fma(_4452, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4492);
    float _4502 = _4474 * 0.693147182464599609375;
    float2 _11649 = float2(_4466, _4480);
    float _4504 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_11649, float2(0.0), isnan(_11649)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_11649, float2(0.0), isnan(_11649)), level(0.0)).x;
    float _4506 = fma(_4458, _4488, 1.570728778839111328125);
    float _4508 = fma(_4496, 0.5, 0.5);
    float _4510 = _4502 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4512 = _4484 * _4490;
    float _4514 = _4500 * _4490;
    float _4516 = fma(_4512, 0.5, 0.5);
    float _4518 = fma(_4514, -0.5, 0.5);
    float _4520 = _4498 * 0.636619746685028076171875;
    float3 _11683 = float3(_4516, _4518, _4510);
    float _4522 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_11683, float3(0.0), isnan(_11683)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_11683, float3(0.0), isnan(_11683)), level(0.0)).x;
    float3 _11694 = float3(_4516, _4518, _4510);
    float4 _4525 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_11694, float3(0.0), isnan(_11694)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_11694, float3(0.0), isnan(_11694)), level(0.0)).xyzw;
    float _4527 = _4525.x;
    float _4529 = _4525.y;
    float _4531 = _4525.z;
    float _4533 = _4525.w;
    float _4535 = -_4506;
    float _4537 = fma(_4520, _4535, 1.0);
    float2 _11715 = float2(_4537, _4508);
    float3 _4541 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_11715, float2(0.0), isnan(_11715)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_11715, float2(0.0), isnan(_11715)), level(0.0)).xyz;
    float _4543 = _4541.x;
    float _4545 = _4541.y;
    float _4547 = _4541.z;
    float _4549 = _3440 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4551 = _3440 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _4553 = _4426 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _4555 = _4220 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4557 = isnan(_4220);
    bool _4559 = _4555 || _4557;
    bool _4561 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4563 = _4559 || _4561;
    float _4565 = fma(_3446, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4549);
    float _4567 = fma(_3446, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4551);
    float _4569 = fma(_4434, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4553);
    float _4571 = fma(_3458, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4565);
    float _4573 = fma(_3458, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4567);
    float _4575 = _4396 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4577 = _4571 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4579 = _4573 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4581 = fma(_4388, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4569);
    float _4583 = 1.0 / _4577;
    float _4585 = _4579 + _4577;
    float _4587 = fma(_4452, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4581);
    float _4589 = _4587 + _4460;
    float _4591 = exp2(_4575);
    out.gl_Position.x = _4484;
    out.gl_Position.y = _4500;
    out.gl_Position.z = _4587;
    out.gl_Position.w = _4460;
    float _4593 = _4589 * 0.5;
    float _4595 = _4585 * _4583;
    float _4597 = _4595 * 0.5;
    float _4599 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _4601 = fma(_4597, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4599);
    float _4603 = _4587;
    float _4605 = _4500;
    float _4607 = _4484;
    float _4609 = _4460;
    if (!_4563)
    {
        _4603 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4611 = _4603;
    float _4613 = -_4591;
    float _4615 = _4613 + 1.0;
    float _4617 = _4611;
    float _4619 = _4611;
    if (!_4563)
    {
        _4605 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _4621 = _4605;
    float _4623 = 1.0 / _4601;
    float _4625 = _4621;
    float _4627 = _4621;
    if (!_4563)
    {
        _4607 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4629 = _4607;
    float _4631 = _4615 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _4633 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4635 = _4623 * _4633;
    float _4637 = abs(_4635);
    float _4639 = log2(_4637);
    bool _4641 = _4635 <= 8000.0;
    bool _4643 = isnan(_4635);
    bool _4645 = _4641 || _4643;
    bool _4647 = isnan(8000.0);
    bool _4649 = _4645 || _4647;
    float _4651 = float(_4649);
    float _4653 = _4639 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _4655 = exp2(_4653);
    float _4657 = fma(_4655, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4659 = precise::clamp(_4657, 0.0, 1.0);
    float _4661 = fma(_4659, -2.0, 3.0);
    float _4663 = _4659 * _4659;
    float _4665 = in.m_78.x;
    float _4667 = _4663 * _4661;
    float _4669 = -_4667;
    float _4671 = _4669 + 1.0;
    float _4673 = fma(_4671, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4667);
    float _4675 = _4629;
    float _4677 = _4629;
    if (!_4563)
    {
        _4609 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4679 = _4609;
    float _4681 = _4651 * _4673;
    out.m_80.z = _4593;
    out.m_80.w = _4460;
    float _4683 = _4681 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _4685 = -_4504;
    float _4687 = _4685 + 1.0;
    float _4689 = _4687 * _4683;
    float _4691 = precise::clamp(_4689, 0.0, 1.0);
    float _4693 = -_4691;
    float _4695 = fma(_4693, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4697 = _4695 * _4665;
    float _4699 = _4631 * _4522;
    float _4701 = -_4631;
    float _4703 = _4701 + 1.0;
    float _4705 = _4697 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _4707 = _4533 * _4699;
    float _4709 = _4533 * _4703;
    out.m_82.x = _4705;
    float _4711 = _4547 * _4699;
    float _4713 = fma(_4543, _4707, _4527);
    float _4715 = fma(_4545, _4707, _4529);
    float _4717 = _4707;
    float _4719 = _4527;
    float _4721 = _4679;
    float _4723 = _4679;
    if (!_4563)
    {
        _4717 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4725 = _4717;
    float _4727 = fma(_4533, _4711, _4531);
    float _4729 = _4725;
    float _4731 = _4725;
    if (!_4563)
    {
        _4719 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4733 = _4719;
    out.m_84.x = _4713;
    out.m_84.y = _4715;
    out.m_84.z = _4727;
    out.m_84.w = _4709;
    bool _4735 = !_4563;
    float _4737 = _4733;
    float _4739 = _4733;
    if (!_4735)
    {
        bool _4741 = _4220 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4743 = isnan(_4220);
        bool _4745 = _4741 || _4743;
        bool _4747 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4749 = _4745 || _4747;
        if (!_4749)
        {
            float _4751 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4753 = _4220 + _4751;
            float _4755 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4757 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4755;
            float _4759 = 1.0 / _4757;
            float _4761 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4763 = _4761 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4765 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4767 = _4765 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4769 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _4771 = _4769 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4773 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4775 = _4773 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4777 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4779 = _4777 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4781 = _4753 * _4759;
            float _4783 = precise::clamp(_4781, 0.0, 1.0);
            float _4785 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4787 = _4785 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4789 = fma(_4783, _4763, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4791 = fma(_4783, _4787, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4793 = fma(_4783, _4767, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4795 = fma(_4783, _4771, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4797 = fma(_4783, _4775, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4799 = fma(_4783, _4779, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _4739 = _4791;
            _4627 = _4797;
            _4731 = _4789;
            _4619 = _4795;
            _4723 = _4793;
            _4677 = _4799;
            _4801 = true;
        }
        else
        {
            bool _4803 = _4220 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4805 = isnan(_4220);
            bool _4807 = _4803 || _4805;
            bool _4809 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4811 = _4807 || _4809;
            if (!_4811)
            {
                _4729 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4813 = _4729;
            _4731 = _4813;
            if (!_4811)
            {
                _4737 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4815 = _4737;
            _4739 = _4815;
            if (!_4811)
            {
                _4721 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4817 = _4721;
            _4723 = _4817;
            if (!_4811)
            {
                _4617 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4819 = _4617;
            _4619 = _4819;
            if (!_4811)
            {
                _4625 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4821 = _4625;
            _4627 = _4821;
            if (!_4811)
            {
                _4675 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4823 = _4675;
            bool _4825 = !_4811;
            _4677 = _4823;
            if (!_4825)
            {
                bool _4827 = _4220 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4829 = isnan(_4220);
                bool _4831 = _4827 || _4829;
                bool _4833 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4835 = _4831 || _4833;
                if (!_4835)
                {
                    float _4837 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4839 = _4220 + _4837;
                    float _4841 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4843 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4841;
                    float _4845 = 1.0 / _4843;
                    float _4847 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4849 = _4847 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4851 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4853 = _4851 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4855 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4857 = _4855 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4859 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4861 = _4859 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4863 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4865 = _4863 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4867 = _4839 * _4845;
                    float _4869 = precise::clamp(_4867, 0.0, 1.0);
                    float _4871 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4873 = _4871 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4875 = fma(_4869, _4849, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4877 = fma(_4869, _4873, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4879 = fma(_4869, _4853, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4881 = fma(_4869, _4857, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4883 = fma(_4869, _4861, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4885 = fma(_4869, _4865, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _4739 = _4877;
                    _4627 = _4883;
                    _4731 = _4875;
                    _4619 = _4881;
                    _4723 = _4879;
                    _4677 = _4885;
                    _4801 = true;
                }
                else
                {
                    _4739 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4627 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _4731 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4619 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4723 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4677 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4801 = false;
    float _4887 = _4739;
    float _4889 = _4627;
    float _4891 = _4731;
    float _4893 = _4619;
    float _4895 = _4723;
    float _4897 = _4677;
    float _4899 = fma(_4018, -0.5, 0.5);
    float _4901 = precise::clamp(_4899, 0.0, 1.0);
    float _4903 = -_4887;
    float _4905 = _4903 + _4889;
    float _4907 = -_4891;
    float _4909 = _4907 + _4893;
    float _4911 = -_4895;
    float _4913 = _4911 + _4897;
    bool _4915 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4917 = fma(_4901, _4905, _4887);
    float _4919 = fma(_4901, _4909, _4891);
    float _4921 = fma(_4901, _4913, _4895);
    float _4923 = _4917 * 0.586610972881317138671875;
    out.m_86.x = 0.0;
    float _4925 = fma(_4919, 0.298911988735198974609375, _4923);
    float _4927 = fma(_4921, 0.114477999508380889892578125, _4925);
    float _4929 = -_4927;
    float _4931 = _4919 + _4929;
    float _4933 = -_4927;
    float _4935 = _4917 + _4933;
    float _4937 = -_4927;
    float _4939 = _4921 + _4937;
    float _4941 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4943 = fma(_4931, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4927);
    float _4945 = fma(_4935, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4927);
    float _4947 = fma(_4939, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4927);
    out.m_51.x = _4941;
    out.m_88.x = _4943;
    out.m_88.y = _4945;
    out.m_88.z = _4947;
    if (!_4915)
    {
        return out;
    }
    float _4949 = -_4194;
    float _4951 = _4949 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _4953 = -_4196;
    float _4955 = _4953 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _4957 = -_4198;
    float _4959 = _4957 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _4961 = _4951 * _4951;
    float _4963 = fma(_4955, _4955, _4961);
    float _4965 = fma(_4959, _4959, _4963);
    float _4967 = sqrt(_4965);
    float _4969 = rsqrt(_4965);
    float _4971 = -_4967;
    float _4973 = _4971 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4975 = _4973 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _4977 = precise::clamp(_4975, 0.0, 1.0);
    float _4979 = _4955 * _4969;
    float _4981 = _4951 * _4969;
    float _4983 = abs(_4977);
    float _4985 = log2(_4983);
    float _4987 = _4959 * _4969;
    float _4989 = _4979 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _4991 = _4018 * _4981;
    float _4993 = -_4981;
    float _4995 = -_4989;
    float _4997 = fma(_4993, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4995);
    float _4999 = fma(_4016, _4979, _4991);
    float _5001 = -_4987;
    float _5003 = fma(_5001, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4997);
    float _5005 = fma(_4020, _4987, _4999);
    float _5007 = precise::clamp(_5005, 0.0, 1.0);
    float _5009 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _5011 = _5003 + _5009;
    float _5013 = _4985 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _5015 = _5011 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _5017 = precise::clamp(_5015, 0.0, 1.0);
    float _5019 = exp2(_5013);
    float _5021 = _5019 * _5017;
    float _5023 = _5007 * _5021;
    float _5025 = _5023 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _5027 = _5023 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _5029 = _5023 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_86.x = _5025;
    out.m_86.y = _5027;
    out.m_86.z = _5029;
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
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4801 = false;
    bool _4072 = false;
    bool _701 = false;
    bool _597 = false;
    bool _203 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _102 = in.m_48.w;
    float _104 = trunc(_102);
    int _107 = int(_104);
    bool _111 = _107 >= 1;
    float _113 = 0.0;
    if (!_111)
    {
        _113 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _115 = _113;
    float _117 = _115;
    if (!_111)
    {
        out.m_51.x = 0.0;
    }
    int _119 = 0;
    if (!_111)
    {
        float _121 = _115 * 5.0;
        _119 = as_type<int>(_121);
    }
    int _123 = _119;
    int _125 = _123;
    if (!_111)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5086 = as_type<float>(_123);
        out.gl_Position.z = _5086;
    }
    if (!_111)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _127 = in.m_53.w;
    bool _129 = _127 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _131 = isnan(_127);
    bool _133 = _129 || _131;
    bool _135 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _137 = _133 || _135;
    float _139 = -_127;
    float _141 = _139 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _143 = 0.0;
    float _145 = _141;
    if (_137)
    {
        float _147 = float(_107);
        _143 = _147;
    }
    float _149 = _143;
    bool _151 = _141 >= _149;
    bool _153 = !_137;
    bool _155 = _151 || _153;
    if (_155)
    {
        _117 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _157 = _117;
    if (_155)
    {
        out.m_51.x = 0.0;
    }
    if (_155)
    {
        float _159 = _157 * 5.0;
        _125 = as_type<int>(_159);
    }
    int _161 = _125;
    if (_155)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5155 = as_type<float>(_161);
        out.gl_Position.z = _5155;
    }
    if (_155)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _163 = as_type<float>(int(gl_VertexIndex));
    bool _165 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _167 = as_type<int>(_163) & 1;
    bool _169 = _167 != 0;
    int _171 = as_type<int>(_163) & 2;
    bool _173 = _171 != 0;
    bool _175 = !_169;
    float _177 = _175 ? (-0.5) : 0.5;
    bool _179 = !_173;
    float _181 = _179 ? (-0.5) : 0.5;
    bool _183 = !_165;
    float _201;
    if (!_183)
    {
        float _185 = in.m_58.x;
        float _187 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _189 = _185 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _191 = fma(_189, (*spvDescriptorSet0.vp_c9)._m0[12].x, _141);
        float _193 = _191 * _187;
        float _195 = floor(_193);
        float _197 = -_195;
        float _199 = _193 + _197;
        _201 = _199;
        _203 = true;
    }
    else
    {
        float _205 = float(_107);
        float _207 = 1.0 / _205;
        float _209 = _141 * _207;
        _201 = _209;
    }
    _203 = false;
    float _211 = _201;
    float _213 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _215 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _213;
    float _217 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _219 = _217 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _221 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _223 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _221;
    float _225 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _227 = _225 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _229 = 1.0 / _215;
    float _231 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _233 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _231;
    float _235 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _237 = _235 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _239 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _241 = isnan(_211);
    bool _243 = _239 || _241;
    bool _245 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _247 = _243 || _245;
    float _249 = float(_247);
    float _251 = 1.0 / _219;
    float _253 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _255 = _211 + _253;
    float _257 = -_249;
    float _259 = _257 + 1.0;
    float _261 = 1.0 / _223;
    float _263 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _265 = _211 + _263;
    float _267 = _255 * _229;
    bool _269 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[150].w;
    bool _271 = isnan(_211);
    bool _273 = _269 || _271;
    bool _275 = isnan((*spvDescriptorSet0.vp_c9)._m0[150].w);
    bool _277 = _273 || _275;
    float _279 = float(_277);
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _283 = _211 + _281;
    bool _285 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _287 = 1.0 / _227;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _291 = (*spvDescriptorSet0.vp_c9)._m0[150].w + _289;
    float _293 = _265 * _251;
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _297 = _211 + _295;
    float _299 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _301 = _211 + _299;
    bool _303 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _305 = isnan(_211);
    bool _307 = _303 || _305;
    bool _309 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _311 = _307 || _309;
    float _313 = float(_311);
    float _315 = 1.0 / _233;
    float _317 = _297 * _261;
    float _319 = -_279;
    float _321 = _319 + 1.0;
    float _323 = -_313;
    float _325 = _323 + 1.0;
    float _327 = _313 * _321;
    bool _329 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _331 = isnan(_211);
    bool _333 = _329 || _331;
    bool _335 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _337 = _333 || _335;
    float _339 = float(_337);
    float _341 = 1.0 / _291;
    float _343 = _301 * _287;
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _347 = _211 + _345;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _351 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _349;
    float _353 = -_339;
    float _355 = _353 + 1.0;
    float _357 = fma(_351, _267, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _359 = 1.0 / _237;
    float _361 = _283 * _315;
    bool _363 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _365 = isnan(_211);
    bool _367 = _363 || _365;
    bool _369 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _371 = _367 || _369;
    float _373 = float(_371);
    float _375 = _347 * _341;
    float _377 = _373 * _325;
    float _379 = -_373;
    float _381 = _379 + 1.0;
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _385 = _211 + _383;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _389 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _387;
    float _391 = _339 * _381;
    float _393 = _249 * _355;
    float _395 = _385 * _359;
    bool _397 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _399 = isnan(_211);
    bool _401 = _397 || _399;
    bool _403 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _405 = _401 || _403;
    float _407 = float(_405);
    float _409 = fma(_389, _267, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _411 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _413 = isnan(_211);
    bool _415 = _411 || _413;
    bool _417 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _419 = _415 || _417;
    float _421 = float(_419);
    bool _423 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _425 = isnan(_211);
    bool _427 = _423 || _425;
    bool _429 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _431 = _427 || _429;
    float _433 = float(_431);
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _437 = _435 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _439 = -_407;
    float _441 = _439 + 1.0;
    float _443 = _421 * _259;
    float _445 = -_421;
    float _447 = _445 + 1.0;
    float _449 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _451 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _449;
    float _453 = _433 * _441;
    float _455 = fma(_437, _293, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _457 = _407 * _447;
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _461 = _459 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _465 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _463;
    float _467 = _409 * _453;
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _471 = _469 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _473 = -_433;
    float _475 = _473 + 1.0;
    float _477 = fma(_461, _293, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _479 = fma(_465, _317, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _481 = fma(_451, _317, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _483 = _357 * _453;
    float _485 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _487 = _485 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _489 = fma(_471, _343, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _491 = fma(_475, (*spvDescriptorSet0.vp_c9)._m0[143].x, _467);
    float _493 = fma(_475, (*spvDescriptorSet0.vp_c9)._m0[143].y, _483);
    float _495 = fma(_487, _343, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _497 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _499 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _497;
    float _501 = fma(_455, _457, _491);
    float _503 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _505 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _503;
    float _507 = fma(_477, _457, _493);
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _511 = _509 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _513 = fma(_479, _443, _501);
    float _515 = fma(_499, _361, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _517 = fma(_505, _361, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _521 = _519 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _523 = fma(_481, _443, _507);
    float _525 = in.m_60.x;
    float _527 = in.m_60.y;
    float _529 = fma(_511, _395, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _531 = fma(_521, _395, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _533 = fma(_489, _393, _513);
    float _535 = fma(_495, _393, _523);
    float _537 = -(*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _539 = (*spvDescriptorSet0.vp_c9)._m0[150].x + _537;
    float _541 = -(*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _543 = (*spvDescriptorSet0.vp_c9)._m0[150].y + _541;
    float _545 = fma(_515, _391, _533);
    float _547 = fma(_517, _391, _535);
    float _549 = fma(_539, _375, (*spvDescriptorSet0.vp_c9)._m0[149].x);
    float _551 = fma(_543, _375, (*spvDescriptorSet0.vp_c9)._m0[149].y);
    float _553 = fma(_529, _377, _545);
    float _555 = fma(_531, _377, _547);
    float _557 = fma(_549, _327, _553);
    float _559 = fma(_551, _327, _555);
    float _561 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[150].x, _557);
    float _563 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[150].y, _559);
    float _565 = _561 * _525;
    float _567 = _563 * _527;
    bool _569 = !_285;
    float _571 = _547;
    int _573 = as_type<int>(_507);
    int _575 = as_type<int>(_457);
    float _577 = _545;
    float _595;
    if (!_569)
    {
        float _579 = in.m_58.x;
        float _581 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _583 = _579 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _585 = fma(_583, (*spvDescriptorSet0.vp_c9)._m0[11].y, _141);
        float _587 = _585 * _581;
        float _589 = floor(_587);
        float _591 = -_589;
        float _593 = _587 + _591;
        _595 = _593;
        _597 = true;
    }
    else
    {
        float _599 = float(_107);
        float _601 = 1.0 / _599;
        float _603 = _141 * _601;
        _595 = _603;
    }
    _597 = false;
    float _605 = _595;
    bool _607 = _605 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _609 = isnan(_605);
    bool _611 = _607 || _609;
    bool _613 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _615 = _611 || _613;
    float _617 = float(_615);
    float _619 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _621 = _619 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _623 = _605 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _625 = isnan(_605);
    bool _627 = _623 || _625;
    bool _629 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _631 = _627 || _629;
    float _633 = float(_631);
    float _635 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _637 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _635;
    float _639 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _641 = _605 + _639;
    float _643 = -_617;
    float _645 = _643 + 1.0;
    bool _647 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _649 = 1.0 / _621;
    float _651 = _633 * _645;
    float _653 = -_633;
    float _655 = _653 + 1.0;
    float _657 = _637 * _649;
    float _659 = fma(_657, _641, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _661 = _659 * _651;
    float _663 = fma(_655, (*spvDescriptorSet0.vp_c9)._m0[115].x, _661);
    float _665 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _667 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _669 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _671 = fma(_617, (*spvDescriptorSet0.vp_c9)._m0[116].x, _663);
    float _673 = _665 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _675 = _667 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _677 = _669 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _679 = _671 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_62.x = _673;
    out.m_62.y = _675;
    out.m_62.z = _677;
    out.m_62.w = _679;
    bool _681 = !_647;
    float _699;
    if (!_681)
    {
        float _683 = in.m_58.x;
        float _685 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _687 = _683 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _689 = fma(_687, (*spvDescriptorSet0.vp_c9)._m0[11].w, _141);
        float _691 = _689 * _685;
        float _693 = floor(_691);
        float _695 = -_693;
        float _697 = _691 + _695;
        _699 = _697;
        _701 = true;
    }
    else
    {
        float _703 = float(_107);
        float _705 = 1.0 / _703;
        float _707 = _141 * _705;
        _699 = _707;
    }
    _701 = false;
    float _709 = _699;
    float _711 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _713 = int(_711);
    float _715 = float(_107);
    float _717 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _719 = int(_717);
    float _721 = float(_713);
    float _723 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _725 = int(_723);
    float _727 = float(uint(_719));
    float _729 = 1.0 / _721;
    int _731 = ~_719;
    int _733 = _731 + 1;
    int _735 = ~_719;
    int _737 = _735 + 1;
    float _739 = 1.0 / _727;
    float _741 = float(uint(_725));
    float _743 = _729 * _141;
    float _745 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _747 = int(_745);
    int _749 = as_type<int>(_739) + (-2);
    float _751 = trunc(_743);
    int _753 = int(_751);
    float _755 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _757 = int(_755);
    float _759 = float(_747);
    float _761 = float(uint(_753));
    float _763 = 1.0 / _741;
    float _765 = as_type<float>(_749) * _761;
    float _767 = float(_757);
    float _769 = trunc(_765);
    float _771 = precise::max(_769, 0.0);
    uint _774 = uint(_771);
    int _776 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _778 = _776 != 0;
    float _780 = 1.0 / _767;
    float _782 = float(_719);
    int _784 = _733 * int(_774);
    int _786 = _784 + _753;
    float _788 = float(_753);
    float _790 = _557;
    float _792 = as_type<float>(_774);
    if (_778)
    {
        float _794 = in.m_58.x;
        _790 = _794;
    }
    float _796 = _790;
    float _798 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _800 = int(_798);
    if (_778)
    {
        _571 = 1.0;
    }
    float _802 = _571;
    float _804 = _802;
    if (_778)
    {
        _573 = 0;
        _575 = 0;
    }
    int _806 = _573;
    int _808 = _575;
    float _810 = float(uint(_786));
    bool _812 = _788 >= _782;
    bool _814 = isnan(_788);
    bool _816 = _812 || _814;
    bool _818 = isnan(_782);
    bool _820 = _816 || _818;
    float _822 = float(_820);
    int _824 = _806;
    int _826 = _808;
    if (_778)
    {
        _577 = 1.0;
    }
    float _828 = _577;
    float _830 = as_type<float>(_749) * _810;
    float _832 = 1.0 / _715;
    float _834 = in.m_58.x;
    float _836 = in.m_58.y;
    float _838 = in.m_58.z;
    float _840 = in.m_58.w;
    float _842 = trunc(_830);
    float _844 = precise::max(_842, 0.0);
    uint _846 = uint(_844);
    float _848 = 1.0 / _759;
    float _850 = trunc(_822);
    int _852 = int(_850);
    int _854 = int(_774) + int(_846);
    float _856 = as_type<float>(_846);
    float _858 = _828;
    if (_778)
    {
        _856 = 1.0;
    }
    float _860 = _856;
    float _862 = _860;
    float _864 = _796;
    if (_778)
    {
        _792 = _796;
    }
    float _866 = _792;
    float _868 = _866;
    if (!_778)
    {
        float _870 = in.m_58.y;
        float _872 = in.m_58.z;
        _862 = 7.345489978790283203125;
        _858 = 5.839270114898681640625;
        _868 = _872;
        _804 = 1.2345600128173828125;
        _864 = _870;
        _824 = 1;
        _826 = 2;
    }
    float _874 = _862;
    float _876 = _858;
    float _878 = _868;
    float _880 = _804;
    float _882 = _864;
    int _884 = _824;
    int _886 = _826;
    int _888 = _737 * _854;
    int _890 = _888 + _753;
    float _892 = _874 * _834;
    float _894 = _780 * _141;
    bool _896 = _719 == 0;
    float _898 = _848 * _141;
    bool _900 = uint(_890) >= uint(_719);
    float _902 = floor(_892);
    float _904 = float(uint(_800));
    float _906 = _832 * _141;
    bool _908 = !_900;
    int _910 = _908 ? 0 : (-1);
    float _912 = _876 * _878;
    bool _914 = _836 > 0.5;
    float _916 = _834 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _918 = ~_854;
    int _920 = _918 + _910;
    int _922 = _920 + 1;
    float _924 = trunc(_894);
    int _926 = int(_924);
    int _928 = _719 + (-1);
    int _930 = _719 * _922;
    int _932 = _930 + _753;
    int _934 = ~_852;
    int _936 = _934 + 1;
    int _938 = _936 + 1;
    int _940 = ~_725;
    int _942 = _940 + 1;
    float _944 = -_902;
    float _946 = _892 + _944;
    bool _948 = !_896;
    int _950 = _948 ? _932 : (-1);
    float _952 = 1.0 / _904;
    float _954 = _946 * _782;
    int _956 = as_type<int>(_763) + (-2);
    int _958 = _950 * _938;
    int _960 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _962 = _960 != 0;
    float _964 = _782 * _906;
    float _966 = float(uint(_926));
    float _968 = trunc(_898);
    int _970 = int(_968);
    bool _972 = _838 > 0.5;
    int _974 = _852 * _928;
    int _976 = _974 + _958;
    float _978 = -_177;
    int _980 = _914 ? as_type<int>(_978) : as_type<int>(_177);
    int _982 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _984 = _982 != 0;
    int _986 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _988 = _986 != 0;
    int _990 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _992 = _990 != 0;
    float _994 = -_181;
    int _996 = _972 ? as_type<int>(_994) : as_type<int>(_181);
    float _998 = trunc(_954);
    int _1000 = int(_998);
    float _1002 = as_type<float>(_956) * _966;
    bool _1004 = !_962;
    int _1006 = _1004 ? 0 : 1;
    int _1008 = as_type<int>(_952) + (-2);
    int _1010 = abs(_1006);
    float _1012 = trunc(_1002);
    float _1014 = precise::max(_1012, 0.0);
    uint _1016 = uint(_1014);
    bool _1018 = !_988;
    float _1020 = _1018 ? _177 : as_type<float>(_980);
    bool _1022 = !_992;
    float _1024 = _1022 ? _181 : as_type<float>(_996);
    int _1026 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1028 = _1026 != 0;
    int _1030 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1032 = _1030 != 0;
    int _1034 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1036 = _1034 != 0;
    float _1038 = trunc(_964);
    int _1040 = int(_1038);
    float _1042 = float(uint(_970));
    int _1044 = _1000 * _1010;
    int _1046 = _1044 + _753;
    int _1048 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1050 = _1048 != 0;
    bool _1052 = !_1032;
    int _1054 = _1052 ? 0 : 1;
    float _1056 = as_type<float>(_1008) * _1042;
    bool _1058 = !_1028;
    int _1060 = _1058 ? 0 : 1;
    int _1062 = _942 * int(_1016);
    int _1064 = _1062 + _926;
    int _1066 = abs(_1054);
    bool _1068 = !_1036;
    int _1070 = _1068 ? 0 : 1;
    float _1072 = trunc(_1056);
    float _1074 = precise::max(_1072, 0.0);
    uint _1076 = uint(_1074);
    int _1078 = abs(_1060);
    int _1080 = _976 * _1066;
    bool _1082 = !_1050;
    int _1084 = _1082 ? 0 : 1;
    int _1086 = abs(_1070);
    float _1088 = float(uint(_1064));
    int _1090 = abs(_1084);
    int _1092 = _1040 * _1078;
    int _1094 = _1092 + _1080;
    float _1096 = as_type<float>(_956) * _1088;
    float _1098 = _880 * _882;
    float _1100 = float(_725);
    int _1102 = _1046 * _1086;
    int _1104 = _1102 + _1094;
    float _1106 = trunc(_1096);
    float _1108 = precise::max(_1106, 0.0);
    uint _1110 = uint(_1108);
    int _1112 = ~_725;
    int _1114 = _1112 + 1;
    int _1116 = _1000 * _1090;
    int _1118 = _1116 + _1104;
    int _1120 = ~_800;
    int _1122 = _1120 + 1;
    float _1124 = float(_926);
    float _1126 = float(uint(_1118));
    float _1128 = floor(_1098);
    bool _1130 = _840 > 0.5;
    bool _1132 = _1124 >= _1100;
    bool _1134 = isnan(_1124);
    bool _1136 = _1132 || _1134;
    bool _1138 = isnan(_1100);
    bool _1140 = _1136 || _1138;
    float _1142 = float(_1140);
    float _1144 = as_type<float>(_749) * _1126;
    float _1146 = -_181;
    int _1148 = _1130 ? as_type<int>(_1146) : as_type<int>(_181);
    int _1150 = int(_1016) + int(_1110);
    float _1152 = trunc(_1144);
    float _1154 = precise::max(_1152, 0.0);
    uint _1156 = uint(_1154);
    int _1158 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1160 = _1158 != 0;
    int _1162 = _1114 * _1150;
    int _1164 = _1162 + _926;
    int _1166 = _1122 * int(_1076);
    int _1168 = _1166 + _970;
    float _1170 = -_1128;
    float _1172 = _1098 + _1170;
    bool _1174 = uint(_1164) >= uint(_725);
    float _1176 = trunc(_1142);
    int _1178 = int(_1176);
    float _1180 = float(uint(_1168));
    float _1182 = _1172 * _1100;
    int _1184 = ~_719;
    int _1186 = _1184 + 1;
    float _1188 = _1100 * _906;
    bool _1190 = !_984;
    float _1192 = _1190 ? _181 : as_type<float>(_1148);
    float _1194 = as_type<float>(_1008) * _1180;
    bool _1196 = !_1174;
    int _1198 = _1196 ? 0 : (-1);
    float _1200 = floor(_912);
    bool _1202 = !_1160;
    int _1204 = _1202 ? 0 : 1;
    int _1206 = _1186 * int(_1156);
    int _1208 = _1206 + _1118;
    int _1210 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1212 = _1210 != 0;
    int _1214 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1216 = _1214 != 0;
    int _1218 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1220 = _1218 != 0;
    int _1222 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1224 = _1222 != 0;
    int _1226 = ~_1150;
    int _1228 = _1226 + _1198;
    int _1230 = _1228 + 1;
    float _1232 = float(uint(_1208));
    float _1234 = trunc(_1194);
    float _1236 = precise::max(_1234, 0.0);
    uint _1238 = uint(_1236);
    bool _1240 = !_1216;
    int _1242 = _1240 ? 0 : 1;
    int _1244 = _725 * _1230;
    int _1246 = _1244 + _926;
    bool _1248 = _725 == 0;
    float _1250 = as_type<float>(_749) * _1232;
    int _1252 = ~_1178;
    int _1254 = _1252 + 1;
    int _1256 = _1254 + 1;
    bool _1258 = !_1248;
    int _1260 = _1258 ? _1246 : (-1);
    float _1262 = trunc(_1250);
    float _1264 = precise::max(_1262, 0.0);
    uint _1266 = uint(_1264);
    float _1268 = -_1200;
    float _1270 = _912 + _1268;
    int _1272 = ~_800;
    int _1274 = _1272 + 1;
    int _1276 = _1260 * _1256;
    int _1278 = _725 + (-1);
    int _1280 = abs(_1204);
    float _1282 = trunc(_1188);
    int _1284 = int(_1282);
    int _1286 = int(_1076) + int(_1238);
    int _1288 = _1178 * _1278;
    int _1290 = _1288 + _1276;
    int _1292 = abs(_1242);
    bool _1294 = !_1212;
    int _1296 = _1294 ? 0 : 1;
    float _1298 = trunc(_1182);
    int _1300 = int(_1298);
    int _1302 = int(_1156) + int(_1266);
    int _1304 = _1290 * _1292;
    int _1306 = abs(_1296);
    int _1308 = _1274 * _1286;
    int _1310 = _1308 + _970;
    bool _1312 = !_1220;
    int _1314 = _1312 ? 0 : 1;
    bool _1316 = uint(_1310) >= uint(_800);
    int _1318 = ~_719;
    int _1320 = _1318 + 1;
    int _1322 = _1284 * _1306;
    int _1324 = _1322 + _1304;
    float _1326 = float(uint(_1046));
    float _1328 = float(_800);
    int _1330 = _1300 * _1280;
    int _1332 = _1330 + _926;
    int _1334 = abs(_1314);
    float _1336 = as_type<float>(_749) * _1326;
    bool _1338 = !_1224;
    int _1340 = _1338 ? 0 : 1;
    int _1342 = _1320 * _1302;
    int _1344 = _1342 + _1118;
    float _1346 = float(_970);
    int _1348 = abs(_1340);
    int _1350 = _1332 * _1334;
    int _1352 = _1350 + _1324;
    bool _1354 = _1346 >= _1328;
    bool _1356 = isnan(_1346);
    bool _1358 = _1354 || _1356;
    bool _1360 = isnan(_1328);
    bool _1362 = _1358 || _1360;
    float _1364 = float(_1362);
    float _1366 = trunc(_1336);
    float _1368 = precise::max(_1366, 0.0);
    uint _1370 = uint(_1368);
    bool _1372 = uint(_1344) >= uint(_719);
    bool _1374 = !_1316;
    int _1376 = _1374 ? 0 : (-1);
    int _1378 = _1300 * _1348;
    int _1380 = _1378 + _1352;
    int _1382 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1384 = _1382 != 0;
    int _1386 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1388 = _1386 != 0;
    int _1390 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1392 = _1390 != 0;
    float _1394 = trunc(_1364);
    int _1396 = int(_1394);
    int _1398 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1400 = _1398 != 0;
    float _1402 = _1270 * _1328;
    int _1404 = ~_1286;
    int _1406 = _1404 + _1376;
    int _1408 = _1406 + 1;
    float _1410 = _1328 * _906;
    bool _1412 = !_1400;
    int _1414 = _1412 ? 0 : 1;
    float _1416 = float(uint(_1380));
    float _1418 = trunc(_1402);
    int _1420 = int(_1418);
    int _1422 = ~_719;
    int _1424 = _1422 + 1;
    int _1426 = _800 * _1408;
    int _1428 = _1426 + _970;
    int _1430 = abs(_1414);
    float _1432 = as_type<float>(_956) * _1416;
    bool _1434 = _800 == 0;
    int _1436 = _1424 * int(_1370);
    int _1438 = _1436 + _1046;
    bool _1440 = !_1388;
    int _1442 = _1440 ? 0 : 1;
    float _1444 = trunc(_1410);
    int _1446 = int(_1444);
    int _1448 = ~_1396;
    int _1450 = _1448 + 1;
    int _1452 = _1450 + 1;
    bool _1454 = !_1434;
    int _1456 = _1454 ? _1428 : (-1);
    float _1458 = float(uint(_1438));
    int _1460 = _800 + (-1);
    float _1462 = trunc(_1432);
    float _1464 = precise::max(_1462, 0.0);
    uint _1466 = uint(_1464);
    int _1468 = _1456 * _1452;
    bool _1470 = !_1372;
    int _1472 = _1470 ? 0 : (-1);
    int _1474 = _1420 * _1430;
    int _1476 = _1474 + _970;
    float _1478 = as_type<float>(_749) * _1458;
    int _1480 = ~_725;
    int _1482 = _1480 + 1;
    int _1484 = _1396 * _1460;
    int _1486 = _1484 + _1468;
    int _1488 = abs(_1442);
    int _1490 = ~_1302;
    int _1492 = _1490 + _1472;
    int _1494 = _1492 + 1;
    int _1496 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1498 = _1496 != 0;
    int _1500 = _1486 * _1488;
    int _1502 = _719 * _1494;
    int _1504 = _1502 + _1118;
    bool _1506 = !_1498;
    int _1508 = _1506 ? 0 : 1;
    bool _1510 = !_1384;
    int _1512 = _1510 ? 0 : 1;
    int _1514 = _1482 * int(_1466);
    int _1516 = _1514 + _1380;
    bool _1518 = _719 == 0;
    int _1520 = abs(_1508);
    int _1522 = abs(_1512);
    bool _1524 = !_1392;
    int _1526 = _1524 ? 0 : 1;
    bool _1528 = !_1518;
    int _1530 = _1528 ? _1504 : (-1);
    int _1532 = _1446 * _1522;
    int _1534 = _1532 + _1500;
    float _1536 = float(uint(_1516));
    int _1538 = abs(_1526);
    float _1540 = trunc(_1478);
    float _1542 = precise::max(_1540, 0.0);
    uint _1544 = uint(_1542);
    int _1546 = _1530 & 3;
    bool _1548 = _1546 != 0;
    float _1550 = as_type<float>(_956) * _1536;
    int _1552 = _1530 & 3;
    bool _1554 = _1552 != 0;
    int _1556 = _1476 * _1538;
    int _1558 = _1556 + _1534;
    int _1560 = _1548 ? 0 : 1;
    bool _1562 = uint(_1552) > 1u;
    float _1564 = trunc(_1550);
    float _1566 = precise::max(_1564, 0.0);
    uint _1568 = uint(_1566);
    int _1570 = _1420 * _1520;
    int _1572 = _1570 + _1558;
    int _1574 = ~_719;
    int _1576 = _1574 + 1;
    int _1578 = ~_1560;
    int _1580 = _1578 + 1;
    int _1582 = _1580 + 1;
    float _1584 = float(uint(_1572));
    int _1586 = int(_1370) + int(_1544);
    int _1588 = _1582;
    if (!_1562)
    {
        int _1590 = ~_1560;
        int _1592 = _1590 + 1;
        _1588 = _1592;
    }
    int _1594 = _1588;
    float _1596 = as_type<float>(_1008) * _1584;
    bool _1598 = uint(_1552) >= 2u;
    int _1600 = _1576 * _1586;
    int _1602 = _1600 + _1046;
    int _1604 = int(_1466) + int(_1568);
    int _1606 = ~_725;
    int _1608 = _1606 + 1;
    float _1610 = trunc(_1596);
    float _1612 = precise::max(_1610, 0.0);
    uint _1614 = uint(_1612);
    float _1616 = float(uint(_1332));
    int _1618 = _1598 ? 0 : 1;
    int _1620 = _1608 * _1604;
    int _1622 = _1620 + _1380;
    bool _1624 = uint(_1602) >= uint(_719);
    float _1626 = as_type<float>(_956) * _1616;
    int _1628 = ~_800;
    int _1630 = _1628 + 1;
    bool _1632 = !_1624;
    int _1634 = _1632 ? 0 : (-1);
    float _1636 = trunc(_1626);
    float _1638 = precise::max(_1636, 0.0);
    uint _1640 = uint(_1638);
    bool _1642 = uint(_1622) >= uint(_725);
    int _1644 = ~_725;
    int _1646 = _1644 + 1;
    bool _1648 = !_1642;
    int _1650 = _1648 ? 0 : (-1);
    int _1652 = _1630 * int(_1614);
    int _1654 = _1652 + _1572;
    bool _1656 = _1552 != 3;
    int _1658 = ~_1586;
    int _1660 = _1658 + _1634;
    int _1662 = _1660 + 1;
    float _1664 = float(uint(_1654));
    int _1666 = ~_1604;
    int _1668 = _1666 + _1650;
    int _1670 = _1668 + 1;
    int _1672 = _719 * _1662;
    int _1674 = _1672 + _1046;
    float _1676 = as_type<float>(_1008) * _1664;
    int _1678 = ~_1618;
    int _1680 = _1678 + 1;
    int _1682 = _1680 + 1;
    int _1684 = _725 * _1670;
    int _1686 = _1684 + _1380;
    bool _1688 = !_1518;
    int _1690 = _1688 ? _1674 : (-1);
    float _1692 = trunc(_1676);
    float _1694 = precise::max(_1692, 0.0);
    uint _1696 = uint(_1694);
    int _1698 = _1682;
    if (_1656)
    {
        int _1700 = ~_1618;
        int _1702 = _1700 + 1;
        _1698 = _1702;
    }
    int _1704 = _1698;
    int _1706 = _1646 * int(_1640);
    int _1708 = _1706 + _1332;
    int _1710 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1712 = _1710 != 0;
    bool _1714 = !_1248;
    int _1716 = _1714 ? _1686 : (-1);
    float _1718 = float(uint(_1708));
    bool _1720 = !_1712;
    int _1722 = _1720 ? 0 : 1;
    int _1724 = _1716 & 3;
    bool _1726 = _1724 != 0;
    float _1728 = as_type<float>(_956) * _1718;
    int _1730 = _1716 & 3;
    bool _1732 = _1730 != 0;
    int _1734 = _1726 ? 0 : 1;
    float _1736 = trunc(_1728);
    float _1738 = precise::max(_1736, 0.0);
    uint _1740 = uint(_1738);
    bool _1742 = uint(_1730) > 1u;
    int _1744 = ~_800;
    int _1746 = _1744 + 1;
    int _1748 = int(_1614) + int(_1696);
    int _1750 = ~_1734;
    int _1752 = _1750 + 1;
    int _1754 = _1752 + 1;
    float _1756 = float(uint(_1476));
    int _1758 = _1746 * _1748;
    int _1760 = _1758 + _1572;
    bool _1762 = !_1554;
    int _1764 = _1762 ? 0 : 1;
    bool _1766 = _1730 != 3;
    float _1768 = as_type<float>(_1008) * _1756;
    int _1770 = _1754;
    if (!_1742)
    {
        int _1772 = ~_1734;
        int _1774 = _1772 + 1;
        _1770 = _1774;
    }
    int _1776 = _1770;
    int _1778 = ~_725;
    int _1780 = _1778 + 1;
    float _1782 = trunc(_1768);
    float _1784 = precise::max(_1782, 0.0);
    uint _1786 = uint(_1784);
    bool _1788 = uint(_1760) >= uint(_800);
    int _1790 = int(_1640) + int(_1740);
    bool _1792 = !_1788;
    int _1794 = _1792 ? 0 : (-1);
    bool _1796 = uint(_1730) >= 2u;
    int _1798 = _1780 * _1790;
    int _1800 = _1798 + _1332;
    int _1802 = ~_1748;
    int _1804 = _1802 + _1794;
    int _1806 = _1804 + 1;
    bool _1808 = !_1732;
    int _1810 = _1808 ? 0 : 1;
    int _1812 = _1796 ? 0 : 1;
    int _1814 = _800 * _1806;
    int _1816 = _1814 + _1572;
    bool _1818 = _1552 != 3;
    bool _1820 = uint(_1800) >= uint(_725);
    int _1822 = ~_800;
    int _1824 = _1822 + 1;
    int _1826 = ~_1812;
    int _1828 = _1826 + 1;
    int _1830 = _1828 + 1;
    bool _1832 = !_1818;
    int _1834 = _1832 ? 0 : (-1);
    int _1836 = _1830;
    if (_1766)
    {
        int _1838 = ~_1812;
        int _1840 = _1838 + 1;
        _1836 = _1840;
    }
    int _1842 = _1836;
    int _1844 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1846 = _1844 != 0;
    bool _1848 = !_1434;
    int _1850 = _1848 ? _1816 : (-1);
    int _1852 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _1854 = _1852 != 0;
    int _1856 = _1824 * int(_1786);
    int _1858 = _1856 + _1476;
    bool _1860 = !_1846;
    int _1862 = _1860 ? 0 : 1;
    int _1864 = _1850 & 3;
    bool _1866 = _1864 != 0;
    bool _1868 = !_1820;
    int _1870 = _1868 ? 0 : (-1);
    bool _1872 = _1730 != 3;
    bool _1874 = !_1854;
    int _1876 = _1874 ? 0 : 1;
    bool _1878 = uint(_1864) > 1u;
    float _1880 = float(uint(_1858));
    bool _1882 = !_1872;
    int _1884 = _1882 ? 0 : (-1);
    int _1886 = _1850 & 3;
    bool _1888 = _1886 != 0;
    float _1890 = as_type<float>(_1008) * _1880;
    int _1892 = _1888 ? 0 : 1;
    float _1894 = trunc(_1890);
    float _1896 = precise::max(_1894, 0.0);
    uint _1898 = uint(_1896);
    bool _1900 = uint(_1864) >= 2u;
    bool _1902 = !_1866;
    int _1904 = _1902 ? 0 : 1;
    int _1906 = ~_1892;
    int _1908 = _1906 + 1;
    int _1910 = _1908 + 1;
    int _1912 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1914 = _1912 != 0;
    int _1916 = _1910;
    if (!_1878)
    {
        int _1918 = ~_1892;
        int _1920 = _1918 + 1;
        _1916 = _1920;
    }
    int _1922 = _1916;
    int _1924 = _1900 ? 0 : 1;
    bool _1926 = _1864 != 3;
    int _1928 = _1530 >> 31;
    bool _1930 = _1864 != 3;
    int _1932 = _1928 & 3;
    int _1934 = _1850 >> 31;
    bool _1936 = !_1930;
    int _1938 = _1936 ? 0 : (-1);
    int _1940 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1942 = _1940 != 0;
    int _1944 = _1716 >> 31;
    int _1946 = _1530 + _1932;
    int _1948 = _1934 & 3;
    int _1950 = _1944 & 3;
    int _1952 = ~_1924;
    int _1954 = _1952 + 1;
    int _1956 = _1954 + 1;
    int _1958 = _1850 + _1948;
    int _1960 = _1956;
    if (_1926)
    {
        int _1962 = ~_1924;
        int _1964 = _1962 + 1;
        _1960 = _1964;
    }
    int _1966 = _1960;
    float _1968 = in.m_48.x;
    float _1970 = in.m_48.y;
    float _1972 = in.m_48.z;
    int _1974 = _1946 >> 2;
    int _1976 = _1716 + _1950;
    int _1978 = _1974 << 4;
    int _1980 = _1978 + 368;
    int _1982 = int(_1786) + int(_1898);
    int _1984 = _1976 >> 2;
    int _1986 = _1958 >> 2;
    int _1988 = ~_800;
    int _1990 = _1988 + 1;
    uint _1992 = uint(int(uint(_1980) >> uint(2)));
    uint _1994 = uint(int(uint(int(_1992)) >> uint(2)));
    int _1996 = int(_1992) & 3;
    float _1998 = (*spvDescriptorSet0.vp_c9)._m0[int(_1994)][_1996];
    int _2000 = int(_1992) + 1;
    uint _2002 = uint(int(uint(_2000) >> uint(2)));
    int _2004 = _2000 & 3;
    float _2006 = (*spvDescriptorSet0.vp_c9)._m0[int(_2002)][_2004];
    int _2008 = _1984 << 4;
    int _2010 = _2008 + 512;
    int _2012 = _1990 * _1982;
    int _2014 = _2012 + _1476;
    int _2016 = _1986 << 4;
    int _2018 = _2016 + 656;
    int _2020 = ~_1790;
    int _2022 = _2020 + _1870;
    int _2024 = _2022 + 1;
    uint _2026 = uint(int(uint(_2010) >> uint(2)));
    uint _2028 = uint(int(uint(int(_2026)) >> uint(2)));
    int _2030 = int(_2026) & 3;
    float _2032 = (*spvDescriptorSet0.vp_c9)._m0[int(_2028)][_2030];
    int _2034 = int(_2026) + 1;
    uint _2036 = uint(int(uint(_2034) >> uint(2)));
    int _2038 = _2034 & 3;
    float _2040 = (*spvDescriptorSet0.vp_c9)._m0[int(_2036)][_2038];
    float _2042 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _2044 = uint(_2014) >= uint(_800);
    float _2046 = _1970 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _2048 = _1970 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _2050 = -_2042;
    float _2052 = fma(_916, 2.0, _2050);
    bool _2054 = !_2044;
    int _2056 = _2054 ? 0 : (-1);
    float _2058 = _1970 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    int _2060 = _1980 + 8;
    uint _2062 = uint(int(uint(_2060) >> uint(2)));
    uint _2064 = uint(int(uint(int(_2062)) >> uint(2)));
    int _2066 = int(_2062) & 3;
    float _2068 = (*spvDescriptorSet0.vp_c9)._m0[int(_2064)][_2066];
    int _2070 = int(_2062) + 1;
    uint _2072 = uint(int(uint(_2070) >> uint(2)));
    int _2074 = _2070 & 3;
    float _2076 = (*spvDescriptorSet0.vp_c9)._m0[int(_2072)][_2074];
    int _2078 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2080 = _2078 != 0;
    float _2082 = _1970 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _2084 = fma(_1968, (*spvDescriptorSet0.vp_c10)._m0[14].y, _2046);
    float _2086 = fma(_1968, (*spvDescriptorSet0.vp_c10)._m0[14].z, _2048);
    float _2088 = fma(_1968, (*spvDescriptorSet0.vp_c10)._m0[14].w, _2058);
    float _2090 = fma(_1968, (*spvDescriptorSet0.vp_c10)._m0[14].x, _2082);
    int _2092 = abs(_1594);
    uint _2094 = uint(int(uint(_2018) >> uint(2)));
    uint _2096 = uint(int(uint(int(_2094)) >> uint(2)));
    int _2098 = int(_2094) & 3;
    float _2100 = (*spvDescriptorSet0.vp_c9)._m0[int(_2096)][_2098];
    int _2102 = int(_2094) + 1;
    uint _2104 = uint(int(uint(_2102) >> uint(2)));
    int _2106 = _2102 & 3;
    float _2108 = (*spvDescriptorSet0.vp_c9)._m0[int(_2104)][_2106];
    int _2110 = _725 * _2024;
    int _2112 = _2110 + _1332;
    int _2114 = abs(_1922);
    float _2116 = _836 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2118 = fma(_1972, (*spvDescriptorSet0.vp_c10)._m0[16].x, _2090);
    float _2120 = fma(_1972, (*spvDescriptorSet0.vp_c10)._m0[16].y, _2084);
    int _2122 = _2010 + 8;
    uint _2124 = uint(int(uint(_2122) >> uint(2)));
    uint _2126 = uint(int(uint(int(_2124)) >> uint(2)));
    int _2128 = int(_2124) & 3;
    float _2130 = (*spvDescriptorSet0.vp_c9)._m0[int(_2126)][_2128];
    int _2132 = int(_2124) + 1;
    uint _2134 = uint(int(uint(_2132) >> uint(2)));
    int _2136 = _2132 & 3;
    float _2138 = (*spvDescriptorSet0.vp_c9)._m0[int(_2134)][_2136];
    int _2140 = abs(_1776);
    float _2142 = _2118 + (*spvDescriptorSet0.vp_c10)._m0[17].x;
    int _2144 = ~_2092;
    int _2146 = _2144 + 1;
    int _2148 = _2146 + 1;
    float _2150 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2152 = fma(_1972, (*spvDescriptorSet0.vp_c10)._m0[16].z, _2086);
    int _2154 = abs(_1764);
    int _2156 = _2018 + 8;
    uint _2158 = uint(int(uint(_2156) >> uint(2)));
    uint _2160 = uint(int(uint(int(_2158)) >> uint(2)));
    int _2162 = int(_2158) & 3;
    float _2164 = (*spvDescriptorSet0.vp_c9)._m0[int(_2160)][_2162];
    int _2166 = int(_2158) + 1;
    uint _2168 = uint(int(uint(_2166) >> uint(2)));
    int _2170 = _2166 & 3;
    float _2172 = (*spvDescriptorSet0.vp_c9)._m0[int(_2168)][_2170];
    int _2174 = ~_2140;
    int _2176 = _2174 + 1;
    int _2178 = _2176 + 1;
    float _2180 = fma(_2116, -2.0, _2150);
    int _2182 = abs(_1810);
    float _2184 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2186 = int(_2184);
    int _2188 = ~_2154;
    int _2190 = _2188 + 1;
    int _2192 = _2190 + 1;
    float _2194 = fma(_1972, (*spvDescriptorSet0.vp_c10)._m0[16].w, _2088);
    int _2196 = ~_1982;
    int _2198 = _2196 + _2056;
    int _2200 = _2198 + 1;
    int _2202 = _2148 * as_type<int>(_2006);
    int _2204 = abs(_1904);
    float _2206 = _2120 + (*spvDescriptorSet0.vp_c10)._m0[17].y;
    int _2208 = abs(_1704);
    int _2210 = _2192 * as_type<int>(_1998);
    int _2212 = _2210 + _2202;
    int _2214 = _800 * _2200;
    int _2216 = _2214 + _1476;
    int _2218 = abs(_1842);
    int _2220 = _2178 * as_type<int>(_2040);
    int _2222 = ~_2182;
    int _2224 = _2222 + 1;
    int _2226 = _2224 + 1;
    float _2228 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2230 = int(_2228);
    int _2232 = ~_2208;
    int _2234 = _2232 + 1;
    int _2236 = _2234 + 1;
    float _2238 = _2194 + (*spvDescriptorSet0.vp_c10)._m0[17].w;
    int _2240 = ~_2114;
    int _2242 = _2240 + 1;
    int _2244 = _2242 + 1;
    int _2246 = _2226 * as_type<int>(_2032);
    int _2248 = _2246 + _2220;
    int _2250 = _2236 * as_type<int>(_2068);
    int _2252 = _2250 + _2212;
    int _2254 = ~_2218;
    int _2256 = _2254 + 1;
    int _2258 = _2256 + 1;
    float _2260 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _2262 = int(_2260);
    int _2264 = ~_2204;
    int _2266 = _2264 + 1;
    int _2268 = _2266 + 1;
    float _2270 = -_141;
    float _2272 = fma(_2270, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2052);
    int _2274 = abs(_1966);
    int _2276 = abs(_1938);
    int _2278 = _2244 * as_type<int>(_2108);
    int _2280 = ~_2274;
    int _2282 = _2280 + 1;
    int _2284 = _2282 + 1;
    float _2286 = float(uint(_2186));
    int _2288 = _2268 * as_type<int>(_2100);
    int _2290 = _2288 + _2278;
    int _2292 = abs(_1834);
    int _2294 = abs(_1722);
    int _2296 = _2258 * as_type<int>(_2130);
    int _2298 = _2296 + _2248;
    int _2300 = abs(_1884);
    float _2302 = 1.0 / _2286;
    int _2304 = ~_2292;
    int _2306 = _2304 + 1;
    int _2308 = _2306 + 1;
    int _2310 = ~_2300;
    int _2312 = _2310 + 1;
    int _2314 = _2312 + 1;
    float _2316 = float(uint(_2230));
    int _2318 = _2284 * as_type<int>(_2164);
    int _2320 = _2318 + _2290;
    int _2322 = ~_2276;
    int _2324 = _2322 + 1;
    int _2326 = _2324 + 1;
    int _2328 = _2314 * as_type<int>(_2138);
    int _2330 = _2328 + _2298;
    int _2332 = abs(_2186);
    int _2334 = _2308 * as_type<int>(_2076);
    int _2336 = _2334 + _2252;
    int _2338 = abs(_1876);
    int _2340 = _2326 * as_type<int>(_2172);
    int _2342 = _2340 + _2320;
    int _2344 = ~_2294;
    int _2346 = _2344 + 1;
    int _2348 = _2346 + 1;
    float _2350 = 1.0 / _2316;
    float _2352 = _834 * 2.0;
    int _2354 = abs(_1862);
    int _2356 = _2336 * _2348;
    int _2358 = ~_2338;
    int _2360 = _2358 + 1;
    int _2362 = _2360 + 1;
    float _2364 = float(uint(_2262));
    int _2366 = _1690 * _2294;
    int _2368 = _2366 + _2356;
    int _2370 = ~_2354;
    int _2372 = _2370 + 1;
    int _2374 = _2372 + 1;
    int _2376 = _2342 * _2362;
    float _2378 = float(uint(_2332));
    float _2380 = floor(_2352);
    bool _2382 = !_1248;
    int _2384 = _2382 ? _2112 : (-1);
    int _2386 = _2330 * _2374;
    int _2388 = as_type<int>(_2302) + (-2);
    int _2390 = abs(_2262);
    int _2392 = _2384 * _2354;
    int _2394 = _2392 + _2386;
    float _2396 = float(uint(_2368));
    float _2398 = 1.0 / _2364;
    float _2400 = as_type<float>(_2388) * _2396;
    bool _2402 = !_1434;
    int _2404 = _2402 ? _2216 : (-1);
    float _2406 = (*spvDescriptorSet0.vp_c10)._m0[19].y * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    int _2408 = as_type<int>(_2350) + (-2);
    float _2410 = 1.0 / _2378;
    float _2412 = float(uint(_2394));
    int _2414 = _2404 * _2338;
    int _2416 = _2414 + _2376;
    int _2418 = abs(_2230);
    float _2420 = as_type<float>(_2408) * _2412;
    float _2422 = float(uint(_2390));
    float _2424 = fma((*spvDescriptorSet0.vp_c10)._m0[19].x, (*spvDescriptorSet0.vp_c10)._m0[19].x, _2406);
    float _2426 = float(uint(_2418));
    float _2428 = trunc(_2400);
    float _2430 = precise::max(_2428, 0.0);
    uint _2432 = uint(_2430);
    int _2434 = abs(_2368);
    int _2436 = as_type<int>(_2398) + (-2);
    float _2438 = float(uint(_2416));
    int _2440 = as_type<int>(_2410) + (-2);
    float _2442 = 1.0 / _2422;
    float _2444 = float(uint(_2434));
    float _2446 = as_type<float>(_2436) * _2438;
    int _2448 = ~_2230;
    int _2450 = _2448 + 1;
    int _2452 = abs(_2394);
    float _2454 = as_type<float>(_2440) * _2444;
    int _2456 = abs(_2416);
    float _2458 = trunc(_2420);
    float _2460 = precise::max(_2458, 0.0);
    uint _2462 = uint(_2460);
    int _2464 = ~_2186;
    int _2466 = _2464 + 1;
    float _2468 = float(uint(_2456));
    float _2470 = float(uint(_2452));
    int _2472 = _2466 * int(_2432);
    int _2474 = _2472 + _2368;
    float _2476 = 1.0 / _2426;
    int _2478 = as_type<int>(_2442) + (-2);
    float _2480 = (*spvDescriptorSet0.vp_c10)._m0[20].y * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    float _2482 = float(uint(_2474));
    float _2484 = as_type<float>(_2478) * _2468;
    int _2486 = ~_2262;
    int _2488 = _2486 + 1;
    float _2490 = trunc(_2446);
    float _2492 = precise::max(_2490, 0.0);
    uint _2494 = uint(_2492);
    int _2496 = _2450 * int(_2462);
    int _2498 = _2496 + _2394;
    float _2500 = fma((*spvDescriptorSet0.vp_c10)._m0[20].x, (*spvDescriptorSet0.vp_c10)._m0[20].x, _2480);
    float _2502 = as_type<float>(_2388) * _2482;
    float _2504 = _834 + _836;
    float _2506 = float(uint(_2498));
    float _2508 = trunc(_2454);
    float _2510 = precise::max(_2508, 0.0);
    uint _2512 = uint(_2510);
    int _2514 = as_type<int>(_2476) + (-2);
    float _2516 = _2504 + (-1.0);
    int _2518 = ~_2332;
    int _2520 = _2518 + 1;
    float _2522 = as_type<float>(_2408) * _2506;
    bool _2524 = _2380 > 0.0;
    float _2526 = as_type<float>(_2514) * _2470;
    bool _2528 = _2380 >= 0.0;
    bool _2530 = isnan(_2380);
    bool _2532 = _2528 || _2530;
    bool _2534 = isnan(0.0);
    bool _2536 = _2532 || _2534;
    int _2538 = _2488 * int(_2494);
    int _2540 = _2538 + _2416;
    float _2542 = trunc(_2502);
    float _2544 = precise::max(_2542, 0.0);
    uint _2546 = uint(_2544);
    bool _2548 = _836 > 0.5;
    float _2550 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2552 = _2550 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2554 = float(uint(_2540));
    int _2556 = _2520 * int(_2512);
    int _2558 = _2556 + _2434;
    float _2560 = trunc(_2526);
    float _2562 = precise::max(_2560, 0.0);
    uint _2564 = uint(_2562);
    float _2566 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2568 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2566;
    float _2570 = as_type<float>(_2436) * _2554;
    float _2572 = _836 + _838;
    float _2574 = float(uint(_2558));
    int _2576 = ~_2418;
    int _2578 = _2576 + 1;
    float _2580 = _2572 + (-1.0);
    float _2582 = trunc(_2484);
    float _2584 = precise::max(_2582, 0.0);
    uint _2586 = uint(_2584);
    float _2588 = as_type<float>(_2440) * _2574;
    bool _2590 = _838 > 0.5;
    float _2592 = fma(_2580, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2594 = trunc(_2522);
    float _2596 = precise::max(_2594, 0.0);
    uint _2598 = uint(_2596);
    int _2600 = _2578 * int(_2564);
    int _2602 = _2600 + _2452;
    int _2604 = ~_2390;
    int _2606 = _2604 + 1;
    float _2608 = (*spvDescriptorSet0.vp_c10)._m0[18].y * (*spvDescriptorSet0.vp_c10)._m0[18].y;
    float _2610 = -_181;
    int _2612 = _2548 ? as_type<int>(_2610) : as_type<int>(_181);
    bool _2614 = _884 != 1;
    float _2616 = fma((*spvDescriptorSet0.vp_c10)._m0[18].x, (*spvDescriptorSet0.vp_c10)._m0[18].x, _2608);
    float _2618 = trunc(_2588);
    float _2620 = precise::max(_2618, 0.0);
    uint _2622 = uint(_2620);
    float _2624 = float(uint(_2602));
    int _2626 = _2606 * int(_2586);
    int _2628 = _2626 + _2456;
    int _2630 = int(_2432) + int(_2546);
    float _2632 = _836 * 2.0;
    int _2634 = ~_2186;
    int _2636 = _2634 + 1;
    float _2638 = as_type<float>(_2514) * _2624;
    float _2640 = float(uint(_2628));
    float _2642 = trunc(_2570);
    float _2644 = precise::max(_2642, 0.0);
    uint _2646 = uint(_2644);
    int _2648 = int(_2462) + int(_2598);
    int _2650 = _2636 * _2630;
    int _2652 = _2650 + _2368;
    bool _2654 = !_1914;
    float _2656 = _2654 ? _181 : as_type<float>(_2612);
    float _2658 = as_type<float>(_2478) * _2640;
    int _2660 = ~_2332;
    int _2662 = _2660 + 1;
    bool _2664 = uint(_2652) >= uint(_2186);
    float _2666 = 1.0 / _2552;
    int _2668 = int(_2512) + int(_2622);
    int _2670 = ~_2262;
    int _2672 = _2670 + 1;
    int _2674 = _2662 * _2668;
    int _2676 = _2674 + _2434;
    float _2678 = -_177;
    int _2680 = _2590 ? as_type<int>(_2678) : as_type<int>(_177);
    float _2682 = trunc(_2638);
    float _2684 = precise::max(_2682, 0.0);
    uint _2686 = uint(_2684);
    int _2688 = int(_2494) + int(_2646);
    float _2690 = fma(_2516, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _2692 = !_2664;
    int _2694 = _2692 ? 0 : (-1);
    bool _2696 = uint(_2676) >= uint(_2332);
    int _2698 = _2672 * _2688;
    int _2700 = _2698 + _2416;
    int _2702 = ~_2630;
    int _2704 = _2702 + _2694;
    int _2706 = _2704 + 1;
    float _2708 = floor(_2632);
    float _2710 = _2568 * _2666;
    int _2712 = ~_2230;
    int _2714 = _2712 + 1;
    int _2716 = _2186 * _2706;
    int _2718 = _2716 + _2368;
    bool _2720 = !_1942;
    float _2722 = _2720 ? _177 : as_type<float>(_2680);
    int _2724 = _2714 * _2648;
    int _2726 = _2724 + _2394;
    float _2728 = trunc(_2658);
    float _2730 = precise::max(_2728, 0.0);
    uint _2732 = uint(_2730);
    bool _2734 = !_2696;
    int _2736 = _2734 ? 0 : (-1);
    int _2738 = int(_2564) + int(_2686);
    bool _2740 = _834 > 0.5;
    bool _2742 = _2186 == 0;
    int _2744 = ~_2418;
    int _2746 = _2744 + 1;
    bool _2748 = uint(_2726) >= uint(_2230);
    float _2750 = -_177;
    float _2752 = _2740 ? _2750 : _177;
    bool _2754 = !_2742;
    int _2756 = _2754 ? _2718 : (-1);
    bool _2758 = _2708 > 0.0;
    bool _2760 = _2708 >= 0.0;
    bool _2762 = isnan(_2708);
    bool _2764 = _2760 || _2762;
    bool _2766 = isnan(0.0);
    bool _2768 = _2764 || _2766;
    int _2770 = _2746 * _2738;
    int _2772 = _2770 + _2452;
    bool _2774 = !_2748;
    int _2776 = _2774 ? 0 : (-1);
    int _2778 = int(_2586) + int(_2732);
    int _2780 = ~_2390;
    int _2782 = _2780 + 1;
    bool _2784 = uint(_2700) >= uint(_2262);
    int _2786 = ~_2648;
    int _2788 = _2786 + _2776;
    int _2790 = _2788 + 1;
    int _2792 = _2782 * _2778;
    int _2794 = _2792 + _2456;
    bool _2796 = !_2080;
    float _2798 = _2796 ? _177 : _2752;
    bool _2800 = uint(_2772) >= uint(_2418);
    int _2802 = _2230 * _2790;
    int _2804 = _2802 + _2394;
    bool _2806 = !_2784;
    int _2808 = _2806 ? 0 : (-1);
    bool _2810 = !_2800;
    int _2812 = _2810 ? 0 : (-1);
    bool _2814 = _2230 == 0;
    float _2816 = as_type<float>(_2790);
    float _2818 = as_type<float>(_2648);
    float _2820 = as_type<float>(_2390);
    float _2822 = _2752;
    float _2824 = _2424;
    float _2826 = as_type<float>(_2186);
    if (!_2614)
    {
        _2816 = _836;
    }
    float _2828 = _2816;
    int _2830 = ~_2688;
    int _2832 = _2830 + _2808;
    int _2834 = _2832 + 1;
    bool _2836 = !_2814;
    int _2838 = _2836 ? _2804 : (-1);
    bool _2840 = uint(_2794) >= uint(_2390);
    float _2842 = _838 * 2.0;
    bool _2844 = _886 != 2;
    int _2846 = _2262 * _2834;
    int _2848 = _2846 + _2416;
    float _2850 = _2828;
    if (!_2614)
    {
        _2818 = _2828;
    }
    float _2852 = _2818;
    float _2854 = _2852;
    if (!_2614)
    {
        _2820 = _838;
    }
    float _2856 = _2820;
    float _2858 = floor(_2842);
    float _2860 = _2856;
    if (!_2614)
    {
        _2822 = _838;
    }
    float _2862 = _2822;
    float _2864 = _2862;
    if (_2614)
    {
        _2854 = _834;
    }
    float _2866 = _2854;
    if (_2614)
    {
        _2850 = _834;
    }
    float _2868 = _2850;
    if (_2614)
    {
        _2860 = _836;
    }
    float _2870 = _2860;
    float _2872 = _2866 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_2614)
    {
        _2864 = _836;
    }
    float _2874 = _2864;
    bool _2876 = _2262 == 0;
    int _2878 = _2368 ^ _2186;
    bool _2880 = !_2876;
    int _2882 = _2880 ? _2848 : (-1);
    bool _2884 = _2230 == 0;
    int _2886 = _2394 ^ _2230;
    uint _2888 = uint(int(uint(_2878) >> uint(31)));
    uint _2890 = uint(int(uint(_2886) >> uint(31)));
    int _2892 = ~_2736;
    int _2894 = _2668 + _2892;
    int _2896 = _2894 + 1;
    int _2898 = ~int(_2888);
    int _2900 = _2898 + 1;
    int _2902 = ~_2812;
    int _2904 = _2738 + _2902;
    int _2906 = _2904 + 1;
    int _2908 = ~int(_2890);
    int _2910 = _2908 + 1;
    int _2912 = _2896 ^ _2900;
    int _2914 = _2906 ^ _2910;
    float _2916 = fma((*spvDescriptorSet0.vp_c10)._m0[18].z, (*spvDescriptorSet0.vp_c10)._m0[18].z, _2616);
    bool _2918 = !_2840;
    int _2920 = _2918 ? 0 : (-1);
    bool _2922 = _2186 == 0;
    float _2924 = fma((*spvDescriptorSet0.vp_c10)._m0[19].z, (*spvDescriptorSet0.vp_c10)._m0[19].z, _2424);
    int _2926 = ~_2900;
    int _2928 = _2926 + _2912;
    int _2930 = _2928 + 1;
    float _2932 = sqrt(_2916);
    int _2934 = ~_2910;
    int _2936 = _2934 + _2914;
    int _2938 = _2936 + 1;
    float _2940 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2942 = _709 + _2940;
    if (_2844)
    {
        _2824 = _834;
    }
    float _2944 = _2824;
    float _2946 = _2944;
    if (_2844)
    {
        _2826 = _836;
    }
    float _2948 = _2826;
    float _2950 = fma(_2710, _2942, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _2952 = sqrt(_2924);
    float _2954 = _2948;
    if (!_2844)
    {
        _2946 = _838;
    }
    float _2956 = _2946;
    if (!_2844)
    {
        _2954 = _834;
    }
    float _2958 = _2954;
    float _2960 = fma((*spvDescriptorSet0.vp_c10)._m0[20].z, (*spvDescriptorSet0.vp_c10)._m0[20].z, _2500);
    bool _2962 = !_2922;
    int _2964 = _2962 ? _2930 : (-1);
    bool _2966 = !_2884;
    int _2968 = _2966 ? _2938 : (-1);
    float _2970 = _2932 * _2142;
    int _2972 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2974 = _2972 != 0;
    int _2976 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2978 = _2976 != 0;
    int _2980 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2982 = _2980 != 0;
    float _2984 = _2958 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    bool _2986 = _709 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2988 = isnan(_709);
    bool _2990 = _2986 || _2988;
    bool _2992 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2994 = _2990 || _2992;
    float _2996 = float(_2994);
    bool _2998 = _709 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _3000 = isnan(_709);
    bool _3002 = _2998 || _3000;
    bool _3004 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _3006 = _3002 || _3004;
    float _3008 = float(_3006);
    bool _3010 = !_2974;
    int _3012 = _3010 ? 0 : 1;
    float _3014 = -_2996;
    float _3016 = _3014 + 1.0;
    bool _3018 = _2858 >= 0.0;
    bool _3020 = isnan(_2858);
    bool _3022 = _3018 || _3020;
    bool _3024 = isnan(0.0);
    bool _3026 = _3022 || _3024;
    float _3028 = sqrt(_2960);
    float _3030 = _2952 * _2206;
    int _3032 = _3026 ? 0 : 1;
    bool _3034 = _2858 > 0.0;
    float _3036 = _3008 * _3016;
    float _3038 = -_3008;
    float _3040 = _3038 + 1.0;
    float _3042 = _2152 + (*spvDescriptorSet0.vp_c10)._m0[17].z;
    float _3044 = _2950 * _3036;
    float _3046 = _3030 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _3048 = ~_3032;
    int _3050 = _3048 + 1;
    int _3052 = _3050 + 1;
    float _3054 = fma(_3040, (*spvDescriptorSet0.vp_c9)._m0[131].x, _3044);
    float _3056 = _3028 * _3042;
    int _3058 = _2416 ^ _2262;
    float _3060 = _3030 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _3062 = _3052;
    if (!_3034)
    {
        int _3064 = ~_3032;
        int _3066 = _3064 + 1;
        _3062 = _3066;
    }
    int _3068 = _3062;
    float _3070 = fma(_2996, (*spvDescriptorSet0.vp_c9)._m0[132].x, _3054);
    float _3072 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _3074 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _3076 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _3078 = _3070 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _3080 = _3072 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3082 = _3074 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3084 = _3076 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3086 = fma(_2970, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3046);
    uint _3088 = uint(int(uint(_3058) >> uint(31)));
    float _3090 = fma(_2970, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3060);
    out.m_64.x = _3080;
    out.m_64.y = _3082;
    out.m_64.z = _3084;
    out.m_64.w = _3078;
    float _3092 = fma(_3056, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3086);
    int _3094 = ~int(_3088);
    int _3096 = _3094 + 1;
    float _3098 = _3030 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3100 = fma(_3056, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3090);
    float _3102 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _3104 = fma(_2238, (*spvDescriptorSet0.vp_c8)._m0[25].w, _3092);
    float _3106 = _2956 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _3108 = fma(_2970, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3098);
    float _3110 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _3112 = abs(_3012);
    float _3114 = -_3102;
    float _3116 = fma(_3106, 2.0, _3114);
    bool _3118 = _2262 == 0;
    float _3120 = fma(_3056, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3108);
    float _3122 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _3124 = _2870 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _3126 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _3128 = fma(_2868, (*spvDescriptorSet0.vp_c9)._m0[83].z, _3122);
    int _3130 = ~_2920;
    int _3132 = _2778 + _3130;
    int _3134 = _3132 + 1;
    float _3136 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _3138 = -_141;
    float _3140 = fma(_3138, (*spvDescriptorSet0.vp_c9)._m0[86].x, _3116);
    int _3142 = _3134 ^ _3096;
    float _3144 = fma(_2874, (*spvDescriptorSet0.vp_c9)._m0[83].w, _3136);
    float _3146 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _3148 = ~_3096;
    int _3150 = _3148 + _3142;
    int _3152 = _3150 + 1;
    float _3154 = _3104 + (*spvDescriptorSet0.vp_c10)._m0[21].y;
    float _3156 = float(_3068);
    float _3158 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _3160 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _3162 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _3164 = float(_3112);
    float _3166 = fma(_2984, -2.0, _3158);
    float _3168 = -_3160;
    float _3170 = fma(_2872, 2.0, _3168);
    float _3172 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _3174 = float(_2756);
    float _3176 = _3110 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _3178 = float(_2882);
    float _3180 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _3182 = float(_2838);
    float _3184 = _3126 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _3186 = -_141;
    float _3188 = fma(_3186, (*spvDescriptorSet0.vp_c9)._m0[81].x, _3170);
    float _3190 = fma(_3124, -2.0, _3172);
    float _3192 = fma(_3176, _3174, _2272);
    float _3194 = float(_2968);
    float _3196 = fma(_3184, _3182, _3188);
    float _3198 = _3162 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _3200 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _3202 = float(_2964);
    float _3204 = _2722 + 0.5;
    float _3206 = fma(_3198, _3178, _3140);
    float _3208 = _3146 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _3210 = _2798 + 0.5;
    float _3212 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2180);
    float _3214 = fma(_3184, _3204, _3196);
    float _3216 = fma(_3176, _3210, _3192);
    float _3218 = -_3212;
    float _3220 = fma(_3208, _3202, _3218);
    float _3222 = _3180 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _3224 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[81].y, _3190);
    bool _3226 = !_3118;
    int _3228 = _3226 ? _3152 : (-1);
    float _3230 = _1020 + 0.5;
    float _3232 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[86].y, _3166);
    float _3234 = -_3224;
    float _3236 = fma(_3222, _3194, _3234);
    float _3238 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _3240 = float(_3228);
    float _3242 = _3200 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _3244 = fma(_834, (*spvDescriptorSet0.vp_c9)._m0[78].z, _3238);
    float _3246 = fma(_3198, _3230, _3206);
    float _3248 = -_3232;
    float _3250 = fma(_3242, _3240, _3248);
    float _3252 = fma(_2238, (*spvDescriptorSet0.vp_c8)._m0[24].w, _3100);
    float _3254 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _3256 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[77].z, _3244);
    float _3258 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[82].z, _3128);
    float _3260 = fma(_2238, (*spvDescriptorSet0.vp_c8)._m0[26].w, _3120);
    float _3262 = fma(_836, (*spvDescriptorSet0.vp_c9)._m0[78].w, _3254);
    float _3264 = -_3256;
    float _3266 = _3264 + 1.0;
    float _3268 = _3252 + (*spvDescriptorSet0.vp_c10)._m0[21].x;
    float _3270 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3272 = _3154 + _3270;
    float _3274 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[77].w, _3262);
    float _3276 = -_3266;
    float _3278 = fma(_2798, _3276, _3216);
    float _3280 = _2656 + (-0.5);
    float _3282 = -_3258;
    float _3284 = _3282 + 1.0;
    float _3286 = _3260 + (*spvDescriptorSet0.vp_c10)._m0[21].z;
    float _3288 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3290 = _3268 + _3288;
    float _3292 = _3272 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3294 = -_3208;
    float _3296 = fma(_3294, _3280, _3220);
    float _3298 = -_3274;
    float _3300 = _3298 + 1.0;
    float _3302 = -_3284;
    float _3304 = fma(_2722, _3302, _3214);
    float _3306 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _3308 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _3310 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3312 = _3286 + _3310;
    float _3314 = fma(_3290, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3292);
    float _3316 = fma(_2656, _3300, _3296);
    float _3318 = _1192 + (-0.5);
    float _3320 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _3322 = log2(_3320);
    float _3324 = fma(_834, (*spvDescriptorSet0.vp_c9)._m0[88].z, _3306);
    float _3326 = fma(_836, (*spvDescriptorSet0.vp_c9)._m0[88].w, _3308);
    float _3328 = fma(_3312, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3314);
    float _3330 = -_3222;
    float _3332 = fma(_3330, _3318, _3236);
    float _3334 = _3272 * _3272;
    float _3336 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[87].z, _3324);
    float _3338 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[87].w, _3326);
    float _3340 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[82].w, _3144);
    float _3342 = _1024 + (-0.5);
    bool _3344 = _3328 >= 0.0;
    float _3346 = fma(_3290, _3290, _3334);
    float _3348 = -_3336;
    float _3350 = _3348 + 1.0;
    float _3352 = -_3340;
    float _3354 = _3352 + 1.0;
    float _3356 = -_3338;
    float _3358 = _3356 + 1.0;
    float _3360 = -_3242;
    float _3362 = fma(_3360, _3342, _3250);
    float _3364 = fma(_3312, _3312, _3346);
    float _3366 = -_3350;
    float _3368 = fma(_1020, _3366, _3246);
    float _3370 = fma(_1192, _3354, _3332);
    float _3372 = fma(_1024, _3358, _3362);
    float _3374 = in.m_66.x;
    float _3376 = in.m_66.y;
    float _3378 = in.m_66.z;
    float _3380 = _3322 * _141;
    bool _3382 = !_2978;
    int _3384 = _3382 ? 0 : 1;
    float _3386 = rsqrt(_3364);
    bool _3388 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3390 = isnan(1.0);
    bool _3392 = _3388 || _3390;
    bool _3394 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3396 = _3392 || _3394;
    float _3398 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _3400 = 1.0 + _3398;
    float _3402 = _3342;
    int _3404 = as_type<int>(_3336);
    float _3406 = _3268;
    if (_3344)
    {
        _3402 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3408 = _3402;
    out.m_68.x = _3278;
    out.m_68.y = _3316;
    out.m_68.z = _3304;
    out.m_68.w = _3370;
    float _3410 = _3164 * _3156;
    float _3412 = exp2(_3380);
    if (_3344)
    {
        float _3414 = _3408 * 5.0;
        _3404 = as_type<int>(_3414);
    }
    int _3416 = _3404;
    out.m_70.x = _3368;
    out.m_70.y = _3372;
    bool _3418 = !_2982;
    int _3420 = _3418 ? 0 : 1;
    bool _3422 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3424 = isnan(0.0);
    bool _3426 = _3422 || _3424;
    bool _3428 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3430 = _3426 || _3428;
    if (_3344)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9899 = as_type<float>(_3416);
        out.gl_Position.z = _9899;
    }
    float _3432 = 1.0 / _3400;
    float _3434 = _3272 * _3386;
    if (_3344)
    {
        out.m_51.x = 0.0;
    }
    float _3436 = _3290 * _3386;
    if (_3344)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3438 = -_3434;
    float _3440 = fma(_3438, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3154);
    float _3442 = _3312 * _3386;
    float _3444 = -_3436;
    float _3446 = fma(_3444, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3268);
    float _3448 = -_3412;
    float _3450 = _3448 + 1.0;
    float _3452 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3454 = _3440 + _3452;
    float _3456 = -_3442;
    float _3458 = fma(_3456, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3286);
    float _3460 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3462 = _3446 + _3460;
    int _3464 = _2536 ? 0 : 1;
    float _3466 = _3454 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3468 = _3430 ? _3450 : 0.0;
    float _3470 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3472 = _3458 + _3470;
    int _3474 = ~_3464;
    int _3476 = _3474 + 1;
    int _3478 = _3476 + 1;
    float _3480 = fma(_3462, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3466);
    float _3482 = _3410 * (-2.0);
    int _3484 = _3478;
    if (!_2524)
    {
        int _3486 = ~_3464;
        int _3488 = _3486 + 1;
        _3484 = _3488;
    }
    int _3490 = _3484;
    float _3492 = -_3434;
    float _3494 = fma(_3492, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3272);
    float _3496 = fma(_3472, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3480);
    int _3498 = abs(_3384);
    if (_3396)
    {
        float _3500 = _3468 * _3432;
        _145 = _3500;
    }
    float _3502 = _145;
    float _3504 = fma(_2690, _3482, _2690);
    float _3506 = fma(_3482, _3374, _3374);
    float _3508 = _834 + (-0.5);
    float _3510 = float(_3490);
    float _3512 = -_3436;
    float _3514 = fma(_3512, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3290);
    float _3516 = float(_3498);
    float _3518 = _3494 * _3494;
    bool _3520 = _3496 >= 0.0;
    float _3522 = fma(_3508, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3506);
    float _3524 = -_3442;
    float _3526 = fma(_3524, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3312);
    float _3528 = fma(_3514, _3514, _3518);
    float _3530 = _3516 * _3510;
    int _3532 = _2768 ? 0 : 1;
    float _3534 = fma(_3504, _3502, _3522);
    float _3536 = fma(_3526, _3526, _3528);
    float _3538 = _3530 * (-2.0);
    int _3540 = ~_3532;
    int _3542 = _3540 + 1;
    int _3544 = _3542 + 1;
    float _3546 = _3534 * 0.15915493667125701904296875;
    int _3548 = _3544;
    float _3550 = _3510;
    if (!_2758)
    {
        int _3552 = ~_3532;
        int _3554 = _3552 + 1;
        _3548 = _3554;
    }
    int _3556 = _3548;
    float _3558 = fma(_2592, _3538, _2592);
    if (_3520)
    {
        _3550 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3560 = _3550;
    float _3562 = fma(_3538, _3376, _3376);
    float _3564 = sqrt(_3536);
    int _3566 = as_type<int>(_3560);
    if (_3520)
    {
        out.m_51.x = 0.0;
    }
    if (_3520)
    {
        float _3568 = _3560 * 5.0;
        _3566 = as_type<int>(_3568);
    }
    int _3570 = _3566;
    float _3572 = _836 + (-0.5);
    int _3574 = abs(_3420);
    float _3576 = _3546 * 6.283185482025146484375;
    float _3578 = sin(_3576);
    if (_3520)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _10141 = as_type<float>(_3570);
        out.gl_Position.z = _10141;
    }
    if (_3520)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3580 = -_3154;
    float _3582 = _3580 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3584 = -_3268;
    float _3586 = _3584 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3588 = float(_3556);
    float _3590 = -_3286;
    float _3592 = _3590 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3594 = _3582 * _3582;
    float _3596 = float(_3574);
    float _3598 = fma(_3572, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3562);
    float _3600 = _834 + _838;
    float _3602 = fma(_3586, _3586, _3594);
    float _3604 = _3596 * _3588;
    float _3606 = fma(_3558, _3502, _3598);
    float _3608 = fma(_3592, _3592, _3602);
    float _3610 = _3600 + (-1.0);
    float _3612 = _3604 * (-2.0);
    float _3614 = _3606 * 0.15915493667125701904296875;
    float _3616 = _838 + (-0.5);
    float _3618 = fma(_3610, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3620 = rsqrt(_3608);
    float _3622 = fma(_3612, _3378, _3378);
    float _3624 = _567 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3626 = fma(_3618, _3612, _3618);
    float _3628 = _565 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _3630 = fma(_3616, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3622);
    float _3632 = _3546 * 6.283185482025146484375;
    float _3634 = cos(_3632);
    float _3636 = fma(_3626, _3502, _3630);
    float _3638 = _3636 * 0.15915493667125701904296875;
    float _3640 = _3586 * _3620;
    float _3642 = _3592 * _3620;
    float _3644 = _3582 * _3620;
    float _3646 = _3614 * 6.283185482025146484375;
    float _3648 = sin(_3646);
    float _3650 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _3652 = _3640 * _3650;
    float _3654 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3656 = _3642 * _3654;
    float _3658 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _3660 = -_3652;
    float _3662 = fma(_3642, _3658, _3660);
    float _3664 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _3666 = _3644 * _3664;
    float _3668 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _3670 = -_3656;
    float _3672 = fma(_3644, _3668, _3670);
    float _3674 = _3614 * 6.283185482025146484375;
    float _3676 = cos(_3674);
    float _3678 = _3662 * _3662;
    float _3680 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3682 = -_3666;
    float _3684 = fma(_3640, _3680, _3682);
    float _3686 = _3386 * _3564;
    float _3688 = fma(_3672, _3672, _3678);
    float _3690 = _3686 * _3628;
    float _3692 = _3638 * 6.283185482025146484375;
    float _3694 = cos(_3692);
    float _3696 = fma(_3684, _3684, _3688);
    float _3698 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _181);
    float _3700 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _177);
    float _3702 = _3578 * _3648;
    float _3704 = _3634 * _3648;
    float _3706 = _3686 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _3708 = _3706 * 0.5;
    float _3710 = _3700 * _3690;
    float _3712 = _3638 * 6.283185482025146484375;
    float _3714 = sin(_3712);
    float _3716 = _3634 * _3676;
    float _3718 = _3578 * _3676;
    float _3720 = _181 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3722 = rsqrt(_3696);
    float _3724 = _3634 * _3694;
    float _3726 = _3578 * _3694;
    float _3728 = _3648 * _3694;
    float _3730 = fma(_3714, _3716, _3702);
    float _3732 = _3686 * _3624;
    float _3734 = fma(_3714, _3702, _3716);
    float _3736 = _3676 * _3694;
    float _3738 = -_3704;
    float _3740 = fma(_3714, _3718, _3738);
    float _3742 = _3698 * _3732;
    float _3744 = -_3718;
    float _3746 = fma(_3714, _3704, _3744);
    float _3748 = _3672 * _3722;
    float _3750 = _3662 * _3722;
    float _3752 = _3724 * _3742;
    float _3754 = _3684 * _3722;
    float _3756 = -_3742;
    float _3758 = _3714 * _3756;
    float _3760 = _3642 * _3750;
    float _3762 = fma(_3730, _3710, _3752);
    float _3764 = _3644 * _3748;
    float _3766 = _3726 * _3742;
    float _3768 = fma(_3736, _3710, _3758);
    float _3770 = fma(_3746, _3708, _3762);
    float _3772 = -_3760;
    float _3774 = fma(_3644, _3754, _3772);
    float _3776 = -_3764;
    float _3778 = fma(_3640, _3750, _3776);
    float _3780 = fma(_3740, _3710, _3766);
    float _3782 = fma(_3728, _3708, _3768);
    float _3784 = _3774 * _3770;
    float _3786 = _3778 * _3770;
    float _3788 = fma(_3734, _3708, _3780);
    float _3790 = _3730 * _3774;
    float _3792 = fma(_3748, _3782, _3784);
    float _3794 = fma(_3754, _3782, _3786);
    float _3796 = _3730 * _3778;
    float _3798 = _3724 * _3774;
    float _3800 = fma(_3640, _3788, _3792);
    float _3802 = fma(_3642, _3788, _3794);
    float _3804 = _3640 * _3754;
    float _3806 = _3724 * _3778;
    float _3808 = _3268 + _3800;
    float _3810 = _3286 + _3802;
    float _3812 = -_3804;
    float _3814 = fma(_3642, _3748, _3812);
    float _3816 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3818 = _3808 + _3816;
    float _3820 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3822 = _3810 + _3820;
    float _3824 = _3730 * _3814;
    float _3826 = _3724 * _3814;
    float _3828 = _3818 * _3818;
    float _3830 = _3822 * _3822;
    float _3832 = _3746 * _3814;
    float _3834 = _3814 * _3770;
    float _3836 = fma(_3736, _3748, _3790);
    float _3838 = _3828 + _3830;
    float _3840 = _3746 * _3774;
    float _3842 = fma(_3720, _3720, 1.0);
    float _3844 = _3746 * _3778;
    float _3846 = sqrt(_3838);
    float _3848 = fma(_3736, _3750, _3824);
    float _3850 = fma(_3736, _3754, _3796);
    float _3852 = fma(_3750, _3782, _3834);
    float _3854 = -_3714;
    float _3856 = fma(_3854, _3748, _3798);
    float _3858 = -_3714;
    float _3860 = fma(_3858, _3750, _3826);
    float _3862 = -_3714;
    float _3864 = fma(_3862, _3754, _3806);
    float _3866 = fma(_3644, _3788, _3852);
    float _3868 = rsqrt(_3842);
    float _3870 = fma(_3728, _3748, _3840);
    float _3872 = fma(_3728, _3750, _3832);
    float _3874 = _3154 + _3866;
    float _3876 = fma(_3728, _3754, _3844);
    bool _3878 = _3846 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3880 = _3840;
    float _3882 = _3828;
    float _3884 = _3830;
    float _3886 = _3808;
    float _3888 = _3810;
    if (!_3878)
    {
        _3880 = _3874;
    }
    float _3890 = _3880;
    bool _3892 = !_3878;
    float _3894 = _3890;
    if (!_3892)
    {
        float _3896 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3898 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3900 = _3846 + _3898;
        float _3902 = rsqrt(_3838);
        float _3904 = _3900 * _3896;
        float _3906 = _3874 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3908 = _3904 * 0.15915493667125701904296875;
        float _3910 = _3908 * 6.283185482025146484375;
        float _3912 = sin(_3910);
        float _3914 = _3908 * 6.283185482025146484375;
        float _3916 = cos(_3914);
        float _3918 = fma(_3912, _3906, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3920 = _3902 * _3918;
        float _3922 = _3916 + (-1.0);
        float _3924 = fma(_3818, _3920, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3926 = fma(_3822, _3920, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _3928 = _3922 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3930 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _3932 = _3924 + _3930;
        float _3934 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _3936 = _3926 + _3934;
        float _3938 = fma(_3874, _3916, _3928);
        float _3940 = _3932 * _3932;
        float _3942 = _3936 * _3936;
        _3894 = _3938;
        _3882 = _3940;
        _3884 = _3942;
        _3886 = _3924;
        _3888 = _3926;
    }
    float _3944 = _3894;
    float _3946 = _3882;
    float _3948 = _3884;
    float _3950 = _3886;
    float _3952 = _3888;
    float _3954 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _3956 = _3944 + _3954;
    float _3958 = fma(_3726, _3640, _3856);
    float _3960 = fma(_3726, _3644, _3860);
    float _3962 = fma(_3726, _3642, _3864);
    float _3964 = fma(_3956, _3956, _3946);
    float _3966 = fma(_3734, _3640, _3870);
    float _3968 = fma(_3734, _3644, _3872);
    float _3970 = fma(_3734, _3642, _3876);
    float _3972 = _3964 + _3948;
    float _3974 = _3720 * _3868;
    float _3976 = fma(_3740, _3640, _3836);
    float _3978 = _177 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3980 = _3720 * _3958;
    float _3982 = _3720 * _3960;
    float _3984 = fma(_3740, _3644, _3848);
    float _3986 = fma(_3740, _3642, _3850);
    float _3988 = _3720 * _3962;
    float _3990 = -_3966;
    float _3992 = _3974 * _3990;
    float _3994 = -_3968;
    float _3996 = _3974 * _3994;
    float _3998 = -_3970;
    float _4000 = _3974 * _3998;
    float _4002 = sqrt(_3972);
    float _4004 = fma(_3978, _3976, _3980);
    float _4006 = fma(_3978, _3984, _3982);
    float _4008 = fma(_3978, _3986, _3988);
    float _4010 = fma(_3868, _3958, _3992);
    float _4012 = fma(_3868, _3960, _3996);
    float _4014 = fma(_3868, _3962, _4000);
    float _4016 = _3966 + _4004;
    float _4018 = _3968 + _4006;
    float _4020 = _3970 + _4008;
    out.m_72.x = _3976;
    out.m_72.y = _3984;
    out.m_72.z = _3986;
    out.m_74.x = _4010;
    out.m_74.y = _4012;
    out.m_74.z = _4014;
    bool _4022 = _4002 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _4024 = isnan(_4002);
    bool _4026 = _4022 || _4024;
    bool _4028 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _4030 = _4026 || _4028;
    out.m_76.x = _4016;
    out.m_76.y = _4018;
    out.m_76.z = _4020;
    float _4032 = _4006;
    float _4034 = _3982;
    float _4036 = _4008;
    if (!_4030)
    {
        _4032 = 1.0;
    }
    float _4038 = _4032;
    bool _4040 = !_4030;
    float _4042 = _4038;
    if (!_4040)
    {
        bool _4044 = _4002 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _4046 = isnan(_4002);
        bool _4048 = _4044 || _4046;
        bool _4050 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _4052 = _4048 || _4050;
        if (!_4052)
        {
            float _4054 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4056 = _4002 + _4054;
            float _4058 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4060 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _4058;
            float _4062 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _4064 = _4062 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _4066 = 1.0 / _4060;
            float _4068 = _4056 * _4066;
            float _4070 = fma(_4068, _4064, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _4042 = _4070;
            _4072 = true;
        }
        else
        {
            bool _4074 = _4002 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _4076 = isnan(_4002);
            bool _4078 = _4074 || _4076;
            bool _4080 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _4082 = _4078 || _4080;
            if (!_4082)
            {
                float _4084 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4086 = _4002 + _4084;
                float _4088 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4090 = _4088 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _4092 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _4094 = _4092 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _4096 = 1.0 / _4090;
                float _4098 = _4086 * _4096;
                float _4100 = fma(_4098, _4094, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _4042 = _4100;
                _4072 = true;
            }
            else
            {
                _4042 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _4072 = false;
    float _4102 = _4042;
    float _4104 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _4106 = _3950 + _4104;
    float _4108 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _4110 = _3952 + _4108;
    bool _4112 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _4114 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _4116 = _4112 || _4114;
    bool _4118 = isnan(0.5);
    bool _4120 = _4116 || _4118;
    float _4122 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _4124 = _3944 + _4122;
    float _4126 = fma(_4106, _4102, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _4128 = fma(_4110, _4102, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _4130 = fma(_4124, _4102, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _4132 = -_3436;
    float _4134 = fma(_4132, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4126);
    float _4136 = -_3442;
    float _4138 = fma(_4136, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4128);
    float _4140 = -_3434;
    float _4142 = fma(_4140, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4130);
    float _4144 = _4142;
    float _4146 = _4134;
    float _4148 = _4138;
    if (!_4120)
    {
        float _4150 = _3454 * _3454;
        float _4152 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _4154 = -_3286;
        float _4156 = _4154 + _4128;
        float _4158 = -_3268;
        float _4160 = _4158 + _4126;
        float _4162 = fma(_3462, _3462, _4150);
        float _4164 = -_3154;
        float _4166 = _4164 + _4130;
        float _4168 = fma(_3472, _3472, _4162);
        float _4170 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _4172 = sqrt(_4168);
        float _4174 = 1.0 / _3686;
        float _4176 = _4170 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _4178 = precise::min(_4172, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _4180 = _4178 * _4152;
        float _4182 = _4180 * _4174;
        float _4184 = _4176 * _4182;
        float _4186 = _4156 * _4182;
        float _4188 = fma(_4160, _4184, _3446);
        float _4190 = fma(_4166, _4184, _3440);
        float _4192 = fma(_4176, _4186, _3458);
        _4144 = _4190;
        _4146 = _4188;
        _4148 = _4192;
    }
    float _4194 = _4144;
    float _4196 = _4146;
    float _4198 = _4148;
    float _4200 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4202 = _4194 + _4200;
    float _4204 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4206 = _4196 + _4204;
    float _4208 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4210 = _4198 + _4208;
    float _4212 = _4202 * _4202;
    float _4214 = fma(_4206, _4206, _4212);
    float _4216 = fma(_4210, _4210, _4214);
    float _4218 = rsqrt(_4216);
    float _4220 = sqrt(_4216);
    float _4222 = _4218 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4224 = _4206 * _4222;
    float _4226 = _4210 * _4222;
    float _4228 = _4224 * _4224;
    float _4230 = _4226 * _4226;
    float _4232 = _4228 + _4230;
    float _4234 = sqrt(_4232);
    bool _4236 = _4234 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4238 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4240 = _4234 + _4238;
    float _4242 = _4218;
    float _4244 = _4240;
    float _4246 = _4202;
    if (_4236)
    {
        float _4248 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4242 = _4248;
    }
    float _4250 = _4242;
    if (_4236)
    {
        float _4252 = rsqrt(_4232);
        _4034 = _4252;
    }
    float _4254 = _4034;
    float _4256 = _4254;
    if (_4236)
    {
        float _4258 = _4240 * _4250;
        _4244 = _4258;
    }
    float _4260 = _4244;
    if (_4236)
    {
        float _4262 = _4260 * 0.15915493667125701904296875;
        _3406 = _4262;
    }
    float _4264 = _3406;
    float _4266 = _4250;
    if (_4236)
    {
        float _4268 = _4264 * 6.283185482025146484375;
        float _4270 = sin(_4268);
        _4266 = _4270;
    }
    float _4272 = _4266;
    float _4274 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4276 = precise::max(0.0, _4274);
    float _4278 = _4210;
    float _4280 = _4276;
    if (_4236)
    {
        float _4282 = _4264 * 6.283185482025146484375;
        float _4284 = cos(_4282);
        _4278 = _4284;
    }
    float _4286 = _4278;
    float _4288 = -_4222;
    float _4290 = -_4276;
    float _4292 = fma(_4202, _4288, _4290);
    float _4294 = _4292;
    if (_4236)
    {
        float _4296 = _4292 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4280 = _4296;
    }
    float _4298 = _4280;
    float _4300 = _4272;
    float _4302 = _4298;
    if (_4236)
    {
        float _4304 = fma(_4272, _4298, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4300 = _4304;
    }
    float _4306 = _4300;
    float _4308 = _4306;
    if (!_4236)
    {
        _4302 = _4228;
    }
    float _4310 = _4302;
    float _4312 = _4310;
    float _4314 = _4286;
    if (_4236)
    {
        float _4316 = _4286 + (-1.0);
        _4246 = _4316;
    }
    float _4318 = _4246;
    float _4320 = _4318;
    if (_4236)
    {
        float _4322 = _4254 * _4306;
        _4036 = _4322;
    }
    float _4324 = _4036;
    if (!_4236)
    {
        _4256 = _4224;
    }
    float _4326 = _4256;
    float _4328 = _4326;
    if (_4236)
    {
        float _4330 = _4318 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4320 = _4330;
    }
    float _4332 = _4320;
    if (_4236)
    {
        float _4334 = _4224 * _4324;
        _4328 = _4334;
    }
    float _4336 = _4328;
    if (!_4236)
    {
        _4308 = _4226;
    }
    float _4338 = _4308;
    float _4340 = _4338;
    if (_4236)
    {
        float _4342 = _4226 * _4324;
        _4340 = _4342;
    }
    float _4344 = _4340;
    if (_4236)
    {
        float _4346 = fma(_4292, _4286, _4332);
        _4294 = _4346;
    }
    float _4348 = _4294;
    if (_4236)
    {
        float _4350 = _4336 * _4336;
        _4312 = _4350;
    }
    float _4352 = _4312;
    if (!_4236)
    {
        _4314 = _4230;
    }
    float _4354 = _4314;
    float _4356 = _4354;
    if (_4236)
    {
        float _4358 = _4344 * _4344;
        _4356 = _4358;
    }
    float _4360 = _4356;
    float _4362 = fma(_4348, _4348, _4352);
    float _4364 = _4194 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4366 = _4194 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4368 = _4362 + _4360;
    float _4370 = fma(_4196, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4364);
    float _4372 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4374 = fma(_4220, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4372);
    float _4376 = precise::clamp(_4374, 0.0, 1.0);
    float _4378 = rsqrt(_4368);
    float _4380 = fma(_4198, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4370);
    float _4382 = -_4376;
    float _4384 = _4382 + 1.0;
    float _4386 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4388 = _4380 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4390 = fma(_3446, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _4392 = fma(_4196, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4366);
    float _4394 = abs(_4384);
    float _4396 = log2(_4394);
    float _4398 = _4388 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4400 = _4194 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4402 = fma(_3458, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4404 = -_4398;
    float _4406 = fma(_4404, _4386, 1.0);
    float _4408 = _4194 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4410 = fma(_4196, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4400);
    float _4412 = _4378 * _4336;
    float _4414 = _4378 * _4348;
    float _4416 = fma(_4196, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4408);
    float _4418 = fma(_4198, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4410);
    float _4420 = _4378 * _4344;
    float _4422 = _4412 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4424 = fma(_4198, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4416);
    float _4426 = _4418 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4428 = floor(_4390);
    float _4430 = -_4422;
    float _4432 = fma(_4414, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4430);
    float _4434 = _4424 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4436 = _4426 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4438 = _4396 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4440 = -_4420;
    float _4442 = fma(_4440, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4432);
    float _4444 = fma(_4198, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4392);
    float _4446 = fma(_4434, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4436);
    float _4448 = floor(_4402);
    float _4450 = fma(_4442, -0.5, 0.5);
    float _4452 = _4444 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4454 = fma(_4388, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4446);
    float _4456 = _4426 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4458 = fma(_4442, 0.5, 0.5);
    float _4460 = fma(_4452, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4454);
    float _4462 = exp2(_4438);
    float _4464 = -_4428;
    float _4466 = _4390 + _4464;
    float _4468 = fma(_4434, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4456);
    float _4470 = _4414 + 1.0;
    float _4472 = fma(_4388, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4468);
    float _4474 = log2(_4406);
    float _4476 = _4426 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4478 = -_4448;
    float _4480 = _4402 + _4478;
    float _4482 = fma(_4458, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4484 = fma(_4452, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4472);
    float _4486 = fma(_4434, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4476);
    float _4488 = fma(_4458, _4482, -0.212114393711090087890625);
    float _4490 = 1.0 / _4460;
    float _4492 = fma(_4388, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4486);
    float _4494 = -_4414;
    float _4496 = fma(_4462, _4470, _4494);
    float _4498 = sqrt(_4450);
    float _4500 = fma(_4452, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4492);
    float _4502 = _4474 * 0.693147182464599609375;
    float2 _11649 = float2(_4466, _4480);
    float _4504 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_11649, float2(0.0), isnan(_11649)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_11649, float2(0.0), isnan(_11649)), level(0.0)).x;
    float _4506 = fma(_4458, _4488, 1.570728778839111328125);
    float _4508 = fma(_4496, 0.5, 0.5);
    float _4510 = _4502 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4512 = _4484 * _4490;
    float _4514 = _4500 * _4490;
    float _4516 = fma(_4512, 0.5, 0.5);
    float _4518 = fma(_4514, -0.5, 0.5);
    float _4520 = _4498 * 0.636619746685028076171875;
    float3 _11683 = float3(_4516, _4518, _4510);
    float _4522 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_11683, float3(0.0), isnan(_11683)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_11683, float3(0.0), isnan(_11683)), level(0.0)).x;
    float3 _11694 = float3(_4516, _4518, _4510);
    float4 _4525 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_11694, float3(0.0), isnan(_11694)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_11694, float3(0.0), isnan(_11694)), level(0.0)).xyzw;
    float _4527 = _4525.x;
    float _4529 = _4525.y;
    float _4531 = _4525.z;
    float _4533 = _4525.w;
    float _4535 = -_4506;
    float _4537 = fma(_4520, _4535, 1.0);
    float2 _11715 = float2(_4537, _4508);
    float3 _4541 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_11715, float2(0.0), isnan(_11715)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_11715, float2(0.0), isnan(_11715)), level(0.0)).xyz;
    float _4543 = _4541.x;
    float _4545 = _4541.y;
    float _4547 = _4541.z;
    float _4549 = _3440 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4551 = _3440 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _4553 = _4426 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _4555 = _4220 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4557 = isnan(_4220);
    bool _4559 = _4555 || _4557;
    bool _4561 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4563 = _4559 || _4561;
    float _4565 = fma(_3446, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4549);
    float _4567 = fma(_3446, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4551);
    float _4569 = fma(_4434, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4553);
    float _4571 = fma(_3458, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4565);
    float _4573 = fma(_3458, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4567);
    float _4575 = _4396 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4577 = _4571 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4579 = _4573 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4581 = fma(_4388, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4569);
    float _4583 = 1.0 / _4577;
    float _4585 = _4579 + _4577;
    float _4587 = fma(_4452, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4581);
    float _4589 = _4587 + _4460;
    float _4591 = exp2(_4575);
    out.gl_Position.x = _4484;
    out.gl_Position.y = _4500;
    out.gl_Position.z = _4587;
    out.gl_Position.w = _4460;
    float _4593 = _4589 * 0.5;
    float _4595 = _4585 * _4583;
    float _4597 = _4595 * 0.5;
    float _4599 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _4601 = fma(_4597, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4599);
    float _4603 = _4587;
    float _4605 = _4500;
    float _4607 = _4484;
    float _4609 = _4460;
    if (!_4563)
    {
        _4603 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4611 = _4603;
    float _4613 = -_4591;
    float _4615 = _4613 + 1.0;
    float _4617 = _4611;
    float _4619 = _4611;
    if (!_4563)
    {
        _4605 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _4621 = _4605;
    float _4623 = 1.0 / _4601;
    float _4625 = _4621;
    float _4627 = _4621;
    if (!_4563)
    {
        _4607 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4629 = _4607;
    float _4631 = _4615 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _4633 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4635 = _4623 * _4633;
    float _4637 = abs(_4635);
    float _4639 = log2(_4637);
    bool _4641 = _4635 <= 8000.0;
    bool _4643 = isnan(_4635);
    bool _4645 = _4641 || _4643;
    bool _4647 = isnan(8000.0);
    bool _4649 = _4645 || _4647;
    float _4651 = float(_4649);
    float _4653 = _4639 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _4655 = exp2(_4653);
    float _4657 = fma(_4655, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4659 = precise::clamp(_4657, 0.0, 1.0);
    float _4661 = fma(_4659, -2.0, 3.0);
    float _4663 = _4659 * _4659;
    float _4665 = in.m_78.x;
    float _4667 = _4663 * _4661;
    float _4669 = -_4667;
    float _4671 = _4669 + 1.0;
    float _4673 = fma(_4671, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4667);
    float _4675 = _4629;
    float _4677 = _4629;
    if (!_4563)
    {
        _4609 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4679 = _4609;
    float _4681 = _4651 * _4673;
    out.m_80.z = _4593;
    out.m_80.w = _4460;
    float _4683 = _4681 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _4685 = -_4504;
    float _4687 = _4685 + 1.0;
    float _4689 = _4687 * _4683;
    float _4691 = precise::clamp(_4689, 0.0, 1.0);
    float _4693 = -_4691;
    float _4695 = fma(_4693, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4697 = _4695 * _4665;
    float _4699 = _4631 * _4522;
    float _4701 = -_4631;
    float _4703 = _4701 + 1.0;
    float _4705 = _4697 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _4707 = _4533 * _4699;
    float _4709 = _4533 * _4703;
    out.m_82.x = _4705;
    float _4711 = _4547 * _4699;
    float _4713 = fma(_4543, _4707, _4527);
    float _4715 = fma(_4545, _4707, _4529);
    float _4717 = _4707;
    float _4719 = _4527;
    float _4721 = _4679;
    float _4723 = _4679;
    if (!_4563)
    {
        _4717 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4725 = _4717;
    float _4727 = fma(_4533, _4711, _4531);
    float _4729 = _4725;
    float _4731 = _4725;
    if (!_4563)
    {
        _4719 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4733 = _4719;
    out.m_84.x = _4713;
    out.m_84.y = _4715;
    out.m_84.z = _4727;
    out.m_84.w = _4709;
    bool _4735 = !_4563;
    float _4737 = _4733;
    float _4739 = _4733;
    if (!_4735)
    {
        bool _4741 = _4220 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4743 = isnan(_4220);
        bool _4745 = _4741 || _4743;
        bool _4747 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4749 = _4745 || _4747;
        if (!_4749)
        {
            float _4751 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4753 = _4220 + _4751;
            float _4755 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4757 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4755;
            float _4759 = 1.0 / _4757;
            float _4761 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4763 = _4761 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4765 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4767 = _4765 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4769 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _4771 = _4769 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4773 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4775 = _4773 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4777 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4779 = _4777 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4781 = _4753 * _4759;
            float _4783 = precise::clamp(_4781, 0.0, 1.0);
            float _4785 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4787 = _4785 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4789 = fma(_4783, _4763, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4791 = fma(_4783, _4787, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4793 = fma(_4783, _4767, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4795 = fma(_4783, _4771, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4797 = fma(_4783, _4775, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4799 = fma(_4783, _4779, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _4739 = _4791;
            _4627 = _4797;
            _4731 = _4789;
            _4619 = _4795;
            _4723 = _4793;
            _4677 = _4799;
            _4801 = true;
        }
        else
        {
            bool _4803 = _4220 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4805 = isnan(_4220);
            bool _4807 = _4803 || _4805;
            bool _4809 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4811 = _4807 || _4809;
            if (!_4811)
            {
                _4729 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4813 = _4729;
            _4731 = _4813;
            if (!_4811)
            {
                _4737 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4815 = _4737;
            _4739 = _4815;
            if (!_4811)
            {
                _4721 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4817 = _4721;
            _4723 = _4817;
            if (!_4811)
            {
                _4617 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4819 = _4617;
            _4619 = _4819;
            if (!_4811)
            {
                _4625 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4821 = _4625;
            _4627 = _4821;
            if (!_4811)
            {
                _4675 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4823 = _4675;
            bool _4825 = !_4811;
            _4677 = _4823;
            if (!_4825)
            {
                bool _4827 = _4220 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4829 = isnan(_4220);
                bool _4831 = _4827 || _4829;
                bool _4833 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4835 = _4831 || _4833;
                if (!_4835)
                {
                    float _4837 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4839 = _4220 + _4837;
                    float _4841 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4843 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4841;
                    float _4845 = 1.0 / _4843;
                    float _4847 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4849 = _4847 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4851 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4853 = _4851 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4855 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4857 = _4855 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4859 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4861 = _4859 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4863 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4865 = _4863 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4867 = _4839 * _4845;
                    float _4869 = precise::clamp(_4867, 0.0, 1.0);
                    float _4871 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4873 = _4871 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4875 = fma(_4869, _4849, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4877 = fma(_4869, _4873, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4879 = fma(_4869, _4853, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4881 = fma(_4869, _4857, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4883 = fma(_4869, _4861, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4885 = fma(_4869, _4865, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _4739 = _4877;
                    _4627 = _4883;
                    _4731 = _4875;
                    _4619 = _4881;
                    _4723 = _4879;
                    _4677 = _4885;
                    _4801 = true;
                }
                else
                {
                    _4739 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4627 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _4731 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4619 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4723 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4677 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4801 = false;
    float _4887 = _4739;
    float _4889 = _4627;
    float _4891 = _4731;
    float _4893 = _4619;
    float _4895 = _4723;
    float _4897 = _4677;
    float _4899 = fma(_4018, -0.5, 0.5);
    float _4901 = precise::clamp(_4899, 0.0, 1.0);
    float _4903 = -_4887;
    float _4905 = _4903 + _4889;
    float _4907 = -_4891;
    float _4909 = _4907 + _4893;
    float _4911 = -_4895;
    float _4913 = _4911 + _4897;
    bool _4915 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4917 = fma(_4901, _4905, _4887);
    float _4919 = fma(_4901, _4909, _4891);
    float _4921 = fma(_4901, _4913, _4895);
    float _4923 = _4917 * 0.586610972881317138671875;
    out.m_86.x = 0.0;
    float _4925 = fma(_4919, 0.298911988735198974609375, _4923);
    float _4927 = fma(_4921, 0.114477999508380889892578125, _4925);
    float _4929 = -_4927;
    float _4931 = _4919 + _4929;
    float _4933 = -_4927;
    float _4935 = _4917 + _4933;
    float _4937 = -_4927;
    float _4939 = _4921 + _4937;
    float _4941 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4943 = fma(_4931, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4927);
    float _4945 = fma(_4935, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4927);
    float _4947 = fma(_4939, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4927);
    out.m_51.x = _4941;
    out.m_88.x = _4943;
    out.m_88.y = _4945;
    out.m_88.z = _4947;
    if (!_4915)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _4949 = -_4194;
    float _4951 = _4949 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _4953 = -_4196;
    float _4955 = _4953 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _4957 = -_4198;
    float _4959 = _4957 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _4961 = _4951 * _4951;
    float _4963 = fma(_4955, _4955, _4961);
    float _4965 = fma(_4959, _4959, _4963);
    float _4967 = sqrt(_4965);
    float _4969 = rsqrt(_4965);
    float _4971 = -_4967;
    float _4973 = _4971 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4975 = _4973 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _4977 = precise::clamp(_4975, 0.0, 1.0);
    float _4979 = _4955 * _4969;
    float _4981 = _4951 * _4969;
    float _4983 = abs(_4977);
    float _4985 = log2(_4983);
    float _4987 = _4959 * _4969;
    float _4989 = _4979 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _4991 = _4018 * _4981;
    float _4993 = -_4981;
    float _4995 = -_4989;
    float _4997 = fma(_4993, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4995);
    float _4999 = fma(_4016, _4979, _4991);
    float _5001 = -_4987;
    float _5003 = fma(_5001, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4997);
    float _5005 = fma(_4020, _4987, _4999);
    float _5007 = precise::clamp(_5005, 0.0, 1.0);
    float _5009 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _5011 = _5003 + _5009;
    float _5013 = _4985 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _5015 = _5011 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _5017 = precise::clamp(_5015, 0.0, 1.0);
    float _5019 = exp2(_5013);
    float _5021 = _5019 * _5017;
    float _5023 = _5007 * _5021;
    float _5025 = _5023 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _5027 = _5023 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _5029 = _5023 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_86.x = _5025;
    out.m_86.y = _5027;
    out.m_86.z = _5029;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}


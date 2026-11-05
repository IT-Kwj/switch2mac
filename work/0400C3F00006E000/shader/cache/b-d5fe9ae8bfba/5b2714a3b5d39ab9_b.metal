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
    float4 m_72 [[user(locn0)]];
    float4 m_74 [[user(locn1)]];
    float4 m_55 [[user(locn2)]];
    float4 m_106 [[user(locn3)]];
    float4 m_53 [[user(locn4)]];
    float4 m_80 [[user(locn5)]];
    float4 m_96 [[user(locn6)]];
    float4 m_78 [[user(locn7)]];
    float4 m_86 [[user(locn8)]];
    float4 m_76 [[user(locn9)]];
    float4 m_84 [[user(locn10)]];
    float4 m_90 [[user(locn11)]];
    float4 m_92 [[user(locn12)]];
    float4 m_98 [[user(locn13)]];
    float4 m_88 [[user(locn14)]];
    float4 m_104 [[user(locn15)]];
    float4 m_100 [[user(locn16)]];
    float4 m_102 [[user(locn17)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_94 [[attribute(0)]];
    float4 m_62 [[attribute(1)]];
    float4 m_64 [[attribute(2)]];
    float4 m_66 [[attribute(3)]];
    float4 m_82 [[attribute(4)]];
    float4 m_60 [[attribute(5)]];
    float4 m_48 [[attribute(6)]];
    float4 m_50 [[attribute(7)]];
    float4 m_68 [[attribute(8)]];
    float4 m_70 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_106 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_104 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    bool _5111 = false;
    bool _4258 = false;
    bool _735 = false;
    bool _591 = false;
    bool _265 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _120 = in.m_48.w;
    float _122 = in.m_50.w;
    float _124 = trunc(_120);
    int _127 = int(_124);
    float _129 = -_122;
    float _131 = _129 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.y = _131;
    bool _135 = _127 >= 1;
    float _137 = 0.0;
    float _139 = _122;
    float _141 = _131;
    if (!_135)
    {
        _137 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _143 = _137;
    if (!_135)
    {
        out.m_55.x = 0.0;
    }
    int _145 = 0;
    if (!_135)
    {
        float _147 = _143 * 5.0;
        _145 = as_type<int>(_147);
    }
    int _149 = _145;
    int _151 = _149;
    if (!_135)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5421 = as_type<float>(_149);
        out.gl_Position.z = _5421;
    }
    if (!_135)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _153 = _122 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _155 = isnan(_122);
    bool _157 = _153 || _155;
    bool _159 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _161 = _157 || _159;
    float _163 = float(_127);
    bool _165 = _131 >= _163;
    bool _167 = !_161;
    bool _169 = _165 || _167;
    float _171 = 1.0 / _163;
    if (_169)
    {
        _139 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _173 = _139;
    if (_169)
    {
        out.m_55.x = 0.0;
    }
    float _175 = _131 * _171;
    float _177 = _175;
    if (_169)
    {
        float _179 = _173 * 5.0;
        _151 = as_type<int>(_179);
    }
    int _181 = _151;
    out.m_53.x = _175;
    if (_169)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5484 = as_type<float>(_181);
        out.gl_Position.z = _5484;
    }
    if (_169)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _183 = as_type<float>(int(gl_VertexIndex));
    float _185 = in.m_60.x;
    float _187 = in.m_60.y;
    float _189 = in.m_60.z;
    float _191 = in.m_62.x;
    float _193 = in.m_62.y;
    float _195 = in.m_62.z;
    float _197 = in.m_64.x;
    float _199 = in.m_64.y;
    float _201 = in.m_64.z;
    float _203 = in.m_66.x;
    float _205 = in.m_66.y;
    float _207 = in.m_66.z;
    int _209 = as_type<int>(_183) & 1;
    bool _211 = _209 != 0;
    int _213 = as_type<int>(_183) & 2;
    bool _215 = _213 != 0;
    bool _217 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _219 = !_211;
    float _221 = _219 ? (-0.5) : 0.5;
    bool _223 = !_215;
    float _225 = _223 ? (-0.5) : 0.5;
    float _227 = _187 * _193;
    float _229 = _187 * _199;
    float _231 = fma(_185, _191, _227);
    float _233 = _187 * _205;
    float _235 = fma(_185, _197, _229);
    float _237 = fma(_189, _195, _231);
    float _239 = fma(_185, _203, _233);
    float _241 = fma(_189, _201, _235);
    float _243 = fma(_189, _207, _239);
    bool _245 = !_217;
    float _263;
    if (!_245)
    {
        float _247 = in.m_68.x;
        float _249 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _251 = _247 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _253 = fma(_251, (*spvDescriptorSet0.vp_c9)._m0[12].x, _131);
        float _255 = _253 * _249;
        float _257 = floor(_255);
        float _259 = -_257;
        float _261 = _255 + _259;
        _263 = _261;
        _265 = true;
    }
    else
    {
        _263 = _175;
    }
    _265 = false;
    float _267 = _263;
    float _269 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _271 = _267 + _269;
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _275 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _273;
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _279 = _277 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _283 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _281;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _287 = _285 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _289 = 1.0 / _275;
    float _291 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _293 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _291;
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _297 = _295 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _299 = 1.0 / _279;
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _303 = _267 + _301;
    bool _305 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _307 = 1.0 / _283;
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _311 = _267 + _309;
    float _313 = _303 * _289;
    bool _315 = _267 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _317 = isnan(_267);
    bool _319 = _315 || _317;
    bool _321 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _323 = _319 || _321;
    float _325 = float(_323);
    float _327 = 1.0 / _287;
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _331 = _267 + _329;
    float _333 = _311 * _299;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _337 = _267 + _335;
    float _339 = 1.0 / _293;
    float _341 = _271 * _307;
    bool _343 = _267 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _345 = isnan(_267);
    bool _347 = _343 || _345;
    bool _349 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _351 = _347 || _349;
    float _353 = float(_351);
    float _355 = 1.0 / _297;
    float _357 = _331 * _327;
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _361 = _267 + _359;
    float _363 = -_325;
    float _365 = _363 + 1.0;
    float _367 = _353 * _365;
    float _369 = _337 * _339;
    bool _371 = _267 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _373 = isnan(_267);
    bool _375 = _371 || _373;
    bool _377 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _379 = _375 || _377;
    float _381 = float(_379);
    bool _383 = _267 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _385 = isnan(_267);
    bool _387 = _383 || _385;
    bool _389 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _391 = _387 || _389;
    float _393 = float(_391);
    float _395 = _361 * _355;
    float _397 = -_353;
    float _399 = _397 + 1.0;
    bool _401 = _267 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _403 = isnan(_267);
    bool _405 = _401 || _403;
    bool _407 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _409 = _405 || _407;
    float _411 = float(_409);
    float _413 = -_381;
    float _415 = _413 + 1.0;
    float _417 = _381 * _399;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _421 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _419;
    float _423 = -_411;
    float _425 = _423 + 1.0;
    float _427 = _411 * _415;
    float _429 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _431 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _429;
    bool _433 = _267 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _435 = isnan(_267);
    bool _437 = _433 || _435;
    bool _439 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _441 = _437 || _439;
    float _443 = float(_441);
    float _445 = _393 * _425;
    float _447 = -_393;
    float _449 = _447 + 1.0;
    float _451 = fma(_421, _313, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _453 = fma(_431, _313, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _455 = _267 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _457 = isnan(_267);
    bool _459 = _455 || _457;
    bool _461 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _463 = _459 || _461;
    float _465 = float(_463);
    float _467 = -_443;
    float _469 = _467 + 1.0;
    float _471 = _443 * _449;
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _475 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _473;
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _479 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _477;
    float _481 = _465 * _469;
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _485 = _483 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _487 = fma(_475, _341, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _489 = fma(_479, _341, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _491 = _451 * _481;
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _495 = _493 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _497 = _453 * _481;
    float _499 = -_465;
    float _501 = _499 + 1.0;
    float _503 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _505 = _503 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _507 = fma(_485, _333, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _509 = fma(_495, _333, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _511 = fma(_501, (*spvDescriptorSet0.vp_c9)._m0[143].x, _491);
    float _513 = fma(_501, (*spvDescriptorSet0.vp_c9)._m0[143].y, _497);
    float _515 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _517 = _515 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _519 = fma(_507, _471, _511);
    float _521 = fma(_509, _471, _513);
    float _523 = fma(_505, _357, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _525 = fma(_517, _357, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _529 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _527;
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _533 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _531;
    float _535 = fma(_487, _445, _519);
    float _537 = fma(_489, _445, _521);
    float _539 = fma(_529, _369, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _541 = fma(_533, _369, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _543 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _545 = _543 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _547 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _549 = _547 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _551 = fma(_523, _427, _535);
    float _553 = fma(_525, _427, _537);
    float _555 = fma(_545, _395, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _557 = fma(_549, _395, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _559 = fma(_539, _417, _551);
    float _561 = fma(_541, _417, _553);
    float _563 = fma(_555, _367, _559);
    float _565 = fma(_557, _367, _561);
    float _567 = fma(_325, (*spvDescriptorSet0.vp_c9)._m0[149].x, _563);
    float _569 = fma(_325, (*spvDescriptorSet0.vp_c9)._m0[149].y, _565);
    bool _571 = !_305;
    float _589;
    if (!_571)
    {
        float _573 = in.m_68.x;
        float _575 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _577 = _573 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _579 = fma(_577, (*spvDescriptorSet0.vp_c9)._m0[11].y, _131);
        float _581 = _579 * _575;
        float _583 = floor(_581);
        float _585 = -_583;
        float _587 = _581 + _585;
        _589 = _587;
        _591 = true;
    }
    else
    {
        _589 = _175;
    }
    _591 = false;
    float _593 = _589;
    float _595 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _597 = _593 + _595;
    float _599 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _601 = _599 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _603 = _593 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _605 = isnan(_593);
    bool _607 = _603 || _605;
    bool _609 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _611 = _607 || _609;
    float _613 = float(_611);
    float _615 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _617 = _615 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _619 = _593 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _621 = isnan(_593);
    bool _623 = _619 || _621;
    bool _625 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _627 = _623 || _625;
    float _629 = float(_627);
    float _631 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _633 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _631;
    bool _635 = _593 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _637 = isnan(_593);
    bool _639 = _635 || _637;
    bool _641 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _643 = _639 || _641;
    float _645 = float(_643);
    float _647 = 1.0 / _601;
    float _649 = -_613;
    float _651 = _649 + 1.0;
    bool _653 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _655 = _629 * _651;
    float _657 = -_629;
    float _659 = _657 + 1.0;
    float _661 = 1.0 / _617;
    float _663 = _633 * _647;
    float _665 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _667 = _665 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _669 = fma(_663, _597, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _671 = -_645;
    float _673 = _671 + 1.0;
    float _675 = _669 * _655;
    float _677 = _667 * _661;
    float _679 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _681 = _593 + _679;
    float _683 = _613 * _673;
    float _685 = fma(_659, (*spvDescriptorSet0.vp_c9)._m0[115].x, _675);
    float _687 = fma(_677, _681, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _689 = fma(_687, _683, _685);
    float _691 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _693 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _695 = in.m_70.x;
    float _697 = in.m_70.y;
    float _699 = fma(_645, (*spvDescriptorSet0.vp_c9)._m0[117].x, _689);
    float _701 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _703 = _691 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _705 = _693 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _707 = _699 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _709 = _701 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_72.x = _703;
    out.m_72.y = _705;
    out.m_72.z = _709;
    out.m_72.w = _707;
    float _711 = _569 * _697;
    float _713 = _567 * _695;
    bool _715 = !_653;
    float _733;
    if (!_715)
    {
        float _717 = in.m_68.x;
        float _719 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _721 = _717 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _723 = fma(_721, (*spvDescriptorSet0.vp_c9)._m0[11].w, _131);
        float _725 = _723 * _719;
        float _727 = floor(_725);
        float _729 = -_727;
        float _731 = _725 + _729;
        _733 = _731;
        _735 = true;
    }
    else
    {
        _733 = _175;
    }
    _735 = false;
    float _737 = _733;
    float _739 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _741 = _737 + _739;
    float _743 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _745 = _743 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _747 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _749 = _747 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _751 = _737 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _753 = isnan(_737);
    bool _755 = _751 || _753;
    bool _757 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _759 = _755 || _757;
    float _761 = float(_759);
    float _763 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _765 = _763 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _767 = _737 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _769 = isnan(_737);
    bool _771 = _767 || _769;
    bool _773 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _775 = _771 || _773;
    float _777 = float(_775);
    float _779 = 1.0 / _745;
    float _781 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _783 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _781;
    float _785 = -_761;
    float _787 = _785 + 1.0;
    bool _789 = _737 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _791 = isnan(_737);
    bool _793 = _789 || _791;
    bool _795 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _797 = _793 || _795;
    float _799 = float(_797);
    bool _801 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _803 = 1.0 / _749;
    float _805 = 1.0 / _765;
    float _807 = _783 * _779;
    float _809 = -_777;
    float _811 = _809 + 1.0;
    float _813 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _815 = _813 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _817 = _777 * _787;
    float _819 = fma(_807, _741, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _821 = _799 * _811;
    float _823 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _825 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _823;
    float _827 = _815 * _803;
    bool _829 = _737 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _831 = isnan(_737);
    bool _833 = _829 || _831;
    bool _835 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _837 = _833 || _835;
    float _839 = float(_837);
    float _841 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _843 = _737 + _841;
    float _845 = _819 * _821;
    float _847 = -_799;
    float _849 = _847 + 1.0;
    float _851 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _853 = _737 + _851;
    float _855 = fma(_827, _843, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _857 = -_839;
    float _859 = _857 + 1.0;
    float _861 = _825 * _805;
    float _863 = fma(_849, (*spvDescriptorSet0.vp_c9)._m0[131].x, _845);
    float _865 = _761 * _859;
    float _867 = fma(_861, _853, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _869 = fma(_855, _817, _863);
    float _871 = fma(_867, _865, _869);
    float _873 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _875 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _877 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _879 = fma(_839, (*spvDescriptorSet0.vp_c9)._m0[134].x, _871);
    float _881 = _875 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _883 = _873 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _885 = _877 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _887 = _879 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_74.x = _881;
    out.m_74.y = _883;
    out.m_74.z = _885;
    out.m_74.w = _887;
    bool _889 = !_801;
    float _891 = _887;
    float _893 = _803;
    int _895 = as_type<int>(_863);
    float _897 = (*spvDescriptorSet0.vp_c9)._m0[134].x;
    if (!_889)
    {
        float _899 = in.m_68.x;
        float _901 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _903 = _899 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _905 = fma(_903, (*spvDescriptorSet0.vp_c9)._m0[14].x, _131);
        float _907 = _905 * _901;
        float _909 = floor(_907);
        float _911 = -_909;
        float _913 = _907 + _911;
        _177 = _913;
    }
    float _915 = _177;
    float _917 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _919 = int(_917);
    int _921 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _923 = _921 != 0;
    float _925 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _927 = int(_925);
    float _929 = float(_919);
    float _931 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _933 = int(_931);
    if (_923)
    {
        _891 = 1.0;
    }
    float _935 = _891;
    float _937 = _935;
    if (_923)
    {
        _893 = 1.0;
    }
    float _939 = _893;
    float _941 = _939;
    if (_923)
    {
        _895 = 0;
    }
    int _943 = _895;
    float _945 = float(_927);
    float _947 = 1.0 / _929;
    float _949 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _951 = int(_949);
    float _953 = float(uint(_933));
    float _955 = 1.0 / _945;
    float _957 = _947 * _131;
    float _959 = 1.0 / _953;
    float _961 = float(uint(_951));
    int _963 = ~_951;
    int _965 = _963 + 1;
    float _967 = trunc(_957);
    int _969 = int(_967);
    float _971 = _955 * _131;
    float _973 = _955;
    float _975 = _929;
    int _977 = _943;
    if (_923)
    {
        float _979 = in.m_68.x;
        float _981 = in.m_68.y;
        _973 = _979;
        _975 = _981;
    }
    float _983 = _973;
    float _985 = _975;
    float _987 = 1.0 / _961;
    int _989 = as_type<int>(_959) + (-2);
    float _991 = trunc(_971);
    int _993 = int(_991);
    float _995 = float(uint(_969));
    float _997 = as_type<float>(_989) * _995;
    float _999 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _1001 = int(_999);
    int _1003 = as_type<int>(_987) + (-2);
    float _1005 = _987;
    float _1007 = _983;
    float _1009 = _985;
    if (_923)
    {
        _897 = _983;
    }
    float _1011 = _897;
    float _1013 = _1011;
    if (_923)
    {
        _1005 = _985;
    }
    float _1015 = _1005;
    float _1017 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _1019 = int(_1017);
    float _1021 = float(uint(_993));
    float _1023 = as_type<float>(_1003) * _1021;
    float _1025 = trunc(_997);
    float _1027 = precise::max(_1025, 0.0);
    uint _1030 = uint(_1027);
    float _1032 = float(uint(_1001));
    float _1034 = float(_1019);
    float _1036 = 1.0 / _1032;
    float _1038 = 1.0 / _1034;
    int _1040 = as_type<int>(_1032);
    float _1042 = _1034;
    float _1044 = _1023;
    float _1046 = _1015;
    if (_923)
    {
        _1040 = 0;
    }
    int _1048 = _1040;
    float _1050 = trunc(_1023);
    float _1052 = precise::max(_1050, 0.0);
    uint _1054 = uint(_1052);
    int _1056 = _1048;
    if (_923)
    {
        _1042 = _1011;
    }
    float _1058 = _1042;
    float _1060 = _1058;
    if (_923)
    {
        _1044 = _1011;
    }
    float _1062 = _1044;
    float _1064 = _1062;
    if (!_923)
    {
        float _1066 = in.m_68.x;
        float _1068 = in.m_68.y;
        float _1070 = in.m_68.z;
        float _1072 = _1066 * 3.1415927410125732421875;
        float _1074 = _1072 * 0.15915493667125701904296875;
        float _1076 = _1068 * 3.1415927410125732421875;
        float _1078 = _1076 * 0.15915493667125701904296875;
        float _1080 = _1074 * 6.283185482025146484375;
        float _1082 = sin(_1080);
        float _1084 = _1078 * 6.283185482025146484375;
        float _1086 = sin(_1084);
        _941 = 5.839270114898681640625;
        _1060 = _1070;
        _937 = 7.345489978790283203125;
        _1007 = _1066;
        _1013 = _1068;
        _1009 = _1068;
        _1064 = _1082;
        _1046 = _1086;
        _977 = 1;
        _1056 = 2;
    }
    float _1088 = _941;
    float _1090 = _1060;
    float _1092 = _937;
    float _1094 = _1007;
    float _1096 = _1013;
    float _1098 = _1009;
    float _1100 = _1064;
    float _1102 = _1046;
    int _1104 = _977;
    int _1106 = _1056;
    int _1108 = _965 * int(_1054);
    int _1110 = _1108 + _993;
    int _1112 = ~_933;
    int _1114 = _1112 + 1;
    float _1116 = in.m_68.z;
    float _1118 = in.m_68.w;
    float _1120 = _1038 * _131;
    float _1122 = _1088 * _1090;
    float _1124 = float(uint(_1110));
    int _1126 = _1114 * int(_1030);
    int _1128 = _1126 + _969;
    float _1130 = _1092 * _1094;
    float _1132 = floor(_1122);
    float _1134 = _1092 * _1096;
    float _1136 = as_type<float>(_1003) * _1124;
    float _1138 = float(uint(_1128));
    float _1140 = _1094 * 2.0;
    float _1142 = float(_951);
    float _1144 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1146 = _915 + _1144;
    float _1148 = float(_993);
    float _1150 = trunc(_1136);
    float _1152 = precise::max(_1150, 0.0);
    uint _1154 = uint(_1152);
    float _1156 = as_type<float>(_989) * _1138;
    bool _1158 = _1148 >= _1142;
    bool _1160 = isnan(_1148);
    bool _1162 = _1158 || _1160;
    bool _1164 = isnan(_1142);
    bool _1166 = _1162 || _1164;
    float _1168 = float(_1166);
    int _1170 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1172 = _1170 != 0;
    float _1174 = trunc(_1120);
    int _1176 = int(_1174);
    bool _1178 = _1098 > 0.5;
    float _1180 = -_1132;
    float _1182 = _1122 + _1180;
    bool _1184 = _1118 > 0.5;
    bool _1186 = _1116 > 0.5;
    int _1188 = as_type<int>(_1036) + (-2);
    float _1190 = floor(_1130);
    int _1192 = int(_1054) + int(_1154);
    int _1194 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1196 = _1194 != 0;
    int _1198 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1200 = _1198 != 0;
    int _1202 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1204 = _1202 != 0;
    int _1206 = ~_933;
    int _1208 = _1206 + 1;
    int _1210 = ~_951;
    int _1212 = _1210 + 1;
    float _1214 = trunc(_1156);
    float _1216 = precise::max(_1214, 0.0);
    uint _1218 = uint(_1216);
    float _1220 = float(uint(_1176));
    float _1222 = float(_969);
    float _1224 = as_type<float>(_1188) * _1220;
    float _1226 = -_221;
    int _1228 = _1178 ? as_type<int>(_1226) : as_type<int>(_221);
    float _1230 = trunc(_1168);
    int _1232 = int(_1230);
    float _1234 = -_1190;
    float _1236 = _1130 + _1234;
    float _1238 = float(_933);
    int _1240 = _1212 * _1192;
    int _1242 = _1240 + _993;
    int _1244 = int(_1184);
    int _1246 = _1186 ? 2 : 0;
    int _1248 = _1244 | _1246;
    int _1250 = _1172 ? 4 : 0;
    int _1252 = _1248 | _1250;
    int _1254 = _1196 ? 8 : 0;
    int _1256 = _1252 | _1254;
    int _1258 = _1200 ? 16 : 0;
    int _1260 = _1256 | _1258;
    int _1262 = _1204 ? 32 : 0;
    int _1264 = _1260 | _1262;
    int _1266 = _1178 ? 64 : 0;
    int _1268 = _1264 | _1266;
    int _1270 = _1268 & 64;
    bool _1272 = !_1200;
    float _1274 = _1272 ? _221 : as_type<float>(_1228);
    int _1276 = int(_1030) + int(_1218);
    float _1278 = trunc(_1224);
    float _1280 = precise::max(_1278, 0.0);
    uint _1282 = uint(_1280);
    float _1284 = -_225;
    int _1286 = _1186 ? as_type<int>(_1284) : as_type<int>(_225);
    bool _1288 = _1222 >= _1238;
    bool _1290 = isnan(_1222);
    bool _1292 = _1288 || _1290;
    bool _1294 = isnan(_1238);
    bool _1296 = _1292 || _1294;
    float _1298 = float(_1296);
    float _1300 = _1236 * _1142;
    bool _1302 = !_1204;
    float _1304 = _1302 ? _225 : as_type<float>(_1286);
    float _1306 = floor(_1134);
    int _1308 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1310 = _1308 != 0;
    int _1312 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1314 = _1312 != 0;
    int _1316 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1318 = _1316 != 0;
    bool _1320 = !_1172;
    int _1322 = _1320 ? 0 : 1;
    int _1324 = _1208 * _1276;
    int _1326 = _1324 + _969;
    bool _1328 = uint(_1242) >= uint(_951);
    bool _1330 = !_1314;
    int _1332 = _1330 ? 0 : 1;
    float _1334 = trunc(_1300);
    int _1336 = int(_1334);
    bool _1338 = !_1310;
    int _1340 = _1338 ? 0 : 1;
    int _1342 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1344 = _1342 != 0;
    bool _1346 = uint(_1326) >= uint(_933);
    float _1348 = _1182 * _1238;
    bool _1350 = !_1318;
    int _1352 = _1350 ? 0 : 1;
    float _1354 = trunc(_1298);
    int _1356 = int(_1354);
    bool _1358 = !_1344;
    int _1360 = _1358 ? 0 : 1;
    float _1362 = -_1306;
    float _1364 = _1134 + _1362;
    bool _1366 = !_1346;
    int _1368 = _1366 ? 0 : (-1);
    bool _1370 = !_1328;
    int _1372 = _1370 ? 0 : (-1);
    int _1374 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1376 = _1374 != 0;
    int _1378 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1380 = _1378 != 0;
    int _1382 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1384 = _1382 != 0;
    float _1386 = trunc(_1348);
    int _1388 = int(_1386);
    int _1390 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1392 = _1390 != 0;
    int _1394 = ~_1001;
    int _1396 = _1394 + 1;
    int _1398 = ~_1276;
    int _1400 = _1398 + _1368;
    int _1402 = _1400 + 1;
    bool _1404 = !_1392;
    int _1406 = _1404 ? 0 : 1;
    int _1408 = _1396 * int(_1282);
    int _1410 = _1408 + _1176;
    int _1412 = abs(_1322);
    float _1414 = floor(_1140);
    int _1416 = ~_1192;
    int _1418 = _1416 + _1372;
    int _1420 = _1418 + 1;
    int _1422 = _933 * _1402;
    int _1424 = _1422 + _969;
    int _1426 = abs(_1406);
    int _1428 = _1336 * _1412;
    int _1430 = _1428 + _993;
    float _1432 = float(uint(_1410));
    int _1434 = _951 * _1420;
    int _1436 = _1434 + _993;
    float _1438 = _171 * _131;
    bool _1440 = _951 == 0;
    bool _1442 = !_1380;
    int _1444 = _1442 ? 0 : 1;
    float _1446 = _1142 * _1438;
    bool _1448 = _1270 != 0;
    float _1450 = as_type<float>(_1188) * _1432;
    bool _1452 = !_1376;
    int _1454 = _1452 ? 0 : 1;
    float _1456 = _1238 * _1438;
    int _1458 = ~_1232;
    int _1460 = _1458 + 1;
    int _1462 = _1460 + 1;
    float _1464 = trunc(_1446);
    int _1466 = int(_1464);
    bool _1468 = !_1440;
    int _1470 = _1468 ? _1436 : (-1);
    int _1472 = _1388 * _1426;
    int _1474 = _1472 + _969;
    bool _1476 = _933 == 0;
    float _1478 = _1100 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    int _1480 = ~_1356;
    int _1482 = _1480 + 1;
    int _1484 = _1482 + 1;
    int _1486 = _1470 * _1462;
    bool _1488 = !_1476;
    int _1490 = _1488 ? _1424 : (-1);
    float _1492 = trunc(_1450);
    float _1494 = precise::max(_1492, 0.0);
    uint _1496 = uint(_1494);
    int _1498 = _951 + (-1);
    int _1500 = _933 + (-1);
    int _1502 = _1490 * _1484;
    int _1504 = abs(_1332);
    int _1506 = _1232 * _1498;
    int _1508 = _1506 + _1486;
    int _1510 = abs(_1352);
    int _1512 = _1356 * _1500;
    int _1514 = _1512 + _1502;
    int _1516 = abs(_1360);
    int _1518 = _1508 * _1504;
    int _1520 = abs(_1340);
    float _1522 = trunc(_1456);
    int _1524 = int(_1522);
    int _1526 = abs(_1444);
    float _1528 = _1098 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1530 = ~_1001;
    int _1532 = _1530 + 1;
    int _1534 = _1466 * _1520;
    int _1536 = _1534 + _1518;
    int _1538 = _1430 * _1510;
    int _1540 = _1538 + _1536;
    int _1542 = int(_1282) + int(_1496);
    int _1544 = _1336 * _1516;
    int _1546 = _1544 + _1540;
    bool _1548 = !_1384;
    int _1550 = _1548 ? 0 : 1;
    int _1552 = _1514 * _1526;
    int _1554 = abs(_1454);
    int _1556 = _1532 * _1542;
    int _1558 = _1556 + _1176;
    float _1560 = float(uint(_1546));
    float _1562 = -_225;
    int _1564 = _1184 ? as_type<int>(_1562) : as_type<int>(_225);
    int _1566 = _1524 * _1554;
    int _1568 = _1566 + _1552;
    float _1570 = -_221;
    int _1572 = _1186 ? as_type<int>(_1570) : as_type<int>(_221);
    float _1574 = float(_1001);
    float _1576 = float(_1176);
    int _1578 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1580 = _1578 != 0;
    float _1582 = _1574 * _1438;
    int _1584 = abs(_1550);
    float _1586 = as_type<float>(_1003) * _1560;
    bool _1588 = uint(_1558) >= uint(_1001);
    int _1590 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _1592 = _1590 != 0;
    int _1594 = _1474 * _1584;
    int _1596 = _1594 + _1568;
    bool _1598 = _1576 >= _1574;
    bool _1600 = isnan(_1576);
    bool _1602 = _1598 || _1600;
    bool _1604 = isnan(_1574);
    bool _1606 = _1602 || _1604;
    float _1608 = float(_1606);
    float _1610 = trunc(_1582);
    int _1612 = int(_1610);
    bool _1614 = !_1580;
    int _1616 = _1614 ? 0 : 1;
    bool _1618 = !_1196;
    float _1620 = _1618 ? _225 : as_type<float>(_1564);
    bool _1622 = !_1592;
    int _1624 = _1622 ? 0 : 1;
    int _1626 = abs(_1616);
    float _1628 = trunc(_1586);
    float _1630 = precise::max(_1628, 0.0);
    uint _1632 = uint(_1630);
    bool _1634 = !_1588;
    int _1636 = _1634 ? 0 : (-1);
    float _1638 = _1364 * _1574;
    int _1640 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _1642 = _1640 != 0;
    int _1644 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _1646 = _1644 != 0;
    int _1648 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _1650 = _1648 != 0;
    int _1652 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _1654 = _1652 != 0;
    int _1656 = ~_1542;
    int _1658 = _1656 + _1636;
    int _1660 = _1658 + 1;
    float _1662 = trunc(_1608);
    int _1664 = int(_1662);
    int _1666 = ~_951;
    int _1668 = _1666 + 1;
    int _1670 = _1388 * _1626;
    int _1672 = _1670 + _1596;
    bool _1674 = !_1642;
    int _1676 = _1674 ? 0 : 1;
    int _1678 = _1001 * _1660;
    int _1680 = _1678 + _1176;
    bool _1682 = _1001 == 0;
    float _1684 = float(uint(_1672));
    int _1686 = _1668 * int(_1632);
    int _1688 = _1686 + _1546;
    bool _1690 = !_1646;
    int _1692 = _1690 ? 0 : 1;
    float _1694 = trunc(_1638);
    int _1696 = int(_1694);
    int _1698 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1700 = _1698 != 0;
    float _1702 = as_type<float>(_989) * _1684;
    bool _1704 = !_1682;
    int _1706 = _1704 ? _1680 : (-1);
    float _1708 = float(uint(_1688));
    int _1710 = ~_1664;
    int _1712 = _1710 + 1;
    int _1714 = _1712 + 1;
    float _1716 = trunc(_1702);
    float _1718 = precise::max(_1716, 0.0);
    uint _1720 = uint(_1718);
    int _1722 = abs(_1692);
    float _1724 = as_type<float>(_1003) * _1708;
    int _1726 = abs(_1676);
    int _1728 = _1706 * _1714;
    int _1730 = _1001 + (-1);
    float _1732 = _1684;
    float _1734 = as_type<float>(_1104);
    float _1736 = as_type<float>(_1106);
    if (_1700)
    {
        float _1738 = in.m_68.w;
        _1732 = _1738;
    }
    float _1740 = _1732;
    int _1742 = abs(_1624);
    float _1744 = trunc(_1724);
    float _1746 = precise::max(_1744, 0.0);
    uint _1748 = uint(_1746);
    bool _1750 = _951 == 0;
    int _1752 = _1664 * _1730;
    int _1754 = _1752 + _1728;
    int _1756 = _1754 * _1722;
    int _1758 = ~_933;
    int _1760 = _1758 + 1;
    float _1762 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1764 = log2(_1762);
    float _1766 = 0.0;
    float _1768 = as_type<float>(_1742);
    if (!_1700)
    {
        _1766 = _221;
    }
    float _1770 = _1766;
    int _1772 = _1612 * _1726;
    int _1774 = _1772 + _1756;
    int _1776 = _1696 * _1742;
    int _1778 = _1776 + _1176;
    bool _1780 = !_1650;
    int _1782 = _1780 ? 0 : 1;
    int _1784 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1786 = _1784 != 0;
    int _1788 = _1760 * int(_1720);
    int _1790 = _1788 + _1672;
    int _1792 = int(_1632) + int(_1748);
    int _1794 = abs(_1782);
    float _1796 = float(uint(_1790));
    float _1798 = _1770;
    if (_1700)
    {
        float _1800 = _1740 * 3.1415927410125732421875;
        _1768 = _1800;
    }
    float _1802 = _1768;
    int _1804 = ~_951;
    int _1806 = _1804 + 1;
    bool _1808 = !_1654;
    int _1810 = _1808 ? 0 : 1;
    float _1812 = as_type<float>(_989) * _1796;
    int _1814 = _1806 * _1792;
    int _1816 = _1814 + _1546;
    float _1818 = _1802;
    if (_1700)
    {
        float _1820 = _1802 * 0.15915493667125701904296875;
        _1818 = _1820;
    }
    float _1822 = _1818;
    int _1824 = abs(_1810);
    float _1826 = trunc(_1812);
    float _1828 = precise::max(_1826, 0.0);
    uint _1830 = uint(_1828);
    int _1832 = _1778 * _1794;
    int _1834 = _1832 + _1774;
    bool _1836 = uint(_1816) >= uint(_951);
    float _1838 = as_type<float>(_1612);
    if (_1786)
    {
        float _1840 = in.m_68.x;
        _1838 = _1840;
    }
    float _1842 = _1838;
    float _1844 = float(uint(_1430));
    int _1846 = _1696 * _1824;
    int _1848 = _1846 + _1834;
    bool _1850 = !_1836;
    int _1852 = _1850 ? 0 : (-1);
    float _1854 = _1822;
    if (_1700)
    {
        float _1856 = _1822 * 6.283185482025146484375;
        float _1858 = sin(_1856);
        _1854 = _1858;
    }
    float _1860 = _1854;
    float _1862 = as_type<float>(_1003) * _1844;
    int _1864 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1866 = _1864 != 0;
    int _1868 = ~_1792;
    int _1870 = _1868 + _1852;
    int _1872 = _1870 + 1;
    bool _1874 = !_1866;
    float _1876 = _1874 ? _221 : as_type<float>(_1572);
    float _1878 = trunc(_1862);
    float _1880 = precise::max(_1878, 0.0);
    uint _1882 = uint(_1880);
    float _1884 = float(uint(_1848));
    int _1886 = _951 * _1872;
    int _1888 = _1886 + _1546;
    int _1890 = int(_1720) + int(_1830);
    float _1892 = float(uint(_1474));
    float _1894 = as_type<float>(_1188) * _1884;
    bool _1896 = !_1750;
    int _1898 = _1896 ? _1888 : (-1);
    bool _1900 = _1866;
    float _1902 = _1884;
    if (_1700)
    {
        bool _1904 = _1860 > 0.5;
        _1900 = _1904;
    }
    bool _1906 = _1900;
    float _1908 = trunc(_1894);
    float _1910 = precise::max(_1908, 0.0);
    uint _1912 = uint(_1910);
    int _1914 = ~_951;
    int _1916 = _1914 + 1;
    if (_1786)
    {
        float _1918 = _1842 * 3.1415927410125732421875;
        _1902 = _1918;
    }
    float _1920 = _1902;
    float _1922 = _1920;
    if (_1700)
    {
        float _1924 = -_221;
        float _1926 = _1906 ? _1924 : _221;
        _1798 = _1926;
    }
    float _1928 = _1798;
    float _1930 = as_type<float>(_989) * _1892;
    int _1932 = _1898 & 3;
    bool _1934 = _1932 != 0;
    int _1936 = _1916 * int(_1882);
    int _1938 = _1936 + _1430;
    int _1940 = _1898 & 3;
    bool _1942 = _1940 != 0;
    if (_1786)
    {
        float _1944 = _1920 * 0.15915493667125701904296875;
        _1922 = _1944;
    }
    float _1946 = _1922;
    int _1948 = ~_1001;
    int _1950 = _1948 + 1;
    float _1952 = trunc(_1930);
    float _1954 = precise::max(_1952, 0.0);
    uint _1956 = uint(_1954);
    int _1958 = _1934 ? 0 : 1;
    bool _1960 = uint(_1940) > 1u;
    float _1962 = float(uint(_1938));
    float _1964 = _1946;
    if (_1786)
    {
        float _1966 = _1946 * 6.283185482025146484375;
        float _1968 = sin(_1966);
        _1964 = _1968;
    }
    float _1970 = _1964;
    int _1972 = ~_933;
    int _1974 = _1972 + 1;
    float _1976 = as_type<float>(_1003) * _1962;
    float _1978 = -_225;
    int _1980 = _1448 ? as_type<int>(_1978) : as_type<int>(_225);
    int _1982 = _1950 * int(_1912);
    int _1984 = _1982 + _1848;
    int _1986 = ~_1958;
    int _1988 = _1986 + 1;
    int _1990 = _1988 + 1;
    int _1992 = _1974 * _1890;
    int _1994 = _1992 + _1672;
    bool _1996 = uint(_1940) >= 2u;
    float _1998 = trunc(_1976);
    float _2000 = precise::max(_1998, 0.0);
    uint _2002 = uint(_2000);
    float _2004 = float(uint(_1984));
    int _2006 = _1990;
    if (!_1960)
    {
        int _2008 = ~_1958;
        int _2010 = _2008 + 1;
        _2006 = _2010;
    }
    int _2012 = _2006;
    bool _2014 = uint(_1994) >= uint(_933);
    float _2016 = as_type<float>(_1188) * _2004;
    int _2018 = _1996 ? 0 : 1;
    bool _2020 = _1940 != 3;
    bool _2022 = !_2014;
    int _2024 = _2022 ? 0 : (-1);
    float _2026 = trunc(_2016);
    float _2028 = precise::max(_2026, 0.0);
    uint _2030 = uint(_2028);
    int _2032 = ~_933;
    int _2034 = _2032 + 1;
    int _2036 = ~_1890;
    int _2038 = _2036 + _2024;
    int _2040 = _2038 + 1;
    int _2042 = ~_2018;
    int _2044 = _2042 + 1;
    int _2046 = _2044 + 1;
    int _2048 = _2034 * int(_1956);
    int _2050 = _2048 + _1474;
    int _2052 = _933 * _2040;
    int _2054 = _2052 + _1672;
    float _2056 = 0.0;
    int _2058 = _2046;
    bool _2060 = _2020;
    if (!_1786)
    {
        _2056 = _225;
    }
    float _2062 = _2056;
    float _2064 = _2062;
    if (_2020)
    {
        int _2066 = ~_2018;
        int _2068 = _2066 + 1;
        _2058 = _2068;
    }
    int _2070 = _2058;
    if (_1786)
    {
        bool _2072 = _1970 > 0.5;
        _2060 = _2072;
    }
    bool _2074 = _2060;
    float _2076 = float(uint(_2050));
    bool _2078 = !_1476;
    int _2080 = _2078 ? _2054 : (-1);
    int _2082 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2084 = _2082 != 0;
    float _2086 = as_type<float>(_989) * _2076;
    if (_1786)
    {
        float _2088 = -_225;
        float _2090 = _2074 ? _2088 : _225;
        _2064 = _2090;
    }
    float _2092 = _2064;
    int _2094 = _2080 & 3;
    bool _2096 = _2094 != 0;
    bool _2098 = !_2084;
    float _2100 = _2098 ? _225 : as_type<float>(_1980);
    float _2102 = trunc(_2086);
    float _2104 = precise::max(_2102, 0.0);
    uint _2106 = uint(_2104);
    int _2108 = int(_1912) + int(_2030);
    int _2110 = ~_1001;
    int _2112 = _2110 + 1;
    int _2114 = _2080 & 3;
    bool _2116 = _2114 != 0;
    bool _2118 = uint(_2094) > 1u;
    int _2120 = _2112 * _2108;
    int _2122 = _2120 + _1848;
    int _2124 = int(_1882) + int(_2002);
    int _2126 = ~_951;
    int _2128 = _2126 + 1;
    int _2130 = _2116 ? 0 : 1;
    int _2132 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2134 = _2132 != 0;
    int _2136 = _2128 * _2124;
    int _2138 = _2136 + _1430;
    float _2140 = float(uint(_1778));
    bool _2142 = !_2134;
    int _2144 = _2142 ? 0 : 1;
    bool _2146 = uint(_2122) >= uint(_1001);
    float _2148 = as_type<float>(_1188) * _2140;
    int _2150 = ~_2130;
    int _2152 = _2150 + 1;
    int _2154 = _2152 + 1;
    int _2156 = _2154;
    if (!_2118)
    {
        int _2158 = ~_2130;
        int _2160 = _2158 + 1;
        _2156 = _2160;
    }
    int _2162 = _2156;
    bool _2164 = uint(_2138) >= uint(_951);
    bool _2166 = !_2146;
    int _2168 = _2166 ? 0 : (-1);
    float _2170 = trunc(_2148);
    float _2172 = precise::max(_2170, 0.0);
    uint _2174 = uint(_2172);
    bool _2176 = _2094 != 3;
    int _2178 = ~_933;
    int _2180 = _2178 + 1;
    bool _2182 = !_2164;
    int _2184 = _2182 ? 0 : (-1);
    bool _2186 = uint(_2094) >= 2u;
    int _2188 = int(_1956) + int(_2106);
    int _2190 = ~_2108;
    int _2192 = _2190 + _2168;
    int _2194 = _2192 + 1;
    int _2196 = _2186 ? 0 : 1;
    int _2198 = _1001 * _2194;
    int _2200 = _2198 + _1848;
    int _2202 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2204 = _2202 != 0;
    int _2206 = _2180 * _2188;
    int _2208 = _2206 + _1474;
    int _2210 = ~_1001;
    int _2212 = _2210 + 1;
    int _2214 = ~_2196;
    int _2216 = _2214 + 1;
    int _2218 = _2216 + 1;
    int _2220 = _2218;
    float _2222 = as_type<float>(_2180);
    if (_2176)
    {
        int _2224 = ~_2196;
        int _2226 = _2224 + 1;
        _2220 = _2226;
    }
    int _2228 = _2220;
    int _2230 = _2212 * int(_2174);
    int _2232 = _2230 + _1778;
    int _2234 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _2236 = _2234 != 0;
    bool _2238 = !_2204;
    int _2240 = _2238 ? 0 : 1;
    bool _2242 = uint(_2208) >= uint(_933);
    bool _2244 = !_1682;
    int _2246 = _2244 ? _2200 : (-1);
    bool _2248 = !_2236;
    int _2250 = _2248 ? 0 : 1;
    bool _2252 = !_2242;
    int _2254 = _2252 ? 0 : (-1);
    int _2256 = _2246 & 3;
    bool _2258 = _2256 != 0;
    int _2260 = _2246 & 3;
    bool _2262 = _2260 != 0;
    float _2264 = float(uint(_2232));
    int _2266 = _2258 ? 0 : 1;
    bool _2268 = uint(_2260) > 1u;
    float _2270 = as_type<float>(_1188) * _2264;
    int _2272 = ~_2266;
    int _2274 = _2272 + 1;
    int _2276 = _2274 + 1;
    float _2278 = trunc(_2270);
    float _2280 = precise::max(_2278, 0.0);
    uint _2282 = uint(_2280);
    float _2284 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _2286 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _2288 = fma(_1100, (*spvDescriptorSet0.vp_c9)._m0[93].z, _2284);
    int _2290 = _2276;
    float _2292 = _2270;
    if (!_2268)
    {
        int _2294 = ~_2266;
        int _2296 = _2294 + 1;
        _2290 = _2296;
    }
    int _2298 = _2290;
    float _2300 = -_2286;
    float _2302 = fma(_1478, 2.0, _2300);
    bool _2304 = uint(_2260) >= 2u;
    float _2306 = _1102 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    int _2308 = ~_1001;
    int _2310 = _2308 + 1;
    float _2312 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _2314 = _2304 ? 0 : 1;
    float _2316 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _2318 = _2260 != 3;
    float _2320 = fma(_1528, -2.0, _2312);
    int _2322 = int(_2174) + int(_2282);
    float _2324 = -_131;
    float _2326 = fma(_2324, (*spvDescriptorSet0.vp_c9)._m0[91].x, _2302);
    float _2328 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[92].z, _2288);
    int _2330 = ~_2314;
    int _2332 = _2330 + 1;
    int _2334 = _2332 + 1;
    int _2336 = _2310 * _2322;
    int _2338 = _2336 + _1778;
    float _2340 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    int _2342 = _2334;
    float _2344 = as_type<float>(_2338);
    if (_2318)
    {
        int _2346 = ~_2314;
        int _2348 = _2346 + 1;
        _2342 = _2348;
    }
    int _2350 = _2342;
    float _2352 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _2354 = uint(_2338) >= uint(_1001);
    float _2356 = fma(_1102, (*spvDescriptorSet0.vp_c9)._m0[93].w, _2340);
    float _2358 = _1764 * _131;
    float _2360 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _2362 = !_2354;
    int _2364 = _2362 ? 0 : (-1);
    float _2366 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[92].w, _2356);
    bool _2368 = _1094 > 0.5;
    float _2370 = exp2(_2358);
    float _2372 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _2374 = -_221;
    int _2376 = _2368 ? as_type<int>(_2374) : as_type<int>(_221);
    float _2378 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2380 = _915 + _2378;
    bool _2382 = _1104 != 1;
    float _2384 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2386 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2388 = -_2370;
    float _2390 = _2388 + 1.0;
    float _2392 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    if (!_2382)
    {
        _2222 = _1098;
    }
    float _2394 = _2222;
    float _2396 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2398 = _2396 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2400 = 0.0;
    float _2402 = _2394;
    if (!_2382)
    {
        _2400 = _1098;
    }
    float _2404 = _2400;
    float _2406 = fma(_2306, -2.0, _2392);
    float _2408 = _2404;
    if (!_2382)
    {
        _2292 = _1116;
    }
    float _2410 = _2292;
    float _2412 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2320);
    float _2414 = _2410;
    if (!_2382)
    {
        _2344 = _1116;
    }
    float _2416 = _2344;
    float _2418 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[91].y, _2406);
    float _2420 = _2416;
    if (_2382)
    {
        _2402 = _1094;
    }
    float _2422 = _2402;
    float _2424 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2426 = _2424 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    if (_2382)
    {
        _2408 = _1094;
    }
    float _2428 = _2408;
    float _2430 = 1.0 / _2398;
    if (_2382)
    {
        _2414 = _1098;
    }
    float _2432 = _2414;
    float _2434 = _2422 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_2382)
    {
        _2420 = _1098;
    }
    float _2436 = _2420;
    bool _2438 = _1106 != 2;
    float _2440 = -_2316;
    float _2442 = fma(_2434, 2.0, _2440);
    float _2444 = _2432 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2446 = fma(_2436, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2352);
    float _2448 = -_131;
    float _2450 = fma(_2448, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2442);
    float _2452 = fma(_2444, -2.0, _2360);
    float _2454 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2446);
    float _2456 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _2458 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2452);
    float _2460 = 1.0 / _2426;
    if (_2438)
    {
        _1734 = _1094;
    }
    float _2462 = _1734;
    float _2464 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2466 = _2464 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2468 = _2462;
    if (_2438)
    {
        _1736 = _1098;
    }
    float _2470 = _1736;
    float _2472 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2474 = _2472 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2476 = _2470;
    if (!_2438)
    {
        _2468 = _1116;
    }
    float _2478 = _2468;
    float _2480 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2482 = _915 + _2480;
    if (!_2438)
    {
        _2476 = _1094;
    }
    float _2484 = _2476;
    float _2486 = 1.0 / _2466;
    int _2488 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2490 = _2488 != 0;
    float _2492 = _2478 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _2494 = _1094 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _2496 = _2484 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    bool _2498 = !_2490;
    float _2500 = _2498 ? _221 : as_type<float>(_2376);
    float _2502 = in.m_48.x;
    float _2504 = in.m_48.y;
    float _2506 = in.m_48.z;
    bool _2508 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2510 = isnan(0.0);
    bool _2512 = _2508 || _2510;
    bool _2514 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2516 = _2512 || _2514;
    float _2518 = -_2372;
    float _2520 = fma(_2492, 2.0, _2518);
    float _2522 = fma(_2496, -2.0, _2456);
    float _2524 = -_2384;
    float _2526 = fma(_2494, 2.0, _2524);
    float _2528 = _2516 ? _2390 : 0.0;
    float _2530 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2522);
    bool _2532 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2534 = isnan(1.0);
    bool _2536 = _2532 || _2534;
    bool _2538 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2540 = _2536 || _2538;
    float _2542 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2544 = 1.0 + _2542;
    float _2546 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2548 = -_131;
    float _2550 = fma(_2548, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2526);
    float _2552 = 1.0 / _2544;
    float _2554 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2556 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _2558 = fma(_1094, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2546);
    float _2560 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2562 = fma(_1098, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2554);
    float _2564 = fma(_1094, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2556);
    float _2566 = fma(_1098, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2386);
    float _2568 = fma(_2428, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2560);
    float _2570 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2562);
    float _2572 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2558);
    float _2574 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2566);
    float _2576 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2564);
    float _2578 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2568);
    float _2580 = -_131;
    float _2582 = fma(_2580, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2520);
    float _2584 = _193 * _2504;
    if (_2540)
    {
        float _2586 = _2528 * _2552;
        _141 = _2586;
    }
    float _2588 = _141;
    float _2590 = _1098 * 2.0;
    bool _2592 = _1414 >= 0.0;
    bool _2594 = isnan(_1414);
    bool _2596 = _2592 || _2594;
    bool _2598 = isnan(0.0);
    bool _2600 = _2596 || _2598;
    float _2602 = _199 * _2504;
    float _2604 = _205 * _2504;
    float _2606 = floor(_2590);
    int _2608 = _2600 ? 0 : 1;
    float _2610 = fma(_197, _2502, _2602);
    bool _2612 = _1414 > 0.0;
    float _2614 = fma(_203, _2502, _2604);
    float _2616 = fma(_191, _2502, _2584);
    float _2618 = fma(_201, _2506, _2610);
    int _2620 = ~_2608;
    int _2622 = _2620 + 1;
    int _2624 = _2622 + 1;
    float _2626 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2628 = _2626 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2630 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2632 = _2630 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2634 = 1.0 / _2474;
    float _2636 = fma(_207, _2506, _2614);
    float _2638 = fma(_195, _2506, _2616);
    int _2640 = _2624;
    if (!_2612)
    {
        int _2642 = ~_2608;
        int _2644 = _2642 + 1;
        _2640 = _2644;
    }
    int _2646 = _2640;
    float _2648 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2650 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2648;
    bool _2652 = _2606 >= 0.0;
    bool _2654 = isnan(_2606);
    bool _2656 = _2652 || _2654;
    bool _2658 = isnan(0.0);
    bool _2660 = _2656 || _2658;
    float _2662 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2664 = _2662 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2666 = 1.0 / _2628;
    int _2668 = _2660 ? 0 : 1;
    float _2670 = _2650 * _2430;
    bool _2672 = _2606 > 0.0;
    float _2674 = _1116 * 2.0;
    float _2676 = _2664 * _2460;
    int _2678 = ~_2188;
    int _2680 = _2678 + _2254;
    int _2682 = _2680 + 1;
    float _2684 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2686 = _2684 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2688 = 1.0 / _2632;
    float _2690 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2692 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2690;
    float _2694 = _2686 * _2486;
    int _2696 = _933 * _2682;
    int _2698 = _2696 + _1474;
    float _2700 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2702 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2700;
    float _2704 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2706 = _2704 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2708 = floor(_2674);
    float _2710 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2712 = _2710 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _2714 = _2702 * _2634;
    float _2716 = _2706 * _2666;
    bool _2718 = _915 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2720 = isnan(_915);
    bool _2722 = _2718 || _2720;
    bool _2724 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2726 = _2722 || _2724;
    float _2728 = float(_2726);
    float _2730 = fma(_2694, _2482, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    bool _2732 = _915 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2734 = isnan(_915);
    bool _2736 = _2732 || _2734;
    bool _2738 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2740 = _2736 || _2738;
    float _2742 = float(_2740);
    float _2744 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2746 = _915 + _2744;
    float _2748 = _2692 * _2688;
    int _2750 = ~_2668;
    int _2752 = _2750 + 1;
    int _2754 = _2752 + 1;
    float _2756 = 1.0 / _2712;
    bool _2758 = !_1476;
    int _2760 = _2758 ? _2698 : (-1);
    float _2762 = -_2728;
    float _2764 = _2762 + 1.0;
    bool _2766 = !_2096;
    int _2768 = _2766 ? 0 : 1;
    float _2770 = in.m_64.w;
    int _2772 = _2754;
    if (!_2672)
    {
        int _2774 = ~_2668;
        int _2776 = _2774 + 1;
        _2772 = _2776;
    }
    int _2778 = _2772;
    float _2780 = -_2742;
    float _2782 = _2780 + 1.0;
    int _2784 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2786 = _2784 != 0;
    int _2788 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2790 = _2788 != 0;
    int _2792 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2794 = _2792 != 0;
    float _2796 = _2742 * _2764;
    bool _2798 = _2708 >= 0.0;
    bool _2800 = isnan(_2708);
    bool _2802 = _2798 || _2800;
    bool _2804 = isnan(0.0);
    bool _2806 = _2802 || _2804;
    float _2808 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2810 = _915 + _2808;
    bool _2812 = _915 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2814 = isnan(_915);
    bool _2816 = _2812 || _2814;
    bool _2818 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2820 = _2816 || _2818;
    float _2822 = float(_2820);
    float _2824 = fma(_2714, _2746, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    int _2826 = _2080 >> 31;
    float _2828 = fma(_2670, _2810, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    int _2830 = _2806 ? 0 : 1;
    float _2832 = _2822 * _2782;
    bool _2834 = _2708 > 0.0;
    float _2836 = -_2822;
    float _2838 = _2836 + 1.0;
    bool _2840 = _915 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2842 = isnan(_915);
    bool _2844 = _2840 || _2842;
    bool _2846 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2848 = _2844 || _2846;
    float _2850 = float(_2848);
    float _2852 = fma(_2676, _2380, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    int _2854 = _2826 & 3;
    float _2856 = fma(_2748, _1146, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    bool _2858 = _915 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2860 = isnan(_915);
    bool _2862 = _2858 || _2860;
    bool _2864 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2866 = _2862 || _2864;
    float _2868 = float(_2866);
    float _2870 = -_2850;
    float _2872 = _2870 + 1.0;
    int _2874 = _2080 + _2854;
    float _2876 = _2850 * _2838;
    bool _2878 = _915 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2880 = isnan(_915);
    bool _2882 = _2878 || _2880;
    bool _2884 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2886 = _2882 || _2884;
    float _2888 = float(_2886);
    float _2890 = -_2868;
    float _2892 = _2890 + 1.0;
    float _2894 = _2868 * _2872;
    int _2896 = _2874 >> 2;
    float _2898 = _2618 + _2770;
    float _2900 = _2888 * _2892;
    bool _2902 = _915 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2904 = isnan(_915);
    bool _2906 = _2902 || _2904;
    bool _2908 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2910 = _2906 || _2908;
    float _2912 = float(_2910);
    float _2914 = -_2888;
    float _2916 = _2914 + 1.0;
    int _2918 = _2896 << 4;
    int _2920 = _2918 + 656;
    float _2922 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2924 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2922;
    bool _2926 = _915 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2928 = isnan(_915);
    bool _2930 = _2926 || _2928;
    bool _2932 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2934 = _2930 || _2932;
    float _2936 = float(_2934);
    float _2938 = _2912 * _2916;
    float _2940 = -_2912;
    float _2942 = _2940 + 1.0;
    float _2944 = _2924 * _2756;
    uint _2946 = uint(int(uint(_2920) >> uint(2)));
    uint _2948 = uint(int(uint(int(_2946)) >> uint(2)));
    int _2950 = int(_2946) & 3;
    float _2952 = (*spvDescriptorSet0.vp_c9)._m0[int(_2948)][_2950];
    int _2954 = int(_2946) + 1;
    uint _2956 = uint(int(uint(_2954) >> uint(2)));
    int _2958 = _2954 & 3;
    float _2960 = (*spvDescriptorSet0.vp_c9)._m0[int(_2956)][_2958];
    float _2962 = in.m_62.w;
    float _2964 = _2936 * _2942;
    float _2966 = -_2936;
    float _2968 = _2966 + 1.0;
    float _2970 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2972 = _2898 + _2970;
    float _2974 = in.m_66.w;
    float _2976 = _2828 * _2964;
    float _2978 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2980 = _915 + _2978;
    float _2982 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2984 = _915 + _2982;
    int _2986 = abs(_2228);
    float _2988 = fma(_2968, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2976);
    int _2990 = abs(_2240);
    int _2992 = _2920 + 8;
    uint _2994 = uint(int(uint(_2992) >> uint(2)));
    uint _2996 = uint(int(uint(int(_2994)) >> uint(2)));
    int _2998 = int(_2994) & 3;
    float _3000 = (*spvDescriptorSet0.vp_c9)._m0[int(_2996)][_2998];
    int _3002 = int(_2994) + 1;
    uint _3004 = uint(int(uint(_3002) >> uint(2)));
    int _3006 = _3002 & 3;
    float _3008 = (*spvDescriptorSet0.vp_c9)._m0[int(_3004)][_3006];
    float _3010 = fma(_2944, _2984, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _3012 = fma(_2852, _2938, _2988);
    int _3014 = ~_2830;
    int _3016 = _3014 + 1;
    int _3018 = _3016 + 1;
    float _3020 = _1098 + _1116;
    int _3022 = _3018;
    if (!_2834)
    {
        int _3024 = ~_2830;
        int _3026 = _3024 + 1;
        _3022 = _3026;
    }
    int _3028 = _3022;
    float _3030 = _1098 + _1094;
    float _3032 = fma(_2716, _2980, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    bool _3034 = !_2786;
    int _3036 = _3034 ? 0 : 1;
    float _3038 = -_2576;
    float _3040 = _3038 + 1.0;
    float _3042 = _3030 + (-1.0);
    float _3044 = float(_3028);
    float _3046 = _2638 + _2962;
    float _3048 = fma(_2856, _2900, _3012);
    float _3050 = _1094 + _1116;
    int _3052 = abs(_2162);
    float _3054 = _2636 + _2974;
    float _3056 = _1094 + (-0.5);
    float _3058 = fma(_2730, _2894, _3048);
    float _3060 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3062 = _3046 + _3060;
    float _3064 = _2972 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3066 = _1098 + (-0.5);
    float _3068 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _3070 = int(_3068);
    float _3072 = fma(_3062, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3064);
    float _3074 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3076 = _3054 + _3074;
    int _3078 = abs(_2768);
    float _3080 = fma(_2824, _2876, _3058);
    int _3082 = ~_3052;
    int _3084 = _3082 + 1;
    int _3086 = _3084 + 1;
    float _3088 = fma(_3076, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3072);
    float _3090 = fma(_3032, _2832, _3080);
    bool _3092 = !_1942;
    int _3094 = _3092 ? 0 : 1;
    bool _3096 = _2094 != 3;
    float _3098 = fma(_3042, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _3100 = ~_3078;
    int _3102 = _3100 + 1;
    int _3104 = _3102 + 1;
    int _3106 = _3086 * as_type<int>(_2960);
    bool _3108 = !_3096;
    int _3110 = _3108 ? 0 : (-1);
    float _3112 = _2092 + (-0.5);
    bool _3114 = _3088 >= 0.0;
    int _3116 = _3104 * as_type<int>(_2952);
    int _3118 = _3116 + _3106;
    float _3120 = _1928 + 0.5;
    int _3122 = abs(_3110);
    float _3124 = fma(_3010, _2796, _3090);
    int _3126 = ~_2986;
    int _3128 = _3126 + 1;
    int _3130 = _3128 + 1;
    float _3132 = float(uint(_3070));
    float _3134 = fma(_2728, (*spvDescriptorSet0.vp_c9)._m0[166].x, _3124);
    int _3136 = ~_3122;
    int _3138 = _3136 + 1;
    int _3140 = _3138 + 1;
    int _3142 = _3130 * as_type<int>(_3000);
    int _3144 = _3142 + _3118;
    int _3146 = ~_2990;
    int _3148 = _3146 + 1;
    int _3150 = _3148 + 1;
    float _3152 = fma(_3120, (*spvDescriptorSet0.vp_c9)._m0[95].x, _2326);
    float _3154 = 1.0 / _3132;
    int _3156 = _3140 * as_type<int>(_3008);
    int _3158 = _3156 + _3144;
    float _3160 = -_3112;
    float _3162 = -_2418;
    float _3164 = fma(_3160, (*spvDescriptorSet0.vp_c9)._m0[95].y, _3162);
    float _3166 = -_2366;
    float _3168 = _3166 + 1.0;
    float _3170 = _2500 + 0.5;
    int _3172 = _3158 * _3150;
    float _3174 = -_2328;
    float _3176 = _3174 + 1.0;
    float _3178 = _2100 + (-0.5);
    float _3180 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _3182 = _2760 * _2990;
    int _3184 = _3182 + _3172;
    float _3186 = -_3176;
    float _3188 = fma(_3186, _1928, _3152);
    float _3190 = _3176;
    if (_3114)
    {
        _3190 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3192 = _3190;
    float _3194 = fma(_3168, _2092, _3164);
    float _3196 = fma(_3170, (*spvDescriptorSet0.vp_c9)._m0[80].x, _2550);
    float _3198 = float(uint(_3184));
    float _3200 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _3202 = as_type<int>(_3154) + (-2);
    int _3204 = as_type<int>(_3154);
    if (_3114)
    {
        float _3206 = _3192 * 5.0;
        _3204 = as_type<int>(_3206);
    }
    int _3208 = _3204;
    float _3210 = -_3178;
    float _3212 = -_2412;
    float _3214 = fma(_3210, (*spvDescriptorSet0.vp_c9)._m0[80].y, _3212);
    float _3216 = _1620 + (-0.5);
    out.m_76.x = _3188;
    out.m_76.y = _3194;
    float _3218 = as_type<float>(_3202) * _3198;
    int _3220 = ~_3070;
    int _3222 = _3220 + 1;
    float _3224 = _3180 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _3226 = _1876 + 0.5;
    if (_3114)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9939 = as_type<float>(_3208);
        out.gl_Position.z = _9939;
    }
    int _3228 = abs(_3036);
    float _3230 = trunc(_3218);
    float _3232 = precise::max(_3230, 0.0);
    uint _3234 = uint(_3232);
    float _3236 = fma(_3224, _3226, _2450);
    int _3238 = ~_2322;
    int _3240 = _3238 + _2364;
    int _3242 = _3240 + 1;
    out.m_78.x = _3134;
    float _3244 = _3200 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _3246 = abs(_3070);
    int _3248 = _2246 >> 31;
    float _3250 = -_3244;
    float _3252 = -_2458;
    float _3254 = fma(_3250, _3216, _3252);
    float _3256 = _2972 * _2972;
    int _3258 = _1898 >> 31;
    int _3260 = _1001 * _3242;
    int _3262 = _3260 + _1778;
    float _3264 = float(uint(_3246));
    if (_3114)
    {
        out.m_55.x = 0.0;
    }
    int _3266 = _3258 & 3;
    float _3268 = fma(_3062, _3062, _3256);
    int _3270 = _3248 & 3;
    float _3272 = 1.0 / _3264;
    int _3274 = _2246 + _3270;
    float _3276 = _713 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _3278 = _1898 + _3266;
    float _3280 = fma(_3076, _3076, _3268);
    float _3282 = -_2572;
    float _3284 = _3282 + 1.0;
    int _3286 = _3222 * int(_3234);
    int _3288 = _3286 + _3184;
    int _3290 = _3274 >> 2;
    float _3292 = -_2570;
    float _3294 = _3292 + 1.0;
    int _3296 = _3278 >> 2;
    float _3298 = -_3284;
    float _3300 = fma(_2500, _3298, _3196);
    int _3302 = _3290 << 4;
    int _3304 = _3302 + 800;
    float _3306 = -_2578;
    float _3308 = _3306 + 1.0;
    float _3310 = float(uint(_3288));
    float _3312 = fma(_2100, _3294, _3214);
    int _3314 = abs(_3184);
    float _3316 = -_3308;
    float _3318 = fma(_1876, _3316, _3236);
    int _3320 = _3296 << 4;
    int _3322 = _3320 + 368;
    float _3324 = as_type<float>(_3202) * _3310;
    int _3326 = as_type<int>(_3272) + (-2);
    float _3328 = -_2454;
    float _3330 = _3328 + 1.0;
    uint _3332 = uint(int(uint(_3304) >> uint(2)));
    uint _3334 = uint(int(uint(int(_3332)) >> uint(2)));
    int _3336 = int(_3332) & 3;
    float _3338 = (*spvDescriptorSet0.vp_c9)._m0[int(_3334)][_3336];
    int _3340 = int(_3332) + 1;
    uint _3342 = uint(int(uint(_3340) >> uint(2)));
    int _3344 = _3340 & 3;
    float _3346 = (*spvDescriptorSet0.vp_c9)._m0[int(_3342)][_3344];
    float _3348 = float(uint(_3314));
    float _3350 = rsqrt(_3280);
    float _3352 = fma(_1620, _3330, _3254);
    float _3354 = _3276 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _3356 = as_type<float>(_3326) * _3348;
    int _3358 = ~_3246;
    int _3360 = _3358 + 1;
    uint _3362 = uint(int(uint(_3322) >> uint(2)));
    uint _3364 = uint(int(uint(int(_3362)) >> uint(2)));
    int _3366 = int(_3362) & 3;
    float _3368 = (*spvDescriptorSet0.vp_c9)._m0[int(_3364)][_3366];
    int _3370 = int(_3362) + 1;
    uint _3372 = uint(int(uint(_3370) >> uint(2)));
    int _3374 = _3370 & 3;
    float _3376 = (*spvDescriptorSet0.vp_c9)._m0[int(_3372)][_3374];
    float _3378 = float(_3228);
    float _3380 = trunc(_3356);
    float _3382 = precise::max(_3380, 0.0);
    uint _3384 = uint(_3382);
    out.m_80.x = _3300;
    out.m_80.y = _3312;
    out.m_80.z = _3318;
    out.m_80.w = _3352;
    int _3386 = ~_2124;
    int _3388 = _3386 + _2184;
    int _3390 = _3388 + 1;
    float _3392 = _3378 * _3044;
    int _3394 = abs(_2012);
    int _3396 = _3322 + 8;
    uint _3398 = uint(int(uint(_3396) >> uint(2)));
    uint _3400 = uint(int(uint(int(_3398)) >> uint(2)));
    int _3402 = int(_3398) & 3;
    float _3404 = (*spvDescriptorSet0.vp_c9)._m0[int(_3400)][_3402];
    int _3406 = int(_3398) + 1;
    uint _3408 = uint(int(uint(_3406) >> uint(2)));
    int _3410 = _3406 & 3;
    float _3412 = (*spvDescriptorSet0.vp_c9)._m0[int(_3408)][_3410];
    int _3414 = abs(_2298);
    float _3416 = trunc(_3324);
    float _3418 = precise::max(_3416, 0.0);
    uint _3420 = uint(_3418);
    int _3422 = _951 * _3390;
    int _3424 = _3422 + _1430;
    int _3426 = abs(_3094);
    float _3428 = _3354 * _3350;
    int _3430 = ~_3414;
    int _3432 = _3430 + 1;
    int _3434 = _3432 + 1;
    int _3436 = abs(_2144);
    int _3438 = _3304 + 8;
    uint _3440 = uint(int(uint(_3438) >> uint(2)));
    uint _3442 = uint(int(uint(int(_3440)) >> uint(2)));
    int _3444 = int(_3440) & 3;
    float _3446 = (*spvDescriptorSet0.vp_c9)._m0[int(_3442)][_3444];
    int _3448 = int(_3440) + 1;
    uint _3450 = uint(int(uint(_3448) >> uint(2)));
    int _3452 = _3448 & 3;
    float _3454 = (*spvDescriptorSet0.vp_c9)._m0[int(_3450)][_3452];
    int _3456 = _3360 * int(_3384);
    int _3458 = _3456 + _3314;
    float _3460 = _2972 * _3428;
    int _3462 = ~_3070;
    int _3464 = _3462 + 1;
    float _3466 = _3062 * _3428;
    float _3468 = float(uint(_3458));
    float _3470 = -_3460;
    float _3472 = _2972 + _3470;
    bool _3474 = !_2262;
    int _3476 = _3474 ? 0 : 1;
    float _3478 = -_3466;
    float _3480 = _3062 + _3478;
    int _3482 = int(_3234) + int(_3420);
    float _3484 = as_type<float>(_3326) * _3468;
    int _3486 = ~_3394;
    int _3488 = _3486 + 1;
    int _3490 = _3488 + 1;
    float _3492 = _3472 * _3472;
    bool _3494 = _1940 != 3;
    float _3496 = trunc(_3484);
    float _3498 = precise::max(_3496, 0.0);
    uint _3500 = uint(_3498);
    int _3502 = _3464 * _3482;
    int _3504 = _3502 + _3184;
    bool _3506 = _951 == 0;
    float _3508 = _1304 + (-0.5);
    bool _3510 = !_1682;
    int _3512 = _3510 ? _3262 : (-1);
    float _3514 = fma(_3480, _3480, _3492);
    bool _3516 = !_3506;
    int _3518 = _3516 ? _3424 : (-1);
    int _3520 = _3434 * as_type<int>(_3346);
    int _3522 = abs(_3476);
    int _3524 = ~_3522;
    int _3526 = _3524 + 1;
    int _3528 = _3526 + 1;
    int _3530 = ~_3426;
    int _3532 = _3530 + 1;
    int _3534 = _3532 + 1;
    int _3536 = _3490 * as_type<int>(_3376);
    bool _3538 = !_3494;
    int _3540 = _3538 ? 0 : (-1);
    int _3542 = _3528 * as_type<int>(_3338);
    int _3544 = _3542 + _3520;
    bool _3546 = uint(_3504) >= uint(_3070);
    int _3548 = _3534 * as_type<int>(_3368);
    int _3550 = _3548 + _3536;
    int _3552 = ~_3246;
    int _3554 = _3552 + 1;
    int _3556 = int(_3384) + int(_3500);
    bool _3558 = !_3546;
    int _3560 = _3558 ? 0 : (-1);
    int _3562 = abs(_2350);
    int _3564 = _3554 * _3556;
    int _3566 = _3564 + _3314;
    bool _3568 = _2260 != 3;
    int _3570 = ~_3482;
    int _3572 = _3570 + _3560;
    int _3574 = _3572 + 1;
    int _3576 = ~_3562;
    int _3578 = _3576 + 1;
    int _3580 = _3578 + 1;
    int _3582 = abs(_2070);
    bool _3584 = !_3568;
    int _3586 = _3584 ? 0 : (-1);
    int _3588 = _3580 * as_type<int>(_3446);
    int _3590 = _3588 + _3544;
    bool _3592 = uint(_3566) >= uint(_3246);
    int _3594 = _3070 * _3574;
    int _3596 = _3594 + _3184;
    int _3598 = abs(_3540);
    int _3600 = ~_3582;
    int _3602 = _3600 + 1;
    int _3604 = _3602 + 1;
    int _3606 = _3184 ^ _3070;
    int _3608 = abs(_3586);
    int _3610 = _3604 * as_type<int>(_3404);
    int _3612 = _3610 + _3550;
    float _3614 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _3616 = !_3592;
    int _3618 = _3616 ? 0 : (-1);
    int _3620 = ~_3598;
    int _3622 = _3620 + 1;
    int _3624 = _3622 + 1;
    uint _3626 = uint(int(uint(_3606) >> uint(31)));
    bool _3628 = _3070 == 0;
    int _3630 = _3624 * as_type<int>(_3412);
    int _3632 = _3630 + _3612;
    int _3634 = ~_3618;
    int _3636 = _3556 + _3634;
    int _3638 = _3636 + 1;
    int _3640 = ~int(_3626);
    int _3642 = _3640 + 1;
    float _3644 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _3646 = abs(_2250);
    int _3648 = ~_3608;
    int _3650 = _3648 + 1;
    int _3652 = _3650 + 1;
    bool _3654 = !_3628;
    int _3656 = _3654 ? _3596 : (-1);
    int _3658 = _3652 * as_type<int>(_3454);
    int _3660 = _3658 + _3590;
    int _3662 = _3638 ^ _3642;
    int _3664 = ~_3436;
    int _3666 = _3664 + 1;
    int _3668 = _3666 + 1;
    float _3670 = in.m_82.x;
    float _3672 = in.m_82.y;
    float _3674 = in.m_82.z;
    bool _3676 = _3070 == 0;
    int _3678 = ~_3642;
    int _3680 = _3678 + _3662;
    int _3682 = _3680 + 1;
    int _3684 = _3632 * _3668;
    float _3686 = float(_3656);
    float _3688 = _3614 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _3690 = ~_3646;
    int _3692 = _3690 + 1;
    int _3694 = _3692 + 1;
    int _3696 = _3518 * _3436;
    int _3698 = _3696 + _3684;
    bool _3700 = !_3676;
    int _3702 = _3700 ? _3682 : (-1);
    float _3704 = fma(_3688, _3686, _2582);
    float _3706 = _1274 + 0.5;
    int _3708 = _3660 * _3694;
    float _3710 = float(_3702);
    float _3712 = _3644 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _3714 = fma(_3688, _3706, _3704);
    int _3716 = _3512 * _3646;
    int _3718 = _3716 + _3708;
    float _3720 = -_2530;
    float _3722 = fma(_3712, _3710, _3720);
    float _3724 = -_3040;
    float _3726 = fma(_1274, _3724, _3714);
    float _3728 = -_2574;
    float _3730 = _3728 + 1.0;
    float _3732 = _3392 * (-2.0);
    float _3734 = -_3712;
    float _3736 = fma(_3734, _3508, _3722);
    float _3738 = float(_3698);
    float _3740 = float(_3718);
    float _3742 = fma(_1304, _3730, _3736);
    float _3744 = fma(_3732, _3670, _3670);
    float _3746 = _3076 * _3428;
    bool _3748 = !_2790;
    int _3750 = _3748 ? 0 : 1;
    out.m_84.x = _3738;
    float _3752 = fma(_3098, _3732, _3098);
    float _3754 = -_3746;
    float _3756 = _3076 + _3754;
    bool _3758 = !_2794;
    int _3760 = _3758 ? 0 : 1;
    out.m_84.w = _3740;
    int _3762 = abs(_3750);
    out.m_86.x = _3726;
    out.m_86.y = _3742;
    float _3764 = _3674;
    if (_3114)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3766 = -_3460;
    float _3768 = _2898 + _3766;
    float _3770 = float(_2646);
    float _3772 = -_3466;
    float _3774 = _3046 + _3772;
    float _3776 = float(_3762);
    float _3778 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3780 = _3768 + _3778;
    float _3782 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3784 = _3774 + _3782;
    float _3786 = _3020 + (-1.0);
    float _3788 = _3780 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3790 = -_3746;
    float _3792 = _3054 + _3790;
    float _3794 = _3776 * _3770;
    int _3796 = abs(_3760);
    float _3798 = fma(_3784, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3788);
    float _3800 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3802 = _3792 + _3800;
    float _3804 = float(_2778);
    float _3806 = fma(_3786, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _3808 = float(_3796);
    float _3810 = fma(_3802, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3798);
    float _3812 = _3794 * (-2.0);
    float _3814 = fma(_3056, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3744);
    float _3816 = _3808 * _3804;
    float _3818 = fma(_3812, _3672, _3672);
    bool _3820 = _3810 >= 0.0;
    float _3822 = fma(_3806, _3812, _3806);
    float _3824 = _3050 + (-1.0);
    float _3826 = fma(_3066, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3818);
    float _3828 = _3816 * (-2.0);
    float _3830 = fma(_3752, _2588, _3814);
    float _3832 = fma(_3756, _3756, _3514);
    float _3834 = fma(_3822, _2588, _3826);
    float _3836 = _1116 + (-0.5);
    float _3838 = fma(_3824, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3840 = fma(_3828, _3674, _3674);
    float _3842 = _3830 * 0.15915493667125701904296875;
    float _3844 = _3834 * 0.15915493667125701904296875;
    if (_3820)
    {
        _3764 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3846 = _3764;
    float _3848 = fma(_3836, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3840);
    float _3850 = sqrt(_3832);
    float _3852 = fma(_3838, _3828, _3838);
    int _3854 = as_type<int>(_3846);
    if (_3820)
    {
        out.m_55.x = 0.0;
    }
    if (_3820)
    {
        float _3856 = _3846 * 5.0;
        _3854 = as_type<int>(_3856);
    }
    int _3858 = _3854;
    float _3860 = fma(_3852, _2588, _3848);
    float _3862 = _3842 * 6.283185482025146484375;
    float _3864 = sin(_3862);
    if (_3820)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _10863 = as_type<float>(_3858);
        out.gl_Position.z = _10863;
    }
    float _3866 = _3860 * 0.15915493667125701904296875;
    float _3868 = _3842 * 6.283185482025146484375;
    float _3870 = cos(_3868);
    float _3872 = _3844 * 6.283185482025146484375;
    float _3874 = sin(_3872);
    float _3876 = _3844 * 6.283185482025146484375;
    float _3878 = cos(_3876);
    if (_3820)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3880 = _3866 * 6.283185482025146484375;
    float _3882 = cos(_3880);
    float _3884 = _3350 * _3850;
    float _3886 = _711 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3888 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _225);
    float _3890 = _3870 * _3878;
    float _3892 = _3276 * _3884;
    float _3894 = _3884 * _3886;
    float _3896 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _221);
    float _3898 = _3866 * 6.283185482025146484375;
    float _3900 = sin(_3898);
    float _3902 = _3870 * _3874;
    float _3904 = _3888 * _3894;
    float _3906 = _3864 * _3874;
    float _3908 = _3864 * _3878;
    float _3910 = _3896 * _3892;
    float _3912 = _225 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3914 = _3870 * _3882;
    float _3916 = _3878 * _3882;
    float _3918 = _3864 * _3882;
    float _3920 = _3874 * _3882;
    float _3922 = _3914 * _3904;
    float _3924 = _3884 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _3926 = _3924 * 0.5;
    float _3928 = _3918 * _3904;
    float _3930 = fma(_3900, _3890, _3906);
    float _3932 = -_3908;
    float _3934 = fma(_3900, _3902, _3932);
    float _3936 = -_3904;
    float _3938 = _3900 * _3936;
    float _3940 = -_3902;
    float _3942 = fma(_3900, _3908, _3940);
    float _3944 = fma(_3930, _3910, _3922);
    float _3946 = fma(_3900, _3906, _3890);
    float _3948 = fma(_3916, _3910, _3938);
    float _3950 = fma(_3942, _3910, _3928);
    float _3952 = fma(_3934, _3926, _3944);
    float _3954 = fma(_3920, _3926, _3948);
    float _3956 = fma(_3946, _3926, _3950);
    float _3958 = _3952 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3960 = _3952 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3962 = _3952 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3964 = fma(_3954, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3958);
    float _3966 = fma(_3954, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3960);
    float _3968 = fma(_3954, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3962);
    float _3970 = _3930 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3972 = fma(_3956, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3964);
    float _3974 = fma(_3956, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3966);
    float _3976 = _3930 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3978 = fma(_3956, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3968);
    float _3980 = _3972 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _3982 = _3974 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _3984 = fma(_3916, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3976);
    float _3986 = _3978 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _3988 = _3046 + _3980;
    float _3990 = _3054 + _3982;
    float _3992 = _3930 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3994 = fma(_3916, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3970);
    float _3996 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3998 = _3988 + _3996;
    float _4000 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _4002 = _3990 + _4000;
    float _4004 = fma(_3916, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3992);
    float _4006 = _3914 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _4008 = _3998 * _3998;
    float _4010 = _4002 * _4002;
    float _4012 = _3914 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _4014 = _3914 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _4016 = -_3900;
    float _4018 = fma(_4016, (*spvDescriptorSet0.vp_c8)._m0[24].x, _4006);
    float _4020 = _4008 + _4010;
    float _4022 = -_3900;
    float _4024 = fma(_4022, (*spvDescriptorSet0.vp_c8)._m0[25].x, _4012);
    float _4026 = -_3900;
    float _4028 = fma(_4026, (*spvDescriptorSet0.vp_c8)._m0[26].x, _4014);
    float _4030 = fma(_3912, _3912, 1.0);
    float _4032 = sqrt(_4020);
    float _4034 = _3934 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _4036 = _3934 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _4038 = _3934 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _4040 = _2898 + _3986;
    float _4042 = fma(_3920, (*spvDescriptorSet0.vp_c8)._m0[24].x, _4034);
    float _4044 = fma(_3920, (*spvDescriptorSet0.vp_c8)._m0[25].x, _4036);
    float _4046 = fma(_3920, (*spvDescriptorSet0.vp_c8)._m0[26].x, _4038);
    float _4048 = rsqrt(_4030);
    bool _4050 = _4032 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4052 = _3920;
    float _4054 = _4006;
    float _4056 = _4036;
    float _4058 = _4030;
    float _4060 = _4034;
    if (!_4050)
    {
        _4052 = _4010;
    }
    float _4062 = _4052;
    float _4064 = _4062;
    if (!_4050)
    {
        _4054 = _4008;
    }
    float _4066 = _4054;
    float _4068 = _4066;
    if (!_4050)
    {
        _4056 = _3988;
    }
    float _4070 = _4056;
    float _4072 = _4070;
    if (!_4050)
    {
        _4058 = _3990;
    }
    float _4074 = _4058;
    float _4076 = _4074;
    if (!_4050)
    {
        _4060 = _4040;
    }
    float _4078 = _4060;
    bool _4080 = !_4050;
    float _4082 = _4078;
    if (!_4080)
    {
        float _4084 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4086 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _4088 = _4032 + _4086;
        float _4090 = rsqrt(_4020);
        float _4092 = _4088 * _4084;
        float _4094 = _4040 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4096 = _4092 * 0.15915493667125701904296875;
        float _4098 = _4096 * 6.283185482025146484375;
        float _4100 = sin(_4098);
        float _4102 = _4096 * 6.283185482025146484375;
        float _4104 = cos(_4102);
        float _4106 = fma(_4100, _4094, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _4108 = _4090 * _4106;
        float _4110 = _4104 + (-1.0);
        float _4112 = fma(_3998, _4108, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _4114 = fma(_4002, _4108, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _4116 = _4110 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4118 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _4120 = _4112 + _4118;
        float _4122 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _4124 = _4114 + _4122;
        float _4126 = fma(_4040, _4104, _4116);
        float _4128 = _4120 * _4120;
        float _4130 = _4124 * _4124;
        _4082 = _4126;
        _4068 = _4128;
        _4064 = _4130;
        _4072 = _4112;
        _4076 = _4114;
    }
    float _4132 = _4082;
    float _4134 = _4068;
    float _4136 = _4064;
    float _4138 = _4072;
    float _4140 = _4076;
    float _4142 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _4144 = _4132 + _4142;
    float _4146 = fma(_3918, (*spvDescriptorSet0.vp_c8)._m0[24].z, _4018);
    float _4148 = fma(_3918, (*spvDescriptorSet0.vp_c8)._m0[25].z, _4024);
    float _4150 = fma(_3918, (*spvDescriptorSet0.vp_c8)._m0[26].z, _4028);
    float _4152 = fma(_4144, _4144, _4134);
    float _4154 = fma(_3946, (*spvDescriptorSet0.vp_c8)._m0[25].z, _4044);
    float _4156 = fma(_3946, (*spvDescriptorSet0.vp_c8)._m0[24].z, _4042);
    float _4158 = fma(_3946, (*spvDescriptorSet0.vp_c8)._m0[26].z, _4046);
    float _4160 = _4152 + _4136;
    float _4162 = fma(_3942, (*spvDescriptorSet0.vp_c8)._m0[24].z, _4004);
    float _4164 = _3912 * _4048;
    float _4166 = fma(_3942, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3994);
    float _4168 = _221 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _4170 = _3912 * _4146;
    float _4172 = _3912 * _4148;
    float _4174 = fma(_3942, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3984);
    float _4176 = _3912 * _4150;
    float _4178 = -_4156;
    float _4180 = _4164 * _4178;
    float _4182 = -_4154;
    float _4184 = _4164 * _4182;
    float _4186 = -_4158;
    float _4188 = _4164 * _4186;
    float _4190 = sqrt(_4160);
    float _4192 = fma(_4168, _4162, _4170);
    float _4194 = fma(_4168, _4166, _4172);
    float _4196 = fma(_4168, _4174, _4176);
    float _4198 = fma(_4048, _4146, _4180);
    float _4200 = fma(_4048, _4148, _4184);
    float _4202 = fma(_4048, _4150, _4188);
    float _4204 = _4156 + _4192;
    float _4206 = _4154 + _4194;
    float _4208 = _4158 + _4196;
    out.m_88.x = _4162;
    out.m_88.y = _4166;
    out.m_88.z = _4174;
    out.m_90.x = _4198;
    out.m_90.y = _4200;
    out.m_90.z = _4202;
    bool _4210 = _4190 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _4212 = isnan(_4190);
    bool _4214 = _4210 || _4212;
    bool _4216 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _4218 = _4214 || _4216;
    out.m_92.x = _4204;
    out.m_92.y = _4206;
    out.m_92.z = _4208;
    float _4220 = _4194;
    float _4222 = _4202;
    if (!_4218)
    {
        _4220 = 1.0;
    }
    float _4224 = _4220;
    bool _4226 = !_4218;
    float _4228 = _4224;
    if (!_4226)
    {
        bool _4230 = _4190 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _4232 = isnan(_4190);
        bool _4234 = _4230 || _4232;
        bool _4236 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _4238 = _4234 || _4236;
        if (!_4238)
        {
            float _4240 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4242 = _4190 + _4240;
            float _4244 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4246 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _4244;
            float _4248 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _4250 = _4248 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _4252 = 1.0 / _4246;
            float _4254 = _4242 * _4252;
            float _4256 = fma(_4254, _4250, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _4228 = _4256;
            _4258 = true;
        }
        else
        {
            bool _4260 = _4190 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _4262 = isnan(_4190);
            bool _4264 = _4260 || _4262;
            bool _4266 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _4268 = _4264 || _4266;
            if (!_4268)
            {
                float _4270 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4272 = _4190 + _4270;
                float _4274 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4276 = _4274 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _4278 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _4280 = _4278 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _4282 = 1.0 / _4276;
                float _4284 = _4272 * _4282;
                float _4286 = fma(_4284, _4280, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _4228 = _4286;
                _4258 = true;
            }
            else
            {
                _4228 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _4258 = false;
    float _4288 = _4228;
    float _4290 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _4292 = _4132 + _4290;
    float _4294 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _4296 = _4138 + _4294;
    float _4298 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _4300 = _4140 + _4298;
    float _4302 = fma(_4292, _4288, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _4304 = fma(_4296, _4288, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _4306 = -_2898;
    float _4308 = _4306 + _4302;
    float _4310 = fma(_4300, _4288, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _4312 = -_3046;
    float _4314 = _4312 + _4304;
    float _4316 = _4308 * _4308;
    float _4318 = -_3054;
    float _4320 = _4318 + _4310;
    float _4322 = fma(_4314, _4314, _4316);
    float _4324 = fma(_4320, _4320, _4322);
    float _4326 = sqrt(_4324);
    bool _4328 = _4326 > 0.0;
    float _4330 = _4326;
    float _4332 = _4300;
    float _4334 = _4292;
    float _4336 = _4304;
    if (!_4328)
    {
        _4330 = _4304;
    }
    float _4338 = _4330;
    float _4340 = _4338;
    if (!_4328)
    {
        _4332 = _4302;
    }
    float _4342 = _4332;
    float _4344 = _4342;
    if (!_4328)
    {
        _4334 = _4310;
    }
    float _4346 = _4334;
    bool _4348 = !_4328;
    float _4350 = _4346;
    float _4352 = _4346;
    if (!_4348)
    {
        float _4354 = _241 * _241;
        float _4356 = fma(_237, _237, _4354);
        float _4358 = fma(_243, _243, _4356);
        float _4360 = rsqrt(_4324);
        float _4362 = sqrt(_4358);
        float _4364 = _4314 * _4360;
        float _4366 = _4308 * _4360;
        float _4368 = _4320 * _4360;
        bool _4370 = _4362 > 0.0;
        float _4372 = _4360;
        float _4374 = _4362;
        if (!_4370)
        {
            _4372 = _4304;
        }
        float _4376 = _4372;
        _4340 = _4376;
        if (!_4370)
        {
            _4374 = _4302;
        }
        float _4378 = _4374;
        _4344 = _4378;
        if (!_4370)
        {
            _4350 = _4310;
        }
        float _4380 = _4350;
        bool _4382 = !_4370;
        _4352 = _4380;
        if (!_4382)
        {
            float _4384 = rsqrt(_4358);
            float _4386 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _4388 = _241 * _4384;
            float _4390 = _237 * _4384;
            float _4392 = _4366 * _4388;
            float _4394 = _243 * _4384;
            float _4396 = fma(_4364, _4390, _4392);
            float _4398 = _4386 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _4400 = fma(_4368, _4394, _4396);
            float _4402 = _4400 * _4398;
            float _4404 = fma(_237, _4402, _4304);
            float _4406 = fma(_241, _4402, _4302);
            float _4408 = fma(_243, _4402, _4310);
            _4344 = _4406;
            _4340 = _4404;
            _4352 = _4408;
        }
    }
    float _4410 = _4344;
    float _4412 = _4340;
    float _4414 = _4352;
    float _4416 = -_3460;
    float _4418 = _4416 + _4410;
    float _4420 = -_3466;
    float _4422 = _4420 + _4412;
    float _4424 = -_3746;
    float _4426 = _4424 + _4414;
    float _4428 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4430 = _4418 + _4428;
    float _4432 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4434 = _4422 + _4432;
    float _4436 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4438 = _4426 + _4436;
    float _4440 = _4430 * _4430;
    float _4442 = fma(_3792, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4444 = fma(_4434, _4434, _4440);
    float _4446 = fma(_4438, _4438, _4444);
    float _4448 = rsqrt(_4446);
    float _4450 = _4448 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4452 = _4434 * _4450;
    float _4454 = _4438 * _4450;
    float _4456 = _4452 * _4452;
    float _4458 = _4454 * _4454;
    float _4460 = _4456 + _4458;
    float _4462 = sqrt(_4460);
    bool _4464 = _4462 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4466 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4468 = _4462 + _4466;
    float _4470 = _4448;
    float _4472 = _4468;
    float _4474 = _4430;
    float _4476 = _4460;
    if (_4464)
    {
        float _4478 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4470 = _4478;
    }
    float _4480 = _4470;
    float _4482 = _4480;
    if (_4464)
    {
        float _4484 = _4468 * _4480;
        _4472 = _4484;
    }
    float _4486 = _4472;
    if (_4464)
    {
        float _4488 = rsqrt(_4460);
        _4482 = _4488;
    }
    float _4490 = _4482;
    float _4492 = _4490;
    if (_4464)
    {
        float _4494 = _4486 * 0.15915493667125701904296875;
        _4336 = _4494;
    }
    float _4496 = _4336;
    float _4498 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4500 = _4438;
    float _4502 = _4496;
    if (_4464)
    {
        float _4504 = _4496 * 6.283185482025146484375;
        float _4506 = sin(_4504);
        _4500 = _4506;
    }
    float _4508 = _4500;
    float _4510 = precise::max(0.0, _4498);
    float _4512 = _4314;
    float _4514 = _4510;
    if (_4464)
    {
        float _4516 = _4496 * 6.283185482025146484375;
        float _4518 = cos(_4516);
        _4512 = _4518;
    }
    float _4520 = _4512;
    float _4522 = -_4450;
    float _4524 = -_4510;
    float _4526 = fma(_4430, _4522, _4524);
    if (_4464)
    {
        float _4528 = _4526 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4474 = _4528;
    }
    float _4530 = _4474;
    float _4532 = fma(_3774, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _4534 = _4508;
    float _4536 = _4530;
    if (_4464)
    {
        float _4538 = fma(_4508, _4530, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4534 = _4538;
    }
    float _4540 = _4534;
    float _4542 = _4540;
    if (!_4464)
    {
        _4536 = _4454;
    }
    float _4544 = _4536;
    float _4546 = floor(_4532);
    float _4548 = _4544;
    if (!_4464)
    {
        _4502 = _4456;
    }
    float _4550 = _4502;
    float _4552 = _4550;
    if (_4464)
    {
        float _4554 = _4490 * _4540;
        _4222 = _4554;
    }
    float _4556 = _4222;
    if (!_4464)
    {
        _4492 = _4452;
    }
    float _4558 = _4492;
    float _4560 = _4558;
    float _4562 = _4520;
    if (_4464)
    {
        float _4564 = _4520 + (-1.0);
        _4514 = _4564;
    }
    float _4566 = _4514;
    if (_4464)
    {
        float _4568 = _4452 * _4556;
        _4560 = _4568;
    }
    float _4570 = _4560;
    if (!_4464)
    {
        _4542 = _4526;
    }
    float _4572 = _4542;
    float _4574 = _4572;
    if (_4464)
    {
        float _4576 = _4454 * _4556;
        _4548 = _4576;
    }
    float _4578 = _4548;
    if (_4464)
    {
        float _4580 = _4566 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4476 = _4580;
    }
    float _4582 = _4476;
    if (_4464)
    {
        float _4584 = _4570 * _4570;
        _4552 = _4584;
    }
    float _4586 = _4552;
    float _4588 = _4418 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4590 = sqrt(_4446);
    if (_4464)
    {
        float _4592 = fma(_4526, _4520, _4582);
        _4574 = _4592;
    }
    float _4594 = _4574;
    if (!_4464)
    {
        _4562 = _4458;
    }
    float _4596 = _4562;
    float _4598 = _4596;
    if (_4464)
    {
        float _4600 = _4578 * _4578;
        _4598 = _4600;
    }
    float _4602 = _4598;
    float _4604 = fma(_4422, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4588);
    float _4606 = fma(_4594, _4594, _4586);
    float _4608 = _4418 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4610 = _4418 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4612 = _4606 + _4602;
    float _4614 = fma(_4426, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4604);
    float _4616 = _4418 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4618 = fma(_4422, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4608);
    float _4620 = rsqrt(_4612);
    float _4622 = fma(_4422, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4616);
    float _4624 = fma(_4426, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4618);
    float _4626 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4628 = fma(_4590, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4626);
    float _4630 = precise::clamp(_4628, 0.0, 1.0);
    float _4632 = _4614 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4634 = fma(_4426, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4622);
    float _4636 = _4624 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4638 = fma(_4422, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4610);
    float _4640 = -_4630;
    float _4642 = _4640 + 1.0;
    float _4644 = _4634 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4646 = _4636 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4648 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4650 = _4632 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4652 = fma(_4426, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4638);
    float _4654 = fma(_4644, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4646);
    float _4656 = _4620 * _4570;
    float _4658 = abs(_4642);
    float _4660 = log2(_4658);
    float _4662 = -_4650;
    float _4664 = fma(_4662, _4648, 1.0);
    float _4666 = _4652 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4668 = _4620 * _4594;
    float _4670 = _4656 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4672 = _4620 * _4578;
    float _4674 = fma(_4632, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4654);
    float _4676 = -_4546;
    float _4678 = _4532 + _4676;
    float _4680 = -_4670;
    float _4682 = fma(_4668, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4680);
    float _4684 = log2(_4664);
    float _4686 = fma(_4666, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4674);
    float _4688 = _4636 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4690 = -_4672;
    float _4692 = fma(_4690, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4682);
    float _4694 = _4636 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4696 = fma(_4644, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4688);
    float _4698 = fma(_4692, -0.5, 0.5);
    float _4700 = _4660 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4702 = 1.0 / _4686;
    float _4704 = fma(_4692, 0.5, 0.5);
    float _4706 = fma(_4644, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4694);
    float _4708 = fma(_4632, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4696);
    float _4710 = _4668 + 1.0;
    float _4712 = fma(_4632, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4706);
    float _4714 = fma(_4666, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4708);
    float _4716 = exp2(_4700);
    float _4718 = _4684 * 0.693147182464599609375;
    float _4720 = fma(_4666, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4712);
    float _4722 = sqrt(_4698);
    float _4724 = fma(_4704, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4726 = _4720 * _4702;
    float _4728 = fma(_4704, _4724, -0.212114393711090087890625);
    float _4730 = fma(_4726, 0.5, 0.5);
    float _4732 = floor(_4442);
    float _4734 = fma(_4704, _4728, 1.570728778839111328125);
    float _4736 = -_4668;
    float _4738 = fma(_4716, _4710, _4736);
    float _4740 = _4714 * _4702;
    float _4742 = _4718 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4744 = fma(_4738, 0.5, 0.5);
    float _4746 = fma(_4740, -0.5, 0.5);
    float _4748 = _4722 * 0.636619746685028076171875;
    float _4750 = -_4734;
    float _4752 = fma(_4748, _4750, 1.0);
    float _4754 = -_4732;
    float _4756 = _4442 + _4754;
    float2 _12367 = float2(_4678, _4756);
    float _4758 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_12367, float2(0.0), isnan(_12367)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_12367, float2(0.0), isnan(_12367)), level(0.0)).x;
    float3 _12378 = float3(_4730, _4746, _4742);
    float _4760 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_12378, float3(0.0), isnan(_12378)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_12378, float3(0.0), isnan(_12378)), level(0.0)).x;
    float3 _12389 = float3(_4730, _4746, _4742);
    float4 _4763 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_12389, float3(0.0), isnan(_12389)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_12389, float3(0.0), isnan(_12389)), level(0.0)).xyzw;
    float _4765 = _4763.x;
    float _4767 = _4763.y;
    float _4769 = _4763.z;
    float _4771 = _4763.w;
    float2 _12405 = float2(_4752, _4744);
    float3 _4775 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_12405, float2(0.0), isnan(_12405)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_12405, float2(0.0), isnan(_12405)), level(0.0)).xyz;
    float _4777 = _4775.x;
    float _4779 = _4775.y;
    float _4781 = _4775.z;
    float _4783 = _3768 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4785 = _4660 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4787 = fma(_3774, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4783);
    float _4789 = _3768 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _4791 = fma(_3792, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4787);
    float _4793 = fma(_3774, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4789);
    float _4795 = _4791 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4797 = fma(_3792, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4793);
    float _4799 = 1.0 / _4795;
    float _4801 = _4797 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4803 = _4801 + _4795;
    float _4805 = _4803 * _4799;
    float _4807 = _4805 * 0.5;
    float _4809 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _4811 = fma(_4807, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4809);
    float _4813 = 1.0 / _4811;
    float _4815 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4817 = _4813 * _4815;
    float _4819 = in.m_94.x;
    float _4821 = abs(_4817);
    float _4823 = log2(_4821);
    bool _4825 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _4827 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _4829 = _4825 || _4827;
    bool _4831 = isnan(0.5);
    bool _4833 = _4829 || _4831;
    float _4835 = _4823 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _4837 = exp2(_4835);
    float _4839 = fma(_4837, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4841 = precise::clamp(_4839, 0.0, 1.0);
    bool _4843 = _4817 <= 8000.0;
    bool _4845 = isnan(_4817);
    bool _4847 = _4843 || _4845;
    bool _4849 = isnan(8000.0);
    bool _4851 = _4847 || _4849;
    float _4853 = float(_4851);
    float _4855 = fma(_4841, -2.0, 3.0);
    float _4857 = _4841 * _4841;
    float _4859 = _4636 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4861 = _4857 * _4855;
    float _4863 = fma(_4644, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4859);
    float _4865 = -_4861;
    float _4867 = _4865 + 1.0;
    float _4869 = fma(_4632, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4863);
    float _4871 = fma(_4867, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4861);
    float _4873 = fma(_4666, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4869);
    float _4875 = _4720 + _4686;
    float _4877 = exp2(_4785);
    float _4879 = _4853 * _4871;
    float _4881 = _4873 + _4686;
    float _4883 = _4686 * 0.5;
    float _4885 = _4875 * 0.5;
    float _4887 = _4853;
    float _4889 = _4714;
    float _4891 = _4720;
    if (_4833)
    {
        _4887 = 1.0;
    }
    float _4893 = _4887;
    float _4895 = _4881 * 0.5;
    float _4897 = fma(_4714, -0.5, _4883);
    float _4899 = _4893;
    float _4901 = _4767;
    float _4903 = _4765;
    if (!_4833)
    {
        float _4905 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _4907 = _4905 * 0.15915493667125701904296875;
        float _4909 = _4907 * 6.283185482025146484375;
        float _4911 = cos(_4909);
        float _4913 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _4915 = _4913 * 0.15915493667125701904296875;
        float _4917 = _4907 * 6.283185482025146484375;
        float _4919 = sin(_4917);
        float _4921 = 1.0 / _4911;
        float _4923 = _4915 * 6.283185482025146484375;
        float _4925 = cos(_4923);
        float _4927 = _4919 * _4921;
        float _4929 = _4915 * 6.283185482025146484375;
        float _4931 = sin(_4929);
        float _4933 = _4925 * _4927;
        float _4935 = 1.0 / _4933;
        float _4937 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4939 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _4937;
        float _4941 = 1.0 / _4939;
        float _4943 = _4931 * _4935;
        float _4945 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4947 = fma(_4817, _4943, _4945);
        float _4949 = _4947 * _4941;
        float _4951 = precise::clamp(_4949, 0.0, 1.0);
        _4899 = _4951;
    }
    float _4953 = _4899;
    float _4955 = _4879 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _4957 = -_4877;
    float _4959 = _4957 + 1.0;
    float _4961 = -_4758;
    float _4963 = _4961 + 1.0;
    out.m_96.x = _4885;
    out.m_96.y = _4897;
    out.m_96.z = _4895;
    out.m_96.w = _4686;
    float _4965 = _4959 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _4967 = _4963 * _4955;
    float _4969 = precise::clamp(_4967, 0.0, 1.0);
    bool _4971 = _4590 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4973 = isnan(_4590);
    bool _4975 = _4971 || _4973;
    bool _4977 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4979 = _4975 || _4977;
    out.m_98.x = _4422;
    out.m_98.y = _4418;
    out.m_98.z = _4426;
    float _4981 = _4965 * _4760;
    float _4983 = -_4969;
    float _4985 = fma(_4983, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4987 = -_4965;
    float _4989 = _4987 + 1.0;
    float _4991 = _4771 * _4981;
    float _4993 = _4985 * _4819;
    float _4995 = _4781 * _4981;
    out.gl_Position.x = _4720;
    out.gl_Position.y = _4714;
    out.gl_Position.z = _4873;
    out.gl_Position.w = _4686;
    float _4997 = fma(_4777, _4991, _4765);
    float _4999 = fma(_4779, _4991, _4767);
    float _5001 = _4993 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _5003 = _4771 * _4989;
    float _5005 = fma(_4771, _4995, _4769);
    float _5007 = _4989;
    float _5009 = _4991;
    if (!_4979)
    {
        _4901 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _5011 = _4901;
    out.m_100.x = _5001;
    float _5013 = _5011;
    float _5015 = _5011;
    if (!_4979)
    {
        _4903 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _5017 = _4903;
    float _5019 = _5017;
    float _5021 = _5017;
    if (!_4979)
    {
        _5007 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _5023 = _5007;
    out.m_102.x = _4997;
    out.m_102.y = _4999;
    out.m_102.z = _5005;
    out.m_102.w = _5003;
    float _5025 = _4953 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _5027 = _5023;
    float _5029 = _5023;
    if (!_4979)
    {
        _4889 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _5031 = _4889;
    float _5033 = _5031;
    float _5035 = _5031;
    if (!_4979)
    {
        _4891 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _5037 = _4891;
    float _5039 = _5037;
    float _5041 = _5037;
    if (!_4979)
    {
        _5009 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _5043 = _5009;
    bool _5045 = !_4979;
    float _5047 = _5043;
    float _5049 = _5043;
    if (!_5045)
    {
        bool _5051 = _4590 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _5053 = isnan(_4590);
        bool _5055 = _5051 || _5053;
        bool _5057 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _5059 = _5055 || _5057;
        if (!_5059)
        {
            float _5061 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5063 = _4590 + _5061;
            float _5065 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5067 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _5065;
            float _5069 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _5071 = _5069 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _5073 = 1.0 / _5067;
            float _5075 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _5077 = _5075 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _5079 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _5081 = _5079 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _5083 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _5085 = _5083 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _5087 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _5089 = _5087 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _5091 = _5063 * _5073;
            float _5093 = precise::clamp(_5091, 0.0, 1.0);
            float _5095 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _5097 = _5095 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _5099 = fma(_5093, _5071, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _5101 = fma(_5093, _5077, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _5103 = fma(_5093, _5097, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _5105 = fma(_5093, _5081, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _5107 = fma(_5093, _5085, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _5109 = fma(_5093, _5089, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _5029 = _5103;
            _5015 = _5107;
            _5021 = _5101;
            _5035 = _5105;
            _5049 = _5099;
            _5041 = _5109;
            _5111 = true;
        }
        else
        {
            bool _5113 = _4590 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _5115 = isnan(_4590);
            bool _5117 = _5113 || _5115;
            bool _5119 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _5121 = _5117 || _5119;
            if (!_5121)
            {
                _5033 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _5123 = _5033;
            _5035 = _5123;
            if (!_5121)
            {
                _5013 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _5125 = _5013;
            _5015 = _5125;
            if (!_5121)
            {
                _5039 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _5127 = _5039;
            _5041 = _5127;
            if (!_5121)
            {
                _5019 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _5129 = _5019;
            _5021 = _5129;
            if (!_5121)
            {
                _5027 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _5131 = _5027;
            _5029 = _5131;
            if (!_5121)
            {
                _5047 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _5133 = _5047;
            bool _5135 = !_5121;
            _5049 = _5133;
            if (!_5135)
            {
                bool _5137 = _4590 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _5139 = isnan(_4590);
                bool _5141 = _5137 || _5139;
                bool _5143 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _5145 = _5141 || _5143;
                if (!_5145)
                {
                    float _5147 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5149 = _4590 + _5147;
                    float _5151 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5153 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _5151;
                    float _5155 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _5157 = _5155 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _5159 = 1.0 / _5153;
                    float _5161 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _5163 = _5161 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _5165 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _5167 = _5165 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _5169 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _5171 = _5169 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _5173 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _5175 = _5173 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _5177 = _5149 * _5159;
                    float _5179 = precise::clamp(_5177, 0.0, 1.0);
                    float _5181 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _5183 = _5181 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _5185 = fma(_5179, _5157, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _5187 = fma(_5179, _5163, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _5189 = fma(_5179, _5183, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _5191 = fma(_5179, _5167, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _5193 = fma(_5179, _5171, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _5195 = fma(_5179, _5175, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _5029 = _5189;
                    _5015 = _5193;
                    _5021 = _5187;
                    _5035 = _5191;
                    _5049 = _5185;
                    _5041 = _5195;
                    _5111 = true;
                }
                else
                {
                    _5029 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _5015 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _5021 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _5035 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _5049 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _5041 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _5111 = false;
    float _5197 = _5029;
    float _5199 = _5015;
    float _5201 = _5021;
    float _5203 = _5035;
    float _5205 = _5049;
    float _5207 = _5041;
    float _5209 = _5025 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _5211 = fma(_4206, -0.5, 0.5);
    float _5213 = precise::clamp(_5211, 0.0, 1.0);
    float _5215 = -_5197;
    float _5217 = _5199 + _5215;
    float _5219 = -_5201;
    float _5221 = _5203 + _5219;
    out.m_55.x = _5209;
    float _5223 = fma(_5213, _5217, _5197);
    float _5225 = -_5205;
    float _5227 = _5207 + _5225;
    float _5229 = fma(_5213, _5221, _5201);
    float _5231 = _5223 * 0.586610972881317138671875;
    bool _5233 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _5235 = fma(_5213, _5227, _5205);
    out.m_104.x = 0.0;
    float _5237 = fma(_5229, 0.298911988735198974609375, _5231);
    bool _5239 = _4953 > 0.0;
    bool _5241 = isnan(_4953);
    bool _5243 = _5239 || _5241;
    bool _5245 = isnan(0.0);
    bool _5247 = _5243 || _5245;
    float _5249 = fma(_5235, 0.114477999508380889892578125, _5237);
    float _5251 = -_5249;
    float _5253 = _5229 + _5251;
    float _5255 = -_5249;
    float _5257 = _5223 + _5255;
    float _5259 = -_5249;
    float _5261 = _5235 + _5259;
    float _5263 = fma(_5253, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5249);
    float _5265 = fma(_5257, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5249);
    float _5267 = fma(_5261, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5249);
    bool _5269 = !_5233;
    if (!_5269)
    {
        float _5271 = -_4418;
        float _5273 = _5271 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _5275 = -_4422;
        float _5277 = _5275 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _5279 = -_4426;
        float _5281 = _5279 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _5283 = _5273 * _5273;
        float _5285 = fma(_5277, _5277, _5283);
        float _5287 = fma(_5281, _5281, _5285);
        float _5289 = sqrt(_5287);
        float _5291 = rsqrt(_5287);
        float _5293 = -_5289;
        float _5295 = _5293 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _5297 = _5295 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _5299 = precise::clamp(_5297, 0.0, 1.0);
        float _5301 = _5277 * _5291;
        float _5303 = _5273 * _5291;
        float _5305 = abs(_5299);
        float _5307 = log2(_5305);
        float _5309 = _5281 * _5291;
        float _5311 = _5301 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _5313 = _4206 * _5303;
        float _5315 = -_5303;
        float _5317 = -_5311;
        float _5319 = fma(_5315, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5317);
        float _5321 = fma(_4204, _5301, _5313);
        float _5323 = -_5309;
        float _5325 = fma(_5323, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5319);
        float _5327 = fma(_4208, _5309, _5321);
        float _5329 = precise::clamp(_5327, 0.0, 1.0);
        float _5331 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _5333 = _5325 + _5331;
        float _5335 = _5307 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _5337 = _5333 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _5339 = precise::clamp(_5337, 0.0, 1.0);
        float _5341 = exp2(_5335);
        float _5343 = _5341 * _5339;
        float _5345 = _5329 * _5343;
        float _5347 = _5345 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _5349 = _5345 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _5351 = _5345 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_104.x = _5347;
        out.m_104.y = _5349;
        out.m_104.z = _5351;
    }
    out.m_106.x = _5263;
    out.m_106.y = _5265;
    out.m_106.z = _5267;
    if (_5247)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_55.x = 0.0;
    float _5353 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _5353;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_106 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_104 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    bool _5111 = false;
    bool _4258 = false;
    bool _735 = false;
    bool _591 = false;
    bool _265 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _120 = in.m_48.w;
    float _122 = in.m_50.w;
    float _124 = trunc(_120);
    int _127 = int(_124);
    float _129 = -_122;
    float _131 = _129 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.y = _131;
    bool _135 = _127 >= 1;
    float _137 = 0.0;
    float _139 = _122;
    float _141 = _131;
    if (!_135)
    {
        _137 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _143 = _137;
    if (!_135)
    {
        out.m_55.x = 0.0;
    }
    int _145 = 0;
    if (!_135)
    {
        float _147 = _143 * 5.0;
        _145 = as_type<int>(_147);
    }
    int _149 = _145;
    int _151 = _149;
    if (!_135)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5421 = as_type<float>(_149);
        out.gl_Position.z = _5421;
    }
    if (!_135)
    {
        return out;
    }
    bool _153 = _122 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _155 = isnan(_122);
    bool _157 = _153 || _155;
    bool _159 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _161 = _157 || _159;
    float _163 = float(_127);
    bool _165 = _131 >= _163;
    bool _167 = !_161;
    bool _169 = _165 || _167;
    float _171 = 1.0 / _163;
    if (_169)
    {
        _139 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _173 = _139;
    if (_169)
    {
        out.m_55.x = 0.0;
    }
    float _175 = _131 * _171;
    float _177 = _175;
    if (_169)
    {
        float _179 = _173 * 5.0;
        _151 = as_type<int>(_179);
    }
    int _181 = _151;
    out.m_53.x = _175;
    if (_169)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5484 = as_type<float>(_181);
        out.gl_Position.z = _5484;
    }
    if (_169)
    {
        return out;
    }
    float _183 = as_type<float>(int(gl_VertexIndex));
    float _185 = in.m_60.x;
    float _187 = in.m_60.y;
    float _189 = in.m_60.z;
    float _191 = in.m_62.x;
    float _193 = in.m_62.y;
    float _195 = in.m_62.z;
    float _197 = in.m_64.x;
    float _199 = in.m_64.y;
    float _201 = in.m_64.z;
    float _203 = in.m_66.x;
    float _205 = in.m_66.y;
    float _207 = in.m_66.z;
    int _209 = as_type<int>(_183) & 1;
    bool _211 = _209 != 0;
    int _213 = as_type<int>(_183) & 2;
    bool _215 = _213 != 0;
    bool _217 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _219 = !_211;
    float _221 = _219 ? (-0.5) : 0.5;
    bool _223 = !_215;
    float _225 = _223 ? (-0.5) : 0.5;
    float _227 = _187 * _193;
    float _229 = _187 * _199;
    float _231 = fma(_185, _191, _227);
    float _233 = _187 * _205;
    float _235 = fma(_185, _197, _229);
    float _237 = fma(_189, _195, _231);
    float _239 = fma(_185, _203, _233);
    float _241 = fma(_189, _201, _235);
    float _243 = fma(_189, _207, _239);
    bool _245 = !_217;
    float _263;
    if (!_245)
    {
        float _247 = in.m_68.x;
        float _249 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _251 = _247 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _253 = fma(_251, (*spvDescriptorSet0.vp_c9)._m0[12].x, _131);
        float _255 = _253 * _249;
        float _257 = floor(_255);
        float _259 = -_257;
        float _261 = _255 + _259;
        _263 = _261;
        _265 = true;
    }
    else
    {
        _263 = _175;
    }
    _265 = false;
    float _267 = _263;
    float _269 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _271 = _267 + _269;
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _275 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _273;
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _279 = _277 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _283 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _281;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _287 = _285 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _289 = 1.0 / _275;
    float _291 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _293 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _291;
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _297 = _295 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _299 = 1.0 / _279;
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _303 = _267 + _301;
    bool _305 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _307 = 1.0 / _283;
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _311 = _267 + _309;
    float _313 = _303 * _289;
    bool _315 = _267 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _317 = isnan(_267);
    bool _319 = _315 || _317;
    bool _321 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _323 = _319 || _321;
    float _325 = float(_323);
    float _327 = 1.0 / _287;
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _331 = _267 + _329;
    float _333 = _311 * _299;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _337 = _267 + _335;
    float _339 = 1.0 / _293;
    float _341 = _271 * _307;
    bool _343 = _267 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _345 = isnan(_267);
    bool _347 = _343 || _345;
    bool _349 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _351 = _347 || _349;
    float _353 = float(_351);
    float _355 = 1.0 / _297;
    float _357 = _331 * _327;
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _361 = _267 + _359;
    float _363 = -_325;
    float _365 = _363 + 1.0;
    float _367 = _353 * _365;
    float _369 = _337 * _339;
    bool _371 = _267 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _373 = isnan(_267);
    bool _375 = _371 || _373;
    bool _377 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _379 = _375 || _377;
    float _381 = float(_379);
    bool _383 = _267 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _385 = isnan(_267);
    bool _387 = _383 || _385;
    bool _389 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _391 = _387 || _389;
    float _393 = float(_391);
    float _395 = _361 * _355;
    float _397 = -_353;
    float _399 = _397 + 1.0;
    bool _401 = _267 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _403 = isnan(_267);
    bool _405 = _401 || _403;
    bool _407 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _409 = _405 || _407;
    float _411 = float(_409);
    float _413 = -_381;
    float _415 = _413 + 1.0;
    float _417 = _381 * _399;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _421 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _419;
    float _423 = -_411;
    float _425 = _423 + 1.0;
    float _427 = _411 * _415;
    float _429 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _431 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _429;
    bool _433 = _267 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _435 = isnan(_267);
    bool _437 = _433 || _435;
    bool _439 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _441 = _437 || _439;
    float _443 = float(_441);
    float _445 = _393 * _425;
    float _447 = -_393;
    float _449 = _447 + 1.0;
    float _451 = fma(_421, _313, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _453 = fma(_431, _313, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _455 = _267 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _457 = isnan(_267);
    bool _459 = _455 || _457;
    bool _461 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _463 = _459 || _461;
    float _465 = float(_463);
    float _467 = -_443;
    float _469 = _467 + 1.0;
    float _471 = _443 * _449;
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _475 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _473;
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _479 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _477;
    float _481 = _465 * _469;
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _485 = _483 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _487 = fma(_475, _341, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _489 = fma(_479, _341, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _491 = _451 * _481;
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _495 = _493 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _497 = _453 * _481;
    float _499 = -_465;
    float _501 = _499 + 1.0;
    float _503 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _505 = _503 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _507 = fma(_485, _333, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _509 = fma(_495, _333, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _511 = fma(_501, (*spvDescriptorSet0.vp_c9)._m0[143].x, _491);
    float _513 = fma(_501, (*spvDescriptorSet0.vp_c9)._m0[143].y, _497);
    float _515 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _517 = _515 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _519 = fma(_507, _471, _511);
    float _521 = fma(_509, _471, _513);
    float _523 = fma(_505, _357, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _525 = fma(_517, _357, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _529 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _527;
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _533 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _531;
    float _535 = fma(_487, _445, _519);
    float _537 = fma(_489, _445, _521);
    float _539 = fma(_529, _369, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _541 = fma(_533, _369, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _543 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _545 = _543 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _547 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _549 = _547 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _551 = fma(_523, _427, _535);
    float _553 = fma(_525, _427, _537);
    float _555 = fma(_545, _395, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _557 = fma(_549, _395, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _559 = fma(_539, _417, _551);
    float _561 = fma(_541, _417, _553);
    float _563 = fma(_555, _367, _559);
    float _565 = fma(_557, _367, _561);
    float _567 = fma(_325, (*spvDescriptorSet0.vp_c9)._m0[149].x, _563);
    float _569 = fma(_325, (*spvDescriptorSet0.vp_c9)._m0[149].y, _565);
    bool _571 = !_305;
    float _589;
    if (!_571)
    {
        float _573 = in.m_68.x;
        float _575 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _577 = _573 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _579 = fma(_577, (*spvDescriptorSet0.vp_c9)._m0[11].y, _131);
        float _581 = _579 * _575;
        float _583 = floor(_581);
        float _585 = -_583;
        float _587 = _581 + _585;
        _589 = _587;
        _591 = true;
    }
    else
    {
        _589 = _175;
    }
    _591 = false;
    float _593 = _589;
    float _595 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _597 = _593 + _595;
    float _599 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _601 = _599 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _603 = _593 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _605 = isnan(_593);
    bool _607 = _603 || _605;
    bool _609 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _611 = _607 || _609;
    float _613 = float(_611);
    float _615 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _617 = _615 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _619 = _593 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _621 = isnan(_593);
    bool _623 = _619 || _621;
    bool _625 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _627 = _623 || _625;
    float _629 = float(_627);
    float _631 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _633 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _631;
    bool _635 = _593 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _637 = isnan(_593);
    bool _639 = _635 || _637;
    bool _641 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _643 = _639 || _641;
    float _645 = float(_643);
    float _647 = 1.0 / _601;
    float _649 = -_613;
    float _651 = _649 + 1.0;
    bool _653 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _655 = _629 * _651;
    float _657 = -_629;
    float _659 = _657 + 1.0;
    float _661 = 1.0 / _617;
    float _663 = _633 * _647;
    float _665 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _667 = _665 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _669 = fma(_663, _597, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _671 = -_645;
    float _673 = _671 + 1.0;
    float _675 = _669 * _655;
    float _677 = _667 * _661;
    float _679 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _681 = _593 + _679;
    float _683 = _613 * _673;
    float _685 = fma(_659, (*spvDescriptorSet0.vp_c9)._m0[115].x, _675);
    float _687 = fma(_677, _681, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _689 = fma(_687, _683, _685);
    float _691 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _693 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _695 = in.m_70.x;
    float _697 = in.m_70.y;
    float _699 = fma(_645, (*spvDescriptorSet0.vp_c9)._m0[117].x, _689);
    float _701 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _703 = _691 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _705 = _693 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _707 = _699 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _709 = _701 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_72.x = _703;
    out.m_72.y = _705;
    out.m_72.z = _709;
    out.m_72.w = _707;
    float _711 = _569 * _697;
    float _713 = _567 * _695;
    bool _715 = !_653;
    float _733;
    if (!_715)
    {
        float _717 = in.m_68.x;
        float _719 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _721 = _717 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _723 = fma(_721, (*spvDescriptorSet0.vp_c9)._m0[11].w, _131);
        float _725 = _723 * _719;
        float _727 = floor(_725);
        float _729 = -_727;
        float _731 = _725 + _729;
        _733 = _731;
        _735 = true;
    }
    else
    {
        _733 = _175;
    }
    _735 = false;
    float _737 = _733;
    float _739 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _741 = _737 + _739;
    float _743 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _745 = _743 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _747 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _749 = _747 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _751 = _737 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _753 = isnan(_737);
    bool _755 = _751 || _753;
    bool _757 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _759 = _755 || _757;
    float _761 = float(_759);
    float _763 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _765 = _763 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _767 = _737 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _769 = isnan(_737);
    bool _771 = _767 || _769;
    bool _773 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _775 = _771 || _773;
    float _777 = float(_775);
    float _779 = 1.0 / _745;
    float _781 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _783 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _781;
    float _785 = -_761;
    float _787 = _785 + 1.0;
    bool _789 = _737 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _791 = isnan(_737);
    bool _793 = _789 || _791;
    bool _795 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _797 = _793 || _795;
    float _799 = float(_797);
    bool _801 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _803 = 1.0 / _749;
    float _805 = 1.0 / _765;
    float _807 = _783 * _779;
    float _809 = -_777;
    float _811 = _809 + 1.0;
    float _813 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _815 = _813 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _817 = _777 * _787;
    float _819 = fma(_807, _741, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _821 = _799 * _811;
    float _823 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _825 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _823;
    float _827 = _815 * _803;
    bool _829 = _737 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _831 = isnan(_737);
    bool _833 = _829 || _831;
    bool _835 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _837 = _833 || _835;
    float _839 = float(_837);
    float _841 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _843 = _737 + _841;
    float _845 = _819 * _821;
    float _847 = -_799;
    float _849 = _847 + 1.0;
    float _851 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _853 = _737 + _851;
    float _855 = fma(_827, _843, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _857 = -_839;
    float _859 = _857 + 1.0;
    float _861 = _825 * _805;
    float _863 = fma(_849, (*spvDescriptorSet0.vp_c9)._m0[131].x, _845);
    float _865 = _761 * _859;
    float _867 = fma(_861, _853, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _869 = fma(_855, _817, _863);
    float _871 = fma(_867, _865, _869);
    float _873 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _875 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _877 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _879 = fma(_839, (*spvDescriptorSet0.vp_c9)._m0[134].x, _871);
    float _881 = _875 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _883 = _873 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _885 = _877 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _887 = _879 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_74.x = _881;
    out.m_74.y = _883;
    out.m_74.z = _885;
    out.m_74.w = _887;
    bool _889 = !_801;
    float _891 = _887;
    float _893 = _803;
    int _895 = as_type<int>(_863);
    float _897 = (*spvDescriptorSet0.vp_c9)._m0[134].x;
    if (!_889)
    {
        float _899 = in.m_68.x;
        float _901 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _903 = _899 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _905 = fma(_903, (*spvDescriptorSet0.vp_c9)._m0[14].x, _131);
        float _907 = _905 * _901;
        float _909 = floor(_907);
        float _911 = -_909;
        float _913 = _907 + _911;
        _177 = _913;
    }
    float _915 = _177;
    float _917 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _919 = int(_917);
    int _921 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _923 = _921 != 0;
    float _925 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _927 = int(_925);
    float _929 = float(_919);
    float _931 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _933 = int(_931);
    if (_923)
    {
        _891 = 1.0;
    }
    float _935 = _891;
    float _937 = _935;
    if (_923)
    {
        _893 = 1.0;
    }
    float _939 = _893;
    float _941 = _939;
    if (_923)
    {
        _895 = 0;
    }
    int _943 = _895;
    float _945 = float(_927);
    float _947 = 1.0 / _929;
    float _949 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _951 = int(_949);
    float _953 = float(uint(_933));
    float _955 = 1.0 / _945;
    float _957 = _947 * _131;
    float _959 = 1.0 / _953;
    float _961 = float(uint(_951));
    int _963 = ~_951;
    int _965 = _963 + 1;
    float _967 = trunc(_957);
    int _969 = int(_967);
    float _971 = _955 * _131;
    float _973 = _955;
    float _975 = _929;
    int _977 = _943;
    if (_923)
    {
        float _979 = in.m_68.x;
        float _981 = in.m_68.y;
        _973 = _979;
        _975 = _981;
    }
    float _983 = _973;
    float _985 = _975;
    float _987 = 1.0 / _961;
    int _989 = as_type<int>(_959) + (-2);
    float _991 = trunc(_971);
    int _993 = int(_991);
    float _995 = float(uint(_969));
    float _997 = as_type<float>(_989) * _995;
    float _999 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _1001 = int(_999);
    int _1003 = as_type<int>(_987) + (-2);
    float _1005 = _987;
    float _1007 = _983;
    float _1009 = _985;
    if (_923)
    {
        _897 = _983;
    }
    float _1011 = _897;
    float _1013 = _1011;
    if (_923)
    {
        _1005 = _985;
    }
    float _1015 = _1005;
    float _1017 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _1019 = int(_1017);
    float _1021 = float(uint(_993));
    float _1023 = as_type<float>(_1003) * _1021;
    float _1025 = trunc(_997);
    float _1027 = precise::max(_1025, 0.0);
    uint _1030 = uint(_1027);
    float _1032 = float(uint(_1001));
    float _1034 = float(_1019);
    float _1036 = 1.0 / _1032;
    float _1038 = 1.0 / _1034;
    int _1040 = as_type<int>(_1032);
    float _1042 = _1034;
    float _1044 = _1023;
    float _1046 = _1015;
    if (_923)
    {
        _1040 = 0;
    }
    int _1048 = _1040;
    float _1050 = trunc(_1023);
    float _1052 = precise::max(_1050, 0.0);
    uint _1054 = uint(_1052);
    int _1056 = _1048;
    if (_923)
    {
        _1042 = _1011;
    }
    float _1058 = _1042;
    float _1060 = _1058;
    if (_923)
    {
        _1044 = _1011;
    }
    float _1062 = _1044;
    float _1064 = _1062;
    if (!_923)
    {
        float _1066 = in.m_68.x;
        float _1068 = in.m_68.y;
        float _1070 = in.m_68.z;
        float _1072 = _1066 * 3.1415927410125732421875;
        float _1074 = _1072 * 0.15915493667125701904296875;
        float _1076 = _1068 * 3.1415927410125732421875;
        float _1078 = _1076 * 0.15915493667125701904296875;
        float _1080 = _1074 * 6.283185482025146484375;
        float _1082 = sin(_1080);
        float _1084 = _1078 * 6.283185482025146484375;
        float _1086 = sin(_1084);
        _941 = 5.839270114898681640625;
        _1060 = _1070;
        _937 = 7.345489978790283203125;
        _1007 = _1066;
        _1013 = _1068;
        _1009 = _1068;
        _1064 = _1082;
        _1046 = _1086;
        _977 = 1;
        _1056 = 2;
    }
    float _1088 = _941;
    float _1090 = _1060;
    float _1092 = _937;
    float _1094 = _1007;
    float _1096 = _1013;
    float _1098 = _1009;
    float _1100 = _1064;
    float _1102 = _1046;
    int _1104 = _977;
    int _1106 = _1056;
    int _1108 = _965 * int(_1054);
    int _1110 = _1108 + _993;
    int _1112 = ~_933;
    int _1114 = _1112 + 1;
    float _1116 = in.m_68.z;
    float _1118 = in.m_68.w;
    float _1120 = _1038 * _131;
    float _1122 = _1088 * _1090;
    float _1124 = float(uint(_1110));
    int _1126 = _1114 * int(_1030);
    int _1128 = _1126 + _969;
    float _1130 = _1092 * _1094;
    float _1132 = floor(_1122);
    float _1134 = _1092 * _1096;
    float _1136 = as_type<float>(_1003) * _1124;
    float _1138 = float(uint(_1128));
    float _1140 = _1094 * 2.0;
    float _1142 = float(_951);
    float _1144 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1146 = _915 + _1144;
    float _1148 = float(_993);
    float _1150 = trunc(_1136);
    float _1152 = precise::max(_1150, 0.0);
    uint _1154 = uint(_1152);
    float _1156 = as_type<float>(_989) * _1138;
    bool _1158 = _1148 >= _1142;
    bool _1160 = isnan(_1148);
    bool _1162 = _1158 || _1160;
    bool _1164 = isnan(_1142);
    bool _1166 = _1162 || _1164;
    float _1168 = float(_1166);
    int _1170 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1172 = _1170 != 0;
    float _1174 = trunc(_1120);
    int _1176 = int(_1174);
    bool _1178 = _1098 > 0.5;
    float _1180 = -_1132;
    float _1182 = _1122 + _1180;
    bool _1184 = _1118 > 0.5;
    bool _1186 = _1116 > 0.5;
    int _1188 = as_type<int>(_1036) + (-2);
    float _1190 = floor(_1130);
    int _1192 = int(_1054) + int(_1154);
    int _1194 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1196 = _1194 != 0;
    int _1198 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1200 = _1198 != 0;
    int _1202 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1204 = _1202 != 0;
    int _1206 = ~_933;
    int _1208 = _1206 + 1;
    int _1210 = ~_951;
    int _1212 = _1210 + 1;
    float _1214 = trunc(_1156);
    float _1216 = precise::max(_1214, 0.0);
    uint _1218 = uint(_1216);
    float _1220 = float(uint(_1176));
    float _1222 = float(_969);
    float _1224 = as_type<float>(_1188) * _1220;
    float _1226 = -_221;
    int _1228 = _1178 ? as_type<int>(_1226) : as_type<int>(_221);
    float _1230 = trunc(_1168);
    int _1232 = int(_1230);
    float _1234 = -_1190;
    float _1236 = _1130 + _1234;
    float _1238 = float(_933);
    int _1240 = _1212 * _1192;
    int _1242 = _1240 + _993;
    int _1244 = int(_1184);
    int _1246 = _1186 ? 2 : 0;
    int _1248 = _1244 | _1246;
    int _1250 = _1172 ? 4 : 0;
    int _1252 = _1248 | _1250;
    int _1254 = _1196 ? 8 : 0;
    int _1256 = _1252 | _1254;
    int _1258 = _1200 ? 16 : 0;
    int _1260 = _1256 | _1258;
    int _1262 = _1204 ? 32 : 0;
    int _1264 = _1260 | _1262;
    int _1266 = _1178 ? 64 : 0;
    int _1268 = _1264 | _1266;
    int _1270 = _1268 & 64;
    bool _1272 = !_1200;
    float _1274 = _1272 ? _221 : as_type<float>(_1228);
    int _1276 = int(_1030) + int(_1218);
    float _1278 = trunc(_1224);
    float _1280 = precise::max(_1278, 0.0);
    uint _1282 = uint(_1280);
    float _1284 = -_225;
    int _1286 = _1186 ? as_type<int>(_1284) : as_type<int>(_225);
    bool _1288 = _1222 >= _1238;
    bool _1290 = isnan(_1222);
    bool _1292 = _1288 || _1290;
    bool _1294 = isnan(_1238);
    bool _1296 = _1292 || _1294;
    float _1298 = float(_1296);
    float _1300 = _1236 * _1142;
    bool _1302 = !_1204;
    float _1304 = _1302 ? _225 : as_type<float>(_1286);
    float _1306 = floor(_1134);
    int _1308 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1310 = _1308 != 0;
    int _1312 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1314 = _1312 != 0;
    int _1316 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1318 = _1316 != 0;
    bool _1320 = !_1172;
    int _1322 = _1320 ? 0 : 1;
    int _1324 = _1208 * _1276;
    int _1326 = _1324 + _969;
    bool _1328 = uint(_1242) >= uint(_951);
    bool _1330 = !_1314;
    int _1332 = _1330 ? 0 : 1;
    float _1334 = trunc(_1300);
    int _1336 = int(_1334);
    bool _1338 = !_1310;
    int _1340 = _1338 ? 0 : 1;
    int _1342 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1344 = _1342 != 0;
    bool _1346 = uint(_1326) >= uint(_933);
    float _1348 = _1182 * _1238;
    bool _1350 = !_1318;
    int _1352 = _1350 ? 0 : 1;
    float _1354 = trunc(_1298);
    int _1356 = int(_1354);
    bool _1358 = !_1344;
    int _1360 = _1358 ? 0 : 1;
    float _1362 = -_1306;
    float _1364 = _1134 + _1362;
    bool _1366 = !_1346;
    int _1368 = _1366 ? 0 : (-1);
    bool _1370 = !_1328;
    int _1372 = _1370 ? 0 : (-1);
    int _1374 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1376 = _1374 != 0;
    int _1378 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1380 = _1378 != 0;
    int _1382 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1384 = _1382 != 0;
    float _1386 = trunc(_1348);
    int _1388 = int(_1386);
    int _1390 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1392 = _1390 != 0;
    int _1394 = ~_1001;
    int _1396 = _1394 + 1;
    int _1398 = ~_1276;
    int _1400 = _1398 + _1368;
    int _1402 = _1400 + 1;
    bool _1404 = !_1392;
    int _1406 = _1404 ? 0 : 1;
    int _1408 = _1396 * int(_1282);
    int _1410 = _1408 + _1176;
    int _1412 = abs(_1322);
    float _1414 = floor(_1140);
    int _1416 = ~_1192;
    int _1418 = _1416 + _1372;
    int _1420 = _1418 + 1;
    int _1422 = _933 * _1402;
    int _1424 = _1422 + _969;
    int _1426 = abs(_1406);
    int _1428 = _1336 * _1412;
    int _1430 = _1428 + _993;
    float _1432 = float(uint(_1410));
    int _1434 = _951 * _1420;
    int _1436 = _1434 + _993;
    float _1438 = _171 * _131;
    bool _1440 = _951 == 0;
    bool _1442 = !_1380;
    int _1444 = _1442 ? 0 : 1;
    float _1446 = _1142 * _1438;
    bool _1448 = _1270 != 0;
    float _1450 = as_type<float>(_1188) * _1432;
    bool _1452 = !_1376;
    int _1454 = _1452 ? 0 : 1;
    float _1456 = _1238 * _1438;
    int _1458 = ~_1232;
    int _1460 = _1458 + 1;
    int _1462 = _1460 + 1;
    float _1464 = trunc(_1446);
    int _1466 = int(_1464);
    bool _1468 = !_1440;
    int _1470 = _1468 ? _1436 : (-1);
    int _1472 = _1388 * _1426;
    int _1474 = _1472 + _969;
    bool _1476 = _933 == 0;
    float _1478 = _1100 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    int _1480 = ~_1356;
    int _1482 = _1480 + 1;
    int _1484 = _1482 + 1;
    int _1486 = _1470 * _1462;
    bool _1488 = !_1476;
    int _1490 = _1488 ? _1424 : (-1);
    float _1492 = trunc(_1450);
    float _1494 = precise::max(_1492, 0.0);
    uint _1496 = uint(_1494);
    int _1498 = _951 + (-1);
    int _1500 = _933 + (-1);
    int _1502 = _1490 * _1484;
    int _1504 = abs(_1332);
    int _1506 = _1232 * _1498;
    int _1508 = _1506 + _1486;
    int _1510 = abs(_1352);
    int _1512 = _1356 * _1500;
    int _1514 = _1512 + _1502;
    int _1516 = abs(_1360);
    int _1518 = _1508 * _1504;
    int _1520 = abs(_1340);
    float _1522 = trunc(_1456);
    int _1524 = int(_1522);
    int _1526 = abs(_1444);
    float _1528 = _1098 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1530 = ~_1001;
    int _1532 = _1530 + 1;
    int _1534 = _1466 * _1520;
    int _1536 = _1534 + _1518;
    int _1538 = _1430 * _1510;
    int _1540 = _1538 + _1536;
    int _1542 = int(_1282) + int(_1496);
    int _1544 = _1336 * _1516;
    int _1546 = _1544 + _1540;
    bool _1548 = !_1384;
    int _1550 = _1548 ? 0 : 1;
    int _1552 = _1514 * _1526;
    int _1554 = abs(_1454);
    int _1556 = _1532 * _1542;
    int _1558 = _1556 + _1176;
    float _1560 = float(uint(_1546));
    float _1562 = -_225;
    int _1564 = _1184 ? as_type<int>(_1562) : as_type<int>(_225);
    int _1566 = _1524 * _1554;
    int _1568 = _1566 + _1552;
    float _1570 = -_221;
    int _1572 = _1186 ? as_type<int>(_1570) : as_type<int>(_221);
    float _1574 = float(_1001);
    float _1576 = float(_1176);
    int _1578 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1580 = _1578 != 0;
    float _1582 = _1574 * _1438;
    int _1584 = abs(_1550);
    float _1586 = as_type<float>(_1003) * _1560;
    bool _1588 = uint(_1558) >= uint(_1001);
    int _1590 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _1592 = _1590 != 0;
    int _1594 = _1474 * _1584;
    int _1596 = _1594 + _1568;
    bool _1598 = _1576 >= _1574;
    bool _1600 = isnan(_1576);
    bool _1602 = _1598 || _1600;
    bool _1604 = isnan(_1574);
    bool _1606 = _1602 || _1604;
    float _1608 = float(_1606);
    float _1610 = trunc(_1582);
    int _1612 = int(_1610);
    bool _1614 = !_1580;
    int _1616 = _1614 ? 0 : 1;
    bool _1618 = !_1196;
    float _1620 = _1618 ? _225 : as_type<float>(_1564);
    bool _1622 = !_1592;
    int _1624 = _1622 ? 0 : 1;
    int _1626 = abs(_1616);
    float _1628 = trunc(_1586);
    float _1630 = precise::max(_1628, 0.0);
    uint _1632 = uint(_1630);
    bool _1634 = !_1588;
    int _1636 = _1634 ? 0 : (-1);
    float _1638 = _1364 * _1574;
    int _1640 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _1642 = _1640 != 0;
    int _1644 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _1646 = _1644 != 0;
    int _1648 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _1650 = _1648 != 0;
    int _1652 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _1654 = _1652 != 0;
    int _1656 = ~_1542;
    int _1658 = _1656 + _1636;
    int _1660 = _1658 + 1;
    float _1662 = trunc(_1608);
    int _1664 = int(_1662);
    int _1666 = ~_951;
    int _1668 = _1666 + 1;
    int _1670 = _1388 * _1626;
    int _1672 = _1670 + _1596;
    bool _1674 = !_1642;
    int _1676 = _1674 ? 0 : 1;
    int _1678 = _1001 * _1660;
    int _1680 = _1678 + _1176;
    bool _1682 = _1001 == 0;
    float _1684 = float(uint(_1672));
    int _1686 = _1668 * int(_1632);
    int _1688 = _1686 + _1546;
    bool _1690 = !_1646;
    int _1692 = _1690 ? 0 : 1;
    float _1694 = trunc(_1638);
    int _1696 = int(_1694);
    int _1698 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1700 = _1698 != 0;
    float _1702 = as_type<float>(_989) * _1684;
    bool _1704 = !_1682;
    int _1706 = _1704 ? _1680 : (-1);
    float _1708 = float(uint(_1688));
    int _1710 = ~_1664;
    int _1712 = _1710 + 1;
    int _1714 = _1712 + 1;
    float _1716 = trunc(_1702);
    float _1718 = precise::max(_1716, 0.0);
    uint _1720 = uint(_1718);
    int _1722 = abs(_1692);
    float _1724 = as_type<float>(_1003) * _1708;
    int _1726 = abs(_1676);
    int _1728 = _1706 * _1714;
    int _1730 = _1001 + (-1);
    float _1732 = _1684;
    float _1734 = as_type<float>(_1104);
    float _1736 = as_type<float>(_1106);
    if (_1700)
    {
        float _1738 = in.m_68.w;
        _1732 = _1738;
    }
    float _1740 = _1732;
    int _1742 = abs(_1624);
    float _1744 = trunc(_1724);
    float _1746 = precise::max(_1744, 0.0);
    uint _1748 = uint(_1746);
    bool _1750 = _951 == 0;
    int _1752 = _1664 * _1730;
    int _1754 = _1752 + _1728;
    int _1756 = _1754 * _1722;
    int _1758 = ~_933;
    int _1760 = _1758 + 1;
    float _1762 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1764 = log2(_1762);
    float _1766 = 0.0;
    float _1768 = as_type<float>(_1742);
    if (!_1700)
    {
        _1766 = _221;
    }
    float _1770 = _1766;
    int _1772 = _1612 * _1726;
    int _1774 = _1772 + _1756;
    int _1776 = _1696 * _1742;
    int _1778 = _1776 + _1176;
    bool _1780 = !_1650;
    int _1782 = _1780 ? 0 : 1;
    int _1784 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1786 = _1784 != 0;
    int _1788 = _1760 * int(_1720);
    int _1790 = _1788 + _1672;
    int _1792 = int(_1632) + int(_1748);
    int _1794 = abs(_1782);
    float _1796 = float(uint(_1790));
    float _1798 = _1770;
    if (_1700)
    {
        float _1800 = _1740 * 3.1415927410125732421875;
        _1768 = _1800;
    }
    float _1802 = _1768;
    int _1804 = ~_951;
    int _1806 = _1804 + 1;
    bool _1808 = !_1654;
    int _1810 = _1808 ? 0 : 1;
    float _1812 = as_type<float>(_989) * _1796;
    int _1814 = _1806 * _1792;
    int _1816 = _1814 + _1546;
    float _1818 = _1802;
    if (_1700)
    {
        float _1820 = _1802 * 0.15915493667125701904296875;
        _1818 = _1820;
    }
    float _1822 = _1818;
    int _1824 = abs(_1810);
    float _1826 = trunc(_1812);
    float _1828 = precise::max(_1826, 0.0);
    uint _1830 = uint(_1828);
    int _1832 = _1778 * _1794;
    int _1834 = _1832 + _1774;
    bool _1836 = uint(_1816) >= uint(_951);
    float _1838 = as_type<float>(_1612);
    if (_1786)
    {
        float _1840 = in.m_68.x;
        _1838 = _1840;
    }
    float _1842 = _1838;
    float _1844 = float(uint(_1430));
    int _1846 = _1696 * _1824;
    int _1848 = _1846 + _1834;
    bool _1850 = !_1836;
    int _1852 = _1850 ? 0 : (-1);
    float _1854 = _1822;
    if (_1700)
    {
        float _1856 = _1822 * 6.283185482025146484375;
        float _1858 = sin(_1856);
        _1854 = _1858;
    }
    float _1860 = _1854;
    float _1862 = as_type<float>(_1003) * _1844;
    int _1864 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1866 = _1864 != 0;
    int _1868 = ~_1792;
    int _1870 = _1868 + _1852;
    int _1872 = _1870 + 1;
    bool _1874 = !_1866;
    float _1876 = _1874 ? _221 : as_type<float>(_1572);
    float _1878 = trunc(_1862);
    float _1880 = precise::max(_1878, 0.0);
    uint _1882 = uint(_1880);
    float _1884 = float(uint(_1848));
    int _1886 = _951 * _1872;
    int _1888 = _1886 + _1546;
    int _1890 = int(_1720) + int(_1830);
    float _1892 = float(uint(_1474));
    float _1894 = as_type<float>(_1188) * _1884;
    bool _1896 = !_1750;
    int _1898 = _1896 ? _1888 : (-1);
    bool _1900 = _1866;
    float _1902 = _1884;
    if (_1700)
    {
        bool _1904 = _1860 > 0.5;
        _1900 = _1904;
    }
    bool _1906 = _1900;
    float _1908 = trunc(_1894);
    float _1910 = precise::max(_1908, 0.0);
    uint _1912 = uint(_1910);
    int _1914 = ~_951;
    int _1916 = _1914 + 1;
    if (_1786)
    {
        float _1918 = _1842 * 3.1415927410125732421875;
        _1902 = _1918;
    }
    float _1920 = _1902;
    float _1922 = _1920;
    if (_1700)
    {
        float _1924 = -_221;
        float _1926 = _1906 ? _1924 : _221;
        _1798 = _1926;
    }
    float _1928 = _1798;
    float _1930 = as_type<float>(_989) * _1892;
    int _1932 = _1898 & 3;
    bool _1934 = _1932 != 0;
    int _1936 = _1916 * int(_1882);
    int _1938 = _1936 + _1430;
    int _1940 = _1898 & 3;
    bool _1942 = _1940 != 0;
    if (_1786)
    {
        float _1944 = _1920 * 0.15915493667125701904296875;
        _1922 = _1944;
    }
    float _1946 = _1922;
    int _1948 = ~_1001;
    int _1950 = _1948 + 1;
    float _1952 = trunc(_1930);
    float _1954 = precise::max(_1952, 0.0);
    uint _1956 = uint(_1954);
    int _1958 = _1934 ? 0 : 1;
    bool _1960 = uint(_1940) > 1u;
    float _1962 = float(uint(_1938));
    float _1964 = _1946;
    if (_1786)
    {
        float _1966 = _1946 * 6.283185482025146484375;
        float _1968 = sin(_1966);
        _1964 = _1968;
    }
    float _1970 = _1964;
    int _1972 = ~_933;
    int _1974 = _1972 + 1;
    float _1976 = as_type<float>(_1003) * _1962;
    float _1978 = -_225;
    int _1980 = _1448 ? as_type<int>(_1978) : as_type<int>(_225);
    int _1982 = _1950 * int(_1912);
    int _1984 = _1982 + _1848;
    int _1986 = ~_1958;
    int _1988 = _1986 + 1;
    int _1990 = _1988 + 1;
    int _1992 = _1974 * _1890;
    int _1994 = _1992 + _1672;
    bool _1996 = uint(_1940) >= 2u;
    float _1998 = trunc(_1976);
    float _2000 = precise::max(_1998, 0.0);
    uint _2002 = uint(_2000);
    float _2004 = float(uint(_1984));
    int _2006 = _1990;
    if (!_1960)
    {
        int _2008 = ~_1958;
        int _2010 = _2008 + 1;
        _2006 = _2010;
    }
    int _2012 = _2006;
    bool _2014 = uint(_1994) >= uint(_933);
    float _2016 = as_type<float>(_1188) * _2004;
    int _2018 = _1996 ? 0 : 1;
    bool _2020 = _1940 != 3;
    bool _2022 = !_2014;
    int _2024 = _2022 ? 0 : (-1);
    float _2026 = trunc(_2016);
    float _2028 = precise::max(_2026, 0.0);
    uint _2030 = uint(_2028);
    int _2032 = ~_933;
    int _2034 = _2032 + 1;
    int _2036 = ~_1890;
    int _2038 = _2036 + _2024;
    int _2040 = _2038 + 1;
    int _2042 = ~_2018;
    int _2044 = _2042 + 1;
    int _2046 = _2044 + 1;
    int _2048 = _2034 * int(_1956);
    int _2050 = _2048 + _1474;
    int _2052 = _933 * _2040;
    int _2054 = _2052 + _1672;
    float _2056 = 0.0;
    int _2058 = _2046;
    bool _2060 = _2020;
    if (!_1786)
    {
        _2056 = _225;
    }
    float _2062 = _2056;
    float _2064 = _2062;
    if (_2020)
    {
        int _2066 = ~_2018;
        int _2068 = _2066 + 1;
        _2058 = _2068;
    }
    int _2070 = _2058;
    if (_1786)
    {
        bool _2072 = _1970 > 0.5;
        _2060 = _2072;
    }
    bool _2074 = _2060;
    float _2076 = float(uint(_2050));
    bool _2078 = !_1476;
    int _2080 = _2078 ? _2054 : (-1);
    int _2082 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2084 = _2082 != 0;
    float _2086 = as_type<float>(_989) * _2076;
    if (_1786)
    {
        float _2088 = -_225;
        float _2090 = _2074 ? _2088 : _225;
        _2064 = _2090;
    }
    float _2092 = _2064;
    int _2094 = _2080 & 3;
    bool _2096 = _2094 != 0;
    bool _2098 = !_2084;
    float _2100 = _2098 ? _225 : as_type<float>(_1980);
    float _2102 = trunc(_2086);
    float _2104 = precise::max(_2102, 0.0);
    uint _2106 = uint(_2104);
    int _2108 = int(_1912) + int(_2030);
    int _2110 = ~_1001;
    int _2112 = _2110 + 1;
    int _2114 = _2080 & 3;
    bool _2116 = _2114 != 0;
    bool _2118 = uint(_2094) > 1u;
    int _2120 = _2112 * _2108;
    int _2122 = _2120 + _1848;
    int _2124 = int(_1882) + int(_2002);
    int _2126 = ~_951;
    int _2128 = _2126 + 1;
    int _2130 = _2116 ? 0 : 1;
    int _2132 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2134 = _2132 != 0;
    int _2136 = _2128 * _2124;
    int _2138 = _2136 + _1430;
    float _2140 = float(uint(_1778));
    bool _2142 = !_2134;
    int _2144 = _2142 ? 0 : 1;
    bool _2146 = uint(_2122) >= uint(_1001);
    float _2148 = as_type<float>(_1188) * _2140;
    int _2150 = ~_2130;
    int _2152 = _2150 + 1;
    int _2154 = _2152 + 1;
    int _2156 = _2154;
    if (!_2118)
    {
        int _2158 = ~_2130;
        int _2160 = _2158 + 1;
        _2156 = _2160;
    }
    int _2162 = _2156;
    bool _2164 = uint(_2138) >= uint(_951);
    bool _2166 = !_2146;
    int _2168 = _2166 ? 0 : (-1);
    float _2170 = trunc(_2148);
    float _2172 = precise::max(_2170, 0.0);
    uint _2174 = uint(_2172);
    bool _2176 = _2094 != 3;
    int _2178 = ~_933;
    int _2180 = _2178 + 1;
    bool _2182 = !_2164;
    int _2184 = _2182 ? 0 : (-1);
    bool _2186 = uint(_2094) >= 2u;
    int _2188 = int(_1956) + int(_2106);
    int _2190 = ~_2108;
    int _2192 = _2190 + _2168;
    int _2194 = _2192 + 1;
    int _2196 = _2186 ? 0 : 1;
    int _2198 = _1001 * _2194;
    int _2200 = _2198 + _1848;
    int _2202 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2204 = _2202 != 0;
    int _2206 = _2180 * _2188;
    int _2208 = _2206 + _1474;
    int _2210 = ~_1001;
    int _2212 = _2210 + 1;
    int _2214 = ~_2196;
    int _2216 = _2214 + 1;
    int _2218 = _2216 + 1;
    int _2220 = _2218;
    float _2222 = as_type<float>(_2180);
    if (_2176)
    {
        int _2224 = ~_2196;
        int _2226 = _2224 + 1;
        _2220 = _2226;
    }
    int _2228 = _2220;
    int _2230 = _2212 * int(_2174);
    int _2232 = _2230 + _1778;
    int _2234 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _2236 = _2234 != 0;
    bool _2238 = !_2204;
    int _2240 = _2238 ? 0 : 1;
    bool _2242 = uint(_2208) >= uint(_933);
    bool _2244 = !_1682;
    int _2246 = _2244 ? _2200 : (-1);
    bool _2248 = !_2236;
    int _2250 = _2248 ? 0 : 1;
    bool _2252 = !_2242;
    int _2254 = _2252 ? 0 : (-1);
    int _2256 = _2246 & 3;
    bool _2258 = _2256 != 0;
    int _2260 = _2246 & 3;
    bool _2262 = _2260 != 0;
    float _2264 = float(uint(_2232));
    int _2266 = _2258 ? 0 : 1;
    bool _2268 = uint(_2260) > 1u;
    float _2270 = as_type<float>(_1188) * _2264;
    int _2272 = ~_2266;
    int _2274 = _2272 + 1;
    int _2276 = _2274 + 1;
    float _2278 = trunc(_2270);
    float _2280 = precise::max(_2278, 0.0);
    uint _2282 = uint(_2280);
    float _2284 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _2286 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _2288 = fma(_1100, (*spvDescriptorSet0.vp_c9)._m0[93].z, _2284);
    int _2290 = _2276;
    float _2292 = _2270;
    if (!_2268)
    {
        int _2294 = ~_2266;
        int _2296 = _2294 + 1;
        _2290 = _2296;
    }
    int _2298 = _2290;
    float _2300 = -_2286;
    float _2302 = fma(_1478, 2.0, _2300);
    bool _2304 = uint(_2260) >= 2u;
    float _2306 = _1102 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    int _2308 = ~_1001;
    int _2310 = _2308 + 1;
    float _2312 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _2314 = _2304 ? 0 : 1;
    float _2316 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _2318 = _2260 != 3;
    float _2320 = fma(_1528, -2.0, _2312);
    int _2322 = int(_2174) + int(_2282);
    float _2324 = -_131;
    float _2326 = fma(_2324, (*spvDescriptorSet0.vp_c9)._m0[91].x, _2302);
    float _2328 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[92].z, _2288);
    int _2330 = ~_2314;
    int _2332 = _2330 + 1;
    int _2334 = _2332 + 1;
    int _2336 = _2310 * _2322;
    int _2338 = _2336 + _1778;
    float _2340 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    int _2342 = _2334;
    float _2344 = as_type<float>(_2338);
    if (_2318)
    {
        int _2346 = ~_2314;
        int _2348 = _2346 + 1;
        _2342 = _2348;
    }
    int _2350 = _2342;
    float _2352 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _2354 = uint(_2338) >= uint(_1001);
    float _2356 = fma(_1102, (*spvDescriptorSet0.vp_c9)._m0[93].w, _2340);
    float _2358 = _1764 * _131;
    float _2360 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _2362 = !_2354;
    int _2364 = _2362 ? 0 : (-1);
    float _2366 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[92].w, _2356);
    bool _2368 = _1094 > 0.5;
    float _2370 = exp2(_2358);
    float _2372 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _2374 = -_221;
    int _2376 = _2368 ? as_type<int>(_2374) : as_type<int>(_221);
    float _2378 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2380 = _915 + _2378;
    bool _2382 = _1104 != 1;
    float _2384 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2386 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2388 = -_2370;
    float _2390 = _2388 + 1.0;
    float _2392 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    if (!_2382)
    {
        _2222 = _1098;
    }
    float _2394 = _2222;
    float _2396 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2398 = _2396 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2400 = 0.0;
    float _2402 = _2394;
    if (!_2382)
    {
        _2400 = _1098;
    }
    float _2404 = _2400;
    float _2406 = fma(_2306, -2.0, _2392);
    float _2408 = _2404;
    if (!_2382)
    {
        _2292 = _1116;
    }
    float _2410 = _2292;
    float _2412 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2320);
    float _2414 = _2410;
    if (!_2382)
    {
        _2344 = _1116;
    }
    float _2416 = _2344;
    float _2418 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[91].y, _2406);
    float _2420 = _2416;
    if (_2382)
    {
        _2402 = _1094;
    }
    float _2422 = _2402;
    float _2424 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2426 = _2424 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    if (_2382)
    {
        _2408 = _1094;
    }
    float _2428 = _2408;
    float _2430 = 1.0 / _2398;
    if (_2382)
    {
        _2414 = _1098;
    }
    float _2432 = _2414;
    float _2434 = _2422 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_2382)
    {
        _2420 = _1098;
    }
    float _2436 = _2420;
    bool _2438 = _1106 != 2;
    float _2440 = -_2316;
    float _2442 = fma(_2434, 2.0, _2440);
    float _2444 = _2432 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2446 = fma(_2436, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2352);
    float _2448 = -_131;
    float _2450 = fma(_2448, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2442);
    float _2452 = fma(_2444, -2.0, _2360);
    float _2454 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2446);
    float _2456 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _2458 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2452);
    float _2460 = 1.0 / _2426;
    if (_2438)
    {
        _1734 = _1094;
    }
    float _2462 = _1734;
    float _2464 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2466 = _2464 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2468 = _2462;
    if (_2438)
    {
        _1736 = _1098;
    }
    float _2470 = _1736;
    float _2472 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2474 = _2472 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2476 = _2470;
    if (!_2438)
    {
        _2468 = _1116;
    }
    float _2478 = _2468;
    float _2480 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2482 = _915 + _2480;
    if (!_2438)
    {
        _2476 = _1094;
    }
    float _2484 = _2476;
    float _2486 = 1.0 / _2466;
    int _2488 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2490 = _2488 != 0;
    float _2492 = _2478 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _2494 = _1094 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _2496 = _2484 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    bool _2498 = !_2490;
    float _2500 = _2498 ? _221 : as_type<float>(_2376);
    float _2502 = in.m_48.x;
    float _2504 = in.m_48.y;
    float _2506 = in.m_48.z;
    bool _2508 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2510 = isnan(0.0);
    bool _2512 = _2508 || _2510;
    bool _2514 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2516 = _2512 || _2514;
    float _2518 = -_2372;
    float _2520 = fma(_2492, 2.0, _2518);
    float _2522 = fma(_2496, -2.0, _2456);
    float _2524 = -_2384;
    float _2526 = fma(_2494, 2.0, _2524);
    float _2528 = _2516 ? _2390 : 0.0;
    float _2530 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2522);
    bool _2532 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2534 = isnan(1.0);
    bool _2536 = _2532 || _2534;
    bool _2538 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2540 = _2536 || _2538;
    float _2542 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2544 = 1.0 + _2542;
    float _2546 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2548 = -_131;
    float _2550 = fma(_2548, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2526);
    float _2552 = 1.0 / _2544;
    float _2554 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2556 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _2558 = fma(_1094, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2546);
    float _2560 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2562 = fma(_1098, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2554);
    float _2564 = fma(_1094, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2556);
    float _2566 = fma(_1098, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2386);
    float _2568 = fma(_2428, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2560);
    float _2570 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2562);
    float _2572 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2558);
    float _2574 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2566);
    float _2576 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2564);
    float _2578 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2568);
    float _2580 = -_131;
    float _2582 = fma(_2580, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2520);
    float _2584 = _193 * _2504;
    if (_2540)
    {
        float _2586 = _2528 * _2552;
        _141 = _2586;
    }
    float _2588 = _141;
    float _2590 = _1098 * 2.0;
    bool _2592 = _1414 >= 0.0;
    bool _2594 = isnan(_1414);
    bool _2596 = _2592 || _2594;
    bool _2598 = isnan(0.0);
    bool _2600 = _2596 || _2598;
    float _2602 = _199 * _2504;
    float _2604 = _205 * _2504;
    float _2606 = floor(_2590);
    int _2608 = _2600 ? 0 : 1;
    float _2610 = fma(_197, _2502, _2602);
    bool _2612 = _1414 > 0.0;
    float _2614 = fma(_203, _2502, _2604);
    float _2616 = fma(_191, _2502, _2584);
    float _2618 = fma(_201, _2506, _2610);
    int _2620 = ~_2608;
    int _2622 = _2620 + 1;
    int _2624 = _2622 + 1;
    float _2626 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2628 = _2626 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2630 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2632 = _2630 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2634 = 1.0 / _2474;
    float _2636 = fma(_207, _2506, _2614);
    float _2638 = fma(_195, _2506, _2616);
    int _2640 = _2624;
    if (!_2612)
    {
        int _2642 = ~_2608;
        int _2644 = _2642 + 1;
        _2640 = _2644;
    }
    int _2646 = _2640;
    float _2648 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2650 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2648;
    bool _2652 = _2606 >= 0.0;
    bool _2654 = isnan(_2606);
    bool _2656 = _2652 || _2654;
    bool _2658 = isnan(0.0);
    bool _2660 = _2656 || _2658;
    float _2662 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2664 = _2662 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2666 = 1.0 / _2628;
    int _2668 = _2660 ? 0 : 1;
    float _2670 = _2650 * _2430;
    bool _2672 = _2606 > 0.0;
    float _2674 = _1116 * 2.0;
    float _2676 = _2664 * _2460;
    int _2678 = ~_2188;
    int _2680 = _2678 + _2254;
    int _2682 = _2680 + 1;
    float _2684 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2686 = _2684 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2688 = 1.0 / _2632;
    float _2690 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2692 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2690;
    float _2694 = _2686 * _2486;
    int _2696 = _933 * _2682;
    int _2698 = _2696 + _1474;
    float _2700 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2702 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2700;
    float _2704 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2706 = _2704 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2708 = floor(_2674);
    float _2710 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2712 = _2710 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _2714 = _2702 * _2634;
    float _2716 = _2706 * _2666;
    bool _2718 = _915 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2720 = isnan(_915);
    bool _2722 = _2718 || _2720;
    bool _2724 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2726 = _2722 || _2724;
    float _2728 = float(_2726);
    float _2730 = fma(_2694, _2482, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    bool _2732 = _915 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2734 = isnan(_915);
    bool _2736 = _2732 || _2734;
    bool _2738 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2740 = _2736 || _2738;
    float _2742 = float(_2740);
    float _2744 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2746 = _915 + _2744;
    float _2748 = _2692 * _2688;
    int _2750 = ~_2668;
    int _2752 = _2750 + 1;
    int _2754 = _2752 + 1;
    float _2756 = 1.0 / _2712;
    bool _2758 = !_1476;
    int _2760 = _2758 ? _2698 : (-1);
    float _2762 = -_2728;
    float _2764 = _2762 + 1.0;
    bool _2766 = !_2096;
    int _2768 = _2766 ? 0 : 1;
    float _2770 = in.m_64.w;
    int _2772 = _2754;
    if (!_2672)
    {
        int _2774 = ~_2668;
        int _2776 = _2774 + 1;
        _2772 = _2776;
    }
    int _2778 = _2772;
    float _2780 = -_2742;
    float _2782 = _2780 + 1.0;
    int _2784 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2786 = _2784 != 0;
    int _2788 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2790 = _2788 != 0;
    int _2792 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2794 = _2792 != 0;
    float _2796 = _2742 * _2764;
    bool _2798 = _2708 >= 0.0;
    bool _2800 = isnan(_2708);
    bool _2802 = _2798 || _2800;
    bool _2804 = isnan(0.0);
    bool _2806 = _2802 || _2804;
    float _2808 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2810 = _915 + _2808;
    bool _2812 = _915 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2814 = isnan(_915);
    bool _2816 = _2812 || _2814;
    bool _2818 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2820 = _2816 || _2818;
    float _2822 = float(_2820);
    float _2824 = fma(_2714, _2746, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    int _2826 = _2080 >> 31;
    float _2828 = fma(_2670, _2810, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    int _2830 = _2806 ? 0 : 1;
    float _2832 = _2822 * _2782;
    bool _2834 = _2708 > 0.0;
    float _2836 = -_2822;
    float _2838 = _2836 + 1.0;
    bool _2840 = _915 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2842 = isnan(_915);
    bool _2844 = _2840 || _2842;
    bool _2846 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2848 = _2844 || _2846;
    float _2850 = float(_2848);
    float _2852 = fma(_2676, _2380, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    int _2854 = _2826 & 3;
    float _2856 = fma(_2748, _1146, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    bool _2858 = _915 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2860 = isnan(_915);
    bool _2862 = _2858 || _2860;
    bool _2864 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2866 = _2862 || _2864;
    float _2868 = float(_2866);
    float _2870 = -_2850;
    float _2872 = _2870 + 1.0;
    int _2874 = _2080 + _2854;
    float _2876 = _2850 * _2838;
    bool _2878 = _915 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2880 = isnan(_915);
    bool _2882 = _2878 || _2880;
    bool _2884 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2886 = _2882 || _2884;
    float _2888 = float(_2886);
    float _2890 = -_2868;
    float _2892 = _2890 + 1.0;
    float _2894 = _2868 * _2872;
    int _2896 = _2874 >> 2;
    float _2898 = _2618 + _2770;
    float _2900 = _2888 * _2892;
    bool _2902 = _915 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2904 = isnan(_915);
    bool _2906 = _2902 || _2904;
    bool _2908 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2910 = _2906 || _2908;
    float _2912 = float(_2910);
    float _2914 = -_2888;
    float _2916 = _2914 + 1.0;
    int _2918 = _2896 << 4;
    int _2920 = _2918 + 656;
    float _2922 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2924 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2922;
    bool _2926 = _915 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2928 = isnan(_915);
    bool _2930 = _2926 || _2928;
    bool _2932 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2934 = _2930 || _2932;
    float _2936 = float(_2934);
    float _2938 = _2912 * _2916;
    float _2940 = -_2912;
    float _2942 = _2940 + 1.0;
    float _2944 = _2924 * _2756;
    uint _2946 = uint(int(uint(_2920) >> uint(2)));
    uint _2948 = uint(int(uint(int(_2946)) >> uint(2)));
    int _2950 = int(_2946) & 3;
    float _2952 = (*spvDescriptorSet0.vp_c9)._m0[int(_2948)][_2950];
    int _2954 = int(_2946) + 1;
    uint _2956 = uint(int(uint(_2954) >> uint(2)));
    int _2958 = _2954 & 3;
    float _2960 = (*spvDescriptorSet0.vp_c9)._m0[int(_2956)][_2958];
    float _2962 = in.m_62.w;
    float _2964 = _2936 * _2942;
    float _2966 = -_2936;
    float _2968 = _2966 + 1.0;
    float _2970 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2972 = _2898 + _2970;
    float _2974 = in.m_66.w;
    float _2976 = _2828 * _2964;
    float _2978 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2980 = _915 + _2978;
    float _2982 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2984 = _915 + _2982;
    int _2986 = abs(_2228);
    float _2988 = fma(_2968, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2976);
    int _2990 = abs(_2240);
    int _2992 = _2920 + 8;
    uint _2994 = uint(int(uint(_2992) >> uint(2)));
    uint _2996 = uint(int(uint(int(_2994)) >> uint(2)));
    int _2998 = int(_2994) & 3;
    float _3000 = (*spvDescriptorSet0.vp_c9)._m0[int(_2996)][_2998];
    int _3002 = int(_2994) + 1;
    uint _3004 = uint(int(uint(_3002) >> uint(2)));
    int _3006 = _3002 & 3;
    float _3008 = (*spvDescriptorSet0.vp_c9)._m0[int(_3004)][_3006];
    float _3010 = fma(_2944, _2984, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _3012 = fma(_2852, _2938, _2988);
    int _3014 = ~_2830;
    int _3016 = _3014 + 1;
    int _3018 = _3016 + 1;
    float _3020 = _1098 + _1116;
    int _3022 = _3018;
    if (!_2834)
    {
        int _3024 = ~_2830;
        int _3026 = _3024 + 1;
        _3022 = _3026;
    }
    int _3028 = _3022;
    float _3030 = _1098 + _1094;
    float _3032 = fma(_2716, _2980, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    bool _3034 = !_2786;
    int _3036 = _3034 ? 0 : 1;
    float _3038 = -_2576;
    float _3040 = _3038 + 1.0;
    float _3042 = _3030 + (-1.0);
    float _3044 = float(_3028);
    float _3046 = _2638 + _2962;
    float _3048 = fma(_2856, _2900, _3012);
    float _3050 = _1094 + _1116;
    int _3052 = abs(_2162);
    float _3054 = _2636 + _2974;
    float _3056 = _1094 + (-0.5);
    float _3058 = fma(_2730, _2894, _3048);
    float _3060 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3062 = _3046 + _3060;
    float _3064 = _2972 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3066 = _1098 + (-0.5);
    float _3068 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _3070 = int(_3068);
    float _3072 = fma(_3062, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3064);
    float _3074 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3076 = _3054 + _3074;
    int _3078 = abs(_2768);
    float _3080 = fma(_2824, _2876, _3058);
    int _3082 = ~_3052;
    int _3084 = _3082 + 1;
    int _3086 = _3084 + 1;
    float _3088 = fma(_3076, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3072);
    float _3090 = fma(_3032, _2832, _3080);
    bool _3092 = !_1942;
    int _3094 = _3092 ? 0 : 1;
    bool _3096 = _2094 != 3;
    float _3098 = fma(_3042, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _3100 = ~_3078;
    int _3102 = _3100 + 1;
    int _3104 = _3102 + 1;
    int _3106 = _3086 * as_type<int>(_2960);
    bool _3108 = !_3096;
    int _3110 = _3108 ? 0 : (-1);
    float _3112 = _2092 + (-0.5);
    bool _3114 = _3088 >= 0.0;
    int _3116 = _3104 * as_type<int>(_2952);
    int _3118 = _3116 + _3106;
    float _3120 = _1928 + 0.5;
    int _3122 = abs(_3110);
    float _3124 = fma(_3010, _2796, _3090);
    int _3126 = ~_2986;
    int _3128 = _3126 + 1;
    int _3130 = _3128 + 1;
    float _3132 = float(uint(_3070));
    float _3134 = fma(_2728, (*spvDescriptorSet0.vp_c9)._m0[166].x, _3124);
    int _3136 = ~_3122;
    int _3138 = _3136 + 1;
    int _3140 = _3138 + 1;
    int _3142 = _3130 * as_type<int>(_3000);
    int _3144 = _3142 + _3118;
    int _3146 = ~_2990;
    int _3148 = _3146 + 1;
    int _3150 = _3148 + 1;
    float _3152 = fma(_3120, (*spvDescriptorSet0.vp_c9)._m0[95].x, _2326);
    float _3154 = 1.0 / _3132;
    int _3156 = _3140 * as_type<int>(_3008);
    int _3158 = _3156 + _3144;
    float _3160 = -_3112;
    float _3162 = -_2418;
    float _3164 = fma(_3160, (*spvDescriptorSet0.vp_c9)._m0[95].y, _3162);
    float _3166 = -_2366;
    float _3168 = _3166 + 1.0;
    float _3170 = _2500 + 0.5;
    int _3172 = _3158 * _3150;
    float _3174 = -_2328;
    float _3176 = _3174 + 1.0;
    float _3178 = _2100 + (-0.5);
    float _3180 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _3182 = _2760 * _2990;
    int _3184 = _3182 + _3172;
    float _3186 = -_3176;
    float _3188 = fma(_3186, _1928, _3152);
    float _3190 = _3176;
    if (_3114)
    {
        _3190 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3192 = _3190;
    float _3194 = fma(_3168, _2092, _3164);
    float _3196 = fma(_3170, (*spvDescriptorSet0.vp_c9)._m0[80].x, _2550);
    float _3198 = float(uint(_3184));
    float _3200 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _3202 = as_type<int>(_3154) + (-2);
    int _3204 = as_type<int>(_3154);
    if (_3114)
    {
        float _3206 = _3192 * 5.0;
        _3204 = as_type<int>(_3206);
    }
    int _3208 = _3204;
    float _3210 = -_3178;
    float _3212 = -_2412;
    float _3214 = fma(_3210, (*spvDescriptorSet0.vp_c9)._m0[80].y, _3212);
    float _3216 = _1620 + (-0.5);
    out.m_76.x = _3188;
    out.m_76.y = _3194;
    float _3218 = as_type<float>(_3202) * _3198;
    int _3220 = ~_3070;
    int _3222 = _3220 + 1;
    float _3224 = _3180 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _3226 = _1876 + 0.5;
    if (_3114)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9939 = as_type<float>(_3208);
        out.gl_Position.z = _9939;
    }
    int _3228 = abs(_3036);
    float _3230 = trunc(_3218);
    float _3232 = precise::max(_3230, 0.0);
    uint _3234 = uint(_3232);
    float _3236 = fma(_3224, _3226, _2450);
    int _3238 = ~_2322;
    int _3240 = _3238 + _2364;
    int _3242 = _3240 + 1;
    out.m_78.x = _3134;
    float _3244 = _3200 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _3246 = abs(_3070);
    int _3248 = _2246 >> 31;
    float _3250 = -_3244;
    float _3252 = -_2458;
    float _3254 = fma(_3250, _3216, _3252);
    float _3256 = _2972 * _2972;
    int _3258 = _1898 >> 31;
    int _3260 = _1001 * _3242;
    int _3262 = _3260 + _1778;
    float _3264 = float(uint(_3246));
    if (_3114)
    {
        out.m_55.x = 0.0;
    }
    int _3266 = _3258 & 3;
    float _3268 = fma(_3062, _3062, _3256);
    int _3270 = _3248 & 3;
    float _3272 = 1.0 / _3264;
    int _3274 = _2246 + _3270;
    float _3276 = _713 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _3278 = _1898 + _3266;
    float _3280 = fma(_3076, _3076, _3268);
    float _3282 = -_2572;
    float _3284 = _3282 + 1.0;
    int _3286 = _3222 * int(_3234);
    int _3288 = _3286 + _3184;
    int _3290 = _3274 >> 2;
    float _3292 = -_2570;
    float _3294 = _3292 + 1.0;
    int _3296 = _3278 >> 2;
    float _3298 = -_3284;
    float _3300 = fma(_2500, _3298, _3196);
    int _3302 = _3290 << 4;
    int _3304 = _3302 + 800;
    float _3306 = -_2578;
    float _3308 = _3306 + 1.0;
    float _3310 = float(uint(_3288));
    float _3312 = fma(_2100, _3294, _3214);
    int _3314 = abs(_3184);
    float _3316 = -_3308;
    float _3318 = fma(_1876, _3316, _3236);
    int _3320 = _3296 << 4;
    int _3322 = _3320 + 368;
    float _3324 = as_type<float>(_3202) * _3310;
    int _3326 = as_type<int>(_3272) + (-2);
    float _3328 = -_2454;
    float _3330 = _3328 + 1.0;
    uint _3332 = uint(int(uint(_3304) >> uint(2)));
    uint _3334 = uint(int(uint(int(_3332)) >> uint(2)));
    int _3336 = int(_3332) & 3;
    float _3338 = (*spvDescriptorSet0.vp_c9)._m0[int(_3334)][_3336];
    int _3340 = int(_3332) + 1;
    uint _3342 = uint(int(uint(_3340) >> uint(2)));
    int _3344 = _3340 & 3;
    float _3346 = (*spvDescriptorSet0.vp_c9)._m0[int(_3342)][_3344];
    float _3348 = float(uint(_3314));
    float _3350 = rsqrt(_3280);
    float _3352 = fma(_1620, _3330, _3254);
    float _3354 = _3276 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _3356 = as_type<float>(_3326) * _3348;
    int _3358 = ~_3246;
    int _3360 = _3358 + 1;
    uint _3362 = uint(int(uint(_3322) >> uint(2)));
    uint _3364 = uint(int(uint(int(_3362)) >> uint(2)));
    int _3366 = int(_3362) & 3;
    float _3368 = (*spvDescriptorSet0.vp_c9)._m0[int(_3364)][_3366];
    int _3370 = int(_3362) + 1;
    uint _3372 = uint(int(uint(_3370) >> uint(2)));
    int _3374 = _3370 & 3;
    float _3376 = (*spvDescriptorSet0.vp_c9)._m0[int(_3372)][_3374];
    float _3378 = float(_3228);
    float _3380 = trunc(_3356);
    float _3382 = precise::max(_3380, 0.0);
    uint _3384 = uint(_3382);
    out.m_80.x = _3300;
    out.m_80.y = _3312;
    out.m_80.z = _3318;
    out.m_80.w = _3352;
    int _3386 = ~_2124;
    int _3388 = _3386 + _2184;
    int _3390 = _3388 + 1;
    float _3392 = _3378 * _3044;
    int _3394 = abs(_2012);
    int _3396 = _3322 + 8;
    uint _3398 = uint(int(uint(_3396) >> uint(2)));
    uint _3400 = uint(int(uint(int(_3398)) >> uint(2)));
    int _3402 = int(_3398) & 3;
    float _3404 = (*spvDescriptorSet0.vp_c9)._m0[int(_3400)][_3402];
    int _3406 = int(_3398) + 1;
    uint _3408 = uint(int(uint(_3406) >> uint(2)));
    int _3410 = _3406 & 3;
    float _3412 = (*spvDescriptorSet0.vp_c9)._m0[int(_3408)][_3410];
    int _3414 = abs(_2298);
    float _3416 = trunc(_3324);
    float _3418 = precise::max(_3416, 0.0);
    uint _3420 = uint(_3418);
    int _3422 = _951 * _3390;
    int _3424 = _3422 + _1430;
    int _3426 = abs(_3094);
    float _3428 = _3354 * _3350;
    int _3430 = ~_3414;
    int _3432 = _3430 + 1;
    int _3434 = _3432 + 1;
    int _3436 = abs(_2144);
    int _3438 = _3304 + 8;
    uint _3440 = uint(int(uint(_3438) >> uint(2)));
    uint _3442 = uint(int(uint(int(_3440)) >> uint(2)));
    int _3444 = int(_3440) & 3;
    float _3446 = (*spvDescriptorSet0.vp_c9)._m0[int(_3442)][_3444];
    int _3448 = int(_3440) + 1;
    uint _3450 = uint(int(uint(_3448) >> uint(2)));
    int _3452 = _3448 & 3;
    float _3454 = (*spvDescriptorSet0.vp_c9)._m0[int(_3450)][_3452];
    int _3456 = _3360 * int(_3384);
    int _3458 = _3456 + _3314;
    float _3460 = _2972 * _3428;
    int _3462 = ~_3070;
    int _3464 = _3462 + 1;
    float _3466 = _3062 * _3428;
    float _3468 = float(uint(_3458));
    float _3470 = -_3460;
    float _3472 = _2972 + _3470;
    bool _3474 = !_2262;
    int _3476 = _3474 ? 0 : 1;
    float _3478 = -_3466;
    float _3480 = _3062 + _3478;
    int _3482 = int(_3234) + int(_3420);
    float _3484 = as_type<float>(_3326) * _3468;
    int _3486 = ~_3394;
    int _3488 = _3486 + 1;
    int _3490 = _3488 + 1;
    float _3492 = _3472 * _3472;
    bool _3494 = _1940 != 3;
    float _3496 = trunc(_3484);
    float _3498 = precise::max(_3496, 0.0);
    uint _3500 = uint(_3498);
    int _3502 = _3464 * _3482;
    int _3504 = _3502 + _3184;
    bool _3506 = _951 == 0;
    float _3508 = _1304 + (-0.5);
    bool _3510 = !_1682;
    int _3512 = _3510 ? _3262 : (-1);
    float _3514 = fma(_3480, _3480, _3492);
    bool _3516 = !_3506;
    int _3518 = _3516 ? _3424 : (-1);
    int _3520 = _3434 * as_type<int>(_3346);
    int _3522 = abs(_3476);
    int _3524 = ~_3522;
    int _3526 = _3524 + 1;
    int _3528 = _3526 + 1;
    int _3530 = ~_3426;
    int _3532 = _3530 + 1;
    int _3534 = _3532 + 1;
    int _3536 = _3490 * as_type<int>(_3376);
    bool _3538 = !_3494;
    int _3540 = _3538 ? 0 : (-1);
    int _3542 = _3528 * as_type<int>(_3338);
    int _3544 = _3542 + _3520;
    bool _3546 = uint(_3504) >= uint(_3070);
    int _3548 = _3534 * as_type<int>(_3368);
    int _3550 = _3548 + _3536;
    int _3552 = ~_3246;
    int _3554 = _3552 + 1;
    int _3556 = int(_3384) + int(_3500);
    bool _3558 = !_3546;
    int _3560 = _3558 ? 0 : (-1);
    int _3562 = abs(_2350);
    int _3564 = _3554 * _3556;
    int _3566 = _3564 + _3314;
    bool _3568 = _2260 != 3;
    int _3570 = ~_3482;
    int _3572 = _3570 + _3560;
    int _3574 = _3572 + 1;
    int _3576 = ~_3562;
    int _3578 = _3576 + 1;
    int _3580 = _3578 + 1;
    int _3582 = abs(_2070);
    bool _3584 = !_3568;
    int _3586 = _3584 ? 0 : (-1);
    int _3588 = _3580 * as_type<int>(_3446);
    int _3590 = _3588 + _3544;
    bool _3592 = uint(_3566) >= uint(_3246);
    int _3594 = _3070 * _3574;
    int _3596 = _3594 + _3184;
    int _3598 = abs(_3540);
    int _3600 = ~_3582;
    int _3602 = _3600 + 1;
    int _3604 = _3602 + 1;
    int _3606 = _3184 ^ _3070;
    int _3608 = abs(_3586);
    int _3610 = _3604 * as_type<int>(_3404);
    int _3612 = _3610 + _3550;
    float _3614 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _3616 = !_3592;
    int _3618 = _3616 ? 0 : (-1);
    int _3620 = ~_3598;
    int _3622 = _3620 + 1;
    int _3624 = _3622 + 1;
    uint _3626 = uint(int(uint(_3606) >> uint(31)));
    bool _3628 = _3070 == 0;
    int _3630 = _3624 * as_type<int>(_3412);
    int _3632 = _3630 + _3612;
    int _3634 = ~_3618;
    int _3636 = _3556 + _3634;
    int _3638 = _3636 + 1;
    int _3640 = ~int(_3626);
    int _3642 = _3640 + 1;
    float _3644 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _3646 = abs(_2250);
    int _3648 = ~_3608;
    int _3650 = _3648 + 1;
    int _3652 = _3650 + 1;
    bool _3654 = !_3628;
    int _3656 = _3654 ? _3596 : (-1);
    int _3658 = _3652 * as_type<int>(_3454);
    int _3660 = _3658 + _3590;
    int _3662 = _3638 ^ _3642;
    int _3664 = ~_3436;
    int _3666 = _3664 + 1;
    int _3668 = _3666 + 1;
    float _3670 = in.m_82.x;
    float _3672 = in.m_82.y;
    float _3674 = in.m_82.z;
    bool _3676 = _3070 == 0;
    int _3678 = ~_3642;
    int _3680 = _3678 + _3662;
    int _3682 = _3680 + 1;
    int _3684 = _3632 * _3668;
    float _3686 = float(_3656);
    float _3688 = _3614 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _3690 = ~_3646;
    int _3692 = _3690 + 1;
    int _3694 = _3692 + 1;
    int _3696 = _3518 * _3436;
    int _3698 = _3696 + _3684;
    bool _3700 = !_3676;
    int _3702 = _3700 ? _3682 : (-1);
    float _3704 = fma(_3688, _3686, _2582);
    float _3706 = _1274 + 0.5;
    int _3708 = _3660 * _3694;
    float _3710 = float(_3702);
    float _3712 = _3644 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _3714 = fma(_3688, _3706, _3704);
    int _3716 = _3512 * _3646;
    int _3718 = _3716 + _3708;
    float _3720 = -_2530;
    float _3722 = fma(_3712, _3710, _3720);
    float _3724 = -_3040;
    float _3726 = fma(_1274, _3724, _3714);
    float _3728 = -_2574;
    float _3730 = _3728 + 1.0;
    float _3732 = _3392 * (-2.0);
    float _3734 = -_3712;
    float _3736 = fma(_3734, _3508, _3722);
    float _3738 = float(_3698);
    float _3740 = float(_3718);
    float _3742 = fma(_1304, _3730, _3736);
    float _3744 = fma(_3732, _3670, _3670);
    float _3746 = _3076 * _3428;
    bool _3748 = !_2790;
    int _3750 = _3748 ? 0 : 1;
    out.m_84.x = _3738;
    float _3752 = fma(_3098, _3732, _3098);
    float _3754 = -_3746;
    float _3756 = _3076 + _3754;
    bool _3758 = !_2794;
    int _3760 = _3758 ? 0 : 1;
    out.m_84.w = _3740;
    int _3762 = abs(_3750);
    out.m_86.x = _3726;
    out.m_86.y = _3742;
    float _3764 = _3674;
    if (_3114)
    {
        return out;
    }
    float _3766 = -_3460;
    float _3768 = _2898 + _3766;
    float _3770 = float(_2646);
    float _3772 = -_3466;
    float _3774 = _3046 + _3772;
    float _3776 = float(_3762);
    float _3778 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3780 = _3768 + _3778;
    float _3782 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3784 = _3774 + _3782;
    float _3786 = _3020 + (-1.0);
    float _3788 = _3780 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3790 = -_3746;
    float _3792 = _3054 + _3790;
    float _3794 = _3776 * _3770;
    int _3796 = abs(_3760);
    float _3798 = fma(_3784, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3788);
    float _3800 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3802 = _3792 + _3800;
    float _3804 = float(_2778);
    float _3806 = fma(_3786, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _3808 = float(_3796);
    float _3810 = fma(_3802, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3798);
    float _3812 = _3794 * (-2.0);
    float _3814 = fma(_3056, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3744);
    float _3816 = _3808 * _3804;
    float _3818 = fma(_3812, _3672, _3672);
    bool _3820 = _3810 >= 0.0;
    float _3822 = fma(_3806, _3812, _3806);
    float _3824 = _3050 + (-1.0);
    float _3826 = fma(_3066, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3818);
    float _3828 = _3816 * (-2.0);
    float _3830 = fma(_3752, _2588, _3814);
    float _3832 = fma(_3756, _3756, _3514);
    float _3834 = fma(_3822, _2588, _3826);
    float _3836 = _1116 + (-0.5);
    float _3838 = fma(_3824, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3840 = fma(_3828, _3674, _3674);
    float _3842 = _3830 * 0.15915493667125701904296875;
    float _3844 = _3834 * 0.15915493667125701904296875;
    if (_3820)
    {
        _3764 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3846 = _3764;
    float _3848 = fma(_3836, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3840);
    float _3850 = sqrt(_3832);
    float _3852 = fma(_3838, _3828, _3838);
    int _3854 = as_type<int>(_3846);
    if (_3820)
    {
        out.m_55.x = 0.0;
    }
    if (_3820)
    {
        float _3856 = _3846 * 5.0;
        _3854 = as_type<int>(_3856);
    }
    int _3858 = _3854;
    float _3860 = fma(_3852, _2588, _3848);
    float _3862 = _3842 * 6.283185482025146484375;
    float _3864 = sin(_3862);
    if (_3820)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _10863 = as_type<float>(_3858);
        out.gl_Position.z = _10863;
    }
    float _3866 = _3860 * 0.15915493667125701904296875;
    float _3868 = _3842 * 6.283185482025146484375;
    float _3870 = cos(_3868);
    float _3872 = _3844 * 6.283185482025146484375;
    float _3874 = sin(_3872);
    float _3876 = _3844 * 6.283185482025146484375;
    float _3878 = cos(_3876);
    if (_3820)
    {
        return out;
    }
    float _3880 = _3866 * 6.283185482025146484375;
    float _3882 = cos(_3880);
    float _3884 = _3350 * _3850;
    float _3886 = _711 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3888 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _225);
    float _3890 = _3870 * _3878;
    float _3892 = _3276 * _3884;
    float _3894 = _3884 * _3886;
    float _3896 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _221);
    float _3898 = _3866 * 6.283185482025146484375;
    float _3900 = sin(_3898);
    float _3902 = _3870 * _3874;
    float _3904 = _3888 * _3894;
    float _3906 = _3864 * _3874;
    float _3908 = _3864 * _3878;
    float _3910 = _3896 * _3892;
    float _3912 = _225 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3914 = _3870 * _3882;
    float _3916 = _3878 * _3882;
    float _3918 = _3864 * _3882;
    float _3920 = _3874 * _3882;
    float _3922 = _3914 * _3904;
    float _3924 = _3884 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _3926 = _3924 * 0.5;
    float _3928 = _3918 * _3904;
    float _3930 = fma(_3900, _3890, _3906);
    float _3932 = -_3908;
    float _3934 = fma(_3900, _3902, _3932);
    float _3936 = -_3904;
    float _3938 = _3900 * _3936;
    float _3940 = -_3902;
    float _3942 = fma(_3900, _3908, _3940);
    float _3944 = fma(_3930, _3910, _3922);
    float _3946 = fma(_3900, _3906, _3890);
    float _3948 = fma(_3916, _3910, _3938);
    float _3950 = fma(_3942, _3910, _3928);
    float _3952 = fma(_3934, _3926, _3944);
    float _3954 = fma(_3920, _3926, _3948);
    float _3956 = fma(_3946, _3926, _3950);
    float _3958 = _3952 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3960 = _3952 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3962 = _3952 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3964 = fma(_3954, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3958);
    float _3966 = fma(_3954, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3960);
    float _3968 = fma(_3954, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3962);
    float _3970 = _3930 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3972 = fma(_3956, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3964);
    float _3974 = fma(_3956, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3966);
    float _3976 = _3930 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3978 = fma(_3956, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3968);
    float _3980 = _3972 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _3982 = _3974 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _3984 = fma(_3916, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3976);
    float _3986 = _3978 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _3988 = _3046 + _3980;
    float _3990 = _3054 + _3982;
    float _3992 = _3930 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3994 = fma(_3916, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3970);
    float _3996 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3998 = _3988 + _3996;
    float _4000 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _4002 = _3990 + _4000;
    float _4004 = fma(_3916, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3992);
    float _4006 = _3914 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _4008 = _3998 * _3998;
    float _4010 = _4002 * _4002;
    float _4012 = _3914 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _4014 = _3914 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _4016 = -_3900;
    float _4018 = fma(_4016, (*spvDescriptorSet0.vp_c8)._m0[24].x, _4006);
    float _4020 = _4008 + _4010;
    float _4022 = -_3900;
    float _4024 = fma(_4022, (*spvDescriptorSet0.vp_c8)._m0[25].x, _4012);
    float _4026 = -_3900;
    float _4028 = fma(_4026, (*spvDescriptorSet0.vp_c8)._m0[26].x, _4014);
    float _4030 = fma(_3912, _3912, 1.0);
    float _4032 = sqrt(_4020);
    float _4034 = _3934 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _4036 = _3934 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _4038 = _3934 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _4040 = _2898 + _3986;
    float _4042 = fma(_3920, (*spvDescriptorSet0.vp_c8)._m0[24].x, _4034);
    float _4044 = fma(_3920, (*spvDescriptorSet0.vp_c8)._m0[25].x, _4036);
    float _4046 = fma(_3920, (*spvDescriptorSet0.vp_c8)._m0[26].x, _4038);
    float _4048 = rsqrt(_4030);
    bool _4050 = _4032 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4052 = _3920;
    float _4054 = _4006;
    float _4056 = _4036;
    float _4058 = _4030;
    float _4060 = _4034;
    if (!_4050)
    {
        _4052 = _4010;
    }
    float _4062 = _4052;
    float _4064 = _4062;
    if (!_4050)
    {
        _4054 = _4008;
    }
    float _4066 = _4054;
    float _4068 = _4066;
    if (!_4050)
    {
        _4056 = _3988;
    }
    float _4070 = _4056;
    float _4072 = _4070;
    if (!_4050)
    {
        _4058 = _3990;
    }
    float _4074 = _4058;
    float _4076 = _4074;
    if (!_4050)
    {
        _4060 = _4040;
    }
    float _4078 = _4060;
    bool _4080 = !_4050;
    float _4082 = _4078;
    if (!_4080)
    {
        float _4084 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4086 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _4088 = _4032 + _4086;
        float _4090 = rsqrt(_4020);
        float _4092 = _4088 * _4084;
        float _4094 = _4040 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4096 = _4092 * 0.15915493667125701904296875;
        float _4098 = _4096 * 6.283185482025146484375;
        float _4100 = sin(_4098);
        float _4102 = _4096 * 6.283185482025146484375;
        float _4104 = cos(_4102);
        float _4106 = fma(_4100, _4094, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _4108 = _4090 * _4106;
        float _4110 = _4104 + (-1.0);
        float _4112 = fma(_3998, _4108, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _4114 = fma(_4002, _4108, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _4116 = _4110 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4118 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _4120 = _4112 + _4118;
        float _4122 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _4124 = _4114 + _4122;
        float _4126 = fma(_4040, _4104, _4116);
        float _4128 = _4120 * _4120;
        float _4130 = _4124 * _4124;
        _4082 = _4126;
        _4068 = _4128;
        _4064 = _4130;
        _4072 = _4112;
        _4076 = _4114;
    }
    float _4132 = _4082;
    float _4134 = _4068;
    float _4136 = _4064;
    float _4138 = _4072;
    float _4140 = _4076;
    float _4142 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _4144 = _4132 + _4142;
    float _4146 = fma(_3918, (*spvDescriptorSet0.vp_c8)._m0[24].z, _4018);
    float _4148 = fma(_3918, (*spvDescriptorSet0.vp_c8)._m0[25].z, _4024);
    float _4150 = fma(_3918, (*spvDescriptorSet0.vp_c8)._m0[26].z, _4028);
    float _4152 = fma(_4144, _4144, _4134);
    float _4154 = fma(_3946, (*spvDescriptorSet0.vp_c8)._m0[25].z, _4044);
    float _4156 = fma(_3946, (*spvDescriptorSet0.vp_c8)._m0[24].z, _4042);
    float _4158 = fma(_3946, (*spvDescriptorSet0.vp_c8)._m0[26].z, _4046);
    float _4160 = _4152 + _4136;
    float _4162 = fma(_3942, (*spvDescriptorSet0.vp_c8)._m0[24].z, _4004);
    float _4164 = _3912 * _4048;
    float _4166 = fma(_3942, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3994);
    float _4168 = _221 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _4170 = _3912 * _4146;
    float _4172 = _3912 * _4148;
    float _4174 = fma(_3942, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3984);
    float _4176 = _3912 * _4150;
    float _4178 = -_4156;
    float _4180 = _4164 * _4178;
    float _4182 = -_4154;
    float _4184 = _4164 * _4182;
    float _4186 = -_4158;
    float _4188 = _4164 * _4186;
    float _4190 = sqrt(_4160);
    float _4192 = fma(_4168, _4162, _4170);
    float _4194 = fma(_4168, _4166, _4172);
    float _4196 = fma(_4168, _4174, _4176);
    float _4198 = fma(_4048, _4146, _4180);
    float _4200 = fma(_4048, _4148, _4184);
    float _4202 = fma(_4048, _4150, _4188);
    float _4204 = _4156 + _4192;
    float _4206 = _4154 + _4194;
    float _4208 = _4158 + _4196;
    out.m_88.x = _4162;
    out.m_88.y = _4166;
    out.m_88.z = _4174;
    out.m_90.x = _4198;
    out.m_90.y = _4200;
    out.m_90.z = _4202;
    bool _4210 = _4190 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _4212 = isnan(_4190);
    bool _4214 = _4210 || _4212;
    bool _4216 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _4218 = _4214 || _4216;
    out.m_92.x = _4204;
    out.m_92.y = _4206;
    out.m_92.z = _4208;
    float _4220 = _4194;
    float _4222 = _4202;
    if (!_4218)
    {
        _4220 = 1.0;
    }
    float _4224 = _4220;
    bool _4226 = !_4218;
    float _4228 = _4224;
    if (!_4226)
    {
        bool _4230 = _4190 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _4232 = isnan(_4190);
        bool _4234 = _4230 || _4232;
        bool _4236 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _4238 = _4234 || _4236;
        if (!_4238)
        {
            float _4240 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4242 = _4190 + _4240;
            float _4244 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4246 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _4244;
            float _4248 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _4250 = _4248 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _4252 = 1.0 / _4246;
            float _4254 = _4242 * _4252;
            float _4256 = fma(_4254, _4250, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _4228 = _4256;
            _4258 = true;
        }
        else
        {
            bool _4260 = _4190 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _4262 = isnan(_4190);
            bool _4264 = _4260 || _4262;
            bool _4266 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _4268 = _4264 || _4266;
            if (!_4268)
            {
                float _4270 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4272 = _4190 + _4270;
                float _4274 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4276 = _4274 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _4278 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _4280 = _4278 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _4282 = 1.0 / _4276;
                float _4284 = _4272 * _4282;
                float _4286 = fma(_4284, _4280, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _4228 = _4286;
                _4258 = true;
            }
            else
            {
                _4228 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _4258 = false;
    float _4288 = _4228;
    float _4290 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _4292 = _4132 + _4290;
    float _4294 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _4296 = _4138 + _4294;
    float _4298 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _4300 = _4140 + _4298;
    float _4302 = fma(_4292, _4288, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _4304 = fma(_4296, _4288, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _4306 = -_2898;
    float _4308 = _4306 + _4302;
    float _4310 = fma(_4300, _4288, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _4312 = -_3046;
    float _4314 = _4312 + _4304;
    float _4316 = _4308 * _4308;
    float _4318 = -_3054;
    float _4320 = _4318 + _4310;
    float _4322 = fma(_4314, _4314, _4316);
    float _4324 = fma(_4320, _4320, _4322);
    float _4326 = sqrt(_4324);
    bool _4328 = _4326 > 0.0;
    float _4330 = _4326;
    float _4332 = _4300;
    float _4334 = _4292;
    float _4336 = _4304;
    if (!_4328)
    {
        _4330 = _4304;
    }
    float _4338 = _4330;
    float _4340 = _4338;
    if (!_4328)
    {
        _4332 = _4302;
    }
    float _4342 = _4332;
    float _4344 = _4342;
    if (!_4328)
    {
        _4334 = _4310;
    }
    float _4346 = _4334;
    bool _4348 = !_4328;
    float _4350 = _4346;
    float _4352 = _4346;
    if (!_4348)
    {
        float _4354 = _241 * _241;
        float _4356 = fma(_237, _237, _4354);
        float _4358 = fma(_243, _243, _4356);
        float _4360 = rsqrt(_4324);
        float _4362 = sqrt(_4358);
        float _4364 = _4314 * _4360;
        float _4366 = _4308 * _4360;
        float _4368 = _4320 * _4360;
        bool _4370 = _4362 > 0.0;
        float _4372 = _4360;
        float _4374 = _4362;
        if (!_4370)
        {
            _4372 = _4304;
        }
        float _4376 = _4372;
        _4340 = _4376;
        if (!_4370)
        {
            _4374 = _4302;
        }
        float _4378 = _4374;
        _4344 = _4378;
        if (!_4370)
        {
            _4350 = _4310;
        }
        float _4380 = _4350;
        bool _4382 = !_4370;
        _4352 = _4380;
        if (!_4382)
        {
            float _4384 = rsqrt(_4358);
            float _4386 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _4388 = _241 * _4384;
            float _4390 = _237 * _4384;
            float _4392 = _4366 * _4388;
            float _4394 = _243 * _4384;
            float _4396 = fma(_4364, _4390, _4392);
            float _4398 = _4386 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _4400 = fma(_4368, _4394, _4396);
            float _4402 = _4400 * _4398;
            float _4404 = fma(_237, _4402, _4304);
            float _4406 = fma(_241, _4402, _4302);
            float _4408 = fma(_243, _4402, _4310);
            _4344 = _4406;
            _4340 = _4404;
            _4352 = _4408;
        }
    }
    float _4410 = _4344;
    float _4412 = _4340;
    float _4414 = _4352;
    float _4416 = -_3460;
    float _4418 = _4416 + _4410;
    float _4420 = -_3466;
    float _4422 = _4420 + _4412;
    float _4424 = -_3746;
    float _4426 = _4424 + _4414;
    float _4428 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4430 = _4418 + _4428;
    float _4432 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4434 = _4422 + _4432;
    float _4436 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4438 = _4426 + _4436;
    float _4440 = _4430 * _4430;
    float _4442 = fma(_3792, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4444 = fma(_4434, _4434, _4440);
    float _4446 = fma(_4438, _4438, _4444);
    float _4448 = rsqrt(_4446);
    float _4450 = _4448 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4452 = _4434 * _4450;
    float _4454 = _4438 * _4450;
    float _4456 = _4452 * _4452;
    float _4458 = _4454 * _4454;
    float _4460 = _4456 + _4458;
    float _4462 = sqrt(_4460);
    bool _4464 = _4462 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4466 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4468 = _4462 + _4466;
    float _4470 = _4448;
    float _4472 = _4468;
    float _4474 = _4430;
    float _4476 = _4460;
    if (_4464)
    {
        float _4478 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4470 = _4478;
    }
    float _4480 = _4470;
    float _4482 = _4480;
    if (_4464)
    {
        float _4484 = _4468 * _4480;
        _4472 = _4484;
    }
    float _4486 = _4472;
    if (_4464)
    {
        float _4488 = rsqrt(_4460);
        _4482 = _4488;
    }
    float _4490 = _4482;
    float _4492 = _4490;
    if (_4464)
    {
        float _4494 = _4486 * 0.15915493667125701904296875;
        _4336 = _4494;
    }
    float _4496 = _4336;
    float _4498 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4500 = _4438;
    float _4502 = _4496;
    if (_4464)
    {
        float _4504 = _4496 * 6.283185482025146484375;
        float _4506 = sin(_4504);
        _4500 = _4506;
    }
    float _4508 = _4500;
    float _4510 = precise::max(0.0, _4498);
    float _4512 = _4314;
    float _4514 = _4510;
    if (_4464)
    {
        float _4516 = _4496 * 6.283185482025146484375;
        float _4518 = cos(_4516);
        _4512 = _4518;
    }
    float _4520 = _4512;
    float _4522 = -_4450;
    float _4524 = -_4510;
    float _4526 = fma(_4430, _4522, _4524);
    if (_4464)
    {
        float _4528 = _4526 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4474 = _4528;
    }
    float _4530 = _4474;
    float _4532 = fma(_3774, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _4534 = _4508;
    float _4536 = _4530;
    if (_4464)
    {
        float _4538 = fma(_4508, _4530, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4534 = _4538;
    }
    float _4540 = _4534;
    float _4542 = _4540;
    if (!_4464)
    {
        _4536 = _4454;
    }
    float _4544 = _4536;
    float _4546 = floor(_4532);
    float _4548 = _4544;
    if (!_4464)
    {
        _4502 = _4456;
    }
    float _4550 = _4502;
    float _4552 = _4550;
    if (_4464)
    {
        float _4554 = _4490 * _4540;
        _4222 = _4554;
    }
    float _4556 = _4222;
    if (!_4464)
    {
        _4492 = _4452;
    }
    float _4558 = _4492;
    float _4560 = _4558;
    float _4562 = _4520;
    if (_4464)
    {
        float _4564 = _4520 + (-1.0);
        _4514 = _4564;
    }
    float _4566 = _4514;
    if (_4464)
    {
        float _4568 = _4452 * _4556;
        _4560 = _4568;
    }
    float _4570 = _4560;
    if (!_4464)
    {
        _4542 = _4526;
    }
    float _4572 = _4542;
    float _4574 = _4572;
    if (_4464)
    {
        float _4576 = _4454 * _4556;
        _4548 = _4576;
    }
    float _4578 = _4548;
    if (_4464)
    {
        float _4580 = _4566 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4476 = _4580;
    }
    float _4582 = _4476;
    if (_4464)
    {
        float _4584 = _4570 * _4570;
        _4552 = _4584;
    }
    float _4586 = _4552;
    float _4588 = _4418 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4590 = sqrt(_4446);
    if (_4464)
    {
        float _4592 = fma(_4526, _4520, _4582);
        _4574 = _4592;
    }
    float _4594 = _4574;
    if (!_4464)
    {
        _4562 = _4458;
    }
    float _4596 = _4562;
    float _4598 = _4596;
    if (_4464)
    {
        float _4600 = _4578 * _4578;
        _4598 = _4600;
    }
    float _4602 = _4598;
    float _4604 = fma(_4422, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4588);
    float _4606 = fma(_4594, _4594, _4586);
    float _4608 = _4418 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4610 = _4418 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4612 = _4606 + _4602;
    float _4614 = fma(_4426, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4604);
    float _4616 = _4418 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4618 = fma(_4422, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4608);
    float _4620 = rsqrt(_4612);
    float _4622 = fma(_4422, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4616);
    float _4624 = fma(_4426, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4618);
    float _4626 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4628 = fma(_4590, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4626);
    float _4630 = precise::clamp(_4628, 0.0, 1.0);
    float _4632 = _4614 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4634 = fma(_4426, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4622);
    float _4636 = _4624 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4638 = fma(_4422, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4610);
    float _4640 = -_4630;
    float _4642 = _4640 + 1.0;
    float _4644 = _4634 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4646 = _4636 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4648 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4650 = _4632 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4652 = fma(_4426, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4638);
    float _4654 = fma(_4644, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4646);
    float _4656 = _4620 * _4570;
    float _4658 = abs(_4642);
    float _4660 = log2(_4658);
    float _4662 = -_4650;
    float _4664 = fma(_4662, _4648, 1.0);
    float _4666 = _4652 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4668 = _4620 * _4594;
    float _4670 = _4656 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4672 = _4620 * _4578;
    float _4674 = fma(_4632, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4654);
    float _4676 = -_4546;
    float _4678 = _4532 + _4676;
    float _4680 = -_4670;
    float _4682 = fma(_4668, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4680);
    float _4684 = log2(_4664);
    float _4686 = fma(_4666, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4674);
    float _4688 = _4636 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4690 = -_4672;
    float _4692 = fma(_4690, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4682);
    float _4694 = _4636 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4696 = fma(_4644, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4688);
    float _4698 = fma(_4692, -0.5, 0.5);
    float _4700 = _4660 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4702 = 1.0 / _4686;
    float _4704 = fma(_4692, 0.5, 0.5);
    float _4706 = fma(_4644, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4694);
    float _4708 = fma(_4632, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4696);
    float _4710 = _4668 + 1.0;
    float _4712 = fma(_4632, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4706);
    float _4714 = fma(_4666, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4708);
    float _4716 = exp2(_4700);
    float _4718 = _4684 * 0.693147182464599609375;
    float _4720 = fma(_4666, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4712);
    float _4722 = sqrt(_4698);
    float _4724 = fma(_4704, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4726 = _4720 * _4702;
    float _4728 = fma(_4704, _4724, -0.212114393711090087890625);
    float _4730 = fma(_4726, 0.5, 0.5);
    float _4732 = floor(_4442);
    float _4734 = fma(_4704, _4728, 1.570728778839111328125);
    float _4736 = -_4668;
    float _4738 = fma(_4716, _4710, _4736);
    float _4740 = _4714 * _4702;
    float _4742 = _4718 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4744 = fma(_4738, 0.5, 0.5);
    float _4746 = fma(_4740, -0.5, 0.5);
    float _4748 = _4722 * 0.636619746685028076171875;
    float _4750 = -_4734;
    float _4752 = fma(_4748, _4750, 1.0);
    float _4754 = -_4732;
    float _4756 = _4442 + _4754;
    float2 _12367 = float2(_4678, _4756);
    float _4758 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_12367, float2(0.0), isnan(_12367)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_12367, float2(0.0), isnan(_12367)), level(0.0)).x;
    float3 _12378 = float3(_4730, _4746, _4742);
    float _4760 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_12378, float3(0.0), isnan(_12378)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_12378, float3(0.0), isnan(_12378)), level(0.0)).x;
    float3 _12389 = float3(_4730, _4746, _4742);
    float4 _4763 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_12389, float3(0.0), isnan(_12389)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_12389, float3(0.0), isnan(_12389)), level(0.0)).xyzw;
    float _4765 = _4763.x;
    float _4767 = _4763.y;
    float _4769 = _4763.z;
    float _4771 = _4763.w;
    float2 _12405 = float2(_4752, _4744);
    float3 _4775 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_12405, float2(0.0), isnan(_12405)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_12405, float2(0.0), isnan(_12405)), level(0.0)).xyz;
    float _4777 = _4775.x;
    float _4779 = _4775.y;
    float _4781 = _4775.z;
    float _4783 = _3768 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4785 = _4660 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4787 = fma(_3774, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4783);
    float _4789 = _3768 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _4791 = fma(_3792, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4787);
    float _4793 = fma(_3774, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4789);
    float _4795 = _4791 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4797 = fma(_3792, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4793);
    float _4799 = 1.0 / _4795;
    float _4801 = _4797 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4803 = _4801 + _4795;
    float _4805 = _4803 * _4799;
    float _4807 = _4805 * 0.5;
    float _4809 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _4811 = fma(_4807, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4809);
    float _4813 = 1.0 / _4811;
    float _4815 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4817 = _4813 * _4815;
    float _4819 = in.m_94.x;
    float _4821 = abs(_4817);
    float _4823 = log2(_4821);
    bool _4825 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _4827 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _4829 = _4825 || _4827;
    bool _4831 = isnan(0.5);
    bool _4833 = _4829 || _4831;
    float _4835 = _4823 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _4837 = exp2(_4835);
    float _4839 = fma(_4837, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4841 = precise::clamp(_4839, 0.0, 1.0);
    bool _4843 = _4817 <= 8000.0;
    bool _4845 = isnan(_4817);
    bool _4847 = _4843 || _4845;
    bool _4849 = isnan(8000.0);
    bool _4851 = _4847 || _4849;
    float _4853 = float(_4851);
    float _4855 = fma(_4841, -2.0, 3.0);
    float _4857 = _4841 * _4841;
    float _4859 = _4636 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4861 = _4857 * _4855;
    float _4863 = fma(_4644, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4859);
    float _4865 = -_4861;
    float _4867 = _4865 + 1.0;
    float _4869 = fma(_4632, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4863);
    float _4871 = fma(_4867, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4861);
    float _4873 = fma(_4666, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4869);
    float _4875 = _4720 + _4686;
    float _4877 = exp2(_4785);
    float _4879 = _4853 * _4871;
    float _4881 = _4873 + _4686;
    float _4883 = _4686 * 0.5;
    float _4885 = _4875 * 0.5;
    float _4887 = _4853;
    float _4889 = _4714;
    float _4891 = _4720;
    if (_4833)
    {
        _4887 = 1.0;
    }
    float _4893 = _4887;
    float _4895 = _4881 * 0.5;
    float _4897 = fma(_4714, -0.5, _4883);
    float _4899 = _4893;
    float _4901 = _4767;
    float _4903 = _4765;
    if (!_4833)
    {
        float _4905 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _4907 = _4905 * 0.15915493667125701904296875;
        float _4909 = _4907 * 6.283185482025146484375;
        float _4911 = cos(_4909);
        float _4913 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _4915 = _4913 * 0.15915493667125701904296875;
        float _4917 = _4907 * 6.283185482025146484375;
        float _4919 = sin(_4917);
        float _4921 = 1.0 / _4911;
        float _4923 = _4915 * 6.283185482025146484375;
        float _4925 = cos(_4923);
        float _4927 = _4919 * _4921;
        float _4929 = _4915 * 6.283185482025146484375;
        float _4931 = sin(_4929);
        float _4933 = _4925 * _4927;
        float _4935 = 1.0 / _4933;
        float _4937 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4939 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _4937;
        float _4941 = 1.0 / _4939;
        float _4943 = _4931 * _4935;
        float _4945 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4947 = fma(_4817, _4943, _4945);
        float _4949 = _4947 * _4941;
        float _4951 = precise::clamp(_4949, 0.0, 1.0);
        _4899 = _4951;
    }
    float _4953 = _4899;
    float _4955 = _4879 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _4957 = -_4877;
    float _4959 = _4957 + 1.0;
    float _4961 = -_4758;
    float _4963 = _4961 + 1.0;
    out.m_96.x = _4885;
    out.m_96.y = _4897;
    out.m_96.z = _4895;
    out.m_96.w = _4686;
    float _4965 = _4959 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _4967 = _4963 * _4955;
    float _4969 = precise::clamp(_4967, 0.0, 1.0);
    bool _4971 = _4590 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4973 = isnan(_4590);
    bool _4975 = _4971 || _4973;
    bool _4977 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4979 = _4975 || _4977;
    out.m_98.x = _4422;
    out.m_98.y = _4418;
    out.m_98.z = _4426;
    float _4981 = _4965 * _4760;
    float _4983 = -_4969;
    float _4985 = fma(_4983, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4987 = -_4965;
    float _4989 = _4987 + 1.0;
    float _4991 = _4771 * _4981;
    float _4993 = _4985 * _4819;
    float _4995 = _4781 * _4981;
    out.gl_Position.x = _4720;
    out.gl_Position.y = _4714;
    out.gl_Position.z = _4873;
    out.gl_Position.w = _4686;
    float _4997 = fma(_4777, _4991, _4765);
    float _4999 = fma(_4779, _4991, _4767);
    float _5001 = _4993 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _5003 = _4771 * _4989;
    float _5005 = fma(_4771, _4995, _4769);
    float _5007 = _4989;
    float _5009 = _4991;
    if (!_4979)
    {
        _4901 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _5011 = _4901;
    out.m_100.x = _5001;
    float _5013 = _5011;
    float _5015 = _5011;
    if (!_4979)
    {
        _4903 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _5017 = _4903;
    float _5019 = _5017;
    float _5021 = _5017;
    if (!_4979)
    {
        _5007 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _5023 = _5007;
    out.m_102.x = _4997;
    out.m_102.y = _4999;
    out.m_102.z = _5005;
    out.m_102.w = _5003;
    float _5025 = _4953 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _5027 = _5023;
    float _5029 = _5023;
    if (!_4979)
    {
        _4889 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _5031 = _4889;
    float _5033 = _5031;
    float _5035 = _5031;
    if (!_4979)
    {
        _4891 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _5037 = _4891;
    float _5039 = _5037;
    float _5041 = _5037;
    if (!_4979)
    {
        _5009 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _5043 = _5009;
    bool _5045 = !_4979;
    float _5047 = _5043;
    float _5049 = _5043;
    if (!_5045)
    {
        bool _5051 = _4590 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _5053 = isnan(_4590);
        bool _5055 = _5051 || _5053;
        bool _5057 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _5059 = _5055 || _5057;
        if (!_5059)
        {
            float _5061 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5063 = _4590 + _5061;
            float _5065 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5067 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _5065;
            float _5069 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _5071 = _5069 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _5073 = 1.0 / _5067;
            float _5075 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _5077 = _5075 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _5079 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _5081 = _5079 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _5083 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _5085 = _5083 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _5087 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _5089 = _5087 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _5091 = _5063 * _5073;
            float _5093 = precise::clamp(_5091, 0.0, 1.0);
            float _5095 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _5097 = _5095 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _5099 = fma(_5093, _5071, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _5101 = fma(_5093, _5077, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _5103 = fma(_5093, _5097, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _5105 = fma(_5093, _5081, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _5107 = fma(_5093, _5085, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _5109 = fma(_5093, _5089, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _5029 = _5103;
            _5015 = _5107;
            _5021 = _5101;
            _5035 = _5105;
            _5049 = _5099;
            _5041 = _5109;
            _5111 = true;
        }
        else
        {
            bool _5113 = _4590 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _5115 = isnan(_4590);
            bool _5117 = _5113 || _5115;
            bool _5119 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _5121 = _5117 || _5119;
            if (!_5121)
            {
                _5033 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _5123 = _5033;
            _5035 = _5123;
            if (!_5121)
            {
                _5013 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _5125 = _5013;
            _5015 = _5125;
            if (!_5121)
            {
                _5039 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _5127 = _5039;
            _5041 = _5127;
            if (!_5121)
            {
                _5019 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _5129 = _5019;
            _5021 = _5129;
            if (!_5121)
            {
                _5027 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _5131 = _5027;
            _5029 = _5131;
            if (!_5121)
            {
                _5047 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _5133 = _5047;
            bool _5135 = !_5121;
            _5049 = _5133;
            if (!_5135)
            {
                bool _5137 = _4590 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _5139 = isnan(_4590);
                bool _5141 = _5137 || _5139;
                bool _5143 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _5145 = _5141 || _5143;
                if (!_5145)
                {
                    float _5147 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5149 = _4590 + _5147;
                    float _5151 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5153 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _5151;
                    float _5155 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _5157 = _5155 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _5159 = 1.0 / _5153;
                    float _5161 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _5163 = _5161 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _5165 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _5167 = _5165 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _5169 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _5171 = _5169 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _5173 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _5175 = _5173 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _5177 = _5149 * _5159;
                    float _5179 = precise::clamp(_5177, 0.0, 1.0);
                    float _5181 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _5183 = _5181 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _5185 = fma(_5179, _5157, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _5187 = fma(_5179, _5163, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _5189 = fma(_5179, _5183, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _5191 = fma(_5179, _5167, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _5193 = fma(_5179, _5171, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _5195 = fma(_5179, _5175, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _5029 = _5189;
                    _5015 = _5193;
                    _5021 = _5187;
                    _5035 = _5191;
                    _5049 = _5185;
                    _5041 = _5195;
                    _5111 = true;
                }
                else
                {
                    _5029 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _5015 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _5021 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _5035 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _5049 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _5041 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _5111 = false;
    float _5197 = _5029;
    float _5199 = _5015;
    float _5201 = _5021;
    float _5203 = _5035;
    float _5205 = _5049;
    float _5207 = _5041;
    float _5209 = _5025 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _5211 = fma(_4206, -0.5, 0.5);
    float _5213 = precise::clamp(_5211, 0.0, 1.0);
    float _5215 = -_5197;
    float _5217 = _5199 + _5215;
    float _5219 = -_5201;
    float _5221 = _5203 + _5219;
    out.m_55.x = _5209;
    float _5223 = fma(_5213, _5217, _5197);
    float _5225 = -_5205;
    float _5227 = _5207 + _5225;
    float _5229 = fma(_5213, _5221, _5201);
    float _5231 = _5223 * 0.586610972881317138671875;
    bool _5233 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _5235 = fma(_5213, _5227, _5205);
    out.m_104.x = 0.0;
    float _5237 = fma(_5229, 0.298911988735198974609375, _5231);
    bool _5239 = _4953 > 0.0;
    bool _5241 = isnan(_4953);
    bool _5243 = _5239 || _5241;
    bool _5245 = isnan(0.0);
    bool _5247 = _5243 || _5245;
    float _5249 = fma(_5235, 0.114477999508380889892578125, _5237);
    float _5251 = -_5249;
    float _5253 = _5229 + _5251;
    float _5255 = -_5249;
    float _5257 = _5223 + _5255;
    float _5259 = -_5249;
    float _5261 = _5235 + _5259;
    float _5263 = fma(_5253, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5249);
    float _5265 = fma(_5257, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5249);
    float _5267 = fma(_5261, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5249);
    bool _5269 = !_5233;
    if (!_5269)
    {
        float _5271 = -_4418;
        float _5273 = _5271 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _5275 = -_4422;
        float _5277 = _5275 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _5279 = -_4426;
        float _5281 = _5279 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _5283 = _5273 * _5273;
        float _5285 = fma(_5277, _5277, _5283);
        float _5287 = fma(_5281, _5281, _5285);
        float _5289 = sqrt(_5287);
        float _5291 = rsqrt(_5287);
        float _5293 = -_5289;
        float _5295 = _5293 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _5297 = _5295 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _5299 = precise::clamp(_5297, 0.0, 1.0);
        float _5301 = _5277 * _5291;
        float _5303 = _5273 * _5291;
        float _5305 = abs(_5299);
        float _5307 = log2(_5305);
        float _5309 = _5281 * _5291;
        float _5311 = _5301 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _5313 = _4206 * _5303;
        float _5315 = -_5303;
        float _5317 = -_5311;
        float _5319 = fma(_5315, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5317);
        float _5321 = fma(_4204, _5301, _5313);
        float _5323 = -_5309;
        float _5325 = fma(_5323, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5319);
        float _5327 = fma(_4208, _5309, _5321);
        float _5329 = precise::clamp(_5327, 0.0, 1.0);
        float _5331 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _5333 = _5325 + _5331;
        float _5335 = _5307 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _5337 = _5333 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _5339 = precise::clamp(_5337, 0.0, 1.0);
        float _5341 = exp2(_5335);
        float _5343 = _5341 * _5339;
        float _5345 = _5329 * _5343;
        float _5347 = _5345 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _5349 = _5345 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _5351 = _5345 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_104.x = _5347;
        out.m_104.y = _5349;
        out.m_104.z = _5351;
    }
    out.m_106.x = _5263;
    out.m_106.y = _5265;
    out.m_106.z = _5267;
    if (_5247)
    {
        return out;
    }
    out.m_55.x = 0.0;
    float _5353 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _5353;
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
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_106 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_104 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    bool _5111 = false;
    bool _4258 = false;
    bool _735 = false;
    bool _591 = false;
    bool _265 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _120 = in.m_48.w;
    float _122 = in.m_50.w;
    float _124 = trunc(_120);
    int _127 = int(_124);
    float _129 = -_122;
    float _131 = _129 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.y = _131;
    bool _135 = _127 >= 1;
    float _137 = 0.0;
    float _139 = _122;
    float _141 = _131;
    if (!_135)
    {
        _137 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _143 = _137;
    if (!_135)
    {
        out.m_55.x = 0.0;
    }
    int _145 = 0;
    if (!_135)
    {
        float _147 = _143 * 5.0;
        _145 = as_type<int>(_147);
    }
    int _149 = _145;
    int _151 = _149;
    if (!_135)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5421 = as_type<float>(_149);
        out.gl_Position.z = _5421;
    }
    if (!_135)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _153 = _122 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _155 = isnan(_122);
    bool _157 = _153 || _155;
    bool _159 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _161 = _157 || _159;
    float _163 = float(_127);
    bool _165 = _131 >= _163;
    bool _167 = !_161;
    bool _169 = _165 || _167;
    float _171 = 1.0 / _163;
    if (_169)
    {
        _139 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _173 = _139;
    if (_169)
    {
        out.m_55.x = 0.0;
    }
    float _175 = _131 * _171;
    float _177 = _175;
    if (_169)
    {
        float _179 = _173 * 5.0;
        _151 = as_type<int>(_179);
    }
    int _181 = _151;
    out.m_53.x = _175;
    if (_169)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5484 = as_type<float>(_181);
        out.gl_Position.z = _5484;
    }
    if (_169)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _183 = as_type<float>(int(gl_VertexIndex));
    float _185 = in.m_60.x;
    float _187 = in.m_60.y;
    float _189 = in.m_60.z;
    float _191 = in.m_62.x;
    float _193 = in.m_62.y;
    float _195 = in.m_62.z;
    float _197 = in.m_64.x;
    float _199 = in.m_64.y;
    float _201 = in.m_64.z;
    float _203 = in.m_66.x;
    float _205 = in.m_66.y;
    float _207 = in.m_66.z;
    int _209 = as_type<int>(_183) & 1;
    bool _211 = _209 != 0;
    int _213 = as_type<int>(_183) & 2;
    bool _215 = _213 != 0;
    bool _217 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _219 = !_211;
    float _221 = _219 ? (-0.5) : 0.5;
    bool _223 = !_215;
    float _225 = _223 ? (-0.5) : 0.5;
    float _227 = _187 * _193;
    float _229 = _187 * _199;
    float _231 = fma(_185, _191, _227);
    float _233 = _187 * _205;
    float _235 = fma(_185, _197, _229);
    float _237 = fma(_189, _195, _231);
    float _239 = fma(_185, _203, _233);
    float _241 = fma(_189, _201, _235);
    float _243 = fma(_189, _207, _239);
    bool _245 = !_217;
    float _263;
    if (!_245)
    {
        float _247 = in.m_68.x;
        float _249 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _251 = _247 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _253 = fma(_251, (*spvDescriptorSet0.vp_c9)._m0[12].x, _131);
        float _255 = _253 * _249;
        float _257 = floor(_255);
        float _259 = -_257;
        float _261 = _255 + _259;
        _263 = _261;
        _265 = true;
    }
    else
    {
        _263 = _175;
    }
    _265 = false;
    float _267 = _263;
    float _269 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _271 = _267 + _269;
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _275 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _273;
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _279 = _277 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _283 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _281;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _287 = _285 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _289 = 1.0 / _275;
    float _291 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _293 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _291;
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _297 = _295 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _299 = 1.0 / _279;
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _303 = _267 + _301;
    bool _305 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _307 = 1.0 / _283;
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _311 = _267 + _309;
    float _313 = _303 * _289;
    bool _315 = _267 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _317 = isnan(_267);
    bool _319 = _315 || _317;
    bool _321 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _323 = _319 || _321;
    float _325 = float(_323);
    float _327 = 1.0 / _287;
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _331 = _267 + _329;
    float _333 = _311 * _299;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _337 = _267 + _335;
    float _339 = 1.0 / _293;
    float _341 = _271 * _307;
    bool _343 = _267 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _345 = isnan(_267);
    bool _347 = _343 || _345;
    bool _349 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _351 = _347 || _349;
    float _353 = float(_351);
    float _355 = 1.0 / _297;
    float _357 = _331 * _327;
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _361 = _267 + _359;
    float _363 = -_325;
    float _365 = _363 + 1.0;
    float _367 = _353 * _365;
    float _369 = _337 * _339;
    bool _371 = _267 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _373 = isnan(_267);
    bool _375 = _371 || _373;
    bool _377 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _379 = _375 || _377;
    float _381 = float(_379);
    bool _383 = _267 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _385 = isnan(_267);
    bool _387 = _383 || _385;
    bool _389 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _391 = _387 || _389;
    float _393 = float(_391);
    float _395 = _361 * _355;
    float _397 = -_353;
    float _399 = _397 + 1.0;
    bool _401 = _267 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _403 = isnan(_267);
    bool _405 = _401 || _403;
    bool _407 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _409 = _405 || _407;
    float _411 = float(_409);
    float _413 = -_381;
    float _415 = _413 + 1.0;
    float _417 = _381 * _399;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _421 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _419;
    float _423 = -_411;
    float _425 = _423 + 1.0;
    float _427 = _411 * _415;
    float _429 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _431 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _429;
    bool _433 = _267 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _435 = isnan(_267);
    bool _437 = _433 || _435;
    bool _439 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _441 = _437 || _439;
    float _443 = float(_441);
    float _445 = _393 * _425;
    float _447 = -_393;
    float _449 = _447 + 1.0;
    float _451 = fma(_421, _313, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _453 = fma(_431, _313, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _455 = _267 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _457 = isnan(_267);
    bool _459 = _455 || _457;
    bool _461 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _463 = _459 || _461;
    float _465 = float(_463);
    float _467 = -_443;
    float _469 = _467 + 1.0;
    float _471 = _443 * _449;
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _475 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _473;
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _479 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _477;
    float _481 = _465 * _469;
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _485 = _483 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _487 = fma(_475, _341, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _489 = fma(_479, _341, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _491 = _451 * _481;
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _495 = _493 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _497 = _453 * _481;
    float _499 = -_465;
    float _501 = _499 + 1.0;
    float _503 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _505 = _503 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _507 = fma(_485, _333, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _509 = fma(_495, _333, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _511 = fma(_501, (*spvDescriptorSet0.vp_c9)._m0[143].x, _491);
    float _513 = fma(_501, (*spvDescriptorSet0.vp_c9)._m0[143].y, _497);
    float _515 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _517 = _515 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _519 = fma(_507, _471, _511);
    float _521 = fma(_509, _471, _513);
    float _523 = fma(_505, _357, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _525 = fma(_517, _357, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _529 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _527;
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _533 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _531;
    float _535 = fma(_487, _445, _519);
    float _537 = fma(_489, _445, _521);
    float _539 = fma(_529, _369, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _541 = fma(_533, _369, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _543 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _545 = _543 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _547 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _549 = _547 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _551 = fma(_523, _427, _535);
    float _553 = fma(_525, _427, _537);
    float _555 = fma(_545, _395, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _557 = fma(_549, _395, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _559 = fma(_539, _417, _551);
    float _561 = fma(_541, _417, _553);
    float _563 = fma(_555, _367, _559);
    float _565 = fma(_557, _367, _561);
    float _567 = fma(_325, (*spvDescriptorSet0.vp_c9)._m0[149].x, _563);
    float _569 = fma(_325, (*spvDescriptorSet0.vp_c9)._m0[149].y, _565);
    bool _571 = !_305;
    float _589;
    if (!_571)
    {
        float _573 = in.m_68.x;
        float _575 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _577 = _573 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _579 = fma(_577, (*spvDescriptorSet0.vp_c9)._m0[11].y, _131);
        float _581 = _579 * _575;
        float _583 = floor(_581);
        float _585 = -_583;
        float _587 = _581 + _585;
        _589 = _587;
        _591 = true;
    }
    else
    {
        _589 = _175;
    }
    _591 = false;
    float _593 = _589;
    float _595 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _597 = _593 + _595;
    float _599 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _601 = _599 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _603 = _593 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _605 = isnan(_593);
    bool _607 = _603 || _605;
    bool _609 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _611 = _607 || _609;
    float _613 = float(_611);
    float _615 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _617 = _615 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _619 = _593 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _621 = isnan(_593);
    bool _623 = _619 || _621;
    bool _625 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _627 = _623 || _625;
    float _629 = float(_627);
    float _631 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _633 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _631;
    bool _635 = _593 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _637 = isnan(_593);
    bool _639 = _635 || _637;
    bool _641 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _643 = _639 || _641;
    float _645 = float(_643);
    float _647 = 1.0 / _601;
    float _649 = -_613;
    float _651 = _649 + 1.0;
    bool _653 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _655 = _629 * _651;
    float _657 = -_629;
    float _659 = _657 + 1.0;
    float _661 = 1.0 / _617;
    float _663 = _633 * _647;
    float _665 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _667 = _665 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _669 = fma(_663, _597, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _671 = -_645;
    float _673 = _671 + 1.0;
    float _675 = _669 * _655;
    float _677 = _667 * _661;
    float _679 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _681 = _593 + _679;
    float _683 = _613 * _673;
    float _685 = fma(_659, (*spvDescriptorSet0.vp_c9)._m0[115].x, _675);
    float _687 = fma(_677, _681, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _689 = fma(_687, _683, _685);
    float _691 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _693 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _695 = in.m_70.x;
    float _697 = in.m_70.y;
    float _699 = fma(_645, (*spvDescriptorSet0.vp_c9)._m0[117].x, _689);
    float _701 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _703 = _691 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _705 = _693 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _707 = _699 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _709 = _701 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_72.x = _703;
    out.m_72.y = _705;
    out.m_72.z = _709;
    out.m_72.w = _707;
    float _711 = _569 * _697;
    float _713 = _567 * _695;
    bool _715 = !_653;
    float _733;
    if (!_715)
    {
        float _717 = in.m_68.x;
        float _719 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _721 = _717 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _723 = fma(_721, (*spvDescriptorSet0.vp_c9)._m0[11].w, _131);
        float _725 = _723 * _719;
        float _727 = floor(_725);
        float _729 = -_727;
        float _731 = _725 + _729;
        _733 = _731;
        _735 = true;
    }
    else
    {
        _733 = _175;
    }
    _735 = false;
    float _737 = _733;
    float _739 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _741 = _737 + _739;
    float _743 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _745 = _743 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _747 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _749 = _747 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _751 = _737 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _753 = isnan(_737);
    bool _755 = _751 || _753;
    bool _757 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _759 = _755 || _757;
    float _761 = float(_759);
    float _763 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _765 = _763 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _767 = _737 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _769 = isnan(_737);
    bool _771 = _767 || _769;
    bool _773 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _775 = _771 || _773;
    float _777 = float(_775);
    float _779 = 1.0 / _745;
    float _781 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _783 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _781;
    float _785 = -_761;
    float _787 = _785 + 1.0;
    bool _789 = _737 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _791 = isnan(_737);
    bool _793 = _789 || _791;
    bool _795 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _797 = _793 || _795;
    float _799 = float(_797);
    bool _801 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _803 = 1.0 / _749;
    float _805 = 1.0 / _765;
    float _807 = _783 * _779;
    float _809 = -_777;
    float _811 = _809 + 1.0;
    float _813 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _815 = _813 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _817 = _777 * _787;
    float _819 = fma(_807, _741, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _821 = _799 * _811;
    float _823 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _825 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _823;
    float _827 = _815 * _803;
    bool _829 = _737 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _831 = isnan(_737);
    bool _833 = _829 || _831;
    bool _835 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _837 = _833 || _835;
    float _839 = float(_837);
    float _841 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _843 = _737 + _841;
    float _845 = _819 * _821;
    float _847 = -_799;
    float _849 = _847 + 1.0;
    float _851 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _853 = _737 + _851;
    float _855 = fma(_827, _843, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _857 = -_839;
    float _859 = _857 + 1.0;
    float _861 = _825 * _805;
    float _863 = fma(_849, (*spvDescriptorSet0.vp_c9)._m0[131].x, _845);
    float _865 = _761 * _859;
    float _867 = fma(_861, _853, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _869 = fma(_855, _817, _863);
    float _871 = fma(_867, _865, _869);
    float _873 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _875 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _877 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _879 = fma(_839, (*spvDescriptorSet0.vp_c9)._m0[134].x, _871);
    float _881 = _875 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _883 = _873 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _885 = _877 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _887 = _879 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_74.x = _881;
    out.m_74.y = _883;
    out.m_74.z = _885;
    out.m_74.w = _887;
    bool _889 = !_801;
    float _891 = _887;
    float _893 = _803;
    int _895 = as_type<int>(_863);
    float _897 = (*spvDescriptorSet0.vp_c9)._m0[134].x;
    if (!_889)
    {
        float _899 = in.m_68.x;
        float _901 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _903 = _899 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _905 = fma(_903, (*spvDescriptorSet0.vp_c9)._m0[14].x, _131);
        float _907 = _905 * _901;
        float _909 = floor(_907);
        float _911 = -_909;
        float _913 = _907 + _911;
        _177 = _913;
    }
    float _915 = _177;
    float _917 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _919 = int(_917);
    int _921 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _923 = _921 != 0;
    float _925 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _927 = int(_925);
    float _929 = float(_919);
    float _931 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _933 = int(_931);
    if (_923)
    {
        _891 = 1.0;
    }
    float _935 = _891;
    float _937 = _935;
    if (_923)
    {
        _893 = 1.0;
    }
    float _939 = _893;
    float _941 = _939;
    if (_923)
    {
        _895 = 0;
    }
    int _943 = _895;
    float _945 = float(_927);
    float _947 = 1.0 / _929;
    float _949 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _951 = int(_949);
    float _953 = float(uint(_933));
    float _955 = 1.0 / _945;
    float _957 = _947 * _131;
    float _959 = 1.0 / _953;
    float _961 = float(uint(_951));
    int _963 = ~_951;
    int _965 = _963 + 1;
    float _967 = trunc(_957);
    int _969 = int(_967);
    float _971 = _955 * _131;
    float _973 = _955;
    float _975 = _929;
    int _977 = _943;
    if (_923)
    {
        float _979 = in.m_68.x;
        float _981 = in.m_68.y;
        _973 = _979;
        _975 = _981;
    }
    float _983 = _973;
    float _985 = _975;
    float _987 = 1.0 / _961;
    int _989 = as_type<int>(_959) + (-2);
    float _991 = trunc(_971);
    int _993 = int(_991);
    float _995 = float(uint(_969));
    float _997 = as_type<float>(_989) * _995;
    float _999 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _1001 = int(_999);
    int _1003 = as_type<int>(_987) + (-2);
    float _1005 = _987;
    float _1007 = _983;
    float _1009 = _985;
    if (_923)
    {
        _897 = _983;
    }
    float _1011 = _897;
    float _1013 = _1011;
    if (_923)
    {
        _1005 = _985;
    }
    float _1015 = _1005;
    float _1017 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _1019 = int(_1017);
    float _1021 = float(uint(_993));
    float _1023 = as_type<float>(_1003) * _1021;
    float _1025 = trunc(_997);
    float _1027 = precise::max(_1025, 0.0);
    uint _1030 = uint(_1027);
    float _1032 = float(uint(_1001));
    float _1034 = float(_1019);
    float _1036 = 1.0 / _1032;
    float _1038 = 1.0 / _1034;
    int _1040 = as_type<int>(_1032);
    float _1042 = _1034;
    float _1044 = _1023;
    float _1046 = _1015;
    if (_923)
    {
        _1040 = 0;
    }
    int _1048 = _1040;
    float _1050 = trunc(_1023);
    float _1052 = precise::max(_1050, 0.0);
    uint _1054 = uint(_1052);
    int _1056 = _1048;
    if (_923)
    {
        _1042 = _1011;
    }
    float _1058 = _1042;
    float _1060 = _1058;
    if (_923)
    {
        _1044 = _1011;
    }
    float _1062 = _1044;
    float _1064 = _1062;
    if (!_923)
    {
        float _1066 = in.m_68.x;
        float _1068 = in.m_68.y;
        float _1070 = in.m_68.z;
        float _1072 = _1066 * 3.1415927410125732421875;
        float _1074 = _1072 * 0.15915493667125701904296875;
        float _1076 = _1068 * 3.1415927410125732421875;
        float _1078 = _1076 * 0.15915493667125701904296875;
        float _1080 = _1074 * 6.283185482025146484375;
        float _1082 = sin(_1080);
        float _1084 = _1078 * 6.283185482025146484375;
        float _1086 = sin(_1084);
        _941 = 5.839270114898681640625;
        _1060 = _1070;
        _937 = 7.345489978790283203125;
        _1007 = _1066;
        _1013 = _1068;
        _1009 = _1068;
        _1064 = _1082;
        _1046 = _1086;
        _977 = 1;
        _1056 = 2;
    }
    float _1088 = _941;
    float _1090 = _1060;
    float _1092 = _937;
    float _1094 = _1007;
    float _1096 = _1013;
    float _1098 = _1009;
    float _1100 = _1064;
    float _1102 = _1046;
    int _1104 = _977;
    int _1106 = _1056;
    int _1108 = _965 * int(_1054);
    int _1110 = _1108 + _993;
    int _1112 = ~_933;
    int _1114 = _1112 + 1;
    float _1116 = in.m_68.z;
    float _1118 = in.m_68.w;
    float _1120 = _1038 * _131;
    float _1122 = _1088 * _1090;
    float _1124 = float(uint(_1110));
    int _1126 = _1114 * int(_1030);
    int _1128 = _1126 + _969;
    float _1130 = _1092 * _1094;
    float _1132 = floor(_1122);
    float _1134 = _1092 * _1096;
    float _1136 = as_type<float>(_1003) * _1124;
    float _1138 = float(uint(_1128));
    float _1140 = _1094 * 2.0;
    float _1142 = float(_951);
    float _1144 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1146 = _915 + _1144;
    float _1148 = float(_993);
    float _1150 = trunc(_1136);
    float _1152 = precise::max(_1150, 0.0);
    uint _1154 = uint(_1152);
    float _1156 = as_type<float>(_989) * _1138;
    bool _1158 = _1148 >= _1142;
    bool _1160 = isnan(_1148);
    bool _1162 = _1158 || _1160;
    bool _1164 = isnan(_1142);
    bool _1166 = _1162 || _1164;
    float _1168 = float(_1166);
    int _1170 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1172 = _1170 != 0;
    float _1174 = trunc(_1120);
    int _1176 = int(_1174);
    bool _1178 = _1098 > 0.5;
    float _1180 = -_1132;
    float _1182 = _1122 + _1180;
    bool _1184 = _1118 > 0.5;
    bool _1186 = _1116 > 0.5;
    int _1188 = as_type<int>(_1036) + (-2);
    float _1190 = floor(_1130);
    int _1192 = int(_1054) + int(_1154);
    int _1194 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1196 = _1194 != 0;
    int _1198 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1200 = _1198 != 0;
    int _1202 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1204 = _1202 != 0;
    int _1206 = ~_933;
    int _1208 = _1206 + 1;
    int _1210 = ~_951;
    int _1212 = _1210 + 1;
    float _1214 = trunc(_1156);
    float _1216 = precise::max(_1214, 0.0);
    uint _1218 = uint(_1216);
    float _1220 = float(uint(_1176));
    float _1222 = float(_969);
    float _1224 = as_type<float>(_1188) * _1220;
    float _1226 = -_221;
    int _1228 = _1178 ? as_type<int>(_1226) : as_type<int>(_221);
    float _1230 = trunc(_1168);
    int _1232 = int(_1230);
    float _1234 = -_1190;
    float _1236 = _1130 + _1234;
    float _1238 = float(_933);
    int _1240 = _1212 * _1192;
    int _1242 = _1240 + _993;
    int _1244 = int(_1184);
    int _1246 = _1186 ? 2 : 0;
    int _1248 = _1244 | _1246;
    int _1250 = _1172 ? 4 : 0;
    int _1252 = _1248 | _1250;
    int _1254 = _1196 ? 8 : 0;
    int _1256 = _1252 | _1254;
    int _1258 = _1200 ? 16 : 0;
    int _1260 = _1256 | _1258;
    int _1262 = _1204 ? 32 : 0;
    int _1264 = _1260 | _1262;
    int _1266 = _1178 ? 64 : 0;
    int _1268 = _1264 | _1266;
    int _1270 = _1268 & 64;
    bool _1272 = !_1200;
    float _1274 = _1272 ? _221 : as_type<float>(_1228);
    int _1276 = int(_1030) + int(_1218);
    float _1278 = trunc(_1224);
    float _1280 = precise::max(_1278, 0.0);
    uint _1282 = uint(_1280);
    float _1284 = -_225;
    int _1286 = _1186 ? as_type<int>(_1284) : as_type<int>(_225);
    bool _1288 = _1222 >= _1238;
    bool _1290 = isnan(_1222);
    bool _1292 = _1288 || _1290;
    bool _1294 = isnan(_1238);
    bool _1296 = _1292 || _1294;
    float _1298 = float(_1296);
    float _1300 = _1236 * _1142;
    bool _1302 = !_1204;
    float _1304 = _1302 ? _225 : as_type<float>(_1286);
    float _1306 = floor(_1134);
    int _1308 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1310 = _1308 != 0;
    int _1312 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1314 = _1312 != 0;
    int _1316 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1318 = _1316 != 0;
    bool _1320 = !_1172;
    int _1322 = _1320 ? 0 : 1;
    int _1324 = _1208 * _1276;
    int _1326 = _1324 + _969;
    bool _1328 = uint(_1242) >= uint(_951);
    bool _1330 = !_1314;
    int _1332 = _1330 ? 0 : 1;
    float _1334 = trunc(_1300);
    int _1336 = int(_1334);
    bool _1338 = !_1310;
    int _1340 = _1338 ? 0 : 1;
    int _1342 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1344 = _1342 != 0;
    bool _1346 = uint(_1326) >= uint(_933);
    float _1348 = _1182 * _1238;
    bool _1350 = !_1318;
    int _1352 = _1350 ? 0 : 1;
    float _1354 = trunc(_1298);
    int _1356 = int(_1354);
    bool _1358 = !_1344;
    int _1360 = _1358 ? 0 : 1;
    float _1362 = -_1306;
    float _1364 = _1134 + _1362;
    bool _1366 = !_1346;
    int _1368 = _1366 ? 0 : (-1);
    bool _1370 = !_1328;
    int _1372 = _1370 ? 0 : (-1);
    int _1374 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1376 = _1374 != 0;
    int _1378 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1380 = _1378 != 0;
    int _1382 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1384 = _1382 != 0;
    float _1386 = trunc(_1348);
    int _1388 = int(_1386);
    int _1390 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1392 = _1390 != 0;
    int _1394 = ~_1001;
    int _1396 = _1394 + 1;
    int _1398 = ~_1276;
    int _1400 = _1398 + _1368;
    int _1402 = _1400 + 1;
    bool _1404 = !_1392;
    int _1406 = _1404 ? 0 : 1;
    int _1408 = _1396 * int(_1282);
    int _1410 = _1408 + _1176;
    int _1412 = abs(_1322);
    float _1414 = floor(_1140);
    int _1416 = ~_1192;
    int _1418 = _1416 + _1372;
    int _1420 = _1418 + 1;
    int _1422 = _933 * _1402;
    int _1424 = _1422 + _969;
    int _1426 = abs(_1406);
    int _1428 = _1336 * _1412;
    int _1430 = _1428 + _993;
    float _1432 = float(uint(_1410));
    int _1434 = _951 * _1420;
    int _1436 = _1434 + _993;
    float _1438 = _171 * _131;
    bool _1440 = _951 == 0;
    bool _1442 = !_1380;
    int _1444 = _1442 ? 0 : 1;
    float _1446 = _1142 * _1438;
    bool _1448 = _1270 != 0;
    float _1450 = as_type<float>(_1188) * _1432;
    bool _1452 = !_1376;
    int _1454 = _1452 ? 0 : 1;
    float _1456 = _1238 * _1438;
    int _1458 = ~_1232;
    int _1460 = _1458 + 1;
    int _1462 = _1460 + 1;
    float _1464 = trunc(_1446);
    int _1466 = int(_1464);
    bool _1468 = !_1440;
    int _1470 = _1468 ? _1436 : (-1);
    int _1472 = _1388 * _1426;
    int _1474 = _1472 + _969;
    bool _1476 = _933 == 0;
    float _1478 = _1100 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    int _1480 = ~_1356;
    int _1482 = _1480 + 1;
    int _1484 = _1482 + 1;
    int _1486 = _1470 * _1462;
    bool _1488 = !_1476;
    int _1490 = _1488 ? _1424 : (-1);
    float _1492 = trunc(_1450);
    float _1494 = precise::max(_1492, 0.0);
    uint _1496 = uint(_1494);
    int _1498 = _951 + (-1);
    int _1500 = _933 + (-1);
    int _1502 = _1490 * _1484;
    int _1504 = abs(_1332);
    int _1506 = _1232 * _1498;
    int _1508 = _1506 + _1486;
    int _1510 = abs(_1352);
    int _1512 = _1356 * _1500;
    int _1514 = _1512 + _1502;
    int _1516 = abs(_1360);
    int _1518 = _1508 * _1504;
    int _1520 = abs(_1340);
    float _1522 = trunc(_1456);
    int _1524 = int(_1522);
    int _1526 = abs(_1444);
    float _1528 = _1098 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1530 = ~_1001;
    int _1532 = _1530 + 1;
    int _1534 = _1466 * _1520;
    int _1536 = _1534 + _1518;
    int _1538 = _1430 * _1510;
    int _1540 = _1538 + _1536;
    int _1542 = int(_1282) + int(_1496);
    int _1544 = _1336 * _1516;
    int _1546 = _1544 + _1540;
    bool _1548 = !_1384;
    int _1550 = _1548 ? 0 : 1;
    int _1552 = _1514 * _1526;
    int _1554 = abs(_1454);
    int _1556 = _1532 * _1542;
    int _1558 = _1556 + _1176;
    float _1560 = float(uint(_1546));
    float _1562 = -_225;
    int _1564 = _1184 ? as_type<int>(_1562) : as_type<int>(_225);
    int _1566 = _1524 * _1554;
    int _1568 = _1566 + _1552;
    float _1570 = -_221;
    int _1572 = _1186 ? as_type<int>(_1570) : as_type<int>(_221);
    float _1574 = float(_1001);
    float _1576 = float(_1176);
    int _1578 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1580 = _1578 != 0;
    float _1582 = _1574 * _1438;
    int _1584 = abs(_1550);
    float _1586 = as_type<float>(_1003) * _1560;
    bool _1588 = uint(_1558) >= uint(_1001);
    int _1590 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _1592 = _1590 != 0;
    int _1594 = _1474 * _1584;
    int _1596 = _1594 + _1568;
    bool _1598 = _1576 >= _1574;
    bool _1600 = isnan(_1576);
    bool _1602 = _1598 || _1600;
    bool _1604 = isnan(_1574);
    bool _1606 = _1602 || _1604;
    float _1608 = float(_1606);
    float _1610 = trunc(_1582);
    int _1612 = int(_1610);
    bool _1614 = !_1580;
    int _1616 = _1614 ? 0 : 1;
    bool _1618 = !_1196;
    float _1620 = _1618 ? _225 : as_type<float>(_1564);
    bool _1622 = !_1592;
    int _1624 = _1622 ? 0 : 1;
    int _1626 = abs(_1616);
    float _1628 = trunc(_1586);
    float _1630 = precise::max(_1628, 0.0);
    uint _1632 = uint(_1630);
    bool _1634 = !_1588;
    int _1636 = _1634 ? 0 : (-1);
    float _1638 = _1364 * _1574;
    int _1640 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _1642 = _1640 != 0;
    int _1644 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _1646 = _1644 != 0;
    int _1648 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _1650 = _1648 != 0;
    int _1652 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _1654 = _1652 != 0;
    int _1656 = ~_1542;
    int _1658 = _1656 + _1636;
    int _1660 = _1658 + 1;
    float _1662 = trunc(_1608);
    int _1664 = int(_1662);
    int _1666 = ~_951;
    int _1668 = _1666 + 1;
    int _1670 = _1388 * _1626;
    int _1672 = _1670 + _1596;
    bool _1674 = !_1642;
    int _1676 = _1674 ? 0 : 1;
    int _1678 = _1001 * _1660;
    int _1680 = _1678 + _1176;
    bool _1682 = _1001 == 0;
    float _1684 = float(uint(_1672));
    int _1686 = _1668 * int(_1632);
    int _1688 = _1686 + _1546;
    bool _1690 = !_1646;
    int _1692 = _1690 ? 0 : 1;
    float _1694 = trunc(_1638);
    int _1696 = int(_1694);
    int _1698 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1700 = _1698 != 0;
    float _1702 = as_type<float>(_989) * _1684;
    bool _1704 = !_1682;
    int _1706 = _1704 ? _1680 : (-1);
    float _1708 = float(uint(_1688));
    int _1710 = ~_1664;
    int _1712 = _1710 + 1;
    int _1714 = _1712 + 1;
    float _1716 = trunc(_1702);
    float _1718 = precise::max(_1716, 0.0);
    uint _1720 = uint(_1718);
    int _1722 = abs(_1692);
    float _1724 = as_type<float>(_1003) * _1708;
    int _1726 = abs(_1676);
    int _1728 = _1706 * _1714;
    int _1730 = _1001 + (-1);
    float _1732 = _1684;
    float _1734 = as_type<float>(_1104);
    float _1736 = as_type<float>(_1106);
    if (_1700)
    {
        float _1738 = in.m_68.w;
        _1732 = _1738;
    }
    float _1740 = _1732;
    int _1742 = abs(_1624);
    float _1744 = trunc(_1724);
    float _1746 = precise::max(_1744, 0.0);
    uint _1748 = uint(_1746);
    bool _1750 = _951 == 0;
    int _1752 = _1664 * _1730;
    int _1754 = _1752 + _1728;
    int _1756 = _1754 * _1722;
    int _1758 = ~_933;
    int _1760 = _1758 + 1;
    float _1762 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1764 = log2(_1762);
    float _1766 = 0.0;
    float _1768 = as_type<float>(_1742);
    if (!_1700)
    {
        _1766 = _221;
    }
    float _1770 = _1766;
    int _1772 = _1612 * _1726;
    int _1774 = _1772 + _1756;
    int _1776 = _1696 * _1742;
    int _1778 = _1776 + _1176;
    bool _1780 = !_1650;
    int _1782 = _1780 ? 0 : 1;
    int _1784 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1786 = _1784 != 0;
    int _1788 = _1760 * int(_1720);
    int _1790 = _1788 + _1672;
    int _1792 = int(_1632) + int(_1748);
    int _1794 = abs(_1782);
    float _1796 = float(uint(_1790));
    float _1798 = _1770;
    if (_1700)
    {
        float _1800 = _1740 * 3.1415927410125732421875;
        _1768 = _1800;
    }
    float _1802 = _1768;
    int _1804 = ~_951;
    int _1806 = _1804 + 1;
    bool _1808 = !_1654;
    int _1810 = _1808 ? 0 : 1;
    float _1812 = as_type<float>(_989) * _1796;
    int _1814 = _1806 * _1792;
    int _1816 = _1814 + _1546;
    float _1818 = _1802;
    if (_1700)
    {
        float _1820 = _1802 * 0.15915493667125701904296875;
        _1818 = _1820;
    }
    float _1822 = _1818;
    int _1824 = abs(_1810);
    float _1826 = trunc(_1812);
    float _1828 = precise::max(_1826, 0.0);
    uint _1830 = uint(_1828);
    int _1832 = _1778 * _1794;
    int _1834 = _1832 + _1774;
    bool _1836 = uint(_1816) >= uint(_951);
    float _1838 = as_type<float>(_1612);
    if (_1786)
    {
        float _1840 = in.m_68.x;
        _1838 = _1840;
    }
    float _1842 = _1838;
    float _1844 = float(uint(_1430));
    int _1846 = _1696 * _1824;
    int _1848 = _1846 + _1834;
    bool _1850 = !_1836;
    int _1852 = _1850 ? 0 : (-1);
    float _1854 = _1822;
    if (_1700)
    {
        float _1856 = _1822 * 6.283185482025146484375;
        float _1858 = sin(_1856);
        _1854 = _1858;
    }
    float _1860 = _1854;
    float _1862 = as_type<float>(_1003) * _1844;
    int _1864 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1866 = _1864 != 0;
    int _1868 = ~_1792;
    int _1870 = _1868 + _1852;
    int _1872 = _1870 + 1;
    bool _1874 = !_1866;
    float _1876 = _1874 ? _221 : as_type<float>(_1572);
    float _1878 = trunc(_1862);
    float _1880 = precise::max(_1878, 0.0);
    uint _1882 = uint(_1880);
    float _1884 = float(uint(_1848));
    int _1886 = _951 * _1872;
    int _1888 = _1886 + _1546;
    int _1890 = int(_1720) + int(_1830);
    float _1892 = float(uint(_1474));
    float _1894 = as_type<float>(_1188) * _1884;
    bool _1896 = !_1750;
    int _1898 = _1896 ? _1888 : (-1);
    bool _1900 = _1866;
    float _1902 = _1884;
    if (_1700)
    {
        bool _1904 = _1860 > 0.5;
        _1900 = _1904;
    }
    bool _1906 = _1900;
    float _1908 = trunc(_1894);
    float _1910 = precise::max(_1908, 0.0);
    uint _1912 = uint(_1910);
    int _1914 = ~_951;
    int _1916 = _1914 + 1;
    if (_1786)
    {
        float _1918 = _1842 * 3.1415927410125732421875;
        _1902 = _1918;
    }
    float _1920 = _1902;
    float _1922 = _1920;
    if (_1700)
    {
        float _1924 = -_221;
        float _1926 = _1906 ? _1924 : _221;
        _1798 = _1926;
    }
    float _1928 = _1798;
    float _1930 = as_type<float>(_989) * _1892;
    int _1932 = _1898 & 3;
    bool _1934 = _1932 != 0;
    int _1936 = _1916 * int(_1882);
    int _1938 = _1936 + _1430;
    int _1940 = _1898 & 3;
    bool _1942 = _1940 != 0;
    if (_1786)
    {
        float _1944 = _1920 * 0.15915493667125701904296875;
        _1922 = _1944;
    }
    float _1946 = _1922;
    int _1948 = ~_1001;
    int _1950 = _1948 + 1;
    float _1952 = trunc(_1930);
    float _1954 = precise::max(_1952, 0.0);
    uint _1956 = uint(_1954);
    int _1958 = _1934 ? 0 : 1;
    bool _1960 = uint(_1940) > 1u;
    float _1962 = float(uint(_1938));
    float _1964 = _1946;
    if (_1786)
    {
        float _1966 = _1946 * 6.283185482025146484375;
        float _1968 = sin(_1966);
        _1964 = _1968;
    }
    float _1970 = _1964;
    int _1972 = ~_933;
    int _1974 = _1972 + 1;
    float _1976 = as_type<float>(_1003) * _1962;
    float _1978 = -_225;
    int _1980 = _1448 ? as_type<int>(_1978) : as_type<int>(_225);
    int _1982 = _1950 * int(_1912);
    int _1984 = _1982 + _1848;
    int _1986 = ~_1958;
    int _1988 = _1986 + 1;
    int _1990 = _1988 + 1;
    int _1992 = _1974 * _1890;
    int _1994 = _1992 + _1672;
    bool _1996 = uint(_1940) >= 2u;
    float _1998 = trunc(_1976);
    float _2000 = precise::max(_1998, 0.0);
    uint _2002 = uint(_2000);
    float _2004 = float(uint(_1984));
    int _2006 = _1990;
    if (!_1960)
    {
        int _2008 = ~_1958;
        int _2010 = _2008 + 1;
        _2006 = _2010;
    }
    int _2012 = _2006;
    bool _2014 = uint(_1994) >= uint(_933);
    float _2016 = as_type<float>(_1188) * _2004;
    int _2018 = _1996 ? 0 : 1;
    bool _2020 = _1940 != 3;
    bool _2022 = !_2014;
    int _2024 = _2022 ? 0 : (-1);
    float _2026 = trunc(_2016);
    float _2028 = precise::max(_2026, 0.0);
    uint _2030 = uint(_2028);
    int _2032 = ~_933;
    int _2034 = _2032 + 1;
    int _2036 = ~_1890;
    int _2038 = _2036 + _2024;
    int _2040 = _2038 + 1;
    int _2042 = ~_2018;
    int _2044 = _2042 + 1;
    int _2046 = _2044 + 1;
    int _2048 = _2034 * int(_1956);
    int _2050 = _2048 + _1474;
    int _2052 = _933 * _2040;
    int _2054 = _2052 + _1672;
    float _2056 = 0.0;
    int _2058 = _2046;
    bool _2060 = _2020;
    if (!_1786)
    {
        _2056 = _225;
    }
    float _2062 = _2056;
    float _2064 = _2062;
    if (_2020)
    {
        int _2066 = ~_2018;
        int _2068 = _2066 + 1;
        _2058 = _2068;
    }
    int _2070 = _2058;
    if (_1786)
    {
        bool _2072 = _1970 > 0.5;
        _2060 = _2072;
    }
    bool _2074 = _2060;
    float _2076 = float(uint(_2050));
    bool _2078 = !_1476;
    int _2080 = _2078 ? _2054 : (-1);
    int _2082 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2084 = _2082 != 0;
    float _2086 = as_type<float>(_989) * _2076;
    if (_1786)
    {
        float _2088 = -_225;
        float _2090 = _2074 ? _2088 : _225;
        _2064 = _2090;
    }
    float _2092 = _2064;
    int _2094 = _2080 & 3;
    bool _2096 = _2094 != 0;
    bool _2098 = !_2084;
    float _2100 = _2098 ? _225 : as_type<float>(_1980);
    float _2102 = trunc(_2086);
    float _2104 = precise::max(_2102, 0.0);
    uint _2106 = uint(_2104);
    int _2108 = int(_1912) + int(_2030);
    int _2110 = ~_1001;
    int _2112 = _2110 + 1;
    int _2114 = _2080 & 3;
    bool _2116 = _2114 != 0;
    bool _2118 = uint(_2094) > 1u;
    int _2120 = _2112 * _2108;
    int _2122 = _2120 + _1848;
    int _2124 = int(_1882) + int(_2002);
    int _2126 = ~_951;
    int _2128 = _2126 + 1;
    int _2130 = _2116 ? 0 : 1;
    int _2132 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2134 = _2132 != 0;
    int _2136 = _2128 * _2124;
    int _2138 = _2136 + _1430;
    float _2140 = float(uint(_1778));
    bool _2142 = !_2134;
    int _2144 = _2142 ? 0 : 1;
    bool _2146 = uint(_2122) >= uint(_1001);
    float _2148 = as_type<float>(_1188) * _2140;
    int _2150 = ~_2130;
    int _2152 = _2150 + 1;
    int _2154 = _2152 + 1;
    int _2156 = _2154;
    if (!_2118)
    {
        int _2158 = ~_2130;
        int _2160 = _2158 + 1;
        _2156 = _2160;
    }
    int _2162 = _2156;
    bool _2164 = uint(_2138) >= uint(_951);
    bool _2166 = !_2146;
    int _2168 = _2166 ? 0 : (-1);
    float _2170 = trunc(_2148);
    float _2172 = precise::max(_2170, 0.0);
    uint _2174 = uint(_2172);
    bool _2176 = _2094 != 3;
    int _2178 = ~_933;
    int _2180 = _2178 + 1;
    bool _2182 = !_2164;
    int _2184 = _2182 ? 0 : (-1);
    bool _2186 = uint(_2094) >= 2u;
    int _2188 = int(_1956) + int(_2106);
    int _2190 = ~_2108;
    int _2192 = _2190 + _2168;
    int _2194 = _2192 + 1;
    int _2196 = _2186 ? 0 : 1;
    int _2198 = _1001 * _2194;
    int _2200 = _2198 + _1848;
    int _2202 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2204 = _2202 != 0;
    int _2206 = _2180 * _2188;
    int _2208 = _2206 + _1474;
    int _2210 = ~_1001;
    int _2212 = _2210 + 1;
    int _2214 = ~_2196;
    int _2216 = _2214 + 1;
    int _2218 = _2216 + 1;
    int _2220 = _2218;
    float _2222 = as_type<float>(_2180);
    if (_2176)
    {
        int _2224 = ~_2196;
        int _2226 = _2224 + 1;
        _2220 = _2226;
    }
    int _2228 = _2220;
    int _2230 = _2212 * int(_2174);
    int _2232 = _2230 + _1778;
    int _2234 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _2236 = _2234 != 0;
    bool _2238 = !_2204;
    int _2240 = _2238 ? 0 : 1;
    bool _2242 = uint(_2208) >= uint(_933);
    bool _2244 = !_1682;
    int _2246 = _2244 ? _2200 : (-1);
    bool _2248 = !_2236;
    int _2250 = _2248 ? 0 : 1;
    bool _2252 = !_2242;
    int _2254 = _2252 ? 0 : (-1);
    int _2256 = _2246 & 3;
    bool _2258 = _2256 != 0;
    int _2260 = _2246 & 3;
    bool _2262 = _2260 != 0;
    float _2264 = float(uint(_2232));
    int _2266 = _2258 ? 0 : 1;
    bool _2268 = uint(_2260) > 1u;
    float _2270 = as_type<float>(_1188) * _2264;
    int _2272 = ~_2266;
    int _2274 = _2272 + 1;
    int _2276 = _2274 + 1;
    float _2278 = trunc(_2270);
    float _2280 = precise::max(_2278, 0.0);
    uint _2282 = uint(_2280);
    float _2284 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _2286 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _2288 = fma(_1100, (*spvDescriptorSet0.vp_c9)._m0[93].z, _2284);
    int _2290 = _2276;
    float _2292 = _2270;
    if (!_2268)
    {
        int _2294 = ~_2266;
        int _2296 = _2294 + 1;
        _2290 = _2296;
    }
    int _2298 = _2290;
    float _2300 = -_2286;
    float _2302 = fma(_1478, 2.0, _2300);
    bool _2304 = uint(_2260) >= 2u;
    float _2306 = _1102 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    int _2308 = ~_1001;
    int _2310 = _2308 + 1;
    float _2312 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _2314 = _2304 ? 0 : 1;
    float _2316 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _2318 = _2260 != 3;
    float _2320 = fma(_1528, -2.0, _2312);
    int _2322 = int(_2174) + int(_2282);
    float _2324 = -_131;
    float _2326 = fma(_2324, (*spvDescriptorSet0.vp_c9)._m0[91].x, _2302);
    float _2328 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[92].z, _2288);
    int _2330 = ~_2314;
    int _2332 = _2330 + 1;
    int _2334 = _2332 + 1;
    int _2336 = _2310 * _2322;
    int _2338 = _2336 + _1778;
    float _2340 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    int _2342 = _2334;
    float _2344 = as_type<float>(_2338);
    if (_2318)
    {
        int _2346 = ~_2314;
        int _2348 = _2346 + 1;
        _2342 = _2348;
    }
    int _2350 = _2342;
    float _2352 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _2354 = uint(_2338) >= uint(_1001);
    float _2356 = fma(_1102, (*spvDescriptorSet0.vp_c9)._m0[93].w, _2340);
    float _2358 = _1764 * _131;
    float _2360 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _2362 = !_2354;
    int _2364 = _2362 ? 0 : (-1);
    float _2366 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[92].w, _2356);
    bool _2368 = _1094 > 0.5;
    float _2370 = exp2(_2358);
    float _2372 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _2374 = -_221;
    int _2376 = _2368 ? as_type<int>(_2374) : as_type<int>(_221);
    float _2378 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2380 = _915 + _2378;
    bool _2382 = _1104 != 1;
    float _2384 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2386 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2388 = -_2370;
    float _2390 = _2388 + 1.0;
    float _2392 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    if (!_2382)
    {
        _2222 = _1098;
    }
    float _2394 = _2222;
    float _2396 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2398 = _2396 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2400 = 0.0;
    float _2402 = _2394;
    if (!_2382)
    {
        _2400 = _1098;
    }
    float _2404 = _2400;
    float _2406 = fma(_2306, -2.0, _2392);
    float _2408 = _2404;
    if (!_2382)
    {
        _2292 = _1116;
    }
    float _2410 = _2292;
    float _2412 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2320);
    float _2414 = _2410;
    if (!_2382)
    {
        _2344 = _1116;
    }
    float _2416 = _2344;
    float _2418 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[91].y, _2406);
    float _2420 = _2416;
    if (_2382)
    {
        _2402 = _1094;
    }
    float _2422 = _2402;
    float _2424 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2426 = _2424 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    if (_2382)
    {
        _2408 = _1094;
    }
    float _2428 = _2408;
    float _2430 = 1.0 / _2398;
    if (_2382)
    {
        _2414 = _1098;
    }
    float _2432 = _2414;
    float _2434 = _2422 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_2382)
    {
        _2420 = _1098;
    }
    float _2436 = _2420;
    bool _2438 = _1106 != 2;
    float _2440 = -_2316;
    float _2442 = fma(_2434, 2.0, _2440);
    float _2444 = _2432 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2446 = fma(_2436, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2352);
    float _2448 = -_131;
    float _2450 = fma(_2448, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2442);
    float _2452 = fma(_2444, -2.0, _2360);
    float _2454 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2446);
    float _2456 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _2458 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2452);
    float _2460 = 1.0 / _2426;
    if (_2438)
    {
        _1734 = _1094;
    }
    float _2462 = _1734;
    float _2464 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2466 = _2464 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2468 = _2462;
    if (_2438)
    {
        _1736 = _1098;
    }
    float _2470 = _1736;
    float _2472 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2474 = _2472 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2476 = _2470;
    if (!_2438)
    {
        _2468 = _1116;
    }
    float _2478 = _2468;
    float _2480 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2482 = _915 + _2480;
    if (!_2438)
    {
        _2476 = _1094;
    }
    float _2484 = _2476;
    float _2486 = 1.0 / _2466;
    int _2488 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2490 = _2488 != 0;
    float _2492 = _2478 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _2494 = _1094 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _2496 = _2484 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    bool _2498 = !_2490;
    float _2500 = _2498 ? _221 : as_type<float>(_2376);
    float _2502 = in.m_48.x;
    float _2504 = in.m_48.y;
    float _2506 = in.m_48.z;
    bool _2508 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2510 = isnan(0.0);
    bool _2512 = _2508 || _2510;
    bool _2514 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2516 = _2512 || _2514;
    float _2518 = -_2372;
    float _2520 = fma(_2492, 2.0, _2518);
    float _2522 = fma(_2496, -2.0, _2456);
    float _2524 = -_2384;
    float _2526 = fma(_2494, 2.0, _2524);
    float _2528 = _2516 ? _2390 : 0.0;
    float _2530 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2522);
    bool _2532 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2534 = isnan(1.0);
    bool _2536 = _2532 || _2534;
    bool _2538 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2540 = _2536 || _2538;
    float _2542 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2544 = 1.0 + _2542;
    float _2546 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2548 = -_131;
    float _2550 = fma(_2548, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2526);
    float _2552 = 1.0 / _2544;
    float _2554 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2556 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _2558 = fma(_1094, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2546);
    float _2560 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2562 = fma(_1098, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2554);
    float _2564 = fma(_1094, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2556);
    float _2566 = fma(_1098, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2386);
    float _2568 = fma(_2428, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2560);
    float _2570 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2562);
    float _2572 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2558);
    float _2574 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2566);
    float _2576 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2564);
    float _2578 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2568);
    float _2580 = -_131;
    float _2582 = fma(_2580, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2520);
    float _2584 = _193 * _2504;
    if (_2540)
    {
        float _2586 = _2528 * _2552;
        _141 = _2586;
    }
    float _2588 = _141;
    float _2590 = _1098 * 2.0;
    bool _2592 = _1414 >= 0.0;
    bool _2594 = isnan(_1414);
    bool _2596 = _2592 || _2594;
    bool _2598 = isnan(0.0);
    bool _2600 = _2596 || _2598;
    float _2602 = _199 * _2504;
    float _2604 = _205 * _2504;
    float _2606 = floor(_2590);
    int _2608 = _2600 ? 0 : 1;
    float _2610 = fma(_197, _2502, _2602);
    bool _2612 = _1414 > 0.0;
    float _2614 = fma(_203, _2502, _2604);
    float _2616 = fma(_191, _2502, _2584);
    float _2618 = fma(_201, _2506, _2610);
    int _2620 = ~_2608;
    int _2622 = _2620 + 1;
    int _2624 = _2622 + 1;
    float _2626 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2628 = _2626 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2630 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2632 = _2630 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2634 = 1.0 / _2474;
    float _2636 = fma(_207, _2506, _2614);
    float _2638 = fma(_195, _2506, _2616);
    int _2640 = _2624;
    if (!_2612)
    {
        int _2642 = ~_2608;
        int _2644 = _2642 + 1;
        _2640 = _2644;
    }
    int _2646 = _2640;
    float _2648 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2650 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2648;
    bool _2652 = _2606 >= 0.0;
    bool _2654 = isnan(_2606);
    bool _2656 = _2652 || _2654;
    bool _2658 = isnan(0.0);
    bool _2660 = _2656 || _2658;
    float _2662 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2664 = _2662 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2666 = 1.0 / _2628;
    int _2668 = _2660 ? 0 : 1;
    float _2670 = _2650 * _2430;
    bool _2672 = _2606 > 0.0;
    float _2674 = _1116 * 2.0;
    float _2676 = _2664 * _2460;
    int _2678 = ~_2188;
    int _2680 = _2678 + _2254;
    int _2682 = _2680 + 1;
    float _2684 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2686 = _2684 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2688 = 1.0 / _2632;
    float _2690 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2692 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2690;
    float _2694 = _2686 * _2486;
    int _2696 = _933 * _2682;
    int _2698 = _2696 + _1474;
    float _2700 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2702 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2700;
    float _2704 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2706 = _2704 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2708 = floor(_2674);
    float _2710 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2712 = _2710 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _2714 = _2702 * _2634;
    float _2716 = _2706 * _2666;
    bool _2718 = _915 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2720 = isnan(_915);
    bool _2722 = _2718 || _2720;
    bool _2724 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2726 = _2722 || _2724;
    float _2728 = float(_2726);
    float _2730 = fma(_2694, _2482, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    bool _2732 = _915 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2734 = isnan(_915);
    bool _2736 = _2732 || _2734;
    bool _2738 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2740 = _2736 || _2738;
    float _2742 = float(_2740);
    float _2744 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2746 = _915 + _2744;
    float _2748 = _2692 * _2688;
    int _2750 = ~_2668;
    int _2752 = _2750 + 1;
    int _2754 = _2752 + 1;
    float _2756 = 1.0 / _2712;
    bool _2758 = !_1476;
    int _2760 = _2758 ? _2698 : (-1);
    float _2762 = -_2728;
    float _2764 = _2762 + 1.0;
    bool _2766 = !_2096;
    int _2768 = _2766 ? 0 : 1;
    float _2770 = in.m_64.w;
    int _2772 = _2754;
    if (!_2672)
    {
        int _2774 = ~_2668;
        int _2776 = _2774 + 1;
        _2772 = _2776;
    }
    int _2778 = _2772;
    float _2780 = -_2742;
    float _2782 = _2780 + 1.0;
    int _2784 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2786 = _2784 != 0;
    int _2788 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2790 = _2788 != 0;
    int _2792 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2794 = _2792 != 0;
    float _2796 = _2742 * _2764;
    bool _2798 = _2708 >= 0.0;
    bool _2800 = isnan(_2708);
    bool _2802 = _2798 || _2800;
    bool _2804 = isnan(0.0);
    bool _2806 = _2802 || _2804;
    float _2808 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2810 = _915 + _2808;
    bool _2812 = _915 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2814 = isnan(_915);
    bool _2816 = _2812 || _2814;
    bool _2818 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2820 = _2816 || _2818;
    float _2822 = float(_2820);
    float _2824 = fma(_2714, _2746, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    int _2826 = _2080 >> 31;
    float _2828 = fma(_2670, _2810, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    int _2830 = _2806 ? 0 : 1;
    float _2832 = _2822 * _2782;
    bool _2834 = _2708 > 0.0;
    float _2836 = -_2822;
    float _2838 = _2836 + 1.0;
    bool _2840 = _915 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2842 = isnan(_915);
    bool _2844 = _2840 || _2842;
    bool _2846 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2848 = _2844 || _2846;
    float _2850 = float(_2848);
    float _2852 = fma(_2676, _2380, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    int _2854 = _2826 & 3;
    float _2856 = fma(_2748, _1146, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    bool _2858 = _915 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2860 = isnan(_915);
    bool _2862 = _2858 || _2860;
    bool _2864 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2866 = _2862 || _2864;
    float _2868 = float(_2866);
    float _2870 = -_2850;
    float _2872 = _2870 + 1.0;
    int _2874 = _2080 + _2854;
    float _2876 = _2850 * _2838;
    bool _2878 = _915 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2880 = isnan(_915);
    bool _2882 = _2878 || _2880;
    bool _2884 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2886 = _2882 || _2884;
    float _2888 = float(_2886);
    float _2890 = -_2868;
    float _2892 = _2890 + 1.0;
    float _2894 = _2868 * _2872;
    int _2896 = _2874 >> 2;
    float _2898 = _2618 + _2770;
    float _2900 = _2888 * _2892;
    bool _2902 = _915 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2904 = isnan(_915);
    bool _2906 = _2902 || _2904;
    bool _2908 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2910 = _2906 || _2908;
    float _2912 = float(_2910);
    float _2914 = -_2888;
    float _2916 = _2914 + 1.0;
    int _2918 = _2896 << 4;
    int _2920 = _2918 + 656;
    float _2922 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2924 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2922;
    bool _2926 = _915 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2928 = isnan(_915);
    bool _2930 = _2926 || _2928;
    bool _2932 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2934 = _2930 || _2932;
    float _2936 = float(_2934);
    float _2938 = _2912 * _2916;
    float _2940 = -_2912;
    float _2942 = _2940 + 1.0;
    float _2944 = _2924 * _2756;
    uint _2946 = uint(int(uint(_2920) >> uint(2)));
    uint _2948 = uint(int(uint(int(_2946)) >> uint(2)));
    int _2950 = int(_2946) & 3;
    float _2952 = (*spvDescriptorSet0.vp_c9)._m0[int(_2948)][_2950];
    int _2954 = int(_2946) + 1;
    uint _2956 = uint(int(uint(_2954) >> uint(2)));
    int _2958 = _2954 & 3;
    float _2960 = (*spvDescriptorSet0.vp_c9)._m0[int(_2956)][_2958];
    float _2962 = in.m_62.w;
    float _2964 = _2936 * _2942;
    float _2966 = -_2936;
    float _2968 = _2966 + 1.0;
    float _2970 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2972 = _2898 + _2970;
    float _2974 = in.m_66.w;
    float _2976 = _2828 * _2964;
    float _2978 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2980 = _915 + _2978;
    float _2982 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2984 = _915 + _2982;
    int _2986 = abs(_2228);
    float _2988 = fma(_2968, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2976);
    int _2990 = abs(_2240);
    int _2992 = _2920 + 8;
    uint _2994 = uint(int(uint(_2992) >> uint(2)));
    uint _2996 = uint(int(uint(int(_2994)) >> uint(2)));
    int _2998 = int(_2994) & 3;
    float _3000 = (*spvDescriptorSet0.vp_c9)._m0[int(_2996)][_2998];
    int _3002 = int(_2994) + 1;
    uint _3004 = uint(int(uint(_3002) >> uint(2)));
    int _3006 = _3002 & 3;
    float _3008 = (*spvDescriptorSet0.vp_c9)._m0[int(_3004)][_3006];
    float _3010 = fma(_2944, _2984, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _3012 = fma(_2852, _2938, _2988);
    int _3014 = ~_2830;
    int _3016 = _3014 + 1;
    int _3018 = _3016 + 1;
    float _3020 = _1098 + _1116;
    int _3022 = _3018;
    if (!_2834)
    {
        int _3024 = ~_2830;
        int _3026 = _3024 + 1;
        _3022 = _3026;
    }
    int _3028 = _3022;
    float _3030 = _1098 + _1094;
    float _3032 = fma(_2716, _2980, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    bool _3034 = !_2786;
    int _3036 = _3034 ? 0 : 1;
    float _3038 = -_2576;
    float _3040 = _3038 + 1.0;
    float _3042 = _3030 + (-1.0);
    float _3044 = float(_3028);
    float _3046 = _2638 + _2962;
    float _3048 = fma(_2856, _2900, _3012);
    float _3050 = _1094 + _1116;
    int _3052 = abs(_2162);
    float _3054 = _2636 + _2974;
    float _3056 = _1094 + (-0.5);
    float _3058 = fma(_2730, _2894, _3048);
    float _3060 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3062 = _3046 + _3060;
    float _3064 = _2972 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3066 = _1098 + (-0.5);
    float _3068 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _3070 = int(_3068);
    float _3072 = fma(_3062, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3064);
    float _3074 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3076 = _3054 + _3074;
    int _3078 = abs(_2768);
    float _3080 = fma(_2824, _2876, _3058);
    int _3082 = ~_3052;
    int _3084 = _3082 + 1;
    int _3086 = _3084 + 1;
    float _3088 = fma(_3076, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3072);
    float _3090 = fma(_3032, _2832, _3080);
    bool _3092 = !_1942;
    int _3094 = _3092 ? 0 : 1;
    bool _3096 = _2094 != 3;
    float _3098 = fma(_3042, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _3100 = ~_3078;
    int _3102 = _3100 + 1;
    int _3104 = _3102 + 1;
    int _3106 = _3086 * as_type<int>(_2960);
    bool _3108 = !_3096;
    int _3110 = _3108 ? 0 : (-1);
    float _3112 = _2092 + (-0.5);
    bool _3114 = _3088 >= 0.0;
    int _3116 = _3104 * as_type<int>(_2952);
    int _3118 = _3116 + _3106;
    float _3120 = _1928 + 0.5;
    int _3122 = abs(_3110);
    float _3124 = fma(_3010, _2796, _3090);
    int _3126 = ~_2986;
    int _3128 = _3126 + 1;
    int _3130 = _3128 + 1;
    float _3132 = float(uint(_3070));
    float _3134 = fma(_2728, (*spvDescriptorSet0.vp_c9)._m0[166].x, _3124);
    int _3136 = ~_3122;
    int _3138 = _3136 + 1;
    int _3140 = _3138 + 1;
    int _3142 = _3130 * as_type<int>(_3000);
    int _3144 = _3142 + _3118;
    int _3146 = ~_2990;
    int _3148 = _3146 + 1;
    int _3150 = _3148 + 1;
    float _3152 = fma(_3120, (*spvDescriptorSet0.vp_c9)._m0[95].x, _2326);
    float _3154 = 1.0 / _3132;
    int _3156 = _3140 * as_type<int>(_3008);
    int _3158 = _3156 + _3144;
    float _3160 = -_3112;
    float _3162 = -_2418;
    float _3164 = fma(_3160, (*spvDescriptorSet0.vp_c9)._m0[95].y, _3162);
    float _3166 = -_2366;
    float _3168 = _3166 + 1.0;
    float _3170 = _2500 + 0.5;
    int _3172 = _3158 * _3150;
    float _3174 = -_2328;
    float _3176 = _3174 + 1.0;
    float _3178 = _2100 + (-0.5);
    float _3180 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _3182 = _2760 * _2990;
    int _3184 = _3182 + _3172;
    float _3186 = -_3176;
    float _3188 = fma(_3186, _1928, _3152);
    float _3190 = _3176;
    if (_3114)
    {
        _3190 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3192 = _3190;
    float _3194 = fma(_3168, _2092, _3164);
    float _3196 = fma(_3170, (*spvDescriptorSet0.vp_c9)._m0[80].x, _2550);
    float _3198 = float(uint(_3184));
    float _3200 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _3202 = as_type<int>(_3154) + (-2);
    int _3204 = as_type<int>(_3154);
    if (_3114)
    {
        float _3206 = _3192 * 5.0;
        _3204 = as_type<int>(_3206);
    }
    int _3208 = _3204;
    float _3210 = -_3178;
    float _3212 = -_2412;
    float _3214 = fma(_3210, (*spvDescriptorSet0.vp_c9)._m0[80].y, _3212);
    float _3216 = _1620 + (-0.5);
    out.m_76.x = _3188;
    out.m_76.y = _3194;
    float _3218 = as_type<float>(_3202) * _3198;
    int _3220 = ~_3070;
    int _3222 = _3220 + 1;
    float _3224 = _3180 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _3226 = _1876 + 0.5;
    if (_3114)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9939 = as_type<float>(_3208);
        out.gl_Position.z = _9939;
    }
    int _3228 = abs(_3036);
    float _3230 = trunc(_3218);
    float _3232 = precise::max(_3230, 0.0);
    uint _3234 = uint(_3232);
    float _3236 = fma(_3224, _3226, _2450);
    int _3238 = ~_2322;
    int _3240 = _3238 + _2364;
    int _3242 = _3240 + 1;
    out.m_78.x = _3134;
    float _3244 = _3200 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _3246 = abs(_3070);
    int _3248 = _2246 >> 31;
    float _3250 = -_3244;
    float _3252 = -_2458;
    float _3254 = fma(_3250, _3216, _3252);
    float _3256 = _2972 * _2972;
    int _3258 = _1898 >> 31;
    int _3260 = _1001 * _3242;
    int _3262 = _3260 + _1778;
    float _3264 = float(uint(_3246));
    if (_3114)
    {
        out.m_55.x = 0.0;
    }
    int _3266 = _3258 & 3;
    float _3268 = fma(_3062, _3062, _3256);
    int _3270 = _3248 & 3;
    float _3272 = 1.0 / _3264;
    int _3274 = _2246 + _3270;
    float _3276 = _713 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _3278 = _1898 + _3266;
    float _3280 = fma(_3076, _3076, _3268);
    float _3282 = -_2572;
    float _3284 = _3282 + 1.0;
    int _3286 = _3222 * int(_3234);
    int _3288 = _3286 + _3184;
    int _3290 = _3274 >> 2;
    float _3292 = -_2570;
    float _3294 = _3292 + 1.0;
    int _3296 = _3278 >> 2;
    float _3298 = -_3284;
    float _3300 = fma(_2500, _3298, _3196);
    int _3302 = _3290 << 4;
    int _3304 = _3302 + 800;
    float _3306 = -_2578;
    float _3308 = _3306 + 1.0;
    float _3310 = float(uint(_3288));
    float _3312 = fma(_2100, _3294, _3214);
    int _3314 = abs(_3184);
    float _3316 = -_3308;
    float _3318 = fma(_1876, _3316, _3236);
    int _3320 = _3296 << 4;
    int _3322 = _3320 + 368;
    float _3324 = as_type<float>(_3202) * _3310;
    int _3326 = as_type<int>(_3272) + (-2);
    float _3328 = -_2454;
    float _3330 = _3328 + 1.0;
    uint _3332 = uint(int(uint(_3304) >> uint(2)));
    uint _3334 = uint(int(uint(int(_3332)) >> uint(2)));
    int _3336 = int(_3332) & 3;
    float _3338 = (*spvDescriptorSet0.vp_c9)._m0[int(_3334)][_3336];
    int _3340 = int(_3332) + 1;
    uint _3342 = uint(int(uint(_3340) >> uint(2)));
    int _3344 = _3340 & 3;
    float _3346 = (*spvDescriptorSet0.vp_c9)._m0[int(_3342)][_3344];
    float _3348 = float(uint(_3314));
    float _3350 = rsqrt(_3280);
    float _3352 = fma(_1620, _3330, _3254);
    float _3354 = _3276 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _3356 = as_type<float>(_3326) * _3348;
    int _3358 = ~_3246;
    int _3360 = _3358 + 1;
    uint _3362 = uint(int(uint(_3322) >> uint(2)));
    uint _3364 = uint(int(uint(int(_3362)) >> uint(2)));
    int _3366 = int(_3362) & 3;
    float _3368 = (*spvDescriptorSet0.vp_c9)._m0[int(_3364)][_3366];
    int _3370 = int(_3362) + 1;
    uint _3372 = uint(int(uint(_3370) >> uint(2)));
    int _3374 = _3370 & 3;
    float _3376 = (*spvDescriptorSet0.vp_c9)._m0[int(_3372)][_3374];
    float _3378 = float(_3228);
    float _3380 = trunc(_3356);
    float _3382 = precise::max(_3380, 0.0);
    uint _3384 = uint(_3382);
    out.m_80.x = _3300;
    out.m_80.y = _3312;
    out.m_80.z = _3318;
    out.m_80.w = _3352;
    int _3386 = ~_2124;
    int _3388 = _3386 + _2184;
    int _3390 = _3388 + 1;
    float _3392 = _3378 * _3044;
    int _3394 = abs(_2012);
    int _3396 = _3322 + 8;
    uint _3398 = uint(int(uint(_3396) >> uint(2)));
    uint _3400 = uint(int(uint(int(_3398)) >> uint(2)));
    int _3402 = int(_3398) & 3;
    float _3404 = (*spvDescriptorSet0.vp_c9)._m0[int(_3400)][_3402];
    int _3406 = int(_3398) + 1;
    uint _3408 = uint(int(uint(_3406) >> uint(2)));
    int _3410 = _3406 & 3;
    float _3412 = (*spvDescriptorSet0.vp_c9)._m0[int(_3408)][_3410];
    int _3414 = abs(_2298);
    float _3416 = trunc(_3324);
    float _3418 = precise::max(_3416, 0.0);
    uint _3420 = uint(_3418);
    int _3422 = _951 * _3390;
    int _3424 = _3422 + _1430;
    int _3426 = abs(_3094);
    float _3428 = _3354 * _3350;
    int _3430 = ~_3414;
    int _3432 = _3430 + 1;
    int _3434 = _3432 + 1;
    int _3436 = abs(_2144);
    int _3438 = _3304 + 8;
    uint _3440 = uint(int(uint(_3438) >> uint(2)));
    uint _3442 = uint(int(uint(int(_3440)) >> uint(2)));
    int _3444 = int(_3440) & 3;
    float _3446 = (*spvDescriptorSet0.vp_c9)._m0[int(_3442)][_3444];
    int _3448 = int(_3440) + 1;
    uint _3450 = uint(int(uint(_3448) >> uint(2)));
    int _3452 = _3448 & 3;
    float _3454 = (*spvDescriptorSet0.vp_c9)._m0[int(_3450)][_3452];
    int _3456 = _3360 * int(_3384);
    int _3458 = _3456 + _3314;
    float _3460 = _2972 * _3428;
    int _3462 = ~_3070;
    int _3464 = _3462 + 1;
    float _3466 = _3062 * _3428;
    float _3468 = float(uint(_3458));
    float _3470 = -_3460;
    float _3472 = _2972 + _3470;
    bool _3474 = !_2262;
    int _3476 = _3474 ? 0 : 1;
    float _3478 = -_3466;
    float _3480 = _3062 + _3478;
    int _3482 = int(_3234) + int(_3420);
    float _3484 = as_type<float>(_3326) * _3468;
    int _3486 = ~_3394;
    int _3488 = _3486 + 1;
    int _3490 = _3488 + 1;
    float _3492 = _3472 * _3472;
    bool _3494 = _1940 != 3;
    float _3496 = trunc(_3484);
    float _3498 = precise::max(_3496, 0.0);
    uint _3500 = uint(_3498);
    int _3502 = _3464 * _3482;
    int _3504 = _3502 + _3184;
    bool _3506 = _951 == 0;
    float _3508 = _1304 + (-0.5);
    bool _3510 = !_1682;
    int _3512 = _3510 ? _3262 : (-1);
    float _3514 = fma(_3480, _3480, _3492);
    bool _3516 = !_3506;
    int _3518 = _3516 ? _3424 : (-1);
    int _3520 = _3434 * as_type<int>(_3346);
    int _3522 = abs(_3476);
    int _3524 = ~_3522;
    int _3526 = _3524 + 1;
    int _3528 = _3526 + 1;
    int _3530 = ~_3426;
    int _3532 = _3530 + 1;
    int _3534 = _3532 + 1;
    int _3536 = _3490 * as_type<int>(_3376);
    bool _3538 = !_3494;
    int _3540 = _3538 ? 0 : (-1);
    int _3542 = _3528 * as_type<int>(_3338);
    int _3544 = _3542 + _3520;
    bool _3546 = uint(_3504) >= uint(_3070);
    int _3548 = _3534 * as_type<int>(_3368);
    int _3550 = _3548 + _3536;
    int _3552 = ~_3246;
    int _3554 = _3552 + 1;
    int _3556 = int(_3384) + int(_3500);
    bool _3558 = !_3546;
    int _3560 = _3558 ? 0 : (-1);
    int _3562 = abs(_2350);
    int _3564 = _3554 * _3556;
    int _3566 = _3564 + _3314;
    bool _3568 = _2260 != 3;
    int _3570 = ~_3482;
    int _3572 = _3570 + _3560;
    int _3574 = _3572 + 1;
    int _3576 = ~_3562;
    int _3578 = _3576 + 1;
    int _3580 = _3578 + 1;
    int _3582 = abs(_2070);
    bool _3584 = !_3568;
    int _3586 = _3584 ? 0 : (-1);
    int _3588 = _3580 * as_type<int>(_3446);
    int _3590 = _3588 + _3544;
    bool _3592 = uint(_3566) >= uint(_3246);
    int _3594 = _3070 * _3574;
    int _3596 = _3594 + _3184;
    int _3598 = abs(_3540);
    int _3600 = ~_3582;
    int _3602 = _3600 + 1;
    int _3604 = _3602 + 1;
    int _3606 = _3184 ^ _3070;
    int _3608 = abs(_3586);
    int _3610 = _3604 * as_type<int>(_3404);
    int _3612 = _3610 + _3550;
    float _3614 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _3616 = !_3592;
    int _3618 = _3616 ? 0 : (-1);
    int _3620 = ~_3598;
    int _3622 = _3620 + 1;
    int _3624 = _3622 + 1;
    uint _3626 = uint(int(uint(_3606) >> uint(31)));
    bool _3628 = _3070 == 0;
    int _3630 = _3624 * as_type<int>(_3412);
    int _3632 = _3630 + _3612;
    int _3634 = ~_3618;
    int _3636 = _3556 + _3634;
    int _3638 = _3636 + 1;
    int _3640 = ~int(_3626);
    int _3642 = _3640 + 1;
    float _3644 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _3646 = abs(_2250);
    int _3648 = ~_3608;
    int _3650 = _3648 + 1;
    int _3652 = _3650 + 1;
    bool _3654 = !_3628;
    int _3656 = _3654 ? _3596 : (-1);
    int _3658 = _3652 * as_type<int>(_3454);
    int _3660 = _3658 + _3590;
    int _3662 = _3638 ^ _3642;
    int _3664 = ~_3436;
    int _3666 = _3664 + 1;
    int _3668 = _3666 + 1;
    float _3670 = in.m_82.x;
    float _3672 = in.m_82.y;
    float _3674 = in.m_82.z;
    bool _3676 = _3070 == 0;
    int _3678 = ~_3642;
    int _3680 = _3678 + _3662;
    int _3682 = _3680 + 1;
    int _3684 = _3632 * _3668;
    float _3686 = float(_3656);
    float _3688 = _3614 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _3690 = ~_3646;
    int _3692 = _3690 + 1;
    int _3694 = _3692 + 1;
    int _3696 = _3518 * _3436;
    int _3698 = _3696 + _3684;
    bool _3700 = !_3676;
    int _3702 = _3700 ? _3682 : (-1);
    float _3704 = fma(_3688, _3686, _2582);
    float _3706 = _1274 + 0.5;
    int _3708 = _3660 * _3694;
    float _3710 = float(_3702);
    float _3712 = _3644 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _3714 = fma(_3688, _3706, _3704);
    int _3716 = _3512 * _3646;
    int _3718 = _3716 + _3708;
    float _3720 = -_2530;
    float _3722 = fma(_3712, _3710, _3720);
    float _3724 = -_3040;
    float _3726 = fma(_1274, _3724, _3714);
    float _3728 = -_2574;
    float _3730 = _3728 + 1.0;
    float _3732 = _3392 * (-2.0);
    float _3734 = -_3712;
    float _3736 = fma(_3734, _3508, _3722);
    float _3738 = float(_3698);
    float _3740 = float(_3718);
    float _3742 = fma(_1304, _3730, _3736);
    float _3744 = fma(_3732, _3670, _3670);
    float _3746 = _3076 * _3428;
    bool _3748 = !_2790;
    int _3750 = _3748 ? 0 : 1;
    out.m_84.x = _3738;
    float _3752 = fma(_3098, _3732, _3098);
    float _3754 = -_3746;
    float _3756 = _3076 + _3754;
    bool _3758 = !_2794;
    int _3760 = _3758 ? 0 : 1;
    out.m_84.w = _3740;
    int _3762 = abs(_3750);
    out.m_86.x = _3726;
    out.m_86.y = _3742;
    float _3764 = _3674;
    if (_3114)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3766 = -_3460;
    float _3768 = _2898 + _3766;
    float _3770 = float(_2646);
    float _3772 = -_3466;
    float _3774 = _3046 + _3772;
    float _3776 = float(_3762);
    float _3778 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3780 = _3768 + _3778;
    float _3782 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3784 = _3774 + _3782;
    float _3786 = _3020 + (-1.0);
    float _3788 = _3780 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3790 = -_3746;
    float _3792 = _3054 + _3790;
    float _3794 = _3776 * _3770;
    int _3796 = abs(_3760);
    float _3798 = fma(_3784, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3788);
    float _3800 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3802 = _3792 + _3800;
    float _3804 = float(_2778);
    float _3806 = fma(_3786, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _3808 = float(_3796);
    float _3810 = fma(_3802, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3798);
    float _3812 = _3794 * (-2.0);
    float _3814 = fma(_3056, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3744);
    float _3816 = _3808 * _3804;
    float _3818 = fma(_3812, _3672, _3672);
    bool _3820 = _3810 >= 0.0;
    float _3822 = fma(_3806, _3812, _3806);
    float _3824 = _3050 + (-1.0);
    float _3826 = fma(_3066, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3818);
    float _3828 = _3816 * (-2.0);
    float _3830 = fma(_3752, _2588, _3814);
    float _3832 = fma(_3756, _3756, _3514);
    float _3834 = fma(_3822, _2588, _3826);
    float _3836 = _1116 + (-0.5);
    float _3838 = fma(_3824, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3840 = fma(_3828, _3674, _3674);
    float _3842 = _3830 * 0.15915493667125701904296875;
    float _3844 = _3834 * 0.15915493667125701904296875;
    if (_3820)
    {
        _3764 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3846 = _3764;
    float _3848 = fma(_3836, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3840);
    float _3850 = sqrt(_3832);
    float _3852 = fma(_3838, _3828, _3838);
    int _3854 = as_type<int>(_3846);
    if (_3820)
    {
        out.m_55.x = 0.0;
    }
    if (_3820)
    {
        float _3856 = _3846 * 5.0;
        _3854 = as_type<int>(_3856);
    }
    int _3858 = _3854;
    float _3860 = fma(_3852, _2588, _3848);
    float _3862 = _3842 * 6.283185482025146484375;
    float _3864 = sin(_3862);
    if (_3820)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _10863 = as_type<float>(_3858);
        out.gl_Position.z = _10863;
    }
    float _3866 = _3860 * 0.15915493667125701904296875;
    float _3868 = _3842 * 6.283185482025146484375;
    float _3870 = cos(_3868);
    float _3872 = _3844 * 6.283185482025146484375;
    float _3874 = sin(_3872);
    float _3876 = _3844 * 6.283185482025146484375;
    float _3878 = cos(_3876);
    if (_3820)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3880 = _3866 * 6.283185482025146484375;
    float _3882 = cos(_3880);
    float _3884 = _3350 * _3850;
    float _3886 = _711 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3888 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _225);
    float _3890 = _3870 * _3878;
    float _3892 = _3276 * _3884;
    float _3894 = _3884 * _3886;
    float _3896 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _221);
    float _3898 = _3866 * 6.283185482025146484375;
    float _3900 = sin(_3898);
    float _3902 = _3870 * _3874;
    float _3904 = _3888 * _3894;
    float _3906 = _3864 * _3874;
    float _3908 = _3864 * _3878;
    float _3910 = _3896 * _3892;
    float _3912 = _225 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3914 = _3870 * _3882;
    float _3916 = _3878 * _3882;
    float _3918 = _3864 * _3882;
    float _3920 = _3874 * _3882;
    float _3922 = _3914 * _3904;
    float _3924 = _3884 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _3926 = _3924 * 0.5;
    float _3928 = _3918 * _3904;
    float _3930 = fma(_3900, _3890, _3906);
    float _3932 = -_3908;
    float _3934 = fma(_3900, _3902, _3932);
    float _3936 = -_3904;
    float _3938 = _3900 * _3936;
    float _3940 = -_3902;
    float _3942 = fma(_3900, _3908, _3940);
    float _3944 = fma(_3930, _3910, _3922);
    float _3946 = fma(_3900, _3906, _3890);
    float _3948 = fma(_3916, _3910, _3938);
    float _3950 = fma(_3942, _3910, _3928);
    float _3952 = fma(_3934, _3926, _3944);
    float _3954 = fma(_3920, _3926, _3948);
    float _3956 = fma(_3946, _3926, _3950);
    float _3958 = _3952 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3960 = _3952 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3962 = _3952 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3964 = fma(_3954, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3958);
    float _3966 = fma(_3954, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3960);
    float _3968 = fma(_3954, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3962);
    float _3970 = _3930 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3972 = fma(_3956, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3964);
    float _3974 = fma(_3956, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3966);
    float _3976 = _3930 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3978 = fma(_3956, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3968);
    float _3980 = _3972 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _3982 = _3974 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _3984 = fma(_3916, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3976);
    float _3986 = _3978 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _3988 = _3046 + _3980;
    float _3990 = _3054 + _3982;
    float _3992 = _3930 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3994 = fma(_3916, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3970);
    float _3996 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3998 = _3988 + _3996;
    float _4000 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _4002 = _3990 + _4000;
    float _4004 = fma(_3916, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3992);
    float _4006 = _3914 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _4008 = _3998 * _3998;
    float _4010 = _4002 * _4002;
    float _4012 = _3914 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _4014 = _3914 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _4016 = -_3900;
    float _4018 = fma(_4016, (*spvDescriptorSet0.vp_c8)._m0[24].x, _4006);
    float _4020 = _4008 + _4010;
    float _4022 = -_3900;
    float _4024 = fma(_4022, (*spvDescriptorSet0.vp_c8)._m0[25].x, _4012);
    float _4026 = -_3900;
    float _4028 = fma(_4026, (*spvDescriptorSet0.vp_c8)._m0[26].x, _4014);
    float _4030 = fma(_3912, _3912, 1.0);
    float _4032 = sqrt(_4020);
    float _4034 = _3934 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _4036 = _3934 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _4038 = _3934 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _4040 = _2898 + _3986;
    float _4042 = fma(_3920, (*spvDescriptorSet0.vp_c8)._m0[24].x, _4034);
    float _4044 = fma(_3920, (*spvDescriptorSet0.vp_c8)._m0[25].x, _4036);
    float _4046 = fma(_3920, (*spvDescriptorSet0.vp_c8)._m0[26].x, _4038);
    float _4048 = rsqrt(_4030);
    bool _4050 = _4032 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4052 = _3920;
    float _4054 = _4006;
    float _4056 = _4036;
    float _4058 = _4030;
    float _4060 = _4034;
    if (!_4050)
    {
        _4052 = _4010;
    }
    float _4062 = _4052;
    float _4064 = _4062;
    if (!_4050)
    {
        _4054 = _4008;
    }
    float _4066 = _4054;
    float _4068 = _4066;
    if (!_4050)
    {
        _4056 = _3988;
    }
    float _4070 = _4056;
    float _4072 = _4070;
    if (!_4050)
    {
        _4058 = _3990;
    }
    float _4074 = _4058;
    float _4076 = _4074;
    if (!_4050)
    {
        _4060 = _4040;
    }
    float _4078 = _4060;
    bool _4080 = !_4050;
    float _4082 = _4078;
    if (!_4080)
    {
        float _4084 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4086 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _4088 = _4032 + _4086;
        float _4090 = rsqrt(_4020);
        float _4092 = _4088 * _4084;
        float _4094 = _4040 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4096 = _4092 * 0.15915493667125701904296875;
        float _4098 = _4096 * 6.283185482025146484375;
        float _4100 = sin(_4098);
        float _4102 = _4096 * 6.283185482025146484375;
        float _4104 = cos(_4102);
        float _4106 = fma(_4100, _4094, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _4108 = _4090 * _4106;
        float _4110 = _4104 + (-1.0);
        float _4112 = fma(_3998, _4108, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _4114 = fma(_4002, _4108, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _4116 = _4110 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4118 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _4120 = _4112 + _4118;
        float _4122 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _4124 = _4114 + _4122;
        float _4126 = fma(_4040, _4104, _4116);
        float _4128 = _4120 * _4120;
        float _4130 = _4124 * _4124;
        _4082 = _4126;
        _4068 = _4128;
        _4064 = _4130;
        _4072 = _4112;
        _4076 = _4114;
    }
    float _4132 = _4082;
    float _4134 = _4068;
    float _4136 = _4064;
    float _4138 = _4072;
    float _4140 = _4076;
    float _4142 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _4144 = _4132 + _4142;
    float _4146 = fma(_3918, (*spvDescriptorSet0.vp_c8)._m0[24].z, _4018);
    float _4148 = fma(_3918, (*spvDescriptorSet0.vp_c8)._m0[25].z, _4024);
    float _4150 = fma(_3918, (*spvDescriptorSet0.vp_c8)._m0[26].z, _4028);
    float _4152 = fma(_4144, _4144, _4134);
    float _4154 = fma(_3946, (*spvDescriptorSet0.vp_c8)._m0[25].z, _4044);
    float _4156 = fma(_3946, (*spvDescriptorSet0.vp_c8)._m0[24].z, _4042);
    float _4158 = fma(_3946, (*spvDescriptorSet0.vp_c8)._m0[26].z, _4046);
    float _4160 = _4152 + _4136;
    float _4162 = fma(_3942, (*spvDescriptorSet0.vp_c8)._m0[24].z, _4004);
    float _4164 = _3912 * _4048;
    float _4166 = fma(_3942, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3994);
    float _4168 = _221 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _4170 = _3912 * _4146;
    float _4172 = _3912 * _4148;
    float _4174 = fma(_3942, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3984);
    float _4176 = _3912 * _4150;
    float _4178 = -_4156;
    float _4180 = _4164 * _4178;
    float _4182 = -_4154;
    float _4184 = _4164 * _4182;
    float _4186 = -_4158;
    float _4188 = _4164 * _4186;
    float _4190 = sqrt(_4160);
    float _4192 = fma(_4168, _4162, _4170);
    float _4194 = fma(_4168, _4166, _4172);
    float _4196 = fma(_4168, _4174, _4176);
    float _4198 = fma(_4048, _4146, _4180);
    float _4200 = fma(_4048, _4148, _4184);
    float _4202 = fma(_4048, _4150, _4188);
    float _4204 = _4156 + _4192;
    float _4206 = _4154 + _4194;
    float _4208 = _4158 + _4196;
    out.m_88.x = _4162;
    out.m_88.y = _4166;
    out.m_88.z = _4174;
    out.m_90.x = _4198;
    out.m_90.y = _4200;
    out.m_90.z = _4202;
    bool _4210 = _4190 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _4212 = isnan(_4190);
    bool _4214 = _4210 || _4212;
    bool _4216 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _4218 = _4214 || _4216;
    out.m_92.x = _4204;
    out.m_92.y = _4206;
    out.m_92.z = _4208;
    float _4220 = _4194;
    float _4222 = _4202;
    if (!_4218)
    {
        _4220 = 1.0;
    }
    float _4224 = _4220;
    bool _4226 = !_4218;
    float _4228 = _4224;
    if (!_4226)
    {
        bool _4230 = _4190 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _4232 = isnan(_4190);
        bool _4234 = _4230 || _4232;
        bool _4236 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _4238 = _4234 || _4236;
        if (!_4238)
        {
            float _4240 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4242 = _4190 + _4240;
            float _4244 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4246 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _4244;
            float _4248 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _4250 = _4248 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _4252 = 1.0 / _4246;
            float _4254 = _4242 * _4252;
            float _4256 = fma(_4254, _4250, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _4228 = _4256;
            _4258 = true;
        }
        else
        {
            bool _4260 = _4190 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _4262 = isnan(_4190);
            bool _4264 = _4260 || _4262;
            bool _4266 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _4268 = _4264 || _4266;
            if (!_4268)
            {
                float _4270 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4272 = _4190 + _4270;
                float _4274 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4276 = _4274 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _4278 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _4280 = _4278 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _4282 = 1.0 / _4276;
                float _4284 = _4272 * _4282;
                float _4286 = fma(_4284, _4280, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _4228 = _4286;
                _4258 = true;
            }
            else
            {
                _4228 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _4258 = false;
    float _4288 = _4228;
    float _4290 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _4292 = _4132 + _4290;
    float _4294 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _4296 = _4138 + _4294;
    float _4298 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _4300 = _4140 + _4298;
    float _4302 = fma(_4292, _4288, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _4304 = fma(_4296, _4288, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _4306 = -_2898;
    float _4308 = _4306 + _4302;
    float _4310 = fma(_4300, _4288, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _4312 = -_3046;
    float _4314 = _4312 + _4304;
    float _4316 = _4308 * _4308;
    float _4318 = -_3054;
    float _4320 = _4318 + _4310;
    float _4322 = fma(_4314, _4314, _4316);
    float _4324 = fma(_4320, _4320, _4322);
    float _4326 = sqrt(_4324);
    bool _4328 = _4326 > 0.0;
    float _4330 = _4326;
    float _4332 = _4300;
    float _4334 = _4292;
    float _4336 = _4304;
    if (!_4328)
    {
        _4330 = _4304;
    }
    float _4338 = _4330;
    float _4340 = _4338;
    if (!_4328)
    {
        _4332 = _4302;
    }
    float _4342 = _4332;
    float _4344 = _4342;
    if (!_4328)
    {
        _4334 = _4310;
    }
    float _4346 = _4334;
    bool _4348 = !_4328;
    float _4350 = _4346;
    float _4352 = _4346;
    if (!_4348)
    {
        float _4354 = _241 * _241;
        float _4356 = fma(_237, _237, _4354);
        float _4358 = fma(_243, _243, _4356);
        float _4360 = rsqrt(_4324);
        float _4362 = sqrt(_4358);
        float _4364 = _4314 * _4360;
        float _4366 = _4308 * _4360;
        float _4368 = _4320 * _4360;
        bool _4370 = _4362 > 0.0;
        float _4372 = _4360;
        float _4374 = _4362;
        if (!_4370)
        {
            _4372 = _4304;
        }
        float _4376 = _4372;
        _4340 = _4376;
        if (!_4370)
        {
            _4374 = _4302;
        }
        float _4378 = _4374;
        _4344 = _4378;
        if (!_4370)
        {
            _4350 = _4310;
        }
        float _4380 = _4350;
        bool _4382 = !_4370;
        _4352 = _4380;
        if (!_4382)
        {
            float _4384 = rsqrt(_4358);
            float _4386 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _4388 = _241 * _4384;
            float _4390 = _237 * _4384;
            float _4392 = _4366 * _4388;
            float _4394 = _243 * _4384;
            float _4396 = fma(_4364, _4390, _4392);
            float _4398 = _4386 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _4400 = fma(_4368, _4394, _4396);
            float _4402 = _4400 * _4398;
            float _4404 = fma(_237, _4402, _4304);
            float _4406 = fma(_241, _4402, _4302);
            float _4408 = fma(_243, _4402, _4310);
            _4344 = _4406;
            _4340 = _4404;
            _4352 = _4408;
        }
    }
    float _4410 = _4344;
    float _4412 = _4340;
    float _4414 = _4352;
    float _4416 = -_3460;
    float _4418 = _4416 + _4410;
    float _4420 = -_3466;
    float _4422 = _4420 + _4412;
    float _4424 = -_3746;
    float _4426 = _4424 + _4414;
    float _4428 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4430 = _4418 + _4428;
    float _4432 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4434 = _4422 + _4432;
    float _4436 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4438 = _4426 + _4436;
    float _4440 = _4430 * _4430;
    float _4442 = fma(_3792, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4444 = fma(_4434, _4434, _4440);
    float _4446 = fma(_4438, _4438, _4444);
    float _4448 = rsqrt(_4446);
    float _4450 = _4448 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4452 = _4434 * _4450;
    float _4454 = _4438 * _4450;
    float _4456 = _4452 * _4452;
    float _4458 = _4454 * _4454;
    float _4460 = _4456 + _4458;
    float _4462 = sqrt(_4460);
    bool _4464 = _4462 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4466 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4468 = _4462 + _4466;
    float _4470 = _4448;
    float _4472 = _4468;
    float _4474 = _4430;
    float _4476 = _4460;
    if (_4464)
    {
        float _4478 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4470 = _4478;
    }
    float _4480 = _4470;
    float _4482 = _4480;
    if (_4464)
    {
        float _4484 = _4468 * _4480;
        _4472 = _4484;
    }
    float _4486 = _4472;
    if (_4464)
    {
        float _4488 = rsqrt(_4460);
        _4482 = _4488;
    }
    float _4490 = _4482;
    float _4492 = _4490;
    if (_4464)
    {
        float _4494 = _4486 * 0.15915493667125701904296875;
        _4336 = _4494;
    }
    float _4496 = _4336;
    float _4498 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4500 = _4438;
    float _4502 = _4496;
    if (_4464)
    {
        float _4504 = _4496 * 6.283185482025146484375;
        float _4506 = sin(_4504);
        _4500 = _4506;
    }
    float _4508 = _4500;
    float _4510 = precise::max(0.0, _4498);
    float _4512 = _4314;
    float _4514 = _4510;
    if (_4464)
    {
        float _4516 = _4496 * 6.283185482025146484375;
        float _4518 = cos(_4516);
        _4512 = _4518;
    }
    float _4520 = _4512;
    float _4522 = -_4450;
    float _4524 = -_4510;
    float _4526 = fma(_4430, _4522, _4524);
    if (_4464)
    {
        float _4528 = _4526 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4474 = _4528;
    }
    float _4530 = _4474;
    float _4532 = fma(_3774, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _4534 = _4508;
    float _4536 = _4530;
    if (_4464)
    {
        float _4538 = fma(_4508, _4530, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4534 = _4538;
    }
    float _4540 = _4534;
    float _4542 = _4540;
    if (!_4464)
    {
        _4536 = _4454;
    }
    float _4544 = _4536;
    float _4546 = floor(_4532);
    float _4548 = _4544;
    if (!_4464)
    {
        _4502 = _4456;
    }
    float _4550 = _4502;
    float _4552 = _4550;
    if (_4464)
    {
        float _4554 = _4490 * _4540;
        _4222 = _4554;
    }
    float _4556 = _4222;
    if (!_4464)
    {
        _4492 = _4452;
    }
    float _4558 = _4492;
    float _4560 = _4558;
    float _4562 = _4520;
    if (_4464)
    {
        float _4564 = _4520 + (-1.0);
        _4514 = _4564;
    }
    float _4566 = _4514;
    if (_4464)
    {
        float _4568 = _4452 * _4556;
        _4560 = _4568;
    }
    float _4570 = _4560;
    if (!_4464)
    {
        _4542 = _4526;
    }
    float _4572 = _4542;
    float _4574 = _4572;
    if (_4464)
    {
        float _4576 = _4454 * _4556;
        _4548 = _4576;
    }
    float _4578 = _4548;
    if (_4464)
    {
        float _4580 = _4566 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4476 = _4580;
    }
    float _4582 = _4476;
    if (_4464)
    {
        float _4584 = _4570 * _4570;
        _4552 = _4584;
    }
    float _4586 = _4552;
    float _4588 = _4418 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4590 = sqrt(_4446);
    if (_4464)
    {
        float _4592 = fma(_4526, _4520, _4582);
        _4574 = _4592;
    }
    float _4594 = _4574;
    if (!_4464)
    {
        _4562 = _4458;
    }
    float _4596 = _4562;
    float _4598 = _4596;
    if (_4464)
    {
        float _4600 = _4578 * _4578;
        _4598 = _4600;
    }
    float _4602 = _4598;
    float _4604 = fma(_4422, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4588);
    float _4606 = fma(_4594, _4594, _4586);
    float _4608 = _4418 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4610 = _4418 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4612 = _4606 + _4602;
    float _4614 = fma(_4426, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4604);
    float _4616 = _4418 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4618 = fma(_4422, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4608);
    float _4620 = rsqrt(_4612);
    float _4622 = fma(_4422, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4616);
    float _4624 = fma(_4426, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4618);
    float _4626 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4628 = fma(_4590, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4626);
    float _4630 = precise::clamp(_4628, 0.0, 1.0);
    float _4632 = _4614 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4634 = fma(_4426, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4622);
    float _4636 = _4624 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4638 = fma(_4422, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4610);
    float _4640 = -_4630;
    float _4642 = _4640 + 1.0;
    float _4644 = _4634 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4646 = _4636 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4648 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4650 = _4632 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4652 = fma(_4426, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4638);
    float _4654 = fma(_4644, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4646);
    float _4656 = _4620 * _4570;
    float _4658 = abs(_4642);
    float _4660 = log2(_4658);
    float _4662 = -_4650;
    float _4664 = fma(_4662, _4648, 1.0);
    float _4666 = _4652 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4668 = _4620 * _4594;
    float _4670 = _4656 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4672 = _4620 * _4578;
    float _4674 = fma(_4632, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4654);
    float _4676 = -_4546;
    float _4678 = _4532 + _4676;
    float _4680 = -_4670;
    float _4682 = fma(_4668, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4680);
    float _4684 = log2(_4664);
    float _4686 = fma(_4666, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4674);
    float _4688 = _4636 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4690 = -_4672;
    float _4692 = fma(_4690, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4682);
    float _4694 = _4636 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4696 = fma(_4644, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4688);
    float _4698 = fma(_4692, -0.5, 0.5);
    float _4700 = _4660 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4702 = 1.0 / _4686;
    float _4704 = fma(_4692, 0.5, 0.5);
    float _4706 = fma(_4644, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4694);
    float _4708 = fma(_4632, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4696);
    float _4710 = _4668 + 1.0;
    float _4712 = fma(_4632, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4706);
    float _4714 = fma(_4666, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4708);
    float _4716 = exp2(_4700);
    float _4718 = _4684 * 0.693147182464599609375;
    float _4720 = fma(_4666, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4712);
    float _4722 = sqrt(_4698);
    float _4724 = fma(_4704, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4726 = _4720 * _4702;
    float _4728 = fma(_4704, _4724, -0.212114393711090087890625);
    float _4730 = fma(_4726, 0.5, 0.5);
    float _4732 = floor(_4442);
    float _4734 = fma(_4704, _4728, 1.570728778839111328125);
    float _4736 = -_4668;
    float _4738 = fma(_4716, _4710, _4736);
    float _4740 = _4714 * _4702;
    float _4742 = _4718 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4744 = fma(_4738, 0.5, 0.5);
    float _4746 = fma(_4740, -0.5, 0.5);
    float _4748 = _4722 * 0.636619746685028076171875;
    float _4750 = -_4734;
    float _4752 = fma(_4748, _4750, 1.0);
    float _4754 = -_4732;
    float _4756 = _4442 + _4754;
    float2 _12367 = float2(_4678, _4756);
    float _4758 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_12367, float2(0.0), isnan(_12367)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_12367, float2(0.0), isnan(_12367)), level(0.0)).x;
    float3 _12378 = float3(_4730, _4746, _4742);
    float _4760 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_12378, float3(0.0), isnan(_12378)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_12378, float3(0.0), isnan(_12378)), level(0.0)).x;
    float3 _12389 = float3(_4730, _4746, _4742);
    float4 _4763 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_12389, float3(0.0), isnan(_12389)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_12389, float3(0.0), isnan(_12389)), level(0.0)).xyzw;
    float _4765 = _4763.x;
    float _4767 = _4763.y;
    float _4769 = _4763.z;
    float _4771 = _4763.w;
    float2 _12405 = float2(_4752, _4744);
    float3 _4775 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_12405, float2(0.0), isnan(_12405)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_12405, float2(0.0), isnan(_12405)), level(0.0)).xyz;
    float _4777 = _4775.x;
    float _4779 = _4775.y;
    float _4781 = _4775.z;
    float _4783 = _3768 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4785 = _4660 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4787 = fma(_3774, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4783);
    float _4789 = _3768 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _4791 = fma(_3792, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4787);
    float _4793 = fma(_3774, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4789);
    float _4795 = _4791 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4797 = fma(_3792, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4793);
    float _4799 = 1.0 / _4795;
    float _4801 = _4797 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4803 = _4801 + _4795;
    float _4805 = _4803 * _4799;
    float _4807 = _4805 * 0.5;
    float _4809 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _4811 = fma(_4807, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4809);
    float _4813 = 1.0 / _4811;
    float _4815 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4817 = _4813 * _4815;
    float _4819 = in.m_94.x;
    float _4821 = abs(_4817);
    float _4823 = log2(_4821);
    bool _4825 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _4827 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _4829 = _4825 || _4827;
    bool _4831 = isnan(0.5);
    bool _4833 = _4829 || _4831;
    float _4835 = _4823 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _4837 = exp2(_4835);
    float _4839 = fma(_4837, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4841 = precise::clamp(_4839, 0.0, 1.0);
    bool _4843 = _4817 <= 8000.0;
    bool _4845 = isnan(_4817);
    bool _4847 = _4843 || _4845;
    bool _4849 = isnan(8000.0);
    bool _4851 = _4847 || _4849;
    float _4853 = float(_4851);
    float _4855 = fma(_4841, -2.0, 3.0);
    float _4857 = _4841 * _4841;
    float _4859 = _4636 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4861 = _4857 * _4855;
    float _4863 = fma(_4644, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4859);
    float _4865 = -_4861;
    float _4867 = _4865 + 1.0;
    float _4869 = fma(_4632, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4863);
    float _4871 = fma(_4867, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4861);
    float _4873 = fma(_4666, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4869);
    float _4875 = _4720 + _4686;
    float _4877 = exp2(_4785);
    float _4879 = _4853 * _4871;
    float _4881 = _4873 + _4686;
    float _4883 = _4686 * 0.5;
    float _4885 = _4875 * 0.5;
    float _4887 = _4853;
    float _4889 = _4714;
    float _4891 = _4720;
    if (_4833)
    {
        _4887 = 1.0;
    }
    float _4893 = _4887;
    float _4895 = _4881 * 0.5;
    float _4897 = fma(_4714, -0.5, _4883);
    float _4899 = _4893;
    float _4901 = _4767;
    float _4903 = _4765;
    if (!_4833)
    {
        float _4905 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _4907 = _4905 * 0.15915493667125701904296875;
        float _4909 = _4907 * 6.283185482025146484375;
        float _4911 = cos(_4909);
        float _4913 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _4915 = _4913 * 0.15915493667125701904296875;
        float _4917 = _4907 * 6.283185482025146484375;
        float _4919 = sin(_4917);
        float _4921 = 1.0 / _4911;
        float _4923 = _4915 * 6.283185482025146484375;
        float _4925 = cos(_4923);
        float _4927 = _4919 * _4921;
        float _4929 = _4915 * 6.283185482025146484375;
        float _4931 = sin(_4929);
        float _4933 = _4925 * _4927;
        float _4935 = 1.0 / _4933;
        float _4937 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4939 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _4937;
        float _4941 = 1.0 / _4939;
        float _4943 = _4931 * _4935;
        float _4945 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4947 = fma(_4817, _4943, _4945);
        float _4949 = _4947 * _4941;
        float _4951 = precise::clamp(_4949, 0.0, 1.0);
        _4899 = _4951;
    }
    float _4953 = _4899;
    float _4955 = _4879 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _4957 = -_4877;
    float _4959 = _4957 + 1.0;
    float _4961 = -_4758;
    float _4963 = _4961 + 1.0;
    out.m_96.x = _4885;
    out.m_96.y = _4897;
    out.m_96.z = _4895;
    out.m_96.w = _4686;
    float _4965 = _4959 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _4967 = _4963 * _4955;
    float _4969 = precise::clamp(_4967, 0.0, 1.0);
    bool _4971 = _4590 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4973 = isnan(_4590);
    bool _4975 = _4971 || _4973;
    bool _4977 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4979 = _4975 || _4977;
    out.m_98.x = _4422;
    out.m_98.y = _4418;
    out.m_98.z = _4426;
    float _4981 = _4965 * _4760;
    float _4983 = -_4969;
    float _4985 = fma(_4983, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4987 = -_4965;
    float _4989 = _4987 + 1.0;
    float _4991 = _4771 * _4981;
    float _4993 = _4985 * _4819;
    float _4995 = _4781 * _4981;
    out.gl_Position.x = _4720;
    out.gl_Position.y = _4714;
    out.gl_Position.z = _4873;
    out.gl_Position.w = _4686;
    float _4997 = fma(_4777, _4991, _4765);
    float _4999 = fma(_4779, _4991, _4767);
    float _5001 = _4993 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _5003 = _4771 * _4989;
    float _5005 = fma(_4771, _4995, _4769);
    float _5007 = _4989;
    float _5009 = _4991;
    if (!_4979)
    {
        _4901 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _5011 = _4901;
    out.m_100.x = _5001;
    float _5013 = _5011;
    float _5015 = _5011;
    if (!_4979)
    {
        _4903 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _5017 = _4903;
    float _5019 = _5017;
    float _5021 = _5017;
    if (!_4979)
    {
        _5007 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _5023 = _5007;
    out.m_102.x = _4997;
    out.m_102.y = _4999;
    out.m_102.z = _5005;
    out.m_102.w = _5003;
    float _5025 = _4953 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _5027 = _5023;
    float _5029 = _5023;
    if (!_4979)
    {
        _4889 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _5031 = _4889;
    float _5033 = _5031;
    float _5035 = _5031;
    if (!_4979)
    {
        _4891 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _5037 = _4891;
    float _5039 = _5037;
    float _5041 = _5037;
    if (!_4979)
    {
        _5009 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _5043 = _5009;
    bool _5045 = !_4979;
    float _5047 = _5043;
    float _5049 = _5043;
    if (!_5045)
    {
        bool _5051 = _4590 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _5053 = isnan(_4590);
        bool _5055 = _5051 || _5053;
        bool _5057 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _5059 = _5055 || _5057;
        if (!_5059)
        {
            float _5061 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5063 = _4590 + _5061;
            float _5065 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5067 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _5065;
            float _5069 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _5071 = _5069 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _5073 = 1.0 / _5067;
            float _5075 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _5077 = _5075 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _5079 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _5081 = _5079 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _5083 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _5085 = _5083 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _5087 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _5089 = _5087 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _5091 = _5063 * _5073;
            float _5093 = precise::clamp(_5091, 0.0, 1.0);
            float _5095 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _5097 = _5095 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _5099 = fma(_5093, _5071, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _5101 = fma(_5093, _5077, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _5103 = fma(_5093, _5097, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _5105 = fma(_5093, _5081, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _5107 = fma(_5093, _5085, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _5109 = fma(_5093, _5089, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _5029 = _5103;
            _5015 = _5107;
            _5021 = _5101;
            _5035 = _5105;
            _5049 = _5099;
            _5041 = _5109;
            _5111 = true;
        }
        else
        {
            bool _5113 = _4590 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _5115 = isnan(_4590);
            bool _5117 = _5113 || _5115;
            bool _5119 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _5121 = _5117 || _5119;
            if (!_5121)
            {
                _5033 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _5123 = _5033;
            _5035 = _5123;
            if (!_5121)
            {
                _5013 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _5125 = _5013;
            _5015 = _5125;
            if (!_5121)
            {
                _5039 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _5127 = _5039;
            _5041 = _5127;
            if (!_5121)
            {
                _5019 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _5129 = _5019;
            _5021 = _5129;
            if (!_5121)
            {
                _5027 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _5131 = _5027;
            _5029 = _5131;
            if (!_5121)
            {
                _5047 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _5133 = _5047;
            bool _5135 = !_5121;
            _5049 = _5133;
            if (!_5135)
            {
                bool _5137 = _4590 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _5139 = isnan(_4590);
                bool _5141 = _5137 || _5139;
                bool _5143 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _5145 = _5141 || _5143;
                if (!_5145)
                {
                    float _5147 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5149 = _4590 + _5147;
                    float _5151 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5153 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _5151;
                    float _5155 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _5157 = _5155 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _5159 = 1.0 / _5153;
                    float _5161 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _5163 = _5161 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _5165 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _5167 = _5165 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _5169 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _5171 = _5169 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _5173 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _5175 = _5173 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _5177 = _5149 * _5159;
                    float _5179 = precise::clamp(_5177, 0.0, 1.0);
                    float _5181 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _5183 = _5181 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _5185 = fma(_5179, _5157, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _5187 = fma(_5179, _5163, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _5189 = fma(_5179, _5183, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _5191 = fma(_5179, _5167, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _5193 = fma(_5179, _5171, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _5195 = fma(_5179, _5175, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _5029 = _5189;
                    _5015 = _5193;
                    _5021 = _5187;
                    _5035 = _5191;
                    _5049 = _5185;
                    _5041 = _5195;
                    _5111 = true;
                }
                else
                {
                    _5029 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _5015 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _5021 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _5035 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _5049 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _5041 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _5111 = false;
    float _5197 = _5029;
    float _5199 = _5015;
    float _5201 = _5021;
    float _5203 = _5035;
    float _5205 = _5049;
    float _5207 = _5041;
    float _5209 = _5025 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _5211 = fma(_4206, -0.5, 0.5);
    float _5213 = precise::clamp(_5211, 0.0, 1.0);
    float _5215 = -_5197;
    float _5217 = _5199 + _5215;
    float _5219 = -_5201;
    float _5221 = _5203 + _5219;
    out.m_55.x = _5209;
    float _5223 = fma(_5213, _5217, _5197);
    float _5225 = -_5205;
    float _5227 = _5207 + _5225;
    float _5229 = fma(_5213, _5221, _5201);
    float _5231 = _5223 * 0.586610972881317138671875;
    bool _5233 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _5235 = fma(_5213, _5227, _5205);
    out.m_104.x = 0.0;
    float _5237 = fma(_5229, 0.298911988735198974609375, _5231);
    bool _5239 = _4953 > 0.0;
    bool _5241 = isnan(_4953);
    bool _5243 = _5239 || _5241;
    bool _5245 = isnan(0.0);
    bool _5247 = _5243 || _5245;
    float _5249 = fma(_5235, 0.114477999508380889892578125, _5237);
    float _5251 = -_5249;
    float _5253 = _5229 + _5251;
    float _5255 = -_5249;
    float _5257 = _5223 + _5255;
    float _5259 = -_5249;
    float _5261 = _5235 + _5259;
    float _5263 = fma(_5253, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5249);
    float _5265 = fma(_5257, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5249);
    float _5267 = fma(_5261, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5249);
    bool _5269 = !_5233;
    if (!_5269)
    {
        float _5271 = -_4418;
        float _5273 = _5271 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _5275 = -_4422;
        float _5277 = _5275 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _5279 = -_4426;
        float _5281 = _5279 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _5283 = _5273 * _5273;
        float _5285 = fma(_5277, _5277, _5283);
        float _5287 = fma(_5281, _5281, _5285);
        float _5289 = sqrt(_5287);
        float _5291 = rsqrt(_5287);
        float _5293 = -_5289;
        float _5295 = _5293 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _5297 = _5295 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _5299 = precise::clamp(_5297, 0.0, 1.0);
        float _5301 = _5277 * _5291;
        float _5303 = _5273 * _5291;
        float _5305 = abs(_5299);
        float _5307 = log2(_5305);
        float _5309 = _5281 * _5291;
        float _5311 = _5301 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _5313 = _4206 * _5303;
        float _5315 = -_5303;
        float _5317 = -_5311;
        float _5319 = fma(_5315, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5317);
        float _5321 = fma(_4204, _5301, _5313);
        float _5323 = -_5309;
        float _5325 = fma(_5323, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5319);
        float _5327 = fma(_4208, _5309, _5321);
        float _5329 = precise::clamp(_5327, 0.0, 1.0);
        float _5331 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _5333 = _5325 + _5331;
        float _5335 = _5307 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _5337 = _5333 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _5339 = precise::clamp(_5337, 0.0, 1.0);
        float _5341 = exp2(_5335);
        float _5343 = _5341 * _5339;
        float _5345 = _5329 * _5343;
        float _5347 = _5345 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _5349 = _5345 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _5351 = _5345 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_104.x = _5347;
        out.m_104.y = _5349;
        out.m_104.z = _5351;
    }
    out.m_106.x = _5263;
    out.m_106.y = _5265;
    out.m_106.z = _5267;
    if (_5247)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_55.x = 0.0;
    float _5353 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _5353;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}


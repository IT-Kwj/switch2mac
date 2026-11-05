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
    float4 m_58 [[user(locn0)]];
    float4 m_70 [[user(locn1)]];
    float4 m_74 [[user(locn2)]];
    float4 m_47 [[user(locn3)]];
    float4 m_68 [[user(locn4)]];
    float4 m_72 [[user(locn5)]];
    float4 m_76 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_62 [[attribute(1)]];
    float4 m_60 [[attribute(2)]];
    float4 m_64 [[attribute(3)]];
    float4 m_66 [[attribute(4)]];
    float4 m_44 [[attribute(5)]];
    float4 m_49 [[attribute(6)]];
    float4 m_51 [[attribute(7)]];
    float4 m_56 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2038 = false;
    bool _710 = false;
    bool _481 = false;
    bool _277 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _90 = in.m_44.w;
    float _92 = trunc(_90);
    int _95 = int(_92);
    bool _99 = _95 >= 1;
    float _101 = 0.0;
    if (!_99)
    {
        _101 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _103 = _101;
    float _105 = _103;
    if (!_99)
    {
        out.m_47.x = 0.0;
    }
    int _107 = 0;
    if (!_99)
    {
        float _109 = _103 * 5.0;
        _107 = as_type<int>(_109);
    }
    int _111 = _107;
    int _113 = _111;
    if (!_99)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2588 = as_type<float>(_111);
        out.gl_Position.z = _2588;
    }
    if (!_99)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _115 = in.m_49.w;
    bool _117 = _115 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _119 = isnan(_115);
    bool _121 = _117 || _119;
    bool _123 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _125 = _121 || _123;
    float _127 = -_115;
    float _129 = _127 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _131 = _129;
    if (_125)
    {
        float _133 = float(_95);
        _105 = _133;
    }
    float _135 = _105;
    bool _137 = _129 >= _135;
    bool _139 = !_125;
    bool _141 = _137 || _139;
    float _143 = _135;
    if (_141)
    {
        _143 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _145 = _143;
    if (_141)
    {
        out.m_47.x = 0.0;
    }
    if (_141)
    {
        float _147 = _145 * 5.0;
        _113 = as_type<int>(_147);
    }
    int _149 = _113;
    if (_141)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2658 = as_type<float>(_149);
        out.gl_Position.z = _2658;
    }
    if (_141)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _151 = in.m_51.x;
    float _153 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _155 = _129 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _157 = as_type<float>(int(gl_VertexIndex));
    float _159 = _155 * _153;
    float _161 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[20].x, _159);
    int _163 = as_type<int>(_157) & 1;
    bool _165 = _163 != 0;
    int _167 = as_type<int>(_157) & 2;
    bool _169 = _167 != 0;
    float _171 = _161 * 6.283185482025146484375;
    float _173 = floor(_161);
    float _175 = _171 * 0.15915493667125701904296875;
    bool _177 = !_169;
    float _179 = _177 ? (-0.5) : 0.5;
    int _181 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _183 = _181 != 0;
    int _185 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _187 = _185 != 0;
    int _189 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _191 = _189 != 0;
    float _193 = _175 * 6.283185482025146484375;
    float _195 = cos(_193);
    bool _197 = !_165;
    float _199 = _197 ? (-0.5) : 0.5;
    bool _201 = !_183;
    int _203 = _201 ? 0 : 1;
    bool _205 = !_191;
    int _207 = _205 ? 0 : 1;
    int _209 = abs(_203);
    float _211 = -_173;
    float _213 = _161 + _211;
    int _215 = abs(_207);
    float _217 = -_213;
    float _219 = fma(_217, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _221 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _223 = float(_209);
    float _225 = fma(_195, 0.5, 0.5);
    bool _227 = !_187;
    int _229 = _227 ? 0 : 1;
    bool _231 = _213 < 0.5;
    float _233 = float(_231);
    float _235 = abs(_219);
    float _237 = _223 * _235;
    int _239 = abs(_229);
    float _241 = -_225;
    float _243 = fma(_241, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _245 = float(_215);
    float _247 = -_233;
    float _249 = fma(_247, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _251 = float(_239);
    float _253 = fma(_245, _243, _237);
    float _255 = abs(_249);
    float _257 = fma(_251, _255, _253);
    bool _259 = !_221;
    float _275;
    if (!_259)
    {
        float _261 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _263 = _151 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _265 = fma(_263, (*spvDescriptorSet0.vp_c9)._m0[12].x, _129);
        float _267 = _265 * _261;
        float _269 = floor(_267);
        float _271 = -_269;
        float _273 = _267 + _271;
        _275 = _273;
        _277 = true;
    }
    else
    {
        float _279 = float(_95);
        float _281 = 1.0 / _279;
        float _283 = _129 * _281;
        _275 = _283;
    }
    _277 = false;
    float _285 = _275;
    float _287 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _289 = _285 + _287;
    bool _291 = _285 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _293 = isnan(_285);
    bool _295 = _291 || _293;
    bool _297 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _299 = _295 || _297;
    float _301 = float(_299);
    float _303 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _305 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _303;
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _309 = _307 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _313 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _311;
    float _315 = 1.0 / _305;
    bool _317 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _319 = 1.0 / _309;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _323 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _321;
    float _325 = 1.0 / _313;
    float _327 = _289 * _315;
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _331 = _285 + _329;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _335 = _285 + _333;
    float _337 = fma(_323, _327, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _339 = _331 * _319;
    bool _341 = _285 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _343 = isnan(_285);
    bool _345 = _341 || _343;
    bool _347 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _349 = _345 || _347;
    float _351 = float(_349);
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _355 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _353;
    float _357 = -_351;
    float _359 = _357 + 1.0;
    float _361 = fma(_355, _327, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _363 = _335 * _325;
    float _365 = -_301;
    float _367 = _365 + 1.0;
    bool _369 = _285 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _371 = isnan(_285);
    bool _373 = _369 || _371;
    bool _375 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _377 = _373 || _375;
    float _379 = float(_377);
    float _381 = _351 * _367;
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _385 = _383 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _387 = _379 * _359;
    float _389 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _391 = -_379;
    float _393 = _391 + 1.0;
    bool _395 = _285 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _397 = isnan(_285);
    bool _399 = _395 || _397;
    bool _401 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _403 = _399 || _401;
    float _405 = float(_403);
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _409 = _407 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _411 = fma(_385, _339, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _413 = _389 * _151;
    float _415 = _405 * _393;
    float _417 = fma(_409, _339, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _419 = -_405;
    float _421 = _419 + 1.0;
    float _423 = _337 * _415;
    float _425 = _361 * _415;
    float _427 = trunc(_413);
    int _429 = int(_427);
    float _431 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _433 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _431;
    float _435 = fma(_421, (*spvDescriptorSet0.vp_c9)._m0[143].x, _423);
    float _437 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _439 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _437;
    float _441 = fma(_421, (*spvDescriptorSet0.vp_c9)._m0[143].y, _425);
    float _443 = fma(_433, _363, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _445 = fma(_417, _387, _435);
    float _447 = fma(_439, _363, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _449 = fma(_411, _387, _441);
    float _451 = fma(_443, _381, _445);
    float _453 = fma(_447, _381, _449);
    float _455 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[146].x, _451);
    float _457 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[146].y, _453);
    int _459 = _429 << 4;
    int _461 = _459 + 1712;
    bool _463 = !_317;
    float _479;
    if (!_463)
    {
        float _465 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _467 = _151 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _469 = fma(_467, (*spvDescriptorSet0.vp_c9)._m0[11].y, _129);
        float _471 = _469 * _465;
        float _473 = floor(_471);
        float _475 = -_473;
        float _477 = _471 + _475;
        _479 = _477;
        _481 = true;
    }
    else
    {
        float _483 = float(_95);
        float _485 = 1.0 / _483;
        float _487 = _129 * _485;
        _479 = _487;
    }
    _481 = false;
    float _489 = _479;
    uint _492 = uint(int(uint(_461) >> uint(2)));
    uint _494 = uint(int(uint(int(_492)) >> uint(2)));
    int _496 = int(_492) & 3;
    float _498 = (*spvDescriptorSet0.vp_c9)._m0[int(_494)][_496];
    int _500 = int(_492) + 1;
    uint _502 = uint(int(uint(_500) >> uint(2)));
    int _504 = _500 & 3;
    float _506 = (*spvDescriptorSet0.vp_c9)._m0[int(_502)][_504];
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _510 = _508 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _514 = _512 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _516 = _489 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _518 = isnan(_489);
    bool _520 = _516 || _518;
    bool _522 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _524 = _520 || _522;
    float _526 = float(_524);
    int _528 = _461 + 8;
    uint _530 = uint(int(uint(_528) >> uint(2)));
    uint _532 = uint(int(uint(int(_530)) >> uint(2)));
    int _534 = int(_530) & 3;
    float _536 = (*spvDescriptorSet0.vp_c9)._m0[int(_532)][_534];
    float _538 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _540 = _538 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _542 = 1.0 / _510;
    bool _544 = _489 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _546 = isnan(_489);
    bool _548 = _544 || _546;
    bool _550 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _552 = _548 || _550;
    float _554 = float(_552);
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _558 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _556;
    float _560 = -_526;
    float _562 = _560 + 1.0;
    bool _564 = _489 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _566 = isnan(_489);
    bool _568 = _564 || _566;
    bool _570 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _572 = _568 || _570;
    float _574 = float(_572);
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _578 = _576 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _580 = _554 * _562;
    float _582 = 1.0 / _514;
    float _584 = -_554;
    float _586 = _584 + 1.0;
    bool _588 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _590 = _574 * _586;
    float _592 = -_574;
    float _594 = _592 + 1.0;
    float _596 = 1.0 / _540;
    float _598 = _558 * _542;
    float _600 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _602 = _489 + _600;
    float _604 = fma(_598, _602, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _606 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _608 = _489 + _606;
    float _610 = _578 * _582;
    bool _612 = _489 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _614 = isnan(_489);
    bool _616 = _612 || _614;
    bool _618 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _620 = _616 || _618;
    float _622 = float(_620);
    float _624 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _626 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _624;
    float _628 = _604 * _590;
    float _630 = fma(_610, _608, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _634 = _489 + _632;
    float _636 = -_622;
    float _638 = _636 + 1.0;
    float _640 = fma(_594, (*spvDescriptorSet0.vp_c9)._m0[115].x, _628);
    float _642 = _626 * _596;
    float _644 = _526 * _638;
    float _646 = fma(_630, _580, _640);
    float _648 = fma(_642, _634, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _650 = _498 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _652 = _506 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _654 = fma(_648, _644, _646);
    float _656 = _650 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _658 = _652 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _660 = fma(_622, (*spvDescriptorSet0.vp_c9)._m0[118].x, _654);
    float _662 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _664 = _536 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _666 = in.m_56.x;
    float _668 = in.m_56.y;
    float _670 = _660 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _672 = _664 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _674 = _662 * _151;
    out.m_58.x = _656;
    out.m_58.y = _658;
    out.m_58.z = _672;
    out.m_58.w = _670;
    float _676 = trunc(_674);
    int _678 = int(_676);
    float _680 = _457 * _668;
    float _682 = _455 * _666;
    int _684 = _678 << 4;
    int _686 = _684 + 1968;
    bool _688 = !_588;
    float _706;
    float _708;
    if (!_688)
    {
        float _690 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _692 = _151 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _694 = float(_95);
        float _696 = fma(_692, (*spvDescriptorSet0.vp_c9)._m0[11].w, _129);
        float _698 = _696 * _690;
        float _700 = floor(_698);
        float _702 = -_700;
        float _704 = _698 + _702;
        _706 = _694;
        _708 = _704;
        _710 = true;
    }
    else
    {
        float _712 = float(_95);
        float _714 = 1.0 / _712;
        float _716 = _129 * _714;
        _706 = _712;
        _708 = _716;
    }
    _710 = false;
    float _718 = _706;
    float _720 = _708;
    float _722 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _724 = int(_722);
    float _726 = in.m_44.x;
    float _728 = in.m_44.y;
    float _730 = in.m_44.z;
    float _732 = _257 * _682;
    float _734 = _257 * _680;
    float _736 = in.m_60.x;
    float _738 = in.m_60.y;
    float _740 = in.m_60.z;
    float _742 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _179);
    float _744 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _746 = int(_744);
    float _748 = in.m_62.x;
    float _750 = in.m_62.y;
    float _752 = in.m_62.z;
    int _754 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _756 = _754 != 0;
    float _758 = _734 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _760 = in.m_51.y;
    int _762 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _764 = _762 != 0;
    int _766 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _768 = _766 != 0;
    int _770 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _772 = _770 != 0;
    float _774 = float(_724);
    float _776 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _778 = log2(_776);
    float _780 = in.m_64.x;
    float _782 = in.m_64.y;
    float _784 = in.m_64.z;
    bool _786 = _151 > 0.5;
    bool _788 = !_756;
    float _790 = _788 ? 7.345489978790283203125 : 1.0;
    int _792 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _794 = _792 != 0;
    float _796 = 1.0 / _774;
    float _798 = float(uint(_746));
    int _800 = ~_746;
    int _802 = _800 + 1;
    float _804 = _728 * _738;
    bool _806 = !_768;
    int _808 = _806 ? 0 : 1;
    int _810 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _812 = _810 != 0;
    float _814 = 1.0 / _798;
    float _816 = fma(_726, _736, _804);
    float _818 = _151 * 2.0;
    float _820 = _728 * _750;
    float _822 = _778 * _129;
    int _824 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _826 = _824 != 0;
    float _828 = _760 * 2.0;
    float _830 = fma(_726, _748, _820);
    float _832 = _796 * _129;
    float _834 = _728 * _782;
    float _836 = exp2(_822);
    float _838 = _151 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _840 = fma(_726, _780, _834);
    float _842 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _844 = as_type<int>(_814) + (-2);
    float _846 = fma(_730, _740, _816);
    float _848 = trunc(_832);
    int _850 = int(_848);
    float _852 = -_842;
    float _854 = fma(_838, 2.0, _852);
    bool _856 = !_764;
    int _858 = _856 ? 0 : 1;
    float _860 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _862 = _760 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _864 = !_772;
    int _866 = _864 ? 0 : 1;
    float _868 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _870 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _872 = isnan(0.0);
    bool _874 = _870 || _872;
    bool _876 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _878 = _874 || _876;
    float _880 = floor(_818);
    float _882 = fma(_862, -2.0, _860);
    float _884 = -_836;
    float _886 = _884 + 1.0;
    float _888 = fma(_760, (*spvDescriptorSet0.vp_c9)._m0[78].w, _868);
    float _890 = -_129;
    float _892 = fma(_890, (*spvDescriptorSet0.vp_c9)._m0[76].x, _854);
    float _894 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[76].y, _882);
    float _896 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _898 = float(uint(_850));
    float _900 = floor(_828);
    float _902 = fma(_730, _752, _830);
    float _904 = _878 ? _886 : 0.0;
    float _906 = as_type<float>(_844) * _898;
    float _908 = -_199;
    int _910 = _786 ? as_type<int>(_908) : as_type<int>(_199);
    float _912 = _902 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _914 = _880 > 0.0;
    float _916 = 1.0 / _718;
    bool _918 = _880 >= 0.0;
    bool _920 = isnan(_880);
    bool _922 = _918 || _920;
    bool _924 = isnan(0.0);
    bool _926 = _922 || _924;
    float _928 = _846 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _930 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _932 = isnan(1.0);
    bool _934 = _930 || _932;
    bool _936 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _938 = _934 || _936;
    float _940 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _942 = 1.0 + _940;
    float _944 = float(_746);
    bool _946 = !_794;
    float _948 = _946 ? _199 : as_type<float>(_910);
    float _950 = trunc(_906);
    float _952 = precise::max(_950, 0.0);
    uint _954 = uint(_952);
    int _956 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _958 = _956 != 0;
    float _960 = _944 * _129;
    float _962 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _199);
    int _964 = _926 ? 0 : 1;
    float _966 = 1.0 / _942;
    float _968 = _960 * _916;
    int _970 = _802 * int(_954);
    int _972 = _970 + _850;
    float _974 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].w, _888);
    bool _976 = !_812;
    int _978 = _976 ? 0 : 1;
    float _980 = trunc(_968);
    int _982 = int(_980);
    float _984 = float(uint(_972));
    float _986 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[78].z, _896);
    int _988 = abs(_978);
    float _990 = as_type<float>(_844) * _984;
    float _992 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].z, _986);
    float _994 = _928;
    if (_938)
    {
        float _996 = _904 * _966;
        _131 = _996;
    }
    float _998 = _131;
    float _1000 = _732 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1002 = trunc(_990);
    float _1004 = precise::max(_1002, 0.0);
    uint _1006 = uint(_1004);
    int _1008 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1010 = _1008 != 0;
    int _1012 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1014 = _1012 != 0;
    int _1016 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1018 = _1016 != 0;
    float _1020 = _790 * _151;
    int _1022 = ~_746;
    int _1024 = _1022 + 1;
    float _1026 = _1000 * _962;
    float _1028 = float(_850);
    float _1030 = in.m_51.z;
    bool _1032 = !_958;
    int _1034 = _1032 ? 0 : 1;
    float _1036 = floor(_1020);
    int _1038 = int(_954) + int(_1006);
    bool _1040 = _1028 >= _944;
    bool _1042 = isnan(_1028);
    bool _1044 = _1040 || _1042;
    bool _1046 = isnan(_944);
    bool _1048 = _1044 || _1046;
    float _1050 = float(_1048);
    float _1052 = _758 * _742;
    float _1054 = fma(_730, _784, _840);
    int _1056 = _1024 * _1038;
    int _1058 = _1056 + _850;
    float _1060 = -_1036;
    float _1062 = _1020 + _1060;
    float _1064 = _151 + _760;
    float _1066 = trunc(_1050);
    int _1068 = int(_1066);
    float _1070 = _1062 * _944;
    bool _1072 = uint(_1058) >= uint(_746);
    float _1074 = _1064 + (-1.0);
    float _1076 = _1030 * 2.0;
    int _1078 = ~_964;
    int _1080 = _1078 + 1;
    int _1082 = _1080 + 1;
    float _1084 = _1054 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1086 = !_1072;
    int _1088 = _1086 ? 0 : (-1);
    float _1090 = fma(_1074, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1092 = _900 >= 0.0;
    bool _1094 = isnan(_900);
    bool _1096 = _1092 || _1094;
    bool _1098 = isnan(0.0);
    bool _1100 = _1096 || _1098;
    float _1102 = trunc(_1070);
    int _1104 = int(_1102);
    int _1106 = ~_1038;
    int _1108 = _1106 + _1088;
    int _1110 = _1108 + 1;
    int _1112 = _1100 ? 0 : 1;
    bool _1114 = _746 == 0;
    int _1116 = _746 * _1110;
    int _1118 = _1116 + _850;
    int _1120 = ~_1068;
    int _1122 = _1120 + 1;
    int _1124 = _1122 + 1;
    int _1126 = _1082;
    if (!_914)
    {
        int _1128 = ~_964;
        int _1130 = _1128 + 1;
        _1126 = _1130;
    }
    int _1132 = _1126;
    bool _1134 = !_1114;
    int _1136 = _1134 ? _1118 : (-1);
    float _1138 = floor(_1076);
    int _1140 = abs(_808);
    int _1142 = _746 + (-1);
    int _1144 = _1136 * _1124;
    bool _1146 = _900 > 0.0;
    int _1148 = _1068 * _1142;
    int _1150 = _1148 + _1144;
    int _1152 = abs(_858);
    int _1154 = _1150 * _1140;
    int _1156 = ~_1112;
    int _1158 = _1156 + 1;
    int _1160 = _1158 + 1;
    int _1162 = _1104 * _988;
    int _1164 = _1162 + _850;
    int _1166 = abs(_866);
    int _1168 = _982 * _1152;
    int _1170 = _1168 + _1154;
    int _1172 = _1160;
    if (!_1146)
    {
        int _1174 = ~_1112;
        int _1176 = _1174 + 1;
        _1172 = _1176;
    }
    int _1178 = _1172;
    float _1180 = _760 + _1030;
    bool _1182 = _1138 >= 0.0;
    bool _1184 = isnan(_1138);
    bool _1186 = _1182 || _1184;
    bool _1188 = isnan(0.0);
    bool _1190 = _1186 || _1188;
    int _1192 = _1164 * _1166;
    int _1194 = _1192 + _1170;
    int _1196 = abs(_1034);
    float _1198 = _1180 + (-1.0);
    int _1200 = _1190 ? 0 : 1;
    bool _1202 = _1138 > 0.0;
    int _1204 = _1104 * _1196;
    int _1206 = _1204 + _1194;
    bool _1208 = !_1014;
    int _1210 = _1208 ? 0 : 1;
    float _1212 = float(uint(_1206));
    float _1214 = fma(_1198, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1216 = abs(_1210);
    bool _1218 = !_1018;
    int _1220 = _1218 ? 0 : 1;
    float _1222 = as_type<float>(_844) * _1212;
    bool _1224 = !_1010;
    int _1226 = _1224 ? 0 : 1;
    int _1228 = ~_1200;
    int _1230 = _1228 + 1;
    int _1232 = _1230 + 1;
    int _1234 = _1232;
    if (!_1202)
    {
        int _1236 = ~_1200;
        int _1238 = _1236 + 1;
        _1234 = _1238;
    }
    int _1240 = _1234;
    float _1242 = trunc(_1222);
    float _1244 = precise::max(_1242, 0.0);
    uint _1246 = uint(_1244);
    int _1248 = abs(_1220);
    int _1250 = abs(_1226);
    float _1252 = float(_1132);
    float _1254 = in.m_66.x;
    float _1256 = in.m_66.y;
    float _1258 = in.m_66.z;
    float _1260 = float(_1216);
    int _1262 = ~_746;
    int _1264 = _1262 + 1;
    float _1266 = _1260 * _1252;
    float _1268 = float(_1250);
    float _1270 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1272 = _1270 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1274 = float(_1248);
    int _1276 = _1264 * int(_1246);
    int _1278 = _1276 + _1206;
    float _1280 = float(_1178);
    float _1282 = float(_1240);
    float _1284 = 1.0 / _1272;
    float _1286 = _1274 * _1280;
    float _1288 = _1266 * (-2.0);
    float _1290 = _1268 * _1282;
    bool _1292 = _760 > 0.5;
    float _1294 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1296 = _1294 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1298 = float(uint(_1164));
    float _1300 = _760 + (-0.5);
    float _1302 = float(uint(_1278));
    float _1304 = fma(_1288, _1256, _1256);
    float _1306 = fma(_1214, _1288, _1214);
    float _1308 = as_type<float>(_844) * _1298;
    float _1310 = _1290 * (-2.0);
    float _1312 = fma(_1300, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1304);
    float _1314 = as_type<float>(_844) * _1302;
    float _1316 = fma(_1090, _1310, _1090);
    float _1318 = fma(_1306, _998, _1312);
    float _1320 = trunc(_1314);
    float _1322 = precise::max(_1320, 0.0);
    uint _1324 = uint(_1322);
    float _1326 = _151 + (-0.5);
    float _1328 = _151 + _1030;
    float _1330 = _1318 * 0.15915493667125701904296875;
    float _1332 = fma(_1310, _1254, _1254);
    float _1334 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1336 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1334;
    float _1338 = _1328 + (-1.0);
    float _1340 = _1286 * (-2.0);
    float _1342 = 1.0 / _1296;
    float _1344 = fma(_1326, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1332);
    float _1346 = _1336 * _1284;
    float _1348 = fma(_1340, _1258, _1258);
    float _1350 = _1030 + (-0.5);
    float _1352 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1354 = _1352 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1356 = fma(_1316, _998, _1344);
    int _1358 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1360 = _1358 != 0;
    float _1362 = trunc(_1308);
    float _1364 = precise::max(_1362, 0.0);
    uint _1366 = uint(_1364);
    float _1368 = fma(_1350, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1348);
    int _1370 = int(_1246) + int(_1324);
    float _1372 = _1356 * 0.15915493667125701904296875;
    int _1374 = ~_746;
    int _1376 = _1374 + 1;
    bool _1378 = _720 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1380 = isnan(_720);
    bool _1382 = _1378 || _1380;
    bool _1384 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1386 = _1382 || _1384;
    float _1388 = float(_1386);
    float _1390 = _1330 * 6.283185482025146484375;
    float _1392 = sin(_1390);
    int _1394 = _1376 * _1370;
    int _1396 = _1394 + _1206;
    float _1398 = -_1388;
    float _1400 = _1398 + 1.0;
    float _1402 = fma(_1338, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1404 = _1330 * 6.283185482025146484375;
    float _1406 = cos(_1404);
    float _1408 = fma(_1402, _1340, _1402);
    float _1410 = _1354 * _1342;
    bool _1412 = _720 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1414 = isnan(_720);
    bool _1416 = _1412 || _1414;
    bool _1418 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1420 = _1416 || _1418;
    float _1422 = float(_1420);
    float _1424 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1426 = _720 + _1424;
    float _1428 = fma(_1408, _998, _1368);
    bool _1430 = _720 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1432 = isnan(_720);
    bool _1434 = _1430 || _1432;
    bool _1436 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1438 = _1434 || _1436;
    float _1440 = float(_1438);
    float _1442 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1444 = _720 + _1442;
    float _1446 = -_1422;
    float _1448 = _1446 + 1.0;
    float _1450 = _1428 * 0.15915493667125701904296875;
    float _1452 = -_179;
    int _1454 = _1292 ? as_type<int>(_1452) : as_type<int>(_179);
    float _1456 = fma(_1346, _1426, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1458 = _1388 * _1448;
    float _1460 = _1440 * _1400;
    bool _1462 = !_826;
    float _1464 = _1462 ? _179 : as_type<float>(_1454);
    float _1466 = _1372 * 6.283185482025146484375;
    float _1468 = sin(_1466);
    bool _1470 = uint(_1396) >= uint(_746);
    float _1472 = fma(_1410, _1444, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    int _1474 = ~_746;
    int _1476 = _1474 + 1;
    float _1478 = _1456 * _1460;
    float _1480 = -_1440;
    float _1482 = _1480 + 1.0;
    bool _1484 = !_1470;
    int _1486 = _1484 ? 0 : (-1);
    float _1488 = _948 + 0.5;
    float _1490 = _1372 * 6.283185482025146484375;
    float _1492 = cos(_1490);
    float _1494 = fma(_1482, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1478);
    int _1496 = ~_1370;
    int _1498 = _1496 + _1486;
    int _1500 = _1498 + 1;
    float _1502 = fma(_1488, (*spvDescriptorSet0.vp_c9)._m0[80].x, _892);
    int _1504 = _1476 * int(_1366);
    int _1506 = _1504 + _1164;
    float _1508 = fma(_1472, _1458, _1494);
    float _1510 = _1450 * 6.283185482025146484375;
    float _1512 = sin(_1510);
    int _1514 = _746 * _1500;
    int _1516 = _1514 + _1206;
    float _1518 = _1468 * _1406;
    float _1520 = float(uint(_1506));
    bool _1522 = !_1114;
    int _1524 = _1522 ? _1516 : (-1);
    float _1526 = _1450 * 6.283185482025146484375;
    float _1528 = cos(_1526);
    float _1530 = _1492 * _1392;
    float _1532 = as_type<float>(_844) * _1520;
    float _1534 = _1468 * _1392;
    int _1536 = _1524 >> 31;
    int _1538 = _1524 & 3;
    bool _1540 = _1538 != 0;
    float _1542 = -_1530;
    float _1544 = fma(_1512, _1518, _1542);
    float _1546 = -_1518;
    float _1548 = fma(_1512, _1530, _1546);
    float _1550 = _1492 * _1406;
    int _1552 = _1536 & 3;
    float _1554 = trunc(_1532);
    float _1556 = precise::max(_1554, 0.0);
    uint _1558 = uint(_1556);
    bool _1560 = uint(_1538) > 1u;
    int _1562 = _1524 + _1552;
    float _1564 = _1392 * _1528;
    float _1566 = _1406 * _1528;
    float _1568 = _1528 * _1052;
    float _1570 = -_1052;
    float _1572 = _1512 * _1570;
    float _1574 = fma(_1512, _1550, _1534);
    float _1576 = fma(_1512, _1534, _1550);
    float _1578 = _1492 * _1568;
    float _1580 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1582 = _1468 * _1568;
    float _1584 = fma(_1566, _1026, _1572);
    float _1586 = fma(_1574, _1026, _1578);
    int _1588 = _1562 >> 2;
    float _1590 = fma(_1544, _1026, _1582);
    float _1592 = fma(_1564, _1580, _1584);
    float _1594 = fma(_1548, _1580, _1586);
    int _1596 = _1588 << 4;
    int _1598 = _1596 + 368;
    float _1600 = fma(_1576, _1580, _1590);
    int _1602 = ~_746;
    int _1604 = _1602 + 1;
    float _1606 = _1594 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1608 = _1594 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    uint _1610 = uint(int(uint(_1598) >> uint(2)));
    uint _1612 = uint(int(uint(int(_1610)) >> uint(2)));
    int _1614 = int(_1610) & 3;
    float _1616 = (*spvDescriptorSet0.vp_c9)._m0[int(_1612)][_1614];
    int _1618 = int(_1610) + 1;
    uint _1620 = uint(int(uint(_1618) >> uint(2)));
    int _1622 = _1618 & 3;
    float _1624 = (*spvDescriptorSet0.vp_c9)._m0[int(_1620)][_1622];
    int _1626 = int(_1366) + int(_1558);
    float _1628 = fma(_1592, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1606);
    float _1630 = fma(_1592, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1608);
    int _1632 = _1524 & 3;
    bool _1634 = _1632 != 0;
    float _1636 = fma(_1600, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1628);
    float _1638 = fma(_1600, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1630);
    int _1640 = _1604 * _1626;
    int _1642 = _1640 + _1164;
    int _1644 = _1634 ? 0 : 1;
    float _1646 = _1636 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1648 = _1638 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    int _1650 = _1598 + 8;
    uint _1652 = uint(int(uint(_1650) >> uint(2)));
    uint _1654 = uint(int(uint(int(_1652)) >> uint(2)));
    int _1656 = int(_1652) & 3;
    float _1658 = (*spvDescriptorSet0.vp_c9)._m0[int(_1654)][_1656];
    int _1660 = int(_1652) + 1;
    uint _1662 = uint(int(uint(_1660) >> uint(2)));
    int _1664 = _1660 & 3;
    float _1666 = (*spvDescriptorSet0.vp_c9)._m0[int(_1662)][_1664];
    bool _1668 = uint(_1642) >= uint(_746);
    float _1670 = _912 + _1646;
    float _1672 = _1084 + _1648;
    bool _1674 = _1538 != 3;
    float _1676 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1678 = _1670 + _1676;
    float _1680 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1682 = _1672 + _1680;
    bool _1684 = !_1668;
    int _1686 = _1684 ? 0 : (-1);
    int _1688 = _686 + 8;
    uint _1690 = uint(int(uint(_1688) >> uint(2)));
    uint _1692 = uint(int(uint(int(_1690)) >> uint(2)));
    int _1694 = int(_1690) & 3;
    float _1696 = (*spvDescriptorSet0.vp_c9)._m0[int(_1692)][_1694];
    float _1698 = _1678 * _1678;
    float _1700 = _1682 * _1682;
    int _1702 = ~_1644;
    int _1704 = _1702 + 1;
    int _1706 = _1704 + 1;
    bool _1708 = uint(_1538) >= 2u;
    float _1710 = _1698 + _1700;
    int _1712 = _1706;
    float _1714 = _1698;
    float _1716 = _1700;
    if (!_1560)
    {
        int _1718 = ~_1644;
        int _1720 = _1718 + 1;
        _1712 = _1720;
    }
    int _1722 = _1712;
    uint _1724 = uint(int(uint(_686) >> uint(2)));
    uint _1726 = uint(int(uint(int(_1724)) >> uint(2)));
    int _1728 = int(_1724) & 3;
    float _1730 = (*spvDescriptorSet0.vp_c9)._m0[int(_1726)][_1728];
    int _1732 = int(_1724) + 1;
    uint _1734 = uint(int(uint(_1732) >> uint(2)));
    int _1736 = _1732 & 3;
    float _1738 = (*spvDescriptorSet0.vp_c9)._m0[int(_1734)][_1736];
    int _1740 = ~_1626;
    int _1742 = _1740 + _1686;
    int _1744 = _1742 + 1;
    float _1746 = sqrt(_1710);
    float _1748 = _1594 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _1750 = !_1540;
    int _1752 = _1750 ? 0 : 1;
    int _1754 = _1708 ? 0 : 1;
    float _1756 = fma(_1592, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1748);
    int _1758 = abs(_1722);
    int _1760 = _746 * _1744;
    int _1762 = _1760 + _1164;
    int _1764 = abs(_1752);
    float _1766 = fma(_1600, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1756);
    int _1768 = ~_1754;
    int _1770 = _1768 + 1;
    int _1772 = _1770 + 1;
    int _1774 = _1772;
    if (_1674)
    {
        int _1776 = ~_1754;
        int _1778 = _1776 + 1;
        _1774 = _1778;
    }
    int _1780 = _1774;
    float _1782 = _1766 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _1784 = ~_1758;
    int _1786 = _1784 + 1;
    int _1788 = _1786 + 1;
    bool _1790 = _1746 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1792 = _1788 * as_type<int>(_1624);
    int _1794 = abs(_1780);
    bool _1796 = !_1360;
    int _1798 = _1796 ? 0 : 1;
    int _1800 = ~_1764;
    int _1802 = _1800 + 1;
    int _1804 = _1802 + 1;
    bool _1806 = _1538 != 3;
    float _1808 = _928 + _1782;
    int _1810 = _1804 * as_type<int>(_1616);
    int _1812 = _1810 + _1792;
    int _1814 = abs(_1798);
    bool _1816 = !_1806;
    float _1818 = _1816 ? 0.0 : as_type<float>(0xffffffffu /* nan */);
    int _1820 = ~_1794;
    int _1822 = _1820 + 1;
    int _1824 = _1822 + 1;
    int _1826 = abs(as_type<int>(_1818));
    float _1828 = _1818;
    float _1830 = as_type<float>(_1812);
    if (!_1790)
    {
        _1828 = _1672;
    }
    float _1832 = _1828;
    int _1834 = _1824 * as_type<int>(_1658);
    int _1836 = _1834 + _1812;
    float _1838 = _1658;
    float _1840 = _1832;
    if (!_1790)
    {
        _1838 = _1670;
    }
    float _1842 = _1838;
    int _1844 = ~_1826;
    int _1846 = _1844 + 1;
    int _1848 = _1846 + 1;
    float _1850 = _1842;
    if (!_1790)
    {
        _1830 = _1808;
    }
    float _1852 = _1830;
    bool _1854 = !_1790;
    float _1856 = _1852;
    if (!_1854)
    {
        float _1858 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1860 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1862 = _1746 + _1860;
        float _1864 = rsqrt(_1710);
        float _1866 = _1862 * _1858;
        float _1868 = _1808 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1870 = _1866 * 0.15915493667125701904296875;
        float _1872 = _1870 * 6.283185482025146484375;
        float _1874 = sin(_1872);
        float _1876 = _1870 * 6.283185482025146484375;
        float _1878 = cos(_1876);
        float _1880 = fma(_1874, _1868, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1882 = _1864 * _1880;
        float _1884 = fma(_1678, _1882, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1886 = _1878 + (-1.0);
        float _1888 = fma(_1682, _1882, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1890 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1892 = _1884 + _1890;
        float _1894 = _1886 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1896 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1898 = _1888 + _1896;
        float _1900 = _1892 * _1892;
        float _1902 = fma(_1808, _1878, _1894);
        float _1904 = _1898 * _1898;
        _1856 = _1902;
        _1714 = _1900;
        _1716 = _1904;
        _1850 = _1884;
        _1840 = _1888;
    }
    float _1906 = _1856;
    float _1908 = _1714;
    float _1910 = _1716;
    float _1912 = _1850;
    float _1914 = _1840;
    float _1916 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1918 = _1906 + _1916;
    int _1920 = ~_1814;
    int _1922 = _1920 + 1;
    int _1924 = _1922 + 1;
    int _1926 = _1848 * as_type<int>(_1666);
    int _1928 = _1926 + _1836;
    bool _1930 = !_1114;
    int _1932 = _1930 ? _1762 : (-1);
    float _1934 = fma(_1918, _1918, _1908);
    float _1936 = _1464 + (-0.5);
    int _1938 = _1928 * _1924;
    float _1940 = -_974;
    float _1942 = _1940 + 1.0;
    float _1944 = _1934 + _1910;
    float _1946 = -_1936;
    float _1948 = -_894;
    float _1950 = fma(_1946, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1948);
    int _1952 = _1932 * _1814;
    int _1954 = _1952 + _1938;
    float _1956 = fma(_1422, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1508);
    float _1958 = -_992;
    float _1960 = _1958 + 1.0;
    float _1962 = _1730 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1964 = sqrt(_1944);
    float _1966 = _1738 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1968 = _1696 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1970 = fma(_1464, _1942, _1950);
    float _1972 = -_1960;
    float _1974 = fma(_948, _1972, _1502);
    float _1976 = _1962 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1978 = _1966 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1980 = _1968 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1982 = _1956 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1984 = float(_1954);
    out.m_68.x = _1974;
    out.m_68.y = _1970;
    out.m_70.x = _1976;
    out.m_70.y = _1978;
    out.m_70.z = _1980;
    out.m_70.w = _1982;
    bool _1986 = _1964 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1988 = isnan(_1964);
    bool _1990 = _1986 || _1988;
    bool _1992 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1994 = _1990 || _1992;
    out.m_72.x = _1984;
    float _1996 = as_type<float>(_1928);
    float _1998 = _1970;
    float _2000 = _1942;
    float _2002 = _1980;
    if (!_1994)
    {
        _1996 = 1.0;
    }
    float _2004 = _1996;
    bool _2006 = !_1994;
    float _2008 = _2004;
    if (!_2006)
    {
        bool _2010 = _1964 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2012 = isnan(_1964);
        bool _2014 = _2010 || _2012;
        bool _2016 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2018 = _2014 || _2016;
        if (!_2018)
        {
            float _2020 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2022 = _1964 + _2020;
            float _2024 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2026 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2024;
            float _2028 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2030 = _2028 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2032 = 1.0 / _2026;
            float _2034 = _2022 * _2032;
            float _2036 = fma(_2034, _2030, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2008 = _2036;
            _2038 = true;
        }
        else
        {
            bool _2040 = _1964 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2042 = isnan(_1964);
            bool _2044 = _2040 || _2042;
            bool _2046 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2048 = _2044 || _2046;
            if (!_2048)
            {
                float _2050 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2052 = _1964 + _2050;
                float _2054 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2056 = _2054 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2058 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2060 = _2058 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2062 = 1.0 / _2056;
                float _2064 = _2052 * _2062;
                float _2066 = fma(_2064, _2060, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2008 = _2066;
                _2038 = true;
            }
            else
            {
                _2008 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2038 = false;
    float _2068 = _2008;
    float _2070 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2072 = _1912 + _2070;
    float _2074 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2076 = _1906 + _2074;
    bool _2078 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2080 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2082 = _2078 || _2080;
    bool _2084 = isnan(0.5);
    bool _2086 = _2082 || _2084;
    float _2088 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2090 = _1914 + _2088;
    float _2092 = fma(_2072, _2068, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2094 = fma(_2076, _2068, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2096 = fma(_2090, _2068, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2098 = _2090;
    float _2100 = _2096;
    if (_2086)
    {
        _2098 = _2092;
    }
    float _2102 = _2098;
    float _2104 = _2102;
    if (_2086)
    {
        _1998 = _2094;
    }
    float _2106 = _1998;
    float _2108 = _2106;
    if (!_2086)
    {
        float _2110 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2112 = _928 + _2110;
        float _2114 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2116 = _912 + _2114;
        float _2118 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2120 = -_1084;
        float _2122 = _2120 + _2096;
        float _2124 = _2112 * _2112;
        float _2126 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2128 = _1084 + _2126;
        float _2130 = fma(_2116, _2116, _2124);
        float _2132 = -_928;
        float _2134 = _2132 + _2094;
        float _2136 = fma(_2128, _2128, _2130);
        float _2138 = -_912;
        float _2140 = _2138 + _2092;
        float _2142 = sqrt(_2136);
        float _2144 = precise::min(_2142, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2146 = _2144 * _2118;
        float _2148 = fma(_2140, _2146, _912);
        float _2150 = fma(_2134, _2146, _928);
        float _2152 = fma(_2122, _2146, _1084);
        _2108 = _2150;
        _2104 = _2148;
        _2100 = _2152;
    }
    float _2154 = _2108;
    float _2156 = _2104;
    float _2158 = _2100;
    float _2160 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2162 = _2154 + _2160;
    float _2164 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2166 = _2156 + _2164;
    float _2168 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2170 = _2158 + _2168;
    float _2172 = _2162 * _2162;
    float _2174 = fma(_2166, _2166, _2172);
    float _2176 = fma(_2170, _2170, _2174);
    float _2178 = rsqrt(_2176);
    float _2180 = _2178 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2182 = _2166 * _2180;
    float _2184 = _2170 * _2180;
    float _2186 = _2182 * _2182;
    float _2188 = _2184 * _2184;
    float _2190 = _2186 + _2188;
    float _2192 = sqrt(_2190);
    bool _2194 = _2192 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2196 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2198 = _2192 + _2196;
    float _2200 = _2178;
    float _2202 = _2198;
    float _2204 = _2162;
    float _2206 = _2180;
    float _2208 = _2182;
    if (_2194)
    {
        float _2210 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2200 = _2210;
    }
    float _2212 = _2200;
    if (_2194)
    {
        float _2214 = rsqrt(_2190);
        _2000 = _2214;
    }
    float _2216 = _2000;
    float _2218 = _2216;
    if (_2194)
    {
        float _2220 = _2198 * _2212;
        _2202 = _2220;
    }
    float _2222 = _2202;
    if (_2194)
    {
        float _2224 = _2222 * 0.15915493667125701904296875;
        _994 = _2224;
    }
    float _2226 = _994;
    float _2228 = _2212;
    if (_2194)
    {
        float _2230 = _2226 * 6.283185482025146484375;
        float _2232 = sin(_2230);
        _2228 = _2232;
    }
    float _2234 = _2228;
    float _2236 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2238 = precise::max(0.0, _2236);
    float _2240 = _2170;
    float _2242 = _2238;
    if (_2194)
    {
        float _2244 = _2226 * 6.283185482025146484375;
        float _2246 = cos(_2244);
        _2240 = _2246;
    }
    float _2248 = _2240;
    float _2250 = -_2180;
    float _2252 = -_2238;
    float _2254 = fma(_2162, _2250, _2252);
    if (!_2194)
    {
        _2204 = _2186;
    }
    float _2256 = _2204;
    float _2258 = _2256;
    if (_2194)
    {
        float _2260 = _2254 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2242 = _2260;
    }
    float _2262 = _2242;
    float _2264 = sqrt(_2176);
    float _2266 = _2234;
    float _2268 = _2262;
    if (_2194)
    {
        float _2270 = fma(_2234, _2262, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2266 = _2270;
    }
    float _2272 = _2266;
    float _2274 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2276 = _2272;
    if (_2194)
    {
        float _2278 = _2248 + (-1.0);
        _2268 = _2278;
    }
    float _2280 = _2268;
    float _2282 = _2280;
    if (_2194)
    {
        float _2284 = _2216 * _2272;
        _2002 = _2284;
    }
    float _2286 = _2002;
    if (!_2194)
    {
        _2218 = _2254;
    }
    float _2288 = _2218;
    float _2290 = _2288;
    if (_2194)
    {
        float _2292 = _2280 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2206 = _2292;
    }
    float _2294 = _2206;
    if (_2194)
    {
        float _2296 = _2182 * _2286;
        _2208 = _2296;
    }
    float _2298 = _2208;
    if (!_2194)
    {
        _2276 = _2184;
    }
    float _2300 = _2276;
    float _2302 = _2300;
    if (_2194)
    {
        float _2304 = _2184 * _2286;
        _2302 = _2304;
    }
    float _2306 = _2302;
    if (_2194)
    {
        float _2308 = fma(_2254, _2248, _2294);
        _2290 = _2308;
    }
    float _2310 = _2290;
    if (_2194)
    {
        float _2312 = _2298 * _2298;
        _2258 = _2312;
    }
    float _2314 = _2258;
    if (!_2194)
    {
        _2282 = _2188;
    }
    float _2316 = _2282;
    float _2318 = _2316;
    if (_2194)
    {
        float _2320 = _2306 * _2306;
        _2318 = _2320;
    }
    float _2322 = _2318;
    float _2324 = fma(_2310, _2310, _2314);
    float _2326 = _2324 + _2322;
    float _2328 = _2154 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2330 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2332 = fma(_2264, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2330);
    float _2334 = precise::clamp(_2332, 0.0, 1.0);
    float _2336 = rsqrt(_2326);
    float _2338 = fma(_2156, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2328);
    float _2340 = _2154 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2342 = -_2334;
    float _2344 = _2342 + 1.0;
    float _2346 = fma(_2158, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2338);
    float _2348 = _2154 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2350 = fma(_2156, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2340);
    float _2352 = _2154 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2354 = abs(_2344);
    float _2356 = log2(_2354);
    float _2358 = fma(_2156, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2348);
    float _2360 = fma(_2158, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2350);
    float _2362 = fma(_2156, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2352);
    float _2364 = _2346 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2366 = fma(_2158, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2358);
    float _2368 = _2360 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2370 = fma(_2158, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2362);
    float _2372 = _2336 * _2298;
    float _2374 = _2366 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2376 = _2368 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2378 = _2336 * _2310;
    float _2380 = _2372 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2382 = _2364 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2384 = fma(_2374, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2376);
    float _2386 = _2336 * _2306;
    float _2388 = _2356 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2390 = -_2380;
    float _2392 = fma(_2378, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2390);
    float _2394 = -_2382;
    float _2396 = fma(_2394, _2274, 1.0);
    float _2398 = _2370 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2400 = fma(_2364, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2384);
    float _2402 = exp2(_2388);
    float _2404 = -_2386;
    float _2406 = fma(_2404, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2392);
    float _2408 = _2368 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2410 = fma(_2398, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2400);
    float _2412 = _2368 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2414 = fma(_2406, -0.5, 0.5);
    float _2416 = fma(_2374, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2408);
    float _2418 = fma(_2406, 0.5, 0.5);
    float _2420 = log2(_2396);
    float _2422 = fma(_2374, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2412);
    float _2424 = _2378 + 1.0;
    float _2426 = fma(_2364, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2416);
    float _2428 = fma(_2418, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2430 = fma(_2364, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2422);
    float _2432 = 1.0 / _2410;
    float _2434 = -_2378;
    float _2436 = fma(_2402, _2424, _2434);
    float _2438 = fma(_2398, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2426);
    float _2440 = fma(_2418, _2428, -0.212114393711090087890625);
    float _2442 = fma(_2398, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2430);
    float _2444 = fma(_2436, 0.5, 0.5);
    float _2446 = fma(_2418, _2440, 1.570728778839111328125);
    float _2448 = sqrt(_2414);
    float _2450 = _2420 * 0.693147182464599609375;
    float _2452 = _2438 * _2432;
    float _2454 = _2442 * _2432;
    float _2456 = _2450 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2458 = fma(_2452, 0.5, 0.5);
    float _2460 = fma(_2454, -0.5, 0.5);
    float _2462 = _2448 * 0.636619746685028076171875;
    float3 _6158 = float3(_2458, _2460, _2456);
    float _2464 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6158, float3(0.0), isnan(_6158)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6158, float3(0.0), isnan(_6158)), level(0.0)).x;
    float3 _6169 = float3(_2458, _2460, _2456);
    float4 _2467 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6169, float3(0.0), isnan(_6169)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6169, float3(0.0), isnan(_6169)), level(0.0)).xyzw;
    float _2469 = _2467.x;
    float _2471 = _2467.y;
    float _2473 = _2467.z;
    float _2475 = _2467.w;
    float _2477 = -_2446;
    float _2479 = fma(_2462, _2477, 1.0);
    float2 _6191 = float2(_2479, _2444);
    float3 _2483 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6191, float2(0.0), isnan(_6191)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6191, float2(0.0), isnan(_6191)), level(0.0)).xyz;
    float _2485 = _2483.x;
    float _2487 = _2483.y;
    float _2489 = _2483.z;
    float _2491 = _2356 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2493 = _2368 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2495 = fma(_2374, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2493);
    float _2497 = exp2(_2491);
    float _2499 = fma(_2364, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2495);
    float _2501 = fma(_2398, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2499);
    float _2503 = _2501 + _2410;
    out.gl_Position.x = _2438;
    out.gl_Position.y = _2442;
    out.gl_Position.z = _2501;
    out.gl_Position.w = _2410;
    float _2505 = -_2497;
    float _2507 = _2505 + 1.0;
    float _2509 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2511 = _2503 * 0.5;
    float _2513 = _2507 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_47.x = _2509;
    out.m_74.z = _2511;
    out.m_74.w = _2410;
    float _2515 = _2513 * _2464;
    float _2517 = -_2513;
    float _2519 = _2517 + 1.0;
    float _2521 = _2475 * _2515;
    float _2523 = _2489 * _2515;
    float _2525 = fma(_2485, _2521, _2469);
    float _2527 = fma(_2487, _2521, _2471);
    float _2529 = _2475 * _2519;
    float _2531 = fma(_2475, _2523, _2473);
    out.m_76.x = _2525;
    out.m_76.y = _2527;
    out.m_76.z = _2531;
    out.m_76.w = _2529;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2038 = false;
    bool _710 = false;
    bool _481 = false;
    bool _277 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _90 = in.m_44.w;
    float _92 = trunc(_90);
    int _95 = int(_92);
    bool _99 = _95 >= 1;
    float _101 = 0.0;
    if (!_99)
    {
        _101 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _103 = _101;
    float _105 = _103;
    if (!_99)
    {
        out.m_47.x = 0.0;
    }
    int _107 = 0;
    if (!_99)
    {
        float _109 = _103 * 5.0;
        _107 = as_type<int>(_109);
    }
    int _111 = _107;
    int _113 = _111;
    if (!_99)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2588 = as_type<float>(_111);
        out.gl_Position.z = _2588;
    }
    if (!_99)
    {
        return out;
    }
    float _115 = in.m_49.w;
    bool _117 = _115 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _119 = isnan(_115);
    bool _121 = _117 || _119;
    bool _123 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _125 = _121 || _123;
    float _127 = -_115;
    float _129 = _127 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _131 = _129;
    if (_125)
    {
        float _133 = float(_95);
        _105 = _133;
    }
    float _135 = _105;
    bool _137 = _129 >= _135;
    bool _139 = !_125;
    bool _141 = _137 || _139;
    float _143 = _135;
    if (_141)
    {
        _143 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _145 = _143;
    if (_141)
    {
        out.m_47.x = 0.0;
    }
    if (_141)
    {
        float _147 = _145 * 5.0;
        _113 = as_type<int>(_147);
    }
    int _149 = _113;
    if (_141)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2658 = as_type<float>(_149);
        out.gl_Position.z = _2658;
    }
    if (_141)
    {
        return out;
    }
    float _151 = in.m_51.x;
    float _153 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _155 = _129 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _157 = as_type<float>(int(gl_VertexIndex));
    float _159 = _155 * _153;
    float _161 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[20].x, _159);
    int _163 = as_type<int>(_157) & 1;
    bool _165 = _163 != 0;
    int _167 = as_type<int>(_157) & 2;
    bool _169 = _167 != 0;
    float _171 = _161 * 6.283185482025146484375;
    float _173 = floor(_161);
    float _175 = _171 * 0.15915493667125701904296875;
    bool _177 = !_169;
    float _179 = _177 ? (-0.5) : 0.5;
    int _181 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _183 = _181 != 0;
    int _185 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _187 = _185 != 0;
    int _189 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _191 = _189 != 0;
    float _193 = _175 * 6.283185482025146484375;
    float _195 = cos(_193);
    bool _197 = !_165;
    float _199 = _197 ? (-0.5) : 0.5;
    bool _201 = !_183;
    int _203 = _201 ? 0 : 1;
    bool _205 = !_191;
    int _207 = _205 ? 0 : 1;
    int _209 = abs(_203);
    float _211 = -_173;
    float _213 = _161 + _211;
    int _215 = abs(_207);
    float _217 = -_213;
    float _219 = fma(_217, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _221 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _223 = float(_209);
    float _225 = fma(_195, 0.5, 0.5);
    bool _227 = !_187;
    int _229 = _227 ? 0 : 1;
    bool _231 = _213 < 0.5;
    float _233 = float(_231);
    float _235 = abs(_219);
    float _237 = _223 * _235;
    int _239 = abs(_229);
    float _241 = -_225;
    float _243 = fma(_241, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _245 = float(_215);
    float _247 = -_233;
    float _249 = fma(_247, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _251 = float(_239);
    float _253 = fma(_245, _243, _237);
    float _255 = abs(_249);
    float _257 = fma(_251, _255, _253);
    bool _259 = !_221;
    float _275;
    if (!_259)
    {
        float _261 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _263 = _151 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _265 = fma(_263, (*spvDescriptorSet0.vp_c9)._m0[12].x, _129);
        float _267 = _265 * _261;
        float _269 = floor(_267);
        float _271 = -_269;
        float _273 = _267 + _271;
        _275 = _273;
        _277 = true;
    }
    else
    {
        float _279 = float(_95);
        float _281 = 1.0 / _279;
        float _283 = _129 * _281;
        _275 = _283;
    }
    _277 = false;
    float _285 = _275;
    float _287 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _289 = _285 + _287;
    bool _291 = _285 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _293 = isnan(_285);
    bool _295 = _291 || _293;
    bool _297 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _299 = _295 || _297;
    float _301 = float(_299);
    float _303 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _305 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _303;
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _309 = _307 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _313 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _311;
    float _315 = 1.0 / _305;
    bool _317 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _319 = 1.0 / _309;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _323 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _321;
    float _325 = 1.0 / _313;
    float _327 = _289 * _315;
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _331 = _285 + _329;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _335 = _285 + _333;
    float _337 = fma(_323, _327, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _339 = _331 * _319;
    bool _341 = _285 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _343 = isnan(_285);
    bool _345 = _341 || _343;
    bool _347 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _349 = _345 || _347;
    float _351 = float(_349);
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _355 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _353;
    float _357 = -_351;
    float _359 = _357 + 1.0;
    float _361 = fma(_355, _327, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _363 = _335 * _325;
    float _365 = -_301;
    float _367 = _365 + 1.0;
    bool _369 = _285 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _371 = isnan(_285);
    bool _373 = _369 || _371;
    bool _375 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _377 = _373 || _375;
    float _379 = float(_377);
    float _381 = _351 * _367;
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _385 = _383 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _387 = _379 * _359;
    float _389 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _391 = -_379;
    float _393 = _391 + 1.0;
    bool _395 = _285 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _397 = isnan(_285);
    bool _399 = _395 || _397;
    bool _401 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _403 = _399 || _401;
    float _405 = float(_403);
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _409 = _407 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _411 = fma(_385, _339, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _413 = _389 * _151;
    float _415 = _405 * _393;
    float _417 = fma(_409, _339, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _419 = -_405;
    float _421 = _419 + 1.0;
    float _423 = _337 * _415;
    float _425 = _361 * _415;
    float _427 = trunc(_413);
    int _429 = int(_427);
    float _431 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _433 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _431;
    float _435 = fma(_421, (*spvDescriptorSet0.vp_c9)._m0[143].x, _423);
    float _437 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _439 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _437;
    float _441 = fma(_421, (*spvDescriptorSet0.vp_c9)._m0[143].y, _425);
    float _443 = fma(_433, _363, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _445 = fma(_417, _387, _435);
    float _447 = fma(_439, _363, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _449 = fma(_411, _387, _441);
    float _451 = fma(_443, _381, _445);
    float _453 = fma(_447, _381, _449);
    float _455 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[146].x, _451);
    float _457 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[146].y, _453);
    int _459 = _429 << 4;
    int _461 = _459 + 1712;
    bool _463 = !_317;
    float _479;
    if (!_463)
    {
        float _465 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _467 = _151 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _469 = fma(_467, (*spvDescriptorSet0.vp_c9)._m0[11].y, _129);
        float _471 = _469 * _465;
        float _473 = floor(_471);
        float _475 = -_473;
        float _477 = _471 + _475;
        _479 = _477;
        _481 = true;
    }
    else
    {
        float _483 = float(_95);
        float _485 = 1.0 / _483;
        float _487 = _129 * _485;
        _479 = _487;
    }
    _481 = false;
    float _489 = _479;
    uint _492 = uint(int(uint(_461) >> uint(2)));
    uint _494 = uint(int(uint(int(_492)) >> uint(2)));
    int _496 = int(_492) & 3;
    float _498 = (*spvDescriptorSet0.vp_c9)._m0[int(_494)][_496];
    int _500 = int(_492) + 1;
    uint _502 = uint(int(uint(_500) >> uint(2)));
    int _504 = _500 & 3;
    float _506 = (*spvDescriptorSet0.vp_c9)._m0[int(_502)][_504];
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _510 = _508 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _514 = _512 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _516 = _489 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _518 = isnan(_489);
    bool _520 = _516 || _518;
    bool _522 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _524 = _520 || _522;
    float _526 = float(_524);
    int _528 = _461 + 8;
    uint _530 = uint(int(uint(_528) >> uint(2)));
    uint _532 = uint(int(uint(int(_530)) >> uint(2)));
    int _534 = int(_530) & 3;
    float _536 = (*spvDescriptorSet0.vp_c9)._m0[int(_532)][_534];
    float _538 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _540 = _538 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _542 = 1.0 / _510;
    bool _544 = _489 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _546 = isnan(_489);
    bool _548 = _544 || _546;
    bool _550 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _552 = _548 || _550;
    float _554 = float(_552);
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _558 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _556;
    float _560 = -_526;
    float _562 = _560 + 1.0;
    bool _564 = _489 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _566 = isnan(_489);
    bool _568 = _564 || _566;
    bool _570 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _572 = _568 || _570;
    float _574 = float(_572);
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _578 = _576 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _580 = _554 * _562;
    float _582 = 1.0 / _514;
    float _584 = -_554;
    float _586 = _584 + 1.0;
    bool _588 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _590 = _574 * _586;
    float _592 = -_574;
    float _594 = _592 + 1.0;
    float _596 = 1.0 / _540;
    float _598 = _558 * _542;
    float _600 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _602 = _489 + _600;
    float _604 = fma(_598, _602, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _606 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _608 = _489 + _606;
    float _610 = _578 * _582;
    bool _612 = _489 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _614 = isnan(_489);
    bool _616 = _612 || _614;
    bool _618 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _620 = _616 || _618;
    float _622 = float(_620);
    float _624 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _626 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _624;
    float _628 = _604 * _590;
    float _630 = fma(_610, _608, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _634 = _489 + _632;
    float _636 = -_622;
    float _638 = _636 + 1.0;
    float _640 = fma(_594, (*spvDescriptorSet0.vp_c9)._m0[115].x, _628);
    float _642 = _626 * _596;
    float _644 = _526 * _638;
    float _646 = fma(_630, _580, _640);
    float _648 = fma(_642, _634, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _650 = _498 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _652 = _506 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _654 = fma(_648, _644, _646);
    float _656 = _650 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _658 = _652 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _660 = fma(_622, (*spvDescriptorSet0.vp_c9)._m0[118].x, _654);
    float _662 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _664 = _536 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _666 = in.m_56.x;
    float _668 = in.m_56.y;
    float _670 = _660 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _672 = _664 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _674 = _662 * _151;
    out.m_58.x = _656;
    out.m_58.y = _658;
    out.m_58.z = _672;
    out.m_58.w = _670;
    float _676 = trunc(_674);
    int _678 = int(_676);
    float _680 = _457 * _668;
    float _682 = _455 * _666;
    int _684 = _678 << 4;
    int _686 = _684 + 1968;
    bool _688 = !_588;
    float _706;
    float _708;
    if (!_688)
    {
        float _690 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _692 = _151 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _694 = float(_95);
        float _696 = fma(_692, (*spvDescriptorSet0.vp_c9)._m0[11].w, _129);
        float _698 = _696 * _690;
        float _700 = floor(_698);
        float _702 = -_700;
        float _704 = _698 + _702;
        _706 = _694;
        _708 = _704;
        _710 = true;
    }
    else
    {
        float _712 = float(_95);
        float _714 = 1.0 / _712;
        float _716 = _129 * _714;
        _706 = _712;
        _708 = _716;
    }
    _710 = false;
    float _718 = _706;
    float _720 = _708;
    float _722 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _724 = int(_722);
    float _726 = in.m_44.x;
    float _728 = in.m_44.y;
    float _730 = in.m_44.z;
    float _732 = _257 * _682;
    float _734 = _257 * _680;
    float _736 = in.m_60.x;
    float _738 = in.m_60.y;
    float _740 = in.m_60.z;
    float _742 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _179);
    float _744 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _746 = int(_744);
    float _748 = in.m_62.x;
    float _750 = in.m_62.y;
    float _752 = in.m_62.z;
    int _754 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _756 = _754 != 0;
    float _758 = _734 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _760 = in.m_51.y;
    int _762 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _764 = _762 != 0;
    int _766 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _768 = _766 != 0;
    int _770 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _772 = _770 != 0;
    float _774 = float(_724);
    float _776 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _778 = log2(_776);
    float _780 = in.m_64.x;
    float _782 = in.m_64.y;
    float _784 = in.m_64.z;
    bool _786 = _151 > 0.5;
    bool _788 = !_756;
    float _790 = _788 ? 7.345489978790283203125 : 1.0;
    int _792 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _794 = _792 != 0;
    float _796 = 1.0 / _774;
    float _798 = float(uint(_746));
    int _800 = ~_746;
    int _802 = _800 + 1;
    float _804 = _728 * _738;
    bool _806 = !_768;
    int _808 = _806 ? 0 : 1;
    int _810 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _812 = _810 != 0;
    float _814 = 1.0 / _798;
    float _816 = fma(_726, _736, _804);
    float _818 = _151 * 2.0;
    float _820 = _728 * _750;
    float _822 = _778 * _129;
    int _824 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _826 = _824 != 0;
    float _828 = _760 * 2.0;
    float _830 = fma(_726, _748, _820);
    float _832 = _796 * _129;
    float _834 = _728 * _782;
    float _836 = exp2(_822);
    float _838 = _151 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _840 = fma(_726, _780, _834);
    float _842 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _844 = as_type<int>(_814) + (-2);
    float _846 = fma(_730, _740, _816);
    float _848 = trunc(_832);
    int _850 = int(_848);
    float _852 = -_842;
    float _854 = fma(_838, 2.0, _852);
    bool _856 = !_764;
    int _858 = _856 ? 0 : 1;
    float _860 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _862 = _760 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _864 = !_772;
    int _866 = _864 ? 0 : 1;
    float _868 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _870 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _872 = isnan(0.0);
    bool _874 = _870 || _872;
    bool _876 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _878 = _874 || _876;
    float _880 = floor(_818);
    float _882 = fma(_862, -2.0, _860);
    float _884 = -_836;
    float _886 = _884 + 1.0;
    float _888 = fma(_760, (*spvDescriptorSet0.vp_c9)._m0[78].w, _868);
    float _890 = -_129;
    float _892 = fma(_890, (*spvDescriptorSet0.vp_c9)._m0[76].x, _854);
    float _894 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[76].y, _882);
    float _896 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _898 = float(uint(_850));
    float _900 = floor(_828);
    float _902 = fma(_730, _752, _830);
    float _904 = _878 ? _886 : 0.0;
    float _906 = as_type<float>(_844) * _898;
    float _908 = -_199;
    int _910 = _786 ? as_type<int>(_908) : as_type<int>(_199);
    float _912 = _902 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _914 = _880 > 0.0;
    float _916 = 1.0 / _718;
    bool _918 = _880 >= 0.0;
    bool _920 = isnan(_880);
    bool _922 = _918 || _920;
    bool _924 = isnan(0.0);
    bool _926 = _922 || _924;
    float _928 = _846 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _930 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _932 = isnan(1.0);
    bool _934 = _930 || _932;
    bool _936 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _938 = _934 || _936;
    float _940 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _942 = 1.0 + _940;
    float _944 = float(_746);
    bool _946 = !_794;
    float _948 = _946 ? _199 : as_type<float>(_910);
    float _950 = trunc(_906);
    float _952 = precise::max(_950, 0.0);
    uint _954 = uint(_952);
    int _956 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _958 = _956 != 0;
    float _960 = _944 * _129;
    float _962 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _199);
    int _964 = _926 ? 0 : 1;
    float _966 = 1.0 / _942;
    float _968 = _960 * _916;
    int _970 = _802 * int(_954);
    int _972 = _970 + _850;
    float _974 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].w, _888);
    bool _976 = !_812;
    int _978 = _976 ? 0 : 1;
    float _980 = trunc(_968);
    int _982 = int(_980);
    float _984 = float(uint(_972));
    float _986 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[78].z, _896);
    int _988 = abs(_978);
    float _990 = as_type<float>(_844) * _984;
    float _992 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].z, _986);
    float _994 = _928;
    if (_938)
    {
        float _996 = _904 * _966;
        _131 = _996;
    }
    float _998 = _131;
    float _1000 = _732 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1002 = trunc(_990);
    float _1004 = precise::max(_1002, 0.0);
    uint _1006 = uint(_1004);
    int _1008 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1010 = _1008 != 0;
    int _1012 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1014 = _1012 != 0;
    int _1016 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1018 = _1016 != 0;
    float _1020 = _790 * _151;
    int _1022 = ~_746;
    int _1024 = _1022 + 1;
    float _1026 = _1000 * _962;
    float _1028 = float(_850);
    float _1030 = in.m_51.z;
    bool _1032 = !_958;
    int _1034 = _1032 ? 0 : 1;
    float _1036 = floor(_1020);
    int _1038 = int(_954) + int(_1006);
    bool _1040 = _1028 >= _944;
    bool _1042 = isnan(_1028);
    bool _1044 = _1040 || _1042;
    bool _1046 = isnan(_944);
    bool _1048 = _1044 || _1046;
    float _1050 = float(_1048);
    float _1052 = _758 * _742;
    float _1054 = fma(_730, _784, _840);
    int _1056 = _1024 * _1038;
    int _1058 = _1056 + _850;
    float _1060 = -_1036;
    float _1062 = _1020 + _1060;
    float _1064 = _151 + _760;
    float _1066 = trunc(_1050);
    int _1068 = int(_1066);
    float _1070 = _1062 * _944;
    bool _1072 = uint(_1058) >= uint(_746);
    float _1074 = _1064 + (-1.0);
    float _1076 = _1030 * 2.0;
    int _1078 = ~_964;
    int _1080 = _1078 + 1;
    int _1082 = _1080 + 1;
    float _1084 = _1054 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1086 = !_1072;
    int _1088 = _1086 ? 0 : (-1);
    float _1090 = fma(_1074, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1092 = _900 >= 0.0;
    bool _1094 = isnan(_900);
    bool _1096 = _1092 || _1094;
    bool _1098 = isnan(0.0);
    bool _1100 = _1096 || _1098;
    float _1102 = trunc(_1070);
    int _1104 = int(_1102);
    int _1106 = ~_1038;
    int _1108 = _1106 + _1088;
    int _1110 = _1108 + 1;
    int _1112 = _1100 ? 0 : 1;
    bool _1114 = _746 == 0;
    int _1116 = _746 * _1110;
    int _1118 = _1116 + _850;
    int _1120 = ~_1068;
    int _1122 = _1120 + 1;
    int _1124 = _1122 + 1;
    int _1126 = _1082;
    if (!_914)
    {
        int _1128 = ~_964;
        int _1130 = _1128 + 1;
        _1126 = _1130;
    }
    int _1132 = _1126;
    bool _1134 = !_1114;
    int _1136 = _1134 ? _1118 : (-1);
    float _1138 = floor(_1076);
    int _1140 = abs(_808);
    int _1142 = _746 + (-1);
    int _1144 = _1136 * _1124;
    bool _1146 = _900 > 0.0;
    int _1148 = _1068 * _1142;
    int _1150 = _1148 + _1144;
    int _1152 = abs(_858);
    int _1154 = _1150 * _1140;
    int _1156 = ~_1112;
    int _1158 = _1156 + 1;
    int _1160 = _1158 + 1;
    int _1162 = _1104 * _988;
    int _1164 = _1162 + _850;
    int _1166 = abs(_866);
    int _1168 = _982 * _1152;
    int _1170 = _1168 + _1154;
    int _1172 = _1160;
    if (!_1146)
    {
        int _1174 = ~_1112;
        int _1176 = _1174 + 1;
        _1172 = _1176;
    }
    int _1178 = _1172;
    float _1180 = _760 + _1030;
    bool _1182 = _1138 >= 0.0;
    bool _1184 = isnan(_1138);
    bool _1186 = _1182 || _1184;
    bool _1188 = isnan(0.0);
    bool _1190 = _1186 || _1188;
    int _1192 = _1164 * _1166;
    int _1194 = _1192 + _1170;
    int _1196 = abs(_1034);
    float _1198 = _1180 + (-1.0);
    int _1200 = _1190 ? 0 : 1;
    bool _1202 = _1138 > 0.0;
    int _1204 = _1104 * _1196;
    int _1206 = _1204 + _1194;
    bool _1208 = !_1014;
    int _1210 = _1208 ? 0 : 1;
    float _1212 = float(uint(_1206));
    float _1214 = fma(_1198, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1216 = abs(_1210);
    bool _1218 = !_1018;
    int _1220 = _1218 ? 0 : 1;
    float _1222 = as_type<float>(_844) * _1212;
    bool _1224 = !_1010;
    int _1226 = _1224 ? 0 : 1;
    int _1228 = ~_1200;
    int _1230 = _1228 + 1;
    int _1232 = _1230 + 1;
    int _1234 = _1232;
    if (!_1202)
    {
        int _1236 = ~_1200;
        int _1238 = _1236 + 1;
        _1234 = _1238;
    }
    int _1240 = _1234;
    float _1242 = trunc(_1222);
    float _1244 = precise::max(_1242, 0.0);
    uint _1246 = uint(_1244);
    int _1248 = abs(_1220);
    int _1250 = abs(_1226);
    float _1252 = float(_1132);
    float _1254 = in.m_66.x;
    float _1256 = in.m_66.y;
    float _1258 = in.m_66.z;
    float _1260 = float(_1216);
    int _1262 = ~_746;
    int _1264 = _1262 + 1;
    float _1266 = _1260 * _1252;
    float _1268 = float(_1250);
    float _1270 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1272 = _1270 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1274 = float(_1248);
    int _1276 = _1264 * int(_1246);
    int _1278 = _1276 + _1206;
    float _1280 = float(_1178);
    float _1282 = float(_1240);
    float _1284 = 1.0 / _1272;
    float _1286 = _1274 * _1280;
    float _1288 = _1266 * (-2.0);
    float _1290 = _1268 * _1282;
    bool _1292 = _760 > 0.5;
    float _1294 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1296 = _1294 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1298 = float(uint(_1164));
    float _1300 = _760 + (-0.5);
    float _1302 = float(uint(_1278));
    float _1304 = fma(_1288, _1256, _1256);
    float _1306 = fma(_1214, _1288, _1214);
    float _1308 = as_type<float>(_844) * _1298;
    float _1310 = _1290 * (-2.0);
    float _1312 = fma(_1300, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1304);
    float _1314 = as_type<float>(_844) * _1302;
    float _1316 = fma(_1090, _1310, _1090);
    float _1318 = fma(_1306, _998, _1312);
    float _1320 = trunc(_1314);
    float _1322 = precise::max(_1320, 0.0);
    uint _1324 = uint(_1322);
    float _1326 = _151 + (-0.5);
    float _1328 = _151 + _1030;
    float _1330 = _1318 * 0.15915493667125701904296875;
    float _1332 = fma(_1310, _1254, _1254);
    float _1334 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1336 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1334;
    float _1338 = _1328 + (-1.0);
    float _1340 = _1286 * (-2.0);
    float _1342 = 1.0 / _1296;
    float _1344 = fma(_1326, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1332);
    float _1346 = _1336 * _1284;
    float _1348 = fma(_1340, _1258, _1258);
    float _1350 = _1030 + (-0.5);
    float _1352 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1354 = _1352 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1356 = fma(_1316, _998, _1344);
    int _1358 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1360 = _1358 != 0;
    float _1362 = trunc(_1308);
    float _1364 = precise::max(_1362, 0.0);
    uint _1366 = uint(_1364);
    float _1368 = fma(_1350, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1348);
    int _1370 = int(_1246) + int(_1324);
    float _1372 = _1356 * 0.15915493667125701904296875;
    int _1374 = ~_746;
    int _1376 = _1374 + 1;
    bool _1378 = _720 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1380 = isnan(_720);
    bool _1382 = _1378 || _1380;
    bool _1384 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1386 = _1382 || _1384;
    float _1388 = float(_1386);
    float _1390 = _1330 * 6.283185482025146484375;
    float _1392 = sin(_1390);
    int _1394 = _1376 * _1370;
    int _1396 = _1394 + _1206;
    float _1398 = -_1388;
    float _1400 = _1398 + 1.0;
    float _1402 = fma(_1338, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1404 = _1330 * 6.283185482025146484375;
    float _1406 = cos(_1404);
    float _1408 = fma(_1402, _1340, _1402);
    float _1410 = _1354 * _1342;
    bool _1412 = _720 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1414 = isnan(_720);
    bool _1416 = _1412 || _1414;
    bool _1418 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1420 = _1416 || _1418;
    float _1422 = float(_1420);
    float _1424 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1426 = _720 + _1424;
    float _1428 = fma(_1408, _998, _1368);
    bool _1430 = _720 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1432 = isnan(_720);
    bool _1434 = _1430 || _1432;
    bool _1436 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1438 = _1434 || _1436;
    float _1440 = float(_1438);
    float _1442 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1444 = _720 + _1442;
    float _1446 = -_1422;
    float _1448 = _1446 + 1.0;
    float _1450 = _1428 * 0.15915493667125701904296875;
    float _1452 = -_179;
    int _1454 = _1292 ? as_type<int>(_1452) : as_type<int>(_179);
    float _1456 = fma(_1346, _1426, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1458 = _1388 * _1448;
    float _1460 = _1440 * _1400;
    bool _1462 = !_826;
    float _1464 = _1462 ? _179 : as_type<float>(_1454);
    float _1466 = _1372 * 6.283185482025146484375;
    float _1468 = sin(_1466);
    bool _1470 = uint(_1396) >= uint(_746);
    float _1472 = fma(_1410, _1444, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    int _1474 = ~_746;
    int _1476 = _1474 + 1;
    float _1478 = _1456 * _1460;
    float _1480 = -_1440;
    float _1482 = _1480 + 1.0;
    bool _1484 = !_1470;
    int _1486 = _1484 ? 0 : (-1);
    float _1488 = _948 + 0.5;
    float _1490 = _1372 * 6.283185482025146484375;
    float _1492 = cos(_1490);
    float _1494 = fma(_1482, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1478);
    int _1496 = ~_1370;
    int _1498 = _1496 + _1486;
    int _1500 = _1498 + 1;
    float _1502 = fma(_1488, (*spvDescriptorSet0.vp_c9)._m0[80].x, _892);
    int _1504 = _1476 * int(_1366);
    int _1506 = _1504 + _1164;
    float _1508 = fma(_1472, _1458, _1494);
    float _1510 = _1450 * 6.283185482025146484375;
    float _1512 = sin(_1510);
    int _1514 = _746 * _1500;
    int _1516 = _1514 + _1206;
    float _1518 = _1468 * _1406;
    float _1520 = float(uint(_1506));
    bool _1522 = !_1114;
    int _1524 = _1522 ? _1516 : (-1);
    float _1526 = _1450 * 6.283185482025146484375;
    float _1528 = cos(_1526);
    float _1530 = _1492 * _1392;
    float _1532 = as_type<float>(_844) * _1520;
    float _1534 = _1468 * _1392;
    int _1536 = _1524 >> 31;
    int _1538 = _1524 & 3;
    bool _1540 = _1538 != 0;
    float _1542 = -_1530;
    float _1544 = fma(_1512, _1518, _1542);
    float _1546 = -_1518;
    float _1548 = fma(_1512, _1530, _1546);
    float _1550 = _1492 * _1406;
    int _1552 = _1536 & 3;
    float _1554 = trunc(_1532);
    float _1556 = precise::max(_1554, 0.0);
    uint _1558 = uint(_1556);
    bool _1560 = uint(_1538) > 1u;
    int _1562 = _1524 + _1552;
    float _1564 = _1392 * _1528;
    float _1566 = _1406 * _1528;
    float _1568 = _1528 * _1052;
    float _1570 = -_1052;
    float _1572 = _1512 * _1570;
    float _1574 = fma(_1512, _1550, _1534);
    float _1576 = fma(_1512, _1534, _1550);
    float _1578 = _1492 * _1568;
    float _1580 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1582 = _1468 * _1568;
    float _1584 = fma(_1566, _1026, _1572);
    float _1586 = fma(_1574, _1026, _1578);
    int _1588 = _1562 >> 2;
    float _1590 = fma(_1544, _1026, _1582);
    float _1592 = fma(_1564, _1580, _1584);
    float _1594 = fma(_1548, _1580, _1586);
    int _1596 = _1588 << 4;
    int _1598 = _1596 + 368;
    float _1600 = fma(_1576, _1580, _1590);
    int _1602 = ~_746;
    int _1604 = _1602 + 1;
    float _1606 = _1594 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1608 = _1594 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    uint _1610 = uint(int(uint(_1598) >> uint(2)));
    uint _1612 = uint(int(uint(int(_1610)) >> uint(2)));
    int _1614 = int(_1610) & 3;
    float _1616 = (*spvDescriptorSet0.vp_c9)._m0[int(_1612)][_1614];
    int _1618 = int(_1610) + 1;
    uint _1620 = uint(int(uint(_1618) >> uint(2)));
    int _1622 = _1618 & 3;
    float _1624 = (*spvDescriptorSet0.vp_c9)._m0[int(_1620)][_1622];
    int _1626 = int(_1366) + int(_1558);
    float _1628 = fma(_1592, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1606);
    float _1630 = fma(_1592, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1608);
    int _1632 = _1524 & 3;
    bool _1634 = _1632 != 0;
    float _1636 = fma(_1600, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1628);
    float _1638 = fma(_1600, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1630);
    int _1640 = _1604 * _1626;
    int _1642 = _1640 + _1164;
    int _1644 = _1634 ? 0 : 1;
    float _1646 = _1636 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1648 = _1638 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    int _1650 = _1598 + 8;
    uint _1652 = uint(int(uint(_1650) >> uint(2)));
    uint _1654 = uint(int(uint(int(_1652)) >> uint(2)));
    int _1656 = int(_1652) & 3;
    float _1658 = (*spvDescriptorSet0.vp_c9)._m0[int(_1654)][_1656];
    int _1660 = int(_1652) + 1;
    uint _1662 = uint(int(uint(_1660) >> uint(2)));
    int _1664 = _1660 & 3;
    float _1666 = (*spvDescriptorSet0.vp_c9)._m0[int(_1662)][_1664];
    bool _1668 = uint(_1642) >= uint(_746);
    float _1670 = _912 + _1646;
    float _1672 = _1084 + _1648;
    bool _1674 = _1538 != 3;
    float _1676 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1678 = _1670 + _1676;
    float _1680 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1682 = _1672 + _1680;
    bool _1684 = !_1668;
    int _1686 = _1684 ? 0 : (-1);
    int _1688 = _686 + 8;
    uint _1690 = uint(int(uint(_1688) >> uint(2)));
    uint _1692 = uint(int(uint(int(_1690)) >> uint(2)));
    int _1694 = int(_1690) & 3;
    float _1696 = (*spvDescriptorSet0.vp_c9)._m0[int(_1692)][_1694];
    float _1698 = _1678 * _1678;
    float _1700 = _1682 * _1682;
    int _1702 = ~_1644;
    int _1704 = _1702 + 1;
    int _1706 = _1704 + 1;
    bool _1708 = uint(_1538) >= 2u;
    float _1710 = _1698 + _1700;
    int _1712 = _1706;
    float _1714 = _1698;
    float _1716 = _1700;
    if (!_1560)
    {
        int _1718 = ~_1644;
        int _1720 = _1718 + 1;
        _1712 = _1720;
    }
    int _1722 = _1712;
    uint _1724 = uint(int(uint(_686) >> uint(2)));
    uint _1726 = uint(int(uint(int(_1724)) >> uint(2)));
    int _1728 = int(_1724) & 3;
    float _1730 = (*spvDescriptorSet0.vp_c9)._m0[int(_1726)][_1728];
    int _1732 = int(_1724) + 1;
    uint _1734 = uint(int(uint(_1732) >> uint(2)));
    int _1736 = _1732 & 3;
    float _1738 = (*spvDescriptorSet0.vp_c9)._m0[int(_1734)][_1736];
    int _1740 = ~_1626;
    int _1742 = _1740 + _1686;
    int _1744 = _1742 + 1;
    float _1746 = sqrt(_1710);
    float _1748 = _1594 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _1750 = !_1540;
    int _1752 = _1750 ? 0 : 1;
    int _1754 = _1708 ? 0 : 1;
    float _1756 = fma(_1592, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1748);
    int _1758 = abs(_1722);
    int _1760 = _746 * _1744;
    int _1762 = _1760 + _1164;
    int _1764 = abs(_1752);
    float _1766 = fma(_1600, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1756);
    int _1768 = ~_1754;
    int _1770 = _1768 + 1;
    int _1772 = _1770 + 1;
    int _1774 = _1772;
    if (_1674)
    {
        int _1776 = ~_1754;
        int _1778 = _1776 + 1;
        _1774 = _1778;
    }
    int _1780 = _1774;
    float _1782 = _1766 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _1784 = ~_1758;
    int _1786 = _1784 + 1;
    int _1788 = _1786 + 1;
    bool _1790 = _1746 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1792 = _1788 * as_type<int>(_1624);
    int _1794 = abs(_1780);
    bool _1796 = !_1360;
    int _1798 = _1796 ? 0 : 1;
    int _1800 = ~_1764;
    int _1802 = _1800 + 1;
    int _1804 = _1802 + 1;
    bool _1806 = _1538 != 3;
    float _1808 = _928 + _1782;
    int _1810 = _1804 * as_type<int>(_1616);
    int _1812 = _1810 + _1792;
    int _1814 = abs(_1798);
    bool _1816 = !_1806;
    float _1818 = _1816 ? 0.0 : as_type<float>(0xffffffffu /* nan */);
    int _1820 = ~_1794;
    int _1822 = _1820 + 1;
    int _1824 = _1822 + 1;
    int _1826 = abs(as_type<int>(_1818));
    float _1828 = _1818;
    float _1830 = as_type<float>(_1812);
    if (!_1790)
    {
        _1828 = _1672;
    }
    float _1832 = _1828;
    int _1834 = _1824 * as_type<int>(_1658);
    int _1836 = _1834 + _1812;
    float _1838 = _1658;
    float _1840 = _1832;
    if (!_1790)
    {
        _1838 = _1670;
    }
    float _1842 = _1838;
    int _1844 = ~_1826;
    int _1846 = _1844 + 1;
    int _1848 = _1846 + 1;
    float _1850 = _1842;
    if (!_1790)
    {
        _1830 = _1808;
    }
    float _1852 = _1830;
    bool _1854 = !_1790;
    float _1856 = _1852;
    if (!_1854)
    {
        float _1858 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1860 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1862 = _1746 + _1860;
        float _1864 = rsqrt(_1710);
        float _1866 = _1862 * _1858;
        float _1868 = _1808 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1870 = _1866 * 0.15915493667125701904296875;
        float _1872 = _1870 * 6.283185482025146484375;
        float _1874 = sin(_1872);
        float _1876 = _1870 * 6.283185482025146484375;
        float _1878 = cos(_1876);
        float _1880 = fma(_1874, _1868, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1882 = _1864 * _1880;
        float _1884 = fma(_1678, _1882, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1886 = _1878 + (-1.0);
        float _1888 = fma(_1682, _1882, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1890 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1892 = _1884 + _1890;
        float _1894 = _1886 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1896 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1898 = _1888 + _1896;
        float _1900 = _1892 * _1892;
        float _1902 = fma(_1808, _1878, _1894);
        float _1904 = _1898 * _1898;
        _1856 = _1902;
        _1714 = _1900;
        _1716 = _1904;
        _1850 = _1884;
        _1840 = _1888;
    }
    float _1906 = _1856;
    float _1908 = _1714;
    float _1910 = _1716;
    float _1912 = _1850;
    float _1914 = _1840;
    float _1916 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1918 = _1906 + _1916;
    int _1920 = ~_1814;
    int _1922 = _1920 + 1;
    int _1924 = _1922 + 1;
    int _1926 = _1848 * as_type<int>(_1666);
    int _1928 = _1926 + _1836;
    bool _1930 = !_1114;
    int _1932 = _1930 ? _1762 : (-1);
    float _1934 = fma(_1918, _1918, _1908);
    float _1936 = _1464 + (-0.5);
    int _1938 = _1928 * _1924;
    float _1940 = -_974;
    float _1942 = _1940 + 1.0;
    float _1944 = _1934 + _1910;
    float _1946 = -_1936;
    float _1948 = -_894;
    float _1950 = fma(_1946, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1948);
    int _1952 = _1932 * _1814;
    int _1954 = _1952 + _1938;
    float _1956 = fma(_1422, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1508);
    float _1958 = -_992;
    float _1960 = _1958 + 1.0;
    float _1962 = _1730 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1964 = sqrt(_1944);
    float _1966 = _1738 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1968 = _1696 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1970 = fma(_1464, _1942, _1950);
    float _1972 = -_1960;
    float _1974 = fma(_948, _1972, _1502);
    float _1976 = _1962 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1978 = _1966 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1980 = _1968 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1982 = _1956 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1984 = float(_1954);
    out.m_68.x = _1974;
    out.m_68.y = _1970;
    out.m_70.x = _1976;
    out.m_70.y = _1978;
    out.m_70.z = _1980;
    out.m_70.w = _1982;
    bool _1986 = _1964 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1988 = isnan(_1964);
    bool _1990 = _1986 || _1988;
    bool _1992 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1994 = _1990 || _1992;
    out.m_72.x = _1984;
    float _1996 = as_type<float>(_1928);
    float _1998 = _1970;
    float _2000 = _1942;
    float _2002 = _1980;
    if (!_1994)
    {
        _1996 = 1.0;
    }
    float _2004 = _1996;
    bool _2006 = !_1994;
    float _2008 = _2004;
    if (!_2006)
    {
        bool _2010 = _1964 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2012 = isnan(_1964);
        bool _2014 = _2010 || _2012;
        bool _2016 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2018 = _2014 || _2016;
        if (!_2018)
        {
            float _2020 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2022 = _1964 + _2020;
            float _2024 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2026 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2024;
            float _2028 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2030 = _2028 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2032 = 1.0 / _2026;
            float _2034 = _2022 * _2032;
            float _2036 = fma(_2034, _2030, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2008 = _2036;
            _2038 = true;
        }
        else
        {
            bool _2040 = _1964 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2042 = isnan(_1964);
            bool _2044 = _2040 || _2042;
            bool _2046 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2048 = _2044 || _2046;
            if (!_2048)
            {
                float _2050 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2052 = _1964 + _2050;
                float _2054 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2056 = _2054 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2058 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2060 = _2058 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2062 = 1.0 / _2056;
                float _2064 = _2052 * _2062;
                float _2066 = fma(_2064, _2060, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2008 = _2066;
                _2038 = true;
            }
            else
            {
                _2008 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2038 = false;
    float _2068 = _2008;
    float _2070 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2072 = _1912 + _2070;
    float _2074 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2076 = _1906 + _2074;
    bool _2078 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2080 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2082 = _2078 || _2080;
    bool _2084 = isnan(0.5);
    bool _2086 = _2082 || _2084;
    float _2088 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2090 = _1914 + _2088;
    float _2092 = fma(_2072, _2068, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2094 = fma(_2076, _2068, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2096 = fma(_2090, _2068, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2098 = _2090;
    float _2100 = _2096;
    if (_2086)
    {
        _2098 = _2092;
    }
    float _2102 = _2098;
    float _2104 = _2102;
    if (_2086)
    {
        _1998 = _2094;
    }
    float _2106 = _1998;
    float _2108 = _2106;
    if (!_2086)
    {
        float _2110 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2112 = _928 + _2110;
        float _2114 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2116 = _912 + _2114;
        float _2118 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2120 = -_1084;
        float _2122 = _2120 + _2096;
        float _2124 = _2112 * _2112;
        float _2126 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2128 = _1084 + _2126;
        float _2130 = fma(_2116, _2116, _2124);
        float _2132 = -_928;
        float _2134 = _2132 + _2094;
        float _2136 = fma(_2128, _2128, _2130);
        float _2138 = -_912;
        float _2140 = _2138 + _2092;
        float _2142 = sqrt(_2136);
        float _2144 = precise::min(_2142, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2146 = _2144 * _2118;
        float _2148 = fma(_2140, _2146, _912);
        float _2150 = fma(_2134, _2146, _928);
        float _2152 = fma(_2122, _2146, _1084);
        _2108 = _2150;
        _2104 = _2148;
        _2100 = _2152;
    }
    float _2154 = _2108;
    float _2156 = _2104;
    float _2158 = _2100;
    float _2160 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2162 = _2154 + _2160;
    float _2164 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2166 = _2156 + _2164;
    float _2168 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2170 = _2158 + _2168;
    float _2172 = _2162 * _2162;
    float _2174 = fma(_2166, _2166, _2172);
    float _2176 = fma(_2170, _2170, _2174);
    float _2178 = rsqrt(_2176);
    float _2180 = _2178 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2182 = _2166 * _2180;
    float _2184 = _2170 * _2180;
    float _2186 = _2182 * _2182;
    float _2188 = _2184 * _2184;
    float _2190 = _2186 + _2188;
    float _2192 = sqrt(_2190);
    bool _2194 = _2192 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2196 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2198 = _2192 + _2196;
    float _2200 = _2178;
    float _2202 = _2198;
    float _2204 = _2162;
    float _2206 = _2180;
    float _2208 = _2182;
    if (_2194)
    {
        float _2210 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2200 = _2210;
    }
    float _2212 = _2200;
    if (_2194)
    {
        float _2214 = rsqrt(_2190);
        _2000 = _2214;
    }
    float _2216 = _2000;
    float _2218 = _2216;
    if (_2194)
    {
        float _2220 = _2198 * _2212;
        _2202 = _2220;
    }
    float _2222 = _2202;
    if (_2194)
    {
        float _2224 = _2222 * 0.15915493667125701904296875;
        _994 = _2224;
    }
    float _2226 = _994;
    float _2228 = _2212;
    if (_2194)
    {
        float _2230 = _2226 * 6.283185482025146484375;
        float _2232 = sin(_2230);
        _2228 = _2232;
    }
    float _2234 = _2228;
    float _2236 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2238 = precise::max(0.0, _2236);
    float _2240 = _2170;
    float _2242 = _2238;
    if (_2194)
    {
        float _2244 = _2226 * 6.283185482025146484375;
        float _2246 = cos(_2244);
        _2240 = _2246;
    }
    float _2248 = _2240;
    float _2250 = -_2180;
    float _2252 = -_2238;
    float _2254 = fma(_2162, _2250, _2252);
    if (!_2194)
    {
        _2204 = _2186;
    }
    float _2256 = _2204;
    float _2258 = _2256;
    if (_2194)
    {
        float _2260 = _2254 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2242 = _2260;
    }
    float _2262 = _2242;
    float _2264 = sqrt(_2176);
    float _2266 = _2234;
    float _2268 = _2262;
    if (_2194)
    {
        float _2270 = fma(_2234, _2262, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2266 = _2270;
    }
    float _2272 = _2266;
    float _2274 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2276 = _2272;
    if (_2194)
    {
        float _2278 = _2248 + (-1.0);
        _2268 = _2278;
    }
    float _2280 = _2268;
    float _2282 = _2280;
    if (_2194)
    {
        float _2284 = _2216 * _2272;
        _2002 = _2284;
    }
    float _2286 = _2002;
    if (!_2194)
    {
        _2218 = _2254;
    }
    float _2288 = _2218;
    float _2290 = _2288;
    if (_2194)
    {
        float _2292 = _2280 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2206 = _2292;
    }
    float _2294 = _2206;
    if (_2194)
    {
        float _2296 = _2182 * _2286;
        _2208 = _2296;
    }
    float _2298 = _2208;
    if (!_2194)
    {
        _2276 = _2184;
    }
    float _2300 = _2276;
    float _2302 = _2300;
    if (_2194)
    {
        float _2304 = _2184 * _2286;
        _2302 = _2304;
    }
    float _2306 = _2302;
    if (_2194)
    {
        float _2308 = fma(_2254, _2248, _2294);
        _2290 = _2308;
    }
    float _2310 = _2290;
    if (_2194)
    {
        float _2312 = _2298 * _2298;
        _2258 = _2312;
    }
    float _2314 = _2258;
    if (!_2194)
    {
        _2282 = _2188;
    }
    float _2316 = _2282;
    float _2318 = _2316;
    if (_2194)
    {
        float _2320 = _2306 * _2306;
        _2318 = _2320;
    }
    float _2322 = _2318;
    float _2324 = fma(_2310, _2310, _2314);
    float _2326 = _2324 + _2322;
    float _2328 = _2154 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2330 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2332 = fma(_2264, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2330);
    float _2334 = precise::clamp(_2332, 0.0, 1.0);
    float _2336 = rsqrt(_2326);
    float _2338 = fma(_2156, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2328);
    float _2340 = _2154 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2342 = -_2334;
    float _2344 = _2342 + 1.0;
    float _2346 = fma(_2158, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2338);
    float _2348 = _2154 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2350 = fma(_2156, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2340);
    float _2352 = _2154 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2354 = abs(_2344);
    float _2356 = log2(_2354);
    float _2358 = fma(_2156, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2348);
    float _2360 = fma(_2158, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2350);
    float _2362 = fma(_2156, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2352);
    float _2364 = _2346 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2366 = fma(_2158, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2358);
    float _2368 = _2360 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2370 = fma(_2158, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2362);
    float _2372 = _2336 * _2298;
    float _2374 = _2366 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2376 = _2368 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2378 = _2336 * _2310;
    float _2380 = _2372 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2382 = _2364 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2384 = fma(_2374, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2376);
    float _2386 = _2336 * _2306;
    float _2388 = _2356 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2390 = -_2380;
    float _2392 = fma(_2378, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2390);
    float _2394 = -_2382;
    float _2396 = fma(_2394, _2274, 1.0);
    float _2398 = _2370 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2400 = fma(_2364, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2384);
    float _2402 = exp2(_2388);
    float _2404 = -_2386;
    float _2406 = fma(_2404, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2392);
    float _2408 = _2368 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2410 = fma(_2398, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2400);
    float _2412 = _2368 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2414 = fma(_2406, -0.5, 0.5);
    float _2416 = fma(_2374, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2408);
    float _2418 = fma(_2406, 0.5, 0.5);
    float _2420 = log2(_2396);
    float _2422 = fma(_2374, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2412);
    float _2424 = _2378 + 1.0;
    float _2426 = fma(_2364, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2416);
    float _2428 = fma(_2418, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2430 = fma(_2364, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2422);
    float _2432 = 1.0 / _2410;
    float _2434 = -_2378;
    float _2436 = fma(_2402, _2424, _2434);
    float _2438 = fma(_2398, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2426);
    float _2440 = fma(_2418, _2428, -0.212114393711090087890625);
    float _2442 = fma(_2398, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2430);
    float _2444 = fma(_2436, 0.5, 0.5);
    float _2446 = fma(_2418, _2440, 1.570728778839111328125);
    float _2448 = sqrt(_2414);
    float _2450 = _2420 * 0.693147182464599609375;
    float _2452 = _2438 * _2432;
    float _2454 = _2442 * _2432;
    float _2456 = _2450 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2458 = fma(_2452, 0.5, 0.5);
    float _2460 = fma(_2454, -0.5, 0.5);
    float _2462 = _2448 * 0.636619746685028076171875;
    float3 _6158 = float3(_2458, _2460, _2456);
    float _2464 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6158, float3(0.0), isnan(_6158)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6158, float3(0.0), isnan(_6158)), level(0.0)).x;
    float3 _6169 = float3(_2458, _2460, _2456);
    float4 _2467 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6169, float3(0.0), isnan(_6169)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6169, float3(0.0), isnan(_6169)), level(0.0)).xyzw;
    float _2469 = _2467.x;
    float _2471 = _2467.y;
    float _2473 = _2467.z;
    float _2475 = _2467.w;
    float _2477 = -_2446;
    float _2479 = fma(_2462, _2477, 1.0);
    float2 _6191 = float2(_2479, _2444);
    float3 _2483 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6191, float2(0.0), isnan(_6191)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6191, float2(0.0), isnan(_6191)), level(0.0)).xyz;
    float _2485 = _2483.x;
    float _2487 = _2483.y;
    float _2489 = _2483.z;
    float _2491 = _2356 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2493 = _2368 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2495 = fma(_2374, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2493);
    float _2497 = exp2(_2491);
    float _2499 = fma(_2364, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2495);
    float _2501 = fma(_2398, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2499);
    float _2503 = _2501 + _2410;
    out.gl_Position.x = _2438;
    out.gl_Position.y = _2442;
    out.gl_Position.z = _2501;
    out.gl_Position.w = _2410;
    float _2505 = -_2497;
    float _2507 = _2505 + 1.0;
    float _2509 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2511 = _2503 * 0.5;
    float _2513 = _2507 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_47.x = _2509;
    out.m_74.z = _2511;
    out.m_74.w = _2410;
    float _2515 = _2513 * _2464;
    float _2517 = -_2513;
    float _2519 = _2517 + 1.0;
    float _2521 = _2475 * _2515;
    float _2523 = _2489 * _2515;
    float _2525 = fma(_2485, _2521, _2469);
    float _2527 = fma(_2487, _2521, _2471);
    float _2529 = _2475 * _2519;
    float _2531 = fma(_2475, _2523, _2473);
    out.m_76.x = _2525;
    out.m_76.y = _2527;
    out.m_76.z = _2531;
    out.m_76.w = _2529;
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
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2038 = false;
    bool _710 = false;
    bool _481 = false;
    bool _277 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _90 = in.m_44.w;
    float _92 = trunc(_90);
    int _95 = int(_92);
    bool _99 = _95 >= 1;
    float _101 = 0.0;
    if (!_99)
    {
        _101 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _103 = _101;
    float _105 = _103;
    if (!_99)
    {
        out.m_47.x = 0.0;
    }
    int _107 = 0;
    if (!_99)
    {
        float _109 = _103 * 5.0;
        _107 = as_type<int>(_109);
    }
    int _111 = _107;
    int _113 = _111;
    if (!_99)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2588 = as_type<float>(_111);
        out.gl_Position.z = _2588;
    }
    if (!_99)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _115 = in.m_49.w;
    bool _117 = _115 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _119 = isnan(_115);
    bool _121 = _117 || _119;
    bool _123 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _125 = _121 || _123;
    float _127 = -_115;
    float _129 = _127 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _131 = _129;
    if (_125)
    {
        float _133 = float(_95);
        _105 = _133;
    }
    float _135 = _105;
    bool _137 = _129 >= _135;
    bool _139 = !_125;
    bool _141 = _137 || _139;
    float _143 = _135;
    if (_141)
    {
        _143 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _145 = _143;
    if (_141)
    {
        out.m_47.x = 0.0;
    }
    if (_141)
    {
        float _147 = _145 * 5.0;
        _113 = as_type<int>(_147);
    }
    int _149 = _113;
    if (_141)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2658 = as_type<float>(_149);
        out.gl_Position.z = _2658;
    }
    if (_141)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _151 = in.m_51.x;
    float _153 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _155 = _129 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _157 = as_type<float>(int(gl_VertexIndex));
    float _159 = _155 * _153;
    float _161 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[20].x, _159);
    int _163 = as_type<int>(_157) & 1;
    bool _165 = _163 != 0;
    int _167 = as_type<int>(_157) & 2;
    bool _169 = _167 != 0;
    float _171 = _161 * 6.283185482025146484375;
    float _173 = floor(_161);
    float _175 = _171 * 0.15915493667125701904296875;
    bool _177 = !_169;
    float _179 = _177 ? (-0.5) : 0.5;
    int _181 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _183 = _181 != 0;
    int _185 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _187 = _185 != 0;
    int _189 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _191 = _189 != 0;
    float _193 = _175 * 6.283185482025146484375;
    float _195 = cos(_193);
    bool _197 = !_165;
    float _199 = _197 ? (-0.5) : 0.5;
    bool _201 = !_183;
    int _203 = _201 ? 0 : 1;
    bool _205 = !_191;
    int _207 = _205 ? 0 : 1;
    int _209 = abs(_203);
    float _211 = -_173;
    float _213 = _161 + _211;
    int _215 = abs(_207);
    float _217 = -_213;
    float _219 = fma(_217, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _221 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _223 = float(_209);
    float _225 = fma(_195, 0.5, 0.5);
    bool _227 = !_187;
    int _229 = _227 ? 0 : 1;
    bool _231 = _213 < 0.5;
    float _233 = float(_231);
    float _235 = abs(_219);
    float _237 = _223 * _235;
    int _239 = abs(_229);
    float _241 = -_225;
    float _243 = fma(_241, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _245 = float(_215);
    float _247 = -_233;
    float _249 = fma(_247, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _251 = float(_239);
    float _253 = fma(_245, _243, _237);
    float _255 = abs(_249);
    float _257 = fma(_251, _255, _253);
    bool _259 = !_221;
    float _275;
    if (!_259)
    {
        float _261 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _263 = _151 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _265 = fma(_263, (*spvDescriptorSet0.vp_c9)._m0[12].x, _129);
        float _267 = _265 * _261;
        float _269 = floor(_267);
        float _271 = -_269;
        float _273 = _267 + _271;
        _275 = _273;
        _277 = true;
    }
    else
    {
        float _279 = float(_95);
        float _281 = 1.0 / _279;
        float _283 = _129 * _281;
        _275 = _283;
    }
    _277 = false;
    float _285 = _275;
    float _287 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _289 = _285 + _287;
    bool _291 = _285 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _293 = isnan(_285);
    bool _295 = _291 || _293;
    bool _297 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _299 = _295 || _297;
    float _301 = float(_299);
    float _303 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _305 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _303;
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _309 = _307 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _313 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _311;
    float _315 = 1.0 / _305;
    bool _317 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _319 = 1.0 / _309;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _323 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _321;
    float _325 = 1.0 / _313;
    float _327 = _289 * _315;
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _331 = _285 + _329;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _335 = _285 + _333;
    float _337 = fma(_323, _327, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _339 = _331 * _319;
    bool _341 = _285 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _343 = isnan(_285);
    bool _345 = _341 || _343;
    bool _347 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _349 = _345 || _347;
    float _351 = float(_349);
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _355 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _353;
    float _357 = -_351;
    float _359 = _357 + 1.0;
    float _361 = fma(_355, _327, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _363 = _335 * _325;
    float _365 = -_301;
    float _367 = _365 + 1.0;
    bool _369 = _285 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _371 = isnan(_285);
    bool _373 = _369 || _371;
    bool _375 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _377 = _373 || _375;
    float _379 = float(_377);
    float _381 = _351 * _367;
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _385 = _383 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _387 = _379 * _359;
    float _389 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _391 = -_379;
    float _393 = _391 + 1.0;
    bool _395 = _285 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _397 = isnan(_285);
    bool _399 = _395 || _397;
    bool _401 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _403 = _399 || _401;
    float _405 = float(_403);
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _409 = _407 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _411 = fma(_385, _339, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _413 = _389 * _151;
    float _415 = _405 * _393;
    float _417 = fma(_409, _339, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _419 = -_405;
    float _421 = _419 + 1.0;
    float _423 = _337 * _415;
    float _425 = _361 * _415;
    float _427 = trunc(_413);
    int _429 = int(_427);
    float _431 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _433 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _431;
    float _435 = fma(_421, (*spvDescriptorSet0.vp_c9)._m0[143].x, _423);
    float _437 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _439 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _437;
    float _441 = fma(_421, (*spvDescriptorSet0.vp_c9)._m0[143].y, _425);
    float _443 = fma(_433, _363, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _445 = fma(_417, _387, _435);
    float _447 = fma(_439, _363, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _449 = fma(_411, _387, _441);
    float _451 = fma(_443, _381, _445);
    float _453 = fma(_447, _381, _449);
    float _455 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[146].x, _451);
    float _457 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[146].y, _453);
    int _459 = _429 << 4;
    int _461 = _459 + 1712;
    bool _463 = !_317;
    float _479;
    if (!_463)
    {
        float _465 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _467 = _151 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _469 = fma(_467, (*spvDescriptorSet0.vp_c9)._m0[11].y, _129);
        float _471 = _469 * _465;
        float _473 = floor(_471);
        float _475 = -_473;
        float _477 = _471 + _475;
        _479 = _477;
        _481 = true;
    }
    else
    {
        float _483 = float(_95);
        float _485 = 1.0 / _483;
        float _487 = _129 * _485;
        _479 = _487;
    }
    _481 = false;
    float _489 = _479;
    uint _492 = uint(int(uint(_461) >> uint(2)));
    uint _494 = uint(int(uint(int(_492)) >> uint(2)));
    int _496 = int(_492) & 3;
    float _498 = (*spvDescriptorSet0.vp_c9)._m0[int(_494)][_496];
    int _500 = int(_492) + 1;
    uint _502 = uint(int(uint(_500) >> uint(2)));
    int _504 = _500 & 3;
    float _506 = (*spvDescriptorSet0.vp_c9)._m0[int(_502)][_504];
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _510 = _508 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _514 = _512 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _516 = _489 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _518 = isnan(_489);
    bool _520 = _516 || _518;
    bool _522 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _524 = _520 || _522;
    float _526 = float(_524);
    int _528 = _461 + 8;
    uint _530 = uint(int(uint(_528) >> uint(2)));
    uint _532 = uint(int(uint(int(_530)) >> uint(2)));
    int _534 = int(_530) & 3;
    float _536 = (*spvDescriptorSet0.vp_c9)._m0[int(_532)][_534];
    float _538 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _540 = _538 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _542 = 1.0 / _510;
    bool _544 = _489 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _546 = isnan(_489);
    bool _548 = _544 || _546;
    bool _550 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _552 = _548 || _550;
    float _554 = float(_552);
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _558 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _556;
    float _560 = -_526;
    float _562 = _560 + 1.0;
    bool _564 = _489 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _566 = isnan(_489);
    bool _568 = _564 || _566;
    bool _570 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _572 = _568 || _570;
    float _574 = float(_572);
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _578 = _576 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _580 = _554 * _562;
    float _582 = 1.0 / _514;
    float _584 = -_554;
    float _586 = _584 + 1.0;
    bool _588 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _590 = _574 * _586;
    float _592 = -_574;
    float _594 = _592 + 1.0;
    float _596 = 1.0 / _540;
    float _598 = _558 * _542;
    float _600 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _602 = _489 + _600;
    float _604 = fma(_598, _602, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _606 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _608 = _489 + _606;
    float _610 = _578 * _582;
    bool _612 = _489 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _614 = isnan(_489);
    bool _616 = _612 || _614;
    bool _618 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _620 = _616 || _618;
    float _622 = float(_620);
    float _624 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _626 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _624;
    float _628 = _604 * _590;
    float _630 = fma(_610, _608, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _634 = _489 + _632;
    float _636 = -_622;
    float _638 = _636 + 1.0;
    float _640 = fma(_594, (*spvDescriptorSet0.vp_c9)._m0[115].x, _628);
    float _642 = _626 * _596;
    float _644 = _526 * _638;
    float _646 = fma(_630, _580, _640);
    float _648 = fma(_642, _634, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _650 = _498 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _652 = _506 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _654 = fma(_648, _644, _646);
    float _656 = _650 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _658 = _652 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _660 = fma(_622, (*spvDescriptorSet0.vp_c9)._m0[118].x, _654);
    float _662 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _664 = _536 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _666 = in.m_56.x;
    float _668 = in.m_56.y;
    float _670 = _660 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _672 = _664 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _674 = _662 * _151;
    out.m_58.x = _656;
    out.m_58.y = _658;
    out.m_58.z = _672;
    out.m_58.w = _670;
    float _676 = trunc(_674);
    int _678 = int(_676);
    float _680 = _457 * _668;
    float _682 = _455 * _666;
    int _684 = _678 << 4;
    int _686 = _684 + 1968;
    bool _688 = !_588;
    float _706;
    float _708;
    if (!_688)
    {
        float _690 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _692 = _151 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _694 = float(_95);
        float _696 = fma(_692, (*spvDescriptorSet0.vp_c9)._m0[11].w, _129);
        float _698 = _696 * _690;
        float _700 = floor(_698);
        float _702 = -_700;
        float _704 = _698 + _702;
        _706 = _694;
        _708 = _704;
        _710 = true;
    }
    else
    {
        float _712 = float(_95);
        float _714 = 1.0 / _712;
        float _716 = _129 * _714;
        _706 = _712;
        _708 = _716;
    }
    _710 = false;
    float _718 = _706;
    float _720 = _708;
    float _722 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _724 = int(_722);
    float _726 = in.m_44.x;
    float _728 = in.m_44.y;
    float _730 = in.m_44.z;
    float _732 = _257 * _682;
    float _734 = _257 * _680;
    float _736 = in.m_60.x;
    float _738 = in.m_60.y;
    float _740 = in.m_60.z;
    float _742 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _179);
    float _744 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _746 = int(_744);
    float _748 = in.m_62.x;
    float _750 = in.m_62.y;
    float _752 = in.m_62.z;
    int _754 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _756 = _754 != 0;
    float _758 = _734 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _760 = in.m_51.y;
    int _762 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _764 = _762 != 0;
    int _766 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _768 = _766 != 0;
    int _770 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _772 = _770 != 0;
    float _774 = float(_724);
    float _776 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _778 = log2(_776);
    float _780 = in.m_64.x;
    float _782 = in.m_64.y;
    float _784 = in.m_64.z;
    bool _786 = _151 > 0.5;
    bool _788 = !_756;
    float _790 = _788 ? 7.345489978790283203125 : 1.0;
    int _792 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _794 = _792 != 0;
    float _796 = 1.0 / _774;
    float _798 = float(uint(_746));
    int _800 = ~_746;
    int _802 = _800 + 1;
    float _804 = _728 * _738;
    bool _806 = !_768;
    int _808 = _806 ? 0 : 1;
    int _810 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _812 = _810 != 0;
    float _814 = 1.0 / _798;
    float _816 = fma(_726, _736, _804);
    float _818 = _151 * 2.0;
    float _820 = _728 * _750;
    float _822 = _778 * _129;
    int _824 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _826 = _824 != 0;
    float _828 = _760 * 2.0;
    float _830 = fma(_726, _748, _820);
    float _832 = _796 * _129;
    float _834 = _728 * _782;
    float _836 = exp2(_822);
    float _838 = _151 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _840 = fma(_726, _780, _834);
    float _842 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _844 = as_type<int>(_814) + (-2);
    float _846 = fma(_730, _740, _816);
    float _848 = trunc(_832);
    int _850 = int(_848);
    float _852 = -_842;
    float _854 = fma(_838, 2.0, _852);
    bool _856 = !_764;
    int _858 = _856 ? 0 : 1;
    float _860 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _862 = _760 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _864 = !_772;
    int _866 = _864 ? 0 : 1;
    float _868 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _870 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _872 = isnan(0.0);
    bool _874 = _870 || _872;
    bool _876 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _878 = _874 || _876;
    float _880 = floor(_818);
    float _882 = fma(_862, -2.0, _860);
    float _884 = -_836;
    float _886 = _884 + 1.0;
    float _888 = fma(_760, (*spvDescriptorSet0.vp_c9)._m0[78].w, _868);
    float _890 = -_129;
    float _892 = fma(_890, (*spvDescriptorSet0.vp_c9)._m0[76].x, _854);
    float _894 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[76].y, _882);
    float _896 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _898 = float(uint(_850));
    float _900 = floor(_828);
    float _902 = fma(_730, _752, _830);
    float _904 = _878 ? _886 : 0.0;
    float _906 = as_type<float>(_844) * _898;
    float _908 = -_199;
    int _910 = _786 ? as_type<int>(_908) : as_type<int>(_199);
    float _912 = _902 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _914 = _880 > 0.0;
    float _916 = 1.0 / _718;
    bool _918 = _880 >= 0.0;
    bool _920 = isnan(_880);
    bool _922 = _918 || _920;
    bool _924 = isnan(0.0);
    bool _926 = _922 || _924;
    float _928 = _846 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _930 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _932 = isnan(1.0);
    bool _934 = _930 || _932;
    bool _936 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _938 = _934 || _936;
    float _940 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _942 = 1.0 + _940;
    float _944 = float(_746);
    bool _946 = !_794;
    float _948 = _946 ? _199 : as_type<float>(_910);
    float _950 = trunc(_906);
    float _952 = precise::max(_950, 0.0);
    uint _954 = uint(_952);
    int _956 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _958 = _956 != 0;
    float _960 = _944 * _129;
    float _962 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _199);
    int _964 = _926 ? 0 : 1;
    float _966 = 1.0 / _942;
    float _968 = _960 * _916;
    int _970 = _802 * int(_954);
    int _972 = _970 + _850;
    float _974 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].w, _888);
    bool _976 = !_812;
    int _978 = _976 ? 0 : 1;
    float _980 = trunc(_968);
    int _982 = int(_980);
    float _984 = float(uint(_972));
    float _986 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[78].z, _896);
    int _988 = abs(_978);
    float _990 = as_type<float>(_844) * _984;
    float _992 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].z, _986);
    float _994 = _928;
    if (_938)
    {
        float _996 = _904 * _966;
        _131 = _996;
    }
    float _998 = _131;
    float _1000 = _732 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1002 = trunc(_990);
    float _1004 = precise::max(_1002, 0.0);
    uint _1006 = uint(_1004);
    int _1008 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1010 = _1008 != 0;
    int _1012 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1014 = _1012 != 0;
    int _1016 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1018 = _1016 != 0;
    float _1020 = _790 * _151;
    int _1022 = ~_746;
    int _1024 = _1022 + 1;
    float _1026 = _1000 * _962;
    float _1028 = float(_850);
    float _1030 = in.m_51.z;
    bool _1032 = !_958;
    int _1034 = _1032 ? 0 : 1;
    float _1036 = floor(_1020);
    int _1038 = int(_954) + int(_1006);
    bool _1040 = _1028 >= _944;
    bool _1042 = isnan(_1028);
    bool _1044 = _1040 || _1042;
    bool _1046 = isnan(_944);
    bool _1048 = _1044 || _1046;
    float _1050 = float(_1048);
    float _1052 = _758 * _742;
    float _1054 = fma(_730, _784, _840);
    int _1056 = _1024 * _1038;
    int _1058 = _1056 + _850;
    float _1060 = -_1036;
    float _1062 = _1020 + _1060;
    float _1064 = _151 + _760;
    float _1066 = trunc(_1050);
    int _1068 = int(_1066);
    float _1070 = _1062 * _944;
    bool _1072 = uint(_1058) >= uint(_746);
    float _1074 = _1064 + (-1.0);
    float _1076 = _1030 * 2.0;
    int _1078 = ~_964;
    int _1080 = _1078 + 1;
    int _1082 = _1080 + 1;
    float _1084 = _1054 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1086 = !_1072;
    int _1088 = _1086 ? 0 : (-1);
    float _1090 = fma(_1074, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1092 = _900 >= 0.0;
    bool _1094 = isnan(_900);
    bool _1096 = _1092 || _1094;
    bool _1098 = isnan(0.0);
    bool _1100 = _1096 || _1098;
    float _1102 = trunc(_1070);
    int _1104 = int(_1102);
    int _1106 = ~_1038;
    int _1108 = _1106 + _1088;
    int _1110 = _1108 + 1;
    int _1112 = _1100 ? 0 : 1;
    bool _1114 = _746 == 0;
    int _1116 = _746 * _1110;
    int _1118 = _1116 + _850;
    int _1120 = ~_1068;
    int _1122 = _1120 + 1;
    int _1124 = _1122 + 1;
    int _1126 = _1082;
    if (!_914)
    {
        int _1128 = ~_964;
        int _1130 = _1128 + 1;
        _1126 = _1130;
    }
    int _1132 = _1126;
    bool _1134 = !_1114;
    int _1136 = _1134 ? _1118 : (-1);
    float _1138 = floor(_1076);
    int _1140 = abs(_808);
    int _1142 = _746 + (-1);
    int _1144 = _1136 * _1124;
    bool _1146 = _900 > 0.0;
    int _1148 = _1068 * _1142;
    int _1150 = _1148 + _1144;
    int _1152 = abs(_858);
    int _1154 = _1150 * _1140;
    int _1156 = ~_1112;
    int _1158 = _1156 + 1;
    int _1160 = _1158 + 1;
    int _1162 = _1104 * _988;
    int _1164 = _1162 + _850;
    int _1166 = abs(_866);
    int _1168 = _982 * _1152;
    int _1170 = _1168 + _1154;
    int _1172 = _1160;
    if (!_1146)
    {
        int _1174 = ~_1112;
        int _1176 = _1174 + 1;
        _1172 = _1176;
    }
    int _1178 = _1172;
    float _1180 = _760 + _1030;
    bool _1182 = _1138 >= 0.0;
    bool _1184 = isnan(_1138);
    bool _1186 = _1182 || _1184;
    bool _1188 = isnan(0.0);
    bool _1190 = _1186 || _1188;
    int _1192 = _1164 * _1166;
    int _1194 = _1192 + _1170;
    int _1196 = abs(_1034);
    float _1198 = _1180 + (-1.0);
    int _1200 = _1190 ? 0 : 1;
    bool _1202 = _1138 > 0.0;
    int _1204 = _1104 * _1196;
    int _1206 = _1204 + _1194;
    bool _1208 = !_1014;
    int _1210 = _1208 ? 0 : 1;
    float _1212 = float(uint(_1206));
    float _1214 = fma(_1198, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1216 = abs(_1210);
    bool _1218 = !_1018;
    int _1220 = _1218 ? 0 : 1;
    float _1222 = as_type<float>(_844) * _1212;
    bool _1224 = !_1010;
    int _1226 = _1224 ? 0 : 1;
    int _1228 = ~_1200;
    int _1230 = _1228 + 1;
    int _1232 = _1230 + 1;
    int _1234 = _1232;
    if (!_1202)
    {
        int _1236 = ~_1200;
        int _1238 = _1236 + 1;
        _1234 = _1238;
    }
    int _1240 = _1234;
    float _1242 = trunc(_1222);
    float _1244 = precise::max(_1242, 0.0);
    uint _1246 = uint(_1244);
    int _1248 = abs(_1220);
    int _1250 = abs(_1226);
    float _1252 = float(_1132);
    float _1254 = in.m_66.x;
    float _1256 = in.m_66.y;
    float _1258 = in.m_66.z;
    float _1260 = float(_1216);
    int _1262 = ~_746;
    int _1264 = _1262 + 1;
    float _1266 = _1260 * _1252;
    float _1268 = float(_1250);
    float _1270 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1272 = _1270 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1274 = float(_1248);
    int _1276 = _1264 * int(_1246);
    int _1278 = _1276 + _1206;
    float _1280 = float(_1178);
    float _1282 = float(_1240);
    float _1284 = 1.0 / _1272;
    float _1286 = _1274 * _1280;
    float _1288 = _1266 * (-2.0);
    float _1290 = _1268 * _1282;
    bool _1292 = _760 > 0.5;
    float _1294 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1296 = _1294 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1298 = float(uint(_1164));
    float _1300 = _760 + (-0.5);
    float _1302 = float(uint(_1278));
    float _1304 = fma(_1288, _1256, _1256);
    float _1306 = fma(_1214, _1288, _1214);
    float _1308 = as_type<float>(_844) * _1298;
    float _1310 = _1290 * (-2.0);
    float _1312 = fma(_1300, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1304);
    float _1314 = as_type<float>(_844) * _1302;
    float _1316 = fma(_1090, _1310, _1090);
    float _1318 = fma(_1306, _998, _1312);
    float _1320 = trunc(_1314);
    float _1322 = precise::max(_1320, 0.0);
    uint _1324 = uint(_1322);
    float _1326 = _151 + (-0.5);
    float _1328 = _151 + _1030;
    float _1330 = _1318 * 0.15915493667125701904296875;
    float _1332 = fma(_1310, _1254, _1254);
    float _1334 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1336 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1334;
    float _1338 = _1328 + (-1.0);
    float _1340 = _1286 * (-2.0);
    float _1342 = 1.0 / _1296;
    float _1344 = fma(_1326, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1332);
    float _1346 = _1336 * _1284;
    float _1348 = fma(_1340, _1258, _1258);
    float _1350 = _1030 + (-0.5);
    float _1352 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1354 = _1352 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1356 = fma(_1316, _998, _1344);
    int _1358 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1360 = _1358 != 0;
    float _1362 = trunc(_1308);
    float _1364 = precise::max(_1362, 0.0);
    uint _1366 = uint(_1364);
    float _1368 = fma(_1350, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1348);
    int _1370 = int(_1246) + int(_1324);
    float _1372 = _1356 * 0.15915493667125701904296875;
    int _1374 = ~_746;
    int _1376 = _1374 + 1;
    bool _1378 = _720 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1380 = isnan(_720);
    bool _1382 = _1378 || _1380;
    bool _1384 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1386 = _1382 || _1384;
    float _1388 = float(_1386);
    float _1390 = _1330 * 6.283185482025146484375;
    float _1392 = sin(_1390);
    int _1394 = _1376 * _1370;
    int _1396 = _1394 + _1206;
    float _1398 = -_1388;
    float _1400 = _1398 + 1.0;
    float _1402 = fma(_1338, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1404 = _1330 * 6.283185482025146484375;
    float _1406 = cos(_1404);
    float _1408 = fma(_1402, _1340, _1402);
    float _1410 = _1354 * _1342;
    bool _1412 = _720 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1414 = isnan(_720);
    bool _1416 = _1412 || _1414;
    bool _1418 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1420 = _1416 || _1418;
    float _1422 = float(_1420);
    float _1424 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1426 = _720 + _1424;
    float _1428 = fma(_1408, _998, _1368);
    bool _1430 = _720 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1432 = isnan(_720);
    bool _1434 = _1430 || _1432;
    bool _1436 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1438 = _1434 || _1436;
    float _1440 = float(_1438);
    float _1442 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1444 = _720 + _1442;
    float _1446 = -_1422;
    float _1448 = _1446 + 1.0;
    float _1450 = _1428 * 0.15915493667125701904296875;
    float _1452 = -_179;
    int _1454 = _1292 ? as_type<int>(_1452) : as_type<int>(_179);
    float _1456 = fma(_1346, _1426, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1458 = _1388 * _1448;
    float _1460 = _1440 * _1400;
    bool _1462 = !_826;
    float _1464 = _1462 ? _179 : as_type<float>(_1454);
    float _1466 = _1372 * 6.283185482025146484375;
    float _1468 = sin(_1466);
    bool _1470 = uint(_1396) >= uint(_746);
    float _1472 = fma(_1410, _1444, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    int _1474 = ~_746;
    int _1476 = _1474 + 1;
    float _1478 = _1456 * _1460;
    float _1480 = -_1440;
    float _1482 = _1480 + 1.0;
    bool _1484 = !_1470;
    int _1486 = _1484 ? 0 : (-1);
    float _1488 = _948 + 0.5;
    float _1490 = _1372 * 6.283185482025146484375;
    float _1492 = cos(_1490);
    float _1494 = fma(_1482, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1478);
    int _1496 = ~_1370;
    int _1498 = _1496 + _1486;
    int _1500 = _1498 + 1;
    float _1502 = fma(_1488, (*spvDescriptorSet0.vp_c9)._m0[80].x, _892);
    int _1504 = _1476 * int(_1366);
    int _1506 = _1504 + _1164;
    float _1508 = fma(_1472, _1458, _1494);
    float _1510 = _1450 * 6.283185482025146484375;
    float _1512 = sin(_1510);
    int _1514 = _746 * _1500;
    int _1516 = _1514 + _1206;
    float _1518 = _1468 * _1406;
    float _1520 = float(uint(_1506));
    bool _1522 = !_1114;
    int _1524 = _1522 ? _1516 : (-1);
    float _1526 = _1450 * 6.283185482025146484375;
    float _1528 = cos(_1526);
    float _1530 = _1492 * _1392;
    float _1532 = as_type<float>(_844) * _1520;
    float _1534 = _1468 * _1392;
    int _1536 = _1524 >> 31;
    int _1538 = _1524 & 3;
    bool _1540 = _1538 != 0;
    float _1542 = -_1530;
    float _1544 = fma(_1512, _1518, _1542);
    float _1546 = -_1518;
    float _1548 = fma(_1512, _1530, _1546);
    float _1550 = _1492 * _1406;
    int _1552 = _1536 & 3;
    float _1554 = trunc(_1532);
    float _1556 = precise::max(_1554, 0.0);
    uint _1558 = uint(_1556);
    bool _1560 = uint(_1538) > 1u;
    int _1562 = _1524 + _1552;
    float _1564 = _1392 * _1528;
    float _1566 = _1406 * _1528;
    float _1568 = _1528 * _1052;
    float _1570 = -_1052;
    float _1572 = _1512 * _1570;
    float _1574 = fma(_1512, _1550, _1534);
    float _1576 = fma(_1512, _1534, _1550);
    float _1578 = _1492 * _1568;
    float _1580 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1582 = _1468 * _1568;
    float _1584 = fma(_1566, _1026, _1572);
    float _1586 = fma(_1574, _1026, _1578);
    int _1588 = _1562 >> 2;
    float _1590 = fma(_1544, _1026, _1582);
    float _1592 = fma(_1564, _1580, _1584);
    float _1594 = fma(_1548, _1580, _1586);
    int _1596 = _1588 << 4;
    int _1598 = _1596 + 368;
    float _1600 = fma(_1576, _1580, _1590);
    int _1602 = ~_746;
    int _1604 = _1602 + 1;
    float _1606 = _1594 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1608 = _1594 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    uint _1610 = uint(int(uint(_1598) >> uint(2)));
    uint _1612 = uint(int(uint(int(_1610)) >> uint(2)));
    int _1614 = int(_1610) & 3;
    float _1616 = (*spvDescriptorSet0.vp_c9)._m0[int(_1612)][_1614];
    int _1618 = int(_1610) + 1;
    uint _1620 = uint(int(uint(_1618) >> uint(2)));
    int _1622 = _1618 & 3;
    float _1624 = (*spvDescriptorSet0.vp_c9)._m0[int(_1620)][_1622];
    int _1626 = int(_1366) + int(_1558);
    float _1628 = fma(_1592, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1606);
    float _1630 = fma(_1592, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1608);
    int _1632 = _1524 & 3;
    bool _1634 = _1632 != 0;
    float _1636 = fma(_1600, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1628);
    float _1638 = fma(_1600, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1630);
    int _1640 = _1604 * _1626;
    int _1642 = _1640 + _1164;
    int _1644 = _1634 ? 0 : 1;
    float _1646 = _1636 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1648 = _1638 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    int _1650 = _1598 + 8;
    uint _1652 = uint(int(uint(_1650) >> uint(2)));
    uint _1654 = uint(int(uint(int(_1652)) >> uint(2)));
    int _1656 = int(_1652) & 3;
    float _1658 = (*spvDescriptorSet0.vp_c9)._m0[int(_1654)][_1656];
    int _1660 = int(_1652) + 1;
    uint _1662 = uint(int(uint(_1660) >> uint(2)));
    int _1664 = _1660 & 3;
    float _1666 = (*spvDescriptorSet0.vp_c9)._m0[int(_1662)][_1664];
    bool _1668 = uint(_1642) >= uint(_746);
    float _1670 = _912 + _1646;
    float _1672 = _1084 + _1648;
    bool _1674 = _1538 != 3;
    float _1676 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1678 = _1670 + _1676;
    float _1680 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1682 = _1672 + _1680;
    bool _1684 = !_1668;
    int _1686 = _1684 ? 0 : (-1);
    int _1688 = _686 + 8;
    uint _1690 = uint(int(uint(_1688) >> uint(2)));
    uint _1692 = uint(int(uint(int(_1690)) >> uint(2)));
    int _1694 = int(_1690) & 3;
    float _1696 = (*spvDescriptorSet0.vp_c9)._m0[int(_1692)][_1694];
    float _1698 = _1678 * _1678;
    float _1700 = _1682 * _1682;
    int _1702 = ~_1644;
    int _1704 = _1702 + 1;
    int _1706 = _1704 + 1;
    bool _1708 = uint(_1538) >= 2u;
    float _1710 = _1698 + _1700;
    int _1712 = _1706;
    float _1714 = _1698;
    float _1716 = _1700;
    if (!_1560)
    {
        int _1718 = ~_1644;
        int _1720 = _1718 + 1;
        _1712 = _1720;
    }
    int _1722 = _1712;
    uint _1724 = uint(int(uint(_686) >> uint(2)));
    uint _1726 = uint(int(uint(int(_1724)) >> uint(2)));
    int _1728 = int(_1724) & 3;
    float _1730 = (*spvDescriptorSet0.vp_c9)._m0[int(_1726)][_1728];
    int _1732 = int(_1724) + 1;
    uint _1734 = uint(int(uint(_1732) >> uint(2)));
    int _1736 = _1732 & 3;
    float _1738 = (*spvDescriptorSet0.vp_c9)._m0[int(_1734)][_1736];
    int _1740 = ~_1626;
    int _1742 = _1740 + _1686;
    int _1744 = _1742 + 1;
    float _1746 = sqrt(_1710);
    float _1748 = _1594 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _1750 = !_1540;
    int _1752 = _1750 ? 0 : 1;
    int _1754 = _1708 ? 0 : 1;
    float _1756 = fma(_1592, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1748);
    int _1758 = abs(_1722);
    int _1760 = _746 * _1744;
    int _1762 = _1760 + _1164;
    int _1764 = abs(_1752);
    float _1766 = fma(_1600, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1756);
    int _1768 = ~_1754;
    int _1770 = _1768 + 1;
    int _1772 = _1770 + 1;
    int _1774 = _1772;
    if (_1674)
    {
        int _1776 = ~_1754;
        int _1778 = _1776 + 1;
        _1774 = _1778;
    }
    int _1780 = _1774;
    float _1782 = _1766 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _1784 = ~_1758;
    int _1786 = _1784 + 1;
    int _1788 = _1786 + 1;
    bool _1790 = _1746 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1792 = _1788 * as_type<int>(_1624);
    int _1794 = abs(_1780);
    bool _1796 = !_1360;
    int _1798 = _1796 ? 0 : 1;
    int _1800 = ~_1764;
    int _1802 = _1800 + 1;
    int _1804 = _1802 + 1;
    bool _1806 = _1538 != 3;
    float _1808 = _928 + _1782;
    int _1810 = _1804 * as_type<int>(_1616);
    int _1812 = _1810 + _1792;
    int _1814 = abs(_1798);
    bool _1816 = !_1806;
    float _1818 = _1816 ? 0.0 : as_type<float>(0xffffffffu /* nan */);
    int _1820 = ~_1794;
    int _1822 = _1820 + 1;
    int _1824 = _1822 + 1;
    int _1826 = abs(as_type<int>(_1818));
    float _1828 = _1818;
    float _1830 = as_type<float>(_1812);
    if (!_1790)
    {
        _1828 = _1672;
    }
    float _1832 = _1828;
    int _1834 = _1824 * as_type<int>(_1658);
    int _1836 = _1834 + _1812;
    float _1838 = _1658;
    float _1840 = _1832;
    if (!_1790)
    {
        _1838 = _1670;
    }
    float _1842 = _1838;
    int _1844 = ~_1826;
    int _1846 = _1844 + 1;
    int _1848 = _1846 + 1;
    float _1850 = _1842;
    if (!_1790)
    {
        _1830 = _1808;
    }
    float _1852 = _1830;
    bool _1854 = !_1790;
    float _1856 = _1852;
    if (!_1854)
    {
        float _1858 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1860 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1862 = _1746 + _1860;
        float _1864 = rsqrt(_1710);
        float _1866 = _1862 * _1858;
        float _1868 = _1808 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1870 = _1866 * 0.15915493667125701904296875;
        float _1872 = _1870 * 6.283185482025146484375;
        float _1874 = sin(_1872);
        float _1876 = _1870 * 6.283185482025146484375;
        float _1878 = cos(_1876);
        float _1880 = fma(_1874, _1868, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1882 = _1864 * _1880;
        float _1884 = fma(_1678, _1882, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1886 = _1878 + (-1.0);
        float _1888 = fma(_1682, _1882, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1890 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1892 = _1884 + _1890;
        float _1894 = _1886 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1896 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1898 = _1888 + _1896;
        float _1900 = _1892 * _1892;
        float _1902 = fma(_1808, _1878, _1894);
        float _1904 = _1898 * _1898;
        _1856 = _1902;
        _1714 = _1900;
        _1716 = _1904;
        _1850 = _1884;
        _1840 = _1888;
    }
    float _1906 = _1856;
    float _1908 = _1714;
    float _1910 = _1716;
    float _1912 = _1850;
    float _1914 = _1840;
    float _1916 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1918 = _1906 + _1916;
    int _1920 = ~_1814;
    int _1922 = _1920 + 1;
    int _1924 = _1922 + 1;
    int _1926 = _1848 * as_type<int>(_1666);
    int _1928 = _1926 + _1836;
    bool _1930 = !_1114;
    int _1932 = _1930 ? _1762 : (-1);
    float _1934 = fma(_1918, _1918, _1908);
    float _1936 = _1464 + (-0.5);
    int _1938 = _1928 * _1924;
    float _1940 = -_974;
    float _1942 = _1940 + 1.0;
    float _1944 = _1934 + _1910;
    float _1946 = -_1936;
    float _1948 = -_894;
    float _1950 = fma(_1946, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1948);
    int _1952 = _1932 * _1814;
    int _1954 = _1952 + _1938;
    float _1956 = fma(_1422, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1508);
    float _1958 = -_992;
    float _1960 = _1958 + 1.0;
    float _1962 = _1730 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1964 = sqrt(_1944);
    float _1966 = _1738 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1968 = _1696 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1970 = fma(_1464, _1942, _1950);
    float _1972 = -_1960;
    float _1974 = fma(_948, _1972, _1502);
    float _1976 = _1962 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1978 = _1966 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1980 = _1968 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1982 = _1956 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1984 = float(_1954);
    out.m_68.x = _1974;
    out.m_68.y = _1970;
    out.m_70.x = _1976;
    out.m_70.y = _1978;
    out.m_70.z = _1980;
    out.m_70.w = _1982;
    bool _1986 = _1964 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1988 = isnan(_1964);
    bool _1990 = _1986 || _1988;
    bool _1992 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1994 = _1990 || _1992;
    out.m_72.x = _1984;
    float _1996 = as_type<float>(_1928);
    float _1998 = _1970;
    float _2000 = _1942;
    float _2002 = _1980;
    if (!_1994)
    {
        _1996 = 1.0;
    }
    float _2004 = _1996;
    bool _2006 = !_1994;
    float _2008 = _2004;
    if (!_2006)
    {
        bool _2010 = _1964 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2012 = isnan(_1964);
        bool _2014 = _2010 || _2012;
        bool _2016 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2018 = _2014 || _2016;
        if (!_2018)
        {
            float _2020 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2022 = _1964 + _2020;
            float _2024 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2026 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2024;
            float _2028 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2030 = _2028 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2032 = 1.0 / _2026;
            float _2034 = _2022 * _2032;
            float _2036 = fma(_2034, _2030, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2008 = _2036;
            _2038 = true;
        }
        else
        {
            bool _2040 = _1964 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2042 = isnan(_1964);
            bool _2044 = _2040 || _2042;
            bool _2046 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2048 = _2044 || _2046;
            if (!_2048)
            {
                float _2050 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2052 = _1964 + _2050;
                float _2054 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2056 = _2054 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2058 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2060 = _2058 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2062 = 1.0 / _2056;
                float _2064 = _2052 * _2062;
                float _2066 = fma(_2064, _2060, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2008 = _2066;
                _2038 = true;
            }
            else
            {
                _2008 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2038 = false;
    float _2068 = _2008;
    float _2070 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2072 = _1912 + _2070;
    float _2074 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2076 = _1906 + _2074;
    bool _2078 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2080 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2082 = _2078 || _2080;
    bool _2084 = isnan(0.5);
    bool _2086 = _2082 || _2084;
    float _2088 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2090 = _1914 + _2088;
    float _2092 = fma(_2072, _2068, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2094 = fma(_2076, _2068, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2096 = fma(_2090, _2068, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2098 = _2090;
    float _2100 = _2096;
    if (_2086)
    {
        _2098 = _2092;
    }
    float _2102 = _2098;
    float _2104 = _2102;
    if (_2086)
    {
        _1998 = _2094;
    }
    float _2106 = _1998;
    float _2108 = _2106;
    if (!_2086)
    {
        float _2110 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2112 = _928 + _2110;
        float _2114 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2116 = _912 + _2114;
        float _2118 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2120 = -_1084;
        float _2122 = _2120 + _2096;
        float _2124 = _2112 * _2112;
        float _2126 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2128 = _1084 + _2126;
        float _2130 = fma(_2116, _2116, _2124);
        float _2132 = -_928;
        float _2134 = _2132 + _2094;
        float _2136 = fma(_2128, _2128, _2130);
        float _2138 = -_912;
        float _2140 = _2138 + _2092;
        float _2142 = sqrt(_2136);
        float _2144 = precise::min(_2142, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2146 = _2144 * _2118;
        float _2148 = fma(_2140, _2146, _912);
        float _2150 = fma(_2134, _2146, _928);
        float _2152 = fma(_2122, _2146, _1084);
        _2108 = _2150;
        _2104 = _2148;
        _2100 = _2152;
    }
    float _2154 = _2108;
    float _2156 = _2104;
    float _2158 = _2100;
    float _2160 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2162 = _2154 + _2160;
    float _2164 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2166 = _2156 + _2164;
    float _2168 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2170 = _2158 + _2168;
    float _2172 = _2162 * _2162;
    float _2174 = fma(_2166, _2166, _2172);
    float _2176 = fma(_2170, _2170, _2174);
    float _2178 = rsqrt(_2176);
    float _2180 = _2178 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2182 = _2166 * _2180;
    float _2184 = _2170 * _2180;
    float _2186 = _2182 * _2182;
    float _2188 = _2184 * _2184;
    float _2190 = _2186 + _2188;
    float _2192 = sqrt(_2190);
    bool _2194 = _2192 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2196 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2198 = _2192 + _2196;
    float _2200 = _2178;
    float _2202 = _2198;
    float _2204 = _2162;
    float _2206 = _2180;
    float _2208 = _2182;
    if (_2194)
    {
        float _2210 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2200 = _2210;
    }
    float _2212 = _2200;
    if (_2194)
    {
        float _2214 = rsqrt(_2190);
        _2000 = _2214;
    }
    float _2216 = _2000;
    float _2218 = _2216;
    if (_2194)
    {
        float _2220 = _2198 * _2212;
        _2202 = _2220;
    }
    float _2222 = _2202;
    if (_2194)
    {
        float _2224 = _2222 * 0.15915493667125701904296875;
        _994 = _2224;
    }
    float _2226 = _994;
    float _2228 = _2212;
    if (_2194)
    {
        float _2230 = _2226 * 6.283185482025146484375;
        float _2232 = sin(_2230);
        _2228 = _2232;
    }
    float _2234 = _2228;
    float _2236 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2238 = precise::max(0.0, _2236);
    float _2240 = _2170;
    float _2242 = _2238;
    if (_2194)
    {
        float _2244 = _2226 * 6.283185482025146484375;
        float _2246 = cos(_2244);
        _2240 = _2246;
    }
    float _2248 = _2240;
    float _2250 = -_2180;
    float _2252 = -_2238;
    float _2254 = fma(_2162, _2250, _2252);
    if (!_2194)
    {
        _2204 = _2186;
    }
    float _2256 = _2204;
    float _2258 = _2256;
    if (_2194)
    {
        float _2260 = _2254 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2242 = _2260;
    }
    float _2262 = _2242;
    float _2264 = sqrt(_2176);
    float _2266 = _2234;
    float _2268 = _2262;
    if (_2194)
    {
        float _2270 = fma(_2234, _2262, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2266 = _2270;
    }
    float _2272 = _2266;
    float _2274 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2276 = _2272;
    if (_2194)
    {
        float _2278 = _2248 + (-1.0);
        _2268 = _2278;
    }
    float _2280 = _2268;
    float _2282 = _2280;
    if (_2194)
    {
        float _2284 = _2216 * _2272;
        _2002 = _2284;
    }
    float _2286 = _2002;
    if (!_2194)
    {
        _2218 = _2254;
    }
    float _2288 = _2218;
    float _2290 = _2288;
    if (_2194)
    {
        float _2292 = _2280 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2206 = _2292;
    }
    float _2294 = _2206;
    if (_2194)
    {
        float _2296 = _2182 * _2286;
        _2208 = _2296;
    }
    float _2298 = _2208;
    if (!_2194)
    {
        _2276 = _2184;
    }
    float _2300 = _2276;
    float _2302 = _2300;
    if (_2194)
    {
        float _2304 = _2184 * _2286;
        _2302 = _2304;
    }
    float _2306 = _2302;
    if (_2194)
    {
        float _2308 = fma(_2254, _2248, _2294);
        _2290 = _2308;
    }
    float _2310 = _2290;
    if (_2194)
    {
        float _2312 = _2298 * _2298;
        _2258 = _2312;
    }
    float _2314 = _2258;
    if (!_2194)
    {
        _2282 = _2188;
    }
    float _2316 = _2282;
    float _2318 = _2316;
    if (_2194)
    {
        float _2320 = _2306 * _2306;
        _2318 = _2320;
    }
    float _2322 = _2318;
    float _2324 = fma(_2310, _2310, _2314);
    float _2326 = _2324 + _2322;
    float _2328 = _2154 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2330 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2332 = fma(_2264, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2330);
    float _2334 = precise::clamp(_2332, 0.0, 1.0);
    float _2336 = rsqrt(_2326);
    float _2338 = fma(_2156, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2328);
    float _2340 = _2154 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2342 = -_2334;
    float _2344 = _2342 + 1.0;
    float _2346 = fma(_2158, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2338);
    float _2348 = _2154 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2350 = fma(_2156, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2340);
    float _2352 = _2154 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2354 = abs(_2344);
    float _2356 = log2(_2354);
    float _2358 = fma(_2156, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2348);
    float _2360 = fma(_2158, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2350);
    float _2362 = fma(_2156, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2352);
    float _2364 = _2346 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2366 = fma(_2158, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2358);
    float _2368 = _2360 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2370 = fma(_2158, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2362);
    float _2372 = _2336 * _2298;
    float _2374 = _2366 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2376 = _2368 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2378 = _2336 * _2310;
    float _2380 = _2372 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2382 = _2364 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2384 = fma(_2374, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2376);
    float _2386 = _2336 * _2306;
    float _2388 = _2356 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2390 = -_2380;
    float _2392 = fma(_2378, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2390);
    float _2394 = -_2382;
    float _2396 = fma(_2394, _2274, 1.0);
    float _2398 = _2370 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2400 = fma(_2364, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2384);
    float _2402 = exp2(_2388);
    float _2404 = -_2386;
    float _2406 = fma(_2404, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2392);
    float _2408 = _2368 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2410 = fma(_2398, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2400);
    float _2412 = _2368 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2414 = fma(_2406, -0.5, 0.5);
    float _2416 = fma(_2374, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2408);
    float _2418 = fma(_2406, 0.5, 0.5);
    float _2420 = log2(_2396);
    float _2422 = fma(_2374, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2412);
    float _2424 = _2378 + 1.0;
    float _2426 = fma(_2364, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2416);
    float _2428 = fma(_2418, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2430 = fma(_2364, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2422);
    float _2432 = 1.0 / _2410;
    float _2434 = -_2378;
    float _2436 = fma(_2402, _2424, _2434);
    float _2438 = fma(_2398, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2426);
    float _2440 = fma(_2418, _2428, -0.212114393711090087890625);
    float _2442 = fma(_2398, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2430);
    float _2444 = fma(_2436, 0.5, 0.5);
    float _2446 = fma(_2418, _2440, 1.570728778839111328125);
    float _2448 = sqrt(_2414);
    float _2450 = _2420 * 0.693147182464599609375;
    float _2452 = _2438 * _2432;
    float _2454 = _2442 * _2432;
    float _2456 = _2450 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2458 = fma(_2452, 0.5, 0.5);
    float _2460 = fma(_2454, -0.5, 0.5);
    float _2462 = _2448 * 0.636619746685028076171875;
    float3 _6158 = float3(_2458, _2460, _2456);
    float _2464 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6158, float3(0.0), isnan(_6158)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6158, float3(0.0), isnan(_6158)), level(0.0)).x;
    float3 _6169 = float3(_2458, _2460, _2456);
    float4 _2467 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6169, float3(0.0), isnan(_6169)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6169, float3(0.0), isnan(_6169)), level(0.0)).xyzw;
    float _2469 = _2467.x;
    float _2471 = _2467.y;
    float _2473 = _2467.z;
    float _2475 = _2467.w;
    float _2477 = -_2446;
    float _2479 = fma(_2462, _2477, 1.0);
    float2 _6191 = float2(_2479, _2444);
    float3 _2483 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6191, float2(0.0), isnan(_6191)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6191, float2(0.0), isnan(_6191)), level(0.0)).xyz;
    float _2485 = _2483.x;
    float _2487 = _2483.y;
    float _2489 = _2483.z;
    float _2491 = _2356 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2493 = _2368 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2495 = fma(_2374, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2493);
    float _2497 = exp2(_2491);
    float _2499 = fma(_2364, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2495);
    float _2501 = fma(_2398, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2499);
    float _2503 = _2501 + _2410;
    out.gl_Position.x = _2438;
    out.gl_Position.y = _2442;
    out.gl_Position.z = _2501;
    out.gl_Position.w = _2410;
    float _2505 = -_2497;
    float _2507 = _2505 + 1.0;
    float _2509 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2511 = _2503 * 0.5;
    float _2513 = _2507 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_47.x = _2509;
    out.m_74.z = _2511;
    out.m_74.w = _2410;
    float _2515 = _2513 * _2464;
    float _2517 = -_2513;
    float _2519 = _2517 + 1.0;
    float _2521 = _2475 * _2515;
    float _2523 = _2489 * _2515;
    float _2525 = fma(_2485, _2521, _2469);
    float _2527 = fma(_2487, _2521, _2471);
    float _2529 = _2475 * _2519;
    float _2531 = fma(_2475, _2523, _2473);
    out.m_76.x = _2525;
    out.m_76.y = _2527;
    out.m_76.z = _2531;
    out.m_76.w = _2529;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}


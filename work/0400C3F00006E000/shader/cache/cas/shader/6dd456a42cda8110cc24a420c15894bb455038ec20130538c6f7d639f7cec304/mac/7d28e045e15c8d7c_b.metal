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
    float4 m_60 [[user(locn1)]];
    float4 m_64 [[user(locn2)]];
    float4 m_47 [[user(locn3)]];
    float4 m_62 [[user(locn4)]];
    float4 m_66 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_51 [[attribute(4)]];
    float4 m_56 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1076 = false;
    bool _385 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _80 = in.m_44.w;
    float _82 = trunc(_80);
    int _85 = int(_82);
    bool _89 = _85 >= 1;
    float _91 = 0.0;
    if (!_89)
    {
        _91 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _93 = _91;
    float _95 = _93;
    if (!_89)
    {
        out.m_47.x = 0.0;
    }
    int _97 = 0;
    if (!_89)
    {
        float _99 = _93 * 5.0;
        _97 = as_type<int>(_99);
    }
    int _101 = _97;
    int _103 = _101;
    if (!_89)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1838 = as_type<float>(_101);
        out.gl_Position.z = _1838;
    }
    if (!_89)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _105 = in.m_49.w;
    bool _107 = _105 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _109 = isnan(_105);
    bool _111 = _107 || _109;
    bool _113 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _115 = _111 || _113;
    float _117 = -_105;
    float _119 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_115)
    {
        float _121 = float(_85);
        _95 = _121;
    }
    float _123 = _95;
    bool _125 = _119 >= _123;
    bool _127 = !_115;
    bool _129 = _125 || _127;
    float _131 = _123;
    if (_129)
    {
        _131 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _133 = _131;
    if (_129)
    {
        out.m_47.x = 0.0;
    }
    if (_129)
    {
        float _135 = _133 * 5.0;
        _103 = as_type<int>(_135);
    }
    int _137 = _103;
    if (_129)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1907 = as_type<float>(_137);
        out.gl_Position.z = _1907;
    }
    if (_129)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _139 = in.m_51.x;
    float _141 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _143 = _119 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _145 = as_type<float>(int(gl_VertexIndex));
    float _147 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _149 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _151 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _153 = _149 || _151;
    bool _155 = isnan(1.0);
    bool _157 = _153 || _155;
    float _159 = _143 * _141;
    float _161 = 0.0;
    float _163 = _147;
    if (!_157)
    {
        float _165 = _147 * _147;
        float _167 = _165 * 0.5;
        _161 = _167;
    }
    float _169 = _161;
    float _171 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[20].x, _159);
    float _173 = _169;
    if (!_157)
    {
        float _175 = _169 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _173 = _175;
    }
    float _177 = _173;
    float _179 = in.m_49.x;
    float _181 = in.m_49.y;
    float _183 = in.m_49.z;
    float _185 = _171 * 6.283185482025146484375;
    float _187 = floor(_171);
    int _189 = as_type<int>(_145) & 1;
    bool _191 = _189 != 0;
    int _193 = as_type<int>(_145) & 2;
    bool _195 = _193 != 0;
    float _197 = _185 * 0.15915493667125701904296875;
    int _199 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _201 = _199 != 0;
    float _203 = _197 * 6.283185482025146484375;
    float _205 = cos(_203);
    bool _207 = !_191;
    float _209 = _207 ? (-0.5) : 0.5;
    float _211 = -_187;
    float _213 = _171 + _211;
    bool _215 = !_195;
    float _217 = _215 ? (-0.5) : 0.5;
    bool _219 = !_157;
    float _221 = _177;
    if (!_219)
    {
        float _223 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _225 = log2(_223);
        float _227 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _229 = _227 + 1.0;
        float _231 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _233 = _147 * _225;
        float _235 = 1.0 / _229;
        float _237 = _231 * 0.693147182464599609375;
        float _239 = exp2(_233);
        float _241 = 1.0 / _237;
        float _243 = _239 + (-1.0);
        float _245 = -_243;
        float _247 = fma(_245, _241, _147);
        float _249 = _247 * _235;
        float _251 = _249 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _221 = _251;
    }
    float _253 = _221;
    bool _255 = !_157;
    if (!_255)
    {
        float _257 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _259 = log2(_257);
        float _261 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _263 = _261 + 1.0;
        float _265 = 1.0 / _263;
        float _267 = _147 * _259;
        float _269 = exp2(_267);
        float _271 = -_269;
        float _273 = _271 + 1.0;
        float _275 = _273 * _265;
        _163 = _275;
    }
    float _277 = _163;
    float _279 = fma(_205, 0.5, 0.5);
    int _281 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _283 = _281 != 0;
    int _285 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _287 = _285 != 0;
    float _289 = in.m_56.w;
    bool _291 = _213 < 0.5;
    float _293 = float(_291);
    float _295 = -_213;
    float _297 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _299 = !_201;
    int _301 = _299 ? 0 : 1;
    float _303 = in.m_44.x;
    float _305 = in.m_44.y;
    float _307 = in.m_44.z;
    bool _309 = !_283;
    int _311 = _309 ? 0 : 1;
    float _313 = _253 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _315 = -_293;
    float _317 = fma(_315, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _319 = -_279;
    float _321 = fma(_319, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _323 = abs(_311);
    float _325 = fma(_277, _179, _313);
    int _327 = abs(_301);
    float _329 = _253 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _331 = !_287;
    int _333 = _331 ? 0 : 1;
    float _335 = fma(_277, _181, _329);
    bool _337 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _339 = abs(_333);
    float _341 = _253 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _343 = float(_323);
    float _345 = float(_327);
    float _347 = fma(_277, _183, _341);
    float _349 = abs(_297);
    float _351 = _343 * _349;
    float _353 = fma(_347, _289, _307);
    float _355 = float(_339);
    float _357 = fma(_345, _321, _351);
    float _359 = fma(_325, _289, _303);
    float _361 = fma(_335, _289, _305);
    float _363 = abs(_317);
    float _365 = fma(_355, _363, _357);
    bool _367 = !_337;
    float _383;
    if (!_367)
    {
        float _369 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _371 = _139 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _373 = fma(_371, (*spvDescriptorSet0.vp_c9)._m0[12].x, _119);
        float _375 = _373 * _369;
        float _377 = floor(_375);
        float _379 = -_377;
        float _381 = _375 + _379;
        _383 = _381;
        _385 = true;
    }
    else
    {
        float _387 = float(_85);
        float _389 = 1.0 / _387;
        float _391 = _119 * _389;
        _383 = _391;
    }
    _385 = false;
    float _393 = _383;
    float _395 = _139 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _397 = in.m_51.y;
    float _399 = _361 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _401 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _403 = _401 != 0;
    float _405 = _361 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _407 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _409 = _407 != 0;
    float _411 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[4].x, _399);
    float _413 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[5].x, _405);
    float _415 = _361 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _417 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _419 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _421 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[6].x, _415);
    float _423 = -_417;
    float _425 = fma(_395, 2.0, _423);
    float _427 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _429 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[78].z, _419);
    float _431 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _433 = _139 > 0.5;
    float _435 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _437 = _427 * _139;
    float _439 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _441 = _397 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _443 = fma(_397, (*spvDescriptorSet0.vp_c9)._m0[78].w, _431);
    float _445 = fma(_353, (*spvDescriptorSet0.vp_c10)._m0[4].z, _411);
    float _447 = trunc(_437);
    int _449 = int(_447);
    float _451 = fma(_441, -2.0, _439);
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _455 = _453 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _459 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _457;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _463 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _461;
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _467 = _393 + _465;
    bool _469 = _397 > 0.5;
    float _471 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _473 = _393 + _471;
    float _475 = 1.0 / _455;
    float _477 = fma(_353, (*spvDescriptorSet0.vp_c10)._m0[5].z, _413);
    float _479 = fma(_353, (*spvDescriptorSet0.vp_c10)._m0[6].z, _421);
    float _481 = -_119;
    float _483 = fma(_481, (*spvDescriptorSet0.vp_c9)._m0[76].x, _425);
    float _485 = 1.0 / _459;
    int _487 = _449 << 4;
    int _489 = _487 + 1968;
    float _491 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[76].y, _451);
    float _493 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[77].w, _443);
    float _495 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _497 = _489 + 8;
    uint _500 = uint(int(uint(_497) >> uint(2)));
    uint _502 = uint(int(uint(int(_500)) >> uint(2)));
    int _504 = int(_500) & 3;
    float _506 = (*spvDescriptorSet0.vp_c9)._m0[int(_502)][_504];
    float _508 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _510 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _512 = 1.0 / _463;
    float _514 = _467 * _475;
    float _516 = -_209;
    int _518 = _433 ? as_type<int>(_516) : as_type<int>(_209);
    float _520 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _522 = _495 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    uint _524 = uint(int(uint(_489) >> uint(2)));
    uint _526 = uint(int(uint(int(_524)) >> uint(2)));
    int _528 = int(_524) & 3;
    float _530 = (*spvDescriptorSet0.vp_c9)._m0[int(_526)][_528];
    int _532 = int(_524) + 1;
    uint _534 = uint(int(uint(_532) >> uint(2)));
    int _536 = _532 & 3;
    float _538 = (*spvDescriptorSet0.vp_c9)._m0[int(_534)][_536];
    bool _540 = !_403;
    float _542 = _540 ? _209 : as_type<float>(_518);
    float _544 = _508 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _546 = _473 * _485;
    float _548 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[77].z, _429);
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _552 = _393 + _550;
    float _554 = _510 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _556 = _435 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _558 = _542 + 0.5;
    float _560 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _562 = _552 * _512;
    float _564 = _477 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _566 = fma(_556, _558, _483);
    out.m_58.x = _522;
    out.m_58.y = _544;
    out.m_58.z = _554;
    out.m_58.w = _520;
    float _568 = _445 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _570 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _572 = _564 + _570;
    float _574 = _479 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _576 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _578 = _568 + _576;
    float _580 = -_493;
    float _582 = _580 + 1.0;
    float _584 = -_548;
    float _586 = _584 + 1.0;
    float _588 = _560 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _590 = -_586;
    float _592 = fma(_542, _590, _566);
    float _594 = _572 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _596 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _598 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _596;
    float _600 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _602 = _600 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _606 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _604;
    float _608 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _610 = _608 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _612 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _614 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _612;
    float _616 = fma(_578, (*spvDescriptorSet0.vp_c8)._m0[28].x, _594);
    float _618 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _620 = _574 + _618;
    float _622 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _624 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _622;
    float _626 = -_217;
    int _628 = _469 ? as_type<int>(_626) : as_type<int>(_217);
    float _630 = fma(_602, _514, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _632 = fma(_620, (*spvDescriptorSet0.vp_c8)._m0[28].z, _616);
    float _634 = fma(_610, _514, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _636 = !_409;
    float _638 = _636 ? _217 : as_type<float>(_628);
    float _640 = _506 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _642 = _572 * _572;
    bool _644 = _632 >= 0.0;
    float _646 = _530 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _648 = _638 + (-0.5);
    float _650 = _538 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _652 = _640 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _654 = _646 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _656 = -_588;
    float _658 = -_491;
    float _660 = fma(_656, _648, _658);
    float _662 = _650 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _664 = fma(_578, _578, _642);
    bool _666 = _393 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _668 = isnan(_393);
    bool _670 = _666 || _668;
    bool _672 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _674 = _670 || _672;
    float _676 = float(_674);
    float _678 = fma(_638, _582, _660);
    bool _680 = _393 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _682 = isnan(_393);
    bool _684 = _680 || _682;
    bool _686 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _688 = _684 || _686;
    float _690 = float(_688);
    float _692 = fma(_620, _620, _664);
    out.m_60.x = _654;
    out.m_60.y = _662;
    out.m_60.z = _652;
    float _694 = _582;
    float _696 = _574;
    if (_644)
    {
        _694 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _698 = _694;
    float _700 = -_676;
    float _702 = _700 + 1.0;
    float _704 = fma(_614, _562, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _706 = in.m_56.x;
    float _708 = in.m_56.y;
    float _710 = rsqrt(_692);
    int _712 = as_type<int>(_698);
    if (_644)
    {
        float _714 = _698 * 5.0;
        _712 = as_type<int>(_714);
    }
    int _716 = _712;
    float _718 = _690 * _702;
    float _720 = -_690;
    float _722 = _720 + 1.0;
    out.m_62.x = _592;
    out.m_62.y = _678;
    float _724 = fma(_624, _562, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _726 = fma(_598, _546, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _728 = _393 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _730 = isnan(_393);
    bool _732 = _728 || _730;
    bool _734 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _736 = _732 || _734;
    float _738 = float(_736);
    if (_644)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2901 = as_type<float>(_716);
        out.gl_Position.z = _2901;
    }
    float _740 = fma(_606, _546, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _742 = _393 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _744 = isnan(_393);
    bool _746 = _742 || _744;
    bool _748 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _750 = _746 || _748;
    float _752 = float(_750);
    if (_644)
    {
        out.m_47.x = 0.0;
    }
    float _754 = _738 * _722;
    float _756 = -_738;
    float _758 = _756 + 1.0;
    float _760 = _572 * _710;
    float _762 = _578 * _710;
    if (_644)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _764 = -_760;
    float _766 = fma(_764, (*spvDescriptorSet0.vp_c9)._m0[18].w, _564);
    float _768 = _620 * _710;
    float _770 = -_762;
    float _772 = fma(_770, (*spvDescriptorSet0.vp_c9)._m0[18].w, _568);
    float _774 = _752 * _758;
    float _776 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _778 = _766 + _776;
    float _780 = -_752;
    float _782 = _780 + 1.0;
    float _784 = -_768;
    float _786 = fma(_784, (*spvDescriptorSet0.vp_c9)._m0[18].w, _574);
    float _788 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _790 = _772 + _788;
    float _792 = _778 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _794 = -_760;
    float _796 = fma(_794, (*spvDescriptorSet0.vp_c9)._m0[18].w, _572);
    float _798 = -_762;
    float _800 = fma(_798, (*spvDescriptorSet0.vp_c9)._m0[18].w, _578);
    float _802 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _804 = _786 + _802;
    float _806 = fma(_790, (*spvDescriptorSet0.vp_c8)._m0[28].x, _792);
    float _808 = _726 * _774;
    float _810 = _740 * _774;
    float _812 = _796 * _796;
    float _814 = fma(_804, (*spvDescriptorSet0.vp_c8)._m0[28].z, _806);
    float _816 = fma(_782, (*spvDescriptorSet0.vp_c9)._m0[143].x, _808);
    float _818 = fma(_782, (*spvDescriptorSet0.vp_c9)._m0[143].y, _810);
    float _820 = fma(_800, _800, _812);
    float _822 = -_768;
    float _824 = fma(_822, (*spvDescriptorSet0.vp_c9)._m0[18].w, _620);
    bool _826 = _814 >= 0.0;
    float _828 = fma(_630, _754, _816);
    float _830 = fma(_634, _754, _818);
    float _832 = fma(_824, _824, _820);
    float _834 = fma(_704, _718, _828);
    float _836 = fma(_724, _718, _830);
    float _838 = sqrt(_832);
    float _840 = fma(_676, (*spvDescriptorSet0.vp_c9)._m0[146].x, _834);
    float _842 = fma(_676, (*spvDescriptorSet0.vp_c9)._m0[146].y, _836);
    float _844 = _782;
    float _846 = _766;
    if (_826)
    {
        _844 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _848 = _844;
    float _850 = _840 * _706;
    float _852 = _842 * _708;
    int _854 = as_type<int>(_848);
    if (_826)
    {
        out.m_47.x = 0.0;
    }
    if (_826)
    {
        float _856 = _848 * 5.0;
        _854 = as_type<int>(_856);
    }
    int _858 = _854;
    float _860 = _365 * _850;
    float _862 = _365 * _852;
    if (_826)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3127 = as_type<float>(_858);
        out.gl_Position.z = _3127;
    }
    float _864 = _710 * _838;
    if (_826)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _866 = _862 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _868 = _860 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _870 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _217);
    float _872 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _209);
    float _874 = _864 * _866;
    float _876 = _864 * _868;
    float _878 = _864 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _880 = _878 * 0.5;
    float _882 = _870 * _874;
    float _884 = _872 * _876;
    float _886 = _882 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _888 = _882 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _890 = _882 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _892 = fma(_884, (*spvDescriptorSet0.vp_c8)._m0[24].x, _886);
    float _894 = fma(_884, (*spvDescriptorSet0.vp_c8)._m0[26].x, _888);
    float _896 = fma(_884, (*spvDescriptorSet0.vp_c8)._m0[25].x, _890);
    float _898 = fma(_880, (*spvDescriptorSet0.vp_c8)._m0[24].z, _892);
    float _900 = fma(_880, (*spvDescriptorSet0.vp_c8)._m0[26].z, _894);
    float _902 = fma(_880, (*spvDescriptorSet0.vp_c8)._m0[25].z, _896);
    float _904 = _898 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _906 = _900 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _908 = _902 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _910 = _568 + _904;
    float _912 = _574 + _906;
    float _914 = _564 + _908;
    float _916 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _918 = _910 + _916;
    float _920 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _922 = _912 + _920;
    float _924 = _918 * _918;
    float _926 = _922 * _922;
    float _928 = _924 + _926;
    float _930 = sqrt(_928);
    bool _932 = _930 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _934 = _890;
    float _936 = _908;
    float _938 = _902;
    float _940 = _910;
    float _942 = _926;
    if (!_932)
    {
        _934 = _910;
    }
    float _944 = _934;
    float _946 = _944;
    if (!_932)
    {
        _936 = _924;
    }
    float _948 = _936;
    float _950 = _948;
    if (!_932)
    {
        _938 = _912;
    }
    float _952 = _938;
    float _954 = _952;
    if (!_932)
    {
        _940 = _914;
    }
    float _956 = _940;
    bool _958 = !_932;
    float _960 = _956;
    if (!_958)
    {
        float _962 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _964 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _966 = _930 + _964;
        float _968 = rsqrt(_928);
        float _970 = _966 * _962;
        float _972 = _914 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _974 = _970 * 0.15915493667125701904296875;
        float _976 = _974 * 6.283185482025146484375;
        float _978 = sin(_976);
        float _980 = _974 * 6.283185482025146484375;
        float _982 = cos(_980);
        float _984 = fma(_978, _972, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _986 = _968 * _984;
        float _988 = _982 + (-1.0);
        float _990 = fma(_918, _986, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _992 = fma(_922, _986, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _994 = _988 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _996 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _998 = _990 + _996;
        float _1000 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1002 = _992 + _1000;
        float _1004 = fma(_914, _982, _994);
        float _1006 = _998 * _998;
        float _1008 = _1002 * _1002;
        _960 = _1004;
        _950 = _1006;
        _942 = _1008;
        _946 = _990;
        _954 = _992;
    }
    float _1010 = _960;
    float _1012 = _950;
    float _1014 = _942;
    float _1016 = _946;
    float _1018 = _954;
    float _1020 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1022 = _1010 + _1020;
    float _1024 = fma(_1022, _1022, _1012);
    float _1026 = _1024 + _1014;
    float _1028 = sqrt(_1026);
    bool _1030 = _1028 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1032 = isnan(_1028);
    bool _1034 = _1030 || _1032;
    bool _1036 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1038 = _1034 || _1036;
    float _1040 = _1024;
    if (!_1038)
    {
        _1040 = 1.0;
    }
    float _1042 = _1040;
    bool _1044 = !_1038;
    float _1046 = _1042;
    if (!_1044)
    {
        bool _1048 = _1028 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1050 = isnan(_1028);
        bool _1052 = _1048 || _1050;
        bool _1054 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1056 = _1052 || _1054;
        if (!_1056)
        {
            float _1058 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1060 = _1028 + _1058;
            float _1062 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1064 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1062;
            float _1066 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1068 = _1066 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1070 = 1.0 / _1064;
            float _1072 = _1060 * _1070;
            float _1074 = fma(_1072, _1068, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1046 = _1074;
            _1076 = true;
        }
        else
        {
            bool _1078 = _1028 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1080 = isnan(_1028);
            bool _1082 = _1078 || _1080;
            bool _1084 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1086 = _1082 || _1084;
            if (!_1086)
            {
                float _1088 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1090 = _1028 + _1088;
                float _1092 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1094 = _1092 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1096 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1098 = _1096 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1100 = 1.0 / _1094;
                float _1102 = _1090 * _1100;
                float _1104 = fma(_1102, _1098, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1046 = _1104;
                _1076 = true;
            }
            else
            {
                _1046 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1076 = false;
    float _1106 = _1046;
    float _1108 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1110 = _1016 + _1108;
    float _1112 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1114 = _1010 + _1112;
    float _1116 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1118 = _1018 + _1116;
    bool _1120 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1122 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1124 = _1120 || _1122;
    bool _1126 = isnan(0.5);
    bool _1128 = _1124 || _1126;
    float _1130 = fma(_1110, _1106, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1132 = fma(_1114, _1106, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1134 = fma(_1118, _1106, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1136 = -_762;
    float _1138 = fma(_1136, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1130);
    float _1140 = -_760;
    float _1142 = fma(_1140, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1132);
    float _1144 = -_768;
    float _1146 = fma(_1144, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1134);
    float _1148 = _1142;
    float _1150 = _1138;
    float _1152 = _1146;
    if (!_1128)
    {
        float _1154 = _778 * _778;
        float _1156 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1158 = -_568;
        float _1160 = _1158 + _1130;
        float _1162 = -_564;
        float _1164 = _1162 + _1132;
        float _1166 = fma(_790, _790, _1154);
        float _1168 = -_574;
        float _1170 = _1168 + _1134;
        float _1172 = fma(_804, _804, _1166);
        float _1174 = 1.0 / _864;
        float _1176 = sqrt(_1172);
        float _1178 = _1160 * _1174;
        float _1180 = _1164 * _1174;
        float _1182 = _1170 * _1174;
        bool _1184 = _1176 > (*spvDescriptorSet0.vp_c9)._m0[199].x;
        bool _1186 = isnan(_1176);
        bool _1188 = _1184 || _1186;
        bool _1190 = isnan((*spvDescriptorSet0.vp_c9)._m0[199].x);
        bool _1192 = _1188 || _1190;
        float _1194 = precise::min(_1176, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1196 = _1194 * _1156;
        float _1198 = fma(_1178, _1196, _772);
        float _1200 = fma(_1180, _1196, _766);
        float _1202 = _1154;
        float _1204 = _1194;
        float _1206 = _1196;
        float _1208 = _1198;
        _696 = _1182;
        if (_1192)
        {
            float _1210 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].y;
            _1202 = _1210;
        }
        float _1212 = _1202;
        if (_1192)
        {
            float _1214 = precise::max(_1176, (*spvDescriptorSet0.vp_c9)._m0[199].y);
            _1204 = _1214;
        }
        float _1216 = _1204;
        float _1218 = fma(_1182, _1196, _786);
        float _1220 = _1216;
        if (!_1192)
        {
            _1206 = _1198;
        }
        float _1222 = _1206;
        float _1224 = _1222;
        if (!_1192)
        {
            _1208 = _1200;
        }
        float _1226 = _1208;
        float _1228 = _1212;
        float _1230 = _1226;
        if (_1192)
        {
            float _1232 = _1216 * _1212;
            _1228 = _1232;
        }
        float _1234 = _1228;
        if (!_1192)
        {
            _1220 = _1218;
        }
        float _1236 = _1220;
        _1152 = _1236;
        if (_1192)
        {
            float _1238 = fma(_1178, _1234, _772);
            _1224 = _1238;
        }
        float _1240 = _1224;
        _1150 = _1240;
        if (_1192)
        {
            float _1242 = fma(_1180, _1234, _766);
            _1230 = _1242;
        }
        float _1244 = _1230;
        _1148 = _1244;
        if (_1192)
        {
            float _1246 = fma(_1182, _1234, _786);
            _1152 = _1246;
        }
    }
    float _1248 = _1148;
    float _1250 = _1150;
    float _1252 = _1152;
    float _1254 = _696;
    float _1256 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1258 = _1248 + _1256;
    float _1260 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1262 = _1250 + _1260;
    float _1264 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1266 = _1252 + _1264;
    float _1268 = _1258 * _1258;
    float _1270 = fma(_1262, _1262, _1268);
    float _1272 = fma(_1266, _1266, _1270);
    float _1274 = rsqrt(_1272);
    float _1276 = _1274 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1278 = _1262 * _1276;
    float _1280 = _1266 * _1276;
    float _1282 = _1278 * _1278;
    float _1284 = _1280 * _1280;
    float _1286 = _1282 + _1284;
    float _1288 = sqrt(_1286);
    bool _1290 = _1288 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1292 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1294 = _1288 + _1292;
    float _1296 = _1266;
    float _1298 = _1286;
    float _1300 = _1294;
    float _1302 = _1254;
    float _1304 = _1276;
    if (_1290)
    {
        float _1306 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1296 = _1306;
    }
    float _1308 = _1296;
    if (_1290)
    {
        float _1310 = rsqrt(_1286);
        _1298 = _1310;
    }
    float _1312 = _1298;
    if (_1290)
    {
        float _1314 = _1294 * _1308;
        _1300 = _1314;
    }
    float _1316 = _1300;
    if (_1290)
    {
        float _1318 = _1316 * 0.15915493667125701904296875;
        _1302 = _1318;
    }
    float _1320 = _1302;
    float _1322 = _1268;
    float _1324 = _1320;
    if (_1290)
    {
        float _1326 = _1320 * 6.283185482025146484375;
        float _1328 = sin(_1326);
        _1322 = _1328;
    }
    float _1330 = _1322;
    float _1332 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1334 = precise::max(0.0, _1332);
    float _1336 = _1274;
    float _1338 = _1334;
    float _1340 = _1332;
    if (_1290)
    {
        float _1342 = _1320 * 6.283185482025146484375;
        float _1344 = cos(_1342);
        _1336 = _1344;
    }
    float _1346 = _1336;
    float _1348 = -_1276;
    float _1350 = -_1334;
    float _1352 = fma(_1258, _1348, _1350);
    float _1354 = _1352;
    if (!_1290)
    {
        _1338 = _1278;
    }
    float _1356 = _1338;
    float _1358 = _1356;
    if (_1290)
    {
        float _1360 = _1352 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1340 = _1360;
    }
    float _1362 = _1340;
    float _1364 = _1330;
    float _1366 = _1362;
    if (_1290)
    {
        float _1368 = fma(_1330, _1362, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1364 = _1368;
    }
    float _1370 = _1364;
    float _1372 = _1370;
    float _1374 = _1346;
    if (_1290)
    {
        float _1376 = _1346 + (-1.0);
        _1366 = _1376;
    }
    float _1378 = _1366;
    float _1380 = _1378;
    if (_1290)
    {
        float _1382 = _1312 * _1370;
        _1304 = _1382;
    }
    float _1384 = _1304;
    if (!_1290)
    {
        _1372 = _1282;
    }
    float _1386 = _1372;
    float _1388 = sqrt(_1272);
    float _1390 = _1386;
    if (_1290)
    {
        float _1392 = _1378 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1324 = _1392;
    }
    float _1394 = _1324;
    if (_1290)
    {
        float _1396 = _1278 * _1384;
        _1358 = _1396;
    }
    float _1398 = _1358;
    if (!_1290)
    {
        _1380 = _1280;
    }
    float _1400 = _1380;
    float _1402 = _1400;
    if (_1290)
    {
        float _1404 = _1280 * _1384;
        _1402 = _1404;
    }
    float _1406 = _1402;
    if (_1290)
    {
        float _1408 = fma(_1352, _1346, _1394);
        _1354 = _1408;
    }
    float _1410 = _1354;
    if (_1290)
    {
        float _1412 = _1398 * _1398;
        _1390 = _1412;
    }
    float _1414 = _1390;
    if (!_1290)
    {
        _1374 = _1284;
    }
    float _1416 = _1374;
    float _1418 = _1416;
    if (_1290)
    {
        float _1420 = _1406 * _1406;
        _1418 = _1420;
    }
    float _1422 = _1418;
    float _1424 = fma(_1410, _1410, _1414);
    float _1426 = _1424 + _1422;
    float _1428 = _1248 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1430 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1432 = fma(_1388, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1430);
    float _1434 = precise::clamp(_1432, 0.0, 1.0);
    float _1436 = _1248 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1438 = rsqrt(_1426);
    float _1440 = fma(_1250, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1428);
    float _1442 = _1248 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1444 = -_1434;
    float _1446 = _1444 + 1.0;
    float _1448 = _1248 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1450 = fma(_1252, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1440);
    float _1452 = fma(_1250, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1442);
    float _1454 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1456 = _1450 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1458 = fma(_1250, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1436);
    float _1460 = fma(_1252, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1452);
    float _1462 = abs(_1446);
    float _1464 = log2(_1462);
    float _1466 = fma(_1250, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1448);
    float _1468 = fma(_1252, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1458);
    float _1470 = _1460 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1472 = _1438 * _1398;
    float _1474 = _1456 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1476 = fma(_1252, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1466);
    float _1478 = _1468 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1480 = _1470 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1482 = _1438 * _1410;
    float _1484 = _1472 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1486 = -_1474;
    float _1488 = fma(_1486, _1454, 1.0);
    float _1490 = _1476 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1492 = fma(_1478, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1480);
    float _1494 = _1438 * _1406;
    float _1496 = -_1484;
    float _1498 = fma(_1482, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1496);
    float _1500 = _1464 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1502 = fma(_1456, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1492);
    float _1504 = log2(_1488);
    float _1506 = -_1494;
    float _1508 = fma(_1506, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1498);
    float _1510 = _1470 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1512 = fma(_1490, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1502);
    float _1514 = _1470 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1516 = fma(_1508, -0.5, 0.5);
    float _1518 = fma(_1478, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1510);
    float _1520 = fma(_1508, 0.5, 0.5);
    float _1522 = exp2(_1500);
    float _1524 = fma(_1478, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1514);
    float _1526 = fma(_1456, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1518);
    float _1528 = _1482 + 1.0;
    float _1530 = fma(_1520, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1532 = fma(_1456, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1524);
    float _1534 = fma(_1490, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1526);
    float _1536 = 1.0 / _1512;
    float _1538 = fma(_1490, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1532);
    float _1540 = fma(_1520, _1530, -0.212114393711090087890625);
    float _1542 = _1504 * 0.693147182464599609375;
    float _1544 = fma(_1520, _1540, 1.570728778839111328125);
    float _1546 = sqrt(_1516);
    float _1548 = -_1482;
    float _1550 = fma(_1522, _1528, _1548);
    float _1552 = fma(_1550, 0.5, 0.5);
    float _1554 = _1534 * _1536;
    float _1556 = _1538 * _1536;
    float _1558 = _1542 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1560 = fma(_1554, 0.5, 0.5);
    float _1562 = fma(_1556, -0.5, 0.5);
    float _1564 = _1546 * 0.636619746685028076171875;
    float3 _4282 = float3(_1560, _1562, _1558);
    float _1566 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4282, float3(0.0), isnan(_4282)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4282, float3(0.0), isnan(_4282)), level(0.0)).x;
    float3 _4293 = float3(_1560, _1562, _1558);
    float4 _1569 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4293, float3(0.0), isnan(_4293)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4293, float3(0.0), isnan(_4293)), level(0.0)).xyzw;
    float _1571 = _1569.x;
    float _1573 = _1569.y;
    float _1575 = _1569.z;
    float _1577 = _1569.w;
    float _1579 = -_1544;
    float _1581 = fma(_1564, _1579, 1.0);
    float2 _4315 = float2(_1581, _1552);
    float3 _1585 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4315, float2(0.0), isnan(_4315)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4315, float2(0.0), isnan(_4315)), level(0.0)).xyz;
    float _1587 = _1585.x;
    float _1589 = _1585.y;
    float _1591 = _1585.z;
    float _1593 = _766 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1595 = _1470 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1597 = fma(_772, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1593);
    float _1599 = _766 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1601 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1603 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1605 = _1601 || _1603;
    bool _1607 = isnan(0.5);
    bool _1609 = _1605 || _1607;
    float _1611 = fma(_1478, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1595);
    float _1613 = fma(_786, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1597);
    float _1615 = fma(_772, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1599);
    float _1617 = fma(_1456, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1611);
    float _1619 = _1613 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1621 = fma(_786, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1615);
    float _1623 = 1.0 / _1619;
    float _1625 = _1621 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1627 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _1629 = _1558;
    float _1631 = _1613;
    float _1633 = _1562;
    if (!_1609)
    {
        _1627 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _1635 = _1627;
    float _1637 = _1625 + _1619;
    float _1639 = _1635;
    if (!_1609)
    {
        _846 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _1641 = _846;
    float _1643 = _1641;
    if (!_1609)
    {
        float _1645 = -_1635;
        float _1647 = _1645 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _1629 = _1647;
    }
    float _1649 = _1629;
    float _1651 = _1464 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    if (_1609)
    {
        _1631 = 1.0;
    }
    float _1653 = _1631;
    float _1655 = _1653;
    if (!_1609)
    {
        float _1657 = 1.0 / _1649;
        _1633 = _1657;
    }
    float _1659 = _1633;
    float _1661 = _1637 * _1623;
    float _1663 = _1661 * 0.5;
    float _1665 = _1623;
    if (!_1609)
    {
        float _1667 = -_1641;
        float _1669 = _1667 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1665 = _1669;
    }
    float _1671 = _1665;
    float _1673 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1675 = fma(_1663, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1673);
    float _1677 = exp2(_1651);
    float _1679 = 1.0 / _1675;
    float _1681 = _1671;
    if (!_1609)
    {
        float _1683 = 1.0 / _1671;
        _1681 = _1683;
    }
    float _1685 = _1681;
    float _1687 = -_1677;
    float _1689 = _1687 + 1.0;
    float _1691 = fma(_1490, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1617);
    float _1693 = _1689 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1695 = _1691 + _1512;
    float _1697 = _1679;
    if (!_1609)
    {
        float _1699 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1701 = -_1635;
        float _1703 = fma(_1679, _1699, _1701);
        _1639 = _1703;
    }
    float _1705 = _1639;
    float _1707 = _1705;
    if (!_1609)
    {
        float _1709 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1711 = -_1641;
        float _1713 = fma(_1679, _1709, _1711);
        _1643 = _1713;
    }
    float _1715 = _1643;
    if (_1609)
    {
        _1697 = 1.0;
    }
    float _1717 = _1697;
    float _1719 = _1695 * 0.5;
    float _1721 = _1717;
    if (!_1609)
    {
        float _1723 = _1705 * _1659;
        float _1725 = precise::clamp(_1723, 0.0, 1.0);
        _1707 = _1725;
    }
    float _1727 = _1707;
    if (!_1609)
    {
        float _1729 = _1715 * _1685;
        float _1731 = precise::clamp(_1729, 0.0, 1.0);
        _1655 = _1731;
    }
    float _1733 = _1655;
    if (!_1609)
    {
        float _1735 = -_1727;
        float _1737 = _1735 + 1.0;
        _1721 = _1737;
    }
    float _1739 = _1721;
    out.m_64.z = _1719;
    out.m_64.w = _1512;
    float _1741 = _1733 * _1739;
    bool _1743 = _1733 > 0.0;
    bool _1745 = isnan(_1733);
    bool _1747 = _1743 || _1745;
    bool _1749 = isnan(0.0);
    bool _1751 = _1747 || _1749;
    float _1753 = _1741 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _1755 = _1739 <= 0.0;
    bool _1757 = !_1751;
    bool _1759 = _1755 || _1757;
    float _1761 = _1753 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_47.x = _1761;
    out.gl_Position.x = _1534;
    out.gl_Position.y = _1538;
    out.gl_Position.z = _1691;
    out.gl_Position.w = _1512;
    float _1763 = _1693 * _1566;
    float _1765 = -_1693;
    float _1767 = _1765 + 1.0;
    float _1769 = _1577 * _1763;
    float _1771 = _1577 * _1767;
    float _1773 = _1591 * _1763;
    float _1775 = fma(_1587, _1769, _1571);
    float _1777 = fma(_1589, _1769, _1573);
    float _1779 = fma(_1577, _1773, _1575);
    out.m_66.x = _1775;
    out.m_66.y = _1777;
    out.m_66.z = _1779;
    out.m_66.w = _1771;
    if (!_1759)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _1781 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1781;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1076 = false;
    bool _385 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _80 = in.m_44.w;
    float _82 = trunc(_80);
    int _85 = int(_82);
    bool _89 = _85 >= 1;
    float _91 = 0.0;
    if (!_89)
    {
        _91 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _93 = _91;
    float _95 = _93;
    if (!_89)
    {
        out.m_47.x = 0.0;
    }
    int _97 = 0;
    if (!_89)
    {
        float _99 = _93 * 5.0;
        _97 = as_type<int>(_99);
    }
    int _101 = _97;
    int _103 = _101;
    if (!_89)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1838 = as_type<float>(_101);
        out.gl_Position.z = _1838;
    }
    if (!_89)
    {
        return out;
    }
    float _105 = in.m_49.w;
    bool _107 = _105 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _109 = isnan(_105);
    bool _111 = _107 || _109;
    bool _113 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _115 = _111 || _113;
    float _117 = -_105;
    float _119 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_115)
    {
        float _121 = float(_85);
        _95 = _121;
    }
    float _123 = _95;
    bool _125 = _119 >= _123;
    bool _127 = !_115;
    bool _129 = _125 || _127;
    float _131 = _123;
    if (_129)
    {
        _131 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _133 = _131;
    if (_129)
    {
        out.m_47.x = 0.0;
    }
    if (_129)
    {
        float _135 = _133 * 5.0;
        _103 = as_type<int>(_135);
    }
    int _137 = _103;
    if (_129)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1907 = as_type<float>(_137);
        out.gl_Position.z = _1907;
    }
    if (_129)
    {
        return out;
    }
    float _139 = in.m_51.x;
    float _141 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _143 = _119 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _145 = as_type<float>(int(gl_VertexIndex));
    float _147 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _149 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _151 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _153 = _149 || _151;
    bool _155 = isnan(1.0);
    bool _157 = _153 || _155;
    float _159 = _143 * _141;
    float _161 = 0.0;
    float _163 = _147;
    if (!_157)
    {
        float _165 = _147 * _147;
        float _167 = _165 * 0.5;
        _161 = _167;
    }
    float _169 = _161;
    float _171 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[20].x, _159);
    float _173 = _169;
    if (!_157)
    {
        float _175 = _169 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _173 = _175;
    }
    float _177 = _173;
    float _179 = in.m_49.x;
    float _181 = in.m_49.y;
    float _183 = in.m_49.z;
    float _185 = _171 * 6.283185482025146484375;
    float _187 = floor(_171);
    int _189 = as_type<int>(_145) & 1;
    bool _191 = _189 != 0;
    int _193 = as_type<int>(_145) & 2;
    bool _195 = _193 != 0;
    float _197 = _185 * 0.15915493667125701904296875;
    int _199 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _201 = _199 != 0;
    float _203 = _197 * 6.283185482025146484375;
    float _205 = cos(_203);
    bool _207 = !_191;
    float _209 = _207 ? (-0.5) : 0.5;
    float _211 = -_187;
    float _213 = _171 + _211;
    bool _215 = !_195;
    float _217 = _215 ? (-0.5) : 0.5;
    bool _219 = !_157;
    float _221 = _177;
    if (!_219)
    {
        float _223 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _225 = log2(_223);
        float _227 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _229 = _227 + 1.0;
        float _231 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _233 = _147 * _225;
        float _235 = 1.0 / _229;
        float _237 = _231 * 0.693147182464599609375;
        float _239 = exp2(_233);
        float _241 = 1.0 / _237;
        float _243 = _239 + (-1.0);
        float _245 = -_243;
        float _247 = fma(_245, _241, _147);
        float _249 = _247 * _235;
        float _251 = _249 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _221 = _251;
    }
    float _253 = _221;
    bool _255 = !_157;
    if (!_255)
    {
        float _257 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _259 = log2(_257);
        float _261 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _263 = _261 + 1.0;
        float _265 = 1.0 / _263;
        float _267 = _147 * _259;
        float _269 = exp2(_267);
        float _271 = -_269;
        float _273 = _271 + 1.0;
        float _275 = _273 * _265;
        _163 = _275;
    }
    float _277 = _163;
    float _279 = fma(_205, 0.5, 0.5);
    int _281 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _283 = _281 != 0;
    int _285 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _287 = _285 != 0;
    float _289 = in.m_56.w;
    bool _291 = _213 < 0.5;
    float _293 = float(_291);
    float _295 = -_213;
    float _297 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _299 = !_201;
    int _301 = _299 ? 0 : 1;
    float _303 = in.m_44.x;
    float _305 = in.m_44.y;
    float _307 = in.m_44.z;
    bool _309 = !_283;
    int _311 = _309 ? 0 : 1;
    float _313 = _253 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _315 = -_293;
    float _317 = fma(_315, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _319 = -_279;
    float _321 = fma(_319, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _323 = abs(_311);
    float _325 = fma(_277, _179, _313);
    int _327 = abs(_301);
    float _329 = _253 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _331 = !_287;
    int _333 = _331 ? 0 : 1;
    float _335 = fma(_277, _181, _329);
    bool _337 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _339 = abs(_333);
    float _341 = _253 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _343 = float(_323);
    float _345 = float(_327);
    float _347 = fma(_277, _183, _341);
    float _349 = abs(_297);
    float _351 = _343 * _349;
    float _353 = fma(_347, _289, _307);
    float _355 = float(_339);
    float _357 = fma(_345, _321, _351);
    float _359 = fma(_325, _289, _303);
    float _361 = fma(_335, _289, _305);
    float _363 = abs(_317);
    float _365 = fma(_355, _363, _357);
    bool _367 = !_337;
    float _383;
    if (!_367)
    {
        float _369 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _371 = _139 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _373 = fma(_371, (*spvDescriptorSet0.vp_c9)._m0[12].x, _119);
        float _375 = _373 * _369;
        float _377 = floor(_375);
        float _379 = -_377;
        float _381 = _375 + _379;
        _383 = _381;
        _385 = true;
    }
    else
    {
        float _387 = float(_85);
        float _389 = 1.0 / _387;
        float _391 = _119 * _389;
        _383 = _391;
    }
    _385 = false;
    float _393 = _383;
    float _395 = _139 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _397 = in.m_51.y;
    float _399 = _361 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _401 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _403 = _401 != 0;
    float _405 = _361 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _407 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _409 = _407 != 0;
    float _411 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[4].x, _399);
    float _413 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[5].x, _405);
    float _415 = _361 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _417 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _419 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _421 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[6].x, _415);
    float _423 = -_417;
    float _425 = fma(_395, 2.0, _423);
    float _427 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _429 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[78].z, _419);
    float _431 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _433 = _139 > 0.5;
    float _435 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _437 = _427 * _139;
    float _439 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _441 = _397 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _443 = fma(_397, (*spvDescriptorSet0.vp_c9)._m0[78].w, _431);
    float _445 = fma(_353, (*spvDescriptorSet0.vp_c10)._m0[4].z, _411);
    float _447 = trunc(_437);
    int _449 = int(_447);
    float _451 = fma(_441, -2.0, _439);
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _455 = _453 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _459 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _457;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _463 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _461;
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _467 = _393 + _465;
    bool _469 = _397 > 0.5;
    float _471 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _473 = _393 + _471;
    float _475 = 1.0 / _455;
    float _477 = fma(_353, (*spvDescriptorSet0.vp_c10)._m0[5].z, _413);
    float _479 = fma(_353, (*spvDescriptorSet0.vp_c10)._m0[6].z, _421);
    float _481 = -_119;
    float _483 = fma(_481, (*spvDescriptorSet0.vp_c9)._m0[76].x, _425);
    float _485 = 1.0 / _459;
    int _487 = _449 << 4;
    int _489 = _487 + 1968;
    float _491 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[76].y, _451);
    float _493 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[77].w, _443);
    float _495 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _497 = _489 + 8;
    uint _500 = uint(int(uint(_497) >> uint(2)));
    uint _502 = uint(int(uint(int(_500)) >> uint(2)));
    int _504 = int(_500) & 3;
    float _506 = (*spvDescriptorSet0.vp_c9)._m0[int(_502)][_504];
    float _508 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _510 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _512 = 1.0 / _463;
    float _514 = _467 * _475;
    float _516 = -_209;
    int _518 = _433 ? as_type<int>(_516) : as_type<int>(_209);
    float _520 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _522 = _495 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    uint _524 = uint(int(uint(_489) >> uint(2)));
    uint _526 = uint(int(uint(int(_524)) >> uint(2)));
    int _528 = int(_524) & 3;
    float _530 = (*spvDescriptorSet0.vp_c9)._m0[int(_526)][_528];
    int _532 = int(_524) + 1;
    uint _534 = uint(int(uint(_532) >> uint(2)));
    int _536 = _532 & 3;
    float _538 = (*spvDescriptorSet0.vp_c9)._m0[int(_534)][_536];
    bool _540 = !_403;
    float _542 = _540 ? _209 : as_type<float>(_518);
    float _544 = _508 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _546 = _473 * _485;
    float _548 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[77].z, _429);
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _552 = _393 + _550;
    float _554 = _510 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _556 = _435 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _558 = _542 + 0.5;
    float _560 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _562 = _552 * _512;
    float _564 = _477 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _566 = fma(_556, _558, _483);
    out.m_58.x = _522;
    out.m_58.y = _544;
    out.m_58.z = _554;
    out.m_58.w = _520;
    float _568 = _445 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _570 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _572 = _564 + _570;
    float _574 = _479 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _576 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _578 = _568 + _576;
    float _580 = -_493;
    float _582 = _580 + 1.0;
    float _584 = -_548;
    float _586 = _584 + 1.0;
    float _588 = _560 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _590 = -_586;
    float _592 = fma(_542, _590, _566);
    float _594 = _572 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _596 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _598 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _596;
    float _600 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _602 = _600 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _606 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _604;
    float _608 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _610 = _608 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _612 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _614 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _612;
    float _616 = fma(_578, (*spvDescriptorSet0.vp_c8)._m0[28].x, _594);
    float _618 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _620 = _574 + _618;
    float _622 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _624 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _622;
    float _626 = -_217;
    int _628 = _469 ? as_type<int>(_626) : as_type<int>(_217);
    float _630 = fma(_602, _514, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _632 = fma(_620, (*spvDescriptorSet0.vp_c8)._m0[28].z, _616);
    float _634 = fma(_610, _514, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _636 = !_409;
    float _638 = _636 ? _217 : as_type<float>(_628);
    float _640 = _506 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _642 = _572 * _572;
    bool _644 = _632 >= 0.0;
    float _646 = _530 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _648 = _638 + (-0.5);
    float _650 = _538 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _652 = _640 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _654 = _646 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _656 = -_588;
    float _658 = -_491;
    float _660 = fma(_656, _648, _658);
    float _662 = _650 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _664 = fma(_578, _578, _642);
    bool _666 = _393 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _668 = isnan(_393);
    bool _670 = _666 || _668;
    bool _672 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _674 = _670 || _672;
    float _676 = float(_674);
    float _678 = fma(_638, _582, _660);
    bool _680 = _393 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _682 = isnan(_393);
    bool _684 = _680 || _682;
    bool _686 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _688 = _684 || _686;
    float _690 = float(_688);
    float _692 = fma(_620, _620, _664);
    out.m_60.x = _654;
    out.m_60.y = _662;
    out.m_60.z = _652;
    float _694 = _582;
    float _696 = _574;
    if (_644)
    {
        _694 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _698 = _694;
    float _700 = -_676;
    float _702 = _700 + 1.0;
    float _704 = fma(_614, _562, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _706 = in.m_56.x;
    float _708 = in.m_56.y;
    float _710 = rsqrt(_692);
    int _712 = as_type<int>(_698);
    if (_644)
    {
        float _714 = _698 * 5.0;
        _712 = as_type<int>(_714);
    }
    int _716 = _712;
    float _718 = _690 * _702;
    float _720 = -_690;
    float _722 = _720 + 1.0;
    out.m_62.x = _592;
    out.m_62.y = _678;
    float _724 = fma(_624, _562, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _726 = fma(_598, _546, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _728 = _393 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _730 = isnan(_393);
    bool _732 = _728 || _730;
    bool _734 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _736 = _732 || _734;
    float _738 = float(_736);
    if (_644)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2901 = as_type<float>(_716);
        out.gl_Position.z = _2901;
    }
    float _740 = fma(_606, _546, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _742 = _393 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _744 = isnan(_393);
    bool _746 = _742 || _744;
    bool _748 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _750 = _746 || _748;
    float _752 = float(_750);
    if (_644)
    {
        out.m_47.x = 0.0;
    }
    float _754 = _738 * _722;
    float _756 = -_738;
    float _758 = _756 + 1.0;
    float _760 = _572 * _710;
    float _762 = _578 * _710;
    if (_644)
    {
        return out;
    }
    float _764 = -_760;
    float _766 = fma(_764, (*spvDescriptorSet0.vp_c9)._m0[18].w, _564);
    float _768 = _620 * _710;
    float _770 = -_762;
    float _772 = fma(_770, (*spvDescriptorSet0.vp_c9)._m0[18].w, _568);
    float _774 = _752 * _758;
    float _776 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _778 = _766 + _776;
    float _780 = -_752;
    float _782 = _780 + 1.0;
    float _784 = -_768;
    float _786 = fma(_784, (*spvDescriptorSet0.vp_c9)._m0[18].w, _574);
    float _788 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _790 = _772 + _788;
    float _792 = _778 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _794 = -_760;
    float _796 = fma(_794, (*spvDescriptorSet0.vp_c9)._m0[18].w, _572);
    float _798 = -_762;
    float _800 = fma(_798, (*spvDescriptorSet0.vp_c9)._m0[18].w, _578);
    float _802 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _804 = _786 + _802;
    float _806 = fma(_790, (*spvDescriptorSet0.vp_c8)._m0[28].x, _792);
    float _808 = _726 * _774;
    float _810 = _740 * _774;
    float _812 = _796 * _796;
    float _814 = fma(_804, (*spvDescriptorSet0.vp_c8)._m0[28].z, _806);
    float _816 = fma(_782, (*spvDescriptorSet0.vp_c9)._m0[143].x, _808);
    float _818 = fma(_782, (*spvDescriptorSet0.vp_c9)._m0[143].y, _810);
    float _820 = fma(_800, _800, _812);
    float _822 = -_768;
    float _824 = fma(_822, (*spvDescriptorSet0.vp_c9)._m0[18].w, _620);
    bool _826 = _814 >= 0.0;
    float _828 = fma(_630, _754, _816);
    float _830 = fma(_634, _754, _818);
    float _832 = fma(_824, _824, _820);
    float _834 = fma(_704, _718, _828);
    float _836 = fma(_724, _718, _830);
    float _838 = sqrt(_832);
    float _840 = fma(_676, (*spvDescriptorSet0.vp_c9)._m0[146].x, _834);
    float _842 = fma(_676, (*spvDescriptorSet0.vp_c9)._m0[146].y, _836);
    float _844 = _782;
    float _846 = _766;
    if (_826)
    {
        _844 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _848 = _844;
    float _850 = _840 * _706;
    float _852 = _842 * _708;
    int _854 = as_type<int>(_848);
    if (_826)
    {
        out.m_47.x = 0.0;
    }
    if (_826)
    {
        float _856 = _848 * 5.0;
        _854 = as_type<int>(_856);
    }
    int _858 = _854;
    float _860 = _365 * _850;
    float _862 = _365 * _852;
    if (_826)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3127 = as_type<float>(_858);
        out.gl_Position.z = _3127;
    }
    float _864 = _710 * _838;
    if (_826)
    {
        return out;
    }
    float _866 = _862 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _868 = _860 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _870 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _217);
    float _872 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _209);
    float _874 = _864 * _866;
    float _876 = _864 * _868;
    float _878 = _864 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _880 = _878 * 0.5;
    float _882 = _870 * _874;
    float _884 = _872 * _876;
    float _886 = _882 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _888 = _882 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _890 = _882 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _892 = fma(_884, (*spvDescriptorSet0.vp_c8)._m0[24].x, _886);
    float _894 = fma(_884, (*spvDescriptorSet0.vp_c8)._m0[26].x, _888);
    float _896 = fma(_884, (*spvDescriptorSet0.vp_c8)._m0[25].x, _890);
    float _898 = fma(_880, (*spvDescriptorSet0.vp_c8)._m0[24].z, _892);
    float _900 = fma(_880, (*spvDescriptorSet0.vp_c8)._m0[26].z, _894);
    float _902 = fma(_880, (*spvDescriptorSet0.vp_c8)._m0[25].z, _896);
    float _904 = _898 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _906 = _900 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _908 = _902 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _910 = _568 + _904;
    float _912 = _574 + _906;
    float _914 = _564 + _908;
    float _916 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _918 = _910 + _916;
    float _920 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _922 = _912 + _920;
    float _924 = _918 * _918;
    float _926 = _922 * _922;
    float _928 = _924 + _926;
    float _930 = sqrt(_928);
    bool _932 = _930 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _934 = _890;
    float _936 = _908;
    float _938 = _902;
    float _940 = _910;
    float _942 = _926;
    if (!_932)
    {
        _934 = _910;
    }
    float _944 = _934;
    float _946 = _944;
    if (!_932)
    {
        _936 = _924;
    }
    float _948 = _936;
    float _950 = _948;
    if (!_932)
    {
        _938 = _912;
    }
    float _952 = _938;
    float _954 = _952;
    if (!_932)
    {
        _940 = _914;
    }
    float _956 = _940;
    bool _958 = !_932;
    float _960 = _956;
    if (!_958)
    {
        float _962 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _964 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _966 = _930 + _964;
        float _968 = rsqrt(_928);
        float _970 = _966 * _962;
        float _972 = _914 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _974 = _970 * 0.15915493667125701904296875;
        float _976 = _974 * 6.283185482025146484375;
        float _978 = sin(_976);
        float _980 = _974 * 6.283185482025146484375;
        float _982 = cos(_980);
        float _984 = fma(_978, _972, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _986 = _968 * _984;
        float _988 = _982 + (-1.0);
        float _990 = fma(_918, _986, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _992 = fma(_922, _986, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _994 = _988 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _996 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _998 = _990 + _996;
        float _1000 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1002 = _992 + _1000;
        float _1004 = fma(_914, _982, _994);
        float _1006 = _998 * _998;
        float _1008 = _1002 * _1002;
        _960 = _1004;
        _950 = _1006;
        _942 = _1008;
        _946 = _990;
        _954 = _992;
    }
    float _1010 = _960;
    float _1012 = _950;
    float _1014 = _942;
    float _1016 = _946;
    float _1018 = _954;
    float _1020 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1022 = _1010 + _1020;
    float _1024 = fma(_1022, _1022, _1012);
    float _1026 = _1024 + _1014;
    float _1028 = sqrt(_1026);
    bool _1030 = _1028 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1032 = isnan(_1028);
    bool _1034 = _1030 || _1032;
    bool _1036 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1038 = _1034 || _1036;
    float _1040 = _1024;
    if (!_1038)
    {
        _1040 = 1.0;
    }
    float _1042 = _1040;
    bool _1044 = !_1038;
    float _1046 = _1042;
    if (!_1044)
    {
        bool _1048 = _1028 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1050 = isnan(_1028);
        bool _1052 = _1048 || _1050;
        bool _1054 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1056 = _1052 || _1054;
        if (!_1056)
        {
            float _1058 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1060 = _1028 + _1058;
            float _1062 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1064 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1062;
            float _1066 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1068 = _1066 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1070 = 1.0 / _1064;
            float _1072 = _1060 * _1070;
            float _1074 = fma(_1072, _1068, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1046 = _1074;
            _1076 = true;
        }
        else
        {
            bool _1078 = _1028 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1080 = isnan(_1028);
            bool _1082 = _1078 || _1080;
            bool _1084 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1086 = _1082 || _1084;
            if (!_1086)
            {
                float _1088 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1090 = _1028 + _1088;
                float _1092 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1094 = _1092 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1096 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1098 = _1096 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1100 = 1.0 / _1094;
                float _1102 = _1090 * _1100;
                float _1104 = fma(_1102, _1098, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1046 = _1104;
                _1076 = true;
            }
            else
            {
                _1046 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1076 = false;
    float _1106 = _1046;
    float _1108 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1110 = _1016 + _1108;
    float _1112 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1114 = _1010 + _1112;
    float _1116 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1118 = _1018 + _1116;
    bool _1120 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1122 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1124 = _1120 || _1122;
    bool _1126 = isnan(0.5);
    bool _1128 = _1124 || _1126;
    float _1130 = fma(_1110, _1106, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1132 = fma(_1114, _1106, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1134 = fma(_1118, _1106, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1136 = -_762;
    float _1138 = fma(_1136, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1130);
    float _1140 = -_760;
    float _1142 = fma(_1140, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1132);
    float _1144 = -_768;
    float _1146 = fma(_1144, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1134);
    float _1148 = _1142;
    float _1150 = _1138;
    float _1152 = _1146;
    if (!_1128)
    {
        float _1154 = _778 * _778;
        float _1156 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1158 = -_568;
        float _1160 = _1158 + _1130;
        float _1162 = -_564;
        float _1164 = _1162 + _1132;
        float _1166 = fma(_790, _790, _1154);
        float _1168 = -_574;
        float _1170 = _1168 + _1134;
        float _1172 = fma(_804, _804, _1166);
        float _1174 = 1.0 / _864;
        float _1176 = sqrt(_1172);
        float _1178 = _1160 * _1174;
        float _1180 = _1164 * _1174;
        float _1182 = _1170 * _1174;
        bool _1184 = _1176 > (*spvDescriptorSet0.vp_c9)._m0[199].x;
        bool _1186 = isnan(_1176);
        bool _1188 = _1184 || _1186;
        bool _1190 = isnan((*spvDescriptorSet0.vp_c9)._m0[199].x);
        bool _1192 = _1188 || _1190;
        float _1194 = precise::min(_1176, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1196 = _1194 * _1156;
        float _1198 = fma(_1178, _1196, _772);
        float _1200 = fma(_1180, _1196, _766);
        float _1202 = _1154;
        float _1204 = _1194;
        float _1206 = _1196;
        float _1208 = _1198;
        _696 = _1182;
        if (_1192)
        {
            float _1210 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].y;
            _1202 = _1210;
        }
        float _1212 = _1202;
        if (_1192)
        {
            float _1214 = precise::max(_1176, (*spvDescriptorSet0.vp_c9)._m0[199].y);
            _1204 = _1214;
        }
        float _1216 = _1204;
        float _1218 = fma(_1182, _1196, _786);
        float _1220 = _1216;
        if (!_1192)
        {
            _1206 = _1198;
        }
        float _1222 = _1206;
        float _1224 = _1222;
        if (!_1192)
        {
            _1208 = _1200;
        }
        float _1226 = _1208;
        float _1228 = _1212;
        float _1230 = _1226;
        if (_1192)
        {
            float _1232 = _1216 * _1212;
            _1228 = _1232;
        }
        float _1234 = _1228;
        if (!_1192)
        {
            _1220 = _1218;
        }
        float _1236 = _1220;
        _1152 = _1236;
        if (_1192)
        {
            float _1238 = fma(_1178, _1234, _772);
            _1224 = _1238;
        }
        float _1240 = _1224;
        _1150 = _1240;
        if (_1192)
        {
            float _1242 = fma(_1180, _1234, _766);
            _1230 = _1242;
        }
        float _1244 = _1230;
        _1148 = _1244;
        if (_1192)
        {
            float _1246 = fma(_1182, _1234, _786);
            _1152 = _1246;
        }
    }
    float _1248 = _1148;
    float _1250 = _1150;
    float _1252 = _1152;
    float _1254 = _696;
    float _1256 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1258 = _1248 + _1256;
    float _1260 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1262 = _1250 + _1260;
    float _1264 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1266 = _1252 + _1264;
    float _1268 = _1258 * _1258;
    float _1270 = fma(_1262, _1262, _1268);
    float _1272 = fma(_1266, _1266, _1270);
    float _1274 = rsqrt(_1272);
    float _1276 = _1274 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1278 = _1262 * _1276;
    float _1280 = _1266 * _1276;
    float _1282 = _1278 * _1278;
    float _1284 = _1280 * _1280;
    float _1286 = _1282 + _1284;
    float _1288 = sqrt(_1286);
    bool _1290 = _1288 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1292 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1294 = _1288 + _1292;
    float _1296 = _1266;
    float _1298 = _1286;
    float _1300 = _1294;
    float _1302 = _1254;
    float _1304 = _1276;
    if (_1290)
    {
        float _1306 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1296 = _1306;
    }
    float _1308 = _1296;
    if (_1290)
    {
        float _1310 = rsqrt(_1286);
        _1298 = _1310;
    }
    float _1312 = _1298;
    if (_1290)
    {
        float _1314 = _1294 * _1308;
        _1300 = _1314;
    }
    float _1316 = _1300;
    if (_1290)
    {
        float _1318 = _1316 * 0.15915493667125701904296875;
        _1302 = _1318;
    }
    float _1320 = _1302;
    float _1322 = _1268;
    float _1324 = _1320;
    if (_1290)
    {
        float _1326 = _1320 * 6.283185482025146484375;
        float _1328 = sin(_1326);
        _1322 = _1328;
    }
    float _1330 = _1322;
    float _1332 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1334 = precise::max(0.0, _1332);
    float _1336 = _1274;
    float _1338 = _1334;
    float _1340 = _1332;
    if (_1290)
    {
        float _1342 = _1320 * 6.283185482025146484375;
        float _1344 = cos(_1342);
        _1336 = _1344;
    }
    float _1346 = _1336;
    float _1348 = -_1276;
    float _1350 = -_1334;
    float _1352 = fma(_1258, _1348, _1350);
    float _1354 = _1352;
    if (!_1290)
    {
        _1338 = _1278;
    }
    float _1356 = _1338;
    float _1358 = _1356;
    if (_1290)
    {
        float _1360 = _1352 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1340 = _1360;
    }
    float _1362 = _1340;
    float _1364 = _1330;
    float _1366 = _1362;
    if (_1290)
    {
        float _1368 = fma(_1330, _1362, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1364 = _1368;
    }
    float _1370 = _1364;
    float _1372 = _1370;
    float _1374 = _1346;
    if (_1290)
    {
        float _1376 = _1346 + (-1.0);
        _1366 = _1376;
    }
    float _1378 = _1366;
    float _1380 = _1378;
    if (_1290)
    {
        float _1382 = _1312 * _1370;
        _1304 = _1382;
    }
    float _1384 = _1304;
    if (!_1290)
    {
        _1372 = _1282;
    }
    float _1386 = _1372;
    float _1388 = sqrt(_1272);
    float _1390 = _1386;
    if (_1290)
    {
        float _1392 = _1378 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1324 = _1392;
    }
    float _1394 = _1324;
    if (_1290)
    {
        float _1396 = _1278 * _1384;
        _1358 = _1396;
    }
    float _1398 = _1358;
    if (!_1290)
    {
        _1380 = _1280;
    }
    float _1400 = _1380;
    float _1402 = _1400;
    if (_1290)
    {
        float _1404 = _1280 * _1384;
        _1402 = _1404;
    }
    float _1406 = _1402;
    if (_1290)
    {
        float _1408 = fma(_1352, _1346, _1394);
        _1354 = _1408;
    }
    float _1410 = _1354;
    if (_1290)
    {
        float _1412 = _1398 * _1398;
        _1390 = _1412;
    }
    float _1414 = _1390;
    if (!_1290)
    {
        _1374 = _1284;
    }
    float _1416 = _1374;
    float _1418 = _1416;
    if (_1290)
    {
        float _1420 = _1406 * _1406;
        _1418 = _1420;
    }
    float _1422 = _1418;
    float _1424 = fma(_1410, _1410, _1414);
    float _1426 = _1424 + _1422;
    float _1428 = _1248 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1430 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1432 = fma(_1388, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1430);
    float _1434 = precise::clamp(_1432, 0.0, 1.0);
    float _1436 = _1248 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1438 = rsqrt(_1426);
    float _1440 = fma(_1250, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1428);
    float _1442 = _1248 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1444 = -_1434;
    float _1446 = _1444 + 1.0;
    float _1448 = _1248 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1450 = fma(_1252, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1440);
    float _1452 = fma(_1250, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1442);
    float _1454 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1456 = _1450 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1458 = fma(_1250, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1436);
    float _1460 = fma(_1252, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1452);
    float _1462 = abs(_1446);
    float _1464 = log2(_1462);
    float _1466 = fma(_1250, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1448);
    float _1468 = fma(_1252, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1458);
    float _1470 = _1460 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1472 = _1438 * _1398;
    float _1474 = _1456 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1476 = fma(_1252, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1466);
    float _1478 = _1468 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1480 = _1470 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1482 = _1438 * _1410;
    float _1484 = _1472 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1486 = -_1474;
    float _1488 = fma(_1486, _1454, 1.0);
    float _1490 = _1476 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1492 = fma(_1478, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1480);
    float _1494 = _1438 * _1406;
    float _1496 = -_1484;
    float _1498 = fma(_1482, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1496);
    float _1500 = _1464 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1502 = fma(_1456, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1492);
    float _1504 = log2(_1488);
    float _1506 = -_1494;
    float _1508 = fma(_1506, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1498);
    float _1510 = _1470 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1512 = fma(_1490, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1502);
    float _1514 = _1470 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1516 = fma(_1508, -0.5, 0.5);
    float _1518 = fma(_1478, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1510);
    float _1520 = fma(_1508, 0.5, 0.5);
    float _1522 = exp2(_1500);
    float _1524 = fma(_1478, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1514);
    float _1526 = fma(_1456, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1518);
    float _1528 = _1482 + 1.0;
    float _1530 = fma(_1520, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1532 = fma(_1456, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1524);
    float _1534 = fma(_1490, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1526);
    float _1536 = 1.0 / _1512;
    float _1538 = fma(_1490, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1532);
    float _1540 = fma(_1520, _1530, -0.212114393711090087890625);
    float _1542 = _1504 * 0.693147182464599609375;
    float _1544 = fma(_1520, _1540, 1.570728778839111328125);
    float _1546 = sqrt(_1516);
    float _1548 = -_1482;
    float _1550 = fma(_1522, _1528, _1548);
    float _1552 = fma(_1550, 0.5, 0.5);
    float _1554 = _1534 * _1536;
    float _1556 = _1538 * _1536;
    float _1558 = _1542 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1560 = fma(_1554, 0.5, 0.5);
    float _1562 = fma(_1556, -0.5, 0.5);
    float _1564 = _1546 * 0.636619746685028076171875;
    float3 _4282 = float3(_1560, _1562, _1558);
    float _1566 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4282, float3(0.0), isnan(_4282)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4282, float3(0.0), isnan(_4282)), level(0.0)).x;
    float3 _4293 = float3(_1560, _1562, _1558);
    float4 _1569 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4293, float3(0.0), isnan(_4293)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4293, float3(0.0), isnan(_4293)), level(0.0)).xyzw;
    float _1571 = _1569.x;
    float _1573 = _1569.y;
    float _1575 = _1569.z;
    float _1577 = _1569.w;
    float _1579 = -_1544;
    float _1581 = fma(_1564, _1579, 1.0);
    float2 _4315 = float2(_1581, _1552);
    float3 _1585 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4315, float2(0.0), isnan(_4315)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4315, float2(0.0), isnan(_4315)), level(0.0)).xyz;
    float _1587 = _1585.x;
    float _1589 = _1585.y;
    float _1591 = _1585.z;
    float _1593 = _766 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1595 = _1470 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1597 = fma(_772, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1593);
    float _1599 = _766 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1601 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1603 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1605 = _1601 || _1603;
    bool _1607 = isnan(0.5);
    bool _1609 = _1605 || _1607;
    float _1611 = fma(_1478, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1595);
    float _1613 = fma(_786, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1597);
    float _1615 = fma(_772, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1599);
    float _1617 = fma(_1456, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1611);
    float _1619 = _1613 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1621 = fma(_786, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1615);
    float _1623 = 1.0 / _1619;
    float _1625 = _1621 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1627 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _1629 = _1558;
    float _1631 = _1613;
    float _1633 = _1562;
    if (!_1609)
    {
        _1627 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _1635 = _1627;
    float _1637 = _1625 + _1619;
    float _1639 = _1635;
    if (!_1609)
    {
        _846 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _1641 = _846;
    float _1643 = _1641;
    if (!_1609)
    {
        float _1645 = -_1635;
        float _1647 = _1645 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _1629 = _1647;
    }
    float _1649 = _1629;
    float _1651 = _1464 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    if (_1609)
    {
        _1631 = 1.0;
    }
    float _1653 = _1631;
    float _1655 = _1653;
    if (!_1609)
    {
        float _1657 = 1.0 / _1649;
        _1633 = _1657;
    }
    float _1659 = _1633;
    float _1661 = _1637 * _1623;
    float _1663 = _1661 * 0.5;
    float _1665 = _1623;
    if (!_1609)
    {
        float _1667 = -_1641;
        float _1669 = _1667 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1665 = _1669;
    }
    float _1671 = _1665;
    float _1673 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1675 = fma(_1663, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1673);
    float _1677 = exp2(_1651);
    float _1679 = 1.0 / _1675;
    float _1681 = _1671;
    if (!_1609)
    {
        float _1683 = 1.0 / _1671;
        _1681 = _1683;
    }
    float _1685 = _1681;
    float _1687 = -_1677;
    float _1689 = _1687 + 1.0;
    float _1691 = fma(_1490, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1617);
    float _1693 = _1689 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1695 = _1691 + _1512;
    float _1697 = _1679;
    if (!_1609)
    {
        float _1699 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1701 = -_1635;
        float _1703 = fma(_1679, _1699, _1701);
        _1639 = _1703;
    }
    float _1705 = _1639;
    float _1707 = _1705;
    if (!_1609)
    {
        float _1709 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1711 = -_1641;
        float _1713 = fma(_1679, _1709, _1711);
        _1643 = _1713;
    }
    float _1715 = _1643;
    if (_1609)
    {
        _1697 = 1.0;
    }
    float _1717 = _1697;
    float _1719 = _1695 * 0.5;
    float _1721 = _1717;
    if (!_1609)
    {
        float _1723 = _1705 * _1659;
        float _1725 = precise::clamp(_1723, 0.0, 1.0);
        _1707 = _1725;
    }
    float _1727 = _1707;
    if (!_1609)
    {
        float _1729 = _1715 * _1685;
        float _1731 = precise::clamp(_1729, 0.0, 1.0);
        _1655 = _1731;
    }
    float _1733 = _1655;
    if (!_1609)
    {
        float _1735 = -_1727;
        float _1737 = _1735 + 1.0;
        _1721 = _1737;
    }
    float _1739 = _1721;
    out.m_64.z = _1719;
    out.m_64.w = _1512;
    float _1741 = _1733 * _1739;
    bool _1743 = _1733 > 0.0;
    bool _1745 = isnan(_1733);
    bool _1747 = _1743 || _1745;
    bool _1749 = isnan(0.0);
    bool _1751 = _1747 || _1749;
    float _1753 = _1741 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _1755 = _1739 <= 0.0;
    bool _1757 = !_1751;
    bool _1759 = _1755 || _1757;
    float _1761 = _1753 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_47.x = _1761;
    out.gl_Position.x = _1534;
    out.gl_Position.y = _1538;
    out.gl_Position.z = _1691;
    out.gl_Position.w = _1512;
    float _1763 = _1693 * _1566;
    float _1765 = -_1693;
    float _1767 = _1765 + 1.0;
    float _1769 = _1577 * _1763;
    float _1771 = _1577 * _1767;
    float _1773 = _1591 * _1763;
    float _1775 = fma(_1587, _1769, _1571);
    float _1777 = fma(_1589, _1769, _1573);
    float _1779 = fma(_1577, _1773, _1575);
    out.m_66.x = _1775;
    out.m_66.y = _1777;
    out.m_66.z = _1779;
    out.m_66.w = _1771;
    if (!_1759)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _1781 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1781;
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
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1076 = false;
    bool _385 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _80 = in.m_44.w;
    float _82 = trunc(_80);
    int _85 = int(_82);
    bool _89 = _85 >= 1;
    float _91 = 0.0;
    if (!_89)
    {
        _91 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _93 = _91;
    float _95 = _93;
    if (!_89)
    {
        out.m_47.x = 0.0;
    }
    int _97 = 0;
    if (!_89)
    {
        float _99 = _93 * 5.0;
        _97 = as_type<int>(_99);
    }
    int _101 = _97;
    int _103 = _101;
    if (!_89)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1838 = as_type<float>(_101);
        out.gl_Position.z = _1838;
    }
    if (!_89)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _105 = in.m_49.w;
    bool _107 = _105 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _109 = isnan(_105);
    bool _111 = _107 || _109;
    bool _113 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _115 = _111 || _113;
    float _117 = -_105;
    float _119 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_115)
    {
        float _121 = float(_85);
        _95 = _121;
    }
    float _123 = _95;
    bool _125 = _119 >= _123;
    bool _127 = !_115;
    bool _129 = _125 || _127;
    float _131 = _123;
    if (_129)
    {
        _131 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _133 = _131;
    if (_129)
    {
        out.m_47.x = 0.0;
    }
    if (_129)
    {
        float _135 = _133 * 5.0;
        _103 = as_type<int>(_135);
    }
    int _137 = _103;
    if (_129)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1907 = as_type<float>(_137);
        out.gl_Position.z = _1907;
    }
    if (_129)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _139 = in.m_51.x;
    float _141 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _143 = _119 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _145 = as_type<float>(int(gl_VertexIndex));
    float _147 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _149 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _151 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _153 = _149 || _151;
    bool _155 = isnan(1.0);
    bool _157 = _153 || _155;
    float _159 = _143 * _141;
    float _161 = 0.0;
    float _163 = _147;
    if (!_157)
    {
        float _165 = _147 * _147;
        float _167 = _165 * 0.5;
        _161 = _167;
    }
    float _169 = _161;
    float _171 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[20].x, _159);
    float _173 = _169;
    if (!_157)
    {
        float _175 = _169 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _173 = _175;
    }
    float _177 = _173;
    float _179 = in.m_49.x;
    float _181 = in.m_49.y;
    float _183 = in.m_49.z;
    float _185 = _171 * 6.283185482025146484375;
    float _187 = floor(_171);
    int _189 = as_type<int>(_145) & 1;
    bool _191 = _189 != 0;
    int _193 = as_type<int>(_145) & 2;
    bool _195 = _193 != 0;
    float _197 = _185 * 0.15915493667125701904296875;
    int _199 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _201 = _199 != 0;
    float _203 = _197 * 6.283185482025146484375;
    float _205 = cos(_203);
    bool _207 = !_191;
    float _209 = _207 ? (-0.5) : 0.5;
    float _211 = -_187;
    float _213 = _171 + _211;
    bool _215 = !_195;
    float _217 = _215 ? (-0.5) : 0.5;
    bool _219 = !_157;
    float _221 = _177;
    if (!_219)
    {
        float _223 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _225 = log2(_223);
        float _227 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _229 = _227 + 1.0;
        float _231 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _233 = _147 * _225;
        float _235 = 1.0 / _229;
        float _237 = _231 * 0.693147182464599609375;
        float _239 = exp2(_233);
        float _241 = 1.0 / _237;
        float _243 = _239 + (-1.0);
        float _245 = -_243;
        float _247 = fma(_245, _241, _147);
        float _249 = _247 * _235;
        float _251 = _249 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _221 = _251;
    }
    float _253 = _221;
    bool _255 = !_157;
    if (!_255)
    {
        float _257 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _259 = log2(_257);
        float _261 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _263 = _261 + 1.0;
        float _265 = 1.0 / _263;
        float _267 = _147 * _259;
        float _269 = exp2(_267);
        float _271 = -_269;
        float _273 = _271 + 1.0;
        float _275 = _273 * _265;
        _163 = _275;
    }
    float _277 = _163;
    float _279 = fma(_205, 0.5, 0.5);
    int _281 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _283 = _281 != 0;
    int _285 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _287 = _285 != 0;
    float _289 = in.m_56.w;
    bool _291 = _213 < 0.5;
    float _293 = float(_291);
    float _295 = -_213;
    float _297 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _299 = !_201;
    int _301 = _299 ? 0 : 1;
    float _303 = in.m_44.x;
    float _305 = in.m_44.y;
    float _307 = in.m_44.z;
    bool _309 = !_283;
    int _311 = _309 ? 0 : 1;
    float _313 = _253 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _315 = -_293;
    float _317 = fma(_315, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _319 = -_279;
    float _321 = fma(_319, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _323 = abs(_311);
    float _325 = fma(_277, _179, _313);
    int _327 = abs(_301);
    float _329 = _253 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _331 = !_287;
    int _333 = _331 ? 0 : 1;
    float _335 = fma(_277, _181, _329);
    bool _337 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _339 = abs(_333);
    float _341 = _253 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _343 = float(_323);
    float _345 = float(_327);
    float _347 = fma(_277, _183, _341);
    float _349 = abs(_297);
    float _351 = _343 * _349;
    float _353 = fma(_347, _289, _307);
    float _355 = float(_339);
    float _357 = fma(_345, _321, _351);
    float _359 = fma(_325, _289, _303);
    float _361 = fma(_335, _289, _305);
    float _363 = abs(_317);
    float _365 = fma(_355, _363, _357);
    bool _367 = !_337;
    float _383;
    if (!_367)
    {
        float _369 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _371 = _139 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _373 = fma(_371, (*spvDescriptorSet0.vp_c9)._m0[12].x, _119);
        float _375 = _373 * _369;
        float _377 = floor(_375);
        float _379 = -_377;
        float _381 = _375 + _379;
        _383 = _381;
        _385 = true;
    }
    else
    {
        float _387 = float(_85);
        float _389 = 1.0 / _387;
        float _391 = _119 * _389;
        _383 = _391;
    }
    _385 = false;
    float _393 = _383;
    float _395 = _139 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _397 = in.m_51.y;
    float _399 = _361 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _401 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _403 = _401 != 0;
    float _405 = _361 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _407 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _409 = _407 != 0;
    float _411 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[4].x, _399);
    float _413 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[5].x, _405);
    float _415 = _361 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _417 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _419 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _421 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[6].x, _415);
    float _423 = -_417;
    float _425 = fma(_395, 2.0, _423);
    float _427 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _429 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[78].z, _419);
    float _431 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _433 = _139 > 0.5;
    float _435 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _437 = _427 * _139;
    float _439 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _441 = _397 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _443 = fma(_397, (*spvDescriptorSet0.vp_c9)._m0[78].w, _431);
    float _445 = fma(_353, (*spvDescriptorSet0.vp_c10)._m0[4].z, _411);
    float _447 = trunc(_437);
    int _449 = int(_447);
    float _451 = fma(_441, -2.0, _439);
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _455 = _453 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _459 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _457;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _463 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _461;
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _467 = _393 + _465;
    bool _469 = _397 > 0.5;
    float _471 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _473 = _393 + _471;
    float _475 = 1.0 / _455;
    float _477 = fma(_353, (*spvDescriptorSet0.vp_c10)._m0[5].z, _413);
    float _479 = fma(_353, (*spvDescriptorSet0.vp_c10)._m0[6].z, _421);
    float _481 = -_119;
    float _483 = fma(_481, (*spvDescriptorSet0.vp_c9)._m0[76].x, _425);
    float _485 = 1.0 / _459;
    int _487 = _449 << 4;
    int _489 = _487 + 1968;
    float _491 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[76].y, _451);
    float _493 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[77].w, _443);
    float _495 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _497 = _489 + 8;
    uint _500 = uint(int(uint(_497) >> uint(2)));
    uint _502 = uint(int(uint(int(_500)) >> uint(2)));
    int _504 = int(_500) & 3;
    float _506 = (*spvDescriptorSet0.vp_c9)._m0[int(_502)][_504];
    float _508 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _510 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _512 = 1.0 / _463;
    float _514 = _467 * _475;
    float _516 = -_209;
    int _518 = _433 ? as_type<int>(_516) : as_type<int>(_209);
    float _520 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _522 = _495 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    uint _524 = uint(int(uint(_489) >> uint(2)));
    uint _526 = uint(int(uint(int(_524)) >> uint(2)));
    int _528 = int(_524) & 3;
    float _530 = (*spvDescriptorSet0.vp_c9)._m0[int(_526)][_528];
    int _532 = int(_524) + 1;
    uint _534 = uint(int(uint(_532) >> uint(2)));
    int _536 = _532 & 3;
    float _538 = (*spvDescriptorSet0.vp_c9)._m0[int(_534)][_536];
    bool _540 = !_403;
    float _542 = _540 ? _209 : as_type<float>(_518);
    float _544 = _508 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _546 = _473 * _485;
    float _548 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[77].z, _429);
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _552 = _393 + _550;
    float _554 = _510 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _556 = _435 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _558 = _542 + 0.5;
    float _560 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _562 = _552 * _512;
    float _564 = _477 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _566 = fma(_556, _558, _483);
    out.m_58.x = _522;
    out.m_58.y = _544;
    out.m_58.z = _554;
    out.m_58.w = _520;
    float _568 = _445 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _570 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _572 = _564 + _570;
    float _574 = _479 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _576 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _578 = _568 + _576;
    float _580 = -_493;
    float _582 = _580 + 1.0;
    float _584 = -_548;
    float _586 = _584 + 1.0;
    float _588 = _560 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _590 = -_586;
    float _592 = fma(_542, _590, _566);
    float _594 = _572 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _596 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _598 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _596;
    float _600 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _602 = _600 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _606 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _604;
    float _608 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _610 = _608 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _612 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _614 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _612;
    float _616 = fma(_578, (*spvDescriptorSet0.vp_c8)._m0[28].x, _594);
    float _618 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _620 = _574 + _618;
    float _622 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _624 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _622;
    float _626 = -_217;
    int _628 = _469 ? as_type<int>(_626) : as_type<int>(_217);
    float _630 = fma(_602, _514, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _632 = fma(_620, (*spvDescriptorSet0.vp_c8)._m0[28].z, _616);
    float _634 = fma(_610, _514, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _636 = !_409;
    float _638 = _636 ? _217 : as_type<float>(_628);
    float _640 = _506 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _642 = _572 * _572;
    bool _644 = _632 >= 0.0;
    float _646 = _530 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _648 = _638 + (-0.5);
    float _650 = _538 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _652 = _640 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _654 = _646 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _656 = -_588;
    float _658 = -_491;
    float _660 = fma(_656, _648, _658);
    float _662 = _650 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _664 = fma(_578, _578, _642);
    bool _666 = _393 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _668 = isnan(_393);
    bool _670 = _666 || _668;
    bool _672 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _674 = _670 || _672;
    float _676 = float(_674);
    float _678 = fma(_638, _582, _660);
    bool _680 = _393 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _682 = isnan(_393);
    bool _684 = _680 || _682;
    bool _686 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _688 = _684 || _686;
    float _690 = float(_688);
    float _692 = fma(_620, _620, _664);
    out.m_60.x = _654;
    out.m_60.y = _662;
    out.m_60.z = _652;
    float _694 = _582;
    float _696 = _574;
    if (_644)
    {
        _694 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _698 = _694;
    float _700 = -_676;
    float _702 = _700 + 1.0;
    float _704 = fma(_614, _562, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _706 = in.m_56.x;
    float _708 = in.m_56.y;
    float _710 = rsqrt(_692);
    int _712 = as_type<int>(_698);
    if (_644)
    {
        float _714 = _698 * 5.0;
        _712 = as_type<int>(_714);
    }
    int _716 = _712;
    float _718 = _690 * _702;
    float _720 = -_690;
    float _722 = _720 + 1.0;
    out.m_62.x = _592;
    out.m_62.y = _678;
    float _724 = fma(_624, _562, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _726 = fma(_598, _546, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _728 = _393 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _730 = isnan(_393);
    bool _732 = _728 || _730;
    bool _734 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _736 = _732 || _734;
    float _738 = float(_736);
    if (_644)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2901 = as_type<float>(_716);
        out.gl_Position.z = _2901;
    }
    float _740 = fma(_606, _546, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _742 = _393 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _744 = isnan(_393);
    bool _746 = _742 || _744;
    bool _748 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _750 = _746 || _748;
    float _752 = float(_750);
    if (_644)
    {
        out.m_47.x = 0.0;
    }
    float _754 = _738 * _722;
    float _756 = -_738;
    float _758 = _756 + 1.0;
    float _760 = _572 * _710;
    float _762 = _578 * _710;
    if (_644)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _764 = -_760;
    float _766 = fma(_764, (*spvDescriptorSet0.vp_c9)._m0[18].w, _564);
    float _768 = _620 * _710;
    float _770 = -_762;
    float _772 = fma(_770, (*spvDescriptorSet0.vp_c9)._m0[18].w, _568);
    float _774 = _752 * _758;
    float _776 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _778 = _766 + _776;
    float _780 = -_752;
    float _782 = _780 + 1.0;
    float _784 = -_768;
    float _786 = fma(_784, (*spvDescriptorSet0.vp_c9)._m0[18].w, _574);
    float _788 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _790 = _772 + _788;
    float _792 = _778 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _794 = -_760;
    float _796 = fma(_794, (*spvDescriptorSet0.vp_c9)._m0[18].w, _572);
    float _798 = -_762;
    float _800 = fma(_798, (*spvDescriptorSet0.vp_c9)._m0[18].w, _578);
    float _802 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _804 = _786 + _802;
    float _806 = fma(_790, (*spvDescriptorSet0.vp_c8)._m0[28].x, _792);
    float _808 = _726 * _774;
    float _810 = _740 * _774;
    float _812 = _796 * _796;
    float _814 = fma(_804, (*spvDescriptorSet0.vp_c8)._m0[28].z, _806);
    float _816 = fma(_782, (*spvDescriptorSet0.vp_c9)._m0[143].x, _808);
    float _818 = fma(_782, (*spvDescriptorSet0.vp_c9)._m0[143].y, _810);
    float _820 = fma(_800, _800, _812);
    float _822 = -_768;
    float _824 = fma(_822, (*spvDescriptorSet0.vp_c9)._m0[18].w, _620);
    bool _826 = _814 >= 0.0;
    float _828 = fma(_630, _754, _816);
    float _830 = fma(_634, _754, _818);
    float _832 = fma(_824, _824, _820);
    float _834 = fma(_704, _718, _828);
    float _836 = fma(_724, _718, _830);
    float _838 = sqrt(_832);
    float _840 = fma(_676, (*spvDescriptorSet0.vp_c9)._m0[146].x, _834);
    float _842 = fma(_676, (*spvDescriptorSet0.vp_c9)._m0[146].y, _836);
    float _844 = _782;
    float _846 = _766;
    if (_826)
    {
        _844 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _848 = _844;
    float _850 = _840 * _706;
    float _852 = _842 * _708;
    int _854 = as_type<int>(_848);
    if (_826)
    {
        out.m_47.x = 0.0;
    }
    if (_826)
    {
        float _856 = _848 * 5.0;
        _854 = as_type<int>(_856);
    }
    int _858 = _854;
    float _860 = _365 * _850;
    float _862 = _365 * _852;
    if (_826)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3127 = as_type<float>(_858);
        out.gl_Position.z = _3127;
    }
    float _864 = _710 * _838;
    if (_826)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _866 = _862 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _868 = _860 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _870 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _217);
    float _872 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _209);
    float _874 = _864 * _866;
    float _876 = _864 * _868;
    float _878 = _864 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _880 = _878 * 0.5;
    float _882 = _870 * _874;
    float _884 = _872 * _876;
    float _886 = _882 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _888 = _882 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _890 = _882 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _892 = fma(_884, (*spvDescriptorSet0.vp_c8)._m0[24].x, _886);
    float _894 = fma(_884, (*spvDescriptorSet0.vp_c8)._m0[26].x, _888);
    float _896 = fma(_884, (*spvDescriptorSet0.vp_c8)._m0[25].x, _890);
    float _898 = fma(_880, (*spvDescriptorSet0.vp_c8)._m0[24].z, _892);
    float _900 = fma(_880, (*spvDescriptorSet0.vp_c8)._m0[26].z, _894);
    float _902 = fma(_880, (*spvDescriptorSet0.vp_c8)._m0[25].z, _896);
    float _904 = _898 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _906 = _900 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _908 = _902 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _910 = _568 + _904;
    float _912 = _574 + _906;
    float _914 = _564 + _908;
    float _916 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _918 = _910 + _916;
    float _920 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _922 = _912 + _920;
    float _924 = _918 * _918;
    float _926 = _922 * _922;
    float _928 = _924 + _926;
    float _930 = sqrt(_928);
    bool _932 = _930 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _934 = _890;
    float _936 = _908;
    float _938 = _902;
    float _940 = _910;
    float _942 = _926;
    if (!_932)
    {
        _934 = _910;
    }
    float _944 = _934;
    float _946 = _944;
    if (!_932)
    {
        _936 = _924;
    }
    float _948 = _936;
    float _950 = _948;
    if (!_932)
    {
        _938 = _912;
    }
    float _952 = _938;
    float _954 = _952;
    if (!_932)
    {
        _940 = _914;
    }
    float _956 = _940;
    bool _958 = !_932;
    float _960 = _956;
    if (!_958)
    {
        float _962 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _964 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _966 = _930 + _964;
        float _968 = rsqrt(_928);
        float _970 = _966 * _962;
        float _972 = _914 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _974 = _970 * 0.15915493667125701904296875;
        float _976 = _974 * 6.283185482025146484375;
        float _978 = sin(_976);
        float _980 = _974 * 6.283185482025146484375;
        float _982 = cos(_980);
        float _984 = fma(_978, _972, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _986 = _968 * _984;
        float _988 = _982 + (-1.0);
        float _990 = fma(_918, _986, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _992 = fma(_922, _986, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _994 = _988 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _996 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _998 = _990 + _996;
        float _1000 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1002 = _992 + _1000;
        float _1004 = fma(_914, _982, _994);
        float _1006 = _998 * _998;
        float _1008 = _1002 * _1002;
        _960 = _1004;
        _950 = _1006;
        _942 = _1008;
        _946 = _990;
        _954 = _992;
    }
    float _1010 = _960;
    float _1012 = _950;
    float _1014 = _942;
    float _1016 = _946;
    float _1018 = _954;
    float _1020 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1022 = _1010 + _1020;
    float _1024 = fma(_1022, _1022, _1012);
    float _1026 = _1024 + _1014;
    float _1028 = sqrt(_1026);
    bool _1030 = _1028 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1032 = isnan(_1028);
    bool _1034 = _1030 || _1032;
    bool _1036 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1038 = _1034 || _1036;
    float _1040 = _1024;
    if (!_1038)
    {
        _1040 = 1.0;
    }
    float _1042 = _1040;
    bool _1044 = !_1038;
    float _1046 = _1042;
    if (!_1044)
    {
        bool _1048 = _1028 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1050 = isnan(_1028);
        bool _1052 = _1048 || _1050;
        bool _1054 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1056 = _1052 || _1054;
        if (!_1056)
        {
            float _1058 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1060 = _1028 + _1058;
            float _1062 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1064 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1062;
            float _1066 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1068 = _1066 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1070 = 1.0 / _1064;
            float _1072 = _1060 * _1070;
            float _1074 = fma(_1072, _1068, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1046 = _1074;
            _1076 = true;
        }
        else
        {
            bool _1078 = _1028 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1080 = isnan(_1028);
            bool _1082 = _1078 || _1080;
            bool _1084 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1086 = _1082 || _1084;
            if (!_1086)
            {
                float _1088 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1090 = _1028 + _1088;
                float _1092 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1094 = _1092 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1096 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1098 = _1096 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1100 = 1.0 / _1094;
                float _1102 = _1090 * _1100;
                float _1104 = fma(_1102, _1098, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1046 = _1104;
                _1076 = true;
            }
            else
            {
                _1046 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1076 = false;
    float _1106 = _1046;
    float _1108 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1110 = _1016 + _1108;
    float _1112 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1114 = _1010 + _1112;
    float _1116 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1118 = _1018 + _1116;
    bool _1120 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1122 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1124 = _1120 || _1122;
    bool _1126 = isnan(0.5);
    bool _1128 = _1124 || _1126;
    float _1130 = fma(_1110, _1106, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1132 = fma(_1114, _1106, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1134 = fma(_1118, _1106, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1136 = -_762;
    float _1138 = fma(_1136, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1130);
    float _1140 = -_760;
    float _1142 = fma(_1140, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1132);
    float _1144 = -_768;
    float _1146 = fma(_1144, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1134);
    float _1148 = _1142;
    float _1150 = _1138;
    float _1152 = _1146;
    if (!_1128)
    {
        float _1154 = _778 * _778;
        float _1156 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1158 = -_568;
        float _1160 = _1158 + _1130;
        float _1162 = -_564;
        float _1164 = _1162 + _1132;
        float _1166 = fma(_790, _790, _1154);
        float _1168 = -_574;
        float _1170 = _1168 + _1134;
        float _1172 = fma(_804, _804, _1166);
        float _1174 = 1.0 / _864;
        float _1176 = sqrt(_1172);
        float _1178 = _1160 * _1174;
        float _1180 = _1164 * _1174;
        float _1182 = _1170 * _1174;
        bool _1184 = _1176 > (*spvDescriptorSet0.vp_c9)._m0[199].x;
        bool _1186 = isnan(_1176);
        bool _1188 = _1184 || _1186;
        bool _1190 = isnan((*spvDescriptorSet0.vp_c9)._m0[199].x);
        bool _1192 = _1188 || _1190;
        float _1194 = precise::min(_1176, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1196 = _1194 * _1156;
        float _1198 = fma(_1178, _1196, _772);
        float _1200 = fma(_1180, _1196, _766);
        float _1202 = _1154;
        float _1204 = _1194;
        float _1206 = _1196;
        float _1208 = _1198;
        _696 = _1182;
        if (_1192)
        {
            float _1210 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].y;
            _1202 = _1210;
        }
        float _1212 = _1202;
        if (_1192)
        {
            float _1214 = precise::max(_1176, (*spvDescriptorSet0.vp_c9)._m0[199].y);
            _1204 = _1214;
        }
        float _1216 = _1204;
        float _1218 = fma(_1182, _1196, _786);
        float _1220 = _1216;
        if (!_1192)
        {
            _1206 = _1198;
        }
        float _1222 = _1206;
        float _1224 = _1222;
        if (!_1192)
        {
            _1208 = _1200;
        }
        float _1226 = _1208;
        float _1228 = _1212;
        float _1230 = _1226;
        if (_1192)
        {
            float _1232 = _1216 * _1212;
            _1228 = _1232;
        }
        float _1234 = _1228;
        if (!_1192)
        {
            _1220 = _1218;
        }
        float _1236 = _1220;
        _1152 = _1236;
        if (_1192)
        {
            float _1238 = fma(_1178, _1234, _772);
            _1224 = _1238;
        }
        float _1240 = _1224;
        _1150 = _1240;
        if (_1192)
        {
            float _1242 = fma(_1180, _1234, _766);
            _1230 = _1242;
        }
        float _1244 = _1230;
        _1148 = _1244;
        if (_1192)
        {
            float _1246 = fma(_1182, _1234, _786);
            _1152 = _1246;
        }
    }
    float _1248 = _1148;
    float _1250 = _1150;
    float _1252 = _1152;
    float _1254 = _696;
    float _1256 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1258 = _1248 + _1256;
    float _1260 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1262 = _1250 + _1260;
    float _1264 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1266 = _1252 + _1264;
    float _1268 = _1258 * _1258;
    float _1270 = fma(_1262, _1262, _1268);
    float _1272 = fma(_1266, _1266, _1270);
    float _1274 = rsqrt(_1272);
    float _1276 = _1274 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1278 = _1262 * _1276;
    float _1280 = _1266 * _1276;
    float _1282 = _1278 * _1278;
    float _1284 = _1280 * _1280;
    float _1286 = _1282 + _1284;
    float _1288 = sqrt(_1286);
    bool _1290 = _1288 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1292 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1294 = _1288 + _1292;
    float _1296 = _1266;
    float _1298 = _1286;
    float _1300 = _1294;
    float _1302 = _1254;
    float _1304 = _1276;
    if (_1290)
    {
        float _1306 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1296 = _1306;
    }
    float _1308 = _1296;
    if (_1290)
    {
        float _1310 = rsqrt(_1286);
        _1298 = _1310;
    }
    float _1312 = _1298;
    if (_1290)
    {
        float _1314 = _1294 * _1308;
        _1300 = _1314;
    }
    float _1316 = _1300;
    if (_1290)
    {
        float _1318 = _1316 * 0.15915493667125701904296875;
        _1302 = _1318;
    }
    float _1320 = _1302;
    float _1322 = _1268;
    float _1324 = _1320;
    if (_1290)
    {
        float _1326 = _1320 * 6.283185482025146484375;
        float _1328 = sin(_1326);
        _1322 = _1328;
    }
    float _1330 = _1322;
    float _1332 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1334 = precise::max(0.0, _1332);
    float _1336 = _1274;
    float _1338 = _1334;
    float _1340 = _1332;
    if (_1290)
    {
        float _1342 = _1320 * 6.283185482025146484375;
        float _1344 = cos(_1342);
        _1336 = _1344;
    }
    float _1346 = _1336;
    float _1348 = -_1276;
    float _1350 = -_1334;
    float _1352 = fma(_1258, _1348, _1350);
    float _1354 = _1352;
    if (!_1290)
    {
        _1338 = _1278;
    }
    float _1356 = _1338;
    float _1358 = _1356;
    if (_1290)
    {
        float _1360 = _1352 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1340 = _1360;
    }
    float _1362 = _1340;
    float _1364 = _1330;
    float _1366 = _1362;
    if (_1290)
    {
        float _1368 = fma(_1330, _1362, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1364 = _1368;
    }
    float _1370 = _1364;
    float _1372 = _1370;
    float _1374 = _1346;
    if (_1290)
    {
        float _1376 = _1346 + (-1.0);
        _1366 = _1376;
    }
    float _1378 = _1366;
    float _1380 = _1378;
    if (_1290)
    {
        float _1382 = _1312 * _1370;
        _1304 = _1382;
    }
    float _1384 = _1304;
    if (!_1290)
    {
        _1372 = _1282;
    }
    float _1386 = _1372;
    float _1388 = sqrt(_1272);
    float _1390 = _1386;
    if (_1290)
    {
        float _1392 = _1378 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1324 = _1392;
    }
    float _1394 = _1324;
    if (_1290)
    {
        float _1396 = _1278 * _1384;
        _1358 = _1396;
    }
    float _1398 = _1358;
    if (!_1290)
    {
        _1380 = _1280;
    }
    float _1400 = _1380;
    float _1402 = _1400;
    if (_1290)
    {
        float _1404 = _1280 * _1384;
        _1402 = _1404;
    }
    float _1406 = _1402;
    if (_1290)
    {
        float _1408 = fma(_1352, _1346, _1394);
        _1354 = _1408;
    }
    float _1410 = _1354;
    if (_1290)
    {
        float _1412 = _1398 * _1398;
        _1390 = _1412;
    }
    float _1414 = _1390;
    if (!_1290)
    {
        _1374 = _1284;
    }
    float _1416 = _1374;
    float _1418 = _1416;
    if (_1290)
    {
        float _1420 = _1406 * _1406;
        _1418 = _1420;
    }
    float _1422 = _1418;
    float _1424 = fma(_1410, _1410, _1414);
    float _1426 = _1424 + _1422;
    float _1428 = _1248 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1430 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1432 = fma(_1388, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1430);
    float _1434 = precise::clamp(_1432, 0.0, 1.0);
    float _1436 = _1248 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1438 = rsqrt(_1426);
    float _1440 = fma(_1250, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1428);
    float _1442 = _1248 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1444 = -_1434;
    float _1446 = _1444 + 1.0;
    float _1448 = _1248 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1450 = fma(_1252, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1440);
    float _1452 = fma(_1250, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1442);
    float _1454 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1456 = _1450 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1458 = fma(_1250, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1436);
    float _1460 = fma(_1252, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1452);
    float _1462 = abs(_1446);
    float _1464 = log2(_1462);
    float _1466 = fma(_1250, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1448);
    float _1468 = fma(_1252, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1458);
    float _1470 = _1460 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1472 = _1438 * _1398;
    float _1474 = _1456 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1476 = fma(_1252, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1466);
    float _1478 = _1468 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1480 = _1470 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1482 = _1438 * _1410;
    float _1484 = _1472 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1486 = -_1474;
    float _1488 = fma(_1486, _1454, 1.0);
    float _1490 = _1476 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1492 = fma(_1478, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1480);
    float _1494 = _1438 * _1406;
    float _1496 = -_1484;
    float _1498 = fma(_1482, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1496);
    float _1500 = _1464 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1502 = fma(_1456, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1492);
    float _1504 = log2(_1488);
    float _1506 = -_1494;
    float _1508 = fma(_1506, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1498);
    float _1510 = _1470 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1512 = fma(_1490, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1502);
    float _1514 = _1470 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1516 = fma(_1508, -0.5, 0.5);
    float _1518 = fma(_1478, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1510);
    float _1520 = fma(_1508, 0.5, 0.5);
    float _1522 = exp2(_1500);
    float _1524 = fma(_1478, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1514);
    float _1526 = fma(_1456, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1518);
    float _1528 = _1482 + 1.0;
    float _1530 = fma(_1520, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1532 = fma(_1456, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1524);
    float _1534 = fma(_1490, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1526);
    float _1536 = 1.0 / _1512;
    float _1538 = fma(_1490, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1532);
    float _1540 = fma(_1520, _1530, -0.212114393711090087890625);
    float _1542 = _1504 * 0.693147182464599609375;
    float _1544 = fma(_1520, _1540, 1.570728778839111328125);
    float _1546 = sqrt(_1516);
    float _1548 = -_1482;
    float _1550 = fma(_1522, _1528, _1548);
    float _1552 = fma(_1550, 0.5, 0.5);
    float _1554 = _1534 * _1536;
    float _1556 = _1538 * _1536;
    float _1558 = _1542 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1560 = fma(_1554, 0.5, 0.5);
    float _1562 = fma(_1556, -0.5, 0.5);
    float _1564 = _1546 * 0.636619746685028076171875;
    float3 _4282 = float3(_1560, _1562, _1558);
    float _1566 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4282, float3(0.0), isnan(_4282)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4282, float3(0.0), isnan(_4282)), level(0.0)).x;
    float3 _4293 = float3(_1560, _1562, _1558);
    float4 _1569 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4293, float3(0.0), isnan(_4293)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4293, float3(0.0), isnan(_4293)), level(0.0)).xyzw;
    float _1571 = _1569.x;
    float _1573 = _1569.y;
    float _1575 = _1569.z;
    float _1577 = _1569.w;
    float _1579 = -_1544;
    float _1581 = fma(_1564, _1579, 1.0);
    float2 _4315 = float2(_1581, _1552);
    float3 _1585 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4315, float2(0.0), isnan(_4315)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4315, float2(0.0), isnan(_4315)), level(0.0)).xyz;
    float _1587 = _1585.x;
    float _1589 = _1585.y;
    float _1591 = _1585.z;
    float _1593 = _766 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1595 = _1470 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1597 = fma(_772, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1593);
    float _1599 = _766 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1601 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1603 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1605 = _1601 || _1603;
    bool _1607 = isnan(0.5);
    bool _1609 = _1605 || _1607;
    float _1611 = fma(_1478, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1595);
    float _1613 = fma(_786, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1597);
    float _1615 = fma(_772, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1599);
    float _1617 = fma(_1456, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1611);
    float _1619 = _1613 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1621 = fma(_786, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1615);
    float _1623 = 1.0 / _1619;
    float _1625 = _1621 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1627 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _1629 = _1558;
    float _1631 = _1613;
    float _1633 = _1562;
    if (!_1609)
    {
        _1627 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _1635 = _1627;
    float _1637 = _1625 + _1619;
    float _1639 = _1635;
    if (!_1609)
    {
        _846 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _1641 = _846;
    float _1643 = _1641;
    if (!_1609)
    {
        float _1645 = -_1635;
        float _1647 = _1645 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _1629 = _1647;
    }
    float _1649 = _1629;
    float _1651 = _1464 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    if (_1609)
    {
        _1631 = 1.0;
    }
    float _1653 = _1631;
    float _1655 = _1653;
    if (!_1609)
    {
        float _1657 = 1.0 / _1649;
        _1633 = _1657;
    }
    float _1659 = _1633;
    float _1661 = _1637 * _1623;
    float _1663 = _1661 * 0.5;
    float _1665 = _1623;
    if (!_1609)
    {
        float _1667 = -_1641;
        float _1669 = _1667 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1665 = _1669;
    }
    float _1671 = _1665;
    float _1673 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1675 = fma(_1663, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1673);
    float _1677 = exp2(_1651);
    float _1679 = 1.0 / _1675;
    float _1681 = _1671;
    if (!_1609)
    {
        float _1683 = 1.0 / _1671;
        _1681 = _1683;
    }
    float _1685 = _1681;
    float _1687 = -_1677;
    float _1689 = _1687 + 1.0;
    float _1691 = fma(_1490, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1617);
    float _1693 = _1689 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1695 = _1691 + _1512;
    float _1697 = _1679;
    if (!_1609)
    {
        float _1699 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1701 = -_1635;
        float _1703 = fma(_1679, _1699, _1701);
        _1639 = _1703;
    }
    float _1705 = _1639;
    float _1707 = _1705;
    if (!_1609)
    {
        float _1709 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1711 = -_1641;
        float _1713 = fma(_1679, _1709, _1711);
        _1643 = _1713;
    }
    float _1715 = _1643;
    if (_1609)
    {
        _1697 = 1.0;
    }
    float _1717 = _1697;
    float _1719 = _1695 * 0.5;
    float _1721 = _1717;
    if (!_1609)
    {
        float _1723 = _1705 * _1659;
        float _1725 = precise::clamp(_1723, 0.0, 1.0);
        _1707 = _1725;
    }
    float _1727 = _1707;
    if (!_1609)
    {
        float _1729 = _1715 * _1685;
        float _1731 = precise::clamp(_1729, 0.0, 1.0);
        _1655 = _1731;
    }
    float _1733 = _1655;
    if (!_1609)
    {
        float _1735 = -_1727;
        float _1737 = _1735 + 1.0;
        _1721 = _1737;
    }
    float _1739 = _1721;
    out.m_64.z = _1719;
    out.m_64.w = _1512;
    float _1741 = _1733 * _1739;
    bool _1743 = _1733 > 0.0;
    bool _1745 = isnan(_1733);
    bool _1747 = _1743 || _1745;
    bool _1749 = isnan(0.0);
    bool _1751 = _1747 || _1749;
    float _1753 = _1741 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _1755 = _1739 <= 0.0;
    bool _1757 = !_1751;
    bool _1759 = _1755 || _1757;
    float _1761 = _1753 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_47.x = _1761;
    out.gl_Position.x = _1534;
    out.gl_Position.y = _1538;
    out.gl_Position.z = _1691;
    out.gl_Position.w = _1512;
    float _1763 = _1693 * _1566;
    float _1765 = -_1693;
    float _1767 = _1765 + 1.0;
    float _1769 = _1577 * _1763;
    float _1771 = _1577 * _1767;
    float _1773 = _1591 * _1763;
    float _1775 = fma(_1587, _1769, _1571);
    float _1777 = fma(_1589, _1769, _1573);
    float _1779 = fma(_1577, _1773, _1575);
    out.m_66.x = _1775;
    out.m_66.y = _1777;
    out.m_66.z = _1779;
    out.m_66.w = _1771;
    if (!_1759)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _1781 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1781;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}


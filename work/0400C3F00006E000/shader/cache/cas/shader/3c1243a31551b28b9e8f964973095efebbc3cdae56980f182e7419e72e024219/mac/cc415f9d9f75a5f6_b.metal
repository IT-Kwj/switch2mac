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
    float4 m_56 [[user(locn0)]];
    float4 m_58 [[user(locn1)]];
    float4 m_62 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_60 [[user(locn4)]];
    float4 m_64 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_49 [[attribute(4)]];
    float4 m_54 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    bool _383 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _78 = in.m_42.w;
    float _80 = trunc(_78);
    int _83 = int(_80);
    bool _87 = _83 >= 1;
    float _89 = 0.0;
    if (!_87)
    {
        _89 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _91 = _89;
    float _93 = _91;
    if (!_87)
    {
        out.m_45.x = 0.0;
    }
    int _95 = 0;
    if (!_87)
    {
        float _97 = _91 * 5.0;
        _95 = as_type<int>(_97);
    }
    int _99 = _95;
    int _101 = _99;
    if (!_87)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1550 = as_type<float>(_99);
        out.gl_Position.z = _1550;
    }
    if (!_87)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _103 = in.m_47.w;
    bool _105 = _103 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _107 = isnan(_103);
    bool _109 = _105 || _107;
    bool _111 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _113 = _109 || _111;
    float _115 = -_103;
    float _117 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _119 = 0.0;
    if (_113)
    {
        float _121 = float(_83);
        _119 = _121;
    }
    float _123 = _119;
    bool _125 = _117 >= _123;
    bool _127 = !_113;
    bool _129 = _125 || _127;
    if (_129)
    {
        _93 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _131 = _93;
    if (_129)
    {
        out.m_45.x = 0.0;
    }
    if (_129)
    {
        float _133 = _131 * 5.0;
        _101 = as_type<int>(_133);
    }
    int _135 = _101;
    if (_129)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1618 = as_type<float>(_135);
        out.gl_Position.z = _1618;
    }
    if (_129)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _137 = in.m_49.x;
    float _139 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _141 = _117 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _143 = as_type<float>(int(gl_VertexIndex));
    bool _145 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _147 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _149 = _145 || _147;
    bool _151 = isnan(1.0);
    bool _153 = _149 || _151;
    float _155 = _141 * _139;
    float _157 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[20].x, _155);
    float _159 = in.m_47.x;
    float _161 = in.m_47.y;
    float _163 = in.m_47.z;
    float _165 = _157 * 6.283185482025146484375;
    float _167 = floor(_157);
    int _169 = as_type<int>(_143) & 1;
    bool _171 = _169 != 0;
    int _173 = as_type<int>(_143) & 2;
    bool _175 = _173 != 0;
    float _177 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _179 = _165 * 0.15915493667125701904296875;
    float _181 = 0.0;
    float _183 = _177;
    if (!_153)
    {
        float _185 = _177 * _177;
        float _187 = _185 * 0.5;
        _181 = _187;
    }
    float _189 = _181;
    int _191 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _193 = _191 != 0;
    float _195 = _179 * 6.283185482025146484375;
    float _197 = cos(_195);
    float _199 = _189;
    if (!_153)
    {
        float _201 = _189 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _199 = _201;
    }
    float _203 = _199;
    bool _205 = !_171;
    float _207 = _205 ? (-0.5) : 0.5;
    float _209 = -_167;
    float _211 = _157 + _209;
    bool _213 = !_175;
    float _215 = _213 ? (-0.5) : 0.5;
    bool _217 = !_153;
    float _219 = _203;
    if (!_217)
    {
        float _221 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _223 = log2(_221);
        float _225 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _227 = _225 + 1.0;
        float _229 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _231 = _177 * _223;
        float _233 = 1.0 / _227;
        float _235 = _229 * 0.693147182464599609375;
        float _237 = exp2(_231);
        float _239 = 1.0 / _235;
        float _241 = _237 + (-1.0);
        float _243 = -_241;
        float _245 = fma(_243, _239, _177);
        float _247 = _245 * _233;
        float _249 = _247 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _219 = _249;
    }
    float _251 = _219;
    bool _253 = !_153;
    if (!_253)
    {
        float _255 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _257 = log2(_255);
        float _259 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _261 = _259 + 1.0;
        float _263 = 1.0 / _261;
        float _265 = _177 * _257;
        float _267 = exp2(_265);
        float _269 = -_267;
        float _271 = _269 + 1.0;
        float _273 = _271 * _263;
        _183 = _273;
    }
    float _275 = _183;
    float _277 = in.m_54.w;
    int _279 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _281 = _279 != 0;
    int _283 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _285 = _283 != 0;
    float _287 = fma(_197, 0.5, 0.5);
    bool _289 = _211 < 0.5;
    float _291 = float(_289);
    float _293 = in.m_42.x;
    float _295 = in.m_42.y;
    float _297 = in.m_42.z;
    float _299 = -_211;
    float _301 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _303 = !_281;
    int _305 = _303 ? 0 : 1;
    float _307 = _251 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    bool _309 = !_193;
    int _311 = _309 ? 0 : 1;
    float _313 = -_291;
    float _315 = fma(_313, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _317 = abs(_305);
    float _319 = fma(_275, _159, _307);
    bool _321 = !_285;
    int _323 = _321 ? 0 : 1;
    float _325 = -_287;
    float _327 = fma(_325, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _329 = _251 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _331 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _333 = _251 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    int _335 = abs(_311);
    float _337 = fma(_275, _161, _329);
    int _339 = abs(_323);
    float _341 = fma(_275, _163, _333);
    float _343 = float(_317);
    float _345 = float(_335);
    float _347 = abs(_301);
    float _349 = _343 * _347;
    float _351 = fma(_341, _277, _297);
    float _353 = float(_339);
    float _355 = fma(_345, _327, _349);
    float _357 = fma(_319, _277, _293);
    float _359 = fma(_337, _277, _295);
    float _361 = abs(_315);
    float _363 = fma(_353, _361, _355);
    bool _365 = !_331;
    float _381;
    if (!_365)
    {
        float _367 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _369 = _137 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _371 = fma(_369, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _373 = _371 * _367;
        float _375 = floor(_373);
        float _377 = -_375;
        float _379 = _373 + _377;
        _381 = _379;
        _383 = true;
    }
    else
    {
        float _385 = float(_83);
        float _387 = 1.0 / _385;
        float _389 = _117 * _387;
        _381 = _389;
    }
    _383 = false;
    float _391 = _381;
    float _393 = in.m_49.y;
    float _395 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _397 = _359 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _399 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _401 = _391 + _399;
    float _403 = _395 * _137;
    bool _405 = _137 > 0.5;
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _409 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _407;
    int _411 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _413 = _411 != 0;
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _417 = _415 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    int _419 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _421 = _419 != 0;
    float _423 = trunc(_403);
    int _425 = int(_423);
    float _427 = _359 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _429 = fma(_357, (*spvDescriptorSet0.vp_c10)._m0[6].x, _397);
    float _431 = fma(_357, (*spvDescriptorSet0.vp_c10)._m0[4].x, _427);
    float _433 = fma(_351, (*spvDescriptorSet0.vp_c10)._m0[6].z, _429);
    float _435 = 1.0 / _409;
    float _437 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _439 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _441 = _393 > 0.5;
    float _443 = _359 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _445 = _437 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _447 = _425 << 4;
    int _449 = _447 + 1968;
    float _451 = 1.0 / _417;
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _455 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _453;
    uint _458 = uint(int(uint(_449) >> uint(2)));
    uint _460 = uint(int(uint(int(_458)) >> uint(2)));
    int _462 = int(_458) & 3;
    float _464 = (*spvDescriptorSet0.vp_c9)._m0[int(_460)][_462];
    int _466 = int(_458) + 1;
    uint _468 = uint(int(uint(_466) >> uint(2)));
    int _470 = _466 & 3;
    float _472 = (*spvDescriptorSet0.vp_c9)._m0[int(_468)][_470];
    float _474 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _476 = _474 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _478 = fma(_357, (*spvDescriptorSet0.vp_c10)._m0[5].x, _443);
    float _480 = fma(_351, (*spvDescriptorSet0.vp_c10)._m0[4].z, _431);
    float _482 = 1.0 / _476;
    float _484 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _486 = fma(_351, (*spvDescriptorSet0.vp_c10)._m0[5].z, _478);
    int _488 = _449 + 8;
    uint _490 = uint(int(uint(_488) >> uint(2)));
    uint _492 = uint(int(uint(int(_490)) >> uint(2)));
    int _494 = int(_490) & 3;
    float _496 = (*spvDescriptorSet0.vp_c9)._m0[int(_492)][_494];
    float _498 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _500 = 1.0 / _455;
    float _502 = _498 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _506 = _391 + _504;
    float _508 = _433 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _510 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _512 = isnan(_391);
    bool _514 = _510 || _512;
    bool _516 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _518 = _514 || _516;
    float _520 = float(_518);
    bool _522 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _524 = isnan(_391);
    bool _526 = _522 || _524;
    bool _528 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _530 = _526 || _528;
    float _532 = float(_530);
    float _534 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _536 = _508 + _534;
    float _538 = _401 * _482;
    float _540 = _484 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _542 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _544 = _391 + _542;
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _548 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _546;
    float _550 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _552 = _544 * _435;
    float _554 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _556 = _391 + _554;
    out.m_56.x = _502;
    out.m_56.y = _540;
    out.m_56.z = _445;
    out.m_56.w = _439;
    float _558 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _560 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _558;
    float _562 = _506 * _500;
    float _564 = _556 * _451;
    float _566 = fma(_548, _552, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _568 = fma(_560, _552, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _570 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _572 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _574 = _572 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _578 = _576 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _580 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _582 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _580;
    float _584 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _586 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _584;
    float _588 = fma(_574, _564, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _590 = fma(_578, _564, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _592 = _486 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _594 = fma(_582, _562, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _596 = fma(_586, _562, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _598 = _480 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _600 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _602 = _592 + _600;
    float _604 = -_207;
    int _606 = _405 ? as_type<int>(_604) : as_type<int>(_207);
    float _608 = _464 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _610 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _612 = _598 + _610;
    float _614 = _602 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _616 = -_215;
    int _618 = _441 ? as_type<int>(_616) : as_type<int>(_215);
    float _620 = _602 * _602;
    bool _622 = !_413;
    float _624 = _622 ? _207 : as_type<float>(_606);
    float _626 = fma(_612, (*spvDescriptorSet0.vp_c8)._m0[28].x, _614);
    bool _628 = !_421;
    float _630 = _628 ? _215 : as_type<float>(_618);
    float _632 = fma(_612, _612, _620);
    float _634 = _472 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _636 = fma(_536, (*spvDescriptorSet0.vp_c8)._m0[28].z, _626);
    float _638 = _624 + 0.5;
    float _640 = -_630;
    float _642 = _640 + 0.5;
    float _644 = _496 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _646 = fma(_536, _536, _632);
    bool _648 = _636 >= 0.0;
    float _650 = _638 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _652 = _642 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _654 = _608 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _656 = _634 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _658 = _644 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _660 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _662 = isnan(_391);
    bool _664 = _660 || _662;
    bool _666 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _668 = _664 || _666;
    float _670 = float(_668);
    float _672 = _652 * _550;
    bool _674 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _676 = isnan(_391);
    bool _678 = _674 || _676;
    bool _680 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _682 = _678 || _680;
    float _684 = float(_682);
    float _686 = rsqrt(_646);
    out.m_58.x = _654;
    out.m_58.y = _656;
    out.m_58.z = _658;
    float _688 = _650 * _570;
    float _690 = -_670;
    float _692 = _690 + 1.0;
    float _694 = -_684;
    float _696 = _694 + 1.0;
    float _698 = _658;
    float _700 = _588;
    float _702 = _592;
    if (_648)
    {
        out.m_45.x = 0.0;
    }
    float _704 = _684 * _692;
    float _706 = _520 * _696;
    float _708 = -_520;
    float _710 = _708 + 1.0;
    out.m_60.x = _688;
    out.m_60.y = _672;
    bool _712 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _714 = isnan(_391);
    bool _716 = _712 || _714;
    bool _718 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _720 = _716 || _718;
    float _722 = float(_720);
    if (_648)
    {
        _698 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _724 = _698;
    float _726 = _532 * _710;
    float _728 = -_532;
    float _730 = _728 + 1.0;
    float _732 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _734 = _732 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    int _736 = as_type<int>(_724);
    if (_648)
    {
        float _738 = _724 * 5.0;
        _736 = as_type<int>(_738);
    }
    int _740 = _736;
    float _742 = _602 * _686;
    float _744 = _612 * _686;
    if (_648)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2603 = as_type<float>(_740);
        out.gl_Position.z = _2603;
    }
    if (_648)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _746 = -_742;
    float _748 = fma(_746, (*spvDescriptorSet0.vp_c9)._m0[18].w, _592);
    float _750 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _752 = _750 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _754 = _722 * _730;
    float _756 = fma(_734, _538, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _758 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _760 = _748 + _758;
    float _762 = fma(_752, _538, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _764 = -_744;
    float _766 = fma(_764, (*spvDescriptorSet0.vp_c9)._m0[18].w, _598);
    float _768 = _536 * _686;
    float _770 = _760 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _772 = _566 * _754;
    float _774 = _568 * _754;
    float _776 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _778 = _766 + _776;
    float _780 = -_768;
    float _782 = fma(_780, (*spvDescriptorSet0.vp_c9)._m0[18].w, _508);
    float _784 = -_722;
    float _786 = _784 + 1.0;
    float _788 = -_742;
    float _790 = fma(_788, (*spvDescriptorSet0.vp_c9)._m0[18].w, _602);
    float _792 = fma(_778, (*spvDescriptorSet0.vp_c8)._m0[28].x, _770);
    float _794 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _796 = _782 + _794;
    float _798 = in.m_54.x;
    float _800 = in.m_54.y;
    float _802 = fma(_786, (*spvDescriptorSet0.vp_c9)._m0[143].x, _772);
    float _804 = fma(_786, (*spvDescriptorSet0.vp_c9)._m0[143].y, _774);
    float _806 = fma(_796, (*spvDescriptorSet0.vp_c8)._m0[28].z, _792);
    float _808 = -_744;
    float _810 = fma(_808, (*spvDescriptorSet0.vp_c9)._m0[18].w, _612);
    float _812 = _790 * _790;
    float _814 = fma(_588, _726, _802);
    float _816 = fma(_590, _726, _804);
    bool _818 = _806 >= 0.0;
    float _820 = fma(_810, _810, _812);
    float _822 = -_768;
    float _824 = fma(_822, (*spvDescriptorSet0.vp_c9)._m0[18].w, _536);
    float _826 = fma(_594, _706, _814);
    float _828 = fma(_596, _706, _816);
    float _830 = fma(_824, _824, _820);
    float _832 = fma(_756, _704, _826);
    float _834 = fma(_762, _704, _828);
    float _836 = sqrt(_830);
    float _838 = fma(_670, (*spvDescriptorSet0.vp_c9)._m0[147].x, _832);
    float _840 = fma(_670, (*spvDescriptorSet0.vp_c9)._m0[147].y, _834);
    if (_818)
    {
        _700 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _842 = _700;
    int _844 = as_type<int>(_842);
    if (_818)
    {
        out.m_45.x = 0.0;
    }
    float _846 = _838 * _798;
    float _848 = _840 * _800;
    if (_818)
    {
        float _850 = _842 * 5.0;
        _844 = as_type<int>(_850);
    }
    int _852 = _844;
    float _854 = _363 * _846;
    float _856 = _363 * _848;
    if (_818)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2817 = as_type<float>(_852);
        out.gl_Position.z = _2817;
    }
    float _858 = _686 * _836;
    if (_818)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _860 = _856 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _862 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _215);
    float _864 = _854 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _866 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _207);
    float _868 = _858 * _860;
    float _870 = _858 * _864;
    float _872 = _862 * _868;
    float _874 = _866 * _870;
    float _876 = _858 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _878 = _876 * 0.5;
    float _880 = _872 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _882 = _872 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _884 = _872 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _886 = fma(_874, (*spvDescriptorSet0.vp_c8)._m0[26].x, _880);
    float _888 = fma(_874, (*spvDescriptorSet0.vp_c8)._m0[24].x, _882);
    float _890 = fma(_874, (*spvDescriptorSet0.vp_c8)._m0[25].x, _884);
    float _892 = fma(_878, (*spvDescriptorSet0.vp_c8)._m0[26].z, _886);
    float _894 = fma(_878, (*spvDescriptorSet0.vp_c8)._m0[24].z, _888);
    float _896 = fma(_878, (*spvDescriptorSet0.vp_c8)._m0[25].z, _890);
    float _898 = _892 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _900 = _894 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _902 = _896 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _904 = _508 + _898;
    float _906 = _598 + _900;
    float _908 = _592 + _902;
    float _910 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _912 = _904 + _910;
    float _914 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _916 = _906 + _914;
    float _918 = _912 * _912;
    float _920 = fma(_916, _916, _918);
    float _922 = sqrt(_920);
    bool _924 = _922 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _926 = _896;
    float _928 = _906;
    float _930 = _880;
    if (!_924)
    {
        _926 = _904;
    }
    float _932 = _926;
    float _934 = _932;
    if (!_924)
    {
        _702 = _908;
    }
    float _936 = _702;
    bool _938 = !_924;
    float _940 = _936;
    if (!_938)
    {
        float _942 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _944 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _946 = _922 + _944;
        float _948 = rsqrt(_920);
        float _950 = _946 * _942;
        float _952 = _908 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _954 = _950 * 0.15915493667125701904296875;
        float _956 = _954 * 6.283185482025146484375;
        float _958 = sin(_956);
        float _960 = _954 * 6.283185482025146484375;
        float _962 = cos(_960);
        float _964 = fma(_958, _952, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _966 = _948 * _964;
        float _968 = _962 + (-1.0);
        float _970 = fma(_916, _966, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _972 = fma(_912, _966, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _974 = _968 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _976 = fma(_908, _962, _974);
        _940 = _976;
        _928 = _970;
        _934 = _972;
        _930 = _954;
    }
    float _978 = _940;
    float _980 = _928;
    float _982 = _934;
    float _984 = _930;
    float _986 = -_742;
    float _988 = fma(_986, (*spvDescriptorSet0.vp_c9)._m0[18].w, _978);
    float _990 = -_744;
    float _992 = fma(_990, (*spvDescriptorSet0.vp_c9)._m0[18].w, _980);
    float _994 = -_768;
    float _996 = fma(_994, (*spvDescriptorSet0.vp_c9)._m0[18].w, _982);
    float _998 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1000 = _988 + _998;
    float _1002 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1004 = _992 + _1002;
    float _1006 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1008 = _996 + _1006;
    float _1010 = _1000 * _1000;
    float _1012 = fma(_1004, _1004, _1010);
    float _1014 = fma(_1008, _1008, _1012);
    float _1016 = rsqrt(_1014);
    float _1018 = sqrt(_1014);
    float _1020 = _1016 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1022 = _1004 * _1020;
    float _1024 = _1008 * _1020;
    float _1026 = _1022 * _1022;
    float _1028 = _1024 * _1024;
    float _1030 = _1026 + _1028;
    float _1032 = sqrt(_1030);
    bool _1034 = _1032 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1036 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1038 = _1032 + _1036;
    float _1040 = _1008;
    float _1042 = _1012;
    float _1044 = _1038;
    float _1046 = _984;
    float _1048 = _1000;
    if (_1034)
    {
        float _1050 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1040 = _1050;
    }
    float _1052 = _1040;
    if (_1034)
    {
        float _1054 = rsqrt(_1030);
        _1042 = _1054;
    }
    float _1056 = _1042;
    float _1058 = _1056;
    if (_1034)
    {
        float _1060 = _1038 * _1052;
        _1044 = _1060;
    }
    float _1062 = _1044;
    if (_1034)
    {
        float _1064 = _1062 * 0.15915493667125701904296875;
        _1046 = _1064;
    }
    float _1066 = _1046;
    float _1068 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1070 = fma(_1018, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1068);
    float _1072 = precise::clamp(_1070, 0.0, 1.0);
    float _1074 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1076 = _1016;
    if (_1034)
    {
        float _1078 = _1066 * 6.283185482025146484375;
        float _1080 = sin(_1078);
        _1076 = _1080;
    }
    float _1082 = _1076;
    float _1084 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1086 = precise::max(0.0, _1084);
    float _1088 = _980;
    float _1090 = _1084;
    float _1092 = _1086;
    if (_1034)
    {
        float _1094 = _1066 * 6.283185482025146484375;
        float _1096 = cos(_1094);
        _1088 = _1096;
    }
    float _1098 = _1088;
    float _1100 = -_1020;
    float _1102 = -_1086;
    float _1104 = fma(_1000, _1100, _1102);
    if (_1034)
    {
        float _1106 = _1104 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1090 = _1106;
    }
    float _1108 = _1090;
    float _1110 = _988 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1112 = _1082;
    float _1114 = _1108;
    if (_1034)
    {
        float _1116 = fma(_1082, _1108, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1092 = _1116;
    }
    float _1118 = _1092;
    float _1120 = _1118;
    if (!_1034)
    {
        _1112 = _1022;
    }
    float _1122 = _1112;
    float _1124 = _1122;
    float _1126 = _1098;
    if (_1034)
    {
        float _1128 = _1098 + (-1.0);
        _1114 = _1128;
    }
    float _1130 = _1114;
    float _1132 = _1130;
    if (_1034)
    {
        float _1134 = _1056 * _1118;
        _1048 = _1134;
    }
    float _1136 = _1048;
    if (!_1034)
    {
        _1058 = _1104;
    }
    float _1138 = _1058;
    float _1140 = _1138;
    if (_1034)
    {
        float _1142 = _1130 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1132 = _1142;
    }
    float _1144 = _1132;
    float _1146 = _1144;
    if (_1034)
    {
        float _1148 = _1022 * _1136;
        _1124 = _1148;
    }
    float _1150 = _1124;
    if (!_1034)
    {
        _1120 = _1024;
    }
    float _1152 = _1120;
    float _1154 = _1152;
    if (_1034)
    {
        float _1156 = _1024 * _1136;
        _1154 = _1156;
    }
    float _1158 = _1154;
    if (_1034)
    {
        float _1160 = fma(_1104, _1098, _1144);
        _1140 = _1160;
    }
    float _1162 = _1140;
    if (!_1034)
    {
        _1126 = _1026;
    }
    float _1164 = _1126;
    float _1166 = _1164;
    if (_1034)
    {
        float _1168 = _1150 * _1150;
        _1166 = _1168;
    }
    float _1170 = _1166;
    float _1172 = _988 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (!_1034)
    {
        _1146 = _1028;
    }
    float _1174 = _1146;
    float _1176 = _1174;
    if (_1034)
    {
        float _1178 = _1158 * _1158;
        _1176 = _1178;
    }
    float _1180 = _1176;
    float _1182 = fma(_1162, _1162, _1170);
    float _1184 = fma(_992, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1172);
    float _1186 = _988 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1188 = _988 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1190 = _1182 + _1180;
    float _1192 = -_1072;
    float _1194 = _1192 + 1.0;
    float _1196 = fma(_992, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1186);
    float _1198 = fma(_992, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1110);
    float _1200 = fma(_992, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1188);
    float _1202 = fma(_996, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1184);
    float _1204 = rsqrt(_1190);
    float _1206 = fma(_996, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1196);
    float _1208 = fma(_996, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1198);
    float _1210 = _1202 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1212 = fma(_996, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1200);
    float _1214 = _1206 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1216 = _1208 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1218 = _1210 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1220 = abs(_1194);
    float _1222 = log2(_1220);
    float _1224 = _1212 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1226 = _1216 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1228 = -_1218;
    float _1230 = fma(_1228, _1074, 1.0);
    float _1232 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1226);
    float _1234 = _1204 * _1150;
    float _1236 = _1204 * _1162;
    float _1238 = _1204 * _1158;
    float _1240 = fma(_1210, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1232);
    float _1242 = _1234 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1244 = log2(_1230);
    float _1246 = fma(_1224, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1240);
    float _1248 = -_1242;
    float _1250 = fma(_1236, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1248);
    float _1252 = _1222 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1254 = _1216 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1256 = -_1238;
    float _1258 = fma(_1256, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1250);
    float _1260 = _1216 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1262 = 1.0 / _1246;
    float _1264 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1254);
    float _1266 = fma(_1258, -0.5, 0.5);
    float _1268 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1260);
    float _1270 = fma(_1258, 0.5, 0.5);
    float _1272 = fma(_1210, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1264);
    float _1274 = _1236 + 1.0;
    float _1276 = fma(_1210, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1268);
    float _1278 = exp2(_1252);
    float _1280 = fma(_1270, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1282 = fma(_1224, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1276);
    float _1284 = fma(_1224, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1272);
    float _1286 = fma(_1270, _1280, -0.212114393711090087890625);
    float _1288 = _1244 * 0.693147182464599609375;
    float _1290 = sqrt(_1266);
    float _1292 = fma(_1270, _1286, 1.570728778839111328125);
    float _1294 = _1284 * _1262;
    float _1296 = fma(_1294, -0.5, 0.5);
    float _1298 = -_1236;
    float _1300 = fma(_1278, _1274, _1298);
    float _1302 = _1282 * _1262;
    float _1304 = _1288 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1306 = fma(_1300, 0.5, 0.5);
    float _1308 = fma(_1302, 0.5, 0.5);
    float _1310 = _1290 * 0.636619746685028076171875;
    float _1312 = -_1292;
    float _1314 = fma(_1310, _1312, 1.0);
    float3 _3582 = float3(_1308, _1296, _1304);
    float _1316 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3582, float3(0.0), isnan(_3582)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3582, float3(0.0), isnan(_3582)), level(0.0)).x;
    float3 _3593 = float3(_1308, _1296, _1304);
    float4 _1319 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3593, float3(0.0), isnan(_3593)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3593, float3(0.0), isnan(_3593)), level(0.0)).xyzw;
    float _1321 = _1319.x;
    float _1323 = _1319.y;
    float _1325 = _1319.z;
    float _1327 = _1319.w;
    float2 _3610 = float2(_1314, _1306);
    float3 _1331 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3610, float2(0.0), isnan(_3610)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3610, float2(0.0), isnan(_3610)), level(0.0)).xyz;
    float _1333 = _1331.x;
    float _1335 = _1331.y;
    float _1337 = _1331.z;
    float _1339 = _748 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1341 = _748 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1343 = _1222 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1345 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1347 = isnan(0.5);
    bool _1349 = _1345 || _1347;
    bool _1351 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1353 = _1349 || _1351;
    float _1355 = fma(_766, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1339);
    float _1357 = fma(_766, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1341);
    float _1359 = exp2(_1343);
    float _1361 = fma(_782, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1355);
    float _1363 = fma(_782, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1357);
    float _1365 = _1216 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1367 = _1361 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1369 = _1363 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1371 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1365);
    float _1373 = 1.0 / _1367;
    float _1375 = _1369 + _1367;
    float _1377 = fma(_1210, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1371);
    float _1379 = _1341;
    if (_1353)
    {
        _1379 = 1.0;
    }
    float _1381 = _1379;
    float _1383 = fma(_1224, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1377);
    float _1385 = _1375 * _1373;
    float _1387 = _1385 * 0.5;
    float _1389 = _1381;
    if (!_1353)
    {
        float _1391 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1393 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1395 = _1391 * 0.15915493667125701904296875;
        float _1397 = _1393 * 0.15915493667125701904296875;
        float _1399 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1401 = fma(_1387, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1399);
        float _1403 = _1395 * 6.283185482025146484375;
        float _1405 = cos(_1403);
        float _1407 = _1395 * 6.283185482025146484375;
        float _1409 = sin(_1407);
        float _1411 = 1.0 / _1405;
        float _1413 = _1397 * 6.283185482025146484375;
        float _1415 = cos(_1413);
        float _1417 = _1409 * _1411;
        float _1419 = _1397 * 6.283185482025146484375;
        float _1421 = sin(_1419);
        float _1423 = _1415 * _1417;
        float _1425 = 1.0 / _1401;
        float _1427 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1429 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1427;
        float _1431 = 1.0 / _1423;
        float _1433 = 1.0 / _1429;
        float _1435 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1437 = _1425 * _1435;
        float _1439 = _1421 * _1431;
        float _1441 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1443 = fma(_1439, _1437, _1441);
        float _1445 = _1443 * _1433;
        float _1447 = precise::clamp(_1445, 0.0, 1.0);
        _1389 = _1447;
    }
    float _1449 = _1389;
    float _1451 = _1383 + _1246;
    float _1453 = -_1359;
    float _1455 = _1453 + 1.0;
    bool _1457 = _1449 > 0.0;
    bool _1459 = isnan(_1449);
    bool _1461 = _1457 || _1459;
    bool _1463 = isnan(0.0);
    bool _1465 = _1461 || _1463;
    float _1467 = _1449 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1469 = _1451 * 0.5;
    float _1471 = _1455 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1473 = _1467 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1475 = _1471 * _1316;
    float _1477 = -_1471;
    float _1479 = _1477 + 1.0;
    out.gl_Position.x = _1282;
    out.gl_Position.y = _1284;
    out.gl_Position.z = _1383;
    out.gl_Position.w = _1246;
    float _1481 = _1327 * _1475;
    float _1483 = _1337 * _1475;
    float _1485 = _1327 * _1479;
    out.m_62.z = _1469;
    out.m_62.w = _1246;
    float _1487 = fma(_1333, _1481, _1321);
    float _1489 = fma(_1335, _1481, _1323);
    float _1491 = fma(_1327, _1483, _1325);
    out.m_45.x = _1473;
    out.m_64.x = _1487;
    out.m_64.y = _1489;
    out.m_64.z = _1491;
    out.m_64.w = _1485;
    if (_1465)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _1493 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1493;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    bool _383 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _78 = in.m_42.w;
    float _80 = trunc(_78);
    int _83 = int(_80);
    bool _87 = _83 >= 1;
    float _89 = 0.0;
    if (!_87)
    {
        _89 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _91 = _89;
    float _93 = _91;
    if (!_87)
    {
        out.m_45.x = 0.0;
    }
    int _95 = 0;
    if (!_87)
    {
        float _97 = _91 * 5.0;
        _95 = as_type<int>(_97);
    }
    int _99 = _95;
    int _101 = _99;
    if (!_87)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1550 = as_type<float>(_99);
        out.gl_Position.z = _1550;
    }
    if (!_87)
    {
        return out;
    }
    float _103 = in.m_47.w;
    bool _105 = _103 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _107 = isnan(_103);
    bool _109 = _105 || _107;
    bool _111 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _113 = _109 || _111;
    float _115 = -_103;
    float _117 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _119 = 0.0;
    if (_113)
    {
        float _121 = float(_83);
        _119 = _121;
    }
    float _123 = _119;
    bool _125 = _117 >= _123;
    bool _127 = !_113;
    bool _129 = _125 || _127;
    if (_129)
    {
        _93 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _131 = _93;
    if (_129)
    {
        out.m_45.x = 0.0;
    }
    if (_129)
    {
        float _133 = _131 * 5.0;
        _101 = as_type<int>(_133);
    }
    int _135 = _101;
    if (_129)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1618 = as_type<float>(_135);
        out.gl_Position.z = _1618;
    }
    if (_129)
    {
        return out;
    }
    float _137 = in.m_49.x;
    float _139 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _141 = _117 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _143 = as_type<float>(int(gl_VertexIndex));
    bool _145 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _147 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _149 = _145 || _147;
    bool _151 = isnan(1.0);
    bool _153 = _149 || _151;
    float _155 = _141 * _139;
    float _157 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[20].x, _155);
    float _159 = in.m_47.x;
    float _161 = in.m_47.y;
    float _163 = in.m_47.z;
    float _165 = _157 * 6.283185482025146484375;
    float _167 = floor(_157);
    int _169 = as_type<int>(_143) & 1;
    bool _171 = _169 != 0;
    int _173 = as_type<int>(_143) & 2;
    bool _175 = _173 != 0;
    float _177 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _179 = _165 * 0.15915493667125701904296875;
    float _181 = 0.0;
    float _183 = _177;
    if (!_153)
    {
        float _185 = _177 * _177;
        float _187 = _185 * 0.5;
        _181 = _187;
    }
    float _189 = _181;
    int _191 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _193 = _191 != 0;
    float _195 = _179 * 6.283185482025146484375;
    float _197 = cos(_195);
    float _199 = _189;
    if (!_153)
    {
        float _201 = _189 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _199 = _201;
    }
    float _203 = _199;
    bool _205 = !_171;
    float _207 = _205 ? (-0.5) : 0.5;
    float _209 = -_167;
    float _211 = _157 + _209;
    bool _213 = !_175;
    float _215 = _213 ? (-0.5) : 0.5;
    bool _217 = !_153;
    float _219 = _203;
    if (!_217)
    {
        float _221 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _223 = log2(_221);
        float _225 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _227 = _225 + 1.0;
        float _229 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _231 = _177 * _223;
        float _233 = 1.0 / _227;
        float _235 = _229 * 0.693147182464599609375;
        float _237 = exp2(_231);
        float _239 = 1.0 / _235;
        float _241 = _237 + (-1.0);
        float _243 = -_241;
        float _245 = fma(_243, _239, _177);
        float _247 = _245 * _233;
        float _249 = _247 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _219 = _249;
    }
    float _251 = _219;
    bool _253 = !_153;
    if (!_253)
    {
        float _255 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _257 = log2(_255);
        float _259 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _261 = _259 + 1.0;
        float _263 = 1.0 / _261;
        float _265 = _177 * _257;
        float _267 = exp2(_265);
        float _269 = -_267;
        float _271 = _269 + 1.0;
        float _273 = _271 * _263;
        _183 = _273;
    }
    float _275 = _183;
    float _277 = in.m_54.w;
    int _279 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _281 = _279 != 0;
    int _283 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _285 = _283 != 0;
    float _287 = fma(_197, 0.5, 0.5);
    bool _289 = _211 < 0.5;
    float _291 = float(_289);
    float _293 = in.m_42.x;
    float _295 = in.m_42.y;
    float _297 = in.m_42.z;
    float _299 = -_211;
    float _301 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _303 = !_281;
    int _305 = _303 ? 0 : 1;
    float _307 = _251 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    bool _309 = !_193;
    int _311 = _309 ? 0 : 1;
    float _313 = -_291;
    float _315 = fma(_313, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _317 = abs(_305);
    float _319 = fma(_275, _159, _307);
    bool _321 = !_285;
    int _323 = _321 ? 0 : 1;
    float _325 = -_287;
    float _327 = fma(_325, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _329 = _251 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _331 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _333 = _251 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    int _335 = abs(_311);
    float _337 = fma(_275, _161, _329);
    int _339 = abs(_323);
    float _341 = fma(_275, _163, _333);
    float _343 = float(_317);
    float _345 = float(_335);
    float _347 = abs(_301);
    float _349 = _343 * _347;
    float _351 = fma(_341, _277, _297);
    float _353 = float(_339);
    float _355 = fma(_345, _327, _349);
    float _357 = fma(_319, _277, _293);
    float _359 = fma(_337, _277, _295);
    float _361 = abs(_315);
    float _363 = fma(_353, _361, _355);
    bool _365 = !_331;
    float _381;
    if (!_365)
    {
        float _367 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _369 = _137 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _371 = fma(_369, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _373 = _371 * _367;
        float _375 = floor(_373);
        float _377 = -_375;
        float _379 = _373 + _377;
        _381 = _379;
        _383 = true;
    }
    else
    {
        float _385 = float(_83);
        float _387 = 1.0 / _385;
        float _389 = _117 * _387;
        _381 = _389;
    }
    _383 = false;
    float _391 = _381;
    float _393 = in.m_49.y;
    float _395 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _397 = _359 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _399 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _401 = _391 + _399;
    float _403 = _395 * _137;
    bool _405 = _137 > 0.5;
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _409 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _407;
    int _411 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _413 = _411 != 0;
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _417 = _415 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    int _419 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _421 = _419 != 0;
    float _423 = trunc(_403);
    int _425 = int(_423);
    float _427 = _359 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _429 = fma(_357, (*spvDescriptorSet0.vp_c10)._m0[6].x, _397);
    float _431 = fma(_357, (*spvDescriptorSet0.vp_c10)._m0[4].x, _427);
    float _433 = fma(_351, (*spvDescriptorSet0.vp_c10)._m0[6].z, _429);
    float _435 = 1.0 / _409;
    float _437 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _439 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _441 = _393 > 0.5;
    float _443 = _359 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _445 = _437 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _447 = _425 << 4;
    int _449 = _447 + 1968;
    float _451 = 1.0 / _417;
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _455 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _453;
    uint _458 = uint(int(uint(_449) >> uint(2)));
    uint _460 = uint(int(uint(int(_458)) >> uint(2)));
    int _462 = int(_458) & 3;
    float _464 = (*spvDescriptorSet0.vp_c9)._m0[int(_460)][_462];
    int _466 = int(_458) + 1;
    uint _468 = uint(int(uint(_466) >> uint(2)));
    int _470 = _466 & 3;
    float _472 = (*spvDescriptorSet0.vp_c9)._m0[int(_468)][_470];
    float _474 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _476 = _474 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _478 = fma(_357, (*spvDescriptorSet0.vp_c10)._m0[5].x, _443);
    float _480 = fma(_351, (*spvDescriptorSet0.vp_c10)._m0[4].z, _431);
    float _482 = 1.0 / _476;
    float _484 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _486 = fma(_351, (*spvDescriptorSet0.vp_c10)._m0[5].z, _478);
    int _488 = _449 + 8;
    uint _490 = uint(int(uint(_488) >> uint(2)));
    uint _492 = uint(int(uint(int(_490)) >> uint(2)));
    int _494 = int(_490) & 3;
    float _496 = (*spvDescriptorSet0.vp_c9)._m0[int(_492)][_494];
    float _498 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _500 = 1.0 / _455;
    float _502 = _498 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _506 = _391 + _504;
    float _508 = _433 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _510 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _512 = isnan(_391);
    bool _514 = _510 || _512;
    bool _516 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _518 = _514 || _516;
    float _520 = float(_518);
    bool _522 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _524 = isnan(_391);
    bool _526 = _522 || _524;
    bool _528 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _530 = _526 || _528;
    float _532 = float(_530);
    float _534 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _536 = _508 + _534;
    float _538 = _401 * _482;
    float _540 = _484 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _542 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _544 = _391 + _542;
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _548 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _546;
    float _550 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _552 = _544 * _435;
    float _554 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _556 = _391 + _554;
    out.m_56.x = _502;
    out.m_56.y = _540;
    out.m_56.z = _445;
    out.m_56.w = _439;
    float _558 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _560 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _558;
    float _562 = _506 * _500;
    float _564 = _556 * _451;
    float _566 = fma(_548, _552, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _568 = fma(_560, _552, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _570 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _572 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _574 = _572 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _578 = _576 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _580 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _582 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _580;
    float _584 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _586 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _584;
    float _588 = fma(_574, _564, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _590 = fma(_578, _564, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _592 = _486 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _594 = fma(_582, _562, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _596 = fma(_586, _562, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _598 = _480 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _600 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _602 = _592 + _600;
    float _604 = -_207;
    int _606 = _405 ? as_type<int>(_604) : as_type<int>(_207);
    float _608 = _464 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _610 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _612 = _598 + _610;
    float _614 = _602 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _616 = -_215;
    int _618 = _441 ? as_type<int>(_616) : as_type<int>(_215);
    float _620 = _602 * _602;
    bool _622 = !_413;
    float _624 = _622 ? _207 : as_type<float>(_606);
    float _626 = fma(_612, (*spvDescriptorSet0.vp_c8)._m0[28].x, _614);
    bool _628 = !_421;
    float _630 = _628 ? _215 : as_type<float>(_618);
    float _632 = fma(_612, _612, _620);
    float _634 = _472 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _636 = fma(_536, (*spvDescriptorSet0.vp_c8)._m0[28].z, _626);
    float _638 = _624 + 0.5;
    float _640 = -_630;
    float _642 = _640 + 0.5;
    float _644 = _496 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _646 = fma(_536, _536, _632);
    bool _648 = _636 >= 0.0;
    float _650 = _638 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _652 = _642 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _654 = _608 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _656 = _634 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _658 = _644 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _660 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _662 = isnan(_391);
    bool _664 = _660 || _662;
    bool _666 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _668 = _664 || _666;
    float _670 = float(_668);
    float _672 = _652 * _550;
    bool _674 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _676 = isnan(_391);
    bool _678 = _674 || _676;
    bool _680 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _682 = _678 || _680;
    float _684 = float(_682);
    float _686 = rsqrt(_646);
    out.m_58.x = _654;
    out.m_58.y = _656;
    out.m_58.z = _658;
    float _688 = _650 * _570;
    float _690 = -_670;
    float _692 = _690 + 1.0;
    float _694 = -_684;
    float _696 = _694 + 1.0;
    float _698 = _658;
    float _700 = _588;
    float _702 = _592;
    if (_648)
    {
        out.m_45.x = 0.0;
    }
    float _704 = _684 * _692;
    float _706 = _520 * _696;
    float _708 = -_520;
    float _710 = _708 + 1.0;
    out.m_60.x = _688;
    out.m_60.y = _672;
    bool _712 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _714 = isnan(_391);
    bool _716 = _712 || _714;
    bool _718 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _720 = _716 || _718;
    float _722 = float(_720);
    if (_648)
    {
        _698 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _724 = _698;
    float _726 = _532 * _710;
    float _728 = -_532;
    float _730 = _728 + 1.0;
    float _732 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _734 = _732 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    int _736 = as_type<int>(_724);
    if (_648)
    {
        float _738 = _724 * 5.0;
        _736 = as_type<int>(_738);
    }
    int _740 = _736;
    float _742 = _602 * _686;
    float _744 = _612 * _686;
    if (_648)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2603 = as_type<float>(_740);
        out.gl_Position.z = _2603;
    }
    if (_648)
    {
        return out;
    }
    float _746 = -_742;
    float _748 = fma(_746, (*spvDescriptorSet0.vp_c9)._m0[18].w, _592);
    float _750 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _752 = _750 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _754 = _722 * _730;
    float _756 = fma(_734, _538, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _758 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _760 = _748 + _758;
    float _762 = fma(_752, _538, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _764 = -_744;
    float _766 = fma(_764, (*spvDescriptorSet0.vp_c9)._m0[18].w, _598);
    float _768 = _536 * _686;
    float _770 = _760 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _772 = _566 * _754;
    float _774 = _568 * _754;
    float _776 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _778 = _766 + _776;
    float _780 = -_768;
    float _782 = fma(_780, (*spvDescriptorSet0.vp_c9)._m0[18].w, _508);
    float _784 = -_722;
    float _786 = _784 + 1.0;
    float _788 = -_742;
    float _790 = fma(_788, (*spvDescriptorSet0.vp_c9)._m0[18].w, _602);
    float _792 = fma(_778, (*spvDescriptorSet0.vp_c8)._m0[28].x, _770);
    float _794 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _796 = _782 + _794;
    float _798 = in.m_54.x;
    float _800 = in.m_54.y;
    float _802 = fma(_786, (*spvDescriptorSet0.vp_c9)._m0[143].x, _772);
    float _804 = fma(_786, (*spvDescriptorSet0.vp_c9)._m0[143].y, _774);
    float _806 = fma(_796, (*spvDescriptorSet0.vp_c8)._m0[28].z, _792);
    float _808 = -_744;
    float _810 = fma(_808, (*spvDescriptorSet0.vp_c9)._m0[18].w, _612);
    float _812 = _790 * _790;
    float _814 = fma(_588, _726, _802);
    float _816 = fma(_590, _726, _804);
    bool _818 = _806 >= 0.0;
    float _820 = fma(_810, _810, _812);
    float _822 = -_768;
    float _824 = fma(_822, (*spvDescriptorSet0.vp_c9)._m0[18].w, _536);
    float _826 = fma(_594, _706, _814);
    float _828 = fma(_596, _706, _816);
    float _830 = fma(_824, _824, _820);
    float _832 = fma(_756, _704, _826);
    float _834 = fma(_762, _704, _828);
    float _836 = sqrt(_830);
    float _838 = fma(_670, (*spvDescriptorSet0.vp_c9)._m0[147].x, _832);
    float _840 = fma(_670, (*spvDescriptorSet0.vp_c9)._m0[147].y, _834);
    if (_818)
    {
        _700 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _842 = _700;
    int _844 = as_type<int>(_842);
    if (_818)
    {
        out.m_45.x = 0.0;
    }
    float _846 = _838 * _798;
    float _848 = _840 * _800;
    if (_818)
    {
        float _850 = _842 * 5.0;
        _844 = as_type<int>(_850);
    }
    int _852 = _844;
    float _854 = _363 * _846;
    float _856 = _363 * _848;
    if (_818)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2817 = as_type<float>(_852);
        out.gl_Position.z = _2817;
    }
    float _858 = _686 * _836;
    if (_818)
    {
        return out;
    }
    float _860 = _856 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _862 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _215);
    float _864 = _854 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _866 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _207);
    float _868 = _858 * _860;
    float _870 = _858 * _864;
    float _872 = _862 * _868;
    float _874 = _866 * _870;
    float _876 = _858 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _878 = _876 * 0.5;
    float _880 = _872 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _882 = _872 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _884 = _872 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _886 = fma(_874, (*spvDescriptorSet0.vp_c8)._m0[26].x, _880);
    float _888 = fma(_874, (*spvDescriptorSet0.vp_c8)._m0[24].x, _882);
    float _890 = fma(_874, (*spvDescriptorSet0.vp_c8)._m0[25].x, _884);
    float _892 = fma(_878, (*spvDescriptorSet0.vp_c8)._m0[26].z, _886);
    float _894 = fma(_878, (*spvDescriptorSet0.vp_c8)._m0[24].z, _888);
    float _896 = fma(_878, (*spvDescriptorSet0.vp_c8)._m0[25].z, _890);
    float _898 = _892 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _900 = _894 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _902 = _896 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _904 = _508 + _898;
    float _906 = _598 + _900;
    float _908 = _592 + _902;
    float _910 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _912 = _904 + _910;
    float _914 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _916 = _906 + _914;
    float _918 = _912 * _912;
    float _920 = fma(_916, _916, _918);
    float _922 = sqrt(_920);
    bool _924 = _922 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _926 = _896;
    float _928 = _906;
    float _930 = _880;
    if (!_924)
    {
        _926 = _904;
    }
    float _932 = _926;
    float _934 = _932;
    if (!_924)
    {
        _702 = _908;
    }
    float _936 = _702;
    bool _938 = !_924;
    float _940 = _936;
    if (!_938)
    {
        float _942 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _944 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _946 = _922 + _944;
        float _948 = rsqrt(_920);
        float _950 = _946 * _942;
        float _952 = _908 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _954 = _950 * 0.15915493667125701904296875;
        float _956 = _954 * 6.283185482025146484375;
        float _958 = sin(_956);
        float _960 = _954 * 6.283185482025146484375;
        float _962 = cos(_960);
        float _964 = fma(_958, _952, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _966 = _948 * _964;
        float _968 = _962 + (-1.0);
        float _970 = fma(_916, _966, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _972 = fma(_912, _966, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _974 = _968 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _976 = fma(_908, _962, _974);
        _940 = _976;
        _928 = _970;
        _934 = _972;
        _930 = _954;
    }
    float _978 = _940;
    float _980 = _928;
    float _982 = _934;
    float _984 = _930;
    float _986 = -_742;
    float _988 = fma(_986, (*spvDescriptorSet0.vp_c9)._m0[18].w, _978);
    float _990 = -_744;
    float _992 = fma(_990, (*spvDescriptorSet0.vp_c9)._m0[18].w, _980);
    float _994 = -_768;
    float _996 = fma(_994, (*spvDescriptorSet0.vp_c9)._m0[18].w, _982);
    float _998 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1000 = _988 + _998;
    float _1002 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1004 = _992 + _1002;
    float _1006 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1008 = _996 + _1006;
    float _1010 = _1000 * _1000;
    float _1012 = fma(_1004, _1004, _1010);
    float _1014 = fma(_1008, _1008, _1012);
    float _1016 = rsqrt(_1014);
    float _1018 = sqrt(_1014);
    float _1020 = _1016 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1022 = _1004 * _1020;
    float _1024 = _1008 * _1020;
    float _1026 = _1022 * _1022;
    float _1028 = _1024 * _1024;
    float _1030 = _1026 + _1028;
    float _1032 = sqrt(_1030);
    bool _1034 = _1032 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1036 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1038 = _1032 + _1036;
    float _1040 = _1008;
    float _1042 = _1012;
    float _1044 = _1038;
    float _1046 = _984;
    float _1048 = _1000;
    if (_1034)
    {
        float _1050 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1040 = _1050;
    }
    float _1052 = _1040;
    if (_1034)
    {
        float _1054 = rsqrt(_1030);
        _1042 = _1054;
    }
    float _1056 = _1042;
    float _1058 = _1056;
    if (_1034)
    {
        float _1060 = _1038 * _1052;
        _1044 = _1060;
    }
    float _1062 = _1044;
    if (_1034)
    {
        float _1064 = _1062 * 0.15915493667125701904296875;
        _1046 = _1064;
    }
    float _1066 = _1046;
    float _1068 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1070 = fma(_1018, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1068);
    float _1072 = precise::clamp(_1070, 0.0, 1.0);
    float _1074 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1076 = _1016;
    if (_1034)
    {
        float _1078 = _1066 * 6.283185482025146484375;
        float _1080 = sin(_1078);
        _1076 = _1080;
    }
    float _1082 = _1076;
    float _1084 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1086 = precise::max(0.0, _1084);
    float _1088 = _980;
    float _1090 = _1084;
    float _1092 = _1086;
    if (_1034)
    {
        float _1094 = _1066 * 6.283185482025146484375;
        float _1096 = cos(_1094);
        _1088 = _1096;
    }
    float _1098 = _1088;
    float _1100 = -_1020;
    float _1102 = -_1086;
    float _1104 = fma(_1000, _1100, _1102);
    if (_1034)
    {
        float _1106 = _1104 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1090 = _1106;
    }
    float _1108 = _1090;
    float _1110 = _988 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1112 = _1082;
    float _1114 = _1108;
    if (_1034)
    {
        float _1116 = fma(_1082, _1108, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1092 = _1116;
    }
    float _1118 = _1092;
    float _1120 = _1118;
    if (!_1034)
    {
        _1112 = _1022;
    }
    float _1122 = _1112;
    float _1124 = _1122;
    float _1126 = _1098;
    if (_1034)
    {
        float _1128 = _1098 + (-1.0);
        _1114 = _1128;
    }
    float _1130 = _1114;
    float _1132 = _1130;
    if (_1034)
    {
        float _1134 = _1056 * _1118;
        _1048 = _1134;
    }
    float _1136 = _1048;
    if (!_1034)
    {
        _1058 = _1104;
    }
    float _1138 = _1058;
    float _1140 = _1138;
    if (_1034)
    {
        float _1142 = _1130 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1132 = _1142;
    }
    float _1144 = _1132;
    float _1146 = _1144;
    if (_1034)
    {
        float _1148 = _1022 * _1136;
        _1124 = _1148;
    }
    float _1150 = _1124;
    if (!_1034)
    {
        _1120 = _1024;
    }
    float _1152 = _1120;
    float _1154 = _1152;
    if (_1034)
    {
        float _1156 = _1024 * _1136;
        _1154 = _1156;
    }
    float _1158 = _1154;
    if (_1034)
    {
        float _1160 = fma(_1104, _1098, _1144);
        _1140 = _1160;
    }
    float _1162 = _1140;
    if (!_1034)
    {
        _1126 = _1026;
    }
    float _1164 = _1126;
    float _1166 = _1164;
    if (_1034)
    {
        float _1168 = _1150 * _1150;
        _1166 = _1168;
    }
    float _1170 = _1166;
    float _1172 = _988 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (!_1034)
    {
        _1146 = _1028;
    }
    float _1174 = _1146;
    float _1176 = _1174;
    if (_1034)
    {
        float _1178 = _1158 * _1158;
        _1176 = _1178;
    }
    float _1180 = _1176;
    float _1182 = fma(_1162, _1162, _1170);
    float _1184 = fma(_992, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1172);
    float _1186 = _988 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1188 = _988 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1190 = _1182 + _1180;
    float _1192 = -_1072;
    float _1194 = _1192 + 1.0;
    float _1196 = fma(_992, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1186);
    float _1198 = fma(_992, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1110);
    float _1200 = fma(_992, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1188);
    float _1202 = fma(_996, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1184);
    float _1204 = rsqrt(_1190);
    float _1206 = fma(_996, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1196);
    float _1208 = fma(_996, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1198);
    float _1210 = _1202 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1212 = fma(_996, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1200);
    float _1214 = _1206 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1216 = _1208 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1218 = _1210 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1220 = abs(_1194);
    float _1222 = log2(_1220);
    float _1224 = _1212 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1226 = _1216 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1228 = -_1218;
    float _1230 = fma(_1228, _1074, 1.0);
    float _1232 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1226);
    float _1234 = _1204 * _1150;
    float _1236 = _1204 * _1162;
    float _1238 = _1204 * _1158;
    float _1240 = fma(_1210, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1232);
    float _1242 = _1234 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1244 = log2(_1230);
    float _1246 = fma(_1224, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1240);
    float _1248 = -_1242;
    float _1250 = fma(_1236, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1248);
    float _1252 = _1222 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1254 = _1216 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1256 = -_1238;
    float _1258 = fma(_1256, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1250);
    float _1260 = _1216 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1262 = 1.0 / _1246;
    float _1264 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1254);
    float _1266 = fma(_1258, -0.5, 0.5);
    float _1268 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1260);
    float _1270 = fma(_1258, 0.5, 0.5);
    float _1272 = fma(_1210, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1264);
    float _1274 = _1236 + 1.0;
    float _1276 = fma(_1210, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1268);
    float _1278 = exp2(_1252);
    float _1280 = fma(_1270, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1282 = fma(_1224, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1276);
    float _1284 = fma(_1224, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1272);
    float _1286 = fma(_1270, _1280, -0.212114393711090087890625);
    float _1288 = _1244 * 0.693147182464599609375;
    float _1290 = sqrt(_1266);
    float _1292 = fma(_1270, _1286, 1.570728778839111328125);
    float _1294 = _1284 * _1262;
    float _1296 = fma(_1294, -0.5, 0.5);
    float _1298 = -_1236;
    float _1300 = fma(_1278, _1274, _1298);
    float _1302 = _1282 * _1262;
    float _1304 = _1288 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1306 = fma(_1300, 0.5, 0.5);
    float _1308 = fma(_1302, 0.5, 0.5);
    float _1310 = _1290 * 0.636619746685028076171875;
    float _1312 = -_1292;
    float _1314 = fma(_1310, _1312, 1.0);
    float3 _3582 = float3(_1308, _1296, _1304);
    float _1316 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3582, float3(0.0), isnan(_3582)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3582, float3(0.0), isnan(_3582)), level(0.0)).x;
    float3 _3593 = float3(_1308, _1296, _1304);
    float4 _1319 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3593, float3(0.0), isnan(_3593)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3593, float3(0.0), isnan(_3593)), level(0.0)).xyzw;
    float _1321 = _1319.x;
    float _1323 = _1319.y;
    float _1325 = _1319.z;
    float _1327 = _1319.w;
    float2 _3610 = float2(_1314, _1306);
    float3 _1331 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3610, float2(0.0), isnan(_3610)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3610, float2(0.0), isnan(_3610)), level(0.0)).xyz;
    float _1333 = _1331.x;
    float _1335 = _1331.y;
    float _1337 = _1331.z;
    float _1339 = _748 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1341 = _748 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1343 = _1222 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1345 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1347 = isnan(0.5);
    bool _1349 = _1345 || _1347;
    bool _1351 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1353 = _1349 || _1351;
    float _1355 = fma(_766, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1339);
    float _1357 = fma(_766, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1341);
    float _1359 = exp2(_1343);
    float _1361 = fma(_782, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1355);
    float _1363 = fma(_782, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1357);
    float _1365 = _1216 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1367 = _1361 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1369 = _1363 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1371 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1365);
    float _1373 = 1.0 / _1367;
    float _1375 = _1369 + _1367;
    float _1377 = fma(_1210, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1371);
    float _1379 = _1341;
    if (_1353)
    {
        _1379 = 1.0;
    }
    float _1381 = _1379;
    float _1383 = fma(_1224, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1377);
    float _1385 = _1375 * _1373;
    float _1387 = _1385 * 0.5;
    float _1389 = _1381;
    if (!_1353)
    {
        float _1391 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1393 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1395 = _1391 * 0.15915493667125701904296875;
        float _1397 = _1393 * 0.15915493667125701904296875;
        float _1399 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1401 = fma(_1387, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1399);
        float _1403 = _1395 * 6.283185482025146484375;
        float _1405 = cos(_1403);
        float _1407 = _1395 * 6.283185482025146484375;
        float _1409 = sin(_1407);
        float _1411 = 1.0 / _1405;
        float _1413 = _1397 * 6.283185482025146484375;
        float _1415 = cos(_1413);
        float _1417 = _1409 * _1411;
        float _1419 = _1397 * 6.283185482025146484375;
        float _1421 = sin(_1419);
        float _1423 = _1415 * _1417;
        float _1425 = 1.0 / _1401;
        float _1427 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1429 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1427;
        float _1431 = 1.0 / _1423;
        float _1433 = 1.0 / _1429;
        float _1435 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1437 = _1425 * _1435;
        float _1439 = _1421 * _1431;
        float _1441 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1443 = fma(_1439, _1437, _1441);
        float _1445 = _1443 * _1433;
        float _1447 = precise::clamp(_1445, 0.0, 1.0);
        _1389 = _1447;
    }
    float _1449 = _1389;
    float _1451 = _1383 + _1246;
    float _1453 = -_1359;
    float _1455 = _1453 + 1.0;
    bool _1457 = _1449 > 0.0;
    bool _1459 = isnan(_1449);
    bool _1461 = _1457 || _1459;
    bool _1463 = isnan(0.0);
    bool _1465 = _1461 || _1463;
    float _1467 = _1449 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1469 = _1451 * 0.5;
    float _1471 = _1455 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1473 = _1467 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1475 = _1471 * _1316;
    float _1477 = -_1471;
    float _1479 = _1477 + 1.0;
    out.gl_Position.x = _1282;
    out.gl_Position.y = _1284;
    out.gl_Position.z = _1383;
    out.gl_Position.w = _1246;
    float _1481 = _1327 * _1475;
    float _1483 = _1337 * _1475;
    float _1485 = _1327 * _1479;
    out.m_62.z = _1469;
    out.m_62.w = _1246;
    float _1487 = fma(_1333, _1481, _1321);
    float _1489 = fma(_1335, _1481, _1323);
    float _1491 = fma(_1327, _1483, _1325);
    out.m_45.x = _1473;
    out.m_64.x = _1487;
    out.m_64.y = _1489;
    out.m_64.z = _1491;
    out.m_64.w = _1485;
    if (_1465)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _1493 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1493;
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
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    bool _383 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _78 = in.m_42.w;
    float _80 = trunc(_78);
    int _83 = int(_80);
    bool _87 = _83 >= 1;
    float _89 = 0.0;
    if (!_87)
    {
        _89 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _91 = _89;
    float _93 = _91;
    if (!_87)
    {
        out.m_45.x = 0.0;
    }
    int _95 = 0;
    if (!_87)
    {
        float _97 = _91 * 5.0;
        _95 = as_type<int>(_97);
    }
    int _99 = _95;
    int _101 = _99;
    if (!_87)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1550 = as_type<float>(_99);
        out.gl_Position.z = _1550;
    }
    if (!_87)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _103 = in.m_47.w;
    bool _105 = _103 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _107 = isnan(_103);
    bool _109 = _105 || _107;
    bool _111 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _113 = _109 || _111;
    float _115 = -_103;
    float _117 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _119 = 0.0;
    if (_113)
    {
        float _121 = float(_83);
        _119 = _121;
    }
    float _123 = _119;
    bool _125 = _117 >= _123;
    bool _127 = !_113;
    bool _129 = _125 || _127;
    if (_129)
    {
        _93 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _131 = _93;
    if (_129)
    {
        out.m_45.x = 0.0;
    }
    if (_129)
    {
        float _133 = _131 * 5.0;
        _101 = as_type<int>(_133);
    }
    int _135 = _101;
    if (_129)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1618 = as_type<float>(_135);
        out.gl_Position.z = _1618;
    }
    if (_129)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _137 = in.m_49.x;
    float _139 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _141 = _117 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _143 = as_type<float>(int(gl_VertexIndex));
    bool _145 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _147 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _149 = _145 || _147;
    bool _151 = isnan(1.0);
    bool _153 = _149 || _151;
    float _155 = _141 * _139;
    float _157 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[20].x, _155);
    float _159 = in.m_47.x;
    float _161 = in.m_47.y;
    float _163 = in.m_47.z;
    float _165 = _157 * 6.283185482025146484375;
    float _167 = floor(_157);
    int _169 = as_type<int>(_143) & 1;
    bool _171 = _169 != 0;
    int _173 = as_type<int>(_143) & 2;
    bool _175 = _173 != 0;
    float _177 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _179 = _165 * 0.15915493667125701904296875;
    float _181 = 0.0;
    float _183 = _177;
    if (!_153)
    {
        float _185 = _177 * _177;
        float _187 = _185 * 0.5;
        _181 = _187;
    }
    float _189 = _181;
    int _191 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _193 = _191 != 0;
    float _195 = _179 * 6.283185482025146484375;
    float _197 = cos(_195);
    float _199 = _189;
    if (!_153)
    {
        float _201 = _189 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _199 = _201;
    }
    float _203 = _199;
    bool _205 = !_171;
    float _207 = _205 ? (-0.5) : 0.5;
    float _209 = -_167;
    float _211 = _157 + _209;
    bool _213 = !_175;
    float _215 = _213 ? (-0.5) : 0.5;
    bool _217 = !_153;
    float _219 = _203;
    if (!_217)
    {
        float _221 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _223 = log2(_221);
        float _225 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _227 = _225 + 1.0;
        float _229 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _231 = _177 * _223;
        float _233 = 1.0 / _227;
        float _235 = _229 * 0.693147182464599609375;
        float _237 = exp2(_231);
        float _239 = 1.0 / _235;
        float _241 = _237 + (-1.0);
        float _243 = -_241;
        float _245 = fma(_243, _239, _177);
        float _247 = _245 * _233;
        float _249 = _247 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _219 = _249;
    }
    float _251 = _219;
    bool _253 = !_153;
    if (!_253)
    {
        float _255 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _257 = log2(_255);
        float _259 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _261 = _259 + 1.0;
        float _263 = 1.0 / _261;
        float _265 = _177 * _257;
        float _267 = exp2(_265);
        float _269 = -_267;
        float _271 = _269 + 1.0;
        float _273 = _271 * _263;
        _183 = _273;
    }
    float _275 = _183;
    float _277 = in.m_54.w;
    int _279 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _281 = _279 != 0;
    int _283 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _285 = _283 != 0;
    float _287 = fma(_197, 0.5, 0.5);
    bool _289 = _211 < 0.5;
    float _291 = float(_289);
    float _293 = in.m_42.x;
    float _295 = in.m_42.y;
    float _297 = in.m_42.z;
    float _299 = -_211;
    float _301 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _303 = !_281;
    int _305 = _303 ? 0 : 1;
    float _307 = _251 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    bool _309 = !_193;
    int _311 = _309 ? 0 : 1;
    float _313 = -_291;
    float _315 = fma(_313, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _317 = abs(_305);
    float _319 = fma(_275, _159, _307);
    bool _321 = !_285;
    int _323 = _321 ? 0 : 1;
    float _325 = -_287;
    float _327 = fma(_325, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _329 = _251 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _331 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _333 = _251 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    int _335 = abs(_311);
    float _337 = fma(_275, _161, _329);
    int _339 = abs(_323);
    float _341 = fma(_275, _163, _333);
    float _343 = float(_317);
    float _345 = float(_335);
    float _347 = abs(_301);
    float _349 = _343 * _347;
    float _351 = fma(_341, _277, _297);
    float _353 = float(_339);
    float _355 = fma(_345, _327, _349);
    float _357 = fma(_319, _277, _293);
    float _359 = fma(_337, _277, _295);
    float _361 = abs(_315);
    float _363 = fma(_353, _361, _355);
    bool _365 = !_331;
    float _381;
    if (!_365)
    {
        float _367 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _369 = _137 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _371 = fma(_369, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _373 = _371 * _367;
        float _375 = floor(_373);
        float _377 = -_375;
        float _379 = _373 + _377;
        _381 = _379;
        _383 = true;
    }
    else
    {
        float _385 = float(_83);
        float _387 = 1.0 / _385;
        float _389 = _117 * _387;
        _381 = _389;
    }
    _383 = false;
    float _391 = _381;
    float _393 = in.m_49.y;
    float _395 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _397 = _359 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _399 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _401 = _391 + _399;
    float _403 = _395 * _137;
    bool _405 = _137 > 0.5;
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _409 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _407;
    int _411 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _413 = _411 != 0;
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _417 = _415 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    int _419 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _421 = _419 != 0;
    float _423 = trunc(_403);
    int _425 = int(_423);
    float _427 = _359 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _429 = fma(_357, (*spvDescriptorSet0.vp_c10)._m0[6].x, _397);
    float _431 = fma(_357, (*spvDescriptorSet0.vp_c10)._m0[4].x, _427);
    float _433 = fma(_351, (*spvDescriptorSet0.vp_c10)._m0[6].z, _429);
    float _435 = 1.0 / _409;
    float _437 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _439 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _441 = _393 > 0.5;
    float _443 = _359 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _445 = _437 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _447 = _425 << 4;
    int _449 = _447 + 1968;
    float _451 = 1.0 / _417;
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _455 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _453;
    uint _458 = uint(int(uint(_449) >> uint(2)));
    uint _460 = uint(int(uint(int(_458)) >> uint(2)));
    int _462 = int(_458) & 3;
    float _464 = (*spvDescriptorSet0.vp_c9)._m0[int(_460)][_462];
    int _466 = int(_458) + 1;
    uint _468 = uint(int(uint(_466) >> uint(2)));
    int _470 = _466 & 3;
    float _472 = (*spvDescriptorSet0.vp_c9)._m0[int(_468)][_470];
    float _474 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _476 = _474 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _478 = fma(_357, (*spvDescriptorSet0.vp_c10)._m0[5].x, _443);
    float _480 = fma(_351, (*spvDescriptorSet0.vp_c10)._m0[4].z, _431);
    float _482 = 1.0 / _476;
    float _484 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _486 = fma(_351, (*spvDescriptorSet0.vp_c10)._m0[5].z, _478);
    int _488 = _449 + 8;
    uint _490 = uint(int(uint(_488) >> uint(2)));
    uint _492 = uint(int(uint(int(_490)) >> uint(2)));
    int _494 = int(_490) & 3;
    float _496 = (*spvDescriptorSet0.vp_c9)._m0[int(_492)][_494];
    float _498 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _500 = 1.0 / _455;
    float _502 = _498 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _506 = _391 + _504;
    float _508 = _433 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _510 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _512 = isnan(_391);
    bool _514 = _510 || _512;
    bool _516 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _518 = _514 || _516;
    float _520 = float(_518);
    bool _522 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _524 = isnan(_391);
    bool _526 = _522 || _524;
    bool _528 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _530 = _526 || _528;
    float _532 = float(_530);
    float _534 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _536 = _508 + _534;
    float _538 = _401 * _482;
    float _540 = _484 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _542 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _544 = _391 + _542;
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _548 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _546;
    float _550 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _552 = _544 * _435;
    float _554 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _556 = _391 + _554;
    out.m_56.x = _502;
    out.m_56.y = _540;
    out.m_56.z = _445;
    out.m_56.w = _439;
    float _558 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _560 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _558;
    float _562 = _506 * _500;
    float _564 = _556 * _451;
    float _566 = fma(_548, _552, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _568 = fma(_560, _552, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _570 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _572 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _574 = _572 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _578 = _576 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _580 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _582 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _580;
    float _584 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _586 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _584;
    float _588 = fma(_574, _564, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _590 = fma(_578, _564, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _592 = _486 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _594 = fma(_582, _562, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _596 = fma(_586, _562, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _598 = _480 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _600 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _602 = _592 + _600;
    float _604 = -_207;
    int _606 = _405 ? as_type<int>(_604) : as_type<int>(_207);
    float _608 = _464 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _610 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _612 = _598 + _610;
    float _614 = _602 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _616 = -_215;
    int _618 = _441 ? as_type<int>(_616) : as_type<int>(_215);
    float _620 = _602 * _602;
    bool _622 = !_413;
    float _624 = _622 ? _207 : as_type<float>(_606);
    float _626 = fma(_612, (*spvDescriptorSet0.vp_c8)._m0[28].x, _614);
    bool _628 = !_421;
    float _630 = _628 ? _215 : as_type<float>(_618);
    float _632 = fma(_612, _612, _620);
    float _634 = _472 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _636 = fma(_536, (*spvDescriptorSet0.vp_c8)._m0[28].z, _626);
    float _638 = _624 + 0.5;
    float _640 = -_630;
    float _642 = _640 + 0.5;
    float _644 = _496 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _646 = fma(_536, _536, _632);
    bool _648 = _636 >= 0.0;
    float _650 = _638 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _652 = _642 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _654 = _608 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _656 = _634 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _658 = _644 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _660 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _662 = isnan(_391);
    bool _664 = _660 || _662;
    bool _666 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _668 = _664 || _666;
    float _670 = float(_668);
    float _672 = _652 * _550;
    bool _674 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _676 = isnan(_391);
    bool _678 = _674 || _676;
    bool _680 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _682 = _678 || _680;
    float _684 = float(_682);
    float _686 = rsqrt(_646);
    out.m_58.x = _654;
    out.m_58.y = _656;
    out.m_58.z = _658;
    float _688 = _650 * _570;
    float _690 = -_670;
    float _692 = _690 + 1.0;
    float _694 = -_684;
    float _696 = _694 + 1.0;
    float _698 = _658;
    float _700 = _588;
    float _702 = _592;
    if (_648)
    {
        out.m_45.x = 0.0;
    }
    float _704 = _684 * _692;
    float _706 = _520 * _696;
    float _708 = -_520;
    float _710 = _708 + 1.0;
    out.m_60.x = _688;
    out.m_60.y = _672;
    bool _712 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _714 = isnan(_391);
    bool _716 = _712 || _714;
    bool _718 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _720 = _716 || _718;
    float _722 = float(_720);
    if (_648)
    {
        _698 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _724 = _698;
    float _726 = _532 * _710;
    float _728 = -_532;
    float _730 = _728 + 1.0;
    float _732 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _734 = _732 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    int _736 = as_type<int>(_724);
    if (_648)
    {
        float _738 = _724 * 5.0;
        _736 = as_type<int>(_738);
    }
    int _740 = _736;
    float _742 = _602 * _686;
    float _744 = _612 * _686;
    if (_648)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2603 = as_type<float>(_740);
        out.gl_Position.z = _2603;
    }
    if (_648)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _746 = -_742;
    float _748 = fma(_746, (*spvDescriptorSet0.vp_c9)._m0[18].w, _592);
    float _750 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _752 = _750 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _754 = _722 * _730;
    float _756 = fma(_734, _538, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _758 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _760 = _748 + _758;
    float _762 = fma(_752, _538, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _764 = -_744;
    float _766 = fma(_764, (*spvDescriptorSet0.vp_c9)._m0[18].w, _598);
    float _768 = _536 * _686;
    float _770 = _760 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _772 = _566 * _754;
    float _774 = _568 * _754;
    float _776 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _778 = _766 + _776;
    float _780 = -_768;
    float _782 = fma(_780, (*spvDescriptorSet0.vp_c9)._m0[18].w, _508);
    float _784 = -_722;
    float _786 = _784 + 1.0;
    float _788 = -_742;
    float _790 = fma(_788, (*spvDescriptorSet0.vp_c9)._m0[18].w, _602);
    float _792 = fma(_778, (*spvDescriptorSet0.vp_c8)._m0[28].x, _770);
    float _794 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _796 = _782 + _794;
    float _798 = in.m_54.x;
    float _800 = in.m_54.y;
    float _802 = fma(_786, (*spvDescriptorSet0.vp_c9)._m0[143].x, _772);
    float _804 = fma(_786, (*spvDescriptorSet0.vp_c9)._m0[143].y, _774);
    float _806 = fma(_796, (*spvDescriptorSet0.vp_c8)._m0[28].z, _792);
    float _808 = -_744;
    float _810 = fma(_808, (*spvDescriptorSet0.vp_c9)._m0[18].w, _612);
    float _812 = _790 * _790;
    float _814 = fma(_588, _726, _802);
    float _816 = fma(_590, _726, _804);
    bool _818 = _806 >= 0.0;
    float _820 = fma(_810, _810, _812);
    float _822 = -_768;
    float _824 = fma(_822, (*spvDescriptorSet0.vp_c9)._m0[18].w, _536);
    float _826 = fma(_594, _706, _814);
    float _828 = fma(_596, _706, _816);
    float _830 = fma(_824, _824, _820);
    float _832 = fma(_756, _704, _826);
    float _834 = fma(_762, _704, _828);
    float _836 = sqrt(_830);
    float _838 = fma(_670, (*spvDescriptorSet0.vp_c9)._m0[147].x, _832);
    float _840 = fma(_670, (*spvDescriptorSet0.vp_c9)._m0[147].y, _834);
    if (_818)
    {
        _700 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _842 = _700;
    int _844 = as_type<int>(_842);
    if (_818)
    {
        out.m_45.x = 0.0;
    }
    float _846 = _838 * _798;
    float _848 = _840 * _800;
    if (_818)
    {
        float _850 = _842 * 5.0;
        _844 = as_type<int>(_850);
    }
    int _852 = _844;
    float _854 = _363 * _846;
    float _856 = _363 * _848;
    if (_818)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2817 = as_type<float>(_852);
        out.gl_Position.z = _2817;
    }
    float _858 = _686 * _836;
    if (_818)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _860 = _856 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _862 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _215);
    float _864 = _854 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _866 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _207);
    float _868 = _858 * _860;
    float _870 = _858 * _864;
    float _872 = _862 * _868;
    float _874 = _866 * _870;
    float _876 = _858 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _878 = _876 * 0.5;
    float _880 = _872 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _882 = _872 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _884 = _872 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _886 = fma(_874, (*spvDescriptorSet0.vp_c8)._m0[26].x, _880);
    float _888 = fma(_874, (*spvDescriptorSet0.vp_c8)._m0[24].x, _882);
    float _890 = fma(_874, (*spvDescriptorSet0.vp_c8)._m0[25].x, _884);
    float _892 = fma(_878, (*spvDescriptorSet0.vp_c8)._m0[26].z, _886);
    float _894 = fma(_878, (*spvDescriptorSet0.vp_c8)._m0[24].z, _888);
    float _896 = fma(_878, (*spvDescriptorSet0.vp_c8)._m0[25].z, _890);
    float _898 = _892 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _900 = _894 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _902 = _896 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _904 = _508 + _898;
    float _906 = _598 + _900;
    float _908 = _592 + _902;
    float _910 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _912 = _904 + _910;
    float _914 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _916 = _906 + _914;
    float _918 = _912 * _912;
    float _920 = fma(_916, _916, _918);
    float _922 = sqrt(_920);
    bool _924 = _922 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _926 = _896;
    float _928 = _906;
    float _930 = _880;
    if (!_924)
    {
        _926 = _904;
    }
    float _932 = _926;
    float _934 = _932;
    if (!_924)
    {
        _702 = _908;
    }
    float _936 = _702;
    bool _938 = !_924;
    float _940 = _936;
    if (!_938)
    {
        float _942 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _944 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _946 = _922 + _944;
        float _948 = rsqrt(_920);
        float _950 = _946 * _942;
        float _952 = _908 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _954 = _950 * 0.15915493667125701904296875;
        float _956 = _954 * 6.283185482025146484375;
        float _958 = sin(_956);
        float _960 = _954 * 6.283185482025146484375;
        float _962 = cos(_960);
        float _964 = fma(_958, _952, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _966 = _948 * _964;
        float _968 = _962 + (-1.0);
        float _970 = fma(_916, _966, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _972 = fma(_912, _966, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _974 = _968 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _976 = fma(_908, _962, _974);
        _940 = _976;
        _928 = _970;
        _934 = _972;
        _930 = _954;
    }
    float _978 = _940;
    float _980 = _928;
    float _982 = _934;
    float _984 = _930;
    float _986 = -_742;
    float _988 = fma(_986, (*spvDescriptorSet0.vp_c9)._m0[18].w, _978);
    float _990 = -_744;
    float _992 = fma(_990, (*spvDescriptorSet0.vp_c9)._m0[18].w, _980);
    float _994 = -_768;
    float _996 = fma(_994, (*spvDescriptorSet0.vp_c9)._m0[18].w, _982);
    float _998 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1000 = _988 + _998;
    float _1002 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1004 = _992 + _1002;
    float _1006 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1008 = _996 + _1006;
    float _1010 = _1000 * _1000;
    float _1012 = fma(_1004, _1004, _1010);
    float _1014 = fma(_1008, _1008, _1012);
    float _1016 = rsqrt(_1014);
    float _1018 = sqrt(_1014);
    float _1020 = _1016 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1022 = _1004 * _1020;
    float _1024 = _1008 * _1020;
    float _1026 = _1022 * _1022;
    float _1028 = _1024 * _1024;
    float _1030 = _1026 + _1028;
    float _1032 = sqrt(_1030);
    bool _1034 = _1032 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1036 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1038 = _1032 + _1036;
    float _1040 = _1008;
    float _1042 = _1012;
    float _1044 = _1038;
    float _1046 = _984;
    float _1048 = _1000;
    if (_1034)
    {
        float _1050 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1040 = _1050;
    }
    float _1052 = _1040;
    if (_1034)
    {
        float _1054 = rsqrt(_1030);
        _1042 = _1054;
    }
    float _1056 = _1042;
    float _1058 = _1056;
    if (_1034)
    {
        float _1060 = _1038 * _1052;
        _1044 = _1060;
    }
    float _1062 = _1044;
    if (_1034)
    {
        float _1064 = _1062 * 0.15915493667125701904296875;
        _1046 = _1064;
    }
    float _1066 = _1046;
    float _1068 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1070 = fma(_1018, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1068);
    float _1072 = precise::clamp(_1070, 0.0, 1.0);
    float _1074 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1076 = _1016;
    if (_1034)
    {
        float _1078 = _1066 * 6.283185482025146484375;
        float _1080 = sin(_1078);
        _1076 = _1080;
    }
    float _1082 = _1076;
    float _1084 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1086 = precise::max(0.0, _1084);
    float _1088 = _980;
    float _1090 = _1084;
    float _1092 = _1086;
    if (_1034)
    {
        float _1094 = _1066 * 6.283185482025146484375;
        float _1096 = cos(_1094);
        _1088 = _1096;
    }
    float _1098 = _1088;
    float _1100 = -_1020;
    float _1102 = -_1086;
    float _1104 = fma(_1000, _1100, _1102);
    if (_1034)
    {
        float _1106 = _1104 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1090 = _1106;
    }
    float _1108 = _1090;
    float _1110 = _988 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1112 = _1082;
    float _1114 = _1108;
    if (_1034)
    {
        float _1116 = fma(_1082, _1108, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1092 = _1116;
    }
    float _1118 = _1092;
    float _1120 = _1118;
    if (!_1034)
    {
        _1112 = _1022;
    }
    float _1122 = _1112;
    float _1124 = _1122;
    float _1126 = _1098;
    if (_1034)
    {
        float _1128 = _1098 + (-1.0);
        _1114 = _1128;
    }
    float _1130 = _1114;
    float _1132 = _1130;
    if (_1034)
    {
        float _1134 = _1056 * _1118;
        _1048 = _1134;
    }
    float _1136 = _1048;
    if (!_1034)
    {
        _1058 = _1104;
    }
    float _1138 = _1058;
    float _1140 = _1138;
    if (_1034)
    {
        float _1142 = _1130 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1132 = _1142;
    }
    float _1144 = _1132;
    float _1146 = _1144;
    if (_1034)
    {
        float _1148 = _1022 * _1136;
        _1124 = _1148;
    }
    float _1150 = _1124;
    if (!_1034)
    {
        _1120 = _1024;
    }
    float _1152 = _1120;
    float _1154 = _1152;
    if (_1034)
    {
        float _1156 = _1024 * _1136;
        _1154 = _1156;
    }
    float _1158 = _1154;
    if (_1034)
    {
        float _1160 = fma(_1104, _1098, _1144);
        _1140 = _1160;
    }
    float _1162 = _1140;
    if (!_1034)
    {
        _1126 = _1026;
    }
    float _1164 = _1126;
    float _1166 = _1164;
    if (_1034)
    {
        float _1168 = _1150 * _1150;
        _1166 = _1168;
    }
    float _1170 = _1166;
    float _1172 = _988 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (!_1034)
    {
        _1146 = _1028;
    }
    float _1174 = _1146;
    float _1176 = _1174;
    if (_1034)
    {
        float _1178 = _1158 * _1158;
        _1176 = _1178;
    }
    float _1180 = _1176;
    float _1182 = fma(_1162, _1162, _1170);
    float _1184 = fma(_992, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1172);
    float _1186 = _988 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1188 = _988 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1190 = _1182 + _1180;
    float _1192 = -_1072;
    float _1194 = _1192 + 1.0;
    float _1196 = fma(_992, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1186);
    float _1198 = fma(_992, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1110);
    float _1200 = fma(_992, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1188);
    float _1202 = fma(_996, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1184);
    float _1204 = rsqrt(_1190);
    float _1206 = fma(_996, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1196);
    float _1208 = fma(_996, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1198);
    float _1210 = _1202 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1212 = fma(_996, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1200);
    float _1214 = _1206 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1216 = _1208 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1218 = _1210 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1220 = abs(_1194);
    float _1222 = log2(_1220);
    float _1224 = _1212 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1226 = _1216 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1228 = -_1218;
    float _1230 = fma(_1228, _1074, 1.0);
    float _1232 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1226);
    float _1234 = _1204 * _1150;
    float _1236 = _1204 * _1162;
    float _1238 = _1204 * _1158;
    float _1240 = fma(_1210, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1232);
    float _1242 = _1234 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1244 = log2(_1230);
    float _1246 = fma(_1224, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1240);
    float _1248 = -_1242;
    float _1250 = fma(_1236, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1248);
    float _1252 = _1222 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1254 = _1216 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1256 = -_1238;
    float _1258 = fma(_1256, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1250);
    float _1260 = _1216 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1262 = 1.0 / _1246;
    float _1264 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1254);
    float _1266 = fma(_1258, -0.5, 0.5);
    float _1268 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1260);
    float _1270 = fma(_1258, 0.5, 0.5);
    float _1272 = fma(_1210, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1264);
    float _1274 = _1236 + 1.0;
    float _1276 = fma(_1210, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1268);
    float _1278 = exp2(_1252);
    float _1280 = fma(_1270, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1282 = fma(_1224, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1276);
    float _1284 = fma(_1224, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1272);
    float _1286 = fma(_1270, _1280, -0.212114393711090087890625);
    float _1288 = _1244 * 0.693147182464599609375;
    float _1290 = sqrt(_1266);
    float _1292 = fma(_1270, _1286, 1.570728778839111328125);
    float _1294 = _1284 * _1262;
    float _1296 = fma(_1294, -0.5, 0.5);
    float _1298 = -_1236;
    float _1300 = fma(_1278, _1274, _1298);
    float _1302 = _1282 * _1262;
    float _1304 = _1288 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1306 = fma(_1300, 0.5, 0.5);
    float _1308 = fma(_1302, 0.5, 0.5);
    float _1310 = _1290 * 0.636619746685028076171875;
    float _1312 = -_1292;
    float _1314 = fma(_1310, _1312, 1.0);
    float3 _3582 = float3(_1308, _1296, _1304);
    float _1316 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3582, float3(0.0), isnan(_3582)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3582, float3(0.0), isnan(_3582)), level(0.0)).x;
    float3 _3593 = float3(_1308, _1296, _1304);
    float4 _1319 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3593, float3(0.0), isnan(_3593)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3593, float3(0.0), isnan(_3593)), level(0.0)).xyzw;
    float _1321 = _1319.x;
    float _1323 = _1319.y;
    float _1325 = _1319.z;
    float _1327 = _1319.w;
    float2 _3610 = float2(_1314, _1306);
    float3 _1331 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3610, float2(0.0), isnan(_3610)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3610, float2(0.0), isnan(_3610)), level(0.0)).xyz;
    float _1333 = _1331.x;
    float _1335 = _1331.y;
    float _1337 = _1331.z;
    float _1339 = _748 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1341 = _748 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1343 = _1222 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1345 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1347 = isnan(0.5);
    bool _1349 = _1345 || _1347;
    bool _1351 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1353 = _1349 || _1351;
    float _1355 = fma(_766, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1339);
    float _1357 = fma(_766, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1341);
    float _1359 = exp2(_1343);
    float _1361 = fma(_782, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1355);
    float _1363 = fma(_782, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1357);
    float _1365 = _1216 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1367 = _1361 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1369 = _1363 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1371 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1365);
    float _1373 = 1.0 / _1367;
    float _1375 = _1369 + _1367;
    float _1377 = fma(_1210, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1371);
    float _1379 = _1341;
    if (_1353)
    {
        _1379 = 1.0;
    }
    float _1381 = _1379;
    float _1383 = fma(_1224, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1377);
    float _1385 = _1375 * _1373;
    float _1387 = _1385 * 0.5;
    float _1389 = _1381;
    if (!_1353)
    {
        float _1391 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1393 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1395 = _1391 * 0.15915493667125701904296875;
        float _1397 = _1393 * 0.15915493667125701904296875;
        float _1399 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1401 = fma(_1387, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1399);
        float _1403 = _1395 * 6.283185482025146484375;
        float _1405 = cos(_1403);
        float _1407 = _1395 * 6.283185482025146484375;
        float _1409 = sin(_1407);
        float _1411 = 1.0 / _1405;
        float _1413 = _1397 * 6.283185482025146484375;
        float _1415 = cos(_1413);
        float _1417 = _1409 * _1411;
        float _1419 = _1397 * 6.283185482025146484375;
        float _1421 = sin(_1419);
        float _1423 = _1415 * _1417;
        float _1425 = 1.0 / _1401;
        float _1427 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1429 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1427;
        float _1431 = 1.0 / _1423;
        float _1433 = 1.0 / _1429;
        float _1435 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1437 = _1425 * _1435;
        float _1439 = _1421 * _1431;
        float _1441 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1443 = fma(_1439, _1437, _1441);
        float _1445 = _1443 * _1433;
        float _1447 = precise::clamp(_1445, 0.0, 1.0);
        _1389 = _1447;
    }
    float _1449 = _1389;
    float _1451 = _1383 + _1246;
    float _1453 = -_1359;
    float _1455 = _1453 + 1.0;
    bool _1457 = _1449 > 0.0;
    bool _1459 = isnan(_1449);
    bool _1461 = _1457 || _1459;
    bool _1463 = isnan(0.0);
    bool _1465 = _1461 || _1463;
    float _1467 = _1449 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1469 = _1451 * 0.5;
    float _1471 = _1455 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1473 = _1467 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1475 = _1471 * _1316;
    float _1477 = -_1471;
    float _1479 = _1477 + 1.0;
    out.gl_Position.x = _1282;
    out.gl_Position.y = _1284;
    out.gl_Position.z = _1383;
    out.gl_Position.w = _1246;
    float _1481 = _1327 * _1475;
    float _1483 = _1337 * _1475;
    float _1485 = _1327 * _1479;
    out.m_62.z = _1469;
    out.m_62.w = _1246;
    float _1487 = fma(_1333, _1481, _1321);
    float _1489 = fma(_1335, _1481, _1323);
    float _1491 = fma(_1327, _1483, _1325);
    out.m_45.x = _1473;
    out.m_64.x = _1487;
    out.m_64.y = _1489;
    out.m_64.z = _1491;
    out.m_64.w = _1485;
    if (_1465)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _1493 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1493;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}


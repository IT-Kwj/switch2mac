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
    uint4 _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float4 _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    constant _16* fp_c9 [[id(1)]];
    texture2d<float> fp_t_tcb_8 [[id(2)]];
    sampler fp_t_tcb_8Smplr [[id(3)]];
    texture2d<float> fp_t_tcb_A [[id(4)]];
    sampler fp_t_tcb_ASmplr [[id(5)]];
    texture2d<float> fp_t_tcb_C [[id(6)]];
    sampler fp_t_tcb_CSmplr [[id(7)]];
    sampler fp_t_tcb_8Smplr_w [[id(8)]];
    sampler fp_t_tcb_ASmplr_w [[id(9)]];
    sampler fp_t_tcb_CSmplr_w [[id(10)]];
    constant dm_border_t* dm_border [[id(11)]];
};

struct main0_out
{
    float4 m_46 [[color(0)]];
};

struct main0_in
{
    float4 m_43 [[user(locn0)]];
    float4 m_35 [[user(locn1), flat]];
    float4 m_33 [[user(locn2)]];
    float4 m_41 [[user(locn3)]];
    float4 m_37 [[user(locn4)]];
    float4 m_39 [[user(locn5)]];
    float4 m_48 [[user(locn6)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _55 = gl_FragCoord.w;
    float _57 = in.m_33.x;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = in.m_33.y;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = 1.0 / _55;
    float _71 = _69 * _61;
    float _73 = _69 * _67;
    float2 _570 = float2(_71, _73);
    float2 _77 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_570, float2(0.0), isnan(_570))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_570, float2(0.0), isnan(_570))).xy;
    float _79 = _77.x;
    float _81 = _77.y;
    float _83 = in.m_35.y;
    float _85 = in.m_37.y;
    float _87 = gl_FragCoord.w;
    float _89 = _85 * _87;
    float _91 = in.m_33.z;
    float _93 = gl_FragCoord.w;
    float _95 = _91 * _93;
    float _97 = in.m_33.w;
    float _99 = gl_FragCoord.w;
    float _101 = _97 * _99;
    float _103 = _83 * (-0.2599999904632568359375);
    float _105 = _69 * _89;
    float _107 = _83 * (-0.319999992847442626953125);
    float _109 = fma(_105, 17.0, _103);
    float _111 = fma(_105, 21.0, _107);
    float _113 = -_105;
    float _115 = _113 + 1.0;
    float _117 = _109 * 0.15915493667125701904296875;
    float _119 = _111 * 0.15915493667125701904296875;
    float _121 = _117 * 6.283185482025146484375;
    float _123 = sin(_121);
    float _125 = _119 * 6.283185482025146484375;
    float _127 = sin(_125);
    float _129 = _123 + _127;
    float _131 = _69 * _95;
    float _133 = _69 * _101;
    float _135 = _129 * _115;
    float _137 = fma(_79, (*spvDescriptorSet0.fp_c9)._m0[194].w, _131);
    float _139 = fma(_81, (*spvDescriptorSet0.fp_c9)._m0[194].w, _133);
    float _141 = fma(_135, 0.0040000001899898052215576171875, _137);
    float2 _673 = float2(_141, _139);
    float _143 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_673, float2(0.0), isnan(_673))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_673, float2(0.0), isnan(_673))).w;
    float _145 = in.m_39.y;
    float _147 = gl_FragCoord.w;
    float _149 = _145 * _147;
    float _151 = in.m_39.x;
    float _153 = gl_FragCoord.w;
    float _155 = _151 * _153;
    float _157 = _69 * _149;
    float _159 = fma(_143, 2.0, -1.0);
    float _161 = _115 * _159;
    float _163 = _69 * _155;
    float _165 = fma(_161, 0.0500000007450580596923828125, _157);
    float2 _712 = float2(_163, _165);
    float2 _167 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_712, float2(0.0), isnan(_712))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_712, float2(0.0), isnan(_712))).xw;
    float _169 = _167.x;
    float _171 = _167.y;
    float _173 = in.m_41.x;
    float _175 = gl_FragCoord.w;
    float _177 = _173 * _175;
    float _179 = _69 * _177;
    float _181 = _105 + (-0.20000000298023223876953125);
    float _183 = _181 * _181;
    float _185 = in.m_43.w;
    float _187 = gl_FragCoord.w;
    float _189 = _185 * _187;
    float _191 = 0.0 + _171;
    float _193 = precise::clamp(_191, 0.0, 1.0);
    float _195 = _193 * _179;
    bool _199 = _195 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _201 = isnan(_195);
    bool _203 = _199 || _201;
    bool _205 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _207 = _203 || _205;
    float _209 = in.m_37.x;
    float _211 = gl_FragCoord.w;
    float _213 = _209 * _211;
    if (!_207)
    {
        discard_fragment();
    }
    float _215 = _69 * _213;
    float _217 = _215 + (-0.5);
    float _219 = fma(_217, _217, _183);
    float _221 = sqrt(_219);
    float _223 = precise::max(_221, 0.119999997317790985107421875);
    float _225 = precise::min(_223, 0.60000002384185791015625);
    float _227 = fma(_225, 2.0833332538604736328125, -0.24999998509883880615234375);
    float _229 = fma(_225, -2.0833332538604736328125, 1.25);
    float _231 = -(*spvDescriptorSet0.fp_c9)._m0[107].w;
    float _233 = (*spvDescriptorSet0.fp_c9)._m0[108].w + _231;
    float _235 = _143 * _229;
    float _237 = 1.0 / _233;
    float _239 = precise::max(_235, 0.300000011920928955078125);
    float _241 = precise::min(_239, 0.5);
    float _243 = -_169;
    float _245 = fma(_243, _169, 1.0);
    float _247 = fma(_241, 5.000000476837158203125, -1.5000002384185791015625);
    float _249 = -(*spvDescriptorSet0.fp_c9)._m0[108].w;
    float _251 = _249 + (*spvDescriptorSet0.fp_c9)._m0[109].w;
    float _253 = -_245;
    float _255 = fma(_253, _227, 1.0);
    float _257 = _69 * _189;
    float _259 = -(*spvDescriptorSet0.fp_c9)._m0[109].w;
    float _261 = (*spvDescriptorSet0.fp_c9)._m0[110].w + _259;
    float _263 = fma(_143, _255, _247);
    float _265 = 1.0 / _251;
    float _267 = -(*spvDescriptorSet0.fp_c9)._m0[107].y;
    float _269 = (*spvDescriptorSet0.fp_c9)._m0[108].y + _267;
    float _271 = fma(_169, _169, _263);
    float _273 = precise::clamp(_271, 0.0, 1.0);
    float _275 = _273 * _257;
    float _277 = precise::clamp(_275, 0.0, 1.0);
    float _279 = 1.0 / _261;
    float _281 = -(*spvDescriptorSet0.fp_c9)._m0[107].w;
    float _283 = _277 + _281;
    float _285 = -(*spvDescriptorSet0.fp_c9)._m0[109].w;
    float _287 = _277 + _285;
    float _289 = _283 * _237;
    float _291 = -(*spvDescriptorSet0.fp_c9)._m0[108].w;
    float _293 = _277 + _291;
    float _295 = fma(_269, _289, (*spvDescriptorSet0.fp_c9)._m0[107].y);
    float _297 = _293 * _265;
    float _299 = -(*spvDescriptorSet0.fp_c9)._m0[107].z;
    float _301 = (*spvDescriptorSet0.fp_c9)._m0[108].z + _299;
    float _303 = -(*spvDescriptorSet0.fp_c9)._m0[107].x;
    float _305 = (*spvDescriptorSet0.fp_c9)._m0[108].x + _303;
    float _307 = -(*spvDescriptorSet0.fp_c9)._m0[108].y;
    float _309 = _307 + (*spvDescriptorSet0.fp_c9)._m0[109].y;
    float _311 = _287 * _279;
    float _313 = -(*spvDescriptorSet0.fp_c9)._m0[108].x;
    float _315 = _313 + (*spvDescriptorSet0.fp_c9)._m0[109].x;
    float _317 = -(*spvDescriptorSet0.fp_c9)._m0[108].z;
    float _319 = _317 + (*spvDescriptorSet0.fp_c9)._m0[109].z;
    bool _321 = _277 >= (*spvDescriptorSet0.fp_c9)._m0[108].w;
    bool _323 = isnan(_277);
    bool _325 = _321 || _323;
    bool _327 = isnan((*spvDescriptorSet0.fp_c9)._m0[108].w);
    bool _329 = _325 || _327;
    float _331 = float(_329);
    float _333 = fma(_301, _289, (*spvDescriptorSet0.fp_c9)._m0[107].z);
    bool _335 = _277 >= (*spvDescriptorSet0.fp_c9)._m0[109].w;
    bool _337 = isnan(_277);
    bool _339 = _335 || _337;
    bool _341 = isnan((*spvDescriptorSet0.fp_c9)._m0[109].w);
    bool _343 = _339 || _341;
    float _345 = float(_343);
    float _347 = fma(_315, _297, (*spvDescriptorSet0.fp_c9)._m0[108].x);
    float _349 = fma(_309, _297, (*spvDescriptorSet0.fp_c9)._m0[108].y);
    float _351 = fma(_319, _297, (*spvDescriptorSet0.fp_c9)._m0[108].z);
    bool _353 = _277 >= (*spvDescriptorSet0.fp_c9)._m0[107].w;
    bool _355 = isnan(_277);
    bool _357 = _353 || _355;
    bool _359 = isnan((*spvDescriptorSet0.fp_c9)._m0[107].w);
    bool _361 = _357 || _359;
    float _363 = float(_361);
    float _365 = -_331;
    float _367 = _365 + 1.0;
    float _369 = -_345;
    float _371 = _369 + 1.0;
    float _373 = fma(_305, _289, (*spvDescriptorSet0.fp_c9)._m0[107].x);
    float _375 = _363 * _367;
    float _377 = _331 * _371;
    bool _379 = _277 >= (*spvDescriptorSet0.fp_c9)._m0[110].w;
    bool _381 = isnan(_277);
    bool _383 = _379 || _381;
    bool _385 = isnan((*spvDescriptorSet0.fp_c9)._m0[110].w);
    bool _387 = _383 || _385;
    float _389 = float(_387);
    float _391 = -(*spvDescriptorSet0.fp_c9)._m0[109].y;
    float _393 = (*spvDescriptorSet0.fp_c9)._m0[110].y + _391;
    float _395 = -_363;
    float _397 = _395 + 1.0;
    float _399 = _373 * _375;
    float _401 = _295 * _375;
    float _403 = _333 * _375;
    float _405 = -(*spvDescriptorSet0.fp_c9)._m0[109].x;
    float _407 = (*spvDescriptorSet0.fp_c9)._m0[110].x + _405;
    float _409 = -_389;
    float _411 = _409 + 1.0;
    float _413 = fma(_397, (*spvDescriptorSet0.fp_c9)._m0[107].x, _399);
    float _415 = fma(_397, (*spvDescriptorSet0.fp_c9)._m0[107].y, _401);
    float _417 = -(*spvDescriptorSet0.fp_c9)._m0[109].z;
    float _419 = (*spvDescriptorSet0.fp_c9)._m0[110].z + _417;
    float _421 = fma(_397, (*spvDescriptorSet0.fp_c9)._m0[107].z, _403);
    float _423 = fma(_407, _311, (*spvDescriptorSet0.fp_c9)._m0[109].x);
    float _425 = _345 * _411;
    float _427 = fma(_347, _377, _413);
    float _429 = fma(_393, _311, (*spvDescriptorSet0.fp_c9)._m0[109].y);
    float _431 = fma(_349, _377, _415);
    float _433 = fma(_419, _311, (*spvDescriptorSet0.fp_c9)._m0[109].z);
    float _435 = fma(_351, _377, _421);
    float _437 = fma(_423, _425, _427);
    float _439 = fma(_429, _425, _431);
    float _441 = fma(_433, _425, _435);
    float _443 = fma(_389, (*spvDescriptorSet0.fp_c9)._m0[110].x, _437);
    float _445 = fma(_389, (*spvDescriptorSet0.fp_c9)._m0[110].y, _439);
    float _447 = fma(_389, (*spvDescriptorSet0.fp_c9)._m0[110].z, _441);
    if (!_207)
    {
        out.m_46.x = _443;
        out.m_46.y = _445;
        out.m_46.z = _447;
        out.m_46.w = _171;
        return out;
    }
    float _449 = in.m_48.w;
    float _451 = gl_FragCoord.w;
    float _453 = _449 * _451;
    float _455 = _69 * _453;
    bool _457 = _455 != 1.0;
    bool _459 = isnan(_455);
    bool _461 = _457 || _459;
    bool _463 = isnan(1.0);
    bool _465 = _461 || _463;
    bool _467 = !_465;
    if (!_467)
    {
        float _469 = gl_FragCoord.x;
        float _471 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _473 = _469 / _471;
        float _475 = gl_FragCoord.y;
        float _477 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _479 = _475 / _477;
        float _481 = _455 * 256.0;
        float _483 = trunc(_481);
        int _486 = int(_483);
        float _488 = trunc(_473);
        int _490 = int(_488);
        float _492 = trunc(_479);
        int _494 = int(_492);
        int _496 = _490 + 2;
        int _498 = _496 >> 1;
        uint _501 = uint(int(uint(_494) >> uint(1)));
        int _503 = _498 ^ int(_501);
        int _505 = _503 << 16;
        int _507 = _505 ^ _498;
        int _509 = 983055 & _507;
        int _511 = _509 << 6;
        int _513 = _511 + _509;
        int _515 = _513 & 13369548;
        uint _517 = uint(int(uint(_515) >> uint(3)));
        int _519 = _515 | int(_517);
        uint _521 = uint(int(uint(_486) >> uint(7)));
        int _523 = int(_521) + _486;
        int _525 = _519 & 5570560;
        int _527 = _519 & 85;
        uint _529 = uint(int(uint(_525) >> uint(15)));
        int _531 = int(_529) + _527;
        bool _533 = uint(_523) > uint(_531);
        if (!_533)
        {
            discard_fragment();
        }
        if (!_533)
        {
            out.m_46.x = _443;
            out.m_46.y = _445;
            out.m_46.z = _447;
            out.m_46.w = _195;
            return out;
        }
    }
    float _535 = 0.0 + _195;
    float _537 = precise::clamp(_535, 0.0, 1.0);
    out.m_46.x = 1.0;
    out.m_46.y = 1.0;
    out.m_46.z = 1.0;
    out.m_46.w = _537;
    return out;
}


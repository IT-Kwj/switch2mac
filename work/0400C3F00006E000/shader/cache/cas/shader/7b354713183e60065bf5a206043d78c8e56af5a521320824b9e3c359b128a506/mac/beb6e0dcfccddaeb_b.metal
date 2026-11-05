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
    constant _16* fp_c9 [[id(0)]];
    constant _16* fp_c15 [[id(1)]];
    constant _16* fp_c8 [[id(2)]];
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_A [[id(5)]];
    sampler fp_t_tcb_ASmplr [[id(6)]];
    texture2d<float> fp_t_tcb_C [[id(7)]];
    sampler fp_t_tcb_CSmplr [[id(8)]];
    sampler fp_t_tcb_8Smplr_w [[id(9)]];
    sampler fp_t_tcb_ASmplr_w [[id(10)]];
    sampler fp_t_tcb_CSmplr_w [[id(11)]];
    constant dm_border_t* dm_border [[id(12)]];
};

struct main0_out
{
    float4 m_50 [[color(0)]];
};

struct main0_in
{
    float4 m_41 [[user(locn0)]];
    float4 m_43 [[user(locn1)]];
    float4 m_54 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_37 [[user(locn4)]];
    float4 m_47 [[user(locn5)]];
    float4 m_39 [[user(locn6)]];
    float4 m_52 [[user(locn8)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _61 = gl_FragCoord.w;
    float _63 = in.m_37.x;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = in.m_37.w;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = in.m_37.y;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = in.m_37.z;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = in.m_39.x;
    float _89 = gl_FragCoord.w;
    float _91 = _87 * _89;
    float _93 = in.m_39.y;
    float _95 = gl_FragCoord.w;
    float _97 = _93 * _95;
    float _99 = 1.0 / _61;
    float _101 = _99 * _67;
    float _103 = _99 * _73;
    float _105 = _99 * _79;
    float _107 = _99 * _85;
    float _109 = _99 * _91;
    float _111 = _99 * _97;
    float2 _514 = float2(_101, _105);
    float _113 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_514, float2(0.0), isnan(_514))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_514, float2(0.0), isnan(_514))).w;
    float2 _525 = float2(_107, _103);
    float _115 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_525, float2(0.0), isnan(_525))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_525, float2(0.0), isnan(_525))).w;
    float2 _533 = float2(_109, _111);
    float _117 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_533, float2(0.0), isnan(_533))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_533, float2(0.0), isnan(_533))).w;
    float _119 = in.m_41.w;
    float _121 = gl_FragCoord.w;
    float _123 = _119 * _121;
    float _125 = in.m_43.w;
    float _127 = gl_FragCoord.w;
    float _129 = _125 * _127;
    float _131 = in.m_45.x;
    float _133 = gl_FragCoord.w;
    float _135 = _131 * _133;
    float _137 = _99 * _123;
    float _139 = _99 * _129;
    float _141 = _99 * _135;
    float _143 = in.m_47.w;
    float _145 = gl_FragCoord.w;
    float _147 = _143 * _145;
    float _149 = -_137;
    float _151 = fma(_113, _115, _149);
    float _153 = _117 * (*spvDescriptorSet0.fp_c9)._m0[194].w;
    float _155 = _151 * _139;
    float _157 = precise::clamp(_155, 0.0, 1.0);
    float _159 = 0.0 + _139;
    float _161 = precise::clamp(_159, 0.0, 1.0);
    float _163 = fma(_153, _161, _157);
    float _165 = precise::clamp(_163, 0.0, 1.0);
    float _167 = _165 * _141;
    bool _171 = _167 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _173 = isnan(_167);
    bool _175 = _171 || _173;
    bool _177 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _179 = _175 || _177;
    if (!_179)
    {
        discard_fragment();
    }
    float _181 = _99 * _147;
    float _183 = -(*spvDescriptorSet0.fp_c9)._m0[107].z;
    float _185 = (*spvDescriptorSet0.fp_c9)._m0[108].z + _183;
    float _187 = -(*spvDescriptorSet0.fp_c9)._m0[107].w;
    float _189 = (*spvDescriptorSet0.fp_c9)._m0[108].w + _187;
    float _191 = -(*spvDescriptorSet0.fp_c9)._m0[108].w;
    float _193 = _191 + (*spvDescriptorSet0.fp_c9)._m0[109].w;
    float _195 = 0.0 + _181;
    float _197 = precise::clamp(_195, 0.0, 1.0);
    float _199 = 1.0 / _189;
    float _201 = -(*spvDescriptorSet0.fp_c9)._m0[107].w;
    float _203 = _197 + _201;
    float _205 = -(*spvDescriptorSet0.fp_c9)._m0[108].w;
    float _207 = _197 + _205;
    float _209 = 1.0 / _193;
    float _211 = _203 * _199;
    float _213 = -(*spvDescriptorSet0.fp_c9)._m0[107].x;
    float _215 = (*spvDescriptorSet0.fp_c9)._m0[108].x + _213;
    float _217 = -(*spvDescriptorSet0.fp_c9)._m0[107].y;
    float _219 = (*spvDescriptorSet0.fp_c9)._m0[108].y + _217;
    float _221 = fma(_185, _211, (*spvDescriptorSet0.fp_c9)._m0[107].z);
    float _223 = fma(_215, _211, (*spvDescriptorSet0.fp_c9)._m0[107].x);
    float _225 = fma(_219, _211, (*spvDescriptorSet0.fp_c9)._m0[107].y);
    float _227 = _207 * _209;
    float _229 = -(*spvDescriptorSet0.fp_c9)._m0[108].x;
    float _231 = _229 + (*spvDescriptorSet0.fp_c9)._m0[109].x;
    float _233 = -(*spvDescriptorSet0.fp_c9)._m0[108].z;
    float _235 = _233 + (*spvDescriptorSet0.fp_c9)._m0[109].z;
    bool _237 = _197 >= (*spvDescriptorSet0.fp_c9)._m0[108].w;
    bool _239 = isnan(_197);
    bool _241 = _237 || _239;
    bool _243 = isnan((*spvDescriptorSet0.fp_c9)._m0[108].w);
    bool _245 = _241 || _243;
    float _247 = float(_245);
    float _249 = -(*spvDescriptorSet0.fp_c9)._m0[108].y;
    float _251 = _249 + (*spvDescriptorSet0.fp_c9)._m0[109].y;
    bool _253 = _197 >= (*spvDescriptorSet0.fp_c9)._m0[107].w;
    bool _255 = isnan(_197);
    bool _257 = _253 || _255;
    bool _259 = isnan((*spvDescriptorSet0.fp_c9)._m0[107].w);
    bool _261 = _257 || _259;
    float _263 = float(_261);
    float _265 = fma(_231, _227, (*spvDescriptorSet0.fp_c9)._m0[108].x);
    bool _267 = _197 >= (*spvDescriptorSet0.fp_c9)._m0[109].w;
    bool _269 = isnan(_197);
    bool _271 = _267 || _269;
    bool _273 = isnan((*spvDescriptorSet0.fp_c9)._m0[109].w);
    bool _275 = _271 || _273;
    float _277 = float(_275);
    float _279 = -_247;
    float _281 = _279 + 1.0;
    float _283 = fma(_251, _227, (*spvDescriptorSet0.fp_c9)._m0[108].y);
    float _285 = fma(_235, _227, (*spvDescriptorSet0.fp_c9)._m0[108].z);
    float _287 = _263 * _281;
    float _289 = -_263;
    float _291 = _289 + 1.0;
    float _293 = _223 * _287;
    float _295 = _225 * _287;
    float _297 = _221 * _287;
    float _299 = -_277;
    float _301 = _299 + 1.0;
    float _303 = fma(_291, (*spvDescriptorSet0.fp_c9)._m0[107].x, _293);
    float _305 = fma(_291, (*spvDescriptorSet0.fp_c9)._m0[107].y, _295);
    float _307 = fma(_291, (*spvDescriptorSet0.fp_c9)._m0[107].z, _297);
    float _309 = _247 * _301;
    float _311 = fma(_265, _309, _303);
    float _313 = fma(_283, _309, _305);
    float _315 = fma(_285, _309, _307);
    float _317 = fma(_277, (*spvDescriptorSet0.fp_c9)._m0[109].x, _311);
    float _319 = fma(_277, (*spvDescriptorSet0.fp_c9)._m0[109].y, _313);
    float _321 = fma(_277, (*spvDescriptorSet0.fp_c9)._m0[109].z, _315);
    float _323 = _317 * (*spvDescriptorSet0.fp_c9)._m0[106].x;
    float _325 = _319 * (*spvDescriptorSet0.fp_c9)._m0[106].x;
    float _327 = _321 * (*spvDescriptorSet0.fp_c9)._m0[106].x;
    if (!_179)
    {
        out.m_50.x = _323;
        out.m_50.y = _325;
        out.m_50.z = _327;
        out.m_50.w = _165;
        return out;
    }
    float _329 = _325 * 0.715200006961822509765625;
    float _331 = in.m_52.w;
    float _333 = gl_FragCoord.w;
    float _335 = _331 * _333;
    float _337 = in.m_52.z;
    float _339 = gl_FragCoord.w;
    float _341 = _337 * _339;
    float _343 = in.m_52.x;
    float _345 = gl_FragCoord.w;
    float _347 = _343 * _345;
    float _349 = fma(_323, 0.2125999927520751953125, _329);
    float _351 = in.m_52.y;
    float _353 = gl_FragCoord.w;
    float _355 = _351 * _353;
    float _357 = fma(_327, 0.072200000286102294921875, _349);
    bool _359 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _361 = 1.0 / _357;
    float _363 = _361 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _365 = precise::clamp(_363, 0.0, 1.0);
    float _367 = _99 * _335;
    float _369 = fma(_365, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _371 = _99 * _341;
    float _373 = _369 * _367;
    float _375 = 0.0 + _167;
    float _377 = precise::clamp(_375, 0.0, 1.0);
    float _379 = _99 * _347;
    float _381 = _99 * _355;
    float _383 = fma(_327, _373, _371);
    float _385 = fma(_323, _373, _379);
    float _387 = fma(_325, _373, _381);
    float _389 = _371;
    if (!_359)
    {
        _389 = _377;
    }
    float _391 = _389;
    bool _393 = !_359;
    float _395 = _391;
    if (!_393)
    {
        float _397 = in.m_54.w;
        float _399 = gl_FragCoord.w;
        float _401 = _397 * _399;
        float _403 = in.m_54.z;
        float _405 = gl_FragCoord.w;
        float _407 = _403 * _405;
        float _409 = _99 * _401;
        float _411 = _99 * _407;
        float _413 = 1.0 / _409;
        float _415 = _411 * _413;
        float _417 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _419 = fma(_415, (*spvDescriptorSet0.fp_c8)._m0[30].w, _417);
        float _421 = 1.0 / _419;
        float _423 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _425 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _427 = fma(_421, _423, _425);
        float _429 = _427 * 8.0;
        float _431 = precise::clamp(_429, 0.0, 1.0);
        float _433 = _377 * _431;
        _395 = _433;
    }
    float _435 = _395;
    float _437 = 0.0 + _435;
    float _439 = precise::clamp(_437, 0.0, 1.0);
    out.m_50.x = _385;
    out.m_50.y = _387;
    out.m_50.z = _383;
    out.m_50.w = _439;
    return out;
}


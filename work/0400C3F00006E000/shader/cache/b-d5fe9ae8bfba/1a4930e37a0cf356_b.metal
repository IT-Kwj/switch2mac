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
    constant _16* fp_c10 [[id(1)]];
    constant _16* fp_c15 [[id(2)]];
    constant _16* fp_c8 [[id(3)]];
    texture2d<float> fp_t_tcb_A [[id(4)]];
    sampler fp_t_tcb_ASmplr [[id(5)]];
    sampler fp_t_tcb_ASmplr_w [[id(6)]];
    constant dm_border_t* dm_border [[id(7)]];
};

struct main0_out
{
    float4 m_46 [[color(0)]];
};

struct main0_in
{
    float4 m_39 [[user(locn0)]];
    float4 m_37 [[user(locn1), flat]];
    float4 m_48 [[user(locn2)]];
    float4 m_41 [[user(locn3)]];
    float4 m_35 [[user(locn4)]];
    float4 m_43 [[user(locn6)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _55 = gl_FragCoord.w;
    float _57 = in.m_35.y;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = in.m_35.x;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = in.m_37.z;
    float _71 = in.m_39.w;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = in.m_41.x;
    float _79 = gl_FragCoord.w;
    float _81 = _77 * _79;
    float _83 = 1.0 / _55;
    float _85 = _69 * 0.3499999940395355224609375;
    float _87 = 1.0 / _85;
    float _89 = _83 * _61;
    float _91 = _83 * _67;
    float _93 = _89 * _89;
    float _95 = _91 + _89;
    float _97 = -_91;
    float _99 = _97 + _89;
    float _101 = fma(_91, _91, _93);
    float _103 = abs(_95);
    float _105 = -_103;
    float _107 = _105 + 1.0;
    float _109 = abs(_99);
    float _111 = -_109;
    float _113 = _111 + 1.0;
    float _115 = _107 * _107;
    float _117 = sqrt(_101);
    float _119 = _115 * _115;
    float _121 = _119 * _119;
    float _123 = -_85;
    float _125 = _117 + _123;
    float _127 = _117 * _87;
    float _129 = precise::clamp(_127, 0.0, 1.0);
    float _131 = _117 * 1.41421401500701904296875;
    float _133 = precise::clamp(_131, 0.0, 1.0);
    float _135 = _117 * 2.0;
    float _137 = precise::clamp(_135, 0.0, 1.0);
    float _139 = _125 * _87;
    float _141 = precise::clamp(_139, 0.0, 1.0);
    float _143 = -_133;
    float _145 = _143 + 1.0;
    float _147 = -_137;
    float _149 = _147 + 1.0;
    float _151 = -_141;
    float _153 = _151 + 1.0;
    float _155 = _145 * _145;
    float _157 = _129 * _153;
    float _159 = _113 * _113;
    float _161 = -_69;
    float _163 = _161 + 1.0;
    float _165 = _121 * _121;
    float _167 = _157 * _157;
    float _169 = _159 * _159;
    float _171 = _155 * _155;
    float _173 = _167 * _167;
    float _175 = _173 * 0.5;
    float _177 = _169 * _169;
    float _179 = _175 * _163;
    float _181 = fma(_177, _177, _165);
    float _183 = _149 * _149;
    float _185 = _83 * _75;
    float _187 = _83 * _81;
    float _189 = _171 * _181;
    float _191 = -_179;
    float _193 = _191 + 1.0;
    float _195 = fma(_189, _193, _179);
    float _197 = precise::clamp(_195, 0.0, 1.0);
    float _199 = -_183;
    float _201 = _199 + 1.0;
    float _203 = fma(_197, _201, _183);
    float _205 = _185 * _203;
    float _207 = precise::clamp(_205, 0.0, 1.0);
    float _209 = _207 * _187;
    bool _213 = _209 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _215 = isnan(_209);
    bool _217 = _213 || _215;
    bool _219 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _221 = _217 || _219;
    float _223 = in.m_43.y;
    float _225 = gl_FragCoord.w;
    float _227 = _223 * _225;
    float _229 = in.m_43.x;
    float _231 = gl_FragCoord.w;
    float _233 = _229 * _231;
    float _235 = in.m_43.z;
    float _237 = gl_FragCoord.w;
    float _239 = _235 * _237;
    if (!_221)
    {
        discard_fragment();
    }
    float _241 = _83 * _227;
    float _243 = _83 * _233;
    float _245 = -_241;
    float _247 = _245 + (*spvDescriptorSet0.fp_c10)._m0[9].w;
    float _249 = _83 * _239;
    float _251 = -_243;
    float _253 = _251 + (*spvDescriptorSet0.fp_c10)._m0[8].w;
    float _255 = _247 * _247;
    float _257 = -_249;
    float _259 = _257 + (*spvDescriptorSet0.fp_c10)._m0[10].w;
    float _261 = fma(_253, _253, _255);
    float _263 = -(*spvDescriptorSet0.fp_c9)._m0[194].z;
    float _265 = (*spvDescriptorSet0.fp_c9)._m0[194].w + _263;
    float _267 = fma(_259, _259, _261);
    float _269 = 1.0 / _265;
    float _271 = sqrt(_267);
    float _273 = precise::max(_271, (*spvDescriptorSet0.fp_c9)._m0[194].z);
    float _275 = precise::min(_273, (*spvDescriptorSet0.fp_c9)._m0[194].w);
    float _277 = -(*spvDescriptorSet0.fp_c9)._m0[194].z;
    float _279 = _275 + _277;
    float _281 = -_279;
    float _283 = fma(_281, _269, 1.0);
    float2 _744 = float2(0.5, _283);
    float3 _287 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_744, float2(0.0), isnan(_744))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_744, float2(0.0), isnan(_744))).xyz;
    float _289 = _287.x;
    float _291 = _287.y;
    float _293 = _287.z;
    float _295 = in.m_39.x;
    float _297 = gl_FragCoord.w;
    float _299 = _295 * _297;
    float _301 = in.m_39.y;
    float _303 = gl_FragCoord.w;
    float _305 = _301 * _303;
    float _307 = in.m_39.z;
    float _309 = gl_FragCoord.w;
    float _311 = _307 * _309;
    float _313 = _83 * _299;
    float _315 = _83 * _305;
    float _317 = _83 * _311;
    float _319 = _291 * (*spvDescriptorSet0.fp_c9)._m0[194].y;
    float _321 = _289 * (*spvDescriptorSet0.fp_c9)._m0[194].y;
    float _323 = _293 * (*spvDescriptorSet0.fp_c9)._m0[194].y;
    float _325 = -_319;
    float _327 = _325 + _315;
    float _329 = -_321;
    float _331 = _329 + _313;
    float _333 = -_323;
    float _335 = _333 + _317;
    float _337 = fma(_197, _327, _319);
    float _339 = fma(_197, _331, _321);
    float _341 = fma(_197, _335, _323);
    if (!_221)
    {
        out.m_46.x = _339;
        out.m_46.y = _337;
        out.m_46.z = _341;
        out.m_46.w = _207;
        return out;
    }
    float _343 = _337 * 0.715200006961822509765625;
    float _345 = 0.0 + _209;
    float _347 = precise::clamp(_345, 0.0, 1.0);
    float _349 = fma(_339, 0.2125999927520751953125, _343);
    bool _351 = 0.5 <= (*spvDescriptorSet0.fp_c15)._m0[653].w;
    float _353 = fma(_341, 0.072200000286102294921875, _349);
    float _355 = 1.0 / _353;
    float _357 = _355 * (*spvDescriptorSet0.fp_c15)._m0[661].z;
    float _359 = precise::clamp(_357, 0.0, 1.0);
    float _361 = fma(_359, (*spvDescriptorSet0.fp_c15)._m0[661].y, (*spvDescriptorSet0.fp_c15)._m0[661].x);
    float _363 = _339 * _361;
    float _365 = _337 * _361;
    float _367 = _341 * _361;
    float _369 = _361;
    if (!_351)
    {
        _369 = _347;
    }
    float _371 = _369;
    bool _373 = !_351;
    float _375 = _371;
    if (!_373)
    {
        float _377 = in.m_48.w;
        float _379 = gl_FragCoord.w;
        float _381 = _377 * _379;
        float _383 = in.m_48.z;
        float _385 = gl_FragCoord.w;
        float _387 = _383 * _385;
        float _389 = _83 * _381;
        float _391 = _83 * _387;
        float _393 = 1.0 / _389;
        float _395 = _391 * _393;
        float _397 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _399 = fma(_395, (*spvDescriptorSet0.fp_c8)._m0[30].w, _397);
        float _401 = 1.0 / _399;
        float _403 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _405 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _407 = fma(_401, _403, _405);
        float _409 = _407 * 8.0;
        float _411 = precise::clamp(_409, 0.0, 1.0);
        float _413 = _347 * _411;
        _375 = _413;
    }
    float _415 = _375;
    float _417 = 0.0 + _415;
    float _419 = precise::clamp(_417, 0.0, 1.0);
    out.m_46.x = _363;
    out.m_46.y = _365;
    out.m_46.z = _367;
    out.m_46.w = _419;
    return out;
}


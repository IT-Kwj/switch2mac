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
    texture2d<float> fp_t_tcb_C [[id(3)]];
    sampler fp_t_tcb_CSmplr [[id(4)]];
    texture2d<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    sampler fp_t_tcb_CSmplr_w [[id(7)]];
    sampler fp_t_tcb_8Smplr_w [[id(8)]];
    constant dm_border_t* dm_border [[id(9)]];
};

struct main0_out
{
    float4 m_50 [[color(0)]];
};

struct main0_in
{
    float4 m_43 [[user(locn0)]];
    float4 m_45 [[user(locn1)]];
    float4 m_47 [[user(locn2)]];
    float4 m_39 [[user(locn3)]];
    float4 m_41 [[user(locn4)]];
    float4 m_37 [[user(locn5), flat]];
    float4 m_54 [[user(locn6)]];
    float4 m_35 [[user(locn7)]];
    float4 m_52 [[user(locn9)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _61 = gl_FragCoord.w;
    float _63 = in.m_35.x;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = in.m_35.y;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = 1.0 / _61;
    float _77 = _75 * _67;
    float _79 = _75 * _73;
    float2 _415 = float2(_77, _79);
    float _81 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_415, float2(0.0), isnan(_415))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_415, float2(0.0), isnan(_415))).x;
    float _83 = in.m_37.x;
    float _85 = in.m_39.x;
    float _87 = gl_FragCoord.w;
    float _89 = _85 * _87;
    float _91 = in.m_39.y;
    float _93 = gl_FragCoord.w;
    float _95 = _91 * _93;
    float _97 = _83 * (*spvDescriptorSet0.fp_c9)._m0[191].y;
    float _99 = _75 * _89;
    float _101 = _75 * _95;
    float _103 = fma(_81, 2.0, -1.0);
    float _105 = fma(_103, _97, _99);
    float _107 = fma(_103, _97, _101);
    float2 _467 = float2(_105, _107);
    float _109 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_467, float2(0.0), isnan(_467))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_467, float2(0.0), isnan(_467))).x;
    float _111 = in.m_41.y;
    float _113 = gl_FragCoord.w;
    float _115 = _111 * _113;
    float _117 = in.m_41.x;
    float _119 = gl_FragCoord.w;
    float _121 = _117 * _119;
    float _123 = in.m_39.w;
    float _125 = gl_FragCoord.w;
    float _127 = _123 * _125;
    float _129 = in.m_43.w;
    float _131 = gl_FragCoord.w;
    float _133 = _129 * _131;
    float _135 = in.m_45.w;
    float _137 = gl_FragCoord.w;
    float _139 = _135 * _137;
    float _141 = in.m_47.x;
    float _143 = gl_FragCoord.w;
    float _145 = _141 * _143;
    float _147 = _75 * _115;
    float _149 = _75 * _127;
    float _151 = precise::max(_147, -0.20000000298023223876953125);
    float _153 = _75 * _121;
    float _155 = precise::min(_151, 1.0);
    float _157 = -_153;
    float _159 = fma(_157, _153, 1.0);
    float _161 = in.m_43.x;
    float _163 = gl_FragCoord.w;
    float _165 = _161 * _163;
    float _167 = _75 * _165;
    float _169 = fma(_109, 2.0, -1.0);
    float _171 = fma(_169, (*spvDescriptorSet0.fp_c9)._m0[191].x, _149);
    float _173 = fma(_155, 0.833333313465118408203125, 0.16666667163372039794921875);
    float _175 = _75 * _139;
    float _177 = _159 * _171;
    float _179 = _75 * _133;
    float _181 = -_179;
    float _183 = fma(_177, _173, _181);
    float _185 = _175 * _183;
    float _187 = _75 * _145;
    float _189 = 0.0 + _185;
    float _191 = precise::clamp(_189, 0.0, 1.0);
    float _193 = _191 * _187;
    bool _197 = _193 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _199 = isnan(_193);
    bool _201 = _197 || _199;
    bool _203 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _205 = _201 || _203;
    float _207 = in.m_45.x;
    float _209 = gl_FragCoord.w;
    float _211 = _207 * _209;
    float _213 = in.m_45.y;
    float _215 = gl_FragCoord.w;
    float _217 = _213 * _215;
    float _219 = in.m_43.y;
    float _221 = gl_FragCoord.w;
    float _223 = _219 * _221;
    float _225 = in.m_45.z;
    float _227 = gl_FragCoord.w;
    float _229 = _225 * _227;
    float _231 = in.m_43.z;
    float _233 = gl_FragCoord.w;
    float _235 = _231 * _233;
    if (!_205)
    {
        discard_fragment();
    }
    float _237 = -_177;
    float _239 = fma(_149, _149, _237);
    float _241 = fma(_239, 0.75, _177);
    float _243 = _75 * _211;
    float _245 = _75 * _217;
    float _247 = _75 * _223;
    float _249 = _75 * _229;
    float _251 = _75 * _235;
    float _253 = -_243;
    float _255 = _253 + _167;
    float _257 = -_245;
    float _259 = _257 + _247;
    float _261 = -_249;
    float _263 = _261 + _251;
    float _265 = fma(_241, _255, _243);
    float _267 = fma(_241, _259, _245);
    float _269 = fma(_241, _263, _249);
    if (!_205)
    {
        out.m_50.x = _265;
        out.m_50.y = _267;
        out.m_50.z = _269;
        out.m_50.w = _185;
        return out;
    }
    float _271 = _267 * 0.715200006961822509765625;
    float _273 = in.m_52.w;
    float _275 = gl_FragCoord.w;
    float _277 = _273 * _275;
    float _279 = in.m_52.z;
    float _281 = gl_FragCoord.w;
    float _283 = _279 * _281;
    float _285 = in.m_52.x;
    float _287 = gl_FragCoord.w;
    float _289 = _285 * _287;
    float _291 = fma(_265, 0.2125999927520751953125, _271);
    float _293 = in.m_52.y;
    float _295 = gl_FragCoord.w;
    float _297 = _293 * _295;
    float _299 = fma(_269, 0.072200000286102294921875, _291);
    bool _301 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _303 = 1.0 / _299;
    float _305 = _303 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _307 = precise::clamp(_305, 0.0, 1.0);
    float _309 = _75 * _277;
    float _311 = fma(_307, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _313 = _75 * _283;
    float _315 = _311 * _309;
    float _317 = 0.0 + _193;
    float _319 = precise::clamp(_317, 0.0, 1.0);
    float _321 = _75 * _289;
    float _323 = _75 * _297;
    float _325 = fma(_269, _315, _313);
    float _327 = fma(_265, _315, _321);
    float _329 = fma(_267, _315, _323);
    float _331 = _313;
    if (!_301)
    {
        _331 = _319;
    }
    float _333 = _331;
    bool _335 = !_301;
    float _337 = _333;
    if (!_335)
    {
        float _339 = in.m_54.w;
        float _341 = gl_FragCoord.w;
        float _343 = _339 * _341;
        float _345 = in.m_54.z;
        float _347 = gl_FragCoord.w;
        float _349 = _345 * _347;
        float _351 = _75 * _343;
        float _353 = _75 * _349;
        float _355 = 1.0 / _351;
        float _357 = _353 * _355;
        float _359 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _361 = fma(_357, (*spvDescriptorSet0.fp_c8)._m0[30].w, _359);
        float _363 = 1.0 / _361;
        float _365 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _367 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _369 = fma(_363, _365, _367);
        float _371 = _369 * 8.0;
        float _373 = precise::clamp(_371, 0.0, 1.0);
        float _375 = _319 * _373;
        _337 = _375;
    }
    float _377 = _337;
    float _379 = 0.0 + _377;
    float _381 = precise::clamp(_379, 0.0, 1.0);
    out.m_50.x = _327;
    out.m_50.y = _329;
    out.m_50.z = _325;
    out.m_50.w = _381;
    return out;
}


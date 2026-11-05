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
    sampler fp_t_tcb_8Smplr_w [[id(7)]];
    sampler fp_t_tcb_ASmplr_w [[id(8)]];
    constant dm_border_t* dm_border [[id(9)]];
};

struct main0_out
{
    float4 m_44 [[color(0)]];
};

struct main0_in
{
    float4 m_39 [[user(locn0)]];
    float4 m_37 [[user(locn1)]];
    float4 m_46 [[user(locn2)]];
    float4 m_41 [[user(locn3)]];
    float4 m_35 [[user(locn4)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _53 = gl_FragCoord.w;
    float _55 = in.m_35.y;
    float _57 = gl_FragCoord.w;
    float _59 = _55 * _57;
    float _61 = in.m_35.x;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = 1.0 / _53;
    float _69 = _67 * _59;
    float _71 = _67 * _65;
    float _73 = fma(_69, 0.707106769084930419921875, -0.3535533845424652099609375);
    float _75 = fma(_71, 0.707106769084930419921875, -0.3535533845424652099609375);
    float _77 = _71 + (-0.5);
    float _79 = -_73;
    float _81 = _75 + _79;
    float _83 = fma(_77, 0.707106769084930419921875, _73);
    float _85 = _81 + 0.5;
    float _87 = _83 + 0.5;
    float2 _405;
    _405.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_85, _87));
    _405.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_85, _87));
    float _89 = _405.x;
    float _91 = _89 * 256.0;
    int _94 = int(_91);
    float _96 = in.m_35.z;
    float _98 = gl_FragCoord.w;
    float _100 = _96 * _98;
    float _102 = in.m_35.w;
    float _104 = gl_FragCoord.w;
    float _106 = _102 * _104;
    float _108 = _67 * _106;
    float _110 = float(uint(_94));
    float _112 = _110 * 0.00390625;
    float _114 = precise::min(_112, 2.0);
    float _116 = _67 * _100;
    float2 _445 = float2(_85, _87);
    float _118 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_445, float2(0.0), isnan(_445)), level(_114)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_445, float2(0.0), isnan(_445)), level(_114)).w;
    float2 _457 = float2(_116, _108);
    float4 _121 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_457, float2(0.0), isnan(_457))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_457, float2(0.0), isnan(_457))).xyzw;
    float _123 = _121.x;
    float _125 = _121.y;
    float _127 = _121.z;
    float _129 = _121.w;
    float _131 = in.m_37.w;
    float _133 = gl_FragCoord.w;
    float _135 = _131 * _133;
    float _137 = in.m_39.w;
    float _139 = gl_FragCoord.w;
    float _141 = _137 * _139;
    float _143 = in.m_41.x;
    float _145 = gl_FragCoord.w;
    float _147 = _143 * _145;
    float _149 = _67 * _135;
    float _151 = fma(_149, 0.23999999463558197021484375, 0.00999999977648258209228515625);
    float _153 = in.m_37.z;
    float _155 = gl_FragCoord.w;
    float _157 = _153 * _155;
    float _159 = in.m_39.y;
    float _161 = gl_FragCoord.w;
    float _163 = _159 * _161;
    float _165 = in.m_39.z;
    float _167 = gl_FragCoord.w;
    float _169 = _165 * _167;
    bool _173 = _118 >= _151;
    bool _175 = isnan(_118);
    bool _177 = _173 || _175;
    bool _179 = isnan(_151);
    bool _181 = _177 || _179;
    float _183 = float(_181);
    float _185 = _67 * _141;
    float _187 = _67 * _147;
    float _189 = fma(_129, _185, _183);
    float _191 = precise::clamp(_189, 0.0, 1.0);
    float _193 = _191 * _187;
    bool _195 = _193 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _197 = isnan(_193);
    bool _199 = _195 || _197;
    bool _201 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _203 = _199 || _201;
    float _205 = in.m_37.y;
    float _207 = gl_FragCoord.w;
    float _209 = _205 * _207;
    float _211 = in.m_37.x;
    float _213 = gl_FragCoord.w;
    float _215 = _211 * _213;
    float _217 = in.m_39.x;
    float _219 = gl_FragCoord.w;
    float _221 = _217 * _219;
    if (!_203)
    {
        discard_fragment();
    }
    float _223 = _123 * _123;
    float _225 = _125 * _125;
    float _227 = _127 * _127;
    float _229 = _223 * _223;
    float _231 = _225 * _225;
    float _233 = -_229;
    float _235 = _233 + 1.0;
    float _237 = _67 * _209;
    float _239 = _227 * _227;
    float _241 = _67 * _157;
    float _243 = _67 * _215;
    float _245 = -_231;
    float _247 = _245 + 1.0;
    float _249 = -_239;
    float _251 = _249 + 1.0;
    float _253 = _243 * _235;
    float _255 = _237 * _247;
    float _257 = _241 * _251;
    float _259 = _67 * _221;
    float _261 = _67 * _163;
    float _263 = _67 * _169;
    float _265 = fma(_229, _259, _253);
    float _267 = fma(_231, _261, _255);
    float _269 = fma(_239, _263, _257);
    if (!_203)
    {
        out.m_44.x = _265;
        out.m_44.y = _267;
        out.m_44.z = _269;
        out.m_44.w = _191;
        return out;
    }
    float _271 = _267 * 0.715200006961822509765625;
    float _273 = 0.0 + _193;
    float _275 = precise::clamp(_273, 0.0, 1.0);
    float _277 = fma(_265, 0.2125999927520751953125, _271);
    bool _279 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _281 = fma(_269, 0.072200000286102294921875, _277);
    float _283 = 1.0 / _281;
    float _285 = _283 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _287 = precise::clamp(_285, 0.0, 1.0);
    float _289 = fma(_287, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _291 = _265 * _289;
    float _293 = _267 * _289;
    float _295 = _269 * _289;
    float _297 = _289;
    if (!_279)
    {
        _297 = _275;
    }
    float _299 = _297;
    bool _301 = !_279;
    float _303 = _299;
    if (!_301)
    {
        float _305 = in.m_46.w;
        float _307 = gl_FragCoord.w;
        float _309 = _305 * _307;
        float _311 = in.m_46.z;
        float _313 = gl_FragCoord.w;
        float _315 = _311 * _313;
        float _317 = _67 * _309;
        float _319 = _67 * _315;
        float _321 = 1.0 / _317;
        float _323 = _319 * _321;
        float _325 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _327 = fma(_323, (*spvDescriptorSet0.fp_c8)._m0[30].w, _325);
        float _329 = 1.0 / _327;
        float _331 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _333 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _335 = fma(_329, _331, _333);
        float _337 = _335 * 8.0;
        float _339 = precise::clamp(_337, 0.0, 1.0);
        float _341 = _275 * _339;
        _303 = _341;
    }
    float _343 = _303;
    float _345 = 0.0 + _343;
    float _347 = precise::clamp(_345, 0.0, 1.0);
    out.m_44.x = _291;
    out.m_44.y = _293;
    out.m_44.z = _295;
    out.m_44.w = _347;
    return out;
}


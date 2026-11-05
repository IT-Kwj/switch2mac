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
    constant _16* fp_c3 [[id(0)]];
    texture2d<float> fp_t_tcb_8 [[id(1)]];
    sampler fp_t_tcb_8Smplr [[id(2)]];
    texture2d<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    sampler fp_t_tcb_8Smplr_w [[id(5)]];
    sampler fp_t_tcb_ASmplr_w [[id(6)]];
    constant dm_border_t* dm_border [[id(7)]];
};

struct main0_out
{
    float4 m_34 [[color(0)]];
};

struct main0_in
{
    float4 m_31 [[user(locn0)]];
    float4 m_36 [[user(locn1)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _43 = gl_FragCoord.w;
    float _45 = in.m_31.x;
    float _47 = gl_FragCoord.w;
    float _49 = _45 * _47;
    float _51 = in.m_31.y;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = 1.0 / _43;
    float _59 = _57 * _49;
    float _61 = _57 * _55;
    float2 _335 = float2(_59, _61);
    float _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_335, float2(0.0), isnan(_335))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_335, float2(0.0), isnan(_335))).x;
    float _65 = -_63;
    float _67 = fma(_65, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].x);
    float _69 = 1.0 / _67;
    bool _73 = _69 >= (*spvDescriptorSet0.fp_c3)._m0[0].z;
    if (_73)
    {
        discard_fragment();
    }
    if (_73)
    {
        out.m_34.x = 0.0;
        out.m_34.y = 0.0;
        out.m_34.z = 0.0;
        out.m_34.w = 0.0;
        return out;
    }
    float _75 = in.m_36.z;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = in.m_36.x;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = in.m_36.y;
    float _89 = gl_FragCoord.w;
    float _91 = _87 * _89;
    float _93 = fma(_69, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _95 = precise::clamp(_93, 0.0, 1.0);
    float _97 = fma(_69, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _99 = precise::clamp(_97, 0.0, 1.0);
    float _101 = _57 * _79;
    float _103 = precise::max(_95, _101);
    bool _105 = _103 != 0.0;
    bool _107 = isnan(_103);
    bool _109 = _105 || _107;
    bool _111 = isnan(0.0);
    bool _113 = _109 || _111;
    float _115 = fma(_69, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _117 = precise::clamp(_115, 0.0, 1.0);
    float _119 = _57 * _85;
    float _121 = _57 * _91;
    float _123 = precise::min(_99, _117);
    bool _125 = !_113;
    if (!_125)
    {
        float _127 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _129 = fma(_103, _127, 1.0);
        float _131 = log2(_129);
        float _133 = _131 + (-1.0);
        float _135 = exp2(_133);
        float _137 = _135 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
        float _139 = fma(_137, (*spvDescriptorSet0.fp_c3)._m0[8].x, _59);
        float _141 = fma(_137, (*spvDescriptorSet0.fp_c3)._m0[8].y, _61);
        float _143 = -_137;
        float _145 = fma(_143, (*spvDescriptorSet0.fp_c3)._m0[8].x, _59);
        float _147 = -_137;
        float _149 = fma(_147, (*spvDescriptorSet0.fp_c3)._m0[8].y, _61);
        float _151 = fma(_137, (*spvDescriptorSet0.fp_c3)._m0[8].z, _59);
        float _153 = fma(_137, (*spvDescriptorSet0.fp_c3)._m0[8].w, _61);
        float _155 = -_137;
        float _157 = fma(_155, (*spvDescriptorSet0.fp_c3)._m0[8].w, _61);
        float _159 = -_137;
        float _161 = fma(_159, (*spvDescriptorSet0.fp_c3)._m0[8].z, _59);
        float2 _519 = float2(_139, _141);
        float3 _165 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_519, float2(0.0), isnan(_519)), level(_133)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_519, float2(0.0), isnan(_519)), level(_133)).xyz;
        float _167 = _165.x;
        float _169 = _165.y;
        float _171 = _165.z;
        float2 _534 = float2(_145, _149);
        float3 _173 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_534, float2(0.0), isnan(_534)), level(_133)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_534, float2(0.0), isnan(_534)), level(_133)).xyz;
        float _175 = _173.x;
        float _177 = _173.y;
        float _179 = _173.z;
        float2 _549 = float2(_151, _153);
        float3 _181 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_549, float2(0.0), isnan(_549)), level(_133)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_549, float2(0.0), isnan(_549)), level(_133)).xyz;
        float _183 = _181.x;
        float _185 = _181.y;
        float _187 = _181.z;
        float2 _564 = float2(_161, _157);
        float3 _189 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_564, float2(0.0), isnan(_564)), level(_133)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_564, float2(0.0), isnan(_564)), level(_133)).xyz;
        float _191 = _189.x;
        float _193 = _189.y;
        float _195 = _189.z;
        float _197 = _123 * (*spvDescriptorSet0.fp_c3)._m0[0].w;
        float _199 = _169 + _177;
        float _201 = _167 + _175;
        float _203 = _171 + _179;
        float _205 = _199 + _185;
        float _207 = _201 + _183;
        float _209 = _203 + _187;
        float _211 = _205 + _193;
        float _213 = _207 + _191;
        float _215 = _209 + _195;
        float _217 = _211 * 0.14665000140666961669921875;
        float _219 = _211 * 0.25;
        float _221 = fma(_213, 0.0747250020503997802734375, _217);
        float _223 = _213 * 0.25;
        float _225 = fma(_215, 0.028599999845027923583984375, _221);
        float _227 = _215 * 0.25;
        float _229 = -_223;
        float _231 = _229 + _225;
        float _233 = -_219;
        float _235 = _233 + _225;
        float _237 = -_227;
        float _239 = _237 + _225;
        float _241 = fma(_197, _231, _223);
        float _243 = 0.0 + _131;
        float _245 = precise::clamp(_243, 0.0, 1.0);
        float _247 = fma(_197, _235, _219);
        float _249 = fma(_197, _239, _227);
        float _251 = -_241;
        float _253 = fma(_241, (*spvDescriptorSet0.fp_c3)._m0[13].x, _251);
        float _255 = fma(_121, _245, _119);
        float _257 = -_247;
        float _259 = fma(_247, (*spvDescriptorSet0.fp_c3)._m0[13].y, _257);
        float _261 = -_249;
        float _263 = fma(_249, (*spvDescriptorSet0.fp_c3)._m0[13].z, _261);
        float _265 = fma(_123, _253, _241);
        float _267 = 1.0 / _255;
        float _269 = fma(_123, _259, _247);
        float _271 = fma(_123, _263, _249);
        float _273 = _245 * _265;
        float _275 = _245 * _269;
        float _277 = _245 * _271;
        float _279 = -_273;
        float _281 = _279 + (*spvDescriptorSet0.fp_c3)._m0[12].x;
        float _283 = -_275;
        float _285 = _283 + (*spvDescriptorSet0.fp_c3)._m0[12].y;
        float _287 = -_277;
        float _289 = _287 + (*spvDescriptorSet0.fp_c3)._m0[12].z;
        float _291 = fma(_119, _281, _273);
        float _293 = fma(_119, _285, _275);
        float _295 = fma(_119, _289, _277);
        float _297 = _291 * _267;
        float _299 = _293 * _267;
        float _301 = _295 * _267;
        out.m_34.x = _297;
        out.m_34.y = _299;
        out.m_34.z = _301;
        out.m_34.w = _255;
        return out;
    }
    out.m_34.x = (*spvDescriptorSet0.fp_c3)._m0[12].x;
    out.m_34.y = (*spvDescriptorSet0.fp_c3)._m0[12].y;
    out.m_34.z = (*spvDescriptorSet0.fp_c3)._m0[12].z;
    out.m_34.w = _119;
    return out;
}


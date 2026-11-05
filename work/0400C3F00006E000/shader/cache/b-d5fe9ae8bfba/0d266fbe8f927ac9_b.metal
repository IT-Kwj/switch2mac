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
    float2 _303 = float2(_59, _61);
    float _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_303, float2(0.0), isnan(_303))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_303, float2(0.0), isnan(_303))).x;
    bool _67 = _63 >= (*spvDescriptorSet0.fp_c3)._m0[0].z;
    if (_67)
    {
        discard_fragment();
    }
    if (_67)
    {
        out.m_34.x = 0.0;
        out.m_34.y = 0.0;
        out.m_34.z = 0.0;
        out.m_34.w = 0.0;
        return out;
    }
    float _69 = in.m_36.z;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = in.m_36.x;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = in.m_36.y;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = fma(_63, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _89 = precise::clamp(_87, 0.0, 1.0);
    float _91 = fma(_63, (*spvDescriptorSet0.fp_c3)._m0[4].y, (*spvDescriptorSet0.fp_c3)._m0[5].y);
    float _93 = precise::clamp(_91, 0.0, 1.0);
    float _95 = precise::max(_89, _93);
    float _97 = fma(_63, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _99 = precise::clamp(_97, 0.0, 1.0);
    float _101 = _57 * _73;
    float _103 = precise::max(_95, _101);
    bool _105 = _103 != 0.0;
    bool _107 = isnan(_103);
    bool _109 = _105 || _107;
    bool _111 = isnan(0.0);
    bool _113 = _109 || _111;
    float _115 = fma(_63, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _117 = precise::clamp(_115, 0.0, 1.0);
    float _119 = _57 * _79;
    float _121 = _57 * _85;
    float _123 = precise::min(_117, _99);
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
        float _157 = fma(_155, (*spvDescriptorSet0.fp_c3)._m0[8].z, _59);
        float2 _480 = float2(_139, _141);
        float3 _161 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_480, float2(0.0), isnan(_480)), level(_133)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_480, float2(0.0), isnan(_480)), level(_133)).xyz;
        float _163 = _161.x;
        float _165 = _161.y;
        float _167 = _161.z;
        float _169 = -_137;
        float _171 = fma(_169, (*spvDescriptorSet0.fp_c3)._m0[8].w, _61);
        float2 _502 = float2(_145, _149);
        float3 _173 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_502, float2(0.0), isnan(_502)), level(_133)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_502, float2(0.0), isnan(_502)), level(_133)).xyz;
        float _175 = _173.x;
        float _177 = _173.y;
        float _179 = _173.z;
        float2 _517 = float2(_151, _153);
        float3 _181 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_517, float2(0.0), isnan(_517)), level(_133)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_517, float2(0.0), isnan(_517)), level(_133)).xyz;
        float _183 = _181.x;
        float _185 = _181.y;
        float _187 = _181.z;
        float2 _532 = float2(_157, _171);
        float3 _189 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_532, float2(0.0), isnan(_532)), level(_133)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_532, float2(0.0), isnan(_532)), level(_133)).xyz;
        float _191 = _189.x;
        float _193 = _189.y;
        float _195 = _189.z;
        float _197 = 0.0 + _131;
        float _199 = precise::clamp(_197, 0.0, 1.0);
        float _201 = fma(_121, _199, _119);
        float _203 = _123 * (*spvDescriptorSet0.fp_c3)._m0[0].w;
        float _205 = _165 + _177;
        float _207 = _163 + _175;
        float _209 = _167 + _179;
        float _211 = _205 + _185;
        float _213 = _207 + _183;
        float _215 = _209 + _187;
        float _217 = _211 + _193;
        float _219 = _213 + _191;
        float _221 = _215 + _195;
        float _223 = _217 * 0.14665000140666961669921875;
        float _225 = _217 * 0.25;
        float _227 = _221 * 0.25;
        float _229 = fma(_219, 0.0747250020503997802734375, _223);
        float _231 = _219 * 0.25;
        float _233 = fma(_221, 0.028599999845027923583984375, _229);
        float _235 = -_231;
        float _237 = _235 + _233;
        float _239 = -_225;
        float _241 = _239 + _233;
        float _243 = -_227;
        float _245 = _243 + _233;
        float _247 = fma(_203, _237, _231);
        float _249 = fma(_203, _241, _225);
        float _251 = fma(_203, _245, _227);
        float _253 = -_247;
        float _255 = fma(_247, (*spvDescriptorSet0.fp_c3)._m0[13].x, _253);
        float _257 = -_249;
        float _259 = fma(_249, (*spvDescriptorSet0.fp_c3)._m0[13].y, _257);
        float _261 = -_251;
        float _263 = fma(_251, (*spvDescriptorSet0.fp_c3)._m0[13].z, _261);
        float _265 = fma(_123, _255, _247);
        float _267 = fma(_123, _259, _249);
        float _269 = fma(_123, _263, _251);
        out.m_34.x = _265;
        out.m_34.y = _267;
        out.m_34.z = _269;
        out.m_34.w = _201;
        return out;
    }
    discard_fragment();
    return out;
}


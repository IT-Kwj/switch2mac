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
    texture2d<float> fp_t_tcb_C [[id(3)]];
    sampler fp_t_tcb_CSmplr [[id(4)]];
    texture2d<float> fp_t_tcb_A [[id(5)]];
    sampler fp_t_tcb_ASmplr [[id(6)]];
    sampler fp_t_tcb_8Smplr_w [[id(7)]];
    sampler fp_t_tcb_CSmplr_w [[id(8)]];
    sampler fp_t_tcb_ASmplr_w [[id(9)]];
    constant dm_border_t* dm_border [[id(10)]];
};

struct main0_out
{
    float4 m_36 [[color(0)]];
};

struct main0_in
{
    float4 m_33 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _43 = gl_FragCoord.w;
    float _45 = in.m_33.x;
    float _47 = gl_FragCoord.w;
    float _49 = _45 * _47;
    float _51 = in.m_33.y;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = 1.0 / _43;
    float _59 = _57 * _49;
    float _61 = _57 * _55;
    float2 _256 = float2(_59, _61);
    float _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_256, float2(0.0), isnan(_256))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_256, float2(0.0), isnan(_256))).x;
    float _65 = in.m_33.z;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = in.m_33.w;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = -_63;
    float _79 = fma(_77, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].x);
    float _81 = 1.0 / _79;
    bool _85 = _81 >= (*spvDescriptorSet0.fp_c3)._m0[0].z;
    if (_85)
    {
        discard_fragment();
    }
    if (_85)
    {
        out.m_36.x = 0.0;
        out.m_36.y = 0.0;
        out.m_36.z = 0.0;
        out.m_36.w = 0.0;
        return out;
    }
    float _87 = _57 * _69;
    float _89 = _57 * _75;
    float _91 = fma(_81, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _93 = precise::clamp(_91, 0.0, 1.0);
    bool _95 = _93 != 0.0;
    bool _97 = isnan(_93);
    bool _99 = _95 || _97;
    bool _101 = isnan(0.0);
    bool _103 = _99 || _101;
    bool _105 = !_103;
    if (!_105)
    {
        float2 _342 = float2(_87, _89);
        float2 _109 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_342, float2(0.0), isnan(_342))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_342, float2(0.0), isnan(_342))).xy;
        float _111 = _109.x;
        float _113 = _109.y;
        float _115 = (*spvDescriptorSet0.fp_c3)._m0[1].w * (*spvDescriptorSet0.fp_c3)._m0[1].z;
        float _117 = _113 + (-0.5);
        float _119 = _111 + (-0.5);
        float _121 = _117 * (*spvDescriptorSet0.fp_c3)._m0[1].w;
        float _123 = _119 * _115;
        float _125 = _121 * _121;
        float _127 = _93 * _121;
        float _129 = fma(_123, _123, _125);
        float _131 = rsqrt(_129);
        float _133 = _121 * _131;
        float _135 = _123 * _131;
        float _137 = _93 * _123;
        float _139 = _133 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
        float _141 = _135 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
        float _143 = fma(_139, 4.0, _127);
        float _145 = fma(_141, 4.0, _137);
        float _147 = _61 + _143;
        float _149 = _59 + _145;
        float2 _413 = float2(_149, _147);
        float _151 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_413, float2(0.0), isnan(_413))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_413, float2(0.0), isnan(_413))).x;
        float _153 = _81 + (-0.001000000047497451305389404296875);
        float _155 = (*spvDescriptorSet0.fp_c3)._m0[0].y + (-1.0);
        float _157 = fma(_93, _155, 1.0);
        float _159 = log2(_157);
        float _161 = -_151;
        float _163 = fma(_161, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].x);
        float _165 = 1.0 / _163;
        bool _167 = _165 >= _153;
        bool _169 = isnan(_165);
        bool _171 = _167 || _169;
        bool _173 = isnan(_153);
        bool _175 = _171 || _173;
        float _177 = float(_175);
        float _179 = fma(_177, _137, _59);
        float _181 = precise::clamp(_179, 0.0, 1.0);
        float _183 = fma(_177, _127, _61);
        float _185 = precise::clamp(_183, 0.0, 1.0);
        float2 _470 = float2(_181, _185);
        float3 _189 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_470, float2(0.0), isnan(_470)), bias(_159)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_470, float2(0.0), isnan(_470)), bias(_159)).xyz;
        float _191 = _189.x;
        float _193 = _189.y;
        float _195 = _189.z;
        float _197 = fma(_81, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
        float _199 = precise::clamp(_197, 0.0, 1.0);
        float _201 = fma(_81, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
        float _203 = precise::clamp(_201, 0.0, 1.0);
        float _205 = precise::min(_199, _203);
        float _207 = -_191;
        float _209 = fma(_191, (*spvDescriptorSet0.fp_c3)._m0[13].x, _207);
        float _211 = -_193;
        float _213 = fma(_193, (*spvDescriptorSet0.fp_c3)._m0[13].y, _211);
        float _215 = -_195;
        float _217 = fma(_195, (*spvDescriptorSet0.fp_c3)._m0[13].z, _215);
        float _219 = fma(_205, _209, _191);
        float _221 = fma(_205, _213, _193);
        float _223 = fma(_205, _217, _195);
        out.m_36.x = _219;
        out.m_36.y = _221;
        out.m_36.z = _223;
        out.m_36.w = 1.0;
        return out;
    }
    discard_fragment();
    return out;
}


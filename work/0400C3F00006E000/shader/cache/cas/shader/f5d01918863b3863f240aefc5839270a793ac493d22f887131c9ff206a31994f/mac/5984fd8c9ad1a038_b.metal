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
    float2 _270 = float2(_59, _61);
    float _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_270, float2(0.0), isnan(_270))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_270, float2(0.0), isnan(_270))).x;
    float _65 = in.m_33.z;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = in.m_33.w;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    bool _79 = _63 >= (*spvDescriptorSet0.fp_c3)._m0[0].z;
    if (_79)
    {
        discard_fragment();
    }
    if (_79)
    {
        out.m_36.x = 0.0;
        out.m_36.y = 0.0;
        out.m_36.z = 0.0;
        out.m_36.w = 0.0;
        return out;
    }
    float _81 = _57 * _69;
    float _83 = _57 * _75;
    float _85 = fma(_63, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _87 = precise::clamp(_85, 0.0, 1.0);
    bool _89 = _87 != 0.0;
    bool _91 = isnan(_87);
    bool _93 = _89 || _91;
    bool _95 = isnan(0.0);
    bool _97 = _93 || _95;
    bool _99 = !_97;
    if (!_99)
    {
        float2 _345 = float2(_81, _83);
        float2 _103 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_345, float2(0.0), isnan(_345))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_345, float2(0.0), isnan(_345))).xy;
        float _105 = _103.x;
        float _107 = _103.y;
        float _109 = (*spvDescriptorSet0.fp_c3)._m0[1].w * (*spvDescriptorSet0.fp_c3)._m0[1].z;
        float _111 = _107 + (-0.5);
        float _113 = _105 + (-0.5);
        float _115 = _111 * (*spvDescriptorSet0.fp_c3)._m0[1].w;
        float _117 = _113 * _109;
        float _119 = _115 * _115;
        float _121 = _87 * _117;
        float _123 = fma(_117, _117, _119);
        float _125 = rsqrt(_123);
        float _127 = _117 * _125;
        float _129 = _115 * _125;
        float _131 = _87 * _115;
        float _133 = _127 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
        float _135 = _129 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
        float _137 = fma(_133, 4.0, _121);
        float _139 = fma(_135, 4.0, _131);
        float _141 = _59 + _137;
        float _143 = _61 + _139;
        float2 _416 = float2(_141, _143);
        float _145 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_416, float2(0.0), isnan(_416))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_416, float2(0.0), isnan(_416))).x;
        float _147 = _63 + (-0.001000000047497451305389404296875);
        float _149 = (*spvDescriptorSet0.fp_c3)._m0[0].y + (-1.0);
        float _151 = fma(_87, _149, 1.0);
        float _153 = log2(_151);
        bool _155 = _145 >= _147;
        bool _157 = isnan(_145);
        bool _159 = _155 || _157;
        bool _161 = isnan(_147);
        bool _163 = _159 || _161;
        float _165 = float(_163);
        float _167 = fma(_165, _121, _59);
        float _169 = precise::clamp(_167, 0.0, 1.0);
        float _171 = fma(_165, _131, _61);
        float _173 = precise::clamp(_171, 0.0, 1.0);
        float2 _463 = float2(_169, _173);
        float3 _177 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_463, float2(0.0), isnan(_463)), bias(_153)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_463, float2(0.0), isnan(_463)), bias(_153)).xyz;
        float _179 = _177.x;
        float _181 = _177.y;
        float _183 = _177.z;
        float _185 = fma(_63, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
        float _187 = precise::clamp(_185, 0.0, 1.0);
        float _189 = fma(_63, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
        float _191 = precise::clamp(_189, 0.0, 1.0);
        float _193 = precise::min(_187, _191);
        float _195 = _193 * (*spvDescriptorSet0.fp_c3)._m0[0].w;
        float _197 = _181 * 0.586600005626678466796875;
        float _199 = fma(_179, 0.29890000820159912109375, _197);
        float _201 = fma(_183, 0.1143999993801116943359375, _199);
        float _203 = -_179;
        float _205 = _203 + _201;
        float _207 = -_181;
        float _209 = _207 + _201;
        float _211 = -_183;
        float _213 = _211 + _201;
        float _215 = fma(_195, _205, _179);
        float _217 = fma(_195, _209, _181);
        float _219 = fma(_195, _213, _183);
        float _221 = -_215;
        float _223 = fma(_215, (*spvDescriptorSet0.fp_c3)._m0[13].x, _221);
        float _225 = -_217;
        float _227 = fma(_217, (*spvDescriptorSet0.fp_c3)._m0[13].y, _225);
        float _229 = -_219;
        float _231 = fma(_219, (*spvDescriptorSet0.fp_c3)._m0[13].z, _229);
        float _233 = fma(_193, _223, _215);
        float _235 = fma(_193, _227, _217);
        float _237 = fma(_193, _231, _219);
        out.m_36.x = _233;
        out.m_36.y = _235;
        out.m_36.z = _237;
        out.m_36.w = 1.0;
        return out;
    }
    discard_fragment();
    return out;
}


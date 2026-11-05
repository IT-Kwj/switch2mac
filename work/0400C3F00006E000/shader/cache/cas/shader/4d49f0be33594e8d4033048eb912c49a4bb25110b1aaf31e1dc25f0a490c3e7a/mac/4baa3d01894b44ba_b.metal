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
    constant _16* fp_c11 [[id(1)]];
    texture2d<float> fp_t_tcb_E [[id(2)]];
    sampler fp_t_tcb_ESmplr [[id(3)]];
    texture2d<float> fp_t_tcb_10 [[id(4)]];
    sampler fp_t_tcb_10Smplr [[id(5)]];
    texture2d<float> fp_t_tcb_12 [[id(6)]];
    sampler fp_t_tcb_12Smplr [[id(7)]];
    sampler fp_t_tcb_ESmplr_w [[id(8)]];
    sampler fp_t_tcb_10Smplr_w [[id(9)]];
    sampler fp_t_tcb_12Smplr_w [[id(10)]];
    constant dm_border_t* dm_border [[id(11)]];
};

struct main0_out
{
    float4 m_40 [[color(0)]];
};

struct main0_in
{
    float4 m_35 [[user(locn0)]];
    float4 m_37 [[user(locn5)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _47 = gl_FragCoord.w;
    float _49 = in.m_35.y;
    float _51 = gl_FragCoord.w;
    float _53 = _49 * _51;
    float _55 = in.m_35.x;
    float _57 = gl_FragCoord.w;
    float _59 = _55 * _57;
    float _61 = (*spvDescriptorSet0.fp_c9)._m0[983].y * 0.0625;
    float _63 = (*spvDescriptorSet0.fp_c9)._m0[983].y * 0.75;
    float _65 = 1.0 / _47;
    float _67 = _65 * _53;
    float _69 = _65 * _59;
    float _71 = _67 + _61;
    float _73 = -_61;
    float _75 = fma(_67, 0.75, _73);
    float _77 = _69 + _61;
    float _79 = -_61;
    float _81 = fma(_69, 0.75, _79);
    float _83 = -_63;
    float _85 = fma(_83, (*spvDescriptorSet0.fp_c11)._m0[40].z, _71);
    float _87 = -_63;
    float _89 = fma(_87, (*spvDescriptorSet0.fp_c11)._m0[40].z, _75);
    float2 _321 = float2(_77, _85);
    float2 _93 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_321, float2(0.0), isnan(_321))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_321, float2(0.0), isnan(_321))).xy;
    float _95 = _93.x;
    float _97 = _93.y;
    float2 _336 = float2(_81, _89);
    float2 _99 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_336, float2(0.0), isnan(_336))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_336, float2(0.0), isnan(_336))).xy;
    float _101 = _99.x;
    float _103 = _99.y;
    float _105 = (*spvDescriptorSet0.fp_c9)._m0[983].y * 0.1040000021457672119140625;
    float _107 = _105 * 0.15915493667125701904296875;
    float _109 = _107 * 6.283185482025146484375;
    float _111 = cos(_109);
    float _113 = _107 * 6.283185482025146484375;
    float _115 = sin(_113);
    float _117 = _67 + _111;
    float _119 = _69 + _115;
    bool _123 = _97 >= 0.5;
    bool _125 = isnan(_97);
    bool _127 = _123 || _125;
    bool _129 = isnan(0.5);
    bool _131 = _127 || _129;
    float _133 = -_95;
    float _135 = _133 + 1.0;
    bool _137 = _95 >= 0.5;
    bool _139 = isnan(_95);
    bool _141 = _137 || _139;
    bool _143 = isnan(0.5);
    bool _145 = _141 || _143;
    float _147 = _95 * _101;
    float _149 = _147 * 2.0;
    float _151 = -_97;
    float _153 = _151 + 1.0;
    float _155 = -_103;
    float _157 = _155 + 1.0;
    float _159 = -_101;
    float _161 = _159 + 1.0;
    float _163 = _97 * _103;
    float _165 = _163 * 2.0;
    float _167 = _153 * _157;
    float _169 = _135 * _161;
    float _171 = _165;
    float _173 = _149;
    if (_131)
    {
        float _175 = fma(_167, -2.0, 1.0);
        _171 = _175;
    }
    float _177 = _171;
    if (_145)
    {
        float _179 = fma(_169, -2.0, 1.0);
        _173 = _179;
    }
    float _181 = _173;
    float _183 = fma(_177, 2.0, -1.0);
    float _185 = fma(_181, 2.0, -1.0);
    float _187 = fma(_183, (*spvDescriptorSet0.fp_c11)._m0[40].x, _117);
    float _189 = -_185;
    float _191 = fma(_189, (*spvDescriptorSet0.fp_c11)._m0[40].x, _119);
    float2 _460 = float2(_191, _187);
    float _193 = dm_bs(spvDescriptorSet0.fp_t_tcb_12.sample(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_460, float2(0.0), isnan(_460))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_12, spvDescriptorSet0.fp_t_tcb_12Smplr_w, select(_460, float2(0.0), isnan(_460))).x;
    float _195 = (*spvDescriptorSet0.fp_c9)._m0[983].y * 1.256637096405029296875;
    float _197 = in.m_37.x;
    float _199 = gl_FragCoord.w;
    float _201 = _197 * _199;
    float _203 = _195 * 0.15915493667125701904296875;
    float _205 = _203 * 6.283185482025146484375;
    float _207 = sin(_205);
    float _209 = fma(_207, 0.5, 0.5);
    float _211 = -(*spvDescriptorSet0.fp_c11)._m0[40].y;
    float _213 = _211 + (*spvDescriptorSet0.fp_c11)._m0[41].z;
    float _215 = fma(_209, _213, (*spvDescriptorSet0.fp_c11)._m0[40].y);
    float _217 = _65 * _201;
    float _219 = precise::max(_215, (*spvDescriptorSet0.fp_c11)._m0[40].y);
    float _221 = precise::min(_219, (*spvDescriptorSet0.fp_c11)._m0[41].z);
    float _223 = fma(_193, 0.00999999977648258209228515625, _217);
    float _225 = _221 + 0.00200000009499490261077880859375;
    float _227 = precise::max(_221, _223);
    float _229 = precise::min(_225, _227);
    float _231 = -_221;
    float _233 = _231 + _229;
    float _235 = fma(_233, -499.999969482421875, 1.0);
    bool _237 = _235 >= (*spvDescriptorSet0.fp_c11)._m0[34].z;
    bool _239 = isnan(_235);
    bool _241 = _237 || _239;
    bool _243 = isnan((*spvDescriptorSet0.fp_c11)._m0[34].z);
    bool _245 = _241 || _243;
    if (!_245)
    {
        discard_fragment();
    }
    if (!_245)
    {
        out.m_40.x = 0.0;
        out.m_40.y = 0.0;
        out.m_40.z = 0.0;
        out.m_40.w = 0.0;
        return out;
    }
    out.m_40.x = 1.0;
    out.m_40.y = 1.0;
    out.m_40.z = 1.0;
    out.m_40.w = 1.0;
    return out;
}


struct main0_out_u
{
    uint4 m_40 [[color(0)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _47 = gl_FragCoord.w;
    float _49 = in.m_35.y;
    float _51 = gl_FragCoord.w;
    float _53 = _49 * _51;
    float _55 = in.m_35.x;
    float _57 = gl_FragCoord.w;
    float _59 = _55 * _57;
    float _61 = (*spvDescriptorSet0.fp_c9)._m0[983].y * 0.0625;
    float _63 = (*spvDescriptorSet0.fp_c9)._m0[983].y * 0.75;
    float _65 = 1.0 / _47;
    float _67 = _65 * _53;
    float _69 = _65 * _59;
    float _71 = _67 + _61;
    float _73 = -_61;
    float _75 = fma(_67, 0.75, _73);
    float _77 = _69 + _61;
    float _79 = -_61;
    float _81 = fma(_69, 0.75, _79);
    float _83 = -_63;
    float _85 = fma(_83, (*spvDescriptorSet0.fp_c11)._m0[40].z, _71);
    float _87 = -_63;
    float _89 = fma(_87, (*spvDescriptorSet0.fp_c11)._m0[40].z, _75);
    float2 _321 = float2(_77, _85);
    float2 _93 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_321, float2(0.0), isnan(_321))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_321, float2(0.0), isnan(_321))).xy;
    float _95 = _93.x;
    float _97 = _93.y;
    float2 _336 = float2(_81, _89);
    float2 _99 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_336, float2(0.0), isnan(_336))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_336, float2(0.0), isnan(_336))).xy;
    float _101 = _99.x;
    float _103 = _99.y;
    float _105 = (*spvDescriptorSet0.fp_c9)._m0[983].y * 0.1040000021457672119140625;
    float _107 = _105 * 0.15915493667125701904296875;
    float _109 = _107 * 6.283185482025146484375;
    float _111 = cos(_109);
    float _113 = _107 * 6.283185482025146484375;
    float _115 = sin(_113);
    float _117 = _67 + _111;
    float _119 = _69 + _115;
    bool _123 = _97 >= 0.5;
    bool _125 = isnan(_97);
    bool _127 = _123 || _125;
    bool _129 = isnan(0.5);
    bool _131 = _127 || _129;
    float _133 = -_95;
    float _135 = _133 + 1.0;
    bool _137 = _95 >= 0.5;
    bool _139 = isnan(_95);
    bool _141 = _137 || _139;
    bool _143 = isnan(0.5);
    bool _145 = _141 || _143;
    float _147 = _95 * _101;
    float _149 = _147 * 2.0;
    float _151 = -_97;
    float _153 = _151 + 1.0;
    float _155 = -_103;
    float _157 = _155 + 1.0;
    float _159 = -_101;
    float _161 = _159 + 1.0;
    float _163 = _97 * _103;
    float _165 = _163 * 2.0;
    float _167 = _153 * _157;
    float _169 = _135 * _161;
    float _171 = _165;
    float _173 = _149;
    if (_131)
    {
        float _175 = fma(_167, -2.0, 1.0);
        _171 = _175;
    }
    float _177 = _171;
    if (_145)
    {
        float _179 = fma(_169, -2.0, 1.0);
        _173 = _179;
    }
    float _181 = _173;
    float _183 = fma(_177, 2.0, -1.0);
    float _185 = fma(_181, 2.0, -1.0);
    float _187 = fma(_183, (*spvDescriptorSet0.fp_c11)._m0[40].x, _117);
    float _189 = -_185;
    float _191 = fma(_189, (*spvDescriptorSet0.fp_c11)._m0[40].x, _119);
    float2 _460 = float2(_191, _187);
    float _193 = dm_bs(spvDescriptorSet0.fp_t_tcb_12.sample(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_460, float2(0.0), isnan(_460))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_12, spvDescriptorSet0.fp_t_tcb_12Smplr_w, select(_460, float2(0.0), isnan(_460))).x;
    float _195 = (*spvDescriptorSet0.fp_c9)._m0[983].y * 1.256637096405029296875;
    float _197 = in.m_37.x;
    float _199 = gl_FragCoord.w;
    float _201 = _197 * _199;
    float _203 = _195 * 0.15915493667125701904296875;
    float _205 = _203 * 6.283185482025146484375;
    float _207 = sin(_205);
    float _209 = fma(_207, 0.5, 0.5);
    float _211 = -(*spvDescriptorSet0.fp_c11)._m0[40].y;
    float _213 = _211 + (*spvDescriptorSet0.fp_c11)._m0[41].z;
    float _215 = fma(_209, _213, (*spvDescriptorSet0.fp_c11)._m0[40].y);
    float _217 = _65 * _201;
    float _219 = precise::max(_215, (*spvDescriptorSet0.fp_c11)._m0[40].y);
    float _221 = precise::min(_219, (*spvDescriptorSet0.fp_c11)._m0[41].z);
    float _223 = fma(_193, 0.00999999977648258209228515625, _217);
    float _225 = _221 + 0.00200000009499490261077880859375;
    float _227 = precise::max(_221, _223);
    float _229 = precise::min(_225, _227);
    float _231 = -_221;
    float _233 = _231 + _229;
    float _235 = fma(_233, -499.999969482421875, 1.0);
    bool _237 = _235 >= (*spvDescriptorSet0.fp_c11)._m0[34].z;
    bool _239 = isnan(_235);
    bool _241 = _237 || _239;
    bool _243 = isnan((*spvDescriptorSet0.fp_c11)._m0[34].z);
    bool _245 = _241 || _243;
    if (!_245)
    {
        discard_fragment();
    }
    if (!_245)
    {
        out.m_40.x = 0.0;
        out.m_40.y = 0.0;
        out.m_40.z = 0.0;
        out.m_40.w = 0.0;
        return main0_out_u{as_type<uint4>(out.m_40)};
    }
    out.m_40.x = 1.0;
    out.m_40.y = 1.0;
    out.m_40.z = 1.0;
    out.m_40.w = 1.0;
    return main0_out_u{as_type<uint4>(out.m_40)};
}


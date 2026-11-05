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
    sampler fp_t_tcb_8Smplr_w [[id(3)]];
    constant dm_border_t* dm_border [[id(4)]];
};

struct main0_out
{
    float4 m_32 [[color(0)]];
};

struct main0_in
{
    float4 m_29 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _175 = false;
    float _39 = gl_FragCoord.w;
    float _41 = in.m_29.y;
    float _43 = gl_FragCoord.w;
    float _45 = _41 * _43;
    float _47 = in.m_29.x;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = 1.0 / _39;
    float _55 = _53 * _45;
    float _57 = _53 * _51;
    float2 _283 = float2(_57, _55);
    float3 _61 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_283, float2(0.0), isnan(_283))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_283, float2(0.0), isnan(_283))).xyz;
    float _63 = _61.x;
    float _65 = _61.y;
    float _67 = _61.z;
    bool _71 = 0 != as_type<int>((*spvDescriptorSet0.fp_c3)._m0[7].x);
    float _73 = _51;
    float _75 = _57;
    float _77 = _63;
    if (!_71)
    {
        float _79 = abs(_63);
        float _81 = log2(_79);
        _73 = _81;
    }
    float _83 = _73;
    if (_71)
    {
        _75 = _67;
    }
    float _85 = _75;
    float _87 = 0.0;
    if (!_71)
    {
        float _89 = abs(_65);
        float _91 = log2(_89);
        _87 = _91;
    }
    float _93 = _87;
    float _95 = 0.0;
    if (!_71)
    {
        float _97 = abs(_67);
        float _99 = log2(_97);
        _95 = _99;
    }
    float _101 = _95;
    float _103 = 0.0;
    float _105 = _83;
    if (!_71)
    {
        float _107 = _83 * 2.2000000476837158203125;
        _103 = _107;
    }
    float _109 = _103;
    if (_71)
    {
        _105 = _65;
    }
    float _111 = _105;
    float _113 = _93;
    if (!_71)
    {
        float _115 = _93 * 2.2000000476837158203125;
        _113 = _115;
    }
    float _117 = _113;
    if (!_71)
    {
        float _119 = exp2(_109);
        _77 = _119;
    }
    float _121 = _77;
    float _123 = _101;
    if (!_71)
    {
        float _125 = _101 * 2.2000000476837158203125;
        _123 = _125;
    }
    float _127 = _123;
    float _129 = _111;
    if (!_71)
    {
        float _131 = exp2(_117);
        _129 = _131;
    }
    float _133 = _129;
    float _135 = _85;
    if (!_71)
    {
        float _137 = exp2(_127);
        _135 = _137;
    }
    float _139 = _135;
    float _141 = _133 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _143 = fma(_121, (*spvDescriptorSet0.fp_c3)._m0[6].x, _141);
    float _145 = fma(_139, (*spvDescriptorSet0.fp_c3)._m0[6].z, _143);
    bool _147 = _145 >= 0.0;
    bool _149 = !_147;
    float _169;
    float _171;
    float _173;
    if (!_149)
    {
        float _151 = _133 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _153 = _133 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
        float _155 = _133 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
        float _157 = fma(_121, (*spvDescriptorSet0.fp_c3)._m0[0].x, _151);
        float _159 = fma(_121, (*spvDescriptorSet0.fp_c3)._m0[1].x, _153);
        float _161 = fma(_121, (*spvDescriptorSet0.fp_c3)._m0[2].x, _155);
        float _163 = fma(_139, (*spvDescriptorSet0.fp_c3)._m0[0].z, _157);
        float _165 = fma(_139, (*spvDescriptorSet0.fp_c3)._m0[1].z, _159);
        float _167 = fma(_139, (*spvDescriptorSet0.fp_c3)._m0[2].z, _161);
        _169 = _163;
        _171 = _165;
        _173 = _167;
        _175 = true;
    }
    else
    {
        float _177 = _133 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
        float _179 = _133 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
        float _181 = _133 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
        float _183 = fma(_121, (*spvDescriptorSet0.fp_c3)._m0[3].x, _177);
        float _185 = fma(_121, (*spvDescriptorSet0.fp_c3)._m0[4].x, _179);
        float _187 = fma(_121, (*spvDescriptorSet0.fp_c3)._m0[5].x, _181);
        float _189 = fma(_139, (*spvDescriptorSet0.fp_c3)._m0[3].z, _183);
        float _191 = fma(_139, (*spvDescriptorSet0.fp_c3)._m0[4].z, _185);
        float _193 = fma(_139, (*spvDescriptorSet0.fp_c3)._m0[5].z, _187);
        _169 = _189;
        _171 = _191;
        _173 = _193;
    }
    _175 = false;
    float _195 = _169;
    float _197 = _171;
    float _199 = _173;
    float _201 = 0.0 + _195;
    float _203 = precise::clamp(_201, 0.0, 1.0);
    float _205 = 0.0 + _197;
    float _207 = precise::clamp(_205, 0.0, 1.0);
    float _209 = 0.0 + _199;
    float _211 = precise::clamp(_209, 0.0, 1.0);
    int _214 = as_type<int>(_199);
    int _216 = as_type<int>(_197);
    int _218 = as_type<int>(_195);
    if (_71)
    {
        _214 = as_type<int>(_203);
    }
    int _220 = _214;
    if (_71)
    {
        _216 = as_type<int>(_207);
    }
    int _222 = _216;
    if (_71)
    {
        _218 = as_type<int>(_211);
    }
    int _224 = _218;
    if (_71)
    {
        out.m_32.x = as_type<float>(_220);
        out.m_32.y = as_type<float>(_222);
        out.m_32.z = as_type<float>(_224);
        out.m_32.w = 1.0;
        return out;
    }
    float _226 = abs(_203);
    float _228 = log2(_226);
    float _230 = abs(_207);
    float _232 = log2(_230);
    float _234 = abs(_211);
    float _236 = log2(_234);
    float _238 = _228 * 0.4545454680919647216796875;
    float _240 = _232 * 0.4545454680919647216796875;
    float _242 = exp2(_238);
    float _244 = _236 * 0.4545454680919647216796875;
    float _246 = exp2(_240);
    float _248 = exp2(_244);
    out.m_32.x = _242;
    out.m_32.y = _246;
    out.m_32.z = _248;
    out.m_32.w = 1.0;
    return out;
}


struct main0_out_u
{
    uint4 m_32 [[color(0)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _175 = false;
    float _39 = gl_FragCoord.w;
    float _41 = in.m_29.y;
    float _43 = gl_FragCoord.w;
    float _45 = _41 * _43;
    float _47 = in.m_29.x;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = 1.0 / _39;
    float _55 = _53 * _45;
    float _57 = _53 * _51;
    float2 _283 = float2(_57, _55);
    float3 _61 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_283, float2(0.0), isnan(_283))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_283, float2(0.0), isnan(_283))).xyz;
    float _63 = _61.x;
    float _65 = _61.y;
    float _67 = _61.z;
    bool _71 = 0 != as_type<int>((*spvDescriptorSet0.fp_c3)._m0[7].x);
    float _73 = _51;
    float _75 = _57;
    float _77 = _63;
    if (!_71)
    {
        float _79 = abs(_63);
        float _81 = log2(_79);
        _73 = _81;
    }
    float _83 = _73;
    if (_71)
    {
        _75 = _67;
    }
    float _85 = _75;
    float _87 = 0.0;
    if (!_71)
    {
        float _89 = abs(_65);
        float _91 = log2(_89);
        _87 = _91;
    }
    float _93 = _87;
    float _95 = 0.0;
    if (!_71)
    {
        float _97 = abs(_67);
        float _99 = log2(_97);
        _95 = _99;
    }
    float _101 = _95;
    float _103 = 0.0;
    float _105 = _83;
    if (!_71)
    {
        float _107 = _83 * 2.2000000476837158203125;
        _103 = _107;
    }
    float _109 = _103;
    if (_71)
    {
        _105 = _65;
    }
    float _111 = _105;
    float _113 = _93;
    if (!_71)
    {
        float _115 = _93 * 2.2000000476837158203125;
        _113 = _115;
    }
    float _117 = _113;
    if (!_71)
    {
        float _119 = exp2(_109);
        _77 = _119;
    }
    float _121 = _77;
    float _123 = _101;
    if (!_71)
    {
        float _125 = _101 * 2.2000000476837158203125;
        _123 = _125;
    }
    float _127 = _123;
    float _129 = _111;
    if (!_71)
    {
        float _131 = exp2(_117);
        _129 = _131;
    }
    float _133 = _129;
    float _135 = _85;
    if (!_71)
    {
        float _137 = exp2(_127);
        _135 = _137;
    }
    float _139 = _135;
    float _141 = _133 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _143 = fma(_121, (*spvDescriptorSet0.fp_c3)._m0[6].x, _141);
    float _145 = fma(_139, (*spvDescriptorSet0.fp_c3)._m0[6].z, _143);
    bool _147 = _145 >= 0.0;
    bool _149 = !_147;
    float _169;
    float _171;
    float _173;
    if (!_149)
    {
        float _151 = _133 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _153 = _133 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
        float _155 = _133 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
        float _157 = fma(_121, (*spvDescriptorSet0.fp_c3)._m0[0].x, _151);
        float _159 = fma(_121, (*spvDescriptorSet0.fp_c3)._m0[1].x, _153);
        float _161 = fma(_121, (*spvDescriptorSet0.fp_c3)._m0[2].x, _155);
        float _163 = fma(_139, (*spvDescriptorSet0.fp_c3)._m0[0].z, _157);
        float _165 = fma(_139, (*spvDescriptorSet0.fp_c3)._m0[1].z, _159);
        float _167 = fma(_139, (*spvDescriptorSet0.fp_c3)._m0[2].z, _161);
        _169 = _163;
        _171 = _165;
        _173 = _167;
        _175 = true;
    }
    else
    {
        float _177 = _133 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
        float _179 = _133 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
        float _181 = _133 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
        float _183 = fma(_121, (*spvDescriptorSet0.fp_c3)._m0[3].x, _177);
        float _185 = fma(_121, (*spvDescriptorSet0.fp_c3)._m0[4].x, _179);
        float _187 = fma(_121, (*spvDescriptorSet0.fp_c3)._m0[5].x, _181);
        float _189 = fma(_139, (*spvDescriptorSet0.fp_c3)._m0[3].z, _183);
        float _191 = fma(_139, (*spvDescriptorSet0.fp_c3)._m0[4].z, _185);
        float _193 = fma(_139, (*spvDescriptorSet0.fp_c3)._m0[5].z, _187);
        _169 = _189;
        _171 = _191;
        _173 = _193;
    }
    _175 = false;
    float _195 = _169;
    float _197 = _171;
    float _199 = _173;
    float _201 = 0.0 + _195;
    float _203 = precise::clamp(_201, 0.0, 1.0);
    float _205 = 0.0 + _197;
    float _207 = precise::clamp(_205, 0.0, 1.0);
    float _209 = 0.0 + _199;
    float _211 = precise::clamp(_209, 0.0, 1.0);
    int _214 = as_type<int>(_199);
    int _216 = as_type<int>(_197);
    int _218 = as_type<int>(_195);
    if (_71)
    {
        _214 = as_type<int>(_203);
    }
    int _220 = _214;
    if (_71)
    {
        _216 = as_type<int>(_207);
    }
    int _222 = _216;
    if (_71)
    {
        _218 = as_type<int>(_211);
    }
    int _224 = _218;
    if (_71)
    {
        out.m_32.x = as_type<float>(_220);
        out.m_32.y = as_type<float>(_222);
        out.m_32.z = as_type<float>(_224);
        out.m_32.w = 1.0;
        return main0_out_u{as_type<uint4>(out.m_32)};
    }
    float _226 = abs(_203);
    float _228 = log2(_226);
    float _230 = abs(_207);
    float _232 = log2(_230);
    float _234 = abs(_211);
    float _236 = log2(_234);
    float _238 = _228 * 0.4545454680919647216796875;
    float _240 = _232 * 0.4545454680919647216796875;
    float _242 = exp2(_238);
    float _244 = _236 * 0.4545454680919647216796875;
    float _246 = exp2(_240);
    float _248 = exp2(_244);
    out.m_32.x = _242;
    out.m_32.y = _246;
    out.m_32.z = _248;
    out.m_32.w = 1.0;
    return main0_out_u{as_type<uint4>(out.m_32)};
}


#pragma clang diagnostic ignored "-Wunused-variable"

#include <metal_stdlib>
#include <simd/simd.h>
#include <metal_atomic>

using namespace metal;

struct _10
{
    uint _m0;
    uint4 _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float4 _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct _21
{
    uint _m0[1];
};

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    constant _16* fp_c3 [[id(1)]];
    device _21* fp_s0 [[id(2)]];
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
};

struct main0_out
{
    float4 m_40 [[color(0)]];
    float gl_FragDepth [[depth(any)]];
};

struct main0_in
{
    float4 m_34 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _47 = gl_FragCoord.w;
    float _49 = in.m_34.x;
    float _51 = gl_FragCoord.w;
    float _53 = _49 * _51;
    float _55 = in.m_34.y;
    float _57 = gl_FragCoord.w;
    float _59 = _55 * _57;
    float _61 = 1.0 / _47;
    float _63 = _61 * _53;
    float _65 = _61 * _59;
    float2 _278 = float2(_63, _65);
    float4 _68 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_278, float2(0.0), isnan(_278)), int2(0), component::x).xyzw;
    float _70 = _68.x;
    float _72 = _68.y;
    float _74 = _68.z;
    float _76 = _68.w;
    float _78 = gl_FragCoord.y;
    float _80 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _82 = _78 / _80;
    float _84 = gl_FragCoord.x;
    float _86 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _88 = _84 / _86;
    float _90 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].y));
    float _92 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x));
    float _94 = _65 * _90;
    float _96 = _63 * _92;
    float _98 = trunc(_94);
    int _101 = int(_98);
    float _103 = trunc(_96);
    int _105 = int(_103);
    float _107 = trunc(_82);
    int _109 = int(_107);
    int _111 = _101 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x);
    int _113 = _111 + _105;
    float _115 = trunc(_88);
    int _117 = int(_115);
    int _119 = _117 & 1;
    float _121 = precise::min(_70, _72);
    float _123 = precise::min(_74, _76);
    float _125 = precise::max(_70, _72);
    float _127 = precise::min(_121, _123);
    int _129 = _109 * 2;
    float _131 = precise::max(_74, _76);
    bool _135 = _127 >= 1.0;
    bool _137 = isnan(_127);
    bool _139 = _135 || _137;
    bool _141 = isnan(1.0);
    bool _143 = _139 || _141;
    float _145 = -_127;
    float _147 = fma(_145, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _149 = precise::max(_125, _131);
    int _151 = 2 & _129;
    int _153 = (-3) & _119;
    int _155 = _151 | _153;
    float _157 = -_149;
    float _159 = fma(_157, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _161 = 1.0 / _147;
    int _163 = _113 << 2;
    int _165 = _163 + _155;
    int _167 = _165 * 4;
    float _169 = 1.0 / _159;
    int _171 = _167 + 9728;
    float _173 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _175 = fma(_161, (*spvDescriptorSet0.fp_c3)._m0[1].w, _173);
    float _177 = _175 * 16777215.0;
    float _179 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _181 = fma(_169, (*spvDescriptorSet0.fp_c3)._m0[1].w, _179);
    bool _183 = !_143;
    float _185 = _183 ? _177 : 16777215.0;
    float _187 = -_76;
    float _189 = fma(_187, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    bool _191 = _149 >= 1.0;
    bool _193 = isnan(_149);
    bool _195 = _191 || _193;
    bool _197 = isnan(1.0);
    bool _199 = _195 || _197;
    float _201 = _181 * 16777215.0;
    float _203 = trunc(_185);
    float _205 = precise::max(_203, 0.0);
    uint _208 = uint(_205);
    bool _210 = !_199;
    float _212 = _210 ? _201 : 16777215.0;
    float _214 = 1.0 / _189;
    float _216 = trunc(_212);
    float _218 = precise::max(_216, 0.0);
    uint _220 = uint(_218);
    bool _222 = _76 != 1.0;
    bool _224 = isnan(_76);
    bool _226 = _222 || _224;
    bool _228 = isnan(1.0);
    bool _230 = _226 || _228;
    uint _232 = uint(int(uint(_167) >> uint(2)));
    uint _502 = atomic_fetch_min_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_232)], _208, memory_order_relaxed);
    uint _234 = _502;
    float _236 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _238 = fma(_214, (*spvDescriptorSet0.fp_c3)._m0[1].w, _236);
    int _240 = _230 ? as_type<int>(_238) : 1065353216;
    uint _242 = uint(int(uint(_171) >> uint(2)));
    uint _523 = atomic_fetch_max_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_242)], _220, memory_order_relaxed);
    uint _244 = _523;
    out.gl_FragDepth = _76;
    out.m_40.x = as_type<float>(_240);
    out.m_40.y = as_type<float>(_240);
    out.m_40.z = as_type<float>(_240);
    out.m_40.w = as_type<float>(_240);
    return out;
}


struct main0_out_u
{
    uint4 m_40 [[color(0)]];
    float gl_FragDepth [[depth(any)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _47 = gl_FragCoord.w;
    float _49 = in.m_34.x;
    float _51 = gl_FragCoord.w;
    float _53 = _49 * _51;
    float _55 = in.m_34.y;
    float _57 = gl_FragCoord.w;
    float _59 = _55 * _57;
    float _61 = 1.0 / _47;
    float _63 = _61 * _53;
    float _65 = _61 * _59;
    float2 _278 = float2(_63, _65);
    float4 _68 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_278, float2(0.0), isnan(_278)), int2(0), component::x).xyzw;
    float _70 = _68.x;
    float _72 = _68.y;
    float _74 = _68.z;
    float _76 = _68.w;
    float _78 = gl_FragCoord.y;
    float _80 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _82 = _78 / _80;
    float _84 = gl_FragCoord.x;
    float _86 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _88 = _84 / _86;
    float _90 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].y));
    float _92 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x));
    float _94 = _65 * _90;
    float _96 = _63 * _92;
    float _98 = trunc(_94);
    int _101 = int(_98);
    float _103 = trunc(_96);
    int _105 = int(_103);
    float _107 = trunc(_82);
    int _109 = int(_107);
    int _111 = _101 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x);
    int _113 = _111 + _105;
    float _115 = trunc(_88);
    int _117 = int(_115);
    int _119 = _117 & 1;
    float _121 = precise::min(_70, _72);
    float _123 = precise::min(_74, _76);
    float _125 = precise::max(_70, _72);
    float _127 = precise::min(_121, _123);
    int _129 = _109 * 2;
    float _131 = precise::max(_74, _76);
    bool _135 = _127 >= 1.0;
    bool _137 = isnan(_127);
    bool _139 = _135 || _137;
    bool _141 = isnan(1.0);
    bool _143 = _139 || _141;
    float _145 = -_127;
    float _147 = fma(_145, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _149 = precise::max(_125, _131);
    int _151 = 2 & _129;
    int _153 = (-3) & _119;
    int _155 = _151 | _153;
    float _157 = -_149;
    float _159 = fma(_157, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _161 = 1.0 / _147;
    int _163 = _113 << 2;
    int _165 = _163 + _155;
    int _167 = _165 * 4;
    float _169 = 1.0 / _159;
    int _171 = _167 + 9728;
    float _173 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _175 = fma(_161, (*spvDescriptorSet0.fp_c3)._m0[1].w, _173);
    float _177 = _175 * 16777215.0;
    float _179 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _181 = fma(_169, (*spvDescriptorSet0.fp_c3)._m0[1].w, _179);
    bool _183 = !_143;
    float _185 = _183 ? _177 : 16777215.0;
    float _187 = -_76;
    float _189 = fma(_187, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    bool _191 = _149 >= 1.0;
    bool _193 = isnan(_149);
    bool _195 = _191 || _193;
    bool _197 = isnan(1.0);
    bool _199 = _195 || _197;
    float _201 = _181 * 16777215.0;
    float _203 = trunc(_185);
    float _205 = precise::max(_203, 0.0);
    uint _208 = uint(_205);
    bool _210 = !_199;
    float _212 = _210 ? _201 : 16777215.0;
    float _214 = 1.0 / _189;
    float _216 = trunc(_212);
    float _218 = precise::max(_216, 0.0);
    uint _220 = uint(_218);
    bool _222 = _76 != 1.0;
    bool _224 = isnan(_76);
    bool _226 = _222 || _224;
    bool _228 = isnan(1.0);
    bool _230 = _226 || _228;
    uint _232 = uint(int(uint(_167) >> uint(2)));
    uint _502 = atomic_fetch_min_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_232)], _208, memory_order_relaxed);
    uint _234 = _502;
    float _236 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _238 = fma(_214, (*spvDescriptorSet0.fp_c3)._m0[1].w, _236);
    int _240 = _230 ? as_type<int>(_238) : 1065353216;
    uint _242 = uint(int(uint(_171) >> uint(2)));
    uint _523 = atomic_fetch_max_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_242)], _220, memory_order_relaxed);
    uint _244 = _523;
    out.gl_FragDepth = _76;
    out.m_40.x = as_type<float>(_240);
    out.m_40.y = as_type<float>(_240);
    out.m_40.z = as_type<float>(_240);
    out.m_40.w = as_type<float>(_240);
    return main0_out_u{as_type<uint4>(out.m_40), out.gl_FragDepth};
}


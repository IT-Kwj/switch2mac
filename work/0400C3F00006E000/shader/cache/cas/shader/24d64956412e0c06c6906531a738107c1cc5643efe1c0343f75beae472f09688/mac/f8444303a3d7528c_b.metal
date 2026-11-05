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
    float4 m_42 [[color(2)]];
    float gl_FragDepth [[depth(any)]];
};

struct main0_in
{
    float4 m_34 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _49 = gl_FragCoord.w;
    float _51 = in.m_34.x;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = in.m_34.y;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = 1.0 / _49;
    float _65 = _63 * _55;
    float _67 = _63 * _61;
    float2 _284 = float2(_65, _67);
    float4 _70 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_284, float2(0.0), isnan(_284)), int2(0), component::x).xyzw;
    float _72 = _70.x;
    float _74 = _70.y;
    float _76 = _70.z;
    float _78 = _70.w;
    float _80 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x));
    float _82 = gl_FragCoord.y;
    float _84 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _86 = _82 / _84;
    float _88 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].y));
    float _90 = gl_FragCoord.x;
    float _92 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _94 = _90 / _92;
    float _96 = _65 * _80;
    float _98 = _67 * _88;
    float _100 = trunc(_96);
    int _103 = int(_100);
    float _105 = trunc(_98);
    int _107 = int(_105);
    float _109 = trunc(_86);
    int _111 = int(_109);
    int _113 = _107 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x);
    int _115 = _113 + _103;
    float _117 = trunc(_94);
    int _119 = int(_117);
    int _121 = _111 * 2;
    int _123 = _119 & 1;
    int _125 = 2 & _121;
    int _127 = (-3) & _123;
    int _129 = _125 | _127;
    int _131 = _115 << 2;
    int _133 = _131 + _129;
    int _135 = _133 * 4;
    int _137 = _135 + 9728;
    float _139 = precise::min(_72, _74);
    float _141 = precise::min(_76, _78);
    float _143 = precise::max(_72, _74);
    float _145 = precise::min(_139, _141);
    float _147 = precise::max(_76, _78);
    bool _151 = _145 >= 1.0;
    bool _153 = isnan(_145);
    bool _155 = _151 || _153;
    bool _157 = isnan(1.0);
    bool _159 = _155 || _157;
    float _161 = -_145;
    float _163 = fma(_161, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _165 = precise::max(_143, _147);
    float _167 = 1.0 / _163;
    float _169 = -_165;
    float _171 = fma(_169, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _173 = 1.0 / _171;
    float _175 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _177 = fma(_167, (*spvDescriptorSet0.fp_c3)._m0[1].w, _175);
    float _179 = _177 * 16777215.0;
    float _181 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _183 = fma(_173, (*spvDescriptorSet0.fp_c3)._m0[1].w, _181);
    bool _185 = !_159;
    float _187 = _185 ? _179 : 16777215.0;
    float _189 = -_78;
    float _191 = fma(_189, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    bool _193 = _165 >= 1.0;
    bool _195 = isnan(_165);
    bool _197 = _193 || _195;
    bool _199 = isnan(1.0);
    bool _201 = _197 || _199;
    float _203 = _183 * 16777215.0;
    float _205 = trunc(_187);
    float _207 = precise::max(_205, 0.0);
    uint _210 = uint(_207);
    bool _212 = !_201;
    float _214 = _212 ? _203 : 16777215.0;
    float _216 = 1.0 / _191;
    float _218 = trunc(_214);
    float _220 = precise::max(_218, 0.0);
    uint _222 = uint(_220);
    bool _224 = _78 != 1.0;
    bool _226 = isnan(_78);
    bool _228 = _224 || _226;
    bool _230 = isnan(1.0);
    bool _232 = _228 || _230;
    uint _234 = uint(int(uint(_135) >> uint(2)));
    uint _508 = atomic_fetch_min_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_234)], _210, memory_order_relaxed);
    uint _236 = _508;
    float _238 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _240 = fma(_216, (*spvDescriptorSet0.fp_c3)._m0[1].w, _238);
    int _242 = _232 ? as_type<int>(_240) : 1065353216;
    uint _244 = uint(int(uint(_137) >> uint(2)));
    uint _529 = atomic_fetch_max_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_244)], _222, memory_order_relaxed);
    uint _246 = _529;
    bool _248 = !_201;
    int _250 = _248 ? as_type<int>(_183) : 1065353216;
    out.gl_FragDepth = as_type<float>(_210);
    out.m_40.x = as_type<float>(_242);
    out.m_40.y = as_type<float>(_242);
    out.m_40.z = as_type<float>(_242);
    out.m_40.w = as_type<float>(_242);
    out.m_42.x = as_type<float>(_250);
    return out;
}


struct main0_out_u
{
    uint4 m_40 [[color(0)]];
    uint4 m_42 [[color(2)]];
    float gl_FragDepth [[depth(any)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _49 = gl_FragCoord.w;
    float _51 = in.m_34.x;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = in.m_34.y;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = 1.0 / _49;
    float _65 = _63 * _55;
    float _67 = _63 * _61;
    float2 _284 = float2(_65, _67);
    float4 _70 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_284, float2(0.0), isnan(_284)), int2(0), component::x).xyzw;
    float _72 = _70.x;
    float _74 = _70.y;
    float _76 = _70.z;
    float _78 = _70.w;
    float _80 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x));
    float _82 = gl_FragCoord.y;
    float _84 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _86 = _82 / _84;
    float _88 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].y));
    float _90 = gl_FragCoord.x;
    float _92 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _94 = _90 / _92;
    float _96 = _65 * _80;
    float _98 = _67 * _88;
    float _100 = trunc(_96);
    int _103 = int(_100);
    float _105 = trunc(_98);
    int _107 = int(_105);
    float _109 = trunc(_86);
    int _111 = int(_109);
    int _113 = _107 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x);
    int _115 = _113 + _103;
    float _117 = trunc(_94);
    int _119 = int(_117);
    int _121 = _111 * 2;
    int _123 = _119 & 1;
    int _125 = 2 & _121;
    int _127 = (-3) & _123;
    int _129 = _125 | _127;
    int _131 = _115 << 2;
    int _133 = _131 + _129;
    int _135 = _133 * 4;
    int _137 = _135 + 9728;
    float _139 = precise::min(_72, _74);
    float _141 = precise::min(_76, _78);
    float _143 = precise::max(_72, _74);
    float _145 = precise::min(_139, _141);
    float _147 = precise::max(_76, _78);
    bool _151 = _145 >= 1.0;
    bool _153 = isnan(_145);
    bool _155 = _151 || _153;
    bool _157 = isnan(1.0);
    bool _159 = _155 || _157;
    float _161 = -_145;
    float _163 = fma(_161, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _165 = precise::max(_143, _147);
    float _167 = 1.0 / _163;
    float _169 = -_165;
    float _171 = fma(_169, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _173 = 1.0 / _171;
    float _175 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _177 = fma(_167, (*spvDescriptorSet0.fp_c3)._m0[1].w, _175);
    float _179 = _177 * 16777215.0;
    float _181 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _183 = fma(_173, (*spvDescriptorSet0.fp_c3)._m0[1].w, _181);
    bool _185 = !_159;
    float _187 = _185 ? _179 : 16777215.0;
    float _189 = -_78;
    float _191 = fma(_189, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    bool _193 = _165 >= 1.0;
    bool _195 = isnan(_165);
    bool _197 = _193 || _195;
    bool _199 = isnan(1.0);
    bool _201 = _197 || _199;
    float _203 = _183 * 16777215.0;
    float _205 = trunc(_187);
    float _207 = precise::max(_205, 0.0);
    uint _210 = uint(_207);
    bool _212 = !_201;
    float _214 = _212 ? _203 : 16777215.0;
    float _216 = 1.0 / _191;
    float _218 = trunc(_214);
    float _220 = precise::max(_218, 0.0);
    uint _222 = uint(_220);
    bool _224 = _78 != 1.0;
    bool _226 = isnan(_78);
    bool _228 = _224 || _226;
    bool _230 = isnan(1.0);
    bool _232 = _228 || _230;
    uint _234 = uint(int(uint(_135) >> uint(2)));
    uint _508 = atomic_fetch_min_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_234)], _210, memory_order_relaxed);
    uint _236 = _508;
    float _238 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _240 = fma(_216, (*spvDescriptorSet0.fp_c3)._m0[1].w, _238);
    int _242 = _232 ? as_type<int>(_240) : 1065353216;
    uint _244 = uint(int(uint(_137) >> uint(2)));
    uint _529 = atomic_fetch_max_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_244)], _222, memory_order_relaxed);
    uint _246 = _529;
    bool _248 = !_201;
    int _250 = _248 ? as_type<int>(_183) : 1065353216;
    out.gl_FragDepth = as_type<float>(_210);
    out.m_40.x = as_type<float>(_242);
    out.m_40.y = as_type<float>(_242);
    out.m_40.z = as_type<float>(_242);
    out.m_40.w = as_type<float>(_242);
    out.m_42.x = as_type<float>(_250);
    return main0_out_u{as_type<uint4>(out.m_40), as_type<uint4>(out.m_42), out.gl_FragDepth};
}


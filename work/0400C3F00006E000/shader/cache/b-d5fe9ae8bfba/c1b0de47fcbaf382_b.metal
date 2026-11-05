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
    constant _16* vp_c3 [[id(0)]];
    texture2d_array<float> vp_t_tcb_8 [[id(1)]];
    sampler vp_t_tcb_8Smplr [[id(2)]];
    sampler vp_t_tcb_8Smplr_w [[id(3)]];
    constant dm_border_t* dm_border [[id(4)]];
};

struct main0_out
{
    float4 m_30 [[user(locn0)]];
    float4 m_32 [[user(locn1)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_27 [[attribute(0)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_30 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_32 = float4(0.0, 0.0, 0.0, 1.0);
    bool _147 = false;
    bool _131 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _46 = in.m_27.x;
    float _48 = in.m_27.y;
    bool _52 = _46 > 0.0;
    bool _54 = _48 > 0.0;
    bool _56 = _46 >= 0.0;
    bool _58 = isnan(_46);
    bool _60 = _56 || _58;
    bool _62 = isnan(0.0);
    bool _64 = _60 || _62;
    bool _66 = _48 >= 0.0;
    bool _68 = isnan(_48);
    bool _70 = _66 || _68;
    bool _72 = isnan(0.0);
    bool _74 = _70 || _72;
    float _76 = _64 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _78 = _74 ? 0.0 : 1.4012984643248170709237295832899e-45;
    int _81 = ~as_type<int>(_76);
    int _83 = _81 + 1;
    int _85 = _83 + 1;
    int _87 = _85;
    float _89 = _78;
    float _91 = _76;
    if (!_52)
    {
        int _93 = -as_type<int>(_76);
        _87 = _93;
    }
    int _95 = _87;
    int _97 = ~as_type<int>(_78);
    int _99 = _97 + 1;
    int _101 = _99 + 1;
    int _103 = _101;
    if (!_54)
    {
        int _105 = -as_type<int>(_78);
        _103 = _105;
    }
    int _107 = _103;
    float _109 = float(_95);
    float _111 = float(_107);
    out.gl_Position.x = _109;
    out.gl_Position.y = _111;
    bool _113 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[0].y) >= 3;
    bool _115 = !_113;
    float _117 = as_type<float>(_107);
    float _119 = (*spvDescriptorSet0.vp_c3)._m0[0].y;
    float _133;
    float _135;
    float _137;
    float _139;
    float _141;
    float _143;
    float _145;
    if (!_115)
    {
        bool _121 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[0].y) >= 4;
        bool _123 = !_121;
        if (!_123)
        {
            bool _125 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[0].y) >= 5;
            bool _127 = !_125;
            if (!_127)
            {
                bool _129 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[0].y) != 5;
                _131 = _129;
                if (!_131)
                {
                    _133 = 0.0;
                    _135 = 1.0;
                    _137 = 0.0;
                    _139 = -1.0;
                    _141 = 0.0;
                    _143 = 0.0;
                    _145 = -1.0;
                    _147 = true;
                }
            }
            else
            {
                _133 = 0.0;
                _135 = 1.0;
                _137 = 0.0;
                _139 = 1.0;
                _141 = 0.0;
                _143 = 0.0;
                _145 = 1.0;
                _147 = true;
            }
        }
        else
        {
            _133 = 1.0;
            _135 = 0.0;
            _137 = -1.0;
            _139 = 1.0;
            _141 = 0.0;
            _143 = 0.0;
            _145 = 0.0;
            _147 = true;
        }
    }
    if ((!_147) || _131)
    {
        bool _149;
        if (!_131)
        {
            _149 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[0].y) >= 2;
        }
        if ((!_149) || _131)
        {
            if (!_131)
            {
                bool _151 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[0].y) != 1;
                float _153 = 0.0;
                if (!_151)
                {
                    _153 = 0.0;
                }
                float _155 = _153;
                float _157 = 0.0;
                _139 = _155;
                if (!_151)
                {
                    _157 = -1.0;
                }
                float _159 = _157;
                _141 = _159;
                if (!_151)
                {
                    _89 = 1.0;
                }
                float _161 = _89;
                float _163 = 0.0;
                _135 = _161;
                if (!_151)
                {
                    _163 = 0.0;
                }
                float _165 = _163;
                _137 = _165;
                if (!_151)
                {
                    _117 = 1.0;
                }
                float _167 = _117;
                _143 = _167;
                if (!_151)
                {
                    _91 = 0.0;
                }
                float _169 = _91;
                _133 = _169;
                if (!_151)
                {
                    _119 = 0.0;
                }
                float _171 = _119;
                bool _173 = !_151;
                _145 = _171;
                _147 = _173;
            }
            if ((!_147) || _131)
            {
                _131 = false;
                _133 = 0.0;
                _135 = 1.0;
                _137 = 0.0;
                _139 = 0.0;
                _141 = 1.0;
                _143 = -1.0;
                _145 = 0.0;
                _147 = true;
            }
        }
        else
        {
            _133 = -1.0;
            _135 = 0.0;
            _137 = 1.0;
            _139 = 1.0;
            _141 = 0.0;
            _143 = 0.0;
            _145 = 0.0;
        }
    }
    _147 = false;
    float _175 = _133;
    float _177 = _135;
    float _179 = _137;
    float _181 = _139;
    float _183 = _141;
    float _185 = _143;
    float _187 = _145;
    float _189 = float(as_type<int>((*spvDescriptorSet0.vp_c3)._m0[0].z));
    float _191 = rint(_189);
    float _193 = precise::max(_191, 0.0);
    uint _196 = uint(_193);
    uint _198 = clamp(_196, 0u, 65535u);
    float3 _478 = float3(0.5, 0.5, float(int(_198)));
    float3 _482 = select(_478, float3(0.0), isnan(_478));
    float _200 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, _482.xy, uint(rint(_482.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, _482.xy, uint(rint(_482.z)), level(0.0)).x;
    float _202 = _111 * _175;
    float _204 = fma(_111, _177, _179);
    float _206 = fma(_109, _181, _183);
    float _208 = fma(_109, _185, _202);
    float _210 = _204 * _204;
    float _212 = _208 + _187;
    float _214 = fma(_206, _206, _210);
    float _216 = fma(_212, _212, _214);
    float _218 = rsqrt(_216);
    float _220 = _206 * _218;
    float _222 = _204 * _218;
    float _224 = _212 * _218;
    out.m_30.x = _220;
    out.m_30.y = _222;
    out.m_30.z = _224;
    float _226 = precise::max(_200, 9.9999997473787516355514526367188e-06);
    out.m_32.x = _226;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_30 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_32 = float4(0.0, 0.0, 0.0, 1.0);
    bool _147 = false;
    bool _131 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _46 = in.m_27.x;
    float _48 = in.m_27.y;
    bool _52 = _46 > 0.0;
    bool _54 = _48 > 0.0;
    bool _56 = _46 >= 0.0;
    bool _58 = isnan(_46);
    bool _60 = _56 || _58;
    bool _62 = isnan(0.0);
    bool _64 = _60 || _62;
    bool _66 = _48 >= 0.0;
    bool _68 = isnan(_48);
    bool _70 = _66 || _68;
    bool _72 = isnan(0.0);
    bool _74 = _70 || _72;
    float _76 = _64 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _78 = _74 ? 0.0 : 1.4012984643248170709237295832899e-45;
    int _81 = ~as_type<int>(_76);
    int _83 = _81 + 1;
    int _85 = _83 + 1;
    int _87 = _85;
    float _89 = _78;
    float _91 = _76;
    if (!_52)
    {
        int _93 = -as_type<int>(_76);
        _87 = _93;
    }
    int _95 = _87;
    int _97 = ~as_type<int>(_78);
    int _99 = _97 + 1;
    int _101 = _99 + 1;
    int _103 = _101;
    if (!_54)
    {
        int _105 = -as_type<int>(_78);
        _103 = _105;
    }
    int _107 = _103;
    float _109 = float(_95);
    float _111 = float(_107);
    out.gl_Position.x = _109;
    out.gl_Position.y = _111;
    bool _113 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[0].y) >= 3;
    bool _115 = !_113;
    float _117 = as_type<float>(_107);
    float _119 = (*spvDescriptorSet0.vp_c3)._m0[0].y;
    float _133;
    float _135;
    float _137;
    float _139;
    float _141;
    float _143;
    float _145;
    if (!_115)
    {
        bool _121 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[0].y) >= 4;
        bool _123 = !_121;
        if (!_123)
        {
            bool _125 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[0].y) >= 5;
            bool _127 = !_125;
            if (!_127)
            {
                bool _129 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[0].y) != 5;
                _131 = _129;
                if (!_131)
                {
                    _133 = 0.0;
                    _135 = 1.0;
                    _137 = 0.0;
                    _139 = -1.0;
                    _141 = 0.0;
                    _143 = 0.0;
                    _145 = -1.0;
                    _147 = true;
                }
            }
            else
            {
                _133 = 0.0;
                _135 = 1.0;
                _137 = 0.0;
                _139 = 1.0;
                _141 = 0.0;
                _143 = 0.0;
                _145 = 1.0;
                _147 = true;
            }
        }
        else
        {
            _133 = 1.0;
            _135 = 0.0;
            _137 = -1.0;
            _139 = 1.0;
            _141 = 0.0;
            _143 = 0.0;
            _145 = 0.0;
            _147 = true;
        }
    }
    if ((!_147) || _131)
    {
        bool _149;
        if (!_131)
        {
            _149 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[0].y) >= 2;
        }
        if ((!_149) || _131)
        {
            if (!_131)
            {
                bool _151 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[0].y) != 1;
                float _153 = 0.0;
                if (!_151)
                {
                    _153 = 0.0;
                }
                float _155 = _153;
                float _157 = 0.0;
                _139 = _155;
                if (!_151)
                {
                    _157 = -1.0;
                }
                float _159 = _157;
                _141 = _159;
                if (!_151)
                {
                    _89 = 1.0;
                }
                float _161 = _89;
                float _163 = 0.0;
                _135 = _161;
                if (!_151)
                {
                    _163 = 0.0;
                }
                float _165 = _163;
                _137 = _165;
                if (!_151)
                {
                    _117 = 1.0;
                }
                float _167 = _117;
                _143 = _167;
                if (!_151)
                {
                    _91 = 0.0;
                }
                float _169 = _91;
                _133 = _169;
                if (!_151)
                {
                    _119 = 0.0;
                }
                float _171 = _119;
                bool _173 = !_151;
                _145 = _171;
                _147 = _173;
            }
            if ((!_147) || _131)
            {
                _131 = false;
                _133 = 0.0;
                _135 = 1.0;
                _137 = 0.0;
                _139 = 0.0;
                _141 = 1.0;
                _143 = -1.0;
                _145 = 0.0;
                _147 = true;
            }
        }
        else
        {
            _133 = -1.0;
            _135 = 0.0;
            _137 = 1.0;
            _139 = 1.0;
            _141 = 0.0;
            _143 = 0.0;
            _145 = 0.0;
        }
    }
    _147 = false;
    float _175 = _133;
    float _177 = _135;
    float _179 = _137;
    float _181 = _139;
    float _183 = _141;
    float _185 = _143;
    float _187 = _145;
    float _189 = float(as_type<int>((*spvDescriptorSet0.vp_c3)._m0[0].z));
    float _191 = rint(_189);
    float _193 = precise::max(_191, 0.0);
    uint _196 = uint(_193);
    uint _198 = clamp(_196, 0u, 65535u);
    float3 _478 = float3(0.5, 0.5, float(int(_198)));
    float3 _482 = select(_478, float3(0.0), isnan(_478));
    float _200 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, _482.xy, uint(rint(_482.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, _482.xy, uint(rint(_482.z)), level(0.0)).x;
    float _202 = _111 * _175;
    float _204 = fma(_111, _177, _179);
    float _206 = fma(_109, _181, _183);
    float _208 = fma(_109, _185, _202);
    float _210 = _204 * _204;
    float _212 = _208 + _187;
    float _214 = fma(_206, _206, _210);
    float _216 = fma(_212, _212, _214);
    float _218 = rsqrt(_216);
    float _220 = _206 * _218;
    float _222 = _204 * _218;
    float _224 = _212 * _218;
    out.m_30.x = _220;
    out.m_30.y = _222;
    out.m_30.z = _224;
    float _226 = precise::max(_200, 9.9999997473787516355514526367188e-06);
    out.m_32.x = _226;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint dm_vid [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_30 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_32 = float4(0.0, 0.0, 0.0, 1.0);
    bool _147 = false;
    bool _131 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _46 = in.m_27.x;
    float _48 = in.m_27.y;
    bool _52 = _46 > 0.0;
    bool _54 = _48 > 0.0;
    bool _56 = _46 >= 0.0;
    bool _58 = isnan(_46);
    bool _60 = _56 || _58;
    bool _62 = isnan(0.0);
    bool _64 = _60 || _62;
    bool _66 = _48 >= 0.0;
    bool _68 = isnan(_48);
    bool _70 = _66 || _68;
    bool _72 = isnan(0.0);
    bool _74 = _70 || _72;
    float _76 = _64 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _78 = _74 ? 0.0 : 1.4012984643248170709237295832899e-45;
    int _81 = ~as_type<int>(_76);
    int _83 = _81 + 1;
    int _85 = _83 + 1;
    int _87 = _85;
    float _89 = _78;
    float _91 = _76;
    if (!_52)
    {
        int _93 = -as_type<int>(_76);
        _87 = _93;
    }
    int _95 = _87;
    int _97 = ~as_type<int>(_78);
    int _99 = _97 + 1;
    int _101 = _99 + 1;
    int _103 = _101;
    if (!_54)
    {
        int _105 = -as_type<int>(_78);
        _103 = _105;
    }
    int _107 = _103;
    float _109 = float(_95);
    float _111 = float(_107);
    out.gl_Position.x = _109;
    out.gl_Position.y = _111;
    bool _113 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[0].y) >= 3;
    bool _115 = !_113;
    float _117 = as_type<float>(_107);
    float _119 = (*spvDescriptorSet0.vp_c3)._m0[0].y;
    float _133;
    float _135;
    float _137;
    float _139;
    float _141;
    float _143;
    float _145;
    if (!_115)
    {
        bool _121 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[0].y) >= 4;
        bool _123 = !_121;
        if (!_123)
        {
            bool _125 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[0].y) >= 5;
            bool _127 = !_125;
            if (!_127)
            {
                bool _129 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[0].y) != 5;
                _131 = _129;
                if (!_131)
                {
                    _133 = 0.0;
                    _135 = 1.0;
                    _137 = 0.0;
                    _139 = -1.0;
                    _141 = 0.0;
                    _143 = 0.0;
                    _145 = -1.0;
                    _147 = true;
                }
            }
            else
            {
                _133 = 0.0;
                _135 = 1.0;
                _137 = 0.0;
                _139 = 1.0;
                _141 = 0.0;
                _143 = 0.0;
                _145 = 1.0;
                _147 = true;
            }
        }
        else
        {
            _133 = 1.0;
            _135 = 0.0;
            _137 = -1.0;
            _139 = 1.0;
            _141 = 0.0;
            _143 = 0.0;
            _145 = 0.0;
            _147 = true;
        }
    }
    if ((!_147) || _131)
    {
        bool _149;
        if (!_131)
        {
            _149 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[0].y) >= 2;
        }
        if ((!_149) || _131)
        {
            if (!_131)
            {
                bool _151 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[0].y) != 1;
                float _153 = 0.0;
                if (!_151)
                {
                    _153 = 0.0;
                }
                float _155 = _153;
                float _157 = 0.0;
                _139 = _155;
                if (!_151)
                {
                    _157 = -1.0;
                }
                float _159 = _157;
                _141 = _159;
                if (!_151)
                {
                    _89 = 1.0;
                }
                float _161 = _89;
                float _163 = 0.0;
                _135 = _161;
                if (!_151)
                {
                    _163 = 0.0;
                }
                float _165 = _163;
                _137 = _165;
                if (!_151)
                {
                    _117 = 1.0;
                }
                float _167 = _117;
                _143 = _167;
                if (!_151)
                {
                    _91 = 0.0;
                }
                float _169 = _91;
                _133 = _169;
                if (!_151)
                {
                    _119 = 0.0;
                }
                float _171 = _119;
                bool _173 = !_151;
                _145 = _171;
                _147 = _173;
            }
            if ((!_147) || _131)
            {
                _131 = false;
                _133 = 0.0;
                _135 = 1.0;
                _137 = 0.0;
                _139 = 0.0;
                _141 = 1.0;
                _143 = -1.0;
                _145 = 0.0;
                _147 = true;
            }
        }
        else
        {
            _133 = -1.0;
            _135 = 0.0;
            _137 = 1.0;
            _139 = 1.0;
            _141 = 0.0;
            _143 = 0.0;
            _145 = 0.0;
        }
    }
    _147 = false;
    float _175 = _133;
    float _177 = _135;
    float _179 = _137;
    float _181 = _139;
    float _183 = _141;
    float _185 = _143;
    float _187 = _145;
    float _189 = float(as_type<int>((*spvDescriptorSet0.vp_c3)._m0[0].z));
    float _191 = rint(_189);
    float _193 = precise::max(_191, 0.0);
    uint _196 = uint(_193);
    uint _198 = clamp(_196, 0u, 65535u);
    float3 _478 = float3(0.5, 0.5, float(int(_198)));
    float3 _482 = select(_478, float3(0.0), isnan(_478));
    float _200 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, _482.xy, uint(rint(_482.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, _482.xy, uint(rint(_482.z)), level(0.0)).x;
    float _202 = _111 * _175;
    float _204 = fma(_111, _177, _179);
    float _206 = fma(_109, _181, _183);
    float _208 = fma(_109, _185, _202);
    float _210 = _204 * _204;
    float _212 = _208 + _187;
    float _214 = fma(_206, _206, _210);
    float _216 = fma(_212, _212, _214);
    float _218 = rsqrt(_216);
    float _220 = _206 * _218;
    float _222 = _204 * _218;
    float _224 = _212 * _218;
    out.m_30.x = _220;
    out.m_30.y = _222;
    out.m_30.z = _224;
    float _226 = precise::max(_200, 9.9999997473787516355514526367188e-06);
    out.m_32.x = _226;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_30.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_30.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_30.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_30.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_32.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_32.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_32.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_32.w)); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}


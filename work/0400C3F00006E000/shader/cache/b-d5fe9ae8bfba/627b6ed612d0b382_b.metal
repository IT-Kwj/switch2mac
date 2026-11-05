#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

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
};

struct main0_out
{
    float4 m_25 [[user(locn0)]];
    float4 m_29 [[user(locn2)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_22 [[attribute(0)]];
    float4 m_27 [[attribute(1)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_25 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    bool _143 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _43 = in.m_22.x;
    float _45 = in.m_22.y;
    float _47 = in.m_22.z;
    bool _51 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].y);
    float _53 = 255.0 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _55 = _45 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
    float _57 = _43 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
    float _59 = _55 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _61 = _55 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _63 = _55 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _65 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[5].x, _59);
    float _67 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[4].x, _61);
    float _69 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[6].x, _63);
    float _71 = fma(_47, (*spvDescriptorSet0.vp_c3)._m0[5].z, _65);
    float _73 = fma(_47, (*spvDescriptorSet0.vp_c3)._m0[4].z, _67);
    float _75 = fma(_47, (*spvDescriptorSet0.vp_c3)._m0[6].z, _69);
    float _77 = _71 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    float _79 = _73 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _81 = _75 + (*spvDescriptorSet0.vp_c3)._m0[6].w;
    float _83 = _77 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _85 = _77 * (*spvDescriptorSet0.vp_c3)._m0[0].y;
    float _87 = _77 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _89 = _77 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _91 = fma(_79, (*spvDescriptorSet0.vp_c3)._m0[1].x, _83);
    float _93 = fma(_79, (*spvDescriptorSet0.vp_c3)._m0[0].x, _85);
    float _95 = fma(_79, (*spvDescriptorSet0.vp_c3)._m0[2].x, _87);
    float _97 = fma(_79, (*spvDescriptorSet0.vp_c3)._m0[3].x, _89);
    float _99 = fma(_81, (*spvDescriptorSet0.vp_c3)._m0[1].z, _91);
    float _101 = fma(_81, (*spvDescriptorSet0.vp_c3)._m0[0].z, _93);
    float _103 = fma(_81, (*spvDescriptorSet0.vp_c3)._m0[2].z, _95);
    float _105 = fma(_81, (*spvDescriptorSet0.vp_c3)._m0[3].z, _97);
    float _107 = 255.0 * (*spvDescriptorSet0.vp_c3)._m0[13].x;
    float _109 = 255.0 * (*spvDescriptorSet0.vp_c3)._m0[13].z;
    float _111 = 255.0 * (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _113 = _101 + (*spvDescriptorSet0.vp_c3)._m0[0].w;
    float _115 = _99 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _117 = _103 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _119 = _105 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    out.m_25.x = _107;
    out.m_25.y = _53;
    out.m_25.z = _109;
    out.m_25.w = _111;
    out.gl_Position.x = _113;
    out.gl_Position.y = _115;
    out.gl_Position.z = _117;
    out.gl_Position.w = _119;
    bool _121 = !_51;
    float _139;
    float _141;
    if (!_121)
    {
        float _123 = _55 * (*spvDescriptorSet0.vp_c3)._m0[18].y;
        float _125 = _55 * (*spvDescriptorSet0.vp_c3)._m0[19].y;
        float _127 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[18].x, _123);
        float _129 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[19].x, _125);
        float _131 = fma(_47, (*spvDescriptorSet0.vp_c3)._m0[18].z, _127);
        float _133 = fma(_47, (*spvDescriptorSet0.vp_c3)._m0[19].z, _129);
        float _135 = _131 + (*spvDescriptorSet0.vp_c3)._m0[18].w;
        float _137 = _133 + (*spvDescriptorSet0.vp_c3)._m0[19].w;
        _139 = _137;
        _141 = _135;
        _143 = true;
    }
    else
    {
        int _146 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _148 = _146 != 0;
        float _150 = _57;
        float _152 = _55;
        if (!_148)
        {
            float _154 = in.m_27.x;
            float _156 = in.m_27.y;
            _150 = _154;
            _152 = _156;
        }
        float _158 = _150;
        float _160 = _152;
        bool _162 = !_148;
        _139 = _160;
        _141 = _158;
        if (!_162)
        {
            int _164 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
            bool _166 = _164 != 0;
            float _168 = _158;
            float _170 = _160;
            if (!_166)
            {
                float _172 = in.m_27.x;
                float _174 = in.m_27.y;
                _168 = _172;
                _170 = _174;
            }
            float _176 = _168;
            float _178 = _170;
            bool _180 = !_166;
            float _182 = _178;
            float _184 = _176;
            int _186 = as_type<int>(_176);
            float _188 = _178;
            if (!_180)
            {
                float _190 = in.m_27.x;
                float _192 = in.m_27.y;
                int _194 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _196 = _194 != 0;
                int _198 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _200 = _198 != 0;
                int _202 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _204 = _202 != 0;
                int _206 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _208 = _206 != 0;
                int _210 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _212 = _210 != 0;
                if (_196)
                {
                    _182 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _214 = _182;
                float _216 = _214;
                if (_196)
                {
                    _184 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _218 = _184;
                float _220 = _218;
                if (!_196)
                {
                    _216 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _222 = _216;
                if (!_196)
                {
                    _220 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _224 = _220;
                float _226 = _222 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _228 = _224 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                float _230 = _190;
                float _232 = _192;
                if (_208)
                {
                    float _234 = _226 * _190;
                    _230 = _234;
                }
                float _236 = _230;
                float _238 = -_226;
                float _240 = _238 + 1.0;
                int _242 = as_type<int>(_236);
                if (_212)
                {
                    float _244 = _228 * _192;
                    _232 = _244;
                }
                float _246 = _232;
                float _248 = -_228;
                float _250 = _248 + 1.0;
                float _252 = _246;
                if (_200)
                {
                    float _254 = _236 + _240;
                    _242 = as_type<int>(_254);
                }
                int _256 = _242;
                if (_204)
                {
                    float _258 = _246 + _250;
                    _252 = _258;
                }
                float _260 = _252;
                _186 = _256;
                _188 = _260;
            }
            int _262 = _186;
            float _264 = _188;
            int _266 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _268 = _266 != 0;
            int _270 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _272 = _270 != 0;
            int _274 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _276 = _274 != 0;
            int _278 = _262;
            int _280 = as_type<int>(_264);
            if (_272)
            {
                float _282 = -as_type<float>(_262);
                float _284 = _282 + 1.0;
                _278 = as_type<int>(_284);
            }
            int _286 = _278;
            if (_276)
            {
                float _288 = -_264;
                float _290 = _288 + 1.0;
                _280 = as_type<int>(_290);
            }
            int _292 = _280;
            bool _294 = !_268;
            float _296 = _294 ? as_type<float>(_286) : as_type<float>(_292);
            bool _298 = !_268;
            float _300 = _298 ? as_type<float>(_292) : as_type<float>(_286);
            _139 = _300;
            _141 = _296;
        }
    }
    _143 = false;
    float _302 = _139;
    float _304 = _141;
    float _306 = _302 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _308 = _302 * (*spvDescriptorSet0.vp_c3)._m0[9].y;
    float _310 = fma(_304, (*spvDescriptorSet0.vp_c3)._m0[10].x, _306);
    float _312 = fma(_304, (*spvDescriptorSet0.vp_c3)._m0[9].x, _308);
    float _314 = _310 + (*spvDescriptorSet0.vp_c3)._m0[10].w;
    float _316 = _312 + (*spvDescriptorSet0.vp_c3)._m0[9].w;
    float _318 = -_314;
    float _320 = _318 + 1.0;
    out.m_29.x = _316;
    out.m_29.y = _320;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_25 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    bool _143 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _43 = in.m_22.x;
    float _45 = in.m_22.y;
    float _47 = in.m_22.z;
    bool _51 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].y);
    float _53 = 255.0 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _55 = _45 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
    float _57 = _43 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
    float _59 = _55 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _61 = _55 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _63 = _55 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _65 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[5].x, _59);
    float _67 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[4].x, _61);
    float _69 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[6].x, _63);
    float _71 = fma(_47, (*spvDescriptorSet0.vp_c3)._m0[5].z, _65);
    float _73 = fma(_47, (*spvDescriptorSet0.vp_c3)._m0[4].z, _67);
    float _75 = fma(_47, (*spvDescriptorSet0.vp_c3)._m0[6].z, _69);
    float _77 = _71 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    float _79 = _73 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _81 = _75 + (*spvDescriptorSet0.vp_c3)._m0[6].w;
    float _83 = _77 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _85 = _77 * (*spvDescriptorSet0.vp_c3)._m0[0].y;
    float _87 = _77 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _89 = _77 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _91 = fma(_79, (*spvDescriptorSet0.vp_c3)._m0[1].x, _83);
    float _93 = fma(_79, (*spvDescriptorSet0.vp_c3)._m0[0].x, _85);
    float _95 = fma(_79, (*spvDescriptorSet0.vp_c3)._m0[2].x, _87);
    float _97 = fma(_79, (*spvDescriptorSet0.vp_c3)._m0[3].x, _89);
    float _99 = fma(_81, (*spvDescriptorSet0.vp_c3)._m0[1].z, _91);
    float _101 = fma(_81, (*spvDescriptorSet0.vp_c3)._m0[0].z, _93);
    float _103 = fma(_81, (*spvDescriptorSet0.vp_c3)._m0[2].z, _95);
    float _105 = fma(_81, (*spvDescriptorSet0.vp_c3)._m0[3].z, _97);
    float _107 = 255.0 * (*spvDescriptorSet0.vp_c3)._m0[13].x;
    float _109 = 255.0 * (*spvDescriptorSet0.vp_c3)._m0[13].z;
    float _111 = 255.0 * (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _113 = _101 + (*spvDescriptorSet0.vp_c3)._m0[0].w;
    float _115 = _99 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _117 = _103 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _119 = _105 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    out.m_25.x = _107;
    out.m_25.y = _53;
    out.m_25.z = _109;
    out.m_25.w = _111;
    out.gl_Position.x = _113;
    out.gl_Position.y = _115;
    out.gl_Position.z = _117;
    out.gl_Position.w = _119;
    bool _121 = !_51;
    float _139;
    float _141;
    if (!_121)
    {
        float _123 = _55 * (*spvDescriptorSet0.vp_c3)._m0[18].y;
        float _125 = _55 * (*spvDescriptorSet0.vp_c3)._m0[19].y;
        float _127 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[18].x, _123);
        float _129 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[19].x, _125);
        float _131 = fma(_47, (*spvDescriptorSet0.vp_c3)._m0[18].z, _127);
        float _133 = fma(_47, (*spvDescriptorSet0.vp_c3)._m0[19].z, _129);
        float _135 = _131 + (*spvDescriptorSet0.vp_c3)._m0[18].w;
        float _137 = _133 + (*spvDescriptorSet0.vp_c3)._m0[19].w;
        _139 = _137;
        _141 = _135;
        _143 = true;
    }
    else
    {
        int _146 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _148 = _146 != 0;
        float _150 = _57;
        float _152 = _55;
        if (!_148)
        {
            float _154 = in.m_27.x;
            float _156 = in.m_27.y;
            _150 = _154;
            _152 = _156;
        }
        float _158 = _150;
        float _160 = _152;
        bool _162 = !_148;
        _139 = _160;
        _141 = _158;
        if (!_162)
        {
            int _164 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
            bool _166 = _164 != 0;
            float _168 = _158;
            float _170 = _160;
            if (!_166)
            {
                float _172 = in.m_27.x;
                float _174 = in.m_27.y;
                _168 = _172;
                _170 = _174;
            }
            float _176 = _168;
            float _178 = _170;
            bool _180 = !_166;
            float _182 = _178;
            float _184 = _176;
            int _186 = as_type<int>(_176);
            float _188 = _178;
            if (!_180)
            {
                float _190 = in.m_27.x;
                float _192 = in.m_27.y;
                int _194 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _196 = _194 != 0;
                int _198 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _200 = _198 != 0;
                int _202 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _204 = _202 != 0;
                int _206 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _208 = _206 != 0;
                int _210 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _212 = _210 != 0;
                if (_196)
                {
                    _182 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _214 = _182;
                float _216 = _214;
                if (_196)
                {
                    _184 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _218 = _184;
                float _220 = _218;
                if (!_196)
                {
                    _216 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _222 = _216;
                if (!_196)
                {
                    _220 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _224 = _220;
                float _226 = _222 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _228 = _224 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                float _230 = _190;
                float _232 = _192;
                if (_208)
                {
                    float _234 = _226 * _190;
                    _230 = _234;
                }
                float _236 = _230;
                float _238 = -_226;
                float _240 = _238 + 1.0;
                int _242 = as_type<int>(_236);
                if (_212)
                {
                    float _244 = _228 * _192;
                    _232 = _244;
                }
                float _246 = _232;
                float _248 = -_228;
                float _250 = _248 + 1.0;
                float _252 = _246;
                if (_200)
                {
                    float _254 = _236 + _240;
                    _242 = as_type<int>(_254);
                }
                int _256 = _242;
                if (_204)
                {
                    float _258 = _246 + _250;
                    _252 = _258;
                }
                float _260 = _252;
                _186 = _256;
                _188 = _260;
            }
            int _262 = _186;
            float _264 = _188;
            int _266 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _268 = _266 != 0;
            int _270 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _272 = _270 != 0;
            int _274 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _276 = _274 != 0;
            int _278 = _262;
            int _280 = as_type<int>(_264);
            if (_272)
            {
                float _282 = -as_type<float>(_262);
                float _284 = _282 + 1.0;
                _278 = as_type<int>(_284);
            }
            int _286 = _278;
            if (_276)
            {
                float _288 = -_264;
                float _290 = _288 + 1.0;
                _280 = as_type<int>(_290);
            }
            int _292 = _280;
            bool _294 = !_268;
            float _296 = _294 ? as_type<float>(_286) : as_type<float>(_292);
            bool _298 = !_268;
            float _300 = _298 ? as_type<float>(_292) : as_type<float>(_286);
            _139 = _300;
            _141 = _296;
        }
    }
    _143 = false;
    float _302 = _139;
    float _304 = _141;
    float _306 = _302 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _308 = _302 * (*spvDescriptorSet0.vp_c3)._m0[9].y;
    float _310 = fma(_304, (*spvDescriptorSet0.vp_c3)._m0[10].x, _306);
    float _312 = fma(_304, (*spvDescriptorSet0.vp_c3)._m0[9].x, _308);
    float _314 = _310 + (*spvDescriptorSet0.vp_c3)._m0[10].w;
    float _316 = _312 + (*spvDescriptorSet0.vp_c3)._m0[9].w;
    float _318 = -_314;
    float _320 = _318 + 1.0;
    out.m_29.x = _316;
    out.m_29.y = _320;
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
    out.m_25 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    bool _143 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _43 = in.m_22.x;
    float _45 = in.m_22.y;
    float _47 = in.m_22.z;
    bool _51 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].y);
    float _53 = 255.0 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _55 = _45 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
    float _57 = _43 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
    float _59 = _55 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _61 = _55 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _63 = _55 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _65 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[5].x, _59);
    float _67 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[4].x, _61);
    float _69 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[6].x, _63);
    float _71 = fma(_47, (*spvDescriptorSet0.vp_c3)._m0[5].z, _65);
    float _73 = fma(_47, (*spvDescriptorSet0.vp_c3)._m0[4].z, _67);
    float _75 = fma(_47, (*spvDescriptorSet0.vp_c3)._m0[6].z, _69);
    float _77 = _71 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    float _79 = _73 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _81 = _75 + (*spvDescriptorSet0.vp_c3)._m0[6].w;
    float _83 = _77 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _85 = _77 * (*spvDescriptorSet0.vp_c3)._m0[0].y;
    float _87 = _77 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _89 = _77 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _91 = fma(_79, (*spvDescriptorSet0.vp_c3)._m0[1].x, _83);
    float _93 = fma(_79, (*spvDescriptorSet0.vp_c3)._m0[0].x, _85);
    float _95 = fma(_79, (*spvDescriptorSet0.vp_c3)._m0[2].x, _87);
    float _97 = fma(_79, (*spvDescriptorSet0.vp_c3)._m0[3].x, _89);
    float _99 = fma(_81, (*spvDescriptorSet0.vp_c3)._m0[1].z, _91);
    float _101 = fma(_81, (*spvDescriptorSet0.vp_c3)._m0[0].z, _93);
    float _103 = fma(_81, (*spvDescriptorSet0.vp_c3)._m0[2].z, _95);
    float _105 = fma(_81, (*spvDescriptorSet0.vp_c3)._m0[3].z, _97);
    float _107 = 255.0 * (*spvDescriptorSet0.vp_c3)._m0[13].x;
    float _109 = 255.0 * (*spvDescriptorSet0.vp_c3)._m0[13].z;
    float _111 = 255.0 * (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _113 = _101 + (*spvDescriptorSet0.vp_c3)._m0[0].w;
    float _115 = _99 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _117 = _103 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _119 = _105 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    out.m_25.x = _107;
    out.m_25.y = _53;
    out.m_25.z = _109;
    out.m_25.w = _111;
    out.gl_Position.x = _113;
    out.gl_Position.y = _115;
    out.gl_Position.z = _117;
    out.gl_Position.w = _119;
    bool _121 = !_51;
    float _139;
    float _141;
    if (!_121)
    {
        float _123 = _55 * (*spvDescriptorSet0.vp_c3)._m0[18].y;
        float _125 = _55 * (*spvDescriptorSet0.vp_c3)._m0[19].y;
        float _127 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[18].x, _123);
        float _129 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[19].x, _125);
        float _131 = fma(_47, (*spvDescriptorSet0.vp_c3)._m0[18].z, _127);
        float _133 = fma(_47, (*spvDescriptorSet0.vp_c3)._m0[19].z, _129);
        float _135 = _131 + (*spvDescriptorSet0.vp_c3)._m0[18].w;
        float _137 = _133 + (*spvDescriptorSet0.vp_c3)._m0[19].w;
        _139 = _137;
        _141 = _135;
        _143 = true;
    }
    else
    {
        int _146 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _148 = _146 != 0;
        float _150 = _57;
        float _152 = _55;
        if (!_148)
        {
            float _154 = in.m_27.x;
            float _156 = in.m_27.y;
            _150 = _154;
            _152 = _156;
        }
        float _158 = _150;
        float _160 = _152;
        bool _162 = !_148;
        _139 = _160;
        _141 = _158;
        if (!_162)
        {
            int _164 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
            bool _166 = _164 != 0;
            float _168 = _158;
            float _170 = _160;
            if (!_166)
            {
                float _172 = in.m_27.x;
                float _174 = in.m_27.y;
                _168 = _172;
                _170 = _174;
            }
            float _176 = _168;
            float _178 = _170;
            bool _180 = !_166;
            float _182 = _178;
            float _184 = _176;
            int _186 = as_type<int>(_176);
            float _188 = _178;
            if (!_180)
            {
                float _190 = in.m_27.x;
                float _192 = in.m_27.y;
                int _194 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _196 = _194 != 0;
                int _198 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _200 = _198 != 0;
                int _202 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _204 = _202 != 0;
                int _206 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _208 = _206 != 0;
                int _210 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _212 = _210 != 0;
                if (_196)
                {
                    _182 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _214 = _182;
                float _216 = _214;
                if (_196)
                {
                    _184 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _218 = _184;
                float _220 = _218;
                if (!_196)
                {
                    _216 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _222 = _216;
                if (!_196)
                {
                    _220 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _224 = _220;
                float _226 = _222 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _228 = _224 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                float _230 = _190;
                float _232 = _192;
                if (_208)
                {
                    float _234 = _226 * _190;
                    _230 = _234;
                }
                float _236 = _230;
                float _238 = -_226;
                float _240 = _238 + 1.0;
                int _242 = as_type<int>(_236);
                if (_212)
                {
                    float _244 = _228 * _192;
                    _232 = _244;
                }
                float _246 = _232;
                float _248 = -_228;
                float _250 = _248 + 1.0;
                float _252 = _246;
                if (_200)
                {
                    float _254 = _236 + _240;
                    _242 = as_type<int>(_254);
                }
                int _256 = _242;
                if (_204)
                {
                    float _258 = _246 + _250;
                    _252 = _258;
                }
                float _260 = _252;
                _186 = _256;
                _188 = _260;
            }
            int _262 = _186;
            float _264 = _188;
            int _266 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _268 = _266 != 0;
            int _270 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _272 = _270 != 0;
            int _274 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _276 = _274 != 0;
            int _278 = _262;
            int _280 = as_type<int>(_264);
            if (_272)
            {
                float _282 = -as_type<float>(_262);
                float _284 = _282 + 1.0;
                _278 = as_type<int>(_284);
            }
            int _286 = _278;
            if (_276)
            {
                float _288 = -_264;
                float _290 = _288 + 1.0;
                _280 = as_type<int>(_290);
            }
            int _292 = _280;
            bool _294 = !_268;
            float _296 = _294 ? as_type<float>(_286) : as_type<float>(_292);
            bool _298 = !_268;
            float _300 = _298 ? as_type<float>(_292) : as_type<float>(_286);
            _139 = _300;
            _141 = _296;
        }
    }
    _143 = false;
    float _302 = _139;
    float _304 = _141;
    float _306 = _302 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _308 = _302 * (*spvDescriptorSet0.vp_c3)._m0[9].y;
    float _310 = fma(_304, (*spvDescriptorSet0.vp_c3)._m0[10].x, _306);
    float _312 = fma(_304, (*spvDescriptorSet0.vp_c3)._m0[9].x, _308);
    float _314 = _310 + (*spvDescriptorSet0.vp_c3)._m0[10].w;
    float _316 = _312 + (*spvDescriptorSet0.vp_c3)._m0[9].w;
    float _318 = -_314;
    float _320 = _318 + 1.0;
    out.m_29.x = _316;
    out.m_29.y = _320;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_25.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_25.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_25.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_25.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

